> Dit is een machinevertaling van README.md bij v0.40.0 die nog door geen moedertaalspreker is beoordeeld; de Engelse README is de referentie. [English](README.md)

<!-- De afbeeldingen onder docs/assets/readme/ worden gegenereerd uit echte engine-runs door
     tools/gen_readme_assets.py (lichte en donkere varianten); genereer ze opnieuw met
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` en controleer met `--check`.
     De Kshana Studio-schermafbeeldingen onder docs/assets/readme/studio/ worden gemaakt van de
     draaiende Studio door tools/capture_studio_shots.mjs en vastgelegd in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: het beeldmerk, een kompasdradenkruis dat het precieze ogenblik markeert, naast het woordmerk kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>het precieze ogenblik</em></strong><br>
  Een opensource-simulator voor de weerbaarheid van PNT (positiebepaling, navigatie en tijdsynchronisatie).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Status van continue integratie op main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Regeldekking van bijna 95 % van src/, gemeten in docs/COVERAGE.md en in continue integratie bewaakt op 85 %"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 van 401 mogelijkheden VALIDATED tegen een onafhankelijke externe referentie, volgens de verificatiematrix"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Status van de SonarQube Cloud-kwaliteitspoort"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Release v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Engels en 17 andere talen, machinaal vertaald"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Licentie: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, het Zenodo-conceptrecord van elke release"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Een commerciële licentie is verkrijgbaar bij Ashforde® OÜ, zie Edities"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana op crates.io, de huidige gepubliceerde versie"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana op PyPI, de huidige gepubliceerde versie"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana op npm, de huidige gepubliceerde versie"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Kshana Studio openen</a> ·
  <a href="#install">Installeren</a> ·
  <a href="#capabilities">Mogelijkheden</a> ·
  <a href="#evidence">Bewijs</a> ·
  <a href="#research">Onderzoek</a> ·
  <a href="docs/CONCEPTS.md">Documentatie</a> ·
  <a href="#cite">Citeren</a>
</p>

<p align="center">
  <strong>Talen:</strong> <a href="README.md">English</a> ·
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
  <sub>De opdrachtregel, run-samenvattingen, grafieken en rapporten spreken elke taal met <code>--lang &lt;tag&gt;</code>
  (bijvoorbeeld <code>kshana scenarios/holdover-test-example.toml --lang de</code>), en dat geldt ook voor de Python-, WebAssembly- en MCP-oppervlakken.
  Dit zijn machinevertalingen die nog door geen moedertaalspreker zijn beoordeeld; Engels is de referentie.
  Zie <a href="docs/i18n.md">Lokalisatie</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Repeteer de minuut waarin GNSS uitvalt. De missieconsole van Kshana, getekend uit een echte run van engine v0.40.0: de gekoppelde campagne campaign-jam-spoof-holdover-integrity (seed 20260928, 6 fasen, 18 deelruns over T+01:16:10) en de 102 satellieten van GPS, Galileo, BeiDou en GLONASS uit constellation-multi-gnss-coverage, elk getekend op de cirkelvormige tweelichamenbaan die is afgeleid uit het grondspoor van de engine, met voor de weergave samengedrukte stralen. De tijdfout van de klok piekt op 62.7 ns tegen een marge van 50 ns, de draaggolf-ruisdichtheid daalt tot -12.2 dB-Hz tegen een ondergrens van 25 dB-Hz, en het verticale beschermingsniveau bereikt 135.4 m tegen een alarmgrens van 50 m." width="100%">
</picture>

<details>
<summary><strong>Inhoud</strong></summary>

- [Repeteer de minuut waarin GNSS uitvalt](#rehearse-the-minute-gnss-goes-dark)
- [Nieuw in 0.40](#whats-new-in-040), [Nieuw in 0.39](#whats-new-in-039), [Nieuw in 0.38](#whats-new-in-038) en [0.38 in detail](#038-in-depth): Jammertest-scoring, de eigen vlaggen van de ontvanger, machine-invoer, tijdsynchronisatie en holdover, normpakketten, LunaNet AFS, de laboratoriumrondgang, kshana-bench, het observatorium, exporteurs, optisch, [navigatie van ruimtegebruikers](#space-user-navigation-gnss-ssv) en [maaninfrastructuur](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) en elke Studio-pagina
- [Mogelijkheden](#capabilities): de tabel met gebieden, [elk scenariotype per familie](#every-scenario-kind-by-family), [elke opdracht](#every-command), [elk oppervlak](#every-surface)
- [Hoe een run werkt](#how-a-run-works), [Missies](#missions)
- [Bewijs](#evidence): het register, [mogelijkhedendomeinen](#capability-domains)
- [Installeren](#install), [Architectuur](#architecture) (en de [diagrammen](#diagrams)), [AI-assistent](#ai-assistant)
- [Edities](#editions), [Onderzoek](#research), [Citeren](#cite), [Licentie](#licence)
- [Naslag](#reference): gebruik, scenarioformaat, uitvoer, indeling van de repository, veelgestelde vragen, probleemoplossing, versiebeheer, roadmap, bijdragen, documentatie

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Repeteer de minuut waarin GNSS uitvalt

Kshana speelt jamming, spoofing en klok-holdover na wanneer GNSS-signalen (Global Navigation Satellite
System) wegvallen, en vertelt u hoe lang een systeem tijd en positie binnen zijn
budget houdt, en welke klok of sensor de meeste marge oplevert. Het is één Rust-engine. Het draait in een
terminal, een notebook, een IDE (geïntegreerde ontwikkelomgeving), een AI-assistent (kunstmatige
intelligentie) of in uw browser.

Elke run is bit voor bit reproduceerbaar uit het scenario, de seed en de engineversie.
Elke mogelijkheid draagt een van drie labels in een machinaal gecontroleerd register: **VALIDATED** (een
onafhankelijke externe referentie is het ermee eens), **MODELLED** (intern consistent, en dat wordt hardop gezegd)
of **PARTNER** (een hardwarepartner is er eigenaar van).

> **Status: v0.40.0.** Een gevalideerd, reproduceerbaar simulatiesubstraat voor PNT-weerbaarheid.
> Tijdsynchronisatie en holdover komen eerst, omdat dat domein het best gevalideerd is. Kshana is een
> instrument voor studie en afwegingen: geen radiofrequente (RF) signaalgenerator-hardware (het
> stuurt geen radio aan en zendt niets uit; de uitvoer op signaalniveau bestaat uit basisband-IQ-samplebestanden
> voor softwareontvangers), geen hardware- of gecertificeerde GNSS-ontvanger (de softwareontvanger
> is een analyse-instrument) en geen vluchtproduct. Nieuw in het vakgebied? Begin met de
> [inleiding in gewone taal](docs/CONCEPTS.md) en de [verklarende woordenlijst](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Nieuw in 0.40

0.40 voegt een foutbudget op missieniveau toe, labelt elke figuur en tabel met zijn bewijsniveau, leest gemeten klokregistraties in,
controleert inzendingen van datapartners, schat waar een interferentiebron kan zijn, en spreekt naast Engels zeventien talen.
Het register telt nu 401 rijen: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Geen enkele rij is gepromoveerd naar VALIDATED, en elke tekortkoming hieronder is
vastgelegd door een test.

- **Missiedraad.** Het type `mission-thread` koppelt fasen van lancering tot terugkeer (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` en vier maantypen) met vermelde overdrachtsregels, een marge ten opzichte van vermelde eisen en de zwakste
  schakel; een end-to-endvoorbeeld van Artemis-klasse over 11 fasen (aard- en maansegmenten), 92 scenariotypen in totaal. Elk getal is MODELLED. De cislunaire propagatie tegen het openbare Artemis I-traject
  **haalt** de vooraf vastgelegde drempel **niet** (45.3 km en 0.25 m/s tegen 5 km en 0.05 m/s; de oorzaak zijn kleine manoeuvres die het model niet bevat), en de maanpropagator tegen de CAPSTONE-baan
  **haalt die niet** (136.8 km tegen 25 km aan het eind van één omloop); de LRO-vergelijking wordt gehaald. De rijen blijven MODELLED
  ([Missiedraad](docs/MISSION-THREAD.md), [maansegment](docs/MISSION-THREAD-LUNAR.md)). In de Studio wordt de draad gelezen op `/studio/mission-thread/`.
