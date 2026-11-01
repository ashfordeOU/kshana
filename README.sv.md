> Detta är en maskinöversättning av README.md vid v0.40.0 som ingen modersmålstalare har granskat ännu; den engelska README-filen är referensen. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: märket, ett kompassriktmedel som markerar det exakta ögonblicket, bredvid ordmärket kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>det exakta ögonblicket</em></strong><br>
  En simulator med öppen källkod för resiliens inom PNT (positionering, navigering och tidssynkronisering).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Status för kontinuerlig integration på main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Radtäckning nära 95 % av src/, mätt i docs/COVERAGE.md och med en spärr på 85 % i kontinuerlig integration"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 av 401 förmågor VALIDATED mot en oberoende extern referens, från verifieringsmatrisen"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Status för kvalitetsspärren i SonarQube Cloud"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Version v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Engelska och 17 språk till, maskinöversatta"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Licens: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, Zenodo-konceptposten för varje version"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="En kommersiell licens finns att få från Ashforde® OÜ, se Utgåvor"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana på crates.io, den aktuella publicerade versionen"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana på PyPI, den aktuella publicerade versionen"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana på npm, den aktuella publicerade versionen"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Öppna Kshana Studio</a> ·
  <a href="#install">Installera</a> ·
  <a href="#capabilities">Förmågor</a> ·
  <a href="#evidence">Evidens</a> ·
  <a href="#research">Forskning</a> ·
  <a href="docs/CONCEPTS.md">Dokumentation</a> ·
  <a href="#cite">Citera</a>
</p>

<p align="center">
  <strong>Språk:</strong> <a href="README.md">English</a> ·
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
  <sub>Kommandoraden, körningssammanfattningar, diagram och rapporter talar varje språk med <code>--lang &lt;tag&gt;</code>
  (till exempel <code>kshana scenarios/holdover-test-example.toml --lang de</code>), och det gör även ytorna för Python, WebAssembly och MCP.
  Detta är maskinöversättningar som ingen modersmålstalare har granskat ännu; engelska är referensen.
  Se <a href="docs/i18n.md">Lokalisering</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Öva minuten då GNSS slocknar. Kshanas uppdragskonsol, ritad utifrån en verklig körning av motorn v0.40.0: den kedjade kampanjen campaign-jam-spoof-holdover-integrity (frö 20260928, 6 faser, 18 medlemskörningar över T+01:16:10) och de 102 satelliterna i GPS, Galileo, BeiDou och GLONASS från constellation-multi-gnss-coverage, var och en ritad på den cirkulära tvåkropparsbana som återvunnits ur motorns markspår, med radier komprimerade för visning. Klockans tidsfel når som mest 62.7 ns mot en skyddsmarginal på 50 ns, bärvåg-till-brustäthet faller till -12.2 dB-Hz mot ett golv på 25 dB-Hz, och den vertikala skyddsnivån når 135.4 m mot en larmgräns på 50 m." width="100%">
</picture>

<details>
<summary><strong>Innehåll</strong></summary>

