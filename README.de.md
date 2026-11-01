> Dies ist eine maschinelle Übersetzung der README.md in v0.40.0, die noch kein Muttersprachler geprüft hat; maßgeblich ist die englische README. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: das Zeichen, ein Kompass-Fadenkreuz, das den genauen Augenblick markiert, neben dem Schriftzug kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>der genaue Augenblick</em></strong><br>
  Ein quelloffener Simulator für die Resilienz von PNT (Positionierung, Navigation und Zeitgebung).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Status der kontinuierlichen Integration auf main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Zeilenabdeckung nahe 95 % von src/, gemessen in docs/COVERAGE.md und in der kontinuierlichen Integration bei 85 % abgesichert"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 von 401 Fähigkeiten VALIDATED gegen eine unabhängige externe Referenz, laut Verifikationsmatrix"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Status des Quality Gate von SonarQube Cloud"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Release v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Englisch und 17 weitere Sprachen, maschinell übersetzt"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Lizenz: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, der Zenodo-Konzeptdatensatz aller Releases"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Eine kommerzielle Lizenz ist bei Ashforde® OÜ erhältlich, siehe Ausgaben"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana auf crates.io, die aktuell veröffentlichte Version"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana auf PyPI, die aktuell veröffentlichte Version"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana auf npm, die aktuell veröffentlichte Version"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Kshana Studio öffnen</a> ·
  <a href="#install">Installation</a> ·
  <a href="#capabilities">Fähigkeiten</a> ·
  <a href="#evidence">Nachweise</a> ·
  <a href="#research">Forschung</a> ·
  <a href="docs/CONCEPTS.md">Dokumentation</a> ·
  <a href="#cite">Zitieren</a>
</p>

<p align="center">
  <strong>Sprachen:</strong> <a href="README.md">English</a> ·
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
  <sub>Die Befehlszeile, Laufzusammenfassungen, Diagramme und Berichte sprechen jede Sprache mit <code>--lang &lt;tag&gt;</code>
  (zum Beispiel <code>kshana scenarios/holdover-test-example.toml --lang de</code>), ebenso die Python-, WebAssembly- und MCP-Oberflächen.
  Dies sind maschinelle Übersetzungen, die noch kein Muttersprachler geprüft hat; Englisch ist die maßgebliche Fassung.
  Siehe <a href="docs/i18n.md">Lokalisierung</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Proben Sie die Minute, in der GNSS ausfällt. Die Missionskonsole von Kshana, gezeichnet aus einem echten Lauf der Engine v0.40.0: die verkettete Kampagne campaign-jam-spoof-holdover-integrity (Seed 20260928, 6 Phasen, 18 Mitgliedsläufe über T+01:16:10) und die 102 Satelliten von GPS, Galileo, BeiDou und GLONASS aus constellation-multi-gnss-coverage, jeder auf der kreisförmigen Zweikörperbahn gezeichnet, die aus der Bodenspur der Engine gewonnen wurde, Radien zur Darstellung gestaucht. Der Zeitfehler der Uhr erreicht 62.7 ns bei einer Schutzgrenze von 50 ns, die Träger-Rausch-Leistungsdichte fällt auf -12.2 dB-Hz bei einer Untergrenze von 25 dB-Hz, und der vertikale Schutzpegel erreicht 135.4 m bei einer Alarmgrenze von 50 m." width="100%">
</picture>

<details>
<summary><strong>Inhalt</strong></summary>