- **Bewijslabels.** Elke figuur en tabel die een run schrijft, draagt het niveau en de registerrij-id's waarop ze berust, gelezen uit de matrix.
- **Gemeten klokken.** Acht klokregistratieformaten worden ingelezen ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)) en een gefitte
  reeks kan de holdover aansturen. Tegen vooraf vastgelegde drempels **haalt** de fit F1(a) **niet** bij vijf van zes registraties en F2 niet bij één; beide
  blijven MODELLED ([Wijzigingslogboek](CHANGELOG.md#0400---2026-10-29)).
- **Datapartners.** `kshana partner check` controleert het formaat van een inzending en scoort niets ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Bronregio.** `kshana interference-map locate` geeft een regio en een ellips, nooit een los punt, op basis van ADS-B- of AIS-
  meldingen. Eenmaal vergeleken met de zenderlocaties van Jammertest 2025 is het resultaat **NOT ASSESSABLE** voor beide bronnen (te weinig
  geplande sessies in de open data), dus de rij blijft MODELLED ([Interferentiekaart](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Benchmark.** De herhaalde campagne van 0.40 haalt A3, D3 (beide EXPLORATORY), R3 en R4; A2, D1 en R1 blijven NOT MET ([Bench](docs/BENCH.md)).
- **Talen.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja en zh-Hans, als **machinevertalingen die nog door geen
  moedertaalspreker zijn beoordeeld**; Engels is de referentie, en niet-Engelse runs duren ongeveer twee keer zo lang
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Nieuw in 0.39

0.39 voegt geen functie toe en verandert geen resultaat; de uitvoer van de engine is de uitvoer van 0.38. Het herstelt één ding
op de opdrachtregel, werkt afhankelijkheden van de kruisvalidatie-tooling bij en vermeldt de benchmark-
oordelen volledig.

- **Opdrachtregel.** `kshana kinds | head` (elke gesloten standaarduitvoer) geeft geen panic meer: het programma stopt
  stil met status 141, zoals andere tools doen bij een gesloten pipe. Andere schrijffouten worden nog steeds gemeld.
- **Afhankelijkheden.** `memmap2` 0.9.11 in de twee ANISE-kruiscontrole-locks en `pillow` 13.0.0 en
  `certifi` 2026.10.19 in de vastgepinde versies van de referentieomgeving, allemaal onder `xval/`: niets wat wordt meegeleverd is veranderd.
- **kshana-bench, alle oordelen.** Tegen de vooraf vastgelegde drempels zijn er drie NOT MET, elk vastgelegd door een test:
  A2 (`agc_k_sigma` AUC 0.766 tegen ten minste 0.80), D1 (grootste kloof 0.0301) en taak (b) R1 (overgenomen,
  niet opnieuw gedraaid). Geen drempel is versoepeld ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Nieuw in 0.38

0.38 maakt de neutrale scheidsrechter meetbaar: het scoort ontvangerregistraties tegen een gepubliceerd test-
schema, leest meer ontvangers en sensoren in, test tijdsynchronisatiesystemen en levert een benchmark en een
interferentie-observatorium. Het blijft adviserend: niets hiervan is gecertificeerd, geen resultaat is een typegoedkeuring,
en niets zendt uit. Elke rij vermeldt wat het register ervoor bevat ([hoe een label wordt verdiend](#evidence));
een status noemt alleen wat is gecontroleerd, en de registerrij en de gekoppelde pagina zeggen wat niet is gecontroleerd.

| Nieuw in 0.38 | Wat het doet, en waarom | Registerstatus | Lezen |
|---|---|---|---|
| **Jammertest-scoring** | `kshana jammertest import` leest de gepubliceerde NPRA-testcatalogus en het uitzendplan in als geplande referentie; `jammertest score` scoort een ontvangerregistratie per test (detectielatentie, gemiste alarmen, valse alarmen, hersteltijd), als ondertekend bewijspakket als u een sleutel opgeeft | **MODELLED**: één registerrij. De drempels zijn vooraf vastgelegd vóór enige gescoorde run; op de JammerTest 2024-data faalde de minimale-dataregel in beide runs (4 en 7 scoorbare vensters tegen 10 vereist), dus **geen drempel is beoordeelbaar** en er wordt niets beweerd | [Jammertest](docs/JAMMERTEST.md) |
| **De eigen vlaggen van de ontvanger** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG en NovAtel RXSTATUS worden ingelezen in een `self_report` per epoche en vergeleken met de alarmen van Kshana (beide, alleen ontvanger, alleen Kshana, geen van beide); een Septentrio SBF-lezer en alleen-lezen `--serial`-invoer | **MODELLED**; overeenstemming tussen de detector van een ontvanger en die van Kshana is geen validatie | [Ontvangervertrouwen](docs/RECEIVER-TRUST.md) |
| **Meer ontvangers en sensoren** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (uit de BSD-gelicentieerde pyrtcm-tabellen, niet uit de RTCM-tekst), GNSS-SDR-monitorstromen, een IMU-registratie als tweede sensor, een ROS 2-pakket, een `gnss_lib_py`-brug, en `imu-fit` voor parameters van hybride sensoren | **MODELLED**: zes registerrijen; alleen zelfgeschreven fixtures, er is geen opname van een echte ontvanger, IMU, GNSS-SDR-run of ROS-graaf ingelezen | [Machine-invoer](docs/MACHINE-INPUTS.md) |
| **Tests van tijdsynchronisatie en holdover** | het type `holdover-test` scoort een holdovertest (GNSS verwijderd door de operator, holdover, herstel) uit een gemeten tijdfoutregistratie tegen ITU-T-maskers, "gemeten tegen het masker"; lezers voor linuxptp- en chrony-logs; de hardwarestadia en het veld `lab-attestation` | **MODELLED**: twee registerrijen; de tijden zijn de verklaring van de operator, niet geverifieerd | [Timing HIL](docs/TIMING-HIL.md), [Hardwareveiligheid](docs/HARDWARE-SAFETY.md) |
| **Normpakketten, LunaNet AFS, laboratoriumrondgang** | gescoorde pakketten voor DHS RPCF, IMO MSC.1/Circ.1575 en ICAO Doc 9849 Appendix F tegen drempels die vóór de run zijn vermeld, "levert bewijs voor"; een NIST IR 8323r1-kruistabel; een LunaNet AFS-codegenerator en -controle; een ondertekend pakket dat het scenario, de testomstandigheden, de ontvangerregistratie en de score van een laboratoriumrun koppelt | **MODELLED** voor de pakketten en de rondgang; de AFS-codecontrole is **VALIDATED** tegen de gedrukte controlekolommen (zie de registerrijen) | [Normen](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench en het observatorium** | vaste taken, splitsingen en metrieken voor interferentiedetectie, IQ-detectie, holdovervoorspelling en de optimismekloof, met een verzegelde achtergehouden set en een statisch klassement; een reproduceerbaar dagelijks interferentieproduct met 24 h vertraging, grove cellen en geen toeschrijving | geen eigen registerrij: het scoort inzendingen, en de basislijnen zijn in de resultaatbestanden gelabeld als MODELLED; tegen de vooraf vastgelegde drempels worden de scorer, C1 tot C3 en D2 gehaald en drie drempels zijn **NOT MET** (vastgelegd door tests): A2 (`agc_k_sigma` AUC 0.766 tegen ten minste 0.80 op de testsplitsing), D1 (grootste kloof 0.0301) en taak (b) R1 (overgenomen, niet opnieuw gedraaid); zie `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatorium](docs/observatory/METHOD.md) |
| **Exporteurs** | vertrouwenstelemetrie als Home Assistant MQTT-discovery- en statusberichten (alleen publiceren, geen inloggegevens) naast Prometheus, CEF, LEEF en OTLP | **MODELLED**: één registerrij | [Vertrouwenstelemetrie](docs/TRUST-TELEMETRY.md) |
| **Optische linkmarge in de tijd** | het type `optical-atmosphere` kan één geseede realisatie van het weer op een locatie schrijven als linkmargereeks | **MODELLED**: één registerrij; één trekking uit het model, niet het klimaat | [Optische atmosfeer](docs/OPTICAL-ATMOSPHERE.md) |

Hoogtepunten van 0.37: [wijzigingslogboek](CHANGELOG.md#0370---2026-10-17). De volledige lijst van 0.38 staat in het
[wijzigingslogboek](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 in detail

Elke mogelijkheid uit de tabel hierboven, in een paar regels: wat ze doet, één opdracht om haar te draaien, één
afbeelding getekend uit een echte run van de engine, en wat het register ervoor bevat. De afbeeldingen
worden geschreven door [`tools/gen_figures_038.py`](tools/gen_figures_038.py) naar
[`docs/figures/0.38/`](docs/figures/0.38/) (nooit met de hand getekend): `python3 tools/gen_figures_038.py`
schrijft ze opnieuw vanuit een gebouwde engine, en `--check` faalt als er een verouderd is of als het bijschrift hier afwijkt.
Waar een invoer een registratie is, is het een verzonnen registratie die het script schrijft, omdat de echte registraties van derden
nooit worden meegeleverd, en het bijschrift zegt dat. Alles hieronder is adviserend: niet gecertificeerd, geen
typegoedkeuring, en niets zendt uit. Een status noemt wat is gecontroleerd en niets meer;
[hoe een label wordt verdiend](#evidence).

### Jammertest-scoring

`kshana jammertest import` zet de gepubliceerde NPRA-testcatalogus en het uitzendplan om in
een geplande referentie, en `kshana jammertest score` scoort een ontvangerregistratie daartegen: voor elke
geplande test of die is gedetecteerd, hoe laat, en hoe lang de ontvanger nodig had om te herstellen, plus
valse alarmen buiten elk tijdslot. De catalogus wordt opgehaald, nooit meegeleverd.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Scoring van één synthetische ontvangerregistratie tegen een schema van drie tests, uit een echte run van engine v0.40.0 (`kshana jammertest score`). De registratie is verzonnen: 1800 s NMEA met een C/N0-daling van 20 dB over twee intervallen. Het schema bevat drie tijdsloten; het middelste tijdslot heeft geen jammer in de registratie. De score markeert 2 van 3 tests als gedetecteerd (mediane latentie 0 s) en 1 als gemist, met 0 reeksen valse alarmen over 0.25 h schone tijd. Niets hiervan zegt iets over een echte ontvanger. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC 61108, IEC 61162): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig.">
</picture>

**Registerstatus: MODELLED.** De drempels zijn vastgelegd vóór enige gescoorde run; op de JammerTest 2024-data
faalde de minimale-dataregel in beide runs, dus geen drempel is beoordeelbaar en er wordt niets beweerd.
[Jammertest](docs/JAMMERTEST.md).

### De eigen vlaggen van de ontvanger

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG en NovAtel RXSTATUS worden ingelezen in een `self_report`
per epoche en naast de alarmen van Kshana gezet: beide, alleen ontvanger, alleen Kshana, of geen van beide. Een
Septentrio SBF-lezer en een alleen-lezen `--serial`-invoer voeden dezelfde vergelijking. Geen van beide kanten is
de referentie.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="De eigen spoofingvlag van de ontvanger naast de alarmen van Kshana, uit een echte run van engine v0.40.0 op een verzonnen UBX-registratie (200 epochen bij 1 Hz). C/N0 daalt 20 dB van 80 tot 90 s en van 120 tot 130 s; de ontvanger vlagt 120 tot 130 s en 160 tot 165 s. Van 140 epochen die na kalibratie zijn vergeleken, vlagden bij 11 beide, bij 6 alleen de ontvanger, bij 11 alleen Kshana en bij 112 geen van beide. Geen van beide kanten is de referentie en overeenstemming is geen validatie. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

**Registerstatus: MODELLED.** Overeenstemming tussen de detector van een ontvanger en die van Kshana is geen
validatie. [Ontvangervertrouwen](docs/RECEIVER-TRUST.md).

### Meer ontvangers en sensoren

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, GNSS-SDR-monitorstromen, een IMU-registratie als tweede
sensor, een ROS 2-pakket en een `gnss_lib_py`-brug eindigen allemaal in dezelfde receiver-trust-tijdlijn.
`imu-fit` leest de sensorparameters die de hybride en fusiescenario's nodig hebben uit een stilstaande IMU-
registratie, zodat een scenario kan draaien met de sensor die u werkelijk hebt.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Wat `kshana imu-fit` uit een stilstaande IMU-registratie leest, uit een echte run van engine v0.40.0 op een verzonnen registratie (20,000 samples bij 100 Hz, 200 s): de random walk van de snelheid van de versnellingsmeter q_va = 4.02e-06, de random walk van de hoek van de gyroscoop q_arw = 9e-08, de biasinstabiliteit 0.00296 en de vroege Allan-hellingen (-0.51 en -0.49; ongeveer -0.5 waar witte ruis overheerst). De tabel ernaast is de TOML die de opdracht afdrukt. De schatter is alleen gecontroleerd op synthetische registraties. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

**Registerstatus: MODELLED.** Alleen zelfgeschreven fixtures; er is geen opname van een echte ontvanger, IMU,
GNSS-SDR-run of ROS-graaf ingelezen. [Machine-invoer](docs/MACHINE-INPUTS.md).

### Tests van tijdsynchronisatie en holdover

Het type `holdover-test` scoort een holdovertest (GNSS verwijderd door de operator, holdover, herstel)
uit een gemeten tijdfoutregistratie tegen ITU-T-maskers, en zegt dat ook met die woorden: gemeten
tegen het masker. Lezers voor linuxptp- en chrony-logs voeden het; de hardwarestadia en het veld
`lab-attestation` zeggen wie wat heeft verklaard.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Een holdovertest gescoord uit een tijdfoutregistratie, uit een echte run van engine v0.40.0 op scenarios/holdover-test-example.toml (601 samples, elke 5 s). GNSS wordt door de operator verwijderd op 600 s en hersteld op 2400 s; de tijdfout loopt op tot 299 ns aan het eind van de holdover, overschrijdt het budget van 100 ns na 675 s, en keert 70 s na het herstel terug binnen de band van 100 ns. Oordelen: basislijnmaskers PASS, holdovermaskers FAIL, holdoverenveloppe FAIL, herstel RECOVERED. Gemeten tegen het masker, geen goedkeuring. De tijden zijn de verklaring van de operator, niet geverifieerd door Kshana. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

**Registerstatus: MODELLED.** De tijden waarop GNSS werd verwijderd en hersteld zijn de verklaring van de operator,
niet geverifieerd. [Timing HIL](docs/TIMING-HIL.md), [Hardwareveiligheid](docs/HARDWARE-SAFETY.md).

### Normpakketten

Gescoorde pakketten voor de DHS Resilient PNT-testprofielen, IMO MSC.1/Circ.1575 en ICAO Doc 9849
Appendix F, plus een NIST IR 8323r1-kruistabel in `compliance-report`. Elke test draait een meegeleverd
scenario en vergelijkt een resultaatveld met een drempel die vóór de run is vermeld; een test die een ontvanger-
registratie nodig heeft, wordt vermeld als test die invoer nodig heeft, niet gescoord. De formulering is "levert bewijs voor".

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Elke test van de drie gescoorde normpakketten, uit echte runs van engine v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 gehaald, 1 niet gehaald, 2 hebben invoer nodig; imo-circ-1575: 1 gehaald, 4 niet gehaald, 2 hebben invoer nodig; icao-doc9849-appf: 6 gehaald, 0 niet gehaald, 2 hebben invoer nodig. In totaal 13 gehaald, 5 niet gehaald en 6 die invoer nodig hebben die de engine niet heeft (een ontvangerregistratie of apparatuurdocumentatie). Elke drempel is vóór de run vermeld; een misser blijft een misser. Een gehaalde drempel zegt dat een gemodelleerd scenario een vermelde drempel heeft gehaald, niets over een product. De pakketten leveren bewijs voor de rijen die ze aanhalen; ze zijn geen beoordeling. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst; het mag niet de enige basis zijn voor een navigatie- of veiligheidsbeslissing.">
</picture>

**Registerstatus: MODELLED.** Een gehaalde drempel zegt dat een gemodelleerd scenario een vermelde drempel heeft gehaald, niets over een
product; elke misser blijft behouden en is vastgelegd door een test. [Normen](docs/STANDARDS.md).

### LunaNet AFS

De codegenerator voor het LunaNet Augmented Forward Signal (Gold-, Weil- en tertiaire codes, het bericht-
frame en de foutcodering ervan) en een controle voor een opgenomen of gegenereerde symboolstroom, vastgezet op één
editie van de specificatie.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="De LunaNet AFS-codegenerator gecontroleerd tegen de gedrukte kolommen van de specificatie, uit een echte run van engine v0.40.0 (`kshana lunanet-afs-check spec`, vastgezet op LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 januari 2025; het document markeert zijn codetabellen met {LSIS-TBC}). 9 van 10 controles worden gehaald; B4 is NOT MET (420 van 421 overeenkomend). Het controleert een symboolstroom tegen één editie van een gepubliceerde specificatie en zegt niets over enig LunaNet-knooppunt of enige LunaNet-dienst. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Het controleert een symboolstroom tegen één editie van een gepubliceerde specificatie en zegt niets over enig LunaNet-knooppunt of enige LunaNet-dienst.">
</picture>

**Registerstatus: VALIDATED** voor de code- en synchronisatiecontroles, tegen de waarden die de
specificatie afdrukt (die zij als TBC markeert); één controle is NOT MET, behouden en vastgelegd (één gedrukte
kolom van de tertiaire code wijkt af: het document drukt dezelfde waarde af voor twee PRN's). De LDPC- en CRC-woorden
van subframes 2 tot 4 worden niet gecontroleerd. De registerrijen zeggen precies welke. [LunaNet AFS](docs/LUNANET-AFS.md).

### Laboratoriumrondgang

`kshana.test-conditions/1` is een gepubliceerde beschrijving van wat een laboratorium heeft gedaan (gebeurtenissen, tijden,
vermogens). `kshana evidence round-trip` koppelt de scenariohash, de hash van de omstandigheden, de hash van de ontvanger-
registratie en de score in één ondertekend pakket, en weigert een pakket waarvan de omstandigheden en het scoringsscenario
het oneens zijn over de gebeurtenissen. Kshana produceert of herhaalt nooit een signaal: hoe een scenario een
ontvanger heeft bereikt, is de verantwoordelijkheid van de operator.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="De structuur van een bewijspakket. Een ontvangerregistratie (NMEA, u-blox UBX, RINEX 3 of een Android-log) en een tijdvenster gaan naar kshana receiver-trust evidence, dat zeven bestanden schrijft: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig en een optioneel timestamp.tsr. Het manifest legt de SHA-256 vast van de hele registratie en van elk bestand, en een hashketen over de bestanden; de handtekening dekt het manifest. kshana evidence verify controleert de handtekening, de hash van elk bestand, de keten en dat er geen niet-vermeld bestand aanwezig is, en eindigt met 0 bij verificatie, 1 als iets is mislukt en 3 als de ondertekenaar niet was vastgezet. Een pakket is een technisch register, geen juridisch advies.">
</picture>

De afbeelding is de indeling van een pakket. **Registerstatus: MODELLED.**
[Testomstandigheden](docs/spec/TEST-CONDITIONS.md), [Testbank](docs/TEST-BENCH.md).

### kshana-bench

Vaste taken, splitsingen en metrieken voor interferentiedetectie, IQ-detectie, holdovervoorspelling en
de optimismekloof, met een verzegelde achtergehouden set en een statisch klassement. Het scoort inzendingen; het is geen
rangschikking van ontvangers.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="De ingebouwde basislijnen van kshana-bench-taak D (de optimismekloof) op de testsplitsing, uit een echte run van engine v0.40.0 (`kshana bench baseline`). Elk paar staven is het oppervlak onder de ROC-curve voor de gevallen binnen de verdeling en voor de verschoven gevallen; de kloof daartussen is de optimismekloof, tegen een tolerantie van 0.05. fused-max-z: 0.998 en 0.983 (kloof 0.015); sqm-imbalance: 0.882 en 0.882 (kloof 0.001); agc-excess: 0.848 en 0.819 (kloof 0.030); raim-parity: 0.682 en 0.672 (kloof 0.010); energy-cn0-drop: 0.595 en 0.565 (kloof 0.030). De labels zijn labels van een generatief model van een synthetisch corpus, nooit velddata: MODELLED. Adviserend: gemodelleerd of gemeten tegen vermelde referenties, geen goedkeuring, certificering of verklaring van conformiteit. Een score beschrijft een registratie of corpus, nooit een product.">
</picture>

**Registerstatus:** geen eigen registerrij; de basislijnen zijn in de resultaatbestanden gelabeld als MODELLED.
Tegen de vooraf vastgelegde drempels worden de scorer, C1 tot C3 en D2 gehaald en drie drempels zijn NOT MET, elk
vastgelegd door een test: A2 (`agc_k_sigma` AUC 0.766 tegen ten minste 0.80 op de testsplitsing), D1 (grootste kloof
0.0301) en taak (b) R1 (overgenomen uit de eerdere campagne, niet opnieuw gedraaid). De cijfers staan in
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Interferentie-observatorium

Eén product per UTC-dag en regio uit een open archief van vliegtuigposities, op een vast grof raster:
elke cel is gedegradeerd, niet gedegradeerd of niet waargenomen (wat niet "vrij" is). Vrijgegeven niet eerder
dan 24 h na het einde van de dag, met onderdrukte kleine cellen en zonder toeschrijving van een oorzaak.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Twee synthetische interferentiekaartdagen getekend uit de vastgelegde voorbeelden in examples/interference-map/output, elk met een eigen synthetische route en de aandelen van routeblootstelling die de engine rapporteert. Links een ADS-B-dag: 1 gedegradeerde cel, 6 niet gedegradeerd, 4 niet beoordeeld (gearceerd) en cellen zonder vermelding, leeg getekend, die niet zijn waargenomen. De route is 525 km: 11.5% van de lengte in gedegradeerde cellen, 38.3% niet gedegradeerd, 9.1% niet beoordeeld en 41.1% niet waargenomen. Rechts een AIS-dag: cellen gemarkeerd door de cirkel- en op-landdetectoren, niet-afwijkende cellen en lege cellen; de route is 454 km met 10.5% in afwijkende cellen, 21.2% niet afwijkend, 0.0% niet beoordeeld en 68.3% niet waargenomen. ADS-B en AIS zijn afzonderlijke lagen, nooit gecombineerd. Een gemarkeerde cel is geen vaststelling van interferentie, en een cel zonder kleur is niet waargenomen, wat niet hetzelfde is als vrij. Alle data zijn verzonnen, op de open Midden-Atlantische Oceaan, en geen meting.">
</picture>

De afbeelding toont de vastgelegde voorbeelddagen, geen product van het observatorium. **Registerstatus: MODELLED**:
geen externe onafhankelijke referentie, geen referentiewaarheid en geen toeschrijving van een oorzaak; een cel die niet is waargenomen, is niet
beoordeeld, wat niet hetzelfde is als vrij. [Methode van het observatorium](docs/observatory/METHOD.md).

### Exporteurs

Vertrouwenstelemetrie als Prometheus-tekst, CEF, LEEF, OTLP en Home Assistant MQTT-discovery- en status-
berichten. De opdracht publiceert alleen naar een bestemming die u opgeeft en bewaart geen inloggegevens.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Eén vertrouwensresultaat in drie exportformaten, uit echte runs van engine v0.40.0 (`kshana trust-telemetry`) op examples/maritime-trust: Prometheus-tekstexpositie (de laatste vertrouwensscore is 5.9 en de onbetrouwbare band is de ingestelde), en de laatste CEF- en LEEF-berichten. De opdracht publiceert niets zonder opgegeven bestemming, bewaart geen inloggegevens en zendt geen radiosignaal uit. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC 61108, IEC 61162): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig.">
</picture>

**Registerstatus: MODELLED.** [Vertrouwenstelemetrie](docs/TRUST-TELEMETRY.md).

### Optische linkmarge in de tijd

Het type `optical-atmosphere` kan één geseede realisatie van het weer op een locatie schrijven als linkmarge-
reeks: wolkenepisodes, een kolom vloeibaar water voor elk ervan, één scintillatiesample per stap. De
pagina Optische PNT van de Studio opent de optical-atmosphere-scenario's.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Eén geseede realisatie van de linkmarge van de locatie 'northern' over 336 h, uit een echte run van engine v0.40.0 op scenarios/optical-atmosphere-network.toml (seed 37, een stap van 600 s). De marge zakt onder nul tijdens wolkenepisodes; in deze trekking is de link 40.5 % van de tijd beschikbaar, met 27 uitvallen en een langste uitval van 30.7 h. De invoer is illustratief, de reeks is één trekking uit het model en niet het klimaat, en ze wijkt af van de statistische beschikbaarheid (37.8 %) met de steekproeffout van de trekking. Alleen adviserende analyse: geen gecertificeerd beschikbaarheids-, integriteits- of navigatieproduct, en geen voorspelling voor een echte locatie tenzij de klimaatinvoer uit een vermelde dataset komt.">
</picture>

**Registerstatus: MODELLED.** Eén trekking uit het model, niet het klimaat. [Optische atmosfeer](docs/OPTICAL-ATMOSPHERE.md).

### Nieuwe Studio-weergaven

[kshana.dev/studio](https://kshana.dev/studio/) krijgt een brugherhaling (twee runs naast elkaar op één
missieklok, op [`/studio/replay/`](https://kshana.dev/studio/replay/)), een pagina Optische PNT
(`/studio/optical/`), een pagina Holdovertest (`/studio/holdover/`) en een observatoriumviewer
(`/studio/observatory/`). Ze draaien dezelfde engine in de browser, er wordt niets geüpload, en ze dragen
dezelfde adviserende verklaring. De afbeeldingen hierboven zijn door een script getekend uit de eigen uitvoer van de engine;
het zijn geen schermafbeeldingen van deze pagina's.

<a id="space-user-navigation-gnss-ssv"></a>
### Navigatie van ruimtegebruikers (`gnss-ssv`)

Voor een ruimtevaartuig boven, rond of ver voorbij de GNSS-banen: hoeveel GNSS-signalen het kan gebruiken, hoe
sterk ze zijn, hoe goed de geometrie is, en wat een filter aan boord ermee kan doen. Eén type,
vier modi, gekozen door de tabellen van het scenario: een **schil** van gebruikers (het aandeel van de tijd met één en vier
signalen, per constellatie), een **traject** (signalen, C/N0, precisieverdunning en het
medium van de limbstralen langs een baan), een **navigatierun** (een filter met negen toestanden op pseudoafstanden, naar de
Maan) en een **formatie** (relatieve navigatie van volgers rond een leider). De openbare bron voor de
beschikbaarheidsvergelijking is het interoperabele GNSS Space Service Volume-boekje (UN OOSA
ST/SPACE/75, van het International Committee on GNSS), dat zelf een simulatie is; het wordt opgehaald, nooit
meegeleverd. Volledige pagina: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Signaalbeschikbaarheid voor een gebruiker op een bol op 36000 km hoogte met een halfbolantenne, uit een echte run van engine v0.40.0 op scenarios/gnss-ssv-shell.toml (een verkleinde run: 162 gebruikers, 3 dagen, stappen van 10 min), bij een drempel van 20 dB-Hz. Voor elke constellatie en band twee staven: het aandeel van (gebruiker, epoche)-paren met ten minste één signaal en met ten minste vier. Gecombineerd, L1: 99.4 % ten minste één, 73.2 % ten minste vier, langste uitval onder vier signalen 160 min. Gecombineerd, L5: 100.0 % ten minste één, 99.9 % ten minste vier, langste uitval onder vier signalen 20 min. MODELLED: een gemodelleerde studie uit vermelde invoer, geen meting en geen service-volume-claim voor enig systeem. De verkleinde omvang is niet de vergelijking met het boekje. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Signalen langs één hoge aardbaan (perigeum 497 km, apogeum 58622 km, periode 18.8 h), uit een echte run van engine v0.40.0 op scenarios/gnss-ssv-heo.toml, band L1. Boven: de beste draaggolf-ruisdichtheid onder de zichtbare signalen, tegen de drempel van 20 dB-Hz. Midden: het aantal zichtbare signalen van alle constellaties, van 4 tot 55 langs de bemonsterde punten. Van de ontvangen links kwamen er 2252 via een hoofdlob en 696 via zijlobben, met een gelabeld parametrisch vervangpatroon, niet het gemeten patroon van enig systeem. Mediane PDOP 67, 95e percentiel 358. MODELLED: een gemodelleerde studie uit vermelde invoer, geen meting en geen service-volume-claim voor enig systeem. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Een filter met negen toestanden aan boord bij een transfer van een lage baan naar de Maan, uit een echte run van engine v0.40.0 op scenarios/gnss-ssv-nav-lunar.toml (289 epochen, 13 punten getekend). Op een logaritmische as de werkelijke positiefout en de eigen één-sigmagrens van het filter tegen de tijd sinds de start. Binnen de GNSS-banen is de positie-RMS 1.4 m; daarboven is die 90 m, met een eindfout van 184 m op 193,330 km hoogte met 1 meting. De gemiddelde genormaliseerde gekwadrateerde schattingsfout over de hele run is 4.4 (ongeveer 3 voor een consistent positieblok). Referentie en filter delen hun vervangers voor Zon en Maan. MODELLED: een gemodelleerde studie uit vermelde invoer, geen meting en geen service-volume-claim voor enig systeem. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Relatieve navigatie van 2 volgers rond een leider in een hoge baan, uit een echte run van engine v0.40.0 op scenarios/gnss-ssv-formation-heo.toml (401 epochen). Voor elke volger twee staven: de relatieve positie-RMS uit het aftrekken van de twee onafhankelijke absolute schattingen, en uit het relatieve filter op enkelvoudig gedifferentieerde pseudoafstanden. Basislijn 0.8 km: 5.1 m en 1.2 m. Basislijn 2.0 km: 4.1 m en 2.1 m. Het absolute filter is hier niet consistent: gemiddelde genormaliseerde gekwadrateerde schattingsfout 187 tegen ongeveer 3 voor een consistent filter, dus de vermelde onzekerheid is veel te klein. MODELLED: een gemodelleerde studie uit vermelde invoer, geen meting en geen service-volume-claim voor enig systeem. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

**Registerstatus: MODELLED, en de vergelijking met het boekje haalt de drempels grotendeels niet.** De drempels zijn vastgelegd vóór
de run. Van de acht worden alleen S0 (het inverse linkbudget, 13 van 13 waarden) en S6 (de maanmissie)
gehaald. **S1 tot S5 en S7 zijn NOT MET**: de geometrie van het bovenste en onderste service volume (43 van 52 en 48 van 52
cellen), het bovenste service volume bij 15/20/25 dB-Hz, de zes GEO-missies, de HEO-missie, en het
parametrische zijlobpatroon tegen gemeten GPS-panelpatronen. Bijna elke misser in S1 tot S5 betreft
GLONASS, en het boekje drukt daarvoor twee verschillende referentiehoeken af; een diagnostische variant die het
andere paar gebruikt, brengt S1, S2 en S4 tot elke cel, maar vervangt de officiële run niet en geen enkele rij is
VALIDATED. Het absolute filter van de formatierun is ook overmoedig (gemiddelde genormaliseerde gekwadrateerde fout
ruim boven de waarde van ongeveer 3 die een consistent filter geeft).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="De vastgelegde vergelijking van het beschikbaarheidsmodel voor ruimtegebruikers met het openbare Space Service Volume-boekje, uit de vastgelegde resultaten van de vooraf geregistreerde run (xval/gnss-ssv/results-run1.json, geschreven door het voorbeeld ssv_booklet_check van engine v0.40.0). Staaf voor staaf de cellen binnen de tolerantie: S0 13 van 13 (MET); S1 43 van 52 (NOT MET); S2 48 van 52 (NOT MET); S3 122 van 155 (NOT MET); S4 132 van 156 (NOT MET); S5 18 van 26 (NOT MET); S6 26 van 26 (MET); S7 0 van 20 panelpatronen (NOT MET). Alleen S0 en S6 worden gehaald onder de vooraf geregistreerde lezing. Een diagnostische variant die de andere GLONASS-hoeken van het boekje gebruikt, brengt S1, S2 en S4 tot elke cel, maar vervangt de officiële run niet. Geen enkele registerrij is VALIDATED. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

[Navigatie van ruimtegebruikers](docs/SSV.md), [wat de vergelijking laat zien](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Maaninfrastructuur (`lunar-infrastructure`)

De baan en het oppervlak van de Maan als navigatie- en geodetische infrastructuur, in vijf studies gekozen via
`study`: **od-consistency** (een baanbepaling aan boord met aard-GNSS in een halobaan tegen een
onafhankelijke baanbepaling vanaf de grond), **carrier-phase** (het vastleggen van geheeltallige ambiguïteiten tussen oppervlaktestations en een
orbiter), **frame-coestimation** (het maandatum uit afstandsmetingen vanaf aardstations met en zonder orbiter-
links), **space-tie** (laser-, VLBI- en GNSS-offsets op één ruimtevaartuig tegen de fout van de lokale koppeling) en
**geodesy-sensitivity** (welke familie van waarneembare grootheden de Love-getallen h2, k2 en l2 ziet). Het model is een
beperkt drielichamenmodel met vermelde vereenvoudigingen en illustratieve invoer. Volledige pagina:
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
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Consistentie van een baanbepaling aan boord met aard-GNSS in een bijna-rechtlijnige halobaan met een onafhankelijke baanbepaling vanaf de grond, uit echte runs van engine v0.40.0 op scenarios/lunar-infrastructure-od-consistency.toml en de variant met modelfout (elk 400 proeven). Het gemiddelde genormaliseerde verschil q is 5.81 zonder modelfout en 5.95 met een geïnjecteerde versnellingsfout van 3e-10 m/s2, tegen 6 verwacht: de twee baanoplossingen zijn consistent (drempel C1 MET). Het aandeel proeven boven het 95 %-punt is 0.040 en 0.052; de drempel voor het detecteren van de geïnjecteerde fout was ten minste 0.5, dus die is NOT MET (C3): de oplossing aan boord is bekend tot op ongeveer 352 m tegen 23 m voor die vanaf de grond, dus een verplaatsing van tien meter verdwijnt in haar covariantie. MODELLED: een beperkt drielichamenmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Het vastleggen van geheeltallige ambiguïteiten van de draaggolffase tussen oppervlaktestations op de Maan en een orbiter, uit het vastgelegde resultaat van de gescoorde run van engine v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 booglengtes, een Monte Carlo van elk 401 trekkingen, geschreven door scenarios/carrier-phase-scored.toml). 1 dag: succes 1.0 % (standaardfout 0.5 %), 134 ambiguïteiten, positiesigma van de orbiter 45.6 m zwevend en 18.5 m vastgelegd; 2 dagen: succes 0.5 % (standaardfout 0.4 %), 259 ambiguïteiten, positiesigma van de orbiter 21.5 m zwevend en 8.7 m vastgelegd; 3 dagen: succes 2.8 % (standaardfout 0.8 %), 375 ambiguïteiten, positiesigma van de orbiter 6.3 m zwevend en 2.1 m vastgelegd. Geheeltallig vastleggen wordt niet bereikt: het succes blijft tussen 1 % en 3 % bij 25 dBi, en bij de geregistreerde 12 dBi kan het probleem niet worden opgesteld. MODELLED: een beperkt drielichamenmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Precisie van het maandatum met zeven parameters (drie translaties, een schaal en drie rotaties) uit afstandsmetingen vanaf aardstations, met en zonder afstanden van orbiter naar oppervlaktestation, uit een echte run van engine v0.40.0 op scenarios/lunar-infrastructure-frame-coestimation.toml. De Cramer-Rao-sigma van de translaties en rotaties daalt met de orbiterlinks (bijvoorbeeld t_z van 0.98 m naar 0.046 m); de kleinste informatie-eigenwaarde stijgt 111-voudig en het CRLB-spoor daalt tot 1.0 % (drempel F3 MET). Dit veronderstelt dat de baan bekend is in de maanassen, waarbij de fout ervan wordt gedragen door de orbiterafstandssigma van 1 m. MODELLED: een beperkt drielichamenmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Precisie van de offsets tussen laserafstandsmeting-, VLBI- en GNSS-posities van één ruimtevaartuig, tegen de fout van de lokale koppeling op de grond, uit een echte run van engine v0.40.0 op scenarios/lunar-infrastructure-space-tie.toml (één boog van 6.56 dagen, techniek-sigma's GNSS 10 m, VLBI 1 m, laser 0.1 m). Met een lokale koppeling van 1 mm tot 1 m blijft de translatiesigma van laser min GNSS rond 1.04 m totdat de koppeling 1 m bereikt: die wordt begrensd door de meetruis van de technieken, niet door de lokale koppeling. De ondergrens die de koppeling alleen bepaalt, is de wortel uit twee maal haar sigma. MODELLED: een beperkt drielichamenmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Welke familie van waarneembare grootheden gevoelig is voor de Love-getallen h2, k2 en l2 van de Maan, uit een echte run van engine v0.40.0 op scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Elke cel is de RMS van de partiële afgeleide van de waarnemingen van een familie naar een parameter, in de eigen eenheden van die familie (dus cellen worden binnen een rij vergeleken, niet binnen een kolom); een streepje betekent dat de familie geen gevoeligheid heeft. laserafstandsmeting: h2 7.6, k2 geen, l2 9.8. orbitervolging: h2 geen, k2 0.00086, l2 geen. oppervlaktegravimeter: h2 2.9e+03, k2 4.3e+03, l2 geen. oppervlakteklok: h2 2.8e-17, k2 2.8e-17, l2 geen. Met alle vier families is de Cramer-Rao-sigma 0.36 % van de nominale h2, 0.52 % van k2 en 1.16 % van l2. Het toevoegen van een familie verlaagde nooit de kleinste eigenwaarde (28 van 28 toevoegingen), maar het spoor van de pseudo-inverse was in slechts 16 van 28 niet groter: die helft van drempel G3 is NOT MET. De orbiterfamilie ziet de zichtlijnintegraal van de k2-versnelling, een waarde aan de bovenkant. MODELLED: een beperkt drielichamenmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringinstrument, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.">
</picture>

**Registerstatus: MODELLED, en drie drempels zijn NOT MET.** De numerieke berekeningen zijn gecontroleerd tegen onafhankelijke
numpy- en scipy-programma's; niets wordt vergeleken met een meting van een maangrootheid, en niets is
VALIDATED. Gehaald: de twee baanoplossingen zijn consistent (gemiddelde q 5.81 tegen 6 verwacht), en orbiter-
links verhogen de kleinste datum-eigenwaarde ongeveer 111-voudig, uitgaande van een bekende baan. **Niet gehaald**: de
geïnjecteerde modelfout van 3e-10 m/s2 wordt **niet gedetecteerd** (C3: de oplossing aan boord is bekend tot op ongeveer 350 m, dus
ongeveer tien meter verdwijnt in haar covariantie); **geheeltallig vastleggen wordt niet bereikt** (1 tot 3 % succes bij
25 dBi, en bij de geregistreerde 12 dBi kan het probleem niet worden opgesteld); en de spoorhelft van G3 voor het toevoegen van een
familie van waarneembare grootheden (het spoor steeg bij 12 van 28 toevoegingen, telkens omdat de familie de rang verhoogde).
Elke misser is vastgelegd door een test. [Maaninfrastructuur](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Open [kshana.dev/studio](https://kshana.dev/studio/) en de hele engine draait in uw
browser, gecompileerd naar WebAssembly. Niets te installeren, en er wordt niets geüpload. De Studio heeft
twee weergaven van dezelfde engine, en een schakelaar in de koptekst wisselt daartussen, met behoud van het
scenario, de weergave en alle instellingen die u hebt gewijzigd.

**De Eenvoudige weergave** is waar de Studio opent. Ze begint bij vragen (hoeveel satellieten
kan ik zien, kan ik mijn positiebepaling vertrouwen, hoe lang kan een klok de tijd vasthouden, wat doet een jammer
met mijn ontvanger) en bij een kaart van alles wat de engine kan, elk gebied met zijn aandeel
gevalideerde methoden. Open een scenario en het antwoord komt eerst: één eenvoudige zin, geschreven voor
wat dat scenario meet, daarna de kerncijfers en een grafiek. Er worden hooguit vijf instellingen
getoond, de instellingen die het antwoord het meest veranderen; de rest wacht onder **Geavanceerde instellingen**.
**Hoe dit wordt berekend** legt de methode uit, en **Voor onderzoekers** geeft de eigen cijfers van de engine,
het scenariobestand, de code om het vanuit Python te draaien en de bronvermelding.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, Eenvoudige weergave, op het meegeleverde scenario integrity-raim, met engine v0.40.0 lokaal draaiend. De vraag: haalt de geometrie de alarmgrenzen (horizontaal en verticaal beschermingsniveau)? Eerst het antwoord, gemarkeerd als Live resultaat: Ja, grotendeels: gedurende 95.3 % van de 12 h. De foutgrens van de ontvanger bleef onder de alarmgrenzen (40 m horizontaal en 50 m verticaal) bij 344 van 361 controles, en geen enkele positiebepaling was misleidend. Kerncijfers: tijd dat de positiebepaling te vertrouwen is 95.3 %, langste onderbreking 10 min, typische foutgrens 6.5 / 13 m, misleidende positiebepalingen 0. Ernaast Andere instellingen proberen met vijf ervan (de afstandsfout, de twee alarmgrenzen, de duur en het elevatiemasker) en Opnieuw uitvoeren, daarna de ingeklapte secties Geavanceerde instellingen (13 meer), Hoe dit wordt berekend (8 gevalideerd, 6 gemodelleerd) en Voor onderzoekers. Daaronder de weergaven van dit resultaat en de beschermingsniveaus uitgezet tegen de alarmgrens." width="100%">
</picture>

**De Geavanceerde weergave** is het volledige dashboard: de scenariobibliotheek, vijf genummerde stappen
(Kiezen, Instellen, Uitvoeren, Resultaten lezen, Delen of exporteren), de kerncijfers met PASS- en FAIL-labels
waar de run een drempel vermeldt, en elk paneel: overzicht, grafieken, kaarten, herhaling, het
rapport van de engine en exports. Eén zoekvak bereikt scenario's, domeinen en de velden daarin,
en u kunt tot vier runs vastpinnen en ze naast elkaar vergelijken.

<details>
<summary>Het openingsscherm van de Eenvoudige weergave, en de Geavanceerde weergave na een run</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, Eenvoudige weergave, openingsscherm, met de titel Wat wilt u te weten komen?, met engine v0.40.0 live en in de bovenbalk drie links: Trainingsnabespreking, Interferentiekaart en Ontvangervertrouwen. Vier vragen: hoeveel satellieten kan ik overal op aarde zien, kan ik mijn positiebepaling vertrouwen, hoe lang kan een klok de tijd vasthouden zonder satellieten, en wat doet een jammer met mijn ontvanger. Onder de eerste het vastgelegde resultaat: ten minste 22 satellieten zichtbaar op elke plaats en gemiddeld 31 met GPS, Galileo, BeiDou en GLONASS samen, een positiebepaling mogelijk op 100 % van de plaatsen en tijden, op een wereldkaart van zichtbare satellieten, met een knop Dit resultaat openen. Ernaast Alles wat Kshana kan: 16 gebieden en 139 direct uitvoerbare scenario's, elke tegel met een kleine grafiek uit een vastgelegde run en zijn aandeel gevalideerde methoden, en de 173 van 350 mogelijkheden in het register die gevalideerd zijn." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, Geavanceerde weergave, na een run van het meegeleverde scenario constellation-multi-gnss-coverage (Vier GNSS-constellaties, één kaart), met engine v0.40.0 lokaal draaiend. Links de scenariobibliotheek, 139 scenario's in 16 domeinen. De vijf stappen Kiezen, Instellen, Uitvoeren, Resultaten lezen en Delen of exporteren, met stap 4 actief. Kerncijfers: 102 satellieten, beschikbaarheid 100 % (PASS), mediane positieprecisieverdunning (PDOP) 0.95 (PASS), PDOP 95e percentiel 1.105 (PASS), gemiddeld 31.03 satellieten zichtbaar en minimaal 22. Daaronder de paneelrij met Dekking geselecteerd, de herhalingsbalk, een wereldkaart van de gemiddelde PDOP van 0.831 tot 1.0853 met elke satelliet getekend, en de wereldwijde dekkingscijfers." width="100%">
</picture>

</details>

De broncode van de Studio en de bouwnotities staan in [`web/README.md`](web/README.md).

### De site

De rest van [kshana.dev](https://kshana.dev) wordt gebouwd uit de eigen bestanden en
engine-runs van deze repository: missies, mogelijkheden, het bewijsregister, het gepubliceerde onderzoek en de
edities.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Drie pagina's van kshana.dev naast elkaar. De hero van de startpagina: de naamregel Kshana · क्षण · the precise instant boven de kop Rehearse the minute GNSS goes dark, met de missieconsole van een echte run van engine v0.40.0 (een globe en drie live grafieken: tijdfout van de klok, draaggolf-ruisdichtheid en beschermingsniveau). Bewijs, Gepubliceerd onderzoek: de zes arXiv-artikelen gebouwd op de open engine, het nieuwste met een figuur van de engine. Edities, Kshana Pro, dezelfde engine, versterkt: Free draait één scenario, Pro beantwoordt de vraag van het programma." width="100%">
</picture>

<a id="capabilities"></a>
## Mogelijkheden

Eén engine bestrijkt de hele faalketen, van de eerste gejamde satelliet tot de laatste
nanoseconde van klok-holdover. De engine heeft 92 scenariotypen; `kshana kinds` somt ze
op en [`docs/SCENARIOS.md`](docs/SCENARIOS.md) documenteert elk veld.

| Mogelijkheid | Waar het antwoord op geeft |
|---|---|
| [Spectrum](docs/SPECTRUM.md) | hoe een jammer de GNSS-L-band inneemt, band voor band, seconde voor seconde |
| [Klokken en tijdsynchronisatie](docs/TELECOM-TIMING.md) | hoe lang elke klok de tijd vasthoudt nadat GNSS is weggevallen |
| [Constellaties rond elk hemellichaam](docs/CONSTELLATION-DESIGN.md) | dekking, precisieverdunning en beschikbaarheid rond de Aarde, de Maan of Mars |
| [Zonnestelsel](docs/SOLAR-SYSTEM.md) | waar elke planeet is, en de lichttijd van elke verbinding |
| [Navigatie in lage aardbaan](docs/LEO-PNT.md) | een overgang, een link, een navigatiebericht en een gefuseerde positiebepaling, stap voor stap |
| [Campagnes](docs/CAMPAIGNS.md) | een gekoppelde missie, een sweep of een Monte Carlo-ensemble in één scenario |
| [Animatie](docs/ANIMATION.md) | de tijdreeks van een run als geanimeerde tekening, een speler of frames |
| [Rapporten](docs/REPORTS.md) | elke figuur met zijn eenheid en zijn label, in HTML (HyperText Markup Language) en JSON (JavaScript Object Notation) |
| [Interoperabiliteitsexports](docs/INTEROP.md) | banen en geometrie voor andere tools: SP3, CCSDS OMM en OEM, CZML, KML, GeoJSON, STK en SigMF |
| [Maritiem vertrouwen](docs/MARITIME-TRUST.md) | kan de brug deze positiebepaling vertrouwen: een score van 0-100 en redenen voor de NMEA van een vaartuig, live of uit een registratie (adviserend, geen typegoedgekeurde navigatieapparatuur) |
| [NMEA-trainingsstromen](docs/NMEA-TRAINING.md) | synthetische NMEA voor de brug met gescripte jamming en spoofing en een instructeurslogboek, voor bemanningstraining (alleen tekst; nooit voor de live navigatiesystemen van een vaartuig; adviserend, geen typegoedgekeurde navigatieapparatuur) |
| [Interferentiekaart](docs/INTERFERENCE-MAP.md) | waar vliegtuigen en schepen gedegradeerde navigatiegegevens meldden, en hoeveel van een route dat raakt |
| [Bronregio](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | waar, onder vermelde aannames, een bron van gedegradeerde positiemeldingen kan zijn: regio's met vermelde betrouwbaarheid, een zwaartepunt met zijn ellips, nooit een punt (MODELLED; `kshana interference-map locate`) |
| [Bewijspakketten](docs/EVIDENCE-PACKS.md) | een ondertekend, offline verifieerbaar technisch register van een logvenster van een vaartuig en wat de engine daaruit heeft berekend, voor een incidentrapport (adviserend, geen typegoedgekeurde navigatieapparatuur) |
| [Vertrouwenstelemetrie](docs/TRUST-TELEMETRY.md) | de vertrouwensstroom als Prometheus-metrieken, SIEM-gebeurtenissen en optioneel OpenTelemetry, met een voorbeeld-Grafana-dashboard (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K en OpenCPN](docs/MARINE-INTEGRATIONS.md) | de vertrouwensscore op de Signal K-server van een boot en in OpenCPN, met een referentiebouw voor een kleine computer naast de ontvanger (adviserend, geen typegoedgekeurde navigatieapparatuur) |
| [Testbankexport](docs/TEST-BENCH.md) | `kshana bench-export`: de voertuigbeweging en gebeurtenissen van een scenario voor een GNSS-simulator in een laboratorium (er wordt geen signaal geschreven), en hoe de registratie van de ontvanger daarna te scoren |
| [Normentoewijzing en rapport](docs/compliance/README.md) | `kshana compliance-report`: voor welke rijen van openbare weerbaarheidskaders een reeks runs bewijs levert, en de kloof die overblijft |
| [Notebooks](notebooks/README.md) | uitvoerbare tutorials: vaartuigvertrouwen en trainingsstromen, routeblootstelling op een interferentiekaart, normentoewijzing en de testbank, kwantum tegen klassieke GDOP |
| [Galileo OSNMA-verificatie](docs/OSNMA.md) | van welke satellieten een ontvanger de navigatiegegevens cryptografisch kan authenticeren, en waarom een controle faalt; Kshana verleent geen rechten onder de OSNMA ICD IPRs van de EU (zie de NOTICE op de pagina) |

De exportformaten voluit: SP3 is Standard Product 3; CCSDS OMM en OEM zijn de Orbit
Mean-elements en Orbit Ephemeris Messages van het Consultative Committee for Space Data
Systems; CZML en KML zijn de Cesium en Keyhole Markup Languages; STK is Systems Tool Kit;
SigMF is het Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="De gekoppelde campagne campaign-jam-spoof-holdover-integrity, één echte run van de engine (seed 20260928): 6 fasen (Nominaal → Jamming → Spoofing → Holdover → Integriteitsalarm → Herstel) en 18 deelruns op een raster van 10 s over T+01:16:10. Drie banen: tijdfout van de klok tegen een marge van 50 ns (piek 62.7 ns), effectieve draaggolf-ruisdichtheid tegen een ondergrens van 25 dB-Hz (minimum -12.2 dB-Hz), en verticaal beschermingsniveau tegen een alarmgrens van 50 m (piek 135.4 m), met de alarmgebeurtenissen van de run: T+00:20:00 alarmen van de RF-spoofingdetector (gefuseerde monitoren voor consistentie, vermogen en signaalkwaliteit); T+00:26:10 alarmen van de klokondersteunde spoofingmonitor." width="100%">
</picture>

<details>
<summary>Elke mogelijkheid, getekend uit een echte run: de L-band-waterval, de dekkingskaart, het zonnestelsel en een overgang in lage aardbaan</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="De GNSS-L-band als één spectrale vermogensdichtheid over 60 s, uit een echte run van het type spectrum (l-band-waterfall-jamming.toml, seed 7, engine v0.40.0): frequentie horizontaal, tijd verticaal, kleur voor vermogen boven de ruisvloer van -202.0 dBW/Hz. Jammers: chirp-privacyapparaat (chirp, aan op 10 s, uit op 40 s); CW-toon op L1 (cw, aan op 30 s); smalbandige ruis op L2 (narrowband, aan op 45 s). Slechtste band GPS L1 C/A: minimale effectieve C/N0 3.2 dB-Hz op 31 s tegen een volgdrempel van 25 dB-Hz. GPS L1 C/A minimum 3.2 dB-Hz; Galileo E1 minimum 4.7 dB-Hz; GPS L2C minimum 36.9 dB-Hz; GPS L5 minimum 44.1 dB-Hz; Galileo E5a minimum 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Zichtbare satellieten over de hele aarde gedurende één dag, uit een echte run van constellation-design (constellation-multi-gnss-coverage.toml, engine gedraaid door deze generator): 102 satellieten (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Elke cel van 10 graden is gekleurd naar het gemiddelde aantal satellieten boven het masker van 10 graden (27.2 tot 36.5); de punten zijn de grondspoorsamples van de engine, één per uur per satelliet. Wereldwijde beschikbaarheid 100.00 % bij PDOP van ten hoogste 6, mediane PDOP 0.95, gemiddeld 31.0 en minimaal 22 satellieten zichtbaar." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Het zonnestelsel op de epoche van het scenario 2026-09-28T00:00:00, uit een echte run van het type solar-system (solar-system-tour.toml): de Zon, 9 planeten en dwergplaneet Pluto gezien van boven de ecliptica, afstanden voor de weergave logaritmisch samengedrukt, met de enkele lichttijd van elk hemellichaam vanaf de Aarde. Mercurius 0.47 au, 10.1 lichtminuten, VALIDATED; Venus 0.73 au, 3.0 lichtminuten, VALIDATED; Mars 1.55 au, 14.0 lichtminuten, VALIDATED; Jupiter 5.30 au, 49.5 lichtminuten, VALIDATED; Saturnus 9.44 au, 70.2 lichtminuten, VALIDATED; Uranus 19.44 au, 157.4 lichtminuten, MODELLED; Neptunus 29.88 au, 240.2 lichtminuten, MODELLED; Pluto 35.61 au, 292.2 lichtminuten, MODELLED. Verbindingen: Mars naar Jupiter enkele reis 2193.5 s; Saturnus naar Aarde enkele reis 4212.2 s; Europa naar Jupiter enkele reis 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Eén overgang in lage aardbaan (LEO) uit een echte run van het type leo-pass (leo-pass-iridium.toml, engine gedraaid door deze generator): Iridium-overgang op 781 km, STL-band op 1621 MHz, gezien door een luchtgebruiker op 50° N 30° W. Boven het masker van 5° gedurende 750 s, maximale elevatie 65.0° op 444 s. De draaggolf-ruisdichtheid piekt op 80.5 dB-Hz (mediaan 71.3), 34.3 dB boven de GNSS-mediaan van 46.2 dB-Hz van 8 zichtbare GPS-satellieten (38.2 tot 51.1 dB-Hz); de doppler bereikt 35.4 kHz." width="100%">
</picture>

Draai elk ervan met `kshana example <scenario> > s.toml && kshana s.toml`: de scenario's
zijn `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
en `leo-pass-iridium`.

</details>

<details>
<summary>De maritieme en interferentiemogelijkheden, getekend uit vastgelegde synthetische invoer: een vertrouwensscore, een interferentiekaart met routeblootstelling, een trainingsstroom en een bewijspakket</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Vertrouwensscore over één synthetische overtocht, uit een echte run van engine v0.40.0 op examples/maritime-trust (een verzonnen NMEA-registratie van een veerboot op een route van Tallinn naar Helsinki, 3001 epochen bij 1 Hz). Drie banen delen één tijdas. Boven: de afstand tussen de positie die de ontvanger meldt en de werkelijke positie van het vaartuig, die binnen enkele meters blijft tot ongeveer 1576 s, wanneer de gescripte positieverschuiving in de registratie haar wegtrekt, terwijl de ontvanger een geldige positiebepaling blijft melden. Midden: de vertrouwensscore van 0 tot 100, niet berekend tijdens de eerste 300 s van kalibratie, in de nominale band (ten minste 90) tot de verschuiving, en daarna dalend door de gedegradeerde band (ten minste 55) naar de onbetrouwbare band. Onder: de band van elke epoche als gekleurd lint met zijn naam. De score is adviserend. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC 61108, IEC 61162): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig. De registratie is verzonnen om het formaat en de monitoren te tonen; ze is geen meting en zegt niets over hoe een ontvanger zou presteren." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Twee synthetische interferentiekaartdagen getekend uit de vastgelegde voorbeelden in examples/interference-map/output, elk met een eigen synthetische route en de aandelen van routeblootstelling die de engine rapporteert. Links een ADS-B-dag: 1 gedegradeerde cel, 6 niet gedegradeerd, 4 niet beoordeeld (gearceerd) en cellen zonder vermelding, leeg getekend, die niet zijn waargenomen. De route is 525 km: 11.5% van de lengte in gedegradeerde cellen, 38.3% niet gedegradeerd, 9.1% niet beoordeeld en 41.1% niet waargenomen. Rechts een AIS-dag: cellen gemarkeerd door de cirkel- en op-landdetectoren, niet-afwijkende cellen en lege cellen; de route is 454 km met 10.5% in afwijkende cellen, 21.2% niet afwijkend, 0.0% niet beoordeeld en 68.3% niet waargenomen. ADS-B en AIS zijn afzonderlijke lagen, nooit gecombineerd. Een gemarkeerde cel is geen vaststelling van interferentie, en een cel zonder kleur is niet waargenomen, wat niet hetzelfde is als vrij. Alle data zijn verzonnen, op de open Midden-Atlantische Oceaan, en geen meting." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Trainingsstroom uit het scenario coastal-drag-off (engine v0.40.0, seed 22, 25 minuten met één positiebepaling per 10 s van het instructeurslogboek). Een kaart toont het werkelijke spoor van het vaartuig en het spoor dat de ontvanger meldt: ze komen overeen totdat een gescripte positieverschuiving begint op 421 s, waarna het gemelde spoor wegloopt van het werkelijke terwijl de ontvanger een geldige positiebepaling behoudt, en het springt terug wanneer de gebeurtenis eindigt op 1140 s. Ernaast de afstand tussen de twee sporen in de tijd, en de gemiddelde draaggolf-ruisdichtheid die de ontvanger meldt, die tijdens de gebeurtenis stijgt naar één verhoogd niveau. Synthetische trainingsdata gegenereerd door Kshana. Alleen voor training en test: voer deze stroom nooit in de live navigatiesystemen van een vaartuig in. Adviserend, geen typegoedgekeurde navigatieapparatuur. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC 61108, IEC 61162): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig. Posities, datums en sporen zijn verzonnen." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="De structuur van een bewijspakket. Een ontvangerregistratie (NMEA, u-blox UBX, RINEX 3 of een Android-log) en een tijdvenster gaan naar kshana receiver-trust evidence, dat zeven bestanden schrijft: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig en een optioneel timestamp.tsr. Het manifest legt de SHA-256 vast van de hele registratie en van elk bestand, en een hashketen over de bestanden; de handtekening dekt het manifest. kshana evidence verify controleert de handtekening, de hash van elk bestand, de keten en dat er geen niet-vermeld bestand aanwezig is, en eindigt met 0 bij verificatie, 1 als iets is mislukt en 3 als de ondertekenaar niet was vastgezet. Een pakket is een technisch register, geen juridisch advies." width="100%">
</picture>

Alle vier zijn verzonnen data en adviserend: ze tonen het formaat en het gedrag van de software, niet hoe een ontvanger of systeem presteert onder interferentie. Draai de eerste met `kshana receiver-trust examples/maritime-trust/session.toml`, de tweede met `kshana route-exposure` op de voorbeelden in `examples/interference-map/`, de derde met `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (alleen voor training: voer het nooit in live navigatieapparatuur in), en de vierde zoals in [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>De volledige mogelijkhedentabel, domein voor domein</summary>

Het volledige detail per domein volgt; voor een volwassenheidsregister per mogelijkheid zie
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) en [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Domein | Mogelijkheid |
|--------|------------|
| **Baan en geometrie** | SGP4/SDP4-propagatie (gevalideerd tot 4.12 mm tegen alle 666 AIAA 2006-6753-vectoren); echte two-line elements (een vastgelegde, gedateerde Celestrak `gps-ops`-momentopname) of synthetische Walker-deltaconstellaties waarvan de gemiddelde elementen de formule `i:T/P/F` realiseren tot binnen 1 km over een propagatie van 24 h; zichtbaarheid over meerdere constellaties, **precisieverdunning — geometrisch, positie, horizontaal, verticaal en tijd (GDOP/PDOP/HDOP/VDOP/TDOP), gevalideerd tot 1e-6 tegen gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), en GNSS-beschikbaarheid; een gradiëntvrije optimalisator voor constellatieontwerp, dimensionering van het minimale aantal satellieten met streets-of-coverage, een vergelijkingstool voor meerdere constellaties, en een Walker-**ontwerpsweep** die dekking / PDOP / herbezoektijd tabelleert over een raster van vlakken × satellieten en de Pareto-optimale ontwerpen rapporteert. |
| **Numerieke propagator** | Een numerieke **Cowell**-propagator (`src/propagator.rs`) als aanvulling op het analytische SGP4/SDP4-pad, met een hiërarchisch krachtmodel met **zeven perturbaties** (`src/forces.rs`): tweelichamen + het volledige **zonale J2–J6**-veld (de zonale harmonische coëfficiënten J2 tot J6 van de afplatting van de aarde; de exacte analytische gradiënt van de storende potentiaal), een optionele **EGM2008 tesserale bolfunctie-geopotentiaal tot graad/orde 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; echte coëfficiënten van de NGA — US (United States) National Geospatial-Intelligence Agency —, genormaliseerde Legendre-recursie volgens Holmes–Featherstone, kruisgecontroleerd tegen de Legendre-functies in gesloten vorm en de analytische ∇V-identiteit), **door de epoche aangestuurde derdelichaamszwaartekracht van Zon en Maan** (een ingebouwde efemeride met lage precisie, geen DE/SPK-kernel — Development Ephemeris / SPICE Spacecraft and Planet Kernel), **stralingsdruk van de zon** (kanonskogelmodel met een conische kern- en bijschaduw), **atmosferische weerstand** (stuksgewijs exponentiële dichtheid volgens Vallado, meedraaiende atmosfeer), de **post-Newtoniaanse relativistische correctie van Schwarzschild**, en de **Lense–Thirring-frame-dragging**-term (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, lineair in het impulsmoment van de aarde, ~1–2 ordes onder Schwarzschild) — aangedreven door een keuze uit twee adaptieve integratoren (RK4 — vierde-orde Runge–Kutta — met stapverdubbeling of het ingebedde **Dormand–Prince RK5(4)**-paar). **Gevalideerd tegen Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 epochen over LEO (lage aardbaan) + GTO (geostationaire transferbaan), waarbij de niveaus met conservatieve krachten overeenkomen tot in het slechtste geval **\|Δr\| 0.08 m over 24 h** (`tests/numerical_cowell_propagator_reference.rs`); het niveau met atmosferische weerstand wordt afzonderlijk gekarakteriseerd (≈ 333 m / 24 h) en de absolute invoer voor de efemeride van Zon/Maan en de dichtheid blijft eerlijk **Modelled**. Aanvullend intern bewijs (geen externe validatie): de onverstoorde baan wordt gecontroleerd tegen de exacte Kepler-oplossing met universele variabele tot **onder een meter over 24 h**, energie/impulsmoment blijven behouden tot ~1e-9, en elke perturbatie komt overeen met een met de hand afgeleide signatuur in gesloten vorm. |
| **Manoeuvres en trajectontwerp** | Impulsieve ΔV-knooppunten met 6×6-covariantiepropagatie (uitvoeringsfoutstelsels ECI — aardgecentreerd inertiaal — / LVLH — lokaal verticaal, lokaal horizontaal), integratie van eindige brandduur gecontroleerd tegen de **Tsiolkovsky**-raketvergelijking in gesloten vorm tot < 0.01 %, een **Izzo-2015** **Lambert**-oplosser voor één omloop, een exacte **Kepler**-propagator met universele variabele, en een **porkchop**-sweep (lancering × aankomst) van C3 (lanceerenergie) / aankomst-V∞ uitgegeven als JSON-contourraster — de laag voor prestatiesimulatie boven GMAT/Orekit, waarbij elke Lambert-uitvoer heen en terug wordt gecontroleerd tegen de tweelichamenreferentie en het porkchop-minimum wordt gecontroleerd tegen de analytische Hohmann-ondergrens. |
| **Tijdsystemen en referentiestelsels** | IERS-schrikkelsecondeschalen **UTC / TAI / TT / UT1** (Coordinated Universal Time, International Atomic Time, Terrestrial Time en de aardrotatietijd Universal Time 1), een API (applicatieprogrammeerinterface) voor juliaanse datums, de IAU-2000 (International Astronomical Union) **Earth Rotation Angle** (ERA), op GMST (Greenwich Mean Sidereal Time) gebaseerde **TEME ↔ ECEF** (ware evenaar, gemiddeld equinox ↔ aardgecentreerd, aardvast) met geodetische WGS-84-stelsels (World Geodetic System 1984), IAU 2006-precessie (Fukushima–Williams), volledige **IAU 2000A/2000B-nutatie**, IERS-**poolbeweging**, en de equinoxvrije **op CIO gebaseerde IAU 2006/2000A GCRS↔ITRS**-reductie (CIO = Celestial Intermediate Origin) — allemaal **bit voor bit** gevalideerd tegen de SOFA/ERFA-vectoren, en **onafhankelijk kruisgecontroleerd tegen ANISE** (de herimplementatie van NAIF/SPICE in pure Rust; NAIF = de Navigation and Ancillary Information Facility van NASA, de US National Aeronautics and Space Administration): de GCRS→ITRS van kshana tegen de ITRF93 (International Terrestrial Reference Frame 1993) van ANISE uit `earth_latest_high_prec.bpc` van JPL, met dezelfde IERS-aardoriëntatieparameters voor beide, komen overeen tot **≤ 0.86 m op de grond / ≤ 3.6 m op GNSS-baanhoogte** (max 0.028″) over acht epochen 2020–2023. |
| **Inertiaal** | Driedimensionale strapdown-INS — quaternionattitude, WGS-84 NED-mechanisatie (noord-oost-omlaag), coning/sculling-compensatie, en een deterministisch IMU-foutmodel (schaalfactor, uitlijnfout, g-gevoeligheid, kwantisatie, drift); een **koude-atoominterferometerversnellingsmeter vanuit eerste principes** (Mach–Zehnder-fase, kwantumprojectieruis, contrastverval, trillingskoppeling) die de random-walkcoëfficiënt van de snelheid *afleidt*; en een **deeltjesfilter** met sequentiële importance-resampling voor kaartondersteunde (terrein-/zwaartekrachtgerefereerde) navigatie zonder GPS. |
| **Alt-PNT (zonder GPS)** | Een **meetmodel voor een koude-atoomgravimeter** waarvan de witte-ruisvloer (`σ = ASD/√τ`, ASD = amplitudespectrale dichtheid) is afgeleid uit de fysica van de CAI-versnellingsmeter; een volledig genormaliseerd **bolfunctie-zwaartekrachtanomalieveld** van lage graad (gecontroleerd tegen de Legendre-functies in gesloten vorm en een met de hand afgeleide anomalie met één term) plus synthetische mascons; de **synthesekernel voor zwaartekrachtfunctionalen** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — de "kaartlezer" waartegen een zwaartekrachtondersteunde navigator matcht — is gevalideerd tegen de **GRS80-norm voor normale zwaartekracht** (Geodetic Reference System 1980), reproduceert de normale zwaartekracht van Somigliana in gesloten vorm en de gepubliceerde γ_e / γ_p tot **3.5e-12** en levert een fysisch begrensde verstoringskaart uit het echte ICGEM-veld (International Centre for Global Earth Models) **EGM2008** (RMS — kwadratisch gemiddelde — ≈ 26 mGal, max ≈ 89 mGal bij g/o 70; `tests/icgem_gravity_reference.rs`); en een **deeltjesfilter voor zwaartekrachtkaartmatching** dat een spoor zonder GPS herstelt uit de anomalieënreeks waar het doorheen vliegt. Het breidt uit naar **terreingerefereerde navigatie** (TERCOM/SITAN — terrain contour matching / Sandia Inertial Terrain-Aided Navigation — tegen een SRTM-DEM (Shuttle Radar Topography Mission) `.hgt` (digitaal hoogtemodel), `src/altpnt/terrain.rs`), een **IGRF-14 geomagnetisch hoofdveld** (14e generatie International Geomagnetic Reference Field) tot graad/orde 13 (`src/igrf.rs`, gecontroleerd tegen de gekantelde dipool in gesloten vorm en eindige verschillen van ∇V), en een **gecombineerde zwaartekracht + magnetisch + terrein**-navigator die alle drie scalaire kanalen fuseert via één deeltjesfilter (informatie is additief — geen kanaal maakt de positiebepaling slechter). Een **benchmark van 60 minuten zonder GPS** (een uitval van ~700 km / één uur waarin de inertiale oplossing afdrijft tot ~70 km) wordt hersteld tot **~145 m (< 500 m)** door een hiërarchische matcher van grof naar fijn — het doel van *Quantum Wayfarer* van ESA NAVISP (Navigation Innovation and Support Programme). |
| **Fusie** | Losjes gekoppelde GNSS/INS-fouttoestands-EKF (extended Kalman filter) met 15 toestanden en gesloten-lusterugkoppeling (het `gnss-ins`-pakket); een **strak gekoppelde** pseudoafstandsupdate die blijft corrigeren met minder dan vier satellieten; een gekoppeld **klok + positie**-filter; een algemene **unscented (sigma-punt) Kalman**-schatter voor sterk niet-lineaire metingen; een strak gekoppelde GNSS/INS-**UKF-navigator** (pseudoafstand + doppler) waarvan de krachtmodelgebaseerde baanvoortzetting op zelfconsistentie is gecontroleerd tot **0.77 m RMS** over een gebogen LEO-overgang van 30 minuten met een GNSS-uitval van 120 seconden (een cijfer voor filterconsistentie, geen validatie tegen een externe onafhankelijke referentie — deze navigator blijft MODELLED); en een volledige **strak gekoppelde GNSS/INS-UKF met 17 toestanden** (positie, snelheid, attitudefout, biases van versnellingsmeter en gyroscoop, klokbias en -drift) waarvan de **kwantum-CAI-gegiste bestek** een uitval van 120 seconden overbrugt met de afgeleide snelheids-random-walk van de koude-atoomversnellingsmeter. |
| **Baanbepaling** | Herstel van een baantoestand `[r, v]` uit afstandsvolging vanaf grondstations, waarbij het tweelichamen + J2-krachtmodel en de RK4-integrator worden gecombineerd met een **Gauss–Newton-batch**-corrector (`determine_orbit_batch`, onder een meter / mm·s⁻¹ uit ruisvrije afstanden, ~2 m bij een ruisvloer van 5 m) en een **sequentiële** unscented-filtervariant (`determine_orbit_sequential`). |
| **Waarneembaarheid en schattingstheorie** | Een algemene, herbruikbare **Fisher-informatie / Cramér–Rao**-laag (`src/fim.rs`): de informatiematrix M = HᵀWH, de **ondergrens van Cramér–Rao**, waarneembaarheids**rang en nulruimte van het datumdefect** (Moore–Penrose-pseudo-inverse), en **D/A/E/T-optimale** scalairen voor proefopzet uit een symmetrische Jacobi-eigenoplosser. **Gevalideerd** — eigenwaarden tegen `numpy.linalg.eigh`, de CRLB-covariantie tegen σ²(XᵀX)⁻¹ via `numpy.linalg.inv`, en GNSS-DOP uit de informatiematrix, allemaal overeenkomend tot **1e-9** (`tests/fim_observability_reference.rs`), en daarnaast kruisgecontroleerd tegen de grenzen in gesloten vorm van **Kay (1993)** met Monte Carlo-bereiking van de CRLB. Het onderbouwt de DOP-engine, de CRLB voor passieve geolocatie en de **waarneembaarheidsstelling** voor absolute maanstations (hieronder). |
| **Maan en cislunair** | Een propagator voor het **cirkelvormig beperkte drielichamenprobleem (CR3BP)** Aarde–Maan in het roterende stelsel — behouden Jacobi-constante en alle vijf Lagrange-punten (`src/cr3bp.rs`) — nu met een **6×6-toestandsovergangsmatrix (STM) en een single-shooting differentiële corrector** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`) die werkelijk periodieke **halo- / NRHO**-banen (near-rectilinear halo orbit) oplevert: de STM is gevalideerd tegen eindige verschillen, gecorrigeerde banen sluiten tot op machineprecisie, en het zaaien van de gepubliceerde apolunetoestand reproduceert de **L2 zuidelijke 9:2 NRHO** (L2 = het tweede Lagrange-punt Aarde–Maan; de Gateway-baan) met periode ≈ 6.57 d / perilunium ≈ 3,250 km, consistent met de gepubliceerde ≈ 6.56 d / ≈ 3,370 km (een CR3BP-oplossing — cirkelvormig, zonder Zon —, **niet** gevalideerd tegen een echte efemeride van LANS (Lunar Augmented Navigation Service)/Gateway; de selenocentrische MCI/MCMF-transformatie (maangecentreerd inertiaal / maangecentreerd, maanvast) van de gecorrigeerde baan is een vervolgstap); plus cislunaire PNT-geometrie van **LunaNet / LNIS** (LunaNet Interoperability Specification) (MCI↔MCMF-reductie, selenografische coördinaten) met een **ARAIM-doorgang bij de zuidpool van de Maan** die de integriteitskloof eerlijk zichtbaar maakt: een σ_URE (gebruikersafstandsfout) van ~30 m drijft het beschermingsniveau ruim boven een alarmgrens van 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); en een **DOP-versterking met oppervlaktebakens** (`src/lunar_beacon.rs`) die laat zien hoe een paar ingemeten afstandsbakens op het oppervlak de zichtlijnrijen met lage elevatie en breed azimut leveren die een uitsluitend baangebaseerde set boven het hoofd mist — waardoor de slecht geconditioneerde GDOP bij de zuidpool instort en, via een foutbudget met kwadratische optelling, de gerealiseerde positienauwkeurigheid in meters (met hergebruik van de met gnss_lib_py gevalideerde DOP-kernel en de zichtbaarheid in gesloten vorm voor een horizon zonder atmosfeer; de analyse van de precisieverdunning is uitgewerkt in [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Maan-PNT-suite** | Een navigatiesuite voor de Maan en de cislunaire ruimte bovenop de CR3BP-kern, elk een uitvoerbaar `kind`: **Lunar Coordinate Time** (`lunar-time-offset`, `src/lunar_time.rs` — de seculaire snelheid van LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL = de Franse vorm, Temps-Coordonnée Lunaire) uit het verschil in eigenpotentiaal + kinetische term, gerapporteerd met de gepubliceerde band van 56–59 µs/dag); een geodetische waarneembare grootheid voor de vertraging bij **maan-VLBI** (very-long-baseline interferometry) (`lunar-vlbi`, `src/lunar_vlbi.rs` — een nabije-veldvertraging + -snelheid uit twee afstandsverschillen met een aardbasislijn, kruisgecontroleerd tegen de vlakkegolf-Δ-DOR (delta differential one-way ranging) uit dezelfde codebase in de verre-veldlimiet, partiële afgeleiden geverifieerd met eindige verschillen); een **gezamenlijke multi-techniek OD + klok**-batchschatter (`lunar-joint-od-clock`, `src/lunar_combination.rs` — een Gauss–Newton-fit die VLBI + lokale maanafstanden + afstanden tussen satellieten fuseert) met een resultaat over **Fisher-informatie-waarneembaarheid**: interne afstandsmeting alleen laat een **datumdefect** van een star lichaam met zes vrijheidsgraden over, dus de *absolute* positie van een oppervlaktestation is niet waarneembaar totdat een koppeling aan een aardstelsel wordt toegevoegd — een **VLBI**-vertraging met aardbasislijn *herstelt* de waarneembaarheid voor een schaarse constellatie en *verscherpt* de Cramér–Rao-grens voor een rijke, waarbij het absolute datum sluit bij **drie** niet-collineaire aardstations (het waarneembaarheidsresultaat is uitgewerkt in [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **realisatie van het referentiestelsel** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — een Helmert-datumfit met 7 parameters + IAU 2015 WGCCRE-oriëntatiekoppeling — WGCCRE = de IAU Working Group on Cartographic Coordinates and Rotational Elements); een analyse van het **service volume van Moonlight/LCNS-klasse** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / dekking / beschikbaarheid + een gegeneraliseerde ARAIM-HPL/VPL-envelop (horizontaal/verticaal beschermingsniveau) voor de Maan, met hergebruik van de met gnss_lib_py gevalideerde DOP-kernel en het LunaNet-mechanisme met σ_URE≈30 m); **differentiële maan-PNT** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — een maananaloog van differentiële GNSS / satellite-based augmentation system (SBAS): exacte opheffing van de gemeenschappelijke klokfout + ruimtelijke decorrelatie van eerste orde tegen de basislijn, met hergebruik van het DO-229E SBAS-beschermingsniveau — DO-229E is de minimale operationele prestatienorm van RTCA (voorheen de Radio Technical Commission for Aeronautics) voor SBAS-ontvangers); en een **op LunaNet/IOAG afgestemde interoperabiliteitsexport** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + heen-en-terugconversie van de maantijdschaal in het IAU 2015-lichaamsstelsel van de Maan, verpakt in de KIF-envelop). De bewijsniveaus per onderdeel staan in de [verificatiematrix](docs/VERIFICATION-MATRIX.md): Lunar Coordinate Time, de gezamenlijke OD + klok-schatter, de realisatie van het referentiestelsel en de service-volume-geometrie zijn **VALIDATED** (elk tegen de onafhankelijke referentie die de rij noemt, net als het kernelpad van de VLBI-vertraging); de VLBI-waarneembare grootheid, het waarneembaarheidsresultaat van het datumdefect, differentiële PNT en de interoperabiliteitsexport zijn **MODELLED**. Parameters zijn **illustratieve waarden uit openbare bronnen** — **niet** gevalideerd tegen echte VLBI-/Gateway-volging, **niet** gelieerd aan of onderschreven door enig agentschap, geen claim over TRL (technology readiness level) / heritage. |
| **Diepe ruimte en Mars-PNT** | Een open **radiometrische navigatie-engine**: iteratieve lichttijd + relativistische **Shapiro**-vertraging, twee-/een-/driewegs **doppler en afstand** (Moyer, twee trajecten), coherente transponderomkeerverhoudingen, regeneratieve/PN-afstandsmeting (pseudoruis) (CCSDS 414, de norm voor pseudoruis-afstandsmeting), en **Δ-DOR** in het hemelvlak (CCSDS 506, de Delta-DOR-norm), met media zonneplasma/tropo/iono; parseren + uitgeven van **CCSDS-TDM (503)**-volgdataberichten; een **gereduceerd-dynamisch Square-Root Information Filter** (RTN — radiaal, transversaal, normaal — empirische versnellingen + een klok aan boord met 3 toestanden + atmosferische weerstand van Mars) dat **baanbepaling in een lage Marsbaan (LMO) tot ≈ 0.2 m** doet in een synthetische gesloten lus; een gezamenlijke schatter voor **eenweg- + tweewegfusie**; een dynamicakern voor meerdere lichamen (`Body{μ, re, zonals, gravity, IAU-pole}`, zwaartekracht van Mars GMM-3 (Goddard Mars Model 3), een IAU-lichaamsvast Marsstelsel, een inplugbare `EphemerisProvider`-naad, tweedelige juliaanse datums + TT↔TDB (Barycentric Dynamical Time)); en het relay-PNT-scenario **`mars-pnt`** (een MARCONI-constellatie van areostationaire relaissatellieten) met een end-to-end **GSE-prestatiesimulator** (GSE = grondondersteuningsapparatuur) (geometrie → linkbudget → waarneembare grootheden → SRIF → covariantie). **Gevalideerd in simulatie** (covariantie / prestatiecijfers in gesloten lus); de door de Zon gedomineerde Marsdynamica is kruisgecontroleerd tegen JPL **DE440** (137 m bij een boog van 1 dag, `xval/anise-mars-od`). Validatie met echte DSN/ESTRACK-volgdata staat op de roadmap. |
| **Zonnestelsel en PNT rond elk hemellichaam** | Een kernelvrije **efemeride voor het hele zonnestelsel** (`src/ephem.rs`, `src/ephem_provider.rs`): elke planeet uit de **Kepler-elementen van Standish** van JPL (Tabel 1, 1800–2050 n.Chr.; Tabellen 2a/2b, 3000 v.Chr.–3000 n.Chr.) met de gepubliceerde nominale fout van elke planeet, de Aarde en de Maan gescheiden via de maanreeks, en Phobos, Deimos, Io, Europa, Ganymedes, Callisto en Titan uit gemiddelde elementen van JPL en het IAU-rotatiemodel (International Astronomical Union); **elk lichaam ten opzichte van elk ander** in het ICRF (International Celestial Reference Frame). `Body` bevat nu **GM (gravitatieparameter), stralen, J2 (de tweede zonale harmonische) waar gepubliceerd en de IAU-pool en nulmeridiaan voor achttien lichamen**. Het type **`solar-system`** rapporteert posities, snelheden, constanten, **lichttijd en een-/tweewegsafstand** tussen elke twee lichamen (de bestaande radiometrische lichttijdoplosser, met de Shapiro-vertraging van de zon) en een baanspoor per lichaam — genoeg om een interactief zonnestelsel te tekenen; het type **`body-pnt`** positioneert een orbiter of lander **rond elk hemellichaam** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) met een lokale Walker-constellatie, het mechanisme voor precisieverdunning en Gauss–Newton, en een diepe-ruimteafstand vanaf de Aarde. **Gevalideerd** tegen JPL Horizons (DE441, JPL Development Ephemeris 441): Mercurius–Saturnus en de Aarde uit Tabel 1 binnen tweemaal de nominale fout (slechtste 1.87×), alle acht planeten uit Tabellen 2a/2b (slechtste 1.71×), en de lichttijd Aarde–Mars/Jupiter. **Modelled**: Uranus en Neptunus uit Tabel 1 (2.0× en 5.2× de vermelde fout tegen DE441), Pluto, de manen, en de navigatieresultaten van `body-pnt`. |
| **Gefuseerde MEO + LEO-PNT** | `src/leo_fusion/`: systeemonafhankelijke LEO-positiebepaling, -navigatie en -tijdsynchronisatie over elke constellatie (Walker-schillen, elementsets, GNSS-voorinstellingen) en elk signaal (draaggolf, chipsnelheid, C/N0-envelop, signal-in-space-afstandsfout), met optionele voorinstellingen in één bestand die hun bronnen vermelden (Xona Pulsar X1/X5, Iridium STL, Starlink signals of opportunity, CentiSpace, een representatief C-bandsysteem, het ATOMIC-efemeridemodel zonder klok). **`leo-pvt`**: batch-**dopplerpositiebepaling** uit afstandsverandering (één en meerdere satellieten, toestanden voor klokdrift en snelheid, geometrie langs/dwars op het spoor bij één overgang en de spiegeloplossing), **gezamenlijke gewogen kleinste kwadraten GNSS + LEO** met inter-systeembiases per systeem en door de aanroeper opgegeven sigma's per signaal, de DOP tegen het aantal LEO-satellieten, **polaire en Arctische** dekking, en **LEO-tijdoverdracht naar UTC** tegen C/N0 en de oscillator. **`leo-ppp`**: een zwevende PPP-EKF (precise point positioning; extended Kalman filter) met alleen GNSS en met LEO, de convergentietijd en een chikwadraat-NEES-consistentietest. **`ntn-positioning`**: positiebepaling in 5G-niet-terrestrische netwerken uit de Cramér-Rao-grens van de bandbreedte. **Gevalideerd**: de LEO-dopplerenvelop tegen de gepubliceerde cijfers van Iridium en Xona. **Modelled**: de rest, met de PPP-trend vergeleken met Li et al. (2019) — zie [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Integriteit** | RAIM — receiver autonomous integrity monitoring — met momentopname en oplossingsscheiding (in ARAIM-stijl), met horizontale/verticale beschermingsniveaus (HPL/VPL), foutdetectie en -uitsluiting, en Stanford-integriteitsdiagrammen; een beschermingsniveau met expliciet integriteitsrisicobudget via **multiple-hypothesis solution separation (MHSS)**, inclusief de **constellatiebrede foutmodus voor twee/meerdere constellaties** (EU (Europese Unie) ARAIM / DO-316, de RTCA-prestatienorm voor GPS-boordapparatuur met vliegtuiggebaseerde augmentatie), beproefd op een echte GPS + Galileo-momentopname (`scenarios/araim-gps-galileo.toml`). Het beschermingsniveau past per foutmodus de eenzijdige **nominale-bias**-projectie `b_k = Σ_i|s_i|·b_nom` toe en de **integriteits**sigma σ_URA (user range accuracy; verschillend van de nauwkeurigheids-σ_URE, user range error) uit het Integrity Support Message — zie [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). De detectiekernel (de χ²/niet-centrale-χ²/normale drempels en K-vermenigvuldigers) is **extern gevalideerd tegen SciPy** over 171 gevallen (`tests/raim_reference.rs`); de geometrie hergebruikt de met gnss_lib_py gevalideerde DOP-kernel. De ARAIM MHSS-*toewijzing van het integriteitsrisicobudget* zelf heeft geen gepubliceerde numerieke onafhankelijke referentie en blijft eerlijk Modelled. |
| **Augmentatie (SBAS)** | **SBAS / WAAS-beschermingsniveaus** (WAAS = het Wide Area Augmentation System) in de gewogen-kleinste-kwadratenvorm van DO-229E (K-factoren voor precisienadering en en-route) en de **ionosfeervrije L1/L5-tweefrequentie**combinatie (L1 en L5 zijn twee civiele GPS-signaalbanden; IS-GPS-705, de GPS-interfacespecificatie voor het L5-signaal, γ₁₅ ≈ 1.793) die DO-316 onderbouwt — `src/sbas.rs`. Het algoritme voor het beschermingsniveau is **extern gevalideerd tegen de RTKLIB SBAS-PL-fork** (RTKLIB = de open bibliotheek voor real-time-kinematische positiebepaling; PL = beschermingsniveau) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — de vorige revisie van DO-229 — App. J) gedraaid op **echte EGNOS-data** (European Geostationary Navigation Overlay Service), waarbij de HPL wordt gereproduceerd tot < 2e-3 m (`tests/sbas_reference.rs`); gLAB (de GNSS Laboratory-toolsuite) v6.0.0 bevestigde dezelfde conventie. |
| **Klok en tijdsynchronisatie** | Kalman-holdover met twee toestanden (covariantie in Joseph-vorm, consistentiegezondheid via NIS/NEES — genormaliseerde gekwadrateerde innovatie / genormaliseerde gekwadrateerde schattingsfout); stabiliteit uit de Allan-familie (ADEV / MDEV / TDEV / HDEV / MTIE — Allan-, gemodificeerde Allan-, tijd- en Hadamard-deviatie, en maximale tijdintervalfout) met betrouwbaarheidsintervallen per ruistype en een volledige **IEEE-1139-machtswetfit met vijf coëfficiënten** (IEEE Std 1139, de definities voor frequentie- en tijdmetrologie van het Institute of Electrical and Electronics Engineers) — de schatters zijn gevalideerd op echte hardware tegen **Stable32**: een **echte 5071A-cesiumprimaire standaard tegen een waterstofmaser** (556,990 fasesamples, 16 middelingsfactoren, OADEV/OHDEV — overlappende Allan-/Hadamard-deviatie — tot 1e-3; `tests/cs5071a_reference.rs`) en de **canonieke Stable32 PHASE.DAT**-regressiereeks (139 middelingsfactoren, OADEV/MDEV/TDEV tot 1e-3; `tests/phasedat_reference.rs`); de ADEV/MDEV/TDEV-schatters en de telecom-**MTIE**-wandermetriek zijn daarnaast kruisgecontroleerd tegen de **onafhankelijke bibliotheek allantools 2024.06** tot **< 1e-9** op de NIST SP 1065-reeks (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); geometrische correcties (Sagnac, GNSS common-view); en de operationele overdrachtsmethoden — **TWSTFT** (tweeweg tijd- en frequentieoverdracht via satelliet) met de Sagnac-formule in gesloten vorm van het BIPM (International Bureau of Weights and Measures), **GNSS common-view**, ionosfeervrije **PPP**-tijdoverdracht (precise point positioning), een **optische** vrije-ruimteverbinding met turbulentiescintillatie, en een **klokensemble-tijdschaal (papieren tijdschaal)** met inverse-variantieweging onder de beste bijdragende klok. Een **calculator voor klok-holdover zonder GNSS** (`src/holdover.rs`) maakt de groei van de vrijloopfout in gesloten vorm volgens van Loan beschikbaar als inversie *holdover tot drempel* — hoe lang een klok vrij loopt voordat de tijdfout het budget overschrijdt — over representatieve klassen van klassieke en kwantumklokken; **modelled** (kruisgecontroleerd tegen de meerstaps-covariantierecursie van `clock_state`), en eerlijk over het feit dat voor een zeer stabiele klok de holdover tot een krappe drempel wordt bepaald door de *aangenomen* ruisvloer bij lange tau, niet door de aangehaalde ADEV. Een **voorwaardelijk Timing Protection Level** (`src/tpl.rs`) breidt holdover uit naar spoofing: een grens op de *onopgemerkte* tijdfout, gegeven een onafhankelijke kruiscontrole, die een k-sigma-monitorvloer, de vrijloopvariantie volgens van Loan over de detectielatentie en een CUSUM-alarmtijd (cumulatieve som) combineert. Gekalibreerd op een echte opgenomen spoof (JammerTest 2024) en reproduceerbaar via `cargo run --example tpl_jammertest`; **MODELLED** samenstelling (geen integriteitsrisicobudget per uur), voorwaardelijk op detectie — er is geen eindige *onvoorwaardelijke* grens. |
| **GNSS-meetdomein** | Voorwaartse synthese van pseudoafstand / doppler met **Klobuchar** (uitgezonden) en **IONEX / TEC-raster** (IONosphere map EXchange format / totale elektroneninhoud; gemeten) ionosfeer — inclusief een IONEX-bestandsparser, tijdinterpolatie tussen kaarten en de dunne-schil-afbeelding voor schuine obliquiteit — **Saastamoinen + Niell**-troposfeer, en RAIM met momentopname (HPL/VPL). |
| **Weerbaarheid** | Linkbudget-**jamming** (J/S → effectieve C/N₀ → verlies van lock — jammer-signaalverhouding, draaggolf-ruisdichtheidsverhouding — met de anti-jam spectrale scheidingsfactor `Q` die nu **is afgeleid uit de werkelijke vermogensspectra van signaal en jammer** via `src/navsignal.rs` — `Q = 1/(R_c·κ)`, in CI kruisgecontroleerd tegen de vorige representatieve constante); een stochastische **tijdspoofdetector** (Neyman–Pearson / χ²₁-energietest met P_fa/P_md in gesloten vorm en via Monte Carlo en een beveiligingsprestatiecijfer (FoM) van 1 − P_md); en een **meerlaagse spoofdetector** die een RAIM-consistentiepariteitstest (met de gemeenschappelijke blinde vlek eerlijk gemodelleerd), een RF-AGC-vermogensmonitor (automatische versterkingsregeling) en een signaalkwaliteitsmonitor (SQM — signaalkwaliteitsbewaking, early-minus-late) fuseert; en een **foutbudget voor kwantuminertiaal gegist bestek** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`) dat de witte-ruissnelheids-random-walk van de koude-atoominterferometer combineert met resterende bias (kruisgecontroleerd tegen de onafhankelijke `AccelModel`-integrator) en schaalfactorfout tot een cijfer voor positiedrift over de holdover — de inertiale tweeling van de klok-holdover. Een **op een kader afgestemde engine voor weerbaarheidsscores** (`src/resilience/`) zet het gesimuleerde gedrag van een architectuur om in subscores per dimensie over de eigen zeven weerbaarheidscategorieën van Kshana (geen DHS-termen), afgestemd op het Resilient PNT Conformance Framework van het US Department of Homeland Security, en bestudeert vervolgens de **beslissingsstabiliteit** van elke samengestelde score of elk volwassenheidsniveau onder een Dirichlet-wegingssimplex en een ensemble van vijf dreigingen — Kendall-τ-rangonstabiliteit, wisselfrequentie van de top-1-winnaar, en gemeenschappelijke **diversiteitsinstorting** (Hill-N2), met een borgingsrapport met integriteitshash (35 met de hand afgeleide tests met onafhankelijke referentie). Reproduceerbaar via `cargo run --example resilience_report`; **MODELLED** synthetische architecturen, een zelfbeoordeling afgestemd op RPCF v2.0, **geen** certificering. Zie [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Passieve RF-geolocatie** | **TDOA/FDOA-geolocatie van bronnen** (tijd-/frequentieverschil van aankomst; `src/geolocation.rs`) — lokaliseer een jammer of spoofer (of een opportunistische bron voor omgekeerde PNT) uit hyperboloïden van **tijdsverschil van aankomst** over een ontvangernetwerk, opgelost met Gauss–Newton-kleinste kwadraten; het toevoegen van **frequentieverschil van aankomst** met bewegende ontvangers herstelt gezamenlijk de positie *en* snelheid van de bron, met de **Cramér–Rao**-grens op de positiecovariantie afgeleid uit de netwerkgeometrie. **MODELLED** (onafhankelijke referenties voor interne consistentie: heen-en-terug voorwaarts→invers, de identiteit J·CRLB = I, GDOP-monotonie, en de schatter die onder Monte Carlo zijn eigen CRLB bereikt) — een zichtlijnmodel met puntbron, zonder termen voor multipad / NLOS (geen zichtlijn), klokbias van de ontvanger of refractie. |
| **Navigatiesignaal en codevolging** | Het **signaalniveau** tussen het linkbudget en het meetdomein (`src/navsignal.rs`): **spectrale vermogensdichtheden** (PSD's) met eenheidsoppervlak voor **BPSK-R(n)** (binaire faseverschuivingsmodulatie met rechthoekige chips) en **sine-BOC(m,n)** (binary offset carrier); de **spectrale scheidingscoëfficiënt** (SSC) κ = ∫ G_s·G_i df, die de **anti-jam-`Q` afleidt** die het jammingmodel gebruikt (`Q = 1/(R_c·κ)`) uit de werkelijke spectra van signaal/jammer in plaats van een representatieve constante; de **RMS-bandbreedte (Gabor)** (BOC > BPSK — de maat voor afstandsinformatie / Cramér–Rao); de **thermische-ruisjitter van coherente early–late DLL-codevolging** (DLL = delay-lock loop; Kaplan & Hegarty; ~onder een meter voor C/A — de grove/acquisitiecode van GPS — bij 45 dB-Hz); en de **multipadfoutenvelop** (coherente EML, early-minus-late — onderdrukking met smalle correlator). Gevalideerd tegen ankers in gesloten vorm (BPSK-zelf-SSC = 2/(3·R_c), PSD's met eenheidsoppervlak, C/A-jitter onder een meter). Dit is analyse van signaal**prestaties**, **geen** ontwerp van antenne- / RF-payloadhardware (de rol van een payloadpartner). |
| **Interoperabiliteit** | Inlezen van multi-GNSS-uitgezonden efemeriden in **RINEX-3** (GPS, Galileo, QZSS — het Japanse Quasi-Zenith Satellite System —, BeiDou MEO/IGSO — middelhoge aardbaan / hellende geosynchrone baan — via IS-GPS-200, de GPS-interfacespecificatie; GLONASS, het Russische Global Navigation Satellite System, via PZ-90 — het Russische datum Parametry Zemli 1990 — RK4 op toestandsvectoren), bruikbaar als constellatiebron (RINEX erin, PNT-geometrie eruit); een **RINEX-3**-observatieparser (pseudoafstand, draaggolffase, doppler, signaalsterkte; de observatie-indeling van 4.00 zou naar verwachting geparseerd moeten worden maar is niet getest, en RINEX 4-navigatiebestanden worden op naam geweigerd in plaats van verkeerd gedecodeerd) die nu **een single-point-positioning-oplosser (SPP) voedt** (`pvt`) — echte codewaarnemingen erin, een echte **ontvangerpositie** eruit, gevalideerd op IGS-data; een lezer/schrijver voor precieze efemeriden in **SP3-c/d** met Lagrange-interpolatie van de 9e orde; en export naar **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) voor vluchtdynamicatools (GMAT, Orekit, STK — Systems Tool Kit); en parseren + uitgeven van **CCSDS-TDM (503)**-volgdataberichten voor radiometrische volging in de diepe ruimte. |
| **Missieanalyse (systems engineering)** | Missieontwerpbudgetten van eerste orde, elk een uitvoerbaar type: tweelichamen-**lanceer- en opstijggeometrie** (`launch-window` — lanceerazimut `sin Az = cos i/cos lat`, minimale inclinatie, bonus van de aardrotatie, Δv voor dogleg-vlakverandering, dagelijkse mogelijkheden; `src/launch.rs`); een **ballistische terugkeercorridor volgens Allen–Eggers** (`reentry` — piekvertraging, snelheid/hoogte bij piek-g, snelheid bij piekverhitting; `src/reentry.rs`); **dekkingsgeometrie voor aardobservatie** (`eo-coverage` — strook / GSD in nadir (grondsample-afstand) / toegang buiten nadir / herbezoek via de ruimtedriehoek van SMAD (*Space Mission Analysis and Design*); `src/eo_payload.rs`); een **attitude- en richtfoutbudget met 3 vrijheidsgraden** (`attitude-budget` — zwaartekrachtgradiëntkoppel in het slechtste geval + richtbudget met RSS (kwadratische optelling); `src/attitude_budget.rs`); **voorspelling van grondstationpassages** (`passes` — AOS/TCA/LOS, signaalacquisitie / tijdstip van dichtste nadering / signaalverlies, maximale elevatie, toegangstijd; `src/passes.rs`); en een **eenweg-linkbudget** over de linkvergelijking van CCSDS 401 / DSN 810-005 (de CCSDS-norm voor radiofrequentie en modulatie / het handboek voor linkontwerp van het Deep Space Network; `link-budget` — FSPL (vrije-ruimteverlies), C/N₀, Eb/N₀ (energie-per-bit-ruisdichtheidsverhouding), marge, sluiting; `src/linkbudget.rs`). **MODELLED** analytische budgetten van eerste orde — de laag vóór de hardware onder STK/GMAT/Basilisk, geen vervanging voor 6-DoF- of radiometrische analyse. |
| **Beslissingsanalyse en afweging (MCDA)** | Een volledige suite voor **multicriteria-beslissingsanalyse** (MCDA) (`src/mcda/`) die alle vier methodefamilies bestrijkt — waardeaggregatie (**WSM**, **WPM**, **WASPAS** — weighted sum model, weighted product model, weighted aggregated sum product assessment), afstand tot het ideaal (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), compromisprogrammering (**VIKOR**, uit het Servisch voor multicriteria-optimalisatie en compromisoplossing), en outranking (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, uit het Frans voor eliminatie en keuze die de werkelijkheid uitdrukt), plus het ratiosysteem **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) en het proportionele **COPRAS** (Complex Proportional Assessment) — met prioriteitsweging via paarsgewijze vergelijking volgens **AHP** (Analytic Hierarchy Process) (Consistency Ratio), een niet-gedomineerd **Pareto**-front, **gevoeligheids**analyse van gewichten, en multi-attribuut-**nut**scoring. De negen aggregators reproduceren de onafhankelijke bibliotheken van derden **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) en **pyDecision** (ELECTRE I, COPRAS) tot **< 1e-9**, en de AHP-prioriteitsvector + Consistency Ratio komen overeen met de Random-Index-tabel van Saaty en de principale eigenoplosser van SciPy/LAPACK tot < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — de beslislaag onder de engine voor afwegingsstudies. |
| **Ruimteomgeving** | Een **model voor de ruimteweeromgeving** (`space-weather`, `src/space_weather.rs`): activiteitsindices voor de zon (F10.7 / gecentreerd-81-daags F10.7a — de radioflux van de zon op 10.7 cm) en geomagnetisme (Kp, de planetaire K-index, met de definitietabel Kp↔ap — ap is de lineaire planetaire amplitude), de exosferische temperatuur volgens **Jacchia-1971** die ze aansturen (gevalideerd tegen gepubliceerde zonne-min/gemiddelde/max), en de voor activiteit gecorrigeerde tegenover de statische thermosferische neutrale dichtheid op hoogte — de afhankelijkheid van de dichtheid van de zonnecyclus die de statische USSA76-atmosfeer (US Standard Atmosphere 1976) weglaat. **MODELLED**: een gekalibreerde schaalhoogtekoppeling van eerste orde, **geen** met data gevalideerde atmosfeer (NRLMSISE — het US Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Exosphere-model). |
| **Evaluatie en afweging van AI/ML** | Een **testomgeving voor de evaluatie van RF-verstoringsdetectie** (`impairment-eval`, `src/impairment_eval.rs`): een gelabeld, op parameters gebaseerd **synthetisch** corpus (nominaal / jamming / spoof-tijd / spoof-positie / multipad), een detectoronafhankelijk **ROC/AUC**-harnas (receiver operating characteristic / oppervlak onder de curve) dat elke detector scoort (energy \| agc \| sqm \| parity \| fused) met Pd per klasse (detectiekans) bij een doel-Pfa (kans op vals alarm), en de **optimismekloof** binnen tegenover buiten de verdeling (modus voor verdelingsverschuiving). Plus een **afweging van kwantum- tegenover klassieke PNT** (`quantum-trade`, `src/quantum_trade.rs`) die het holdovervoordeel voor tijd/inertie van een kandidaatklok kwantificeert uit een **gemeten ADEV**-curve tegenover een klassieke basislijn, met het voorbehoud over de vloer bij lange τ meegedragen op het artefact en een envelop van weerbaarheid tegen tijd zonder GNSS. De evaluatie**metrieken** (AUC / confusie / Pd-Pmd, waarbij Pmd de kans op gemiste detectie is) zijn **gevalideerd tot een exacte overeenkomst met scikit-learn 1.9.0** — ook op **echte ESA OPS-SAT-telemetrie** (de OPSSAT-AD-dataset voor anomaliedetectie, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Naamsvermelding 4.0), waar de Mann–Whitney ROC AUC van Kshana de `roc_auc_score` van scikit-learn reproduceert tot < 1e-9 op de achtergehouden testsplitsing en een transparante piektellingsdetector de gelabelde anomalieën scheidt met AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`) — en de numerieke **kernels** van de afwegingsengine (ADEV-NNLS-fit — niet-negatieve kleinste kwadraten —, χ²-consistentiebanden, van-Loan-klok-Q) **tegen scipy 1.17.1**; de daarop gebouwde apparaatvoordeelcijfers blijven **MODELLED** bedrijfskarakteristieken — nooit veld-/IQ-data (in-fase/kwadratuursamples), geen oordeel goed/slecht. Voortbouwend op de testomgeving scoort een diepere **studie van de optimismekloof** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) een panel van **13 detectoren** (energy/AGC/SQM/parity plus geseede detectoren met logistische regressie en een MLP met één verborgen laag — multi-layer perceptron), fit **schaalwetten** binnen tegenover buiten de verdeling met een permutatienulhypothese, en leert een **leave-one-out-voorspeller** van degradatie buiten de verdeling uit statistieken binnen de verdeling (`cargo run --example optimism_study`). Een **front-end voor softwaregedefinieerde ontvangers** (`src/sdr.rs` — ruwe IQ/IF (middenfrequentie) → correlatortaps early/prompt/late → SQM) en **adapters voor het inlezen van echte data** (`src/realdata/` — RINEX, u-blox UBX (het binaire u-blox-protocol), GnssLogger, JammerTest, Yunnan, SatGrid) laten dezelfde detectoren draaien over lokaal aangeleverde opnamen (er worden geen datasets vastgelegd). De **kruispuntkaart van kwantum- tegenover klassieke weerbaarheid** onder parameteronzekerheid (`src/crossover.rs`; `cargo run --bin crossover_study`) genereert de inertiale en klokkruispuntstudies achter de figuren onder Resultaten opnieuw. |
| **Demonstrator voor kwantumondersteunde PNT** | Drie uitvoerbare, **MODELLED** toepassingsgebieden achter de open engine, die elk eerlijke `TradeEvidence` uitgeven + een record over representativiteit / kloven tot vlucht (`src/representativeness.rs`): **vertrouwde kwantumtijdoverdracht** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — een end-to-endbudget van optische roosterklok + fotonische link tegenover CSAC (atoomklok op chipschaal) + RF-tweeweg, met een hergebruikt timing protection level, een beveiligings-FoM tegen vertragings-/replay-aanvallen (1 − P_md), en klokanomaliedetectie + CUSUM-latentie); **kwantumnavigatie zonder GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — een inertiale vrijloop met koude-atoominterferometer tegenover een INS van navigatiekwaliteit over een GNSS-uitval, eerlijk over het feit dat zonder externe positiebepaling de bias van de versnellingsmeter niet waarneembaar is, zodat de fout nog steeds groeit); en **fout-/anomaliedetectie** in kwantumsystemen (`quantum-anomaly-detect`, `src/quantum_faults.rs` — een gelabelde foutcatalogus met een ROC AUC met bootstrap-BI (betrouwbaarheidsinterval) uit de extern gevalideerde `eval_stats` en een minimaal detecteerbare fout bij een vaste kans op vals alarm). Een gedeelde **bibliotheek met foutmodellen voor kwantumapparaten** (`src/quantum_devices.rs`) en een uniform **harnas voor kwantum- tegenover klassieke afweging** (`src/qtrade.rs`) onderbouwen ze. De gevalideerde kernels waarop ze rusten (evaluatiemetrieken tegen scikit-learn, afwegingskernels tegen scipy) worden hergebruikt; de daarop gebouwde apparaatvoordeelcijfers blijven **MODELLED** — **illustratieve parameters uit openbare bronnen** voor apparaat/link, modelleert de *klasse*, geen TRL / vluchtheritage / certificering, geen onderschrijving door een agentschap. |
| **Zuinige engineering en integriteitsimpact** | Een **ROI-lens voor kosten per dekking** (rendement op investering) (`src/frugal.rs`) — kosten per eenheid geleverde dekking voor een architectuurafweging — en een afbeelding **gemiste detectie → integriteitsimpact** (`src/integrity_impact.rs`) die het gemiste-detectiepercentage van een monitor omzet in zijn bijdrage aan het integriteitsrisico. **MODELLED** budgetten voor beslissingsondersteuning, additief. |
| **Artefactuitwisseling** | Het **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — een geversioneerde, zelfbeschrijvende envelop die een scenarioresultaat omhult met zijn type, schemaversie en MODELLED/VALIDATED-labels, zodat een opgeslagen artefact zichzelf documenteert en oudere enveloppen voorwaarts compatibel leesbaar blijven. |

