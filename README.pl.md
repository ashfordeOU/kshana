> To jest tłumaczenie maszynowe pliku README.md w wersji v0.40.0, którego żaden rodzimy użytkownik języka jeszcze nie zweryfikował; wzorcem jest angielskie README. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: znak, siatka celownicza kompasu wskazująca dokładną chwilę, obok logotypu kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>dokładna chwila</em></strong><br>
  Otwartoźródłowy symulator odporności PNT (pozycjonowania, nawigacji i synchronizacji czasu).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Stan ciągłej integracji na gałęzi main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Pokrycie wierszy bliskie 95 % katalogu src/, zmierzone w docs/COVERAGE.md i wymagane na poziomie 85 % w ciągłej integracji"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 z 401 możliwości VALIDATED względem niezależnej zewnętrznej wyroczni, według macierzy weryfikacji"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Stan bramki jakości SonarQube Cloud"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Wydanie v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Angielski i 17 innych języków, tłumaczenie maszynowe"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Licencja: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, rekord koncepcyjny Zenodo każdego wydania"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Licencja komercyjna jest dostępna od Ashforde® OÜ, zob. Edycje"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana na crates.io, bieżąca opublikowana wersja"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana na PyPI, bieżąca opublikowana wersja"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana na npm, bieżąca opublikowana wersja"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Otwórz Kshana Studio</a> ·
  <a href="#install">Instalacja</a> ·
  <a href="#capabilities">Możliwości</a> ·
  <a href="#evidence">Dowody</a> ·
  <a href="#research">Badania</a> ·
  <a href="docs/CONCEPTS.md">Dokumentacja</a> ·
  <a href="#cite">Cytowanie</a>
</p>

<p align="center">
  <strong>Języki:</strong> <a href="README.md">English</a> ·
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
  <sub>Wiersz poleceń, podsumowania przebiegów, wykresy i raporty mówią każdym z tych języków z <code>--lang &lt;tag&gt;</code>
  (na przykład <code>kshana scenarios/holdover-test-example.toml --lang de</code>), podobnie jak interfejsy Python, WebAssembly i MCP.
  Są to tłumaczenia maszynowe, których żaden rodzimy użytkownik języka jeszcze nie zweryfikował; wzorcem jest angielski.
  Zob. <a href="docs/i18n.md">Lokalizacja</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Przećwicz minutę, w której GNSS gaśnie. Konsola misji Kshana, narysowana z prawdziwego przebiegu silnika v0.40.0: łańcuchowa kampania campaign-jam-spoof-holdover-integrity (ziarno 20260928, 6 faz, 18 przebiegów składowych w czasie T+01:16:10) oraz 102 satelity GPS, Galileo, BeiDou i GLONASS z constellation-multi-gnss-coverage, każdy narysowany na kołowej orbicie dwóch ciał odtworzonej ze śladu naziemnego silnika, z promieniami skompresowanymi do wyświetlenia. Błąd czasu zegara osiąga szczyt 62.7 ns wobec progu ochronnego 50 ns, gęstość stosunku nośnej do szumu spada do -12.2 dB-Hz wobec dolnej granicy 25 dB-Hz, a pionowy poziom ochrony osiąga 135.4 m wobec granicy alarmowej 50 m." width="100%">
</picture>

<details>
<summary><strong>Spis treści</strong></summary>