- [Öva minuten då GNSS slocknar](#rehearse-the-minute-gnss-goes-dark)
- [Nytt i 0.40](#whats-new-in-040), [Nytt i 0.39](#whats-new-in-039), [Nytt i 0.38](#whats-new-in-038) och [0.38 på djupet](#038-in-depth): poängsättning mot Jammertest, mottagarens egna flaggor, maskinindata, tidssynkronisering och holdover, standardpaket, LunaNet AFS, labbets rundtur, kshana-bench, observatoriet, exportörer, optik, [navigering för rymdanvändare](#space-user-navigation-gnss-ssv) och [infrastruktur på månen](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) och varje Studio-sida
- [Förmågor](#capabilities): tabellen över områden, [varje scenariotyp per familj](#every-scenario-kind-by-family), [varje kommando](#every-command), [varje yta](#every-surface)
- [Hur en körning fungerar](#how-a-run-works), [Uppdrag](#missions)
- [Evidens](#evidence): registret, [förmågeområden](#capability-domains)
- [Installera](#install), [Arkitektur](#architecture) (och [diagrammen](#diagrams)), [AI-assistent](#ai-assistant)
- [Utgåvor](#editions), [Forskning](#research), [Citera](#cite), [Licens](#licence)
- [Referens](#reference): användning, scenarioformat, utdata, kodförrådets struktur, vanliga frågor, felsökning, versionshantering, färdplan, bidrag, dokumentation

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Öva minuten då GNSS slocknar

Kshana spelar upp jamming, spoofing och klock-holdover när signaler från GNSS (Global Navigation Satellite
System) fallerar, och visar hur länge ett system håller tid och position inom sin
budget, och vilken klocka eller sensor som ger mest marginal. Det är en enda motor i Rust. Den körs i en
terminal, en notebook, en IDE (integrerad utvecklingsmiljö), en AI-assistent (artificiell
intelligens) eller i din webbläsare.

Varje körning kan reproduceras bit för bit utifrån scenariot, fröet och motorversionen.
Varje förmåga bär en av tre etiketter i ett maskinkontrollerat register: **VALIDATED** (en
oberoende extern referens stämmer), **MODELLED** (internt konsekvent, och uttalat öppet)
eller **PARTNER** (en hårdvarupartner äger den).

> **Status: v0.40.0.** Ett validerat, reproducerbart simuleringsunderlag för PNT-resiliens.
> Tidssynkronisering och holdover kommer först, eftersom det området är bäst validerat. Kshana är ett
> instrument för studier och avvägningar: inte hårdvara för radiofrekvent (RF) signalgenerering (det
> driver ingen radio och sänder ingenting; dess utdata på signalnivå är filer med IQ-sampel i basband
> för mjukvarumottagare), inte en hårdvaru- eller certifierad GNSS-mottagare (dess mjukvarumottagare
> är ett analysverktyg) och inte en flygprodukt. Ny inom området? Börja med
> [introduktionen på klarspråk](docs/CONCEPTS.md) och [ordlistan](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Nytt i 0.40

0.40 lägger till en felbudget på uppdragsnivå, märker varje figur och tabell med dess evidensnivå, läser uppmätta klockloggar,
kontrollerar inlämningar från datapartner, uppskattar var en störningskälla kan befinna sig och talar sjutton språk utöver engelska.
Registret har nu 401 rader: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Ingen rad uppgraderades till VALIDATED, och varje miss nedan är
fastlåst av ett test.

- **Uppdragstråd.** Typen `mission-thread` kedjar faser från uppskjutning till inträde (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` och fyra månrelaterade typer) med angivna överlämningsregler, en marginal mot angivna krav och den svagaste
  länken; ett Artemis-liknande exempel från början till slut över 11 faser (jord- och månsegment), 92 scenariotyper totalt. Varje tal är MODELLED. Den cislunära propageringen mot den publika Artemis I-banan
  **missar** sin förhandsregistrerade tröskel (45.3 km och 0.25 m/s mot 5 km och 0.05 m/s; orsaken är små manövrar som modellen inte innehåller), och månpropagatorn mot CAPSTONE-banan
  **missar** (136.8 km mot 25 km i slutet av ett varv); jämförelsen med LRO uppfylls. Raderna förblir MODELLED
  ([Uppdragstråd](docs/MISSION-THREAD.md), [månsegment](docs/MISSION-THREAD-LUNAR.md)). I Studio läses tråden på `/studio/mission-thread/`.
- **Evidensetiketter.** Varje figur och tabell som en körning skriver bär nivån och de registerrads-id den vilar på, lästa ur matrisen.
- **Uppmätta klockor.** Åtta klockloggformat läses ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)) och en anpassad
  serie kan driva holdover. Mot förhandsregistrerade trösklar **missar** anpassningen F1(a) på fem av sex registreringar och F2 på en; båda
  förblir MODELLED ([Ändringslogg](CHANGELOG.md#0400---2026-10-29)).
- **Datapartner.** `kshana partner check` kontrollerar formatet på en inlämning och poängsätter ingenting ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Källområde.** `kshana interference-map locate` ger ett område och en ellips, aldrig en ensam punkt, utifrån ADS-B- eller AIS-
  rapporter. Jämfört en gång med sändarplatserna vid Jammertest 2025 är resultatet **NOT ASSESSABLE** för båda källorna (för få
  schemalagda pass i öppna data), så raden förblir MODELLED ([Störningskarta](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Benchmark.** Omkampanjen för 0.40 uppfyller A3, D3 (båda EXPLORATORY), R3 och R4; A2, D1 och R1 förblir NOT MET ([Bench](docs/BENCH.md)).
- **Språk.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja och zh-Hans, som **maskinöversättningar som ingen modersmåls-
  talare har granskat**; engelska är referensen, och körningar på andra språk än engelska tar ungefär dubbelt så lång tid
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Nytt i 0.39

0.39 lägger inte till någon funktion och ändrar inget resultat; motorns utdata är utdata från 0.38. Den rättar en sak
på kommandoraden, uppdaterar beroenden i verktygen för korsvalidering och redovisar benchmarkens
utslag i sin helhet.

- **Kommandorad.** `kshana kinds | head` (vilken stängd standardutmatning som helst) får inte längre panik: programmet avslutas
  tyst med status 141, som andra verktyg gör för en stängd pipe. Andra skrivfel rapporteras fortfarande.
- **Beroenden.** `memmap2` 0.9.11 i de två låsfilerna för ANISE-korskontrollen samt `pillow` 13.0.0 och
  `certifi` 2026.10.19 i versionslåsningarna för referensmiljön, alla under `xval/`: inget som levereras ändrades.
- **kshana-bench, alla utslag.** Mot de förhandsregistrerade trösklarna är tre NOT MET, var och en fastlåst av ett test:
  A2 (`agc_k_sigma` AUC 0.766 mot minst 0.80), D1 (största gap 0.0301) och uppgift (b) R1 (överförd,
  inte körd på nytt). Ingen tröskel lättades ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Nytt i 0.38

0.38 gör den neutrala domaren mätbar: den poängsätter mottagarloggar mot ett publicerat test-
schema, läser fler mottagare och sensorer, testar tidssynkroniseringssystem och levererar en benchmark och ett
observatorium för störningar. Den förblir rådgivande: ingenting här är certifierat, inget resultat är ett typgodkännande,
och ingenting sänder. Varje rad anger vad registret innehåller för den ([hur en etikett förtjänas](#evidence));
en status namnger bara det som kontrollerades, och registerraden och den länkade sidan säger vad som inte kontrollerades.

| Nytt i 0.38 | Vad det gör, och varför | Registerstatus | Läs |
|---|---|---|---|
| **Poängsättning mot Jammertest** | `kshana jammertest import` läser den publicerade testkatalogen och sändningsplanen från NPRA som schemalagd sanning; `jammertest score` poängsätter en mottagarlogg per test (detekteringslatens, missade larm, falsklarm, tid till återhämtning), som ett signerat bevispaket om du anger en nyckel | **MODELLED**: en registerrad. Trösklarna förhandsregistrerades före varje poängsatt körning; på JammerTest 2024-data föll regeln om minsta datamängd i båda körningarna (4 och 7 poängsättbara fönster mot 10 krävda), så **ingen tröskel kan bedömas** och ingenting påstås | [Jammertest](docs/JAMMERTEST.md) |
| **Mottagarens egna flaggor** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG och NovAtel RXSTATUS läses in i en `self_report` per epok och jämförs med Kshanas larm (båda, endast mottagaren, endast Kshana, ingen); en läsare för Septentrio SBF och skrivskyddad `--serial`-indata | **MODELLED**; överensstämmelse mellan en mottagares detektor och Kshanas är inte validering | [Mottagarförtroende](docs/RECEIVER-TRUST.md) |
| **Fler mottagare och sensorer** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (från de BSD-licensierade pyrtcm-tabellerna, inte RTCM-texten), övervakningsströmmar från GNSS-SDR, en IMU-logg som andra sensor, ett ROS 2-paket, en `gnss_lib_py`-brygga och `imu-fit` för parametrar till hybridsensorer | **MODELLED**: sex registerrader; endast egenskrivna testdata, ingen inspelning från en verklig mottagare, IMU, GNSS-SDR-körning eller ROS-graf lästes | [Maskinindata](docs/MACHINE-INPUTS.md) |
| **Tester av tidssynkronisering och holdover** | typen `holdover-test` poängsätter ett holdover-test (GNSS borttaget av operatören, holdover, återhämtning) utifrån en uppmätt tidsfelsregistrering mot ITU-T-masker, "uppmätt mot masken"; läsare för loggar från linuxptp och chrony; hårdvarustegen och fältet `lab-attestation` | **MODELLED**: två registerrader; tidpunkterna är operatörens uppgift, inte verifierade | [Timing HIL](docs/TIMING-HIL.md), [Hårdvarusäkerhet](docs/HARDWARE-SAFETY.md) |
| **Standardpaket, LunaNet AFS, labbets rundtur** | poängsatta paket för DHS RPCF, IMO MSC.1/Circ.1575 och ICAO Doc 9849 Appendix F mot trösklar som angetts före körningen, "stöder evidens för"; en korsreferens till NIST IR 8323r1; en kodgenerator och kontrollant för LunaNet AFS; ett signerat paket som länkar en labbkörnings scenario, testförhållanden, mottagarlogg och poäng | **MODELLED** för paketen och rundturen; AFS-kodkontrollen är **VALIDATED** mot sina tryckta kontrollkolumner (se registerraderna) | [Standarder](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench och observatoriet** | fasta uppgifter, delmängder och mått för störningsdetektering, IQ-detektering, prediktion av holdover och optimismgapet, med en förseglad undanhållen datamängd och en statisk topplista; en reproducerbar daglig störningsprodukt med 24 h fördröjning, grova celler och ingen tillskrivning | ingen egen registerrad: den poängsätter inlämningar, och dess baslinjer är märkta MODELLED i resultatfilerna; mot de förhandsregistrerade trösklarna uppfylls poängsättaren, C1 till C3 och D2, och tre trösklar är **NOT MET** (fastlåsta av tester): A2 (`agc_k_sigma` AUC 0.766 mot minst 0.80 på testdelmängden), D1 (största gap 0.0301) och uppgift (b) R1 (överförd, inte körd på nytt); se `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatorium](docs/observatory/METHOD.md) |
| **Exportörer** | förtroendetelemetri som Home Assistant MQTT discovery- och tillståndsmeddelanden (endast publicering, inga inloggningsuppgifter) bredvid Prometheus, CEF, LEEF och OTLP | **MODELLED**: en registerrad | [Förtroendetelemetri](docs/TRUST-TELEMETRY.md) |
| **Optisk länkmarginal över tid** | typen `optical-atmosphere` kan skriva en realisering med frö av en plats väder som en serie av länkmarginaler | **MODELLED**: en registerrad; ett utfall ur modellen, inte klimatet | [Optisk atmosfär](docs/OPTICAL-ATMOSPHERE.md) |

Höjdpunkterna i 0.37: [ändringslogg](CHANGELOG.md#0370---2026-10-17). Hela listan för 0.38 finns i
[ändringsloggen](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 på djupet

Varje förmåga från tabellen ovan, på några rader: vad den gör, ett kommando för att köra den, en
bild ritad utifrån en verklig körning av motorn och vad registret innehåller för den. Bilderna
skrivs av [`tools/gen_figures_038.py`](tools/gen_figures_038.py) till
[`docs/figures/0.38/`](docs/figures/0.38/) (aldrig ritade för hand): `python3 tools/gen_figures_038.py`
skriver om dem från en byggd motor, och `--check` fallerar om en är inaktuell eller om dess bildtext här skiljer sig.
Där en indata är en logg är det en påhittad logg som skriptet skriver, eftersom de verkliga loggarna från tredje part
aldrig tas in i kodförrådet, och bildtexten säger det. Allt nedan är rådgivande: inte certifierat, inte ett
typgodkännande, och ingenting sänder. En status namnger det som kontrollerades och inget mer;
[hur en etikett förtjänas](#evidence).

### Poängsättning mot Jammertest

`kshana jammertest import` gör den publicerade testkatalogen och sändningsplanen från NPRA till
schemalagd sanning, och `kshana jammertest score` poängsätter en mottagarlogg mot den: för varje
schemalagt test, om det detekterades, hur sent och hur lång tid mottagaren behövde för att återhämta sig, samt
falsklarm utanför varje tidsfack. Katalogen hämtas och tas aldrig in i kodförrådet.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Poängsättning av en syntetisk mottagarlogg mot ett schema med tre tester, från en verklig körning av motorn v0.40.0 (`kshana jammertest score`). Loggen är påhittad: 1800 s NMEA med ett fall i C/N0 på 20 dB över två intervall. Schemat listar tre tidsfack; det mittersta facket har ingen störsändare i loggen. Poängen markerar 2 av 3 tester som detekterade (medianlatens 0 s) och 1 som missat, med 0 falsklarmsserier över 0.25 h ren tid. Ingenting här säger något om en verklig mottagare. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC 61108, IEC 61162): operatören är fortsatt ansvarig för fartygets navigering.">
</picture>

**Registerstatus: MODELLED.** Trösklarna fastställdes före varje poängsatt körning; på JammerTest 2024-data
föll regeln om minsta datamängd i båda körningarna, så ingen tröskel kan bedömas och ingenting påstås.
[Jammertest](docs/JAMMERTEST.md).

### Mottagarens egna flaggor

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG och NovAtel RXSTATUS läses in i en `self_report` per
epok och ställs bredvid Kshanas larm: båda, endast mottagaren, endast Kshana eller ingen. En
läsare för Septentrio SBF och en skrivskyddad `--serial`-indata matar samma jämförelse. Ingen av sidorna är
facit.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Mottagarens egen spoofingflagga ställd mot Kshanas larm, från en verklig körning av motorn v0.40.0 på en påhittad UBX-logg (200 epoker vid 1 Hz). C/N0 faller 20 dB vid 80 till 90 s och 120 till 130 s; mottagaren flaggar 120 till 130 s och 160 till 165 s. Av 140 epoker som jämfördes efter kalibrering flaggade båda i 11, endast mottagaren i 6, endast Kshana i 11 och ingen i 112. Ingen av sidorna är facit och överensstämmelse är inte validering. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

**Registerstatus: MODELLED.** Överensstämmelse mellan en mottagares detektor och Kshanas är inte
validering. [Mottagarförtroende](docs/RECEIVER-TRUST.md).

### Fler mottagare och sensorer

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, övervakningsströmmar från GNSS-SDR, en IMU-logg som andra
sensor, ett ROS 2-paket och en `gnss_lib_py`-brygga hamnar alla i samma tidslinje för mottagarförtroende.
`imu-fit` läser de sensorparametrar som hybrid- och fusionsscenarierna behöver ur en stillastående IMU-
logg, så att ett scenario kan köras med den sensor du faktiskt har.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Vad `kshana imu-fit` läser ur en stillastående IMU-logg, från en verklig körning av motorn v0.40.0 på en påhittad logg (20,000 sampel vid 100 Hz, 200 s): accelerometerns hastighetsslumpvandring q_va = 4.02e-06, gyrots vinkelslumpvandring q_arw = 9e-08, biasinstabiliteten 0.00296 och de tidiga Allan-lutningarna (-0.51 och -0.49; omkring -0.5 där vitt brus dominerar). Tabellen bredvid är den TOML som kommandot skriver ut. Skattaren är kontrollerad endast på syntetiska loggar. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

**Registerstatus: MODELLED.** Endast egenskrivna testdata; ingen inspelning från en verklig mottagare, IMU,
GNSS-SDR-körning eller ROS-graf lästes. [Maskinindata](docs/MACHINE-INPUTS.md).

### Tester av tidssynkronisering och holdover

Typen `holdover-test` poängsätter ett holdover-test (GNSS borttaget av operatören, holdover, återhämtning)
utifrån en uppmätt tidsfelsregistrering mot ITU-T-masker, och säger det med de orden: uppmätt
mot masken. Läsare för loggar från linuxptp och chrony matar den; hårdvarustegen och fältet
`lab-attestation` anger vem som uppgav vad.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Ett holdover-test poängsatt utifrån en tidsfelsregistrering, från en verklig körning av motorn v0.40.0 på scenarios/holdover-test-example.toml (601 sampel var 5:e s). GNSS tas bort av operatören vid 600 s och återställs vid 2400 s; tidsfelet driver till 299 ns i slutet av holdover, över budgeten på 100 ns efter 675 s, och återvänder inom bandet på 100 ns 70 s efter återställningen. Utslag: baslinjemasker PASS, holdovermasker FAIL, holdoverenvelopp FAIL, återhämtning RECOVERED. Uppmätt mot masken, inte ett godkännande. Tidpunkterna är operatörens uppgift, inte verifierade av Kshana. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

**Registerstatus: MODELLED.** Tidpunkterna då GNSS togs bort och återställdes är operatörens uppgift,
inte verifierade. [Timing HIL](docs/TIMING-HIL.md), [Hårdvarusäkerhet](docs/HARDWARE-SAFETY.md).

### Standardpaket

Poängsatta paket för DHS testprofiler för Resilient PNT, IMO MSC.1/Circ.1575 och ICAO Doc 9849
Appendix F, samt en korsreferens till NIST IR 8323r1 i `compliance-report`. Varje test kör ett medföljande
scenario och jämför ett resultatfält med en tröskel som angetts före körningen; ett test som behöver en mottagar-
logg listas som i behov av indata, inte poängsatt. Formuleringen är "stöder evidens för".

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Varje test i de tre poängsatta standardpaketen, från verkliga körningar av motorn v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 uppfyllda, 1 inte uppfylld, 2 behöver indata; imo-circ-1575: 1 uppfylld, 4 inte uppfyllda, 2 behöver indata; icao-doc9849-appf: 6 uppfyllda, 0 inte uppfyllda, 2 behöver indata. Totalt 13 uppfyllda, 5 inte uppfyllda och 6 som behöver indata som motorn inte har (en mottagarlogg eller utrustningsdokumentation). Varje tröskel angavs före körningen; en miss behålls som en miss. En uppfylld tröskel säger att ett modellerat scenario uppfyllde en angiven tröskel, ingenting om en produkt. Paketen stöder evidens för de rader de hänvisar till; de är inte en bedömning. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv; det får inte vara den enda grunden för något beslut om navigering eller säkerhet.">
</picture>

**Registerstatus: MODELLED.** En uppfylld tröskel säger att ett modellerat scenario uppfyllde en angiven tröskel, ingenting om en
produkt; varje miss behålls och är fastlåst av ett test. [Standarder](docs/STANDARDS.md).

### LunaNet AFS

Kodgeneratorn för LunaNet Augmented Forward Signal (Gold-, Weil- och tertiärkoder, meddelande-
ramen och dess felkodning) och en kontrollant för en inspelad eller genererad symbolström, fastlåst till en
utgåva av specifikationen.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="Kodgeneratorn för LunaNet AFS kontrollerad mot specifikationens tryckta kolumner, från en verklig körning av motorn v0.40.0 (`kshana lunanet-afs-check spec`, fastlåst till LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 januari 2025; dokumentet märker sina kodtabeller {LSIS-TBC}). 9 av 10 kontroller uppfylls; B4 är NOT MET (420 av 421 stämde). Den kontrollerar en symbolström mot en utgåva av en publicerad specifikation och säger ingenting om någon LunaNet-nod eller -tjänst. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Den kontrollerar en symbolström mot en utgåva av en publicerad specifikation och säger ingenting om någon LunaNet-nod eller -tjänst.">
</picture>

**Registerstatus: VALIDATED** för kod- och synkroniseringskontrollerna, mot de värden som
specifikationen trycker (vilka den märker TBC); en kontroll är NOT MET, behållen och fastlåst (en tryckt
kolumn för tertiärkoden skiljer sig: dokumentet trycker samma värde för två PRN). LDPC- och CRC-orden
i delramarna 2 till 4 kontrolleras inte. Registerraderna säger exakt vilka. [LunaNet AFS](docs/LUNANET-AFS.md).

### Labbets rundtur

`kshana.test-conditions/1` är en publicerad beskrivning av vad ett laboratorium gjorde (händelser, tider,
effekter). `kshana evidence round-trip` länkar scenariots hash, villkorens hash, mottagarloggens
hash och poängen till ett signerat paket, och vägrar ett paket vars villkor och poängsättande scenario
är oense om händelserna. Kshana producerar eller spelar aldrig upp en signal: hur ett scenario nådde en
mottagare är operatörens ansvar.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Strukturen hos ett bevispaket. En mottagarlogg (NMEA, u-blox UBX, RINEX 3 eller en Android-logg) och ett tidsfönster går in i kshana receiver-trust evidence, som skriver sju filer: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig och en valfri timestamp.tsr. Manifestet registrerar SHA-256 för hela loggen och för varje fil samt en hashkedja över filerna; signaturen täcker manifestet. kshana evidence verify kontrollerar signaturen, varje fils hash, kedjan och att ingen olistad fil finns, och avslutas med 0 när allt är verifierat, 1 när något fallerade och 3 när signeraren inte var fastlåst. Ett paket är en teknisk registrering, inte ett juridiskt utlåtande.">
</picture>

Bilden visar hur ett paket är uppbyggt. **Registerstatus: MODELLED.**
[Testförhållanden](docs/spec/TEST-CONDITIONS.md), [Testbänk](docs/TEST-BENCH.md).

### kshana-bench

Fasta uppgifter, delmängder och mått för störningsdetektering, IQ-detektering, prediktion av holdover och
optimismgapet, med en förseglad undanhållen datamängd och en statisk topplista. Den poängsätter inlämningar; den är inte
en rangordning av mottagare.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="De inbyggda baslinjerna för kshana-bench uppgift D (optimismgapet) på testdelmängden, från en verklig körning av motorn v0.40.0 (`kshana bench baseline`). Varje stapelpar är arean under ROC-kurvan på fallen inom fördelningen och på de förskjutna fallen; gapet mellan dem är optimismgapet, mot en tolerans på 0.05. fused-max-z: 0.998 och 0.983 (gap 0.015); sqm-imbalance: 0.882 och 0.882 (gap 0.001); agc-excess: 0.848 och 0.819 (gap 0.030); raim-parity: 0.682 och 0.672 (gap 0.010); energy-cn0-drop: 0.595 och 0.565 (gap 0.030). Etiketterna är etiketter från en generativ modell av en syntetisk korpus, aldrig fältdata: MODELLED. Rådgivande: modellerat eller uppmätt mot angivna referenser, inte ett godkännande, en certifiering eller ett intyg om överensstämmelse. En poäng beskriver en logg eller en korpus, aldrig en produkt.">
</picture>

**Registerstatus:** ingen egen registerrad; baslinjerna är märkta MODELLED i resultatfilerna.
Mot de förhandsregistrerade trösklarna uppfylls poängsättaren, C1 till C3 och D2, och tre trösklar är NOT MET, var och en
fastlåst av ett test: A2 (`agc_k_sigma` AUC 0.766 mot minst 0.80 på testdelmängden), D1 (största gap
0.0301) och uppgift (b) R1 (överförd från den tidigare kampanjen, inte körd på nytt). Siffrorna finns i
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Störningsobservatorium

En produkt per UTC-dygn och region från ett öppet arkiv över flygplanspositioner, på ett fast grovt rutnät:
varje cell är försämrad, inte försämrad eller inte observerad (vilket inte är "fri"). Släpps tidigast
24 h efter att dygnet slutar, med små celler undertryckta och ingen tillskrivning av orsak.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Två syntetiska dygn på störningskartan ritade utifrån de incheckade exemplen i examples/interference-map/output, var och en med sin egen syntetiska rutt och de andelar av ruttexponering som motorn rapporterar. Till vänster ett ADS-B-dygn: 1 försämrad cell, 6 inte försämrade, 4 obedömda (skrafferade) och celler utan post, ritade tomma, som inte observerades. Rutten är 525 km: 11.5% av dess längd i försämrade celler, 38.3% inte försämrade, 9.1% obedömda och 41.1% inte observerade. Till höger ett AIS-dygn: celler flaggade av cirkel- och landdetektorerna, icke-avvikande celler och tomma celler; rutten är 454 km med 10.5% i avvikande celler, 21.2% inte avvikande, 0.0% obedömda och 68.3% inte observerade. ADS-B och AIS är separata lager och kombineras aldrig. En flaggad cell är inte ett konstaterande av störning, och en cell utan färg observerades inte, vilket inte är detsamma som fri. Alla data är påhittade, i öppna mellersta Atlanten, och inte en mätning.">
</picture>

Bilden visar de incheckade exempeldygnen, inte en observatorieprodukt. **Registerstatus: MODELLED**:
ingen extern oberoende referens, inget facit och ingen tillskrivning av orsak; en cell som inte observerades
bedömdes inte, vilket inte är detsamma som fri. [Observatoriets metod](docs/observatory/METHOD.md).

### Exportörer

Förtroendetelemetri som Prometheus-text, CEF, LEEF, OTLP samt Home Assistant MQTT discovery- och tillstånds-
meddelanden. Kommandot publicerar endast till ett mål du anger och innehåller inga inloggningsuppgifter.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Ett förtroenderesultat i tre exportformat, från verkliga körningar av motorn v0.40.0 (`kshana trust-telemetry`) på examples/maritime-trust: Prometheus textexponering (den senaste förtroendepoängen är 5.9 och bandet untrusted är det som är satt), samt de sista CEF- och LEEF-meddelandena. Kommandot publicerar ingenting om det inte får ett mål, innehåller inga inloggningsuppgifter och sänder ingen radiosignal. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC 61108, IEC 61162): operatören är fortsatt ansvarig för fartygets navigering.">
</picture>

**Registerstatus: MODELLED.** [Förtroendetelemetri](docs/TRUST-TELEMETRY.md).

### Optisk länkmarginal över tid

Typen `optical-atmosphere` kan skriva en realisering med frö av en plats väder som en serie av länk-
marginaler: molnepisoder, en kolumn av flytande vatten för varje, ett scintillationssampel per steg. Studios
sida Optical PNT öppnar scenarierna för optical-atmosphere.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="En realisering med frö av länkmarginalen för platsen 'northern' över 336 h, från en verklig körning av motorn v0.40.0 på scenarios/optical-atmosphere-network.toml (frö 37, ett steg på 600 s). Marginalen faller under noll under molnepisoder; i detta utfall är länken uppe 40.5 % av tiden, med 27 avbrott och ett längsta avbrott på 30.7 h. Indata är illustrativa, serien är ett utfall ur modellen och inte klimatet, och den skiljer sig från den statistiska tillgängligheten (37.8 %) med utfallets samplingsfel. Endast rådgivande analys: inte en certifierad produkt för tillgänglighet, integritet eller navigering, och inte en prediktion för någon verklig plats om inte dess klimatindata kommer från en angiven datamängd.">
</picture>

**Registerstatus: MODELLED.** Ett utfall ur modellen, inte klimatet. [Optisk atmosfär](docs/OPTICAL-ATMOSPHERE.md).

### Nya vyer i Studio

[kshana.dev/studio](https://kshana.dev/studio/) får en Bridge-uppspelning (två körningar sida vid sida på en
uppdragsklocka, på [`/studio/replay/`](https://kshana.dev/studio/replay/)), en sida för Optical PNT
(`/studio/optical/`), en sida för holdover-test (`/studio/holdover/`) och en observatorievisare
(`/studio/observatory/`). De kör samma motor i webbläsaren, ingenting laddas upp, och de bär
samma rådgivande uttalande. Bilderna ovan ritas utifrån motorns egna utdata av ett skript;
de är inte skärmbilder av dessa sidor.

<a id="space-user-navigation-gnss-ssv"></a>
### Navigering för rymdanvändare (`gnss-ssv`)

För en rymdfarkost ovanför, runt eller långt bortom GNSS-banorna: hur många GNSS-signaler den kan använda, hur
starka de är, hur bra geometrin är och vad ett filter ombord kan göra med dem. En typ,
fyra lägen, valda av scenariots tabeller: ett **skal** av användare (andelen tid med en och fyra
signaler, per konstellation), en **bana** (signaler, C/N0, precisionsutspädning och
mediet för randstrålen längs en bana), en **navigeringskörning** (ett filter med nio tillstånd på pseudoavstånd, till
månen) och en **formation** (relativ navigering av följare kring en ledare). Den publika källan för
tillgänglighetsjämförelsen är broschyren om den interoperabla GNSS Space Service Volume (UN OOSA
ST/SPACE/75, från International Committee on GNSS), som själv är en simulering; den hämtas och tas aldrig
in i kodförrådet. Hela sidan: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Signaltillgänglighet för en användare på en sfär på 36000 km höjd med en halvsfärisk antenn, från en verklig körning av motorn v0.40.0 på scenarios/gnss-ssv-shell.toml (en reducerad körning: 162 användare, 3 dygn, steg på 10 min), vid en tröskel på 20 dB-Hz. För varje konstellation och band två staplar: andelen par (användare, epok) med minst en signal och med minst fyra. Kombinerat, L1: 99.4 % minst en, 73.2 % minst fyra, längsta avbrott under fyra signaler 160 min. Kombinerat, L5: 100.0 % minst en, 99.9 % minst fyra, längsta avbrott under fyra signaler 20 min. MODELLED: en modellerad studie utifrån angivna indata, inte en mätning och inte ett påstående om servicevolym för något system. Den reducerade storleken är inte broschyrjämförelsen. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Signaler längs en hög jordbana (perigeum 497 km, apogeum 58622 km, period 18.8 h), från en verklig körning av motorn v0.40.0 på scenarios/gnss-ssv-heo.toml, band L1. Överst: den bästa bärvåg-till-brustätheten bland signalerna i sikte, mot tröskeln på 20 dB-Hz. I mitten: antalet signaler i sikte från alla konstellationer, från 4 till 55 längs de samplade punkterna. Av de mottagna länkarna kom 2252 genom en huvudlob och 696 genom sidlober, med ett märkt parametriskt ersättningsmönster, inte något systems uppmätta mönster. Median-PDOP 67, 95:e percentilen 358. MODELLED: en modellerad studie utifrån angivna indata, inte en mätning och inte ett påstående om servicevolym för något system. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Ett filter ombord med nio tillstånd på en överföring från låg bana mot månen, från en verklig körning av motorn v0.40.0 på scenarios/gnss-ssv-nav-lunar.toml (289 epoker, 13 punkter ritade). På en logaritmisk axel det sanna positionsfelet och filtrets egen en-sigma-gräns mot tid sedan start. Inom GNSS-banorna är positionens RMS 1.4 m; ovanför dem är den 90 m, med slutfelet 184 m på 193,330 km höjd med 1 mätning. Medelvärdet av det normaliserade kvadrerade skattningsfelet över hela körningen är 4.4 (omkring 3 för ett konsistent positionsblock). Sanning och filter delar sina ersättningar för solen och månen. MODELLED: en modellerad studie utifrån angivna indata, inte en mätning och inte ett påstående om servicevolym för något system. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Relativ navigering av 2 följare kring en ledare på en hög bana, från en verklig körning av motorn v0.40.0 på scenarios/gnss-ssv-formation-heo.toml (401 epoker). För varje följare två staplar: den relativa positionens RMS genom att subtrahera de två oberoende absoluta skattningarna, och från det relativa filtret på enkeldifferentierade pseudoavstånd. Baslinje 0.8 km: 5.1 m och 1.2 m. Baslinje 2.0 km: 4.1 m och 2.1 m. Det absoluta filtret är inte konsistent här: medelvärdet av det normaliserade kvadrerade skattningsfelet är 187 mot omkring 3 för ett konsistent filter, så dess angivna osäkerhet är alldeles för liten. MODELLED: en modellerad studie utifrån angivna indata, inte en mätning och inte ett påstående om servicevolym för något system. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

**Registerstatus: MODELLED, och jämförelsen med broschyren missar till största delen.** Trösklarna fastställdes före
körningen. Av åtta uppfylls bara S0 (den inversa länkbudgeten, 13 av 13 värden) och S6 (månuppdraget).
**S1 till S5 och S7 är NOT MET**: geometrin i den övre och undre servicevolymen (43 av 52 och 48 av 52
celler), den övre servicevolymen vid 15/20/25 dB-Hz, de sex GEO-uppdragen, HEO-uppdraget och det
parametriska sidlobsmönstret mot uppmätta panelmönster för GPS. Nästan varje miss i S1 till S5 rör
GLONASS, och broschyren trycker två olika referensvinklar för det; en diagnostisk variant som använder det
andra paret får S1, S2 och S4 att stämma i varje cell, men den ersätter inte den officiella körningen och ingen rad är
VALIDATED. Formationskörningens absoluta filter är också överkonfident (medelvärdet av det normaliserade kvadrerade felet
långt över det värde på omkring 3 som ett konsistent filter ger).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="Den registrerade jämförelsen av tillgänglighetsmodellen för rymdanvändare med den publika broschyren om Space Service Volume, från de incheckade resultaten av den förhandsregistrerade körningen (xval/gnss-ssv/results-run1.json, skriven av exemplet ssv_booklet_check i motorn v0.40.0). Stapel för stapel, cellerna inom tolerans: S0 13 av 13 (MET); S1 43 av 52 (NOT MET); S2 48 av 52 (NOT MET); S3 122 av 155 (NOT MET); S4 132 av 156 (NOT MET); S5 18 av 26 (NOT MET); S6 26 av 26 (MET); S7 0 av 20 panelmönster (NOT MET). Endast S0 och S6 uppfylls enligt den förhandsregistrerade tolkningen. En diagnostisk variant som använder broschyrens andra GLONASS-vinklar får S1, S2 och S4 att stämma i varje cell, men ersätter inte den officiella körningen. Ingen registerrad är VALIDATED. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

[Navigering för rymdanvändare](docs/SSV.md), [vad jämförelsen visar](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Infrastruktur på månen (`lunar-infrastructure`)

Månens bana och yta som navigations- och geodetisk infrastruktur, i fem studier valda av
`study`: **od-consistency** (en banbestämning ombord med jordens GNSS i en halobana mot en
oberoende från marken), **carrier-phase** (fixering av heltalsosäkerhet mellan ytstationer och en
orbiter), **frame-coestimation** (månens datum från avståndsmätning från jordstationer med och utan orbiter-
länkar), **space-tie** (laser-, VLBI- och GNSS-förskjutningar på en rymdfarkost mot felet i den lokala anslutningen) och
**geodesy-sensitivity** (vilken familj av observabler som ser Love-talen h2, k2 och l2). Modellen är en
begränsad trekroppsmodell med angivna förenklingar och illustrativa indata. Hela sidan:
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
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Konsistens hos en banbestämning ombord med jordens GNSS i en nästan rätlinjig halobana med en oberoende banbestämning från marken, från verkliga körningar av motorn v0.40.0 på scenarios/lunar-infrastructure-od-consistency.toml och varianten med modellfel (400 försök vardera). Medelvärdet av den normaliserade differensen q är 5.81 utan modellfel och 5.95 med ett injicerat accelerationsfel på 3e-10 m/s2, mot 6 förväntat: de två banlösningarna är konsistenta (tröskel C1 MET). Andelen försök över 95 %-punkten är 0.040 och 0.052; tröskeln för att detektera det injicerade felet var minst 0.5, så den är NOT MET (C3): lösningen ombord är känd till omkring 352 m mot 23 m för den från marken, så en förskjutning på tio meter döljs inom dess kovarians. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon storhet på månen. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Fixering av heltalsosäkerhet i bärvågsfas mellan ytstationer på månen och en orbiter, från det incheckade resultatet av den poängsatta körningen av motorn v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 båglängder, en Monte Carlo med 401 dragningar vardera, skriven av scenarios/carrier-phase-scored.toml). 1 dygn: framgång 1.0 % (standardfel 0.5 %), 134 osäkerheter, orbiterns positionssigma 45.6 m flytande och 18.5 m fixerad; 2 dygn: framgång 0.5 % (standardfel 0.4 %), 259 osäkerheter, orbiterns positionssigma 21.5 m flytande och 8.7 m fixerad; 3 dygn: framgång 2.8 % (standardfel 0.8 %), 375 osäkerheter, orbiterns positionssigma 6.3 m flytande och 2.1 m fixerad. Heltalsfixering uppnås inte: framgången stannar mellan 1 % och 3 % vid 25 dBi, och vid de registrerade 12 dBi kan problemet inte ställas upp. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon storhet på månen. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Precision hos månens datum med sju parametrar (tre translationer, en skala och tre rotationer) från avståndsmätning från jordstationer, med och utan avstånd från orbiter till ytstation, från en verklig körning av motorn v0.40.0 på scenarios/lunar-infrastructure-frame-coestimation.toml. Cramér-Rao-sigma för translationerna och rotationerna sjunker med orbiterlänkarna (till exempel t_z från 0.98 m till 0.046 m); det minsta egenvärdet för informationen stiger 111 gånger och CRLB-spåret sjunker till 1.0 % (tröskel F3 MET). Detta förutsätter att banan är känd i månens axlar, med dess fel buret av orbiterns avståndssigma på 1 m. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon storhet på månen. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Precision hos förskjutningarna mellan laseravståndsmätning, VLBI och GNSS-positioner för en rymdfarkost, mot felet i den lokala anslutningen på marken, från en verklig körning av motorn v0.40.0 på scenarios/lunar-infrastructure-space-tie.toml (en båge på 6.56 dygn, teknikernas sigma GNSS 10 m, VLBI 1 m, laser 0.1 m). Med en lokal anslutning från 1 mm till 1 m stannar translationssigma för laser minus GNSS nära 1.04 m tills anslutningen når 1 m: den begränsas av teknikernas mätbrus, inte av den lokala anslutningen. Golvet som enbart anslutningen sätter är kvadratroten ur två gånger dess sigma. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon storhet på månen. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Vilken familj av observabler som är känslig för månens Love-tal h2, k2 och l2, från en verklig körning av motorn v0.40.0 på scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Varje cell är RMS av den partiella derivatan av en familjs observationer med avseende på en parameter, i den familjens egna enheter (så celler jämförs längs en rad, inte nedåt i en kolumn); ett streck betyder att familjen saknar känslighet. laseravståndsmätning: h2 7.6, k2 ingen, l2 9.8. orbiterspårning: h2 ingen, k2 0.00086, l2 ingen. gravimeter på ytan: h2 2.9e+03, k2 4.3e+03, l2 ingen. klocka på ytan: h2 2.8e-17, k2 2.8e-17, l2 ingen. Med alla fyra familjerna är Cramér-Rao-sigma 0.36 % av nominellt h2, 0.52 % av k2 och 1.16 % av l2. Att lägga till en familj sänkte aldrig det minsta egenvärdet (28 av 28 tillägg), men spåret av pseudoinversen var inte större i endast 16 av 28: den halvan av tröskel G3 är NOT MET. Orbiterfamiljen ser siktlinjeintegralen av k2-accelerationen, en siffra i den övre änden. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon storhet på månen. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv.">
</picture>

**Registerstatus: MODELLED, och tre trösklar är NOT MET.** Numeriken kontrolleras mot oberoende
program i numpy och scipy; ingenting jämförs med en mätning av en storhet på månen, och ingenting är
VALIDATED. Uppfyllt: de två banlösningarna är konsistenta (medelvärde av q 5.81 mot 6 förväntat), och orbiter-
länkar höjer datumets minsta egenvärde omkring 111 gånger, under antagandet att banan är känd. **Inte uppfyllt**: det
injicerade modellfelet på 3e-10 m/s2 **detekteras inte** (C3: lösningen ombord är känd till omkring 350 m, så
omkring tio meter döljs i dess kovarians); **heltalsfixering uppnås inte** (1 till 3 % framgång vid
25 dBi, och vid de registrerade 12 dBi kan problemet inte ställas upp); och spårhalvan av G3 för att lägga till en
familj av observabler (spåret steg i 12 av 28 tillägg, varje gång för att familjen höjde rangen).
Varje miss är fastlåst av ett test. [Infrastruktur på månen](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Öppna [kshana.dev/studio](https://kshana.dev/studio/) så körs hela motorn i din
webbläsare, kompilerad till WebAssembly. Inget att installera, och ingenting laddas upp. Studio har
två vyer av samma motor, och en omkopplare i sidhuvudet växlar mellan dem och behåller
scenariot, vyn och alla inställningar du ändrat.

**Den enkla vyn** är där Studio öppnas. Den utgår från frågor (hur många satelliter
kan jag se, kan jag lita på min positionsbestämning, hur länge kan en klocka hålla tid, vad gör en störsändare
med min mottagare) och från en karta över allt motorn kan göra, varje område med sin andel
validerade metoder. Öppna ett scenario så kommer svaret först: en enkel mening, skriven för
det som scenariot mäter, därefter dess nyckeltal och ett diagram. Högst fem inställningar
visas, de som ändrar svaret mest; resten väntar under **Avancerade inställningar**.
**Hur detta beräknas** förklarar metoden, och **För forskare** ger motorns egna
siffror, scenariofilen, koden för att köra det från Python och citeringen.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, enkel vy, på det medföljande scenariot integrity-raim, motorn v0.40.0 körs lokalt. Frågan: uppfyller geometrin larmgränserna (horisontell och vertikal skyddsnivå)? Svaret först, märkt Live-resultat: Ja, för det mesta: under 95.3 % av de 12 h. Mottagarens felgräns stannade under larmgränserna (40 m horisontellt och 50 m vertikalt) vid 344 av 361 kontroller, och ingen positionsbestämning var vilseledande. Nyckeltal: tid då positionsbestämningen går att lita på 95.3 %, längsta lucka 10 min, typisk felgräns 6.5 / 13 m, vilseledande positionsbestämningar 0. Bredvid, Prova andra inställningar med fem av dem (avståndsfelet, de två larmgränserna, varaktigheten och elevationsmasken) och Kör igen, därefter de hopfällda avsnitten Avancerade inställningar (13 till), Hur detta beräknas (8 validerade, 6 modellerade) och För forskare. Nedanför, vyerna av detta resultat och skyddsnivåerna ritade mot larmgränsen." width="100%">
</picture>

**Den avancerade vyn** är hela instrumentpanelen: scenariobiblioteket, fem numrerade steg
(Välj, Ställ in, Kör, Läs resultat, Dela eller exportera), nyckeltalen med PASS- och FAIL-märken
där körningen anger en tröskel, och varje panel: översikt, diagram, kartor, uppspelning,
motorns rapport och exporter. En sökruta når scenarier, områden och fälten i
dem, och du kan fästa upp till fyra körningar och jämföra dem sida vid sida.

<details>
<summary>Den enkla vyns startskärm, och den avancerade vyn efter en körning</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, enkel vy, startskärm, med rubriken Vad vill du ta reda på?, med motorn v0.40.0 igång och, i det övre fältet, tre länkar: Utbildningsgenomgång, Störningskarta och Mottagarförtroende. Fyra frågor: hur många satelliter kan jag se var som helst på jorden, kan jag lita på min positionsbestämning, hur länge kan en klocka hålla tid utan satelliter, och vad gör en störsändare med min mottagare. Under den första dess registrerade resultat: minst 22 satelliter i sikte på varje plats och 31 i genomsnitt med GPS, Galileo, BeiDou och GLONASS tillsammans, en positionsbestämning möjlig på 100 % av platser och tider, på en världskarta över satelliter i sikte, med knappen Öppna detta resultat. Bredvid, Allt Kshana kan göra: 16 områden och 139 körklara scenarier, varje ruta med ett litet diagram från en registrerad körning och dess andel validerade metoder, och registrets 173 av 350 förmågor validerade." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, avancerad vy, efter en körning av det medföljande scenariot constellation-multi-gnss-coverage (Fyra GNSS-konstellationer, en karta), motorn v0.40.0 körs lokalt. Till vänster scenariobiblioteket, 139 scenarier i 16 områden. De fem stegen Välj, Ställ in, Kör, Läs resultat och Dela eller exportera, med steg 4 aktuellt. Nyckeltal: 102 satelliter, tillgänglighet 100 % (PASS), median för positionens precisionsutspädning (PDOP) 0.95 (PASS), PDOP 95:e percentilen 1.105 (PASS), 31.03 satelliter i sikte i genomsnitt och 22 som minst. Nedanför panelraden med Täckning vald, uppspelningsfältet, en världskarta över medel-PDOP från 0.831 till 1.0853 med varje satellit ritad, och de globala täckningssiffrorna." width="100%">
</picture>

</details>

Studios källkod och byggnoteringar finns i [`web/README.md`](web/README.md).

### Webbplatsen

Resten av [kshana.dev](https://kshana.dev) byggs från detta kodförråds egna filer och
motorkörningar: uppdrag, förmågor, evidensregistret, den publicerade forskningen och
utgåvorna.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Tre sidor på kshana.dev sida vid sida. Startsidans hjältebild: namnraden Kshana · क्षण · det exakta ögonblicket ovanför rubriken Öva minuten då GNSS slocknar, med uppdragskonsolen från en verklig körning av motorn v0.40.0 (en jordglob och tre live-diagram: klockans tidsfel, bärvåg-till-brustäthet och skyddsnivå). Evidens, Publicerad forskning: de sex arXiv-artiklarna byggda på den öppna motorn, den nyaste med en figur från motorn. Utgåvor, Kshana Pro, samma motor, förstärkt: Free kör ett scenario, Pro besvarar programmets fråga." width="100%">
</picture>

<a id="capabilities"></a>
## Förmågor

En motor täcker hela felkedjan, från den första störda satelliten till den sista
nanosekunden av klock-holdover. Motorn har 92 scenariotyper; `kshana kinds` listar
dem och [`docs/SCENARIOS.md`](docs/SCENARIOS.md) dokumenterar varje fält.

| Förmåga | Vad den besvarar |
|---|---|
| [Spektrum](docs/SPECTRUM.md) | hur en störsändare tar GNSS L-bandet, band för band, sekund för sekund |
| [Klockor och tidssynkronisering](docs/TELECOM-TIMING.md) | hur länge varje klocka håller tiden efter att GNSS förlorats |
| [Konstellationer runt valfri himlakropp](docs/CONSTELLATION-DESIGN.md) | täckning, precisionsutspädning och tillgänglighet runt jorden, månen eller Mars |
| [Solsystemet](docs/SOLAR-SYSTEM.md) | var varje planet befinner sig, och ljustiden för valfri länk |
| [Navigering i låg omloppsbana](docs/LEO-PNT.md) | en passage, en länk, ett navigeringsmeddelande och en fusionerad positionsbestämning, steg för steg |
| [Kampanjer](docs/CAMPAIGNS.md) | ett kedjat uppdrag, ett svep eller en Monte Carlo-ensemble i ett scenario |
| [Animering](docs/ANIMATION.md) | en körnings tidsserie som en animerad teckning, en spelare eller bildrutor |
| [Rapporter](docs/REPORTS.md) | varje siffra med sin enhet och sin etikett, i HTML (HyperText Markup Language) och JSON (JavaScript Object Notation) |
| [Exporter för interoperabilitet](docs/INTEROP.md) | banor och geometri för andra verktyg: SP3, CCSDS OMM och OEM, CZML, KML, GeoJSON, STK och SigMF |
| [Maritimt förtroende](docs/MARITIME-TRUST.md) | kan bryggan lita på denna positionsbestämning: en poäng 0-100 och skäl för ett fartygs NMEA, live eller från en logg (rådgivande, inte typgodkänd navigationsutrustning) |
| [NMEA-strömmar för utbildning](docs/NMEA-TRAINING.md) | syntetisk NMEA för bryggan med skriptad jamming och spoofing och en instruktörslogg, för utbildning av besättning (endast text; aldrig för ett fartygs levande navigationssystem; rådgivande, inte typgodkänd navigationsutrustning) |
| [Störningskarta](docs/INTERFERENCE-MAP.md) | var flygplan och fartyg rapporterade försämrade navigeringsdata, och hur mycket av en rutt det berör |
| [Källområde](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | var, under angivna antaganden, en källa till försämrade positionsrapporter kan befinna sig: områden med angiven konfidens, en tyngdpunkt med sin ellips, aldrig en punkt (MODELLED; `kshana interference-map locate`) |
| [Bevispaket](docs/EVIDENCE-PACKS.md) | en signerad, offline-verifierbar teknisk registrering av ett fartygs loggfönster och vad motorn beräknade utifrån det, för en incidentrapport (rådgivande, inte typgodkänd navigationsutrustning) |
| [Förtroendetelemetri](docs/TRUST-TELEMETRY.md) | förtroendeströmmen som Prometheus-mått, SIEM-händelser och valfri OpenTelemetry, med en exempelinstrumentpanel för Grafana (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K och OpenCPN](docs/MARINE-INTEGRATIONS.md) | förtroendepoängen på en båts Signal K-server och i OpenCPN, med en referensbyggnad för en liten dator bredvid mottagaren (rådgivande, inte typgodkänd navigationsutrustning) |
| [Export till testbänk](docs/TEST-BENCH.md) | `kshana bench-export`: ett scenarios fordonsrörelse och händelser för en GNSS-simulator i laboratorium (ingen signal skrivs), och hur mottagarens logg poängsätts efteråt |
| [Mappning och rapport för efterlevnad](docs/compliance/README.md) | `kshana compliance-report`: vilka rader i offentliga resiliensramverk som en uppsättning körningar stöder evidens för, och det gap som återstår |
| [Notebooks](notebooks/README.md) | körbara handledningar: fartygsförtroende och utbildningsströmmar, ruttexponering på en störningskarta, mappning för efterlevnad och testbänken, kvant mot klassisk GDOP |
| [Galileo OSNMA-verifierare](docs/OSNMA.md) | vilka satelliters navigeringsdata en mottagare kan autentisera kryptografiskt, och varför en kontroll fallerar; Kshana beviljar inga rättigheter under EU:s OSNMA ICD IPRs (se NOTICE på sidan) |

Exportformaten i sin helhet: SP3 är Standard Product 3; CCSDS OMM och OEM är Orbit
Mean-elements och Orbit Ephemeris Messages från Consultative Committee for Space Data
Systems; CZML och KML är Cesium och Keyhole Markup Languages; STK är Systems Tool Kit;
SigMF är Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="Den kedjade kampanjen campaign-jam-spoof-holdover-integrity, en verklig körning av motorn (frö 20260928): 6 faser (Nominell → Jamming → Spoofing → Holdover → Integritetslarm → Återhämtning) och 18 medlemskörningar på ett rutnät om 10 s över T+01:16:10. Tre banor: klockans tidsfel mot en skyddsmarginal på 50 ns (topp 62.7 ns), effektiv bärvåg-till-brustäthet mot ett golv på 25 dB-Hz (minimum -12.2 dB-Hz) och vertikal skyddsnivå mot en larmgräns på 50 m (topp 135.4 m), med körningens larmhändelser: T+00:20:00 RF-detektorn för spoofing larmar (fusionerade övervakare för konsistens, effekt och signalkvalitet); T+00:26:10 den klockstödda spoofingövervakaren larmar." width="100%">
</picture>

<details>
<summary>Varje förmåga, ritad utifrån en verklig körning: L-bandets vattenfall, täckningskartan, solsystemet och en passage i låg omloppsbana</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="GNSS L-bandet som en spektral effekttäthet över 60 s, från en verklig körning av typen spectrum (l-band-waterfall-jamming.toml, frö 7, motorn v0.40.0): frekvens på bredden, tid nedåt, färg för effekt över brusgolvet på -202.0 dBW/Hz. Störsändare: chirp-integritetsenhet (chirp, på vid 10 s, av vid 40 s); CW-ton på L1 (cw, på vid 30 s); smalbandigt brus på L2 (narrowband, på vid 45 s). Sämsta band GPS L1 C/A: lägsta effektiva C/N0 3.2 dB-Hz vid 31 s mot ett spårningsgolv på 25 dB-Hz. GPS L1 C/A minimum 3.2 dB-Hz; Galileo E1 minimum 4.7 dB-Hz; GPS L2C minimum 36.9 dB-Hz; GPS L5 minimum 44.1 dB-Hz; Galileo E5a minimum 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Satelliter i sikte över hela jorden under ett dygn, från en verklig körning av constellation-design (constellation-multi-gnss-coverage.toml, motorn körd av denna generator): 102 satelliter (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Varje cell om 10 grader är skuggad efter medelantalet satelliter över masken på 10 grader (27.2 till 36.5); punkterna är motorns markspårssampel, ett per timme och satellit. Global tillgänglighet 100.00 % vid PDOP högst 6, median-PDOP 0.95, i genomsnitt 31.0 och minst 22 satelliter i sikte." width="100%">
</picture>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Solsystemet vid scenariots epok 2026-09-28T00:00:00, från en verklig körning av typen solar-system (solar-system-tour.toml): solen, 9 planeter och dvärgplaneten Pluto sedda ovanifrån ekliptikan, avstånd logaritmiskt komprimerade för visning, med varje himlakropps enkelriktade ljustid från jorden. Merkurius 0.47 au, 10.1 ljusminuter, VALIDATED; Venus 0.73 au, 3.0 ljusminuter, VALIDATED; Mars 1.55 au, 14.0 ljusminuter, VALIDATED; Jupiter 5.30 au, 49.5 ljusminuter, VALIDATED; Saturnus 9.44 au, 70.2 ljusminuter, VALIDATED; Uranus 19.44 au, 157.4 ljusminuter, MODELLED; Neptunus 29.88 au, 240.2 ljusminuter, MODELLED; Pluto 35.61 au, 292.2 ljusminuter, MODELLED. Länkar: Mars till Jupiter enkelriktat 2193.5 s; Saturnus till jorden enkelriktat 4212.2 s; Europa till Jupiter enkelriktat 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="En passage i låg omloppsbana (LEO) från en verklig körning av typen leo-pass (leo-pass-iridium.toml, motorn körd av denna generator): Iridium-pass på 781 km, STL-bandet på 1621 MHz, sett av en luftburen användare på 50° N 30° W. Över masken på 5° i 750 s, maximal elevation 65.0° vid 444 s. Bärvåg-till-brustätheten når som mest 80.5 dB-Hz (median 71.3), 34.3 dB över GNSS-medianen på 46.2 dB-Hz från 8 GPS-satelliter i sikte (38.2 till 51.1 dB-Hz); dopplerförskjutningen når 35.4 kHz." width="100%">
</picture>

Kör vilken som helst av dem med `kshana example <scenario> > s.toml && kshana s.toml`: scenarierna
är `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
och `leo-pass-iridium`.

</details>

<details>
<summary>De maritima förmågorna och störningsförmågorna, ritade utifrån incheckade syntetiska indata: en förtroendepoäng, en störningskarta med ruttexponering, en utbildningsström och ett bevispaket</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Förtroendepoäng över en syntetisk överfart, från en verklig körning av motorn v0.40.0 på examples/maritime-trust (en påhittad NMEA-logg från en färja på en rutt Tallinn till Helsingfors, 3001 epoker vid 1 Hz). Tre banor delar en tidsaxel. Överst: avståndet mellan den position mottagaren rapporterar och fartygets verkliga position, som håller sig inom några meter fram till omkring 1576 s, då loggens skriptade positionsavdrift drar bort den, medan mottagaren fortsätter att rapportera en giltig positionsbestämning. I mitten: förtroendepoängen från 0 till 100, inte beräknad under de första 300 s av kalibrering, i det nominella bandet (minst 90) fram till avdriften, därefter fallande genom det försämrade bandet (minst 55) in i det otillförlitliga bandet. Nederst: varje epoks band som ett färgat band med sitt namn. Poängen är rådgivande. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC 61108, IEC 61162): operatören är fortsatt ansvarig för fartygets navigering. Loggen är påhittad för att visa formatet och övervakarna; den är inte en mätning och säger ingenting om hur någon mottagare skulle prestera." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Två syntetiska dygn på störningskartan ritade utifrån de incheckade exemplen i examples/interference-map/output, var och en med sin egen syntetiska rutt och de andelar av ruttexponering som motorn rapporterar. Till vänster ett ADS-B-dygn: 1 försämrad cell, 6 inte försämrade, 4 obedömda (skrafferade) och celler utan post, ritade tomma, som inte observerades. Rutten är 525 km: 11.5% av dess längd i försämrade celler, 38.3% inte försämrade, 9.1% obedömda och 41.1% inte observerade. Till höger ett AIS-dygn: celler flaggade av cirkel- och landdetektorerna, icke-avvikande celler och tomma celler; rutten är 454 km med 10.5% i avvikande celler, 21.2% inte avvikande, 0.0% obedömda och 68.3% inte observerade. ADS-B och AIS är separata lager och kombineras aldrig. En flaggad cell är inte ett konstaterande av störning, och en cell utan färg observerades inte, vilket inte är detsamma som fri. Alla data är påhittade, i öppna mellersta Atlanten, och inte en mätning.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Utbildningsström från scenariot coastal-drag-off (motorn v0.40.0, frö 22, 25 minuter med en positionsbestämning per 10 s i instruktörsloggen). En karta visar fartygets sanna spår och det spår mottagaren rapporterar: de stämmer överens tills en skriptad positionsavdrift börjar vid 421 s, det rapporterade spåret vandrar sedan bort från det sanna medan mottagaren behåller en giltig positionsbestämning, och det hoppar tillbaka när händelsen slutar vid 1140 s. Bredvid, avståndet mellan de två spåren över tid, och den genomsnittliga bärvåg-till-brustäthet som mottagaren rapporterar, som stiger till en förhöjd nivå medan händelsen pågår. Syntetiska utbildningsdata genererade av Kshana. Endast för utbildning och test: mata aldrig denna ström till ett fartygs levande navigationssystem. Rådgivande, inte typgodkänd navigationsutrustning. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC 61108, IEC 61162): operatören är fortsatt ansvarig för fartygets navigering. Positioner, datum och spår är påhittade." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Strukturen hos ett bevispaket. En mottagarlogg (NMEA, u-blox UBX, RINEX 3 eller en Android-logg) och ett tidsfönster går in i kshana receiver-trust evidence, som skriver sju filer: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig och en valfri timestamp.tsr. Manifestet registrerar SHA-256 för hela loggen och för varje fil samt en hashkedja över filerna; signaturen täcker manifestet. kshana evidence verify kontrollerar signaturen, varje fils hash, kedjan och att ingen olistad fil finns, och avslutas med 0 när allt är verifierat, 1 när något fallerade och 3 när signeraren inte var fastlåst. Ett paket är en teknisk registrering, inte ett juridiskt utlåtande." width="100%">
</picture>

Alla fyra är påhittade data och rådgivande: de visar formatet och programvarans beteende, inte hur någon mottagare eller något system presterar mot störning. Kör den första med `kshana receiver-trust examples/maritime-trust/session.toml`, den andra med `kshana route-exposure` på exemplen i `examples/interference-map/`, den tredje med `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (endast för utbildning: mata den aldrig till levande navigationsutrustning), och den fjärde som i [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Hela förmågetabellen, område för område</summary>

Hela detaljen område för område följer; för ett mognadsregister per förmåga, se
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) och [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Område | Förmåga |
|--------|------------|
| **Bana och geometri** | SGP4/SDP4-propagering (validerad till 4.12 mm mot alla 666 vektorer i AIAA 2006-6753); verkliga tvåradselement (en incheckad, datumstämplad Celestrak-ögonblicksbild `gps-ops`) eller syntetiska Walker-delta-konstellationer vars medelelement realiserar formeln `i:T/P/F` till under 1 km över en propagering på 24 h; synlighet för flera konstellationer, **precisionsutspädning — geometrisk, position, horisontell, vertikal och tid (GDOP/PDOP/HDOP/VDOP/TDOP), validerad till 1e-6 mot gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), och GNSS-tillgänglighet; en gradientfri optimerare för konstellationsdesign, dimensionering av minsta antal satelliter med streets-of-coverage, ett verktyg för att jämföra flera konstellationer, och ett Walker-**designsvep** som tabellerar täckning / PDOP / återbesökstid över ett rutnät plan × satelliter och rapporterar de Pareto-optimala designerna. |
| **Numerisk propagator** | En numerisk **Cowell**-propagator (`src/propagator.rs`) som kompletterar den analytiska SGP4/SDP4-vägen, med en hierarkisk kraftmodell med **sju störningar** (`src/forces.rs`): tvåkropp + hela det **zonala J2–J6**-fältet (jordens zonala harmoniska koefficienter för avplattning J2 till J6; den exakta analytiska gradienten av dess störande potential), en valfri **tesseral sfäriskt harmonisk geopotential EGM2008 till grad/ordning 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; verkliga koefficienter från NGA — US (United States) National Geospatial-Intelligence Agency —, Holmes–Featherstones normaliserade Legendre-rekursion, korskontrollerad mot Legendre-funktionerna i sluten form och den analytiska ∇V-identiteten), **epokdriven tredjekroppsgravitation från solen och månen** (en inbyggd efemerid med låg precision, ingen DE/SPK-kärna — Development Ephemeris / SPICE Spacecraft and Planet Kernel), **strålningstryck från solen** (kanonkulemodell med en konisk skugga av umbra+penumbra), **atmosfäriskt motstånd** (Vallados styckvis exponentiella densitet, medroterande atmosfär), den **post-newtonska relativistiska Schwarzschild-korrektionen** och termen för **Lense–Thirring-ramdragning** (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, linjär i jordens rörelsemängdsmoment, ~1–2 storleksordningar under Schwarzschild) — driven av ett val mellan två adaptiva integratorer (RK4 — fjärde ordningens Runge–Kutta — med stegfördubbling eller det inbäddade paret **Dormand–Prince RK5(4)**). **Validerad mot Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 epoker över LEO (låg omloppsbana) + GTO (geostationär överföringsbana), där nivåerna med konservativa krafter stämmer till ett sämsta fall på **\|Δr\| 0.08 m över 24 h** (`tests/numerical_cowell_propagator_reference.rs`); nivån med atmosfäriskt motstånd karakteriseras separat (≈ 333 m / 24 h) och de absoluta indata för sol-/månefemerid och densitet förblir ärligt **Modelled**. Ytterligare intern evidens (inte extern validering): den ostörda banan kontrolleras mot den exakta Kepler-lösningen med universell variabel till **under en meter över 24 h**, energi/rörelsemängdsmoment bevaras till ~1e-9, och varje störning stämmer med en handhärledd signatur i sluten form. |
| **Manövrar och bandesign** | Impulsiva ΔV-noder med propagering av 6×6-kovarians (exekveringsfelsramar ECI — jordcentrerad inertial — / LVLH — lokal vertikal, lokal horisontell —), integration av ändlig brinntid kontrollerad mot **Tsiolkovskijs** raketekvation i sluten form till < 0.01 %, en **Lambert**-lösare för ett varv enligt **Izzo-2015**, en exakt **Kepler**-propagator med universell variabel, och ett **porkchop**-svep (uppskjutning × ankomst) av C3 (uppskjutningsenergi) / ankomst-V∞ som skrivs ut som ett JSON-konturnät — prestandasimuleringslagret ovanför GMAT/Orekit, där varje Lambert-utdata rundtursprovas mot tvåkroppssanning och porkchop-minimumet kontrolleras mot det analytiska Hohmann-golvet. |
| **Tidssystem och referenssystem** | IERS-skalor med skottsekunder **UTC / TAI / TT / UT1** (Coordinated Universal Time, International Atomic Time, Terrestrial Time och jordrotationstiden Universal Time 1), ett API (programmeringsgränssnitt) för juliansk dag, IAU-2000:s (International Astronomical Union) **jordrotationsvinkel** (ERA), GMST-baserad (Greenwich Mean Sidereal Time) **TEME ↔ ECEF** (sann ekvator, medeldagjämning ↔ jordcentrerad, jordfixerad) med geodetiska system enligt WGS-84 (World Geodetic System 1984), IAU 2006-precession (Fukushima–Williams), full **IAU 2000A/2000B-nutation**, IERS **polrörelse** och den dagjämningsfria **CIO-baserade IAU 2006/2000A GCRS↔ITRS**-reduktionen (CIO = Celestial Intermediate Origin) — allt validerat **bit för bit** mot SOFA/ERFA-vektorerna och **oberoende korskontrollerat mot ANISE** (den rena Rust-omimplementationen av NAIF/SPICE; NAIF = Navigation and Ancillary Information Facility vid NASA, USA:s National Aeronautics and Space Administration): kshanas GCRS→ITRS mot ANISE:s ITRF93 (International Terrestrial Reference Frame 1993) från JPL:s `earth_latest_high_prec.bpc`, med samma IERS-parametrar för jordorientering till båda, stämmer till **≤ 0.86 m på marken / ≤ 3.6 m i GNSS-bana** (max 0.028″) över åtta epoker 2020–2023. |
| **Tröghet** | Treaxlig strapdown-INS — kvaternionattityd, WGS-84 NED-mekanisering (nord-öst-ned), kompensation för coning/sculling och en deterministisk IMU-felmodell (skalfaktor, felinriktning, g-känslighet, kvantisering, drift); en **accelerometer med kallatomsinterferometer utifrån grundprinciper** (Mach–Zehnder-fas, kvantprojektionsbrus, kontrastavtagande, vibrationskoppling) som *härleder* koefficienten för hastighetsslumpvandring; och ett **partikelfilter** med sekventiell viktad omsampling för kartstödd (terräng-/gravitationsrefererad) navigering utan GPS. |
| **Alt-PNT (utan GPS)** | En **mätmodell för kallatomsgravimeter** vars golv för vitt brus (`σ = ASD/√τ`, ASD = amplitudspektraltäthet) härleds ur CAI-accelerometerns fysik; ett fullt normaliserat **sfäriskt harmoniskt fält för gravitationsanomali** av låg grad (kontrollerat mot Legendre-funktionerna i sluten form och en handhärledd anomali med en term) plus syntetiska masskoncentrationer; **syntesekärnan för gravitationsfunktionaler** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — den "kartläsare" som en gravitationsstödd navigator matchar mot — är validerad mot **standarden för normaltyngd GRS80** (Geodetic Reference System 1980), reproducerar Somiglianas normaltyngd i sluten form och de publicerade γ_e / γ_p till **3.5e-12** och producerar en fysikaliskt begränsad störningskarta från det verkliga **EGM2008**-fältet från ICGEM (International Centre for Global Earth Models) (RMS — kvadratiskt medelvärde — ≈ 26 mGal, max ≈ 89 mGal vid g/o 70; `tests/icgem_gravity_reference.rs`); och ett **partikelfilter för matchning mot gravitationskarta** som återvinner ett spår utan GPS ur den anomalisekvens det flyger igenom. Det utvidgas till **terrängrefererad navigering** (TERCOM/SITAN — terrain contour matching / Sandia Inertial Terrain-Aided Navigation — mot en DEM (digital höjdmodell) `.hgt` från SRTM (Shuttle Radar Topography Mission), `src/altpnt/terrain.rs`), ett **geomagnetiskt huvudfält IGRF-14** (14:e generationens International Geomagnetic Reference Field) till grad/ordning 13 (`src/igrf.rs`, kontrollerat mot den lutande dipolens slutna form och ändliga differenser av ∇V), och en **kombinerad gravitations- + magnet- + terrängnavigator** som fusionerar alla tre skalära kanaler genom ett partikelfilter (information är additiv — ingen kanal gör positionsbestämningen sämre). En **60-minuters benchmark utan GPS** (ett avbrott på ~700 km / en timme där tröghetslösningen driver till ~70 km) återvinns till **~145 m (< 500 m)** av en hierarkisk matchare från grovt till fint — målet för ESA NAVISP (Navigation Innovation and Support Programme) *Quantum Wayfarer*. |
| **Fusion** | Löst kopplat 15-tillstånds-EKF (utökat Kalmanfilter) med feltillstånd för GNSS/INS med återkoppling i sluten slinga (paketet `gnss-ins`); en **tätt kopplad** pseudoavståndsuppdatering som fortsätter att korrigera med färre än fyra satelliter; ett kopplat filter för **klocka + position**; en allmän **unscented (sigmapunkts-) Kalman**-skattare för starkt olinjära mätningar; en tätt kopplad GNSS/INS-**UKF-navigator** (pseudoavstånd + doppler) vars banglidning med kraftmodell är självkonsistenskontrollerad till **0.77 m RMS** över en 30 minuter lång krökt LEO-passage som innehåller ett GNSS-avbrott på 120 sekunder (en siffra för filterkonsistens, inte en validering mot extern referens — denna navigator förblir MODELLED); och en full **tätt kopplad GNSS/INS-UKF med 17 tillstånd** (position, hastighet, attitydfel, accelerometer- och gyrobias, klockbias och drift) vars **dödräkning med kvant-CAI** glider genom ett avbrott på 120 sekunder på kallatomsaccelerometerns härledda hastighetsslumpvandring. |
| **Banbestämning** | Återvinning av ett banläge `[r, v]` från avståndsspårning från markstationer, där tvåkropps- + J2-kraftmodellen och RK4-integratorn kombineras med en **Gauss–Newton-batch**-korrektor (`determine_orbit_batch`, under en meter / mm·s⁻¹ från brusfria avstånd, ~2 m vid ett brusgolv på 5 m) och en **sekventiell** variant med unscented-filter (`determine_orbit_sequential`). |
| **Observerbarhet och skattningsteori** | Ett allmänt, återanvändbart lager för **Fisher-information / Cramér–Rao** (`src/fim.rs`): informationsmatrisen M = HᵀWH, **Cramér–Rao-gränsen**, observerbarhetens **rang och nollrum för datumdefekt** (Moore–Penrose-pseudoinvers) och skalärer för försöksdesign enligt **D/A/E/T-optimalitet** från en symmetrisk Jacobi-egenlösare. **Validerad** — egenvärden mot `numpy.linalg.eigh`, CRLB-kovariansen mot σ²(XᵀX)⁻¹ via `numpy.linalg.inv`, och GNSS-DOP från informationsmatrisen, alla överensstämmande till **1e-9** (`tests/fim_observability_reference.rs`), och dessutom korskontrollerade mot **Kays (1993)** gränser i sluten form med Monte Carlo-uppnående av CRLB. Den ligger till grund för DOP-motorn, CRLB för passiv geolokalisering och månens **observerbarhetssats** för absoluta stationer (nedan). |
| **Månen och cislunärt** | En propagator för det **cirkulära begränsade trekroppsproblemet (CR3BP)** jorden–månen i det roterande systemet — bevarad Jacobi-konstant och alla fem Lagrangepunkter (`src/cr3bp.rs`) — nu med en **6×6 tillståndsövergångsmatris (STM) och en differentialkorrektor med enkelskjutning** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`) som ger verkligt periodiska **halo- / NRHO**-banor (nästan rätlinjig halobana): STM:en är validerad mot ändliga differenser, korrigerade banor sluter sig till maskinprecision, och att utgå från det publicerade apolunläget reproducerar den **södra 9:2-NRHO kring L2** (L2 = den andra Lagrangepunkten jorden–månen; Gateway-banan) med period ≈ 6.57 d / perilun ≈ 3,250 km, konsistent med publicerade ≈ 6.56 d / ≈ 3,370 km (en CR3BP-lösning — cirkulär, utan solen —, **inte** validerad mot en verklig efemerid för LANS (Lunar Augmented Navigation Service)/Gateway; den selenocentriska MCI/MCMF-transformen (månecentrerad inertial / månecentrerad, månfixerad) av den korrigerade banan är ett uppföljningsarbete); plus cislunär PNT-geometri enligt **LunaNet / LNIS** (LunaNet Interoperability Specification) (MCI↔MCMF-reduktion, selenografiska koordinater) med en **ARAIM-passage vid månens sydpol** som ärligt visar integritetsgapet: ett σ_URE (användarens avståndsfel) på ~30 m driver skyddsnivån långt över en larmgräns på 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); och en **DOP-förstärkning med ytfyrar** (`src/lunar_beacon.rs`) som visar hur några inmätta avståndsfyrar på ytan tillför de siktlinjerader med låg elevation och bred azimut som en uppsättning med enbart banor rakt ovanför saknar — vilket får den illa konditionerade GDOP:en vid sydpolen att kollapsa och, via en felbudget med kvadratsumma, den realiserade positionsnoggrannheten i meter (med återanvändning av den gnss_lib_py-validerade DOP-kärnan och synlighetens slutna form för en horisont utan atmosfär; analysen av precisionsutspädning är beskriven i [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **PNT-svit för månen** | En navigeringssvit för månen/cislunärt i lager ovanpå CR3BP-kärnan, var och en en körbar `kind`: **Lunar Coordinate Time** (`lunar-time-offset`, `src/lunar_time.rs` — den sekulära hastigheten LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL = dess franska form, Temps-Coordonnée Lunaire) från skillnaden i egenpotential + kinetisk term, rapporterad med det publicerade bandet 56–59 µs/dygn); en geodetisk fördröjningsobservabel för **VLBI på månen** (interferometri med mycket lång baslinje) (`lunar-vlbi`, `src/lunar_vlbi.rs` — en fördröjning + hastighet i närfältet med två avståndsdifferenser och jordbaslinje, korskontrollerad mot planvågs-Δ-DOR (delta differential one-way ranging) i samma kodbas i fjärrfältsgränsen, partialderivator verifierade med ändliga differenser); en **gemensam multiteknisk batchskattare för OD + klocka** (`lunar-joint-od-clock`, `src/lunar_combination.rs` — en Gauss–Newton-anpassning som fusionerar VLBI + lokala avstånd på månen + avstånd mellan satelliter) som bär ett resultat om **observerbarhet via Fisher-information**: intern avståndsmätning ensam lämnar en **datumdefekt** för stel kropp med sex frihetsgrader, så att en ytstations *absoluta* position är oobserverbar tills en anslutning till jordsystemet läggs till — en **VLBI**-fördröjning med jordbaslinje *återställer* observerbarheten för en gles konstellation och *skärper* Cramér–Rao-gränsen för en rik, där det absoluta datumet sluts vid **tre** icke-kollineära jordstationer (observerbarhetsresultatet beskrivet i [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **realisering av referenssystem** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — en Helmert-datumanpassning med 7 parametrar + orienteringsanslutning enligt IAU 2015 WGCCRE — WGCCRE = IAU Working Group on Cartographic Coordinates and Rotational Elements); en analys av **servicevolym av Moonlight/LCNS-klass** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / täckning / tillgänglighet + en generaliserad ARAIM-envelopp för HPL/VPL (horisontell/vertikal skyddsnivå) på månen, med återanvändning av den gnss_lib_py-validerade DOP-kärnan och LunaNet-maskineriet med σ_URE≈30 m); **differentiell PNT på månen** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — en motsvarighet till differentiell GNSS / satellitbaserat förstärkningssystem (SBAS) på månen: exakt utsläckning av gemensamt klockfel + spatial dekorrelation av första ordningen mot baslinje, med återanvändning av skyddsnivån för SBAS enligt DO-229E — där DO-229E är RTCA:s (tidigare Radio Technical Commission for Aeronautics) minimistandard för operativ prestanda för SBAS-mottagare); och en **interoperabilitetsexport i linje med LunaNet/IOAG** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + rundtur för månens tidsskala i månens kroppssystem enligt IAU 2015, inslagen i KIF-kuvertet). Evidensnivåer per del finns i [verifieringsmatrisen](docs/VERIFICATION-MATRIX.md): Lunar Coordinate Time, den gemensamma skattaren för OD + klocka, realiseringen av referenssystem och servicevolymens geometri är **VALIDATED** (var och en mot den oberoende referens som dess rad namnger, liksom kärnvägen för VLBI-fördröjningen); VLBI-observabeln, observerbarhetsresultatet för datumdefekten, differentiell PNT och interoperabilitetsexporten är **MODELLED**. Parametrarna är **illustrativa värden från offentliga källor** — **inte** validerade mot verklig VLBI-/Gateway-spårning, **inte** knutna till eller godkända av någon myndighet, inget påstående om TRL (teknisk mognadsnivå) / flygerfarenhet. |
| **PNT i djuprymden och på Mars** | En öppen **radiometrisk navigeringsmotor**: iterativ ljustid + relativistisk **Shapiro**-fördröjning, **doppler och avstånd** i två/en/tre riktningar (Moyers tvåbensformulering), koherenta omvändningsförhållanden för transpondrar, regenerativ/PN-avståndsmätning (pseudobrus) (CCSDS 414, standarden för pseudobrusavståndsmätning) och **Δ-DOR** i himmelsplanet (CCSDS 506, Delta-DOR-standarden), med medier för solplasma/tropo/jono; tolkning + utskrift av spårningsdatameddelanden enligt **CCSDS-TDM (503)**; ett **Square-Root Information Filter med reducerad dynamik** (RTN — radiell, transversell, normal — empiriska accelerationer + en klocka ombord med 3 tillstånd + atmosfäriskt motstånd på Mars) som gör **banbestämning i låg Marsbana (LMO) till ≈ 0.2 m** i en syntetisk sluten slinga; en gemensam skattare för **fusion av enkel- + dubbelriktat**; en dynamikkärna för flera kroppar (`Body{μ, re, zonals, gravity, IAU-pole}`, Mars-gravitation GMM-3 (Goddard Mars Model 3), ett kroppsfixerat Mars-system enligt IAU, ett utbytbart `EphemerisProvider`-gränssnitt, tvådelade julianska datum + TT↔TDB (Barycentric Dynamical Time)); och relä-PNT-scenariot **`mars-pnt`** (en areostationär MARCONI-reläkonstellation) med en **prestandasimulator för GSE** från början till slut (GSE = markstödsutrustning) (geometri → länkbudget → observabler → SRIF → kovarians). **Simuleringsvaliderat** (kvalitetsmått för kovarians / sluten slinga); den solcentrerade Mars-dynamiken korskontrolleras mot JPL **DE440** (137 m @ båge på 1 dygn, `xval/anise-mars-od`). Validering med verkliga spårningsdata från DSN/ESTRACK finns på färdplanen. |
| **Solsystemet och PNT kring valfri himlakropp** | En kärnfri **efemerid för hela solsystemet** (`src/ephem.rs`, `src/ephem_provider.rs`): varje planet från JPL:s **keplerska Standish-element** (tabell 1, 1800–2050 e.Kr.; tabell 2a/2b, 3000 f.Kr.–3000 e.Kr.) med varje planets publicerade nominella fel, jorden och månen åtskilda med måneserien, samt Phobos, Deimos, Io, Europa, Ganymedes, Callisto och Titan från JPL:s medelelement och rotationsmodellen från IAU (International Astronomical Union); **valfri himlakropp relativt valfri annan** i ICRF (International Celestial Reference Frame). `Body` bär nu **GM (gravitationsparameter), radier, J2 (den andra zonala harmoniska) där den är publicerad samt IAU-polen och nollmeridianen för arton himlakroppar**. Typen **`solar-system`** rapporterar positioner, hastigheter, konstanter, **ljustid och enkel-/dubbelriktat avstånd** mellan två valfria himlakroppar (den befintliga radiometriska ljustidslösaren, med solens Shapiro-fördröjning) och ett banspår per himlakropp — tillräckligt för att rita ett interaktivt solsystem; typen **`body-pnt`** positionsbestämmer en orbiter eller en landare **kring valfri himlakropp** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) med en lokal Walker-konstellation, maskineriet för precisionsutspädning och Gauss–Newton, och ett djuprymdsavstånd från jorden. **Validerad** mot JPL Horizons (DE441, JPL Development Ephemeris 441): Merkurius–Saturnus och jorden från tabell 1 inom två gånger det nominella felet (sämst 1.87×), alla åtta planeter från tabell 2a/2b (sämst 1.71×) och ljustiden jorden–Mars/Jupiter. **Modelled**: Uranus och Neptunus från tabell 1 (2.0× och 5.2× det angivna felet mot DE441), Pluto, månarna och navigeringsresultaten från `body-pnt`. |
| **Fusionerad PNT från MEO + LEO** | `src/leo_fusion/`: systemoberoende positionering, navigering och tidssynkronisering i LEO över valfri konstellation (Walker-skal, elementuppsättningar, GNSS-förval) och valfri signal (bärvåg, chiphastighet, C/N0-envelopp, avståndsfel för signal i rymden), med valfria förval i en fil som bär sina källor (Xona Pulsar X1/X5, Iridium STL, Starlink-signaler som tillfällighetssignaler, CentiSpace, ett representativt C-bandssystem, ATOMIC-efemeridmodellen utan klocka). **`leo-pvt`**: batchvis **dopplerpositionering** från avståndshastighet (en och flera satelliter, tillstånd för klockdrift och hastighet, geometri längs/tvärs spåret för en passage och spegellösningen), **gemensamma viktade minsta kvadrater för GNSS + LEO** med bias mellan system per system och sigma per signal från anroparen, DOP mot antalet LEO-satelliter, täckning i **polar- och Arktisområden**, och **tidsöverföring till UTC via LEO** mot C/N0 och oscillatorn. **`leo-ppp`**: ett flytande PPP-EKF (precise point positioning; utökat Kalmanfilter) med enbart GNSS och med LEO, dess konvergenstid och ett konsistenstest med chi-två-NEES. **`ntn-positioning`**: positionering i icke-markbundna 5G-nät från Cramér-Rao-gränsen för bandbredden. **Validerad**: LEO-dopplerenveloppen mot de publicerade siffrorna för Iridium och Xona. **Modelled**: resten, där PPP-trenden jämförs mot Li et al. (2019) — se [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Integritet** | RAIM med ögonblicksbild och lösningsseparation (ARAIM-liknande) — mottagarens autonoma integritetsövervakning — med horisontella/vertikala skyddsnivåer (HPL/VPL), feldetektering och -uteslutning, och Stanford-integritetsdiagram; en skyddsnivå med explicit budget för integritetsrisk enligt **lösningsseparation med flera hypoteser (MHSS)**, inklusive **felläget för hela konstellationen med två/flera konstellationer** (EU (Europeiska unionen) ARAIM / DO-316, RTCA:s prestandastandard för luftburen GPS-utrustning med flygplansbaserad förstärkning), provad på en verklig ögonblicksbild från GPS + Galileo (`scenarios/araim-gps-galileo.toml`). Skyddsnivån tillämpar den ensidiga **nominella bias**-projektionen `b_k = Σ_i|s_i|·b_nom` per felläge och **integritets**-sigma σ_URA (användarens avståndsnoggrannhet; skild från noggrannhetens σ_URE, användarens avståndsfel) från Integrity Support Message — se [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Detekteringskärnan (trösklarna för χ²/icke-central χ²/normal och K-multiplikatorerna) är **externt validerad mot SciPy** över 171 fall (`tests/raim_reference.rs`); geometrin återanvänder den gnss_lib_py-validerade DOP-kärnan. Själva *budgetallokeringen* av integritetsrisk i ARAIM MHSS saknar publicerad numerisk referens och förblir ärligt Modelled. |
| **Förstärkning (SBAS)** | **Skyddsnivåer för SBAS / WAAS** (WAAS = Wide Area Augmentation System) i den viktade minsta-kvadratformen enligt DO-229E (K-faktorer för precisionsinflygning och en route) och den **jonosfärsfria kombinationen L1/L5 med två frekvenser** (L1 och L5 är två civila GPS-signalband; IS-GPS-705, GPS-gränssnittsspecifikationen för L5-signalen, γ₁₅ ≈ 1.793) som ligger till grund för DO-316 — `src/sbas.rs`. Algoritmen för skyddsnivå är **externt validerad mot RTKLIB-grenen SBAS-PL** (RTKLIB = det öppna biblioteket för realtidskinematisk positionering; PL = skyddsnivå) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — den föregående revisionen av DO-229 — App. J) körd på **verkliga EGNOS-data** (European Geostationary Navigation Overlay Service), och reproducerar dess HPL till < 2e-3 m (`tests/sbas_reference.rs`); gLAB (verktygssviten GNSS Laboratory) v6.0.0 bekräftade samma konvention. |
| **Klocka och tidssynkronisering** | Holdover med Kalman i två tillstånd (kovarians i Joseph-form, konsistenshälsa med NIS/NEES — normaliserad innovation i kvadrat / normaliserat skattningsfel i kvadrat); stabilitet i Allan-familjen (ADEV / MDEV / TDEV / HDEV / MTIE — Allan-, modifierad Allan-, tids- och Hadamard-avvikelse samt maximalt tidsintervallfel) med konfidensintervall specifika för brustyp och en full **potenslagsanpassning med fem koefficienter enligt IEEE-1139** (IEEE Std 1139, Institute of Electrical and Electronics Engineers definitioner inom frekvens- och tidsmetrologi) — skattarna är validerade på verklig hårdvara mot **Stable32**: en **verklig primär cesiumstandard 5071A mot en vätemaser** (556,990 fassampel, 16 medelvärdesbildningsfaktorer, OADEV/OHDEV — överlappande Allan-/Hadamard-avvikelse — till 1e-3; `tests/cs5071a_reference.rs`) och regressionsserien **kanoniska Stable32 PHASE.DAT** (139 medelvärdesbildningsfaktorer, OADEV/MDEV/TDEV till 1e-3; `tests/phasedat_reference.rs`); skattarna ADEV/MDEV/TDEV och telekommåttet för vandring **MTIE** är dessutom korskontrollerade mot det **oberoende biblioteket allantools 2024.06** till **< 1e-9** på serien NIST SP 1065 (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); geometriska korrektioner (Sagnac, GNSS common-view); och de operativa överföringsmetoderna — **TWSTFT** (tvåvägs tids- och frekvensöverföring via satellit) med BIPM:s (International Bureau of Weights and Measures) Sagnac-form i sluten form, **GNSS common-view**, jonosfärsfri tidsöverföring med **PPP** (precise point positioning), en **optisk** länk i fritt rum med turbulensscintillation, och en **tidsskala för klockensemble (pappersklocka)** med invers varians under den bästa bidragande klockan. En **kalkylator för klock-holdover utan GNSS** (`src/holdover.rs`) exponerar van Loans tillväxt av glidfel i sluten form som en inversion *holdover-till-tröskel* — hur länge en klocka går fritt innan dess tidsfel överskrider budgeten — över representativa klassiska och kvantklockklasser; **modelled** (korskontrollerad mot flerstegsrekursionen för `clock_state`-kovarians), och ärlig med att för en mycket stabil klocka bestäms holdover till en snäv tröskel av det *antagna* brusgolvet vid lång tau, inte av den citerade ADEV. En **villkorlig skyddsnivå för tidssynkronisering** (Timing Protection Level, `src/tpl.rs`) utvidgar holdover till spoofing: en gräns för det *odetekterade* tidsfelet, givet en oberoende korskontroll, som sätter samman ett övervakargolv på k sigma, van Loans glidvarians över detekteringslatensen och en tid till larm för CUSUM (kumulativ summa). Kalibrerad på en verklig inspelad spoofing (JammerTest 2024) och reproducerbar via `cargo run --example tpl_jammertest`; **MODELLED** sammansättning (ingen budget för integritetsrisk per timme), villkorad av detektering — det finns ingen ändlig *ovillkorlig* gräns. |
| **GNSS-mätdomänen** | Framåtsyntes av pseudoavstånd / doppler med jonosfär enligt **Klobuchar** (sänd) och **IONEX / TEC-rutnät** (IONosphere map EXchange format / totalt elektroninnehåll; uppmätt) — inklusive en tolk för IONEX-filer, tidsinterpolation mellan kartor och snedhetsmappning med tunt skal — troposfär enligt **Saastamoinen + Niell**, och RAIM med ögonblicksbild (HPL/VPL). |
| **Resiliens** | **Jamming** via länkbudget (J/S → effektiv C/N₀ → låsförlust — förhållande störsändare till signal, förhållande bärvåg till brustäthet — där antistörningsfaktorn för spektral separation `Q` nu **härleds ur de faktiska effektspektra för signalen och störsändaren** via `src/navsignal.rs` — `Q = 1/(R_c·κ)`, korskontrollerad i CI mot den tidigare representativa konstanten); en stokastisk **detektor för tidsspoofing** (Neyman–Pearson / χ²₁-energitest med P_fa/P_md i sluten form och med Monte Carlo och ett säkerhetskvalitetsmått (FoM) på 1 − P_md); och en **spoofingdetektor i flera lager** som fusionerar ett paritetstest för RAIM-konsistens (med den gemensamma blinda fläcken ärligt modellerad), en övervakare av RF AGC-effekt (automatisk förstärkningsreglering) och en övervakare av signalkvalitet (SQM — signalkvalitetsövervakning, tidig minus sen); och en **felbudget för kvanttröghetens dödräkning** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`) som sätter samman kallatomsinterferometerns hastighetsslumpvandring från vitt brus med kvarvarande bias (korskontrollerad mot den oberoende `AccelModel`-integratorn) och skalfaktorfel till en siffra för positionsdrift över holdover — tröghetstvillingen till klock-holdover. En **resiliensbedömningsmotor i linje med ramverk** (`src/resilience/`) mappar en arkitekturs simulerade beteende till delpoäng per dimension över Kshanas egna sju resilienskategorier (inte DHS-termer), i linje med US Department of Homeland Securitys Resilient PNT Conformance Framework, och studerar sedan **beslutsstabiliteten** hos varje enskild sammansatt poäng eller mognadsnivå under en Dirichlet-viktsimplex och en ensemble med fem hot — Kendall-τ-instabilitet i rangordning, frekvens av byte av förstaplats, och **kollaps av diversitet** av gemensam typ (Hill-N2), med en integritetshashad försäkringsrapport (35 handhärledda referenstester). Reproducerbar via `cargo run --example resilience_report`; **MODELLED** syntetiska arkitekturer, en självbedömning i linje med RPCF v2.0, **inte** en certifiering. Se [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Passiv RF-geolokalisering** | **TDOA/FDOA-geolokalisering av sändare** (skillnad i ankomsttid/-frekvens; `src/geolocation.rs`) — lokalisera en störsändare eller spoofer (eller en tillfällig källa för omvänd PNT) från hyperboloider för **skillnad i ankomsttid** över ett mottagarnätverk, löst med Gauss–Newton minsta kvadrater; att lägga till **skillnad i ankomstfrekvens** med rörliga mottagare återvinner gemensamt sändarens position *och* hastighet, med **Cramér–Rao**-gränsen för positionskovariansen härledd ur nätverksgeometrin. **MODELLED** (referenser för intern konsistens: rundturer framåt→invers, identiteten J·CRLB = I, GDOP-monotonicitet och att skattaren når sin egen CRLB under Monte Carlo) — en punktkällemodell med fri sikt, inga termer för flervägsutbredning / NLOS (skymd sikt), mottagarens klockbias eller refraktion. |
| **Navigeringssignal och kodspårning** | **Signalnivån** mellan länkbudgeten och mätdomänen (`src/navsignal.rs`): **spektrala effekttätheter** (PSD) med enhetsarea för **BPSK-R(n)** (binär fasskiftsmodulering med rektangulära chips) och **sine-BOC(m,n)** (binary offset carrier); **koefficienten för spektral separation** (SSC) κ = ∫ G_s·G_i df, som **härleder den antistörnings-`Q`** som jammingmodellen använder (`Q = 1/(R_c·κ)`) ur de faktiska spektra för signal/störsändare i stället för en representativ konstant; **RMS-bandbredden (Gabor)** (BOC > BPSK — måttet på avståndsinformation / Cramér–Rao); **jittret från termiskt brus i koherent early–late DLL-kodspårning** (DLL = fördröjningslåst slinga; Kaplan & Hegarty; ~under en meter för C/A — GPS grov-/infångningskod — vid 45 dB-Hz); och **felenveloppen för flervägsutbredning** (koherent EML, tidig minus sen — undertryckning med smal korrelator). Validerat mot ankare i sluten form (BPSK själv-SSC = 2/(3·R_c), PSD med enhetsarea, C/A-jitter under en meter). Detta är analys av signal**prestanda**, **inte** design av antenn- / RF-nyttolasthårdvara (en nyttolastpartners roll). |
| **Interoperabilitet** | Inläsning av sända efemerider för flera GNSS enligt **RINEX-3** (GPS, Galileo, QZSS — Japans Quasi-Zenith Satellite System —, BeiDou MEO/IGSO — medelhög jordbana / lutande geosynkron bana — via IS-GPS-200, GPS-gränssnittsspecifikationen; GLONASS, Rysslands Global Navigation Satellite System, via PZ-90 — det ryska datumet Parametry Zemli 1990 — tillståndsvektor-RK4) användbar som konstellationskälla (RINEX in, PNT-geometri ut); en tolk för observationer enligt **RINEX-3** (pseudoavstånd, bärvågsfas, doppler, signalstyrka; observationslayouten 4.00 förväntas kunna tolkas men är otestad, och navigeringsfiler i RINEX 4 vägras med namn i stället för att avkodas fel) som nu **matar en lösare för enpunktspositionering (SPP)** (`pvt`) — verkliga kodobservationer in, en verklig **mottagarposition** ut, validerad på IGS-data; en läsare/skrivare för precisa efemerider i **SP3-c/d** med Lagrange-interpolation av 9:e ordningen; och export av **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) för flygdynamikverktyg (GMAT, Orekit, STK — Systems Tool Kit); och tolkning + utskrift av spårningsdatameddelanden enligt **CCSDS-TDM (503)** för radiometrisk spårning i djuprymden. |
| **Uppdragsanalys (systemteknik)** | Uppdragsbudgetar av första ordningen, var och en en körbar typ: tvåkroppsgeometri för **uppskjutning och uppstigning** (`launch-window` — uppskjutningsazimut `sin Az = cos i/cos lat`, minsta inklination, bonus från jordrotation, Δv för planändring med dogleg, dagliga tillfällen; `src/launch.rs`); en **ballistisk återinträdeskorridor enligt Allen–Eggers** (`reentry` — maximal retardation, hastighet/höjd vid maximal g, hastighet vid maximal uppvärmning; `src/reentry.rs`); **täckningsgeometri för jordobservation** (`eo-coverage` — svepbredd / GSD i nadir (markupplösning) / åtkomst utanför nadir / återbesök via rymdtriangeln i SMAD (*Space Mission Analysis and Design*); `src/eo_payload.rs`); en **felbudget för attityd och pekning med 3-DOF** (tre frihetsgrader; `attitude-budget` — moment från gravitationsgradient i sämsta fall + pekningsbudget med RSS (kvadratsumma); `src/attitude_budget.rs`); **passageprediktion för markstationer** (`passes` — AOS/TCA/LOS, signalinfångning / tidpunkt för närmaste passage / signalförlust, maximal elevation, åtkomsttid; `src/passes.rs`); och en **enkelriktad länkbudget** över länkekvationen i CCSDS 401 / DSN 810-005 (CCSDS-standarden för radiofrekvens och modulering / handboken för länkdesign i Deep Space Network; `link-budget` — FSPL (utbredningsförlust i fritt rum), C/N₀, Eb/N₀ (förhållande energi per bit till brustäthet), marginal, slutning; `src/linkbudget.rs`). **MODELLED** analytiska budgetar av första ordningen — lagret före hårdvara under STK/GMAT/Basilisk, inte en ersättning för 6-DoF eller radiometri. |
| **Beslutsanalys och avvägning (MCDA)** | En fullständig svit för **flerkriteriebeslutsanalys** (MCDA) (`src/mcda/`) som spänner över alla fyra metodfamiljer — värdeaggregering (**WSM**, **WPM**, **WASPAS** — viktad summamodell, viktad produktmodell, viktad aggregerad summa-produkt-bedömning), avstånd till ideal (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), kompromissprogrammering (**VIKOR**, från serbiskans flerkriterieoptimering och kompromisslösning) och outranking (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, från franskans eliminering och val som uttrycker verkligheten), plus kvotsystemet **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) och proportionella **COPRAS** (Complex Proportional Assessment) — med prioritetsviktning genom parvisa jämförelser enligt **AHP** (Analytic Hierarchy Process) (konsistenskvot), en **Pareto**-front av icke-dominerade, **känslighets**analys för vikter och **nytto**-poängsättning med flera attribut. De nio aggregatorerna reproducerar de oberoende tredjepartsbiblioteken **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) och **pyDecision** (ELECTRE I, COPRAS) till **< 1e-9**, och AHP:s prioritetsvektor + konsistenskvot stämmer med Saatys tabell över slumpindex och SciPy/LAPACK:s huvudegenlösare till < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — beslutslagret under motorn för avvägningsstudier. |
| **Rymdmiljö** | En **modell för rymdvädermiljön** (`space-weather`, `src/space_weather.rs`): aktivitetsindex för solen (F10.7 / centrerat 81-dygns F10.7a — solens radioflöde vid 10.7 cm) och geomagnetism (Kp, det planetära K-indexet, med den definitionsmässiga tabellen Kp↔ap — där ap är dess linjära planetära amplitud), den exosfäriska temperatur enligt **Jacchia-1971** som de driver (validerad mot publicerat solminimum/-medel/-maximum), och den aktivitetskorrigerade mot statiska neutrala densiteten i termosfären på höjd — solcykelns densitetsberoende som den statiska atmosfären USSA76 (US Standard Atmosphere 1976) utelämnar. **MODELLED**: en kalibrerad koppling av skalhöjd av första ordningen, **inte** en datavaliderad atmosfär (NRLMSISE — US Naval Research Laboratorys modell Mass Spectrometer and Incoherent Scatter Radar Exosphere). |
| **AI/ML-utvärdering och avvägning** | En **testbädd för utvärdering av detektering av RF-försämring** (`impairment-eval`, `src/impairment_eval.rs`): en märkt, parameterförankrad **syntetisk** korpus (nominell / jamming / tidsspoofing / positionsspoofing / flervägsutbredning), en detektoroberoende **ROC/AUC**-rigg (mottagarens operativa karakteristik / arean under kurvan) som poängsätter valfri detektor (energy \| agc \| sqm \| parity \| fused) med Pd (detektionssannolikhet) per klass vid ett mål-Pfa (falsklarmssannolikhet), och **optimismgapet** inom kontra utanför fördelningen (läget för fördelningsskifte). Plus en **avvägning kvant mot klassisk PNT** (`quantum-trade`, `src/quantum_trade.rs`) som kvantifierar en kandidatklockas nytta för holdover i tid/tröghet från en kurva med **uppmätt ADEV** mot en klassisk baslinje, med förbehållet om golvet vid lång τ buret på artefakten och en envelopp för resiliens mot tid utan GNSS. Utvärderings**måtten** (AUC / förväxling / Pd-Pmd, där Pmd är sannolikheten för missad detektering) är **validerade till exakt överensstämmelse mot scikit-learn 1.9.0** — inklusive på **verklig telemetri från ESA OPS-SAT** (datamängden OPSSAT-AD för anomalidetektering, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), där Kshanas Mann–Whitney ROC AUC reproducerar scikit-learns `roc_auc_score` till < 1e-9 på den undanhållna testdelmängden och en transparent topprräkningsdetektor separerar de märkta anomalierna vid AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`) — och avvägningsmotorns numeriska **kärnor** (ADEV NNLS — icke-negativa minsta kvadrater — anpassning, χ²-konsistensband, van Loans klock-Q) **mot scipy 1.17.1**; nyttosiffrorna för enheter som byggs ovanpå förblir **MODELLED** operativa karakteristika — aldrig fält-/IQ-data (sampel i fas/kvadratur), inget utslag bra/dåligt. Med testbädden som grund poängsätter en djupare **studie av optimismgapet** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) en panel med **13 detektorer** (energi/AGC/SQM/paritet plus detektorer med logistisk regression med frö och MLP med ett dolt lager — flerlagersperceptron), anpassar **skalningslagar** inom kontra utanför fördelningen med en permutationsnollhypotes, och lär en **lämna-en-utanför-prediktor** av försämring utanför fördelningen från statistik inom fördelningen (`cargo run --example optimism_study`). En **mjukvarudefinierad mottagarfront** (`src/sdr.rs` — rå IQ/IF (mellanfrekvens) → korrelatorns tidiga/aktuella/sena uttag → SQM) och **inläsningsadaptrar för verkliga data** (`src/realdata/` — RINEX, u-blox UBX (u-blox binärprotokoll), GnssLogger, JammerTest, Yunnan, SatGrid) låter samma detektorer köras över inspelningar som tillhandahålls lokalt (inga datamängder är incheckade). **Korsningskartan för resiliens kvant mot klassisk** under parameterosäkerhet (`src/crossover.rs`; `cargo run --bin crossover_study`) genererar på nytt korsningsstudierna för tröghet och klocka bakom figurerna i Resultat. |
| **Demonstrator för kvantaktiverad PNT** | Tre körbara, **MODELLED** tillämpningsområden bakom den öppna motorn, var och en med ärlig `TradeEvidence` + en registrering av representativitet / luckor till flygning (`src/representativeness.rs`): **betrodd kvanttidsöverföring** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — en budget från början till slut för optisk gitterklocka + fotonisk länk mot CSAC (atomklocka i chipskala) + RF tvåvägs, med en återanvänd skyddsnivå för tidssynkronisering, ett säkerhets-FoM för fördröjnings-/uppspelningsattacker (1 − P_md) och detektering av klockanomalier + CUSUM-latens); **kvantnavigering utan GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — tröghetsglidning med kallatomsinterferometer mot en INS av navigationsklass under ett GNSS-avbrott, ärlig med att utan extern positionsbestämning är accelerometerns bias oobserverbar så felet växer ändå); och **fel-/anomalidetektering** för kvantsystem (`quantum-anomaly-detect`, `src/quantum_faults.rs` — en märkt felkatalog med en ROC AUC med bootstrap-KI (konfidensintervall) från den externt validerade `eval_stats` och ett minsta detekterbart fel vid en fast falsklarmsfrekvens). Ett delat **bibliotek med felmodeller för kvantenheter** (`src/quantum_devices.rs`) och en enhetlig **avvägningsrigg kvant mot klassisk** (`src/qtrade.rs`) ligger till grund för dem. De validerade kärnor de vilar på (utvärderingsmått mot scikit-learn, avvägningskärnor mot scipy) återanvänds; nyttosiffrorna för enheter som byggs ovanpå förblir **MODELLED** — **illustrativa parametrar från offentliga källor** för enheter/länkar, modellerar *klassen*, ingen TRL / flygerfarenhet / certifiering, inget godkännande från någon myndighet. |
| **Sparsam teknik och integritetspåverkan** | En lins för **ROI per täckning** (avkastning på investering) (`src/frugal.rs`) — kostnad per enhet levererad täckning för en arkitekturavvägning — och en mappning **missad detektering → integritetspåverkan** (`src/integrity_impact.rs`) som omvandlar en övervakares frekvens av missade detekteringar till dess bidrag till integritetsrisk. **MODELLED** beslutsstödsbudgetar, additiva. |
| **Utbyte av artefakter** | **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — ett versionerat, självbeskrivande kuvert som omsluter ett scenarioresultat med dess typ, schemaversion och etiketterna MODELLED/VALIDATED, så att en lagrad artefakt förblir självdokumenterande och äldre kuvert förblir framåtkompatibelt läsbara. |

Varje förmåga nås som ett Rust-API, en körbar scenario-`kind` eller båda.
Mognad per förmåga — *validerad*, *körbar* eller *bibliotek* — följs i
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). En **maskinkontrollerad verifieringsmatris**
(`src/verification.rs`) återger korsreferensen krav → modul → test → referens → status,
med enhetstestade ärlighetsinvarianter som tillåter etiketten *validerad*
endast där en oberoende **extern** referens stöder den — och som registrerar de
hårdvaru-/PA-förmågor (produktsäkring) som Kshana medvetet **inte** tillhandahåller.

</details>

<details>
<summary>De fyra sensorpaketen, som de först publicerades (resultat)</summary>
### Resultat

Varje scenario jämför en kvantsensor med dess klassiska motsvarighet genom ett
GNSS-avbrott på ~1.8 h. Siffrorna är reproducerbara (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Vad kvantsensorer ger när GNSS är borta, scenariot för klock-holdover: kvant håller 6600 s autonomi mot 2610 s klassiskt, mycket lägre tidsfel, och 100% mot 95.6% tillgänglighet" width="88%">
  <br><sub>Vad kvantsensorer ger när GNSS är borta — <code>clock-holdover</code> · frö 42 · ritad med motorn 0.40.0, och varje siffra ovan kontrolleras på nytt mot den aktuella motorn vid varje bygge av <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Fördelen **beror på avbrott och vibration**, med en uttalad brytpunkt där klassiskt vinner — visad ärligt längs stegen för teknisk mognad (siffrorna för optiska klockor är mål för markdemonstratorer; ingen optisk strontiumklocka har flugit):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Korsning kvant mot klassisk för klock-holdover längs stegen för teknisk mognad, med konfidensband" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Värmekarta över kvantfördelen mot klassisk tröghet över avbrottslängd och vibration, med en brytpunktskontur där klassiskt vinner" width="96%">
  <br><sub>Korsning för resiliens kvant mot klassisk — TRL-stegen för klock-holdover (överst) · karta över tröghetsfördel med brytpunktskontur (nederst). Kan genereras på nytt via <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Tröghetsbaserad dödräkning: positionsfel under ett GNSS-avbrott — kvantsensorn (kallatom) stannar nära specifikationslinjen medan sensorn av navigationsklass divergerar till tiotals kilometer" width="80%">
  <br><em>Positionsfel vid dödräkning under ett GNSS-avbrott: kvantsensorn (blå)
  ligger platt nära specifikationen; den klassiska sensorn (röd) divergerar till tiotals kilometer.
  Genererad av Kshana från <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Paket | Scenario | Kvant | Klassisk |
|------|----------|---------|-----------|
| **1 — Klock-holdover** | `clock-holdover.toml` (specifikation 20 ns) | optisk klocka håller hela avbrottet | CSAC överskrider specifikationen mitt i avbrottet |
| **2 — Tröghetsbaserad dödräkning** | `imu-deadreckoning.toml` (specifikation 100 m) | kallatom: **~41 m**, håller hela avbrottet | navigationsklass: överskrider efter **~350 s** → tiotals km |
| **3 — Tidsöverföring** (optisk länk mellan satelliter) | `timetransfer.toml` | optisk: **~0.3 mm** avståndsmätning | RF (TWSTFT): **~150 mm** avståndsmätning |
| **4 — Hybridfusion** (slutsten) | `hybrid-pnt.toml` | full position+tidssynkronisering under hela avbrottet | **positionsbegränsad vid ~350 s** |

Slutstenen visar fusionstesen: optisk tidsöverföring mellan satelliter håller även
en klassisk *klocka* låst, vilket isolerar *tröghets*sensorn som den klassiska svitens
svaga länk — dvs. kvanttröghet + optisk tidssynkronisering tillsammans.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Klock-holdover: fasfel under ett GNSS-avbrott — den optiska klockan håller sig inom specifikationen på 20 ns under hela avbrottet medan klockan i chipskala överskrider den mitt i avbrottet" width="80%">
  <br><em>Klock-holdover genom ett GNSS-avbrott: den optiska klockan (blå) håller sig inom
  specifikationen på 20 ns under hela glidningen; klockan i chipskala (röd) överskrider den en bit in.
  Genererad av Kshana från <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Ett ytterligare scenario, `orbit-gnss-challenged.toml`, härleder GNSS-tillgänglighet ur
**bangeometri** i stället för handskrivna fönster: en rymdfarkost inuti GNSS-
skalet propageras mot en GPS-liknande Walker-konstellation, och antalet synliga satelliter
(fri sikt, jordockultation, elevationsmask) bestämmer positionsläget i varje
steg. Under ett dygn har användaren positionsbestämning bara ~59% av tiden; kvantklockan håller en
tidslösning på 5 ns genom varje lucka (tillgänglighet **1.0**), klockan i chipskala
endast **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Bana med utmanad GNSS: klockans tidsfel över ett dygn för en rymdfarkost inuti GNSS-skalet, där täckningsluckorna härleds ur bangeometrin — den optiska klockan håller sig inom specifikationen på 5 ns över luckorna medan klockan i chipskala överskrider den" width="80%">
  <br><em>Tidsfel över ett dygn med GNSS-tillgänglighet härledd ur bangeometrin:
  antalet synliga satelliter (fri sikt, jordockultation, elevationsmask) bestämmer positions-
  läget i varje steg, så klockan måste glida genom varje lucka — den optiska klockan håller specifikationen
  på 5 ns medan klockan i chipskala överskrider den. Genererad av Kshana från
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

Konstellationen kan också anges som verkliga tvåradselementuppsättningar (TLE). En *fullständig* TLE
(rad 1 + rad 2) propageras med den fullständiga **SGP4/SDP4**-modellen — inklusive
atmosfäriskt motstånd och djuprymdens måne-sol-termer och resonanstermerna för 12 h / 24 h som
har betydelse för GNSS-banor på ~12 h — validerad mot de officiella vektorerna i AIAA 2006-6753
till ett sämsta fall på ≈ 4 mm. `scenarios/orbit-sgp4-gps.toml` levereras med en **verklig Celestrak-
ögonblicksbild `gps-ops`** av den operativa GPS-konstellationen (2021-07-28, 30 satelliter)
och kräver giltiga TLE-kontrollsummor — tvåradselementuppsättningar är öppna data från katalogen hos US
Space Force / 18th Space Defense Squadron, vidaredistribuerade av Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); uppdatera med
`scripts/fetch_tles.sh`. Ett block med enbart rad 2 behåller
den analytiska tvåkroppspropageringen (`scenarios/orbit-real-tle.toml`); de två formerna kan
blandas i en konstellation. En konstellation kan lika gärna byggas från ett block med
poster för **sända GPS-efemerider i RINEX-3** — det format en mottagare avkodar —
propagerade med användaralgoritmen i IS-GPS-200 och matade genom samma geometri
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Vad det är / inte är, i sin helhet</summary>

<a id="what-it-is--is-not"></a>
### Vad det är / inte är

**Det är:** en deterministisk motor med få beroenden som spänner över PNT-stacken — ban-
geometri, tröghetsnavigering, GNSS/INS-fusion, integritet, klockor och tidssynkronisering. Den
kör ett scenario (ofta ett GNSS-avbrott), utvecklar kalibrerade sensorfelmodeller
genom lämplig skattare och poängsätter resultatet mot de operativa
kvalitetsmåtten — och skriver ut ett reproducerbart JSON-resultat (JavaScript Object Notation) och ett SVG-diagram, från ett
Rust-bibliotek, ett kommandoradsgränssnitt (CLI), ett Python-tillägg, en WebAssembly-modul i webbläsaren, en
**Model Context Protocol-server (MCP)** för AI-agenter eller ett **plugin för JetBrains IDE (integrerad
utvecklingsmiljö)**.

**Det är inte:** flyghårdvara, en design av kvantnyttolast, en fullständig GNSS-signal-
mottagare, en simulator för radiofrekventa (RF) signaler eller en rigg med hårdvara i slingan, eller en
certifierad avionikprodukt — och det ersätter inte MATLAB/Simulink, STK (Systems Tool
Kit) eller Orekit; det står bredvid dem och utbyter filer med dem. Trohet mot kvanthårdvara kommer från
publicerade felmodeller, inte från detta verktyg. Den detaljerade mognaden för varje
förmåga dokumenteras i [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Det är inte (ännu):** en *fullständig* fysikmotor för atominterferometri (de flesta kvantsensorer
använder publicerade koefficienter för Allan-/brusbudget; CAI-accelerometern (kallatomsinterferometer) har ett
lager utifrån grundprinciper — Mach–Zehnder-fas, projektionsbrus, kontrastavtagande och
vibrationskoppling, plus systematiska effekter från Coriolis och ljusförskjutning — men systematiska vågfrontseffekter och
upplösning av fransosäkerhet förblir ett färdplanslager **P2** (färdplanens fas 2, kvantfysiklagret),
se [`ROADMAP.md`](ROADMAP.md) och [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
en certifierad GNSS-mottagare eller hårdvarumottagare (den löser en positionsbestämning med enpunkts-**PVT** (position, hastighet och tid)
från verkliga kodobservationer i RINEX (Receiver Independent Exchange Format) — validerad
på verkliga data från IGS (International GNSS Service) — och dess IQ-lager (`kshana iq`, sedan 0.31.0)
infångar och spårar inspelade eller genererade basbandssampel i mjukvara, som en analys-
mottagare: den driver ingen radiohårdvara och sänder inte, är inte en certifierad mottagare och gör
ingen positionering med bärvågsfas (RTK eller PPP)); eller en fullständig svit för uppdragsdesign (den har byggstenar för Lambert / porkchop /
manöver / banbestämning, men är prestandasimuleringslagret
*ovanför* GMAT (General Mission Analysis Tool)/Orekit, inte en ersättning). Att äga denna avgränsning är medvetet. Om du behöver felbudgetar för
kallatomsinterferometrar utifrån grundprinciper (t.ex. av CARIOQA-PMP-klass — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — eller validering i stil med X-37B), se
P2-färdplanen och [hör av dig](#support--professional-services) för att samarbeta.

</details>

### Navigering i låg omloppsbana

Satelliter i låg omloppsbana (LEO) passerar snabbt och med stark signal. Typen `leo-pnt-chain` följer ett
system genom varje steg: signalen, passagen och dess länk, navigeringsmeddelandet, och
den fusionerade positionsbestämningen av position, hastighet och tid (PVT) samt precise point positioning (PPP). Varje
steg lämnar sina tal vidare till nästa. Se [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="LEO-PNT-kedjan från en verklig körning av leo-pnt-chain (leo-pnt-end-to-end.toml): signalsteget (generic-l på 1191.795 MHz, pilot spårad vid 10.23 Mchip/s) lämnar över till passagesteget (1080 km, spårad C/N0-topp 58.2 dB-Hz), som lämnar över till navigeringsmeddelandet (kepler-rac, anpassning 300 s, representations-SISRE 0.91 mm RMS, 0.250 m med banbestämning), som matar den fusionerade positionsbestämningen (enbart GNSS 1.60 m RMS 3D, GNSS plus LEO 0.43 m) och precise point positioning (konvergens 11.5 min enbart GNSS, 7.5 min med 240 LEO-satelliter). 11 värden lämnas mellan stegen." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Varje scenariotyp per familj

Motorns scenariotyper, ordnade under familjer. Varje familj har en sida med en post per typ (motorns
beskrivning och fält, ett exempelkommando, nyckeltal från en körning, de rader i
[verifieringsmatrisen](docs/VERIFICATION-MATRIX.md) som namnger den, och diagrammet som motorn själv skriver) och ett
kontaktark med de diagrammen; [`docs/KINDS.md`](docs/KINDS.md) indexerar dem alla. Tabellen skrivs av
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) och sidorna av
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), och båda fallerar om motorn får en typ som ingen familj namnger.

<!-- generated:kind-families -->
| Familj | Vad den besvarar | Typer | Kör en |
|---|---|---|---|
| **[Klockor, tidssynkronisering och holdover](docs/kinds/clocks-timing-and-holdover.md)** | hur länge en klocka håller tid utan GNSS, och hur ett tidssynkroniseringssystem står sig mot sina masker | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Tröghets-, fusions- och kvantsensorer](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | dödräkning och sensorfusion genom ett GNSS-avbrott, med klassiska sensorer och kvantsensorer | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[Alternativ PNT utan GPS](docs/kinds/gps-denied-alternative-pnt.md)** | navigering utifrån gravitation, terräng och andra fält när GNSS är borta | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Konstellationer, täckning och geometri](docs/kinds/constellations-coverage-and-geometry.md)** | var satelliterna är, vem som ser dem och hur bra geometrin är, runt jorden, månen eller Mars | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[GNSS-mätningar, positionering och integritet](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudoavstånd, positionsbestämningar, skyddsnivåer och rymdmiljön | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Jamming, spoofing och spektrum](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | hur störning når en mottagare och om den detekteras | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Navigering i låg omloppsbana](docs/kinds/low-earth-orbit-navigation.md)** | en passage, en länk, ett navigeringsmeddelande och en fusionerad positionsbestämning, steg för steg | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Månen och cislunärt](docs/kinds/lunar-and-cislunar.md)** | navigering, tid, referenssystem och geodesi vid månen | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Navigering för rymdanvändare](docs/kinds/space-user-navigation.md)** | GNSS-signaler för rymdfarkoster ovanför, runt och bortom GNSS-banorna | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Optisk PNT](docs/kinds/optical-pnt.md)** | optiska länkar genom atmosfären och kvalitetsmått för optiskt plus RF | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Uppdragsanalys, länkar och rymdoperationer](docs/kinds/mission-analysis-links-and-space-operations.md)** | uppskjutning, uppstigning, inträde, attityd, länkar, kontaktplanering och filformat | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Uppdragstrådar](docs/kinds/mission-threads.md)** | felbudgeten för navigering och tidssynkronisering i en kedja av faser från uppskjutning till inträde | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Kampanjer](docs/kinds/campaigns.md)** | kedjade uppdrag, svep och ensembler byggda av de andra typerna | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Varje kommando

`kshana <scenario.toml>` kör ett scenario; varje annat kommando är ett underkommando, och `kshana --help` skriver ut användningen
för dem alla. Kommandona är `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (med `live` och
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` och `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) ger varje kommandos syfte, ett verifierat exempel och dess dokumentationssida.

<a id="every-surface"></a>
### Varje yta

En motor, samma resultat överallt: kommandoraden, Rust-biblioteket, Python, JavaScript och WebAssembly,
MCP-servern med sina plugin-kommandon och färdigheter, Kshana Studio (varje sida körs i webbläsaren, ingen installation, ingenting laddas upp),
integrationerna för ROS 2, Signal K, OpenCPN, GNSS-SDR och `gnss_lib_py`, driftsättningspaketen för systemd, Docker och Grafana, och
JetBrains-pluginet. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) listar dem med hur man får tag i var och en och namnen på alla
plugin-kommandon, färdigheter och Studio-sidor; [`docs/SURFACES.md`](docs/SURFACES.md) anger, för varje kommando och typ,
vilken yta som bär det och vilka som inte gör det, med skälet.

<a id="how-a-run-works"></a>
## Hur en körning fungerar

Ett scenario är en TOML-fil (Tom's Obvious, Minimal Language): en typ, ett frö och
parametrarna. Motorn kör det och skriver resultatet, ett diagram och en rapport bredvid, samt
de exporter du begär.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Hur en körning flödar. En scenariofil i TOML (en typ, ett frö och dess parametrar) går in i motorn, kshana 0.40.0, genom fördelningen api::run_toml över 92 scenariotyper, deterministisk utifrån scenario, frö och motorversion. Motorn skriver result.json, chart.svg, report.html och report.json, en table.csv för de typer som definierar en, och på begäran exporter i SP3, CCSDS OMM och OEM, CZML, KML, GeoJSON, STK och SigMF; en svit skriver study.json och study.html. Dessa filer matar Kshana Studio i webbläsaren, en AI-assistent via servern kshana-mcp, och kontinuerlig integration." width="100%">
</picture>

Detta medföljande scenario körs i 2 h: 10 min med GNSS, därefter omkring 1.8 h utan GNSS. Det frågar
hur länge en optisk strontiumgitterklocka och en atomklocka i chipskala (CSAC) var för sig håller
tiden inom 20 ns.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

Den optiska klockan håller budgeten på 20 ns under hela avbrottet på 6600 s; CSAC håller den i
2610 s och är inom budgeten under 95.6% av körningen mot 100% för den optiska klockan.
`kshana example` listar varje medföljande scenario.

<a id="missions"></a>
## Uppdrag

Tio sektorer ställer tio olika frågor till samma motor. Var och en har medföljande scenarier att
börja från.

| Sektor | Börja med |
|---|---|
| Försvar och säkerhet | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Rymden, jordbana | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Månen, Mars och djuprymden | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Luftfart och drönare | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Sjöfart | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Väg | `automotive-urban-canyon` |
| Järnväg | `rail-tunnel-coast` |
| Kritisk infrastruktur och tidssynkronisering | `clock-holdover`, `clock-ensemble` |
| Telekom och 5G (femte generationens mobilnät) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Vetenskap och forskning | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>Frågan varje sektor ställer</summary>

<br>

| Sektor | Frågan den ställer | Börja med |
|---|---|---|
| **Försvar och säkerhet** | Hur länge förblir vår navigering och tidssynkronisering tillförlitlig under jamming och spoofing, och vilka lager håller oss inom specifikationen? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Rymden: jordbana** | Ser min rymdfarkost tillräckligt många navigeringssatelliter, hur länge håller dess klocka tiden mellan positionsbestämningar, och vad skulle ett navigeringslager i låg omloppsbana tillföra? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Månen och djuprymden** | Kommer en landare, rover eller orbiter vid månen, vid Mars eller längre bort att få en tillförlitlig position och tid? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Luftfart och drönare** | Efter att en störsändare tagit bort GNSS, hur länge håller sig mitt obemannade luftfartygssystem (UAS) inom sin positionsbudget, och finns integritet tillgänglig på min rutt? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Sjöfart** | Hur långt över vattnet når en störsändare, skulle en positionsförskjutning upptäckas, och hur länge kan ett fartyg glida in i hamn? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Väg och fordon** | Hur långt driver en bil under en viadukt eller förbi en störsändare vid vägkanten? | `automotive-urban-canyon` |
| **Järnväg** | Hur många sekunder in i en tunnel kan ett tåg fortfarande avgöra vilket spår det är på? | `rail-tunnel-coast` |
| **Kritisk infrastruktur och tidssynkronisering** | Om GNSS-tiden förloras eller spoofas, hur länge behåller ett elnät, en handelsplats eller ett datacenter spårbar tid? | `clock-holdover`, `clock-ensemble` |
| **Telekom och 5G** | Om GNSS-tidsreferensen förloras, håller sig min nätverksklocka inom ITU-T-maskerna, och hur länge? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Vetenskap och forskning** | Kan jag reproducera, utvidga och citera ett PNT-resultat, ända ner till fröet? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Evidens

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 kontrollerad mot alla 666 referensvektorer i AIAA 2006-6753, sämsta positionsfel 4.12 mm"></a></p>

<strong>176 av 401</strong> förmågor validerade mot oberoende externa referenser; 221 ärligt märkta Modelled.
Varje rad i verifieringsmatrisen namnger en förmåga, den referens den kontrolleras mot,
testet som kör kontrollen och den etikett som följer. Kontinuerlig integration (CI) gör det
omöjligt att kalla en förmåga VALIDATED utan en oberoende extern referens.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Hur en förmåga förtjänar sin etikett. Varje rad i verifieringsmatrisen namnger en förmåga, den referens den kontrolleras mot, testet som kör kontrollen i kontinuerlig integration och den etikett som följer. En rad får vara VALIDATED endast med en oberoende extern referens; annars är den MODELLED, eller PARTNER när en hårdvarupartner äger den. Exempel: SGP4/SDP4, Cowell 6-DOF + störningar, batch-/sekventiell OD, referens AIAA 2006-6753 SGP4-verifieringsvektorer, test tests/sgp4_verification.rs, etikett VALIDATED. Aktuella antal: 176 VALIDATED, 221 MODELLED, 4 PARTNER av 401 rader. Totalt 176 förmågor validerade mot oberoende externa referenser; 221 till är ärligt märkta MODELLED och 4 ägs av PARTNER." width="100%">
</picture>

| Etikett | Rader | Betydelse |
|---|---|---|
| VALIDATED | 176 | en oberoende extern referens stämmer: verkliga data, en oberoende implementation eller publicerade referensvektorer |
| MODELLED | 221 | kontrollerad mot analytisk sanning eller simuleringens självkonsistens, och uttalat öppet |
| PARTNER | 4 | ägd av en hårdvarupartner; Kshana har ingen referens för den |

Några av kontrollerna: alla 666 SGP4-vektorer (Simplified General Perturbations 4) från AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 till 4.12 mm; Cowell-kraft-
modellen till 0.08 m mot Orekit 12.2; Galileo till 0.61 m och Swarm-A till 0.10 m mot verkliga
precisa efemerider från Europeiska rymdorganisationen (ESA). Testerna håller nära 95 % radtäckning av
`src/`, med en spärr på 85 % i CI. Registret är
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), genererat från
`src/verification.rs`: den [fullständiga matrisen med 401 rader](docs/VERIFICATION-MATRIX.md), och varför varje
Modelled-rad saknar extern referens i [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Hur valideringen fungerar, den kurerade tabellen med höjdpunkter och evidensfigurerna</summary>

### Validering, reproducerbarhet och ärlighet

- Varje brusterm är kalibrerad mot en **publicerad, citerad** siffra och validerad
  mot det vedertagna sambandet (Allan-avvikelse för klockor; Groves felväxt vid dödräkning
  för tröghet; omvandlingen tid→avstånd för tidsöverföring). Status
  per term följs i [`docs/VALIDATION.md`](docs/VALIDATION.md) som `validated` eller
  `not modeled` — ingenting presenteras som validerat som inte är det.
- **Reproducerbart genom konstruktion:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` upprätthåller det; kvant- och klassiska körningar använder
  oberoende frön så att deras brus är okorrelerat.
- Mognaden anges ärligt: siffrorna för optiska klockor och optiska länkar är resultat som *mål /
  markdemonstrator*, inte flugna.

### Evidensetiketten på varje figur

Varje figur och tabell som en körning skriver anger hur långt man kan lita på den, och vilka registerrader det vilar på. Resultat-JSON har en
nyckel `evidence`, diagram-SVG:n en rad under grafen (och ett element `<metadata id="kshana-evidence">`), och CSV-tabellen
kommentarsrader `# evidence:` först (läs med `comment='#'`). Den namnger en nivå, `VALIDATED`, `MODELLED` eller `PARTNER`, och
id:na (`VM-` och åtta hexadecimala siffror) för de rader i verifieringsmatrisen som körningen använde. Nivån är den svagaste av dessa
rader, så en körning som vilar på en modellerad rad märks MODELLED oavsett hur många validerade rader som står bredvid; etiketten
kan aldrig påstå mer än registret gör. Rader, statusar och id läses ur matrisen, de skrivs inte in för hand
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), och
`tests/evidence_labels_doc_sync.rs` fallerar om en figur saknar etikett eller om en etikett inte stämmer med matrisen.

### Validering i korthet

Varje rad upprätthålls av ett namngivet test i CI. Denna tabell är ett **kurerat urval av höjdpunkter**;
den fullständiga maskinkontrollerade matrisen har **401 rader — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), med den fullständiga evidensen (och det som ärligt *inte* är validerat ännu)
i [`docs/VALIDATION.md`](docs/VALIDATION.md) och artefakten
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases) för varje version
(genererad av `cargo run --bin validation_report`, SLSA-intygad — Supply-chain
Levels for Software Artifacts).

Kolumnen **Status** anger *typen* av evidens, i enlighet med valideringsstegen ovan: **VALIDATED** = kontrollerad mot en oberoende extern referens (verkliga data, ett oberoende bibliotek eller publicerade referensvektorer); **MODELLED** = kontrollerad mot analytisk sanning eller simuleringens självkonsistens (ingen oberoende extern datamängd). VALIDATED beskriver kontrollens *metod*, inte godkänt/underkänt — en ärlig miss mot en verklig extern referens förblir VALIDATED, medan en jämförelse som ingen matrisrad namnger som referens (anpassningen till LRO — Lunar Reconnaissance Orbiter — ovan) visas som MODELLED. `CI`-rader är processkontroller, inte kvalitetsmått. Några öar med verkliga data (den uppmätta cesiumklockan, Stable32 PHASE.DAT och kontrollerna mot OPS-SAT/ICGEM där rådata inte har någon licens för vidaredistribution) är **datavillkorade**: testet skriver ut ett meddelande om överhoppning och förblir grönt när indata saknas, och de publika referenstalen är incheckade under `tests/fixtures/`. Återskapa rådata med motsvarande `scripts/fetch_*.sh`.

| Status | Förmåga | Överensstämmelse | Referens / oberoende referens |
|--------|------------|-----------|--------------------|
| **VALIDATED** | SGP4/SDP4-propagering | 666/666 vektorer, sämst **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + direkt jämförelse mot det oberoende paketet `sgp4` |
| **VALIDATED** | Referenssystem — IAU 2000A/B-nutation, IAU 2006/2000A CIO-kedjan, ERA | **bit för bit** (X,Y till 1e-14, s till 1e-18, ERA till 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS mot en oberoende SPICE-motor | max **0.028″** → ≤ 0.86 m på marken, ≤ 3.6 m i GNSS-bana | ANISE (ren Rust NAIF/SPICE), samma IERS `finals2000A` EOP, 8 epoker 2020–2023 (jämförd mot denna referens; ingen rad i verifieringsmatrisen namnger den som extern referens, så den är inte märkt VALIDATED) |
| **MODELLED** | EGM2008-geopotential (grad/ordning 70) | acceleration = ∇V till **< 1e-6**; zonal kollaps till validerad J2 | NGA EGM2008-koefficienter + analytisk ∇V-identitet |
| **VALIDATED** | Syntes av gravitationsfunktionaler (gravitationsstödd navigeringskarta / utan GNSS) | GRS80 Somigliana + γ_e/γ_p till **3.5e-12**; verklig EGM2008-störningskarta fysikalisk (RMS ≈ 26 mGal, g/o 70) | GRS80 (Moritz 1980, IAG — International Association of Geodesy) Somiglianas normaltyngd + verklig ICGEM EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Allan-skattare (ADEV/MDEV/TDEV/HDEV) + konfidensband | reproducerar referensavvikelser; χ²-band stämmer | NIST SP 1065 (Riley), 1000 punkter tabell 31/32 |
| **VALIDATED** | Allan-skattare på en **verklig uppmätt cesiumklocka** | OADEV/OHDEV till **1e-3** (observerat ≤ 3e-5), 16 medelvärdesbildningsfaktorer | Stable32 på en verklig 5071A Cs mot H-maser, 556,990 punkter (`tests/cs5071a_reference.rs`, datavillkorad) |
| **VALIDATED** | Allan-skattare på den **kanoniska Stable32 PHASE.DAT** | OADEV/MDEV/TDEV till **1e-3** (observerat ≤ 5e-5), 139 medelvärdesbildningsfaktorer | Stable32-referensavvikelser för PHASE.DAT (`tests/phasedat_reference.rs`, datavillkorad) |
| **MODELLED** | IMU-felmodell — ARW / VRW / biasinstabilitet | återvunnen till **< 5 %** (biasinstabilitet < 15 %) | Datablad för Analog Devices ADIS16465; NaveGo-referensprofil |
| **VALIDATED** | Numerisk Cowell-propagator + kraftmodell (konservativa nivåer) | sämsta positionsfel **0.08 m** över 24 h, 278 epoker (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Cowells motståndsnivå + absoluta indata för sol-/månefemerid och densitet | motståndsnivån karakteriserad ≈ 333 m / 24 h; ostörd stämmer med Kepler med universell variabel under en meter, energi/rörelsemängd ~1e-9 | inbyggd efemerid med låg precision + analytisk Kepler |
| **MODELLED** | Lambert · Tsiolkovskij · porkchop | rundtur till tvåkroppssanning; ΔV **< 0.01 %** | Izzo 2015 · raketekvationen · analytiskt Hohmann-golv |
| **MODELLED** | Banbestämning (Gauss–Newton-batch) | under en meter / mm·s⁻¹ brusfritt; ~2 m vid ett brusgolv på 5 m | tvåkropp + J2 över en RK4-båge |
| **MODELLED** | Kraftmodellsanpassning mot Galileos precisa efemerid (hel båge) | **0.61 m** 3-D RMS, 24 h, g/o-70, endast krafter | ESA/ESOC slutlig bana `ESA0MGNFIN` (E11), verklig `finals2000A` EOP (jämförd mot denna referens; ingen rad i verifieringsmatrisen namnger den som extern referens, så den är inte märkt VALIDATED) |
| **MODELLED** | Kraftmodellsanpassning mot Swarm-A:s precisa efemerid (reducerad dynamik) | **0.10 m** 3-D RMS (gräns för empirisk nivå, inte en mätning) | ESA precis bana `SW_OPER_SP3ACOM_2_` (jämförd mot denna referens; ingen rad i verifieringsmatrisen namnger den som extern referens, så den är inte märkt VALIDATED) |
| **MODELLED** | Kraftmodellsanpassning mot LRO vid månen (ärlig miss) | **6.67 m** reducerad dynamik, *över* målet på 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (jämförd mot denna referens; ingen rad i verifieringsmatrisen namnger den som extern referens, så den är inte märkt VALIDATED) |
| **MODELLED** | OD för Mars i djuprymden (SRIF med reducerad dynamik) | **≈ 0.2 m** Mars-LMO (simulerings-FoM, *inte* verkligt uppdrag) | syntetisk OD i sluten slinga — validering av skattarmaskineriet |
| **MODELLED** | Solcentrerad Mars-dynamik mot JPL DE440 | **137 m @ båge på 1 dygn** (växer med bågen = omodellerade n kroppar) | JPL DE440 via ANISE (`xval/anise-mars-od`, villkorad av kärnfil) (jämförd mot denna referens; ingen rad i verifieringsmatrisen namnger den som extern referens, så den är inte märkt VALIDATED) |
| **VALIDATED** | Enpunktspositionering mot en inmätt IGS-koordinat (verkliga observationer) | **5.7 m** 3-D RMS / **1.1 m** horisontellt, jonosfärsfri kod-SPP med två frekvenser | Inmätning av IGS-stationen ABMF + sänd GPS-efemerid, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Tätt kopplad GNSS/INS-UKF | **0.77 m RMS** över en 30 min LEO-passage inkl. ett avbrott på 120 s | glidning med kraftmodell, handhärledd |
| **MODELLED** | Navigering med gravitationskarta utan GPS | ~70 km INS-drift → **~145 m** återvunnet | Målet för ESA NAVISP *Quantum Wayfarer* |
| **MODELLED** | Terrängrefererad navigering (TERCOM/SITAN) | 70 km drift → **< 500 m** (golv från rutnätsupplösningen ~140 m) | SRTM `.hgt` DEM; handinjicerad drift (icke-cirkulär kontroll) |
| **MODELLED** | IGRF-14 huvudfält (grad/ordning 13) | pol ~80.7°N, dipol ~29.7 µT, fysikaliskt band 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (Schmidt-seminormaliserad) |
| **MODELLED** | Modulering av navigeringssignal och kodspårning | BPSK själv-SSC = **2/(3·R_c)**; PSD med enhetsarea; C/A DLL-jitter **under en meter** @ 45 dB-Hz | SSC/PSD-ankare i sluten form + Kaplan & Hegartys formel för DLL termiskt brus |
| **MODELLED** | Differentialkorrektor för CR3BP halo/NRHO | STM = ändliga differenser; banan sluts till **maskinprecision**; L2 9:2 NRHO **≈ 6.57 d / perilun ≈ 3,250 km** | STM-kontroll med ändliga differenser + publicerad södra 9:2 NRHO kring L2 (≈ 6.56 d / ≈ 3,370 km) — CR3BP, inte en verklig Gateway-efemerid |
| **MODELLED** | ARAIM-integritet med två konstellationer | felläge för hela konstellationen på verklig GPS + Galileo | EU ARAIM TR (teknisk rapport) / DO-316; Celestrak `gps-ops` 2021-07-28 (jämförd mot denna referens; ingen rad i verifieringsmatrisen namnger den som extern referens, så den är inte märkt VALIDATED) |
| **VALIDATED** | GNSS-geometri / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | överensstämmelse till **1e-6 relativt** över 8 geometrier (välkonditionerad → nästan singulär) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — oberoende bibliotek (`tests/dop_reference.rs`) |
| **VALIDATED** | ML-mått för detektorutvärdering (AUC/ROC/förväxling/Pd-Pmd/precision/F1) | **exakta antal + < 1e-9** över 5 datamängder × 24 trösklar | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — oberoende bibliotek (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC AUC för anomalidetektering på **verklig telemetri från ESA OPS-SAT** | AUC reproducerar scikit-learn till **< 1e-9**; topprräkningsdetektorns AUC **≈ 0.85** på den märkta testdelmängden | scikit-learn `roc_auc_score` på testdelmängden i OPSSAT-AD (Ruszczak et al. 2025, CC BY 4.0) — verklig OPS-SAT-telemetri (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Numeriska kärnor för kvantavvägning (ADEV NNLS-anpassning · χ²-konsistensband · van Loans klock-Q) | NNLS + Q **exakt**; χ² **< 5e-4** vid operativa frihetsgrader ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | Telekommått för vandring MTIE / MDEV / TDEV (ITU-T G.810/G.823/G.8261/G.811 — rekommendationer från International Telecommunication Unions Telecommunication Standardization Sector) | MTIE (9 medelvärdesbildningsfaktorer, bitexakt) och MDEV + TDEV (8 faktorer, **< 1e-9** relativt) på LCG-serien (linjär kongruensgenerator) i NIST SP 1065 | allantools 2024.06 `mtie` / `mdev` / `tdev` — oberoende bibliotek (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | MCDA-metoder för avvägningsstudier — alla fyra beslutsfamiljer, nio externt validerade aggregatorer (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) plus prioritetsviktning med parvisa jämförelser enligt **AHP** | poäng / rangordningar / konkordansmatriser reproducerade till **< 1e-9** | pymcdm + pyDecision (oberoende MCDA-bibliotek från tredje part) + Saaty RI (slumpindex) / SciPy-LAPACK eig (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | LEO-dopplerenvelopp från banan och bärvågen | Iridiums maximum inom **5 %** av publicerade ±36 kHz; Xona Pulsar X1 inom publicerade **32–34 kHz** | RNTF:s testresultat för LEO PNT; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | PPP-konvergens med LEO-förstärkning | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min med 60 / 96 / 192 / 288 LEO-satelliter, monoton; filtrets NEES inom χ²-bandet | trend jämförd med Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); konstellationer och brus inte reproducerade |
| **MODELLED** | Villkorlig skyddsnivå för tidssynkronisering (holdoverbegränsat odetekterat tidsfel under spoofing) | sammansättningen reproducerar flerstegsrekursionen för `clock_state`-kovarians; kalibrerad på en verklig inspelad spoofing | JammerTest 2024 (Zenodo 15911589) skalärer + van Loans / CUSUM slutna former (`examples/tpl_jammertest`) |
| **MODELLED** | Bedömning av PNT-resiliens + beslutsinstabilitet | 35 handhärledda referenstester; bytedeterministisk studieartefakt (fast frö) | DHS RPCF v2.0-mappning + slutna former för Dirichlet / Kendall-τ / Hill-N2 — syntetiska arkitekturer, inte en certifiering |
| **MODELLED** | Studie av optimismgapet vid RF-försämring (skalningslagar + lämna-en-utanför-prediktor) | signifikans mot permutationsnollhypotes; bytedeterministisk artefakt (5 frön) | syntetisk parameterförankrad korpus — utvärderings*måtten* är VALIDATED mot scikit-learn (ovan); studien är MODELLED |
| CI | Reproducerbarhet över plattformar | bitidentiska indata + formreferenser på 3 OS (operativsystem) | CI-matris Linux / macOS / Windows, SHA-256-referenser |
| CI | Testtäckning | **~95 % rader** i `src/` exklusive `src/*_data.rs` och `src/main.rs`, spärr ≥ 85 % | cargo-tarpaulin (LLVM-motor) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Hur en förmåga förtjänar sin etikett: krav mappas till en modul i src, till ett test i tests, till en extern referens (verklig datamängd, oberoende referensimplementation eller publicerade vektorer), till en status — med en CI-upprätthållen kontroll att ingen förmåga kan vara Validated utan en extern referens. Aktuella antal: 176 Validated, 221 Modelled, 4 Partner, 401 totalt" width="900">
  <br><sub>Hur en förmåga förtjänar sin etikett — den CI-upprätthållna invarianten: ingen extern referens ⇒ kan inte vara Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Hur varje påstående stöds: kolumnen Validated är 176 av 176 ExternalDataset genom konstruktion (CI-upprätthållet); Modelled-rader är ärligt märkta InternalConsistency, ReferenceImpl eller ExternalDataset; Partner-rader har ingen Kshana-referens" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="SGP4/SDP4 sämsta positionsfel mot referensen AIAA 2006-6753 per regim, logaritmisk skala: varje regim ligger långt under AIAA-toleransen, sämsta fall 4.12 mm i den icke-resonanta djuprymdsregimen" width="96%">
  <br><sub>Överst: varje Validated-rad stöds av en extern datamängd, genom konstruktion. Nederst: SGP4 stämmer med den officiella referensen i varje regim (sämst 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Verifieringsstatus över alla 401 förmågor: 176 Validated (kontrollerade mot extern referens), 221 Modelled, 4 ägda av Partner" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Förmågeområden

Varje förmåga på den publika kartan, per område, med sin registeretikett. Områdestabellen skrivs av
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) från `web/capabilities.json`, samma fil som
Studios karta över allt läser.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Kshanas förmågor per område och mognad: validerade och modellerade publika förmågor per område, ritade från web/capabilities.json av tools/gen_validation_figures.py" width="900">
</picture>

Hela tabellen, område för område med varje förmåga och dess etikett, finns i [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Installera

En rad ger kommandoradsverktyget: **`cargo install kshana`**. Varje kanal levererar
v0.40.0 från samma taggade commit.

<!-- channels:begin -->
| Kanal | Installera | Guide |
|---|---|---|
| Prova i webbläsaren | öppna https://kshana.dev | [Guide till Studio](https://kshana.dev/docs/studio.html) |
| Kommandorad (Rust) | `cargo install kshana` | [Användning av kommandoraden](https://kshana.dev/docs/rust.html#usage--cli) |
| Rust-bibliotek | `cargo add kshana` | [API-referens på docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Guide till Python-API:t](https://kshana.dev/docs/python-api.html) |
| JavaScript och WebAssembly | `npm install kshana` | [Guide till npm och WebAssembly](https://kshana.dev/docs/npm.html) |
| AI-assistent (MCP-server, cargo) | `cargo install kshana-mcp` | [Guide till MCP-servern](https://kshana.dev/docs/mcp.html) |
| Docker-avbildning | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Guide till MCP-servern: Docker](https://kshana.dev/docs/mcp.html#install) |
| Tillägg för Claude Desktop | dubbelklicka på `.mcpb` för ditt system: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (ett klick) | [Lägg till i Cursor (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Lägg till i Cursor (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (ett klick) | [Installera i VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Installera i VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Förbyggd binär | ladda ned kshana-mcp-<target> från versionen och kontrollera den mot SHA256SUMS | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Officiellt MCP-register | sök efter io.github.ashfordeOU/kshana-mcp | [Varje installationsutdrag för MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Fjärr (strömmande HTTP), egen drift | `kshana-mcp --http 127.0.0.1:8080` | [Guide till egen drift](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Plugin-marknadsplatsen för Claude Code | `/plugin marketplace add ashfordeOU/kshana` | [Använda Kshana från en agent](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| Plugin för JetBrains IDE | Settings → Plugins → Marketplace → sök efter "Kshana" (plugin-ID dev.kshana.ide) | [Guide till pluginet](https://kshana.dev/docs/jetbrains.html) |
| Signal K-plugin | `npm install signalk-kshana-trust` | [Guide till Signal K-pluginet](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| OpenCPN-plugin | ladda ned pluginets tarball från versionen | [Inlämning till OpenCPN-katalogen](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Grafana-instrumentpanel | importera kshana-grafana-*.json från versionen | [Instrumentpanelens källa](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Avbildning för referensbyggnad | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Marina integrationer](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana på JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Byggs med Rust 1.88 eller nyare, rust-version i Cargo.toml"></a></p>

MCP är Model Context Protocol. Lås en version med `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` eller `npm install kshana@0.40.0`. För att bygga från källkod, se
[Installera och bygga](#install--build) under Referens.

<details>
<summary>Kör ett scenario från Python och från WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Utöver `run` exponerar modulen `run_full` (JSON, SVG och sammanfattningen på en rad på en gång),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` och `error_kind`; se
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

npm-paketet är hela motorn kompilerad till WebAssembly. I Node.js, lämna binären till
`initSync`; i en webbläsare hämtar `await init()` den (se [`README.npm.md`](README.npm.md)).

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

En öppen motor står i centrum, och varje yta kör den: kommandoraden, Rust-
biblioteket, Python, WebAssembly och Kshana Studio, MCP-servern, Docker-avbildningen och
JetBrains-pluginet. Samma scenariofil ger samma byte på var och en. Kshana Pro ligger
ovanpå som ett separat överlägg som beror på motorn och aldrig förgrenar den.
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Kshanas arkitektur: en öppen motor i centrum, kshana 0.40.0 under AGPL-3.0, med api::run_toml, en typad fördelning över varje typ, och verifieringsregistret med 401 förmågor (176 VALIDATED, 221 MODELLED, 4 PARTNER). Runt den kör varje yta samma motor: Kommandorad (cargo install kshana); Rust-bibliotek (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); MCP-server (cargo install kshana-mcp); Docker-avbildning (ghcr.io/ashfordeou/kshana-mcp); JetBrains-plugin (Marketplace: &quot;Kshana&quot;). Under den Kshana Pro, ett proprietärt överlägg som beror på den öppna motorn som bibliotek och aldrig förgrenar den, och som inte lägger till någon fysikalisk modell." width="100%">
</picture>

<details>
<summary>Inuti motorn: områdeslagren och verifieringsregistret</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="Kshanas arkitektur i lager. Fem ingångar (kommandoraden, Python, JavaScript och WebAssembly, MCP-servern och JetBrains-pluginet) når en enda api::run_toml, en typad fördelning över 92 typer. Under den ligger åtta områdeslager: tid och referenssystem, klockor och tidssynkronisering, tröghet och fusion, GNSS och integritet, astrodynamik, LEO PNT, månen, Mars och djuprymden, samt uppdrag och studier, på en delad kärna, alla korsrefererade av verifieringsmodulen, den maskinkontrollerade matrisen med 401 förmågor som är den enda sanningskällan för varje etikett." width="100%">
</picture>

**En motor, många ingångar.** En enda Rust-kärna (`kshana`) kör varje scenario,
nådd genom ett CLI, ett Python-tillägg, en WebAssembly-modul i webbläsaren, en **MCP-
server** för AI-agenter och ett **plugin för JetBrains IDE** — som alla möts i en enda
`api::run_toml`-fördelning. Inuti kopplas sensorpaketen in i ett gemensamt gränssnitt för
felmodeller; bredvid dem finns ett **lager för referenssystem** (IAU 2006/2000A
precession–nutation och den CIO-baserade GCRS↔ITRS-reduktionen), ett **astrodynamiskt/numeriskt
lager** (analytisk SGP4/SDP4 **och** en numerisk Cowell-propagator med sin
kraftmodell för EGM2008/störningar, manöverdesign och banbestämning), ett
**integritets-/GNSS-lager** (RAIM/ARAIM, SBAS, mätdomänen, jamming, cislunärt),
ett **fusions-/alt-PNT-lager** (GNSS/INS-skattarna och matcharna mot gravitations-/terräng-/magnet-
kartor), ett **lager för djuprymden och månen** (radiometrisk Mars-PNT och
PNT-sviten för månen, med evidensnivå per del i matrisen — LTC-tid, VLBI, gemensam OD+klocka, realisering av referenssystem, servicevolym,
differentiell PNT, interoperabilitet), ett **lager för uppdragsanalys** (budgetar för uppskjutning / återinträde / täckning /
pekning / passage / länk och rymdvädermiljön), och det öppna
**studielagret för resiliens och AI/ML** (RPCF-resiliensbedömning, optimismgapet vid RF-
försämring och demonstratorn för kvantaktiverad PNT) vars reproducerbara artefakter vilar på de
validerade kärnorna.

Två fristående paket **undantagna från arbetsytan** står bredvid kärnan — `mcp/kshana-mcp`
(MCP-servern, byggd på `rmcp`-SDK:t i utgåva 2024) och `xval/anise-frames` (korskontrollen av
referenssystem mot ANISE/SPICE, som drar in beroenden under MPL-2.0 (Mozilla Public License 2.0)) — hålls utanför det publicerade
paketets beroendegraf, `Cargo.lock`, licensspärren och MSRV-bygget (lägsta stödda Rust-version) genom listan `exclude` i rotens
`Cargo.toml`. JetBrains-pluginet (`ide/jetbrains`) är ett separat Kotlin-
projekt. Se [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) för hela uppsättningen diagram.

De återgivna diagrammen (motorflöde, modulkarta, distribution) finns i [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagram

Diagrammen är Mermaid-källor i [`docs/diagrams/`](docs/diagrams/), återgivna till SVG och PNG i
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` på Linux, de två andra
`render-diagram`-skripten på andra ställen), och en post knyter varje PNG till exakt den SVG den kom från. Tester låser de
antal som de anger. Diagrammen i avsnitten ovan ritas av verktyg utifrån motorkörningar; dessa visar hur
delarna hänger ihop.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Systemet: sex ingångar (kommandorad, Python, WebAssembly och npm med Kshana Studio, MCP-server med plugin och färdigheter, JetBrains-plugin, integrationer) anropar alla en fördelning över varje scenariotyp, som kör en motor med delad kärna, sensorpaket och referenssystem samt områdesmodeller, och skriver ett reproducerbart resultat och diagram" width="900"><br>
  <sub>En fördelning, en motor, reproducerbara utdata · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · källa <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Ytorna: en deterministisk motor utan nätverk matar kommandoraden, Rust-biblioteket, Python, WebAssembly och npm samt MCP-servern; Studio körs på WebAssembly-bygget, plugin-kommandon och färdigheter på MCP-servern, integrationer och driftsättningspaket på kommandoraden, och JetBrains-pluginet på biblioteket" width="900"><br>
  <sub>Varje yta, från samma motor · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · källa <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Inuti en körning: en scenariofil med sitt frö och sin GNSS-tidslinje matar motorn, som per tidssteg utvecklar felmodellen, kör skattaren och poängsätter kvalitetsmåtten, och skriver ett reproducerbart resultat och diagram" width="900"><br>
  <sub>En körnings inre slinga · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · källa <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Mottagarförtroende: en mottagarlogg eller -ström läses in till observabler per epok och mottagarens egna flaggor, passerar övervakarna och blir en rådgivande förtroendepoäng med ett band och skäl, som matar Studio, telemetri, ett signerat bevispaket, poängsättning mot Jammertest och bench, och efterlevnadsrapporten" width="900"><br>
  <sub>Från en mottagarlogg till en förtroendepoäng och det som använder den · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · källa <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="Labbets rundtur: ett scenario exporteras med sina händelser och testförhållanden, en operatör utanför Kshana spelar upp en fil genom en laboratoriesimulator, mottagarloggen poängsätts mot de angivna händelserna, och evidensrundturen länkar scenariots, villkorens och loggens hashar och poängen till ett signerat paket" width="420"><br>
  <sub>Scenario till signerat paket; Kshana producerar eller spelar aldrig upp en signal · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · källa <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: webbläsaren kör motorn kompilerad till WebAssembly lokalt utan att något laddas upp, tar medföljande scenarier eller ett scenario eller en logg du öppnar, och visar resultatet i den enkla vyn, den avancerade vyn och uppgiftssidorna, med exporter som sparas av användaren" width="900"><br>
  <sub>Hur Studio körs, lokalt · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · källa <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Test- och versionsflödet: lokala kontroller (formatering, clippy, kontrollen av att ingen tillskrivning finns, spärren för dokumentationstäckning och scripts/gate.sh, som kör hela sviten och upprepade körningar och skriver det kvitto som pre-push-kroken kontrollerar) leder till en pull request enbart för CI och en grön fullständig CI; ägaren snabbspolar main till den gröna commiten och en annoterad tagg hamnar på den efter kontrollen av versionssynkronisering; versionsarbetsflödet verifierar hela sviten på den taggade commiten innan något publiceras, bygger binärerna med en SBOM, kontrollsummor och byggproveniens, publicerar till crates.io, PyPI, npm, containerregistret, MCP-registret och JetBrains Marketplace, frågar varje register tills det levererar den nya versionen, och startar webbplatsbygget från taggen; en separat väg enbart för webbplatsen startar sidarbetsflödet med taggen main och vägras om inte ingenting utanför web/ och .github/ har ändrats sedan den senaste versionen" width="900"><br>
  <sub>Test- och versionsflöde, från lokala kontroller till en verifierad version och vägen enbart för webbplatsen · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · källa <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="Modulkartan: kommandoraden, Python, WebAssembly, MCP-servern och JetBrains-pluginet anropar den typade fördelningen över varje typ, som når den delade kärnan, tid och referenssystem, sensorpaket, astrodynamik, integritet, spoofingdetektering, fusion, djuprymden och månen, resiliens samt domar- och benchmarkmodulerna, alla underbyggda av verifieringsmatrisen" width="1000"><br>
  <sub>Var koden finns · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · källa <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Distribution: ett kodförråd levererar kärnpaketet, MCP-servern, IDE-pluginet och korskontrollpaketen till crates.io, PyPI, npm, GitHub Releases, Pages-lekplatsen, containerregistret, MCP-registret och JetBrains Marketplace, med ett Zenodo-arkiv" width="900"><br>
  <sub>Vad som levereras var, och vad som kontrollerar det · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · källa <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## AI-assistent

[`kshana-mcp`](mcp/kshana-mcp/) är en MCP-server: din assistent kör den faktiska motorn och
läser tillbaka dess JSON, i stället för att gissa matematiken. Vart och ett av dess 49 verktyg är ett tunt omslag
kring en publik funktion i biblioteket `kshana`, så ingen simuleringslogik finns i servern.

### Installera MCP-servern

> Rådgivande, inte typgodkänd navigationsutrustning: operatören är fortsatt ansvarig för navigeringen.
> Servern körs på din dator; ingenting skickas till Ashforde OÜ.

Välj valfri kanal. Varje länk och varje utdrag genereras från ett skript
(`scripts/gen_mcp_install.py`) och kontrolleras i kontinuerlig integration; utdrag för Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI och Continue finns i
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Kanal | Kommando eller knapp | Kräver | Låst form |
|---|---|---|---|
| Tillägg för Claude Desktop | dubbelklicka på `.mcpb` för ditt system: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | inget | `kshana-mcp-<target>.mcpb` för v0.40.0 |
| Cursor (ett klick) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node eller Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (ett klick) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node eller Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · plugin: `/plugin marketplace add ashfordeOU/kshana` därefter `/plugin install kshana@ashforde` | Node (eller Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ med uv eller pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | formel för v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` därefter `scoop install kshana-mcp` | Scoop (Windows) | manifest för v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Förbyggd binär | [versionssidan](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, kontrollerad med `SHA256SUMS` och `gh attestation verify` | inget | v0.40.0 |
| MCP-register | `io.github.ashfordeOU/kshana-mcp` (hittas av registermedvetna klienter) | en registermedveten klient | `0.40.0` |
| Fjärr (strömmande HTTP) | `kshana-mcp --http 127.0.0.1:8080`, egen drift: se [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | din egen värd | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp på Glama, kvalitetspoängen för dess MCP-server"></a></p>

I Claude Code kommer samma server som ett plugin: `/plugin marketplace add ashfordeOU/kshana`, därefter
`/plugin install kshana@ashforde`. Pluginet lägger till snedstreckskommandon över verktygen: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` och `/kshana-jammertest`. Verktygen för fartygsförtroende matar integrationerna för Signal K och
OpenCPN: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

Konfiguration per klient finns i [`docs/integrations.md`](docs/integrations.md). Servern är listad
i det officiella MCP-registret som `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>De 49 verktygen</summary>

<br>

**Scenarier och rapporter**

| Verktyg | Vad det gör |
|---|---|
| `run_scenario` | Kör ett scenario från en definition i TOML (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | De 92 inbyggda scenariotyperna med beskrivningar + obligatoriska/valfria fält — så att agenten kan konstruera ett giltigt scenario |
| `validate_scenario` | Förkontroll: tolka TOML-texten och identifiera dess typ, utan att köra |
| `list_example_scenarios` | De medföljande referensscenarierna som JSON |
| `get_example_scenario` | TOML-texten för ett medföljande referensscenario, byte för byte filen under `scenarios/` |
| `report_scenario` | Kör ett scenario och returnera dess rapport |
| `animate_scenario` | Kör ett scenario och returnera dess tidsserie som en animering |
| `sky_geometry` | Himmelsgeometri under en azimutberoende skyline: synliga och dolda satelliter, DOP, kovariansen öst-nord-upp och den horisontella felellipsen; eller ett skyline-förval med dess proveniens |

**Export och interoperabilitet**

| Verktyg | Vad det gör |
|---|---|
| `list_export_formats` | Vilka interoperabilitetsformat som gäller för ett scenario (`czml`, `kml`, `geojson`, `stk`, `sigmf`), skälet när ett inte gör det, och vilken specifikation varje skrivare följer |
| `export_interop` | Exportera ett scenario som CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemerid (Systems Tool Kit) `.e`, eller SigMF (Signal Metadata  |
| `import_route` | Skriv en GeoJSON-rutt `LineString` in i ett scenario som flyger ett spår av vägpunkter (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`) och returnera den nya TOML-texten |
| `export_sp3` | Exportera konstellationen i ett `orbit`-scenario som precis efemerid i SP3-c (Standard Product 3, revision c) |
| `export_omm` | Exportera elementen i ett `orbit`-scenario som en katalog enligt CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message) |
| `export_oem` | Exportera tillståndsserien i ett `orbit`-scenario som efemerid i CCSDS OEM (Orbit Ephemeris Message) 2.0 — TEME-positionen (sann ekvator, medeldagjämning) *och*  |
| `export_table_csv` | Kör ett scenario och returnera dess reproducerbarhetstabell som CSV (kommaseparerade värden) — den bytestabila tabell som CLI:t (kommandoradsgränssnittet) skriver som `<scenario>.table.csv` |
| `export_test_bench` | Ett scenarios fordonsrörelse och händelser för en GNSS-simulator i laboratorium (`kshana bench-export`) |

**Mottagar- och fartygsförtroende**

| Verktyg | Vad det gör |
|---|---|
| `assess_receiver_log` | Bedöm förtroendet för en verklig logg från en GNSS-mottagare (globalt satellitnavigeringssystem) |
| `assess_vessel_stream` | Poängsätt ett begränsat utdrag ur NMEA 0183 (högst 2 MiB och 20,000 epoker |
| `assess_vessel_log` | Ett fartygs NMEA 0183-logg (högst 4 MiB) som en batchkörning, med sessionens TOML som anger fartygets gränser |
| `create_evidence_pack` | Ett signerat bevispaket för ett fönster ur ett fartygs logg (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Knyt en tidsstämpeltoken enligt RFC 3161 (base64 av byten i `.tsr`) till ett paket, i minnet (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Verifiera ett paket (`kshana evidence verify`) |
| `generate_training_nmea` | Syntetisk NMEA 0183 för bryggan för utbildning av besättning från en `nmea-scenario`-TOML (jamming, positionsavdrift, tidsspoofing, uppspelningsfördröjning) med instruktörsloggen (`kshana-nmea-training/1`) |
| `build_interference_map` | En GNSS-störningskarta från positionsrapporter från ADS-B eller AIS som CSV-text (högst 4 MiB) |
| `route_exposure` | Andelen av en rutts längd i försämrade, inte försämrade, obedömda och inte observerade celler på en eller flera störningskartor, valfritt inom ett datumintervall |
| `trust_telemetry` | En förtroendeström (JSON-rader) eller ett `receiver-trust`-resultat återgivet som Prometheus-text, syslog-rader i CEF eller LEEF eller en OTLP JSON-nyttolast, med kodarna i `kshana trust-telemetry` |
| `jammertest_import` | Läs den publicerade testkatalogen och sändningsplanen för Jammertest (NPRA/jammertest-plan, MIT) som schemalagd sanning (`kshana jammertest import`): ett testområdes tidsfack blir händelser för mottagarförtroende med katalog-id och år i varje etikett. Planerade tidsfack, inte registrerade sändningstider; inget kontaktfält i planen läses. MODELLED. Se [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Poängsätt en mottagarlogg mot det schemat (`kshana jammertest score`): per test detekteringslatensen, missade larm och tid till återhämtning, samt falsklarmen utanför varje tidsfack. Textloggar som `log`, binära (`ubx`, `sbf`) som `log_base64`. Ett signerat paket kräver en nyckel: kommandoraden. Endast rådgivande; MODELLED. |
| `fit_imu_log` | Accelerometer- och gyroparametrar för scenarierna `hybrid` och `fusion` anpassade från en stillastående IMU-logg (CSV eller EuRoC) med Allan-avvikelse, med en `[accel_classical]`-tabell färdig att klistra in och loggens SHA-256 (`kshana imu-fit`). Text in, JSON ut; MODELLED. |

**GNSS IQ (filer i arbetskatalogen; avstängt i HTTP-läge)**

| Verktyg | Vad det gör |
|---|---|
| `iq_signals` | Konfigurationen av GNSS IQ-lagret |
| `iq_info` | Beskriv en IQ-inspelning (i fas och kvadratur) i arbetskatalogen utan att bearbeta den |
| `iq_scene` | Generera en GNSS IQ-scen med flera satelliter i arbetskatalogen (`kshana iq scene`) |
| `iq_acquire` | FFT-infångning (snabb Fouriertransform) av en eller flera PRN (pseudoslumpbruskoder) över en inspelning (`kshana iq acquire`), valfritt bakom frontsteg |
| `iq_track` | Infånga och spåra sedan med bänken av DLL/PLL/FLL (fördröjnings-, fas- och frekvenslåsta slingor) (`kshana iq track`), med slingorna från en `kshana.loop-desig |
| `iq_frontend` | Tillämpa mottagarfront och DSP för störningsbegränsning (digital signalbehandling |
| `iq_sweep` | Spela upp en IQ-inspelning i arbetskatalogen över flera designer av spårningsslingor (`kshana iq sweep`) |
| `iq_monitor` | Kör övervakarna för detektering av störning och spoofing över en IQ-inspelning i arbetskatalogen (`kshana iq monitor`) |
| `iq_labfit` | Anpassa spårningsslingans modell för låsförlust till labbkörningar (`kshana iq labfit`) från ett `iq-labfit`-scenario vars loggar är inbäddade (`text` eller `base64` |
| `iq_test_conditions` | Validera en fil `kshana.test-conditions/1` given som text och returnera de upplösta villkoren med deras hash |
| `iq_campaign` | Kör en kampanj med labbuppspelning (`kshana iq campaign`) |
| `iq_campaign_status` | Förloppet för en kampanjs utdatamapp |

**Mappning för efterlevnad**

| Verktyg | Vad det gör |
|---|---|
| `compliance_report` | Mappningen mot offentliga ramverk ifylld från resultatdokument givna som text (`kshana compliance-report`) |
| `compliance_mapping` | De statiska mappningstabellerna (eller, med `sources`, de källdokument de hänvisar till med versioner och URL:er) som Markdown, inledda av samma uttalande |
| `list_standards_packs` | Standardpaketen (`kshana standards-pack list`): poängsatta scenariouppsättningar för testprofilerna i DHS ramverk för Resilient PNT, IMO MSC.1/Circ.1575 och ICAO Doc 9849 Appendix F |
| `run_standards_pack` | En paketkörning mot trösklar som angetts före körningen: varje test `MET`, `NOT MET` eller `NEEDS INPUT`; MODELLED, betygsätter ingen produkt |
| `lunanet_afs_check` | LunaNet Augmented Forward Signal kontrollerad mot LNIS V5 AD1 Volume A (LSIS-AFS V1.0): koderna mot de tryckta tabellerna, eller en symbolström mot ramformatet; LDPC och CRC-24Q i delramarna 2 till 4 verifieras inte |
| `create_round_trip_pack` | Det signerade paketet för labbets rundtur: scenario, dokumentet `kshana.test-conditions/1`, mottagarlogg och poäng länkade via hash |

**Benchmark**

| Verktyg | Vad det gör |
|---|---|
| `score_benchmark` | En inlämning till kshana-bench poängsatt mot en facitfil, båda som JSON-text (`kshana bench score`, `bench/SPEC.md`): resultatfilen med specifikationsversion, delmängd, indatahashar och uppgiftens mått. MODELLED; beskriver en logg eller en korpus, aldrig en produkt. |
| `render_leaderboard` | Resultatfiler från kshana-bench återgivna som den statiska topplistesidan (HTML-text), var och en validerad först. |

</details>

<a id="editions"></a>
## Utgåvor

Hela motorn är fri. Kshana Pro och anpassade studier är för program som behöver mer,
och varje betald väg börjar med ett meddelande: det finns inga priser här.

| | Free | Kshana Pro | Anpassad studie |
|---|---|---|---|
| Vad det är | hela den öppna motorn, alla 92 scenariotyper, ingen funktionsspärr | ett proprietärt överlägg på samma motor, under kontrakt | en MODELLED studie av PNT-resiliens för ditt system, utförd åt dig |
| Licens | AGPL-3.0 (GNU Affero General Public License, version 3), eller en kommersiell licens | proprietär | kontrakt |
| Hur man börjar | [installera](#install) eller öppna [kshana.dev](https://kshana.dev) | [begär en utvärdering av Pro](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [begär en studie](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Vad Pro är, med orden i [`docs/PRO.md`](docs/PRO.md):

> **En strikt övermängd av öppna Kshana.** Pro beror på den öppna motorn som bibliotek och
> förgrenar den aldrig. Varje öppen scenariotyp körs oförändrad i Pro, och ett öppet scenario körs
> i Pro utan någon licens alls.
>
> **Ingen ny fysik.** Pro lägger inte till någon fysikalisk modell och ändrar ingen. Varje tal i Pro kommer
> från körningar av den öppna motorn, så en siffra från Pro är lika tillförlitlig som den öppna scenariotyp
> den kom från, och aldrig mer.

Pro besvarar ett programs nästa frågor: vilken design som ska flygas (en designoptimerare och dess
Pareto-front), hur säkert svaret är (osäkerhet och känslighet), och om uppdraget
uppfyller sina krav (en uppdragsdokumentation, kravspårbarhet, avvägningsstudier, en
regressionskontroll av scenarier, digitala tvillingar av klockor, en studiedokumentation och en lokal
tjänst). Den bevakar också en kampanj av siffror och fäller en pipeline när en blir sämre,
testar kandidatsignalplaner mot de öppna satellitnavigeringssignalerna i båda
riktningarna (spektrumsamexistens), och köar studier i en lokal jobbtjänst med ett
hashkedjat leveransregister. Var och en beskrivs, med vad den producerar och vad den inte gör, i
[`docs/PRO.md`](docs/PRO.md). Ingenting som Pro producerar är en certifiering, och en anpassad studie är
inte heller en certifiering.

<details>
<summary>Vad Kshana Pro läser från den öppna motorn, och support från Ashforde® OÜ</summary>

<br>

**Vad Kshana Pro bygger på.** Varje del av Pro arbetar utifrån den öppna motorn och lämnar
den oförändrad:

- **Designoptimeraren, osäkerhetsstudien och uppdragsdokumentationen** kör scenarier i den öppna
  motorn genom motorns publika gränssnitt och beräknar varje tal utifrån körningarnas
  resultat. Varje utdata behåller den nivå VALIDATED, MODELLED eller PARTNER som den öppna motorn gav
  varje siffra, aldrig en högre.
- **Digitala tvillingar av klockor** använder den öppna motorns klockmodell och dess skattare för Allan-
  avvikelse: en tvilling kalibreras mot enhetens publicerade Allan-budget och kontrolleras sedan genom
  att skatta tvillingens Allan-avvikelse med den öppna skattaren.
- **Avvägningsstudier** kör varje arkitekturalternativ som ett scenario i den öppna motorn, oförändrat,
  och rangordnar alternativen efter ett kvalitetsmått som läses ur varje körnings resultat.
- **Kampanjbevakning** läser sina siffror ur resultaten av körningar i den öppna motorn av
  scenarierna i ett paket, och jämför dem med den föregående godkända körningen.
- **Spektrumsamexistens** läser varje fysikaliskt tal ur körningar i den öppna motorn av
  typerna `leo-signal` och `constellation-design`, och lägger bara till summan över satelliterna
  i sikte och rangordningen av planerna.
- **Den lokala jobbtjänsten** kör öppna scenarier och Pro-scenarier genom samma motor och
  lagrar varje resultat så som körningen returnerade det.
- **Bevispaket** registrerar, för varje körning, den scenariohash som den öppna motorn stämplar på
  sitt resultat, så att en siffra i ett paket kan reproduceras genom att köra dess scenario igen.
- **Verktyg för systemteknik och program.** Kshana Pros verktyg för modellbaserad
  systemteknik (MBSE) och program kontrollerar ett programs krav
  mot körningar av den öppna motorn: det importerar krav som kommaseparerade värden
  (CSV), eller som en dokumenterad delmängd av Requirements Interchange Format (ReqIF) eller av
  text i Systems Modeling Language version 2 (SysML v2), utvärderar varje acceptans-
  kriterium, med sin enhet, mot de värden en körning skrev, och producerar en verifierings-
  korsreferensmatris (VCRM), en SysML v2-modell, en rapport om ändringspåverkan och ett offline-
  bevispaket. Det kör inte om och räknar inte om något, och läser bara det som den öppna motorn
  publicerar: varje körnings `result.json` (de fält ett kriterium namnger, deras enheter,
  reproducerbarhetsstämpeln med scenariohash, frö, motorversion och schemaversion, samt
  körningens etikett och siffrornas nivåer), dess `report.json` (typ, reproducerbarhetspost och
  förmågeetiketter), scenariofilen (dess hash, typ, frö och parametrar), schemat för
  fältenheter (varje fälts enhet, proveniens och evidensnivå) och
  verifieringsmatrisen (varje förmågas etikett VALIDATED, MODELLED eller PARTNER).

<a id="support--professional-services"></a>
### Support och professionella tjänster

Kshana är fri och öppen källkod under AGPL-3.0 och **professionellt utvecklad och
underhållen av Ashforde® OÜ** (Estland). Den öppna motorn är komplett och användbar på
egen hand. För organisationer som behöver mer erbjuder Ashforde® OÜ:

- **Kommersiell support och integration** — inbäddning av Kshana i din verktygskedja, anpassade
  scenarier och prioriterade rättningar.
- **Anpassade sensormodeller** — kalibrerade mot din hårdvara, inklusive exportkänsliga
  resiliensmodeller som underhålls i ett privat överlägg.
- **Kshana Pro** — proprietära verktyg för modellbaserad systemteknik (MBSE) och program
  som kontrollerar ett programs krav mot körningar av den öppna motorn och
  producerar en verifieringskorsreferensmatris (VCRM), en modell i Systems Modeling Language
  version 2 (SysML v2), en rapport om ändringspåverkan och ett offline-bevispaket. Det
  kör inte om något och läser bara motorns publicerade utdata: varje körnings `result.json`
  och `report.json`, scenariofilen, schemat för fältenheter och verifierings-
  matrisens etiketter (hela listan finns under [Utgåvor](#editions)).
- **Kshana Pro-verktyg för design, osäkerhet och uppdrag** — Pareto-fronten för ett design-
  rum, osäkerhet och känslighet över tusentals körningar, och en uppdragsdokumentation med ett kommando
  med en verifieringsmatris och en PDF; se [`docs/PRO.md`](docs/PRO.md).
- **Kshana Pro kampanjbevakning, spektrumsamexistens och jobbtjänst** — en pipeline som
  fallerar när en bevakad siffra blir sämre, signalplaner testade mot de öppna
  satellitnavigeringssignalerna i båda riktningarna, och en lokal jobbkö med ett
  hashkedjat leveransregister; se [`docs/PRO.md`](docs/PRO.md).
- **Utbildning och konsultverksamhet** inom prestandaanalys av kvant-/klassisk PNT.

Detta är open core-modellen: motorn är, och förblir, öppet licensierad; den bärande
verksamheten är expertis, support och de proprietära tilläggen — inte licensavgifter.
Kontakt **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Forskning

Studier byggda på den öppna motorn publiceras på arXiv. Var och en namnger det motorkommando
som ligger bakom, så att dess tal kan genereras på nytt från ett incheckat scenario eller studieexempel.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Forskning byggd på den öppna motorn: sex artiklar på arXiv, där varje kort namnger artikeln, dess datum och kategori, och det motorkommando som genererar dess tal på nytt. Samma sex artiklar, med länkar och kommandon, finns i tabellen nedan." width="100%">
</picture>

| Artikel | Vad den visar | Motorkommando |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | Fallet i en GNSS-störningsdetektors poäng när förhållandena förskjuts kan förutsägas enbart utifrån statistik inom fördelningen, på en öppen syntetisk testbädd och därefter på öppna fältinspelningar. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | En GNSS-tidsmottagare under spoofing har ingen ändlig ovillkorlig gräns för odetekterat tidsfel, så artikeln ger en villkorlig gräns, kalibrerad på en inspelad spoofing i luften från den publika kampanjen JammerTest 2024. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | En enda sammansatt resiliensbedömning är en stabil grund för ett beslut endast där en design dominerar; där designer konkurrerar kan enbart en omviktning ändra vinnaren. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Avståndsmätning inom en månkonstellation lämnar en ytstations absoluta position oobserverbar; en fördröjning från interferometri med mycket lång baslinje (VLBI) från jorden återställer den när konstellationen är gles, och skärper den när den är rik. | typen `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Planerade konstellationer med fyra till sex satelliter ger dålig geometri vid månens sydpol, och några avståndsfyrar på ytan åtgärdar det mycket billigare än fler satelliter. | typen `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Precisionsutspädning är odefinierad för cislunär spårning med enbart avstånd, eftersom hastigheten är oobserverbar i en ögonblicksbild, så artikeln använder observerbarhetsgramianen på fyra plana avlägsna retrograda banor: enbart avstånd har rang 2 av 4 i en ögonblicksbild och behöver en båge på omkring 2.09 h för att bli fullt observerbar, med konditionering som förbättras när bågen förlängs; avståndshastighet (doppler) ger rang 4 omedelbart; och samskattning av en station med satellittillstånd och klockor förblir rangdefekt med ett om inte en extern interferometrisk observabel läggs till. Krav hör hemma i budgetar för båglängd, konditionering och mättyp, inte DOP. | typen `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (dess syskon `cislunar-arc-recovery` testar tröskeln med en oberoende skattare med ändliga differenser) |

De tre studieexemplen skriver bytedeterministiska artefakter (fasta frön) som registrerar sin
motorversion, frön och en konfigurationshash. De tre artiklarna om månen och cislunärt är byggda på
månsviten (varje dels evidensnivå finns i verifieringsmatrisen); deras påståenden om geometri och precisionsutspädning korskontrolleras också
mot separata referenser i `tests/validate_p*.rs`. Mer i
[Reproducerbara studieartefakter](#reproducible-study-artifacts) under Referens.

<a id="cite"></a>
## Citera

Om du använder Kshana i akademiskt eller tekniskt arbete, citera den version du använde, med
scenariot och fröet. [`CITATION.cff`](CITATION.cff) innehåller maskinläsbara metadata, och
GitHub visar en knapp "Cite this repository" utifrån den. Varje version arkiveras på Zenodo;
koncept-DOI:n (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) pekar alltid på den
senaste versionen.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Artiklarna ovan:

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

Kshana har dubbla licenser: GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)), eller en
**kommersiell licens** från Ashforde® OÜ för sluten integration som AGPL inte passar.
[`LICENSING.md`](LICENSING.md) förklarar vilken som gäller. Bidrag licensieras inkommande
under AGPL och ger också Ashforde® OÜ rätten att ta med dem i den kommersiella
utgåvan; signera varje commit med `git commit -s` (se [`CONTRIBUTING.md`](CONTRIBUTING.md)).
"Kshana" och dess märken är varumärken som tillhör Ashforde® OÜ: licensen täcker koden, inte
namnet, så döp gärna om förgreningar.

<a id="reference"></a>
## Referens

Det långa materialet, hopfällt. Varje dokument listas i [Dokumentation](#documentation).

<details>
<summary>Installera och bygga från källkod</summary>

<a id="install--build"></a>
### Installera och bygga

Kräver en Rust-verktygskedja (≥ 1.88, `rust-version` i Cargo.toml; utvecklad på 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Användning: kommandoraden i sin helhet</summary>

### Användning

Kör valfritt scenario; CLI:t fördelar efter scenariots fält `kind` och skriver
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` och
`<scenario>.report.json` bredvid det — plus `<scenario>.table.csv` för de typer som
publicerar en tabell. Rapporten (en sida i HyperText Markup Language (HTML) och ett JSON-dokument
med samma innehåll) innehåller en sammanfattning för beslutsfattare, varje indata med sin enhet,
resultaten och diagrammen, en kampanjs tabeller för svep, Monte Carlo eller kedja, en händelsetidslinje,
etiketten VALIDATED / MODELLED / PARTNER och källan för varje förmåga som körningen använde,
det som inte är modellerat, och en reproducerbarhetspost (motorversion, sammandrag med Secure Hash
Algorithm 256-bit (SHA-256), frö, plattform och det exakta kommandot). Den skrivs ut till
en ren PDF-fil (Portable Document Format) från webbläsaren på A4- eller Letter-papper; motorn
skriver ingen PDF själv. Se [`docs/REPORTS.md`](docs/REPORTS.md).

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
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), efemerider i Ansys STK (Systems Tool Kit) `.e`
och inspelningar i SigMF (Signal Metadata Format) bredvid scenariot, och
`--import-route <route.geojson>` matar en GeoJSON-linje in i de typer som flyger ett spår. Varje
format valideras mot sin publicerade specifikation, och ett scenario som ett format inte
gäller för säger varför: se [docs/INTEROP.md](docs/INTEROP.md).

**Andra CLI-lägen** — granska ett scenario, mata in verkliga data om jordorientering eller kör en hel svit:

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

**Export av animering.** `--animate svg|html|frames|all` skriver `<scenario>.animation.svg`
(nyckelbildrutor i Cascading Style Sheets (CSS), inget skript), `<scenario>.animation.html` (spela, pausa, skrubba, hastighet och
synkroniserade paneler, utan extern resurs) och `<scenario>.frames/` (`frame_0000.svg`, … plus
`manifest.json` med bildrutor per sekund och varaktighet). En kampanj spelar upp sina faser och
larm, en spektrumkörning sitt vattenfall; temat följer `prefers-color-scheme` och
`prefers-reduced-motion` visar den färdiga bilden. Den återger körningens egna sampel,
byteidentiska vid en ny körning, och tillför ingen evidens. Se [docs/ANIMATION.md](docs/ANIMATION.md).

Ett manifest för en **svit** är en liten TOML-fil (Tom's Obvious, Minimal Language) — en `title` och en vektor `scenarios = [ … ]` med
scenariosökvägar — som motorn kör i tur och ordning, och viker in varje resultat (med dess
etiketter MODELLED / VALIDATED) i en självbeskrivande studieartefakt. Se
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Roll för interoperabilitet.** Kshana är lagret för *prestandasimulering* som står
bredvid verktygskedjan för efterbearbetning, inte en ersättning för den: mata dess **RINEX**-
utdata till RTKLIB eller gLAB för en positionslösning, och använd dess **SP3**-utdata som en
produkt för precisa banor i verktyg som Ginan — Kshana besvarar *vilken resiliens en given
PNT-arkitektur ger* innan du har verkliga signaler, i format som dessa verktyg redan
läser in (`--export-sp3`, eller `export_sp3 = true` i ett `orbit`-scenario, skriver
`<scenario>.sp3`). Samma bana kan publiceras som standardiserade medelelement i **CCSDS OMM**
(`--export-omm`, eller `export_omm = true`, skriver `<scenario>.omm`) —
ett OMM 502.0 KVN-meddelande (nyckelord = värde-notation) per TLE-definierad satellit, med varje objekts verkliga
katalognummer från NORAD (North American Aerospace Defense Command), internationella beteckning från COSPAR (Committee
on Space Research) och epok, för valfri
OMM-medveten mottagare i stället för en specialanpassad tvåradselementuppsättning.

Exempel på utdata (klock-holdover — notera hur kvalitetsmåtten Integrity och Security rapporteras):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

Den optiska klockans tidsfel vid 95:e percentilen (p95) är 1.20e-4 ns: sammanfattningen
skriver små värden med signifikanta siffror i stället för att avrunda dem till `0.0`.
`security` visar `n/a (no attack)` eftersom detta scenario inte konfigurerar någon attack, så det
finns inget att detektera. JSON-resultatet bär ändå varje klockas analytiska
gräns för spoofingdetekterbarhet i `fom.security` (0.997 för den optiska klockan, 0.000 för
atomklockan i chipskala, vars eget brus över övervakningsfönstret överskrider specifikationen
på 20 ns), och dess block `figure_tiers` markerar den siffran `applicable: false`. Scenario-
typen `spoof` poängsätter detektering mot en injicerad attack. `figure_tiers` ger också
varje rapporterad siffra dess verifieringsnivå — VALIDATED (kontrollerad mot en extern
referens) eller MODELLED — och den rad i verifieringsmatrisen som nivån läses från. Banscenariot
rapporterar dessutom ett geometriblock — andelen sampel med positionsbestämning, och
bästa/median-värdet för positionens precisionsutspädning (PDOP) och positionsnoggrannhet — bredvid
klockresultatet.

> **Läs dessa två tal noggrant.** `security` är en *analytisk gräns för spoofing-
> detekterbarhet* härledd ur varje klockas stabilitet — den är meningsfull endast mot ett
> konfigurerat spoofingscenario och är **inte** en RAIM-detektor för flera satelliter. `integrity`
> här är filtrets *självkonsistens* (andelen avbrottssampel inom dess egen k-sigma-
> gräns), **inte** en integritetssiffra för HPL/VPL inom luftfart. Se
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> För verklig mottagarautonom integritet kör **scenariotypen `integrity`**
> (`scenarios/integrity-raim.toml`) verklig RAIM med ögonblicksbild och lösningsseparation
> (ARAIM-liknande) över den propagerade konstellationsgeometrin: den beräknar
> horisontella/vertikala **skyddsnivåer (HPL/VPL)** per epok och rapporterar
> andelen epoker som uppfyller de konfigurerade larmgränserna, med ett Stanford-
> integritetsdiagram för klassificering av fel mot PL (skyddsnivå).

<a id="reproducible-study-artifacts"></a>
#### Reproducerbara studieartefakter

Fyra öppna studier genererar var och en på nytt en bytedeterministisk artefakt (fast frö) från ett
kommando — talen bakom studierna av korsningen kvant mot klassisk, optimismgapet vid RF-försämring,
bedömning av PNT-resiliens och skyddsnivå för tidssynkronisering:

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

Varje artefakt registrerar sin motorversion, sina frön och en konfigurationshash och bär en ärlig
etikett MODELLED/VALIDATED. Sonderna för verkliga data (`*_probe`) kör samma pipeline över
inspelningar som du tillhandahåller lokalt; inga datamängder levereras i kodförrådet. Studien av optimismgapet vid
RF-försämring är beskriven i förtrycket
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), och den villkorliga skyddsnivån för tidssynkronisering
(`tpl_jammertest` ovan) i förtrycket
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (se [Citera](#cite)).

De publicerade studierna om PNT på månen ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP med ytfyrar, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) VLBI-
observerbarhet och [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) cislunär observerbarhet
efter båglängd) har sina påståenden om geometri, precisionsutspädning, prediktion av referenssystem i realtid /
jordorienteringsparametrar (EOP), avlägsna retrograda banor och RF-avståndsmätning
oberoende korskontrollerade i
`tests/validate_p*.rs` mot separata referenser (`scipy.special.j1`, en oberoende NumPy-lösning av
`(HᵀH)⁻¹` för DOP, en ny NumPy-tolkning av samma IERS-rader `finals2000A`, och
NASA/JPL:s Three-Body Periodic Orbit Database). Detta är ytterligare regressionskontroller över
den **modellerade** månsviten; de ändrar inte antalet i den maskinkontrollerade matrisen.

</details>

<details>
<summary>Scenarioformat</summary>

<a id="scenario-format"></a>
### Scenarioformat

Scenarier är deklarativ TOML. En `kind` på toppnivå väljer paketet — **femtio** totalt
(`clock` är standard om den utelämnas): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (testbädd för AI/ML-utvärdering av detektering av RF-
försämring — märkt syntetisk korpus + detektoroberoende ROC/AUC-rigg +
optimismgap inom/utanför fördelningen), `quantum-trade` (avvägning kvant mot klassisk PNT
med inläsning av uppmätt ADEV + envelopp för resiliens utan GNSS; MODELLED),
`space-weather` (index för sol/geomagnetism + exosfärisk temperatur enligt Jacchia-71 +
aktivitetsdriven termosfärisk densitet över den statiska atmosfären; MODELLED),
`oem-interop` (CCSDS OEM-brygga för import/rundtur för efemerider från GMAT/Orekit/STK;
MODELLED), uppdragsanalystrion `launch-window` (uppskjutningsazimut i tvåkropp /
planändring / tillfällen), `reentry` (ballistisk återinträdeskorridor enligt Allen-Eggers),
`eo-coverage` (geometri för EO-svepbredd / GSD / åtkomst / återbesök), `space-packet` (inramning av
Space Packet enligt CCSDS 133.0 TM/TC — telemetri/telekommando — exakt bitlayout, rundtursverifierad), och
`attitude-budget` (3-DOF moment från gravitationsgradient + RSS-felbudget för pekning),
`passes` (prediktion av uppgång/nedgång för passager över markstationer — AOS/TCA/LOS, maximal elevation,
åtkomst), och `link-budget` (enkelriktad länkekvation enligt CCSDS/DSN — FSPL / Eb·N₀ /
marginal / slutning); `telecom-timing` (tidsfel under holdover, MTIE och TDEV kontrollerade
mot ITU-T-masker); `spectrum` (hela GNSS L-bandet som en spektral effekttäthet:
ett vattenfall frekvens mot tid under en skriptad tidslinje för störsändare med kontinuerlig våg, smalband, chirp eller
anpassat brus, förhållande störsändare till signal per band och effektiv
bärvåg-till-brustäthet från koefficienten för spektral separation, och in- och utdata av inspelningar i Signal Metadata
Format (SigMF) med spektralskattningar enligt Welch; signal-
spektra VALIDATED mot läroboksvärden, störsändarscenariot MODELLED; se
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); samma typ ritar paneler för UHF-, S- och C-bandet med
designade signaler i låg omloppsbana); `leo-signal` (signaldesigner för positionering, navigering och
tidssynkronisering i låg omloppsbana för valfritt system: bandbegränsade spektra, jitter i kodspårning och
avståndsnoggrannhet, infångningssökning och -tid, spektral separation mot GPS och Galileo, tålighet mot
störsändare och en avvägning från UHF till C-bandet, från publika förval som Xona Pulsar, Iridium,
Starlink och CentiSpace eller inbäddade designer; de slutna formerna och LEO-dopplern VALIDATED,
designerna MODELLED; se [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (solen, planeterna, Pluto, månen och sju stora
månar vid en epok — positioner, konstanter, ljustider och banspår; planetpositioner
VALIDATED mot JPL Horizons) och `body-pnt` (positionering kring valfri av dessa himlakroppar med en
lokal navigeringskonstellation och en djuprymdslänk från jorden; MODELLED); `campaign` (befintliga typer sammansatta till en kedjad uppdragstidslinje
med tillstånd som lämnas mellan faser, ett parametersvep, en Monte Carlo-ensemble med frö, eller
flera scenarier under ett delat villkor; MODELLED, se
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (Walker-delta- och stjärn-
mönster, elementlistor och designer med flera skal med förval för GPS, Galileo, BeiDou och GLONASS,
samt täckning och precisionsutspädning över ett rutnät av latitud/longitud;
generatorn och global DOP för GPS VALIDATED mot de publicerade tjänstedokumenten, se
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (en satellitpassage för
positionering, navigering och tidssynkronisering (PNT) i låg omloppsbana (LEO) och dess länkbudget band för
band, från valfri konstellation och valfri signaldesign: siktvinklar, doppler och dopplerhastighet,
ITU-R-förluster för regn, gas, scintillation och inträngning i byggnader, bärvåg-till-brustäthet mot
MEO GNSS-satelliterna i sikte, jonosfären av första ordningen och jonosfärsfria par, och en
budget för positionsbestämning med låg energi, jonosfärssondering från varje bandpar, och spoofingövervakare via
konsistens i doppler och passagegeometri och via konsistens mellan band; ITU-R-termerna och
dopplerenveloppen för en stillastående användare VALIDATED, passagen MODELLED, se
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (det sända
efemerid- och klockmeddelandet från en PNT-satellit i låg omloppsbana (LEO), för valfri bana och
bärvåg: en anpassare från en integrerad sann bana till Galileos keplerska uppsättning, den uppsättningen
med korrektionspolynom längs spåret, tvärs spåret och radiellt, 22-parametersmodellen enligt Liu et al. 2025
eller ATOMIC:s ECEF-polynom utan klocka; avståndsfel för signal i rymden
(SISRE) mot anpassningsintervall och uppdateringsperiod, en kontinuitetskontroll för uppdatering mitt i passagen,
Kshanas egen dokumenterade binära ram med en cyklisk redundanskontroll CRC-24Q och en kvantiseringsbudget, och ett
block i stil med RINEX-4 märkt som en Kshana-utvidgning; SISRE-vikterna, Galileos användar-
algoritm och CRC-24Q VALIDATED, anpassningarna MODELLED; valfria förval för Xona Pulsar,
Iridium, Starlink, CentiSpace, ett representativt C-bandssystem, ATOMIC och Celeste IOD; se
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); trion för **fusionerad MEO + LEO
PNT** `leo-pvt` (dopplerpositionering från avståndshastighet i låg omloppsbana (LEO), gemensamma
positionsbestämningar med pseudoavstånd från GNSS + LEO med bias mellan system och DOP mot antalet LEO-
satelliter, täckning i polar- och Arktisområden, och tidsöverföring till UTC via LEO — över valfri konstellation,
med valfria förval som Xona Pulsar, Iridium och Starlink-signaler som tillfällighetssignaler;
LEO-dopplerenveloppen VALIDATED mot publicerade siffror för Iridium och Xona), `leo-ppp`
(konvergens för precise point positioning med enbart GNSS och med LEO-förstärkning, jämförd
med Li et al. 2019) och `ntn-positioning` (positionering i icke-markbundna 5G-nät från
Cramér-Rao-gränsen för signalens bandbredd), MODELLED utom den enveloppen, se
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (ett LEO-PNT-system från början till
slut: en `leo-signal`-design buren av ett `leo-pass`-band, passagens C/N0 och navigerings-
meddelandets avståndsfel för signal i rymden lämnade till en fusionerad `leo-pvt`-positionsbestämning och `leo-ppp`-
konvergens, varje överlämning listad; MODELLED, se
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), som också är översikten över
varje LEO-PNT-typ och scenario, inklusive resilienskampanjerna, ett scenario per
fokusområde för experiment och ett per slutanvändarvertikal); **PNT-sviten för månen** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; **demonstratorn för kvantaktiverad PNT**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; och forskningstyperna för
**signalsäkerhet, cislunärt och resiliens i lager** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — uppdragsanalystrion och dessa senare typer alla MODELLED
(var och en med en validerad kärna i sluten form; se matrisen).
Gemensamma fält: `seed`, ett `[time]`-rutnät, en `[gnss]`-tidslinje för tillgänglighet (det som driver
avbrottet), och block per sensor med `provenance`-strängar som anger källan för varje
siffra. Exempel (clock):

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

Valfria fält (avstängda när de saknas): en klocka kan lägga till `flicker_floor` (1/f FM — frekvens-
modulering — Allan-golv); en tröghetssensor kan lägga till `gyro_bias` och `q_arw` (gyrobias och vinkel-
slumpvandring), samt `bias_instability` och `q_aa` (Allan-golvet för biasinstabilitet och
accelerationsslumpvandring) — tillsammans en **felbudget för en accelerometer med en axel
(1-DOF)** (VRW/ARW — hastighets-/vinkelslumpvandring — och biasinstabilitet). Detta är den felbudget som det levererade
scenario*paketet* `inertial` kör. Separat bär biblioteket nu en verifierad
**treaxlig strapdown-navigator** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
kvaternionattityd med kompensation för coning/sculling, en fullständig NED-mekanisering
(termer för jordrotation och transporthastighet, WGS-84 Somiglianagravitation), och en
deterministisk IMU-felmodell där **skalfaktor, felinriktning,
g-känslighet, kvantisering och hastighetsramp är modellerade** (IEEE Std 952-1997, IEEE:s
standard för gyrospecifikation och testförfarande, §A.2; Groves 2013 §4.3). Den treaxliga vägen är nu **kopplad till ett körbart
löst kopplat GNSS/INS-paket** (`kind = "gnss-ins"`): ett EKF med 15 tillstånd och feltillstånd
styr strapdown-lösningen mot brusiga positionsbestämningar medan GNSS är uppe, och glider sedan
genom avbrottet och rapporterar det fusionerade horisontella felet mot
glidningen med fri INS i öppen slinga. En **tätt kopplad pseudoavståndsuppdatering** finns också
tillgänglig (den bildar innovationen i avståndsdomänen, så den fortsätter att korrigera
med färre än fyra satelliter). Ett
scenario för klock-holdover kan lägga till `runs` (> 1) för att köra en **Monte Carlo-ensemble** — varje
kvalitetsmått rapporteras då som ett medelvärde med en spridning mellan 5:e och 95:e percentilen och
diagrammet skuggar felets konfidensband (se `scenarios/clock-ensemble.toml`).

Ett `fusion`-scenario (samma block som `hybrid`) kör **två oberoende Kalman-skattare**
— en för klocktillståndet, en för positionstillståndet — styrda av GNSS och stödda av
optisk tidsöverföring, och rapporterar ett kombinerat holdover-FoM. De två blocken delar ingen
korskovarians: detta är ett staplat par av felbudgetar, **inte** ett verkligt kopplat
gemensamt filter för klocka+position (korskovarians mellan block är en punkt på färdplanen). Se
`scenarios/fusion-pnt.toml`.

Ett `spoof`-scenario injicerar en tidsspoofing — en av fyra `[attack.shape]`-typer
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; ett ensamt `rate_ns_per_s` accepteras fortfarande
som en linjär ramp) — och kör varje klockas spoofingdetektor. Detektorn är ett
tvåsidigt **χ²₁-energitest / Neyman–Pearson-test** på den klockstödda övervakningsstatistikan:
tröskeln sätts från en målbudget för falsklarm `target_pfa`, och
**sannolikheten för missad detektering `P_md`** rapporteras både i sluten form och med
Monte Carlo (`mc_runs` försök per hypotes — de två stämmer till några ×1/√N).
**Säkerhetskvalitetsmåttet är `1 − P_md`** vid den operativt skadliga (specifikations-)
storleken, så en tyst klocka som fångar en spoofing av specifikationsstorlek får ≈ 1 och en brusig
som ofta missar den får lägre (se `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Ett `gnss-sim`-scenario är en simulering i **mätdomänen**: för varje synlig
satellit syntetiserar den pseudoavståndet `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` och L1-dopplern, med jonosfären enligt **Klobuchar** för en frekvens
(`[iono]`, IS-GPS-200 §20.3.3.5.2.5) och zenittroposfären enligt **Saastamoinen**
projicerad med mappningsfunktionen enligt **Niell (1996)** (`[tropo]`). Residualerna
matar **RAIM med ögonblicksbild** för HPL/VPL per epok, och varje satellits
pseudoavstånd, doppler, C/N₀ och jono-/troposfärskorrektioner skrivs ut i JSON-
vektorn `gnss_measurements`. Det är en framåtsimulator (den genererar mätningar utifrån
en känd sanning), inte en mottagare/lösare — en brusfri körning reproducerar geometrin plus
korrektionerna till under en millimeter (se `scenarios/gnss-sim-raim.toml`).

Ett `jamming`-scenario modellerar RF-störning som en **länkbudget**: en `[jammer]`
(ECEF-position, sändningseffekt `power_dbw`, typ) höjer förhållandet störsändare till signal vid en
`[receiver]` som bevakar en Walker-`[constellation]`. Utifrån geometrin (utbredningsförlust i fritt rum
och mottagarantennens förstärkning per riktning) beräknar den varje satellits
`J/S`, den **effektiva C/N₀** via den vedertagna antistörningsekvationen (bearbetningsförstärkning vid
avspridning × faktorn för spektral separation `Q`; Kaplan & Hegarty §9.4), och
flaggar låsförlust under en konfigurerbar spårningströskel — och rapporterar kvalitetsmåttet
`availability_under_jamming`. En bredbandig störsändare på 10 W på 1 km avstånd
slår ut mottagaren helt (J/S ≈ 72 dB); samma störsändare på 100 km avstånd
försämrar bara länkarna (se `scenarios/jamming-demo.toml`).

Ett `sweep`-scenario kör en **avvägningsstudie**: den varierar en `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` eller `classical_q_wf`) från `start` till `stop` över `steps`
punkter på en `lin`- eller `log`-`scale`, registrerar ett `metric` (t.ex. `holdover_s`) för båda
klockorna och ritar de två kurvorna. Basscenariot placeras under `[base]` (se
`scenarios/sweep-clock-stability.toml`).

Ett `sweep-nd`-scenario generaliserar detta till **valfritt paket och valfritt antal axlar**: det
varierar punktnotationsnycklar i TOML i ett `[base]`-scenario (av valfri `kind`) över den kartesiska
produkten av `[[axes]]`, kör om varje rutnätsnod och registrerar `metrics` angivna som
JSON-sökvägar med punktnotation in i resultatet (t.ex. `classical.fom.holdover_s`). Det fungerar för
varje paket eftersom det arbetar vid gränsen TOML/resultat; inbyggda körningar utvärderar
rutnätet parallellt (inget extra beroende, wasm faller tillbaka till sekventiellt) och
utdata är deterministiska och radordnade (se `scenarios/sweep-nd-inertial.toml`).

Ett `orbit`-scenario härleder `[gnss]`-tidslinjen ur geometrin i stället för att den skrivs
för hand — ange en `[user]`-bana, en `[constellation]`, en elevations-`mask_deg` och de två
klockblocken. Det rapporterar också positionsnoggrannhet utifrån satellitgeometrin; det
valfria `sigma_uere_m` (1-sigma användarekvivalent avståndsfel, standard 1 m) skalar
positionens precisionsutspädning till en positionssigma. Användarens bana kan göras
**excentrisk** med `eccentricity` och `argp_deg`, och `j2 = true` lägger till sekulär drift från jordens
avplattning (se `scenarios/orbit-molniya.toml`). Konstellationen kan i stället vara en
**verklig**: ge `[constellation]` ett `tle`-block med tvåradselementuppsättningar så tolkas
satelliterna från det (se `scenarios/orbit-real-tle.toml`). Lägg till ett eller flera
`[[constellations]]`-block för **flera GNSS** (t.ex. GPS + Galileo; se
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

Typerna för **alt-PNT utan GPS** navigerar helt utan GNSS, genom att matcha en uppmätt fält-
sekvens mot en karta via ett partikelfilter. Ett `gravity-map`-scenario flyger ett spår
genom ett sfäriskt harmoniskt fält för gravitationsanomali och återvinner det från en kallatoms-
gravimeters avläsning (`scenarios/gps-denied-gravity-nav.toml`); ett `terrain-nav`-scenario
gör detsamma mot en SRTM-höjdmodell (DEM) (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
och ett `combined-altpnt`-scenario fusionerar **gravitation + IGRF-magnetism + terräng** i ett filter
(`scenarios/combined-altpnt.toml`).

Ett `lunar-integrity`-scenario utvärderar **cislunär** PNT: det kör en ARAIM-passage för
skyddsnivå vid månens sydpol mot en reläuppsättning enligt LunaNet/LNIS och rapporterar ärligt
integritetsgapet — ett σ_URE på ~30 m på månen driver skyddsnivån långt över en larm-
gräns på 50 m, så tjänsten är *otillgänglig* enligt integritetsregler i luftfartsstil
(`scenarios/lunanet-araim.toml`).

Ett `lunar-time-offset`-scenario rapporterar den **relativistiska klockhastigheten jorden–månen** —
grunden för en tidsskala Lunar Coordinate Time (LTC/TCL). En post-newtonsk identitet utifrån grundprinciper
summerar skillnaden i egenpotential (IAU:s geoidpotential `L_G` minus månens
egenpotential vid ytan) och månens kinetiska term (doppler av andra ordningen) till en sekulär
hastighet på ≈ 57 µs/dygn, rapporterad med det publicerade bandet 56–59 µs/dygn; det ger också
den ackumulerade förskjutningen LTC−TT över en horisont och en ensemble med invers varians (en
pappersklocka på månen). **MODELLED** — huvudsiffran är *referensberoende* (jordens geoid
mot månens selenoid, medelvärdesfönster), vilket är skälet till att ett band, inte ett enda certifierat
tal, rapporteras (`scenarios/lunar-time-offset.toml`).

Se `scenarios/` för minst ett genomarbetat exempel av varje typ (92 typer, 193 scenario-
filer `.toml` + 1 svitmanifest — flera typer levereras med mer än ett exempel). Inte varje
typ har en fil uppkallad efter sig: `lunar-integrity` → `scenarios/lunanet-araim.toml` och
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` är två av flera sådana.
Lista de fördelningsbara typerna när som helst med felen från `cargo run -- --validate <file>`,
Python-funktionen `list_kinds()` eller MCP-verktyget `list_scenario_kinds`.

</details>

<details>
<summary>Utdata</summary>

### Utdata

Resultatartefakten är versionerad, självbeskrivande JSON: tidsserier per steg, de
poängsatta kvalitetsmåtten, de aktiva modellspecifikationerna (med proveniens), fröet, en
**scenariohash** — så att vilket diagram som helst kan reproduceras från filen — och, för varje klocka,
en `adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): den överlappande
Allan-avvikelsen över oktavfördelade medelvärdesbildningstider — det vedertagna sättet att läsa en klockas
stabilitet — nu med ett **95%-konfidensband specifikt för brustyp** per punkt (registreringens
potenslagstyp identifieras från dess modifierade Allan-lutning, och χ²-intervallet använder
motsvarande effektiva frihetsgrader enligt NIST SP 1065). Webbläsarens lekplats återger den som ett
log-log-diagram "Clock stability (ADEV)". (MDEV, TDEV och HDEV finns som skattare i biblioteket;
den exporterade resultatkurvan är den överlappande ADEV.) Varje fält, med enheter och en
källhänvisning, dokumenteras i [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Varje diagram är självbeskrivande.** Webbläsarens lekplats, CLI:ts export `*.chart.svg`
och HTML-resultatkortet (HyperText Markup Language) stämplar alla varje diagrambild med en sidfot med texten
`Kshana v<version> · scenario <hash> · kshana.dev`. `scenario <hash>` är de första
12 hexadecimala tecknen i körningens **scenariohash** — ett SHA-256-sammandrag (256-bitars Secure Hash Algorithm) över den kanoniska scenario-
definitionen (frö, trösklar, modellparametrar, GNSS-fönster, …); integritets- och mån-
rapporterna, som inte har någon egen hash, faller tillbaka på en SHA-256 av scenariokällan.
Det är **samma fingeravtryck** som visas i sammanfattningen på en rad och i resultat-JSON:en, så ett
sparat eller inklistrat diagram bär alltid sin version, exakt det scenario som producerade det (för
reproduktion bit för bit) och källan — ändra någon indata så ändras hashen.

Kvalitetsmåtten följer de vedertagna operativa kvalitetsmåtten för PNT:

| Kvalitetsmått | Hur Kshana beräknar det |
|-----------------|------------------------|
| Tidsprestanda (klock-/banpaket) | RMS för klockans fasfel + 95:e percentilen över avbrottet, i **nanosekunder** (`timing_rms_ns`) — ett tidsmått, inte position |
| Positioneringsprestanda (tröghets-/hybridpaket) | RMS för positionsfel i 1-DOF + 95:e percentilen över avbrottet, i **meter** (`pos_rms_m`); en axel. En enskild körning flaggas `monte_carlo: false`; sätt `runs = N` för en Monte Carlo-ensemble som rapporterar varje måtts medelvärde, spridning och bootstrap-KI på 95% (konfidensintervall). Fortfarande **inte** en 2-D CEP/2DRMS (cirkulärt sannolikt fel / två gånger kvadratiskt medelavstånd) eller DOP-viktad noggrannhet (de kräver den treaxliga modellen — färdplan) |
| Autonomi | holdover-varaktighet — tid inom specifikationen efter GNSS-förlust (kvantiserad till rutnätet: en nedre gräns) |
| Resiliens | lutning för felväxt under avbrottet |
| Tillgänglighet | andel av körningen med en lösning inom specifikationen |
| Integritet | filtrets **självkonsistens** — andelen avbrottssampel vars fel håller sig inom Kalman-filtrets egen k-sigma-gräns. **Inte** en integritetssiffra för HPL/VPL/RAIM inom luftfart (se [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Säkerhet | **analytisk gräns för spoofing-*detekterbarhet*** utifrån klockstabilitet — hur liten/långsam en tidsspoofing en konsistensövervakare för en enda klocka skulle kunna flagga. Meningsfull endast med en konfigurerad attack; **inte** en RAIM-detektor för flera satelliter |

Ny inför dessa termer? Var och en definieras på klarspråk i [ordlistan](docs/GLOSSARY.md).

</details>

<details>
<summary>Kodförrådets struktur</summary>

### Kodförrådets struktur

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
<summary>Vanliga frågor (FAQ)</summary>

### Vanliga frågor

**Behöver jag förstå kvantfysik för att använda detta?**
Nej. Om du kan köra en kommandorad kan du köra Kshana. Börja med
[introduktionen på klarspråk](docs/CONCEPTS.md); slå upp termer i [ordlistan](docs/GLOSSARY.md).

**Är detta en design av kvanthårdvara eller flygprogramvara?**
Nej. Det är en prestanda*simulator*. Trohet mot kvanthårdvara kommer från publicerade
felmodeller, inte från detta verktyg. Se [Vad det är / inte är](#what-it-is--is-not).

**Är kvantresultaten realistiska, eller marknadsföring?**
Varje parameter hänvisar till ett datablad eller en artikel, varje modell är validerad mot ett
samband i läroböckerna, och mognaden är ärligt märkt i
[VALIDATION.md](docs/VALIDATION.md) — inklusive att ingen optisk strontiumklocka har
flugit. Motorn är neutral: kvant och klassiskt är samma kod med olika
publicerade tal.

**Kan jag lita på att två körningar stämmer överens?**
Ja — körningar är deterministiska: `scenario + seed + engine version → bit-identical output`,
upprätthållet av `scripts/check-reproducible.sh`.

**Kan jag använda det från Python eller i en webbläsare?**
Ja — se [Installera](#install): exemplen för Python och WebAssembly finns där. Båda anropar samma motor.

**Hur modellerar jag min egen sensor?**
Skriv ett scenario `.toml` med din sensors publicerade siffror i `provenance`-
fälten. Se [Scenarioformat](#scenario-format) och exemplen i `scenarios/`.

**Är det fritt för kommersiell användning?**
Ja — under AGPL-3.0, även i kommersiella sammanhang, så länge du följer
AGPL:s copyleft (särskilt: om du ändrar Kshana och erbjuder det över ett nätverk måste du
erbjuda dessa användare din ändrade källkod). Om det inte passar dig — t.ex. om du behöver
bädda in Kshana i en proprietär produkt eller köra en sluten nätverkstjänst — finns en kommersiell
licens att få från Ashforde® OÜ; se [`LICENSING.md`](LICENSING.md) och
[Support](#support--professional-services).

</details>

<details>
<summary>Felsökning</summary>

### Felsökning

**`cargo build` fallerar på en gammal verktygskedja.** Kshana behöver Rust ≥ 1.88. Uppdatera med
`rustup update`.

**Bygget av Python-tillägget misslyckas att länka på macOS** (`Undefined symbols … _Py…`).
Ett Python-tillägg löser upp sina symboler vid inläsning. `maturin` sätter rätt länkar-
flagga automatiskt — använd `maturin develop --features python` i stället för ett rent
`cargo build`.

**Python-bygget klagar på att tolken är nyare än PyO3 känner till.** Sätt
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (abi3-hjul är framåtkompatibla mellan
CPython-versioner).

**WebAssembly-bygget hittar inte målet.** Installera det en gång med
`rustup target add wasm32-unknown-unknown`, därefter `wasm-pack build --target web -- --features wasm`.

**Vart tog mina utdata vägen?** Varje körning skriver `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` och `<scenario>.report.json` bredvid
indatafilen `.toml`, och
`<scenario>.table.csv` också för de typer som publicerar en tabell. Alla ignoreras
av git avsiktligt.

</details>

<details>
<summary>Versionshantering och versioner</summary>

### Versionshantering och versioner

Kshana följer [Semantic Versioning](https://semver.org). Före 1.0 kan det publika
schemat för scenario/resultat fortfarande ändras; ändringar som bryter kompatibilitet anges uttryckligen i
[`CHANGELOG.md`](CHANGELOG.md). Varje resultat är reproducerbart från
`scenario + seed + engine version`.

**Varje tagg `vX.Y.Z` publicerar alla kanaler automatiskt, i en bestämd ordning** — hela
testsviten körs först på den taggade commiten, ingenting publiceras förrän den går igenom, och
efteråt kontrollerar pipelinen att varje register verkligen levererar den nya versionen
([`docs/RELEASING.md`](docs/RELEASING.md)). Kanalerna:

| Kanal | Installera / hämta | Innehåll |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | Rust-bibliotek + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | MCP-servern |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | abi3-hjul (Linux/macOS/Windows) + sdist (källdistribution) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | WebAssembly-modul + JS-omslag |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | OCI-avbildning (Open Container Initiative) för flera arkitekturer — ingen verktygskedja behövs |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | startprogram: laddar ned versionens binär, verifierar `SHA256SUMS`, kör den |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | samma startprogram för Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | binären `kshana-mcp`, genererad från varje versions `SHA256SUMS` |
| Claude Desktop | dubbelklicka på `kshana-mcp-<target>.mcpb` från versionen | tillägget, med binären inuti |
| officiellt MCP-register | upptäcks automatiskt av MCP-klienter | `io.github.ashfordeOU/kshana-mcp` (OCI-avbildning, npm- och PyPI-paket) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → sök efter "Kshana" | IDE-pluginet **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | ladda ned | kommandoradsbinären `kshana` för Linux x86-64, macOS (Apple silicon och Intel) och Windows x86-64, binären `kshana-mcp` för vart och ett av dessa system och Linux Arm, ett Claude Desktop-tillägg `.mcpb` per system, en CycloneDX-**SBOM**, **SLSA**-byggproveniens, en valideringssammanfattning i HTML och en kontrollsummefil `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | ett citerbart arkiv över varje version |
| [kshana.dev](https://kshana.dev) | öppna i en webbläsare | Kshana Studio, WebAssembly-appen i webbläsaren, byggd på nytt från varje versionstagg (så den version den visar är den version den kör) |

MCP-serverns paket-/avbildnings-/registerversion följer motorn (den paketerar
biblioteket); JetBrains-pluginet versioneras oberoende (det anropar din installerade
binär `kshana`).

</details>

<details>
<summary>Färdplan</summary>

### Färdplan

Se [`ROADMAP.md`](ROADMAP.md) för den etappvisa färdplanen, [`CHANGELOG.md`](CHANGELOG.md)
för utgiven historik och [`docs/CAPABILITY.md`](docs/CAPABILITY.md) för
färdplanen per förmåga. Prioritetsordningen är: **evidens för tidssynkronisering och holdover för
kritisk infrastruktur först** (telekommasker, längre holdover med åldring och flicker-
brus, inläsning av uppmätta klockdata); **den neutrala avvägningsmetoden kvant mot klassisk
därnäst** (resultat märkta MODELLED tills en partners uppmätta data uppgraderar dem); och
**navigering för månen / cislunärt och djuprymden underhålls**, men utvidgas inte som huvudspår. **Den ITRF-precisa reduktionen av referenssystem** är nu levererad — den
fullständiga CIO-baserade IAU 2006/2000A GCRS↔ITRS-kedjan (polrörelse + nutation under en bågsekund),
validerad bit för bit mot SOFA/ERFA och oberoende korskontrollerad mot ANISE
(SPICE i ren Rust) till ≤ 3.6 m i GNSS-bana. Punkter på kort sikt omfattar tätt kopplad fusion av bärvågsfas och att göra
den löst/tätt kopplade GNSS/INS-navigatorn tillgänglig i fler paket; motorn för **radiometrisk navigering i
djuprymden / på Mars** kom i v0.17.0 (simuleringsvaliderad). **Kvantfysiklagret**
är en punkt i **P2**: CAI-accelerometern simuleras nu utifrån
grundprinciper (Mach–Zehnder-fas, projektionsbrus, kontrastavtagande, vibrations-
koppling), medan sensorerna för klocka/tidsöverföring fortfarande drivs av publicerade
koefficienter för Allan-/brusbudget. GMST-baserad TEME&harr;ECEF, IERS-tidssystemen
med skottsekunder (UTC/TAI/TT/UT1), SGP4/SDP4-banpropagering (v0.7.0,
validerad mot vektorerna i AIAA 2006-6753) och det körbara fusions-
paketet `gnss-ins` har alla **levererats**, och tröghetshastigheten exponeras nedströms. En aktiv
stokastisk detektor för tidsspoofing (Neyman–Pearson / χ²₁-energitest med Monte Carlo-
P_fa/P_md och ett säkerhets-FoM på 1−P_md), en jammingmodell via länkbudget (J/S → effektiv
C/N₀ → låsförlust), tillgänglighet med flera konstellationer, en IMU-felbudget med en axel (1-DOF),
två oberoende Kalman-skattare (klocka + position) rapporterade som ett
kombinerat FoM, verklig konstellationsgeometri från TLE, en HTML-rapport med resultatkort,
geometriskt härledd GNSS-tillgänglighet
*och* precisionsutspädning från keplerska banor med excentricitet och J2-drift,
Monte Carlo-konfidensband, parametersvep för avvägningsstudier, en WebAssembly-lekplats i
webbläsaren och valfria bindningar för Python (PyO3) och WebAssembly (wasm-bindgen) har
landat på `main`.

</details>

<details>
<summary>Bidra</summary>

### Bidra

Se [`CONTRIBUTING.md`](CONTRIBUTING.md). Kort sagt: testerna går igenom (`cargo test`), de
två kontrollskripten går igenom, Conventional Commits, och en post under `[Unreleased]` i `CHANGELOG.md`
för varje ändring som syns för användaren. Deltagande styrs av vår
[uppförandekod](CODE_OF_CONDUCT.md). För att rapportera ett säkerhetsproblem, se
[säkerhetspolicyn](SECURITY.md) — öppna inte ett publikt ärende för sårbarheter.

</details>

<details>
<summary>Dokumentation: varje dokument, och vem det är till för</summary>

<a id="documentation"></a>
### Dokumentation

| Dokument | För vem | Vad det innehåller |
|----------|----------|--------------|
| [Introduktion till begreppen](docs/CONCEPTS.md) | alla, börja här | vad Kshana gör och varför, från noll till fysiken |
| [Kshana Studio](web/README.md) | alla | kör motorn i din webbläsare (WebAssembly); noteringar om bygge och driftsättning |
| [Ordlista](docs/GLOSSARY.md) | alla | definitioner på klarspråk av varje term |
| [Scenariotyper](docs/KINDS.md) | alla | varje typ som motorn fördelar: vad den gör, dess fält, ett exempelkommando, dess registerrader och diagrammet som motorn skriver för den |
| [Partnerdata](docs/PARTNER-DATA.md) | laboratorier och tillverkare med uppmätta data | vilka MODELLED-rader en uppmätt klock- eller IMU-registrering skulle kunna uppgradera, formaten, hur en inlämning kontrolleras (`kshana partner check`), poängsätts och krediteras |
| [Arkitektur](docs/ARCHITECTURE.md) | utvecklare / granskare | modulkarta, motorns pipeline, fördelning och diagram |
| [Valideringsstatus](docs/VALIDATION.md) | granskare / de som citerar | vad som är `validated` respektive `not modeled`, med evidens |
| [Verifieringsmatris](docs/VERIFICATION-MATRIX.md) | granskare / de som citerar | det maskinkontrollerade evidensregistret — varje förmågerad med sin status, modul, test och externa referens, genererat från `src/verification.rs` |
| [Motivering för Modelled](docs/MODELLED-RATIONALE.md) | granskare | varför varje **Modelled**-rad saknar extern referens, angivet rad för rad |
| [Proveniens](docs/PROVENANCE.md) | granskare / de som citerar | varje sensorparameter, modell och datamängd spårad till sin publicerade källa, i en citerbar tabell |
| [Reproducerbarhet och proveniens](docs/REPRODUCIBILITY.md) | granskare / paketerare | determinismgarantier, låsning mot referensutdata, SBOM (programvaruförteckning), byggproveniens |
| [Plattformstaggar för hjul](docs/WHEEL_TAGS.md) | paketerare | matrisen för abi3 Python-hjul — vilken plattformstagg `pip install kshana` löser upp |
| [Positionering](docs/POSITIONING.md) | utvärderare | var Kshana står i förhållande till RTKLIB/gLAB (kompletterande), och webbläsarnivån utan installation |
| [Kshana Pro](docs/PRO.md) | utvärderare / programansvariga | vad det proprietära Pro-överlägget lägger till över samma motor: designoptimerare, osäkerhet och känslighet, uppdragsdokumentation, kampanjbevakning, spektrumsamexistens, lokal jobbtjänst, kravspårbarhet; vad var och en producerar och vad den inte gör |
| [Teknisk rapport](paper/kshana-technical-report.md) · [JOSS-artikel](paper/paper.md) | granskare / de som citerar / utvärderare | den fullständiga utökade forskningsartikeln — arkitektur, modeller per område, validering, fallstudier och begränsningar — plus den kortfattade inlämningen till JOSS (Journal of Open Source Software) |
| [SGP4-validering](docs/SGP4-VALIDATION.md) | granskare / de som citerar | överensstämmelse med referensen AIAA 2006-6753 (666 tillstånd, ~4 mm) **och** en direkt jämförelse mot det oberoende paketet `sgp4` (stämmer till under en mikrometer / 4.12 mm) |
| [Validering av kraftmodellen](docs/AGENCY-ORBIT-VALIDATION.md) | granskare / de som citerar | motorn med fullständiga krafter (`src/precise_od.rs`) anpassad till myndigheters efemerider — metodik och validerade residualer |
| [Guide till verkliga TLE](docs/REAL_TLE_GUIDE.md) | användare | att driva scenarier från verkliga konstellations-TLE från Celestrak / Space-Track (i stället för den medföljande syntetiska Walker-uppsättningen) |
| [Integritets-FoM](docs/INTEGRITY.md) | utvärderare | vad siffrorna `integrity` / `security` betyder — och vad de **inte** är jämfört med HPL/VPL inom luftfart |
| [ARAIM-referens](docs/ARAIM_REFERENCE.md) | granskare / integratörer | den öppna implementationen av skyddsnivå med MHSS ARAIM — projektionen av nominell bias `b_k`, σ_URA mot σ_URE, och a priori-sannolikheterna för fellägen |
| [Kvantmodeller](docs/QUANTUM.md) · [detaljer](docs/QUANTUM-MODELS.md) | granskare | fysiklagret för kallatomsinterferometern, och var koefficienter fortfarande slås upp |
| [Efterlevnad](docs/COMPLIANCE.md) | utvärderare | algoritmomfattning för DO-229E / DO-316, och vad som **inte** är ett påstående om överensstämmelse |
| [Maritimt förtroende](docs/MARITIME-TRUST.md) | sjöfolk / integratörer | GNSS-förtroendepoängen 0-100 för ett fartygs NMEA, dess övervakare och dess gränser (rådgivande, inte typgodkänd navigationsutrustning) |
| [NMEA-strömmar för utbildning](docs/NMEA-TRAINING.md) | maritima instruktörer | syntetisk NMEA för bryggan med skriptad jamming och spoofing och en instruktörslogg; endast text, aldrig för levande navigering |
| [Störningskarta](docs/INTERFERENCE-MAP.md) | analytiker / sjöfolk | var flygplan och fartyg rapporterade försämrade navigeringsdata, och hur mycket av en rutt det berör |
| [Bevispaket](docs/EVIDENCE-PACKS.md) | operatörer / försäkringsgivare | signerade tekniska registreringar av en förtroendehändelse och hur man verifierar en |
| [Förtroendetelemetri](docs/TRUST-TELEMETRY.md) | drift- / säkerhetsteam | förtroendeströmmen som Prometheus-mått, SIEM-händelser och OpenTelemetry, med en Grafana-instrumentpanel |
| [Marina integrationer](docs/MARINE-INTEGRATIONS.md) | båtägare / integratörer | Signal K-pluginet, OpenCPN:s grindläge och referensbyggnaden |
| [Testbänk](docs/TEST-BENCH.md) | mottagartillverkare | att spela upp ett exporterat scenario genom en laboratoriesimulator och poängsätta mottagarens logg |
| [Mappning för efterlevnad](docs/compliance/README.md) | utvärderare | offentliga resiliensramverk mappade till Kshanas utdata, med källor och luckor; `kshana compliance-report` |
| [Notebooks](notebooks/README.md) | användare | körbara handledningar med sin återgivna text |
| [Standarder och interoperabilitet](docs/STANDARDS.md) | integratörer | de utbytesformat för GNSS / flygdynamik / myndigheter som Kshana läser och skriver (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [LEO PNT-fusion](docs/LEO-PNT-FUSION.md) | användare / utvärderare | fusionerad positionering, navigering och tidssynkronisering från MEO + LEO: doppler, gemensamt pseudoavstånd, PPP-konvergens, 5G NTN, polar täckning och tidsöverföring via LEO över valfri konstellation; de valfria förvalen och deras publika källor |
| [Kampanjer](docs/CAMPAIGNS.md) | användare / utvärderare | att sätta samman scenarier: kedjade uppdragstidslinjer, parametersvep, Monte Carlo-ensembler och körningar med delat villkor, med de sammansättningsidentiteter som testerna låser |
| [Scenariokatalog](docs/SCENARIOS.md) | användare / integratörer | varje fördelningsbar typ med sina obligatoriska och valfria TOML-fält — genererad från `api::list_scenario_kinds()` |
| [Resultatschema](docs/SCHEMA.md) | integratörer | varje fält i resultat-JSON:en, med enheter och en källhänvisning |
| [Python-API](docs/PYTHON_API.md) | Python-användare | bindningsytan i PyO3 — att anropa motorn, scenario-/resultattyperna och exempel |
| [Påståenden mot verklighet](docs/CLAIMS-VS-REALITY.md) | granskare | registret över stängda överdrivna påståenden + CI-kontrollen (`tests/no_overclaims.rs`) som håller det åtgärdat |
| [Färdplan](ROADMAP.md) | alla | den etappvisa färdplanen — vad som har levererats och vad som kommer härnäst |
| [MCP-server](mcp/kshana-mcp/README.md) · [JetBrains-plugin](ide/jetbrains/README.md) | agenter / IDE-användare | kör Kshana från en AI-assistent eller en JetBrains IDE |
| [Agentguide](docs/AGENTS.md) · [Ytor](docs/SURFACES.md) | agenter / integratörer | vilket verktyg som besvarar vilken fråga, vad som ska behållas med varje svar; var varje förmåga kan nås (CLI, Rust, Python, WASM, MCP, plugin, JetBrains, notebooks) och varför en cell är N/A |
| [Ändringslogg](CHANGELOG.md) | alla | utgiven historik (Keep a Changelog + SemVer, Semantic Versioning) |
| [Bidra](CONTRIBUTING.md) | bidragsgivare | bygge, kontroller, disciplin för test/citering, DCO (Developer Certificate of Origin) |
| [Styrning](GOVERNANCE.md) | bidragsgivare / gemenskap | hur Kshana styrs — vem som beslutar, hur, och gränsen mellan öppet och slutet |
| [Uppförandekod](CODE_OF_CONDUCT.md) | gemenskap | förväntat uppförande (Contributor Covenant) |
| [Säkerhetspolicy](SECURITY.md) | rapportörer | hur man rapporterar en sårbarhet; anmärkning om dubbla användningsområden |

</details>

<details>
<summary>Viktiga referenser</summary>

### Viktiga referenser

**Valideringsreferenser och standarder** — de externa auktoriteter som Kshanas kontroller är förankrade i:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [testdata](https://celestrak.org/publications/AIAA/2006-6753/)): den verifieringsuppsättning för SGP4/SDP4 som Kshana stämmer med till 4.12 mm, och de genomarbetade exemplen för referenssystem som kedjan TEME→ITRF kontrolleras mot.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — referensrutinerna för tid och referenssystem som IAU 2000A-nutationen och CIO-reduktionen GCRS↔ITRS valideras bit för bit mot.
- Petit & Luzum (red.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (standarder för jordorientering, polrörelse och referenssystem).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (samband för Allan-avvikelse och referensserien NBS14; NBS = det tidigare US National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): referensimplementationerna av ROC/AUC, förväxlingsmatris och precision/recall/F1 som testbädden för utvärdering av RF-försämring stämmer exakt med (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` och `linalg.expm` — referensrutinerna som NNLS-anpassningen av uppmätt ADEV i kvantavvägningen, χ²-konsistensbanden och van Loans kovarians för klockans processbrus valideras mot (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): använd både som öppen tidigare teknik (se *Jämförelse och öppen tidigare teknik* nedan) och som den **oberoende DOP-referens** som beräkningen av GDOP/PDOP/HDOP/VDOP/TDOP stämmer med till 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): kraftmodellerna bakom kraftmodellsanpassningen till myndigheters precisa efemerider.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (de halo-/NRHO-familjer som differentialkorrektorn för CR3BP reproducerar).

**Fysik för enheter och metoder** — de citerade källorna bakom sensormodellerna:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (optisk strontiumgitterklocka, rymdorienterat mål).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (Sr-klocka i laboratorium, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (hybrid kvantaccelerometertriad).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [handledning från IEEE AESS (Aerospace and Electronic Systems Society) (University College Londons arkiv Discovery)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (felväxt vid dödräkning).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (optisk tvåvägs tids- och frekvensöverföring; den optiska länken mellan satelliter modellerar sin budget för icke-reciprocitet efter dessa).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (BOC-moduleringen och teorin för spektral separation bakom `src/navsignal.rs`).
- Kaplan & Hegarty (red.) — *Understanding GPS/GNSS: Principles and Applications* (3:e uppl., Artech House, 2017): antistörningsekvationen för effektiv C/N₀ och jittret från termiskt brus i early–late DLL-kodspårning som modellerna för navigeringssignal och jamming använder.

**Jämförelse och öppen tidigare teknik** — de verktyg och översikter som Kshana positioneras mot:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): parametrarna i spoofingtestbatteriet som detektorn i flera lager karakteriseras mot.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): de öppna, validerade felprofilerna för tröghetsnavigering som används som klassisk baslinje.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): öppen PNT-simulator för månen.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): öppen analys av GNSS-data.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): GRAIL-OD med reducerad dynamik, det golv för empirisk acceleration som LRO-anpassningen reproducerar.

</details>