Elke mogelijkheid is bereikbaar als Rust-API, als uitvoerbaar scenario-`kind`, of beide.
De volwassenheid per mogelijkheid — *validated*, *runnable* of *library* — wordt bijgehouden in
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). Een **machinaal gecontroleerde verificatiematrix**
(`src/verification.rs`) geeft de kruisverwijzing eis → module → test → onafhankelijke referentie → status
weer, met met unittests bewaakte eerlijkheidsinvarianten die een label *validated*
alleen toestaan waar een onafhankelijke **externe** referentie het ondersteunt — en die de
hardware-/PA-mogelijkheden (productborging) vastleggen die Kshana bewust **niet** levert.

</details>

<details>
<summary>De vier sensorpakketten, zoals eerst gepubliceerd (resultaten)</summary>

### Resultaten

Elk scenario vergelijkt een kwantumsensor met zijn klassieke tegenhanger tijdens een
GNSS-uitval van ~1.8 h. De getallen zijn reproduceerbaar (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Wat kwantumsensoren opleveren wanneer GNSS weg is, klok-holdoverscenario: kwantum houdt 6600 s autonomie vast tegen 2610 s klassiek, een veel lagere tijdfout, en 100% tegen 95.6% beschikbaarheid" width="88%">
  <br><sub>Wat kwantumsensoren opleveren wanneer GNSS weg is — <code>clock-holdover</code> · seed 42 · getekend met engine 0.40.0, en elk cijfer hierboven bij elke build opnieuw gecontroleerd tegen de huidige engine door <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Het voordeel is **afhankelijk van uitval en trillingen**, met een expliciet omslagpunt waar klassiek wint — eerlijk getoond over de ladder van technologische gereedheid (cijfers voor optische klokken zijn doelen van demonstratoren op de grond; er heeft nog geen optische strontiumklok gevlogen):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Kruispunt van kwantum- tegenover klassieke klok-holdover over de ladder van technologische gereedheid, met betrouwbaarheidsbanden" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Heatmap van het inertiale voordeel van kwantum tegenover klassiek over uitvalduur en trilling, met een omslagcontour waar klassiek wint" width="96%">
  <br><sub>Kruispunt van kwantum- tegenover klassieke weerbaarheid — TRL-ladder voor klok-holdover (boven) · kaart van het inertiale voordeel met omslagcontour (onder). Opnieuw te genereren via <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Inertiaal gegist bestek: positiefout tijdens een GNSS-uitval — de kwantumsensor (koude atomen) blijft dicht bij de specificatielijn terwijl de sensor van navigatiekwaliteit afwijkt tot tientallen kilometers" width="80%">
  <br><em>Positiefout van gegist bestek tijdens een GNSS-uitval: de kwantumsensor (blauw)
  blijft vlak bij de specificatie; de klassieke sensor (rood) wijkt af tot tientallen kilometers.
  Gegenereerd door Kshana uit <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Pakket | Scenario | Kwantum | Klassiek |
|------|----------|---------|-----------|
| **1 — Klok-holdover** | `clock-holdover.toml` (specificatie 20 ns) | optische klok houdt de volledige uitval vol | CSAC overschrijdt de specificatie halverwege de uitval |
| **2 — Inertiaal gegist bestek** | `imu-deadreckoning.toml` (specificatie 100 m) | koude atomen: **~41 m**, houdt de volledige uitval vol | navigatiekwaliteit: overschrijding na **~350 s** → tientallen km |
| **3 — Tijdoverdracht** (optische verbinding tussen satellieten) | `timetransfer.toml` | optisch: **~0.3 mm** afstandsmeting | RF (TWSTFT): **~150 mm** afstandsmeting |
| **4 — Hybride fusie** (sluitstuk) | `hybrid-pnt.toml` | volledige positie + tijdsynchronisatie gedurende de hele uitval | **positiebeperkt na ~350 s** |

Het sluitstuk toont de fusiethese: optische tijdoverdracht tussen satellieten houdt zelfs
een klassieke *klok* vergrendeld, waardoor de *inertiale* sensor overblijft als de zwakke schakel
van de klassieke suite — dat wil zeggen kwantuminertie + optische tijdsynchronisatie samen.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Klok-holdover: fasefout tijdens een GNSS-uitval — de optische klok blijft de hele uitval binnen de specificatie van 20 ns terwijl de klok op chipschaal die halverwege de uitval overschrijdt" width="80%">
  <br><em>Klok-holdover tijdens een GNSS-uitval: de optische klok (blauw) blijft binnen de
  specificatie van 20 ns gedurende de volledige vrijloop; de klok op chipschaal (rood) overschrijdt die halverwege.
  Gegenereerd door Kshana uit <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Een verder scenario, `orbit-gnss-challenged.toml`, leidt de GNSS-beschikbaarheid af uit
**baangeometrie** in plaats van met de hand geschreven vensters: een ruimtevaartuig binnen de GNSS-
schil wordt gepropageerd tegen een GPS-achtige Walker-constellatie, en het aantal zichtbare satellieten
(zichtlijn, aardbedekking, elevatiemasker) bepaalt bij elke stap de toestand van de positiebepaling.
Over een dag heeft de gebruiker slechts ~59% van de tijd een positiebepaling; de kwantumklok houdt een
tijdoplossing van 5 ns vast door elke onderbreking (beschikbaarheid **1.0**), de klok op chipschaal
slechts **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Baan met beperkte GNSS: tijdfout van de klok over een dag voor een ruimtevaartuig binnen de GNSS-schil, waarbij de dekkingsonderbrekingen zijn afgeleid uit de baangeometrie — de optische klok blijft over de onderbrekingen binnen de specificatie van 5 ns terwijl de klok op chipschaal die overschrijdt" width="80%">
  <br><em>Tijdfout over een dag met GNSS-beschikbaarheid afgeleid uit baangeometrie: het
  aantal zichtbare satellieten (zichtlijn, aardbedekking, elevatiemasker) bepaalt bij elke stap de toestand
  van de positiebepaling, dus de klok moet elke onderbreking overbruggen — de optische klok haalt de specificatie van 5 ns
  terwijl de klok op chipschaal die overschrijdt. Gegenereerd door Kshana uit
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

De constellatie kan ook worden opgegeven als echte two-line element sets (TLE's). Een *volledige* TLE
(regel 1 + regel 2) wordt gepropageerd met het volledige **SGP4/SDP4**-model — inclusief
atmosferische weerstand en de lunisolaire termen voor de diepe ruimte en de resonantietermen van 12 h / 24 h die
ertoe doen voor GNSS-banen van ~12 h — gevalideerd tegen de officiële AIAA 2006-6753-vectoren
tot in het slechtste geval ≈ 4 mm. `scenarios/orbit-sgp4-gps.toml` levert een **echte Celestrak
`gps-ops`-momentopname** van de operationele GPS-constellatie (2021-07-28, 30 satellieten)
en vereist geldige TLE-controlesommen — two-line element sets zijn open data uit de catalogus van de US
Space Force / 18th Space Defense Squadron, herverdeeld door Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); vernieuw met
`scripts/fetch_tles.sh`. Een blok met alleen regel 2 behoudt
de analytische tweelichamenpropagatie (`scenarios/orbit-real-tle.toml`); de twee vormen kunnen
in één constellatie worden gemengd. Een constellatie kan evengoed worden gebouwd uit een blok
**RINEX-3 GPS-uitgezonden efemeride**-records — het formaat dat een ontvanger decodeert —
gepropageerd met het gebruikersalgoritme van IS-GPS-200 en door dezelfde geometrie gevoerd
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Wat het is / niet is, volledig</summary>

<a id="what-it-is--is-not"></a>
### Wat het is / niet is

**Het is:** een deterministische engine met weinig afhankelijkheden die de PNT-stack bestrijkt — baan-
geometrie, inertiale navigatie, GNSS/INS-fusie, integriteit, klokken en tijdsynchronisatie. Het
draait een scenario (vaak een GNSS-uitval), laat gekalibreerde sensorfoutmodellen evolueren
door de passende schatter, en scoort het resultaat tegen de operationele
prestatiecijfers — en geeft een reproduceerbaar JSON-resultaat (JavaScript Object Notation) en een SVG-grafiek uit, vanuit een
Rust-bibliotheek, een opdrachtregelinterface (CLI), een Python-extensie, een WebAssembly-module in de browser, een
**Model Context Protocol-server (MCP)** voor AI-agents, of een **plug-in voor JetBrains-IDE's (geïntegreerde
ontwikkelomgevingen)**.