- [Przećwicz minutę, w której GNSS gaśnie](#rehearse-the-minute-gnss-goes-dark)
- [Nowości w 0.40](#whats-new-in-040), [Nowości w 0.39](#whats-new-in-039), [Nowości w 0.38](#whats-new-in-038) oraz [0.38 szczegółowo](#038-in-depth): ocena Jammertest, własne flagi odbiornika, dane wejściowe z urządzeń, synchronizacja czasu i holdover, pakiety norm, LunaNet AFS, laboratoryjna pętla zwrotna, kshana-bench, obserwatorium, eksportery, optyka, [nawigacja użytkownika w przestrzeni kosmicznej](#space-user-navigation-gnss-ssv) i [infrastruktura księżycowa](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) i każda strona Studio
- [Możliwości](#capabilities): tabela obszarów, [każdy rodzaj scenariusza według rodziny](#every-scenario-kind-by-family), [każde polecenie](#every-command), [każdy interfejs](#every-surface)
- [Jak działa przebieg](#how-a-run-works), [Misje](#missions)
- [Dowody](#evidence): rejestr, [domeny możliwości](#capability-domains)
- [Instalacja](#install), [Architektura](#architecture) (oraz [diagramy](#diagrams)), [Asystent AI](#ai-assistant)
- [Edycje](#editions), [Badania](#research), [Cytowanie](#cite), [Licencja](#licence)
- [Dokumentacja referencyjna](#reference): użycie, format scenariusza, wyniki, układ repozytorium, FAQ, rozwiązywanie problemów, wersjonowanie, plan rozwoju, współtworzenie, dokumentacja

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Przećwicz minutę, w której GNSS gaśnie

Kshana odtwarza zagłuszanie, spoofing i holdover zegara, gdy zawodzą sygnały GNSS (Global Navigation Satellite
System), i mówi, jak długo system utrzymuje czas i pozycję w granicach swojego
budżetu oraz który zegar lub czujnik daje największy zapas. To jeden silnik w języku Rust. Działa w
terminalu, w notatniku, w IDE (zintegrowanym środowisku programistycznym), w asystencie AI (sztucznej
inteligencji) lub w przeglądarce.

Każdy przebieg jest odtwarzalny bit w bit na podstawie scenariusza, ziarna i wersji silnika.
Każda możliwość nosi jedną z trzech etykiet w rejestrze sprawdzanym maszynowo: **VALIDATED** (niezależna
zewnętrzna wyrocznia się zgadza), **MODELLED** (wewnętrznie spójne i powiedziane wprost)
lub **PARTNER** (należy do partnera sprzętowego).

> **Stan: v0.40.0.** Zwalidowane, odtwarzalne podłoże symulacyjne dla odporności PNT.
> Synchronizacja czasu i holdover są na pierwszym miejscu, ponieważ ta domena jest zwalidowana najlepiej. Kshana jest
> narzędziem do badań i analizy kompromisów: nie jest sprzętowym generatorem sygnałów radiowych (RF) (nie
> steruje żadnym radiem i niczego nie nadaje; jej wyjście na poziomie sygnału to pliki próbek IQ w paśmie podstawowym
> dla odbiorników programowych), nie jest sprzętowym ani certyfikowanym odbiornikiem GNSS (jej odbiornik programowy
> jest narzędziem analitycznym) i nie jest produktem lotnym. Nowy w tej dziedzinie? Zacznij od
> [wprowadzenia prostym językiem](docs/CONCEPTS.md) i [słownika](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Nowości w 0.40

0.40 dodaje budżet błędu na poziomie misji, oznacza każdy wykres i tabelę poziomem dowodowym, czyta zmierzone dzienniki zegarów,
sprawdza zgłoszenia partnerów danych, szacuje, gdzie może znajdować się źródło zakłóceń, i mówi siedemnastoma językami obok angielskiego.
Rejestr liczy teraz 401 wierszy: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Żaden wiersz nie został podniesiony do VALIDATED, a każde chybienie poniżej jest
utrwalone testem.

- **Wątek misji.** Rodzaj `mission-thread` łączy w łańcuch fazy od startu do wejścia w atmosferę (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` i cztery rodzaje księżycowe) z podanymi regułami przekazania, zapasem względem podanych wymagań i najsłabszym
  ogniwem; przykład end-to-end klasy Artemis obejmujący 11 faz (segmenty ziemski i księżycowy), łącznie 92 rodzaje scenariuszy. Każda liczba jest MODELLED. Propagacja cislunarna względem publicznej trajektorii Artemis I
  **nie osiąga** swojego progu ustalonego z góry (45.3 km i 0.25 m/s wobec 5 km i 0.05 m/s; przyczyną są małe manewry, których model nie uwzględnia), a propagator księżycowy względem orbity CAPSTONE
  **nie osiąga** progu (136.8 km wobec 25 km na końcu jednego obiegu); porównanie z LRO jest spełnione. Wiersze pozostają MODELLED
  ([Wątek misji](docs/MISSION-THREAD.md), [segment księżycowy](docs/MISSION-THREAD-LUNAR.md)). W Studio wątek jest czytany pod `/studio/mission-thread/`.
- **Etykiety dowodowe.** Każdy wykres i tabela zapisane przez przebieg niosą poziom i identyfikatory wierszy rejestru, na których się opierają, odczytane z macierzy.
- **Zmierzone zegary.** Czytanych jest osiem formatów dzienników zegarów ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)), a dopasowany
  szereg może sterować holdover. Względem progów ustalonych z góry dopasowanie **nie osiąga** F1(a) w pięciu z sześciu zapisów i F2 w jednym; oba
  pozostają MODELLED ([Dziennik zmian](CHANGELOG.md#0400---2026-10-29)).
- **Partnerzy danych.** `kshana partner check` sprawdza format zgłoszenia i niczego nie ocenia ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Region źródła zakłóceń.** `kshana interference-map locate` podaje region i elipsę, nigdy sam punkt, na podstawie raportów ADS-B lub AIS.
  Porównany raz z lokalizacjami nadajników Jammertest 2025 wynik jest **NOT ASSESSABLE** dla obu źródeł (zbyt mało
  zaplanowanych sesji w otwartych danych), więc wiersz pozostaje MODELLED ([Mapa zakłóceń](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Benchmark.** Ponowna kampania 0.40 spełnia A3, D3 (oba EXPLORATORY), R3 i R4; A2, D1 i R1 pozostają NOT MET ([Bench](docs/BENCH.md)).
- **Języki.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja i zh-Hans, jako **tłumaczenia maszynowe, których żaden rodzimy
  użytkownik języka nie zweryfikował**; wzorcem jest angielski, a przebiegi w innych językach niż angielski trwają około dwa razy dłużej
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Nowości w 0.39

0.39 nie dodaje żadnej funkcji i nie zmienia żadnego wyniku; wyjście silnika jest wyjściem 0.38. Naprawia jedną rzecz
w wierszu poleceń, aktualizuje zależności narzędzi walidacji krzyżowej i podaje werdykty benchmarku
w pełni.

- **Wiersz poleceń.** `kshana kinds | head` (dowolne zamknięte standardowe wyjście) nie powoduje już paniki: program kończy działanie
  cicho ze statusem 141, jak inne narzędzia przy zamkniętym potoku. Inne błędy zapisu nadal są zgłaszane.
- **Zależności.** `memmap2` 0.9.11 w dwóch plikach blokad kontroli krzyżowej ANISE oraz `pillow` 13.0.0 i
  `certifi` 2026.10.19 w przypiętych wersjach środowiska wyroczni, wszystko w `xval/`: nic z tego, co jest dostarczane, się nie zmieniło.
- **kshana-bench, wszystkie werdykty.** Względem progów ustalonych z góry trzy są NOT MET, każdy utrwalony testem:
  A2 (`agc_k_sigma` AUC 0.766 wobec co najmniej 0.80), D1 (największa luka 0.0301) i zadanie (b) R1 (przeniesione,
  nie uruchomione ponownie). Żaden próg nie został poluzowany ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Nowości w 0.38

0.38 czyni neutralnego arbitra mierzalnym: ocenia dzienniki odbiorników względem opublikowanego harmonogramu
testów, czyta więcej odbiorników i czujników, testuje systemy synchronizacji czasu oraz dostarcza benchmark i
obserwatorium zakłóceń. Pozostaje doradczy: nic tutaj nie jest certyfikowane, żaden wynik nie jest zatwierdzeniem typu
i nic nie nadaje. Każdy wiersz podaje, co rejestr dla niego zawiera ([jak zdobywa się etykietę](#evidence));
status wymienia tylko to, co zostało sprawdzone, a wiersz rejestru i podlinkowana strona mówią, czego nie sprawdzono.

| Nowość w 0.38 | Co robi i dlaczego | Status w rejestrze | Czytaj |
|---|---|---|---|
| **Ocena Jammertest** | `kshana jammertest import` czyta opublikowany katalog testów NPRA i plan nadawania jako zaplanowaną prawdę; `jammertest score` ocenia dziennik odbiornika dla każdego testu (opóźnienie wykrycia, pominięte alarmy, fałszywe alarmy, czas powrotu), jako podpisany pakiet dowodowy, jeśli podasz klucz | **MODELLED**: jeden wiersz rejestru. Progi zostały wstępnie zarejestrowane przed jakimkolwiek ocenianym przebiegiem; na danych JammerTest 2024 reguła minimalnej ilości danych nie została spełniona w obu przebiegach (4 i 7 ocenialnych okien wobec wymaganych 10), więc **żaden próg nie jest oceniany** i niczego się nie twierdzi | [Jammertest](docs/JAMMERTEST.md) |
| **Własne flagi odbiornika** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG i NovAtel RXSTATUS wczytywane do `self_report` dla każdej epoki i porównywane z alarmami Kshana (oba, tylko odbiornik, tylko Kshana, żaden); czytnik Septentrio SBF i wejście `--serial` tylko do odczytu | **MODELLED**; zgodność między detektorem odbiornika a detektorem Kshana nie jest walidacją | [Zaufanie do odbiornika](docs/RECEIVER-TRUST.md) |
| **Więcej odbiorników i czujników** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (z tabel pyrtcm na licencji BSD, nie z tekstu RTCM), strumienie monitora GNSS-SDR, dziennik IMU jako drugi czujnik, pakiet ROS 2, most `gnss_lib_py` oraz `imu-fit` dla parametrów czujników hybrydowych | **MODELLED**: sześć wierszy rejestru; wyłącznie samodzielnie napisane dane testowe, nie wczytano żadnego zapisu z prawdziwego odbiornika, IMU, przebiegu GNSS-SDR ani grafu ROS | [Dane wejściowe z urządzeń](docs/MACHINE-INPUTS.md) |
| **Testy synchronizacji czasu i holdover** | rodzaj `holdover-test` ocenia test holdover (GNSS usunięty przez operatora, holdover, powrót) na podstawie zmierzonego zapisu błędu czasu względem masek ITU-T, „zmierzone względem maski”; czytniki dzienników linuxptp i chrony; etapy sprzętowe i pole `lab-attestation` | **MODELLED**: dwa wiersze rejestru; czasy są oświadczeniem operatora, niezweryfikowanym | [Timing HIL](docs/TIMING-HIL.md), [Bezpieczeństwo sprzętu](docs/HARDWARE-SAFETY.md) |
| **Pakiety norm, LunaNet AFS, laboratoryjna pętla zwrotna** | oceniane pakiety dla DHS RPCF, IMO MSC.1/Circ.1575 i ICAO Doc 9849 Appendix F względem progów podanych przed przebiegiem, „dostarcza dowodów dla” (supports evidence for); zestawienie NIST IR 8323r1; generator i weryfikator kodów LunaNet AFS; podpisany pakiet łączący scenariusz przebiegu laboratoryjnego, warunki testu, dziennik odbiornika i ocenę | **MODELLED** dla pakietów i pętli zwrotnej; sprawdzenie kodów AFS jest **VALIDATED** względem wydrukowanych kolumn kontrolnych (zob. wiersze rejestru) | [Normy](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench i obserwatorium** | ustalone zadania, podziały i metryki dla wykrywania zakłóceń, wykrywania IQ, przewidywania holdover i luki optymizmu, z zapieczętowanym zbiorem holdout i statyczną tabelą wyników; odtwarzalny dzienny produkt dotyczący zakłóceń z opóźnieniem 24 h, zgrubnymi komórkami i bez przypisywania | brak własnego wiersza rejestru: ocenia zgłoszenia, a jego punkty odniesienia są oznaczone jako MODELLED w plikach wyników; względem progów ustalonych z góry oceniający, C1 do C3 i D2 są spełnione, a trzy progi są **NOT MET** (utrwalone testami): A2 (`agc_k_sigma` AUC 0.766 wobec co najmniej 0.80 na podziale testowym), D1 (największa luka 0.0301) i zadanie (b) R1 (przeniesione, nie uruchomione ponownie); zob. `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Obserwatorium](docs/observatory/METHOD.md) |
| **Eksportery** | telemetria zaufania jako komunikaty wykrywania i stanu Home Assistant MQTT (tylko publikacja, bez danych uwierzytelniających) obok Prometheus, CEF, LEEF i OTLP | **MODELLED**: jeden wiersz rejestru | [Telemetria zaufania](docs/TRUST-TELEMETRY.md) |
| **Zapas łącza optycznego w czasie** | rodzaj `optical-atmosphere` może zapisać jedną realizację pogody w danym miejscu, wygenerowaną z ziarna, jako szereg zapasu łącza | **MODELLED**: jeden wiersz rejestru; jedno losowanie z modelu, nie klimat | [Atmosfera optyczna](docs/OPTICAL-ATMOSPHERE.md) |

Najważniejsze zmiany w 0.37: [dziennik zmian](CHANGELOG.md#0370---2026-10-17). Pełna lista 0.38 znajduje się w
[dzienniku zmian](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 szczegółowo

Każda możliwość z powyższej tabeli w kilku wierszach: co robi, jedno polecenie do jej uruchomienia, jeden
obraz narysowany z prawdziwego przebiegu silnika i co rejestr dla niej zawiera. Obrazy
zapisuje [`tools/gen_figures_038.py`](tools/gen_figures_038.py) do
[`docs/figures/0.38/`](docs/figures/0.38/) (nigdy nie są rysowane ręcznie): `python3 tools/gen_figures_038.py`
odtwarza je z zbudowanego silnika, a `--check` kończy się niepowodzeniem, jeśli któryś jest nieaktualny lub jego podpis tutaj się różni.
Tam, gdzie wejściem jest dziennik, jest to zmyślony dziennik zapisany przez skrypt, ponieważ prawdziwe dzienniki stron trzecich
nigdy nie są dołączane do repozytorium, i podpis to mówi. Wszystko poniżej jest doradcze: nie jest certyfikowane, nie jest
zatwierdzeniem typu i nic nie nadaje. Status wymienia to, co zostało sprawdzone, i nic więcej;
[jak zdobywa się etykietę](#evidence).

### Ocena Jammertest

`kshana jammertest import` zamienia opublikowany katalog testów NPRA i plan nadawania w
zaplanowaną prawdę, a `kshana jammertest score` ocenia względem niej dziennik odbiornika: dla każdego
zaplanowanego testu, czy został wykryty, z jakim opóźnieniem i jak długo odbiornik wracał do normy, plus
fałszywe alarmy poza wszystkimi slotami. Katalog jest pobierany, nigdy nie jest dołączany do repozytorium.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Ocena jednego syntetycznego dziennika odbiornika względem harmonogramu trzech testów, z prawdziwego przebiegu silnika v0.40.0 (`kshana jammertest score`). Dziennik jest zmyślony: 1800 s NMEA ze spadkiem C/N0 o 20 dB w dwóch przedziałach. Harmonogram wymienia trzy sloty; w środkowym slocie dziennik nie zawiera zagłuszarki. Ocena oznacza 2 z 3 testów jako wykryte (mediana opóźnienia 0 s) i 1 jako pominięty, z 0 seriami fałszywych alarmów w 0.25 h czystego czasu. Nic tutaj nie mówi niczego o prawdziwym odbiorniku. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC 61108, IEC 61162): za nawigację statku odpowiada nadal operator.">
</picture>

**Status w rejestrze: MODELLED.** Progi zostały ustalone przed jakimkolwiek ocenianym przebiegiem; na danych JammerTest 2024
reguła minimalnej ilości danych nie została spełniona w obu przebiegach, więc żaden próg nie jest oceniany i niczego się nie twierdzi.
[Jammertest](docs/JAMMERTEST.md).

### Własne flagi odbiornika

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG i NovAtel RXSTATUS są wczytywane do `self_report` dla każdej epoki
i zestawiane z alarmami Kshana: oba, tylko odbiornik, tylko Kshana lub żaden. Czytnik
Septentrio SBF i wejście `--serial` tylko do odczytu zasilają to samo porównanie. Żadna ze stron nie jest
prawdą odniesienia.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Własna flaga spoofingu odbiornika zestawiona z alarmami Kshana, z prawdziwego przebiegu silnika v0.40.0 na zmyślonym dzienniku UBX (200 epok przy 1 Hz). C/N0 spada o 20 dB w 80 do 90 s i 120 do 130 s; odbiornik zgłasza flagę w 120 do 130 s i 160 do 165 s. Spośród 140 epok porównanych po kalibracji w 11 flagę zgłosiły obie strony, w 6 tylko odbiornik, w 11 tylko Kshana, a w 112 żadna. Żadna ze stron nie jest prawdą odniesienia, a zgodność nie jest walidacją. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

**Status w rejestrze: MODELLED.** Zgodność między detektorem odbiornika a detektorem Kshana nie jest
walidacją. [Zaufanie do odbiornika](docs/RECEIVER-TRUST.md).

### Więcej odbiorników i czujników

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, strumienie monitora GNSS-SDR, dziennik IMU jako drugi
czujnik, pakiet ROS 2 i most `gnss_lib_py` trafiają do tej samej osi czasu zaufania do odbiornika.
`imu-fit` odczytuje parametry czujnika potrzebne scenariuszom hybrydowym i fuzji z dziennika nieruchomego IMU,
dzięki czemu scenariusz można uruchomić z czujnikiem, który faktycznie posiadasz.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Co `kshana imu-fit` odczytuje z dziennika nieruchomego IMU, z prawdziwego przebiegu silnika v0.40.0 na zmyślonym dzienniku (20,000 próbek przy 100 Hz, 200 s): błądzenie losowe prędkości akcelerometru q_va = 4.02e-06, błądzenie losowe kąta żyroskopu q_arw = 9e-08, niestabilność biasu 0.00296 i początkowe nachylenia Allana (-0.51 i -0.49; około -0.5 tam, gdzie dominuje szum biały). Tabela obok to TOML wypisywany przez polecenie. Estymator jest sprawdzony wyłącznie na syntetycznych dziennikach. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

**Status w rejestrze: MODELLED.** Wyłącznie samodzielnie napisane dane testowe; nie wczytano żadnego zapisu z prawdziwego odbiornika, IMU,
przebiegu GNSS-SDR ani grafu ROS. [Dane wejściowe z urządzeń](docs/MACHINE-INPUTS.md).

### Testy synchronizacji czasu i holdover

Rodzaj `holdover-test` ocenia test holdover (GNSS usunięty przez operatora, holdover, powrót)
na podstawie zmierzonego zapisu błędu czasu względem masek ITU-T i mówi to właśnie tymi słowami: zmierzone
względem maski. Zasilają go czytniki dzienników linuxptp i chrony; etapy sprzętowe i
pole `lab-attestation` mówią, kto co oświadczył.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Test holdover oceniony na podstawie zapisu błędu czasu, z prawdziwego przebiegu silnika v0.40.0 na scenarios/holdover-test-example.toml (601 próbek co 5 s). GNSS zostaje usunięty przez operatora w 600 s i przywrócony w 2400 s; błąd czasu dryfuje do 299 ns na końcu holdover, przekracza budżet 100 ns po 675 s i wraca do pasma 100 ns 70 s po przywróceniu. Werdykty: maski punktu odniesienia PASS, maski holdover FAIL, obwiednia holdover FAIL, powrót RECOVERED. Zmierzone względem maski, nie jest to zatwierdzenie. Czasy są oświadczeniem operatora, niezweryfikowanym przez Kshana. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

**Status w rejestrze: MODELLED.** Czasy usunięcia i przywrócenia GNSS są oświadczeniem operatora,
niezweryfikowanym. [Timing HIL](docs/TIMING-HIL.md), [Bezpieczeństwo sprzętu](docs/HARDWARE-SAFETY.md).

### Pakiety norm

Oceniane pakiety dla profili testowych DHS Resilient PNT, IMO MSC.1/Circ.1575 i ICAO Doc 9849
Appendix F, a także zestawienie NIST IR 8323r1 w `compliance-report`. Każdy test uruchamia dołączony
scenariusz i porównuje pole wyniku z progiem podanym przed przebiegiem; test, który wymaga dziennika odbiornika,
jest wymieniony jako wymagający danych wejściowych, a nie oceniony. Sformułowanie brzmi „dostarcza dowodów dla” (supports evidence for).

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Każdy test trzech ocenianych pakietów norm, z prawdziwych przebiegów silnika v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 spełnionych, 1 niespełniony, 2 wymagają danych wejściowych; imo-circ-1575: 1 spełniony, 4 niespełnione, 2 wymagają danych wejściowych; icao-doc9849-appf: 6 spełnionych, 0 niespełnionych, 2 wymagają danych wejściowych. Łącznie 13 spełnionych, 5 niespełnionych i 6 wymagających danych wejściowych, których silnik nie posiada (dziennika odbiornika lub dokumentacji urządzenia). Każdy próg został podany przed przebiegiem; chybienie pozostaje chybieniem. Spełniony próg mówi, że modelowany scenariusz spełnił podany próg, nic o produkcie. Pakiety dostarczają dowodów dla wierszy, które przywołują; nie są oceną zgodności. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life); nie może być jedyną podstawą żadnej decyzji nawigacyjnej ani dotyczącej bezpieczeństwa.">
</picture>

**Status w rejestrze: MODELLED.** Spełniony próg mówi, że modelowany scenariusz spełnił podany próg, nic o
produkcie; każde chybienie jest zachowane i utrwalone testem. [Normy](docs/STANDARDS.md).

### LunaNet AFS

Generator kodów LunaNet Augmented Forward Signal (kody Gold, Weil i trzeciorzędne, ramka
komunikatu i jej kodowanie korekcyjne) oraz weryfikator zapisanego lub wygenerowanego strumienia symboli, przypięte do jednego
wydania specyfikacji.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="Generator kodów LunaNet AFS sprawdzony względem wydrukowanych kolumn specyfikacji, z prawdziwego przebiegu silnika v0.40.0 (`kshana lunanet-afs-check spec`, przypięty do LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 stycznia 2025; dokument oznacza swoje tabele kodów jako {LSIS-TBC}). 9 z 10 sprawdzeń jest spełnionych; B4 jest NOT MET (420 z 421 zgodnych). Sprawdza strumień symboli względem jednego wydania opublikowanej specyfikacji i nie mówi niczego o żadnym węźle ani usłudze LunaNet. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life). Sprawdza strumień symboli względem jednego wydania opublikowanej specyfikacji i nie mówi niczego o żadnym węźle ani usłudze LunaNet.">
</picture>

**Status w rejestrze: VALIDATED** dla sprawdzeń kodów i synchronizacji, względem wartości, które
drukuje specyfikacja (oznaczonych przez nią jako TBC); jedno sprawdzenie jest NOT MET, zachowane i utrwalone (jedna wydrukowana
kolumna kodu trzeciorzędnego się różni: dokument drukuje tę samą wartość dla dwóch PRN). Słowa LDPC i CRC
podramek 2 do 4 nie są sprawdzane. Wiersze rejestru mówią dokładnie, które. [LunaNet AFS](docs/LUNANET-AFS.md).

### Laboratoryjna pętla zwrotna

`kshana.test-conditions/1` to opublikowany opis tego, co zrobiło laboratorium (zdarzenia, czasy,
moce). `kshana evidence round-trip` łączy skrót scenariusza, skrót warunków, skrót dziennika odbiornika
i ocenę w jeden podpisany pakiet oraz odrzuca pakiet, którego warunki i scenariusz oceny
nie zgadzają się co do zdarzeń. Kshana nigdy nie wytwarza ani nie odtwarza sygnału: to, jak scenariusz dotarł do
odbiornika, jest odpowiedzialnością operatora.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Struktura pakietu dowodowego. Dziennik odbiornika (NMEA, u-blox UBX, RINEX 3 lub dziennik Android) i okno czasowe trafiają do kshana receiver-trust evidence, które zapisuje siedem plików: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig i opcjonalny timestamp.tsr. Manifest zapisuje SHA-256 całego dziennika i każdego pliku oraz łańcuch skrótów po plikach; podpis obejmuje manifest. kshana evidence verify sprawdza podpis, skrót każdego pliku, łańcuch oraz to, że nie ma żadnego niewymienionego pliku, i kończy działanie kodem 0 po weryfikacji, 1, gdy coś się nie powiodło, i 3, gdy podpisujący nie był przypięty. Pakiet jest zapisem technicznym, a nie opinią prawną.">
</picture>

Obraz przedstawia układ pakietu. **Status w rejestrze: MODELLED.**
[Warunki testu](docs/spec/TEST-CONDITIONS.md), [Stanowisko testowe](docs/TEST-BENCH.md).

### kshana-bench

Ustalone zadania, podziały i metryki dla wykrywania zakłóceń, wykrywania IQ, przewidywania holdover i
luki optymizmu, z zapieczętowanym zbiorem holdout i statyczną tabelą wyników. Ocenia zgłoszenia; nie jest
rankingiem odbiorników.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="Wbudowane punkty odniesienia zadania D kshana-bench (luka optymizmu) na podziale testowym, z prawdziwego przebiegu silnika v0.40.0 (`kshana bench baseline`). Każda para słupków to pole pod krzywą ROC dla przypadków z rozkładu i dla przypadków przesuniętych; różnica między nimi to luka optymizmu, wobec tolerancji 0.05. fused-max-z: 0.998 i 0.983 (luka 0.015); sqm-imbalance: 0.882 i 0.882 (luka 0.001); agc-excess: 0.848 i 0.819 (luka 0.030); raim-parity: 0.682 i 0.672 (luka 0.010); energy-cn0-drop: 0.595 i 0.565 (luka 0.030). Etykiety są etykietami modelu generatywnego syntetycznego korpusu, nigdy danymi terenowymi: MODELLED. Wyłącznie doradczo: modelowane lub zmierzone względem podanych odniesień, nie jest to zatwierdzenie, certyfikacja ani deklaracja zgodności. Ocena opisuje dziennik lub korpus, nigdy produkt.">
</picture>

**Status w rejestrze:** brak własnego wiersza rejestru; punkty odniesienia są oznaczone jako MODELLED w plikach wyników.
Względem progów ustalonych z góry oceniający, C1 do C3 i D2 są spełnione, a trzy progi są NOT MET, każdy
utrwalony testem: A2 (`agc_k_sigma` AUC 0.766 wobec co najmniej 0.80 na podziale testowym), D1 (największa luka
0.0301) i zadanie (b) R1 (przeniesione z wcześniejszej kampanii, nie uruchomione ponownie). Liczby znajdują się w
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Obserwatorium zakłóceń

Jeden produkt na dobę UTC i region z otwartego archiwum pozycji statków powietrznych, na ustalonej zgrubnej siatce:
każda komórka jest zdegradowana, niezdegradowana lub nieobserwowana (co nie oznacza „czysta”). Publikowany nie wcześniej
niż 24 h po zakończeniu doby, z ukrytymi małymi komórkami i bez przypisywania przyczyny.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Dwie syntetyczne doby mapy zakłóceń narysowane z zatwierdzonych próbek w examples/interference-map/output, każda z własną syntetyczną trasą i udziałami ekspozycji trasy podawanymi przez silnik. Po lewej doba ADS-B: 1 komórka zdegradowana, 6 niezdegradowanych, 4 nieocenione (kreskowane) oraz komórki bez wpisu, narysowane jako puste, które nie były obserwowane. Trasa ma 525 km: 11.5% jej długości w komórkach zdegradowanych, 38.3% w niezdegradowanych, 9.1% w nieocenionych i 41.1% w nieobserwowanych. Po prawej doba AIS: komórki oznaczone przez detektory okręgu i położenia na lądzie, komórki nieanomalne i komórki puste; trasa ma 454 km, z czego 10.5% w komórkach anomalnych, 21.2% w nieanomalnych, 0.0% w nieocenionych i 68.3% w nieobserwowanych. ADS-B i AIS są osobnymi warstwami, nigdy nie są łączone. Oznaczona komórka nie jest stwierdzeniem zakłóceń, a komórka bez koloru nie była obserwowana, co nie jest tym samym co czysta. Wszystkie dane są zmyślone, na otwartym środkowym Atlantyku, i nie są pomiarem.">
</picture>

Obraz przedstawia zatwierdzone przykładowe doby, a nie produkt obserwatorium. **Status w rejestrze: MODELLED**:
brak zewnętrznej wyroczni, brak prawdy odniesienia i brak przypisywania przyczyny; komórka, która nie była obserwowana, nie była
oceniana, co nie jest tym samym co czysta. [Metoda obserwatorium](docs/observatory/METHOD.md).

### Eksportery

Telemetria zaufania jako tekst Prometheus, CEF, LEEF, OTLP oraz komunikaty wykrywania i stanu Home Assistant MQTT.
Polecenie publikuje wyłącznie do podanego przez Ciebie miejsca docelowego i nie przechowuje danych uwierzytelniających.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Jeden wynik zaufania w trzech formatach eksportu, z prawdziwych przebiegów silnika v0.40.0 (`kshana trust-telemetry`) na examples/maritime-trust: ekspozycja tekstowa Prometheus (najnowszy wskaźnik zaufania wynosi 5.9, a ustawione jest pasmo braku zaufania) oraz ostatnie komunikaty CEF i LEEF. Polecenie niczego nie publikuje, jeśli nie podano miejsca docelowego, nie przechowuje danych uwierzytelniających i nie nadaje żadnego sygnału radiowego. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC 61108, IEC 61162): za nawigację statku odpowiada nadal operator.">
</picture>

**Status w rejestrze: MODELLED.** [Telemetria zaufania](docs/TRUST-TELEMETRY.md).

### Zapas łącza optycznego w czasie

Rodzaj `optical-atmosphere` może zapisać jedną realizację pogody w danym miejscu, wygenerowaną z ziarna, jako szereg zapasu
łącza: epizody zachmurzenia, kolumnę wody ciekłej dla każdego z nich, jedną próbkę scyntylacji na krok.
Strona Optical PNT w Studio otwiera scenariusze optical-atmosphere.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Jedna realizacja z ziarna zapasu łącza miejsca 'northern' w ciągu 336 h, z prawdziwego przebiegu silnika v0.40.0 na scenarios/optical-atmosphere-network.toml (ziarno 37, krok 600 s). Zapas spada poniżej zera w czasie epizodów zachmurzenia; w tym losowaniu łącze działa przez 40.5 % czasu, z 27 przerwami i najdłuższą przerwą 30.7 h. Dane wejściowe są ilustracyjne, szereg jest jednym losowaniem z modelu, a nie klimatem, i różni się od dostępności statystycznej (37.8 %) o błąd próbkowania losowania. Wyłącznie analiza doradcza: nie jest to certyfikowany produkt dostępności, integralności ani nawigacji i nie jest to prognoza dla żadnego prawdziwego miejsca, chyba że jego klimatyczne dane wejściowe pochodzą z podanego zbioru danych.">
</picture>

**Status w rejestrze: MODELLED.** Jedno losowanie z modelu, nie klimat. [Atmosfera optyczna](docs/OPTICAL-ATMOSPHERE.md).

### Nowe widoki Studio

[kshana.dev/studio](https://kshana.dev/studio/) zyskuje odtwarzanie Bridge (dwa przebiegi obok siebie na jednym
zegarze misji, pod [`/studio/replay/`](https://kshana.dev/studio/replay/)), stronę Optical PNT
(`/studio/optical/`), stronę testu holdover (`/studio/holdover/`) i przeglądarkę obserwatorium
(`/studio/observatory/`). Uruchamiają ten sam silnik w przeglądarce, nic nie jest wysyłane, i niosą
to samo oświadczenie doradcze. Powyższe obrazy są rysowane skryptem z własnego wyjścia silnika;
nie są zrzutami ekranu tych stron.

<a id="space-user-navigation-gnss-ssv"></a>
### Nawigacja użytkownika w przestrzeni kosmicznej (`gnss-ssv`)

Dla statku kosmicznego powyżej, wokół lub daleko poza orbitami GNSS: ile sygnałów GNSS może wykorzystać, jak
są silne, jak dobra jest geometria i co może z nimi zrobić filtr pokładowy. Jeden rodzaj,
cztery tryby, wybierane przez tabele scenariusza: **powłoka** użytkowników (udział czasu z jednym i czterema
sygnałami, dla każdej konstelacji), **trajektoria** (sygnały, C/N0, rozmycie precyzji (DOP) i
ośrodek promienia przechodzącego przy krawędzi Ziemi wzdłuż orbity), przebieg **nawigacyjny** (filtr o dziewięciu stanach na pseudoodległościach, w stronę
Księżyca) oraz **formacja** (nawigacja względna statków podrzędnych wokół statku wiodącego). Publicznym źródłem dla
porównania dostępności jest broszura o interoperacyjnej przestrzeni usług kosmicznych GNSS (Space Service Volume) (UN OOSA
ST/SPACE/75, od International Committee on GNSS), która sama jest symulacją; jest pobierana, nigdy nie jest
dołączana do repozytorium. Pełna strona: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Dostępność sygnału dla użytkownika na sferze na wysokości 36000 km z anteną półsferyczną, z prawdziwego przebiegu silnika v0.40.0 na scenarios/gnss-ssv-shell.toml (przebieg zredukowany: 162 użytkowników, 3 dni, kroki 10 min), przy progu 20 dB-Hz. Dla każdej konstelacji i pasma dwa słupki: udział par (użytkownik, epoka) z co najmniej jednym sygnałem i z co najmniej czterema. Łącznie, L1: 99.4 % co najmniej jeden, 73.2 % co najmniej cztery, najdłuższa przerwa poniżej czterech sygnałów 160 min. Łącznie, L5: 100.0 % co najmniej jeden, 99.9 % co najmniej cztery, najdłuższa przerwa poniżej czterech sygnałów 20 min. MODELLED: badanie modelowe na podstawie podanych danych wejściowych, nie jest to pomiar ani deklaracja przestrzeni usług dla żadnego systemu. Zredukowany rozmiar nie jest porównaniem z broszurą. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Sygnały wzdłuż jednej wysokiej orbity okołoziemskiej (perygeum 497 km, apogeum 58622 km, okres 18.8 h), z prawdziwego przebiegu silnika v0.40.0 na scenarios/gnss-ssv-heo.toml, pasmo L1. U góry: najlepsza gęstość stosunku nośnej do szumu wśród widocznych sygnałów, wobec progu 20 dB-Hz. W środku: liczba widocznych sygnałów ze wszystkich konstelacji, od 4 do 55 w próbkowanych punktach. Spośród odebranych łączy 2252 przeszły przez listek główny, a 696 przez listki boczne, przy użyciu oznaczonej parametrycznej charakterystyki zastępczej, a nie zmierzonej charakterystyki jakiegokolwiek systemu. Mediana PDOP 67, 95. percentyl 358. MODELLED: badanie modelowe na podstawie podanych danych wejściowych, nie jest to pomiar ani deklaracja przestrzeni usług dla żadnego systemu. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Pokładowy filtr o dziewięciu stanach na przelocie z niskiej orbity w stronę Księżyca, z prawdziwego przebiegu silnika v0.40.0 na scenarios/gnss-ssv-nav-lunar.toml (289 epok, narysowano 13 punktów). Na osi logarytmicznej prawdziwy błąd pozycji i własna granica jednej sigmy filtra w funkcji czasu od startu. Wewnątrz orbit GNSS RMS pozycji wynosi 1.4 m; powyżej nich 90 m, przy końcowym błędzie 184 m na wysokości 193,330 km z 1 pomiarem. Średni kwadrat znormalizowanego błędu estymacji w całym przebiegu wynosi 4.4 (około 3 dla spójnego bloku pozycji). Prawda i filtr dzielą te same zastępcze modele Słońca i Księżyca. MODELLED: badanie modelowe na podstawie podanych danych wejściowych, nie jest to pomiar ani deklaracja przestrzeni usług dla żadnego systemu. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Nawigacja względna 2 statków podrzędnych wokół statku wiodącego na wysokiej orbicie, z prawdziwego przebiegu silnika v0.40.0 na scenarios/gnss-ssv-formation-heo.toml (401 epok). Dla każdego statku podrzędnego dwa słupki: RMS pozycji względnej z odjęcia dwóch niezależnych estymat bezwzględnych oraz z filtra względnego na pojedynczo różnicowanych pseudoodległościach. Baza 0.8 km: 5.1 m i 1.2 m. Baza 2.0 km: 4.1 m i 2.1 m. Filtr bezwzględny nie jest tu spójny: średni kwadrat znormalizowanego błędu estymacji 187 wobec około 3 dla spójnego filtra, więc podawana przez niego niepewność jest zdecydowanie zbyt mała. MODELLED: badanie modelowe na podstawie podanych danych wejściowych, nie jest to pomiar ani deklaracja przestrzeni usług dla żadnego systemu. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

**Status w rejestrze: MODELLED, a porównanie z broszurą w większości chybia.** Progi zostały ustalone przed
przebiegiem. Z ośmiu spełnione są tylko S0 (odwrotny budżet łącza, 13 z 13 wartości) i S6 (misja księżycowa).
**S1 do S5 i S7 są NOT MET**: geometria górnej i dolnej przestrzeni usług (43 z 52 i 48 z 52
komórek), górna przestrzeń usług przy 15/20/25 dB-Hz, sześć misji GEO, misja HEO oraz
parametryczna charakterystyka listków bocznych względem zmierzonych charakterystyk paneli GPS. Prawie każde chybienie w S1 do S5 dotyczy
GLONASS, a broszura drukuje dla niego dwa różne kąty odniesienia; wariant diagnostyczny, który używa
drugiej pary, doprowadza S1, S2 i S4 do zgodności w każdej komórce, ale nie zastępuje przebiegu rejestrowego i żaden wiersz nie jest
VALIDATED. Filtr bezwzględny przebiegu formacji jest również nadmiernie pewny siebie (średni kwadrat znormalizowanego błędu
znacznie powyżej wartości około 3, jaką daje spójny filtr).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="Zapisane porównanie modelu dostępności dla użytkownika w przestrzeni kosmicznej z publiczną broszurą Space Service Volume, z zatwierdzonych wyników wstępnie zarejestrowanego przebiegu (xval/gnss-ssv/results-run1.json, zapisanych przez przykład ssv_booklet_check silnika v0.40.0). Słupek po słupku, komórki w granicach tolerancji: S0 13 z 13 (MET); S1 43 z 52 (NOT MET); S2 48 z 52 (NOT MET); S3 122 z 155 (NOT MET); S4 132 z 156 (NOT MET); S5 18 z 26 (NOT MET); S6 26 z 26 (MET); S7 0 z 20 charakterystyk paneli (NOT MET). Przy odczycie ustalonym z góry spełnione są tylko S0 i S6. Wariant diagnostyczny, który używa drugich kątów GLONASS z broszury, doprowadza S1, S2 i S4 do zgodności w każdej komórce, ale nie zastępuje przebiegu rejestrowego. Żaden wiersz rejestru nie jest VALIDATED. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

[Nawigacja użytkownika w przestrzeni kosmicznej](docs/SSV.md), [co pokazuje porównanie](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Infrastruktura księżycowa (`lunar-infrastructure`)

Orbita i powierzchnia Księżyca jako infrastruktura nawigacyjna i geodezyjna, w pięciu badaniach wybieranych przez
`study`: **od-consistency** (pokładowe wyznaczanie orbity z ziemskiego GNSS na orbicie halo względem
niezależnego naziemnego), **carrier-phase** (ustalanie całkowitoliczbowej niejednoznaczności między stacjami powierzchniowymi a
orbiterem), **frame-coestimation** (księżycowy układ odniesienia (datum) z pomiarów odległości ze stacji ziemskich z łączami orbitera i bez nich),
**space-tie** (przesunięcia laserowe, VLBI i GNSS na jednym statku kosmicznym względem błędu lokalnego powiązania (local tie)) oraz
**geodesy-sensitivity** (która rodzina obserwabli widzi liczby Love'a h2, k2 i l2). Model jest
ograniczonym modelem trzech ciał z podanymi uproszczeniami i ilustracyjnymi danymi wejściowymi. Pełna strona:
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
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Spójność pokładowego wyznaczania orbity z ziemskiego GNSS na prawie prostoliniowej orbicie halo z niezależnym naziemnym wyznaczaniem orbity, z prawdziwych przebiegów silnika v0.40.0 na scenarios/lunar-infrastructure-od-consistency.toml i wariancie z błędem modelu (po 400 prób). Średnia znormalizowana różnica q wynosi 5.81 bez błędu modelu i 5.95 z wprowadzonym błędem przyspieszenia 3e-10 m/s2, wobec oczekiwanych 6: oba rozwiązania orbity są spójne (próg C1 MET). Udział prób powyżej punktu 95 % wynosi 0.040 i 0.052; próg wykrycia wprowadzonego błędu wynosił co najmniej 0.5, więc jest NOT MET (C3): rozwiązanie pokładowe jest znane z dokładnością około 352 m wobec 23 m dla naziemnego, więc przesunięcie o dziesięć metrów chowa się w jego kowariancji. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i ilustracyjnymi danymi wejściowymi, nie jest to pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Ustalanie całkowitoliczbowej niejednoznaczności fazy nośnej między księżycowymi stacjami powierzchniowymi a orbiterem, z zatwierdzonego wyniku ocenianego przebiegu silnika v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 długości łuku, Monte Carlo po 401 losowań, zapisany przez scenarios/carrier-phase-scored.toml). 1 dzień: powodzenie 1.0 % (błąd standardowy 0.5 %), 134 niejednoznaczności, sigma pozycji orbitera 45.6 m float i 18.5 m fixed; 2 dni: powodzenie 0.5 % (błąd standardowy 0.4 %), 259 niejednoznaczności, sigma pozycji orbitera 21.5 m float i 8.7 m fixed; 3 dni: powodzenie 2.8 % (błąd standardowy 0.8 %), 375 niejednoznaczności, sigma pozycji orbitera 6.3 m float i 2.1 m fixed. Ustalenie wartości całkowitych nie zostaje osiągnięte: powodzenie pozostaje między 1 % a 3 % przy 25 dBi, a przy zarejestrowanych 12 dBi problemu nie da się sformułować. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i ilustracyjnymi danymi wejściowymi, nie jest to pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Precyzja siedmioparametrowego księżycowego układu odniesienia (datum) (trzy przesunięcia, skala i trzy obroty) z pomiarów odległości ze stacji ziemskich, z pomiarami odległości orbiter–stacja powierzchniowa i bez nich, z prawdziwego przebiegu silnika v0.40.0 na scenarios/lunar-infrastructure-frame-coestimation.toml. Sigma Craméra-Rao przesunięć i obrotów spada dzięki łączom orbitera (na przykład t_z z 0.98 m do 0.046 m); najmniejsza wartość własna macierzy informacji rośnie 111-krotnie, a ślad CRLB spada do 1.0 % (próg F3 MET). Zakłada się, że orbita jest znana w osiach księżycowych, a jej błąd jest przenoszony przez sigmę odległości orbitera wynoszącą 1 m. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i ilustracyjnymi danymi wejściowymi, nie jest to pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Precyzja przesunięć między pozycjami z pomiarów laserowych, VLBI i GNSS jednego statku kosmicznego, względem błędu naziemnego lokalnego powiązania (local tie), z prawdziwego przebiegu silnika v0.40.0 na scenarios/lunar-infrastructure-space-tie.toml (jeden łuk 6.56-dniowy, sigmy technik GNSS 10 m, VLBI 1 m, laser 0.1 m). Przy lokalnym powiązaniu od 1 mm do 1 m sigma przesunięcia laser minus GNSS pozostaje bliska 1.04 m, dopóki powiązanie nie osiągnie 1 m: jest ograniczona szumem pomiarowym technik, a nie lokalnym powiązaniem. Dolna granica wyznaczona przez samo powiązanie to pierwiastek z dwóch razy jego sigma. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i ilustracyjnymi danymi wejściowymi, nie jest to pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Która rodzina obserwabli jest wrażliwa na księżycowe liczby Love'a h2, k2 i l2, z prawdziwego przebiegu silnika v0.40.0 na scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Każda komórka to RMS pochodnej cząstkowej obserwacji danej rodziny względem parametru, w jednostkach tej rodziny (więc komórki porównuje się w obrębie wiersza, a nie kolumny); kreska oznacza, że rodzina nie ma wrażliwości. pomiary laserowe: h2 7.6, k2 brak, l2 9.8. śledzenie orbitera: h2 brak, k2 0.00086, l2 brak. grawimetr powierzchniowy: h2 2.9e+03, k2 4.3e+03, l2 brak. zegar powierzchniowy: h2 2.8e-17, k2 2.8e-17, l2 brak. Przy wszystkich czterech rodzinach sigma Craméra-Rao wynosi 0.36 % nominalnego h2, 0.52 % k2 i 1.16 % l2. Dodanie rodziny nigdy nie obniżyło najmniejszej wartości własnej (28 z 28 dodań), ale ślad pseudoodwrotności nie był większy tylko w 16 z 28: ta połowa progu G3 jest NOT MET. Rodzina orbitera widzi całkę przyspieszenia k2 wzdłuż linii widzenia, wartość z górnego zakresu. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i ilustracyjnymi danymi wejściowymi, nie jest to pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynierskiego, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia (safety-of-life).">
</picture>

**Status w rejestrze: MODELLED, a trzy progi są NOT MET.** Obliczenia numeryczne są sprawdzone względem niezależnych
programów numpy i scipy; nic nie jest porównywane z pomiarem wielkości księżycowej i nic nie jest
VALIDATED. Spełnione: oba rozwiązania orbity są spójne (średnie q 5.81 wobec oczekiwanych 6), a łącza orbitera
podnoszą najmniejszą wartość własną układu odniesienia około 111-krotnie, przy założeniu znanej orbity. **Niespełnione**:
wprowadzony błąd modelu 3e-10 m/s2 **nie zostaje wykryty** (C3: rozwiązanie pokładowe jest znane z dokładnością około 350 m, więc
około dziesięciu metrów chowa się w jego kowariancji); **ustalenie wartości całkowitych nie zostaje osiągnięte** (1 do 3 % powodzenia przy
25 dBi, a przy zarejestrowanych 12 dBi problemu nie da się sformułować); oraz połowa progu G3 dotycząca śladu przy dodawaniu
rodziny obserwabli (ślad wzrósł w 12 z 28 dodań, za każdym razem dlatego, że rodzina podniosła rząd).
Każde chybienie jest utrwalone testem. [Infrastruktura księżycowa](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Otwórz [kshana.dev/studio](https://kshana.dev/studio/), a cały silnik uruchomi się w Twojej
przeglądarce, skompilowany do WebAssembly. Nic do zainstalowania i nic nie jest wysyłane. Studio ma
dwa widoki tego samego silnika, a przełącznik w nagłówku przenosi między nimi, zachowując
scenariusz, widok i wszelkie zmienione przez Ciebie ustawienia.

**Widok prosty** to miejsce, w którym otwiera się Studio. Zaczyna od pytań (ile satelitów
widzę, czy mogę ufać swojej pozycji, jak długo zegar utrzymuje czas, co zagłuszarka robi
z moim odbiornikiem) oraz od mapy wszystkiego, co potrafi silnik, każdy obszar z udziałem
zwalidowanych metod. Otwórz scenariusz, a odpowiedź pojawi się najpierw: jedno proste zdanie, napisane dla
tego, co dany scenariusz mierzy, potem jego kluczowe liczby i wykres. Widocznych jest najwyżej pięć ustawień,
tych, które najbardziej zmieniają odpowiedź; pozostałe czekają pod **Ustawieniami zaawansowanymi**.
**Jak to jest obliczane** wyjaśnia metodę, a **Dla badaczy** podaje własne liczby silnika,
plik scenariusza, kod do uruchomienia go z Pythona i cytowanie.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, widok prosty, na dołączonym scenariuszu integrity-raim, silnik v0.40.0 działający lokalnie. Pytanie: czy geometria spełnia granice alarmowe (poziomy i pionowy poziom ochrony)? Najpierw odpowiedź, oznaczona jako wynik na żywo: Tak, w większości: przez 95.3 % z 12 h. Granica błędu odbiornika pozostała poniżej granic alarmowych (40 m w poziomie i 50 m w pionie) w 344 z 361 sprawdzeń i żadna pozycja nie była wprowadzająca w błąd. Kluczowe liczby: czas, w którym można ufać pozycji 95.3 %, najdłuższa przerwa 10 min, typowa granica błędu 6.5 / 13 m, pozycje wprowadzające w błąd 0. Obok Wypróbuj inne ustawienia z pięcioma z nich (błąd odległości, dwie granice alarmowe, czas trwania i maska elewacji) oraz Uruchom ponownie, następnie zwinięte sekcje Ustawienia zaawansowane (13 kolejnych), Jak to jest obliczane (8 zwalidowanych, 6 modelowanych) i Dla badaczy. Poniżej widoki tego wyniku i poziomy ochrony wykreślone względem granicy alarmowej." width="100%">
</picture>

**Widok zaawansowany** to pełny pulpit: biblioteka scenariuszy, pięć ponumerowanych kroków
(Wybierz, Ustaw, Uruchom, Odczytaj wyniki, Udostępnij lub eksportuj), kluczowe liczby z oznaczeniami PASS i FAIL
tam, gdzie przebieg podaje próg, oraz każdy panel: przegląd, wykresy, mapy, odtwarzanie, raport
silnika i eksporty. Jedno pole wyszukiwania sięga do scenariuszy, domen i pól wewnątrz
nich, a do czterech przebiegów można przypiąć i porównać obok siebie.

<details>
<summary>Ekran otwarcia widoku prostego i widok zaawansowany po przebiegu</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, widok prosty, ekran otwarcia zatytułowany Czego chcesz się dowiedzieć?, z działającym silnikiem v0.40.0 i trzema odnośnikami na górnym pasku: Omówienie szkolenia, Mapa zakłóceń i Zaufanie do odbiornika. Cztery pytania: ile satelitów widzę w dowolnym miejscu na Ziemi, czy mogę ufać swojej pozycji, jak długo zegar utrzymuje czas bez satelitów i co zagłuszarka robi z moim odbiornikiem. Pod pierwszym jego zapisany wynik: co najmniej 22 widoczne satelity w każdym miejscu i średnio 31 przy GPS, Galileo, BeiDou i GLONASS razem, pozycja możliwa w 100 % miejsc i czasów, na mapie świata widocznych satelitów, z przyciskiem Otwórz ten wynik. Obok Wszystko, co potrafi Kshana: 16 obszarów i 139 gotowych do uruchomienia scenariuszy, każdy kafelek z małym wykresem z zapisanego przebiegu i udziałem zwalidowanych metod, oraz 173 z 350 możliwości zwalidowanych w rejestrze." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, widok zaawansowany, po przebiegu dołączonego scenariusza constellation-multi-gnss-coverage (Cztery konstelacje GNSS, jedna mapa), silnik v0.40.0 działający lokalnie. Po lewej biblioteka scenariuszy, 139 scenariuszy w 16 domenach. Pięć kroków Wybierz, Ustaw, Uruchom, Odczytaj wyniki i Udostępnij lub eksportuj, z bieżącym krokiem 4. Kluczowe liczby: 102 satelity, dostępność 100 % (PASS), mediana rozmycia precyzji pozycji (PDOP) 0.95 (PASS), 95. percentyl PDOP 1.105 (PASS), średnio 31.03 widocznych satelitów i co najmniej 22. Poniżej rząd paneli z wybranym Pokryciem, pasek odtwarzania, mapa świata średniego PDOP od 0.831 do 1.0853 z narysowanym każdym satelitą oraz globalne liczby pokrycia." width="100%">
</picture>

</details>

Źródła Studio i notatki dotyczące jego budowania znajdują się w [`web/README.md`](web/README.md).

### Strona internetowa

Pozostała część [kshana.dev](https://kshana.dev) jest budowana z własnych plików tego repozytorium i
przebiegów silnika: misje, możliwości, rejestr dowodów, opublikowane badania i
edycje.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Trzy strony kshana.dev obok siebie. Sekcja główna strony startowej: wiersz z nazwą Kshana · क्षण · dokładna chwila nad nagłówkiem Przećwicz minutę, w której GNSS gaśnie, z konsolą misji z prawdziwego przebiegu silnika v0.40.0 (globus i trzy wykresy na żywo: błąd czasu zegara, gęstość stosunku nośnej do szumu i poziom ochrony). Dowody, Opublikowane badania: sześć artykułów arXiv opartych na otwartym silniku, najnowszy z wykresem silnika. Edycje, Kshana Pro, ten sam silnik, wzmocniony: Free uruchamia jeden scenariusz, Pro odpowiada na pytanie programu." width="100%">
</picture>

<a id="capabilities"></a>
## Możliwości

Jeden silnik obejmuje cały łańcuch awarii, od pierwszego zagłuszonego satelity do ostatniej
nanosekundy holdover zegara. Silnik ma 92 rodzaje scenariuszy; `kshana kinds` je wymienia,
a [`docs/SCENARIOS.md`](docs/SCENARIOS.md) dokumentuje każde pole.

| Możliwość | Na co odpowiada |
|---|---|
| [Widmo](docs/SPECTRUM.md) | jak zagłuszarka zajmuje pasmo L GNSS, pasmo po paśmie, sekunda po sekundzie |
| [Zegary i synchronizacja czasu](docs/TELECOM-TIMING.md) | jak długo każdy zegar utrzymuje czas po utracie GNSS |
| [Konstelacje wokół dowolnego ciała](docs/CONSTELLATION-DESIGN.md) | pokrycie, rozmycie precyzji i dostępność wokół Ziemi, Księżyca lub Marsa |
| [Układ Słoneczny](docs/SOLAR-SYSTEM.md) | gdzie jest każda planeta i jaki jest czas świetlny dowolnego łącza |
| [Nawigacja na niskiej orbicie okołoziemskiej](docs/LEO-PNT.md) | przelot, łącze, komunikat nawigacyjny i fuzja pozycji, etap po etapie |
| [Kampanie](docs/CAMPAIGNS.md) | łańcuchowa misja, przegląd parametrów (sweep) lub zespół Monte Carlo w jednym scenariuszu |
| [Animacja](docs/ANIMATION.md) | szereg czasowy przebiegu jako animowany rysunek, odtwarzacz lub klatki |
| [Raporty](docs/REPORTS.md) | każda liczba z jednostką i etykietą, w HTML (HyperText Markup Language) i JSON (JavaScript Object Notation) |
| [Eksporty interoperacyjne](docs/INTEROP.md) | orbity i geometria dla innych narzędzi: SP3, CCSDS OMM i OEM, CZML, KML, GeoJSON, STK i SigMF |
| [Zaufanie w żegludze](docs/MARITIME-TRUST.md) | czy mostek może ufać tej pozycji: wskaźnik 0-100 i powody dla NMEA statku, na żywo lub z dziennika (doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu) |
| [Strumienie szkoleniowe NMEA](docs/NMEA-TRAINING.md) | syntetyczne NMEA mostka ze skryptowym zagłuszaniem i spoofingiem oraz dziennikiem instruktora, do szkolenia załogi (wyłącznie tekst; nigdy dla działających systemów nawigacyjnych statku; doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu) |
| [Mapa zakłóceń](docs/INTERFERENCE-MAP.md) | gdzie statki powietrzne i statki zgłaszały zdegradowane dane nawigacyjne i jaką część trasy to dotyczy |
| [Region źródła zakłóceń](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | gdzie, przy podanych założeniach, może znajdować się źródło zdegradowanych raportów pozycji: regiony przy podanej ufności, centroid z elipsą, nigdy punkt (MODELLED; `kshana interference-map locate`) |
| [Pakiety dowodowe](docs/EVIDENCE-PACKS.md) | podpisany, weryfikowalny offline zapis techniczny okna dziennika statku i tego, co silnik z niego obliczył, do raportu o incydencie (doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu) |
| [Telemetria zaufania](docs/TRUST-TELEMETRY.md) | strumień zaufania jako metryki Prometheus, zdarzenia SIEM i opcjonalnie OpenTelemetry, z przykładowym pulpitem Grafana (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K i OpenCPN](docs/MARINE-INTEGRATIONS.md) | wskaźnik zaufania na serwerze Signal K łodzi i w OpenCPN, z referencyjną konfiguracją dla małego komputera obok odbiornika (doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu) |
| [Eksport do stanowiska testowego](docs/TEST-BENCH.md) | `kshana bench-export`: ruch pojazdu i zdarzenia scenariusza dla laboratoryjnego symulatora GNSS (żaden sygnał nie jest zapisywany) oraz sposób późniejszej oceny dziennika odbiornika |
| [Mapowanie i raport zgodności](docs/compliance/README.md) | `kshana compliance-report`: dla których wierszy publicznych ram odporności zestaw przebiegów dostarcza dowodów (supports evidence for) i jaka luka pozostaje |
| [Notatniki](notebooks/README.md) | uruchamialne samouczki: zaufanie na statku i strumienie szkoleniowe, ekspozycja trasy na mapie zakłóceń, mapowanie zgodności i stanowisko testowe, GDOP kwantowy wobec klasycznego |
| [Weryfikator Galileo OSNMA](docs/OSNMA.md) | dane nawigacyjne których satelitów odbiornik może kryptograficznie uwierzytelnić i dlaczego sprawdzenie się nie powodzi; Kshana nie udziela żadnych praw w ramach EU OSNMA ICD IPRs (zob. NOTICE na tej stronie) |

Pełne nazwy formatów eksportu: SP3 to Standard Product 3; CCSDS OMM i OEM to Orbit
Mean-elements Message i Orbit Ephemeris Message komitetu Consultative Committee for Space Data
Systems; CZML i KML to Cesium Markup Language i Keyhole Markup Language; STK to Systems Tool Kit;
SigMF to Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="Łańcuchowa kampania campaign-jam-spoof-holdover-integrity, jeden prawdziwy przebieg silnika (ziarno 20260928): 6 faz (Nominalna → Zagłuszanie → Spoofing → Holdover → Alarm integralności → Powrót) i 18 przebiegów składowych na siatce 10 s w czasie T+01:16:10. Trzy tory: błąd czasu zegara wobec progu ochronnego 50 ns (szczyt 62.7 ns), efektywna gęstość stosunku nośnej do szumu wobec dolnej granicy 25 dB-Hz (minimum -12.2 dB-Hz) oraz pionowy poziom ochrony wobec granicy alarmowej 50 m (szczyt 135.4 m), ze zdarzeniami alarmowymi przebiegu: T+00:20:00 alarmy detektora spoofingu RF (połączone monitory spójności, mocy i jakości sygnału); T+00:26:10 alarmy monitora spoofingu wspomaganego zegarem." width="100%">
</picture>

<details>
<summary>Każda możliwość narysowana z prawdziwego przebiegu: wodospad pasma L, mapa pokrycia, Układ Słoneczny i przelot na niskiej orbicie okołoziemskiej</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="Pasmo L GNSS jako jedna gęstość widmowa mocy w ciągu 60 s, z prawdziwego przebiegu rodzaju spectrum (l-band-waterfall-jamming.toml, ziarno 7, silnik v0.40.0): częstotliwość w poziomie, czas w dół, kolor dla mocy powyżej poziomu szumu -202.0 dBW/Hz. Zagłuszarki: urządzenie prywatności z sygnałem świergotowym (chirp, włączone w 10 s, wyłączone w 40 s); ton CW na L1 (cw, włączony w 30 s); szum wąskopasmowy L2 (narrowband, włączony w 45 s). Najgorsze pasmo GPS L1 C/A: minimalne efektywne C/N0 3.2 dB-Hz w 31 s wobec dolnej granicy śledzenia 25 dB-Hz. GPS L1 C/A minimum 3.2 dB-Hz; Galileo E1 minimum 4.7 dB-Hz; GPS L2C minimum 36.9 dB-Hz; GPS L5 minimum 44.1 dB-Hz; Galileo E5a minimum 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Widoczne satelity nad całą Ziemią w ciągu jednej doby, z prawdziwego przebiegu constellation-design (constellation-multi-gnss-coverage.toml, silnik uruchomiony przez ten generator): 102 satelity (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Każda komórka 10-stopniowa jest zacieniowana według średniej liczby satelitów powyżej maski 10 stopni (27.2 do 36.5); kropki to próbki śladu naziemnego silnika, jedna na godzinę na satelitę. Globalna dostępność 100.00 % przy PDOP nie większym niż 6, mediana PDOP 0.95, średnio 31.0 i co najmniej 22 widoczne satelity." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Układ Słoneczny w epoce scenariusza 2026-09-28T00:00:00, z prawdziwego przebiegu rodzaju solar-system (solar-system-tour.toml): Słońce, 9 planet i planeta karłowata Pluton widziane znad ekliptyki, odległości skompresowane logarytmicznie do wyświetlenia, z jednokierunkowym czasem świetlnym każdego ciała od Ziemi. Merkury 0.47 au, 10.1 minuty świetlnej, VALIDATED; Wenus 0.73 au, 3.0 minuty świetlnej, VALIDATED; Mars 1.55 au, 14.0 minuty świetlnej, VALIDATED; Jowisz 5.30 au, 49.5 minuty świetlnej, VALIDATED; Saturn 9.44 au, 70.2 minuty świetlnej, VALIDATED; Uran 19.44 au, 157.4 minuty świetlnej, MODELLED; Neptun 29.88 au, 240.2 minuty świetlnej, MODELLED; Pluton 35.61 au, 292.2 minuty świetlnej, MODELLED. Łącza: Mars do Jowisza jednokierunkowo 2193.5 s; Saturn do Ziemi jednokierunkowo 4212.2 s; Europa do Jowisza jednokierunkowo 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Jeden przelot na niskiej orbicie okołoziemskiej (LEO) z prawdziwego przebiegu rodzaju leo-pass (leo-pass-iridium.toml, silnik uruchomiony przez ten generator): Iridium-pass na 781 km, pasmo STL przy 1621 MHz, widziany przez użytkownika lotniczego na 50° N 30° W. Powyżej maski 5° przez 750 s, maksymalna elewacja 65.0° w 444 s. Gęstość stosunku nośnej do szumu osiąga szczyt 80.5 dB-Hz (mediana 71.3), 34.3 dB powyżej mediany GNSS wynoszącej 46.2 dB-Hz z 8 widocznych satelitów GPS (38.2 do 51.1 dB-Hz); przesunięcie Dopplera sięga 35.4 kHz." width="100%">
</picture>

Każdy z nich uruchomisz poleceniem `kshana example <scenario> > s.toml && kshana s.toml`: scenariusze
to `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
i `leo-pass-iridium`.

</details>

<details>
<summary>Możliwości żeglugowe i dotyczące zakłóceń, narysowane z zatwierdzonych syntetycznych danych wejściowych: wskaźnik zaufania, mapa zakłóceń z ekspozycją trasy, strumień szkoleniowy i pakiet dowodowy</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Wskaźnik zaufania w czasie jednego syntetycznego rejsu, z prawdziwego przebiegu silnika v0.40.0 na examples/maritime-trust (zmyślony dziennik NMEA promu na trasie Tallinn–Helsinki, 3001 epok przy 1 Hz). Trzy tory dzielą jedną oś czasu. U góry: odległość między pozycją podawaną przez odbiornik a prawdziwą pozycją statku, która pozostaje w granicach kilku metrów do około 1576 s, kiedy skryptowe odciąganie pozycji w dzienniku ją przesuwa, podczas gdy odbiornik nadal podaje ważną pozycję. W środku: wskaźnik zaufania od 0 do 100, nieobliczany przez pierwsze 300 s kalibracji, w paśmie nominalnym (co najmniej 90) aż do odciągania, potem spadający przez pasmo zdegradowane (co najmniej 55) do pasma braku zaufania. U dołu: pasmo każdej epoki jako kolorowa wstęga z nazwą. Wskaźnik jest doradczy. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC 61108, IEC 61162): za nawigację statku odpowiada nadal operator. Dziennik jest zmyślony, aby pokazać format i monitory; nie jest pomiarem i nie mówi niczego o tym, jak działałby jakikolwiek odbiornik." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Dwie syntetyczne doby mapy zakłóceń narysowane z zatwierdzonych próbek w examples/interference-map/output, każda z własną syntetyczną trasą i udziałami ekspozycji trasy podawanymi przez silnik. Po lewej doba ADS-B: 1 komórka zdegradowana, 6 niezdegradowanych, 4 nieocenione (kreskowane) oraz komórki bez wpisu, narysowane jako puste, które nie były obserwowane. Trasa ma 525 km: 11.5% jej długości w komórkach zdegradowanych, 38.3% w niezdegradowanych, 9.1% w nieocenionych i 41.1% w nieobserwowanych. Po prawej doba AIS: komórki oznaczone przez detektory okręgu i położenia na lądzie, komórki nieanomalne i komórki puste; trasa ma 454 km, z czego 10.5% w komórkach anomalnych, 21.2% w nieanomalnych, 0.0% w nieocenionych i 68.3% w nieobserwowanych. ADS-B i AIS są osobnymi warstwami, nigdy nie są łączone. Oznaczona komórka nie jest stwierdzeniem zakłóceń, a komórka bez koloru nie była obserwowana, co nie jest tym samym co czysta. Wszystkie dane są zmyślone, na otwartym środkowym Atlantyku, i nie są pomiarem." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Strumień szkoleniowy ze scenariusza coastal-drag-off (silnik v0.40.0, ziarno 22, 25 minut przy jednej pozycji na 10 s dziennika instruktora). Mapa pokazuje prawdziwy kurs statku i kurs podawany przez odbiornik: zgadzają się, dopóki w 421 s nie zaczyna się skryptowe odciąganie pozycji, potem podawany kurs oddala się od prawdziwego, podczas gdy odbiornik utrzymuje ważną pozycję, i wraca skokowo, gdy zdarzenie kończy się w 1140 s. Obok odległość między dwoma kursami w czasie oraz średnia gęstość stosunku nośnej do szumu podawana przez odbiornik, która rośnie do jednego podwyższonego poziomu na czas trwania zdarzenia. Syntetyczne dane szkoleniowe wygenerowane przez Kshana. Wyłącznie do szkolenia i testów: nigdy nie podawaj tego strumienia do działających systemów nawigacyjnych statku. Doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC 61108, IEC 61162): za nawigację statku odpowiada nadal operator. Pozycje, daty i kursy są wymyślone." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Struktura pakietu dowodowego. Dziennik odbiornika (NMEA, u-blox UBX, RINEX 3 lub dziennik Android) i okno czasowe trafiają do kshana receiver-trust evidence, które zapisuje siedem plików: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig i opcjonalny timestamp.tsr. Manifest zapisuje SHA-256 całego dziennika i każdego pliku oraz łańcuch skrótów po plikach; podpis obejmuje manifest. kshana evidence verify sprawdza podpis, skrót każdego pliku, łańcuch oraz to, że nie ma żadnego niewymienionego pliku, i kończy działanie kodem 0 po weryfikacji, 1, gdy coś się nie powiodło, i 3, gdy podpisujący nie był przypięty. Pakiet jest zapisem technicznym, a nie opinią prawną." width="100%">
</picture>

Wszystkie cztery to zmyślone dane i mają charakter doradczy: pokazują format i zachowanie oprogramowania, a nie to, jak jakikolwiek odbiornik lub system radzi sobie z zakłóceniami. Pierwszy uruchomisz poleceniem `kshana receiver-trust examples/maritime-trust/session.toml`, drugi poleceniem `kshana route-exposure` na próbkach w `examples/interference-map/`, trzeci poleceniem `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (wyłącznie do szkolenia: nigdy nie podawaj go do działającego sprzętu nawigacyjnego), a czwarty jak w [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Pełna tabela możliwości, domena po domenie</summary>

Poniżej pełne szczegóły domena po domenie; rejestr dojrzałości dla każdej możliwości znajduje się w
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) i [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Domena | Możliwość |
|--------|------------|
| **Orbita i geometria** | Propagacja SGP4/SDP4 (zwalidowana do 4.12 mm względem wszystkich 666 wektorów AIAA 2006-6753); prawdziwe elementy dwuwierszowe (zatwierdzona, opatrzona datą migawka Celestrak `gps-ops`) lub syntetyczne konstelacje Walker-delta, których elementy średnie realizują wzór `i:T/P/F` z dokładnością poniżej 1 km w propagacji 24 h; widoczność wielu konstelacji, **rozmycie precyzji — geometryczne, pozycji, poziome, pionowe i czasu (GDOP/PDOP/HDOP/VDOP/TDOP), zwalidowane do 1e-6 względem gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), oraz dostępność GNSS; bezgradientowy optymalizator projektu konstelacji, wymiarowanie minimalnej liczby satelitów metodą streets-of-coverage, narzędzie porównania wielu konstelacji oraz Walker **design sweep**, który tabelaryzuje pokrycie / PDOP / czas ponownej wizyty na siatce płaszczyzny × satelity i podaje projekty optymalne w sensie Pareto. |
| **Propagator numeryczny** | Propagator numeryczny **Cowella** (`src/propagator.rs`) uzupełniający analityczną ścieżkę SGP4/SDP4, z hierarchicznym modelem sił obejmującym **siedem perturbacji** (`src/forces.rs`): dwa ciała + pełne pole **strefowe J2–J6** (współczynniki harmonik strefowych spłaszczenia Ziemi od J2 do J6; dokładny analityczny gradient potencjału zaburzającego), opcjonalny **tesseralny geopotencjał harmonik sferycznych EGM2008 do stopnia/rzędu 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; prawdziwe współczynniki NGA — US (United States) National Geospatial-Intelligence Agency —, rekurencja znormalizowanych funkcji Legendre'a Holmesa–Featherstone'a, sprawdzona krzyżowo względem funkcji Legendre'a w postaci zamkniętej i analitycznej tożsamości ∇V), grawitacja **trzeciego ciała — Słońca i Księżyca, zależna od epoki** (wbudowane efemerydy niskiej precyzji, bez jądra DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel), **ciśnienie promieniowania słonecznego** (model kuli z cieniem stożkowym umbra+penumbra), **opór atmosferyczny** (gęstość wykładnicza przedziałami wg Vallado, atmosfera współobracająca się), **postnewtonowska relatywistyczna poprawka Schwarzschilda** oraz człon **unoszenia układu Lense–Thirringa** (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, liniowy względem momentu pędu Ziemi, ~1–2 rzędy wielkości poniżej Schwarzschilda) — napędzany jednym z dwóch adaptacyjnych integratorów (RK4 — Runge–Kutta czwartego rzędu — z podwajaniem kroku lub para zagnieżdżona **Dormanda–Prince'a RK5(4)**). **Zwalidowany względem Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 epok na LEO (niskiej orbicie okołoziemskiej) + GTO (orbicie transferowej geostacjonarnej), przy czym poziomy sił zachowawczych zgadzają się w najgorszym przypadku do **\|Δr\| 0.08 m w 24 h** (`tests/numerical_cowell_propagator_reference.rs`); poziom oporu atmosferycznego jest scharakteryzowany osobno (≈ 333 m / 24 h), a bezwzględne efemerydy Słońca/Księżyca i dane wejściowe gęstości pozostają uczciwie **Modelled**. Dodatkowe dowody wewnętrzne (nie walidacja zewnętrzna): orbita niezaburzona jest sprawdzana względem dokładnego rozwiązania Keplera w zmiennych uniwersalnych z dokładnością **poniżej metra w 24 h**, energia/moment pędu są zachowane do ~1e-9, a każda perturbacja odpowiada ręcznie wyprowadzonej sygnaturze w postaci zamkniętej. |
| **Manewry i projektowanie trajektorii** | Impulsowe węzły ΔV z propagacją kowariancji 6×6 (układy błędów wykonania ECI — inercjalny geocentryczny — / LVLH — lokalna pionowa, lokalna pozioma), całkowanie skończonego impulsu sprawdzone względem równania rakietowego **Ciołkowskiego** w postaci zamkniętej do < 0.01 %, solver **Lamberta** dla jednego obiegu wg **Izzo-2015**, dokładny propagator **Keplera** w zmiennych uniwersalnych oraz przegląd **porkchop** (start × przylot) C3 (energii startu) / V∞ przylotu emitowany jako siatka konturowa JSON — warstwa symulacji osiągów nad GMAT/Orekit, przy czym każde wyjście Lamberta jest sprawdzane w obie strony względem prawdy dwóch ciał, a minimum porkchop jest sprawdzane względem analitycznej dolnej granicy Hohmanna. |
| **Systemy czasu i układy odniesienia** | Skale IERS z sekundami przestępnymi **UTC / TAI / TT / UT1** (Coordinated Universal Time, International Atomic Time, Terrestrial Time oraz czas rotacji Ziemi Universal Time 1), API (interfejs programowania aplikacji) dat juliańskich, **kąt obrotu Ziemi** IAU-2000 (International Astronomical Union) (ERA), oparte na GMST (Greenwich Mean Sidereal Time) przekształcenie **TEME ↔ ECEF** (równik prawdziwy, średnia równonoc ↔ geocentryczny, związany z Ziemią) z układami geodezyjnymi WGS-84 (World Geodetic System 1984), precesja IAU 2006 (Fukushima–Williams), pełna **nutacja IAU 2000A/2000B**, **ruch bieguna** IERS oraz wolna od równonocy redukcja **GCRS↔ITRS oparta na CIO wg IAU 2006/2000A** (CIO = Celestial Intermediate Origin) — wszystko zwalidowane **bit w bit** względem wektorów SOFA/ERFA i **niezależnie sprawdzone krzyżowo względem ANISE** (czysto rustowej reimplementacji NAIF/SPICE; NAIF = Navigation and Ancillary Information Facility NASA, US National Aeronautics and Space Administration): GCRS→ITRS w kshana wobec ITRF93 (International Terrestrial Reference Frame 1993) w ANISE z `earth_latest_high_prec.bpc` JPL, przy tych samych parametrach orientacji Ziemi IERS podanych obu, zgadzają się do **≤ 0.86 m na ziemi / ≤ 3.6 m na orbicie GNSS** (maks. 0.028″) w ośmiu epokach 2020–2023. |
| **Nawigacja inercjalna** | Trójosiowy INS typu strapdown — orientacja w kwaternionach, mechanizacja WGS-84 NED (północ-wschód-dół), kompensacja coningu/scullingu i deterministyczny model błędów IMU (współczynnik skali, niewspółosiowość, czułość na g, kwantyzacja, dryf); **akcelerometr na interferometrze zimnych atomów oparty na pierwszych zasadach** (faza Macha–Zehndera, kwantowy szum projekcji, zanik kontrastu, sprzężenie z wibracjami), który *wyprowadza* współczynnik błądzenia losowego prędkości; oraz **filtr cząsteczkowy** z sekwencyjnym ważonym próbkowaniem i ponownym próbkowaniem dla nawigacji wspomaganej mapą (odniesioną do terenu/grawitacji) bez GPS. |
| **Alt-PNT (bez GPS)** | **Model pomiarowy grawimetru** na zimnych atomach, którego dolny poziom szumu białego (`σ = ASD/√τ`, ASD = amplitudowa gęstość widmowa) jest wyprowadzony z fizyki akcelerometru CAI; w pełni znormalizowane **pole anomalii grawitacyjnych w harmonikach sferycznych** niskiego stopnia (sprawdzone względem funkcji Legendre'a w postaci zamkniętej i ręcznie wyprowadzonej anomalii jednowyrazowej) plus syntetyczne maskony; **jądro syntezy funkcjonałów grawitacji** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — „czytnik mapy”, do którego dopasowuje się nawigator wspomagany grawitacją — jest zwalidowane względem **standardu grawitacji normalnej GRS80** (Geodetic Reference System 1980), odtwarzając grawitację normalną Somigliany w postaci zamkniętej oraz opublikowane γ_e / γ_p do **3.5e-12** i tworząc fizycznie ograniczoną mapę zaburzeń z prawdziwego pola ICGEM (International Centre for Global Earth Models) **EGM2008** (RMS — średnia kwadratowa — ≈ 26 mGal, maks. ≈ 89 mGal przy st./rz. 70; `tests/icgem_gravity_reference.rs`); oraz **filtr cząsteczkowy dopasowujący mapę grawitacyjną**, który odtwarza trasę bez GPS z sekwencji anomalii, przez które przelatuje. Rozszerza się na **nawigację odniesioną do terenu** (TERCOM/SITAN — dopasowanie konturu terenu / Sandia Inertial Terrain-Aided Navigation — względem DEM (numerycznego modelu wysokości) SRTM (Shuttle Radar Topography Mission) `.hgt`, `src/altpnt/terrain.rs`), **główne pole geomagnetyczne IGRF-14** (14. generacja International Geomagnetic Reference Field) do stopnia/rzędu 13 (`src/igrf.rs`, sprawdzone względem nachylonego dipola w postaci zamkniętej i różnic skończonych ∇V) oraz nawigator **łączący grawitację + magnetyzm + teren**, który łączy wszystkie trzy kanały skalarne w jednym filtrze cząsteczkowym (informacja jest addytywna — żaden kanał nie pogarsza pozycji). **60-minutowy benchmark bez GPS** (przerwa ~700 km / jedna godzina, w której rozwiązanie inercjalne dryfuje do ~70 km) jest odtwarzany do **~145 m (< 500 m)** przez hierarchiczny dopasowywacz od zgrubnego do dokładnego — cel ESA NAVISP (Navigation Innovation and Support Programme) *Quantum Wayfarer*. |
| **Fuzja** | Luźno sprzężony 15-stanowy EKF (rozszerzony filtr Kalmana) GNSS/INS w przestrzeni błędów ze sprzężeniem zwrotnym w pętli zamkniętej (pakiet `gnss-ins`); **ściśle sprzężona** aktualizacja pseudoodległości, która nadal koryguje przy mniej niż czterech satelitach; sprzężony filtr **zegar + pozycja**; ogólny estymator **bezśladowy (punkty sigma) Kalmana** dla silnie nieliniowych pomiarów; ściśle sprzężony **nawigator UKF** GNSS/INS (pseudoodległość + Doppler), którego orbitalny lot bez korekt oparty na modelu sił jest sprawdzony pod kątem samospójności do **0.77 m RMS** w 30-minutowym zakrzywionym przelocie LEO obejmującym 120-sekundową przerwę GNSS (liczba spójności filtra, a nie walidacja zewnętrzną wyrocznią — ten nawigator pozostaje MODELLED); oraz pełny **17-stanowy ściśle sprzężony UKF GNSS/INS** (pozycja, prędkość, błąd orientacji, biasy akcelerometru i żyroskopu, bias i dryf zegara), którego **zliczanie drogi na kwantowym CAI** przechodzi 120-sekundową przerwę na wyprowadzonym błądzeniu losowym prędkości akcelerometru na zimnych atomach. |
| **Wyznaczanie orbity** | Odtworzenie stanu orbitalnego `[r, v]` z pomiarów odległości ze stacji naziemnych, łączące model sił dwa ciała + J2 i integrator RK4 z korektorem **wsadowym Gaussa–Newtona** (`determine_orbit_batch`, poniżej metra / mm·s⁻¹ z odległości bez szumu, ~2 m przy poziomie szumu 5 m) oraz **sekwencyjnym** wariantem filtra bezśladowego (`determine_orbit_sequential`). |
| **Obserwowalność i teoria estymacji** | Ogólna, wielokrotnego użytku warstwa **informacji Fishera / Craméra–Rao** (`src/fim.rs`): macierz informacji M = HᵀWH, **dolna granica Craméra–Rao**, **rząd obserwowalności i przestrzeń zerowa defektu układu odniesienia (datum)** (pseudoodwrotność Moore'a–Penrose'a) oraz skalary planowania eksperymentu **D/A/E/T-optymalne** z symetrycznego solvera wartości własnych Jacobiego. **Zwalidowane** — wartości własne wobec `numpy.linalg.eigh`, kowariancja CRLB wobec σ²(XᵀX)⁻¹ przez `numpy.linalg.inv` oraz DOP GNSS z macierzy informacji, wszystko zgodne do **1e-9** (`tests/fim_observability_reference.rs`), a dodatkowo sprawdzone krzyżowo względem granic w postaci zamkniętej **Kay (1993)** z osiąganiem CRLB w Monte Carlo. Stanowi podstawę silnika DOP, CRLB pasywnej geolokalizacji oraz **twierdzenia o obserwowalności** bezwzględnej stacji księżycowej (poniżej). |
| **Księżyc i przestrzeń cislunarna** | Propagator **kołowego ograniczonego problemu trzech ciał (CR3BP)** Ziemia–Księżyc w układzie obracającym się — zachowana stała Jacobiego i wszystkie pięć punktów Lagrange'a (`src/cr3bp.rs`) — teraz z **macierzą przejścia stanu (STM) 6×6 i korektorem różniczkowym metodą pojedynczego strzału** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`), który daje rzeczywiście okresowe orbity **halo / NRHO** (prawie prostoliniowa orbita halo): STM jest zwalidowana względem różnic skończonych, skorygowane orbity zamykają się z precyzją maszynową, a zainicjowanie opublikowanym stanem w apolunium odtwarza **południową NRHO 9:2 wokół L2** (L2 = drugi punkt Lagrange'a Ziemia–Księżyc; orbita Gateway) z okresem ≈ 6.57 d / perylunium ≈ 3,250 km, zgodnie z opublikowanymi ≈ 6.56 d / ≈ 3,370 km (rozwiązanie CR3BP — kołowe, bez Słońca —, **nie** zwalidowane względem prawdziwych efemeryd LANS (Lunar Augmented Navigation Service)/Gateway; selenocentryczne przekształcenie MCI/MCMF (inercjalny księżycocentryczny / księżycocentryczny związany z Księżycem) skorygowanej orbity jest kolejnym krokiem); plus geometria PNT cislunarnego **LunaNet / LNIS** (LunaNet Interoperability Specification) (redukcja MCI↔MCMF, współrzędne selenograficzne) z przelotem **ARAIM nad biegunem południowym Księżyca**, który uczciwie ujawnia lukę integralności: σ_URE (błąd odległości użytkownika) ~30 m podnosi poziom ochrony znacznie powyżej granicy alarmowej 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); oraz **wzmocnienie DOP beaconami powierzchniowymi** (`src/lunar_beacon.rs`) pokazujące, jak kilka pomierzonych powierzchniowych beaconów odległościowych dostarcza niskoelewacyjnych, szeroko rozłożonych w azymucie wierszy linii widzenia, których brakuje zestawowi złożonemu wyłącznie z orbit nad głową — redukując źle uwarunkowany GDOP bieguna południowego oraz, poprzez budżet błędu sumy kwadratów, uzyskaną dokładność pozycji w metrach (z ponownym użyciem zwalidowanego względem gnss_lib_py jądra DOP i widoczności przy horyzoncie bez atmosfery w postaci zamkniętej; analiza rozmycia precyzji jest opisana w [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Pakiet PNT księżycowego** | Pakiet nawigacji księżycowej/cislunarnej zbudowany na rdzeniu CR3BP, każdy element jako uruchamialny `kind`: **Lunar Coordinate Time** (`lunar-time-offset`, `src/lunar_time.rs` — sekularne tempo LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL = jego forma francuska, Temps-Coordonnée Lunaire) z różnicy potencjału własnego + członu kinetycznego, podawane razem z opublikowanym pasmem 56–59 µs/dobę); geodezyjna obserwabla opóźnienia **księżycowego VLBI** (interferometrii wielkobazowej) (`lunar-vlbi`, `src/lunar_vlbi.rs` — opóźnienie + tempo z różnicy dwóch odległości w polu bliskim dla bazy ziemskiej, sprawdzone krzyżowo względem płaskofalowego Δ-DOR (delta differential one-way ranging) z tej samej bazy kodu w granicy pola dalekiego, pochodne cząstkowe zweryfikowane różnicami skończonymi); **wspólny wielotechnikowy estymator wsadowy OD + zegar** (`lunar-joint-od-clock`, `src/lunar_combination.rs` — dopasowanie Gaussa–Newtona łączące VLBI + lokalne odległości księżycowe + odległości międzysatelitarne) niosący wynik **obserwowalności z informacji Fishera**: same pomiary wewnętrzne pozostawiają sześciostopniowy **defekt układu odniesienia** bryły sztywnej, więc *bezwzględna* pozycja stacji powierzchniowej jest nieobserwowalna, dopóki nie doda się powiązania z układem ziemskim — opóźnienie **VLBI** z bazą ziemską *przywraca* obserwowalność dla rzadkiej konstelacji i *zaostrza* granicę Craméra–Rao dla bogatej, a bezwzględny układ odniesienia zamyka się przy **trzech** niewspółliniowych stacjach ziemskich (wynik dotyczący obserwowalności opisany w [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **realizacja układu odniesienia** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — 7-parametrowe dopasowanie układu Helmerta + powiązanie orientacji IAU 2015 WGCCRE — WGCCRE = IAU Working Group on Cartographic Coordinates and Rotational Elements); analiza **przestrzeni usług klasy Moonlight/LCNS** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / pokrycie / dostępność + uogólniona obwiednia księżycowego ARAIM HPL/VPL (poziomy/pionowy poziom ochrony), z ponownym użyciem zwalidowanego względem gnss_lib_py jądra DOP i mechanizmu LunaNet σ_URE≈30 m); **różnicowe PNT księżycowe** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — księżycowy odpowiednik różnicowego GNSS / satelitarnego systemu wspomagania (SBAS): dokładne znoszenie wspólnego błędu zegara + dekorelacja przestrzenna pierwszego rzędu w funkcji bazy, z ponownym użyciem poziomu ochrony SBAS DO-229E — DO-229E to norma minimalnych osiągów operacyjnych RTCA (dawniej Radio Technical Commission for Aeronautics) dla odbiorników SBAS); oraz **eksport interoperacyjny zgodny z LunaNet/IOAG** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + przekształcenie w obie strony skali czasu księżycowego w układzie ciała księżycowego IAU 2015, opakowane w kopertę KIF). Poziomy dowodowe dla każdego elementu znajdują się w [macierzy weryfikacji](docs/VERIFICATION-MATRIX.md): Lunar Coordinate Time, wspólny estymator OD + zegar, realizacja układu odniesienia i geometria przestrzeni usług są **VALIDATED** (każdy względem niezależnej wyroczni wskazanej w jego wierszu, podobnie jak ścieżka jądra opóźnienia VLBI); obserwabla VLBI, wynik obserwowalności defektu układu odniesienia, różnicowe PNT i eksport interoperacyjny są **MODELLED**. Parametry są **ilustracyjnymi wartościami z publicznych źródeł** — **nie** są zwalidowane względem prawdziwego śledzenia VLBI/Gateway, **brak** powiązania z jakąkolwiek agencją lub jej poparcia, brak deklaracji TRL (poziomu gotowości technologicznej) / dziedzictwa lotnego. |
| **PNT dalekiego kosmosu i Marsa** | Otwarty **silnik nawigacji radiometrycznej**: iteracyjny czas świetlny + relatywistyczne opóźnienie **Shapiro**, **Doppler i odległość** dwu-/jedno-/trójdrożne (dwuodcinkowe wg Moyera), koherentne współczynniki przetwarzania transpondera, pomiar odległości regeneracyjny/PN (pseudoszumowy) (CCSDS 414, norma pomiaru odległości pseudoszumowego) oraz **Δ-DOR** w płaszczyźnie nieba (CCSDS 506, norma Delta-DOR), z ośrodkami plazmy słonecznej/troposfery/jonosfery; parsowanie i emisja komunikatu danych śledzenia **CCSDS-TDM (503)**; **filtr informacyjny pierwiastkowy o zredukowanej dynamice** (empiryczne przyspieszenia RTN — radialne, poprzeczne, normalne — + 3-stanowy zegar pokładowy + opór atmosfery Marsa), który wykonuje **wyznaczanie orbity Mars-LMO do ≈ 0.2 m** w syntetycznej pętli zamkniętej; wspólny estymator **fuzji jednodrożnej + dwudrożnej**; rdzeń dynamiki wielu ciał (`Body{μ, re, zonals, gravity, IAU-pole}`, grawitacja Marsa GMM-3 (Goddard Mars Model 3), układ związany z Marsem wg IAU, wymienny punkt rozszerzenia `EphemerisProvider`, dwuczęściowe daty juliańskie + TT↔TDB (Barycentric Dynamical Time)); oraz scenariusz relay-PNT **`mars-pnt`** (konstelacja przekaźników areostacjonarnych MARCONI) z kompleksowym **symulatorem osiągów GSE** (GSE = sprzęt wsparcia naziemnego) (geometria → budżet łącza → obserwable → SRIF → kowariancja). **Zwalidowane symulacyjnie** (kowariancja / wskaźniki jakości w pętli zamkniętej); dynamika Marsa wokół Słońca jest sprawdzona krzyżowo względem JPL **DE440** (137 m przy łuku 1-dniowym, `xval/anise-mars-od`). Walidacja na prawdziwych danych śledzenia DSN/ESTRACK jest w planie rozwoju. |
| **Układ Słoneczny i PNT wokół dowolnego ciała** | **Efemerydy całego Układu Słonecznego** bez jąder (`src/ephem.rs`, `src/ephem_provider.rs`): każda planeta z **elementów keplerowskich Standisha** JPL (Tabela 1, 1800–2050 n.e.; Tabele 2a/2b, 3000 p.n.e.–3000 n.e.) z opublikowanym nominalnym błędem każdej planety, Ziemia i Księżyc rozdzielone szeregiem księżycowym, a Fobos, Deimos, Io, Europa, Ganimedes, Kallisto i Tytan z elementów średnich JPL i modelu rotacji IAU (International Astronomical Union); **dowolne ciało względem dowolnego innego** w ICRF (International Celestial Reference Frame). `Body` niesie teraz **GM (parametr grawitacyjny), promienie, J2 (drugą harmonikę strefową), gdzie została opublikowana, oraz biegun i południk zerowy IAU dla osiemnastu ciał**. Rodzaj **`solar-system`** podaje pozycje, prędkości, stałe, **czas świetlny i odległość jedno-/dwudrożną** między dowolnymi dwoma ciałami (istniejący solver radiometrycznego czasu świetlnego, ze słonecznym opóźnieniem Shapiro) oraz ślad orbity dla każdego ciała — wystarczająco, by narysować interaktywny Układ Słoneczny; rodzaj **`body-pnt`** pozycjonuje orbiter lub lądownik **wokół dowolnego ciała** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) z lokalną konstelacją Walkera, mechanizmem rozmycia precyzji i Gaussa–Newtona oraz odległością dalekiego kosmosu od Ziemi. **Zwalidowane** względem JPL Horizons (DE441, JPL Development Ephemeris 441): Merkury–Saturn i Ziemia z Tabeli 1 w granicach dwukrotności nominalnego błędu (najgorzej 1.87×), wszystkie osiem planet z Tabel 2a/2b (najgorzej 1.71×) oraz czas świetlny Ziemia–Mars/Jowisz. **Modelled**: Uran i Neptun z Tabeli 1 (2.0× i 5.2× podanego błędu względem DE441), Pluton, księżyce i wyniki nawigacji `body-pnt`. |
| **Połączone PNT MEO + LEO** | `src/leo_fusion/`: niezależne od systemu pozycjonowanie, nawigacja i synchronizacja czasu na LEO dla dowolnej konstelacji (powłoki Walkera, zestawy elementów, presety GNSS) i dowolnego sygnału (nośna, szybkość chipów, obwiednia C/N0, błąd odległości sygnału w przestrzeni), z opcjonalnymi jednoplikowymi presetami podającymi swoje źródła (Xona Pulsar X1/X5, Iridium STL, sygnały okazjonalne Starlink, CentiSpace, reprezentatywny system pasma C, model efemeryd bez zegara ATOMIC). **`leo-pvt`**: wsadowe **pozycjonowanie dopplerowskie** z tempa zmian odległości (jedno- i wielosatelitarne, stany dryfu zegara i prędkości, geometria wzdłuż/w poprzek toru w jednym przelocie i rozwiązanie lustrzane), **ważone najmniejsze kwadraty łączące GNSS + LEO** z biasami międzysystemowymi dla każdego systemu i sigmami dla każdego sygnału podawanymi przez wywołującego, DOP w funkcji liczby satelitów LEO, pokrycie **polarne i arktyczne** oraz **transfer czasu z LEO do UTC** w funkcji C/N0 i oscylatora. **`leo-ppp`**: EKF (rozszerzony filtr Kalmana) float PPP (precyzyjne pozycjonowanie punktowe) z samym GNSS i z LEO, jego czas zbieżności i test spójności NEES chi-kwadrat. **`ntn-positioning`**: pozycjonowanie w sieci nienaziemnej 5G z granicy Craméra-Rao pasma. **Zwalidowane**: obwiednia Dopplera LEO względem opublikowanych liczb Iridium i Xona. **Modelled**: pozostałe, z trendem PPP porównanym z Li et al. (2019) — zob. [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Integralność** | RAIM migawkowy i z separacją rozwiązań (w stylu ARAIM) — autonomiczne monitorowanie integralności w odbiorniku — z poziomymi/pionowymi poziomami ochrony (HPL/VPL), wykrywaniem i wykluczaniem błędów oraz diagramami integralności Stanford; poziom ochrony **wielohipotezowej separacji rozwiązań (MHSS)** z jawnym budżetem ryzyka integralności, w tym **tryb błędu całej konstelacji dla dwóch/wielu konstelacji** (EU (Unia Europejska) ARAIM / DO-316, norma osiągów RTCA dla pokładowego sprzętu GPS ze wspomaganiem pokładowym), sprawdzony na prawdziwej migawce GPS + Galileo (`scenarios/araim-gps-galileo.toml`). Poziom ochrony stosuje jednostronne rzutowanie **nominalnego biasu** `b_k = Σ_i|s_i|·b_nom` dla każdego trybu błędu oraz sigmę **integralności** σ_URA (dokładność odległości użytkownika; odrębna od dokładności σ_URE, błędu odległości użytkownika) z Integrity Support Message — zob. [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Jądro wykrywania (progi χ²/niecentralne χ²/normalne i mnożniki K) jest **zewnętrznie zwalidowane względem SciPy** w 171 przypadkach (`tests/raim_reference.rs`); geometria ponownie wykorzystuje zwalidowane względem gnss_lib_py jądro DOP. Sam *przydział budżetu* ryzyka integralności ARAIM MHSS nie ma opublikowanej wyroczni liczbowej i pozostaje uczciwie Modelled. |
| **Wspomaganie (SBAS)** | **Poziomy ochrony SBAS / WAAS** (WAAS = Wide Area Augmentation System) w postaci ważonych najmniejszych kwadratów DO-229E (współczynniki K dla podejścia precyzyjnego i fazy przelotowej) oraz **dwuczęstotliwościowa kombinacja wolna od jonosfery L1/L5** (L1 i L5 to dwa cywilne pasma sygnałów GPS; IS-GPS-705, specyfikacja interfejsu GPS dla sygnału L5, γ₁₅ ≈ 1.793), na której opiera się DO-316 — `src/sbas.rs`. Algorytm poziomu ochrony jest **zewnętrznie zwalidowany względem forka RTKLIB SBAS-PL** (RTKLIB = otwarta biblioteka pozycjonowania kinematycznego w czasie rzeczywistym; PL = poziom ochrony) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — poprzednia wersja DO-229 — App. J) uruchomionego na **prawdziwych danych EGNOS** (European Geostationary Navigation Overlay Service), odtwarzając jego HPL do < 2e-3 m (`tests/sbas_reference.rs`); gLAB (pakiet narzędzi GNSS Laboratory) v6.0.0 potwierdził identyczną konwencję. |
| **Zegar i synchronizacja czasu** | Dwustanowy holdover Kalmana (kowariancja w postaci Josepha, kontrola spójności NIS/NEES — znormalizowany kwadrat innowacji / znormalizowany kwadrat błędu estymacji); stabilność z rodziny Allana (ADEV / MDEV / TDEV / HDEV / MTIE — odchylenie Allana, zmodyfikowane Allana, czasowe i Hadamarda oraz maksymalny błąd przedziału czasu) z przedziałami ufności zależnymi od typu szumu i pełnym **pięciowspółczynnikowym dopasowaniem potęgowym IEEE-1139** (IEEE Std 1139, definicje metrologii częstotliwości i czasu Institute of Electrical and Electronics Engineers) — estymatory są zwalidowane na prawdziwym sprzęcie względem **Stable32**: **prawdziwy cezowy wzorzec pierwotny 5071A wobec masera wodorowego** (556,990 próbek fazy, 16 współczynników uśredniania, OADEV/OHDEV — nakładające się odchylenie Allana/Hadamarda — do 1e-3; `tests/cs5071a_reference.rs`) oraz **kanoniczny szereg regresyjny Stable32 PHASE.DAT** (139 współczynników uśredniania, OADEV/MDEV/TDEV do 1e-3; `tests/phasedat_reference.rs`); estymatory ADEV/MDEV/TDEV i telekomunikacyjna metryka wędrówki **MTIE** są dodatkowo sprawdzone krzyżowo względem **niezależnej biblioteki allantools 2024.06** do **< 1e-9** na szeregu NIST SP 1065 (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); poprawki geometryczne (Sagnac, wspólny widok GNSS); oraz operacyjne metody transferu — **TWSTFT** (dwudrożny satelitarny transfer czasu i częstotliwości) z postacią zamkniętą Sagnaca BIPM (International Bureau of Weights and Measures), **wspólny widok GNSS**, transfer czasu wolny od jonosfery **PPP** (precyzyjne pozycjonowanie punktowe), **optyczne** łącze w wolnej przestrzeni ze scyntylacją turbulencyjną oraz **skala czasu zespołu zegarów (papierowa)** ważona odwrotnością wariancji, poniżej najlepszego zegara składowego. **Kalkulator holdover zegara bez GNSS** (`src/holdover.rs`) udostępnia wzrost błędu w locie bez korekt według van Loana w postaci zamkniętej jako inwersję *holdover do progu* — jak długo zegar pracuje swobodnie, zanim jego błąd czasu przekroczy budżet — dla reprezentatywnych klas zegarów klasycznych i kwantowych; **modelled** (sprawdzone krzyżowo względem wielokrokowej rekurencji kowariancji `clock_state`) i uczciwie mówiące, że dla bardzo stabilnego zegara holdover do ścisłego progu wyznacza *zakładany* poziom szumu przy długim tau, a nie cytowane ADEV. **Warunkowy Timing Protection Level** (`src/tpl.rs`) rozszerza holdover na spoofing: granica *niewykrytego* błędu czasu, przy niezależnym sprawdzeniu krzyżowym, łącząca dolny poziom monitora k-sigma, wariancję lotu bez korekt van Loana w czasie opóźnienia wykrycia oraz czas do alarmu CUSUM (sumy skumulowanej). Skalibrowany na prawdziwym zapisanym spoofingu (JammerTest 2024) i odtwarzalny przez `cargo run --example tpl_jammertest`; kompozycja **MODELLED** (bez budżetu ryzyka integralności na godzinę), warunkowa względem wykrycia — nie ma skończonej granicy *bezwarunkowej*. |
| **Domena pomiarów GNSS** | Synteza pseudoodległości / Dopplera w przód z jonosferą **Klobuchara** (rozgłoszeniową) i **IONEX / siatką TEC** (IONosphere map EXchange format / całkowita zawartość elektronów; mierzoną) — w tym parser plików IONEX, interpolacja w czasie między mapami i odwzorowanie skośności cienkiej warstwy — troposferą **Saastamoinena + Niella** oraz migawkowym RAIM (HPL/VPL). |
| **Odporność** | **Zagłuszanie** w budżecie łącza (J/S → efektywne C/N₀ → utrata śledzenia — stosunek zagłuszarki do sygnału, stosunek nośnej do gęstości szumu — ze współczynnikiem separacji widmowej przeciwzakłóceniowej `Q` teraz **wyprowadzonym z rzeczywistych widm mocy sygnału i zagłuszarki** przez `src/navsignal.rs` — `Q = 1/(R_c·κ)`, sprawdzonym krzyżowo w CI względem poprzedniej reprezentatywnej stałej); stochastyczny **detektor spoofingu czasu** (test energii Neymana–Pearsona / χ²₁ z P_fa/P_md w postaci zamkniętej i Monte Carlo oraz wskaźnikiem jakości bezpieczeństwa (FoM) 1 − P_md); **wielowarstwowy detektor spoofingu** łączący test parzystości spójności RAIM (z uczciwie zamodelowanym martwym punktem dla błędów wspólnych), monitor mocy RF AGC (automatycznej regulacji wzmocnienia) i monitor jakości sygnału (SQM — monitorowanie jakości sygnału, early-minus-late); oraz **budżet błędu zliczania drogi kwantowo-inercjalnego** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`) łączący błądzenie losowe prędkości z szumu białego interferometru zimnych atomów z resztkowym biasem (sprawdzone krzyżowo względem niezależnego integratora `AccelModel`) i błędem współczynnika skali w liczbę dryfu pozycji w czasie holdover — inercjalny odpowiednik holdover zegara. **Silnik oceny odporności zgodny z ramami** (`src/resilience/`) odwzorowuje symulowane zachowanie architektury na podoceny dla każdego wymiaru w siedmiu własnych kategoriach odporności Kshana (nie są to terminy DHS), dopasowanych do US Department of Homeland Security Resilient PNT Conformance Framework, a następnie bada **stabilność decyzji** każdej pojedynczej oceny złożonej lub poziomu dojrzałości (Level) przy simpleksie wag Dirichleta i zespole pięciu zagrożeń — niestabilność rang tau Kendalla, częstość zmiany zwycięzcy top-1 oraz **zapaść różnorodności** dla błędów wspólnych (Hill-N2), z raportem zapewnienia zabezpieczonym skrótem integralności (35 ręcznie wyprowadzonych testów wyroczni). Odtwarzalne przez `cargo run --example resilience_report`; architektury syntetyczne **MODELLED**, samoocena dopasowana do RPCF v2.0, **nie** certyfikacja. Zob. [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Pasywna geolokalizacja RF** | **Geolokalizacja źródeł emisji TDOA/FDOA** (różnica czasu/częstotliwości nadejścia; `src/geolocation.rs`) — lokalizacja zagłuszarki lub źródła spoofingu (albo źródła okazjonalnego dla reverse-PNT) z hiperboloid **różnicy czasu nadejścia** w sieci odbiorników, rozwiązywana metodą najmniejszych kwadratów Gaussa–Newtona; dodanie **różnicy częstotliwości nadejścia** przy poruszających się odbiornikach łącznie odtwarza pozycję *i* prędkość źródła, z granicą **Craméra–Rao** kowariancji pozycji wyprowadzoną z geometrii sieci. **MODELLED** (wyrocznie spójności wewnętrznej: przejścia w przód→wstecz, tożsamość J·CRLB = I, monotoniczność GDOP i osiąganie przez estymator własnego CRLB w Monte Carlo) — model źródła punktowego w linii widzenia, bez członów wielodrogowości / NLOS (braku linii widzenia), biasu zegara odbiornika ani refrakcji. |
| **Sygnał nawigacyjny i śledzenie kodu** | **Poziom sygnału** między budżetem łącza a domeną pomiarów (`src/navsignal.rs`): **gęstości widmowe mocy** (PSD) o jednostkowym polu dla **BPSK-R(n)** (binarne kluczowanie fazy z prostokątnymi chipami) i **sine-BOC(m,n)** (binarna nośna z przesunięciem); **współczynnik separacji widmowej** (SSC) κ = ∫ G_s·G_i df, który **wyprowadza przeciwzakłóceniowe `Q`** używane przez model zagłuszania (`Q = 1/(R_c·κ)`) z rzeczywistych widm sygnału/zagłuszarki zamiast reprezentatywnej stałej; **szerokość pasma RMS (Gabora)** (BOC > BPSK — miara informacji o odległości / Craméra–Rao); **jitter szumu termicznego koherentnego śledzenia kodu early–late DLL** (DLL = pętla synchronizacji opóźnienia; Kaplan & Hegarty; ~poniżej metra dla C/A — kodu zgrubnego/akwizycji GPS — przy 45 dB-Hz); oraz **obwiednia błędu wielodrogowości** (koherentny EML, early-minus-late — tłumienie wąskim korelatorem). Zwalidowane względem punktów kotwiczących w postaci zamkniętej (własne SSC BPSK = 2/(3·R_c), PSD o jednostkowym polu, jitter C/A poniżej metra). To jest analiza **osiągów** sygnału, **nie** projektowanie sprzętu antenowego / ładunku RF (rola partnera od ładunku). |
| **Interoperacyjność** | Wczytywanie efemeryd rozgłoszeniowych wielu GNSS z **RINEX-3** (GPS, Galileo, QZSS — japoński Quasi-Zenith Satellite System —, BeiDou MEO/IGSO — średnia orbita okołoziemska / nachylona orbita geosynchroniczna — przez IS-GPS-200, specyfikację interfejsu GPS; GLONASS, rosyjski Global Navigation Satellite System, przez PZ-90 — rosyjski układ odniesienia Parametry Zemli 1990 — wektor stanu RK4) używalne jako źródło konstelacji (RINEX na wejściu, geometria PNT na wyjściu); parser obserwacji **RINEX-3** (pseudoodległość, faza nośnej, Doppler, siła sygnału; układ obserwacji 4.00 powinien być parsowany, ale nie jest przetestowany, a pliki nawigacyjne RINEX 4 są odrzucane po nazwie, zamiast być błędnie dekodowane), który teraz **zasila solver pozycjonowania pojedynczego punktu (SPP)** (`pvt`) — prawdziwe obserwacje kodowe na wejściu, prawdziwa **pozycja odbiornika** na wyjściu, zwalidowane na danych IGS; czytnik/zapis precyzyjnych efemeryd **SP3-c/d** z interpolacją Lagrange'a 9. rzędu; eksport **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) dla narzędzi dynamiki lotu (GMAT, Orekit, STK — Systems Tool Kit); oraz parsowanie i emisja komunikatu danych śledzenia **CCSDS-TDM (503)** dla radiometrycznego śledzenia w dalekim kosmosie. |
| **Analiza misji (inżynieria systemów)** | Budżety projektowania misji pierwszego rzędu, każdy jako uruchamialny rodzaj: dwuciałowa **geometria startu i wznoszenia** (`launch-window` — azymut startu `sin Az = cos i/cos lat`, minimalne nachylenie, premia z rotacji Ziemi, Δv zmiany płaszczyzny manewrem dogleg, dzienne okna startowe; `src/launch.rs`); **balistyczny korytarz wejścia w atmosferę Allena–Eggersa** (`reentry` — szczytowe opóźnienie, prędkość/wysokość przy szczytowym g, prędkość przy szczytowym nagrzewaniu; `src/reentry.rs`); **geometria pokrycia obserwacji Ziemi** (`eo-coverage` — pas / GSD w nadirze (odległość próbkowania terenu) / dostęp poza nadirem / ponowna wizyta przez trójkąt kosmiczny SMAD (*Space Mission Analysis and Design*); `src/eo_payload.rs`); **budżet błędu orientacji i wskazywania 3-DOF** (trzy stopnie swobody; `attitude-budget` — moment gradientu grawitacji w najgorszym przypadku + budżet wskazywania RSS (pierwiastek sumy kwadratów); `src/attitude_budget.rs`); **przewidywanie przelotów nad stacją naziemną** (`passes` — AOS/TCA/LOS, pozyskanie sygnału / czas największego zbliżenia / utrata sygnału, maks. elewacja, czas dostępu; `src/passes.rs`); oraz **jednodrożny budżet łącza** według równania łącza CCSDS 401 / DSN 810-005 (norma CCSDS dotycząca częstotliwości radiowych i modulacji / podręcznik projektowania łączy Deep Space Network; `link-budget` — FSPL (tłumienie w wolnej przestrzeni), C/N₀, Eb/N₀ (stosunek energii na bit do gęstości szumu), zapas, zamknięcie; `src/linkbudget.rs`). Analityczne budżety pierwszego rzędu **MODELLED** — warstwa przedsprzętowa poniżej STK/GMAT/Basilisk, a nie zamiennik 6-DoF ani radiometryczny. |
| **Analiza decyzyjna i kompromisy (MCDA)** | Pełny pakiet **wielokryterialnej analizy decyzyjnej** (MCDA) (`src/mcda/`) obejmujący wszystkie cztery rodziny metod — agregację wartości (**WSM**, **WPM**, **WASPAS** — model sumy ważonej, model iloczynu ważonego, ważona zagregowana ocena sumy i iloczynu), odległość od ideału (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), programowanie kompromisowe (**VIKOR**, z serbskiego: optymalizacja wielokryterialna i rozwiązanie kompromisowe) i przewyższanie (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, z francuskiego: eliminacja i wybór wyrażający rzeczywistość), plus system ilorazowy **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) i proporcjonalny **COPRAS** (Complex Proportional Assessment) — z ważeniem priorytetów przez porównania parami **AHP** (Analytic Hierarchy Process) (współczynnik spójności), niezdominowanym frontem **Pareto**, analizą **wrażliwości** wag i wieloatrybutową oceną **użyteczności**. Dziewięć agregatorów odtwarza niezależne biblioteki stron trzecich **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) i **pyDecision** (ELECTRE I, COPRAS) do **< 1e-9**, a wektor priorytetów AHP + współczynnik spójności zgadzają się z tabelą indeksu losowego Saaty'ego i głównym solverem wartości własnych SciPy/LAPACK do < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — warstwa decyzyjna pod silnikiem badań kompromisów. |
| **Środowisko kosmiczne** | **Model środowiska pogody kosmicznej** (`space-weather`, `src/space_weather.rs`): wskaźniki aktywności słonecznej (F10.7 / wycentrowane 81-dniowe F10.7a — strumień radiowy Słońca na 10.7 cm) i geomagnetycznej (Kp, planetarny indeks K, z definicyjną tabelą Kp↔ap — ap to jego liniowa amplituda planetarna), napędzana nimi temperatura egzosferyczna **Jacchia-1971** (zwalidowana względem opublikowanych wartości min/średniej/maks aktywności słonecznej) oraz skorygowana o aktywność wobec statycznej gęstość neutralnej termosfery na danej wysokości — zależność gęstości od cyklu słonecznego, którą pomija statyczna atmosfera USSA76 (US Standard Atmosphere 1976). **MODELLED**: skalibrowane sprzężenie wysokości skali pierwszego rzędu, **nie** atmosfera zwalidowana na danych (NRLMSISE — model US Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Exosphere). |
| **Ewaluacja AI/ML i kompromisy** | **Stanowisko ewaluacji wykrywania zaburzeń RF** (`impairment-eval`, `src/impairment_eval.rs`): oznaczony, oparty na parametrach **syntetyczny** korpus (nominalny / zagłuszanie / spoofing czasu / spoofing pozycji / wielodrogowość), niezależna od detektora uprząż **ROC/AUC** (charakterystyka operacyjna odbiornika / pole pod krzywą) oceniająca dowolny detektor (energy \| agc \| sqm \| parity \| fused) z Pd (prawdopodobieństwem wykrycia) dla każdej klasy przy docelowym Pfa (prawdopodobieństwie fałszywego alarmu) oraz **luką optymizmu** w rozkładzie wobec poza rozkładem (tryb przesunięcia rozkładu). Ponadto **kompromis PNT kwantowe wobec klasycznego** (`quantum-trade`, `src/quantum_trade.rs`) kwantyfikujący korzyść kandydującego zegara dla holdover czasowego/inercjalnego z krzywej **zmierzonego ADEV** wobec klasycznego punktu odniesienia, z zastrzeżeniem dotyczącym dolnego poziomu przy długim τ dołączonym do artefaktu oraz obwiednią odporności w czasie bez GNSS. **Metryki** ewaluacji (AUC / macierz pomyłek / Pd-Pmd, gdzie Pmd to prawdopodobieństwo pominięcia wykrycia) są **zwalidowane do dokładnej zgodności względem scikit-learn 1.9.0** — w tym na **prawdziwej telemetrii ESA OPS-SAT** (zbiór danych wykrywania anomalii OPSSAT-AD, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), gdzie ROC AUC Manna–Whitneya w Kshana odtwarza `roc_auc_score` scikit-learn do < 1e-9 na wydzielonym podziale testowym, a przejrzysty detektor liczby szczytów oddziela oznaczone anomalie przy AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`) — a numeryczne **jądra** silnika kompromisów (dopasowanie ADEV NNLS — nieujemne najmniejsze kwadraty —, pasma spójności χ², Q zegara van Loana) **względem scipy 1.17.1**; zbudowane na nich liczby korzyści urządzeń pozostają charakterystykami operacyjnymi **MODELLED** — nigdy dane terenowe/IQ (próbki w fazie/kwadraturze), żadnego werdyktu dobry/zły. Na bazie stanowiska głębsze **badanie luki optymizmu** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) ocenia panel **13 detektorów** (energy/AGC/SQM/parity plus detektory regresji logistycznej z ziarnem i MLP z jedną warstwą ukrytą — perceptron wielowarstwowy), dopasowuje **prawa skalowania** w rozkładzie wobec poza rozkładem z permutacyjną hipotezą zerową i uczy **predyktor leave-one-out** degradacji poza rozkładem na podstawie statystyk w rozkładzie (`cargo run --example optimism_study`). **Front-end odbiornika programowego** (`src/sdr.rs` — surowe IQ/IF (częstotliwość pośrednia) → odczepy korelatora early/prompt/late → SQM) i **adaptery wczytywania prawdziwych danych** (`src/realdata/` — RINEX, u-blox UBX (binarny protokół u-blox), GnssLogger, JammerTest, Yunnan, SatGrid) pozwalają uruchomić te same detektory na nagraniach dostarczonych lokalnie (żadne zbiory danych nie są zatwierdzane w repozytorium). **Mapa punktów przecięcia odporności kwantowej wobec klasycznej** przy niepewności parametrów (`src/crossover.rs`; `cargo run --bin crossover_study`) odtwarza badania punktów przecięcia dla nawigacji inercjalnej i zegarów stojące za wykresami w Wynikach. |
| **Demonstrator PNT z technologiami kwantowymi** | Trzy uruchamialne obszary zastosowań **MODELLED** za otwartym silnikiem, każdy emitujący uczciwe `TradeEvidence` + zapis reprezentatywności / luk do lotu (`src/representativeness.rs`): **zaufany kwantowy transfer czasu** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — kompleksowy budżet optycznego zegara sieciowego + łącza fotonicznego wobec CSAC (atomowego zegara w skali chipu) + dwudrożnego RF, z ponownie użytym poziomem ochrony czasu, wskaźnikiem jakości bezpieczeństwa wobec ataku opóźnienia/powtórzenia (1 − P_md) oraz wykrywaniem anomalii zegara + opóźnieniem CUSUM); **kwantowa nawigacja bez GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — lot inercjalny bez korekt na interferometrze zimnych atomów wobec INS klasy nawigacyjnej w czasie przerwy GNSS, uczciwie mówiący, że bez zewnętrznej pozycji bias akcelerometru jest nieobserwowalny, więc błąd nadal rośnie); oraz **wykrywanie błędów/anomalii** systemów kwantowych (`quantum-anomaly-detect`, `src/quantum_faults.rs` — oznaczony katalog błędów z ROC AUC z przedziałem ufności bootstrap z zewnętrznie zwalidowanego `eval_stats` i minimalnym wykrywalnym błędem przy ustalonym współczynniku fałszywych alarmów). Wspólna **biblioteka modeli błędów urządzeń kwantowych** (`src/quantum_devices.rs`) i ujednolicona **uprząż kompromisów kwantowe wobec klasyczne** (`src/qtrade.rs`) stanowią ich podstawę. Zwalidowane jądra, na których się opierają (metryki ewaluacji wobec scikit-learn, jądra kompromisów wobec scipy), są wykorzystywane ponownie; zbudowane na nich liczby korzyści urządzeń pozostają **MODELLED** — **ilustracyjne parametry urządzeń/łączy z publicznych źródeł**, modeluje się *klasę*, brak TRL / dziedzictwa lotnego / certyfikacji, brak poparcia agencji. |
| **Oszczędna inżynieria i wpływ na integralność** | Perspektywa **ROI kosztu na pokrycie** (zwrot z inwestycji) (`src/frugal.rs`) — koszt na jednostkę dostarczonego pokrycia dla kompromisu architektury — oraz odwzorowanie **pominięte wykrycie → wpływ na integralność** (`src/integrity_impact.rs`), które zamienia współczynnik pominiętych wykryć monitora w jego wkład w ryzyko integralności. Budżety wsparcia decyzji **MODELLED**, addytywne. |
| **Wymiana artefaktów** | **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — wersjonowana, samoopisująca się koperta opakowująca wynik scenariusza z jego rodzajem, wersją schematu i etykietami MODELLED/VALIDATED, dzięki czemu zapisany artefakt pozostaje samodokumentujący, a starsze koperty pozostają czytelne w sposób zgodny w przód. |

Każda możliwość jest dostępna jako API w Rust, uruchamialny `kind` scenariusza lub oba.
Dojrzałość każdej możliwości — *validated*, *runnable* lub *library* — jest śledzona w
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). **Sprawdzana maszynowo macierz weryfikacji**
(`src/verification.rs`) generuje zestawienie wymaganie → moduł → test → wyrocznia → status,
z przetestowanymi jednostkowo niezmiennikami uczciwości, które dopuszczają etykietę *validated*
tylko tam, gdzie wspiera ją niezależna **zewnętrzna** wyrocznia — i które zapisują
możliwości sprzętowe/PA (zapewnienia jakości produktu), których Kshana celowo **nie** zapewnia.

</details>

<details>
<summary>Cztery pakiety czujników w pierwotnie opublikowanej postaci (wyniki)</summary>

### Wyniki

Każdy scenariusz porównuje czujnik kwantowy z jego klasycznym odpowiednikiem w czasie
~1.8 h przerwy GNSS. Liczby są odtwarzalne (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Co dają czujniki kwantowe, gdy GNSS zniknie, scenariusz holdover zegara: kwantowy utrzymuje 6600 s autonomii wobec 2610 s klasycznego, znacznie mniejszy błąd czasu oraz dostępność 100% wobec 95.6%" width="88%">
  <br><sub>Co dają czujniki kwantowe, gdy GNSS zniknie — <code>clock-holdover</code> · ziarno 42 · narysowane w silniku 0.40.0, a każda powyższa liczba jest ponownie sprawdzana względem bieżącego silnika przy każdej kompilacji przez <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Przewaga **zależy od przerwy i wibracji**, z jawnym punktem równowagi, w którym wygrywa rozwiązanie klasyczne — pokazanym uczciwie na drabinie gotowości technologicznej (liczby dla zegara optycznego są celami demonstratora naziemnego; żaden strontowy zegar optyczny nie latał):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Punkt przecięcia holdover zegara kwantowego wobec klasycznego na drabinie gotowości technologicznej, z pasmami ufności" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Mapa cieplna przewagi inercjalnej kwantowej wobec klasycznej w funkcji czasu trwania przerwy i wibracji, z konturem równowagi, gdzie wygrywa rozwiązanie klasyczne" width="96%">
  <br><sub>Punkt przecięcia odporności kwantowej wobec klasycznej — drabina TRL holdover zegara (u góry) · mapa przewagi inercjalnej z konturem równowagi (u dołu). Do odtworzenia przez <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Inercjalne zliczanie drogi: błąd pozycji podczas przerwy GNSS — czujnik kwantowy (na zimnych atomach) pozostaje blisko linii specyfikacji, podczas gdy czujnik klasy nawigacyjnej rozbiega się do dziesiątek kilometrów" width="80%">
  <br><em>Błąd pozycji zliczania drogi podczas przerwy GNSS: czujnik kwantowy (niebieski)
  pozostaje płaski blisko specyfikacji; czujnik klasyczny (czerwony) rozbiega się do dziesiątek kilometrów.
  Wygenerowane przez Kshana z <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Pakiet | Scenariusz | Kwantowy | Klasyczny |
|------|----------|---------|-----------|
| **1 — Holdover zegara** | `clock-holdover.toml` (specyfikacja 20 ns) | zegar optyczny utrzymuje całą przerwę | CSAC przekracza specyfikację w połowie przerwy |
| **2 — Inercjalne zliczanie drogi** | `imu-deadreckoning.toml` (specyfikacja 100 m) | zimne atomy: **~41 m**, utrzymuje całą przerwę | klasa nawigacyjna: przekracza po **~350 s** → dziesiątki km |
| **3 — Transfer czasu** (optyczne łącze międzysatelitarne) | `timetransfer.toml` | optyczny: pomiar odległości **~0.3 mm** | RF (TWSTFT): pomiar odległości **~150 mm** |
| **4 — Fuzja hybrydowa** (zwieńczenie) | `hybrid-pnt.toml` | pełna pozycja+czas przez całą przerwę | **ograniczenie pozycji po ~350 s** |

Zwieńczenie pokazuje tezę o fuzji: optyczny międzysatelitarny transfer czasu utrzymuje w synchronizacji nawet
klasyczny *zegar*, izolując czujnik *inercjalny* jako słabe ogniwo zestawu klasycznego
— tj. kwantowa nawigacja inercjalna + optyczna synchronizacja czasu razem.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Holdover zegara: błąd fazy podczas przerwy GNSS — zegar optyczny pozostaje w granicach specyfikacji 20 ns przez całą przerwę, podczas gdy zegar w skali chipu przekracza ją w połowie przerwy" width="80%">
  <br><em>Holdover zegara w czasie przerwy GNSS: zegar optyczny (niebieski) pozostaje w granicach
  specyfikacji 20 ns przez cały lot bez korekt; zegar w skali chipu (czerwony) przekracza ją w trakcie.
  Wygenerowane przez Kshana z <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Kolejny scenariusz, `orbit-gnss-challenged.toml`, wyprowadza dostępność GNSS z
**geometrii orbitalnej** zamiast z ręcznie zdefiniowanych okien: statek kosmiczny wewnątrz powłoki GNSS
jest propagowany względem konstelacji Walkera podobnej do GPS, a liczba widocznych satelitów
(linia widzenia, zakrycie przez Ziemię, maska elewacji) wyznacza stan pozycji w każdym
kroku. W ciągu doby użytkownik ma pozycję tylko przez ~59% czasu; zegar kwantowy utrzymuje
rozwiązanie czasu 5 ns przez każdą lukę (dostępność **1.0**), zegar w skali chipu
tylko **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Orbita w trudnych warunkach GNSS: błąd czasu zegara w ciągu doby dla statku kosmicznego wewnątrz powłoki GNSS, gdzie luki w pokryciu są wyprowadzone z geometrii orbitalnej — zegar optyczny pozostaje w granicach specyfikacji 5 ns w lukach, podczas gdy zegar w skali chipu ją przekracza" width="80%">
  <br><em>Błąd czasu w ciągu doby przy dostępności GNSS wyprowadzonej z geometrii orbitalnej:
  liczba widocznych satelitów (linia widzenia, zakrycie przez Ziemię, maska elewacji) wyznacza stan
  pozycji w każdym kroku, więc zegar musi przejść każdą lukę bez korekt — zegar optyczny utrzymuje specyfikację 5 ns,
  podczas gdy zegar w skali chipu ją przekracza. Wygenerowane przez Kshana z
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

Konstelację można też podać jako prawdziwe zestawy elementów dwuwierszowych (TLE). *Pełny* TLE
(wiersz 1 + wiersz 2) jest propagowany pełnym modelem **SGP4/SDP4** — w tym
oporem atmosferycznym i członami dalekiego kosmosu księżycowo-słonecznymi oraz rezonansowymi 12 h / 24 h, które
mają znaczenie dla ~12-godzinnych orbit GNSS — zwalidowanym względem oficjalnych wektorów AIAA 2006-6753
do ≈ 4 mm w najgorszym przypadku. `scenarios/orbit-sgp4-gps.toml` zawiera **prawdziwą migawkę Celestrak
`gps-ops`** operacyjnej konstelacji GPS (2021-07-28, 30 satelitów)
i wymaga poprawnych sum kontrolnych TLE — zestawy elementów dwuwierszowych to otwarte dane z katalogu US
Space Force / 18th Space Defense Squadron, redystrybuowane przez Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); odświeżanie przez
`scripts/fetch_tles.sh`. Blok zawierający tylko wiersz 2 zachowuje
analityczną propagację dwóch ciał (`scenarios/orbit-real-tle.toml`); obie formy można
mieszać w jednej konstelacji. Konstelację można równie dobrze zbudować z bloku
rekordów **efemeryd rozgłoszeniowych GPS RINEX-3** — formatu, który dekoduje odbiornik —
propagowanych algorytmem użytkownika IS-GPS-200 i przepuszczanych przez tę samą geometrię
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Czym jest / czym nie jest, w całości</summary>

<a id="what-it-is--is-not"></a>
### Czym jest / czym nie jest

**Jest:** deterministycznym silnikiem o niewielu zależnościach, obejmującym stos PNT — geometrię
orbit, nawigację inercjalną, fuzję GNSS/INS, integralność, zegary i synchronizację czasu.
Uruchamia scenariusz (często przerwę GNSS), rozwija skalibrowane modele błędów czujników
przez odpowiedni estymator i ocenia wynik względem operacyjnych
wskaźników jakości — emitując odtwarzalny wynik JSON (JavaScript Object Notation) i wykres SVG, z
biblioteki Rust, interfejsu wiersza poleceń (CLI), rozszerzenia Python, modułu WebAssembly w przeglądarce,
**serwera Model Context Protocol (MCP)** dla agentów AI lub **wtyczki do IDE JetBrains (zintegrowanego
środowiska programistycznego)**.

**Nie jest:** sprzętem lotnym, projektem ładunku kwantowego, pełnym odbiornikiem
sygnałów GNSS, symulatorem sygnałów radiowych (RF) ani stanowiskiem hardware-in-the-loop, ani
certyfikowanym produktem awionicznym — i nie zastępuje MATLAB/Simulink, STK (Systems Tool
Kit) ani Orekit; działa obok nich i wymienia z nimi pliki. Wierność odwzorowania sprzętu kwantowego pochodzi z
opublikowanych modeli błędów, a nie z tego narzędzia. Szczegółowa dojrzałość każdej
możliwości jest udokumentowana w [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Nie jest (jeszcze):** *pełnym* silnikiem fizyki interferometrii atomowej (większość czujników kwantowych
korzysta z opublikowanych współczynników Allana/budżetu szumu; akcelerometr CAI (interferometr zimnych atomów) ma
warstwę opartą na pierwszych zasadach — faza Macha–Zehndera, szum projekcji, zanik kontrastu i
sprzężenie z wibracjami, plus błędy systematyczne Coriolisa i przesunięcia światłem — ale błędy systematyczne czoła fali i
rozstrzyganie niejednoznaczności prążków pozostają warstwą planu rozwoju **P2** (faza 2 planu rozwoju, warstwa fizyki kwantowej),
zob. [`ROADMAP.md`](ROADMAP.md) i [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
certyfikowanym ani sprzętowym odbiornikiem GNSS (rozwiązuje pozycję jednopunktową **PVT** (pozycja, prędkość i czas)
z prawdziwych obserwacji kodowych RINEX (Receiver Independent Exchange Format) — zwalidowaną
na prawdziwych danych IGS (International GNSS Service) — a jego warstwa IQ (`kshana iq`, od 0.31.0)
programowo akwiruje i śledzi zapisane lub wygenerowane próbki w paśmie podstawowym, jako odbiornik
analityczny: nie steruje sprzętem radiowym ani nie nadaje, nie jest certyfikowanym odbiornikiem i nie wykonuje
pozycjonowania fazowego (RTK ani PPP)); ani pełnym pakietem projektowania misji (ma elementy składowe Lambert / porkchop /
manewry / wyznaczanie orbity, ale jest warstwą symulacji osiągów
*nad* GMAT (General Mission Analysis Tool)/Orekit, a nie ich zamiennikiem). Ten zakres jest celowy. Jeśli potrzebujesz budżetów błędów
interferometru zimnych atomów opartych na pierwszych zasadach (np. klasy CARIOQA-PMP — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — lub walidacji w stylu X-37B), zob.
plan rozwoju P2 i [skontaktuj się](#support--professional-services), aby współpracować.

</details>

### Nawigacja na niskiej orbicie okołoziemskiej

Satelity na niskiej orbicie okołoziemskiej (LEO) przelatują szybko i nadają głośno. Rodzaj `leo-pnt-chain` śledzi jeden
system przez każdy etap: sygnał, przelot i jego łącze, komunikat nawigacyjny oraz
połączoną pozycję, prędkość i czas (PVT) i precyzyjne pozycjonowanie punktowe (PPP). Każdy
etap przekazuje swoje liczby następnemu. Zob. [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="Łańcuch PNT LEO z prawdziwego przebiegu leo-pnt-chain (leo-pnt-end-to-end.toml): etap sygnału (generic-l przy 1191.795 MHz, pilot śledzony przy 10.23 Mchip/s) przekazuje do etapu przelotu (1080 km, szczyt śledzonego C/N0 58.2 dB-Hz), który przekazuje do komunikatu nawigacyjnego (kepler-rac, dopasowanie 300 s, SISRE reprezentacji 0.91 mm RMS, 0.250 m z wyznaczaniem orbity), który zasila połączoną pozycję (sam GNSS 1.60 m RMS 3D, GNSS plus LEO 0.43 m) i precyzyjne pozycjonowanie punktowe (zbieżność 11.5 min sam GNSS, 7.5 min z 240 satelitami LEO). Między etapami przekazywanych jest 11 wartości." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Każdy rodzaj scenariusza według rodziny

Rodzaje scenariuszy silnika, pogrupowane w rodziny. Każda rodzina ma stronę z jednym wpisem na rodzaj (opis
i pola silnika, przykładowe polecenie, główne liczby z przebiegu, wiersze
[macierzy weryfikacji](docs/VERIFICATION-MATRIX.md), które go wymieniają, oraz wykres zapisywany przez sam silnik) i
arkusz zbiorczy tych wykresów; [`docs/KINDS.md`](docs/KINDS.md) indeksuje je wszystkie. Tabelę zapisuje
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py), a strony
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), i oba kończą się niepowodzeniem, jeśli silnik zyska rodzaj, którego nie wymienia żadna rodzina.

<!-- generated:kind-families -->
| Rodzina | Na co odpowiada | Rodzaje | Uruchom jeden |
|---|---|---|---|
| **[Zegary, synchronizacja czasu i holdover](docs/kinds/clocks-timing-and-holdover.md)** | jak długo zegar utrzymuje czas bez GNSS i jak system synchronizacji czasu wypada względem swoich masek | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Nawigacja inercjalna, fuzja i czujniki kwantowe](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | zliczanie drogi i fuzja czujników w czasie przerwy GNSS, z czujnikami klasycznymi i kwantowymi | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[Alternatywne PNT bez GPS](docs/kinds/gps-denied-alternative-pnt.md)** | nawigacja na podstawie grawitacji, terenu i innych pól, gdy GNSS zniknie | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Konstelacje, pokrycie i geometria](docs/kinds/constellations-coverage-and-geometry.md)** | gdzie są satelity, kto je widzi i jak dobra jest geometria, wokół Ziemi, Księżyca lub Marsa | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[Pomiary GNSS, pozycjonowanie i integralność](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudoodległości, wyznaczanie pozycji, poziomy ochrony i środowisko kosmiczne | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Zagłuszanie, spoofing i widmo](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | jak zakłócenia docierają do odbiornika i czy są wykrywane | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Nawigacja na niskiej orbicie okołoziemskiej](docs/kinds/low-earth-orbit-navigation.md)** | przelot, łącze, komunikat nawigacyjny i fuzja pozycji, etap po etapie | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Księżyc i przestrzeń cislunarna](docs/kinds/lunar-and-cislunar.md)** | nawigacja, czas, układy odniesienia i geodezja przy Księżycu | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Nawigacja użytkownika w przestrzeni kosmicznej](docs/kinds/space-user-navigation.md)** | sygnały GNSS dla statków kosmicznych powyżej, wokół i poza orbitami GNSS | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Optyczne PNT](docs/kinds/optical-pnt.md)** | łącza optyczne przez atmosferę i wskaźniki jakości optyczno-radiowe | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Analiza misji, łącza i operacje kosmiczne](docs/kinds/mission-analysis-links-and-space-operations.md)** | start, wznoszenie, wejście w atmosferę, orientacja, łącza, planowanie kontaktów i formaty plików | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Wątki misji](docs/kinds/mission-threads.md)** | budżet błędu nawigacji i synchronizacji czasu łańcucha faz od startu do wejścia w atmosferę | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Kampanie](docs/kinds/campaigns.md)** | łańcuchowe misje, przeglądy parametrów i zespoły zbudowane z innych rodzajów | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Każde polecenie

`kshana <scenario.toml>` uruchamia scenariusz; każde inne polecenie jest podpoleceniem, a `kshana --help` wypisuje sposób użycia
wszystkich. Polecenia to `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (z `live` i
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` i `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) podaje cel każdego z nich, sprawdzony przykład i jego stronę dokumentacji.

<a id="every-surface"></a>
### Każdy interfejs

Jeden silnik, te same wyniki wszędzie: wiersz poleceń, biblioteka Rust, Python, JavaScript i WebAssembly,
serwer MCP z poleceniami i umiejętnościami (skills) wtyczki, Kshana Studio (każda strona działa w przeglądarce, bez instalacji, nic nie jest wysyłane),
integracje ROS 2, Signal K, OpenCPN, GNSS-SDR i `gnss_lib_py`, zestawy wdrożeniowe systemd, Docker i Grafana oraz
wtyczka JetBrains. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) wymienia je wraz ze sposobem uzyskania każdego i nazwami wszystkich
poleceń wtyczki, umiejętności i stron Studio; [`docs/SURFACES.md`](docs/SURFACES.md) mówi dla każdego polecenia i rodzaju,
który interfejs je obsługuje, a który nie, wraz z powodem.

<a id="how-a-run-works"></a>
## Jak działa przebieg

Scenariusz to plik TOML (Tom's Obvious, Minimal Language): rodzaj, ziarno i
parametry. Silnik go uruchamia i zapisuje wynik, wykres i raport obok niego oraz
eksporty, o które poprosisz.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Jak przebiega przebieg. Plik scenariusza TOML (rodzaj, ziarno i jego parametry) trafia do silnika, kshana 0.40.0, przez rozdzielanie api::run_toml na 92 rodzaje scenariuszy, deterministycznie na podstawie scenariusza, ziarna i wersji silnika. Silnik zapisuje result.json, chart.svg, report.html i report.json, table.csv dla rodzajów, które ją definiują, oraz na żądanie eksporty SP3, CCSDS OMM i OEM, CZML, KML, GeoJSON, STK i SigMF; zestaw (suite) zapisuje study.json i study.html. Te pliki zasilają Kshana Studio w przeglądarce, asystenta AI przez serwer kshana-mcp oraz ciągłą integrację." width="100%">
</picture>

Ten dołączony scenariusz trwa 2 h: 10 min GNSS, a potem około 1.8 h bez GNSS. Pyta,
jak długo strontowy optyczny zegar sieciowy i atomowy zegar w skali chipu (CSAC) utrzymują
czas z dokładnością do 20 ns.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

Zegar optyczny utrzymuje budżet 20 ns przez całą przerwę 6600 s; CSAC utrzymuje go przez
2610 s i mieści się w budżecie przez 95.6% przebiegu wobec 100% dla zegara optycznego.
`kshana example` wymienia każdy dołączony scenariusz.

<a id="missions"></a>
## Misje

Dziesięć sektorów zadaje temu samemu silnikowi dziesięć różnych pytań. Każdy ma dołączone scenariusze,
od których można zacząć.

| Sektor | Zacznij od |
|---|---|
| Obronność i bezpieczeństwo | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Przestrzeń kosmiczna, orbita okołoziemska | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Księżyc, Mars i daleki kosmos | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Lotnictwo i drony | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Żegluga | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Transport drogowy | `automotive-urban-canyon` |
| Kolej | `rail-tunnel-coast` |
| Infrastruktura krytyczna i synchronizacja czasu | `clock-holdover`, `clock-ensemble` |
| Telekomunikacja i 5G (piąta generacja sieci komórkowych) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Nauka i badania | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>Pytanie, które zadaje każdy sektor</summary>

<br>

| Sektor | Pytanie, które zadaje | Zacznij od |
|---|---|---|
| **Obronność i bezpieczeństwo** | Jak długo nasza nawigacja i synchronizacja czasu pozostają wiarygodne przy zagłuszaniu i spoofingu i które warstwy utrzymują nas w specyfikacji? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Przestrzeń kosmiczna: orbita okołoziemska** | Czy mój statek kosmiczny widzi wystarczająco dużo satelitów nawigacyjnych, jak długo jego zegar utrzymuje czas między pozycjami i co dodałaby warstwa nawigacyjna na niskiej orbicie? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Księżyc i daleki kosmos** | Czy lądownik, łazik lub orbiter przy Księżycu, przy Marsie lub dalej uzyska wiarygodną pozycję i czas? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Lotnictwo i drony** | Gdy zagłuszarka odbierze GNSS, jak długo mój bezzałogowy system powietrzny (UAS) pozostaje w swoim budżecie pozycji i czy integralność jest dostępna na mojej trasie? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Żegluga** | Jak daleko nad wodą sięga zagłuszarka, czy przesunięcie pozycji zostałoby wychwycone i jak długo statek może płynąć bez korekt do portu? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Transport drogowy i motoryzacja** | Jak daleko dryfuje samochód pod wiaduktem lub obok przydrożnej zagłuszarki? | `automotive-urban-canyon` |
| **Kolej** | Przez ile sekund w tunelu pociąg nadal wie, na którym torze jest? | `rail-tunnel-coast` |
| **Infrastruktura krytyczna i synchronizacja czasu** | Jeśli czas GNSS zostanie utracony lub sfałszowany, jak długo sieć energetyczna, platforma obrotu lub centrum danych utrzymują identyfikowalny czas? | `clock-holdover`, `clock-ensemble` |
| **Telekomunikacja i 5G** | Jeśli odniesienie czasu GNSS zostanie utracone, czy zegar mojej sieci pozostaje w maskach ITU-T i jak długo? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Nauka i badania** | Czy mogę odtworzyć, rozszerzyć i zacytować wynik PNT, aż do ziarna? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Dowody

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 sprawdzony względem wszystkich 666 wektorów referencyjnych AIAA 2006-6753, najgorszy błąd pozycji 4.12 mm"></a></p>

<strong>176 z 401</strong> możliwości zwalidowanych względem niezależnych zewnętrznych wyroczni; 221 uczciwie oznaczonych jako Modelled.
Każdy wiersz macierzy weryfikacji wymienia możliwość, wyrocznię, względem której jest sprawdzana,
test, który wykonuje sprawdzenie, oraz wynikającą z tego etykietę. Ciągła integracja (CI) uniemożliwia
nazwanie możliwości VALIDATED bez niezależnej zewnętrznej wyroczni.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Jak możliwość zdobywa swoją etykietę. Każdy wiersz macierzy weryfikacji wymienia możliwość, wyrocznię, względem której jest sprawdzana, test, który wykonuje sprawdzenie w ciągłej integracji, oraz wynikającą z tego etykietę. Wiersz może być VALIDATED tylko przy niezależnej zewnętrznej wyroczni; w przeciwnym razie jest MODELLED albo PARTNER, gdy należy do partnera sprzętowego. Przykład: SGP4/SDP4, Cowell 6-DOF + perturbacje, wsadowe/sekwencyjne OD, wyrocznia wektory weryfikacyjne SGP4 AIAA 2006-6753, test tests/sgp4_verification.rs, etykieta VALIDATED. Bieżące liczby: 176 VALIDATED, 221 MODELLED, 4 PARTNER z 401 wierszy. Łącznie 176 możliwości zwalidowanych względem niezależnych zewnętrznych wyroczni; kolejne 221 jest uczciwie oznaczonych jako MODELLED, a 4 należą do partnera (PARTNER)." width="100%">
</picture>

| Etykieta | Wiersze | Znaczenie |
|---|---|---|
| VALIDATED | 176 | niezależna zewnętrzna wyrocznia się zgadza: prawdziwe dane, niezależna implementacja lub opublikowane wektory referencyjne |
| MODELLED | 221 | sprawdzone względem prawdy analitycznej lub samospójności symulacji i powiedziane wprost |
| PARTNER | 4 | należy do partnera sprzętowego; Kshana nie ma dla niego wyroczni |

Kilka ze sprawdzeń: wszystkie 666 wektorów SGP4 (Simplified General Perturbations 4) AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 do 4.12 mm; model sił Cowella
do 0.08 m względem Orekit 12.2; Galileo do 0.61 m i Swarm-A do 0.10 m względem prawdziwych
precyzyjnych efemeryd Europejskiej Agencji Kosmicznej (ESA). Testy utrzymują pokrycie wierszy bliskie 95 % katalogu
`src/`, wymagane na poziomie 85 % w CI. Rejestrem jest
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), generowany z
`src/verification.rs`: [pełna macierz 401 wierszy](docs/VERIFICATION-MATRIX.md), a dlaczego każdy
wiersz Modelled nie ma zewnętrznej wyroczni, wyjaśnia [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Jak działa walidacja, wybrana tabela najważniejszych wyników i wykresy dowodowe</summary>

### Walidacja, odtwarzalność i uczciwość

- Każdy człon szumu jest skalibrowany do **opublikowanej, cytowanej** wartości i zwalidowany
  względem standardowej zależności (odchylenie Allana dla zegarów; wzrost błędu zliczania drogi
  wg Grovesa dla nawigacji inercjalnej; przeliczenie czas→odległość dla transferu czasu). Status
  każdego członu jest śledzony w [`docs/VALIDATION.md`](docs/VALIDATION.md) jako `validated` lub
  `not modeled` — nic, co nie jest zwalidowane, nie jest przedstawiane jako zwalidowane.
- **Odtwarzalne z założenia:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` to wymusza; przebiegi kwantowe i klasyczne używają
  niezależnych ziaren, więc ich szum jest nieskorelowany.
- Dojrzałość jest podawana uczciwie: liczby dla zegara optycznego i łącza optycznego są wynikami *celów /
  demonstratora naziemnego*, nie były w locie.

### Etykieta dowodowa na każdym wykresie

Każdy wykres i tabela zapisane przez przebieg mówią, na ile można im ufać i na których wierszach rejestru się opierają. Wynik JSON ma
klucz `evidence`, wykres SVG wiersz pod wykresem (oraz element `<metadata id="kshana-evidence">`), a tabela CSV
wiersze komentarza `# evidence:` na początku (czytaj z `comment='#'`). Wymienia poziom, `VALIDATED`, `MODELLED` lub `PARTNER`, oraz
identyfikatory (`VM-` i osiem cyfr szesnastkowych) wierszy macierzy weryfikacji, które przebieg wykorzystał. Poziom jest najsłabszym z tych
wierszy, więc przebieg, który opiera się na jednym wierszu modelowanym, jest oznaczony jako MODELLED niezależnie od tego, ile zwalidowanych wierszy stoi obok; etykieta
nigdy nie może twierdzić więcej niż rejestr. Wiersze, statusy i identyfikatory są odczytywane z macierzy, a nie wpisywane ręcznie
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), a
`tests/evidence_labels_doc_sync.rs` kończy się niepowodzeniem, jeśli wykres nie ma etykiety lub etykieta nie zgadza się z macierzą.

### Walidacja w skrócie

Każdy wiersz jest wymuszany przez nazwany test w CI. Ta tabela to **wybór najważniejszych wyników**;
pełna sprawdzana maszynowo macierz to **401 wierszy — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), a kompletne dowody (i to, co uczciwie *nie* jest jeszcze
zwalidowane) znajdują się w [`docs/VALIDATION.md`](docs/VALIDATION.md) oraz w artefakcie każdego wydania
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
(generowanym przez `cargo run --bin validation_report`, z atestacją SLSA — Supply-chain
Levels for Software Artifacts).

Kolumna **Status** podaje *rodzaj* dowodu, zgodnie z powyższą drabiną walidacji: **VALIDATED** = sprawdzone względem niezależnej zewnętrznej wyroczni (prawdziwe dane, niezależna biblioteka lub opublikowane wektory referencyjne); **MODELLED** = sprawdzone względem prawdy analitycznej lub samospójności symulacji (bez niezależnego zewnętrznego zbioru danych). VALIDATED opisuje *metodę* sprawdzenia, a nie wynik zaliczony/niezaliczony — uczciwe chybienie względem prawdziwej zewnętrznej wyroczni pozostaje VALIDATED, natomiast porównanie, którego żaden wiersz macierzy nie wymienia jako wyroczni (powyższe dopasowanie LRO — Lunar Reconnaissance Orbiter), jest pokazane jako MODELLED. Wiersze `CI` są zabezpieczeniami procesu, a nie wskaźnikami jakości. Kilka wysp prawdziwych danych (zmierzony zegar cezowy, Stable32 PHASE.DAT oraz sprawdzenia OPS-SAT/ICGEM, gdzie surowe dane wejściowe nie mają licencji na redystrybucję) jest **zależnych od danych**: test wypisuje informację o pominięciu i pozostaje zielony, gdy brak danych wejściowych, a publiczne liczby referencyjne są zatwierdzone w `tests/fixtures/`. Surowe dane wejściowe odtworzysz odpowiednim `scripts/fetch_*.sh`.

| Status | Możliwość | Zgodność | Odniesienie / wyrocznia |
|--------|------------|-----------|--------------------|
| **VALIDATED** | Propagacja SGP4/SDP4 | 666/666 wektorów, najgorzej **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + bezpośrednie porównanie z niezależnym crate `sgp4` |
| **VALIDATED** | Układy odniesienia — nutacja IAU 2000A/B, łańcuch CIO IAU 2006/2000A, ERA | **bit w bit** (X,Y do 1e-14, s do 1e-18, ERA do 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS wobec niezależnego silnika SPICE | maks. **0.028″** → ≤ 0.86 m na ziemi, ≤ 3.6 m na orbicie GNSS | ANISE (czysto rustowy NAIF/SPICE), te same EOP IERS `finals2000A`, 8 epok 2020–2023 (porównane z tym odniesieniem; żaden wiersz macierzy weryfikacji nie wymienia go jako zewnętrznej wyroczni, więc nie jest oznaczone jako VALIDATED) |
| **MODELLED** | Geopotencjał EGM2008 (stopień/rząd 70) | przyspieszenie = ∇V do **< 1e-6**; redukcja strefowa do zwalidowanego J2 | współczynniki NGA EGM2008 + analityczna tożsamość ∇V |
| **VALIDATED** | Synteza funkcjonałów grawitacji (mapa do nawigacji wspomaganej grawitacją / bez GNSS) | GRS80 Somigliana + γ_e/γ_p do **3.5e-12**; mapa zaburzeń z prawdziwego EGM2008 fizyczna (RMS ≈ 26 mGal, st./rz. 70) | grawitacja normalna Somigliany GRS80 (Moritz 1980, IAG — International Association of Geodesy) + prawdziwy ICGEM EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Estymatory Allana (ADEV/MDEV/TDEV/HDEV) + pasma ufności | odtwarzają odchylenia referencyjne; pasma χ² zgodne | NIST SP 1065 (Riley), 1000-punktowa Tabela 31/32 |
| **VALIDATED** | Estymatory Allana na **prawdziwym zmierzonym zegarze cezowym** | OADEV/OHDEV do **1e-3** (zaobserwowane ≤ 3e-5), 16 współczynników uśredniania | Stable32 na prawdziwym Cs 5071A wobec masera H, 556,990 punktów (`tests/cs5071a_reference.rs`, zależne od danych) |
| **VALIDATED** | Estymatory Allana na **kanonicznym Stable32 PHASE.DAT** | OADEV/MDEV/TDEV do **1e-3** (zaobserwowane ≤ 5e-5), 139 współczynników uśredniania | odchylenia referencyjne Stable32 dla PHASE.DAT (`tests/phasedat_reference.rs`, zależne od danych) |
| **MODELLED** | Model błędów IMU — ARW / VRW / niestabilność biasu | odtworzone do **< 5 %** (niestabilność biasu < 15 %) | karta katalogowa Analog Devices ADIS16465; profil referencyjny NaveGo |
| **VALIDATED** | Numeryczny propagator Cowella + model sił (poziomy zachowawcze) | najgorszy błąd pozycji **0.08 m** w 24 h, 278 epok (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Poziom oporu w modelu Cowella + bezwzględne efemerydy Słońca/Księżyca i dane wejściowe gęstości | poziom oporu scharakteryzowany ≈ 333 m / 24 h; niezaburzony zgodny z Keplerem w zmiennych uniwersalnych poniżej metra, energia/moment ~1e-9 | wbudowane efemerydy niskiej precyzji + analityczny Kepler |
| **MODELLED** | Lambert · Ciołkowski · porkchop | przejście w obie strony do prawdy dwóch ciał; ΔV **< 0.01 %** | Izzo 2015 · równanie rakietowe · analityczna dolna granica Hohmanna |
| **MODELLED** | Wyznaczanie orbity (wsadowe Gaussa–Newtona) | poniżej metra / mm·s⁻¹ bez szumu; ~2 m przy poziomie szumu 5 m | dwa ciała + J2 na łuku RK4 |
| **MODELLED** | Dopasowanie modelu sił do precyzyjnych efemeryd Galileo (pełny łuk) | **0.61 m** RMS 3-D, 24 h, st./rz. 70, tylko siły | orbita końcowa ESA/ESOC `ESA0MGNFIN` (E11), prawdziwe EOP `finals2000A` (porównane z tym odniesieniem; żaden wiersz macierzy weryfikacji nie wymienia go jako zewnętrznej wyroczni, więc nie jest oznaczone jako VALIDATED) |
| **MODELLED** | Dopasowanie modelu sił do precyzyjnych efemeryd Swarm-A (zredukowana dynamika) | **0.10 m** RMS 3-D (granica poziomu empirycznego, nie miara) | precyzyjna orbita ESA `SW_OPER_SP3ACOM_2_` (porównane z tym odniesieniem; żaden wiersz macierzy weryfikacji nie wymienia go jako zewnętrznej wyroczni, więc nie jest oznaczone jako VALIDATED) |
| **MODELLED** | Dopasowanie modelu sił do księżycowego LRO (uczciwe chybienie) | **6.67 m** przy zredukowanej dynamice, *powyżej* celu 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (porównane z tym odniesieniem; żaden wiersz macierzy weryfikacji nie wymienia go jako zewnętrznej wyroczni, więc nie jest oznaczone jako VALIDATED) |
| **MODELLED** | OD Marsa w dalekim kosmosie (SRIF o zredukowanej dynamice) | **≈ 0.2 m** Mars-LMO (FoM symulacji, *nie* prawdziwa misja) | syntetyczne OD w pętli zamkniętej — walidacja mechanizmu estymatora |
| **MODELLED** | Dynamika Marsa wokół Słońca wobec JPL DE440 | **137 m przy łuku 1-dniowym** (rośnie z łukiem = niemodelowane n ciał) | JPL DE440 przez ANISE (`xval/anise-mars-od`, zależne od jądra) (porównane z tym odniesieniem; żaden wiersz macierzy weryfikacji nie wymienia go jako zewnętrznej wyroczni, więc nie jest oznaczone jako VALIDATED) |
| **VALIDATED** | Pozycjonowanie pojedynczego punktu wobec pomierzonej współrzędnej IGS (prawdziwe obserwacje) | **5.7 m** RMS 3-D / **1.1 m** w poziomie, dwuczęstotliwościowe SPP kodowe wolne od jonosfery | pomiar stacji IGS ABMF + efemerydy rozgłoszeniowe GPS, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Ściśle sprzężony UKF GNSS/INS | **0.77 m RMS** w 30-minutowym przelocie LEO z 120-sekundową przerwą | lot bez korekt na modelu sił, wyprowadzone ręcznie |
| **MODELLED** | Nawigacja z mapą grawitacyjną bez GPS | dryf INS ~70 km → odtworzone do **~145 m** | cel ESA NAVISP *Quantum Wayfarer* |
| **MODELLED** | Nawigacja odniesiona do terenu (TERCOM/SITAN) | dryf 70 km → **< 500 m** (dolna granica rozdzielczości siatki ~140 m) | DEM SRTM `.hgt`; ręcznie wprowadzony dryf (sprawdzenie bez zamkniętego koła) |
| **MODELLED** | Główne pole IGRF-14 (stopień/rząd 13) | biegun ~80.7°N, dipol ~29.7 µT, fizyczne pasmo 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (półznormalizowane Schmidta) |
| **MODELLED** | Modulacja sygnału nawigacyjnego i śledzenie kodu | własne SSC BPSK = **2/(3·R_c)**; PSD o jednostkowym polu; jitter DLL C/A **poniżej metra** przy 45 dB-Hz | punkty kotwiczące SSC/PSD w postaci zamkniętej + wzór Kaplana i Hegarty'ego na szum termiczny DLL |
| **MODELLED** | Korektor różniczkowy halo/NRHO w CR3BP | STM = różnice skończone; orbita zamyka się z **precyzją maszynową**; NRHO 9:2 wokół L2 **≈ 6.57 d / perylunium ≈ 3,250 km** | sprawdzenie STM różnicami skończonymi + opublikowana południowa NRHO 9:2 wokół L2 (≈ 6.56 d / ≈ 3,370 km) — CR3BP, nie prawdziwe efemerydy Gateway |
| **MODELLED** | Integralność ARAIM dla dwóch konstelacji | tryb błędu całej konstelacji na prawdziwych GPS + Galileo | EU ARAIM TR (raport techniczny) / DO-316; Celestrak `gps-ops` 2021-07-28 (porównane z tym odniesieniem; żaden wiersz macierzy weryfikacji nie wymienia go jako zewnętrznej wyroczni, więc nie jest oznaczone jako VALIDATED) |
| **VALIDATED** | Geometria GNSS / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | zgodność do **1e-6 względnie** w 8 geometriach (od dobrze uwarunkowanych do prawie osobliwych) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — niezależna biblioteka (`tests/dop_reference.rs`) |
| **VALIDATED** | Metryki ewaluacji detektorów ML (AUC/ROC/macierz pomyłek/Pd-Pmd/precyzja/F1) | **dokładne liczności + < 1e-9** w 5 zbiorach danych × 24 progach | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — niezależna biblioteka (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC AUC wykrywania anomalii na **prawdziwej telemetrii ESA OPS-SAT** | AUC odtwarza scikit-learn do **< 1e-9**; AUC detektora liczby szczytów **≈ 0.85** na oznaczonym podziale testowym | scikit-learn `roc_auc_score` na podziale testowym OPSSAT-AD (Ruszczak et al. 2025, CC BY 4.0) — prawdziwa telemetria OPS-SAT (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Jądra numeryczne quantum-trade (dopasowanie ADEV NNLS · pasma spójności χ² · Q zegara van Loana) | NNLS + Q **dokładnie**; χ² **< 5e-4** przy roboczej liczbie stopni swobody ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | Telekomunikacyjne metryki wędrówki MTIE / MDEV / TDEV (ITU-T G.810/G.823/G.8261/G.811 — zalecenia Sektora Normalizacji Telekomunikacji Międzynarodowego Związku Telekomunikacyjnego) | MTIE (9 współczynników uśredniania, bitowo dokładnie) oraz MDEV + TDEV (8 współczynników, **< 1e-9** względnie) na szeregu NIST SP 1065 LCG (liniowy generator kongruencyjny) | allantools 2024.06 `mtie` / `mdev` / `tdev` — niezależna biblioteka (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | Metody badań kompromisów MCDA — wszystkie cztery rodziny decyzyjne, dziewięć zewnętrznie zwalidowanych agregatorów (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) plus ważenie priorytetów przez porównania parami **AHP** | oceny / rankingi / macierze zgodności odtworzone do **< 1e-9** | pymcdm + pyDecision (niezależne biblioteki MCDA stron trzecich) + Saaty RI (indeks losowy) / eig SciPy-LAPACK (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | Obwiednia Dopplera LEO z orbity i nośnej | maksimum Iridium w granicach **5 %** opublikowanych ±36 kHz; Xona Pulsar X1 w opublikowanym przedziale **32–34 kHz** | wyniki testów LEO PNT RNTF; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | Zbieżność PPP ze wspomaganiem LEO | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min przy 60 / 96 / 192 / 288 satelitach LEO, monotonicznie; NEES filtra w paśmie χ² | trend porównany z Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); konstelacje i szum nie zostały odtworzone |
| **MODELLED** | Warunkowy Timing Protection Level (niewykryty błąd czasu ograniczony holdover przy spoofingu) | kompozycja odtwarza wielokrokową rekurencję kowariancji `clock_state`; skalibrowana na prawdziwym zapisanym spoofingu | skalary JammerTest 2024 (Zenodo 15911589) + postacie zamknięte van Loana / CUSUM (`examples/tpl_jammertest`) |
| **MODELLED** | Ocena odporności PNT + niestabilność decyzji | 35 ręcznie wyprowadzonych testów wyroczni; artefakt badania deterministyczny bajtowo (ustalone ziarno) | mapowanie DHS RPCF v2.0 + postacie zamknięte Dirichleta / tau Kendalla / Hill-N2 — architektury syntetyczne, nie certyfikacja |
| **MODELLED** | Badanie luki optymizmu zaburzeń RF (prawa skalowania + predyktor leave-one-out) | istotność względem permutacyjnej hipotezy zerowej; artefakt deterministyczny bajtowo (5 ziaren) | syntetyczny korpus oparty na parametrach — *metryki* ewaluacji są VALIDATED względem scikit-learn (powyżej); badanie jest MODELLED |
| CI | Odtwarzalność międzyplatformowa | bitowo identyczne wejście + wzorce kształtu na 3 systemach operacyjnych | macierz CI Linux / macOS / Windows, wzorce SHA-256 |
| CI | Pokrycie testami | **~95 % wierszy** w `src/` z wyłączeniem `src/*_data.rs` i `src/main.rs`, wymagane ≥ 85 % | cargo-tarpaulin (silnik LLVM) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Jak możliwość zdobywa swoją etykietę: wymaganie odwzorowuje się na moduł w src, na test w tests, na zewnętrzną wyrocznię (prawdziwy zbiór danych, niezależną implementację referencyjną lub opublikowane wektory), na status — z wymuszanym w CI zabezpieczeniem, że żadna możliwość nie może być Validated bez zewnętrznej wyroczni. Bieżące liczby: 176 Validated, 221 Modelled, 4 Partner, łącznie 401" width="900">
  <br><sub>Jak możliwość zdobywa swoją etykietę — niezmiennik wymuszany w CI: brak zewnętrznej wyroczni ⇒ nie może być Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Jak poparte jest każde twierdzenie: kolumna Validated to 176 z 176 ExternalDataset z założenia (wymuszane w CI); wiersze Modelled są uczciwie oznaczone jako InternalConsistency, ReferenceImpl lub ExternalDataset; wiersze Partner nie mają wyroczni Kshana" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Najgorszy błąd pozycji SGP4/SDP4 wobec odniesienia AIAA 2006-6753 według reżimu, skala logarytmiczna: każdy reżim jest daleko poniżej tolerancji AIAA, najgorszy przypadek 4.12 mm w nierezonansowym reżimie dalekiego kosmosu" width="96%">
  <br><sub>U góry: każdy wiersz Validated jest poparty zewnętrznym zbiorem danych, z założenia. U dołu: SGP4 zgadza się z oficjalnym odniesieniem w każdym reżimie (najgorzej 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Status weryfikacji wszystkich 401 możliwości: 176 Validated (sprawdzone względem zewnętrznej wyroczni), 221 Modelled, 4 należące do partnera" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Domeny możliwości

Każda możliwość z publicznej mapy, według domeny, z etykietą z rejestru. Tabelę domen zapisuje
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) z `web/capabilities.json`, tego samego pliku, który
czyta mapa wszystkiego w Studio.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Możliwości Kshana według domeny i dojrzałości: zwalidowane i modelowane publiczne możliwości w każdej domenie, narysowane z web/capabilities.json przez tools/gen_validation_figures.py" width="900">
</picture>

Pełna tabela, domena po domenie z każdą możliwością i jej etykietą, to [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Instalacja

Jeden wiersz instaluje narzędzie wiersza poleceń: **`cargo install kshana`**. Każdy kanał dostarcza
v0.40.0 z tego samego otagowanego commita.

<!-- channels:begin -->
| Kanał | Instalacja | Przewodnik |
|---|---|---|
| Wypróbuj w przeglądarce | otwórz https://kshana.dev | [Przewodnik po Studio](https://kshana.dev/docs/studio.html) |
| Wiersz poleceń (Rust) | `cargo install kshana` | [Użycie wiersza poleceń](https://kshana.dev/docs/rust.html#usage--cli) |
| Biblioteka Rust | `cargo add kshana` | [Dokumentacja API na docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Przewodnik po API Python](https://kshana.dev/docs/python-api.html) |
| JavaScript i WebAssembly | `npm install kshana` | [Przewodnik po npm i WebAssembly](https://kshana.dev/docs/npm.html) |
| Asystent AI (serwer MCP, cargo) | `cargo install kshana-mcp` | [Przewodnik po serwerze MCP](https://kshana.dev/docs/mcp.html) |
| Obraz Docker | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Przewodnik po serwerze MCP: Docker](https://kshana.dev/docs/mcp.html#install) |
| Rozszerzenie Claude Desktop | kliknij dwukrotnie `.mcpb` dla swojego systemu: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (jedno kliknięcie) | [Dodaj do Cursor (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Dodaj do Cursor (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (jedno kliknięcie) | [Zainstaluj w VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Zainstaluj w VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Gotowy plik binarny | pobierz kshana-mcp-<target> z wydania i sprawdź go względem SHA256SUMS | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Oficjalny rejestr MCP | wyszukaj io.github.ashfordeOU/kshana-mcp | [Wszystkie fragmenty instalacji MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Zdalnie (streamable HTTP), samodzielny hosting | `kshana-mcp --http 127.0.0.1:8080` | [Przewodnik po samodzielnym hostingu](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Marketplace wtyczek Claude Code | `/plugin marketplace add ashfordeOU/kshana` | [Korzystanie z Kshana z poziomu agenta](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| Wtyczka do IDE JetBrains | Settings → Plugins → Marketplace → wyszukaj "Kshana" (ID wtyczki dev.kshana.ide) | [Przewodnik po wtyczce](https://kshana.dev/docs/jetbrains.html) |
| Wtyczka Signal K | `npm install signalk-kshana-trust` | [Przewodnik po wtyczce Signal K](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| Wtyczka OpenCPN | pobierz archiwum tarball wtyczki z wydania | [Zgłoszenie do katalogu OpenCPN](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Pulpit Grafana | zaimportuj kshana-grafana-*.json z wydania | [Źródło pulpitu](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Obraz konfiguracji referencyjnej | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Integracje morskie](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana w JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Buduje się z Rust 1.88 lub nowszym, rust-version w Cargo.toml"></a></p>

MCP to Model Context Protocol. Przypnij wydanie poleceniem `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` lub `npm install kshana@0.40.0`. Aby zbudować ze źródeł, zob.
[Instalacja i budowanie](#install--build) w dokumentacji referencyjnej.

<details>
<summary>Uruchom scenariusz z Pythona i z WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Oprócz `run` moduł udostępnia `run_full` (JSON, SVG i jednowierszowe podsumowanie naraz),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` oraz `error_kind`; zob.
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

Pakiet npm to cały silnik skompilowany do WebAssembly. W Node.js przekaż plik binarny do
`initSync`; w przeglądarce `await init()` go pobiera (zob. [`README.npm.md`](README.npm.md)).

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

Jeden otwarty silnik znajduje się w centrum, a każdy interfejs go uruchamia: wiersz poleceń, biblioteka
Rust, Python, WebAssembly i Kshana Studio, serwer MCP, obraz Docker i
wtyczka JetBrains. Ten sam plik scenariusza daje te same bajty w każdym z nich. Kshana Pro znajduje się
na wierzchu jako osobna nakładka, która zależy od silnika i nigdy go nie rozwidla.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Architektura Kshana: jeden otwarty silnik w centrum, kshana 0.40.0 na licencji AGPL-3.0, z api::run_toml, typowanym rozdzielaniem na każdy rodzaj, oraz rejestrem weryfikacji 401 możliwości (176 VALIDATED, 221 MODELLED, 4 PARTNER). Wokół niego każdy interfejs uruchamia ten sam silnik: Wiersz poleceń (cargo install kshana); Biblioteka Rust (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); Serwer MCP (cargo install kshana-mcp); Obraz Docker (ghcr.io/ashfordeou/kshana-mcp); Wtyczka JetBrains (Marketplace: &quot;Kshana&quot;). Pod nim Kshana Pro, zastrzeżona nakładka, która zależy od otwartego silnika jako biblioteki i nigdy go nie rozwidla, i nie dodaje żadnego modelu fizycznego." width="100%">
</picture>

<details>
<summary>Wnętrze silnika: warstwy domenowe i rejestr weryfikacji</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="Architektura Kshana w warstwach. Pięć drzwi wejściowych (wiersz poleceń, Python, JavaScript i WebAssembly, serwer MCP i wtyczka JetBrains) prowadzi do jednego api::run_toml, typowanego rozdzielania na 92 rodzaje. Pod nim znajduje się osiem warstw domenowych: czas i układy odniesienia, zegary i synchronizacja czasu, nawigacja inercjalna i fuzja, GNSS i integralność, astrodynamika, LEO PNT, Księżyc, Mars i daleki kosmos oraz misje i badania, na wspólnym rdzeniu, wszystkie powiązane modułem weryfikacji, sprawdzaną maszynowo macierzą 401 możliwości, która jest jedynym źródłem prawdy dla każdej etykiety." width="100%">
</picture>

**Jeden silnik, wiele drzwi wejściowych.** Jeden rdzeń w Rust (`kshana`) uruchamia każdy scenariusz,
dostępny przez CLI, rozszerzenie Python, moduł WebAssembly w przeglądarce, **serwer
MCP** dla agentów AI i **wtyczkę do IDE JetBrains** — wszystkie zbiegają się w jednym
rozdzielaniu `api::run_toml`. Wewnątrz pakiety czujników podłączają się do wspólnego interfejsu
modelu błędów; obok nich znajdują się **warstwa układów odniesienia** (precesja–nutacja IAU 2006/2000A
i oparta na CIO redukcja GCRS↔ITRS), **warstwa astrodynamiczna/numeryczna**
(analityczne SGP4/SDP4 **i** numeryczny propagator Cowella z jego
modelem sił EGM2008/perturbacji, projektowanie manewrów i wyznaczanie orbity),
**warstwa integralności/GNSS** (RAIM/ARAIM, SBAS, domena pomiarów, zagłuszanie, przestrzeń cislunarna),
**warstwa fuzji / alt-PNT** (estymatory GNSS/INS i dopasowywacze map
grawitacyjnych/terenowych/magnetycznych), **warstwa dalekiego kosmosu i Księżyca** (radiometryczne Mars-PNT i
pakiet PNT księżycowego, z poziomem dowodowym każdego elementu w macierzy — czas LTC, VLBI, wspólne OD+zegar, realizacja układu odniesienia, przestrzeń usług,
różnicowe PNT, interoperacyjność), **warstwa analizy misji** (budżety startu / wejścia w atmosferę / pokrycia /
wskazywania / przelotów / łączy oraz środowisko pogody kosmicznej) oraz otwarta
**warstwa badań odporności i AI/ML** (ocena odporności RPCF, luka optymizmu zaburzeń RF
i demonstrator PNT z technologiami kwantowymi), której odtwarzalne artefakty opierają się na
zwalidowanych jądrach.

Dwa samodzielne crate'y **wyłączone z przestrzeni roboczej** znajdują się obok rdzenia — `mcp/kshana-mcp`
(serwer MCP, zbudowany na SDK `rmcp` w edycji 2024) i `xval/anise-frames`
(kontrola krzyżowa układów ANISE/SPICE, która pobiera zależności MPL-2.0 (Mozilla Public License 2.0)) — trzymane poza grafem zależności publikowanego
crate'a, `Cargo.lock`, bramką licencyjną i kompilacją MSRV (minimalnej obsługiwanej wersji Rust) przez listę `exclude`
w głównym `Cargo.toml`. Wtyczka JetBrains (`ide/jetbrains`) to osobny projekt
Kotlin. Pełny zestaw diagramów znajduje się w [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

Wyrenderowane diagramy (przepływ silnika, mapa modułów, dystrybucja) znajdują się w [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagramy

Diagramy to źródła Mermaid w [`docs/diagrams/`](docs/diagrams/), renderowane do SVG i PNG w
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` w systemie Linux, pozostałe dwa
skrypty `render-diagram` gdzie indziej), a zapis wiąże każdy PNG z dokładnym SVG, z którego powstał. Testy utrwalają
podawane w nich liczby. Wykresy w powyższych sekcjach są rysowane przez narzędzia z przebiegów silnika; te pokazują, jak
części do siebie pasują.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="System: sześcioro drzwi wejściowych (wiersz poleceń, Python, WebAssembly i npm z Kshana Studio, serwer MCP z wtyczkami i umiejętnościami, wtyczka JetBrains, integracje) wywołuje jedno rozdzielanie na każdy rodzaj scenariusza, które uruchamia jeden silnik złożony ze wspólnego rdzenia, pakietów czujników i układów odniesienia oraz modeli domenowych i zapisuje odtwarzalny wynik i wykres" width="900"><br>
  <sub>Jedno rozdzielanie, jeden silnik, odtwarzalne wyjście · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · źródło <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Interfejsy: jeden deterministyczny silnik offline zasila wiersz poleceń, bibliotekę Rust, Python, WebAssembly i npm oraz serwer MCP; Studio działa na kompilacji WebAssembly, polecenia i umiejętności wtyczki na serwerze MCP, integracje i zestawy wdrożeniowe na wierszu poleceń, a wtyczka JetBrains na bibliotece" width="900"><br>
  <sub>Każdy interfejs, z tego samego silnika · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · źródło <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Wewnątrz jednego przebiegu: plik scenariusza z ziarnem i osią czasu GNSS zasila silnik, który w każdym kroku czasowym rozwija model błędów, uruchamia estymator i ocenia wskaźniki jakości, po czym zapisuje odtwarzalny wynik i wykres" width="900"><br>
  <sub>Wewnętrzna pętla przebiegu · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · źródło <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Zaufanie do odbiornika: dziennik lub strumień odbiornika jest wczytywany do obserwabli dla każdej epoki i własnych flag odbiornika, przechodzi przez monitory i staje się doradczym wskaźnikiem zaufania z pasmem i powodami, który zasila Studio, telemetrię, podpisany pakiet dowodowy, ocenę Jammertest i bench oraz raport zgodności" width="900"><br>
  <sub>Od dziennika odbiornika do wskaźnika zaufania i tego, co z niego korzysta · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · źródło <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="Laboratoryjna pętla zwrotna: scenariusz jest eksportowany ze zdarzeniami i warunkami testu, operator poza Kshana odtwarza plik przez laboratoryjny symulator, dziennik odbiornika jest oceniany względem podanych zdarzeń, a pętla zwrotna dowodów łączy skróty scenariusza, warunków i dziennika oraz ocenę w podpisany pakiet" width="420"><br>
  <sub>Od scenariusza do podpisanego pakietu; Kshana nigdy nie wytwarza ani nie odtwarza sygnału · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · źródło <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: przeglądarka uruchamia lokalnie silnik skompilowany do WebAssembly, nic nie wysyłając, przyjmuje dołączone scenariusze albo otwarty przez Ciebie scenariusz lub dziennik i pokazuje wynik w widoku prostym, widoku zaawansowanym i na stronach zadań, z eksportami zapisywanymi przez użytkownika" width="900"><br>
  <sub>Jak Studio działa, lokalnie · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · źródło <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Przepływ testów i wydań: lokalne bramki (formatowanie, clippy, sprawdzenie braku atrybucji, zapadka pokrycia dokumentacji i scripts/gate.sh, który uruchamia pełny zestaw i powtórne przebiegi oraz zapisuje potwierdzenie sprawdzane przez hak pre-push) prowadzą do pull requestu tylko dla CI i zielonego pełnego CI; właściciel przesuwa main w trybie fast-forward do zielonego commita, a po sprawdzeniu synchronizacji wersji trafia na niego tag z adnotacją; przepływ wydania weryfikuje pełny zestaw na otagowanym commicie, zanim cokolwiek zostanie opublikowane, buduje pliki binarne z SBOM, sumami kontrolnymi i pochodzeniem kompilacji, publikuje w crates.io, PyPI, npm, rejestrze kontenerów, rejestrze MCP i JetBrains Marketplace, odpytuje każdy rejestr, aż zacznie serwować nową wersję, i uruchamia budowę strony z tagu; osobna ścieżka tylko dla strony uruchamia przepływ pages z tagiem main i jest odrzucana, chyba że od ostatniego wydania nic poza web/ i .github/ się nie zmieniło" width="900"><br>
  <sub>Przepływ testów i wydań, od lokalnych bramek do zweryfikowanego wydania, oraz ścieżka tylko dla strony · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · źródło <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="Mapa modułów: wiersz poleceń, Python, WebAssembly, serwer MCP i wtyczka JetBrains wywołują typowane rozdzielanie na każdy rodzaj, które sięga do wspólnego rdzenia, czasu i układów odniesienia, pakietów czujników, astrodynamiki, integralności, wykrywania spoofingu, fuzji, dalekiego kosmosu i Księżyca, odporności oraz modułów arbitra i benchmarku, wszystko podparte macierzą weryfikacji" width="1000"><br>
  <sub>Gdzie znajduje się kod · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · źródło <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Dystrybucja: jedno repozytorium dostarcza crate rdzenia, serwer MCP, wtyczkę IDE i crate'y kontroli krzyżowej do crates.io, PyPI, npm, GitHub Releases, piaskownicy Pages, rejestru kontenerów, rejestru MCP i JetBrains Marketplace, z archiwum Zenodo" width="900"><br>
  <sub>Co trafia gdzie i co to sprawdza · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · źródło <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## Asystent AI

[`kshana-mcp`](mcp/kshana-mcp/) to serwer MCP: Twój asystent uruchamia prawdziwy silnik i
odczytuje jego JSON, zamiast zgadywać obliczenia. Każde z jego 49 narzędzi to cienka nakładka
na publiczną funkcję biblioteki `kshana`, więc w serwerze nie ma logiki symulacji.

### Instalacja serwera MCP

> Doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu: za nawigację odpowiada nadal operator.
> Serwer działa na Twoim komputerze; nic nie jest wysyłane do Ashforde OÜ.

Wybierz dowolny kanał. Każdy odnośnik i fragment jest generowany jednym skryptem
(`scripts/gen_mcp_install.py`) i sprawdzany w ciągłej integracji; fragmenty dla Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI i Continue znajdują się w
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Kanał | Polecenie lub przycisk | Wymaga | Przypięta postać |
|---|---|---|---|
| Rozszerzenie Claude Desktop | kliknij dwukrotnie `.mcpb` dla swojego systemu: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | nic | `kshana-mcp-<target>.mcpb` z v0.40.0 |
| Cursor (jedno kliknięcie) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node lub Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (jedno kliknięcie) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node lub Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · wtyczka: `/plugin marketplace add ashfordeOU/kshana`, potem `/plugin install kshana@ashforde` | Node (lub Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ z uv lub pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | formuła dla v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket`, potem `scoop install kshana-mcp` | Scoop (Windows) | manifest dla v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Gotowy plik binarny | [strona wydania](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, sprawdzane przez `SHA256SUMS` i `gh attestation verify` | nic | v0.40.0 |
| Rejestr MCP | `io.github.ashfordeOU/kshana-mcp` (znajdowany przez klientów obsługujących rejestr) | klient obsługujący rejestr | `0.40.0` |
| Zdalnie (streamable HTTP) | `kshana-mcp --http 127.0.0.1:8080`, samodzielny hosting: zob. [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | własny host | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp w Glama, ocena jakości serwera MCP"></a></p>

W Claude Code ten sam serwer pojawia się jako wtyczka: `/plugin marketplace add ashfordeOU/kshana`, potem
`/plugin install kshana@ashforde`. Wtyczka dodaje polecenia z ukośnikiem nad narzędziami: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` i `/kshana-jammertest`. Narzędzia zaufania na statku zasilają integracje Signal K i
OpenCPN: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

Konfiguracja dla poszczególnych klientów znajduje się w [`docs/integrations.md`](docs/integrations.md). Serwer jest wymieniony
w oficjalnym rejestrze MCP jako `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>49 narzędzi</summary>

<br>

**Scenariusze i raporty**

| Narzędzie | Co robi |
|---|---|
| `run_scenario` | Uruchamia scenariusz z definicji TOML (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | 92 wbudowane rodzaje scenariuszy z opisami + polami wymaganymi/opcjonalnymi — aby agent mógł zbudować poprawny scenariusz |
| `validate_scenario` | Sprawdzenie wstępne: parsuje TOML i wykrywa jego rodzaj, bez uruchamiania |
| `list_example_scenarios` | Dołączone scenariusze referencyjne jako JSON |
| `get_example_scenario` | Tekst TOML jednego dołączonego scenariusza referencyjnego, bajt w bajt plik z `scenarios/` |
| `report_scenario` | Uruchamia scenariusz i zwraca jego raport |
| `animate_scenario` | Uruchamia scenariusz i zwraca jego szereg czasowy jako animację |
| `sky_geometry` | Geometria nieba przy linii horyzontu zależnej od azymutu: widoczne i ukryte satelity, DOP, kowariancja wschód-północ-góra i pozioma elipsa błędu; albo preset linii horyzontu z jego pochodzeniem |

**Eksport i interoperacyjność**

| Narzędzie | Co robi |
|---|---|
| `list_export_formats` | Które formaty interoperacyjne mają zastosowanie do scenariusza (`czml`, `kml`, `geojson`, `stk`, `sigmf`), powód, gdy któryś nie ma, oraz specyfikacja, której przestrzega każdy zapis |
| `export_interop` | Eksportuje scenariusz jako CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemerydy STK (Systems Tool Kit) `.e` lub SigMF (Signal Metadata  |
| `import_route` | Zapisuje trasę GeoJSON `LineString` do scenariusza, który leci po trasie punktów drogi (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`) i zwraca nowy TOML |
| `export_sp3` | Eksportuje konstelację scenariusza `orbit` jako precyzyjne efemerydy SP3-c (Standard Product 3, rewizja c) |
| `export_omm` | Eksportuje elementy scenariusza `orbit` jako katalog CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message) |
| `export_oem` | Eksportuje szereg stanów scenariusza `orbit` jako efemerydy CCSDS OEM (Orbit Ephemeris Message) 2.0 — pozycję TEME (równik prawdziwy, średnia równonoc) *oraz*  |
| `export_table_csv` | Uruchamia scenariusz i zwraca jego tabelę odtwarzalności jako CSV (wartości rozdzielane przecinkami) — stabilną bajtowo tabelę, którą CLI (interfejs wiersza poleceń) zapisuje jako `<scenario>.table.csv` |
| `export_test_bench` | Ruch pojazdu i zdarzenia scenariusza dla laboratoryjnego symulatora GNSS (`kshana bench-export`) |

**Zaufanie do odbiornika i statku**

| Narzędzie | Co robi |
|---|---|
| `assess_receiver_log` | Ocenia zaufanie do prawdziwego dziennika odbiornika GNSS (globalnego systemu nawigacji satelitarnej) |
| `assess_vessel_stream` | Ocenia ograniczony fragment NMEA 0183 (najwyżej 2 MiB i 20,000 epok |
| `assess_vessel_log` | Dziennik NMEA 0183 statku (najwyżej 4 MiB) jako przebieg wsadowy, z TOML sesji podającym ograniczenia statku |
| `create_evidence_pack` | Podpisany pakiet dowodowy dla okna dziennika statku (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Wiąże token znacznika czasu RFC 3161 (base64 bajtów `.tsr`) z pakietem, w pamięci (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Weryfikuje pakiet (`kshana evidence verify`) |
| `generate_training_nmea` | Syntetyczne NMEA 0183 mostka do szkolenia załogi z TOML `nmea-scenario` (zagłuszanie, odciąganie pozycji, spoofing czasu, opóźnienie powtórki) z dziennikiem instruktora (`kshana-nmea-training/1`) |
| `build_interference_map` | Mapa zakłóceń GNSS z raportów pozycji ADS-B lub AIS jako tekst CSV (najwyżej 4 MiB) |
| `route_exposure` | Udział długości trasy w komórkach zdegradowanych, niezdegradowanych, nieocenionych i nieobserwowanych jednej lub więcej map zakłóceń, opcjonalnie w zakresie dat |
| `trust_telemetry` | Strumień zaufania (wiersze JSON) lub wynik `receiver-trust` przedstawiony jako tekst Prometheus, wiersze syslog CEF lub LEEF albo ładunek OTLP JSON, z koderami `kshana trust-telemetry` |
| `jammertest_import` | Wczytuje opublikowany katalog testów i plan nadawania Jammertest (NPRA/jammertest-plan, MIT) jako zaplanowaną prawdę (`kshana jammertest import`): sloty jednego obszaru testowego stają się zdarzeniami receiver-trust z identyfikatorem katalogu i rokiem w każdej etykiecie. Zaplanowane sloty, a nie zapisane czasy nadawania; żadne pole kontaktowe planu nie jest czytane. MODELLED. Zob. [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Ocenia dziennik odbiornika względem tego harmonogramu (`kshana jammertest score`): dla każdego testu opóźnienie wykrycia, pominięte alarmy i czas powrotu oraz fałszywe alarmy poza wszystkimi slotami. Dzienniki tekstowe jako `log`, binarne (`ubx`, `sbf`) jako `log_base64`. Podpisany pakiet wymaga klucza: wiersz poleceń. Wyłącznie doradczo; MODELLED. |
| `fit_imu_log` | Parametry akcelerometru i żyroskopu scenariuszy `hybrid` i `fusion` dopasowane z dziennika nieruchomego IMU (CSV lub EuRoC) metodą odchylenia Allana, z gotową do wklejenia tabelą `[accel_classical]` i SHA-256 dziennika (`kshana imu-fit`). Tekst na wejściu, JSON na wyjściu; MODELLED. |

**GNSS IQ (pliki w katalogu roboczym; wyłączone w trybie HTTP)**

| Narzędzie | Co robi |
|---|---|
| `iq_signals` | Konfiguracja warstwy GNSS IQ |
| `iq_info` | Opisuje jedno nagranie IQ (w fazie i kwadraturze) w katalogu roboczym bez jego przetwarzania |
| `iq_scene` | Generuje wielosatelitarną scenę GNSS IQ w katalogu roboczym (`kshana iq scene`) |
| `iq_acquire` | Akwizycja FFT (szybka transformata Fouriera) jednego lub więcej PRN (kodów pseudolosowego szumu) w nagraniu (`kshana iq acquire`), opcjonalnie za etapami front-endu |
| `iq_track` | Akwizycja, a następnie śledzenie zestawem pętli DLL/PLL/FLL (pętle synchronizacji opóźnienia, fazy i częstotliwości) (`kshana iq track`), z pętlami z `kshana.loop-desig |
| `iq_frontend` | Stosuje przetwarzanie DSP (cyfrowe przetwarzanie sygnałów front-endu odbiornika i ograniczania zakłóceń |
| `iq_sweep` | Odtwarza jedno nagranie IQ z katalogu roboczego dla kilku projektów pętli śledzenia (`kshana iq sweep`) |
| `iq_monitor` | Uruchamia monitory wykrywania zakłóceń i spoofingu na nagraniu IQ w katalogu roboczym (`kshana iq monitor`) |
| `iq_labfit` | Dopasowuje model utraty śledzenia pętli do przebiegów laboratoryjnych (`kshana iq labfit`) ze scenariusza `iq-labfit`, którego dzienniki są osadzone (`text` lub `base64` |
| `iq_test_conditions` | Waliduje plik `kshana.test-conditions/1` podany jako tekst i zwraca rozwiązane warunki z ich skrótem |
| `iq_campaign` | Uruchamia kampanię odtwarzania laboratoryjnego (`kshana iq campaign`) |
| `iq_campaign_status` | Postęp folderu wyjściowego kampanii |

**Mapowanie zgodności**

| Narzędzie | Co robi |
|---|---|
| `compliance_report` | Mapowanie publicznych ram wypełnione z dokumentów wyników podanych jako tekst (`kshana compliance-report`) |
| `compliance_mapping` | Statyczne tabele mapowania (lub, z `sources`, dokumenty źródłowe, które przywołują, z wersjami i adresami URL) jako Markdown, poprzedzone tym samym oświadczeniem |
| `list_standards_packs` | Pakiety norm (`kshana standards-pack list`): oceniane zestawy scenariuszy dla profili testowych ram DHS Resilient PNT, IMO MSC.1/Circ.1575 i ICAO Doc 9849 Appendix F |
| `run_standards_pack` | Przebieg jednego pakietu względem progów podanych przed przebiegiem: każdy test `MET`, `NOT MET` lub `NEEDS INPUT`; MODELLED, nie ocenia żadnego produktu |
| `lunanet_afs_check` | LunaNet Augmented Forward Signal sprawdzony względem LNIS V5 AD1 Volume A (LSIS-AFS V1.0): kody względem wydrukowanych tabel lub strumień symboli względem formatu ramki; LDPC i CRC-24Q podramek 2 do 4 nie są weryfikowane |
| `create_round_trip_pack` | Podpisany pakiet laboratoryjnej pętli zwrotnej: scenariusz, dokument `kshana.test-conditions/1`, dziennik odbiornika i ocena powiązane skrótem |

**Benchmark**

| Narzędzie | Co robi |
|---|---|
| `score_benchmark` | Zgłoszenie kshana-bench ocenione względem pliku prawdy, oba jako tekst JSON (`kshana bench score`, `bench/SPEC.md`): plik wyniku z wersją specyfikacji, podziałem, skrótami danych wejściowych i metrykami zadania. MODELLED; opisuje dziennik lub korpus, nigdy produkt. |
| `render_leaderboard` | Pliki wyników kshana-bench przedstawione jako statyczna strona tabeli wyników (tekst HTML), każdy najpierw zwalidowany. |

</details>

<a id="editions"></a>
## Edycje

Cały silnik jest bezpłatny. Kshana Pro i badania na zamówienie są dla programów, które potrzebują więcej,
a każda płatna ścieżka zaczyna się od wiadomości: nie ma tu cen.

| | Free | Kshana Pro | Badanie na zamówienie |
|---|---|---|---|
| Czym jest | cały otwarty silnik, wszystkie 92 rodzaje scenariuszy, bez blokad funkcji | zastrzeżona nakładka na ten sam silnik, na podstawie umowy | badanie odporności PNT Twojego systemu na poziomie MODELLED, wykonane dla Ciebie |
| Licencja | AGPL-3.0 (GNU Affero General Public License, wersja 3) lub licencja komercyjna | zastrzeżona | umowa |
| Jak zacząć | [zainstaluj](#install) lub otwórz [kshana.dev](https://kshana.dev) | [poproś o ocenę Pro](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [poproś o badanie](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Czym jest Pro, słowami [`docs/PRO.md`](docs/PRO.md):

> **Ścisły nadzbiór otwartej Kshana.** Pro zależy od otwartego silnika jako biblioteki i
> nigdy go nie rozwidla. Każdy otwarty rodzaj scenariusza działa w Pro bez zmian, a otwarty scenariusz działa
> w Pro w ogóle bez licencji.
>
> **Żadnej nowej fizyki.** Pro nie dodaje żadnego modelu fizycznego i żadnego nie zmienia. Każda liczba Pro pochodzi
> z przebiegów otwartego silnika, więc liczba z Pro jest tak wiarygodna jak otwarty rodzaj scenariusza,
> z którego pochodzi, i nigdy bardziej.

Pro odpowiada na kolejne pytania programu: który projekt wysłać w lot (optymalizator projektu i jego
front Pareto), na ile pewna jest odpowiedź (niepewność i wrażliwość) i czy misja
spełnia wymagania (dossier misji, identyfikowalność wymagań, badania kompromisów, sprawdzenie
regresji scenariuszy, cyfrowe bliźniaki zegarów, dossier badania i usługa
lokalna (on-premises)). Obserwuje też kampanię liczb i przerywa potok, gdy któraś się pogorszy,
testuje kandydujące plany sygnałów względem otwartych sygnałów nawigacji satelitarnej w obu
kierunkach (współistnienie widmowe) i kolejkuje badania w lokalnej usłudze zadań z
rejestrem dostaw łączonym skrótami. Każda z tych funkcji jest opisana, wraz z tym, co wytwarza i czego nie robi, w
[`docs/PRO.md`](docs/PRO.md). Nic, co wytwarza Pro, nie jest certyfikacją, a badanie na zamówienie
również nie jest certyfikacją.

<details>
<summary>Co Kshana Pro czyta z otwartego silnika oraz wsparcie od Ashforde® OÜ</summary>

<br>

**Na czym opiera się Kshana Pro.** Każda część Pro działa na otwartym silniku i pozostawia
go bez zmian:

- **Optymalizator projektu, badanie niepewności i dossier misji** uruchamiają scenariusze otwartego
  silnika przez jego publiczny interfejs i obliczają każdą liczbę z wyników
  przebiegów. Każde wyjście zachowuje poziom VALIDATED, MODELLED lub PARTNER, który otwarty silnik nadał
  każdej liczbie, nigdy wyższy.
- **Cyfrowe bliźniaki zegarów** używają modelu zegara otwartego silnika i jego estymatora
  odchylenia Allana: bliźniak jest kalibrowany do opublikowanego budżetu Allana urządzenia, a następnie sprawdzany przez
  estymację odchylenia Allana bliźniaka otwartym estymatorem.
- **Badania kompromisów** uruchamiają każdą opcję architektury jako scenariusz otwartego silnika, bez zmian,
  i szeregują opcje według wskaźnika jakości odczytanego z wyniku każdego przebiegu.
- **Obserwacja kampanii** odczytuje swoje liczby z wyników przebiegów otwartego silnika dla
  scenariuszy w pakiecie i porównuje je z poprzednim zaliczonym przebiegiem.
- **Współistnienie widmowe** odczytuje każdą liczbę fizyczną z przebiegów otwartego silnika dla rodzajów
  `leo-signal` i `constellation-design` i dodaje tylko sumę po widocznych satelitach
  oraz ranking planów.
- **Lokalna usługa zadań** uruchamia scenariusze otwarte i Pro przez ten sam silnik i
  przechowuje każdy wynik tak, jak zwrócił go przebieg.
- **Pakiety dowodowe** zapisują dla każdego przebiegu skrót scenariusza, który otwarty silnik umieszcza w
  swoim wyniku, dzięki czemu liczbę w pakiecie można odtworzyć, uruchamiając ponownie jej scenariusz.
- **Narzędzia inżynierii systemów i programów.** Narzędzia Kshana Pro do inżynierii systemów
  opartej na modelach (MBSE) i programów sprawdzają wymagania programu
  względem przebiegów otwartego silnika: importują wymagania jako wartości rozdzielane przecinkami
  (CSV) lub jako udokumentowany podzbiór Requirements Interchange Format (ReqIF) albo
  tekstu Systems Modeling Language w wersji 2 (SysML v2), oceniają każde kryterium
  akceptacji, z jego jednostką, względem wartości zapisanych przez przebieg i wytwarzają macierz
  weryfikacji wymagań (VCRM), model SysML v2, raport wpływu zmian i pakiet dowodowy
  offline. Niczego nie uruchamiają ponownie ani nie przeliczają i czytają tylko to, co publikuje otwarty silnik:
  `result.json` każdego przebiegu (pola wymienione w kryterium, ich jednostki,
  znacznik odtwarzalności złożony ze skrótu scenariusza, ziarna, wersji silnika i wersji schematu oraz
  etykietę przebiegu i poziomy liczb), jego `report.json` (rodzaj, zapis odtwarzalności i
  etykiety możliwości), plik scenariusza (jego skrót, rodzaj, ziarno i parametry),
  schemat jednostek pól (jednostka, pochodzenie i poziom dowodowy każdego pola) oraz
  macierz weryfikacji (etykieta VALIDATED, MODELLED lub PARTNER każdej możliwości).

<a id="support--professional-services"></a>
### Wsparcie i usługi profesjonalne

Kshana jest bezpłatna i otwartoźródłowa na licencji AGPL-3.0 oraz **profesjonalnie rozwijana i
utrzymywana przez Ashforde® OÜ** (Estonia). Otwarty silnik jest kompletny i użyteczny
samodzielnie. Organizacjom, które potrzebują więcej, Ashforde® OÜ oferuje:

- **Komercyjne wsparcie i integrację** — osadzenie Kshana w Twoim łańcuchu narzędzi, scenariusze
  na zamówienie i priorytetowe poprawki.
- **Modele czujników na zamówienie** — skalibrowane do Twojego sprzętu, w tym wrażliwe eksportowo
  modele odporności utrzymywane w prywatnej nakładce.
- **Kshana Pro** — zastrzeżone narzędzia inżynierii systemów opartej na modelach (MBSE) i programów,
  które sprawdzają wymagania programu względem przebiegów otwartego silnika i
  wytwarzają macierz weryfikacji wymagań (VCRM), model Systems Modeling Language
  w wersji 2 (SysML v2), raport wpływu zmian i pakiet dowodowy offline. Niczego
  nie uruchamiają ponownie i czytają tylko opublikowane wyjścia silnika: `result.json`
  i `report.json` każdego przebiegu, plik scenariusza, schemat jednostek pól i etykiety
  macierzy weryfikacji (pełna lista znajduje się w [Edycjach](#editions)).
- **Narzędzia Kshana Pro do projektowania, niepewności i misji** — front Pareto przestrzeni
  projektowej, niepewność i wrażliwość w tysiącach przebiegów oraz dossier misji
  jednym poleceniem z macierzą weryfikacji i plikiem PDF; zob. [`docs/PRO.md`](docs/PRO.md).
- **Obserwacja kampanii, współistnienie widmowe i usługa zadań Kshana Pro** — potok, który
  przerywa się, gdy obserwowana liczba się pogorszy, plany sygnałów testowane względem otwartych
  sygnałów nawigacji satelitarnej w obu kierunkach oraz lokalna kolejka zadań z
  rejestrem dostaw łączonym skrótami; zob. [`docs/PRO.md`](docs/PRO.md).
- **Szkolenia i doradztwo** w zakresie analizy osiągów PNT kwantowego/klasycznego.

To model open-core: silnik jest i pozostanie na otwartej licencji; działalność, która go utrzymuje,
to wiedza ekspercka, wsparcie i zastrzeżone rozszerzenia — a nie opłaty licencyjne.
Kontakt **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Badania

Badania oparte na otwartym silniku są publikowane w arXiv. Każde wymienia polecenie silnika,
na którym się opiera, więc jego liczby można odtworzyć z zatwierdzonego scenariusza lub przykładu badania.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Badania oparte na otwartym silniku: sześć artykułów w arXiv, każda karta podaje artykuł, jego datę i kategorię oraz polecenie silnika, które odtwarza jego liczby. Te same sześć artykułów, z odnośnikami i poleceniami, znajduje się w tabeli poniżej." width="100%">
</picture>

| Artykuł | Co pokazuje | Polecenie silnika |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | Spadek oceny detektora zakłóceń GNSS po zmianie warunków można przewidzieć wyłącznie na podstawie statystyk w rozkładzie, na otwartym syntetycznym stanowisku testowym, a następnie na otwartych nagraniach terenowych. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Odbiornik czasu GNSS poddany spoofingowi nie ma skończonej bezwarunkowej granicy niewykrytego błędu czasu, więc artykuł podaje granicę warunkową, skalibrowaną na zapisanym spoofingu nadawanym drogą radiową z publicznej kampanii JammerTest 2024. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Pojedyncza złożona ocena odporności jest stabilną podstawą decyzji tylko tam, gdzie dominuje jeden projekt; tam, gdzie projekty konkurują, samo przeważenie może zmienić zwycięzcę. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Pomiary odległości wewnątrz konstelacji księżycowej pozostawiają bezwzględną pozycję stacji powierzchniowej nieobserwowalną; opóźnienie interferometrii wielkobazowej (VLBI) z Ziemi przywraca ją, gdy konstelacja jest rzadka, i zaostrza, gdy jest bogata. | rodzaj `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Planowane konstelacje od czterech do sześciu satelitów dają słabą geometrię na biegunie południowym Księżyca, a kilka powierzchniowych beaconów odległościowych naprawia to znacznie taniej niż więcej satelitów. | rodzaj `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Rozmycie precyzji jest niezdefiniowane dla cislunarnego śledzenia wyłącznie odległości, ponieważ prędkość jest nieobserwowalna w migawce, więc artykuł używa gramianu obserwowalności na czterech płaskich odległych orbitach wstecznych: sama odległość ma rząd 2 z 4 w migawce i potrzebuje łuku około 2.09 h, aby stać się w pełni obserwowalna, przy czym uwarunkowanie poprawia się wraz z wydłużaniem łuku; tempo zmian odległości (Doppler) daje rząd 4 natychmiast; a współestymacja stacji ze stanami i zegarami satelitów pozostaje z niedoborem rzędu o jeden, chyba że doda się zewnętrzną obserwablę interferometryczną. Wymagania należy formułować w budżetach długości łuku, uwarunkowania i typu pomiaru, a nie DOP. | rodzaj `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (pokrewny `cislunar-arc-recovery` testuje próg niezależnym estymatorem różnic skończonych) |

Trzy przykłady badań zapisują artefakty deterministyczne bajtowo (ustalone ziarna), które zapisują
wersję silnika, ziarna i skrót konfiguracji. Trzy artykuły dotyczące Księżyca i przestrzeni cislunarnej opierają się na
pakiecie księżycowym (poziom dowodowy każdego elementu znajduje się w macierzy weryfikacji); ich twierdzenia dotyczące geometrii i rozmycia precyzji są też sprawdzane krzyżowo
względem osobnych wyroczni w `tests/validate_p*.rs`. Więcej w
[Odtwarzalnych artefaktach badań](#reproducible-study-artifacts) w dokumentacji referencyjnej.

<a id="cite"></a>
## Cytowanie

Jeśli używasz Kshana w pracy naukowej lub technicznej, zacytuj wersję, której użyłeś, wraz ze
scenariuszem i ziarnem. [`CITATION.cff`](CITATION.cff) zawiera metadane czytelne maszynowo, a
GitHub pokazuje na ich podstawie przycisk „Cite this repository”. Każde wydanie jest archiwizowane w Zenodo;
koncepcyjny DOI (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) zawsze wskazuje na
najnowszą wersję.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Powyższe artykuły:

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
## Licencja

Kshana ma podwójną licencję: GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)) lub
**licencja komercyjna** od Ashforde® OÜ dla zamkniętej integracji, do której AGPL się nie nadaje.
[`LICENSING.md`](LICENSING.md) wyjaśnia, która ma zastosowanie. Wkłady są licencjonowane przychodząco
na AGPL i dodatkowo dają Ashforde® OÜ prawo do włączenia ich do edycji
komercyjnej; podpisz każdy commit poleceniem `git commit -s` (zob. [`CONTRIBUTING.md`](CONTRIBUTING.md)).
„Kshana” i jej znaki są znakami towarowymi Ashforde® OÜ: licencja obejmuje kod, a nie
nazwę, więc prosimy o zmianę nazwy forków.

<a id="reference"></a>
## Dokumentacja referencyjna

Obszerny materiał, zwinięty. Każdy dokument jest wymieniony w [Dokumentacji](#documentation).

<details>
<summary>Instalacja i budowanie ze źródeł</summary>

<a id="install--build"></a>
### Instalacja i budowanie

Wymaga zestawu narzędzi Rust (≥ 1.88, `rust-version` w Cargo.toml; rozwijane na 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Użycie: wiersz poleceń w całości</summary>

### Użycie

Uruchom dowolny scenariusz; CLI rozdziela według pola `kind` scenariusza i zapisuje
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` i
`<scenario>.report.json` obok niego — plus `<scenario>.table.csv` dla rodzajów, które
publikują tabelę. Raport (strona HyperText Markup Language (HTML) i dokument JSON
o tej samej treści) zawiera podsumowanie dla kierownictwa, każde wejście z jednostką,
wyniki i wykresy, tabele przeglądu parametrów, Monte Carlo lub łańcucha kampanii, oś czasu zdarzeń,
etykietę VALIDATED / MODELLED / PARTNER i źródło każdej możliwości użytej w przebiegu,
to, co nie jest modelowane, oraz zapis odtwarzalności (wersja silnika, skróty Secure Hash
Algorithm 256-bit (SHA-256), ziarno, platforma i dokładne polecenie). Drukuje się do
czystego pliku PDF (Portable Document Format) z przeglądarki na papierze A4 lub Letter; sam
silnik nie zapisuje PDF. Zob. [`docs/REPORTS.md`](docs/REPORTS.md).

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

`--export <czml|kml|geojson|stk|sigmf|all|list>` zapisuje CZML (Cesium Language), KML
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), efemerydy Ansys STK (Systems Tool Kit) `.e`
oraz nagrania SigMF (Signal Metadata Format) obok scenariusza, a
`--import-route <route.geojson>` podaje linię GeoJSON do rodzajów lecących po trasie. Każdy
format jest walidowany względem swojej opublikowanej specyfikacji, a scenariusz, do którego format
nie ma zastosowania, mówi dlaczego: zob. [docs/INTEROP.md](docs/INTEROP.md).

**Inne tryby CLI** — sprawdź scenariusz, podaj prawdziwe dane orientacji Ziemi lub uruchom cały zestaw:

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

**Eksport animacji.** `--animate svg|html|frames|all` zapisuje `<scenario>.animation.svg`
(klatki kluczowe Cascading Style Sheets (CSS), bez skryptu), `<scenario>.animation.html` (odtwarzanie, pauza, przewijanie, prędkość i
zsynchronizowane panele, bez zewnętrznych zasobów) oraz `<scenario>.frames/` (`frame_0000.svg`, … plus
`manifest.json` z liczbą klatek na sekundę i czasem trwania). Kampania odtwarza swoje fazy i
alarmy, przebieg widma swój wodospad; motyw podąża za `prefers-color-scheme`, a
`prefers-reduced-motion` pokazuje gotowy obraz. Renderuje własne próbki przebiegu,
bajtowo identyczne przy ponownym przebiegu, i nie dodaje żadnych dowodów. Zob. [docs/ANIMATION.md](docs/ANIMATION.md).

Manifest **zestawu** (suite) to mały plik TOML (Tom's Obvious, Minimal Language) — `title` i tablica `scenarios = [ … ]`
ścieżek scenariuszy — który silnik uruchamia po kolei, składając każdy wynik (z jego
etykietami MODELLED / VALIDATED) w jeden samoopisujący się artefakt badania. Zob.
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Rola w interoperacyjności.** Kshana jest warstwą *symulacji osiągów*, która działa
obok łańcucha narzędzi przetwarzania końcowego, a nie jego zamiennikiem: podaj jej wyjście **RINEX**
do RTKLIB lub gLAB, aby uzyskać rozwiązanie pozycji, i użyj jej wyjścia **SP3** jako
produktu precyzyjnej orbity dla narzędzi takich jak Ginan — Kshana odpowiada na pytanie, *jaką odporność daje dana
architektura PNT*, zanim będziesz mieć prawdziwe sygnały, w formatach, które te narzędzia już
wczytują (`--export-sp3` lub `export_sp3 = true` w scenariuszu `orbit` zapisuje
`<scenario>.sp3`). Tę samą orbitę można opublikować jako elementy średnie **CCSDS OMM**
zgodne z normą (`--export-omm` lub `export_omm = true` zapisuje `<scenario>.omm`) —
jeden komunikat OMM 502.0 KVN (notacja słowo kluczowe = wartość) na każdego satelitę zdefiniowanego przez TLE, niosący prawdziwy
numer katalogowy NORAD (North American Aerospace Defense Command), międzynarodowy oznacznik COSPAR (Committee
on Space Research) i epokę każdego obiektu, dla dowolnego
odbiorcy obsługującego OMM zamiast niestandardowego zestawu elementów dwuwierszowych.

Przykładowe wyjście (holdover zegara — zwróć uwagę, jak podawane są wskaźniki jakości Integrity i Security):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

Błąd czasu zegara optycznego na 95. percentylu (p95) wynosi 1.20e-4 ns: podsumowanie
wypisuje małe wartości z cyframi znaczącymi zamiast zaokrąglać je do `0.0`.
`security` pokazuje `n/a (no attack)`, ponieważ ten scenariusz nie konfiguruje żadnego ataku, więc
nie ma czego wykrywać. Wynik JSON nadal zawiera analityczną granicę wykrywalności
spoofingu dla każdego zegara w `fom.security` (0.997 dla zegara optycznego, 0.000 dla
atomowego zegara w skali chipu, którego własny szum w oknie monitorowania przekracza specyfikację
20 ns), a jego blok `figure_tiers` oznacza tę liczbę jako `applicable: false`. Rodzaj scenariusza
`spoof` ocenia wykrywanie względem wprowadzonego ataku. `figure_tiers` podaje też
dla każdej podawanej liczby jej poziom weryfikacji — VALIDATED (sprawdzone względem zewnętrznej
wyroczni) lub MODELLED — oraz wiersz macierzy weryfikacji, z którego odczytano poziom. Scenariusz
orbitalny dodatkowo podaje blok geometrii — odsetek próbek z pozycją oraz
najlepsze/medianowe rozmycie precyzji pozycji (PDOP) i dokładność pozycji — obok
wyniku zegara.

> **Czytaj te dwie liczby uważnie.** `security` to *analityczna granica wykrywalności
> spoofingu* wyprowadzona ze stabilności każdego zegara — ma znaczenie tylko względem
> skonfigurowanego scenariusza spoofingu i **nie** jest wielosatelitarnym detektorem RAIM. `integrity`
> to tutaj *samospójność* filtra (odsetek próbek z przerwy wewnątrz jego własnej granicy k-sigma),
> a **nie** lotnicza liczba integralności HPL/VPL. Zob.
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Dla rzeczywistej autonomicznej integralności w odbiorniku **rodzaj scenariusza `integrity`**
> (`scenarios/integrity-raim.toml`) uruchamia prawdziwy RAIM migawkowy i z separacją rozwiązań
> (w stylu ARAIM) na propagowanej geometrii konstelacji: oblicza
> poziome/pionowe **poziomy ochrony (HPL/VPL)** dla każdej epoki i podaje
> odsetek epok, które spełniają skonfigurowane granice alarmowe, z diagramem integralności
> Stanford do klasyfikacji błąd wobec PL (poziomu ochrony).

<a id="reproducible-study-artifacts"></a>
#### Odtwarzalne artefakty badań

Cztery otwarte badania odtwarzają każde artefakt deterministyczny bajtowo (ustalone ziarno) jednym
poleceniem — liczby stojące za badaniami punktu przecięcia kwantowe wobec klasyczne, luki optymizmu
zaburzeń RF, oceny odporności PNT i poziomu ochrony czasu:

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

Każdy artefakt zapisuje wersję silnika, ziarna i skrót konfiguracji oraz niesie uczciwą
etykietę MODELLED/VALIDATED. Sondy prawdziwych danych (`*_probe`) uruchamiają ten sam potok na
nagraniach dostarczonych przez Ciebie lokalnie; w repozytorium nie są dostarczane żadne zbiory danych. Badanie luki optymizmu
zaburzeń RF jest opisane w preprincie
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), a warunkowy poziom ochrony
czasu (`tpl_jammertest` powyżej) w preprincie
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (zob. [Cytowanie](#cite)).

Opublikowane badania PNT księżycowego ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP z beaconami powierzchniowymi, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) obserwowalność
VLBI i [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) obserwowalność cislunarna w funkcji długości łuku)
mają swoje twierdzenia dotyczące geometrii, rozmycia precyzji, przewidywania układu czasu rzeczywistego /
parametrów orientacji Ziemi (EOP), odległych orbit wstecznych i pomiaru odległości RF
niezależnie sprawdzone krzyżowo w
`tests/validate_p*.rs` względem osobnych wyroczni (`scipy.special.j1`, niezależne rozwiązanie DOP
`(HᵀH)⁻¹` w NumPy, ponowne parsowanie w NumPy tych samych wierszy IERS `finals2000A` oraz
NASA/JPL Three-Body Periodic Orbit Database). Są to dodatkowe sprawdzenia regresyjne
**modelowanego** pakietu księżycowego; nie zmieniają liczby w sprawdzanej maszynowo macierzy.

</details>

<details>
<summary>Format scenariusza</summary>

<a id="scenario-format"></a>
### Format scenariusza

Scenariusze to deklaratywny TOML. `kind` na najwyższym poziomie wybiera pakiet — łącznie **pięćdziesiąt**
(`clock` jest domyślny, jeśli pominięto): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (stanowisko ewaluacji wykrywania zaburzeń RF
AI/ML — oznaczony syntetyczny korpus + niezależna od detektora uprząż ROC/AUC +
luka optymizmu w rozkładzie / poza rozkładem), `quantum-trade` (kompromis PNT kwantowe wobec klasycznego
z wczytywaniem zmierzonego ADEV + obwiednią odporności bez GNSS; MODELLED),
`space-weather` (wskaźniki słoneczne/geomagnetyczne + temperatura egzosferyczna Jacchia-71 +
gęstość termosfery napędzana aktywnością w stosunku do statycznej atmosfery; MODELLED),
`oem-interop` (most importu/przejścia w obie strony CCSDS OEM dla efemeryd GMAT/Orekit/STK;
MODELLED), trójka analizy misji `launch-window` (dwuciałowy azymut startu /
zmiana płaszczyzny / okna startowe), `reentry` (balistyczny korytarz wejścia w atmosferę Allena-Eggersa),
`eo-coverage` (geometria pasa / GSD / dostępu / ponownej wizyty EO), `space-packet` (ramkowanie Space Packet CCSDS
133.0 TM/TC — telemetria/telekomendy — dokładny układ bitów, zweryfikowane w obie strony) oraz
`attitude-budget` (moment gradientu grawitacji 3-DOF + budżet błędu wskazywania RSS),
`passes` (przewidywanie wschodów/zachodów przelotów nad stacją naziemną — AOS/TCA/LOS, maks. elewacja,
dostęp) i `link-budget` (jednodrożne równanie łącza CCSDS/DSN — FSPL / Eb·N₀ /
zapas / zamknięcie); `telecom-timing` (błąd czasu holdover, MTIE i TDEV sprawdzane
względem masek ITU-T); `spectrum` (całe pasmo L GNSS jako jedna gęstość widmowa mocy:
wodospad częstotliwość-czas przy skryptowej osi czasu zagłuszarki fali ciągłej, wąskopasmowej, świergotowej lub
szumu dopasowanego, stosunek zagłuszarki do sygnału dla każdego pasma i efektywna
gęstość stosunku nośnej do szumu ze współczynnika separacji widmowej oraz wejście i wyjście nagrań Signal Metadata
Format (SigMF) z estymatami widmowymi Welcha; widma sygnałów
VALIDATED względem wartości podręcznikowych, scenariusz zagłuszarki MODELLED; zob.
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); ten sam rodzaj rysuje panele pasm UHF, S i C z
projektowanymi sygnałami niskiej orbity okołoziemskiej); `leo-signal` (projekty sygnałów pozycjonowania, nawigacji i
synchronizacji czasu na niskiej orbicie okołoziemskiej dla dowolnego systemu: widma o ograniczonym paśmie, jitter śledzenia kodu i dokładność
pomiaru odległości, przeszukiwanie i czas akwizycji, separacja widmowa względem GPS i Galileo, tolerancja na
zagłuszarki i kompromis pasm od UHF do C, z publicznych presetów takich jak Xona Pulsar, Iridium,
Starlink i CentiSpace lub projektów osadzonych; postacie zamknięte i Doppler LEO VALIDATED,
projekty MODELLED; zob. [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (Słońce, planety, Pluton, Księżyc i siedem dużych
księżyców w jednej epoce — pozycje, stałe, czasy świetlne i ślady orbit; pozycje planet
VALIDATED względem JPL Horizons) oraz `body-pnt` (pozycjonowanie wokół dowolnego z tych ciał z
lokalną konstelacją nawigacyjną i łączem dalekiego kosmosu z Ziemi; MODELLED); `campaign` (istniejące rodzaje złożone w łańcuchową oś czasu misji
ze stanem przekazywanym między fazami, przegląd parametrów, zespół Monte Carlo z ziarnem lub
kilka scenariuszy przy jednym wspólnym warunku; MODELLED, zob.
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (wzorce Walker delta i gwiazdowe,
listy elementów i projekty wielopowłokowe z presetami GPS, Galileo, BeiDou i GLONASS
oraz pokrycie i rozmycie precyzji na siatce szerokości/długości geograficznej;
generator i globalny DOP GPS VALIDATED względem opublikowanych dokumentów usług, zob.
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (przelot satelity
pozycjonowania, nawigacji i synchronizacji czasu (PNT) na niskiej orbicie okołoziemskiej (LEO) i jego budżet łącza pasmo po
paśmie, z dowolnej konstelacji i dowolnego projektu sygnału: kąty obserwacji, Doppler i tempo zmian Dopplera,
tłumienie przez deszcz, gazy, scyntylację i wejście do budynku wg ITU-R, gęstość stosunku nośnej do szumu względem
widocznych satelitów MEO GNSS, jonosfera pierwszego rzędu i pary wolne od jonosfery oraz
budżet pozycji przy niskiej energii, sondowanie jonosfery z każdej pary pasm i monitory spoofingu na podstawie
spójności Dopplera i geometrii przelotu oraz spójności między pasmami; człony ITU-R i
obwiednia Dopplera dla użytkownika statycznego VALIDATED, przelot MODELLED, zob.
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (rozgłoszeniowy
komunikat efemeryd i zegara satelity PNT na niskiej orbicie okołoziemskiej (LEO), dla dowolnej orbity i
nośnej: dopasowanie ze scałkowanej orbity prawdziwej do zestawu keplerowskiego Galileo, ten zestaw
z wielomianami poprawek wzdłuż toru, w poprzek toru i radialnych, 22-parametrowy model Liu et al. 2025
lub wielomian ECEF bez zegara ATOMIC; błąd odległości sygnału w przestrzeni
(SISRE) w funkcji przedziału dopasowania i okresu aktualizacji, sprawdzenie ciągłości aktualizacji w połowie przelotu,
własna udokumentowana ramka binarna Kshana z cykliczną kontrolą nadmiarowości CRC-24Q i budżetem kwantyzacji oraz
blok w stylu RINEX-4 oznaczony jako rozszerzenie Kshana; wagi SISRE, algorytm użytkownika Galileo
i CRC-24Q VALIDATED, dopasowania MODELLED; opcjonalne presety dla Xona Pulsar,
Iridium, Starlink, CentiSpace, reprezentatywnego systemu pasma C, ATOMIC i Celeste IOD; zob.
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); trójka **połączonego PNT MEO + LEO**
`leo-pvt` (pozycjonowanie dopplerowskie z tempa zmian odległości na niskiej orbicie okołoziemskiej (LEO), łączne
pozycje z pseudoodległości GNSS + LEO z biasami międzysystemowymi i DOP w funkcji liczby satelitów
LEO, pokrycie polarne i arktyczne oraz transfer czasu z LEO do UTC — dla dowolnej konstelacji,
z opcjonalnymi presetami, takimi jak sygnały okazjonalne Xona Pulsar, Iridium i Starlink;
obwiednia Dopplera LEO VALIDATED względem opublikowanych liczb Iridium i Xona), `leo-ppp`
(zbieżność precyzyjnego pozycjonowania punktowego z samym GNSS i ze wspomaganiem LEO, porównana
z Li et al. 2019) i `ntn-positioning` (pozycjonowanie w sieci nienaziemnej 5G z
granicy Craméra-Rao szerokości pasma sygnału), MODELLED poza tą obwiednią, zob.
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (jeden system LEO-PNT od początku do
końca: projekt `leo-signal` niesiony przez pasmo `leo-pass`, C/N0 przelotu i błąd odległości sygnału
w przestrzeni komunikatu nawigacyjnego przekazane do połączonej pozycji `leo-pvt` i zbieżności `leo-ppp`,
z wymienionym każdym przekazaniem; MODELLED, zob.
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), który jest też przeglądem
każdego rodzaju i scenariusza LEO-PNT, w tym kampanii odporności, jednego scenariusza na każdy
obszar badawczy eksperymentu i jednego na każdy segment użytkowników końcowych); **pakiet PNT księżycowego** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; **demonstrator PNT z technologiami kwantowymi**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; oraz
rodzaje badawcze **bezpieczeństwa sygnału, przestrzeni cislunarnej i warstwowej odporności** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — trójka analizy misji i te późniejsze rodzaje są wszystkie MODELLED
(każdy ze zwalidowanym rdzeniem w postaci zamkniętej; zob. macierz).
Wspólne pola: `seed`, siatka `[time]`, oś czasu dostępności `[gnss]` (czynnik
przerwy) oraz bloki dla poszczególnych czujników z ciągami `provenance` wskazującymi źródło każdej
liczby. Przykład (clock):

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

Pola opcjonalne (wyłączone, gdy ich brak): zegar może dodać `flicker_floor` (dolny poziom Allana dla FM 1/f — modulacji
częstotliwości); czujnik inercjalny może dodać `gyro_bias` i `q_arw` (bias żyroskopu i błądzenie losowe
kąta) oraz `bias_instability` i `q_aa` (dolny poziom niestabilności biasu Allana i błądzenie losowe
przyspieszenia) — razem **jednoosiowy (1-DOF) budżet błędu
akcelerometru** (VRW/ARW — błądzenie losowe prędkości/kąta — i niestabilność biasu). To jest budżet błędu, który uruchamia dostarczany
*pakiet* scenariuszy `inertial`. Niezależnie od tego biblioteka zawiera teraz zweryfikowany
**trójosiowy nawigator strapdown** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
orientację w kwaternionach z kompensacją coningu/scullingu, pełną mechanizację NED
(człony prędkości obrotu Ziemi i prędkości transportowej, grawitacja Somigliany WGS-84) oraz
deterministyczny model błędów IMU, w którym **współczynnik skali, niewspółosiowość,
czułość na g, kwantyzacja i rampa prędkości kątowej są modelowane** (IEEE Std 952-1997, norma IEEE
dotycząca specyfikacji i procedur testowych żyroskopów, §A.2; Groves 2013 §4.3). Ta trójosiowa ścieżka jest teraz **podłączona do uruchamialnego
luźno sprzężonego pakietu GNSS/INS** (`kind = "gnss-ins"`): 15-stanowy EKF w przestrzeni błędów
koryguje rozwiązanie strapdown względem zaszumionych pozycji, gdy GNSS jest dostępny, a następnie
przechodzi przerwę bez korekt, podając połączony błąd poziomy względem
lotu bez korekt swobodnego INS w pętli otwartej. Dostępna jest też aktualizacja **ściśle sprzężona
z pseudoodległości** (tworzy innowację w dziedzinie odległości, więc nadal koryguje
przy mniej niż czterech satelitach).
Scenariusz holdover zegara może dodać `runs` (> 1), aby uruchomić **zespół Monte Carlo** — każdy
wskaźnik jakości jest wtedy podawany jako średnia z rozrzutem od 5. do 95. percentyla, a
wykres zacienia pasmo ufności błędu (zob. `scenarios/clock-ensemble.toml`).

Scenariusz `fusion` (te same bloki co `hybrid`) uruchamia **dwa niezależne estymatory Kalmana**
— jeden dla stanu zegara, jeden dla stanu pozycji — korygowane przez GNSS i wspomagane
optycznym transferem czasu, i podaje połączony FoM holdover. Te dwa bloki nie mają
wspólnej kowariancji krzyżowej: to zestawiona para budżetów błędów, a **nie** prawdziwy sprzężony
wspólny filtr zegar+pozycja (kowariancja między blokami jest pozycją planu rozwoju). Zob.
`scenarios/fusion-pnt.toml`.

Scenariusz `spoof` wprowadza spoofing czasu — jeden z czterech rodzajów `[attack.shape]`
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; samo `rate_ns_per_s` jest nadal
akceptowane jako rampa liniowa) — i uruchamia detektor spoofingu każdego zegara. Detektor jest
dwustronnym **testem energii χ²₁ / Neymana–Pearsona** na statystyce monitora wspomaganego zegarem:
próg jest ustalany z docelowego budżetu fałszywych alarmów `target_pfa`, a
**prawdopodobieństwo pominięcia wykrycia `P_md`** jest podawane zarówno w postaci zamkniętej, jak i przez
Monte Carlo (`mc_runs` prób na hipotezę — obie zgadzają się do kilku ×1/√N).
**Wskaźnik jakości Security to `1 − P_md`** przy wielkości szkodliwej operacyjnie (specyfikacji),
więc cichy zegar, który wychwytuje spoofing o wielkości specyfikacji, uzyskuje ≈ 1, a zaszumiony,
który często go przeoczy, uzyskuje mniej (zob. `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Scenariusz `gnss-sim` to symulacja w **dziedzinie pomiarów**: dla każdego widocznego
satelity syntetyzuje pseudoodległość `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` i Doppler L1, z jednoczęstotliwościową jonosferą **Klobuchara**
(`[iono]`, IS-GPS-200 §20.3.3.5.2.5) i zenitalną troposferą **Saastamoinena**
rzutowaną funkcją odwzorowania **Niell (1996)** (`[tropo]`).
Residua zasilają **migawkowy RAIM** dla HPL/VPL w każdej epoce, a pseudoodległość,
Doppler, C/N₀ i poprawki jonosferyczne/troposferyczne każdego satelity są emitowane w tablicy JSON
`gnss_measurements`. To symulator w przód (generuje pomiary ze
znanej prawdy), a nie odbiornik/solver — przebieg bez szumu odtwarza geometrię plus
poprawki z dokładnością poniżej milimetra (zob. `scenarios/gnss-sim-raim.toml`).

Scenariusz `jamming` modeluje zakłócenia RF jako **budżet łącza**: `[jammer]`
(pozycja ECEF, moc nadawania `power_dbw`, typ) podnosi stosunek zagłuszarki do sygnału w
`[receiver]` obserwującym konstelację Walkera `[constellation]`. Na podstawie geometrii (tłumienia
w wolnej przestrzeni i zysku anteny odbiorczej w danym kierunku) oblicza dla każdego satelity
`J/S`, **efektywne C/N₀** ze standardowego równania przeciwzakłóceniowego (zysk przetwarzania
przy rozpraszaniu × współczynnik separacji widmowej `Q`; Kaplan & Hegarty §9.4) i
oznacza utratę śledzenia poniżej konfigurowalnego progu śledzenia — podając
wskaźnik jakości `availability_under_jamming`. Szerokopasmowa zagłuszarka 10 W w odległości 1 km
całkowicie odcina odbiornik (J/S ≈ 72 dB); ta sama zagłuszarka w odległości 100 km tylko
degraduje łącza (zob. `scenarios/jamming-demo.toml`).

Scenariusz `sweep` uruchamia **badanie kompromisów**: zmienia jeden `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` lub `classical_q_wf`) od `start` do `stop` w `steps`
punktach na skali (`scale`) `lin` lub `log`, zapisuje `metric` (np. `holdover_s`) dla obu
zegarów i rysuje dwie krzywe. Scenariusz bazowy umieszcza się pod `[base]` (zob.
`scenarios/sweep-clock-stability.toml`).

Scenariusz `sweep-nd` uogólnia to na **dowolny pakiet i dowolną liczbę osi**:
zmienia klucze TOML z kropkami scenariusza `[base]` (dowolnego `kind`) w iloczynie kartezjańskim
`[[axes]]`, ponownie uruchamia każdy węzeł siatki i zapisuje `metrics` podane jako
ścieżki JSON z kropkami w wyniku (np. `classical.fom.holdover_s`). Działa dla
każdego pakietu, ponieważ operuje na granicy TOML/wynik; przebiegi natywne obliczają
siatkę równolegle (bez dodatkowej zależności, wasm wraca do trybu sekwencyjnego), a
wyjście jest deterministyczne i w porządku wierszowym (zob. `scenarios/sweep-nd-inertial.toml`).

Scenariusz `orbit` wyprowadza oś czasu `[gnss]` z geometrii zamiast ją
definiować — podaj orbitę `[user]`, `[constellation]`, maskę elewacji `mask_deg` i dwa
bloki zegarów. Podaje też dokładność pozycji z geometrii satelitów;
opcjonalne `sigma_uere_m` (1-sigma błąd odległości równoważny użytkownikowi, domyślnie 1 m) skaluje
rozmycie precyzji pozycji do sigmy pozycji. Orbitę użytkownika można uczynić
**eliptyczną** za pomocą `eccentricity` i `argp_deg`, a `j2 = true` dodaje sekularny dryf
spowodowany spłaszczeniem Ziemi (zob. `scenarios/orbit-molniya.toml`). Konstelacja może zamiast tego być
**prawdziwa**: podaj w `[constellation]` blok `tle` zestawów elementów dwuwierszowych, a
satelity zostaną z niego sparsowane (zob. `scenarios/orbit-real-tle.toml`). Dodaj jeden lub więcej
bloków `[[constellations]]` dla **wielu GNSS** (np. GPS + Galileo; zob.
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

Rodzaje **alt-PNT bez GPS** nawigują w ogóle bez GNSS, dopasowując zmierzoną sekwencję pola
do mapy przez filtr cząsteczkowy. Scenariusz `gravity-map` prowadzi trasę
przez pole anomalii grawitacyjnych w harmonikach sferycznych i odtwarza ją z odczytu grawimetru
na zimnych atomach (`scenarios/gps-denied-gravity-nav.toml`); scenariusz `terrain-nav`
robi to samo względem DEM wysokości SRTM (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
a scenariusz `combined-altpnt` łączy **grawitację + magnetyzm IGRF + teren** w jednym filtrze
(`scenarios/combined-altpnt.toml`).

Scenariusz `lunar-integrity` ocenia PNT **cislunarne**: uruchamia przelot z poziomem ochrony ARAIM
nad biegunem południowym Księżyca względem zestawu przekaźników LunaNet/LNIS i uczciwie podaje
lukę integralności — księżycowe σ_URE ~30 m podnosi poziom ochrony znacznie powyżej granicy alarmowej 50 m,
więc usługa jest *niedostępna* według reguł integralności w stylu lotniczym
(`scenarios/lunanet-araim.toml`).

Scenariusz `lunar-time-offset` podaje **relatywistyczne tempo zegara Ziemia–Księżyc** — podstawę
skali Lunar Coordinate Time (LTC/TCL). Postnewtonowska tożsamość oparta na pierwszych zasadach
sumuje różnicę potencjałów własnych (potencjał geoidy IAU `L_G` minus powierzchniowy potencjał
własny Księżyca) i człon kinetyczny Księżyca (Doppler drugiego rzędu) do sekularnego
tempa ≈ 57 µs/dobę, podawanego razem z opublikowanym pasmem 56–59 µs/dobę; podaje też
skumulowane przesunięcie LTC−TT w danym horyzoncie i zespół ważony odwrotnością wariancji (księżycowy
zegar papierowy). **MODELLED** — główna liczba jest *zależna od odniesienia* (geoida ziemska
wobec selenoidy księżycowej, okno uśredniania), dlatego podawane jest pasmo, a nie pojedyncza certyfikowana
liczba (`scenarios/lunar-time-offset.toml`).

W `scenarios/` znajduje się co najmniej jeden opracowany przykład każdego rodzaju (92 rodzaje, 193 pliki scenariuszy
`.toml` + 1 manifest zestawu — kilka rodzajów ma więcej niż jeden przykład). Nie każdy
rodzaj ma plik nazwany jego nazwą: `lunar-integrity` → `scenarios/lunanet-araim.toml` i
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` to dwa z kilku takich przypadków.
Rodzaje, które można uruchomić, wypiszesz w dowolnym momencie przez błędy `cargo run -- --validate <file>`,
pythonowe `list_kinds()` lub narzędzie MCP `list_scenario_kinds`.

</details>

<details>
<summary>Wyniki</summary>

### Wyniki

Artefakt wyniku to wersjonowany, samoopisujący się JSON: szeregi czasowe dla każdego kroku,
ocenione wskaźniki jakości, aktywne specyfikacje modeli (z pochodzeniem), ziarno,
**skrót scenariusza** — dzięki czemu każdy wykres można odtworzyć z pliku — oraz, dla każdego zegara,
`adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): nakładające się
odchylenie Allana dla czasów uśredniania rozłożonych co oktawę — standardowy sposób odczytu
stabilności zegara — teraz z **95% pasmem ufności zależnym od typu szumu** dla każdego punktu (typ
potęgowy zapisu jest identyfikowany z nachylenia zmodyfikowanego odchylenia Allana, a przedział χ² używa
odpowiadającej mu efektywnej liczby stopni swobody NIST SP 1065). Piaskownica w przeglądarce przedstawia to jako
wykres log-log „Clock stability (ADEV)”. (MDEV, TDEV i HDEV są dostępne jako estymatory
biblioteczne; eksportowana krzywa wyniku to nakładające się ADEV.) Każde pole, z jednostkami i
wskazaniem źródła, jest udokumentowane w [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Każdy wykres jest samoopisujący się.** Piaskownica w przeglądarce, eksport `*.chart.svg` z CLI
i karta wyników HTML (HyperText Markup Language) opatrują każdy obraz wykresu stopką o treści
`Kshana v<version> · scenario <hash> · kshana.dev`. `scenario <hash>` to pierwsze
12 znaków szesnastkowych **skrótu scenariusza** przebiegu — skrótu SHA-256 (256-bitowego Secure Hash Algorithm) kanonicznej definicji
scenariusza (ziarno, progi, parametry modeli, okna GNSS, …); raporty integralności i księżycowe,
które nie mają własnego skrótu, używają zamiast tego SHA-256 źródła scenariusza.
To jest **ten sam odcisk**, który pokazuje jednowierszowe podsumowanie i wynik JSON, więc
zapisany lub wklejony wykres zawsze niesie swoją wersję, dokładny scenariusz, który go wytworzył (do
odtworzenia bit w bit), i źródło — zmień dowolne wejście, a skrót się zmieni.

Wskaźniki jakości są zgodne ze standardowymi operacyjnymi wskaźnikami jakości PNT:

| Wskaźnik jakości | Jak Kshana go oblicza |
|-----------------|------------------------|
| Timing Performance (pakiety clock/orbit) | RMS błędu fazy zegara + 95. percentyl w czasie przerwy, w **nanosekundach** (`timing_rms_ns`) — metryka czasu, a nie pozycji |
| Positioning Performance (pakiety inertial/hybrid) | RMS błędu pozycji 1-DOF + 95. percentyl w czasie przerwy, w **metrach** (`pos_rms_m`); jednoosiowy. Pojedynczy przebieg jest oznaczony `monte_carlo: false`; ustaw `runs = N` dla zespołu Monte Carlo, który podaje średnią, rozrzut i 95% CI (przedział ufności) bootstrap każdej metryki. Nadal **nie** jest to 2-D CEP/2DRMS (kołowy błąd prawdopodobny / podwójna średnia kwadratowa odległości) ani dokładność ważona DOP (te wymagają modelu trójosiowego — plan rozwoju) |
| Autonomy | czas holdover — czas w granicach specyfikacji po utracie GNSS (skwantowany siatką: granica dolna) |
| Resilience | nachylenie wzrostu błędu w czasie przerwy |
| Availability | część przebiegu z rozwiązaniem w granicach specyfikacji |
| Integrity | **samospójność** filtra — odsetek próbek z przerwy, których błąd pozostaje wewnątrz własnej granicy k-sigma filtra Kalmana. **Nie** jest to lotnicza liczba integralności HPL/VPL/RAIM (zob. [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Security | **analityczna granica *wykrywalności* spoofingu** ze stabilności zegara — jak mały/powolny spoofing czasu mógłby zgłosić monitor spójności pojedynczego zegara. Ma znaczenie tylko przy skonfigurowanym ataku; **nie** jest wielosatelitarnym detektorem RAIM |

Nie znasz tych terminów? Każdy jest zdefiniowany prostym językiem w [słowniku](docs/GLOSSARY.md).

</details>

<details>
<summary>Układ repozytorium</summary>

### Układ repozytorium

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
<summary>FAQ (najczęściej zadawane pytania)</summary>

### FAQ

**Czy muszę rozumieć fizykę kwantową, aby z tego korzystać?**
Nie. Jeśli potrafisz uruchomić wiersz poleceń, potrafisz uruchomić Kshana. Zacznij od
[wprowadzenia prostym językiem](docs/CONCEPTS.md); terminy sprawdzaj w [słowniku](docs/GLOSSARY.md).

**Czy to projekt sprzętu kwantowego lub oprogramowanie lotne?**
Nie. To *symulator* osiągów. Wierność odwzorowania sprzętu kwantowego pochodzi z opublikowanych
modeli błędów, a nie z tego narzędzia. Zob. [Czym jest / czym nie jest](#what-it-is--is-not).

**Czy wyniki kwantowe są realistyczne, czy to marketing?**
Każdy parametr jest zacytowany z karty katalogowej lub artykułu, każdy model jest zwalidowany względem
zależności podręcznikowej, a dojrzałość jest uczciwie oznaczona w
[VALIDATION.md](docs/VALIDATION.md) — w tym to, że żaden strontowy zegar optyczny nie
latał. Silnik jest neutralny: kwantowe i klasyczne to ten sam kod z różnymi
opublikowanymi liczbami.

**Czy mogę ufać, że dwa przebiegi będą zgodne?**
Tak — przebiegi są deterministyczne: `scenario + seed + engine version → bit-identical output`,
wymuszane przez `scripts/check-reproducible.sh`.

**Czy mogę używać go z Pythona lub w przeglądarce?**
Tak — zob. [Instalacja](#install): przykłady Python i WebAssembly znajdują się pod nią. Oba wywołują ten sam silnik.

**Jak zamodelować własny czujnik?**
Napisz scenariusz `.toml` z opublikowanymi liczbami swojego czujnika w polach
`provenance`. Zob. [Format scenariusza](#scenario-format) i przykłady w `scenarios/`.

**Czy jest bezpłatny do użytku komercyjnego?**
Tak — na licencji AGPL-3.0, w tym w zastosowaniach komercyjnych, o ile przestrzegasz
copyleftu AGPL (w szczególności: jeśli zmodyfikujesz Kshana i udostępnisz ją przez sieć, musisz
udostępnić tym użytkownikom zmodyfikowany kod źródłowy). Jeśli Ci to nie odpowiada — np. musisz
osadzić Kshana w zastrzeżonym produkcie lub uruchomić zamkniętą usługę sieciową — licencja
komercyjna jest dostępna od Ashforde® OÜ; zob. [`LICENSING.md`](LICENSING.md) i
[Wsparcie](#support--professional-services).

</details>

<details>
<summary>Rozwiązywanie problemów</summary>

### Rozwiązywanie problemów

**`cargo build` kończy się niepowodzeniem na starym zestawie narzędzi.** Kshana wymaga Rust ≥ 1.88. Zaktualizuj poleceniem
`rustup update`.

**Budowanie rozszerzenia Python nie linkuje się w macOS** (`Undefined symbols … _Py…`).
Rozszerzenie Python rozwiązuje swoje symbole w czasie ładowania. `maturin` ustawia właściwą flagę
linkera automatycznie — użyj `maturin develop --features python` zamiast samego
`cargo build`.

**Budowanie Python zgłasza, że interpreter jest nowszy, niż zna PyO3.** Ustaw
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (koła abi3 są zgodne w przód między
wersjami CPython).

**Budowanie WebAssembly nie może znaleźć celu.** Zainstaluj go raz poleceniem
`rustup target add wasm32-unknown-unknown`, a następnie `wasm-pack build --target web -- --features wasm`.

**Gdzie trafiło moje wyjście?** Każdy przebieg zapisuje `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` i `<scenario>.report.json` obok
wejściowego `.toml`, a
dla rodzajów, które publikują tabelę, także `<scenario>.table.csv`. Wszystkie są
z założenia ignorowane przez git.

</details>

<details>
<summary>Wersjonowanie i wydania</summary>

### Wersjonowanie i wydania

Kshana stosuje [Semantic Versioning](https://semver.org). Przed wersją 1.0 publiczny
schemat scenariusza/wyniku może się jeszcze zmieniać; zmiany niezgodne wstecz są wyraźnie wskazywane w
[`CHANGELOG.md`](CHANGELOG.md). Każdy wynik jest odtwarzalny z
`scenario + seed + engine version`.

**Każdy tag `vX.Y.Z` automatycznie publikuje wszystkie kanały, w jednej kolejności** — pełny
zestaw testów uruchamia się najpierw na otagowanym commicie, nic nie jest publikowane, dopóki nie przejdzie, a
następnie potok sprawdza, czy każdy rejestr rzeczywiście serwuje nową wersję
([`docs/RELEASING.md`](docs/RELEASING.md)). Kanały:

| Kanał | Instalacja / pobranie | Zawartość |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | biblioteka Rust + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | serwer MCP |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | koła abi3 (Linux/macOS/Windows) + sdist (dystrybucja źródłowa) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | moduł WebAssembly + nakładka JS |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | wieloarchitekturowy obraz OCI (Open Container Initiative) — bez potrzeby zestawu narzędzi |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | program uruchamiający: pobiera plik binarny wydania, weryfikuje `SHA256SUMS`, uruchamia go |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | ten sam program uruchamiający dla Pythona |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | plik binarny `kshana-mcp`, generowany z `SHA256SUMS` każdego wydania |
| Claude Desktop | kliknij dwukrotnie `kshana-mcp-<target>.mcpb` z wydania | rozszerzenie z plikiem binarnym w środku |
| oficjalny rejestr MCP | automatycznie wykrywany przez klientów MCP | `io.github.ashfordeOU/kshana-mcp` (obraz OCI, pakiety npm i PyPI) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → wyszukaj "Kshana" | wtyczka IDE **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | pobranie | plik binarny wiersza poleceń `kshana` dla Linux x86-64, macOS (Apple silicon i Intel) i Windows x86-64, plik binarny `kshana-mcp` dla każdego z tych systemów oraz Linux Arm, rozszerzenie Claude Desktop `.mcpb` dla każdego systemu, **SBOM** CycloneDX, pochodzenie kompilacji **SLSA**, podsumowanie walidacji HTML i plik sum kontrolnych `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | cytowalne archiwum każdego wydania |
| [kshana.dev](https://kshana.dev) | otwórz w przeglądarce | Kshana Studio, aplikacja WebAssembly w przeglądarce, przebudowywana z tagu każdego wydania (więc wersja, którą pokazuje, jest wersją, którą uruchamia) |

Wersja crate'a / obrazu / rejestru serwera MCP podąża za silnikiem (dołącza
bibliotekę); wtyczka JetBrains ma niezależne wersje (wywołuje zainstalowany
plik binarny `kshana`).

</details>

<details>
<summary>Plan rozwoju</summary>

### Plan rozwoju

Zob. [`ROADMAP.md`](ROADMAP.md) dla etapowego planu rozwoju, [`CHANGELOG.md`](CHANGELOG.md)
dla historii wydań i [`docs/CAPABILITY.md`](docs/CAPABILITY.md) dla
planu rozwoju poszczególnych możliwości. Kolejność priorytetów: **najpierw dowody dotyczące synchronizacji czasu i holdover dla
infrastruktury krytycznej** (maski telekomunikacyjne, dłuższy holdover ze starzeniem i szumem
migotania, wczytywanie zmierzonych danych zegarów); **na drugim miejscu neutralna metoda kompromisów kwantowe
wobec klasyczne** (wyniki oznaczone jako MODELLED, dopóki zmierzone dane partnera ich nie podniosą); oraz
**nawigacja księżycowa / cislunarna i w dalekim kosmosie utrzymywana**, a nie rozwijana jako wiodąca. **Precyzyjna redukcja układu ITRF** jest już dostarczona —
pełny łańcuch GCRS↔ITRS oparty na CIO wg IAU 2006/2000A (ruch bieguna + nutacja z dokładnością poniżej sekundy łuku),
zwalidowany bit w bit względem SOFA/ERFA i niezależnie sprawdzony krzyżowo względem ANISE
(czysto rustowego SPICE) do ≤ 3.6 m na orbicie GNSS. Pozycje najbliższego okresu obejmują ściśle sprzężoną fuzję fazy nośnej i udostępnienie
luźno/ściśle sprzężonego nawigatora GNSS/INS w większej liczbie pakietów; silnik **nawigacji radiometrycznej
w dalekim kosmosie / dla Marsa** pojawił się w v0.17.0 (zwalidowany symulacyjnie).
**Warstwa fizyki kwantowej** jest pozycją **P2**: akcelerometr CAI jest teraz symulowany na podstawie
pierwszych zasad (faza Macha–Zehndera, szum projekcji, zanik kontrastu, sprzężenie z
wibracjami), podczas gdy czujniki zegara/transferu czasu są nadal napędzane opublikowanymi
współczynnikami Allana/budżetu szumu. TEME&harr;ECEF oparte na GMST, systemy czasu IERS
z sekundami przestępnymi (UTC/TAI/TT/UT1), propagacja orbit SGP4/SDP4 (v0.7.0,
zwalidowana względem wektorów AIAA 2006-6753) i uruchamialny pakiet fuzji `gnss-ins`
zostały **dostarczone**, a prędkość inercjalna jest udostępniana dalej. Aktywny
stochastyczny detektor spoofingu czasu (test energii Neymana–Pearsona / χ²₁ z P_fa/P_md w Monte Carlo
i FoM Security 1−P_md), model zagłuszania w budżecie łącza (J/S → efektywne
C/N₀ → utrata śledzenia), dostępność wielu konstelacji, jednoosiowy (1-DOF)
budżet błędu IMU, dwa niezależne estymatory Kalmana (zegar + pozycja) podawane jako
połączony FoM, prawdziwa geometria konstelacji z TLE, raport w postaci karty wyników HTML,
dostępność GNSS wyprowadzona z geometrii
*oraz* rozmycie precyzji z orbit keplerowskich z mimośrodem i dryfem J2,
pasma ufności Monte Carlo, przeglądy parametrów w badaniach kompromisów, piaskownica WebAssembly w przeglądarce
oraz opcjonalne powiązania Python (PyO3) i WebAssembly (wasm-bindgen) trafiły
do `main`.

</details>

<details>
<summary>Współtworzenie</summary>

### Współtworzenie

Zob. [`CONTRIBUTING.md`](CONTRIBUTING.md). W skrócie: testy przechodzą (`cargo test`),
dwa skrypty zabezpieczające przechodzą, Conventional Commits oraz wpis `CHANGELOG.md` `[Unreleased]`
dla każdej zmiany widocznej dla użytkownika. Udział reguluje nasz
[Kodeks postępowania](CODE_OF_CONDUCT.md). Aby zgłosić problem bezpieczeństwa, zob.
[Politykę bezpieczeństwa](SECURITY.md) — prosimy nie otwierać publicznego zgłoszenia dla podatności.

</details>

<details>
<summary>Dokumentacja: każdy dokument i dla kogo jest</summary>

<a id="documentation"></a>
### Dokumentacja

| Dokument | Dla kogo | Co zawiera |
|----------|----------|--------------|
| [Wprowadzenie do pojęć](docs/CONCEPTS.md) | wszyscy, zacznij tutaj | co robi Kshana i dlaczego, od zera do fizyki |
| [Kshana Studio](web/README.md) | wszyscy | uruchom silnik w przeglądarce (WebAssembly); notatki dotyczące budowania i wdrażania |
| [Słownik](docs/GLOSSARY.md) | wszyscy | definicje każdego terminu prostym językiem |
| [Rodzaje scenariuszy](docs/KINDS.md) | wszyscy | każdy rodzaj, który silnik rozdziela: co robi, jego pola, przykładowe polecenie, jego wiersze rejestru i wykres, który silnik dla niego zapisuje |
| [Dane partnerów](docs/PARTNER-DATA.md) | laboratoria i producenci posiadający zmierzone dane | które wiersze MODELLED mógłby podnieść zmierzony zapis zegara lub IMU, formaty, jak zgłoszenie jest sprawdzane (`kshana partner check`), oceniane i uznawane |
| [Architektura](docs/ARCHITECTURE.md) | programiści / recenzenci | mapa modułów, potok silnika, rozdzielanie i diagramy |
| [Stan walidacji](docs/VALIDATION.md) | recenzenci / cytujący | co jest `validated`, a co `not modeled`, z dowodami |
| [Macierz weryfikacji](docs/VERIFICATION-MATRIX.md) | recenzenci / cytujący | sprawdzany maszynowo rejestr dowodów — każdy wiersz możliwości z jego statusem, modułem, testem i zewnętrzną wyrocznią, generowany z `src/verification.rs` |
| [Uzasadnienie Modelled](docs/MODELLED-RATIONALE.md) | recenzenci | dlaczego każdy wiersz **Modelled** nie ma zewnętrznej wyroczni, wiersz po wierszu |
| [Pochodzenie](docs/PROVENANCE.md) | recenzenci / cytujący | każdy parametr czujnika, model i zbiór danych powiązany z opublikowanym źródłem, w jednej cytowalnej tabeli |
| [Odtwarzalność i pochodzenie](docs/REPRODUCIBILITY.md) | recenzenci / opiekunowie pakietów | gwarancje determinizmu, przypinanie wzorców, SBOM (zestawienie składników oprogramowania), pochodzenie kompilacji |
| [Znaczniki platform kół](docs/WHEEL_TAGS.md) | opiekunowie pakietów | macierz kół Python abi3 — który znacznik platformy rozwiązuje `pip install kshana` |
| [Pozycjonowanie](docs/POSITIONING.md) | oceniający | gdzie Kshana plasuje się względem RTKLIB/gLAB (uzupełniająco) i warstwa przeglądarkowa bez instalacji |
| [Kshana Pro](docs/PRO.md) | oceniający / kierownicy programów | co zastrzeżona nakładka Pro dodaje do tego samego silnika: optymalizator projektu, niepewność i wrażliwość, dossier misji, obserwacja kampanii, współistnienie widmowe, lokalna usługa zadań, identyfikowalność wymagań; co każda z nich wytwarza i czego nie robi |
| [Raport techniczny](paper/kshana-technical-report.md) · [Artykuł JOSS](paper/paper.md) | recenzenci / cytujący / oceniający | pełny rozszerzony artykuł badawczy — architektura, modele dla każdej domeny, walidacja, studia przypadków i ograniczenia — plus zwięzłe zgłoszenie do JOSS (Journal of Open Source Software) |
| [Walidacja SGP4](docs/SGP4-VALIDATION.md) | recenzenci / cytujący | zgodność z odniesieniem AIAA 2006-6753 (666 stanów, ~4 mm) **oraz** bezpośrednie porównanie z niezależnym crate `sgp4` (zgodność poniżej mikrona / 4.12 mm) |
| [Walidacja modelu sił](docs/AGENCY-ORBIT-VALIDATION.md) | recenzenci / cytujący | silnik pełnych sił (`src/precise_od.rs`) dopasowany do efemeryd agencji — metodologia i zwalidowane residua |
| [Przewodnik po prawdziwych TLE](docs/REAL_TLE_GUIDE.md) | użytkownicy | sterowanie scenariuszami prawdziwymi TLE konstelacji z Celestrak / Space-Track (zamiast dołączonego syntetycznego zestawu Walkera) |
| [FoM integralności](docs/INTEGRITY.md) | oceniający | co oznaczają liczby `integrity` / `security` — i czym **nie** są w porównaniu z lotniczym HPL/VPL |
| [Odniesienie ARAIM](docs/ARAIM_REFERENCE.md) | recenzenci / integratorzy | otwarta implementacja poziomu ochrony MHSS ARAIM — rzutowanie nominalnego biasu `b_k`, σ_URA wobec σ_URE oraz prawdopodobieństwa a priori trybów błędów |
| [Modele kwantowe](docs/QUANTUM.md) · [szczegóły](docs/QUANTUM-MODELS.md) | recenzenci | warstwa fizyki interferometru zimnych atomów i to, gdzie współczynniki są nadal brane z tabel |
| [Zgodność](docs/COMPLIANCE.md) | oceniający | zakres algorytmów DO-229E / DO-316 i to, co **nie** jest deklaracją zgodności |
| [Zaufanie w żegludze](docs/MARITIME-TRUST.md) | żeglarze / integratorzy | wskaźnik zaufania GNSS 0-100 dla NMEA statku, jego monitory i ograniczenia (doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu) |
| [Strumienie szkoleniowe NMEA](docs/NMEA-TRAINING.md) | szkoleniowcy morscy | syntetyczne NMEA mostka ze skryptowym zagłuszaniem i spoofingiem oraz dziennikiem instruktora; wyłącznie tekst, nigdy do nawigacji na żywo |
| [Mapa zakłóceń](docs/INTERFERENCE-MAP.md) | analitycy / żeglarze | gdzie statki powietrzne i statki zgłaszały zdegradowane dane nawigacyjne i jaką część trasy to dotyczy |
| [Pakiety dowodowe](docs/EVIDENCE-PACKS.md) | operatorzy / ubezpieczyciele | podpisane zapisy techniczne zdarzenia dotyczącego zaufania i sposób ich weryfikacji |
| [Telemetria zaufania](docs/TRUST-TELEMETRY.md) | zespoły operacyjne / bezpieczeństwa | strumień zaufania jako metryki Prometheus, zdarzenia SIEM i OpenTelemetry, z pulpitem Grafana |
| [Integracje morskie](docs/MARINE-INTEGRATIONS.md) | właściciele łodzi / integratorzy | wtyczka Signal K, tryb bramki OpenCPN i konfiguracja referencyjna |
| [Stanowisko testowe](docs/TEST-BENCH.md) | producenci odbiorników | odtwarzanie eksportowanego scenariusza przez laboratoryjny symulator i ocena dziennika odbiornika |
| [Mapowanie zgodności](docs/compliance/README.md) | oceniający | publiczne ramy odporności odwzorowane na wyjścia Kshana, ze źródłami i lukami; `kshana compliance-report` |
| [Notatniki](notebooks/README.md) | użytkownicy | uruchamialne samouczki z wyrenderowanym tekstem |
| [Normy i interoperacyjność](docs/STANDARDS.md) | integratorzy | formaty wymiany GNSS / dynamiki lotu / agencji, które Kshana czyta i zapisuje (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [Fuzja LEO PNT](docs/LEO-PNT-FUSION.md) | użytkownicy / oceniający | połączone pozycjonowanie, nawigacja i synchronizacja czasu MEO + LEO: Doppler, łączna pseudoodległość, zbieżność PPP, 5G NTN, pokrycie polarne i transfer czasu z LEO dla dowolnej konstelacji; opcjonalne presety i ich publiczne źródła |
| [Kampanie](docs/CAMPAIGNS.md) | użytkownicy / oceniający | składanie scenariuszy: łańcuchowe osie czasu misji, przeglądy parametrów, zespoły Monte Carlo i przebiegi przy wspólnym warunku, z tożsamościami kompozycji utrwalonymi w testach |
| [Katalog scenariuszy](docs/SCENARIOS.md) | użytkownicy / integratorzy | każdy rozdzielany rodzaj z wymaganymi i opcjonalnymi polami TOML — generowany z `api::list_scenario_kinds()` |
| [Schemat wyniku](docs/SCHEMA.md) | integratorzy | każde pole wyniku JSON, z jednostkami i wskazaniem źródła |
| [API Python](docs/PYTHON_API.md) | użytkownicy Pythona | interfejs powiązania PyO3 — wywoływanie silnika, typy scenariusza/wyniku i przykłady |
| [Deklaracje a rzeczywistość](docs/CLAIMS-VS-REALITY.md) | recenzenci | rejestr domykania nadmiernych deklaracji + zabezpieczenie CI (`tests/no_overclaims.rs`), które utrzymuje go w stanie rozwiązanym |
| [Plan rozwoju](ROADMAP.md) | wszyscy | etapowy plan rozwoju — co zostało dostarczone i co jest następne |
| [Serwer MCP](mcp/kshana-mcp/README.md) · [Wtyczka JetBrains](ide/jetbrains/README.md) | agenci / użytkownicy IDE | uruchamianie Kshana z asystenta AI lub IDE JetBrains |
| [Przewodnik dla agentów](docs/AGENTS.md) · [Interfejsy](docs/SURFACES.md) | agenci / integratorzy | które narzędzie odpowiada na które pytanie, co zachować z każdą odpowiedzią; gdzie każda możliwość jest dostępna (CLI, Rust, Python, WASM, MCP, wtyczka, JetBrains, notatniki) i dlaczego komórka ma N/A |
| [Dziennik zmian](CHANGELOG.md) | wszyscy | historia wydań (Keep a Changelog + SemVer, Semantic Versioning) |
| [Współtworzenie](CONTRIBUTING.md) | współtwórcy | budowanie, zabezpieczenia, dyscyplina testów/cytowań, DCO (Developer Certificate of Origin) |
| [Zarządzanie](GOVERNANCE.md) | współtwórcy / społeczność | jak zarządzana jest Kshana — kto decyduje, jak, oraz granica między częścią otwartą a zamkniętą |
| [Kodeks postępowania](CODE_OF_CONDUCT.md) | społeczność | oczekiwane zachowanie (Contributor Covenant) |
| [Polityka bezpieczeństwa](SECURITY.md) | zgłaszający | jak zgłosić podatność; uwaga o podwójnym zastosowaniu |

</details>

<details>
<summary>Najważniejsze źródła</summary>

### Najważniejsze źródła

**Wyrocznie walidacyjne i normy** — zewnętrzne autorytety, na których opierają się sprawdzenia Kshana:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [dane testowe](https://celestrak.org/publications/AIAA/2006-6753/)): zestaw weryfikacyjny SGP4/SDP4, z którym Kshana zgadza się do 4.12 mm, oraz opracowane przykłady układów odniesienia, względem których sprawdzany jest łańcuch TEME→ITRF.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — referencyjne procedury czasu i układów odniesienia, względem których nutacja IAU 2000A i redukcja GCRS↔ITRS oparta na CIO są zwalidowane bit w bit.
- Petit & Luzum (red.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (normy orientacji Ziemi, ruchu bieguna i układów odniesienia).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (zależności odchylenia Allana i szereg referencyjny NBS14; NBS = dawne US National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): referencyjne implementacje ROC/AUC, macierzy pomyłek i precyzji/czułości/F1, z którymi stanowisko ewaluacji zaburzeń RF zgadza się dokładnie (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` i `linalg.expm` — procedury referencyjne, względem których zwalidowane są dopasowanie NNLS zmierzonego ADEV w quantum-trade, pasma spójności χ² i kowariancja szumu procesu zegara van Loana (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): używane zarówno jako otwarty stan techniki (zob. *Porównanie i otwarty stan techniki* poniżej), jak i jako **niezależna wyrocznia DOP**, z którą obliczenia GDOP/PDOP/HDOP/VDOP/TDOP zgadzają się do 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): modele sił stojące za dopasowaniem modelu sił do precyzyjnych efemeryd agencji.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (rodziny halo/NRHO, które odtwarza korektor różniczkowy CR3BP).

**Fizyka urządzeń i metod** — cytowane źródła stojące za modelami czujników:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (strontowy optyczny zegar sieciowy, cel z myślą o zastosowaniach kosmicznych).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (laboratoryjny zegar Sr, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (hybrydowa triada akcelerometrów kwantowych).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [samouczek IEEE AESS (Aerospace and Electronic Systems Society) (repozytorium University College London Discovery)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (wzrost błędu zliczania drogi).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (optyczny dwudrożny transfer czasu i częstotliwości; optyczne łącze międzysatelitarne modeluje swój budżet nieodwracalności na ich podstawie).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (modulacja BOC i teoria separacji widmowej stojące za `src/navsignal.rs`).
- Kaplan & Hegarty (red.) — *Understanding GPS/GNSS: Principles and Applications* (wyd. 3, Artech House, 2017): przeciwzakłóceniowe równanie efektywnego C/N₀ i jitter szumu termicznego śledzenia kodu DLL early–late, których używają modele sygnału nawigacyjnego i zagłuszania.

**Porównanie i otwarty stan techniki** — narzędzia i przeglądy, względem których pozycjonowana jest Kshana:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): parametry baterii testów spoofingu, względem których scharakteryzowany jest wielowarstwowy detektor.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): otwarte, zwalidowane profile błędów nawigacji inercjalnej używane jako klasyczny punkt odniesienia.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): otwarty symulator PNT księżycowego.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): otwarta analiza danych GNSS.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): OD GRAIL o zredukowanej dynamice, dolna granica przyspieszenia empirycznego, którą odtwarza dopasowanie LRO.

</details>