- [Proben Sie die Minute, in der GNSS ausfällt](#rehearse-the-minute-gnss-goes-dark)
- [Neu in 0.40](#whats-new-in-040), [Neu in 0.39](#whats-new-in-039), [Neu in 0.38](#whats-new-in-038) und [0.38 im Detail](#038-in-depth): Jammertest-Bewertung, die eigenen Flags des Empfängers, maschinelle Eingaben, Zeitgebung und Holdover, Normenpakete, LunaNet AFS, der Labor-Rundlauf, kshana-bench, das Observatorium, Exporter, Optik, [Navigation von Weltraumnutzern](#space-user-navigation-gnss-ssv) und [Mondinfrastruktur](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) und jede Studio-Seite
- [Fähigkeiten](#capabilities): die Tabelle der Bereiche, [jede Szenarioart nach Familie](#every-scenario-kind-by-family), [jeder Befehl](#every-command), [jede Oberfläche](#every-surface)
- [Wie ein Lauf funktioniert](#how-a-run-works), [Missionen](#missions)
- [Nachweise](#evidence): das Register, [Fähigkeitsbereiche](#capability-domains)
- [Installation](#install), [Architektur](#architecture) (und die [Diagramme](#diagrams)), [KI-Assistent](#ai-assistant)
- [Ausgaben](#editions), [Forschung](#research), [Zitieren](#cite), [Lizenz](#licence)
- [Referenz](#reference): Verwendung, Szenarioformat, Ausgabe, Aufbau des Repositorys, FAQ, Fehlerbehebung, Versionierung, Roadmap, Mitwirken, Dokumentation

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Proben Sie die Minute, in der GNSS ausfällt

Kshana spielt Jamming, Spoofing und Uhren-Holdover nach, wenn GNSS-Signale (Global Navigation Satellite
System) ausfallen, und sagt Ihnen, wie lange ein System Zeit und Position innerhalb seines
Budgets hält und welche Uhr oder welcher Sensor die meiste Reserve bringt. Es ist eine einzige Rust-Engine. Sie läuft in einem
Terminal, einem Notebook, einer IDE (integrierte Entwicklungsumgebung), einem KI-Assistenten
(künstliche Intelligenz) oder in Ihrem Browser.

Jeder Lauf ist aus Szenario, Seed und Engine-Version Bit für Bit reproduzierbar.
Jede Fähigkeit trägt in einem maschinell geprüften Register eine von drei Kennzeichnungen: **VALIDATED** (eine
unabhängige externe Referenz stimmt überein), **MODELLED** (in sich konsistent, und das wird offen gesagt)
oder **PARTNER** (ein Hardwarepartner verantwortet sie).

> **Status: v0.40.0.** Eine validierte, reproduzierbare Simulationsgrundlage für PNT-Resilienz.
> Zeitgebung und Holdover stehen an erster Stelle, weil dieser Bereich am besten validiert ist. Kshana ist ein
> Studien- und Abwägungsinstrument: keine Hardware zur Erzeugung von Hochfrequenzsignalen (HF) (es
> steuert kein Funkgerät an und sendet nichts; seine Ausgabe auf Signalebene sind Basisband-IQ-Abtastdateien
> für Softwareempfänger), kein Hardware- oder zertifizierter GNSS-Empfänger (sein Softwareempfänger
> ist ein Analysewerkzeug) und kein Flugprodukt. Neu auf dem Gebiet? Beginnen Sie mit der
> [allgemeinverständlichen Einführung](docs/CONCEPTS.md) und dem [Glossar](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Neu in 0.40

0.40 ergänzt ein Fehlerbudget auf Missionsebene, kennzeichnet jede Abbildung und Tabelle mit ihrer Evidenzstufe, liest gemessene Uhrenprotokolle,
prüft Einreichungen von Datenpartnern, schätzt, wo sich ein Störsender befinden kann, und spricht neben Englisch siebzehn Sprachen.
Das Register umfasst jetzt 401 Zeilen: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Keine Zeile wurde zu VALIDATED hochgestuft, und jede unten genannte Verfehlung ist
durch einen Test festgeschrieben.

- **Missionsfaden.** Die Art `mission-thread` verkettet Phasen vom Start bis zum Wiedereintritt (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` und vier Mondarten) mit festgelegten Übergaberegeln, einer Reserve gegenüber festgelegten Anforderungen und dem schwächsten
  Glied; ein durchgängiges Beispiel der Artemis-Klasse über 11 Phasen (Erd- und Mondsegment), insgesamt 92 Szenarioarten. Jede Zahl ist MODELLED. Die cislunare Propagation gegenüber der öffentlichen Artemis-I-Trajektorie
  **verfehlt** ihren vorab festgelegten Zielwert (45.3 km und 0.25 m/s gegenüber 5 km und 0.05 m/s; Ursache sind kleine Manöver, die das Modell nicht enthält), und der Mondpropagator verfehlt gegenüber der CAPSTONE-
  Bahn **ebenfalls** (136.8 km gegenüber 25 km am Ende eines Umlaufs); der LRO-Vergleich wird erreicht. Die Zeilen bleiben MODELLED
  ([Missionsfaden](docs/MISSION-THREAD.md), [Mondsegment](docs/MISSION-THREAD-LUNAR.md)). Im Studio wird der Faden unter `/studio/mission-thread/` gelesen.
- **Evidenzkennzeichnungen.** Jede Abbildung und Tabelle, die ein Lauf schreibt, trägt die Stufe und die Register-Zeilen-IDs, auf denen sie beruht, gelesen aus der Matrix.
- **Gemessene Uhren.** Acht Formate von Uhrenprotokollen werden gelesen ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)), und eine angepasste
  Reihe kann den Holdover steuern. Gegenüber vorab festgelegten Zielwerten **verfehlt** die Anpassung F1(a) bei fünf von sechs Datensätzen und F2 bei einem; beide
  bleiben MODELLED ([Changelog](CHANGELOG.md#0400---2026-10-29)).
- **Datenpartner.** `kshana partner check` prüft das Format einer Einreichung und bewertet nichts ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Senderregion.** `kshana interference-map locate` liefert aus ADS-B- oder AIS-Meldungen eine Region und eine Ellipse, niemals einen bloßen Punkt.
  Einmal mit den Senderstandorten von Jammertest 2025 verglichen, ist das Ergebnis für beide Quellen **NOT ASSESSABLE** (zu wenige
  geplante Sitzungen in den offenen Daten), daher bleibt die Zeile MODELLED ([Störungskarte](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Benchmark.** Die Neukampagne von 0.40 erreicht A3, D3 (beide EXPLORATORY), R3 und R4; A2, D1 und R1 bleiben NOT MET ([Bench](docs/BENCH.md)).
- **Sprachen.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja und zh-Hans, als **maschinelle Übersetzungen, die noch kein
  Muttersprachler geprüft hat**; Englisch ist die maßgebliche Fassung, und nicht englische Läufe dauern etwa doppelt so lange
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Neu in 0.39

0.39 fügt keine Funktion hinzu und ändert kein Ergebnis; die Ausgabe der Engine ist die Ausgabe von 0.38. Es behebt eine Sache
auf der Befehlszeile, aktualisiert Abhängigkeiten der Werkzeuge zur Kreuzvalidierung und nennt die Benchmark-
Urteile vollständig.

- **Befehlszeile.** `kshana kinds | head` (jede geschlossene Standardausgabe) löst keine Panic mehr aus: Das Programm beendet sich
  still mit Status 141, wie andere Werkzeuge bei einer geschlossenen Pipe. Andere Schreibfehler werden weiterhin gemeldet.
- **Abhängigkeiten.** `memmap2` 0.9.11 in den beiden ANISE-Cross-Check-Locks sowie `pillow` 13.0.0 und
  `certifi` 2026.10.19 in den Pins der Referenzumgebung, alle unter `xval/`: Nichts, was ausgeliefert wird, hat sich geändert.
- **kshana-bench, alle Urteile.** Gegenüber den vorab festgelegten Zielwerten sind drei NOT MET, jedes durch einen Test festgeschrieben:
  A2 (`agc_k_sigma` AUC 0.766 gegenüber mindestens 0.80), D1 (größte Lücke 0.0301) und Aufgabe (b) R1 (übernommen,
  nicht erneut ausgeführt). Kein Zielwert wurde gelockert ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Neu in 0.38

0.38 macht den neutralen Schiedsrichter messbar: Es bewertet Empfängerprotokolle gegen einen veröffentlichten Test-
plan, liest mehr Empfänger und Sensoren, testet Zeitgebungssysteme und liefert einen Benchmark und ein
Störungsobservatorium. Es bleibt beratend: Nichts hier ist zertifiziert, kein Ergebnis ist eine Typzulassung,
und nichts sendet. Jede Zeile nennt, was das Register für sie enthält ([wie eine Kennzeichnung verdient wird](#evidence));
ein Status nennt nur, was geprüft wurde, und die Registerzeile und die verlinkte Seite sagen, was nicht geprüft wurde.

| Neu in 0.38 | Was es tut, und warum | Registerstatus | Lesen |
|---|---|---|---|
| **Jammertest-Bewertung** | `kshana jammertest import` liest den veröffentlichten NPRA-Testkatalog und Sendeplan als geplante Wahrheit; `jammertest score` bewertet ein Empfängerprotokoll je Test (Erkennungslatenz, verpasste Alarme, Fehlalarme, Zeit bis zur Erholung), als signiertes Nachweispaket, wenn Sie einen Schlüssel angeben | **MODELLED**: eine Registerzeile. Die Zielwerte wurden vor jedem bewerteten Lauf vorab festgelegt; bei den Daten von JammerTest 2024 schlug die Mindestdatenregel in beiden Läufen fehl (4 und 7 bewertbare Fenster gegenüber 10 erforderlichen), daher ist **kein Zielwert bewertbar**, und es wird nichts behauptet | [Jammertest](docs/JAMMERTEST.md) |
| **Die eigenen Flags des Empfängers** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG und NovAtel RXSTATUS werden in einen `self_report` je Epoche gelesen und mit den Alarmen von Kshana verglichen (beide, nur Empfänger, nur Kshana, keiner); ein Septentrio-SBF-Leser und eine schreibgeschützte `--serial`-Eingabe | **MODELLED**; Übereinstimmung zwischen dem Detektor eines Empfängers und dem von Kshana ist keine Validierung | [Empfängervertrauen](docs/RECEIVER-TRUST.md) |
| **Mehr Empfänger und Sensoren** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (aus den BSD-lizenzierten pyrtcm-Tabellen, nicht aus dem RTCM-Text), GNSS-SDR-Monitorströme, ein IMU-Protokoll als zweiter Sensor, ein ROS-2-Paket, eine `gnss_lib_py`-Brücke und `imu-fit` für hybride Sensorparameter | **MODELLED**: sechs Registerzeilen; nur selbst geschriebene Fixtures, es wurde keine Aufzeichnung eines echten Empfängers, einer IMU, eines GNSS-SDR-Laufs oder eines ROS-Graphen gelesen | [Maschinelle Eingaben](docs/MACHINE-INPUTS.md) |
| **Zeitgebungs- und Holdover-Tests** | die Art `holdover-test` bewertet einen Holdover-Test (GNSS vom Betreiber entfernt, Holdover, Erholung) aus einer gemessenen Zeitfehleraufzeichnung gegen ITU-T-Masken, „gegen die Maske gemessen“; Protokollleser für linuxptp und chrony; die Hardwarestufen und das Feld `lab-attestation` | **MODELLED**: zwei Registerzeilen; die Zeiten sind die Angabe des Betreibers, nicht verifiziert | [Timing HIL](docs/TIMING-HIL.md), [Hardwaresicherheit](docs/HARDWARE-SAFETY.md) |
| **Normenpakete, LunaNet AFS, Labor-Rundlauf** | bewertete Pakete für DHS RPCF, IMO MSC.1/Circ.1575 und ICAO Doc 9849 Appendix F gegen vor dem Lauf genannte Zielwerte, „stützt Nachweise für“; eine Gegenüberstellung zu NIST IR 8323r1; ein Generator und Prüfer für LunaNet-AFS-Codes; ein signiertes Paket, das Szenario, Testbedingungen, Empfängerprotokoll und Bewertung eines Laborlaufs verknüpft | **MODELLED** für die Pakete und den Rundlauf; die AFS-Codeprüfung ist **VALIDATED** gegen ihre abgedruckten Prüfspalten (siehe die Registerzeilen) | [Normen](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench und das Observatorium** | feste Aufgaben, Aufteilungen und Metriken für Störungserkennung, IQ-Erkennung, Holdover-Vorhersage und die Optimismuslücke, mit einem versiegelten zurückgehaltenen Datensatz und einer statischen Rangliste; ein reproduzierbares tägliches Störungsprodukt mit 24 h Verzögerung, groben Zellen und ohne Zuordnung | keine eigene Registerzeile: Es bewertet Einreichungen, und seine Basislinien sind in den Ergebnisdateien als MODELLED gekennzeichnet; gegenüber den vorab festgelegten Zielwerten sind der Bewerter, C1 bis C3 und D2 erreicht, und drei Zielwerte sind **NOT MET** (durch Tests festgeschrieben): A2 (`agc_k_sigma` AUC 0.766 gegenüber mindestens 0.80 auf der Testaufteilung), D1 (größte Lücke 0.0301) und Aufgabe (b) R1 (übernommen, nicht erneut ausgeführt); siehe `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatorium](docs/observatory/METHOD.md) |
| **Exporter** | Vertrauenstelemetrie als MQTT-Discovery- und Zustandsnachrichten für Home Assistant (nur Veröffentlichen, keine Zugangsdaten) neben Prometheus, CEF, LEEF und OTLP | **MODELLED**: eine Registerzeile | [Vertrauenstelemetrie](docs/TRUST-TELEMETRY.md) |
| **Optische Linkreserve über die Zeit** | die Art `optical-atmosphere` kann eine geseedete Realisierung des Wetters eines Standorts als Reihe der Linkreserve schreiben | **MODELLED**: eine Registerzeile; eine Ziehung aus dem Modell, nicht das Klima | [Optische Atmosphäre](docs/OPTICAL-ATMOSPHERE.md) |

Höhepunkte von 0.37: [Changelog](CHANGELOG.md#0370---2026-10-17). Die vollständige Liste für 0.38 steht im
[Changelog](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 im Detail

Jede Fähigkeit aus der obigen Tabelle in wenigen Zeilen: was sie tut, ein Befehl, um sie auszuführen, ein
Bild aus einem echten Lauf der Engine und was das Register für sie enthält. Die Bilder
werden von [`tools/gen_figures_038.py`](tools/gen_figures_038.py) nach
[`docs/figures/0.38/`](docs/figures/0.38/) geschrieben (nie von Hand gezeichnet): `python3 tools/gen_figures_038.py`
schreibt sie aus einer gebauten Engine neu, und `--check` schlägt fehl, wenn eines veraltet ist oder seine Bildunterschrift hier abweicht.
Wo eine Eingabe ein Protokoll ist, ist es ein erfundenes, das das Skript schreibt, weil die echten Protokolle Dritter
nie mitgeliefert werden, und die Bildunterschrift sagt das. Alles Folgende ist beratend: nicht zertifiziert, keine
Typzulassung, und nichts sendet. Ein Status nennt, was geprüft wurde, und nicht mehr;
[wie eine Kennzeichnung verdient wird](#evidence).

### Jammertest-Bewertung

`kshana jammertest import` macht aus dem veröffentlichten NPRA-Testkatalog und Sendeplan
geplante Wahrheit, und `kshana jammertest score` bewertet ein Empfängerprotokoll dagegen: für jeden
geplanten Test, ob er erkannt wurde, wie spät und wie lange der Empfänger zur Erholung brauchte, dazu
Fehlalarme außerhalb jedes Zeitfensters. Der Katalog wird abgerufen, nie mitgeliefert.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Bewertung eines synthetischen Empfängerprotokolls gegen einen Plan mit drei Tests, aus einem echten Lauf der Engine v0.40.0 (`kshana jammertest score`). Das Protokoll ist erfunden: 1800 s NMEA mit einem C/N0-Abfall um 20 dB über zwei Intervalle. Der Plan führt drei Zeitfenster; im mittleren Fenster gibt es im Protokoll keinen Störer. Die Bewertung markiert 2 von 3 Tests als erkannt (mediane Latenz 0 s) und 1 als verpasst, mit 0 Fehlalarmläufen über 0.25 h ungestörter Zeit. Nichts hier sagt etwas über einen echten Empfänger aus. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC 61108, IEC 61162): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.">
</picture>

**Registerstatus: MODELLED.** Die Zielwerte wurden vor jedem bewerteten Lauf festgelegt; bei den Daten von JammerTest 2024
schlug die Mindestdatenregel in beiden Läufen fehl, daher ist kein Zielwert bewertbar, und es wird nichts behauptet.
[Jammertest](docs/JAMMERTEST.md).

### Die eigenen Flags des Empfängers

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG und NovAtel RXSTATUS werden in einen `self_report` je Epoche
gelesen und neben die Alarme von Kshana gestellt: beide, nur Empfänger, nur Kshana oder keiner. Ein
Septentrio-SBF-Leser und eine schreibgeschützte `--serial`-Eingabe speisen denselben Vergleich. Keine der beiden Seiten ist
Ground Truth.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Das eigene Spoofing-Flag des Empfängers neben den Alarmen von Kshana, aus einem echten Lauf der Engine v0.40.0 auf einem erfundenen UBX-Protokoll (200 Epochen bei 1 Hz). C/N0 fällt bei 80 bis 90 s und 120 bis 130 s um 20 dB; der Empfänger meldet 120 bis 130 s und 160 bis 165 s. Von 140 nach der Kalibrierung verglichenen Epochen meldeten in 11 beide, in 6 nur der Empfänger, in 11 nur Kshana und in 112 keiner. Keine der beiden Seiten ist Ground Truth, und Übereinstimmung ist keine Validierung. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

**Registerstatus: MODELLED.** Übereinstimmung zwischen dem Detektor eines Empfängers und dem von Kshana ist keine
Validierung. [Empfängervertrauen](docs/RECEIVER-TRUST.md).

### Mehr Empfänger und Sensoren

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, GNSS-SDR-Monitorströme, ein IMU-Protokoll als zweiter
Sensor, ein ROS-2-Paket und eine `gnss_lib_py`-Brücke münden alle in dieselbe Receiver-Trust-Zeitleiste.
`imu-fit` liest die Sensorparameter, die die Hybrid- und Fusionsszenarien brauchen, aus einem IMU-Protokoll im Stillstand,
sodass ein Szenario mit dem Sensor ausgeführt werden kann, den Sie tatsächlich haben.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Was `kshana imu-fit` aus einem IMU-Protokoll im Stillstand liest, aus einem echten Lauf der Engine v0.40.0 auf einem erfundenen Protokoll (20,000 Abtastwerte bei 100 Hz, 200 s): das Geschwindigkeits-Random-Walk des Beschleunigungsmessers q_va = 4.02e-06, das Winkel-Random-Walk des Kreisels q_arw = 9e-08, die Bias-Instabilität 0.00296 und die frühen Allan-Steigungen (-0.51 und -0.49; etwa -0.5, wo weißes Rauschen dominiert). Die Tabelle daneben ist das TOML, das der Befehl ausgibt. Der Schätzer ist nur an synthetischen Protokollen geprüft. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

**Registerstatus: MODELLED.** Nur selbst geschriebene Fixtures; es wurde keine Aufzeichnung eines echten Empfängers, einer IMU,
eines GNSS-SDR-Laufs oder eines ROS-Graphen gelesen. [Maschinelle Eingaben](docs/MACHINE-INPUTS.md).

### Zeitgebungs- und Holdover-Tests

Die Art `holdover-test` bewertet einen Holdover-Test (GNSS vom Betreiber entfernt, Holdover, Erholung)
aus einer gemessenen Zeitfehleraufzeichnung gegen ITU-T-Masken und sagt es mit genau diesen Worten: gegen
die Maske gemessen. Protokollleser für linuxptp und chrony speisen ihn; die Hardwarestufen und das
Feld `lab-attestation` sagen, wer was angegeben hat.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Ein Holdover-Test, bewertet aus einer Zeitfehleraufzeichnung, aus einem echten Lauf der Engine v0.40.0 auf scenarios/holdover-test-example.toml (601 Abtastwerte alle 5 s). GNSS wird bei 600 s vom Betreiber entfernt und bei 2400 s wiederhergestellt; der Zeitfehler driftet bis zum Ende des Holdover auf 299 ns, überschreitet das Budget von 100 ns nach 675 s und kehrt 70 s nach der Wiederherstellung in das 100-ns-Band zurück. Urteile: Basislinienmasken PASS, Holdover-Masken FAIL, Holdover-Hüllkurve FAIL, Erholung RECOVERED. Gegen die Maske gemessen, keine Zulassung. Die Zeiten sind die Angabe des Betreibers, nicht von Kshana verifiziert. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

**Registerstatus: MODELLED.** Die Zeiten, zu denen GNSS entfernt und wiederhergestellt wurde, sind die Angabe des Betreibers,
nicht verifiziert. [Timing HIL](docs/TIMING-HIL.md), [Hardwaresicherheit](docs/HARDWARE-SAFETY.md).

### Normenpakete

Bewertete Pakete für die DHS-Testprofile für resiliente PNT, IMO MSC.1/Circ.1575 und ICAO Doc 9849
Appendix F, dazu eine Gegenüberstellung zu NIST IR 8323r1 in `compliance-report`. Jeder Test führt ein mitgeliefertes
Szenario aus und vergleicht ein Ergebnisfeld mit einem vor dem Lauf genannten Zielwert; ein Test, der ein Empfänger-
protokoll braucht, wird als eingabebedürftig aufgeführt, nicht bewertet. Die Formulierung lautet „stützt Nachweise für“.

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Jeder Test der drei bewerteten Normenpakete, aus echten Läufen der Engine v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 erreicht, 1 nicht erreicht, 2 brauchen eine Eingabe; imo-circ-1575: 1 erreicht, 4 nicht erreicht, 2 brauchen eine Eingabe; icao-doc9849-appf: 6 erreicht, 0 nicht erreicht, 2 brauchen eine Eingabe. Insgesamt 13 erreicht, 5 nicht erreicht und 6 brauchen eine Eingabe, die die Engine nicht hat (ein Empfängerprotokoll oder Gerätedokumentation). Jeder Zielwert wurde vor dem Lauf genannt; eine Verfehlung bleibt eine Verfehlung. Ein erreichter Zielwert sagt, dass ein modelliertes Szenario einen genannten Zielwert erreicht hat, nichts über ein Produkt. Die Pakete stützen Nachweise für die Zeilen, die sie nennen; sie sind keine Bewertung. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst; sie darf nicht die alleinige Grundlage einer Navigations- oder Sicherheitsentscheidung sein.">
</picture>

**Registerstatus: MODELLED.** Ein erreichter Zielwert sagt, dass ein modelliertes Szenario einen genannten Zielwert erreicht hat, nichts über ein
Produkt; jede Verfehlung bleibt erhalten und ist durch einen Test festgeschrieben. [Normen](docs/STANDARDS.md).

### LunaNet AFS

Der Codegenerator für das LunaNet Augmented Forward Signal (Gold-, Weil- und Tertiärcodes, der Nachrichten-
rahmen und seine Fehlercodierung) und ein Prüfer für einen aufgezeichneten oder erzeugten Symbolstrom, festgelegt auf eine
Ausgabe der Spezifikation.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="Der LunaNet-AFS-Codegenerator, geprüft gegen die abgedruckten Spalten der Spezifikation, aus einem echten Lauf der Engine v0.40.0 (`kshana lunanet-afs-check spec`, festgelegt auf LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29. Januar 2025; das Dokument kennzeichnet seine Codetabellen mit {LSIS-TBC}). 9 von 10 Prüfungen sind erreicht; B4 ist NOT MET (420 von 421 übereinstimmend). Es prüft einen Symbolstrom gegen eine Ausgabe einer veröffentlichten Spezifikation und sagt nichts über einen LunaNet-Knoten oder -Dienst. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Es prüft einen Symbolstrom gegen eine Ausgabe einer veröffentlichten Spezifikation und sagt nichts über einen LunaNet-Knoten oder -Dienst.">
</picture>

**Registerstatus: VALIDATED** für die Code- und Synchronisationsprüfungen, gegen die Werte, die die
Spezifikation abdruckt (die sie als TBC kennzeichnet); eine Prüfung ist NOT MET, erhalten und festgeschrieben (eine abgedruckte
Spalte des Tertiärcodes weicht ab: Das Dokument druckt für zwei PRNs denselben Wert). Die LDPC- und CRC-Wörter
der Unterrahmen 2 bis 4 werden nicht geprüft. Die Registerzeilen sagen genau, welche. [LunaNet AFS](docs/LUNANET-AFS.md).

### Labor-Rundlauf

`kshana.test-conditions/1` ist eine veröffentlichte Beschreibung dessen, was ein Labor getan hat (Ereignisse, Zeiten,
Leistungen). `kshana evidence round-trip` verknüpft den Szenario-Hash, den Hash der Bedingungen, den Hash des Empfänger-
protokolls und die Bewertung zu einem signierten Paket und lehnt ein Paket ab, dessen Bedingungen und Bewertungsszenario
bei den Ereignissen nicht übereinstimmen. Kshana erzeugt oder spielt nie ein Signal ab: Wie ein Szenario einen
Empfänger erreicht hat, liegt in der Verantwortung des Betreibers.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Der Aufbau eines Nachweispakets. Ein Empfängerprotokoll (NMEA, u-blox UBX, RINEX 3 oder ein Android-Protokoll) und ein Zeitfenster gehen in kshana receiver-trust evidence, das sieben Dateien schreibt: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig und ein optionales timestamp.tsr. Das Manifest hält den SHA-256 des gesamten Protokolls und jeder Datei sowie eine Hash-Kette über die Dateien fest; die Signatur deckt das Manifest ab. kshana evidence verify prüft die Signatur, den Hash jeder Datei, die Kette und dass keine nicht aufgeführte Datei vorhanden ist, und endet mit 0, wenn verifiziert, mit 1, wenn etwas fehlschlug, und mit 3, wenn der Unterzeichner nicht festgelegt war. Ein Paket ist eine technische Aufzeichnung, kein Rechtsgutachten.">
</picture>

Das Bild zeigt den Aufbau eines Pakets. **Registerstatus: MODELLED.**
[Testbedingungen](docs/spec/TEST-CONDITIONS.md), [Prüfstand](docs/TEST-BENCH.md).

### kshana-bench

Feste Aufgaben, Aufteilungen und Metriken für Störungserkennung, IQ-Erkennung, Holdover-Vorhersage und
die Optimismuslücke, mit einem versiegelten zurückgehaltenen Datensatz und einer statischen Rangliste. Es bewertet Einreichungen; es ist keine
Rangliste von Empfängern.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="Die eingebauten Basislinien der kshana-bench-Aufgabe D (die Optimismuslücke) auf der Testaufteilung, aus einem echten Lauf der Engine v0.40.0 (`kshana bench baseline`). Jedes Balkenpaar ist die Fläche unter der ROC-Kurve für die Fälle innerhalb der Verteilung und für die verschobenen Fälle; die Lücke zwischen beiden ist die Optimismuslücke, gegenüber einer Toleranz von 0.05. fused-max-z: 0.998 und 0.983 (Lücke 0.015); sqm-imbalance: 0.882 und 0.882 (Lücke 0.001); agc-excess: 0.848 und 0.819 (Lücke 0.030); raim-parity: 0.682 und 0.672 (Lücke 0.010); energy-cn0-drop: 0.595 und 0.565 (Lücke 0.030). Die Kennzeichnungen sind Kennzeichnungen eines generativen Modells für ein synthetisches Korpus, nie Felddaten: MODELLED. Hinweis: modelliert oder gegen genannte Referenzen gemessen, keine Zulassung, Zertifizierung oder Konformitätserklärung. Eine Bewertung beschreibt ein Protokoll oder Korpus, nie ein Produkt.">
</picture>

**Registerstatus:** keine eigene Registerzeile; die Basislinien sind in den Ergebnisdateien als MODELLED gekennzeichnet.
Gegenüber den vorab festgelegten Zielwerten sind der Bewerter, C1 bis C3 und D2 erreicht, und drei Zielwerte sind NOT MET, jeder
durch einen Test festgeschrieben: A2 (`agc_k_sigma` AUC 0.766 gegenüber mindestens 0.80 auf der Testaufteilung), D1 (größte Lücke
0.0301) und Aufgabe (b) R1 (aus der früheren Kampagne übernommen, nicht erneut ausgeführt). Die Zahlen stehen in
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Störungsobservatorium

Ein Produkt je UTC-Tag und Region aus einem offenen Archiv von Flugzeugpositionen, auf einem festen groben Raster:
Jede Zelle ist beeinträchtigt, nicht beeinträchtigt oder nicht beobachtet (was nicht „frei“ bedeutet). Veröffentlicht frühestens
24 h nach Ende des Tages, mit unterdrückten kleinen Zellen und ohne Zuordnung einer Ursache.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Zwei synthetische Tage der Störungskarte, gezeichnet aus den eingecheckten Beispielen in examples/interference-map/output, jeder mit eigener synthetischer Route und den Anteilen der Routenexposition, die die Engine meldet. Links ein ADS-B-Tag: 1 beeinträchtigte Zelle, 6 nicht beeinträchtigte, 4 nicht bewertete (schraffiert) und Zellen ohne Eintrag, leer gezeichnet, die nicht beobachtet wurden. Die Route ist 525 km lang: 11.5% ihrer Länge in beeinträchtigten Zellen, 38.3% nicht beeinträchtigt, 9.1% nicht bewertet und 41.1% nicht beobachtet. Rechts ein AIS-Tag: Zellen, die vom Kreis- und vom Landdetektor markiert wurden, nicht auffällige Zellen und leere Zellen; die Route ist 454 km lang, mit 10.5% in auffälligen Zellen, 21.2% nicht auffällig, 0.0% nicht bewertet und 68.3% nicht beobachtet. ADS-B und AIS sind getrennte Ebenen, nie kombiniert. Eine markierte Zelle ist kein Befund einer Störung, und eine Zelle ohne Farbe wurde nicht beobachtet, was nicht dasselbe ist wie frei. Alle Daten sind erfunden, im offenen mittleren Atlantik, und keine Messung.">
</picture>

Das Bild zeigt die eingecheckten Beispieltage, kein Produkt des Observatoriums. **Registerstatus: MODELLED**:
keine externe Referenz, keine Ground Truth und keine Ursachenzuordnung; eine nicht beobachtete Zelle wurde nicht
bewertet, was nicht dasselbe ist wie frei. [Methode des Observatoriums](docs/observatory/METHOD.md).

### Exporter

Vertrauenstelemetrie als Prometheus-Text, CEF, LEEF, OTLP sowie MQTT-Discovery- und Zustandsnachrichten
für Home Assistant. Der Befehl veröffentlicht nur an ein Ziel, das Sie ihm geben, und hält keine Zugangsdaten.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Ein Vertrauensergebnis in drei Exportformaten, aus echten Läufen der Engine v0.40.0 (`kshana trust-telemetry`) auf examples/maritime-trust: Prometheus-Textdarstellung (der letzte Vertrauenswert ist 5.9, und das Band „nicht vertrauenswürdig“ ist das gesetzte) sowie die letzten CEF- und LEEF-Nachrichten. Der Befehl veröffentlicht nichts, solange kein Ziel angegeben ist, hält keine Zugangsdaten und sendet kein Funksignal. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC 61108, IEC 61162): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.">
</picture>

**Registerstatus: MODELLED.** [Vertrauenstelemetrie](docs/TRUST-TELEMETRY.md).

### Optische Linkreserve über die Zeit

Die Art `optical-atmosphere` kann eine geseedete Realisierung des Wetters eines Standorts als Reihe der Link-
reserve schreiben: Wolkenepisoden, eine Flüssigwassersäule für jede, ein Szintillationswert je Schritt. Die
Seite Optical PNT im Studio öffnet die optical-atmosphere-Szenarien.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Eine geseedete Realisierung der Linkreserve des Standorts 'northern' über 336 h, aus einem echten Lauf der Engine v0.40.0 auf scenarios/optical-atmosphere-network.toml (Seed 37, Schrittweite 600 s). Die Reserve fällt während Wolkenepisoden unter null; in dieser Ziehung ist der Link 40.5 % der Zeit verfügbar, mit 27 Ausfällen und einem längsten Ausfall von 30.7 h. Die Eingaben sind illustrativ, die Reihe ist eine Ziehung aus dem Modell und nicht das Klima, und sie weicht von der statistischen Verfügbarkeit (37.8 %) um den Stichprobenfehler der Ziehung ab. Nur beratende Analyse: kein zertifiziertes Verfügbarkeits-, Integritäts- oder Navigationsprodukt und keine Vorhersage für einen realen Standort, sofern seine Klimaeingaben nicht aus einem genannten Datensatz stammen.">
</picture>

**Registerstatus: MODELLED.** Eine Ziehung aus dem Modell, nicht das Klima. [Optische Atmosphäre](docs/OPTICAL-ATMOSPHERE.md).

### Neue Studio-Ansichten

[kshana.dev/studio](https://kshana.dev/studio/) erhält eine Bridge-Wiedergabe (zwei Läufe nebeneinander auf einer
Missionsuhr, unter [`/studio/replay/`](https://kshana.dev/studio/replay/)), eine Seite Optical PNT
(`/studio/optical/`), eine Seite für Holdover-Tests (`/studio/holdover/`) und einen Betrachter für das Observatorium
(`/studio/observatory/`). Sie führen dieselbe Engine im Browser aus, nichts wird hochgeladen, und sie tragen
denselben Hinweis. Die Bilder oben werden von einem Skript aus der eigenen Ausgabe der Engine gezeichnet;
sie sind keine Bildschirmfotos dieser Seiten.

<a id="space-user-navigation-gnss-ssv"></a>
### Navigation von Weltraumnutzern (`gnss-ssv`)

Für ein Raumfahrzeug über, um oder weit jenseits der GNSS-Bahnen: wie viele GNSS-Signale es nutzen kann, wie
stark sie sind, wie gut die Geometrie ist und was ein Filter an Bord damit leisten kann. Eine Art,
vier Modi, gewählt über die Tabellen des Szenarios: eine **Schale** von Nutzern (der Zeitanteil mit einem und vier
Signalen, je Konstellation), eine **Trajektorie** (Signale, C/N0, Verdünnung der Genauigkeit und das
Limb-Strahl-Medium entlang einer Bahn), ein **Navigationslauf** (ein Filter mit neun Zuständen auf Pseudoentfernungen, bis zum
Mond) und eine **Formation** (Relativnavigation von Begleitern um ein Leitfahrzeug). Die öffentliche Quelle für den
Verfügbarkeitsvergleich ist das Heft zum interoperablen GNSS Space Service Volume (UN OOSA
ST/SPACE/75, vom International Committee on GNSS), das selbst eine Simulation ist; es wird abgerufen, nie
mitgeliefert. Vollständige Seite: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Signalverfügbarkeit für einen Nutzer auf einer Kugel in 36000 km Höhe mit einer Halbkugelantenne, aus einem echten Lauf der Engine v0.40.0 auf scenarios/gnss-ssv-shell.toml (ein verkleinerter Lauf: 162 Nutzer, 3 Tage, Schritte von 10 min), bei einer Schwelle von 20 dB-Hz. Für jede Konstellation und jedes Band zwei Balken: der Anteil der Paare (Nutzer, Epoche) mit mindestens einem Signal und mit mindestens vier. Kombiniert, L1: 99.4 % mindestens eines, 73.2 % mindestens vier, längster Ausfall unter vier Signalen 160 min. Kombiniert, L5: 100.0 % mindestens eines, 99.9 % mindestens vier, längster Ausfall unter vier Signalen 20 min. MODELLED: eine modellierte Studie aus genannten Eingaben, keine Messung und keine Aussage über das Dienstvolumen irgendeines Systems. Die verkleinerte Größe ist nicht der Vergleich mit dem Heft. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Signale entlang einer hohen Erdumlaufbahn (Perigäum 497 km, Apogäum 58622 km, Periode 18.8 h), aus einem echten Lauf der Engine v0.40.0 auf scenarios/gnss-ssv-heo.toml, Band L1. Oben: die beste Träger-Rausch-Leistungsdichte unter den sichtbaren Signalen, gegenüber der Schwelle von 20 dB-Hz. Mitte: die Zahl der sichtbaren Signale aller Konstellationen, von 4 bis 55 entlang der abgetasteten Punkte. Von den empfangenen Verbindungen kamen 2252 über eine Hauptkeule und 696 über Nebenkeulen, mit einem gekennzeichneten parametrischen Ersatzdiagramm, nicht dem gemessenen Diagramm eines Systems. Median-PDOP 67, 95. Perzentil 358. MODELLED: eine modellierte Studie aus genannten Eingaben, keine Messung und keine Aussage über das Dienstvolumen irgendeines Systems. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Ein Filter mit neun Zuständen an Bord auf einem Transfer von niedriger Umlaufbahn zum Mond, aus einem echten Lauf der Engine v0.40.0 auf scenarios/gnss-ssv-nav-lunar.toml (289 Epochen, 13 Punkte gezeichnet). Auf einer logarithmischen Achse der wahre Positionsfehler und die eigene Ein-Sigma-Schranke des Filters über der Zeit seit dem Start. Innerhalb der GNSS-Bahnen beträgt der Positions-RMS 1.4 m; darüber 90 m, mit einem Endfehler von 184 m in 193,330 km Höhe bei 1 Messung. Der mittlere normierte quadrierte Schätzfehler über den ganzen Lauf beträgt 4.4 (etwa 3 für einen konsistenten Positionsblock). Wahrheit und Filter teilen ihre Ersatzmodelle für Sonne und Mond. MODELLED: eine modellierte Studie aus genannten Eingaben, keine Messung und keine Aussage über das Dienstvolumen irgendeines Systems. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Relativnavigation von 2 Begleitern um ein Leitfahrzeug auf einer hohen Bahn, aus einem echten Lauf der Engine v0.40.0 auf scenarios/gnss-ssv-formation-heo.toml (401 Epochen). Für jeden Begleiter zwei Balken: der RMS der Relativposition aus der Differenz der beiden unabhängigen absoluten Schätzungen und aus dem Relativfilter auf einfach differenzierten Pseudoentfernungen. Basislinie 0.8 km: 5.1 m und 1.2 m. Basislinie 2.0 km: 4.1 m und 2.1 m. Der absolute Filter ist hier nicht konsistent: mittlerer normierter quadrierter Schätzfehler 187 gegenüber etwa 3 für einen konsistenten Filter, seine angegebene Unsicherheit ist also viel zu klein. MODELLED: eine modellierte Studie aus genannten Eingaben, keine Messung und keine Aussage über das Dienstvolumen irgendeines Systems. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

**Registerstatus: MODELLED, und der Vergleich mit dem Heft verfehlt größtenteils.** Die Zielwerte wurden vor
dem Lauf festgelegt. Von acht sind nur S0 (das inverse Linkbudget, 13 von 13 Werten) und S6 (die Mondmission)
erreicht. **S1 bis S5 und S7 sind NOT MET**: die Geometrie des oberen und unteren Dienstvolumens (43 von 52 und 48 von 52
Zellen), das obere Dienstvolumen bei 15/20/25 dB-Hz, die sechs GEO-Missionen, die HEO-Mission und das
parametrische Nebenkeulendiagramm gegenüber gemessenen GPS-Paneldiagrammen. Fast jede Verfehlung in S1 bis S5 betrifft
GLONASS, und das Heft druckt dafür zwei verschiedene Referenzwinkel; eine diagnostische Variante, die das
andere Paar verwendet, bringt S1, S2 und S4 auf jede Zelle, ersetzt aber nicht den maßgeblichen Lauf, und keine Zeile ist
VALIDATED. Der absolute Filter des Formationslaufs ist außerdem zu zuversichtlich (mittlerer normierter quadrierter Fehler
deutlich über dem Wert von etwa 3, den ein konsistenter Filter liefert).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="Der aufgezeichnete Vergleich des Verfügbarkeitsmodells für Weltraumnutzer mit dem öffentlichen Heft zum Space Service Volume, aus den eingecheckten Ergebnissen des vorregistrierten Laufs (xval/gnss-ssv/results-run1.json, geschrieben vom Beispiel ssv_booklet_check der Engine v0.40.0). Balken für Balken die Zellen innerhalb der Toleranz: S0 13 von 13 (MET); S1 43 von 52 (NOT MET); S2 48 von 52 (NOT MET); S3 122 von 155 (NOT MET); S4 132 von 156 (NOT MET); S5 18 von 26 (NOT MET); S6 26 von 26 (MET); S7 0 von 20 Paneldiagrammen (NOT MET). Nur S0 und S6 sind unter der vorregistrierten Lesart erreicht. Eine diagnostische Variante, die die anderen GLONASS-Winkel des Hefts verwendet, bringt S1, S2 und S4 auf jede Zelle, ersetzt aber nicht den maßgeblichen Lauf. Keine Registerzeile ist VALIDATED. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

[Navigation von Weltraumnutzern](docs/SSV.md), [was der Vergleich zeigt](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Mondinfrastruktur (`lunar-infrastructure`)

Die Bahn und die Oberfläche des Mondes als Navigations- und geodätische Infrastruktur, in fünf Studien, gewählt über
`study`: **od-consistency** (eine Bahnbestimmung mit Erd-GNSS an Bord in einer Halo-Bahn gegenüber einer
unabhängigen vom Boden), **carrier-phase** (Festsetzen der ganzzahligen Mehrdeutigkeit zwischen Oberflächenstationen und einem
Orbiter), **frame-coestimation** (das lunare Datum aus Entfernungsmessungen von Erdstationen mit und ohne Orbiter-
verbindungen), **space-tie** (Laser-, VLBI- und GNSS-Versätze auf einem Raumfahrzeug gegenüber dem Fehler des lokalen Anschlusses) und
**geodesy-sensitivity** (welche Familie von Beobachtungsgrößen die Love-Zahlen h2, k2 und l2 sieht). Das Modell ist ein
eingeschränktes Dreikörpermodell mit genannten Vereinfachungen und illustrativen Eingaben. Vollständige Seite:
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
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Konsistenz einer Bahnbestimmung mit Erd-GNSS an Bord in einer nahezu geradlinigen Halo-Bahn mit einer unabhängigen Bahnbestimmung vom Boden, aus echten Läufen der Engine v0.40.0 auf scenarios/lunar-infrastructure-od-consistency.toml und der Variante mit Modellfehler (je 400 Versuche). Die mittlere normierte Differenz q beträgt 5.81 ohne Modellfehler und 5.95 mit einem eingebrachten Beschleunigungsfehler von 3e-10 m/s2, gegenüber erwarteten 6: Die beiden Bahnlösungen sind konsistent (Zielwert C1 MET). Der Anteil der Versuche über dem 95-%-Punkt beträgt 0.040 und 0.052; der Zielwert für das Erkennen des eingebrachten Fehlers lag bei mindestens 0.5, er ist also NOT MET (C3): Die Lösung an Bord ist auf etwa 352 m bekannt gegenüber 23 m für die vom Boden, sodass sich eine Verschiebung um zehn Meter in ihrer Kovarianz verbirgt. MODELLED: ein eingeschränktes Dreikörpermodell mit genannten Vereinfachungen und illustrativen Eingaben, keine Messung irgendeiner lunaren Größe. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Festsetzen der ganzzahligen Mehrdeutigkeit der Trägerphase zwischen lunaren Oberflächenstationen und einem Orbiter, aus dem eingecheckten Ergebnis des bewerteten Laufs der Engine v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 Bogenlängen, je ein Monte Carlo mit 401 Ziehungen, geschrieben von scenarios/carrier-phase-scored.toml). 1 Tag: Erfolg 1.0 % (Standardfehler 0.5 %), 134 Mehrdeutigkeiten, Sigma der Orbiterposition 45.6 m frei und 18.5 m festgesetzt; 2 Tage: Erfolg 0.5 % (Standardfehler 0.4 %), 259 Mehrdeutigkeiten, Sigma der Orbiterposition 21.5 m frei und 8.7 m festgesetzt; 3 Tage: Erfolg 2.8 % (Standardfehler 0.8 %), 375 Mehrdeutigkeiten, Sigma der Orbiterposition 6.3 m frei und 2.1 m festgesetzt. Das ganzzahlige Festsetzen gelingt nicht: Der Erfolg bleibt bei 25 dBi zwischen 1 % und 3 %, und bei den registrierten 12 dBi lässt sich das Problem nicht aufstellen. MODELLED: ein eingeschränktes Dreikörpermodell mit genannten Vereinfachungen und illustrativen Eingaben, keine Messung irgendeiner lunaren Größe. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Präzision des lunaren Datums mit sieben Parametern (drei Translationen, ein Maßstab und drei Rotationen) aus Entfernungsmessungen von Erdstationen, mit und ohne Entfernungen zwischen Orbiter und Oberflächenstationen, aus einem echten Lauf der Engine v0.40.0 auf scenarios/lunar-infrastructure-frame-coestimation.toml. Das Cramer-Rao-Sigma der Translationen und Rotationen sinkt mit den Orbiterverbindungen (zum Beispiel t_z von 0.98 m auf 0.046 m); der kleinste Eigenwert der Information steigt um das 111-Fache, und die CRLB-Spur fällt auf 1.0 % (Zielwert F3 MET). Dies setzt voraus, dass die Bahn in den lunaren Achsen bekannt ist, wobei ihr Fehler durch das Sigma der Orbiterentfernung von 1 m getragen wird. MODELLED: ein eingeschränktes Dreikörpermodell mit genannten Vereinfachungen und illustrativen Eingaben, keine Messung irgendeiner lunaren Größe. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Präzision der Versätze zwischen Laserentfernungsmessung, VLBI- und GNSS-Positionen eines Raumfahrzeugs, gegenüber dem Fehler des lokalen Anschlusses am Boden, aus einem echten Lauf der Engine v0.40.0 auf scenarios/lunar-infrastructure-space-tie.toml (ein Bogen von 6.56 Tagen, Sigmas der Verfahren GNSS 10 m, VLBI 1 m, Laser 0.1 m). Bei einem lokalen Anschluss von 1 mm bis 1 m bleibt das Sigma der Translation Laser minus GNSS nahe 1.04 m, bis der Anschluss 1 m erreicht: Es ist durch das Messrauschen der Verfahren begrenzt, nicht durch den lokalen Anschluss. Die Untergrenze, die der Anschluss allein setzt, ist die Quadratwurzel aus zwei mal sein Sigma. MODELLED: ein eingeschränktes Dreikörpermodell mit genannten Vereinfachungen und illustrativen Eingaben, keine Messung irgendeiner lunaren Größe. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Welche Familie von Beobachtungsgrößen für die lunaren Love-Zahlen h2, k2 und l2 empfindlich ist, aus einem echten Lauf der Engine v0.40.0 auf scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Jede Zelle ist die RMS-Partialableitung der Beobachtungen einer Familie nach einem Parameter, in den eigenen Einheiten dieser Familie (Zellen werden also innerhalb einer Zeile verglichen, nicht innerhalb einer Spalte); ein Strich bedeutet, dass die Familie keine Empfindlichkeit hat. Laserentfernungsmessung: h2 7.6, k2 keine, l2 9.8. Orbiter-Bahnverfolgung: h2 keine, k2 0.00086, l2 keine. Oberflächengravimeter: h2 2.9e+03, k2 4.3e+03, l2 keine. Oberflächenuhr: h2 2.8e-17, k2 2.8e-17, l2 keine. Mit allen vier Familien beträgt das Cramer-Rao-Sigma 0.36 % des nominalen h2, 0.52 % von k2 und 1.16 % von l2. Das Hinzufügen einer Familie senkte nie den kleinsten Eigenwert (28 von 28 Hinzufügungen), aber die Spur der Pseudoinversen war nur in 16 von 28 Fällen nicht größer: Diese Hälfte des Zielwerts G3 ist NOT MET. Die Orbiterfamilie sieht das Sichtlinienintegral der k2-Beschleunigung, ein Wert am oberen Ende. MODELLED: ein eingeschränktes Dreikörpermodell mit genannten Vereinfachungen und illustrativen Eingaben, keine Messung irgendeiner lunaren Größe. Hinweis: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst.">
</picture>

**Registerstatus: MODELLED, und drei Zielwerte sind NOT MET.** Die Numerik ist gegen unabhängige
numpy- und scipy-Programme geprüft; nichts wird mit einer Messung einer lunaren Größe verglichen, und nichts ist
VALIDATED. Erreicht: Die beiden Bahnlösungen sind konsistent (mittleres q 5.81 gegenüber erwarteten 6), und Orbiter-
verbindungen heben den kleinsten Eigenwert des Datums etwa um das 111-Fache, unter Annahme einer bekannten Bahn. **Nicht erreicht**: Der
eingebrachte Modellfehler von 3e-10 m/s2 wird **nicht erkannt** (C3: Die Lösung an Bord ist auf etwa 350 m bekannt, sodass sich
etwa zehn Meter in ihrer Kovarianz verbergen); **das ganzzahlige Festsetzen gelingt nicht** (1 bis 3 % Erfolg bei
25 dBi, und bei den registrierten 12 dBi lässt sich das Problem nicht aufstellen); und die Spurhälfte von G3 für das Hinzufügen einer
Familie von Beobachtungsgrößen (die Spur stieg bei 12 von 28 Hinzufügungen, jedes Mal, weil die Familie den Rang erhöhte).
Jede Verfehlung ist durch einen Test festgeschrieben. [Mondinfrastruktur](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Öffnen Sie [kshana.dev/studio](https://kshana.dev/studio/), und die ganze Engine läuft in Ihrem
Browser, kompiliert zu WebAssembly. Nichts zu installieren, und nichts wird hochgeladen. Das Studio hat
zwei Ansichten derselben Engine, und ein Schalter in der Kopfzeile wechselt zwischen ihnen, wobei
Szenario, Ansicht und alle geänderten Einstellungen erhalten bleiben.

**Die einfache Ansicht** ist die, mit der das Studio öffnet. Sie beginnt mit Fragen (wie viele Satelliten
kann ich sehen, kann ich meiner Positionslösung vertrauen, wie lange kann eine Uhr die Zeit halten, was macht ein Störer
mit meinem Empfänger) und mit einer Karte von allem, was die Engine kann, jeder Bereich mit seinem Anteil
validierter Methoden. Öffnen Sie ein Szenario, und die Antwort kommt zuerst: ein schlichter Satz, geschrieben für
das, was dieses Szenario misst, dann seine Kennzahlen und ein Diagramm. Höchstens fünf Einstellungen werden
angezeigt, diejenigen, die die Antwort am stärksten verändern; der Rest wartet unter **Erweiterte Einstellungen**.
**Wie dies berechnet wird** erklärt die Methode, und **Für Forschende** liefert die eigenen Zahlen der Engine,
die Szenariodatei, den Code, um es aus Python auszuführen, und die Zitierangabe.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, einfache Ansicht, mit dem mitgelieferten Szenario integrity-raim, Engine v0.40.0 lokal ausgeführt. Die Frage: Erfüllt die Geometrie die Alarmgrenzen (horizontaler und vertikaler Schutzpegel)? Die Antwort zuerst, markiert als Live-Ergebnis: Ja, größtenteils: für 95.3 % der 12 h. Die Fehlerschranke des Empfängers blieb bei 344 von 361 Prüfungen unter den Alarmgrenzen (40 m horizontal und 50 m vertikal), und keine Lösung war irreführend. Kennzahlen: Zeit, in der der Lösung vertraut werden kann 95.3 %, längste Lücke 10 min, typische Fehlerschranke 6.5 / 13 m, irreführende Lösungen 0. Daneben Andere Einstellungen ausprobieren mit fünf davon (der Entfernungsfehler, die beiden Alarmgrenzen, die Dauer und die Elevationsmaske) und Erneut ausführen, dann die eingeklappten Abschnitte Erweiterte Einstellungen (13 weitere), Wie dies berechnet wird (8 validiert, 6 modelliert) und Für Forschende. Darunter die Ansichten dieses Ergebnisses und die Schutzpegel, aufgetragen gegen die Alarmgrenze." width="100%">
</picture>

**Die erweiterte Ansicht** ist das vollständige Dashboard: die Szenariobibliothek, fünf nummerierte Schritte
(Wählen, Einstellen, Ausführen, Ergebnisse lesen, Teilen oder exportieren), die Kennzahlen mit PASS- und FAIL-Chips,
wo der Lauf eine Schwelle nennt, und jedes Panel: Übersicht, Diagramme, Karten, Wiedergabe, der
Bericht der Engine und Exporte. Ein Suchfeld erreicht Szenarien, Bereiche und die Felder darin,
und Sie können bis zu vier Läufe anheften und nebeneinander vergleichen.

<details>
<summary>Der Startbildschirm der einfachen Ansicht und die erweiterte Ansicht nach einem Lauf</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, einfache Ansicht, Startbildschirm mit dem Titel Was möchten Sie herausfinden?, mit der Engine v0.40.0 live und in der oberen Leiste drei Links: Trainingsnachbesprechung, Störungskarte und Empfängervertrauen. Vier Fragen: Wie viele Satelliten kann ich überall auf der Erde sehen, kann ich meiner Positionslösung vertrauen, wie lange kann eine Uhr ohne Satelliten die Zeit halten, und was macht ein Störer mit meinem Empfänger. Unter der ersten ihr aufgezeichnetes Ergebnis: mindestens 22 sichtbare Satelliten an jedem Ort und 31 im Mittel mit GPS, Galileo, BeiDou und GLONASS zusammen, eine Lösung möglich an 100 % der Orte und Zeiten, auf einer Weltkarte der sichtbaren Satelliten, mit einer Schaltfläche Dieses Ergebnis öffnen. Daneben Alles, was Kshana kann: 16 Bereiche und 139 sofort ausführbare Szenarien, jede Kachel mit einem kleinen Diagramm aus einem aufgezeichneten Lauf und ihrem Anteil validierter Methoden, und 173 von 350 Fähigkeiten des Registers validiert." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, erweiterte Ansicht, nach einem Lauf des mitgelieferten Szenarios constellation-multi-gnss-coverage (Vier GNSS-Konstellationen, eine Karte), Engine v0.40.0 lokal ausgeführt. Links die Szenariobibliothek, 139 Szenarien in 16 Bereichen. Die fünf Schritte Wählen, Einstellen, Ausführen, Ergebnisse lesen und Teilen oder exportieren, mit Schritt 4 als aktuellem. Kennzahlen: 102 Satelliten, Verfügbarkeit 100 % (PASS), mediane Positionsverdünnung der Genauigkeit (PDOP) 0.95 (PASS), PDOP 95. Perzentil 1.105 (PASS), im Mittel 31.03 sichtbare Satelliten und mindestens 22. Darunter die Panelzeile mit ausgewählter Abdeckung, die Wiedergabeleiste, eine Weltkarte der mittleren PDOP von 0.831 bis 1.0853 mit jedem gezeichneten Satelliten und die globalen Abdeckungszahlen." width="100%">
</picture>

</details>

Quellcode und Build-Hinweise des Studios stehen in [`web/README.md`](web/README.md).

### Die Website

Der Rest von [kshana.dev](https://kshana.dev) wird aus den eigenen Dateien und Engine-Läufen dieses Repositorys
gebaut: Missionen, Fähigkeiten, das Nachweisregister, die veröffentlichte Forschung und die
Ausgaben.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Drei Seiten von kshana.dev nebeneinander. Der Kopfbereich der Startseite: die Namenszeile Kshana · क्षण · der genaue Augenblick über der Überschrift Proben Sie die Minute, in der GNSS ausfällt, mit der Missionskonsole eines echten Laufs der Engine v0.40.0 (ein Globus und drei Live-Diagramme: Zeitfehler der Uhr, Träger-Rausch-Leistungsdichte und Schutzpegel). Nachweise, Veröffentlichte Forschung: die sechs arXiv-Arbeiten auf Grundlage der offenen Engine, die neueste mit einer Abbildung der Engine. Ausgaben, Kshana Pro, dieselbe Engine, verstärkt: Free führt ein Szenario aus, Pro beantwortet die Frage des Programms." width="100%">
</picture>

<a id="capabilities"></a>
## Fähigkeiten

Eine Engine deckt die ganze Fehlerkette ab, vom ersten gestörten Satelliten bis zur letzten
Nanosekunde des Uhren-Holdover. Die Engine hat 92 Szenarioarten; `kshana kinds` listet
sie auf, und [`docs/SCENARIOS.md`](docs/SCENARIOS.md) dokumentiert jedes Feld.

| Fähigkeit | Was sie beantwortet |
|---|---|
| [Spektrum](docs/SPECTRUM.md) | wie ein Störer das GNSS-L-Band einnimmt, Band für Band, Sekunde für Sekunde |
| [Uhren und Zeitgebung](docs/TELECOM-TIMING.md) | wie lange jede Uhr die Zeit hält, nachdem GNSS verloren ist |
| [Konstellationen um jeden Himmelskörper](docs/CONSTELLATION-DESIGN.md) | Abdeckung, Verdünnung der Genauigkeit und Verfügbarkeit um die Erde, den Mond oder den Mars |
| [Sonnensystem](docs/SOLAR-SYSTEM.md) | wo jeder Planet steht, und die Lichtlaufzeit jeder Verbindung |
| [Navigation in niedriger Erdumlaufbahn](docs/LEO-PNT.md) | ein Überflug, eine Verbindung, eine Navigationsnachricht und eine fusionierte Lösung, Stufe für Stufe |
| [Kampagnen](docs/CAMPAIGNS.md) | eine verkettete Mission, ein Sweep oder ein Monte-Carlo-Ensemble in einem Szenario |
| [Animation](docs/ANIMATION.md) | die Zeitreihen eines Laufs als animierte Zeichnung, ein Player oder Einzelbilder |
| [Berichte](docs/REPORTS.md) | jede Zahl mit ihrer Einheit und ihrer Kennzeichnung, in HTML (HyperText Markup Language) und JSON (JavaScript Object Notation) |
| [Interoperabilitätsexporte](docs/INTEROP.md) | Bahnen und Geometrie für andere Werkzeuge: SP3, CCSDS OMM und OEM, CZML, KML, GeoJSON, STK und SigMF |
| [Maritimes Vertrauen](docs/MARITIME-TRUST.md) | kann die Brücke dieser Lösung vertrauen: ein Wert von 0-100 und Gründe für das NMEA eines Schiffes, live oder aus einem Protokoll (beratend, keine typzugelassene Navigationsausrüstung) |
| [NMEA-Trainingsströme](docs/NMEA-TRAINING.md) | synthetisches Brücken-NMEA mit geskriptetem Jamming und Spoofing und einem Ausbilderprotokoll, für das Training der Besatzung (nur Text; nie für die Live-Navigationssysteme eines Schiffes; beratend, keine typzugelassene Navigationsausrüstung) |
| [Störungskarte](docs/INTERFERENCE-MAP.md) | wo Flugzeuge und Schiffe beeinträchtigte Navigationsdaten meldeten, und wie viel einer Route davon berührt wird |
| [Senderregion](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | wo sich unter genannten Annahmen eine Quelle beeinträchtigter Positionsmeldungen befinden kann: Regionen mit genannter Konfidenz, ein Schwerpunkt mit seiner Ellipse, nie ein Punkt (MODELLED; `kshana interference-map locate`) |
| [Nachweispakete](docs/EVIDENCE-PACKS.md) | eine signierte, offline überprüfbare technische Aufzeichnung eines Protokollfensters eines Schiffes und dessen, was die Engine daraus berechnet hat, für einen Vorfallbericht (beratend, keine typzugelassene Navigationsausrüstung) |
| [Vertrauenstelemetrie](docs/TRUST-TELEMETRY.md) | der Vertrauensstrom als Prometheus-Metriken, SIEM-Ereignisse und optional OpenTelemetry, mit einem Beispiel-Dashboard für Grafana (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K und OpenCPN](docs/MARINE-INTEGRATIONS.md) | der Vertrauenswert auf dem Signal-K-Server eines Bootes und in OpenCPN, mit einem Referenzaufbau für einen kleinen Rechner neben dem Empfänger (beratend, keine typzugelassene Navigationsausrüstung) |
| [Prüfstandsexport](docs/TEST-BENCH.md) | `kshana bench-export`: die Fahrzeugbewegung und die Ereignisse eines Szenarios für einen GNSS-Laborsimulator (es wird kein Signal geschrieben), und wie das Empfängerprotokoll danach bewertet wird |
| [Compliance-Zuordnung und -Bericht](docs/compliance/README.md) | `kshana compliance-report`: für welche Zeilen öffentlicher Resilienz-Rahmenwerke eine Menge von Läufen Nachweise stützt, und welche Lücke bleibt |
| [Notebooks](notebooks/README.md) | ausführbare Tutorials: Schiffsvertrauen und Trainingsströme, eine Routenexposition auf der Störungskarte, Compliance-Zuordnung und der Prüfstand, Quanten- gegenüber klassischer GDOP |
| [Galileo-OSNMA-Prüfer](docs/OSNMA.md) | die Navigationsdaten welcher Satelliten ein Empfänger kryptografisch authentifizieren kann, und warum eine Prüfung fehlschlägt; Kshana gewährt keine Rechte aus den OSNMA ICD IPRs der EU (siehe den NOTICE auf der Seite) |

Die Exportformate ausgeschrieben: SP3 ist Standard Product 3; CCSDS OMM und OEM sind die Orbit
Mean-elements und Orbit Ephemeris Messages des Consultative Committee for Space Data
Systems; CZML und KML sind die Cesium und Keyhole Markup Languages; STK ist Systems Tool Kit;
SigMF ist das Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="Die verkettete Kampagne campaign-jam-spoof-holdover-integrity, ein echter Lauf der Engine (Seed 20260928): 6 Phasen (Nominal → Jamming → Spoofing → Holdover → Integritätsalarm → Erholung) und 18 Mitgliedsläufe auf einem 10-s-Raster über T+01:16:10. Drei Spuren: Zeitfehler der Uhr gegenüber einer Schutzgrenze von 50 ns (Spitze 62.7 ns), effektive Träger-Rausch-Leistungsdichte gegenüber einer Untergrenze von 25 dB-Hz (Minimum -12.2 dB-Hz) und vertikaler Schutzpegel gegenüber einer Alarmgrenze von 50 m (Spitze 135.4 m), mit den Alarmereignissen des Laufs: T+00:20:00 Alarme des HF-Spoofing-Detektors (fusionierte Konsistenz-, Leistungs- und Signalqualitätsmonitore); T+00:26:10 Alarme des uhrgestützten Spoofing-Monitors." width="100%">
</picture>

<details>
<summary>Jede Fähigkeit, gezeichnet aus einem echten Lauf: der L-Band-Wasserfall, die Abdeckungskarte, das Sonnensystem und ein Überflug in niedriger Erdumlaufbahn</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="Das GNSS-L-Band als eine spektrale Leistungsdichte über 60 s, aus einem echten Lauf der Art spectrum (l-band-waterfall-jamming.toml, Seed 7, Engine v0.40.0): Frequenz waagerecht, Zeit nach unten, Farbe für die Leistung über dem Rauschboden von -202.0 dBW/Hz. Störer: Chirp-Privatsphäregerät (Chirp, an bei 10 s, aus bei 40 s); CW-Ton auf L1 (CW, an bei 30 s); L2-Schmalbandrauschen (Schmalband, an bei 45 s). Schlechtestes Band GPS L1 C/A: minimales effektives C/N0 3.2 dB-Hz bei 31 s gegenüber einer Nachführuntergrenze von 25 dB-Hz. GPS L1 C/A Minimum 3.2 dB-Hz; Galileo E1 Minimum 4.7 dB-Hz; GPS L2C Minimum 36.9 dB-Hz; GPS L5 Minimum 44.1 dB-Hz; Galileo E5a Minimum 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Sichtbare Satelliten über der ganzen Erde für einen Tag, aus einem echten Lauf von constellation-design (constellation-multi-gnss-coverage.toml, Engine von diesem Generator ausgeführt): 102 Satelliten (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Jede 10-Grad-Zelle ist nach der mittleren Zahl der Satelliten über der 10-Grad-Maske schattiert (27.2 bis 36.5); die Punkte sind die Bodenspurproben der Engine, eine pro Stunde und Satellit. Globale Verfügbarkeit 100.00 % bei PDOP höchstens 6, mediane PDOP 0.95, im Mittel 31.0 und mindestens 22 sichtbare Satelliten." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Das Sonnensystem zur Epoche des Szenarios 2026-09-28T00:00:00, aus einem echten Lauf der Art solar-system (solar-system-tour.toml): die Sonne, 9 Planeten und der Zwergplanet Pluto, von oberhalb der Ekliptik gesehen, Abstände zur Darstellung logarithmisch gestaucht, mit der einfachen Lichtlaufzeit jedes Körpers von der Erde. Merkur 0.47 au, 10.1 Lichtminuten, VALIDATED; Venus 0.73 au, 3.0 Lichtminuten, VALIDATED; Mars 1.55 au, 14.0 Lichtminuten, VALIDATED; Jupiter 5.30 au, 49.5 Lichtminuten, VALIDATED; Saturn 9.44 au, 70.2 Lichtminuten, VALIDATED; Uranus 19.44 au, 157.4 Lichtminuten, MODELLED; Neptun 29.88 au, 240.2 Lichtminuten, MODELLED; Pluto 35.61 au, 292.2 Lichtminuten, MODELLED. Verbindungen: Mars zu Jupiter einfach 2193.5 s; Saturn zur Erde einfach 4212.2 s; Europa zu Jupiter einfach 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Ein Überflug in niedriger Erdumlaufbahn (LEO) aus einem echten Lauf der Art leo-pass (leo-pass-iridium.toml, Engine von diesem Generator ausgeführt): Iridium-Überflug in 781 km, STL-Band bei 1621 MHz, gesehen von einem Luftnutzer bei 50° N 30° W. Über der 5°-Maske für 750 s, maximale Elevation 65.0° bei 444 s. Die Träger-Rausch-Leistungsdichte erreicht ihre Spitze bei 80.5 dB-Hz (Median 71.3), 34.3 dB über dem GNSS-Median von 46.2 dB-Hz von 8 sichtbaren GPS-Satelliten (38.2 bis 51.1 dB-Hz); der Doppler erreicht 35.4 kHz." width="100%">
</picture>

Führen Sie jedes davon mit `kshana example <scenario> > s.toml && kshana s.toml` aus: Die Szenarien
sind `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
und `leo-pass-iridium`.

</details>

<details>
<summary>Die maritimen und Störungsfähigkeiten, gezeichnet aus eingecheckten synthetischen Eingaben: ein Vertrauenswert, eine Störungskarte mit Routenexposition, ein Trainingsstrom und ein Nachweispaket</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Vertrauenswert über eine synthetische Überfahrt, aus einem echten Lauf der Engine v0.40.0 auf examples/maritime-trust (ein erfundenes NMEA-Protokoll einer Fähre auf einer Route von Tallinn nach Helsinki, 3001 Epochen bei 1 Hz). Drei Spuren teilen eine Zeitachse. Oben: der Abstand zwischen der Position, die der Empfänger meldet, und der wirklichen Position des Schiffes, der bis etwa 1576 s innerhalb weniger Meter bleibt, bis das geskriptete Wegziehen der Position im Protokoll ihn wegzieht, während der Empfänger weiter eine gültige Lösung meldet. Mitte: der Vertrauenswert von 0 bis 100, während der ersten 300 s der Kalibrierung nicht berechnet, im nominalen Band (mindestens 90) bis zum Wegziehen, dann durch das beeinträchtigte Band (mindestens 55) in das nicht vertrauenswürdige Band fallend. Unten: das Band jeder Epoche als farbiges Band mit seinem Namen. Der Wert ist beratend. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC 61108, IEC 61162): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich. Das Protokoll ist erfunden, um das Format und die Monitore zu zeigen; es ist keine Messung und sagt nichts darüber, wie sich ein Empfänger verhalten würde." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Zwei synthetische Tage der Störungskarte, gezeichnet aus den eingecheckten Beispielen in examples/interference-map/output, jeder mit eigener synthetischer Route und den Anteilen der Routenexposition, die die Engine meldet. Links ein ADS-B-Tag: 1 beeinträchtigte Zelle, 6 nicht beeinträchtigte, 4 nicht bewertete (schraffiert) und Zellen ohne Eintrag, leer gezeichnet, die nicht beobachtet wurden. Die Route ist 525 km lang: 11.5% ihrer Länge in beeinträchtigten Zellen, 38.3% nicht beeinträchtigt, 9.1% nicht bewertet und 41.1% nicht beobachtet. Rechts ein AIS-Tag: Zellen, die vom Kreis- und vom Landdetektor markiert wurden, nicht auffällige Zellen und leere Zellen; die Route ist 454 km lang, mit 10.5% in auffälligen Zellen, 21.2% nicht auffällig, 0.0% nicht bewertet und 68.3% nicht beobachtet. ADS-B und AIS sind getrennte Ebenen, nie kombiniert. Eine markierte Zelle ist kein Befund einer Störung, und eine Zelle ohne Farbe wurde nicht beobachtet, was nicht dasselbe ist wie frei. Alle Daten sind erfunden, im offenen mittleren Atlantik, und keine Messung." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Trainingsstrom aus dem Szenario coastal-drag-off (Engine v0.40.0, Seed 22, 25 Minuten bei einer Lösung je 10 s des Ausbilderprotokolls). Eine Karte zeigt den wahren Kurs des Schiffes und den Kurs, den der Empfänger meldet: Sie stimmen überein, bis bei 421 s ein geskriptetes Wegziehen der Position beginnt; der gemeldete Kurs entfernt sich dann vom wahren, während der Empfänger eine gültige Lösung behält, und springt zurück, wenn das Ereignis bei 1140 s endet. Daneben der Abstand zwischen beiden Kursen über die Zeit und die mittlere Träger-Rausch-Leistungsdichte, die der Empfänger meldet und die für die Dauer des Ereignisses auf ein erhöhtes Niveau steigt. Von Kshana erzeugte synthetische Trainingsdaten. Nur für Training und Tests: Diesen Strom nie in die Live-Navigationssysteme eines Schiffes einspeisen. Beratend, keine typzugelassene Navigationsausrüstung. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC 61108, IEC 61162): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich. Positionen, Daten und Kurse sind erfunden." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Der Aufbau eines Nachweispakets. Ein Empfängerprotokoll (NMEA, u-blox UBX, RINEX 3 oder ein Android-Protokoll) und ein Zeitfenster gehen in kshana receiver-trust evidence, das sieben Dateien schreibt: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig und ein optionales timestamp.tsr. Das Manifest hält den SHA-256 des gesamten Protokolls und jeder Datei sowie eine Hash-Kette über die Dateien fest; die Signatur deckt das Manifest ab. kshana evidence verify prüft die Signatur, den Hash jeder Datei, die Kette und dass keine nicht aufgeführte Datei vorhanden ist, und endet mit 0, wenn verifiziert, mit 1, wenn etwas fehlschlug, und mit 3, wenn der Unterzeichner nicht festgelegt war. Ein Paket ist eine technische Aufzeichnung, kein Rechtsgutachten." width="100%">
</picture>

Alle vier sind erfundene Daten und beratend: Sie zeigen das Format und das Verhalten der Software, nicht, wie ein Empfänger oder System gegen Störungen abschneidet. Führen Sie das erste mit `kshana receiver-trust examples/maritime-trust/session.toml` aus, das zweite mit `kshana route-exposure` auf den Beispielen in `examples/interference-map/`, das dritte mit `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (nur für Trainingszwecke: nie in Live-Navigationsausrüstung einspeisen) und das vierte wie in [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Die vollständige Fähigkeitstabelle, Bereich für Bereich</summary>

Die vollständigen Einzelheiten Bereich für Bereich folgen; für ein Reiferegister je Fähigkeit siehe
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) und [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Bereich | Fähigkeit |
|--------|------------|
| **Bahn und Geometrie** | SGP4/SDP4-Propagation (auf 4.12 mm validiert gegen alle 666 Vektoren von AIAA 2006-6753); echte Zweizeilenelemente (ein eingecheckter, datierter Celestrak-Schnappschuss `gps-ops`) oder synthetische Walker-Delta-Konstellationen, deren mittlere Elemente die Formel `i:T/P/F` über eine 24-h-Propagation auf unter 1 km umsetzen; Sichtbarkeit über mehrere Konstellationen, **Verdünnung der Genauigkeit — geometrisch, Position, horizontal, vertikal und Zeit (GDOP/PDOP/HDOP/VDOP/TDOP), auf 1e-6 validiert gegen gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), und GNSS-Verfügbarkeit; ein gradientenfreier Optimierer für den Konstellationsentwurf, Mindestsatellitenbemessung nach Streets of Coverage, ein Vergleichswerkzeug für mehrere Konstellationen und ein Walker-**Entwurfssweep**, der Abdeckung / PDOP / Wiederbesuchszeit über ein Raster Ebenen × Satelliten tabelliert und die Pareto-optimalen Entwürfe meldet. |
| **Numerischer Propagator** | Ein numerischer **Cowell**-Propagator (`src/propagator.rs`), der den analytischen SGP4/SDP4-Pfad ergänzt, mit einem hierarchischen Kraftmodell aus **sieben Störungen** (`src/forces.rs`): Zweikörper + das vollständige **zonale J2–J6**-Feld (die zonalen harmonischen Koeffizienten J2 bis J6 der Erdabplattung; der exakte analytische Gradient seines Störpotenzials), ein optionales **tesserales Kugelfunktions-Geopotenzial EGM2008 bis Grad/Ordnung 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; echte Koeffizienten der NGA — US (United States) National Geospatial-Intelligence Agency —, normierte Legendre-Rekursion nach Holmes–Featherstone, gegengeprüft mit den geschlossenen Legendre-Funktionen und der analytischen ∇V-Identität), **epochengesteuerte Drittkörper-Gravitation von Sonne und Mond** (eine eingebaute Ephemeride geringer Genauigkeit, kein DE/SPK-Kernel — Development Ephemeris / SPICE Spacecraft and Planet Kernel), **Sonnenstrahlungsdruck** (Kanonenkugelmodell mit konischem Kern- und Halbschatten), **atmosphärischer Widerstand** (stückweise exponentielle Dichte nach Vallado, mitrotierende Atmosphäre), die **post-Newtonsche relativistische Schwarzschild-Korrektur** und der **Lense–Thirring**-Term des Frame-Dragging (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, linear im Drehimpuls der Erde, ~1–2 Größenordnungen unter Schwarzschild) — angetrieben von einem von zwei adaptiven Integratoren (RK4 — Runge–Kutta vierter Ordnung — mit Schrittverdopplung oder das eingebettete Paar **Dormand–Prince RK5(4)**). **Validiert gegen Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 Epochen über LEO (niedrige Erdumlaufbahn) + GTO (geostationäre Transferbahn), die Stufen der konservativen Kräfte stimmen im ungünstigsten Fall auf **\|Δr\| 0.08 m über 24 h** überein (`tests/numerical_cowell_propagator_reference.rs`); die Stufe des atmosphärischen Widerstands wird gesondert charakterisiert (≈ 333 m / 24 h), und die absoluten Eingaben für Sonnen-/Mondephemeride und Dichte bleiben ehrlich **Modelled**. Zusätzliche interne Nachweise (keine externe Validierung): Die ungestörte Bahn wird gegen die exakte Kepler-Lösung mit universellen Variablen auf **unter einen Meter über 24 h** geprüft, Energie/Drehimpuls bleiben auf ~1e-9 erhalten, und jede Störung entspricht einer von Hand hergeleiteten geschlossenen Signatur. |
| **Manöver und Trajektorienentwurf** | Impulsive ΔV-Knoten mit 6×6-Kovarianzpropagation (Ausführungsfehler-Systeme ECI — erdzentriert inertial — / LVLH — lokal vertikal, lokal horizontal), Integration endlicher Brennphasen, geprüft gegen die geschlossene **Tsiolkovsky**-Raketengleichung auf < 0.01 %, ein **Lambert**-Löser nach **Izzo-2015** für einen Umlauf, ein exakter **Kepler**-Propagator mit universellen Variablen und ein **Porkchop**-Sweep (Start × Ankunft) über C3 (Startenergie) / Ankunfts-V∞, ausgegeben als JSON-Konturraster — die Ebene der Leistungssimulation oberhalb von GMAT/Orekit, wobei jede Lambert-Ausgabe gegen die Zweikörper-Wahrheit hin und zurück geprüft und das Porkchop-Minimum gegen die analytische Hohmann-Untergrenze geprüft wird. |
| **Zeitsysteme und Bezugssysteme** | IERS-Schaltsekunden-Skalen **UTC / TAI / TT / UT1** (Koordinierte Weltzeit, Internationale Atomzeit, Terrestrische Zeit und die Erdrotationszeit Universal Time 1), eine API für julianische Daten (Programmierschnittstelle), der IAU-2000-**Erdrotationswinkel** (ERA) (International Astronomical Union), **TEME ↔ ECEF** auf Basis der GMST (Greenwich Mean Sidereal Time) (wahrer Äquator, mittleres Äquinoktium ↔ erdzentriert, erdfest) mit geodätischen Systemen nach WGS-84 (World Geodetic System 1984), IAU-2006-Präzession (Fukushima–Williams), vollständige **IAU-2000A/2000B-Nutation**, IERS-**Polbewegung** und die äquinoktiumfreie **CIO-basierte Reduktion IAU 2006/2000A GCRS↔ITRS** (CIO = Celestial Intermediate Origin) — alle **Bit für Bit** gegen die SOFA/ERFA-Vektoren validiert und **unabhängig gegen ANISE gegengeprüft** (die reine Rust-Neuimplementierung von NAIF/SPICE; NAIF = die Navigation and Ancillary Information Facility der NASA, der US National Aeronautics and Space Administration): GCRS→ITRS von kshana gegenüber ITRF93 (International Terrestrial Reference Frame 1993) von ANISE aus `earth_latest_high_prec.bpc` des JPL, mit denselben IERS-Erdorientierungsparametern für beide, stimmen auf **≤ 0.86 m am Boden / ≤ 3.6 m in GNSS-Bahnhöhe** (max. 0.028″) über acht Epochen 2020–2023 überein. |
| **Inertial** | Dreiachsiges Strapdown-INS — Quaternion-Lage, WGS-84-NED-Mechanisierung (Nord-Ost-Unten), Coning-/Sculling-Kompensation und ein deterministisches IMU-Fehlermodell (Skalenfaktor, Fehlausrichtung, g-Empfindlichkeit, Quantisierung, Drift); ein **aus ersten Prinzipien hergeleiteter Beschleunigungsmesser auf Basis eines Kaltatom-Interferometers** (Mach–Zehnder-Phase, Quantenprojektionsrauschen, Kontrastabfall, Vibrationskopplung), der den Koeffizienten des Geschwindigkeits-Random-Walk *herleitet*; und ein **Partikelfilter** mit sequenziellem Importance-Resampling für kartengestützte (gelände-/schwerereferenzierte) Navigation ohne GPS. |
| **Alt-PNT (ohne GPS)** | Ein **Messmodell für ein Kaltatom-Gravimeter**, dessen Weißrauschboden (`σ = ASD/√τ`, ASD = Amplitudenspektraldichte) aus der Physik des CAI-Beschleunigungsmessers hergeleitet ist; ein vollständig normiertes **Schwereanomaliefeld aus Kugelfunktionen** niedrigen Grades (geprüft gegen die geschlossenen Legendre-Funktionen und eine von Hand hergeleitete Anomalie mit einem Term) plus synthetische Mascons; der **Synthesekern für Schwerefunktionale** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — der „Kartenleser“, mit dem ein schweregestützter Navigator abgleicht — ist gegen den **GRS80-Normalschwerestandard** (Geodetic Reference System 1980) validiert, reproduziert die geschlossene Normalschwere nach Somigliana und die veröffentlichten γ_e / γ_p auf **3.5e-12** und erzeugt aus dem echten **EGM2008**-Feld des ICGEM (International Centre for Global Earth Models) eine physikalisch begrenzte Störungskarte (RMS — quadratisches Mittel — ≈ 26 mGal, max. ≈ 89 mGal bei G/O 70; `tests/icgem_gravity_reference.rs`); und ein **Partikelfilter für Schwerekartenabgleich**, der einen Kurs ohne GPS aus der durchflogenen Anomaliefolge zurückgewinnt. Es erstreckt sich auf **geländereferenzierte Navigation** (TERCOM/SITAN — Terrain Contour Matching / Sandia Inertial Terrain-Aided Navigation — gegen ein SRTM-`.hgt`-DEM (Shuttle Radar Topography Mission, digitales Höhenmodell), `src/altpnt/terrain.rs`), ein **geomagnetisches Hauptfeld IGRF-14** (14. Generation des International Geomagnetic Reference Field) bis Grad/Ordnung 13 (`src/igrf.rs`, geprüft gegen die geschlossene Form des geneigten Dipols und ∇V-Finite-Differenzen) und einen **kombinierten Schwere- + Magnet- + Gelände**-Navigator, der alle drei skalaren Kanäle durch einen Partikelfilter fusioniert (Information ist additiv — kein Kanal verschlechtert die Lösung). Ein **60-minütiger Benchmark ohne GPS** (ein Ausfall von ~700 km / einer Stunde, in dem die Inertiallösung auf ~70 km driftet) wird von einem hierarchischen Grob-zu-Fein-Abgleicher auf **~145 m (< 500 m)** zurückgewonnen — das Ziel *Quantum Wayfarer* von ESA NAVISP (Navigation Innovation and Support Programme). |
| **Fusion** | Lose gekoppelter GNSS/INS-Fehlerzustands-EKF (erweiterter Kalman-Filter) mit 15 Zuständen und Rückführung im geschlossenen Kreis (das Paket `gnss-ins`); eine **eng gekoppelte** Pseudoentfernungsaktualisierung, die mit weniger als vier Satelliten weiter korrigiert; ein gekoppelter Filter für **Uhr + Position**; ein allgemeiner **Unscented-(Sigma-Punkt-)Kalman**-Schätzer für stark nichtlineare Messungen; ein eng gekoppelter GNSS/INS-**UKF-Navigator** (Pseudoentfernung + Doppler), dessen Bahnfortführung mit Kraftmodell auf Selbstkonsistenz zu **0.77 m RMS** geprüft ist, über einen 30-minütigen gekrümmten LEO-Überflug mit einem GNSS-Ausfall von 120 Sekunden (eine Zahl zur Filterkonsistenz, keine Validierung gegen eine externe Referenz — dieser Navigator bleibt MODELLED); und ein vollständiger **eng gekoppelter GNSS/INS-UKF mit 17 Zuständen** (Position, Geschwindigkeit, Lagefehler, Biase von Beschleunigungsmesser und Kreisel, Uhrenbias und -drift), dessen **Koppelnavigation mit Quanten-CAI** einen Ausfall von 120 Sekunden auf dem hergeleiteten Geschwindigkeits-Random-Walk des Kaltatom-Beschleunigungsmessers überbrückt. |
| **Bahnbestimmung** | Rückgewinnung eines Bahnzustands `[r, v]` aus Entfernungsmessungen von Bodenstationen, wobei das Kraftmodell Zweikörper + J2 und der RK4-Integrator mit einem **Gauss–Newton-Batch**-Korrektor (`determine_orbit_batch`, unter einem Meter / mm·s⁻¹ aus rauschfreien Entfernungen, ~2 m bei einem Rauschboden von 5 m) und einer **sequenziellen** Unscented-Filter-Variante (`determine_orbit_sequential`) kombiniert werden. |
| **Beobachtbarkeit und Schätztheorie** | Eine allgemeine, wiederverwendbare Schicht für **Fisher-Information / Cramér–Rao** (`src/fim.rs`): die Informationsmatrix M = HᵀWH, die **Cramér–Rao-Untergrenze**, Beobachtbarkeits-**Rang und Nullraum des Datumsdefekts** (Moore–Penrose-Pseudoinverse) und **D/A/E/T-optimale** Skalare des Versuchsentwurfs aus einem symmetrischen Jacobi-Eigenlöser. **Validiert** — Eigenwerte gegen `numpy.linalg.eigh`, die CRLB-Kovarianz gegen σ²(XᵀX)⁻¹ über `numpy.linalg.inv` und GNSS-DOP aus der Informationsmatrix, alle auf **1e-9** übereinstimmend (`tests/fim_observability_reference.rs`), und zusätzlich gegengeprüft gegen die geschlossenen Schranken nach **Kay (1993)** mit Monte-Carlo-Erreichen der CRLB. Sie trägt die DOP-Engine, die CRLB der passiven Geolokalisierung und das **Beobachtbarkeitstheorem** für absolute Mondstationen (unten). |
| **Mond und cislunar** | Ein Propagator für das **kreisförmig eingeschränkte Dreikörperproblem (CR3BP)** Erde–Mond im rotierenden System — erhaltene Jacobi-Konstante und alle fünf Lagrange-Punkte (`src/cr3bp.rs`) — jetzt mit einer **6×6-Zustandsübergangsmatrix (STM) und einem differenziellen Korrektor nach dem Single-Shooting-Verfahren** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`), der echt periodische **Halo- / NRHO**-Bahnen (nahezu geradlinige Halo-Bahn) erzeugt: Die STM ist gegen finite Differenzen validiert, korrigierte Bahnen schließen sich bis auf Maschinengenauigkeit, und das Ansetzen des veröffentlichten Apolunzustands reproduziert die **südliche L2-9:2-NRHO** (L2 = der zweite Lagrange-Punkt Erde–Mond; die Gateway-Bahn) mit Periode ≈ 6.57 d / Perilun ≈ 3,250 km, konsistent mit den veröffentlichten ≈ 6.56 d / ≈ 3,370 km (eine CR3BP-Lösung — kreisförmig, ohne Sonne —, **nicht** gegen eine echte Ephemeride von LANS (Lunar Augmented Navigation Service)/Gateway validiert; die selenozentrische MCI/MCMF-Transformation (mondzentriert inertial / mondzentriert, mondfest) der korrigierten Bahn ist ein Folgeschritt); dazu cislunare PNT-Geometrie nach **LunaNet / LNIS** (LunaNet Interoperability Specification) (MCI↔MCMF-Reduktion, selenografische Koordinaten) mit einem **ARAIM-Durchlauf für den lunaren Südpol**, der die Integritätslücke ehrlich offenlegt: Ein σ_URE (Nutzerentfernungsfehler) von ~30 m treibt den Schutzpegel deutlich über eine Alarmgrenze von 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); und eine **DOP-Ergänzung durch Oberflächenbaken** (`src/lunar_beacon.rs`), die zeigt, wie einige vermessene Entfernungsbaken an der Oberfläche die Sichtlinienzeilen mit niedriger Elevation und breitem Azimut liefern, die einem reinen Bahnsatz mit allem über Kopf fehlen — sie lassen die schlecht konditionierte GDOP am Südpol einbrechen und, über ein Fehlerbudget als Wurzel der Quadratsumme, die realisierte Positionsgenauigkeit in Metern (unter Wiederverwendung des mit gnss_lib_py validierten DOP-Kerns und der geschlossenen Form der Sichtbarkeit am atmosphärelosen Horizont; die Analyse der Verdünnung der Genauigkeit ist in [arXiv:2607.06212](https://arxiv.org/abs/2607.06212) beschrieben). |
| **Lunare PNT-Suite** | Eine lunare/cislunare Navigationssuite auf dem CR3BP-Kern, jede als ausführbare `kind`: **Lunare Koordinatenzeit** (`lunar-time-offset`, `src/lunar_time.rs` — die säkulare Rate LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL = ihre französische Form, Temps-Coordonnée Lunaire) aus der Differenz der Eigenpotenziale + kinetischem Term, angegeben mit dem veröffentlichten Band von 56–59 µs/Tag); eine geodätische Verzögerungsbeobachtung mit **lunarer VLBI** (Very-Long-Baseline-Interferometrie) (`lunar-vlbi`, `src/lunar_vlbi.rs` — eine Nahfeld-Verzögerung + Rate aus zwei Entfernungsdifferenzen auf einer Erdbasislinie, im Fernfeld-Grenzfall gegen das ebene Wellen-Δ-DOR (Delta Differential One-Way Ranging) derselben Codebasis gegengeprüft, Partialableitungen über finite Differenzen verifiziert); ein **gemeinsamer Batch-Schätzer für Bahnbestimmung + Uhr aus mehreren Verfahren** (`lunar-joint-od-clock`, `src/lunar_combination.rs` — eine Gauss–Newton-Anpassung, die VLBI + lokale Mondentfernungen + Intersatellitenentfernungen fusioniert) mit einem Ergebnis zur **Beobachtbarkeit über Fisher-Information**: Interne Entfernungsmessung allein hinterlässt einen **Datumsdefekt** des starren Körpers mit sechs Freiheitsgraden, sodass die *absolute* Position einer Oberflächenstation unbeobachtbar ist, bis ein Anschluss an das Erdsystem hinzukommt — eine **VLBI**-Verzögerung auf einer Erdbasislinie *stellt* die Beobachtbarkeit für eine dünne Konstellation *wieder her* und *schärft* die Cramér–Rao-Schranke für eine reiche, wobei sich das absolute Datum bei **drei** nicht kollinearen Erdstationen schließt (das Beobachtbarkeitsergebnis ist in [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) beschrieben); **Realisierung des Bezugssystems** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — eine Helmert-Datumsanpassung mit 7 Parametern + Orientierungsanschluss nach IAU 2015 WGCCRE — WGCCRE = die IAU Working Group on Cartographic Coordinates and Rotational Elements); eine Analyse des **Dienstvolumens der Klasse Moonlight/LCNS** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / Abdeckung / Verfügbarkeit + eine verallgemeinerte lunare ARAIM-Hüllkurve HPL/VPL (horizontaler/vertikaler Schutzpegel), unter Wiederverwendung des mit gnss_lib_py validierten DOP-Kerns und der LunaNet-Maschinerie mit σ_URE≈30 m); **lunare differenzielle PNT** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — ein lunares Analogon zu differenziellem GNSS / satellitengestütztem Ergänzungssystem (SBAS): exakte Auslöschung des Gleichtakt-Uhrenfehlers + räumliche Dekorrelation erster Ordnung über der Basislinie, unter Wiederverwendung des SBAS-Schutzpegels nach DO-229E — DO-229E ist der Mindestleistungsstandard der RTCA (früher Radio Technical Commission for Aeronautics) für SBAS-Empfänger); und ein **auf LunaNet/IOAG abgestimmter Interoperabilitätsexport** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + Rundlauf der lunaren Zeitskala im körperfesten Mondsystem nach IAU 2015, verpackt in den KIF-Umschlag). Die Evidenzstufen je Teil stehen in der [Verifikationsmatrix](docs/VERIFICATION-MATRIX.md): Lunare Koordinatenzeit, der gemeinsame Schätzer für Bahnbestimmung + Uhr, die Realisierung des Bezugssystems und die Geometrie des Dienstvolumens sind **VALIDATED** (jeweils gegen die unabhängige Referenz, die ihre Zeile nennt, ebenso der Kernpfad der VLBI-Verzögerung); die VLBI-Beobachtung, das Beobachtbarkeitsergebnis zum Datumsdefekt, differenzielle PNT und der Interoperabilitätsexport sind **MODELLED**. Die Parameter sind **illustrative Werte aus öffentlichen Quellen** — **nicht** gegen echte VLBI-/Gateway-Bahnverfolgung validiert, **nicht** mit einer Behörde verbunden oder von ihr gebilligt, keine Aussage zu TRL (Technologiereifegrad) / Flugerprobung. |
| **Tiefraum- und Mars-PNT** | Eine offene **radiometrische Navigations-Engine**: iterative Lichtlaufzeit + relativistische **Shapiro**-Verzögerung, Zwei-/Ein-/Dreiweg-**Doppler und Entfernung** (Moyer, zwei Teilstrecken), kohärente Transponder-Umsetzverhältnisse, regenerative/PN-Entfernungsmessung (Pseudorauschen) (CCSDS 414, der Standard für Pseudorausch-Entfernungsmessung) und **Δ-DOR** in der Himmelsebene (CCSDS 506, der Delta-DOR-Standard), mit Sonnenplasma-/Tropo-/Ionosphärenmedien; Einlesen + Ausgeben von **CCSDS-TDM (503)** (Tracking Data Message); ein **reduziert-dynamischer Square-Root-Information-Filter** (RTN — radial, transversal, normal — empirische Beschleunigungen + eine Borduhr mit 3 Zuständen + Atmosphärenwiderstand des Mars), der in einem synthetischen geschlossenen Kreis eine **Bahnbestimmung im niedrigen Marsorbit auf ≈ 0.2 m** leistet; ein gemeinsamer Schätzer zur **Fusion von Ein- und Zweiweg**; ein Kern für Mehrkörperdynamik (`Body{μ, re, zonals, gravity, IAU-pole}`, Mars-Schwerefeld GMM-3 (Goddard Mars Model 3), ein körperfestes IAU-Marssystem, eine einsteckbare Schnittstelle `EphemerisProvider`, zweiteilige julianische Daten + TT↔TDB (Baryzentrische Dynamische Zeit)); und das Relais-PNT-Szenario **`mars-pnt`** (eine areostationäre MARCONI-Relaiskonstellation) mit einem durchgängigen **GSE-Leistungssimulator** (GSE = Bodenunterstützungsausrüstung) (Geometrie → Linkbudget → Beobachtungen → SRIF → Kovarianz). **Durch Simulation validiert** (Gütemaße aus Kovarianz / geschlossenem Kreis); die sonnenzentrierte Marsdynamik ist gegen JPL **DE440** gegengeprüft (137 m bei einem Bogen von 1 Tag, `xval/anise-mars-od`). Die Validierung mit echten Bahnverfolgungsdaten von DSN/ESTRACK steht auf der Roadmap. |
| **Sonnensystem und PNT um jeden Himmelskörper** | Eine **Ephemeride des ganzen Sonnensystems** ohne Kernel (`src/ephem.rs`, `src/ephem_provider.rs`): jeder Planet aus den **Kepler-Elementen nach Standish** des JPL (Tabelle 1, 1800–2050 n. Chr.; Tabellen 2a/2b, 3000 v. Chr.–3000 n. Chr.) mit dem veröffentlichten Nennfehler jedes Planeten, Erde und Mond über die Mondreihe getrennt, sowie Phobos, Deimos, Io, Europa, Ganymed, Kallisto und Titan aus mittleren JPL-Elementen und dem Rotationsmodell der IAU (International Astronomical Union); **jeder Körper relativ zu jedem anderen** im ICRF (International Celestial Reference Frame). `Body` trägt jetzt **GM (Gravitationsparameter), Radien, J2 (die zweite zonale Harmonische), wo veröffentlicht, sowie IAU-Pol und Nullmeridian für achtzehn Körper**. Die Art **`solar-system`** meldet Positionen, Geschwindigkeiten, Konstanten, **Lichtlaufzeit und Ein-/Zweiweg-Entfernung** zwischen zwei beliebigen Körpern (der vorhandene radiometrische Lichtlaufzeitlöser, mit der solaren Shapiro-Verzögerung) und eine Bahnspur je Körper — genug, um ein interaktives Sonnensystem zu zeichnen; die Art **`body-pnt`** positioniert einen Orbiter oder Lander **um jeden Himmelskörper** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) mit einer lokalen Walker-Konstellation, der Maschinerie für Verdünnung der Genauigkeit und Gauss–Newton sowie einer Tiefraumentfernung von der Erde. **Validiert** gegen JPL Horizons (DE441, JPL Development Ephemeris 441): Merkur–Saturn und die Erde aus Tabelle 1 innerhalb des Doppelten des Nennfehlers (schlechtester 1.87×), alle acht Planeten aus den Tabellen 2a/2b (schlechtester 1.71×) und die Lichtlaufzeit Erde–Mars/Jupiter. **Modelled**: Uranus und Neptun aus Tabelle 1 (2.0× und 5.2× des angegebenen Fehlers gegenüber DE441), Pluto, die Monde und die Navigationsergebnisse von `body-pnt`. |
| **Fusionierte MEO- + LEO-PNT** | `src/leo_fusion/`: systemunabhängige LEO-Positionierung, -Navigation und -Zeitgebung über jede Konstellation (Walker-Schalen, Elementsätze, GNSS-Voreinstellungen) und jedes Signal (Träger, Chiprate, C/N0-Hüllkurve, Entfernungsfehler des Signals im Raum), mit optionalen Voreinstellungen in einer Datei, die ihre Quellen tragen (Xona Pulsar X1/X5, Iridium STL, Starlink-Gelegenheitssignale, CentiSpace, ein repräsentatives C-Band-System, das ATOMIC-Ephemeridenmodell ohne Uhr). **`leo-pvt`**: Batch-**Doppler-Positionierung** aus der Entfernungsrate (ein und mehrere Satelliten, Zustände für Uhrendrift und Geschwindigkeit, Geometrie entlang/quer zur Spur bei einem Überflug und die Spiegellösung), **gemeinsame gewichtete kleinste Quadrate für GNSS + LEO** mit Intersystem-Biasen je System und vom Aufrufer gelieferten Sigmas je Signal, die DOP gegenüber der Zahl der LEO-Satelliten, Abdeckung in **Polar- und Arktisregionen** und **LEO-Zeitübertragung nach UTC** gegenüber C/N0 und dem Oszillator. **`leo-ppp`**: ein Float-PPP-EKF (Precise Point Positioning, erweiterter Kalman-Filter) mit nur GNSS und mit LEO, seine Konvergenzzeit und ein Chi-Quadrat-NEES-Konsistenztest. **`ntn-positioning`**: 5G-Positionierung in nichtterrestrischen Netzen aus der Cramér-Rao-Schranke der Bandbreite. **Validiert**: die LEO-Doppler-Hüllkurve gegen die veröffentlichten Iridium- und Xona-Zahlen. **Modelled**: der Rest, wobei der PPP-Trend mit Li et al. (2019) verglichen wird — siehe [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Integrität** | RAIM als Snapshot und mit Lösungsseparation (ARAIM-artig) — autonome Integritätsüberwachung im Empfänger — mit horizontalen/vertikalen Schutzpegeln (HPL/VPL), Fehlererkennung und -ausschluss sowie Stanford-Integritätsdiagrammen; ein Schutzpegel mit expliziter Integritätsrisiko-Budgetierung nach **Multiple-Hypothesis Solution Separation (MHSS)**, einschließlich des **konstellationsweiten Fehlermodus bei zwei/mehreren Konstellationen** (EU-ARAIM (Europäische Union) / DO-316, der RTCA-Leistungsstandard für GPS-Bordausrüstung mit flugzeuggestützter Ergänzung), erprobt an einem echten GPS- + Galileo-Snapshot (`scenarios/araim-gps-galileo.toml`). Der Schutzpegel wendet je Fehlermodus die einseitige **Nominal-Bias**-Projektion `b_k = Σ_i|s_i|·b_nom` und das **Integritäts**-Sigma σ_URA (Nutzerentfernungsgenauigkeit; verschieden vom Genauigkeits-σ_URE, Nutzerentfernungsfehler) aus der Integrity Support Message an — siehe [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Der Erkennungskern (die Schwellen χ²/nichtzentrales χ²/Normal und die K-Multiplikatoren) ist über 171 Fälle **extern gegen SciPy validiert** (`tests/raim_reference.rs`); die Geometrie verwendet den mit gnss_lib_py validierten DOP-Kern. Die *Budgetaufteilung* des Integritätsrisikos von ARAIM MHSS selbst hat keine veröffentlichte numerische Referenz und bleibt ehrlich Modelled. |
| **Ergänzung (SBAS)** | **SBAS- / WAAS-Schutzpegel** (WAAS = das Wide Area Augmentation System) in der Form gewichteter kleinster Quadrate nach DO-229E (K-Faktoren für Präzisionsanflug und Streckenflug) und die **ionosphärenfreie Zweifrequenzkombination L1/L5** (L1 und L5 sind zwei zivile GPS-Signalbänder; IS-GPS-705, die GPS-Schnittstellenspezifikation für das L5-Signal, γ₁₅ ≈ 1.793), auf der DO-316 aufbaut — `src/sbas.rs`. Der Schutzpegelalgorithmus ist **extern gegen den RTKLIB-SBAS-PL-Fork validiert** (RTKLIB = die offene Bibliothek für Echtzeitkinematik-Positionierung; PL = Schutzpegel) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — die vorige Revision von DO-229 — App. J), ausgeführt auf **echten EGNOS-Daten** (European Geostationary Navigation Overlay Service), und reproduziert dessen HPL auf < 2e-3 m (`tests/sbas_reference.rs`); gLAB (die GNSS Laboratory Tool Suite) v6.0.0 bestätigte die identische Konvention. |
| **Uhr und Zeitgebung** | Kalman-Holdover mit zwei Zuständen (Kovarianz in Joseph-Form, Konsistenzzustand über NIS/NEES — normiertes quadriertes Innovationsmaß / normierter quadrierter Schätzfehler); Stabilität der Allan-Familie (ADEV / MDEV / TDEV / HDEV / MTIE — Allan-, modifizierte Allan-, Zeit- und Hadamard-Abweichung sowie maximaler Zeitintervallfehler) mit rauschtypspezifischen Konfidenzintervallen und einer vollständigen **Potenzgesetzanpassung mit fünf Koeffizienten nach IEEE 1139** (IEEE Std 1139, die Definitionen der Frequenz- und Zeitmetrologie des Institute of Electrical and Electronics Engineers) — die Schätzer sind an echter Hardware gegen **Stable32** validiert: ein **echtes 5071A-Cäsium-Primärnormal gegenüber einem Wasserstoffmaser** (556,990 Phasenabtastwerte, 16 Mittelungsfaktoren, OADEV/OHDEV — überlappende Allan-/Hadamard-Abweichung — auf 1e-3; `tests/cs5071a_reference.rs`) und die **kanonische Stable32-Regressionsreihe PHASE.DAT** (139 Mittelungsfaktoren, OADEV/MDEV/TDEV auf 1e-3; `tests/phasedat_reference.rs`); die Schätzer ADEV/MDEV/TDEV und die Telekom-Wandermetrik **MTIE** sind zusätzlich gegen die **unabhängige Bibliothek allantools 2024.06** auf **< 1e-9** an der Reihe NIST SP 1065 gegengeprüft (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); geometrische Korrekturen (Sagnac, GNSS Common View); und die operativen Übertragungsverfahren — **TWSTFT** (Zweiweg-Satellitenzeit- und -frequenzübertragung) mit der geschlossenen Sagnac-Form des BIPM (Internationales Büro für Maß und Gewicht), **GNSS Common View**, ionosphärenfreie Zeitübertragung mit **PPP** (Precise Point Positioning), eine **optische** Freiraumverbindung mit Turbulenzszintillation und eine **Zeitskala aus einem Uhrenensemble (Papieruhr)** mit inverser Varianz unterhalb der besten beitragenden Uhr. Ein **Rechner für Uhren-Holdover ohne GNSS** (`src/holdover.rs`) stellt das geschlossene van-Loan-Wachstum des Fortführungsfehlers als Inversion *Holdover bis zur Schwelle* bereit — wie lange eine Uhr frei läuft, bevor ihr Zeitfehler das Budget überschreitet — über repräsentative klassische und Quantenuhrklassen; **modelliert** (gegengeprüft gegen die mehrstufige Kovarianzrekursion `clock_state`), und ehrlich darin, dass bei einer sehr stabilen Uhr der Holdover bis zu einer engen Schwelle durch den *angenommenen* Rauschboden bei langem Tau bestimmt wird, nicht durch die zitierte ADEV. Ein **bedingter Timing Protection Level** (`src/tpl.rs`) erweitert den Holdover auf Spoofing: eine Schranke für den *unerkannten* Zeitfehler bei einer unabhängigen Gegenprüfung, die einen k-Sigma-Monitorboden, die van-Loan-Fortführungsvarianz über die Erkennungslatenz und eine CUSUM-Zeit bis zum Alarm (kumulierte Summe) zusammensetzt. Kalibriert an einem echten aufgezeichneten Spoofing (JammerTest 2024) und reproduzierbar über `cargo run --example tpl_jammertest`; **MODELLED** Zusammensetzung (kein Budget für Integritätsrisiko je Stunde), bedingt auf Erkennung — es gibt keine endliche *unbedingte* Schranke. |
| **GNSS-Messbereich** | Vorwärtssynthese von Pseudoentfernung / Doppler mit **Klobuchar**-Ionosphäre (Broadcast) und **IONEX- / TEC-Raster**-Ionosphäre (IONosphere map EXchange format / Gesamtelektronengehalt; gemessen) — einschließlich eines IONEX-Dateiparsers, zeitlicher Interpolation zwischen Karten und der Schrägabbildung mit dünner Schale — **Saastamoinen- + Niell**-Troposphäre und Snapshot-RAIM (HPL/VPL). |
| **Resilienz** | **Jamming** über das Linkbudget (J/S → effektives C/N₀ → Verlust der Nachführung — Stör-zu-Signal-Verhältnis, Träger-Rausch-Leistungsdichteverhältnis — mit dem Anti-Jam-Spektraltrennfaktor `Q`, jetzt **aus den tatsächlichen Leistungsspektren von Signal und Störer hergeleitet** über `src/navsignal.rs` — `Q = 1/(R_c·κ)`, in der CI gegen die vorherige repräsentative Konstante gegengeprüft); ein stochastischer **Zeit-Spoofing-Detektor** (Neyman–Pearson / χ²₁-Energietest mit geschlossener und Monte-Carlo-P_fa/P_md und einem Sicherheitsgütemaß (FoM) von 1 − P_md); und ein **mehrschichtiger Spoofing-Detektor**, der einen Paritätstest der RAIM-Konsistenz (mit ehrlich modelliertem Gleichtakt-Blindfleck), einen HF-Monitor der AGC-Leistung (automatische Verstärkungsregelung) und einen Signalqualitätsmonitor (SQM — Signalqualitätsüberwachung, Early-minus-Late) fusioniert; und ein **Fehlerbudget für quanteninertiale Koppelnavigation** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`), das das Weißrausch-Geschwindigkeits-Random-Walk des Kaltatom-Interferometers mit Restbias (gegengeprüft gegen den unabhängigen Integrator `AccelModel`) und Skalenfaktorfehler zu einer Zahl der Positionsdrift über den Holdover zusammensetzt — das inertiale Gegenstück zum Uhren-Holdover. Eine **an Rahmenwerken ausgerichtete Engine zur Resilienzbewertung** (`src/resilience/`) bildet das simulierte Verhalten einer Architektur auf Teilwerte je Dimension über Kshanas eigene sieben Resilienzkategorien ab (keine DHS-Begriffe), ausgerichtet am Resilient PNT Conformance Framework des US Department of Homeland Security, und untersucht dann die **Entscheidungsstabilität** jedes einzelnen zusammengesetzten Werts oder Reifegrads unter einem Dirichlet-Gewichtungssimplex und einem Ensemble aus fünf Bedrohungen — Kendall-τ-Rang-Instabilität, Wechselrate des Erstplatzierten und Gleichtakt-**Diversitätskollaps** (Hill-N2), mit einem integritätsgehashten Sicherungsbericht (35 von Hand hergeleitete Referenztests). Reproduzierbar über `cargo run --example resilience_report`; **MODELLED** synthetische Architekturen, eine an RPCF v2.0 ausgerichtete Selbstbewertung, **keine** Zertifizierung. Siehe [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Passive HF-Geolokalisierung** | **TDOA/FDOA-Geolokalisierung von Sendern** (Zeit-/Frequenzdifferenz der Ankunft; `src/geolocation.rs`) — einen Störer oder Spoofer (oder eine Gelegenheitsquelle für Reverse-PNT) aus Hyperboloiden der **Ankunftszeitdifferenz** über ein Empfängernetz lokalisieren, gelöst durch Gauss–Newton-kleinste-Quadrate; das Hinzufügen der **Ankunftsfrequenzdifferenz** mit bewegten Empfängern gewinnt gemeinsam Position *und* Geschwindigkeit des Senders zurück, mit der **Cramér–Rao**-Schranke für die Positionskovarianz, hergeleitet aus der Netzgeometrie. **MODELLED** (Referenzen der inneren Konsistenz: Vorwärts→Invers-Rundläufe, die Identität J·CRLB = I, GDOP-Monotonie und das Erreichen der eigenen CRLB durch den Schätzer unter Monte Carlo) — ein Punktquellenmodell mit Sichtlinie, ohne Terme für Mehrwege / NLOS (ohne Sichtlinie), Empfängeruhrenbias oder Refraktion. |
| **Navigationssignal und Codenachführung** | Die **Signalebene** zwischen Linkbudget und Messbereich (`src/navsignal.rs`): **Leistungsspektraldichten** (PSDs) mit Einheitsfläche für **BPSK-R(n)** (binäre Phasenumtastung mit rechteckigen Chips) und **Sinus-BOC(m,n)** (Binary Offset Carrier); der **Spektraltrennkoeffizient** (SSC) κ = ∫ G_s·G_i df, der das **Anti-Jam-`Q` herleitet**, das das Jamming-Modell verwendet (`Q = 1/(R_c·κ)`), aus den tatsächlichen Spektren von Signal/Störer statt aus einer repräsentativen Konstante; die **RMS-Bandbreite (Gabor)** (BOC > BPSK — das Maß für Entfernungsinformation / Cramér–Rao); der **thermische Rauschjitter der kohärenten Early-Late-DLL-Codenachführung** (DLL = Delay-Lock Loop; Kaplan & Hegarty; ~unter einem Meter für C/A — den groben GPS-Erfassungscode — bei 45 dB-Hz); und die **Mehrwege-Fehlerhüllkurve** (kohärentes EML, Early-minus-Late — Unterdrückung durch schmalen Korrelator). Validiert gegen geschlossene Ankerwerte (BPSK-Selbst-SSC = 2/(3·R_c), PSDs mit Einheitsfläche, C/A-Jitter unter einem Meter). Dies ist eine Analyse der Signal**leistung**, **kein** Hardwareentwurf von Antenne / HF-Nutzlast (die Rolle eines Nutzlastpartners). |
| **Interoperabilität** | Einlesen von Broadcast-Ephemeriden mehrerer GNSS aus **RINEX-3** (GPS, Galileo, QZSS — Japans Quasi-Zenith Satellite System —, BeiDou MEO/IGSO — mittlere Erdumlaufbahn / geneigte geosynchrone Bahn — über IS-GPS-200, die GPS-Schnittstellenspezifikation; GLONASS, Russlands Global Navigation Satellite System, über PZ-90 — das russische Datum Parametry Zemli 1990 — mit RK4 auf Zustandsvektoren), nutzbar als Konstellationsquelle (RINEX hinein, PNT-Geometrie heraus); ein Parser für **RINEX-3**-Beobachtungen (Pseudoentfernung, Trägerphase, Doppler, Signalstärke; das Beobachtungslayout 4.00 sollte sich einlesen lassen, ist aber ungetestet, und RINEX-4-Navigationsdateien werden namentlich abgelehnt statt falsch dekodiert), der jetzt einen **Löser für Einzelpunktpositionierung (SPP)** (`pvt`) **speist** — echte Codebeobachtungen hinein, eine echte **Empfängerposition** heraus, validiert an IGS-Daten; ein Leser/Schreiber für präzise Ephemeriden **SP3-c/d** mit Lagrange-Interpolation 9. Ordnung; und Export nach **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) für Flugdynamikwerkzeuge (GMAT, Orekit, STK — Systems Tool Kit); sowie Einlesen + Ausgeben von **CCSDS-TDM (503)** (Tracking Data Message) für radiometrische Bahnverfolgung im Tiefraum. |
| **Missionsanalyse (Systems Engineering)** | Missionsentwurfsbudgets erster Ordnung, jedes als ausführbare Art: **Start- und Aufstiegsgeometrie** im Zweikörpermodell (`launch-window` — Startazimut `sin Az = cos i/cos lat`, minimale Inklination, Bonus durch die Erdrotation, Δv für Dogleg-Bahnebenenwechsel, tägliche Startgelegenheiten; `src/launch.rs`); ein **ballistischer Wiedereintrittskorridor nach Allen–Eggers** (`reentry` — maximale Verzögerung, Geschwindigkeit/Höhe bei maximalem g, Geschwindigkeit bei maximaler Aufheizung; `src/reentry.rs`); **Abdeckungsgeometrie der Erdbeobachtung** (`eo-coverage` — Schwad / Nadir-GSD (Bodenabtastabstand) / Zugang außerhalb des Nadirs / Wiederbesuch über das Raumdreieck nach SMAD (*Space Mission Analysis and Design*); `src/eo_payload.rs`); ein **Lage- und Ausrichtungsfehlerbudget mit 3 Freiheitsgraden** (`attitude-budget` — Schweregradientenmoment im ungünstigsten Fall + RSS-Ausrichtungsbudget (Wurzel der Quadratsumme); `src/attitude_budget.rs`); **Überflugvorhersage für Bodenstationen** (`passes` — AOS/TCA/LOS, Signalerfassung / Zeit der größten Annäherung / Signalverlust, maximale Elevation, Zugangszeit; `src/passes.rs`); und ein **Einweg-Linkbudget** über die Linkgleichung nach CCSDS 401 / DSN 810-005 (der CCSDS-Standard für Hochfrequenz und Modulation / das Handbuch des Deep Space Network für den Linkentwurf; `link-budget` — FSPL (Freiraumdämpfung), C/N₀, Eb/N₀ (Energie-pro-Bit-zu-Rauschdichte-Verhältnis), Reserve, Schließen des Links; `src/linkbudget.rs`). **MODELLED** analytische Budgets erster Ordnung — die Ebene vor der Hardware unterhalb von STK/GMAT/Basilisk, kein Ersatz für 6-DoF oder radiometrische Werkzeuge. |
| **Entscheidungsanalyse und Abwägung (MCDA)** | Eine vollständige Suite zur **multikriteriellen Entscheidungsanalyse** (MCDA) (`src/mcda/`), die alle vier Methodenfamilien abdeckt — Wertaggregation (**WSM**, **WPM**, **WASPAS** — Weighted Sum Model, Weighted Product Model, Weighted Aggregated Sum Product Assessment), Abstand zum Ideal (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), Kompromissprogrammierung (**VIKOR**, aus dem Serbischen für multikriterielle Optimierung und Kompromisslösung) und Outranking (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, aus dem Französischen für Elimination und Wahl als Ausdruck der Realität), dazu das Verhältnissystem **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) und das proportionale **COPRAS** (Complex Proportional Assessment) — mit Prioritätsgewichtung über Paarvergleiche nach **AHP** (Analytic Hierarchy Process) (Konsistenzverhältnis), einer nicht dominierten **Pareto**-Front, **Sensitivitäts**analyse der Gewichte und multiattributiver **Nutzen**bewertung. Die neun Aggregatoren reproduzieren die unabhängigen Bibliotheken Dritter **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) und **pyDecision** (ELECTRE I, COPRAS) auf **< 1e-9**, und der AHP-Prioritätsvektor + das Konsistenzverhältnis stimmen mit Saatys Random-Index-Tabelle und dem Haupteigenlöser von SciPy/LAPACK auf < 1e-9 überein (`tests/mcda_*_reference.rs`). **VALIDATED** — die Entscheidungsschicht unter der Engine für Abwägungsstudien. |
| **Weltraumumgebung** | Ein **Modell der Weltraumwetterumgebung** (`space-weather`, `src/space_weather.rs`): solare (F10.7 / zentriertes 81-Tage-F10.7a — der solare Radiofluss bei 10.7 cm) und geomagnetische (Kp, der planetare K-Index, mit der definitorischen Tabelle Kp↔ap — ap ist seine lineare planetare Amplitude) Aktivitätsindizes, die von ihnen bestimmte exosphärische Temperatur nach **Jacchia-1971** (validiert gegenüber veröffentlichten Werten für solares Minimum/Mittel/Maximum) und die aktivitätskorrigierte gegenüber der statischen thermosphärischen Neutraldichte in der Höhe — die Abhängigkeit der Dichte vom Sonnenzyklus, die die statische Atmosphäre USSA76 (US Standard Atmosphere 1976) auslässt. **MODELLED**: eine kalibrierte Skalenhöhenkopplung erster Ordnung, **keine** datenvalidierte Atmosphäre (NRLMSISE — das Mass Spectrometer and Incoherent Scatter Radar Exosphere Model des US Naval Research Laboratory). |
| **KI/ML-Evaluierung und Abwägung** | Eine **Testumgebung zur Evaluierung der Erkennung von HF-Beeinträchtigungen** (`impairment-eval`, `src/impairment_eval.rs`): ein gekennzeichnetes, parametrisch begründetes **synthetisches** Korpus (nominal / Jamming / Zeit-Spoofing / Positions-Spoofing / Mehrwege), ein detektorunabhängiges **ROC/AUC**-Gerüst (Receiver Operating Characteristic / Fläche unter der Kurve), das jeden Detektor bewertet (energy \| agc \| sqm \| parity \| fused) mit Pd (Entdeckungswahrscheinlichkeit) je Klasse bei einer Ziel-Pfa (Fehlalarmwahrscheinlichkeit), und die **Optimismuslücke** innerhalb gegenüber außerhalb der Verteilung (Modus Verteilungsverschiebung). Dazu eine **Abwägung Quanten- gegenüber klassischer PNT** (`quantum-trade`, `src/quantum_trade.rs`), die den Holdover-Nutzen einer Kandidatenuhr für Zeitgebung/Inertial aus einer **gemessenen ADEV**-Kurve gegenüber einer klassischen Basislinie beziffert, mit dem Vorbehalt zum Boden bei langem τ am Artefakt und einer Hüllkurve der Resilienz über die Zeit ohne GNSS. Die **Metriken** der Evaluierung (AUC / Konfusion / Pd-Pmd, wobei Pmd die Wahrscheinlichkeit einer verpassten Entdeckung ist) sind **auf exakte Übereinstimmung gegen scikit-learn 1.9.0 validiert** — auch an **echter Telemetrie von ESA OPS-SAT** (der Anomalieerkennungsdatensatz OPSSAT-AD, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), wo Kshanas Mann–Whitney-ROC-AUC das `roc_auc_score` von scikit-learn auf der zurückgehaltenen Testaufteilung auf < 1e-9 reproduziert und ein transparenter Spitzenzähldetektor die gekennzeichneten Anomalien bei AUC ≈ 0.85 trennt (`tests/opssat_ad_reference.rs`) — und die numerischen **Kerne** der Abwägungs-Engine (ADEV-NNLS-Anpassung — nichtnegative kleinste Quadrate —, χ²-Konsistenzbänder, van-Loan-Uhren-Q) **gegen scipy 1.17.1**; die darauf aufbauenden Zahlen zum Gerätenutzen bleiben **MODELLED** Betriebscharakteristiken — nie Feld-/IQ-Daten (In-Phase/Quadratur-Abtastwerte), kein Urteil gut/schlecht. Auf der Testumgebung aufbauend bewertet eine tiefere **Studie zur Optimismuslücke** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) ein Panel aus **13 Detektoren** (energy/AGC/SQM/parity sowie geseedete Detektoren mit logistischer Regression und MLP mit einer verborgenen Schicht — Multi-Layer-Perzeptron), passt **Skalierungsgesetze** innerhalb gegenüber außerhalb der Verteilung mit einer Permutations-Nullhypothese an und lernt einen **Leave-one-out-Prädiktor** für die Verschlechterung außerhalb der Verteilung aus Statistiken innerhalb der Verteilung (`cargo run --example optimism_study`). Ein **Frontend eines softwaredefinierten Empfängers** (`src/sdr.rs` — rohe IQ/ZF-Daten (Zwischenfrequenz) → Korrelator-Abgriffe early/prompt/late → SQM) und **Adapter zum Einlesen echter Daten** (`src/realdata/` — RINEX, u-blox UBX (das binäre u-blox-Protokoll), GnssLogger, JammerTest, Yunnan, SatGrid) lassen dieselben Detektoren über lokal bereitgestellte Aufzeichnungen laufen (es werden keine Datensätze eingecheckt). Die **Übergangskarte der Resilienz Quanten- gegenüber klassisch** unter Parameterunsicherheit (`src/crossover.rs`; `cargo run --bin crossover_study`) erzeugt die Übergangsstudien für Inertial und Uhr hinter den Ergebnisabbildungen neu. |
| **Demonstrator für quantengestützte PNT** | Drei ausführbare, **MODELLED** Anwendungsbereiche hinter der offenen Engine, jeder mit ehrlicher `TradeEvidence` + einem Datensatz zu Repräsentativität / Lücken bis zum Flug (`src/representativeness.rs`): **vertrauenswürdige Quantenzeitübertragung** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — ein durchgängiges Budget optische Gitteruhr + photonische Verbindung gegenüber CSAC (Atomuhr im Chipformat) + HF-Zweiweg, mit einem wiederverwendeten Timing Protection Level, einem Sicherheitsgütemaß gegen Verzögerungs-/Wiedereinspielangriffe (1 − P_md) und Erkennung von Uhrenanomalien + CUSUM-Latenz); **Quantennavigation ohne GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — eine inertiale Fortführung mit Kaltatom-Interferometer gegenüber einem INS in Navigationsqualität während eines GNSS-Ausfalls, ehrlich darin, dass ohne externe Lösung der Bias des Beschleunigungsmessers unbeobachtbar ist und der Fehler daher weiter wächst); und **Fehler-/Anomalieerkennung** in Quantensystemen (`quantum-anomaly-detect`, `src/quantum_faults.rs` — ein gekennzeichneter Fehlerkatalog mit einer ROC-AUC mit Bootstrap-KI (Konfidenzintervall) aus dem extern validierten `eval_stats` und einem minimal erkennbaren Fehler bei fester Fehlalarmrate). Eine gemeinsame **Bibliothek von Fehlermodellen für Quantengeräte** (`src/quantum_devices.rs`) und ein einheitliches **Gerüst für die Abwägung Quanten- gegenüber klassisch** (`src/qtrade.rs`) tragen sie. Die validierten Kerne, auf denen sie aufbauen (Evaluierungsmetriken gegen scikit-learn, Abwägungskerne gegen scipy), werden wiederverwendet; die darauf aufbauenden Zahlen zum Gerätenutzen bleiben **MODELLED** — **illustrative Geräte-/Verbindungsparameter aus öffentlichen Quellen**, modelliert wird die *Klasse*, keine TRL / Flugerprobung / Zertifizierung, keine Billigung durch eine Behörde. |
| **Sparsame Technik und Integritätswirkung** | Eine Sicht auf den **ROI je Abdeckung** (Kapitalrendite) (`src/frugal.rs`) — Kosten je Einheit gelieferter Abdeckung für eine Architekturabwägung — und eine Abbildung **verpasste Erkennung → Integritätswirkung** (`src/integrity_impact.rs`), die die Rate verpasster Erkennungen eines Monitors in seinen Beitrag zum Integritätsrisiko umrechnet. **MODELLED** Budgets zur Entscheidungsunterstützung, additiv. |
| **Austausch von Artefakten** | Das **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — ein versionierter, selbstbeschreibender Umschlag, der ein Szenarioergebnis mit seiner Art, Schemaversion und den Kennzeichnungen MODELLED/VALIDATED umhüllt, sodass ein gespeichertes Artefakt selbstdokumentierend bleibt und ältere Umschläge vorwärtskompatibel lesbar bleiben. |

Jede Fähigkeit ist als Rust-API, als ausführbare Szenario-`kind` oder beides erreichbar.
Die Reife je Fähigkeit — *validated*, *runnable* oder *library* — wird in
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) verfolgt. Eine **maschinell geprüfte Verifikationsmatrix**
(`src/verification.rs`) gibt den Querverweis Anforderung → Modul → Test → Referenz → Status
aus, mit unit-getesteten Ehrlichkeitsinvarianten, die eine Kennzeichnung *validated*
nur dort erlauben, wo eine unabhängige **externe** Referenz sie stützt — und die
die Hardware-/PA-Fähigkeiten (Produktsicherung) festhalten, die Kshana bewusst **nicht** bereitstellt.

</details>

<details>
<summary>Die vier Sensorpakete, wie zuerst veröffentlicht (Ergebnisse)</summary>

### Ergebnisse

Jedes Szenario vergleicht einen Quantensensor mit seinem klassischen Gegenstück über einen
GNSS-Ausfall von ~1.8 h. Die Zahlen sind reproduzierbar (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Was Quantensensoren bringen, wenn GNSS weg ist, Szenario Uhren-Holdover: Quanten hält 6600 s Autonomie gegenüber 2610 s klassisch, deutlich geringerer Zeitfehler und 100% gegenüber 95.6% Verfügbarkeit" width="88%">
  <br><sub>Was Quantensensoren bringen, wenn GNSS weg ist — <code>clock-holdover</code> · Seed 42 · gezeichnet mit Engine 0.40.0, und jede Zahl oben wird bei jedem Build von <code>tests/published_figures_still_reproduce.rs</code> gegen die aktuelle Engine erneut geprüft · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Der Vorteil ist **abhängig von Ausfall und Vibration**, mit einem expliziten Gleichstand, ab dem die klassische Variante gewinnt — ehrlich über die Technologiereifeleiter gezeigt (die Zahlen zu optischen Uhren sind Ziele für Bodendemonstratoren; keine optische Strontiumuhr ist geflogen):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Übergang Quanten- gegenüber klassisch beim Uhren-Holdover über die Technologiereifeleiter, mit Konfidenzbändern" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Heatmap des inertialen Vorteils Quanten- gegenüber klassisch über Ausfalldauer und Vibration, mit einer Gleichstandskontur, ab der die klassische Variante gewinnt" width="96%">
  <br><sub>Resilienzübergang Quanten- gegenüber klassisch — TRL-Leiter des Uhren-Holdover (oben) · Karte des inertialen Vorteils mit Gleichstandskontur (unten). Neu erzeugbar über <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Inertiale Koppelnavigation: Positionsfehler während eines GNSS-Ausfalls — der Quantensensor (Kaltatom) bleibt nahe der Spezifikationslinie, während der Sensor in Navigationsqualität auf Dutzende Kilometer divergiert" width="80%">
  <br><em>Positionsfehler der Koppelnavigation während eines GNSS-Ausfalls: Der Quantensensor (blau)
  bleibt flach nahe der Spezifikation; der klassische Sensor (rot) divergiert auf Dutzende Kilometer.
  Von Kshana erzeugt aus <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Paket | Szenario | Quanten | Klassisch |
|------|----------|---------|-----------|
| **1 — Uhren-Holdover** | `clock-holdover.toml` (Spezifikation 20 ns) | optische Uhr hält den ganzen Ausfall | CSAC verletzt die Spezifikation mitten im Ausfall |
| **2 — Inertiale Koppelnavigation** | `imu-deadreckoning.toml` (Spezifikation 100 m) | Kaltatom: **~41 m**, hält den ganzen Ausfall | Navigationsqualität: verletzt nach **~350 s** → Dutzende km |
| **3 — Zeitübertragung** (optische Intersatellitenverbindung) | `timetransfer.toml` | optisch: **~0.3 mm** Entfernungsmessung | HF (TWSTFT): **~150 mm** Entfernungsmessung |
| **4 — Hybride Fusion** (Abschluss) | `hybrid-pnt.toml` | vollständige Position+Zeitgebung für den ganzen Ausfall | **positionsbegrenzt bei ~350 s** |

Der Abschluss zeigt die Fusionsthese: Optische Zeitübertragung zwischen Satelliten hält selbst
eine klassische *Uhr* eingerastet und isoliert den *Inertial*sensor als das schwache Glied
der klassischen Suite — d. h. Quanteninertial + optische Zeitgebung zusammen.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Uhren-Holdover: Phasenfehler während eines GNSS-Ausfalls — die optische Uhr bleibt während des ganzen Ausfalls innerhalb der Spezifikation von 20 ns, während die Uhr im Chipformat sie mitten im Ausfall verletzt" width="80%">
  <br><em>Uhren-Holdover während eines GNSS-Ausfalls: Die optische Uhr (blau) bleibt für die ganze
  Fortführung innerhalb der Spezifikation von 20 ns; die Uhr im Chipformat (rot) verletzt sie auf halbem Weg.
  Von Kshana erzeugt aus <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Ein weiteres Szenario, `orbit-gnss-challenged.toml`, leitet die GNSS-Verfügbarkeit aus der
**Bahngeometrie** ab statt aus von Hand verfassten Fenstern: Ein Raumfahrzeug innerhalb der GNSS-
Schale wird gegenüber einer GPS-ähnlichen Walker-Konstellation propagiert, und die Zahl der sichtbaren Satelliten
(Sichtlinie, Erdbedeckung, Elevationsmaske) bestimmt bei jedem Schritt den Lösungszustand.
Über einen Tag hat der Nutzer nur ~59% der Zeit eine Lösung; die Quantenuhr hält eine
Zeitlösung von 5 ns durch jede Lücke (Verfügbarkeit **1.0**), die Uhr im Chipformat
nur **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Bahn mit eingeschränktem GNSS: Zeitfehler der Uhr über einen Tag für ein Raumfahrzeug innerhalb der GNSS-Schale, wobei die Abdeckungslücken aus der Bahngeometrie abgeleitet sind — die optische Uhr bleibt über die Lücken innerhalb der Spezifikation von 5 ns, während die Uhr im Chipformat sie verletzt" width="80%">
  <br><em>Zeitfehler über einen Tag mit aus der Bahngeometrie abgeleiteter GNSS-Verfügbarkeit: Die
  Zahl der sichtbaren Satelliten (Sichtlinie, Erdbedeckung, Elevationsmaske) bestimmt bei jedem Schritt den Lösungs-
  zustand, sodass die Uhr jede Lücke überbrücken muss — die optische Uhr hält die Spezifikation von 5 ns,
  während die Uhr im Chipformat sie verletzt. Von Kshana erzeugt aus
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

Die Konstellation kann auch als echte Zweizeilenelementsätze (TLEs) angegeben werden. Ein *vollständiges* TLE
(Zeile 1 + Zeile 2) wird mit dem vollständigen **SGP4/SDP4**-Modell propagiert — einschließlich
atmosphärischem Widerstand und den Tiefraumtermen für Mond-Sonne sowie 12-h-/24-h-Resonanz, die
für GNSS-Bahnen von ~12 h wichtig sind —, validiert gegen die offiziellen Vektoren von AIAA 2006-6753
auf ≈ 4 mm im ungünstigsten Fall. `scenarios/orbit-sgp4-gps.toml` liefert einen **echten Celestrak-
Schnappschuss `gps-ops`** der operativen GPS-Konstellation (2021-07-28, 30 Satelliten)
und verlangt gültige TLE-Prüfsummen — Zweizeilenelementsätze sind offene Daten aus dem Katalog der US
Space Force / 18th Space Defense Squadron, weiterverbreitet von Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); aktualisieren mit
`scripts/fetch_tles.sh`. Ein Block nur mit Zeile 2 behält
die analytische Zweikörperpropagation (`scenarios/orbit-real-tle.toml`); beide Formen lassen sich
in einer Konstellation mischen. Eine Konstellation kann ebenso aus einem Block von
Datensätzen der **RINEX-3-GPS-Broadcast-Ephemeride** aufgebaut werden — dem Format, das ein Empfänger dekodiert —,
propagiert mit dem Nutzeralgorithmus nach IS-GPS-200 und durch dieselbe Geometrie geführt
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Was es ist / nicht ist, vollständig</summary>

<a id="what-it-is--is-not"></a>
### Was es ist / nicht ist

**Es ist:** eine deterministische Engine mit wenigen Abhängigkeiten, die den PNT-Stack abdeckt — Bahn-
geometrie, Inertialnavigation, GNSS/INS-Fusion, Integrität, Uhren und Zeitgebung. Sie
führt ein Szenario aus (oft einen GNSS-Ausfall), entwickelt kalibrierte Sensorfehlermodelle
durch den passenden Schätzer und bewertet das Ergebnis anhand der operativen
Gütemaße — und gibt ein reproduzierbares JSON-Ergebnis (JavaScript Object Notation) und ein SVG-Diagramm aus, aus einer
Rust-Bibliothek, einer Befehlszeilenschnittstelle (CLI), einer Python-Erweiterung, einem WebAssembly-Modul im Browser, einem
**Model-Context-Protocol-Server (MCP)** für KI-Agenten oder einem **JetBrains-IDE-Plugin (integrierte
Entwicklungsumgebung)**.

**Es ist nicht:** Flughardware, ein Entwurf einer Quantennutzlast, ein vollständiger GNSS-Signal-
empfänger, ein Hochfrequenz-Signalsimulator (HF) oder Hardware-in-the-Loop-Aufbau oder ein
zertifiziertes Avionikprodukt — und es ersetzt nicht MATLAB/Simulink, STK (Systems Tool
Kit) oder Orekit; es steht neben ihnen und tauscht Dateien mit ihnen aus. Die Treue zur Quantenhardware stammt aus
veröffentlichten Fehlermodellen, nicht aus diesem Werkzeug. Die feingliedrige Reife jeder
Fähigkeit ist in [`docs/CAPABILITY.md`](docs/CAPABILITY.md) dokumentiert.

**Es ist (noch) nicht:** eine *vollständige* Physik-Engine für Atominterferometrie (die meisten Quantensensoren
verwenden veröffentlichte Allan-/Rauschbudget-Koeffizienten; der CAI-Beschleunigungsmesser (Kaltatom-Interferometer) hat eine
Schicht aus ersten Prinzipien — Mach–Zehnder-Phase, Projektionsrauschen, Kontrastabfall und
Vibrationskopplung, dazu Coriolis- und Lichtverschiebungssystematiken —, aber Wellenfrontsystematiken und
die Auflösung der Streifenmehrdeutigkeit bleiben eine Roadmap-Schicht **P2** (Roadmap-Phase 2, die Quantenphysikschicht),
siehe [`ROADMAP.md`](ROADMAP.md) und [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
ein zertifizierter oder Hardware-GNSS-Empfänger (es löst eine Einzelpunkt-**PVT**-Positionslösung (Position, Geschwindigkeit und Zeit)
aus echten RINEX-Codebeobachtungen (Receiver Independent Exchange Format) — validiert
an echten Daten des IGS (International GNSS Service) — und seine IQ-Ebene (`kshana iq`, seit 0.31.0)
erfasst und verfolgt aufgezeichnete oder erzeugte Basisband-Abtastwerte in Software, als Analyse-
empfänger: Sie steuert keine Funkhardware an und sendet nicht, ist kein zertifizierter Empfänger und führt
keine Trägerphasenpositionierung (RTK oder PPP) durch); oder eine vollständige Missionsentwurfssuite (es hat Bausteine für Lambert / Porkchop /
Manöver / Bahnbestimmung, ist aber die Ebene der Leistungssimulation
*oberhalb* von GMAT (General Mission Analysis Tool)/Orekit, kein Ersatz). Diesen Umfang bewusst zu wählen, ist Absicht. Wenn Sie Fehlerbudgets für
Kaltatom-Interferometer aus ersten Prinzipien brauchen (z. B. in CARIOQA-PMP-Qualität — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — oder eine Validierung im Stil von X-37B), siehe
die P2-Roadmap und [nehmen Sie Kontakt auf](#support--professional-services), um zusammenzuarbeiten.
</details>

### Navigation in niedriger Erdumlaufbahn

Satelliten in niedriger Erdumlaufbahn (LEO) ziehen schnell und laut vorüber. Die Art `leo-pnt-chain` verfolgt ein
System durch jede Stufe: das Signal, den Überflug und seine Verbindung, die Navigationsnachricht sowie
die fusionierte Lösung für Position, Geschwindigkeit und Zeit (PVT) und Precise Point Positioning (PPP). Jede
Stufe gibt ihre Zahlen an die nächste weiter. Siehe [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="Die LEO-PNT-Kette aus einem echten Lauf von leo-pnt-chain (leo-pnt-end-to-end.toml): Die Signalstufe (generic-l bei 1191.795 MHz, Pilot bei 10.23 Mchip/s nachgeführt) übergibt an die Überflugstufe (1080 km, Spitze des nachgeführten C/N0 58.2 dB-Hz), die an die Navigationsnachricht übergibt (kepler-rac, Anpassung über 300 s, Darstellungs-SISRE 0.91 mm RMS, 0.250 m mit Bahnbestimmung), die die fusionierte Lösung (nur GNSS 1.60 m RMS 3D, GNSS plus LEO 0.43 m) und Precise Point Positioning speist (Konvergenz 11.5 min nur GNSS, 7.5 min mit 240 LEO-Satelliten). 11 Werte werden zwischen den Stufen übergeben." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Jede Szenarioart nach Familie

Die Szenarioarten der Engine, nach Familien geordnet. Jede Familie hat eine Seite mit einem Eintrag je Art (die
Beschreibung und Felder der Engine, ein Beispielbefehl, Kernzahlen aus einem Lauf, die Zeilen der
[Verifikationsmatrix](docs/VERIFICATION-MATRIX.md), die sie nennen, und das Diagramm, das die Engine selbst schreibt) und einen
Kontaktbogen dieser Diagramme; [`docs/KINDS.md`](docs/KINDS.md) verzeichnet sie alle. Die Tabelle wird von
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) geschrieben und die Seiten von
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), und beide schlagen fehl, wenn die Engine eine Art erhält, die keine Familie nennt.

<!-- generated:kind-families -->
| Familie | Was sie beantwortet | Arten | Eine ausführen |
|---|---|---|---|
| **[Uhren, Zeitgebung und Holdover](docs/kinds/clocks-timing-and-holdover.md)** | wie lange eine Uhr ohne GNSS die Zeit hält, und wie ein Zeitgebungssystem gegenüber seinen Masken besteht | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Inertial, Fusion und Quantensensoren](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | Koppelnavigation und Sensorfusion während eines GNSS-Ausfalls, mit klassischen und Quantensensoren | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[Alternative PNT ohne GPS](docs/kinds/gps-denied-alternative-pnt.md)** | Navigation anhand von Schwere, Gelände und anderen Feldern, wenn GNSS weg ist | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Konstellationen, Abdeckung und Geometrie](docs/kinds/constellations-coverage-and-geometry.md)** | wo Satelliten sind, wer sie sieht und wie gut die Geometrie ist, um die Erde, den Mond oder den Mars | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[GNSS-Messungen, Positionierung und Integrität](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | Pseudoentfernungen, Positionslösungen, Schutzpegel und die Weltraumumgebung | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Jamming, Spoofing und das Spektrum](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | wie eine Störung einen Empfänger erreicht und ob sie erkannt wird | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Navigation in niedriger Erdumlaufbahn](docs/kinds/low-earth-orbit-navigation.md)** | ein Überflug, eine Verbindung, eine Navigationsnachricht und eine fusionierte Lösung, Stufe für Stufe | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Mond und cislunar](docs/kinds/lunar-and-cislunar.md)** | Navigation, Zeit, Bezugssysteme und Geodäsie am Mond | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Navigation von Weltraumnutzern](docs/kinds/space-user-navigation.md)** | GNSS-Signale für Raumfahrzeuge über, um und jenseits der GNSS-Bahnen | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Optische PNT](docs/kinds/optical-pnt.md)** | optische Verbindungen durch die Atmosphäre und Gütemaße für Optik plus HF | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Missionsanalyse, Verbindungen und Raumfahrtbetrieb](docs/kinds/mission-analysis-links-and-space-operations.md)** | Start, Aufstieg, Wiedereintritt, Lage, Verbindungen, Kontaktplanung und Dateiformate | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Missionsfäden](docs/kinds/mission-threads.md)** | das Fehlerbudget für Navigation und Zeitgebung einer Kette von Phasen vom Start bis zum Wiedereintritt | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Kampagnen](docs/kinds/campaigns.md)** | verkettete Missionen, Sweeps und Ensembles, aufgebaut aus den anderen Arten | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Jeder Befehl

`kshana <scenario.toml>` führt ein Szenario aus; jeder andere Befehl ist ein Unterbefehl, und `kshana --help` gibt die Verwendung
aller aus. Die Befehle sind `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (mit `live` und
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` und `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) nennt für jeden den Zweck, ein verifiziertes Beispiel und seine Dokumentationsseite.

<a id="every-surface"></a>
### Jede Oberfläche

Eine Engine, überall dieselben Ergebnisse: die Befehlszeile, die Rust-Bibliothek, Python, JavaScript und WebAssembly,
der MCP-Server mit seinen Plugin-Befehlen und Skills, Kshana Studio (jede Seite läuft im Browser, keine Installation, nichts wird hochgeladen), die
Integrationen für ROS 2, Signal K, OpenCPN, GNSS-SDR und `gnss_lib_py`, die Bereitstellungskits für systemd, Docker und Grafana sowie das
JetBrains-Plugin. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) führt sie auf, mit Bezugsweg und den Namen aller
Plugin-Befehle, Skills und Studio-Seiten; [`docs/SURFACES.md`](docs/SURFACES.md) sagt für jeden Befehl und jede Art,
welche Oberfläche ihn trägt und welche nicht, mit Begründung.

<a id="how-a-run-works"></a>
## Wie ein Lauf funktioniert

Ein Szenario ist eine TOML-Datei (Tom's Obvious, Minimal Language): eine Art, ein Seed und die
Parameter. Die Engine führt es aus und schreibt das Ergebnis, daneben ein Diagramm und einen Bericht, sowie
die Exporte, die Sie anfordern.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Wie ein Lauf abläuft. Eine Szenario-TOML-Datei (eine Art, ein Seed und ihre Parameter) geht in die Engine, kshana 0.40.0, durch die Verteilung api::run_toml über 92 Szenarioarten, deterministisch aus Szenario, Seed und Engine-Version. Die Engine schreibt result.json, chart.svg, report.html und report.json, eine table.csv für die Arten, die eine definieren, und auf Anfrage Exporte nach SP3, CCSDS OMM und OEM, CZML, KML, GeoJSON, STK und SigMF; eine Suite schreibt study.json und study.html. Diese Dateien speisen Kshana Studio im Browser, einen KI-Assistenten über den Server kshana-mcp und die kontinuierliche Integration." width="100%">
</picture>

Dieses mitgelieferte Szenario läuft 2 h: 10 min mit GNSS, dann etwa 1.8 h ohne GNSS. Es fragt,
wie lange eine optische Strontium-Gitteruhr und eine Atomuhr im Chipformat (CSAC) jeweils die
Zeit auf 20 ns genau halten.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

Die optische Uhr hält das Budget von 20 ns über den ganzen Ausfall von 6600 s; die CSAC hält es für
2610 s und liegt für 95.6% des Laufs innerhalb des Budgets, gegenüber 100% für die optische Uhr.
`kshana example` listet jedes mitgelieferte Szenario auf.

<a id="missions"></a>
## Missionen

Zehn Sektoren stellen derselben Engine zehn verschiedene Fragen. Jeder hat mitgelieferte Szenarien als
Ausgangspunkt.

| Sektor | Beginnen mit |
|---|---|
| Verteidigung und Sicherheit | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Weltraum, Erdumlaufbahn | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Mond, Mars und Tiefraum | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Luftfahrt und Drohnen | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Seefahrt | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Straße | `automotive-urban-canyon` |
| Schiene | `rail-tunnel-coast` |
| Kritische Infrastruktur und Zeitgebung | `clock-holdover`, `clock-ensemble` |
| Telekommunikation und 5G (die fünfte Mobilfunkgeneration) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Wissenschaft und Forschung | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>Die Frage, die jeder Sektor stellt</summary>

<br>

| Sektor | Die Frage, die er stellt | Beginnen mit |
|---|---|---|
| **Verteidigung und Sicherheit** | Wie lange bleiben unsere Navigation und Zeitgebung unter Jamming und Spoofing vertrauenswürdig, und welche Schichten halten uns innerhalb der Spezifikation? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Weltraum: Erdumlaufbahn** | Sieht mein Raumfahrzeug genug Navigationssatelliten, wie lange hält seine Uhr die Zeit zwischen Lösungen, und was würde eine Navigationsschicht in niedriger Umlaufbahn hinzufügen? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Mond und Tiefraum** | Erhält ein Lander, Rover oder Orbiter am Mond, am Mars oder weiter draußen eine vertrauenswürdige Position und Zeit? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Luftfahrt und Drohnen** | Wie lange bleibt mein unbemanntes Luftfahrzeugsystem (UAS) innerhalb seines Positionsbudgets, nachdem ein Störer GNSS wegnimmt, und ist auf meiner Route Integrität verfügbar? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Seefahrt** | Wie weit über das Wasser reicht ein Störer, würde eine Positionsverschiebung erkannt, und wie lange kann ein Schiff bis in den Hafen weiterfahren? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Straße und Automobil** | Wie weit driftet ein Auto unter einer Überführung oder an einem Störer am Straßenrand vorbei? | `automotive-urban-canyon` |
| **Schiene** | Wie viele Sekunden nach der Einfahrt in einen Tunnel kann ein Zug noch sagen, auf welchem Gleis er ist? | `rail-tunnel-coast` |
| **Kritische Infrastruktur und Zeitgebung** | Wenn die GNSS-Zeit verloren geht oder gespooft wird, wie lange halten ein Stromnetz, ein Handelsplatz oder ein Rechenzentrum rückführbare Zeit? | `clock-holdover`, `clock-ensemble` |
| **Telekommunikation und 5G** | Wenn die GNSS-Zeitreferenz verloren geht, bleibt meine Netzuhr innerhalb der ITU-T-Masken, und wie lange? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Wissenschaft und Forschung** | Kann ich ein PNT-Ergebnis bis hinunter zum Seed reproduzieren, erweitern und zitieren? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Nachweise

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 gegen alle 666 Referenzvektoren von AIAA 2006-6753 geprüft, schlechtester Positionsfehler 4.12 mm"></a></p>

<strong>176 von 401</strong> Fähigkeiten gegen unabhängige externe Referenzen validiert; 221 ehrlich als Modelled gekennzeichnet.
Jede Zeile der Verifikationsmatrix nennt eine Fähigkeit, die Referenz, gegen die sie geprüft wird,
den Test, der die Prüfung ausführt, und die Kennzeichnung, die daraus folgt. Die kontinuierliche Integration (CI) macht
es unmöglich, eine Fähigkeit ohne unabhängige externe Referenz VALIDATED zu nennen.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Wie eine Fähigkeit ihre Kennzeichnung verdient. Jede Zeile der Verifikationsmatrix nennt eine Fähigkeit, die Referenz, gegen die sie geprüft wird, den Test, der die Prüfung in der kontinuierlichen Integration ausführt, und die Kennzeichnung, die daraus folgt. Eine Zeile darf nur mit einer unabhängigen externen Referenz VALIDATED sein; sonst ist sie MODELLED, oder PARTNER, wenn ein Hardwarepartner sie verantwortet. Beispiel: SGP4/SDP4, Cowell 6-DOF + Störungen, Batch-/sequenzielle Bahnbestimmung, Referenz AIAA-2006-6753-SGP4-Verifikationsvektoren, Test tests/sgp4_verification.rs, Kennzeichnung VALIDATED. Aktuelle Zahlen: 176 VALIDATED, 221 MODELLED, 4 PARTNER von 401 Zeilen. Insgesamt 176 Fähigkeiten gegen unabhängige externe Referenzen validiert; 221 weitere sind ehrlich als MODELLED gekennzeichnet und 4 werden von PARTNER verantwortet." width="100%">
</picture>

| Kennzeichnung | Zeilen | Bedeutung |
|---|---|---|
| VALIDATED | 176 | eine unabhängige externe Referenz stimmt überein: echte Daten, eine unabhängige Implementierung oder veröffentlichte Referenzvektoren |
| MODELLED | 221 | gegen analytische Wahrheit oder Selbstkonsistenz der Simulation geprüft, und das wird offen gesagt |
| PARTNER | 4 | von einem Hardwarepartner verantwortet; Kshana hat dafür keine Referenz |

Einige der Prüfungen: alle 666 SGP4-Vektoren (Simplified General Perturbations 4) von AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 auf 4.12 mm; das Cowell-Kraft-
modell auf 0.08 m gegen Orekit 12.2; Galileo auf 0.61 m und Swarm-A auf 0.10 m gegen echte
präzise Ephemeriden der Europäischen Weltraumorganisation (ESA). Die Tests halten nahe 95 % Zeilenabdeckung von
`src/`, in der CI bei 85 % abgesichert. Das Register ist
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), erzeugt aus
`src/verification.rs`: die [vollständige Matrix mit 401 Zeilen](docs/VERIFICATION-MATRIX.md), und warum jede
Modelled-Zeile keine externe Referenz hat, steht in [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Wie die Validierung funktioniert, die kuratierte Übersichtstabelle und die Nachweisabbildungen</summary>

### Validierung, Reproduzierbarkeit und Ehrlichkeit

- Jeder Rauschterm ist auf eine **veröffentlichte, zitierte** Zahl kalibriert und gegen
  die Standardbeziehung validiert (Allan-Abweichung für Uhren; Fehlerwachstum der Koppelnavigation nach Groves
  für Inertial; die Umrechnung Zeitgebung→Entfernung für Zeitübertragung). Der Status
  je Term wird in [`docs/VALIDATION.md`](docs/VALIDATION.md) als `validated` oder
  `not modeled` verfolgt — nichts wird als validiert dargestellt, was es nicht ist.
- **Reproduzierbar durch Konstruktion:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` setzt das durch; Quanten- und klassische Läufe verwenden
  unabhängige Seeds, sodass ihr Rauschen unkorreliert ist.
- Die Reife wird ehrlich angegeben: Zahlen zu optischen Uhren und optischen Verbindungen sind Ergebnisse von *Zielen /
  Bodendemonstratoren*, nicht geflogen.

### Die Evidenzkennzeichnung auf jeder Abbildung

Jede Abbildung und Tabelle, die ein Lauf schreibt, sagt, wie weit ihr zu trauen ist und auf welchen Registerzeilen das beruht. Das Ergebnis-JSON hat einen
Schlüssel `evidence`, das Diagramm-SVG eine Zeile unter dem Plot (und ein Element `<metadata id="kshana-evidence">`) und die CSV-Tabelle
vorangestellte Kommentarzeilen `# evidence:` (lesen mit `comment='#'`). Sie nennt eine Stufe, `VALIDATED`, `MODELLED` oder `PARTNER`, und
die IDs (`VM-` und acht Hexadezimalziffern) der Zeilen der Verifikationsmatrix, die der Lauf berührt hat. Die Stufe ist die schwächste dieser
Zeilen, sodass ein Lauf, der sich auf eine modellierte Zeile stützt, als MODELLED gekennzeichnet wird, egal wie viele validierte Zeilen daneben stehen; die Kennzeichnung
kann nie mehr behaupten als das Register. Zeilen, Status und IDs werden aus der Matrix gelesen, nicht eingetippt
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), und
`tests/evidence_labels_doc_sync.rs` schlägt fehl, wenn eine Abbildung keine Kennzeichnung hat oder eine Kennzeichnung der Matrix widerspricht.

### Validierung auf einen Blick

Jede Zeile wird durch einen benannten Test in der CI durchgesetzt. Diese Tabelle ist eine **kuratierte Übersicht**;
die vollständige maschinell geprüfte Matrix umfasst **401 Zeilen — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), mit den vollständigen Nachweisen (und dem, was ehrlich *noch nicht*
validiert ist) in [`docs/VALIDATION.md`](docs/VALIDATION.md) und dem Artefakt
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
je Release (erzeugt von `cargo run --bin validation_report`, mit SLSA-Attestierung — Supply-chain
Levels for Software Artifacts).

Die Spalte **Status** nennt die *Art* des Nachweises, passend zur obigen Validierungsleiter: **VALIDATED** = gegen eine unabhängige externe Referenz geprüft (echte Daten, eine unabhängige Bibliothek oder veröffentlichte Referenzvektoren); **MODELLED** = gegen analytische Wahrheit oder Selbstkonsistenz der Simulation geprüft (kein unabhängiger externer Datensatz). VALIDATED beschreibt die *Methode* der Prüfung, kein Bestanden/Nicht bestanden — eine ehrliche Verfehlung gegenüber einer echten externen Referenz bleibt VALIDATED, während ein Vergleich, den keine Matrixzeile als Referenz nennt (die LRO-Anpassung oben — Lunar Reconnaissance Orbiter), als MODELLED gezeigt wird. `CI`-Zeilen sind Prozesswächter, keine Gütemaße. Einige Inseln mit echten Daten (die gemessene Cäsiumuhr, Stable32 PHASE.DAT und die Prüfungen mit OPS-SAT/ICGEM, bei denen die Rohdaten keine Weiterverbreitungslizenz tragen) sind **datenabhängig**: Der Test gibt einen Hinweis auf das Überspringen aus und bleibt grün, wenn die Eingabe fehlt, und die öffentlichen Referenzzahlen sind unter `tests/fixtures/` eingecheckt. Die Rohdaten lassen sich mit dem passenden `scripts/fetch_*.sh` reproduzieren.
| Status | Fähigkeit | Übereinstimmung | Referenz |
|--------|------------|-----------|--------------------|
| **VALIDATED** | SGP4/SDP4-Propagation | 666/666 Vektoren, schlechtester **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + direkter Vergleich mit der unabhängigen Crate `sgp4` |
| **VALIDATED** | Bezugssysteme — IAU-2000A/B-Nutation, CIO-Kette IAU 2006/2000A, ERA | **Bit für Bit** (X,Y auf 1e-14, s auf 1e-18, ERA auf 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS gegenüber einer unabhängigen SPICE-Engine | max. **0.028″** → ≤ 0.86 m am Boden, ≤ 3.6 m in GNSS-Bahnhöhe | ANISE (reines Rust-NAIF/SPICE), dieselben IERS-EOP `finals2000A`, 8 Epochen 2020–2023 (mit dieser Referenz verglichen; keine Zeile der Verifikationsmatrix nennt sie als externe Referenz, daher ist sie nicht als VALIDATED gekennzeichnet) |
| **MODELLED** | EGM2008-Geopotenzial (Grad/Ordnung 70) | Beschleunigung = ∇V auf **< 1e-6**; zonaler Grenzfall auf validiertes J2 | NGA-EGM2008-Koeffizienten + analytische ∇V-Identität |
| **VALIDATED** | Synthese von Schwerefunktionalen (Karte für schweregestützte / GNSS-freie Navigation) | GRS80 Somigliana + γ_e/γ_p auf **3.5e-12**; echte EGM2008-Störungskarte physikalisch (RMS ≈ 26 mGal, G/O 70) | GRS80 (Moritz 1980, IAG — International Association of Geodesy) Somigliana-Normalschwere + echtes ICGEM-EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Allan-Schätzer (ADEV/MDEV/TDEV/HDEV) + Konfidenzbänder | reproduzieren die Referenzabweichungen; χ²-Bänder stimmen überein | NIST SP 1065 (Riley), Tabelle 31/32 mit 1000 Punkten |
| **VALIDATED** | Allan-Schätzer an einer **echten gemessenen Cäsiumuhr** | OADEV/OHDEV auf **1e-3** (beobachtet ≤ 3e-5), 16 Mittelungsfaktoren | Stable32 an einer echten 5071A-Cs gegenüber H-Maser, 556,990 Punkte (`tests/cs5071a_reference.rs`, datenabhängig) |
| **VALIDATED** | Allan-Schätzer an der **kanonischen Stable32-Reihe PHASE.DAT** | OADEV/MDEV/TDEV auf **1e-3** (beobachtet ≤ 5e-5), 139 Mittelungsfaktoren | Stable32-Referenzabweichungen für PHASE.DAT (`tests/phasedat_reference.rs`, datenabhängig) |
| **MODELLED** | IMU-Fehlermodell — ARW / VRW / Bias-Instabilität | auf **< 5 %** zurückgewonnen (Bias-Instabilität < 15 %) | Datenblatt Analog Devices ADIS16465; NaveGo-Referenzprofil |
| **VALIDATED** | Numerischer Cowell-Propagator + Kraftmodell (konservative Stufen) | schlechtester Positionsfehler **0.08 m** über 24 h, 278 Epochen (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Cowell-Widerstandsstufe + absolute Eingaben für Sonnen-/Mondephemeride und Dichte | Widerstandsstufe charakterisiert ≈ 333 m / 24 h; ungestört entspricht Kepler mit universellen Variablen unter einem Meter, Energie/Impuls ~1e-9 | eingebaute Ephemeride geringer Genauigkeit + analytischer Kepler |
| **MODELLED** | Lambert · Tsiolkovsky · Porkchop | Rundlauf zur Zweikörper-Wahrheit; ΔV **< 0.01 %** | Izzo 2015 · Raketengleichung · analytische Hohmann-Untergrenze |
| **MODELLED** | Bahnbestimmung (Gauss–Newton-Batch) | unter einem Meter / mm·s⁻¹ rauschfrei; ~2 m bei einem Rauschboden von 5 m | Zweikörper + J2 über einen RK4-Bogen |
| **MODELLED** | Kraftmodellanpassung gegenüber präziser Galileo-Ephemeride (ganzer Bogen) | **0.61 m** 3-D-RMS, 24 h, G/O 70, nur Kräfte | ESA/ESOC-Endbahn `ESA0MGNFIN` (E11), echte EOP `finals2000A` (mit dieser Referenz verglichen; keine Zeile der Verifikationsmatrix nennt sie als externe Referenz, daher ist sie nicht als VALIDATED gekennzeichnet) |
| **MODELLED** | Kraftmodellanpassung gegenüber präziser Swarm-A-Ephemeride (reduziert-dynamisch) | **0.10 m** 3-D-RMS (Schranke der empirischen Stufe, kein Maß) | präzise ESA-Bahn `SW_OPER_SP3ACOM_2_` (mit dieser Referenz verglichen; keine Zeile der Verifikationsmatrix nennt sie als externe Referenz, daher ist sie nicht als VALIDATED gekennzeichnet) |
| **MODELLED** | Kraftmodellanpassung gegenüber LRO am Mond (ehrliche Verfehlung) | **6.67 m** reduziert-dynamisch, *über* dem Ziel von 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (mit dieser Referenz verglichen; keine Zeile der Verifikationsmatrix nennt sie als externe Referenz, daher ist sie nicht als VALIDATED gekennzeichnet) |
| **MODELLED** | Tiefraum-Bahnbestimmung am Mars (reduziert-dynamischer SRIF) | **≈ 0.2 m** im niedrigen Marsorbit (Simulationsgütemaß, *keine* reale Mission) | synthetische Bahnbestimmung im geschlossenen Kreis — Validierung der Schätzermaschinerie |
| **MODELLED** | Sonnenzentrierte Marsdynamik gegenüber JPL DE440 | **137 m bei einem Bogen von 1 Tag** (wächst mit dem Bogen = nicht modellierte n-Körper) | JPL DE440 über ANISE (`xval/anise-mars-od`, kernelabhängig) (mit dieser Referenz verglichen; keine Zeile der Verifikationsmatrix nennt sie als externe Referenz, daher ist sie nicht als VALIDATED gekennzeichnet) |
| **VALIDATED** | Einzelpunktpositionierung gegenüber einer vermessenen IGS-Koordinate (echte Beobachtungen) | **5.7 m** 3-D-RMS / **1.1 m** horizontal, ionosphärenfreie Zweifrequenz-Code-SPP | Vermessung der IGS-Station ABMF + GPS-Broadcast-Ephemeride, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Eng gekoppelter GNSS/INS-UKF | **0.77 m RMS** über einen 30-minütigen LEO-Überflug einschl. eines Ausfalls von 120 s | Fortführung mit Kraftmodell, von Hand hergeleitet |
| **MODELLED** | Navigation mit Schwerekarte ohne GPS | ~70 km INS-Drift → **~145 m** zurückgewonnen | Ziel *Quantum Wayfarer* von ESA NAVISP |
| **MODELLED** | Geländereferenzierte Navigation (TERCOM/SITAN) | 70 km Drift → **< 500 m** (Untergrenze durch Rasterauflösung ~140 m) | SRTM-`.hgt`-DEM; von Hand eingebrachte Drift (nicht zirkuläre Prüfung) |
| **MODELLED** | IGRF-14-Hauptfeld (Grad/Ordnung 13) | Pol ~80.7°N, Dipol ~29.7 µT, physikalisches Band 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (Schmidt-semi-normiert) |
| **MODELLED** | Modulation von Navigationssignalen und Codenachführung | BPSK-Selbst-SSC = **2/(3·R_c)**; PSDs mit Einheitsfläche; C/A-DLL-Jitter **unter einem Meter** bei 45 dB-Hz | geschlossene SSC/PSD-Ankerwerte + DLL-Formel für thermisches Rauschen nach Kaplan & Hegarty |
| **MODELLED** | Differenzieller CR3BP-Korrektor für Halo/NRHO | STM = finite Differenzen; Bahn schließt sich bis auf **Maschinengenauigkeit**; L2-9:2-NRHO **≈ 6.57 d / Perilun ≈ 3,250 km** | STM-Prüfung mit finiten Differenzen + veröffentlichte südliche L2-9:2-NRHO (≈ 6.56 d / ≈ 3,370 km) — CR3BP, keine echte Gateway-Ephemeride |
| **MODELLED** | ARAIM-Integrität mit zwei Konstellationen | konstellationsweiter Fehlermodus an echtem GPS + Galileo | EU ARAIM TR (technischer Bericht) / DO-316; Celestrak `gps-ops` 2021-07-28 (mit dieser Referenz verglichen; keine Zeile der Verifikationsmatrix nennt sie als externe Referenz, daher ist sie nicht als VALIDATED gekennzeichnet) |
| **VALIDATED** | GNSS-Geometrie / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | Übereinstimmung auf **1e-6 relativ** über 8 Geometrien (gut konditioniert → nahezu singulär) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — unabhängige Bibliothek (`tests/dop_reference.rs`) |
| **VALIDATED** | ML-Metriken zur Detektorevaluierung (AUC/ROC/Konfusion/Pd-Pmd/Präzision/F1) | **exakte Zählungen + < 1e-9** über 5 Datensätze × 24 Schwellen | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — unabhängige Bibliothek (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC-AUC der Anomalieerkennung an **echter Telemetrie von ESA OPS-SAT** | AUC reproduziert scikit-learn auf **< 1e-9**; AUC des Spitzenzähldetektors **≈ 0.85** auf der gekennzeichneten Testaufteilung | scikit-learn `roc_auc_score` auf der Testaufteilung von OPSSAT-AD (Ruszczak et al. 2025, CC BY 4.0) — echte OPS-SAT-Telemetrie (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Numerische Kerne der Quantenabwägung (ADEV-NNLS-Anpassung · χ²-Konsistenzbänder · van-Loan-Uhren-Q) | NNLS + Q **exakt**; χ² **< 5e-4** bei Betriebsfreiheitsgraden ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | Telekom-Wandermetriken MTIE / MDEV / TDEV (ITU-T G.810/G.823/G.8261/G.811 — die Empfehlungen des Standardisierungssektors für Telekommunikation der Internationalen Fernmeldeunion) | MTIE (9 Mittelungsfaktoren, bitgenau) und MDEV + TDEV (8 Faktoren, **< 1e-9** relativ) an der LCG-Reihe (linearer Kongruenzgenerator) aus NIST SP 1065 | allantools 2024.06 `mtie` / `mdev` / `tdev` — unabhängige Bibliothek (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | MCDA-Methoden für Abwägungsstudien — alle vier Entscheidungsfamilien, neun extern validierte Aggregatoren (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) plus Prioritätsgewichtung über Paarvergleiche nach **AHP** | Werte / Rangfolgen / Konkordanzmatrizen auf **< 1e-9** reproduziert | pymcdm + pyDecision (unabhängige MCDA-Bibliotheken Dritter) + Saaty RI (Random Index) / SciPy-LAPACK eig (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | LEO-Doppler-Hüllkurve aus Bahn und Träger | Iridium-Maximum innerhalb von **5 %** der veröffentlichten ±36 kHz; Xona Pulsar X1 innerhalb der veröffentlichten **32–34 kHz** | RNTF-Testergebnisse zu LEO-PNT; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | PPP-Konvergenz mit LEO-Ergänzung | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min mit 60 / 96 / 192 / 288 LEO-Satelliten, monoton; Filter-NEES innerhalb des χ²-Bands | Trend verglichen mit Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); Konstellationen und Rauschen nicht reproduziert |
| **MODELLED** | Bedingter Timing Protection Level (holdoverbegrenzter unerkannter Zeitfehler unter Spoofing) | Zusammensetzung reproduziert die mehrstufige Kovarianzrekursion `clock_state`; kalibriert an einem echten aufgezeichneten Spoofing | Skalare aus JammerTest 2024 (Zenodo 15911589) + geschlossene Formen nach van Loan / CUSUM (`examples/tpl_jammertest`) |
| **MODELLED** | Bewertung der PNT-Resilienz + Entscheidungsinstabilität | 35 von Hand hergeleitete Referenztests; bytedeterministisches Studienartefakt (fester Seed) | Zuordnung zu DHS RPCF v2.0 + geschlossene Formen Dirichlet / Kendall-τ / Hill-N2 — synthetische Architekturen, keine Zertifizierung |
| **MODELLED** | Studie zur Optimismuslücke bei HF-Beeinträchtigungen (Skalierungsgesetze + Leave-one-out-Prädiktor) | Signifikanz gegen Permutations-Nullhypothese; bytedeterministisches Artefakt (5 Seeds) | synthetisches, parametrisch begründetes Korpus — die Evaluierungs*metriken* sind VALIDATED gegen scikit-learn (oben); die Studie ist MODELLED |
| CI | Plattformübergreifende Reproduzierbarkeit | bitidentische Eingabe- + Form-Goldens auf 3 Betriebssystemen | CI-Matrix Linux / macOS / Windows, SHA-256-Goldens |
| CI | Testabdeckung | **~95 % Zeilen** auf `src/` ohne `src/*_data.rs` und `src/main.rs`, abgesichert bei ≥ 85 % | cargo-tarpaulin (LLVM-Engine) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Wie eine Fähigkeit ihre Kennzeichnung verdient: Die Anforderung führt zu einem Modul in src, zu einem Test in tests, zu einer externen Referenz (echter Datensatz, unabhängige Referenzimplementierung oder veröffentlichte Vektoren), zu einem Status — mit einem in der CI durchgesetzten Wächter, dass keine Fähigkeit ohne externe Referenz Validated sein kann. Aktuelle Zahlen: 176 Validated, 221 Modelled, 4 Partner, 401 insgesamt" width="900">
  <br><sub>Wie eine Fähigkeit ihre Kennzeichnung verdient — die in der CI durchgesetzte Invariante: keine externe Referenz ⇒ kann nicht Validated sein · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Wie jede Aussage gestützt wird: Die Spalte Validated besteht durch Konstruktion zu 176 von 176 aus ExternalDataset (in der CI durchgesetzt); Modelled-Zeilen sind ehrlich als InternalConsistency, ReferenceImpl oder ExternalDataset markiert; Partner-Zeilen haben keine Kshana-Referenz" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Schlechtester Positionsfehler von SGP4/SDP4 gegenüber der Referenz AIAA 2006-6753 nach Regime, logarithmische Skala: Jedes Regime liegt weit unter der AIAA-Toleranz, schlechtester Fall 4.12 mm im nicht resonanten Tiefraumregime" width="96%">
  <br><sub>Oben: Jede Validated-Zeile ist durch Konstruktion durch einen externen Datensatz gestützt. Unten: SGP4 stimmt in jedem Regime mit der offiziellen Referenz überein (schlechtester 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Verifikationsstatus über alle 401 Fähigkeiten: 176 Validated (gegen externe Referenz geprüft), 221 Modelled, 4 von Partnern verantwortet" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Fähigkeitsbereiche

Jede Fähigkeit der öffentlichen Karte, nach Bereich, mit ihrer Registerkennzeichnung. Die Bereichstabelle wird von
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) aus `web/capabilities.json` geschrieben, derselben Datei, die
die Gesamtkarte des Studios liest.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Fähigkeiten von Kshana nach Bereich und Reife: validierte und modellierte öffentliche Fähigkeiten je Bereich, gezeichnet aus web/capabilities.json von tools/gen_validation_figures.py" width="900">
</picture>

Die vollständige Tabelle, Bereich für Bereich mit jeder Fähigkeit und ihrer Kennzeichnung, ist [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Installation

Eine Zeile liefert das Befehlszeilenwerkzeug: **`cargo install kshana`**. Jeder Kanal liefert
v0.40.0 aus demselben getaggten Commit.

<!-- channels:begin -->
| Kanal | Installation | Anleitung |
|---|---|---|
| Im Browser ausprobieren | https://kshana.dev öffnen | [Studio-Anleitung](https://kshana.dev/docs/studio.html) |
| Befehlszeile (Rust) | `cargo install kshana` | [Verwendung der Befehlszeile](https://kshana.dev/docs/rust.html#usage--cli) |
| Rust-Bibliothek | `cargo add kshana` | [API-Referenz auf docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Anleitung zur Python-API](https://kshana.dev/docs/python-api.html) |
| JavaScript und WebAssembly | `npm install kshana` | [Anleitung zu npm und WebAssembly](https://kshana.dev/docs/npm.html) |
| KI-Assistent (MCP-Server, cargo) | `cargo install kshana-mcp` | [Anleitung zum MCP-Server](https://kshana.dev/docs/mcp.html) |
| Docker-Image | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Anleitung zum MCP-Server: Docker](https://kshana.dev/docs/mcp.html#install) |
| Erweiterung für Claude Desktop | Doppelklick auf die `.mcpb` für Ihr System: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (ein Klick) | [Zu Cursor hinzufügen (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Zu Cursor hinzufügen (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (ein Klick) | [In VS Code installieren (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [In VS Code installieren (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Vorgefertigtes Binary | kshana-mcp-<target> aus dem Release herunterladen und gegen SHA256SUMS prüfen | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Offizielle MCP-Registry | nach io.github.ashfordeOU/kshana-mcp suchen | [Jedes MCP-Installationssnippet](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Remote (streambares HTTP), selbst gehostet | `kshana-mcp --http 127.0.0.1:8080` | [Anleitung zum Selbsthosten](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Plugin-Marktplatz von Claude Code | `/plugin marketplace add ashfordeOU/kshana` | [Kshana aus einem Agenten verwenden](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| JetBrains-IDE-Plugin | Settings → Plugins → Marketplace → nach „Kshana“ suchen (Plugin-ID dev.kshana.ide) | [Plugin-Anleitung](https://kshana.dev/docs/jetbrains.html) |
| Signal-K-Plugin | `npm install signalk-kshana-trust` | [Anleitung zum Signal-K-Plugin](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| OpenCPN-Plugin | das Plugin-Tarball aus dem Release herunterladen | [Einreichung im OpenCPN-Katalog](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Grafana-Dashboard | kshana-grafana-*.json aus dem Release importieren | [Quelle des Dashboards](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Image des Referenzaufbaus | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Marine-Integrationen](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana im JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Baut mit Rust 1.88 oder neuer, die rust-version in Cargo.toml"></a></p>

MCP ist das Model Context Protocol. Ein Release festlegen mit `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` oder `npm install kshana@0.40.0`. Zum Bauen aus dem Quellcode siehe
[Installieren und bauen](#install--build) unter Referenz.

<details>
<summary>Ein Szenario aus Python und aus WebAssembly ausführen</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Über `run` hinaus stellt das Modul `run_full` (JSON, SVG und die einzeilige Zusammenfassung auf einmal),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` und `error_kind` bereit; siehe
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

Das npm-Paket ist die ganze Engine, kompiliert zu WebAssembly. In Node.js übergeben Sie das Binary an
`initSync`; im Browser lädt `await init()` es ab (siehe [`README.npm.md`](README.npm.md)).

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
## Architektur

Eine offene Engine steht im Zentrum, und jede Oberfläche führt sie aus: die Befehlszeile, die Rust-
Bibliothek, Python, WebAssembly und Kshana Studio, der MCP-Server, das Docker-Image und das
JetBrains-Plugin. Dieselbe Szenariodatei liefert auf jeder dieselben Bytes. Kshana Pro sitzt
obenauf als getrennte Erweiterungsschicht, die von der Engine abhängt und sie nie forkt.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Die Architektur von Kshana: eine offene Engine im Zentrum, kshana 0.40.0 unter der AGPL-3.0, mit api::run_toml, einer typisierten Verteilung über jede Art, und dem Verifikationsregister mit 401 Fähigkeiten (176 VALIDATED, 221 MODELLED, 4 PARTNER). Darum herum führt jede Oberfläche dieselbe Engine aus: Befehlszeile (cargo install kshana); Rust-Bibliothek (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); MCP-Server (cargo install kshana-mcp); Docker-Image (ghcr.io/ashfordeou/kshana-mcp); JetBrains-Plugin (Marketplace: &quot;Kshana&quot;). Darunter Kshana Pro, eine proprietäre Erweiterungsschicht, die die offene Engine als Bibliothek nutzt, sie nie forkt und kein physikalisches Modell hinzufügt." width="100%">
</picture>

<details>
<summary>Im Inneren der Engine: die Bereichsschichten und das Verifikationsregister</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="Die Architektur von Kshana in Schichten. Fünf Eingänge (Befehlszeile, Python, JavaScript und WebAssembly, der MCP-Server und das JetBrains-Plugin) erreichen ein einziges api::run_toml, eine typisierte Verteilung über 92 Arten. Darunter liegen acht Bereichsschichten: Zeit und Bezugssysteme, Uhren und Zeitgebung, Inertial und Fusion, GNSS und Integrität, Astrodynamik, LEO-PNT, Mond, Mars und Tiefraum sowie Missionen und Studien, auf einem gemeinsamen Kern, alle querverwiesen durch das Verifikationsmodul, die maschinell geprüfte Matrix mit 401 Fähigkeiten, die die einzige Quelle der Wahrheit für jede Kennzeichnung ist." width="100%">
</picture>

**Eine Engine, viele Eingänge.** Ein einziger Rust-Kern (`kshana`) führt jedes Szenario aus,
erreichbar über eine CLI, eine Python-Erweiterung, ein WebAssembly-Modul im Browser, einen **MCP-
Server** für KI-Agenten und ein **JetBrains-IDE-Plugin** — die alle auf eine Verteilung
`api::run_toml` zulaufen. Innen stecken die Sensorpakete in einer gemeinsamen Fehlermodell-
schnittstelle; daneben liegen eine **Bezugssystemschicht** (IAU-2006/2000A-
Präzession–Nutation und die CIO-basierte Reduktion GCRS↔ITRS), eine **Astrodynamik-/Numerik-
schicht** (analytisches SGP4/SDP4 **und** ein numerischer Cowell-Propagator mit seinem
Kraftmodell aus EGM2008/Störungen, Manöverentwurf und Bahnbestimmung), eine
**Integritäts-/GNSS-Schicht** (RAIM/ARAIM, SBAS, der Messbereich, Jamming, cislunar),
eine **Fusions- / Alt-PNT-Schicht** (die GNSS/INS-Schätzer und die Kartenabgleicher für
Schwere/Gelände/Magnetfeld), eine **Tiefraum- und Mondschicht** (radiometrische Mars-PNT und die
lunare PNT-Suite, ihre Evidenzstufe je Teil in der Matrix — LTC-Zeit, VLBI, gemeinsame Bahnbestimmung+Uhr, Realisierung des Bezugssystems, Dienstvolumen,
differenzielle PNT, Interoperabilität), eine **Missionsanalyseschicht** (Budgets für Start / Wiedereintritt / Abdeckung /
Ausrichtung / Überflug / Verbindung und die Weltraumwetterumgebung) und die offene
**Studienschicht für Resilienz und KI/ML** (RPCF-Resilienzbewertung, die Optimismuslücke bei
HF-Beeinträchtigungen und der Demonstrator für quantengestützte PNT), deren reproduzierbare Artefakte auf den
validierten Kernen aufbauen.

Zwei eigenständige, **aus dem Workspace ausgeschlossene** Crates stehen neben dem Kern — `mcp/kshana-mcp`
(der MCP-Server, gebaut auf dem `rmcp`-SDK der Edition 2024) und `xval/anise-frames` (die
ANISE/SPICE-Gegenprüfung der Bezugssysteme, die Abhängigkeiten unter MPL-2.0 (Mozilla Public License 2.0) nachzieht) — und werden durch die
`exclude`-Liste der Wurzel-`Cargo.toml` aus dem Abhängigkeitsgraphen der veröffentlichten
Crate, `Cargo.lock`, der Lizenzschranke und dem MSRV-Build (minimal unterstützte Rust-Version) herausgehalten. Das JetBrains-Plugin (`ide/jetbrains`) ist ein separates Kotlin-
Projekt. Siehe [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) für den vollständigen Satz an Diagrammen.

Die gerenderten Diagramme (Engine-Ablauf, Modulkarte, Verteilung) stehen in [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagramme

Die Diagramme sind Mermaid-Quellen in [`docs/diagrams/`](docs/diagrams/), gerendert zu SVG und PNG nach
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` unter Linux, die beiden anderen
`render-diagram`-Skripte anderswo), und ein Datensatz bindet jedes PNG an genau das SVG, aus dem es stammt. Tests legen die
Zahlen fest, die sie nennen. Die Diagramme in den Abschnitten oben werden von Werkzeugen aus Engine-Läufen gezeichnet; diese zeigen, wie die
Teile zusammenpassen.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Das System: sechs Eingänge (Befehlszeile, Python, WebAssembly und npm mit Kshana Studio, MCP-Server mit Plugins und Skills, JetBrains-Plugin, Integrationen) rufen alle eine Verteilung über jede Szenarioart auf, die eine Engine aus gemeinsamem Kern, Sensorpaketen und Bezugssystemen sowie Bereichsmodellen ausführt und ein reproduzierbares Ergebnis und Diagramm schreibt" width="900"><br>
  <sub>Eine Verteilung, eine Engine, reproduzierbare Ausgabe · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · Quelle <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Die Oberflächen: Eine deterministische Offline-Engine speist die Befehlszeile, die Rust-Bibliothek, Python, WebAssembly und npm sowie den MCP-Server; das Studio läuft auf dem WebAssembly-Build, Plugin-Befehle und Skills auf dem MCP-Server, Integrationen und Bereitstellungskits auf der Befehlszeile und das JetBrains-Plugin auf der Bibliothek" width="900"><br>
  <sub>Jede Oberfläche, aus derselben Engine · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · Quelle <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Innerhalb eines Laufs: Eine Szenariodatei mit ihrem Seed und ihrer GNSS-Zeitleiste speist die Engine, die je Zeitschritt das Fehlermodell entwickelt, den Schätzer ausführt und die Gütemaße bewertet und ein reproduzierbares Ergebnis und Diagramm schreibt" width="900"><br>
  <sub>Die innere Schleife eines Laufs · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · Quelle <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Empfängervertrauen: Ein Empfängerprotokoll oder -strom wird in Beobachtungsgrößen je Epoche und die eigenen Flags des Empfängers eingelesen, durchläuft die Monitore und wird zu einem beratenden Vertrauenswert mit Band und Gründen, der das Studio, die Telemetrie, ein signiertes Nachweispaket, die Jammertest- und Bench-Bewertung und den Compliance-Bericht speist" width="900"><br>
  <sub>Von einem Empfängerprotokoll zu einem Vertrauenswert und was ihn nutzt · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · Quelle <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="Der Labor-Rundlauf: Ein Szenario wird mit seinen Ereignissen und Testbedingungen exportiert, ein Betreiber außerhalb von Kshana spielt eine Datei über einen Laborsimulator ab, das Empfängerprotokoll wird gegen die genannten Ereignisse bewertet, und der Nachweis-Rundlauf verknüpft die Hashes von Szenario, Bedingungen und Protokoll sowie die Bewertung zu einem signierten Paket" width="420"><br>
  <sub>Vom Szenario zum signierten Paket; Kshana erzeugt oder spielt nie ein Signal ab · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · Quelle <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: Der Browser führt die zu WebAssembly kompilierte Engine lokal aus, ohne etwas hochzuladen, nimmt mitgelieferte Szenarien oder ein von Ihnen geöffnetes Szenario oder Protokoll und zeigt das Ergebnis in der einfachen Ansicht, der erweiterten Ansicht und den Aufgabenseiten, mit Exporten, die der Nutzer speichert" width="900"><br>
  <sub>Wie das Studio läuft, lokal · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · Quelle <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Der Test- und Release-Ablauf: Lokale Schranken (Formatierung, clippy, die Prüfung auf fehlende Zuschreibung, die Ratsche für Dokumentationsabdeckung und scripts/gate.sh, das die vollständige Suite und Wiederholungsläufe ausführt und die Quittung schreibt, die der Pre-Push-Hook prüft) führen zu einem reinen CI-Pull-Request und einer grünen vollständigen CI; der Eigentümer spult main per Fast-Forward auf den grünen Commit vor, und nach der Prüfung der Versionssynchronität landet darauf ein annotierter Tag; der Release-Workflow verifiziert die vollständige Suite auf dem getaggten Commit, bevor irgendetwas veröffentlicht wird, baut die Binaries mit einer SBOM, Prüfsummen und Build-Provenienz, veröffentlicht auf crates.io, PyPI, npm, der Container-Registry, der MCP-Registry und dem JetBrains Marketplace, fragt jede Registry ab, bis sie die neue Version ausliefert, und stößt den Website-Build aus dem Tag an; ein getrennter reiner Website-Pfad stößt den Pages-Workflow mit dem Tag main an und wird abgelehnt, sofern sich seit dem letzten Release außerhalb von web/ und .github/ etwas geändert hat" width="900"><br>
  <sub>Test- und Release-Ablauf, von lokalen Schranken zu einem verifizierten Release und dem reinen Website-Pfad · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · Quelle <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="Die Modulkarte: Befehlszeile, Python, WebAssembly, MCP-Server und JetBrains-Plugin rufen die typisierte Verteilung über jede Art auf, die den gemeinsamen Kern, Zeit und Bezugssysteme, Sensorpakete, Astrodynamik, Integrität, Spoofing-Erkennung, Fusion, Tiefraum und Mond, Resilienz sowie die Schiedsrichter- und Benchmark-Module erreicht, alle abgesichert durch die Verifikationsmatrix" width="1000"><br>
  <sub>Wo der Code liegt · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · Quelle <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Verteilung: Ein Repository liefert die Kern-Crate, den MCP-Server, das IDE-Plugin und die Gegenprüfungs-Crates an crates.io, PyPI, npm, GitHub Releases, den Pages-Playground, die Container-Registry, die MCP-Registry und den JetBrains Marketplace, mit einem Zenodo-Archiv" width="900"><br>
  <sub>Was wohin ausgeliefert wird und was es prüft · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · Quelle <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## KI-Assistent

[`kshana-mcp`](mcp/kshana-mcp/) ist ein MCP-Server: Ihr Assistent führt die eigentliche Engine aus und
liest ihr JSON zurück, statt die Mathematik zu raten. Jedes seiner 49 Werkzeuge ist eine dünne Hülle
um eine öffentliche Funktion der Bibliothek `kshana`, sodass keine Simulationslogik im Server liegt.

### Den MCP-Server installieren

> Beratend, keine typzugelassene Navigationsausrüstung: Der Betreiber bleibt für die Navigation verantwortlich.
> Der Server läuft auf Ihrem Rechner; nichts wird an Ashforde OÜ gesendet.

Wählen Sie einen beliebigen Kanal. Jeder Link und jedes Snippet wird aus einem Skript erzeugt
(`scripts/gen_mcp_install.py`) und in der kontinuierlichen Integration geprüft; Snippets für Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI und Continue stehen in
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Kanal | Befehl oder Schaltfläche | Voraussetzung | Festgelegte Form |
|---|---|---|---|
| Erweiterung für Claude Desktop | Doppelklick auf die `.mcpb` für Ihr System: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | keine | `kshana-mcp-<target>.mcpb` von v0.40.0 |
| Cursor (ein Klick) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node oder Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (ein Klick) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node oder Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · Plugin: `/plugin marketplace add ashfordeOU/kshana`, dann `/plugin install kshana@ashforde` | Node (oder Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ mit uv oder pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | Formel für v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket`, dann `scoop install kshana-mcp` | Scoop (Windows) | Manifest für v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Vorgefertigtes Binary | [die Release-Seite](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, geprüft durch `SHA256SUMS` und `gh attestation verify` | keine | v0.40.0 |
| MCP-Registry | `io.github.ashfordeOU/kshana-mcp` (von registry-fähigen Clients gefunden) | ein registry-fähiger Client | `0.40.0` |
| Remote (streambares HTTP) | `kshana-mcp --http 127.0.0.1:8080`, selbst gehostet: siehe [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | Ihr eigener Host | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp auf Glama, der Qualitätswert seines MCP-Servers"></a></p>

In Claude Code kommt derselbe Server als Plugin: `/plugin marketplace add ashfordeOU/kshana`, dann
`/plugin install kshana@ashforde`. Das Plugin ergänzt Slash-Befehle über den Werkzeugen: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` und `/kshana-jammertest`. Die Werkzeuge für Schiffsvertrauen speisen die Integrationen für Signal K und
OpenCPN: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

Die Einrichtung je Client steht in [`docs/integrations.md`](docs/integrations.md). Der Server ist
in der offiziellen MCP-Registry als `io.github.ashfordeOU/kshana-mcp` eingetragen.

<details>
<summary>Die 49 Werkzeuge</summary>

<br>

**Szenarien und Berichte**

| Werkzeug | Was es tut |
|---|---|
| `run_scenario` | Ein Szenario aus einer TOML-Definition (Tom's Obvious, Minimal Language) ausführen |
| `list_scenario_kinds` | Die 92 eingebauten Szenarioarten mit Beschreibungen + Pflicht-/optionalen Feldern — damit der Agent ein gültiges Szenario aufbauen kann |
| `validate_scenario` | Vorabprüfung: das TOML einlesen und seine Art erkennen, ohne es auszuführen |
| `list_example_scenarios` | Die mitgelieferten Referenzszenarien als JSON |
| `get_example_scenario` | Der TOML-Text eines mitgelieferten Referenzszenarios, Byte für Byte die Datei unter `scenarios/` |
| `report_scenario` | Ein Szenario ausführen und seinen Bericht zurückgeben |
| `animate_scenario` | Ein Szenario ausführen und seine Zeitreihen als Animation zurückgeben |
| `sky_geometry` | Himmelsgeometrie unter einer azimutabhängigen Horizontlinie: die sichtbaren und verdeckten Satelliten, DOP, die Ost-Nord-Oben-Kovarianz und die horizontale Fehlerellipse; oder eine voreingestellte Horizontlinie mit ihrer Herkunft |

**Export und Interoperabilität**

| Werkzeug | Was es tut |
|---|---|
| `list_export_formats` | Welche Interoperabilitätsformate für ein Szenario gelten (`czml`, `kml`, `geojson`, `stk`, `sigmf`), der Grund, wenn eines nicht gilt, und die Spezifikation, der jeder Schreiber folgt |
| `export_interop` | Ein Szenario als CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-Ephemeride (Systems Tool Kit) `.e` oder SigMF (Signal Metadata  |
| `import_route` | Eine GeoJSON-Route `LineString` in ein Szenario schreiben, das einen Wegpunktkurs fliegt (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`), und das neue TOML zurückgeben |
| `export_sp3` | Die Konstellation eines `orbit`-Szenarios als präzise Ephemeride SP3-c (Standard Product 3, Revision c) exportieren |
| `export_omm` | Die Elemente eines `orbit`-Szenarios als OMM-Katalog (Orbit Mean-elements Message) nach CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 exportieren |
| `export_oem` | Die Zustandsreihe eines `orbit`-Szenarios als Ephemeride CCSDS OEM (Orbit Ephemeris Message) 2.0 exportieren — die TEME-Position (wahrer Äquator, mittleres Äquinoktium) *und*  |
| `export_table_csv` | Ein Szenario ausführen und seine Reproduzierbarkeitstabelle als CSV (kommagetrennte Werte) zurückgeben — die bytestabile Tabelle, die die CLI (Befehlszeilenschnittstelle) als `<scenario>.table.csv` schreibt |
| `export_test_bench` | Die Fahrzeugbewegung und die Ereignisse eines Szenarios für einen GNSS-Laborsimulator (`kshana bench-export`) |

**Empfänger- und Schiffsvertrauen**

| Werkzeug | Was es tut |
|---|---|
| `assess_receiver_log` | Ein echtes Protokoll eines GNSS-Empfängers (globales Navigationssatellitensystem) auf Vertrauen bewerten |
| `assess_vessel_stream` | Einen begrenzten NMEA-0183-Auszug bewerten (höchstens 2 MiB und 20,000 Epochen |
| `assess_vessel_log` | Ein NMEA-0183-Protokoll eines Schiffes (höchstens 4 MiB) als Batchlauf, wobei das Sitzungs-TOML die Grenzwerte des Schiffes nennt |
| `create_evidence_pack` | Ein signiertes Nachweispaket für ein Fenster des Protokolls eines Schiffes (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Ein Zeitstempel-Token nach RFC 3161 (Base64 der `.tsr`-Bytes) an ein Paket binden, im Speicher (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Ein Paket verifizieren (`kshana evidence verify`) |
| `generate_training_nmea` | Synthetisches Brücken-NMEA 0183 für das Training der Besatzung aus einem `nmea-scenario`-TOML (Jamming, Wegziehen der Position, Zeit-Spoofing, Wiedereinspielverzögerung) mit dem Ausbilderprotokoll (`kshana-nmea-training/1`) |
| `build_interference_map` | Eine GNSS-Störungskarte aus ADS-B- oder AIS-Positionsmeldungen als CSV-Text (höchstens 4 MiB) |
| `route_exposure` | Der Anteil der Länge einer Route in beeinträchtigten, nicht beeinträchtigten, nicht bewerteten und nicht beobachteten Zellen einer oder mehrerer Störungskarten, optional innerhalb eines Datumsbereichs |
| `trust_telemetry` | Ein Vertrauensstrom (JSON-Zeilen) oder ein `receiver-trust`-Ergebnis, ausgegeben als Prometheus-Text, CEF- oder LEEF-Syslog-Zeilen oder eine OTLP-JSON-Nutzlast, mit den Encodern von `kshana trust-telemetry` |
| `jammertest_import` | Den veröffentlichten Jammertest-Testkatalog und Sendeplan (NPRA/jammertest-plan, MIT) als geplante Wahrheit lesen (`kshana jammertest import`): Die Zeitfenster eines Testgebiets werden zu Receiver-Trust-Ereignissen mit der Katalog-ID und dem Jahr in jeder Bezeichnung. Geplante Zeitfenster, keine aufgezeichneten Sendezeiten; kein Kontaktfeld des Plans wird gelesen. MODELLED. Siehe [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Ein Empfängerprotokoll gegen diesen Plan bewerten (`kshana jammertest score`): je Test die Erkennungslatenz, verpasste Alarme und die Zeit bis zur Erholung sowie die Fehlalarme außerhalb jedes Zeitfensters. Textprotokolle als `log`, binäre (`ubx`, `sbf`) als `log_base64`. Ein signiertes Paket braucht einen Schlüssel: Befehlszeile. Nur beratend; MODELLED. |
| `fit_imu_log` | Parameter von Beschleunigungsmesser und Kreisel der Szenarien `hybrid` und `fusion`, angepasst aus einem IMU-Protokoll im Stillstand (CSV oder EuRoC) per Allan-Abweichung, mit einer einfügefertigen Tabelle `[accel_classical]` und dem SHA-256 des Protokolls (`kshana imu-fit`). Text hinein, JSON heraus; MODELLED. |

**GNSS-IQ (Dateien im Arbeitsverzeichnis; im HTTP-Modus aus)**

| Werkzeug | Was es tut |
|---|---|
| `iq_signals` | Die Einrichtung der GNSS-IQ-Ebene |
| `iq_info` | Eine IQ-Aufzeichnung (In-Phase und Quadratur) im Arbeitsverzeichnis beschreiben, ohne sie zu verarbeiten |
| `iq_scene` | Eine GNSS-IQ-Szene mit mehreren Satelliten im Arbeitsverzeichnis erzeugen (`kshana iq scene`) |
| `iq_acquire` | FFT-Erfassung (schnelle Fourier-Transformation) einer oder mehrerer PRNs (Pseudozufallsrauschcodes) über eine Aufzeichnung (`kshana iq acquire`), optional hinter Frontend-Stufen |
| `iq_track` | Erfassen, dann mit der DLL/PLL/FLL-Bank (Verzögerungs-, Phasen- und Frequenzregelschleife) nachführen (`kshana iq track`), mit den Schleifen aus einem `kshana.loop-desig |
| `iq_frontend` | Empfänger-Frontend und DSP zur Störungsminderung anwenden (digitale Signalverarbeitung |
| `iq_sweep` | Eine IQ-Aufzeichnung im Arbeitsverzeichnis über mehrere Entwürfe der Nachführschleife wiedergeben (`kshana iq sweep`) |
| `iq_monitor` | Die Monitore zur Störungs- und Spoofing-Erkennung über eine IQ-Aufzeichnung im Arbeitsverzeichnis laufen lassen (`kshana iq monitor`) |
| `iq_labfit` | Das Modell für den Verlust der Nachführung an Laborläufe anpassen (`kshana iq labfit`), aus einem `iq-labfit`-Szenario mit eingebetteten Protokollen (`text` oder `base64` |
| `iq_test_conditions` | Eine als Text übergebene Datei `kshana.test-conditions/1` validieren und die aufgelösten Bedingungen mit ihrem Hash zurückgeben |
| `iq_campaign` | Eine Labor-Wiedergabekampagne ausführen (`kshana iq campaign`) |
| `iq_campaign_status` | Der Fortschritt eines Kampagnenausgabeordners |

**Compliance-Zuordnung**

| Werkzeug | Was es tut |
|---|---|
| `compliance_report` | Die Zuordnung zu öffentlichen Rahmenwerken, gefüllt aus als Text übergebenen Ergebnisdokumenten (`kshana compliance-report`) |
| `compliance_mapping` | Die statischen Zuordnungstabellen (oder, mit `sources`, die Quelldokumente, die sie mit Versionen und URLs nennen) als Markdown, eingeleitet von derselben Erklärung |
| `list_standards_packs` | Die Normenpakete (`kshana standards-pack list`): bewertete Szenariosätze für die Testprofile des DHS-Rahmenwerks für resiliente PNT, IMO MSC.1/Circ.1575 und ICAO Doc 9849 Appendix F |
| `run_standards_pack` | Ein Paketlauf gegen vor dem Lauf genannte Zielwerte: jeder Test `MET`, `NOT MET` oder `NEEDS INPUT`; MODELLED, bewertet kein Produkt |
| `lunanet_afs_check` | Das LunaNet Augmented Forward Signal, geprüft gegen LNIS V5 AD1 Volume A (LSIS-AFS V1.0): die Codes gegen die abgedruckten Tabellen oder ein Symbolstrom gegen das Rahmenformat; LDPC und CRC-24Q der Unterrahmen 2 bis 4 werden nicht verifiziert |
| `create_round_trip_pack` | Das signierte Paket für den Labor-Rundlauf: Szenario, Dokument `kshana.test-conditions/1`, Empfängerprotokoll und Bewertung, per Hash verknüpft |

**Benchmark**

| Werkzeug | Was es tut |
|---|---|
| `score_benchmark` | Eine kshana-bench-Einreichung, bewertet gegen eine Wahrheitsdatei, beide als JSON-Text (`kshana bench score`, `bench/SPEC.md`): die Ergebnisdatei mit Spezifikationsversion, Aufteilung, Eingabe-Hashes und den Metriken der Aufgabe. MODELLED; beschreibt ein Protokoll oder Korpus, nie ein Produkt. |
| `render_leaderboard` | kshana-bench-Ergebnisdateien, ausgegeben als statische Ranglistenseite (HTML-Text), jede zuerst validiert. |

</details>

<a id="editions"></a>
## Ausgaben

Die ganze Engine ist kostenlos. Kshana Pro und maßgeschneiderte Studien sind für Programme, die mehr brauchen,
und jeder kostenpflichtige Weg beginnt mit einer Nachricht: Hier gibt es keine Preise.

| | Free | Kshana Pro | Maßgeschneiderte Studie |
|---|---|---|---|
| Was es ist | die ganze offene Engine, alle 92 Szenarioarten, keine Funktionssperre | eine proprietäre Erweiterungsschicht auf derselben Engine, unter Vertrag | eine MODELLED Studie zur PNT-Resilienz Ihres Systems, für Sie durchgeführt |
| Lizenz | AGPL-3.0 (GNU Affero General Public License, Version 3) oder eine kommerzielle Lizenz | proprietär | Vertrag |
| Wie beginnen | [installieren](#install) oder [kshana.dev](https://kshana.dev) öffnen | [eine Pro-Evaluierung anfragen](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [eine Studie anfragen](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Was Pro ist, in den Worten von [`docs/PRO.md`](docs/PRO.md):

> **Eine strikte Obermenge des offenen Kshana.** Pro nutzt die offene Engine als Bibliothek und
> forkt sie nie. Jede offene Szenarioart läuft in Pro unverändert, und ein offenes Szenario läuft
> in Pro ganz ohne Lizenz.
>
> **Keine neue Physik.** Pro fügt kein physikalisches Modell hinzu und ändert keines. Jede Pro-Zahl stammt
> aus Läufen der offenen Engine, sodass eine Pro-Zahl so vertrauenswürdig ist wie die offene Szenarioart,
> aus der sie stammt, und nie mehr.

Pro beantwortet die nächsten Fragen eines Programms: welchen Entwurf fliegen (ein Entwurfsoptimierer und seine
Pareto-Front), wie sicher die Antwort ist (Unsicherheit und Sensitivität) und ob die Mission
ihre Anforderungen erfüllt (ein Missionsdossier, Rückverfolgbarkeit der Anforderungen, Abwägungsstudien, eine
Regressionsprüfung von Szenarien, digitale Zwillinge von Uhren, ein Studiendossier und ein Dienst
vor Ort). Es überwacht außerdem eine Kampagne von Zahlen und lässt eine Pipeline fehlschlagen, wenn sich eine verschlechtert,
testet Kandidaten für Signalpläne gegen die offenen Satellitennavigationssignale in beiden
Richtungen (Spektrumskoexistenz) und reiht Studien in einen Auftragsdienst vor Ort mit einem
hashverketteten Lieferregister ein. Jedes wird mit dem, was es erzeugt und was es nicht tut, beschrieben in
[`docs/PRO.md`](docs/PRO.md). Nichts, was Pro erzeugt, ist eine Zertifizierung, und auch eine maßgeschneiderte Studie ist
keine Zertifizierung.

<details>
<summary>Was Kshana Pro aus der offenen Engine liest, und Unterstützung durch Ashforde® OÜ</summary>

<br>

**Worauf Kshana Pro aufbaut.** Jeder Teil von Pro arbeitet mit der offenen Engine und lässt
sie unverändert:

- **Der Entwurfsoptimierer, die Unsicherheitsstudie und das Missionsdossier** führen Szenarien der offenen Engine
  über die öffentliche Schnittstelle der Engine aus und berechnen jede Zahl aus den Ergebnissen
  der Läufe. Jede Ausgabe behält die Stufe VALIDATED, MODELLED oder PARTNER, die die offene Engine
  jeder Zahl gab, nie eine höhere.
- **Digitale Zwillinge von Uhren** verwenden das Uhrenmodell der offenen Engine und ihren Schätzer
  für die Allan-Abweichung: Ein Zwilling wird auf das veröffentlichte Allan-Budget des Geräts kalibriert und dann geprüft, indem
  die Allan-Abweichung des Zwillings mit dem offenen Schätzer geschätzt wird.
- **Abwägungsstudien** führen jede Architekturoption unverändert als Szenario der offenen Engine aus
  und ordnen die Optionen nach einem Gütemaß, das aus dem Ergebnis jedes Laufs gelesen wird.
- **Kampagnenüberwachung** liest ihre Zahlen aus den Ergebnissen von Läufen der offenen Engine mit den
  Szenarien eines Pakets und vergleicht sie mit dem vorigen bestandenen Lauf.
- **Spektrumskoexistenz** liest jede physikalische Zahl aus Läufen der offenen Engine mit den Arten
  `leo-signal` und `constellation-design` und fügt nur die Summe über die sichtbaren Satelliten
  und die Rangfolge der Pläne hinzu.
- **Der Auftragsdienst vor Ort** führt offene und Pro-Szenarien durch dieselbe Engine aus und
  speichert jedes Ergebnis so, wie der Lauf es zurückgegeben hat.
- **Nachweispakete** halten für jeden Lauf den Szenario-Hash fest, den die offene Engine auf
  ihr Ergebnis stempelt, sodass eine Zahl in einem Paket durch erneutes Ausführen ihres Szenarios reproduziert werden kann.
- **Werkzeuge für Systems Engineering und Programme.** Die Werkzeuge von Kshana Pro für modellbasiertes
  Systems Engineering (MBSE) und Programme prüfen die Anforderungen eines Programms
  gegen Läufe der offenen Engine: Sie importieren Anforderungen als kommagetrennte Werte
  (CSV) oder als dokumentierte Teilmenge des Requirements Interchange Format (ReqIF) oder von
  Text in Systems Modeling Language Version 2 (SysML v2), werten jedes Abnahme-
  kriterium mit seiner Einheit gegen die Werte aus, die ein Lauf geschrieben hat, und erzeugen eine Verifikations-
  querverweismatrix (VCRM), ein SysML-v2-Modell, einen Bericht zur Änderungsauswirkung und ein Offline-
  Nachweispaket. Sie führen nichts erneut aus, berechnen nichts neu und lesen nur, was die offene Engine
  veröffentlicht: das `result.json` jedes Laufs (die Felder, die ein Kriterium nennt, ihre Einheiten, den
  Reproduzierbarkeitsstempel aus Szenario-Hash, Seed, Engine-Version und Schemaversion sowie
  die Kennzeichnung und die Abbildungsstufen des Laufs), sein `report.json` (Art, Reproduzierbarkeitsdatensatz und
  Fähigkeitskennzeichnungen), die Szenariodatei (ihr Hash, ihre Art, ihr Seed und ihre Parameter), das
  Schema der Feldeinheiten (Einheit, Herkunft und Evidenzstufe jedes Feldes) und die
  Verifikationsmatrix (die Kennzeichnung VALIDATED, MODELLED oder PARTNER jeder Fähigkeit).

<a id="support--professional-services"></a>
### Unterstützung und professionelle Dienstleistungen

Kshana ist kostenlos und quelloffen unter der AGPL-3.0 und wird **professionell von Ashforde® OÜ** (Estland)
**entwickelt und gepflegt**. Die offene Engine ist vollständig und für sich allein
nutzbar. Für Organisationen, die mehr brauchen, bietet Ashforde® OÜ:

- **Kommerzielle Unterstützung und Integration** — Einbettung von Kshana in Ihre Werkzeugkette, maßgeschneiderte
  Szenarien und priorisierte Korrekturen.
- **Maßgeschneiderte Sensormodelle** — kalibriert auf Ihre Hardware, einschließlich exportsensibler
  Resilienzmodelle, die in einer privaten Erweiterungsschicht gepflegt werden.
- **Kshana Pro** — proprietäre Werkzeuge für modellbasiertes Systems Engineering (MBSE) und
  Programme, die die Anforderungen eines Programms gegen Läufe der offenen Engine prüfen und
  eine Verifikationsquerverweismatrix (VCRM), ein Modell in Systems Modeling Language
  Version 2 (SysML v2), einen Bericht zur Änderungsauswirkung und ein Offline-Nachweispaket erzeugen. Sie
  führen nichts erneut aus und lesen nur die veröffentlichten Ausgaben der Engine: `result.json`
  und `report.json` jedes Laufs, die Szenariodatei, das Schema der Feldeinheiten und die Kennzeichnungen
  der Verifikationsmatrix (die vollständige Liste steht unter [Ausgaben](#editions)).
- **Kshana-Pro-Werkzeuge für Entwurf, Unsicherheit und Mission** — die Pareto-Front eines Entwurfs-
  raums, Unsicherheit und Sensitivität über Tausende von Läufen und ein Missions-
  dossier mit einem Befehl, mit Verifikationsmatrix und PDF; siehe [`docs/PRO.md`](docs/PRO.md).
- **Kshana-Pro-Kampagnenüberwachung, Spektrumskoexistenz und Auftragsdienst** — eine Pipeline, die
  fehlschlägt, wenn sich eine überwachte Zahl verschlechtert, Signalpläne, die gegen die offenen
  Satellitennavigationssignale in beiden Richtungen getestet werden, und eine Auftragswarteschlange vor Ort mit einem
  hashverketteten Lieferregister; siehe [`docs/PRO.md`](docs/PRO.md).
- **Schulung und Beratung** zur Leistungsanalyse von Quanten-/klassischer PNT.

Dies ist das Open-Core-Modell: Die Engine ist und bleibt offen lizenziert; das tragende
Geschäft sind Expertise, Unterstützung und die proprietären Erweiterungen — keine Lizenzgebühren.
Kontakt **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Forschung

Studien auf Grundlage der offenen Engine werden auf arXiv veröffentlicht. Jede nennt den Engine-Befehl
dahinter, sodass ihre Zahlen aus einem eingecheckten Szenario oder Studienbeispiel neu erzeugt werden können.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Forschung auf Grundlage der offenen Engine: sechs Arbeiten auf arXiv, jede Karte mit der Arbeit, ihrem Datum und ihrer Kategorie sowie dem Engine-Befehl, der ihre Zahlen neu erzeugt. Dieselben sechs Arbeiten, mit Links und Befehlen, stehen in der Tabelle unten." width="100%">
</picture>

| Arbeit | Was sie zeigt | Engine-Befehl |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | Der Rückgang der Bewertung eines GNSS-Störungsdetektors, sobald sich die Bedingungen verschieben, lässt sich allein aus Statistiken innerhalb der Verteilung vorhersagen, auf einer offenen synthetischen Testumgebung und dann an offenen Feldaufzeichnungen. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Ein GNSS-Zeitempfänger unter Spoofing hat keine endliche unbedingte Schranke für den unerkannten Zeitfehler, daher gibt die Arbeit eine bedingte an, kalibriert an einem aufgezeichneten Over-the-Air-Spoofing aus der öffentlichen Kampagne JammerTest 2024. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Ein einzelner zusammengesetzter Resilienzwert ist nur dort eine stabile Entscheidungsgrundlage, wo ein Entwurf dominiert; wo Entwürfe konkurrieren, kann allein eine Neugewichtung den Gewinner ändern. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Entfernungsmessung innerhalb einer Mondkonstellation lässt die absolute Position einer Oberflächenstation unbeobachtbar; eine Verzögerung aus Very-Long-Baseline-Interferometrie (VLBI) von der Erde stellt sie wieder her, wenn die Konstellation dünn ist, und schärft sie, wenn sie reich ist. | die Art `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Geplante Konstellationen aus vier bis sechs Satelliten liefern am lunaren Südpol eine schlechte Geometrie, und einige Entfernungsbaken an der Oberfläche beheben das weit günstiger als mehr Satelliten. | die Art `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Die Verdünnung der Genauigkeit ist für cislunare Bahnverfolgung nur mit Entfernungen undefiniert, weil die Geschwindigkeit in einer Momentaufnahme unbeobachtbar ist, daher verwendet die Arbeit die Beobachtbarkeits-Gramsche auf vier planaren fernen retrograden Bahnen: Nur Entfernung hat in einer Momentaufnahme Rang 2 von 4 und braucht einen Bogen von etwa 2.09 h, um vollständig beobachtbar zu werden, wobei sich die Konditionierung mit länger werdendem Bogen verbessert; die Entfernungsrate (Doppler) liefert sofort Rang 4; und die gemeinsame Schätzung einer Station mit Satellitenzuständen und Uhren bleibt um eins rangdefizient, sofern keine externe interferometrische Beobachtungsgröße hinzukommt. Anforderungen gehören in Budgets für Bogenlänge, Konditionierung und Messart, nicht in DOP. | die Art `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (ihre Schwester `cislunar-arc-recovery` testet die Schwelle mit einem unabhängigen Schätzer über finite Differenzen) |

Die drei Studienbeispiele schreiben bytedeterministische Artefakte (feste Seeds), die ihre
Engine-Version, Seeds und einen Konfigurations-Hash festhalten. Die drei Arbeiten zu Mond und cislunarem Raum bauen auf der
Mondsuite auf (die Evidenzstufe jedes Teils steht in der Verifikationsmatrix); ihre Aussagen zu Geometrie und Verdünnung der Genauigkeit werden zudem
gegen getrennte Referenzen in `tests/validate_p*.rs` gegengeprüft. Mehr unter
[Reproduzierbare Studienartefakte](#reproducible-study-artifacts) in der Referenz.

<a id="cite"></a>
## Zitieren

Wenn Sie Kshana in wissenschaftlicher oder technischer Arbeit verwenden, zitieren Sie bitte die verwendete Version, mit
Szenario und Seed. [`CITATION.cff`](CITATION.cff) enthält die maschinenlesbaren Metadaten, und
GitHub zeigt daraus eine Schaltfläche „Cite this repository“. Jedes Release wird auf Zenodo archiviert;
die Konzept-DOI (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) verweist immer auf die
neueste Version.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Die oben genannten Arbeiten:

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
## Lizenz

Kshana ist doppelt lizenziert: unter der GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)) oder einer
**kommerziellen Lizenz** von Ashforde® OÜ für geschlossene Integration, zu der die AGPL nicht passt.
[`LICENSING.md`](LICENSING.md) erklärt, welche gilt. Beiträge werden eingehend
unter der AGPL lizenziert und gewähren Ashforde® OÜ zudem das Recht, sie in die kommerzielle
Ausgabe aufzunehmen; zeichnen Sie jeden Commit mit `git commit -s` ab (siehe [`CONTRIBUTING.md`](CONTRIBUTING.md)).
„Kshana“ und seine Zeichen sind Marken von Ashforde® OÜ: Die Lizenz deckt den Code ab, nicht den
Namen, benennen Sie Forks daher bitte um.

<a id="reference"></a>
## Referenz

Das umfangreiche Material, eingeklappt. Jedes Dokument ist unter [Dokumentation](#documentation) aufgeführt.

<details>
<summary>Installieren und aus dem Quellcode bauen</summary>

<a id="install--build"></a>
### Installieren und bauen

Benötigt eine Rust-Toolchain (≥ 1.88, die `rust-version` in Cargo.toml; entwickelt mit 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Verwendung: die Befehlszeile vollständig</summary>

### Verwendung

Führen Sie ein beliebiges Szenario aus; die CLI verteilt anhand des Feldes `kind` des Szenarios und schreibt
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` und
`<scenario>.report.json` daneben — dazu `<scenario>.table.csv` für die Arten, die
eine Tabelle veröffentlichen. Der Bericht (eine Seite in HyperText Markup Language (HTML) und ein JSON-Dokument
mit demselben Inhalt) enthält eine Zusammenfassung für Entscheider, jede Eingabe mit ihrer Einheit, die
Ergebnisse und Diagramme, die Sweep-, Monte-Carlo- oder Kettentabellen einer Kampagne, eine Ereigniszeitleiste,
die Kennzeichnung VALIDATED / MODELLED / PARTNER und die Quelle jeder Fähigkeit, die der Lauf verwendet hat,
was nicht modelliert ist, und einen Reproduzierbarkeitsdatensatz (Engine-Version, Digests nach Secure Hash
Algorithm 256-bit (SHA-256), Seed, Plattform und der genaue Befehl). Er lässt sich aus dem Browser
als saubere PDF-Datei (Portable Document Format) auf A4 oder Letter drucken; die
Engine schreibt selbst kein PDF. Siehe [`docs/REPORTS.md`](docs/REPORTS.md).

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

`--export <czml|kml|geojson|stk|sigmf|all|list>` schreibt CZML (die Cesium Language), KML
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), Ephemeriden für Ansys STK (Systems Tool Kit) `.e`
und Aufzeichnungen in SigMF (Signal Metadata Format) neben das Szenario, und
`--import-route <route.geojson>` speist eine GeoJSON-Linie in die Arten, die einen Kurs fliegen. Jedes
Format wird gegen seine veröffentlichte Spezifikation validiert, und ein Szenario, für das ein Format nicht
gilt, sagt, warum: siehe [docs/INTEROP.md](docs/INTEROP.md).

**Weitere CLI-Modi** — ein Szenario prüfen, echte Erdorientierungsdaten einspeisen oder eine ganze Suite ausführen:

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

**Animationsexport.** `--animate svg|html|frames|all` schreibt `<scenario>.animation.svg`
(Keyframes in Cascading Style Sheets (CSS), kein Skript), `<scenario>.animation.html` (Abspielen, Pause, Spulen, Geschwindigkeit und
synchronisierte Panels, ohne externes Asset) und `<scenario>.frames/` (`frame_0000.svg`, … plus
`manifest.json` mit Bildern pro Sekunde und Dauer). Eine Kampagne spielt ihre Phasen und
Alarme ab, ein Spektrumlauf seinen Wasserfall; das Design folgt `prefers-color-scheme`, und
`prefers-reduced-motion` zeigt das fertige Bild. Es gibt die eigenen Abtastwerte des Laufs wieder,
bei einem erneuten Lauf byteidentisch, und fügt keinen Nachweis hinzu. Siehe [docs/ANIMATION.md](docs/ANIMATION.md).

Ein **Suite**-Manifest ist eine kleine TOML-Datei (Tom's Obvious, Minimal Language) — ein `title` und ein Array `scenarios = [ … ]` von
Szenariopfaden —, die die Engine der Reihe nach ausführt und dabei jedes Ergebnis (mit seinen
Kennzeichnungen MODELLED / VALIDATED) in ein selbstbeschreibendes Studienartefakt einfaltet. Siehe
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Rolle in der Interoperabilität.** Kshana ist die Ebene der *Leistungssimulation*, die
neben der Nachbearbeitungs-Werkzeugkette steht, kein Ersatz für sie: Speisen Sie seine **RINEX**-
Ausgabe in RTKLIB oder gLAB für eine Positionslösung, und verwenden Sie seine **SP3**-Ausgabe als
Produkt präziser Bahnen für Werkzeuge wie Ginan — Kshana beantwortet, *welche Resilienz eine gegebene
PNT-Architektur bringt*, bevor Sie echte Signale haben, in Formaten, die diese Werkzeuge bereits
einlesen (`--export-sp3` oder `export_sp3 = true` in einem `orbit`-Szenario schreibt
`<scenario>.sp3`). Dieselbe Bahn kann als normgerechte mittlere Elemente nach **CCSDS OMM**
veröffentlicht werden (`--export-omm` oder `export_omm = true` schreibt `<scenario>.omm`) —
eine OMM-502.0-KVN-Nachricht (Schlüsselwort = Wert-Notation) je durch TLE definiertem Satelliten, mit der echten
Katalognummer des NORAD (North American Aerospace Defense Command), der internationalen Kennung des COSPAR (Committee
on Space Research) und der Epoche jedes Objekts, für jeden
OMM-fähigen Verbraucher statt eines eigenen Zweizeilenelementsatzes.

Beispielausgabe (Uhren-Holdover — beachten Sie, wie die Gütemaße Integrität und Sicherheit gemeldet werden):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

Der Zeitfehler der optischen Uhr im 95. Perzentil (p95) beträgt 1.20e-4 ns: Die Zusammenfassung
gibt kleine Werte mit signifikanten Stellen aus, statt sie auf `0.0` zu runden.
`security` lautet `n/a (no attack)`, weil dieses Szenario keinen Angriff konfiguriert, sodass es
nichts zu erkennen gibt. Das JSON-Ergebnis trägt dennoch die analytische
Schranke der Spoofing-Erkennbarkeit jeder Uhr in `fom.security` (0.997 für die optische Uhr, 0.000 für die
Atomuhr im Chipformat, deren eigenes Rauschen über das Überwachungsfenster die Spezifikation von 20 ns
übersteigt), und sein Block `figure_tiers` markiert diese Zahl als `applicable: false`. Die Szenarioart `spoof`
bewertet die Erkennung gegenüber einem eingebrachten Angriff. `figure_tiers` gibt außerdem
jeder gemeldeten Zahl ihre Verifikationsstufe — VALIDATED (gegen eine externe
Referenz geprüft) oder MODELLED — und die Zeile der Verifikationsmatrix, aus der die Stufe gelesen wird. Das Bahn-
szenario meldet zusätzlich einen Geometrieblock — Anteil der Abtastwerte mit Lösung sowie
beste/mediane Positionsverdünnung der Genauigkeit (PDOP) und Positionsgenauigkeit — neben dem
Uhrenergebnis.

> **Lesen Sie diese beiden Zahlen sorgfältig.** `security` ist eine *analytische Schranke der Spoofing-Erkennbarkeit*,
> abgeleitet aus der Stabilität jeder Uhr — sie ist nur gegenüber einem
> konfigurierten Spoofing-Szenario aussagekräftig und ist **kein** RAIM-Detektor über mehrere Satelliten. `integrity`
> ist hier die *Selbstkonsistenz* des Filters (Anteil der Ausfallabtastwerte innerhalb seiner eigenen k-Sigma-
> Schranke), **keine** HPL/VPL-Integritätszahl der Luftfahrt. Siehe
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Für echte autonome Integrität im Empfänger führt die **Szenarioart `integrity`**
> (`scenarios/integrity-raim.toml`) echtes RAIM als Snapshot und mit Lösungsseparation
> (ARAIM-artig) über die propagierte Konstellationsgeometrie aus: Sie berechnet
> horizontale/vertikale **Schutzpegel (HPL/VPL)** je Epoche und meldet den
> Anteil der Epochen, die die konfigurierten Alarmgrenzen einhalten, mit einem Stanford-
> Integritätsdiagramm zur Einordnung Fehler gegenüber PL (Schutzpegel).

<a id="reproducible-study-artifacts"></a>
#### Reproduzierbare Studienartefakte

Vier offene Studien erzeugen jeweils mit einem Befehl ein bytedeterministisches Artefakt (fester Seed)
neu — die Zahlen hinter den Studien zum Übergang Quanten- gegenüber klassisch, zur Optimismuslücke bei
HF-Beeinträchtigungen, zur Bewertung der PNT-Resilienz und zum Timing Protection Level:

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

Jedes Artefakt hält seine Engine-Version, Seeds und einen Konfigurations-Hash fest und trägt eine ehrliche
Kennzeichnung MODELLED/VALIDATED. Die Sonden für echte Daten (`*_probe`) führen dieselbe Pipeline über
Aufzeichnungen aus, die Sie lokal bereitstellen; im Repository werden keine Datensätze mitgeliefert. Die Studie zur
Optimismuslücke bei HF-Beeinträchtigungen ist im Preprint
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054) beschrieben, und der bedingte Timing
Protection Level (`tpl_jammertest` oben) im Preprint
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (siehe [Zitieren](#cite)).

Bei den veröffentlichten Studien zu lunarer PNT ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP mit Oberflächenbaken, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) VLBI-
Beobachtbarkeit und [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) cislunare Beobachtbarkeit
nach Bogenlänge) werden die Aussagen zu Geometrie, Verdünnung der Genauigkeit, Echtzeitvorhersage von Bezugssystem /
Erdorientierungsparametern (EOP), fernen retrograden Bahnen und HF-Entfernungsmessung
unabhängig gegengeprüft in
`tests/validate_p*.rs` gegen getrennte Referenzen (`scipy.special.j1`, eine unabhängige DOP-Lösung
`(HᵀH)⁻¹` mit NumPy, ein erneutes Einlesen derselben IERS-Zeilen `finals2000A` mit NumPy und die
Three-Body Periodic Orbit Database von NASA/JPL). Dies sind zusätzliche Regressionsprüfungen über
der **modellierten** Mondsuite; sie ändern die Zahl der maschinell geprüften Matrix nicht.

</details>

<details>
<summary>Szenarioformat</summary>

<a id="scenario-format"></a>
### Szenarioformat
Szenarien sind deklaratives TOML. Ein `kind` auf oberster Ebene wählt das Paket — insgesamt **fünfzig**
(`clock` ist die Voreinstellung, wenn es fehlt): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (KI/ML-Testumgebung zur Evaluierung der Erkennung von
HF-Beeinträchtigungen — gekennzeichnetes synthetisches Korpus + detektorunabhängiges ROC/AUC-Gerüst +
Optimismuslücke innerhalb/außerhalb der Verteilung), `quantum-trade` (Abwägung Quanten- gegenüber klassischer PNT
mit Einlesen gemessener ADEV + Resilienzhüllkurve ohne GNSS; MODELLED),
`space-weather` (solare/geomagnetische Indizes + exosphärische Temperatur nach Jacchia-71 +
aktivitätsgetriebene thermosphärische Dichte gegenüber der statischen Atmosphäre; MODELLED),
`oem-interop` (CCSDS-OEM-Import-/Rundlaufbrücke für Ephemeriden aus GMAT/Orekit/STK;
MODELLED), das Missionsanalyse-Trio `launch-window` (Startazimut im Zweikörpermodell /
Bahnebenenwechsel / Startgelegenheiten), `reentry` (ballistischer Wiedereintrittskorridor nach Allen-Eggers),
`eo-coverage` (Geometrie für EO-Schwad / GSD / Zugang / Wiederbesuch), `space-packet` (Space-Packet-Rahmung nach CCSDS
133.0 TM/TC — Telemetrie/Telekommando — exaktes Bitlayout, im Rundlauf verifiziert) und
`attitude-budget` (Schweregradientenmoment mit 3 Freiheitsgraden + RSS-Ausrichtungsfehlerbudget),
`passes` (Vorhersage von Auf- und Untergang bei Überflügen über Bodenstationen — AOS/TCA/LOS, maximale Elevation,
Zugang) und `link-budget` (Einweg-Linkgleichung nach CCSDS/DSN — FSPL / Eb·N₀ /
Reserve / Schließen des Links); `telecom-timing` (Holdover-Zeitfehler, MTIE und TDEV, geprüft
gegen ITU-T-Masken); `spectrum` (das ganze GNSS-L-Band als eine spektrale Leistungsdichte:
ein Wasserfall Frequenz über Zeit unter einer geskripteten Zeitleiste von Störern mit Dauerstrich, Schmalband, Chirp oder
angepasstem Rauschen, Stör-zu-Signal-Verhältnis je Band und effektive
Träger-Rausch-Leistungsdichte aus dem Spektraltrennkoeffizienten sowie Ein- und Ausgabe von Aufzeichnungen im Signal Metadata
Format (SigMF) mit Welch-Spektralschätzungen; die Signal-
spektren VALIDATED gegen Lehrbuchwerte, das Störerszenario MODELLED; siehe
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); dieselbe Art zeichnet Panels für UHF-, S- und C-Band mit
entworfenen Signalen in niedriger Erdumlaufbahn); `leo-signal` (Entwürfe von Signalen für Positionierung, Navigation und
Zeitgebung in niedriger Erdumlaufbahn für jedes System: bandbegrenzte Spektren, Jitter der Codenachführung und Entfernungs-
genauigkeit, Erfassungssuche und -zeit, Spektraltrennung gegenüber GPS und Galileo, Stör-
toleranz und eine Abwägung von UHF bis C-Band, aus öffentlichen Voreinstellungen wie Xona Pulsar, Iridium,
Starlink und CentiSpace oder eingebetteten Entwürfen; die geschlossenen Formen und der LEO-Doppler VALIDATED, die
Entwürfe MODELLED; siehe [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (die Sonne, Planeten, Pluto, der Mond und sieben große
Monde zu einer Epoche — Positionen, Konstanten, Lichtlaufzeiten und Bahnspuren; Planetenpositionen
VALIDATED gegen JPL Horizons) und `body-pnt` (Positionierung um jeden dieser Körper mit einer
lokalen Navigationskonstellation und einer Tiefraumverbindung von der Erde; MODELLED); `campaign` (vorhandene Arten, zu einer verketteten Missionszeitleiste zusammengesetzt,
mit zwischen Phasen übergebenem Zustand, ein Parametersweep, ein geseedetes Monte-Carlo-Ensemble oder
mehrere Szenarien unter einer gemeinsamen Bedingung; MODELLED, siehe
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (Walker-Delta- und -Stern-
muster, Elementlisten und Entwürfe mit mehreren Schalen mit Voreinstellungen für GPS, Galileo, BeiDou und GLONASS
sowie Abdeckung und Verdünnung der Genauigkeit über ein Breiten-/Längenraster; der
Generator und die globale GPS-DOP VALIDATED gegen die veröffentlichten Dienstdokumente, siehe
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (ein Überflug eines Satelliten für Positionierung,
Navigation und Zeitgebung (PNT) in niedriger Erdumlaufbahn (LEO) und sein Linkbudget Band für
Band, aus jeder Konstellation und jedem Signalentwurf: Blickwinkel, Doppler und Dopplerrate,
ITU-R-Regen-, Gas-, Szintillations- und Gebäudeeintrittsdämpfung, Träger-Rausch-Leistungsdichte gegenüber den
sichtbaren MEO-GNSS-Satelliten, die Ionosphäre erster Ordnung und ionosphärenfreie Paare sowie ein
Lösungsbudget bei niedriger Energie, Ionosphärensondierung aus jedem Bandpaar und Spoofing-Monitore über
Konsistenz von Doppler und Überfluggeometrie und über Konsistenz zwischen Bändern; die ITU-R-Terme und die
Doppler-Hüllkurve für ruhende Nutzer VALIDATED, der Überflug MODELLED, siehe
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (die Broadcast-
Ephemeriden- und Uhrennachricht eines LEO-PNT-Satelliten in niedriger Erdumlaufbahn, für jede Bahn und jeden
Träger: ein Anpasser von einer integrierten Wahrheitsbahn auf den Kepler-Satz von Galileo, dieser Satz
mit Korrekturpolynomen entlang, quer zur Spur und radial, das Modell nach Liu et al. 2025
mit 22 Parametern oder das ATOMIC-ECEF-Polynom ohne Uhr; Entfernungsfehler des Signals im Raum
(SISRE) gegenüber Anpassungsintervall und Aktualisierungsperiode, eine Kontinuitätsprüfung bei einer Aktualisierung mitten im Überflug,
Kshanas eigener dokumentierter binärer Rahmen mit einer zyklischen Redundanzprüfung CRC-24Q und einem Quantisierungsbudget sowie ein
Block im Stil von RINEX 4, gekennzeichnet als Kshana-Erweiterung; die SISRE-Gewichte, der Galileo-Nutzer-
algorithmus und CRC-24Q VALIDATED, die Anpassungen MODELLED; optionale Voreinstellungen für Xona Pulsar,
Iridium, Starlink, CentiSpace, ein repräsentatives C-Band-System, ATOMIC und Celeste IOD; siehe
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); das Trio **fusionierte MEO- + LEO-
PNT** `leo-pvt` (Doppler-Positionierung aus der Entfernungsrate in niedriger Erdumlaufbahn (LEO), gemeinsame
Pseudoentfernungslösungen GNSS + LEO mit Intersystem-Biasen und die DOP gegenüber der Zahl der LEO-
Satelliten, Abdeckung in Polar- und Arktisregionen und LEO-Zeitübertragung nach UTC — über jede Konstellation,
mit optionalen Voreinstellungen wie Xona Pulsar, Iridium und Starlink-Gelegenheitssignalen; die
LEO-Doppler-Hüllkurve VALIDATED gegen veröffentlichte Iridium- und Xona-Zahlen), `leo-ppp`
(Konvergenz von Precise Point Positioning mit nur GNSS und mit LEO-Ergänzung, verglichen
mit Li et al. 2019) und `ntn-positioning` (5G-Positionierung in nichtterrestrischen Netzen aus der
Cramér-Rao-Schranke der Signalbandbreite), MODELLED abgesehen von jener Hüllkurve, siehe
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (ein LEO-PNT-System durch-
gängig: ein `leo-signal`-Entwurf, getragen von einem `leo-pass`-Band, das C/N0 des Überflugs und der Entfernungsfehler des Signals
im Raum der Navigationsnachricht, übergeben an eine fusionierte `leo-pvt`-Lösung und `leo-ppp`-
Konvergenz, jede Übergabe aufgeführt; MODELLED, siehe
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), das auch die Übersicht über
jede LEO-PNT-Art und jedes LEO-PNT-Szenario ist, einschließlich der Resilienzkampagnen, ein Szenario je
Schwerpunktbereich der Experimente und eines je Endnutzer-Vertikale); die **lunare PNT-Suite** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; der **Demonstrator für quantengestützte PNT**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; und die
Forschungsarten für **Signalsicherheit, cislunaren Raum und geschichtete Resilienz** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — das Missionsanalyse-Trio und diese späteren Arten sind alle MODELLED
(jede mit einem validierten Kern in geschlossener Form; siehe die Matrix).
Gemeinsame Felder: `seed`, ein `[time]`-Raster, eine `[gnss]`-Verfügbarkeitszeitleiste (der Treiber
des Ausfalls) und Blöcke je Sensor mit `provenance`-Zeichenketten, die die Quelle jeder
Zahl nennen. Beispiel (Uhr):

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

Optionale Felder (aus, wenn nicht vorhanden): Eine Uhr kann `flicker_floor` hinzufügen (1/f-FM — Frequenz-
modulation — Allan-Boden); ein Inertialsensor kann `gyro_bias` und `q_arw` (Kreiselbias und Winkel-
Random-Walk) sowie `bias_instability` und `q_aa` (der Allan-Boden der Bias-Instabilität und das
Beschleunigungs-Random-Walk) hinzufügen — zusammen ein **einachsiges Fehlerbudget (1-DOF) für Beschleunigungs-
messer** (VRW/ARW — Geschwindigkeits-/Winkel-Random-Walk — und Bias-Instabilität). Dies ist das Fehlerbudget, das das mitgelieferte
`inertial`-Szenario*paket* ausführt. Getrennt davon enthält die Bibliothek jetzt einen verifizierten
**dreiachsigen Strapdown-Navigator** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
Quaternion-Lage mit Coning-/Sculling-Kompensation, eine vollständige NED-Mechanisierung
(Terme für Erdrate und Transportrate, Somigliana-Schwere nach WGS-84) und ein
deterministisches IMU-Fehlermodell, in dem **Skalenfaktor, Fehlausrichtung,
g-Empfindlichkeit, Quantisierung und Ratenrampe modelliert sind** (IEEE Std 952-1997, der IEEE-
Standard für Kreiselspezifikation und Prüfverfahren, §A.2; Groves 2013 §4.3). Dieser dreiachsige Pfad ist jetzt **in ein ausführbares
lose gekoppeltes GNSS/INS-Paket eingebunden** (`kind = "gnss-ins"`): Ein Fehlerzustands-EKF mit 15 Zuständen
führt die Strapdown-Lösung gegen verrauschte Lösungen, solange GNSS verfügbar ist, und
überbrückt dann den Ausfall, wobei es den fusionierten horizontalen Fehler gegenüber der
offenen freien INS-Fortführung meldet. Eine **eng gekoppelte Pseudoentfernungs**aktualisierung ist ebenfalls
verfügbar (sie bildet die Innovation im Entfernungsbereich und korrigiert daher weiter
mit weniger als vier Satelliten). Ein
Uhren-Holdover-Szenario kann `runs` (> 1) hinzufügen, um ein **Monte-Carlo-Ensemble** auszuführen — jedes
Gütemaß wird dann als Mittelwert mit einer Streuung vom 5. bis 95. Perzentil gemeldet, und das
Diagramm schattiert das Konfidenzband des Fehlers (siehe `scenarios/clock-ensemble.toml`).

Ein `fusion`-Szenario (dieselben Blöcke wie `hybrid`) führt **zwei unabhängige Kalman-Schätzer** aus
— einen für den Uhrenzustand, einen für den Positionszustand —, geführt durch GNSS und gestützt durch
optische Zeitübertragung, und meldet ein kombiniertes Holdover-Gütemaß. Die beiden Blöcke teilen keine
Kreuzkovarianz: Dies ist ein gestapeltes Paar von Fehlerbudgets, **kein** echter gekoppelter
gemeinsamer Filter für Uhr+Position (Kreuzkovarianz zwischen Blöcken steht auf der Roadmap). Siehe
`scenarios/fusion-pnt.toml`.

Ein `spoof`-Szenario bringt ein Zeit-Spoofing ein — eine von vier `[attack.shape]`-Arten
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; ein bloßes `rate_ns_per_s` wird weiterhin
als lineare Rampe akzeptiert) — und führt den Spoofing-Detektor jeder Uhr aus. Der Detektor ist ein
zweiseitiger **χ²₁-Energie- / Neyman–Pearson-Test** auf der uhrgestützten Monitorstatistik:
Die Schwelle wird aus einem Ziel-Fehlalarmbudget `target_pfa` gesetzt, und die
**Wahrscheinlichkeit verpasster Erkennung `P_md`** wird sowohl in geschlossener Form als auch per
Monte Carlo gemeldet (`mc_runs` Versuche je Hypothese — beide stimmen auf wenige ×1/√N überein). Das
**Sicherheitsgütemaß ist `1 − P_md`** bei der operativ schädlichen Größe (Spezifikation),
sodass eine ruhige Uhr, die ein spezifikationsgroßes Spoofing erkennt, ≈ 1 erreicht und eine verrauschte,
die es oft verpasst, weniger (siehe `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Ein `gnss-sim`-Szenario ist eine Simulation im **Messbereich**: Für jeden sichtbaren
Satelliten synthetisiert es die Pseudoentfernung `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` und den L1-Doppler, mit der **Klobuchar**-Einfrequenz-
Ionosphäre (`[iono]`, IS-GPS-200 §20.3.3.5.2.5) und der **Saastamoinen**-Zenit-
troposphäre, projiziert mit der Abbildungsfunktion nach **Niell (1996)** (`[tropo]`). Die
Residuen speisen **Snapshot-RAIM** für HPL/VPL je Epoche, und Pseudoentfernung, Doppler, C/N₀
sowie Iono-/Tropo-Korrekturen jedes Satelliten werden im JSON-Array
`gnss_measurements` ausgegeben. Es ist ein Vorwärtssimulator (er erzeugt Messungen aus
einer bekannten Wahrheit), kein Empfänger/Löser — ein rauschfreier Lauf reproduziert Geometrie plus die
Korrekturen auf unter einen Millimeter (siehe `scenarios/gnss-sim-raim.toml`).

Ein `jamming`-Szenario modelliert HF-Störungen als **Linkbudget**: Ein `[jammer]`
(ECEF-Position, Sendeleistung `power_dbw`, Typ) erhöht das Stör-zu-Signal-Verhältnis an einem
`[receiver]`, der eine Walker-`[constellation]` beobachtet. Aus der Geometrie (Freiraum-
dämpfung und richtungsabhängiger Empfangsantennengewinn) berechnet es für jeden Satelliten
`J/S`, das **effektive C/N₀** über die Standard-Anti-Jam-Gleichung (Entspreizungs-
gewinn × der Spektraltrennfaktor `Q`; Kaplan & Hegarty §9.4) und
markiert den Verlust der Nachführung unter einer konfigurierbaren Nachführschwelle — und meldet ein
Gütemaß `availability_under_jamming`. Ein Breitbandstörer von 10 W in 1 km Entfernung
verwehrt dem Empfänger alles (J/S ≈ 72 dB); derselbe Störer in 100 km
beeinträchtigt nur die Verbindungen (siehe `scenarios/jamming-demo.toml`).

Ein `sweep`-Szenario führt eine **Abwägungsstudie** aus: Es variiert einen `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` oder `classical_q_wf`) von `start` bis `stop` über `steps`
Punkte auf einer `lin`- oder `log`-`scale`, hält eine `metric` (z. B. `holdover_s`) für beide
Uhren fest und zeichnet die beiden Kurven. Das Basisszenario steht unter `[base]` (siehe
`scenarios/sweep-clock-stability.toml`).

Ein `sweep-nd`-Szenario verallgemeinert dies auf **jedes Paket und beliebig viele Achsen**: Es
variiert gepunktete TOML-Schlüssel eines `[base]`-Szenarios (beliebiger `kind`) über das kartesische
Produkt der `[[axes]]`, führt jeden Rasterknoten erneut aus und hält `metrics` fest, angegeben als
gepunktete JSON-Pfade in das Ergebnis (z. B. `classical.fom.holdover_s`). Es funktioniert für
jedes Paket, weil es an der Grenze TOML/Ergebnis arbeitet; native Läufe werten
das Raster parallel aus (keine zusätzliche Abhängigkeit, wasm fällt auf sequenziell zurück), und die
Ausgabe ist deterministisch und zeilenweise geordnet (siehe `scenarios/sweep-nd-inertial.toml`).

Ein `orbit`-Szenario leitet die `[gnss]`-Zeitleiste aus der Geometrie ab, statt sie
zu verfassen — geben Sie eine `[user]`-Bahn, eine `[constellation]`, eine Elevationsmaske `mask_deg` und die beiden
Uhrenblöcke an. Es meldet außerdem die Positionsgenauigkeit aus der Satellitengeometrie; das
optionale `sigma_uere_m` (1-Sigma-Nutzeräquivalenter Entfernungsfehler, Voreinstellung 1 m) skaliert die
Positionsverdünnung der Genauigkeit zu einem Positions-Sigma. Die Nutzerbahn kann mit
`eccentricity` und `argp_deg` **exzentrisch** gemacht werden, und `j2 = true` fügt die säkulare Drift durch die Erd-
abplattung hinzu (siehe `scenarios/orbit-molniya.toml`). Die Konstellation kann stattdessen eine
**echte** sein: Geben Sie `[constellation]` einen `tle`-Block aus Zweizeilenelementsätzen, und die
Satelliten werden daraus eingelesen (siehe `scenarios/orbit-real-tle.toml`). Fügen Sie einen oder mehrere
`[[constellations]]`-Blöcke für **Multi-GNSS** hinzu (z. B. GPS + Galileo; siehe
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

Die Arten für **Alt-PNT ohne GPS** navigieren ganz ohne GNSS, indem sie eine gemessene Feld-
folge über einen Partikelfilter mit einer Karte abgleichen. Ein `gravity-map`-Szenario fliegt einen Kurs
durch ein Schwereanomaliefeld aus Kugelfunktionen und gewinnt ihn aus der Ablesung eines Kaltatom-
Gravimeters zurück (`scenarios/gps-denied-gravity-nav.toml`); ein `terrain-nav`-Szenario
tut dasselbe gegen ein SRTM-Höhenmodell (DEM) (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
und ein `combined-altpnt`-Szenario fusioniert **Schwere + IGRF-Magnetfeld + Gelände** in einem Filter
(`scenarios/combined-altpnt.toml`).

Ein `lunar-integrity`-Szenario bewertet **cislunare** PNT: Es führt einen ARAIM-Schutzpegeldurchlauf am lunaren Südpol
gegen einen LunaNet/LNIS-Relaissatz aus und meldet ehrlich die
Integritätslücke — ein lunares σ_URE von ~30 m treibt den Schutzpegel deutlich über eine Alarmgrenze von 50 m,
sodass der Dienst unter Integritätsregeln nach Art der Luftfahrt *nicht verfügbar* ist
(`scenarios/lunanet-araim.toml`).

Ein `lunar-time-offset`-Szenario meldet die **relativistische Uhrenrate Erde–Mond** — die
Grundlage einer Zeitskala der Lunaren Koordinatenzeit (LTC/TCL). Eine post-Newtonsche Identität aus ersten Prinzipien
summiert die Differenz der Eigenpotenziale (IAU-Geoidpotenzial `L_G` minus das Eigenpotenzial an der Mond-
oberfläche) und den kinetischen Term des Mondes (Doppler zweiter Ordnung) zu einer säkularen
Rate von ≈ 57 µs/Tag, angegeben mit dem veröffentlichten Band von 56–59 µs/Tag; es liefert außerdem den
aufgelaufenen Versatz LTC−TT über einen Horizont und ein Ensemble mit inverser Varianz (eine lunare
Papieruhr). **MODELLED** — die Kernzahl ist *referenzabhängig* (Erdgeoid
gegenüber lunarem Selenoid, Mittelungsfenster), weshalb ein Band gemeldet wird und keine einzelne zertifizierte
Zahl (`scenarios/lunar-time-offset.toml`).

Siehe `scenarios/` für mindestens ein ausgearbeitetes Beispiel jeder Art (92 Arten, 193 Szenariodateien
`.toml` + 1 Suite-Manifest — mehrere Arten liefern mehr als ein Beispiel). Nicht jede
Art hat eine nach ihr benannte Datei: `lunar-integrity` → `scenarios/lunanet-araim.toml` und
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` sind zwei von mehreren solchen.
Die verteilbaren Arten lassen sich jederzeit über die Fehlermeldungen von `cargo run -- --validate <file>`,
das Python-`list_kinds()` oder das MCP-Werkzeug `list_scenario_kinds` auflisten.

</details>

<details>
<summary>Ausgabe</summary>

### Ausgabe

Das Ergebnisartefakt ist versioniertes, selbstbeschreibendes JSON: Zeitreihen je Schritt, die
bewerteten Gütemaße, die aktiven Modellspezifikationen (mit Herkunft), der Seed, ein
**Szenario-Hash** — sodass jedes Diagramm aus der Datei reproduziert werden kann — und für jede Uhr
eine `adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): die überlappende
Allan-Abweichung über oktavgestufte Mittelungszeiten — die übliche Art, die Stabilität einer Uhr
zu lesen — jetzt mit einem **rauschtypspezifischen 95-%-Konfidenzband** je Punkt (der Potenzgesetztyp
der Aufzeichnung wird aus ihrer modifizierten Allan-Steigung bestimmt, und das χ²-Intervall verwendet die
passenden effektiven Freiheitsgrade nach NIST SP 1065). Der Browser-Playground stellt es als
doppelt logarithmisches Diagramm „Clock stability (ADEV)“ dar. (MDEV, TDEV und HDEV sind als Bibliotheks-
schätzer verfügbar; die exportierte Ergebniskurve ist die überlappende ADEV.) Jedes Feld ist mit Einheiten und einem
Quellverweis in [`docs/SCHEMA.md`](docs/SCHEMA.md) dokumentiert.

**Jedes Diagramm beschreibt sich selbst.** Der Browser-Playground, der CLI-Export `*.chart.svg`
und die Scorecard in HTML (HyperText Markup Language) versehen jedes Diagrammbild mit einer Fußzeile
`Kshana v<version> · scenario <hash> · kshana.dev`. Das `scenario <hash>` sind die ersten
12 Hexadezimalzeichen des **Szenario-Hash** des Laufs — ein SHA-256-Digest (der 256-Bit-Secure-Hash-Algorithm) über die kanonische Szenario-
definition (Seed, Schwellen, Modellparameter, GNSS-Fenster, …); die Integritäts- und Mond-
berichte, die keinen eigenen Hash tragen, greifen auf einen SHA-256 der Szenarioquelle zurück.
Es ist **derselbe Fingerabdruck**, der in der einzeiligen Zusammenfassung und im Ergebnis-JSON erscheint, sodass ein
gespeichertes oder eingefügtes Diagramm immer seine Version, das genaue Szenario, das es erzeugt hat (für
Bit-für-Bit-Reproduktion), und die Quelle trägt — ändern Sie eine Eingabe, ändert sich der Hash.

Die Gütemaße folgen den üblichen operativen PNT-Gütemaßen:

| Gütemaß | Wie Kshana es berechnet |
|-----------------|------------------------|
| Zeitgebungsleistung (Uhren-/Bahnpakete) | RMS + 95. Perzentil des Uhrenphasenfehlers über den Ausfall, in **Nanosekunden** (`timing_rms_ns`) — eine Zeitgebungsmetrik, keine Position |
| Positionierungsleistung (Inertial-/Hybridpakete) | RMS + 95. Perzentil des 1-DOF-Positionsfehlers über den Ausfall, in **Metern** (`pos_rms_m`); einachsig. Ein einzelner Lauf wird mit `monte_carlo: false` markiert; setzen Sie `runs = N` für ein Monte-Carlo-Ensemble, das Mittelwert, Streuung und Bootstrap-95-%-KI (Konfidenzintervall) jeder Metrik meldet. Weiterhin **kein** 2-D-CEP/2DRMS (Circular Error Probable / doppelter Abstand des quadratischen Mittels) oder DOP-gewichtete Genauigkeit (diese brauchen das dreiachsige Modell — Roadmap) |
| Autonomie | Holdover-Dauer — Zeit innerhalb der Spezifikation nach GNSS-Verlust (rasterquantisiert: eine Untergrenze) |
| Resilienz | Steigung des Fehlerwachstums während des Ausfalls |
| Verfügbarkeit | Anteil des Laufs mit einer Lösung innerhalb der Spezifikation |
| Integrität | **Selbstkonsistenz** des Filters — Anteil der Ausfallabtastwerte, deren Fehler innerhalb der eigenen k-Sigma-Schranke des Kalman-Filters bleibt. **Keine** HPL/VPL/RAIM-Integritätszahl der Luftfahrt (siehe [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Sicherheit | **analytische Schranke der Spoofing-*Erkennbarkeit*** aus der Uhrenstabilität — wie klein/langsam ein Zeit-Spoofing sein kann, das ein Konsistenzmonitor mit einer Uhr noch markieren könnte. Nur mit einem konfigurierten Angriff aussagekräftig; **kein** RAIM-Detektor über mehrere Satelliten |

Neu bei diesen Begriffen? Jeder ist im [Glossar](docs/GLOSSARY.md) allgemeinverständlich erklärt.

</details>

<details>
<summary>Aufbau des Repositorys</summary>

### Aufbau des Repositorys

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
<summary>FAQ (häufig gestellte Fragen)</summary>

### FAQ

**Muss ich Quantenphysik verstehen, um das zu nutzen?**
Nein. Wenn Sie eine Befehlszeile bedienen können, können Sie Kshana ausführen. Beginnen Sie mit der
[allgemeinverständlichen Einführung](docs/CONCEPTS.md); schlagen Sie Begriffe im [Glossar](docs/GLOSSARY.md) nach.

**Ist das ein Entwurf von Quantenhardware oder Flugsoftware?**
Nein. Es ist ein Leistungs*simulator*. Die Treue zur Quantenhardware stammt aus veröffentlichten
Fehlermodellen, nicht aus diesem Werkzeug. Siehe [Was es ist / nicht ist](#what-it-is--is-not).

**Sind die Quantenergebnisse realistisch oder Marketing?**
Jeder Parameter ist mit einem Datenblatt oder einer Arbeit belegt, jedes Modell ist gegen eine
Lehrbuchbeziehung validiert, und die Reife ist ehrlich gekennzeichnet in
[VALIDATION.md](docs/VALIDATION.md) — einschließlich dessen, dass keine optische Strontiumuhr
geflogen ist. Die Engine ist neutral: Quanten und klassisch sind derselbe Code mit unterschiedlichen
veröffentlichten Zahlen.

**Kann ich mich darauf verlassen, dass zwei Läufe übereinstimmen?**
Ja — Läufe sind deterministisch: `scenario + seed + engine version → bit-identical output`,
durchgesetzt durch `scripts/check-reproducible.sh`.

**Kann ich es aus Python oder im Browser verwenden?**
Ja — siehe [Installation](#install): Die Beispiele für Python und WebAssembly stehen darunter. Beide rufen dieselbe Engine auf.

**Wie modelliere ich meinen eigenen Sensor?**
Schreiben Sie eine Szenariodatei `.toml` mit den veröffentlichten Zahlen Ihres Sensors in den `provenance`-
Feldern. Siehe [Szenarioformat](#scenario-format) und die Beispiele in `scenarios/`.

**Ist es für kommerzielle Nutzung kostenlos?**
Ja — unter der AGPL-3.0, auch in kommerziellen Umgebungen, solange Sie das Copyleft
der AGPL einhalten (insbesondere: Wenn Sie Kshana ändern und über ein Netzwerk anbieten, müssen Sie
diesen Nutzern Ihren geänderten Quellcode anbieten). Wenn das für Sie nicht passt — z. B. weil Sie
Kshana in ein proprietäres Produkt einbetten oder einen geschlossenen Netzwerkdienst betreiben müssen —, ist eine kommerzielle
Lizenz bei Ashforde® OÜ erhältlich; siehe [`LICENSING.md`](LICENSING.md) und
[Unterstützung](#support--professional-services).

</details>

<details>
<summary>Fehlerbehebung</summary>

### Fehlerbehebung

**`cargo build` schlägt mit einer alten Toolchain fehl.** Kshana braucht Rust ≥ 1.88. Aktualisieren Sie mit
`rustup update`.

**Das Bauen der Python-Erweiterung scheitert unter macOS beim Linken** (`Undefined symbols … _Py…`).
Eine Python-Erweiterung löst ihre Symbole zur Ladezeit auf. `maturin` setzt das richtige Linker-
Flag automatisch — verwenden Sie `maturin develop --features python` statt eines bloßen
`cargo build`.

**Der Python-Build beklagt, der Interpreter sei neuer, als PyO3 kennt.** Setzen Sie
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (abi3-Wheels sind über
CPython-Versionen hinweg vorwärtskompatibel).

**Der WebAssembly-Build findet das Target nicht.** Installieren Sie es einmal mit
`rustup target add wasm32-unknown-unknown`, dann `wasm-pack build --target web -- --features wasm`.

**Wo ist meine Ausgabe geblieben?** Jeder Lauf schreibt `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` und `<scenario>.report.json` neben
die Eingabe-`.toml` und
`<scenario>.table.csv` ebenfalls für die Arten, die eine Tabelle veröffentlichen. Alle werden
absichtlich von git ignoriert.

</details>

<details>
<summary>Versionierung und Releases</summary>

### Versionierung und Releases

Kshana folgt [Semantic Versioning](https://semver.org). Vor 1.0 kann sich das öffentliche
Szenario-/Ergebnisschema noch ändern; inkompatible Änderungen werden im
[`CHANGELOG.md`](CHANGELOG.md) ausdrücklich genannt. Jedes Ergebnis ist reproduzierbar aus
`scenario + seed + engine version`.

**Jeder Tag `vX.Y.Z` veröffentlicht alle Kanäle automatisch, in einer festen Reihenfolge** — die vollständige
Testsuite läuft zuerst auf dem getaggten Commit, nichts wird veröffentlicht, bevor sie besteht, und
danach prüft die Pipeline, dass jede Registry die neue Version wirklich ausliefert
([`docs/RELEASING.md`](docs/RELEASING.md)). Die Kanäle:

| Kanal | Installieren / beziehen | Inhalt |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | Rust-Bibliothek + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | der MCP-Server |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | abi3-Wheels (Linux/macOS/Windows) + sdist (Quelldistribution) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | WebAssembly-Modul + JS-Hülle |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | Multi-Arch-Image nach OCI (Open Container Initiative) — keine Toolchain nötig |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | Starter: lädt das Release-Binary herunter, verifiziert `SHA256SUMS`, führt es aus |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | derselbe Starter für Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | das Binary `kshana-mcp`, erzeugt aus den `SHA256SUMS` jedes Releases |
| Claude Desktop | Doppelklick auf `kshana-mcp-<target>.mcpb` aus dem Release | die Erweiterung, mit dem Binary darin |
| offizielle MCP-Registry | von MCP-Clients automatisch gefunden | `io.github.ashfordeOU/kshana-mcp` (OCI-Image, npm- und PyPI-Pakete) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → nach „Kshana“ suchen | das IDE-Plugin **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | herunterladen | das Befehlszeilen-Binary `kshana` für Linux x86-64, macOS (Apple silicon und Intel) und Windows x86-64, das Binary `kshana-mcp` für jedes dieser Systeme und Linux Arm, eine `.mcpb`-Erweiterung für Claude Desktop je System, eine CycloneDX-**SBOM**, **SLSA**-Build-Provenienz, eine HTML-Validierungszusammenfassung und eine Prüfsummendatei `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | ein zitierbares Archiv jedes Releases |
| [kshana.dev](https://kshana.dev) | im Browser öffnen | Kshana Studio, die WebAssembly-App im Browser, aus jedem Release-Tag neu gebaut (sodass die angezeigte Version die ausgeführte Version ist) |

Die Version von Crate / Image / Registry des MCP-Servers folgt der Engine (er bündelt die
Bibliothek); das JetBrains-Plugin wird unabhängig versioniert (es ruft Ihr installiertes
Binary `kshana` auf).

</details>

<details>
<summary>Roadmap</summary>

### Roadmap

Siehe [`ROADMAP.md`](ROADMAP.md) für die Roadmap in Phasen, [`CHANGELOG.md`](CHANGELOG.md)
für die veröffentlichte Historie und [`docs/CAPABILITY.md`](docs/CAPABILITY.md) für die
Roadmap je Fähigkeit. Die Prioritätenfolge lautet: **zuerst Nachweise zu Zeitgebung und Holdover für
kritische Infrastruktur** (Telekom-Masken, längerer Holdover mit Alterung und Flicker-
rauschen, Einlesen gemessener Uhrendaten); **an zweiter Stelle die neutrale Abwägungsmethode Quanten- gegenüber klassisch**
(Ergebnisse als MODELLED gekennzeichnet, bis gemessene Daten eines Partners sie hochstufen); und
**Navigation am Mond / im cislunaren Raum und im Tiefraum wird gepflegt**, nicht als Schwerpunkt ausgebaut. Die **ITRF-genaue Reduktion des Bezugssystems** ist jetzt geliefert — die
vollständige CIO-basierte Kette IAU 2006/2000A GCRS↔ITRS (Polbewegung + Nutation unter einer Bogensekunde),
Bit für Bit gegen SOFA/ERFA validiert und unabhängig gegen ANISE
(reines Rust-SPICE) auf ≤ 3.6 m in GNSS-Bahnhöhe gegengeprüft. Kurzfristige Punkte umfassen eng gekoppelte Trägerphasenfusion und die Bereitstellung des
lose/eng gekoppelten GNSS/INS-Navigators in mehr Paketen; die Engine für **radiometrische Navigation im Tiefraum / am Mars**
kam in v0.17.0 (durch Simulation validiert). Die
**Quantenphysikschicht** ist ein Punkt **P2**: Der CAI-Beschleunigungsmesser wird jetzt aus
ersten Prinzipien simuliert (Mach–Zehnder-Phase, Projektionsrauschen, Kontrastabfall, Vibrations-
kopplung), während die Sensoren für Uhren/Zeitübertragung weiterhin von veröffentlichten
Allan-/Rauschbudget-Koeffizienten gesteuert werden. TEME&harr;ECEF auf Basis der GMST, die IERS-
Zeitsysteme mit Schaltsekunden (UTC/TAI/TT/UT1), SGP4/SDP4-Bahnpropagation (v0.7.0,
gegen die Vektoren von AIAA 2006-6753 validiert) und das ausführbare Fusionspaket `gnss-ins`
wurden alle **ausgeliefert**, und die Inertialgeschwindigkeit wird nachgelagert bereitgestellt. Ein aktiver
stochastischer Zeit-Spoofing-Detektor (Neyman–Pearson / χ²₁-Energietest mit Monte-Carlo-
P_fa/P_md und einem Sicherheitsgütemaß von 1−P_md), ein Jamming-Modell über das Linkbudget (J/S → effektives
C/N₀ → Verlust der Nachführung), Verfügbarkeit über mehrere Konstellationen, ein einachsiges (1-DOF)
IMU-Fehlerbudget, zwei unabhängige Kalman-Schätzer (Uhr + Position), gemeldet als
kombiniertes Gütemaß, echte Konstellationsgeometrie aus TLEs, ein HTML-Scorecard-Bericht,
aus der Geometrie abgeleitete GNSS-Verfügbarkeit
*und* Verdünnung der Genauigkeit aus Kepler-Bahnen mit Exzentrizität und J2-Drift,
Monte-Carlo-Konfidenzbänder, Parametersweeps für Abwägungsstudien, ein WebAssembly-Playground im Browser
und optionale Bindungen für Python (PyO3) und WebAssembly (wasm-bindgen) sind
auf `main` gelandet.

</details>

<details>
<summary>Mitwirken</summary>

### Mitwirken

Siehe [`CONTRIBUTING.md`](CONTRIBUTING.md). Kurz: Die Tests bestehen (`cargo test`), die
beiden Wächterskripte bestehen, Conventional Commits und ein Eintrag `[Unreleased]` in `CHANGELOG.md`
für jede für Nutzer sichtbare Änderung. Die Mitwirkung regelt unser
[Verhaltenskodex](CODE_OF_CONDUCT.md). Um ein Sicherheitsproblem zu melden, siehe die
[Sicherheitsrichtlinie](SECURITY.md) — bitte eröffnen Sie für Schwachstellen kein öffentliches Issue.

</details>

<details>
<summary>Dokumentation: jedes Dokument, und für wen es ist</summary>

<a id="documentation"></a>
### Dokumentation

| Dokument | Für wen | Was darin steht |
|----------|----------|--------------|
| [Einführung in die Konzepte](docs/CONCEPTS.md) | alle, hier beginnen | was Kshana tut und warum, von null bis zur Physik |
| [Kshana Studio](web/README.md) | alle | die Engine im Browser ausführen (WebAssembly); Hinweise zu Build und Bereitstellung |
| [Glossar](docs/GLOSSARY.md) | alle | allgemeinverständliche Definitionen jedes Begriffs |
| [Szenarioarten](docs/KINDS.md) | alle | jede Art, die die Engine verteilt: was sie tut, ihre Felder, ein Beispielbefehl, ihre Registerzeilen und das Diagramm, das die Engine für sie schreibt |
| [Partnerdaten](docs/PARTNER-DATA.md) | Labore und Hersteller mit gemessenen Daten | welche MODELLED-Zeilen eine gemessene Uhren- oder IMU-Aufzeichnung hochstufen könnte, die Formate, wie eine Einreichung geprüft (`kshana partner check`), bewertet und angerechnet wird |
| [Architektur](docs/ARCHITECTURE.md) | Entwickler / Prüfer | Modulkarte, Engine-Pipeline, Verteilung und Diagramme |
| [Validierungsstatus](docs/VALIDATION.md) | Prüfer / Zitierende | was `validated` gegenüber `not modeled` ist, mit Nachweisen |
| [Verifikationsmatrix](docs/VERIFICATION-MATRIX.md) | Prüfer / Zitierende | das maschinell geprüfte Nachweisregister — jede Fähigkeitszeile mit Status, Modul, Test und externer Referenz, erzeugt aus `src/verification.rs` |
| [Begründung für Modelled](docs/MODELLED-RATIONALE.md) | Prüfer | warum jede **Modelled**-Zeile keine externe Referenz hat, Zeile für Zeile begründet |
| [Herkunft](docs/PROVENANCE.md) | Prüfer / Zitierende | jeder Sensorparameter, jedes Modell und jeder Datensatz, auf seine veröffentlichte Quelle zurückgeführt, in einer zitierbaren Tabelle |
| [Reproduzierbarkeit und Herkunft](docs/REPRODUCIBILITY.md) | Prüfer / Paketierer | Determinismusgarantien, Golden-Pinning, SBOM (Software-Stückliste), Build-Provenienz |
| [Plattform-Tags der Wheels](docs/WHEEL_TAGS.md) | Paketierer | die abi3-Python-Wheel-Matrix — welches Plattform-Tag `pip install kshana` auflöst |
| [Einordnung](docs/POSITIONING.md) | Evaluierende | wo Kshana gegenüber RTKLIB/gLAB steht (ergänzend), und die Browserstufe ohne Installation |
| [Kshana Pro](docs/PRO.md) | Evaluierende / Programmmanager | was die proprietäre Pro-Erweiterungsschicht über derselben Engine hinzufügt: Entwurfsoptimierer, Unsicherheit und Sensitivität, Missionsdossier, Kampagnenüberwachung, Spektrumskoexistenz, Auftragsdienst vor Ort, Rückverfolgbarkeit der Anforderungen; was jedes erzeugt und was es nicht tut |
| [Technischer Bericht](paper/kshana-technical-report.md) · [JOSS-Arbeit](paper/paper.md) | Prüfer / Zitierende / Evaluierende | die vollständige erweiterte Forschungsarbeit — Architektur, Modelle je Bereich, Validierung, Fallstudien und Grenzen — dazu die knappe Einreichung bei JOSS (Journal of Open Source Software) |
| [SGP4-Validierung](docs/SGP4-VALIDATION.md) | Prüfer / Zitierende | Übereinstimmung mit der Referenz AIAA 2006-6753 (666 Zustände, ~4 mm) **und** ein direkter Vergleich mit der unabhängigen Crate `sgp4` (Übereinstimmung unter einem Mikrometer / 4.12 mm) |
| [Validierung des Kraftmodells](docs/AGENCY-ORBIT-VALIDATION.md) | Prüfer / Zitierende | die Engine mit vollem Kraftmodell (`src/precise_od.rs`), angepasst an Ephemeriden von Raumfahrtagenturen — Methodik und validierte Residuen |
| [Anleitung zu echten TLEs](docs/REAL_TLE_GUIDE.md) | Nutzer | Szenarien aus echten Konstellations-TLEs von Celestrak / Space-Track steuern (gegenüber dem mitgelieferten synthetischen Walker-Satz) |
| [Integritäts-Gütemaß](docs/INTEGRITY.md) | Evaluierende | was die Zahlen `integrity` / `security` bedeuten — und was sie gegenüber HPL/VPL der Luftfahrt **nicht** sind |
| [ARAIM-Referenz](docs/ARAIM_REFERENCE.md) | Prüfer / Integratoren | die offene Implementierung des MHSS-ARAIM-Schutzpegels — die Nominal-Bias-Projektion `b_k`, σ_URA gegenüber σ_URE und die A-priori-Wahrscheinlichkeiten der Fehlermodi |
| [Quantenmodelle](docs/QUANTUM.md) · [Einzelheiten](docs/QUANTUM-MODELS.md) | Prüfer | die Physikschicht des Kaltatom-Interferometers, und wo Koeffizienten noch nachgeschlagen werden |
| [Compliance](docs/COMPLIANCE.md) | Evaluierende | Algorithmusumfang von DO-229E / DO-316, und was **keine** Konformitätsaussage ist |
| [Maritimes Vertrauen](docs/MARITIME-TRUST.md) | Seeleute / Integratoren | der GNSS-Vertrauenswert von 0-100 für das NMEA eines Schiffes, seine Monitore und seine Grenzen (beratend, keine typzugelassene Navigationsausrüstung) |
| [NMEA-Trainingsströme](docs/NMEA-TRAINING.md) | maritime Ausbilder | synthetisches Brücken-NMEA mit geskriptetem Jamming und Spoofing und einem Ausbilderprotokoll; nur Text, nie für Live-Navigation |
| [Störungskarte](docs/INTERFERENCE-MAP.md) | Analysten / Seeleute | wo Flugzeuge und Schiffe beeinträchtigte Navigationsdaten meldeten, und wie viel einer Route davon berührt wird |
| [Nachweispakete](docs/EVIDENCE-PACKS.md) | Betreiber / Versicherer | signierte technische Aufzeichnungen eines Vertrauensereignisses und wie man eine verifiziert |
| [Vertrauenstelemetrie](docs/TRUST-TELEMETRY.md) | Betriebs- / Sicherheitsteams | der Vertrauensstrom als Prometheus-Metriken, SIEM-Ereignisse und OpenTelemetry, mit einem Grafana-Dashboard |
| [Marine-Integrationen](docs/MARINE-INTEGRATIONS.md) | Bootseigner / Integratoren | das Signal-K-Plugin, der Gate-Modus von OpenCPN und der Referenzaufbau |
| [Prüfstand](docs/TEST-BENCH.md) | Empfängerhersteller | ein exportiertes Szenario über einen Laborsimulator abspielen und das Empfängerprotokoll bewerten |
| [Compliance-Zuordnung](docs/compliance/README.md) | Evaluierende | öffentliche Resilienz-Rahmenwerke, Kshana-Ausgaben zugeordnet, mit Quellen und Lücken; `kshana compliance-report` |
| [Notebooks](notebooks/README.md) | Nutzer | ausführbare Tutorials mit ihrem gerenderten Text |
| [Normen und Interoperabilität](docs/STANDARDS.md) | Integratoren | die Austauschformate für GNSS / Flugdynamik / Agenturen, die Kshana liest und schreibt (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [LEO-PNT-Fusion](docs/LEO-PNT-FUSION.md) | Nutzer / Evaluierende | fusionierte MEO- + LEO-Positionierung, -Navigation und -Zeitgebung: Doppler, gemeinsame Pseudoentfernung, PPP-Konvergenz, 5G NTN, Polarabdeckung und LEO-Zeitübertragung über jede Konstellation; die optionalen Voreinstellungen und ihre öffentlichen Quellen |
| [Kampagnen](docs/CAMPAIGNS.md) | Nutzer / Evaluierende | Szenarien zusammensetzen: verkettete Missionszeitleisten, Parametersweeps, Monte-Carlo-Ensembles und Läufe unter gemeinsamer Bedingung, mit den Zusammensetzungsidentitäten, die die Tests festschreiben |
| [Szenariokatalog](docs/SCENARIOS.md) | Nutzer / Integratoren | jede verteilbare Art mit ihren Pflicht- und optionalen TOML-Feldern — erzeugt aus `api::list_scenario_kinds()` |
| [Ergebnisschema](docs/SCHEMA.md) | Integratoren | jedes Feld des Ergebnis-JSON, mit Einheiten und einem Quellverweis |
| [Python-API](docs/PYTHON_API.md) | Python-Nutzer | die PyO3-Bindungsoberfläche — Aufruf der Engine, die Szenario-/Ergebnistypen und Beispiele |
| [Behauptungen und Wirklichkeit](docs/CLAIMS-VS-REALITY.md) | Prüfer | das Register zur Schließung überzogener Behauptungen + der CI-Wächter (`tests/no_overclaims.rs`), der es aufgelöst hält |
| [Roadmap](ROADMAP.md) | alle | die Roadmap in Phasen — was ausgeliefert ist und was als Nächstes kommt |
| [MCP-Server](mcp/kshana-mcp/README.md) · [JetBrains-Plugin](ide/jetbrains/README.md) | Agenten / IDE-Nutzer | Kshana aus einem KI-Assistenten oder einer JetBrains-IDE ausführen |
| [Leitfaden für Agenten](docs/AGENTS.md) · [Oberflächen](docs/SURFACES.md) | Agenten / Integratoren | welches Werkzeug welche Frage beantwortet, was zu jeder Antwort aufzubewahren ist; wo jede Fähigkeit erreichbar ist (CLI, Rust, Python, WASM, MCP, Plugin, JetBrains, Notebooks) und warum eine Zelle N/A ist |
| [Changelog](CHANGELOG.md) | alle | veröffentlichte Historie (Keep a Changelog + SemVer, Semantic Versioning) |
| [Mitwirken](CONTRIBUTING.md) | Mitwirkende | Build, Wächter, Disziplin bei Tests/Zitaten, DCO (Developer Certificate of Origin) |
| [Governance](GOVERNANCE.md) | Mitwirkende / Gemeinschaft | wie Kshana gesteuert wird — wer entscheidet, wie, und die Grenze zwischen offen und geschlossen |
| [Verhaltenskodex](CODE_OF_CONDUCT.md) | Gemeinschaft | erwartetes Verhalten (Contributor Covenant) |
| [Sicherheitsrichtlinie](SECURITY.md) | Meldende | wie man eine Schwachstelle meldet; Hinweis zu doppeltem Verwendungszweck |

</details>

<details>
<summary>Wichtige Quellen</summary>

### Wichtige Quellen

**Validierungsreferenzen und Normen** — die externen Instanzen, an denen die Prüfungen von Kshana verankert sind:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [Testdaten](https://celestrak.org/publications/AIAA/2006-6753/)): der SGP4/SDP4-Verifikationssatz, den Kshana auf 4.12 mm trifft, und die ausgearbeiteten Bezugssystembeispiele, gegen die die Kette TEME→ITRF geprüft wird.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — die Referenzroutinen für Zeit und Bezugssysteme, gegen die die IAU-2000A-Nutation und die CIO-Reduktion GCRS↔ITRS Bit für Bit validiert sind.
- Petit & Luzum (Hrsg.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (Normen zu Erdorientierung, Polbewegung und Bezugssystemen).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (Beziehungen der Allan-Abweichung und die Referenzreihe NBS14; NBS = das frühere US National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): die Referenzimplementierungen für ROC/AUC, Konfusionsmatrix und Präzision/Recall/F1, mit denen die Testumgebung zur Evaluierung von HF-Beeinträchtigungen exakt übereinstimmt (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` und `linalg.expm` — die Referenzroutinen, gegen die die NNLS-Anpassung gemessener ADEV in der Quantenabwägung, die χ²-Konsistenzbänder und die van-Loan-Prozessrauschkovarianz der Uhr validiert sind (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): sowohl als offener Stand der Technik verwendet (siehe *Vergleich und offener Stand der Technik* unten) als auch als **unabhängige DOP-Referenz**, mit der die Berechnung von GDOP/PDOP/HDOP/VDOP/TDOP auf 1e-6 übereinstimmt (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): die Kraftmodelle hinter der Kraftmodellanpassung an präzise Ephemeriden von Raumfahrtagenturen.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (die Halo-/NRHO-Familien, die der differenzielle CR3BP-Korrektor reproduziert).

**Geräte- und Methodenphysik** — die zitierten Quellen hinter den Sensormodellen:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (optische Strontium-Gitteruhr, auf den Weltraum ausgerichtetes Ziel).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (Sr-Laboruhr, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (hybride Quanten-Beschleunigungsmessertriade).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [Tutorial der IEEE AESS (Aerospace and Electronic Systems Society) (Discovery-Repository des University College London)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (Fehlerwachstum der Koppelnavigation).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (optische Zweiweg-Zeit-Frequenz-Übertragung; die optische Intersatellitenverbindung modelliert ihr Budget der Nichtreziprozität nach diesen).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (die Theorie der BOC-Modulation und der Spektraltrennung hinter `src/navsignal.rs`).
- Kaplan & Hegarty (Hrsg.) — *Understanding GPS/GNSS: Principles and Applications* (3. Aufl., Artech House, 2017): die Anti-Jam-Gleichung für das effektive C/N₀ und der thermische Rauschjitter der Early-Late-DLL-Codenachführung, die die Navigationssignal- und Jamming-Modelle verwenden.

**Vergleich und offener Stand der Technik** — die Werkzeuge und Übersichten, gegenüber denen Kshana eingeordnet wird:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (die Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): die Parameter der Spoofing-Testbatterie, gegen die der mehrschichtige Detektor charakterisiert wird.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): die offenen, validierten Fehlerprofile der Inertialnavigation, die als klassische Basislinie dienen.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): offener Simulator für lunare PNT.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): offene GNSS-Datenanalyse.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): reduziert-dynamische Bahnbestimmung von GRAIL, der Boden der empirischen Beschleunigung, den die LRO-Anpassung reproduziert.

</details>