**Het is niet:** vluchthardware, een ontwerp voor een kwantumpayload, een volledige GNSS-signaal-
ontvanger, een radiofrequente (RF) signaalsimulator of hardware-in-the-loop-opstelling, of een
gecertificeerd avionicaproduct — en het vervangt MATLAB/Simulink, STK (Systems Tool
Kit) of Orekit niet; het staat ernaast en wisselt bestanden met ze uit. De getrouwheid van kwantumhardware komt uit
gepubliceerde foutmodellen, niet uit deze tool. De gedetailleerde volwassenheid van elke
mogelijkheid is gedocumenteerd in [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Het is (nog) niet:** een *volledige* fysica-engine voor atoominterferometrie (de meeste kwantumsensoren
gebruiken gepubliceerde coëfficiënten van Allan-/ruisbudgetten; de CAI-versnellingsmeter (koude-atoominterferometer) heeft een
laag vanuit eerste principes — Mach–Zehnder-fase, projectieruis, contrastverval en
trillingskoppeling, plus systematische effecten van Coriolis en lichtverschuiving — maar systematische effecten van het golffront en
het oplossen van franjeambiguïteit blijven een roadmaplaag **P2** (roadmapfase 2, de laag voor kwantumfysica),
zie [`ROADMAP.md`](ROADMAP.md) en [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
een gecertificeerde of hardware-GNSS-ontvanger (het berekent een single-point-**PVT**-positie (positie, snelheid en tijd)
uit echte codewaarnemingen in RINEX (Receiver Independent Exchange Format) — gevalideerd
op echte IGS-data (International GNSS Service) — en de IQ-laag (`kshana iq`, sinds 0.31.0)
acquireert en volgt opgenomen of gegenereerde basisbandsamples in software, als analyse-
ontvanger: het stuurt geen radiohardware aan en zendt niet uit, is geen gecertificeerde ontvanger, en doet
geen positiebepaling op draaggolffase (RTK of PPP)); of een volledige suite voor missieontwerp (het heeft bouwstenen voor Lambert / porkchop /
manoeuvres / baanbepaling, maar is de laag voor prestatiesimulatie
*boven* GMAT (General Mission Analysis Tool)/Orekit, geen vervanging). Deze afbakening is bewust. Als u foutbudgetten
voor koude-atoominterferometers vanuit eerste principes nodig hebt (bijv. van CARIOQA-PMP-niveau — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — of validatie in X-37B-stijl), zie
de P2-roadmap en [neem contact op](#support--professional-services) om samen te werken.

</details>

### Navigatie in lage aardbaan

Satellieten in lage aardbaan (LEO) komen snel en luid voorbij. Het type `leo-pnt-chain` volgt één
systeem door elke stap: het signaal, de overgang en de link, het navigatiebericht, en
de gefuseerde positie-, snelheids- en tijdbepaling (PVT) en precise point positioning (PPP). Elke
stap geeft zijn getallen door aan de volgende. Zie [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="De LEO-PNT-keten uit een echte run van leo-pnt-chain (leo-pnt-end-to-end.toml): de signaalstap (generic-l op 1191.795 MHz, pilot gevolgd met 10.23 Mchip/s) geeft door aan de overgangsstap (1080 km, piek van gevolgde C/N0 58.2 dB-Hz), die doorgeeft aan het navigatiebericht (kepler-rac, fit van 300 s, representatie-SISRE 0.91 mm RMS, 0.250 m met baanbepaling), dat de gefuseerde positiebepaling voedt (alleen GNSS 1.60 m RMS 3D, GNSS plus LEO 0.43 m) en precise point positioning (convergentie 11.5 min alleen GNSS, 7.5 min met 240 LEO-satellieten). Er worden 11 waarden tussen de stappen doorgegeven." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Elk scenariotype per familie

De scenariotypen van de engine, ingedeeld in families. Elke familie heeft een pagina met één vermelding per type (de
beschrijving en velden van de engine, een voorbeeldopdracht, kerngetallen uit een run, de
rijen van de [verificatiematrix](docs/VERIFICATION-MATRIX.md) die het noemen, en de grafiek die de engine zelf schrijft) en een
contactblad van die grafieken; [`docs/KINDS.md`](docs/KINDS.md) indexeert ze allemaal. De tabel wordt geschreven door
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) en de pagina's door
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), en beide falen als de engine een type krijgt dat geen enkele familie noemt.

<!-- generated:kind-families -->
| Familie | Waar het antwoord op geeft | Typen | Er één draaien |
|---|---|---|---|
| **[Klokken, tijdsynchronisatie en holdover](docs/kinds/clocks-timing-and-holdover.md)** | hoe lang een klok de tijd vasthoudt zonder GNSS, en hoe een tijdsynchronisatiesysteem standhoudt tegen zijn maskers | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Inertiële, fusie- en kwantumsensoren](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | gegist bestek en sensorfusie tijdens een GNSS-uitval, met klassieke en kwantumsensoren | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[Alternatieve PNT zonder GPS](docs/kinds/gps-denied-alternative-pnt.md)** | navigeren op zwaartekracht, terrein en andere velden wanneer GNSS weg is | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Constellaties, dekking en geometrie](docs/kinds/constellations-coverage-and-geometry.md)** | waar satellieten zijn, wie ze ziet en hoe goed de geometrie is, rond de Aarde, de Maan of Mars | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[GNSS-metingen, positiebepaling en integriteit](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudoafstanden, positiebepalingen, beschermingsniveaus en de ruimteomgeving | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Jamming, spoofing en het spectrum](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | hoe interferentie een ontvanger bereikt en of die wordt gedetecteerd | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Navigatie in lage aardbaan](docs/kinds/low-earth-orbit-navigation.md)** | een overgang, een link, een navigatiebericht en een gefuseerde positiebepaling, stap voor stap | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Maan en cislunair](docs/kinds/lunar-and-cislunar.md)** | navigatie, tijd, stelsels en geodesie bij de Maan | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Navigatie van ruimtegebruikers](docs/kinds/space-user-navigation.md)** | GNSS-signalen voor ruimtevaartuigen boven, rond en voorbij de GNSS-banen | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Optische PNT](docs/kinds/optical-pnt.md)** | optische verbindingen door de atmosfeer en prestatiecijfers voor optisch plus RF | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Missieanalyse, links en ruimteoperaties](docs/kinds/mission-analysis-links-and-space-operations.md)** | lancering, opstijging, terugkeer, attitude, links, contactplanning en bestandsformaten | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Missiedraden](docs/kinds/mission-threads.md)** | het foutbudget voor navigatie en tijdsynchronisatie van een keten van fasen van lancering tot terugkeer | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Campagnes](docs/kinds/campaigns.md)** | gekoppelde missies, sweeps en ensembles gebouwd uit de andere typen | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Elke opdracht

`kshana <scenario.toml>` draait een scenario; elke andere opdracht is een subopdracht, en `kshana --help` drukt het gebruik
van allemaal af. De opdrachten zijn `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (met `live` en
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` en `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) geeft van elke opdracht het doel, een geverifieerd voorbeeld en de documentatiepagina.

<a id="every-surface"></a>
### Elk oppervlak

Eén engine, overal dezelfde resultaten: de opdrachtregel, de Rust-bibliotheek, Python, JavaScript en WebAssembly,
de MCP-server met zijn plug-inopdrachten en skills, Kshana Studio (elke pagina draait in de browser, geen installatie, er wordt niets geüpload), de
integraties met ROS 2, Signal K, OpenCPN, GNSS-SDR en `gnss_lib_py`, de deploykits voor systemd, Docker en Grafana, en de
JetBrains-plug-in. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) somt ze op met hoe u elk ervan krijgt en de namen van alle
plug-inopdrachten, skills en Studio-pagina's; [`docs/SURFACES.md`](docs/SURFACES.md) zegt voor elke opdracht en elk type
welk oppervlak het draagt en welke niet, met de reden.

<a id="how-a-run-works"></a>
## Hoe een run werkt

Een scenario is een TOML-bestand (Tom's Obvious, Minimal Language): een type, een seed en de
parameters. De engine draait het en schrijft het resultaat, een grafiek en een rapport ernaast, en
de exports waar u om vraagt.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Hoe een run verloopt. Een scenario-TOML-bestand (een type, een seed en de parameters) gaat de engine in, kshana 0.40.0, via de api::run_toml-dispatch over 92 scenariotypen, deterministisch op basis van scenario, seed en engineversie. De engine schrijft result.json, chart.svg, report.html en report.json, een table.csv voor de typen die er een definiëren, en op verzoek exports naar SP3, CCSDS OMM en OEM, CZML, KML, GeoJSON, STK en SigMF; een suite schrijft study.json en study.html. Die bestanden voeden Kshana Studio in de browser, een AI-assistent via de kshana-mcp-server, en continue integratie." width="100%">
</picture>

Dit meegeleverde scenario duurt 2 h: 10 min met GNSS, daarna ongeveer 1.8 h zonder GNSS. Het vraagt
hoe lang een optische strontiumroosterklok en een atoomklok op chipschaal (CSAC) elk de
tijd binnen 20 ns houden.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

De optische klok houdt het budget van 20 ns vast gedurende de hele uitval van 6600 s; de CSAC houdt het
2610 s vast, en zit gedurende 95.6% van de run binnen het budget tegen 100% voor de optische klok.
`kshana example` somt elk meegeleverd scenario op.

<a id="missions"></a>
## Missies

Tien sectoren stellen tien verschillende vragen aan dezelfde engine. Elk heeft meegeleverde scenario's om
mee te beginnen.

| Sector | Begin met |
|---|---|
| Defensie en veiligheid | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Ruimte, aardbaan | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Maan, Mars en diepe ruimte | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Luchtvaart en drones | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Maritiem | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Weg | `automotive-urban-canyon` |
| Spoor | `rail-tunnel-coast` |
| Kritieke infrastructuur en tijdsynchronisatie | `clock-holdover`, `clock-ensemble` |
| Telecom en 5G (de vijfde generatie mobiele netwerken) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Wetenschap en onderzoek | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>De vraag die elke sector stelt</summary>

<br>

| Sector | De vraag die het stelt | Begin met |
|---|---|---|
| **Defensie en veiligheid** | Hoe lang blijven onze navigatie en tijdsynchronisatie betrouwbaar onder jamming en spoofing, en welke lagen houden ons binnen de specificatie? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Ruimte: aardbaan** | Ziet mijn ruimtevaartuig genoeg navigatiesatellieten, hoe lang houdt de klok de tijd vast tussen positiebepalingen, en wat zou een navigatielaag in lage baan toevoegen? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Maan en diepe ruimte** | Krijgt een lander, rover of orbiter bij de Maan, bij Mars of verder weg een betrouwbare positie en tijd? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Luchtvaart en drones** | Hoe lang blijft mijn onbemande luchtvaartuigsysteem (UAS) binnen zijn positiebudget nadat een jammer GNSS wegneemt, en is integriteit beschikbaar op mijn route? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Maritiem** | Hoe ver over het water reikt een jammer, zou een positieverschuiving worden opgemerkt, en hoe lang kan een schip op vrijloop een haven binnenvaren? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Weg en automotive** | Hoe ver drijft een auto af onder een viaduct of langs een jammer aan de kant van de weg? | `automotive-urban-canyon` |
| **Spoor** | Hoeveel seconden in een tunnel kan een trein nog zeggen op welk spoor hij rijdt? | `rail-tunnel-coast` |
| **Kritieke infrastructuur en tijdsynchronisatie** | Als GNSS-tijd wegvalt of wordt gespoofd, hoe lang houden een elektriciteitsnet, een handelsplatform of een datacenter herleidbare tijd vast? | `clock-holdover`, `clock-ensemble` |
| **Telecom en 5G** | Als de GNSS-tijdreferentie wegvalt, blijft mijn netwerkklok dan binnen de ITU-T-maskers, en hoe lang? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Wetenschap en onderzoek** | Kan ik een PNT-resultaat reproduceren, uitbreiden en citeren, tot op de seed? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Bewijs

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 gecontroleerd tegen alle 666 AIAA 2006-6753-referentievectoren, slechtste positiefout 4.12 mm"></a></p>

<strong>176 van 401</strong> mogelijkheden gevalideerd tegen onafhankelijke externe referenties; 221 eerlijk gelabeld als Modelled.
Elke rij van de verificatiematrix noemt een mogelijkheid, de onafhankelijke referentie waartegen ze wordt gecontroleerd,
de test die de controle uitvoert, en het label dat daaruit volgt. Continue integratie (CI) maakt het
onmogelijk een mogelijkheid VALIDATED te noemen zonder een onafhankelijke externe referentie.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Hoe een mogelijkheid haar label verdient. Elke rij van de verificatiematrix noemt een mogelijkheid, de onafhankelijke referentie waartegen ze wordt gecontroleerd, de test die de controle in continue integratie uitvoert, en het label dat daaruit volgt. Een rij mag alleen VALIDATED zijn met een onafhankelijke externe referentie; anders is ze MODELLED, of PARTNER wanneer een hardwarepartner er eigenaar van is. Voorbeeld: SGP4/SDP4, Cowell 6-DOF + perturbaties, batch-/sequentiële OD, onafhankelijke referentie AIAA 2006-6753 SGP4-verificatievectoren, test tests/sgp4_verification.rs, label VALIDATED. Actuele tellingen: 176 VALIDATED, 221 MODELLED, 4 PARTNER van 401 rijen. In totaal 176 mogelijkheden gevalideerd tegen onafhankelijke externe referenties; 221 meer zijn eerlijk gelabeld als MODELLED en 4 zijn eigendom van een PARTNER." width="100%">
</picture>

| Label | Rijen | Betekenis |
|---|---|---|
| VALIDATED | 176 | een onafhankelijke externe referentie is het ermee eens: echte data, een onafhankelijke implementatie of gepubliceerde referentievectoren |
| MODELLED | 221 | gecontroleerd tegen een analytische referentie of zelfconsistentie van de simulatie, en dat wordt hardop gezegd |
| PARTNER | 4 | eigendom van een hardwarepartner; Kshana heeft er geen onafhankelijke referentie voor |

Enkele van de controles: alle 666 AIAA-vectoren (American Institute of Aeronautics and Astronautics)
2006-6753 SGP4 (Simplified General Perturbations 4) tot 4.12 mm; het Cowell-kracht-
model tot 0.08 m tegen Orekit 12.2; Galileo tot 0.61 m en Swarm-A tot 0.10 m tegen echte
precieze efemeriden van de European Space Agency (ESA). Tests houden een regeldekking van bijna 95 % van
`src/` aan, in CI bewaakt op 85 %. Het register is
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), gegenereerd uit
`src/verification.rs`: de [volledige matrix van 401 rijen](docs/VERIFICATION-MATRIX.md), en waarom elke
Modelled-rij geen externe onafhankelijke referentie heeft in [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Hoe validatie werkt, de samengestelde tabel met hoogtepunten en de bewijsfiguren</summary>

### Validatie, reproduceerbaarheid en eerlijkheid

- Elke ruisterm is gekalibreerd op een **gepubliceerd, aangehaald** cijfer en gevalideerd
  tegen de standaardrelatie (Allan-deviatie voor klokken; de foutgroei van gegist bestek volgens Groves
  voor inertiaal; de omzetting tijd→afstand voor tijdoverdracht). De status
  per term wordt bijgehouden in [`docs/VALIDATION.md`](docs/VALIDATION.md) als `validated` of
  `not modeled` — niets wordt als gevalideerd gepresenteerd wat dat niet is.
- **Reproduceerbaar door constructie:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` dwingt dit af; kwantum- en klassieke runs gebruiken
  onafhankelijke seeds zodat hun ruis ongecorreleerd is.
- De volwassenheid wordt eerlijk vermeld: cijfers voor optische klokken en optische verbindingen zijn resultaten van *doelen /
  demonstratoren op de grond*, niet gevlogen.

### Het bewijslabel op elke figuur

Elke figuur en tabel die een run schrijft, zegt hoe ver ze te vertrouwen is, en op welke registerrijen dat berust. Het resultaat-JSON heeft een
`evidence`-sleutel, de grafiek-SVG een regel onder de plot (en een element `<metadata id="kshana-evidence">`), en de CSV-tabel
`# evidence:`-commentaarregels vooraan (lees met `comment='#'`). Het noemt een niveau, `VALIDATED`, `MODELLED` of `PARTNER`, en
de id's (`VM-` en acht hexadecimale cijfers) van de rijen van de verificatiematrix die de run heeft gebruikt. Het niveau is het zwakste van die
rijen, dus een run die op één gemodelleerde rij leunt, wordt gelabeld als MODELLED, hoeveel gevalideerde rijen er ook naast staan; het label
kan nooit meer claimen dan het register. Rijen, statussen en id's worden uit de matrix gelezen, niet getypt
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), en
`tests/evidence_labels_doc_sync.rs` faalt als een figuur geen label heeft of een label afwijkt van de matrix.

### Validatie in één oogopslag

Elke rij wordt in CI afgedwongen door een benoemde test. Deze tabel is een **samengestelde selectie van hoogtepunten**;
de volledige machinaal gecontroleerde matrix telt **401 rijen — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), met het volledige bewijs (en wat eerlijk gezegd *nog niet*
gevalideerd is) in [`docs/VALIDATION.md`](docs/VALIDATION.md) en het artefact
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
per release (gegenereerd door `cargo run --bin validation_report`, met SLSA-attestatie — Supply-chain
Levels for Software Artifacts).

De kolom **Status** vermeldt het *soort* bewijs, overeenkomstig de validatieladder hierboven: **VALIDATED** = gecontroleerd tegen een onafhankelijke externe referentie (echte data, een onafhankelijke bibliotheek of gepubliceerde referentievectoren); **MODELLED** = gecontroleerd tegen een analytische referentie of zelfconsistentie van de simulatie (geen onafhankelijke externe dataset). VALIDATED beschrijft de *methode* van controleren, geen geslaagd/gezakt — een eerlijke misser tegen een echte externe referentie blijft VALIDATED, terwijl een vergelijking die geen enkele matrixrij als onafhankelijke referentie noemt (de LRO-fit — Lunar Reconnaissance Orbiter — hierboven) als MODELLED wordt getoond. `CI`-rijen zijn procesbewakers, geen prestatiecijfers. Een paar eilanden met echte data (de gemeten cesiumklok, Stable32 PHASE.DAT, en de OPS-SAT/ICGEM-controles waarvan de ruwe invoer geen licentie voor herverdeling heeft) zijn **afhankelijk van data**: de test drukt een melding af dat hij wordt overgeslagen en blijft groen als de invoer ontbreekt, en de openbare referentiegetallen zijn vastgelegd onder `tests/fixtures/`. Reproduceer de ruwe invoer met het bijbehorende `scripts/fetch_*.sh`.

| Status | Mogelijkheid | Overeenstemming | Referentie / onafhankelijke referentie |
|--------|------------|-----------|--------------------|
| **VALIDATED** | SGP4/SDP4-propagatie | 666/666 vectoren, slechtste **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + rechtstreekse vergelijking met de onafhankelijke `sgp4`-crate |
| **VALIDATED** | Referentiestelsels — IAU 2000A/B-nutatie, IAU 2006/2000A CIO-keten, ERA | **bit voor bit** (X,Y tot 1e-14, s tot 1e-18, ERA tot 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS tegen een onafhankelijke SPICE-engine | max **0.028″** → ≤ 0.86 m grond, ≤ 3.6 m GNSS-baan | ANISE (NAIF/SPICE in pure Rust), dezelfde IERS `finals2000A` EOP, 8 epochen 2020–2023 (vergeleken met deze referentie; geen rij van de verificatiematrix noemt haar als externe onafhankelijke referentie, dus ze is niet gelabeld als VALIDATED) |
| **MODELLED** | EGM2008-geopotentiaal (graad/orde 70) | versnelling = ∇V tot **< 1e-6**; zonale reductie tot gevalideerde J2 | NGA EGM2008-coëfficiënten + analytische ∇V-identiteit |
| **VALIDATED** | Synthese van zwaartekrachtfunctionalen (navigatiekaart met zwaartekrachtondersteuning / zonder GNSS) | GRS80 Somigliana + γ_e/γ_p tot **3.5e-12**; echte EGM2008-verstoringskaart fysisch (RMS ≈ 26 mGal, g/o 70) | GRS80 (Moritz 1980, IAG — International Association of Geodesy) normale zwaartekracht van Somigliana + echte ICGEM EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Allan-schatters (ADEV/MDEV/TDEV/HDEV) + betrouwbaarheidsbanden | reproduceren referentiedeviaties; χ²-banden komen overeen | NIST SP 1065 (Riley), Tabel 31/32 met 1000 punten |
| **VALIDATED** | Allan-schatters op een **echte gemeten cesiumklok** | OADEV/OHDEV tot **1e-3** (waargenomen ≤ 3e-5), 16 middelingsfactoren | Stable32 op een echte 5071A Cs tegen H-maser, 556,990 punten (`tests/cs5071a_reference.rs`, afhankelijk van data) |
| **VALIDATED** | Allan-schatters op de **canonieke Stable32 PHASE.DAT** | OADEV/MDEV/TDEV tot **1e-3** (waargenomen ≤ 5e-5), 139 middelingsfactoren | Stable32-referentiedeviaties voor PHASE.DAT (`tests/phasedat_reference.rs`, afhankelijk van data) |
| **MODELLED** | IMU-foutmodel — ARW / VRW / biasinstabiliteit | hersteld tot **< 5 %** (biasinstabiliteit < 15 %) | datasheet van Analog Devices ADIS16465; NaveGo-referentieprofiel |
| **VALIDATED** | Numerieke Cowell-propagator + krachtmodel (conservatieve niveaus) | slechtste positiefout **0.08 m** over 24 h, 278 epochen (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Cowell-weerstandsniveau + absolute invoer voor efemeride van Zon/Maan en dichtheid | weerstandsniveau gekarakteriseerd ≈ 333 m / 24 h; onverstoord komt overeen met Kepler met universele variabele onder een meter, energie/impuls ~1e-9 | ingebouwde efemeride met lage precisie + analytische Kepler |
| **MODELLED** | Lambert · Tsiolkovsky · porkchop | heen en terug tot de tweelichamenreferentie; ΔV **< 0.01 %** | Izzo 2015 · raketvergelijking · analytische Hohmann-ondergrens |
| **MODELLED** | Baanbepaling (Gauss–Newton-batch) | onder een meter / mm·s⁻¹ zonder ruis; ~2 m bij een ruisvloer van 5 m | tweelichamen + J2 over een RK4-boog |
| **MODELLED** | Krachtmodelfit tegen precieze efemeride van Galileo (volledige boog) | **0.61 m** 3-D RMS, 24 h, g/o 70, alleen krachten | ESA/ESOC `ESA0MGNFIN` eindbaan (E11), echte `finals2000A` EOP (vergeleken met deze referentie; geen rij van de verificatiematrix noemt haar als externe onafhankelijke referentie, dus ze is niet gelabeld als VALIDATED) |
| **MODELLED** | Krachtmodelfit tegen precieze efemeride van Swarm-A (gereduceerd-dynamisch) | **0.10 m** 3-D RMS (grens van het empirische niveau, geen meting) | precieze baan ESA `SW_OPER_SP3ACOM_2_` (vergeleken met deze referentie; geen rij van de verificatiematrix noemt haar als externe onafhankelijke referentie, dus ze is niet gelabeld als VALIDATED) |
| **MODELLED** | Krachtmodelfit tegen LRO bij de Maan (eerlijke misser) | **6.67 m** gereduceerd-dynamisch, *boven* het doel van 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (vergeleken met deze referentie; geen rij van de verificatiematrix noemt haar als externe onafhankelijke referentie, dus ze is niet gelabeld als VALIDATED) |
| **MODELLED** | Mars-OD in de diepe ruimte (gereduceerd-dynamisch SRIF) | **≈ 0.2 m** Mars-LMO (prestatiecijfer uit simulatie, *geen* echte missie) | synthetische OD in gesloten lus — validatie van het schattingsmechanisme |
| **MODELLED** | Door de Zon gedomineerde Marsdynamica tegen JPL DE440 | **137 m bij een boog van 1 dag** (groeit met de boog = niet-gemodelleerde n-lichamen) | JPL DE440 via ANISE (`xval/anise-mars-od`, afhankelijk van kernel) (vergeleken met deze referentie; geen rij van de verificatiematrix noemt haar als externe onafhankelijke referentie, dus ze is niet gelabeld als VALIDATED) |
| **VALIDATED** | Single-point positioning tegen een ingemeten IGS-coördinaat (echte waarnemingen) | **5.7 m** 3-D RMS / **1.1 m** horizontaal, ionosfeervrije tweefrequentie-code-SPP | IGS-stationsmeting ABMF + uitgezonden GPS-efemeride, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Strak gekoppelde GNSS/INS-UKF | **0.77 m RMS** over een LEO-overgang van 30 min incl. een uitval van 120 s | krachtmodelgebaseerde vrijloop, met de hand afgeleid |
| **MODELLED** | Navigatie op zwaartekrachtkaart zonder GPS | ~70 km INS-drift → **~145 m** hersteld | doel van ESA NAVISP *Quantum Wayfarer* |
| **MODELLED** | Terreingerefereerde navigatie (TERCOM/SITAN) | 70 km drift → **< 500 m** (ondergrens door rasterresolutie ~140 m) | SRTM `.hgt` DEM; met de hand geïnjecteerde drift (niet-circulaire controle) |
| **MODELLED** | IGRF-14-hoofdveld (graad/orde 13) | pool ~80.7°N, dipool ~29.7 µT, fysische band 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (Schmidt-semigenormaliseerd) |
| **MODELLED** | Modulatie van navigatiesignalen en codevolging | BPSK-zelf-SSC = **2/(3·R_c)**; PSD's met eenheidsoppervlak; C/A-DLL-jitter **onder een meter** bij 45 dB-Hz | SSC/PSD-ankers in gesloten vorm + formule voor thermische ruis van de DLL volgens Kaplan & Hegarty |
| **MODELLED** | CR3BP-differentiële corrector voor halo/NRHO | STM = eindige verschillen; baan sluit tot op **machineprecisie**; L2 9:2 NRHO **≈ 6.57 d / perilunium ≈ 3,250 km** | STM-controle met eindige verschillen + gepubliceerde L2 zuidelijke 9:2 NRHO (≈ 6.56 d / ≈ 3,370 km) — CR3BP, geen echte Gateway-efemeride |
| **MODELLED** | ARAIM-integriteit met twee constellaties | constellatiebrede foutmodus op echte GPS + Galileo | EU ARAIM TR (technisch rapport) / DO-316; Celestrak `gps-ops` 2021-07-28 (vergeleken met deze referentie; geen rij van de verificatiematrix noemt haar als externe onafhankelijke referentie, dus ze is niet gelabeld als VALIDATED) |
| **VALIDATED** | GNSS-geometrie / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | overeenkomst tot **1e-6 relatief** over 8 geometrieën (goed geconditioneerd → bijna singulier) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — onafhankelijke bibliotheek (`tests/dop_reference.rs`) |
| **VALIDATED** | ML-metrieken voor detectorevaluatie (AUC/ROC/confusie/Pd-Pmd/precisie/F1) | **exacte tellingen + < 1e-9** over 5 datasets × 24 drempels | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — onafhankelijke bibliotheek (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC AUC voor anomaliedetectie op **echte ESA OPS-SAT-telemetrie** | AUC reproduceert scikit-learn tot **< 1e-9**; AUC van de piektellingsdetector **≈ 0.85** op de gelabelde testsplitsing | scikit-learn `roc_auc_score` op de OPSSAT-AD-testsplitsing (Ruszczak et al. 2025, CC BY 4.0) — echte OPS-SAT-telemetrie (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Numerieke kernels voor kwantumafweging (ADEV-NNLS-fit · χ²-consistentiebanden · van-Loan-klok-Q) | NNLS + Q **exact**; χ² **< 5e-4** bij operationele vrijheidsgraden ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | MTIE / MDEV / TDEV telecom-wandermetrieken (ITU-T G.810/G.823/G.8261/G.811 — de aanbevelingen van de Telecommunication Standardization Sector van de International Telecommunication Union) | MTIE (9 middelingsfactoren, bit-exact) en MDEV + TDEV (8 factoren, **< 1e-9** relatief) op de NIST SP 1065 LCG-reeks (lineaire congruentiegenerator) | allantools 2024.06 `mtie` / `mdev` / `tdev` — onafhankelijke bibliotheek (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | MCDA-methoden voor afwegingsstudies — alle vier beslissingsfamilies, negen extern gevalideerde aggregators (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) plus prioriteitsweging met paarsgewijze vergelijking volgens **AHP** | scores / rangschikkingen / concordantiematrices gereproduceerd tot **< 1e-9** | pymcdm + pyDecision (onafhankelijke MCDA-bibliotheken van derden) + Saaty RI (Random Index) / SciPy-LAPACK eig (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | LEO-dopplerenvelop uit de baan en de draaggolf | Iridium-maximum binnen **5 %** van de gepubliceerde ±36 kHz; Xona Pulsar X1 binnen de gepubliceerde **32–34 kHz** | RNTF LEO PNT-testresultaten; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | PPP-convergentie met LEO-augmentatie | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min met 60 / 96 / 192 / 288 LEO-satellieten, monotoon; filter-NEES binnen de χ²-band | trend vergeleken met Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); constellaties en ruis niet gereproduceerd |
| **MODELLED** | Voorwaardelijk Timing Protection Level (door holdover begrensde onopgemerkte tijdfout onder spoofing) | samenstelling reproduceert de meerstaps-covariantierecursie van `clock_state`; gekalibreerd op een echte opgenomen spoof | scalairen van JammerTest 2024 (Zenodo 15911589) + gesloten vormen van van Loan / CUSUM (`examples/tpl_jammertest`) |
| **MODELLED** | Scoring van PNT-weerbaarheid + beslissingsinstabiliteit | 35 met de hand afgeleide tests met onafhankelijke referentie; bytedeterministisch studieartefact (vaste seed) | toewijzing aan DHS RPCF v2.0 + gesloten vormen van Dirichlet / Kendall-τ / Hill-N2 — synthetische architecturen, geen certificering |
| **MODELLED** | Studie van de optimismekloof bij RF-verstoringen (schaalwetten + leave-one-out-voorspeller) | significantie met permutatienulhypothese; bytedeterministisch artefact (5 seeds) | synthetisch, op parameters gebaseerd corpus — de evaluatie*metrieken* zijn VALIDATED tegen scikit-learn (hierboven); de studie is MODELLED |
| CI | Reproduceerbaarheid op meerdere platforms | bit-identieke invoer + vormreferenties op 3 besturingssystemen | CI-matrix Linux / macOS / Windows, SHA-256-referenties |
| CI | Testdekking | **~95 % regels** van `src/` exclusief `src/*_data.rs` en `src/main.rs`, bewaakt op ≥ 85 % | cargo-tarpaulin (LLVM-engine) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Hoe een mogelijkheid haar label verdient: een eis wordt gekoppeld aan een module in src, aan een test in tests, aan een externe onafhankelijke referentie (echte dataset, onafhankelijke referentie-implementatie of gepubliceerde vectoren), aan een status — met een door CI afgedwongen bewaking dat geen enkele mogelijkheid Validated kan zijn zonder externe onafhankelijke referentie. Actuele tellingen: 176 Validated, 221 Modelled, 4 Partner, 401 totaal" width="900">
  <br><sub>Hoe een mogelijkheid haar label verdient — de door CI afgedwongen invariant: geen externe onafhankelijke referentie ⇒ kan niet Validated zijn · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Hoe elke claim wordt onderbouwd: de kolom Validated is 176 van 176 ExternalDataset door constructie (door CI afgedwongen); Modelled-rijen zijn eerlijk getagd als InternalConsistency, ReferenceImpl of ExternalDataset; Partner-rijen hebben geen onafhankelijke referentie van Kshana" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Positiefout van SGP4/SDP4 in het slechtste geval tegen de AIAA 2006-6753-referentie per regime, logaritmische schaal: elk regime ligt ver onder de AIAA-tolerantie, slechtste geval 4.12 mm in het niet-resonante diepe-ruimteregime" width="96%">
  <br><sub>Boven: elke Validated-rij wordt door constructie ondersteund door een externe dataset. Onder: SGP4 komt in elk regime overeen met de officiële referentie (slechtste 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Verificatiestatus over alle 401 mogelijkheden: 176 Validated (gecontroleerd tegen externe onafhankelijke referentie), 221 Modelled, 4 eigendom van een Partner" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Mogelijkhedendomeinen

Elke mogelijkheid van de openbare kaart, per domein, met haar registerlabel. De domeintabel wordt geschreven door
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) uit `web/capabilities.json`, hetzelfde bestand dat
de kaart van alles in de Studio leest.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Mogelijkheden van Kshana per domein en volwassenheid: gevalideerde en gemodelleerde openbare mogelijkheden per domein, getekend uit web/capabilities.json door tools/gen_validation_figures.py" width="900">
</picture>

De volledige tabel, domein voor domein met elke mogelijkheid en haar label, is [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Installeren

Eén regel levert de opdrachtregeltool op: **`cargo install kshana`**. Elk kanaal levert
v0.40.0 uit dezelfde getagde commit.

<!-- channels:begin -->
| Kanaal | Installeren | Handleiding |
|---|---|---|
| Proberen in de browser | open https://kshana.dev | [Studio-handleiding](https://kshana.dev/docs/studio.html) |
| Opdrachtregel (Rust) | `cargo install kshana` | [Gebruik van de opdrachtregel](https://kshana.dev/docs/rust.html#usage--cli) |
| Rust-bibliotheek | `cargo add kshana` | [API-naslag op docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Handleiding Python-API](https://kshana.dev/docs/python-api.html) |
| JavaScript en WebAssembly | `npm install kshana` | [Handleiding npm en WebAssembly](https://kshana.dev/docs/npm.html) |
| AI-assistent (MCP-server, cargo) | `cargo install kshana-mcp` | [Handleiding MCP-server](https://kshana.dev/docs/mcp.html) |
| Docker-image | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Handleiding MCP-server: Docker](https://kshana.dev/docs/mcp.html#install) |
| Claude Desktop-extensie | dubbelklik op de `.mcpb` voor uw systeem: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (één klik) | [Toevoegen aan Cursor (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Toevoegen aan Cursor (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (één klik) | [Installeren in VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Installeren in VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Vooraf gebouwd binair bestand | download kshana-mcp-<target> uit de release en controleer het tegen SHA256SUMS | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Officieel MCP-register | zoek naar io.github.ashfordeOU/kshana-mcp | [Alle MCP-installatiefragmenten](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Op afstand (streamable HTTP), zelf gehost | `kshana-mcp --http 127.0.0.1:8080` | [Handleiding voor zelf hosten](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Claude Code-pluginmarktplaats | `/plugin marketplace add ashfordeOU/kshana` | [Kshana gebruiken vanuit een agent](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| Plug-in voor JetBrains-IDE's | Settings → Plugins → Marketplace → zoek "Kshana" (plug-in-ID dev.kshana.ide) | [Handleiding plug-in](https://kshana.dev/docs/jetbrains.html) |
| Signal K-plug-in | `npm install signalk-kshana-trust` | [Handleiding Signal K-plug-in](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| OpenCPN-plug-in | download de plug-in-tarball uit de release | [Inzending voor de OpenCPN-catalogus](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Grafana-dashboard | importeer kshana-grafana-*.json uit de release | [Bron van het dashboard](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Image van de referentiebouw | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Maritieme integraties](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana op de JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Bouwt met Rust 1.88 of nieuwer, de rust-version in Cargo.toml"></a></p>

MCP is het Model Context Protocol. Zet een release vast met `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` of `npm install kshana@0.40.0`. Om vanuit de broncode te bouwen, zie
[Installeren en bouwen](#install--build) onder Naslag.

<details>
<summary>Een scenario draaien vanuit Python en vanuit WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Naast `run` stelt de module `run_full` beschikbaar (JSON, SVG en de samenvatting van één regel tegelijk),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` en `error_kind`; zie
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

Het npm-pakket is de hele engine, gecompileerd naar WebAssembly. Geef in Node.js het binaire bestand door aan
`initSync`; in een browser haalt `await init()` het op (zie [`README.npm.md`](README.npm.md)).

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
## Architectuur

Eén open engine staat in het midden, en elk oppervlak draait haar: de opdrachtregel, de Rust-
bibliotheek, Python, WebAssembly en Kshana Studio, de MCP-server, het Docker-image en de
JetBrains-plug-in. Hetzelfde scenariobestand geeft op elk ervan dezelfde bytes. Kshana Pro ligt
erbovenop als een afzonderlijke laag die van de engine afhangt en haar nooit forkt.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="De architectuur van Kshana: één open engine in het midden, kshana 0.40.0 onder de AGPL-3.0, met api::run_toml, een getypeerde dispatch over elk type, en het verificatieregister van 401 mogelijkheden (176 VALIDATED, 221 MODELLED, 4 PARTNER). Eromheen draait elk oppervlak dezelfde engine: opdrachtregel (cargo install kshana); Rust-bibliotheek (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); MCP-server (cargo install kshana-mcp); Docker-image (ghcr.io/ashfordeou/kshana-mcp); JetBrains-plug-in (Marketplace: &quot;Kshana&quot;). Daaronder Kshana Pro, een propriëtaire laag die van de open engine afhangt als bibliotheek en haar nooit forkt, en geen fysisch model toevoegt." width="100%">
</picture>

<details>
<summary>Binnen de engine: de domeinlagen en het verificatieregister</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="De architectuur van Kshana in lagen. Vijf toegangen (opdrachtregel, Python, JavaScript en WebAssembly, de MCP-server en de JetBrains-plug-in) bereiken één api::run_toml, een getypeerde dispatch over 92 typen. Daaronder liggen acht domeinlagen: tijd en stelsels, klokken en tijdsynchronisatie, inertiaal en fusie, GNSS en integriteit, astrodynamica, LEO-PNT, Maan, Mars en diepe ruimte, en missies en studies, op een gedeelde kern, allemaal met kruisverwijzingen via de verificatiemodule, de machinaal gecontroleerde matrix van 401 mogelijkheden die de enige bron van waarheid is voor elk label." width="100%">
</picture>

**Eén engine, veel toegangen.** Eén Rust-kern (`kshana`) draait elk scenario,
bereikbaar via een CLI, een Python-extensie, een WebAssembly-module in de browser, een **MCP-
server** voor AI-agents en een **plug-in voor JetBrains-IDE's** — die allemaal samenkomen in één
`api::run_toml`-dispatch. Binnenin worden de sensorpakketten ingeplugd in een gemeenschappelijke
foutmodelinterface; ernaast liggen een **referentiestelsellaag** (IAU 2006/2000A-
precessie–nutatie en de op CIO gebaseerde GCRS↔ITRS-reductie), een **astrodynamica-/numerieke
laag** (analytische SGP4/SDP4 **en** een numerieke Cowell-propagator met zijn
EGM2008-/perturbatiekrachtmodel, manoeuvreontwerp en baanbepaling), een
**integriteits-/GNSS-laag** (RAIM/ARAIM, SBAS, het meetdomein, jamming, cislunair),
een **fusie-/alt-PNT-laag** (de GNSS/INS-schatters en de kaartmatchers voor zwaartekracht/terrein/magnetisme),
een **laag voor diepe ruimte en Maan** (radiometrische Mars-PNT en de
maan-PNT-suite, met haar bewijsniveau per onderdeel in de matrix — LTC-tijd, VLBI, gezamenlijke OD+klok, realisatie van het stelsel, service volume,
differentiële PNT, interoperabiliteit), een **missieanalyselaag** (budgetten voor lancering / terugkeer / dekking /
richten / passages / links en de ruimteweeromgeving), en de open
**weerbaarheids- en AI/ML-studielaag** (RPCF-weerbaarheidsscoring, de optimismekloof bij RF-
verstoringen, en de demonstrator voor kwantumondersteunde PNT) waarvan de reproduceerbare artefacten op de
gevalideerde kernels rusten.

Twee zelfstandige crates die **buiten de workspace** vallen, staan naast de kern — `mcp/kshana-mcp`
(de MCP-server, gebouwd op de `rmcp`-SDK van editie 2024) en `xval/anise-frames` (de
ANISE/SPICE-kruiscontrole van stelsels, die MPL-2.0-afhankelijkheden (Mozilla Public License 2.0) binnenhaalt) — en worden buiten de afhankelijkheidsgraaf
van de gepubliceerde crate, `Cargo.lock`, de licentiepoort en de MSRV-build (minimaal ondersteunde Rust-versie) gehouden door de `exclude`-lijst in de root-
`Cargo.toml`. De JetBrains-plug-in (`ide/jetbrains`) is een afzonderlijk Kotlin-
project. Zie [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) voor de volledige set diagrammen.

De weergegeven diagrammen (engineflow, modulekaart, distributie) staan in [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagrammen

De diagrammen zijn Mermaid-bronnen in [`docs/diagrams/`](docs/diagrams/), weergegeven als SVG en PNG in
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` op Linux, de andere twee
`render-diagram`-scripts elders), en een register koppelt elke PNG aan de exacte SVG waaruit ze is gemaakt. Tests leggen de
aantallen vast die ze vermelden. De grafieken in de secties hierboven worden door tools getekend uit engine-runs; deze laten zien hoe de
onderdelen in elkaar passen.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Het systeem: zes toegangen (opdrachtregel, Python, WebAssembly en npm met Kshana Studio, MCP-server met plug-ins en skills, JetBrains-plug-in, integraties) roepen allemaal één dispatch aan over elk scenariotype, die één engine draait met gedeelde kern, sensorpakketten en stelsels, en domeinmodellen, en een reproduceerbaar resultaat en een grafiek schrijft" width="900"><br>
  <sub>Eén dispatch, één engine, reproduceerbare uitvoer · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · bron <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="De oppervlakken: één deterministische offline engine voedt de opdrachtregel, de Rust-bibliotheek, Python, WebAssembly en npm, en de MCP-server; de Studio draait op de WebAssembly-build, plug-inopdrachten en skills op de MCP-server, integraties en deploykits op de opdrachtregel, en de JetBrains-plug-in op de bibliotheek" width="900"><br>
  <sub>Elk oppervlak, vanuit dezelfde engine · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · bron <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Binnen één run: een scenariobestand met zijn seed en GNSS-tijdlijn voedt de engine, die per tijdstap het foutmodel laat evolueren, de schatter draait en de prestatiecijfers scoort, en een reproduceerbaar resultaat en een grafiek schrijft" width="900"><br>
  <sub>De binnenste lus van een run · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · bron <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Ontvangervertrouwen: een ontvangerregistratie of -stroom wordt ingelezen tot waarneembare grootheden per epoche en de eigen vlaggen van de ontvanger, gaat door de monitoren, en wordt een adviserende vertrouwensscore met een band en redenen, die de Studio, telemetrie, een ondertekend bewijspakket, Jammertest- en bench-scoring en het normenrapport voedt" width="900"><br>
  <sub>Van een ontvangerregistratie naar een vertrouwensscore en wat die gebruikt · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · bron <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="De laboratoriumrondgang: een scenario wordt geëxporteerd met zijn gebeurtenissen en testomstandigheden, een operator buiten Kshana speelt een bestand af via een laboratoriumsimulator, de ontvangerregistratie wordt gescoord tegen de vermelde gebeurtenissen, en de bewijsrondgang koppelt de hashes van scenario, omstandigheden en registratie en de score in een ondertekend pakket" width="420"><br>
  <sub>Van scenario naar ondertekend pakket; Kshana produceert of herhaalt nooit een signaal · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · bron <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: de browser draait de naar WebAssembly gecompileerde engine lokaal zonder iets te uploaden, neemt meegeleverde scenario's of een scenario of registratie die u opent, en toont het resultaat in de Eenvoudige weergave, de Geavanceerde weergave en de taakpagina's, met exports die de gebruiker opslaat" width="900"><br>
  <sub>Hoe de Studio lokaal draait · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · bron <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="De test- en releaseflow: lokale poorten (formattering, clippy, de controle op geen toeschrijving, de ratel voor documentatiedekking, en scripts/gate.sh, dat de volledige suite en herhaalde runs draait en het bewijs schrijft dat de pre-push-hook controleert) leiden tot een pull request alleen voor CI en een groene volledige CI; de eigenaar spoelt main door naar de groene commit en een geannoteerde tag komt daarop na de controle op versiesynchronisatie; de releaseworkflow verifieert de volledige suite op de getagde commit voordat er iets wordt gepubliceerd, bouwt de binaire bestanden met een SBOM, controlesommen en bouwherkomst, publiceert naar crates.io, PyPI, npm, het containerregister, het MCP-register en de JetBrains Marketplace, bevraagt elk register totdat het de nieuwe versie serveert, en start de sitebuild vanuit de tag; een afzonderlijk pad alleen voor de site start de pages-workflow met de tag main en wordt geweigerd tenzij er sinds de laatste release niets buiten web/ en .github/ is veranderd" width="900"><br>
  <sub>Test- en releaseflow, van lokale poorten tot een geverifieerde release en het pad alleen voor de site · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · bron <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="De modulekaart: de opdrachtregel, Python, WebAssembly, MCP-server en JetBrains-plug-in roepen de getypeerde dispatch over elk type aan, die de gedeelde kern, tijd en stelsels, sensorpakketten, astrodynamica, integriteit, spoofdetectie, fusie, diepe ruimte en Maan, weerbaarheid, en de scheidsrechter- en benchmarkmodules bereikt, allemaal onderbouwd door de verificatiematrix" width="1000"><br>
  <sub>Waar de code staat · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · bron <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Distributie: één repository levert de kerncrate, de MCP-server, de IDE-plug-in en de kruiscontrolecrates aan crates.io, PyPI, npm, GitHub Releases, de Pages-speeltuin, het containerregister, het MCP-register en de JetBrains Marketplace, met een Zenodo-archief" width="900"><br>
  <sub>Wat waarheen gaat, en wat het controleert · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · bron <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## AI-assistent

[`kshana-mcp`](mcp/kshana-mcp/) is een MCP-server: uw assistent draait de echte engine en
leest de JSON ervan terug, in plaats van de wiskunde te raden. Elk van de 49 tools is een dunne wrapper
om een openbare functie van de `kshana`-bibliotheek, dus er zit geen simulatielogica in de server.

### De MCP-server installeren

> Adviserend, geen typegoedgekeurde navigatieapparatuur: de exploitant blijft verantwoordelijk voor de navigatie.
> De server draait op uw computer; er wordt niets naar Ashforde OÜ verzonden.

Kies een willekeurig kanaal. Elke link en elk fragment wordt gegenereerd door één script
(`scripts/gen_mcp_install.py`) en gecontroleerd in continue integratie; fragmenten voor Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI en Continue staan in
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Kanaal | Opdracht of knop | Vereist | Vastgezette vorm |
|---|---|---|---|
| Claude Desktop-extensie | dubbelklik op de `.mcpb` voor uw systeem: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | niets | `kshana-mcp-<target>.mcpb` van v0.40.0 |
| Cursor (één klik) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node, of Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (één klik) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node, of Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · plug-in: `/plugin marketplace add ashfordeOU/kshana` daarna `/plugin install kshana@ashforde` | Node (of Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ met uv of pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | formula voor v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` daarna `scoop install kshana-mcp` | Scoop (Windows) | manifest voor v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Vooraf gebouwd binair bestand | [de releasepagina](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, gecontroleerd met `SHA256SUMS` en `gh attestation verify` | niets | v0.40.0 |
| MCP-register | `io.github.ashfordeOU/kshana-mcp` (gevonden door clients die het register kennen) | een client die het register kent | `0.40.0` |
| Op afstand (streamable HTTP) | `kshana-mcp --http 127.0.0.1:8080`, zelf gehost: zie [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | uw eigen host | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp op Glama, de kwaliteitsscore van de MCP-server"></a></p>

In Claude Code komt dezelfde server als plug-in: `/plugin marketplace add ashfordeOU/kshana`, daarna
`/plugin install kshana@ashforde`. De plug-in voegt slash-opdrachten toe bovenop de tools: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` en `/kshana-jammertest`. De tools voor vaartuigvertrouwen voeden de integraties met Signal K en
OpenCPN: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

De instelling per client staat in [`docs/integrations.md`](docs/integrations.md). De server staat
in het officiële MCP-register als `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>De 49 tools</summary>

<br>

**Scenario's en rapporten**

| Tool | Wat het doet |
|---|---|
| `run_scenario` | Een scenario draaien vanuit een TOML-definitie (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | De 92 ingebouwde scenariotypen met beschrijvingen + verplichte/optionele velden — zodat de agent een geldig scenario kan opbouwen |
| `validate_scenario` | Controle vooraf: de TOML parseren en het type ervan detecteren, zonder te draaien |
| `list_example_scenarios` | De meegeleverde referentiescenario's als JSON |
| `get_example_scenario` | De TOML-tekst van één meegeleverd referentiescenario, byte voor byte het bestand onder `scenarios/` |
| `report_scenario` | Een scenario draaien en het rapport ervan teruggeven |
| `animate_scenario` | Een scenario draaien en de tijdreeks ervan als animatie teruggeven |
| `sky_geometry` | Hemelgeometrie onder een azimutafhankelijke skyline: de zichtbare en verborgen satellieten, DOP, de oost-noord-omhoog-covariantie en de horizontale foutellips; of een skylinevoorinstelling met haar herkomst |

**Export en interoperabiliteit**

| Tool | Wat het doet |
|---|---|
| `list_export_formats` | Welke interoperabiliteitsformaten van toepassing zijn op een scenario (`czml`, `kml`, `geojson`, `stk`, `sigmf`), de reden als een formaat dat niet is, en de specificatie die elke schrijver volgt |
| `export_interop` | Een scenario exporteren als CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeride (Systems Tool Kit) `.e`, of SigMF (Signal Metadata  |
| `import_route` | Een GeoJSON-`LineString`-route schrijven in een scenario dat een waypointspoor vliegt (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`) en de nieuwe TOML teruggeven |
| `export_sp3` | De constellatie van een `orbit`-scenario exporteren als precieze efemeride in SP3-c (Standard Product 3, revisie c) |
| `export_omm` | De elementen van een `orbit`-scenario exporteren als catalogus in CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message) |
| `export_oem` | De toestandsreeks van een `orbit`-scenario exporteren als efemeride in CCSDS OEM (Orbit Ephemeris Message) 2.0 — de TEME-positie (ware evenaar, gemiddeld equinox) *en*  |
| `export_table_csv` | Een scenario draaien en de reproduceerbaarheidstabel ervan als CSV (door komma's gescheiden waarden) teruggeven — de bytestabiele tabel die de CLI (opdrachtregelinterface) schrijft als `<scenario>.table.csv` |
| `export_test_bench` | De voertuigbeweging en gebeurtenissen van een scenario voor een GNSS-simulator in een laboratorium (`kshana bench-export`) |

**Vertrouwen van ontvanger en vaartuig**

| Tool | Wat het doet |
|---|---|
| `assess_receiver_log` | Een echte registratie van een GNSS-ontvanger (global navigation satellite system) beoordelen op vertrouwen |
| `assess_vessel_stream` | Een begrensd NMEA 0183-fragment scoren (hooguit 2 MiB en 20,000 epochen |
| `assess_vessel_log` | De NMEA 0183-registratie van een vaartuig (hooguit 4 MiB) als batchrun, waarbij de sessie-TOML de grenzen van het vaartuig vermeldt |
| `create_evidence_pack` | Een ondertekend bewijspakket voor een venster van de registratie van een vaartuig (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Een RFC 3161-tijdstempeltoken (base64 van de `.tsr`-bytes) in het geheugen aan een pakket koppelen (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Een pakket verifiëren (`kshana evidence verify`) |
| `generate_training_nmea` | Synthetische NMEA 0183 voor de brug voor bemanningstraining uit een `nmea-scenario`-TOML (jamming, positieverschuiving, tijdspoof, replayvertraging) met het instructeurslogboek (`kshana-nmea-training/1`) |
| `build_interference_map` | Een GNSS-interferentiekaart uit ADS-B- of AIS-positiemeldingen als CSV-tekst (hooguit 4 MiB) |
| `route_exposure` | Het aandeel van de lengte van een route in gedegradeerde, niet-gedegradeerde, niet-beoordeelde en niet-waargenomen cellen van een of meer interferentiekaarten, optioneel binnen een datumbereik |
| `trust_telemetry` | Een vertrouwensstroom (JSON-regels) of `receiver-trust`-resultaat weergegeven als Prometheus-tekst, CEF- of LEEF-syslogregels of een OTLP-JSON-payload, met de encoders van `kshana trust-telemetry` |
| `jammertest_import` | De gepubliceerde Jammertest-testcatalogus en het uitzendplan (NPRA/jammertest-plan, MIT) inlezen als geplande referentie (`kshana jammertest import`): de tijdsloten van één testgebied worden receiver-trust-gebeurtenissen met de catalogus-id en het jaar in elk label. Geplande tijdsloten, geen vastgelegde uitzendtijden; geen enkel contactveld van het plan wordt gelezen. MODELLED. Zie [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Een ontvangerregistratie scoren tegen dat schema (`kshana jammertest score`): per test de detectielatentie, gemiste alarmen en hersteltijd, en de valse alarmen buiten elk tijdslot. Tekstregistraties als `log`, binair (`ubx`, `sbf`) als `log_base64`. Een ondertekend pakket vereist een sleutel: opdrachtregel. Alleen adviserend; MODELLED. |
| `fit_imu_log` | Parameters van versnellingsmeter en gyroscoop voor de `hybrid`- en `fusion`-scenario's, gefit uit een stilstaande IMU-registratie (CSV of EuRoC) via Allan-deviatie, met een direct te plakken `[accel_classical]`-tabel en de SHA-256 van de registratie (`kshana imu-fit`). Tekst erin, JSON eruit; MODELLED. |

**GNSS IQ (bestanden in de werkmap; uit in HTTP-modus)**

| Tool | Wat het doet |
|---|---|
| `iq_signals` | De instelling van de GNSS IQ-laag |
| `iq_info` | Eén IQ-opname (in-fase en kwadratuur) in de werkmap beschrijven zonder haar te verwerken |
| `iq_scene` | Een GNSS IQ-scène met meerdere satellieten genereren in de werkmap (`kshana iq scene`) |
| `iq_acquire` | FFT-acquisitie (snelle fouriertransformatie) van een of meer PRN's (pseudoruiscodes) over een opname (`kshana iq acquire`), optioneel achter front-endstadia |
| `iq_track` | Acquireren en daarna volgen met de DLL/PLL/FLL-bank (delay-, phase- en frequency-locked loop) (`kshana iq track`), met de lussen uit een `kshana.loop-desig |
| `iq_frontend` | Front-end- en interferentieonderdrukkings-DSP van de ontvanger toepassen (digitale signaalverwerking |
| `iq_sweep` | Eén IQ-opname in de werkmap afspelen over meerdere ontwerpen van volglussen (`kshana iq sweep`) |
| `iq_monitor` | De monitoren voor interferentie- en spoofingdetectie over een IQ-opname in de werkmap draaien (`kshana iq monitor`) |
| `iq_labfit` | Het model voor verlies van lock van de volglus fitten op laboratoriumruns (`kshana iq labfit`) uit een `iq-labfit`-scenario waarvan de registraties inline staan (`text` of `base64` |
| `iq_test_conditions` | Een `kshana.test-conditions/1`-bestand dat als tekst is opgegeven valideren en de opgeloste omstandigheden met hun hash teruggeven |
| `iq_campaign` | Een campagne voor laboratoriumherhaling draaien (`kshana iq campaign`) |
| `iq_campaign_status` | De voortgang van een uitvoermap van een campagne |

**Normentoewijzing**

| Tool | Wat het doet |
|---|---|
| `compliance_report` | De toewijzing aan openbare kaders, ingevuld uit resultaatdocumenten die als tekst zijn opgegeven (`kshana compliance-report`) |
| `compliance_mapping` | De statische toewijzingstabellen (of, met `sources`, de brondocumenten die ze aanhalen met versies en URL's) als Markdown, voorafgegaan door dezelfde verklaring |
| `list_standards_packs` | De normpakketten (`kshana standards-pack list`): gescoorde scenariosets voor de testprofielen van het DHS Resilient PNT-kader, IMO MSC.1/Circ.1575 en ICAO Doc 9849 Appendix F |
| `run_standards_pack` | Eén pakketrun tegen drempels die vóór de run zijn vermeld: elke test `MET`, `NOT MET` of `NEEDS INPUT`; MODELLED, beoordeelt geen product |
| `lunanet_afs_check` | Het LunaNet Augmented Forward Signal gecontroleerd tegen LNIS V5 AD1 Volume A (LSIS-AFS V1.0): de codes tegen de gedrukte tabellen, of een symboolstroom tegen het frameformaat; LDPC en CRC-24Q van subframes 2 tot 4 worden niet geverifieerd |
| `create_round_trip_pack` | Het ondertekende pakket voor de laboratoriumrondgang: scenario, `kshana.test-conditions/1`-document, ontvangerregistratie en score gekoppeld via hash |

**Benchmark**

| Tool | Wat het doet |
|---|---|
| `score_benchmark` | Een kshana-bench-inzending gescoord tegen een referentiebestand, beide als JSON-tekst (`kshana bench score`, `bench/SPEC.md`): het resultaatbestand met de specificatieversie, de splitsing, invoerhashes en de metrieken van de taak. MODELLED; beschrijft een registratie of corpus, nooit een product. |
| `render_leaderboard` | Resultaatbestanden van kshana-bench weergegeven als de statische klassementpagina (HTML-tekst), elk eerst gevalideerd. |

</details>

<a id="editions"></a>
## Edities

De hele engine is gratis. Kshana Pro en maatwerkstudies zijn voor programma's die meer nodig hebben,
en elke betaalde route begint met een bericht: hier staan geen prijzen.

| | Free | Kshana Pro | Maatwerkstudie |
|---|---|---|---|
| Wat het is | de hele open engine, alle 92 scenariotypen, geen functiepoort | een propriëtaire laag op dezelfde engine, onder contract | een MODELLED studie van de PNT-weerbaarheid van uw systeem, voor u uitgevoerd |
| Licentie | AGPL-3.0 (GNU Affero General Public License, versie 3), of een commerciële licentie | propriëtair | contract |
| Hoe te beginnen | [installeren](#install) of open [kshana.dev](https://kshana.dev) | [een Pro-evaluatie aanvragen](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [een studie aanvragen](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Wat Pro is, in de woorden van [`docs/PRO.md`](docs/PRO.md):

> **Een strikte bovenverzameling van open Kshana.** Pro hangt af van de open engine als bibliotheek en
> forkt haar nooit. Elk open scenariotype draait ongewijzigd in Pro, en een open scenario draait
> in Pro helemaal zonder licentie.
>
> **Geen nieuwe fysica.** Pro voegt geen fysisch model toe en verandert er geen. Elk Pro-getal komt
> uit runs van de open engine, dus een Pro-cijfer is even betrouwbaar als het open scenariotype
> waar het uit komt, en nooit meer.

Pro beantwoordt de volgende vragen van een programma: welk ontwerp te vliegen (een ontwerpoptimalisator en zijn
Pareto-front), hoe zeker het antwoord is (onzekerheid en gevoeligheid), en of de missie
haar eisen haalt (een missiedossier, traceerbaarheid van eisen, afwegingsstudies, een
regressiecontrole van scenario's, digitale tweelingen van klokken, een studiedossier en een on-premises
dienst). Het bewaakt ook een campagne van cijfers en laat een pipeline falen wanneer er een verslechtert,
test kandidaat-signaalplannen tegen de open satellietnavigatiesignalen in beide
richtingen (spectrumcoëxistentie), en zet studies in een wachtrij in een on-premises taakdienst met een
afleveringsregister met hashketen. Elk ervan wordt beschreven, met wat het produceert en wat het niet doet, in
[`docs/PRO.md`](docs/PRO.md). Niets wat Pro produceert is een certificering, en een maatwerkstudie is
evenmin een certificering.

<details>
<summary>Wat Kshana Pro uit de open engine leest, en ondersteuning door Ashforde® OÜ</summary>

<br>

**Waarop Kshana Pro voortbouwt.** Elk onderdeel van Pro werkt vanuit de open engine en laat
die ongewijzigd:

- **De ontwerpoptimalisator, de onzekerheidsstudie en het missiedossier** draaien scenario's van de open engine
  via de openbare interface van de engine en berekenen elk getal uit de resultaten
  van de runs. Elke uitvoer behoudt het niveau VALIDATED, MODELLED of PARTNER dat de open engine aan
  elk cijfer gaf, nooit een hoger.
- **Digitale tweelingen van klokken** gebruiken het klokmodel van de open engine en de Allan-deviatie-
  schatter ervan: een tweeling wordt gekalibreerd op het gepubliceerde Allan-budget van het apparaat en daarna gecontroleerd door
  de Allan-deviatie van de tweeling te schatten met de open schatter.
- **Afwegingsstudies** draaien elke architectuuroptie als scenario van de open engine, ongewijzigd,
  en rangschikken de opties op een prestatiecijfer dat uit het resultaat van elke run wordt gelezen.
- **Campagnebewaking** leest haar cijfers uit de resultaten van runs van de open engine van de
  scenario's in een pakket, en vergelijkt ze met de vorige geslaagde run.
- **Spectrumcoëxistentie** leest elk fysisch getal uit runs van de open engine van de
  typen `leo-signal` en `constellation-design`, en voegt alleen de som over de zichtbare satellieten
  en de rangschikking van de plannen toe.
- **De on-premises taakdienst** draait open en Pro-scenario's via dezelfde engine en
  slaat elk resultaat op zoals de run het teruggaf.
- **Bewijspakketten** leggen voor elke run de scenariohash vast die de open engine op
  zijn resultaat stempelt, zodat een cijfer in een pakket kan worden gereproduceerd door het scenario opnieuw te draaien.
- **Systems-engineering- en programmatooling.** De tooling voor modelgebaseerde
  systems engineering (MBSE) en programma's van Kshana Pro controleert de eisen van een programma
  tegen runs van de open engine: het importeert eisen als door komma's gescheiden waarden
  (CSV), of als een gedocumenteerde subset van het Requirements Interchange Format (ReqIF) of van
  tekst in Systems Modeling Language versie 2 (SysML v2), evalueert elk acceptatie-
  criterium, met zijn eenheid, tegen de waarden die een run schreef, en produceert een verificatie-
  kruisverwijzingsmatrix (VCRM), een SysML v2-model, een rapport over de impact van wijzigingen en een offline
  bewijspakket. Het draait en herberekent niets opnieuw, en leest alleen wat de open engine
  publiceert: de `result.json` van elke run (de velden die een criterium noemt, hun eenheden, de
  reproduceerbaarheidsstempel van scenariohash, seed, engineversie en schemaversie, en
  het label en de cijferniveaus van de run), de `report.json` (type, reproduceerbaarheidsrecord en
  mogelijkhedenlabels), het scenariobestand (de hash, het type, de seed en de parameters), het
  schema van veldeenheden (eenheid, herkomst en bewijsniveau van elk veld) en de
  verificatiematrix (het label VALIDATED, MODELLED of PARTNER van elke mogelijkheid).

<a id="support--professional-services"></a>
### Ondersteuning en professionele diensten

Kshana is gratis en open source onder de AGPL-3.0 en wordt **professioneel ontwikkeld en
onderhouden door Ashforde® OÜ** (Estland). De open engine is compleet en op zichzelf
bruikbaar. Voor organisaties die meer nodig hebben, biedt Ashforde® OÜ:

- **Commerciële ondersteuning en integratie** — Kshana inbedden in uw toolchain, maatwerk-
  scenario's en fixes met voorrang.
- **Maatwerk-sensormodellen** — gekalibreerd op uw hardware, inclusief exportgevoelige
  weerbaarheidsmodellen die in een privélaag worden onderhouden.
- **Kshana Pro** — propriëtaire tooling voor modelgebaseerde systems engineering (MBSE) en programma's
  die de eisen van een programma controleert tegen runs van de open engine en
  een verificatiekruisverwijzingsmatrix (VCRM), een model in Systems Modeling Language
  versie 2 (SysML v2), een rapport over de impact van wijzigingen en een offline bewijspakket produceert. Het
  draait niets opnieuw en leest alleen de gepubliceerde uitvoer van de engine: de `result.json`
  en `report.json` van elke run, het scenariobestand, het schema van veldeenheden en de verificatie-
  matrix (de volledige lijst staat onder [Edities](#editions)).
- **Ontwerp-, onzekerheids- en missietooling van Kshana Pro** — het Pareto-front van een ontwerp-
  ruimte, onzekerheid en gevoeligheid over duizenden runs, en een missie-
  dossier met één opdracht met een verificatiematrix en een PDF; zie [`docs/PRO.md`](docs/PRO.md).
- **Campagnebewaking, spectrumcoëxistentie en taakdienst van Kshana Pro** — een pipeline die
  faalt wanneer een bewaakt cijfer verslechtert, signaalplannen getest tegen de open
  satellietnavigatiesignalen in beide richtingen, en een on-premises takenwachtrij met een
  afleveringsregister met hashketen; zie [`docs/PRO.md`](docs/PRO.md).
- **Training en advies** over prestatieanalyse van kwantum-/klassieke PNT.

Dit is het open-coremodel: de engine heeft, en houdt, een open licentie; het bedrijf dat
het in stand houdt, draait op expertise, ondersteuning en de propriëtaire uitbreidingen — niet op licentiekosten.
Contact **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Onderzoek

Studies gebouwd op de open engine worden gepubliceerd op arXiv. Elke studie noemt de engine-opdracht
erachter, zodat de getallen opnieuw kunnen worden gegenereerd uit een vastgelegd scenario of studievoorbeeld.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Onderzoek gebouwd op de open engine: zes artikelen op arXiv, elke kaart met de naam van het artikel, de datum en categorie, en de engine-opdracht die de getallen opnieuw genereert. Dezelfde zes artikelen, met links en opdrachten, staan in de tabel hieronder." width="100%">
</picture>

| Artikel | Wat het laat zien | Engine-opdracht |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | De daling van de score van een GNSS-interferentiedetector zodra de omstandigheden verschuiven, kan alleen uit statistieken binnen de verdeling worden voorspeld, op een open synthetische testomgeving en daarna op open veldopnamen. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Een GNSS-tijdontvanger onder spoofing heeft geen eindige onvoorwaardelijke grens op de onopgemerkte tijdfout, dus het artikel geeft een voorwaardelijke, gekalibreerd op een opgenomen spoof via de ether uit de openbare JammerTest 2024-campagne. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Eén samengestelde weerbaarheidsscore is alleen een stabiele basis voor een beslissing waar één ontwerp domineert; waar ontwerpen met elkaar wedijveren, kan alleen al een andere weging de winnaar veranderen. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Afstandsmeting binnen een maanconstellatie laat de absolute positie van een oppervlaktestation niet waarneembaar; een vertraging uit very-long-baseline interferometry (VLBI) vanaf de Aarde herstelt die wanneer de constellatie schaars is, en verscherpt die wanneer ze rijk is. | het type `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Geplande constellaties van vier tot zes satellieten geven een slechte geometrie bij de zuidpool van de Maan, en een paar afstandsbakens op het oppervlak verhelpen dat veel goedkoper dan meer satellieten. | het type `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Precisieverdunning is niet gedefinieerd voor cislunaire volging met alleen afstanden, omdat de snelheid in een momentopname niet waarneembaar is, dus het artikel gebruikt de waarneembaarheids-Gramiaan op vier vlakke verre retrograde banen: alleen afstand heeft rang 2 van 4 in een momentopname en heeft een boog van ongeveer 2.09 h nodig om volledig waarneembaar te worden, waarbij de conditionering verbetert naarmate de boog langer wordt; afstandsverandering (doppler) geeft direct rang 4; en het gezamenlijk schatten van een station met satelliettoestanden en klokken blijft één rang tekortschieten, tenzij een externe interferometrische waarneembare grootheid wordt toegevoegd. Eisen horen thuis in budgetten voor booglengte, conditionering en meettype, niet in DOP. | het type `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (het verwante `cislunar-arc-recovery` test de drempel met een onafhankelijke schatter met eindige verschillen) |

De drie studievoorbeelden schrijven bytedeterministische artefacten (vaste seeds) die hun
engineversie, seeds en een configuratiehash vastleggen. De drie artikelen over de Maan en de cislunaire ruimte zijn gebouwd op de
maansuite (het bewijsniveau van elk onderdeel staat in de verificatiematrix); hun claims over geometrie en precisieverdunning worden ook kruisgecontroleerd
tegen afzonderlijke onafhankelijke referenties in `tests/validate_p*.rs`. Meer in
[Reproduceerbare studieartefacten](#reproducible-study-artifacts) onder Naslag.

<a id="cite"></a>
## Citeren

Als u Kshana gebruikt in academisch of technisch werk, citeer dan de versie die u hebt gebruikt, met het
scenario en de seed. [`CITATION.cff`](CITATION.cff) bevat de machineleesbare metadata, en
GitHub toont daaruit een knop "Cite this repository". Elke release wordt gearchiveerd op Zenodo;
de concept-DOI (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) verwijst altijd naar de
nieuwste versie.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

De artikelen hierboven:

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
## Licentie

Kshana heeft een dubbele licentie: de GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)), of een
**commerciële licentie** van Ashforde® OÜ voor gesloten integratie waarvoor de AGPL niet geschikt is.
[`LICENSING.md`](LICENSING.md) legt uit welke van toepassing is. Bijdragen worden inkomend gelicentieerd
onder de AGPL en geven Ashforde® OÜ ook het recht ze op te nemen in de commerciële
editie; onderteken elke commit met `git commit -s` (zie [`CONTRIBUTING.md`](CONTRIBUTING.md)).
"Kshana" en de bijbehorende merken zijn handelsmerken van Ashforde® OÜ: de licentie dekt de code, niet de
naam, dus geef forks een andere naam.

<a id="reference"></a>
## Naslag

Het lange materiaal, ingeklapt. Elk document staat vermeld onder [Documentatie](#documentation).

<details>
<summary>Installeren en bouwen vanuit de broncode</summary>

<a id="install--build"></a>
### Installeren en bouwen

Vereist een Rust-toolchain (≥ 1.88, de `rust-version` in Cargo.toml; ontwikkeld op 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Gebruik: de opdrachtregel volledig</summary>

### Gebruik

Draai elk scenario; de CLI kiest op basis van het veld `kind` van het scenario en schrijft
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` en
`<scenario>.report.json` ernaast — plus `<scenario>.table.csv` voor de typen die
een tabel publiceren. Het rapport (een HTML-pagina (HyperText Markup Language) en een JSON-document
met dezelfde inhoud) bevat een managementsamenvatting, elke invoer met zijn eenheid, de
resultaten en grafieken, de sweep-, Monte Carlo- of ketentabellen van een campagne, een tijdlijn van gebeurtenissen,
het label VALIDATED / MODELLED / PARTNER en de bron van elke mogelijkheid die de run gebruikte,
wat niet is gemodelleerd, en een reproduceerbaarheidsrecord (engineversie, Secure Hash
Algorithm 256-bit-digests (SHA-256), seed, platform en de exacte opdracht). Het laat zich vanuit de browser afdrukken als
een net PDF-bestand (Portable Document Format) op A4- of Letter-papier; de
engine schrijft zelf geen PDF. Zie [`docs/REPORTS.md`](docs/REPORTS.md).

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

`--export <czml|kml|geojson|stk|sigmf|all|list>` schrijft CZML (de Cesium Language), KML
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), Ansys STK-efemeriden (Systems Tool Kit) `.e`
en SigMF-opnamen (Signal Metadata Format) naast het scenario, en
`--import-route <route.geojson>` voert een GeoJSON-lijn in de typen die een spoor vliegen. Elk
formaat wordt gevalideerd tegen zijn gepubliceerde specificatie, en een scenario waarop een formaat niet
van toepassing is, zegt waarom: zie [docs/INTEROP.md](docs/INTEROP.md).

**Andere CLI-modi** — een scenario linten, echte aardoriëntatiegegevens invoeren of een hele suite draaien:

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

**Animatie-export.** `--animate svg|html|frames|all` schrijft `<scenario>.animation.svg`
(keyframes in Cascading Style Sheets (CSS), geen script), `<scenario>.animation.html` (afspelen, pauzeren, scrubben, snelheid en
gesynchroniseerde panelen, zonder externe bronnen) en `<scenario>.frames/` (`frame_0000.svg`, … plus
`manifest.json` met de frames per seconde en de duur). Een campagne speelt haar fasen en
alarmen af, een spectrumrun zijn waterval; het thema volgt `prefers-color-scheme` en
`prefers-reduced-motion` toont de voltooide afbeelding. Het geeft de eigen samples van de run weer,
byte-identiek bij een herhaalde run, en voegt geen bewijs toe. Zie [docs/ANIMATION.md](docs/ANIMATION.md).

Een **suite**-manifest is een klein TOML-bestand (Tom's Obvious, Minimal Language) — een `title` en een array `scenarios = [ … ]` met
scenariopaden — dat de engine een voor een draait, waarbij elk resultaat (met zijn
MODELLED / VALIDATED-labels) wordt samengevoegd in één zelfbeschrijvend studieartefact. Zie
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Rol in interoperabiliteit.** Kshana is de laag voor *prestatiesimulatie* die
naast de nabewerkingstoolchain staat, geen vervanging ervan: voer de **RINEX**-
uitvoer in RTKLIB of gLAB in voor een positieoplossing, en gebruik de **SP3**-uitvoer als
precies baanproduct voor tools zoals Ginan — Kshana beantwoordt *welke weerbaarheid een gegeven
PNT-architectuur oplevert* voordat u echte signalen hebt, in formaten die die tools al
inlezen (`--export-sp3`, of `export_sp3 = true` in een `orbit`-scenario, schrijft
`<scenario>.sp3`). Dezelfde baan kan worden gepubliceerd als **CCSDS OMM**-
gemiddelde elementen op normspoor (`--export-omm`, of `export_omm = true`, schrijft `<scenario>.omm`) —
één OMM 502.0 KVN-bericht (keyword = value notation) per door een TLE gedefinieerde satelliet, met het echte
NORAD-catalogusnummer (North American Aerospace Defense Command), de internationale COSPAR-aanduiding (Committee
on Space Research) en de epoche van elk object, voor elke
consument die OMM kent in plaats van een eigen two-line element set.

Voorbeelduitvoer (klok-holdover — let op hoe de prestatiecijfers voor integriteit en beveiliging worden gerapporteerd):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

De tijdfout van de optische klok op het 95e percentiel (p95) is 1.20e-4 ns: de samenvatting
drukt kleine waarden af met significante cijfers in plaats van ze af te ronden op `0.0`.
`security` toont `n/a (no attack)` omdat dit scenario geen aanval configureert, dus er
valt niets te detecteren. Het JSON-resultaat bevat nog steeds de analytische
grens voor spoofdetecteerbaarheid van elke klok in `fom.security` (0.997 voor de optische klok, 0.000 voor de
atoomklok op chipschaal, waarvan de eigen ruis over het bewakingsvenster de specificatie van 20 ns
overschrijdt), en het blok `figure_tiers` markeert dat cijfer als `applicable: false`. Het scenariotype `spoof`
scoort detectie tegen een geïnjecteerde aanval. `figure_tiers` geeft ook
elk gerapporteerd cijfer zijn verificatieniveau — VALIDATED (gecontroleerd tegen een externe onafhankelijke
referentie) of MODELLED — en de rij van de verificatiematrix waaruit het niveau wordt gelezen. Het baan-
scenario rapporteert daarnaast een geometrieblok — het aandeel samples met een positiebepaling, en
de beste/mediane positieprecisieverdunning (PDOP) en positienauwkeurigheid — naast het
klokresultaat.

> **Lees deze twee getallen zorgvuldig.** `security` is een *analytische grens voor
> spoofdetecteerbaarheid* afgeleid uit de stabiliteit van elke klok — die is alleen zinvol tegen een
> geconfigureerd spoofingscenario en is **geen** RAIM-detector voor meerdere satellieten. `integrity`
> is hier de *zelfconsistentie* van het filter (het aandeel uitvalsamples binnen zijn eigen k-sigma-
> grens), **geen** HPL/VPL-integriteitscijfer uit de luchtvaart. Zie
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Voor echte receiver-autonomous integrity draait het **scenariotype `integrity`**
> (`scenarios/integrity-raim.toml`) echte RAIM met momentopname en oplossingsscheiding
> (in ARAIM-stijl) over de gepropageerde constellatiegeometrie: het berekent per epoche
> horizontale/verticale **beschermingsniveaus (HPL/VPL)** en rapporteert het
> aandeel epochen dat de geconfigureerde alarmgrenzen haalt, met een Stanford-
> integriteitsdiagram voor classificatie van fout tegen PL (beschermingsniveau).

<a id="reproducible-study-artifacts"></a>
#### Reproduceerbare studieartefacten

Vier open studies genereren elk een bytedeterministisch artefact (vaste seed) opnieuw met één
opdracht — de getallen achter de studies naar het kruispunt van kwantum en klassiek, de optimismekloof bij RF-
verstoringen, de scoring van PNT-weerbaarheid en het timing protection level:

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

Elk artefact legt zijn engineversie, seeds en een configuratiehash vast en draagt een eerlijk
MODELLED/VALIDATED-label. De probes voor echte data (`*_probe`) draaien dezelfde pipeline over
opnamen die u lokaal aanlevert; er worden geen datasets in de repo meegeleverd. De studie naar de optimismekloof bij RF-
verstoringen is uitgewerkt in de preprint
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), en het voorwaardelijke timing
protection level (`tpl_jammertest` hierboven) in de preprint
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (zie [Citeren](#cite)).

Van de gepubliceerde studies naar maan-PNT ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP met oppervlaktebakens, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) VLBI-
waarneembaarheid en [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) cislunaire booglengte-
waarneembaarheid) zijn de claims over geometrie, precisieverdunning, real-time voorspelling van stelsel /
aardoriëntatieparameters (EOP), verre retrograde banen en RF-afstandsmeting
onafhankelijk kruisgecontroleerd in
`tests/validate_p*.rs` tegen afzonderlijke onafhankelijke referenties (`scipy.special.j1`, een onafhankelijke NumPy-
DOP-oplossing van `(HᵀH)⁻¹`, een NumPy-herparsing van dezelfde IERS `finals2000A`-rijen, en de
NASA/JPL Three-Body Periodic Orbit Database). Dit zijn aanvullende regressiecontroles op
de **gemodelleerde** maansuite; ze veranderen de telling van de machinaal gecontroleerde matrix niet.

</details>

<details>
<summary>Scenarioformaat</summary>

<a id="scenario-format"></a>
### Scenarioformaat

Scenario's zijn declaratieve TOML. Een `kind` op het hoogste niveau kiest het pakket — **vijftig** in
totaal (`clock` is de standaard als het wordt weggelaten): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (AI/ML-testomgeving voor de evaluatie van RF-verstoringsdetectie
— gelabeld synthetisch corpus + detectoronafhankelijk ROC/AUC-harnas +
optimismekloof binnen/buiten de verdeling), `quantum-trade` (afweging van kwantum- tegenover klassieke PNT
met inlezen van gemeten ADEV + envelop van weerbaarheid zonder GNSS; MODELLED),
`space-weather` (zonne-/geomagnetische indices + exosferische temperatuur volgens Jacchia-71 +
door activiteit aangestuurde thermosferische dichtheid boven de statische atmosfeer; MODELLED),
`oem-interop` (CCSDS OEM-import-/heen-en-terugbrug voor efemeriden van GMAT/Orekit/STK;
MODELLED), het missieanalysetrio `launch-window` (tweelichamen-lanceerazimut /
vlakverandering / mogelijkheden), `reentry` (ballistische terugkeercorridor volgens Allen-Eggers),
`eo-coverage` (geometrie van EO-strook / GSD / toegang / herbezoek), `space-packet` (CCSDS
133.0 TM/TC — telemetrie/telecommando — Space Packet-framing — exacte bitindeling, heen en terug geverifieerd), en
`attitude-budget` (zwaartekrachtgradiëntkoppel met 3 vrijheidsgraden + RSS-richtfoutbudget),
`passes` (voorspelling van op- en ondergang van grondstationpassages — AOS/TCA/LOS, maximale elevatie,
toegang), en `link-budget` (eenweg-linkvergelijking CCSDS/DSN — FSPL / Eb·N₀ /
marge / sluiting); `telecom-timing` (holdover-tijdfout, MTIE en TDEV gecontroleerd
tegen ITU-T-maskers); `spectrum` (de hele GNSS-L-band als één spectrale vermogensdichtheid:
een waterval van frequentie tegen tijd onder een gescripte tijdlijn met continuous-wave-, smalband-, chirp- of
matched-noise-jammers, jammer-signaalverhouding per band en effectieve
draaggolf-ruisdichtheid uit de spectrale scheidingscoëfficiënt, en invoer en uitvoer van opnamen in Signal Metadata
Format (SigMF) met spectrale schattingen volgens Welch; de signaal-
spectra VALIDATED tegen leerboekwaarden, het jammerscenario MODELLED; zie
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); hetzelfde type tekent panelen voor UHF-, S- en C-band met
ontworpen signalen in lage aardbaan); `leo-signal` (ontwerpen van positiebepalings-, navigatie- en
tijdsignalen in lage aardbaan voor elk systeem: bandbegrensde spectra, jitter van codevolging en
afstandsnauwkeurigheid, acquisitiezoektocht en -tijd, spectrale scheiding ten opzichte van GPS en Galileo, jammer-
tolerantie en een afweging van UHF- tot C-band, uit openbare voorinstellingen zoals Xona Pulsar, Iridium,
Starlink en CentiSpace of inline ontwerpen; de gesloten vormen en de LEO-doppler VALIDATED, de
ontwerpen MODELLED; zie [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (de Zon, de planeten, Pluto, de Maan en zeven grote
manen op één epoche — posities, constanten, lichttijden en baansporen; planeetposities
VALIDATED tegen JPL Horizons) en `body-pnt` (positiebepaling rond elk van die lichamen met een
lokale navigatieconstellatie en een diepe-ruimteverbinding vanaf de Aarde; MODELLED); `campaign` (bestaande typen samengesteld tot een gekoppelde missietijdlijn
waarbij de toestand tussen fasen wordt doorgegeven, een parametersweep, een geseed Monte Carlo-ensemble, of
meerdere scenario's onder één gedeelde voorwaarde; MODELLED, zie
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (Walker-delta- en ster-
patronen, elementlijsten en ontwerpen met meerdere schillen met voorinstellingen voor GPS, Galileo, BeiDou en GLONASS,
en dekking en precisieverdunning over een raster van breedte/lengte; de
generator en de wereldwijde GPS-DOP VALIDATED tegen de gepubliceerde dienstdocumenten, zie
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (een overgang van een
satelliet voor positiebepaling, navigatie en tijdsynchronisatie (PNT) in lage aardbaan (LEO) en zijn linkbudget band voor
band, uit elke constellatie en elk signaalontwerp: kijkhoeken, doppler en dopplersnelheid,
ITU-R-regen, -gas, -scintillatie en -verlies bij het binnendringen van gebouwen, draaggolf-ruisdichtheid tegenover de
zichtbare MEO-GNSS-satellieten, de ionosfeer van eerste orde en ionosfeervrije paren, en een
budget voor een positiebepaling met lage energie, ionosfeersondering uit elk bandpaar, en spoofingmonitoren op basis van
consistentie van doppler en overganggeometrie en op basis van consistentie tussen banden; de ITU-R-termen en de
dopplerenvelop voor een stilstaande gebruiker VALIDATED, de overgang MODELLED, zie
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (het uitgezonden
efemeride- en klokbericht van een PNT-satelliet in lage aardbaan (LEO), voor elke baan en
draaggolf: een fitter van een geïntegreerde referentiebaan naar de Kepler-set van Galileo, die set
met correctiepolynomen langs het spoor, dwars op het spoor en radiaal, het model met
22 parameters van Liu et al. 2025 of de ATOMIC-ECEF-polynoom zonder klok; signal-in-space-afstandsfout
(SISRE) tegen fitinterval en updateperiode, een continuïteitscontrole bij een update halverwege de overgang,
het eigen gedocumenteerde binaire frame van Kshana met een cyclische redundantiecontrole CRC-24Q en een kwantisatiebudget, en een
blok in RINEX-4-stijl dat is gelabeld als Kshana-uitbreiding; de SISRE-gewichten, het gebruikers-
algoritme van Galileo en CRC-24Q VALIDATED, de fits MODELLED; optionele voorinstellingen voor Xona Pulsar,
Iridium, Starlink, CentiSpace, een representatief C-bandsysteem, ATOMIC en Celeste IOD; zie
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); het trio **gefuseerde MEO + LEO-
PNT** `leo-pvt` (dopplerpositiebepaling uit afstandsverandering in lage aardbaan (LEO), gezamenlijke
GNSS + LEO-pseudoafstandsoplossingen met inter-systeembiases en de DOP tegen het aantal LEO-
satellieten, polaire en Arctische dekking, en LEO-tijdoverdracht naar UTC — over elke constellatie,
met optionele voorinstellingen zoals Xona Pulsar, Iridium en Starlink signals of opportunity; de
LEO-dopplerenvelop VALIDATED tegen gepubliceerde cijfers van Iridium en Xona), `leo-ppp`
(convergentie van precise point positioning met alleen GNSS en met LEO-augmentatie, vergeleken
met Li et al. 2019) en `ntn-positioning` (positiebepaling in 5G-niet-terrestrische netwerken uit de
Cramér-Rao-grens van de signaalbandbreedte), MODELLED afgezien van die envelop, zie
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (één LEO-PNT-systeem van begin
tot eind: een `leo-signal`-ontwerp gedragen door een `leo-pass`-band, de C/N0 van de overgang en de signal-in-space-afstandsfout
van het navigatiebericht doorgegeven aan een gefuseerde `leo-pvt`-positiebepaling en `leo-ppp`-
convergentie, elke overdracht vermeld; MODELLED, zie
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), dat ook het overzicht is van
elk LEO-PNT-type en -scenario, inclusief de weerbaarheidscampagnes, één scenario per
experimenteel aandachtsgebied en één per eindgebruikersverticaal); de **maan-PNT-suite** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; de **demonstrator voor kwantumondersteunde PNT**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; en de
onderzoekstypen voor **signaalbeveiliging, cislunaire en gelaagde weerbaarheid** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — het missieanalysetrio en deze latere typen allemaal MODELLED
(elk met een gevalideerde kern in gesloten vorm; zie de matrix).
Gemeenschappelijke velden: `seed`, een `[time]`-raster, een `[gnss]`-beschikbaarheidstijdlijn (de aandrijver
van de uitval), en blokken per sensor met `provenance`-strings die de bron van elk
cijfer aanhalen. Voorbeeld (klok):

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

Optionele velden (uit wanneer ze ontbreken): een klok kan `flicker_floor` toevoegen (1/f FM — frequentie-
modulatie — Allan-vloer); een inertiële sensor kan `gyro_bias` en `q_arw` toevoegen (gyroscoopbias en hoek-
random-walk), en `bias_instability` en `q_aa` (de Allan-vloer voor biasinstabiliteit en de
versnellings-random-walk) — samen een **foutbudget voor een versnellingsmeter met één as
(1-DOF)** (VRW/ARW — snelheids-/hoek-random-walk — en biasinstabiliteit). Dit is het foutbudget dat het meegeleverde
scenario*pakket* `inertial` draait. Daarnaast bevat de bibliotheek nu een geverifieerde
**driedimensionale strapdown-navigator** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
quaternionattitude met coning/sculling-compensatie, een volledige NED-mechanisatie
(termen voor aardrotatie en transportsnelheid, WGS-84-zwaartekracht volgens Somigliana), en een
deterministisch IMU-foutmodel waarin **schaalfactor, uitlijnfout,
g-gevoeligheid, kwantisatie en snelheidshelling zijn gemodelleerd** (IEEE Std 952-1997, de IEEE-
norm voor specificatie en testprocedures van gyroscopen, §A.2; Groves 2013 §4.3). Dat driedimensionale pad is nu **aangesloten op een uitvoerbaar
losjes gekoppeld GNSS/INS-pakket** (`kind = "gnss-ins"`): een fouttoestands-EKF met 15 toestanden
stuurt de strapdown-oplossing bij tegen ruizige positiebepalingen zolang GNSS beschikbaar is, en loopt daarna
vrij door de uitval, waarbij de gefuseerde horizontale fout wordt gerapporteerd tegenover de
vrijloop van een vrije INS in open lus. Er is ook een **strak gekoppelde pseudoafstands**update
beschikbaar (die vormt de innovatie in het afstandsdomein, zodat ze blijft corrigeren
met minder dan vier satellieten). Een
klok-holdoverscenario kan `runs` (> 1) toevoegen om een **Monte Carlo-ensemble** te draaien — elk
prestatiecijfer wordt dan gerapporteerd als gemiddelde met een spreiding van het 5e–95e percentiel en de
grafiek arceert de betrouwbaarheidsband van de fout (zie `scenarios/clock-ensemble.toml`).

Een `fusion`-scenario (dezelfde blokken als `hybrid`) draait **twee onafhankelijke Kalman-schatters**
— één voor de kloktoestand, één voor de positietoestand — bijgestuurd door GNSS en ondersteund door
optische tijdoverdracht, en rapporteert een gecombineerde holdover-FoM. De twee blokken delen geen
kruiscovariantie: dit is een gestapeld paar foutbudgetten, **geen** echt gekoppeld
gezamenlijk klok+positie-filter (covariantie tussen blokken staat op de roadmap). Zie
`scenarios/fusion-pnt.toml`.

Een `spoof`-scenario injecteert een tijdspoof — een van vier `[attack.shape]`-soorten
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; een losse `rate_ns_per_s` wordt nog steeds
geaccepteerd als lineaire helling) — en draait de spoofdetector van elke klok. De detector is een
tweezijdige **χ²₁-energie- / Neyman–Pearson-test** op de klokondersteunde monitorstatistiek:
de drempel wordt ingesteld vanuit een doelbudget voor valse alarmen `target_pfa`, en de
**kans op gemiste detectie `P_md`** wordt zowel in gesloten vorm als via
Monte Carlo gerapporteerd (`mc_runs` proeven per hypothese — de twee komen overeen tot op enkele ×1/√N). Het
**beveiligingsprestatiecijfer is `1 − P_md`** bij de operationeel schadelijke (specificatie-)
grootte, zodat een stille klok die een spoof ter grootte van de specificatie opvangt ≈ 1 scoort en een ruizige
die hem vaak mist lager scoort (zie `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Een `gnss-sim`-scenario is een simulatie in het **meetdomein**: voor elke zichtbare
satelliet synthetiseert het de pseudoafstand `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` en de L1-doppler, met de **Klobuchar**-ionosfeer voor één frequentie
(`[iono]`, IS-GPS-200 §20.3.3.5.2.5) en de zenitale **Saastamoinen**-
troposfeer, geprojecteerd met de afbeeldingsfunctie van **Niell (1996)** (`[tropo]`). De
residuen voeden **RAIM met momentopname** voor HPL/VPL per epoche, en de pseudoafstand, doppler,
C/N₀ en iono-/tropocorrecties van elke satelliet worden uitgegeven in de JSON-array
`gnss_measurements`. Het is een voorwaartse simulator (die metingen genereert uit
een bekende referentie), geen ontvanger/oplosser — een run zonder ruis reproduceert de geometrie plus de
correcties tot onder een millimeter (zie `scenarios/gnss-sim-raim.toml`).

Een `jamming`-scenario modelleert RF-interferentie als een **linkbudget**: een `[jammer]`
(ECEF-positie, zendvermogen `power_dbw`, type) verhoogt de jammer-signaalverhouding bij een
`[receiver]` die een Walker-`[constellation]` volgt. Uit de geometrie (vrije-ruimte-
padverlies en de ontvangstantenneversterking per richting) berekent het voor elke satelliet de
`J/S`, de **effectieve C/N₀** via de standaard anti-jamvergelijking (despreading-
verwerkingswinst × de spectrale scheidingsfactor `Q`; Kaplan & Hegarty §9.4), en
markeert verlies van lock onder een instelbare volgdrempel — waarbij het een
prestatiecijfer `availability_under_jamming` rapporteert. Een breedbandige jammer van 10 W op 1 km
ontzegt de ontvanger volledig (J/S ≈ 72 dB); dezelfde jammer op 100 km
degradeert alleen de links (zie `scenarios/jamming-demo.toml`).

Een `sweep`-scenario draait een **afwegingsstudie**: het varieert één `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` of `classical_q_wf`) van `start` tot `stop` over `steps`
punten op een `lin`- of `log`-`scale`, legt een `metric` (bijv. `holdover_s`) vast voor beide
klokken, en zet de twee curven in een grafiek. Het basisscenario staat onder `[base]` (zie
`scenarios/sweep-clock-stability.toml`).

Een `sweep-nd`-scenario veralgemeent dit naar **elk pakket en elk aantal assen**: het
varieert TOML-sleutels met punten van een `[base]`-scenario (van elk `kind`) over het cartesisch
product van `[[axes]]`, draait elk rasterknooppunt opnieuw, en legt `metrics` vast die als
JSON-paden met punten in het resultaat zijn opgegeven (bijv. `classical.fom.holdover_s`). Het werkt voor
elk pakket omdat het werkt op de grens tussen TOML en resultaat; native runs evalueren
het raster parallel (geen extra afhankelijkheid, wasm valt terug op sequentieel) en de
uitvoer is deterministisch en rijgeoriënteerd (zie `scenarios/sweep-nd-inertial.toml`).

Een `orbit`-scenario leidt de `[gnss]`-tijdlijn af uit de geometrie in plaats van die
te schrijven — geef een `[user]`-baan, een `[constellation]`, een elevatiemasker `mask_deg` en de twee
klokblokken. Het rapporteert ook de positienauwkeurigheid uit de satellietgeometrie; de
optionele `sigma_uere_m` (1-sigma gebruikersequivalente afstandsfout, standaard 1 m) schaalt de
positieprecisieverdunning naar een positiesigma. De gebruikersbaan kan
**excentrisch** worden gemaakt met `eccentricity` en `argp_deg`, en `j2 = true` voegt de seculaire drift
door de afplatting van de aarde toe (zie `scenarios/orbit-molniya.toml`). De constellatie kan in plaats daarvan een
**echte** zijn: geef `[constellation]` een `tle`-blok met two-line element sets en de
satellieten worden daaruit geparseerd (zie `scenarios/orbit-real-tle.toml`). Voeg een of meer
`[[constellations]]`-blokken toe voor **multi-GNSS** (bijv. GPS + Galileo; zie
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

De typen voor **alt-PNT zonder GPS** navigeren helemaal zonder GNSS, door een gemeten veld-
reeks via een deeltjesfilter tegen een kaart te matchen. Een `gravity-map`-scenario vliegt een spoor
door een bolfunctie-zwaartekrachtanomalieveld en herstelt het uit de aflezing van een koude-atoom-
gravimeter (`scenarios/gps-denied-gravity-nav.toml`); een `terrain-nav`-scenario
doet hetzelfde tegen een SRTM-hoogte-DEM (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
en een `combined-altpnt`-scenario fuseert **zwaartekracht + IGRF-magnetisch + terrein** in één filter
(`scenarios/combined-altpnt.toml`).

Een `lunar-integrity`-scenario evalueert **cislunaire** PNT: het draait een ARAIM-doorgang voor het beschermingsniveau
bij de zuidpool van de Maan tegen een LunaNet/LNIS-relaisset en rapporteert eerlijk de
integriteitskloof — een σ_URE van ~30 m bij de Maan drijft het beschermingsniveau ruim boven een alarmgrens van 50 m,
dus de dienst is *niet beschikbaar* onder integriteitsregels in luchtvaartstijl
(`scenarios/lunanet-araim.toml`).

Een `lunar-time-offset`-scenario rapporteert de **relativistische kloksnelheid Aarde–Maan** — de
basis van een Lunar Coordinate Time-schaal (LTC/TCL). Een post-Newtoniaanse identiteit vanuit eerste principes
telt het verschil in eigenpotentiaal (IAU-geoïdepotentiaal `L_G` min de eigenpotentiaal
aan het maanoppervlak) en de kinetische term van de Maan (doppler van de tweede orde) op tot een seculaire
snelheid van ≈ 57 µs/dag, gerapporteerd met de gepubliceerde band van 56–59 µs/dag; het geeft ook de
opgebouwde LTC−TT-offset over een horizon en een ensemble met inverse-variantieweging (een
papieren klok voor de Maan). **MODELLED** — het hoofdcijfer is *afhankelijk van de referentie* (geoïde van de Aarde
tegenover selenoïde van de Maan, middelingsvenster), en daarom wordt een band gerapporteerd, geen enkel gecertificeerd
getal (`scenarios/lunar-time-offset.toml`).

Zie `scenarios/` voor ten minste één uitgewerkt voorbeeld van elk type (92 typen, 193 scenario-
`.toml`-bestanden + 1 suitemanifest — verscheidene typen leveren meer dan één voorbeeld). Niet elk
type heeft een bestand dat naar het type is genoemd: `lunar-integrity` → `scenarios/lunanet-araim.toml` en
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` zijn twee van meerdere zulke gevallen.
Toon de uitvoerbare typen op elk moment met de foutmeldingen van `cargo run -- --validate <file>`,
de Python-functie `list_kinds()` of de MCP-tool `list_scenario_kinds`.

</details>

<details>
<summary>Uitvoer</summary>

### Uitvoer

Het resultaatartefact is geversioneerde, zelfbeschrijvende JSON: tijdreeksen per stap, de
gescoorde prestatiecijfers, de actieve modelspecificaties (met herkomst), de seed, een
**scenariohash** — zodat elke grafiek uit het bestand kan worden gereproduceerd — en, voor elke klok,
een `adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): de overlappende
Allan-deviatie over middelingstijden op octaafafstand — de standaardmanier om de stabiliteit van een klok
te lezen — nu met een **95%-betrouwbaarheidsband per ruistype** per punt (het
machtswettype van de registratie wordt bepaald uit de helling van de gemodificeerde Allan-deviatie, en het χ²-interval gebruikt de
bijbehorende effectieve vrijheidsgraden van NIST SP 1065). De speeltuin in de browser geeft het weer als een
log-log-grafiek "Clock stability (ADEV)". (MDEV, TDEV en HDEV zijn beschikbaar als bibliotheek-
schatters; de geëxporteerde resultaatcurve is de overlappende ADEV.) Elk veld, met eenheden en een
bronverwijzing, is gedocumenteerd in [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Elke grafiek beschrijft zichzelf.** De speeltuin in de browser, de `*.chart.svg`-export
van de CLI en de HTML-scorekaart (HyperText Markup Language) stempelen elke grafiekafbeelding met een voettekst
`Kshana v<version> · scenario <hash> · kshana.dev`. De `scenario <hash>` is de eerste
12 hexadecimale tekens van de **scenariohash** van de run — een SHA-256-digest (het 256-bit Secure Hash Algorithm) over de canonieke scenario-
definitie (seed, drempels, modelparameters, GNSS-vensters, …); de integriteits- en maan-
rapporten, die geen eigen hash hebben, vallen terug op een SHA-256 van de scenariobron.
Het is **dezelfde vingerafdruk** als in de samenvatting van één regel en het resultaat-JSON, dus een
opgeslagen of geplakte grafiek draagt altijd zijn versie, het exacte scenario dat haar produceerde (voor
reproductie bit voor bit), en de bron — verander een invoer en de hash verandert.

De prestatiecijfers volgen de standaard operationele PNT-prestatiecijfers:

| Prestatiecijfer | Hoe Kshana het berekent |
|-----------------|------------------------|
| Timing Performance (klok-/baanpakketten) | RMS van de klokfasefout + 95e percentiel over de uitval, in **nanoseconden** (`timing_rms_ns`) — een tijdmetriek, geen positie |
| Positioning Performance (inertiële/hybride pakketten) | RMS van de positiefout met 1 vrijheidsgraad + 95e percentiel over de uitval, in **meters** (`pos_rms_m`); één as. Eén enkele run wordt gemarkeerd met `monte_carlo: false`; stel `runs = N` in voor een Monte Carlo-ensemble dat van elke metriek het gemiddelde, de spreiding en het bootstrap-95%-BI (betrouwbaarheidsinterval) rapporteert. Nog steeds **geen** 2-D CEP/2DRMS (circular error probable / tweemaal de kwadratisch gemiddelde afstand) of DOP-gewogen nauwkeurigheid (die vereisen het driedimensionale model — roadmap) |
| Autonomy | holdoverduur — tijd binnen de specificatie na verlies van GNSS (gekwantiseerd op het raster: een ondergrens) |
| Resilience | helling van de foutgroei tijdens de uitval |
| Availability | aandeel van de run met een oplossing binnen de specificatie |
| Integrity | **zelfconsistentie** van het filter — aandeel uitvalsamples waarvan de fout binnen de eigen k-sigma-grens van het Kalman-filter blijft. **Geen** HPL/VPL/RAIM-integriteitscijfer uit de luchtvaart (zie [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Security | **analytische grens voor spoof*detecteerbaarheid*** uit de klokstabiliteit — hoe klein/traag een tijdspoof een consistentiemonitor met één klok zou kunnen markeren. Alleen zinvol met een geconfigureerde aanval; **geen** RAIM-detector voor meerdere satellieten |

Nieuw met deze termen? Elk ervan wordt in gewone taal gedefinieerd in de [verklarende woordenlijst](docs/GLOSSARY.md).

</details>

<details>
<summary>Indeling van de repository</summary>

### Indeling van de repository

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
<summary>Veelgestelde vragen (FAQ)</summary>

### Veelgestelde vragen

**Moet ik kwantumfysica begrijpen om dit te gebruiken?**
Nee. Als u een opdrachtregel kunt gebruiken, kunt u Kshana draaien. Begin met de
[inleiding in gewone taal](docs/CONCEPTS.md); zoek termen op in de [verklarende woordenlijst](docs/GLOSSARY.md).

**Is dit een ontwerp voor kwantumhardware of vluchtsoftware?**
Nee. Het is een prestatie*simulator*. De getrouwheid van kwantumhardware komt uit gepubliceerde
foutmodellen, niet uit deze tool. Zie [Wat het is / niet is](#what-it-is--is-not).

**Zijn de kwantumresultaten realistisch, of marketing?**
Elke parameter wordt aangehaald uit een datasheet of artikel, elk model is gevalideerd tegen een
leerboekrelatie, en de volwassenheid wordt eerlijk gelabeld in
[VALIDATION.md](docs/VALIDATION.md) — inclusief dat er nog geen optische strontiumklok heeft
gevlogen. De engine is neutraal: kwantum en klassiek zijn dezelfde code met andere
gepubliceerde getallen.

**Kan ik erop vertrouwen dat twee runs overeenkomen?**
Ja — runs zijn deterministisch: `scenario + seed + engine version → bit-identical output`,
afgedwongen door `scripts/check-reproducible.sh`.

**Kan ik het vanuit Python of in een browser gebruiken?**
Ja — zie [Installeren](#install): de voorbeelden voor Python en WebAssembly staan daaronder. Beide roepen dezelfde engine aan.

**Hoe modelleer ik mijn eigen sensor?**
Schrijf een scenario-`.toml` met de gepubliceerde cijfers van uw sensor in de `provenance`-
velden. Zie [Scenarioformaat](#scenario-format) en de voorbeelden in `scenarios/`.

**Is het gratis voor commercieel gebruik?**
Ja — onder de AGPL-3.0, ook in commerciële omgevingen, zolang u de
copyleft van de AGPL respecteert (met name: als u Kshana wijzigt en via een netwerk aanbiedt, moet u
die gebruikers uw gewijzigde broncode aanbieden). Als dat niet bij u past — bijv. omdat u
Kshana in een propriëtair product moet inbedden of een gesloten netwerkdienst draait — is een commerciële
licentie verkrijgbaar bij Ashforde® OÜ; zie [`LICENSING.md`](LICENSING.md) en
[Ondersteuning](#support--professional-services).

</details>

<details>
<summary>Probleemoplossing</summary>

### Probleemoplossing

**`cargo build` faalt op een oude toolchain.** Kshana vereist Rust ≥ 1.88. Werk bij met
`rustup update`.

**Het bouwen van de Python-extensie faalt bij het linken op macOS** (`Undefined symbols … _Py…`).
Een Python-extensie lost haar symbolen op bij het laden. `maturin` stelt de juiste linker-
vlag automatisch in — gebruik `maturin develop --features python` in plaats van een kale
`cargo build`.

**De Python-build klaagt dat de interpreter nieuwer is dan PyO3 kent.** Stel
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` in (abi3-wheels zijn voorwaarts compatibel over
CPython-versies heen).

**De WebAssembly-build kan het target niet vinden.** Installeer het eenmalig met
`rustup target add wasm32-unknown-unknown`, daarna `wasm-pack build --target web -- --features wasm`.

**Waar is mijn uitvoer gebleven?** Elke run schrijft `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` en `<scenario>.report.json` naast
de invoer-`.toml`, en
ook `<scenario>.table.csv` voor de typen die een tabel publiceren. Ze worden allemaal
bewust door git genegeerd.

</details>

<details>
<summary>Versiebeheer en releases</summary>

### Versiebeheer en releases

Kshana volgt [Semantic Versioning](https://semver.org). Zolang de versie vóór 1.0 ligt, kan het openbare
scenario-/resultaatschema nog veranderen; brekende wijzigingen worden expliciet vermeld in
de [`CHANGELOG.md`](CHANGELOG.md). Elk resultaat is reproduceerbaar uit
`scenario + seed + engine version`.

**Elke `vX.Y.Z`-tag publiceert alle kanalen automatisch, in één volgorde** — de volledige
testsuite draait eerst op de getagde commit, er wordt niets gepubliceerd totdat die slaagt, en
daarna controleert de pipeline dat elk register de nieuwe versie werkelijk serveert
([`docs/RELEASING.md`](docs/RELEASING.md)). De kanalen:

| Kanaal | Installeren / verkrijgen | Inhoud |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | Rust-bibliotheek + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | de MCP-server |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | abi3-wheels (Linux/macOS/Windows) + sdist (brondistributie) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | WebAssembly-module + JS-wrapper |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | multi-arch OCI-image (Open Container Initiative) — geen toolchain nodig |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | starter: downloadt het binaire releasebestand, verifieert `SHA256SUMS`, draait het |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | dezelfde starter voor Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | het binaire bestand `kshana-mcp`, gegenereerd uit de `SHA256SUMS` van elke release |
| Claude Desktop | dubbelklik op `kshana-mcp-<target>.mcpb` uit de release | de extensie, met het binaire bestand erin |
| officieel MCP-register | automatisch gevonden door MCP-clients | `io.github.ashfordeOU/kshana-mcp` (OCI-image, npm- en PyPI-pakketten) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → zoek "Kshana" | de IDE-plug-in **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | downloaden | het binaire opdrachtregelbestand `kshana` voor Linux x86-64, macOS (Apple silicon en Intel) en Windows x86-64, het binaire bestand `kshana-mcp` voor elk van die systemen en Linux Arm, een Claude Desktop-extensie `.mcpb` per systeem, een CycloneDX-**SBOM**, **SLSA**-bouwherkomst, een HTML-validatiesamenvatting en een controlesombestand `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | een citeerbaar archief van elke release |
| [kshana.dev](https://kshana.dev) | openen in een browser | Kshana Studio, de WebAssembly-app in de browser, opnieuw gebouwd vanuit elke releasetag (dus de versie die ze toont, is de versie die ze draait) |

De versie van de crate / het image / de registervermelding van de MCP-server volgt de engine (die bundelt de
bibliotheek); de JetBrains-plug-in heeft een eigen versienummering (die roept uw geïnstalleerde
binaire bestand `kshana` aan).

</details>

<details>
<summary>Roadmap</summary>

### Roadmap

Zie [`ROADMAP.md`](ROADMAP.md) voor de gefaseerde roadmap, [`CHANGELOG.md`](CHANGELOG.md)
voor de releasegeschiedenis, en [`docs/CAPABILITY.md`](docs/CAPABILITY.md) voor de
roadmap per mogelijkheid. De prioriteitsvolgorde is: **eerst bewijs voor tijdsynchronisatie en holdover voor
kritieke infrastructuur** (telecommaskers, langere holdover met veroudering en flicker-
ruis, inlezen van gemeten klokdata); **als tweede de neutrale methode voor afweging van kwantum tegenover klassiek**
(resultaten gelabeld als MODELLED totdat gemeten data van een partner ze promoveert); en
**navigatie bij de Maan / in de cislunaire en diepe ruimte onderhouden**, niet uitgebreid als speerpunt. De **ITRF-precieze stelselreductie** is nu geleverd — de
volledige op CIO gebaseerde IAU 2006/2000A GCRS↔ITRS-keten (poolbeweging + nutatie onder een boogseconde),
bit voor bit gevalideerd tegen SOFA/ERFA en onafhankelijk kruisgecontroleerd tegen ANISE
(SPICE in pure Rust) tot ≤ 3.6 m op GNSS-baanhoogte. Items op korte termijn omvatten strak gekoppelde draaggolffasefusie en het zichtbaar maken van de
losjes/strak gekoppelde GNSS/INS-navigator in meer pakketten; de engine voor **radiometrische navigatie in de diepe ruimte / bij
Mars** is geland in v0.17.0 (gevalideerd in simulatie). De
**laag voor kwantumfysica** is een **P2**-item: de CAI-versnellingsmeter wordt nu gesimuleerd vanuit
eerste principes (Mach–Zehnder-fase, projectieruis, contrastverval, trillings-
koppeling), terwijl de sensoren voor klok/tijdoverdracht nog worden aangestuurd door gepubliceerde
coëfficiënten van Allan-/ruisbudgetten. Op GMST gebaseerde TEME&harr;ECEF, de IERS-
tijdsystemen met schrikkelseconden (UTC/TAI/TT/UT1), SGP4/SDP4-baanpropagatie (v0.7.0,
gevalideerd tegen de AIAA 2006-6753-vectoren), en het uitvoerbare `gnss-ins`-fusie-
pakket zijn allemaal **geleverd**, en de inertiale snelheid wordt stroomafwaarts beschikbaar gemaakt. Een actieve
stochastische tijdspoofdetector (Neyman–Pearson / χ²₁-energietest met Monte Carlo-
P_fa/P_md en een beveiligings-FoM van 1−P_md), een jammingmodel op basis van linkbudget (J/S → effectieve
C/N₀ → verlies van lock), beschikbaarheid over meerdere constellaties, een IMU-foutbudget met één as (1-DOF),
twee onafhankelijke Kalman-schatters (klok + positie) gerapporteerd als een
gecombineerde FoM, echte constellatiegeometrie uit TLE's, een HTML-scorekaartrapport,
uit geometrie afgeleide GNSS-beschikbaarheid
*en* precisieverdunning uit Kepler-banen met excentriciteit en J2-drift,
Monte Carlo-betrouwbaarheidsbanden, parametersweeps voor afwegingsstudies, een WebAssembly-
speeltuin in de browser, en optionele bindingen voor Python (PyO3) en WebAssembly (wasm-bindgen) zijn
geland op `main`.

</details>

<details>
<summary>Bijdragen</summary>

### Bijdragen

Zie [`CONTRIBUTING.md`](CONTRIBUTING.md). Kort gezegd: tests slagen (`cargo test`), de
twee bewakingsscripts slagen, Conventional Commits, en een `CHANGELOG.md`-vermelding onder `[Unreleased]`
voor elke voor gebruikers zichtbare wijziging. Deelname valt onder onze
[Gedragscode](CODE_OF_CONDUCT.md). Om een beveiligingsprobleem te melden, zie het
[Beveiligingsbeleid](SECURITY.md) — open geen openbare issue voor kwetsbaarheden.

</details>

<details>
<summary>Documentatie: elk document, en voor wie het is</summary>

<a id="documentation"></a>
### Documentatie

| Document | Voor wie | Wat erin staat |
|----------|----------|--------------|
| [Inleiding in de concepten](docs/CONCEPTS.md) | iedereen, begin hier | wat Kshana doet en waarom, van nul tot de fysica |
| [Kshana Studio](web/README.md) | iedereen | de engine in uw browser draaien (WebAssembly); notities over bouwen en uitrollen |
| [Verklarende woordenlijst](docs/GLOSSARY.md) | iedereen | definities in gewone taal van elke term |
| [Scenariotypen](docs/KINDS.md) | iedereen | elk type dat de engine kan uitvoeren: wat het doet, de velden, een voorbeeldopdracht, de registerrijen en de grafiek die de engine ervoor schrijft |
| [Partnerdata](docs/PARTNER-DATA.md) | laboratoria en makers met gemeten data | welke MODELLED-rijen een gemeten klok- of IMU-registratie zou kunnen promoveren, de formaten, hoe een inzending wordt gecontroleerd (`kshana partner check`), gescoord en vermeld |
| [Architectuur](docs/ARCHITECTURE.md) | ontwikkelaars / beoordelaars | modulekaart, engine-pipeline, dispatch en diagrammen |
| [Validatiestatus](docs/VALIDATION.md) | beoordelaars / citeerders | wat `validated` is tegenover `not modeled`, met bewijs |
| [Verificatiematrix](docs/VERIFICATION-MATRIX.md) | beoordelaars / citeerders | het machinaal gecontroleerde bewijsregister — elke mogelijkheidsrij met haar status, module, test en externe onafhankelijke referentie, gegenereerd uit `src/verification.rs` |
| [Onderbouwing van Modelled](docs/MODELLED-RATIONALE.md) | beoordelaars | waarom elke **Modelled**-rij geen externe onafhankelijke referentie heeft, rij voor rij vermeld |
| [Herkomst](docs/PROVENANCE.md) | beoordelaars / citeerders | elke sensorparameter, elk model en elke dataset herleid tot de gepubliceerde bron, in één citeerbare tabel |
| [Reproduceerbaarheid en herkomst](docs/REPRODUCIBILITY.md) | beoordelaars / packagers | determinismegaranties, vastleggen van referentie-uitvoer, SBOM (software bill of materials), bouwherkomst |
| [Platformtags van wheels](docs/WHEEL_TAGS.md) | packagers | de matrix van abi3-Python-wheels — welke platformtag `pip install kshana` oplost |
| [Positionering](docs/POSITIONING.md) | evaluatoren | waar Kshana staat ten opzichte van RTKLIB/gLAB (aanvullend), en de browserlaag zonder installatie |
| [Kshana Pro](docs/PRO.md) | evaluatoren / programmamanagers | wat de propriëtaire Pro-laag toevoegt bovenop dezelfde engine: ontwerpoptimalisator, onzekerheid en gevoeligheid, missiedossier, campagnebewaking, spectrumcoëxistentie, on-premises taakdienst, traceerbaarheid van eisen; wat elk ervan produceert en wat het niet doet |
| [Technisch rapport](paper/kshana-technical-report.md) · [JOSS-artikel](paper/paper.md) | beoordelaars / citeerders / evaluatoren | het volledige uitgebreide onderzoeksartikel — architectuur, modellen per domein, validatie, casestudies en beperkingen — plus de beknopte JOSS-inzending (Journal of Open Source Software) |
| [SGP4-validatie](docs/SGP4-VALIDATION.md) | beoordelaars / citeerders | overeenstemming met de AIAA 2006-6753-referentie (666 toestanden, ~4 mm) **en** een rechtstreekse vergelijking met de onafhankelijke `sgp4`-crate (overeenstemming tot onder een micron / 4.12 mm) |
| [Validatie van het krachtmodel](docs/AGENCY-ORBIT-VALIDATION.md) | beoordelaars / citeerders | de engine met volledig krachtmodel (`src/precise_od.rs`) gefit op efemeriden van agentschappen — methodologie en gevalideerde residuen |
| [Handleiding echte TLE's](docs/REAL_TLE_GUIDE.md) | gebruikers | scenario's aansturen met echte constellatie-TLE's van Celestrak / Space-Track (tegenover de meegeleverde synthetische Walker-set) |
| [Integriteits-FoM](docs/INTEGRITY.md) | evaluatoren | wat de cijfers `integrity` / `security` betekenen — en wat ze **niet** zijn ten opzichte van HPL/VPL in de luchtvaart |
| [ARAIM-naslag](docs/ARAIM_REFERENCE.md) | beoordelaars / integratoren | de open MHSS-ARAIM-implementatie van het beschermingsniveau — de nominale-biasprojectie `b_k`, σ_URA tegenover σ_URE, en de a-prioriwaarden van de foutmodi |
| [Kwantummodellen](docs/QUANTUM.md) · [details](docs/QUANTUM-MODELS.md) | beoordelaars | de fysicalaag van de koude-atoominterferometer, en waar coëfficiënten nog worden opgezocht |
| [Normen](docs/COMPLIANCE.md) | evaluatoren | de reikwijdte van de DO-229E- / DO-316-algoritmen, en wat **geen** claim van conformiteit is |
| [Maritiem vertrouwen](docs/MARITIME-TRUST.md) | zeevarenden / integratoren | de GNSS-vertrouwensscore van 0-100 voor de NMEA van een vaartuig, de monitoren en de grenzen ervan (adviserend, geen typegoedgekeurde navigatieapparatuur) |
| [NMEA-trainingsstromen](docs/NMEA-TRAINING.md) | maritieme trainers | synthetische NMEA voor de brug met gescripte jamming en spoofing en een instructeurslogboek; alleen tekst, nooit voor live navigatie |
| [Interferentiekaart](docs/INTERFERENCE-MAP.md) | analisten / zeevarenden | waar vliegtuigen en schepen gedegradeerde navigatiegegevens meldden, en hoeveel van een route dat raakt |
| [Bewijspakketten](docs/EVIDENCE-PACKS.md) | exploitanten / verzekeraars | ondertekende technische registers van een vertrouwensgebeurtenis en hoe u er een verifieert |
| [Vertrouwenstelemetrie](docs/TRUST-TELEMETRY.md) | operationele / beveiligingsteams | de vertrouwensstroom als Prometheus-metrieken, SIEM-gebeurtenissen en OpenTelemetry, met een Grafana-dashboard |
| [Maritieme integraties](docs/MARINE-INTEGRATIONS.md) | booteigenaren / integratoren | de Signal K-plug-in, de poortmodus van OpenCPN en de referentiebouw |
| [Testbank](docs/TEST-BENCH.md) | ontvangerfabrikanten | een geëxporteerd scenario afspelen via een laboratoriumsimulator en de registratie van de ontvanger scoren |
| [Normentoewijzing](docs/compliance/README.md) | evaluatoren | openbare weerbaarheidskaders toegewezen aan uitvoer van Kshana, met bronnen en kloven; `kshana compliance-report` |
| [Notebooks](notebooks/README.md) | gebruikers | uitvoerbare tutorials met hun weergegeven tekst |
| [Normen en interoperabiliteit](docs/STANDARDS.md) | integratoren | de uitwisselingsformaten voor GNSS / vluchtdynamica / agentschappen die Kshana leest en schrijft (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [LEO-PNT-fusie](docs/LEO-PNT-FUSION.md) | gebruikers / evaluatoren | gefuseerde MEO + LEO-positiebepaling, -navigatie en -tijdsynchronisatie: doppler, gezamenlijke pseudoafstand, PPP-convergentie, 5G NTN, polaire dekking en LEO-tijdoverdracht over elke constellatie; de optionele voorinstellingen en hun openbare bronnen |
| [Campagnes](docs/CAMPAIGNS.md) | gebruikers / evaluatoren | scenario's samenstellen: gekoppelde missietijdlijnen, parametersweeps, Monte Carlo-ensembles en runs met gedeelde voorwaarde, met de samenstellingsidentiteiten die de tests vastleggen |
| [Scenariocatalogus](docs/SCENARIOS.md) | gebruikers / integratoren | elk uitvoerbaar type met zijn verplichte en optionele TOML-velden — gegenereerd uit `api::list_scenario_kinds()` |
| [Resultaatschema](docs/SCHEMA.md) | integratoren | elk veld van het resultaat-JSON, met eenheden en een bronverwijzing |
| [Python-API](docs/PYTHON_API.md) | Python-gebruikers | het PyO3-bindingsoppervlak — de engine aanroepen, de scenario-/resultaattypen, en voorbeelden |
| [Claims tegenover werkelijkheid](docs/CLAIMS-VS-REALITY.md) | beoordelaars | het register voor het afsluiten van overclaims + de CI-bewaking (`tests/no_overclaims.rs`) die het opgelost houdt |
| [Roadmap](ROADMAP.md) | iedereen | de gefaseerde roadmap — wat is geleverd en wat volgt |
| [MCP-server](mcp/kshana-mcp/README.md) · [JetBrains-plug-in](ide/jetbrains/README.md) | agents / IDE-gebruikers | Kshana draaien vanuit een AI-assistent of een JetBrains-IDE |
| [Handleiding voor agents](docs/AGENTS.md) · [Oppervlakken](docs/SURFACES.md) | agents / integratoren | welke tool welke vraag beantwoordt, wat bij elk antwoord te bewaren; waar elke mogelijkheid bereikbaar is (CLI, Rust, Python, WASM, MCP, plug-in, JetBrains, notebooks) en waarom een cel N/A is |
| [Wijzigingslogboek](CHANGELOG.md) | iedereen | releasegeschiedenis (Keep a Changelog + SemVer, Semantic Versioning) |
| [Bijdragen](CONTRIBUTING.md) | bijdragers | bouwen, bewakingen, discipline voor tests/bronvermelding, DCO (Developer Certificate of Origin) |
| [Bestuur](GOVERNANCE.md) | bijdragers / gemeenschap | hoe Kshana wordt bestuurd — wie beslist, hoe, en de grens tussen open en gesloten |
| [Gedragscode](CODE_OF_CONDUCT.md) | gemeenschap | verwacht gedrag (Contributor Covenant) |
| [Beveiligingsbeleid](SECURITY.md) | melders | hoe u een kwetsbaarheid meldt; opmerking over dubbel gebruik |

</details>

<details>
<summary>Belangrijkste bronnen</summary>

### Belangrijkste bronnen

**Onafhankelijke referenties voor validatie en normen** — de externe autoriteiten waaraan de controles van Kshana zijn verankerd:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [testdata](https://celestrak.org/publications/AIAA/2006-6753/)): de SGP4/SDP4-verificatieset waarmee Kshana overeenkomt tot 4.12 mm, en de uitgewerkte stelselvoorbeelden waartegen de TEME→ITRF-keten wordt gecontroleerd.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — de referentieroutines voor tijd en stelsels waartegen de IAU 2000A-nutatie en de CIO GCRS↔ITRS-reductie bit voor bit zijn gevalideerd.
- Petit & Luzum (red.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (normen voor aardoriëntatie, poolbeweging en stelsels).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (relaties voor Allan-deviatie en de NBS14-referentiereeks; NBS = het voormalige US National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): de referentie-implementaties van ROC/AUC, confusiematrix en precisie/recall/F1 waarmee de testomgeving voor de evaluatie van RF-verstoringen exact overeenkomt (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` en `linalg.expm` — de referentieroutines waartegen de NNLS-fit van gemeten ADEV voor de kwantumafweging, de χ²-consistentiebanden en de procesruiscovariantie van de klok volgens van Loan zijn gevalideerd (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): gebruikt zowel als open eerder werk (zie *Vergelijking en open eerder werk* hieronder) als als de **onafhankelijke DOP-referentie** waarmee de berekening van GDOP/PDOP/HDOP/VDOP/TDOP overeenkomt tot 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): de krachtmodellen achter de krachtmodelfit op precieze efemeriden van agentschappen.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (de halo-/NRHO-families die de CR3BP-differentiële corrector reproduceert).

**Fysica van apparaten en methoden** — de aangehaalde bronnen achter de sensormodellen:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (optische strontiumroosterklok, doel gericht op de ruimte).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (Sr-klok in het laboratorium, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (hybride drietal kwantumversnellingsmeters).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [IEEE AESS-tutorial (Aerospace and Electronic Systems Society) (University College London Discovery-repository)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (foutgroei van gegist bestek).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (optische tweeweg tijd-frequentieoverdracht; de optische verbinding tussen satellieten modelleert haar budget voor niet-reciprociteit naar deze bronnen).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (de BOC-modulatie en de theorie van spectrale scheiding achter `src/navsignal.rs`).
- Kaplan & Hegarty (red.) — *Understanding GPS/GNSS: Principles and Applications* (3e druk, Artech House, 2017): de anti-jamvergelijking voor effectieve C/N₀ en de thermische-ruisjitter van early–late DLL-codevolging die de navigatiesignaal- en jammingmodellen gebruiken.

**Vergelijking en open eerder werk** — de tools en overzichten waartegenover Kshana is gepositioneerd:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (de Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): de parameters van de spoofingtestbatterij waartegen de meerlaagse detector wordt gekarakteriseerd.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): de open, gevalideerde foutprofielen voor inertiale navigatie die als klassieke basislijn worden gebruikt.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): open simulator voor maan-PNT.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): open analyse van GNSS-data.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): gereduceerd-dynamische OD van GRAIL, de vloer voor empirische versnelling die de LRO-fit reproduceert.

</details>
