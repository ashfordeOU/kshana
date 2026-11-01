> Dette er en maskinoversettelse av README.md i v0.40.0 som ingen morsmålsbruker har gjennomgått ennå; den engelske README-filen er referansen. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: merket, et kompassretikkel som markerer det presise øyeblikket, ved siden av ordmerket kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>det presise øyeblikket</em></strong><br>
  En simulator med åpen kildekode for robusthet i PNT (posisjonering, navigasjon og tidssynkronisering).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Status for kontinuerlig integrasjon på main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Linjedekning nær 95 % av src/, målt i docs/COVERAGE.md og sikret ved 85 % i kontinuerlig integrasjon"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 av 401 funksjoner VALIDATED mot en uavhengig ekstern referanse, ifølge verifikasjonsmatrisen"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Status for kvalitetsporten i SonarQube Cloud"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Utgivelse v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Engelsk og 17 andre språk, maskinoversatt"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Lisens: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, Zenodo-konseptposten for alle utgivelser"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="En kommersiell lisens er tilgjengelig fra Ashforde® OÜ, se Utgaver"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana på crates.io, den gjeldende publiserte versjonen"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana på PyPI, den gjeldende publiserte versjonen"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana på npm, den gjeldende publiserte versjonen"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Åpne Kshana Studio</a> ·
  <a href="#install">Installasjon</a> ·
  <a href="#capabilities">Funksjoner</a> ·
  <a href="#evidence">Evidens</a> ·
  <a href="#research">Forskning</a> ·
  <a href="docs/CONCEPTS.md">Dokumentasjon</a> ·
  <a href="#cite">Siter</a>
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
  <sub>Kommandolinjen, kjøringssammendrag, diagrammer og rapporter snakker hvert språk med <code>--lang &lt;tag&gt;</code>
  (for eksempel <code>kshana scenarios/holdover-test-example.toml --lang de</code>), og det samme gjør Python-, WebAssembly- og MCP-grensesnittene.
  Dette er maskinoversettelser som ingen morsmålsbruker har gjennomgått ennå; engelsk er referansen.
  Se <a href="docs/i18n.md">Lokalisering</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Øv på minuttet da GNSS blir mørkt. Kshanas oppdragskonsoll, tegnet fra en ekte kjøring av motoren v0.40.0: den kjedede kampanjen campaign-jam-spoof-holdover-integrity (seed 20260928, 6 faser, 18 medlemskjøringer over T+01:16:10) og de 102 satellittene i GPS, Galileo, BeiDou og GLONASS fra constellation-multi-gnss-coverage, hver tegnet på den sirkulære tolegemebanen som er utledet fra motorens bakkespor, med radier komprimert for visning. Klokkens tidsfeil topper på 62.7 ns mot en vaktgrense på 50 ns, bærebølge-til-støy-tettheten faller til -12.2 dB-Hz mot et gulv på 25 dB-Hz, og det vertikale beskyttelsesnivået når 135.4 m mot en alarmgrense på 50 m." width="100%">
</picture>

<details>
<summary><strong>Innhold</strong></summary>

- [Øv på minuttet da GNSS blir mørkt](#rehearse-the-minute-gnss-goes-dark)
- [Nytt i 0.40](#whats-new-in-040), [Nytt i 0.39](#whats-new-in-039), [Nytt i 0.38](#whats-new-in-038) og [0.38 i dybden](#038-in-depth): Jammertest-scoring, mottakerens egne flagg, maskininndata, tidssynkronisering og holdover, standardpakker, LunaNet AFS, laboratorierundturen, kshana-bench, observatoriet, eksportører, optikk, [navigasjon for romfartøy](#space-user-navigation-gnss-ssv) og [måneinfrastruktur](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) og hver Studio-side
- [Funksjoner](#capabilities): tabellen over områder, [hver scenariotype etter familie](#every-scenario-kind-by-family), [hver kommando](#every-command), [hvert grensesnitt](#every-surface)
- [Slik fungerer en kjøring](#how-a-run-works), [Oppdrag](#missions)
- [Evidens](#evidence): registeret, [funksjonsdomener](#capability-domains)
- [Installasjon](#install), [Arkitektur](#architecture) (og [diagrammene](#diagrams)), [AI-assistent](#ai-assistant)
- [Utgaver](#editions), [Forskning](#research), [Siter](#cite), [Lisens](#licence)
- [Referanse](#reference): bruk, scenarioformat, utdata, repositoriets oppbygning, FAQ, feilsøking, versjonering, veikart, bidrag, dokumentasjon

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Øv på minuttet da GNSS blir mørkt

Kshana spiller av jamming, spoofing og klokke-holdover når GNSS-signaler (Global Navigation Satellite
System) svikter, og forteller deg hvor lenge et system holder tid og posisjon innenfor
budsjettet sitt, og hvilken klokke eller sensor som gir mest margin. Det er én Rust-motor. Den kjører i en
terminal, en notatbok, et IDE (integrert utviklingsmiljø), en AI-assistent (kunstig
intelligens) eller i nettleseren din.

Hver kjøring kan reproduseres bit for bit fra scenarioet, seeden og motorversjonen.
Hver funksjon bærer én av tre merkelapper i et maskinkontrollert register: **VALIDATED** (en
uavhengig ekstern referanse er enig), **MODELLED** (internt konsistent, og sagt høyt)
eller **PARTNER** (en maskinvarepartner eier den).

> **Status: v0.40.0.** Et validert, reproduserbart simuleringsgrunnlag for robusthet i PNT.
> Tidssynkronisering og holdover kommer først, fordi det domenet er best validert. Kshana er et
> instrument for studier og avveininger: ikke maskinvare for radiofrekvent (RF) signalgenerering (den
> styrer ingen radio og sender ingenting; signalnivåutdataene er basebånd-IQ-samplefiler
> for programvaremottakere), ikke en maskinvare- eller sertifisert GNSS-mottaker (programvaremottakeren
> er et analyseverktøy) og ikke et flyprodukt. Ny i fagfeltet? Start med
> [innføringen på klart språk](docs/CONCEPTS.md) og [ordlisten](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Nytt i 0.40

0.40 legger til et feilbudsjett på oppdragsnivå, merker hver figur og tabell med evidensnivået sitt, leser målte klokkelogger,
kontrollerer innsendinger fra datapartnere, anslår hvor en interferenskilde kan være, og snakker sytten språk ved siden av engelsk.
Registeret har nå 401 rader: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Ingen rad ble forfremmet til VALIDATED, og hver bom nedenfor er
låst fast av en test.

- **Oppdragstråd.** Typen `mission-thread` kjeder faser fra oppskyting til inntreden (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` og fire månetyper) med oppgitte overleveringsregler, en margin mot oppgitte krav og det svakeste
  leddet; et ende-til-ende-eksempel i Artemis-klassen over 11 faser (jord- og månesegmenter), 92 scenariotyper i alt. Hvert tall er MODELLED. Den cislunare propageringen mot den offentlige Artemis I-banen
  **bommer** på terskelen som ble fastsatt på forhånd (45.3 km og 0.25 m/s mot 5 km og 0.05 m/s; årsaken er små manøvrer modellen ikke tar med), og månepropagatoren mot CAPSTONE-
  banen **bommer** (136.8 km mot 25 km ved slutten av ett omløp); LRO-sammenligningen er oppfylt. Radene forblir MODELLED
  ([Oppdragstråd](docs/MISSION-THREAD.md), [månesegment](docs/MISSION-THREAD-LUNAR.md)). I Studio leses tråden på `/studio/mission-thread/`.
- **Evidensmerker.** Hver figur og tabell en kjøring skriver, bærer nivået og ledger-rad-id-ene den hviler på, lest fra matrisen.
- **Målte klokker.** Åtte klokkeloggformater leses ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)) og en tilpasset
  serie kan drive holdover. Mot terskler fastsatt på forhånd **bommer** tilpasningen på F1(a) for fem av seks registreringer og på F2 for én; begge
  forblir MODELLED ([Endringslogg](CHANGELOG.md#0400---2026-10-29)).
- **Datapartnere.** `kshana partner check` kontrollerer formatet på en innsending og scorer ingenting ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Kildeområde.** `kshana interference-map locate` gir et område og en ellipse, aldri et rent punkt, fra ADS-B- eller AIS-
  rapporter. Sammenlignet én gang med senderstedene i Jammertest 2025 er resultatet **NOT ASSESSABLE** for begge kildene (for få
  planlagte økter i de åpne dataene), så raden forblir MODELLED ([Interferenskart](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Benchmark.** Den nye kampanjen i 0.40 oppfyller A3, D3 (begge EXPLORATORY), R3 og R4; A2, D1 og R1 forblir NOT MET ([Bench](docs/BENCH.md)).
- **Språk.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja og zh-Hans, som **maskinoversettelser som ingen
  morsmålsbruker har gjennomgått**; engelsk er referansen, og kjøringer på andre språk enn engelsk tar omtrent dobbelt så lang tid
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Nytt i 0.39

0.39 legger ikke til noen funksjon og endrer ikke noe resultat; motorens utdata er utdataene fra 0.38. Den retter én ting
på kommandolinjen, oppdaterer avhengigheter i verktøyene for kryssvalidering, og oppgir benchmark-
vurderingene i sin helhet.

- **Kommandolinje.** `kshana kinds | head` (enhver lukket standardutdata) får ikke lenger panikk: programmet avslutter
  stille med status 141, slik andre verktøy gjør for et lukket rør. Andre skrivefeil rapporteres fortsatt.
- **Avhengigheter.** `memmap2` 0.9.11 i de to ANISE-kryssjekk-låsene og `pillow` 13.0.0 og
  `certifi` 2026.10.19 i versjonsfestingene for referansemiljøet, alt under `xval/`: ingenting som leveres, er endret.
- **kshana-bench, alle vurderinger.** Mot tersklene som ble fastsatt på forhånd, er tre NOT MET, hver låst fast av en test:
  A2 (`agc_k_sigma` AUC 0.766 mot minst 0.80), D1 (største gap 0.0301) og oppgave (b) R1 (overført,
  ikke kjørt på nytt). Ingen terskel ble lempet ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Nytt i 0.38

0.38 gjør den nøytrale dommeren målbar: den scorer mottakerlogger mot en publisert test-
plan, leser flere mottakere og sensorer, tester tidssynkroniseringssystemer, og leverer en benchmark og et
interferensobservatorium. Den forblir veiledende: ingenting her er sertifisert, intet resultat er en typegodkjenning,
og ingenting sender. Hver rad oppgir hva registeret har for den ([hvordan en merkelapp opptjenes](#evidence));
en status nevner bare det som ble kontrollert, og registerraden og den lenkede siden sier hva som ikke ble det.

| Nytt i 0.38 | Hva det gjør, og hvorfor | Status i registeret | Les |
|---|---|---|---|
| **Jammertest-scoring** | `kshana jammertest import` leser den publiserte testkatalogen og sendeplanen fra NPRA som planlagt fasit; `jammertest score` scorer en mottakerlogg per test (deteksjonsforsinkelse, tapte alarmer, falske alarmer, tid til gjenoppretting), som en signert bevispakke hvis du oppgir en nøkkel | **MODELLED**: én registerrad. Tersklene ble forhåndsregistrert før noen scoret kjøring; på dataene fra JammerTest 2024 feilet minimumsdataregelen i begge kjøringene (4 og 7 scorbare vinduer mot 10 påkrevd), så **ingen terskel kan vurderes** og ingenting hevdes | [Jammertest](docs/JAMMERTEST.md) |
| **Mottakerens egne flagg** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG og NovAtel RXSTATUS leses inn i en `self_report` per epoke og sammenlignes med Kshanas alarmer (begge, bare mottakeren, bare Kshana, ingen av dem); en Septentrio SBF-leser og skrivebeskyttet `--serial`-inndata | **MODELLED**; samsvar mellom en mottakers detektor og Kshanas er ikke validering | [Mottakertillit](docs/RECEIVER-TRUST.md) |
| **Flere mottakere og sensorer** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (fra de BSD-lisensierte pyrtcm-tabellene, ikke RTCM-teksten), GNSS-SDR-overvåkingsstrømmer, en IMU-logg som en andre sensor, en ROS 2-pakke, en `gnss_lib_py`-bro, og `imu-fit` for parametere til hybride sensorer | **MODELLED**: seks registerrader; bare egenskrevne testdata, ingen opptak fra en ekte mottaker, IMU, GNSS-SDR-kjøring eller ROS-graf ble lest | [Maskininndata](docs/MACHINE-INPUTS.md) |
| **Tester av tidssynkronisering og holdover** | typen `holdover-test` scorer en holdover-test (GNSS fjernet av operatøren, holdover, gjenoppretting) fra en målt tidsfeilregistrering mot ITU-T-masker, «målt mot masken»; loggleserne for linuxptp og chrony; maskinvaretrinnene og feltet `lab-attestation` | **MODELLED**: to registerrader; tidspunktene er operatørens utsagn, ikke verifisert | [Timing HIL](docs/TIMING-HIL.md), [Maskinvaresikkerhet](docs/HARDWARE-SAFETY.md) |
| **Standardpakker, LunaNet AFS, laboratorierundtur** | scorede pakker for DHS RPCF, IMO MSC.1/Circ.1575 og ICAO Doc 9849 Appendix F mot terskler oppgitt før kjøringen, «støtter evidens for»; en kryssreferanse til NIST IR 8323r1; en kodegenerator og kontrollør for LunaNet AFS; en signert pakke som kobler en laboratoriekjørings scenario, testbetingelser, mottakerlogg og score | **MODELLED** for pakkene og rundturen; AFS-kodekontrollen er **VALIDATED** mot de trykte kontrollkolonnene sine (se registerradene) | [Standarder](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench og observatoriet** | faste oppgaver, oppdelinger og metrikker for interferensdeteksjon, IQ-deteksjon, holdover-prediksjon og optimismegapet, med et forseglet tilbakeholdt datasett og en statisk resultatliste; et reproduserbart daglig interferensprodukt med 24 h forsinkelse, grove celler og ingen tilskrivning | ingen egen registerrad: den scorer innsendinger, og grunnlinjene er merket MODELLED i resultatfilene; mot tersklene som ble fastsatt på forhånd er scoreren, C1 til C3 og D2 oppfylt, og tre terskler er **NOT MET** (låst fast av tester): A2 (`agc_k_sigma` AUC 0.766 mot minst 0.80 på testoppdelingen), D1 (største gap 0.0301) og oppgave (b) R1 (overført, ikke kjørt på nytt); se `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatorium](docs/observatory/METHOD.md) |
| **Eksportører** | tillitstelemetri som Home Assistant MQTT-discovery- og tilstandsmeldinger (bare publisering, ingen påloggingsdata) ved siden av Prometheus, CEF, LEEF og OTLP | **MODELLED**: én registerrad | [Tillitstelemetri](docs/TRUST-TELEMETRY.md) |
| **Optisk linkmargin over tid** | typen `optical-atmosphere` kan skrive én seedet realisering av et steds vær som en serie av linkmargin | **MODELLED**: én registerrad; ett trekk fra modellen, ikke klimaet | [Optisk atmosfære](docs/OPTICAL-ATMOSPHERE.md) |

Høydepunktene i 0.37: [endringslogg](CHANGELOG.md#0370---2026-10-17). Hele listen for 0.38 står i
[endringsloggen](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 i dybden

Hver funksjon fra tabellen ovenfor, på noen få linjer: hva den gjør, én kommando for å kjøre den, ett
bilde tegnet fra en ekte kjøring av motoren, og hva registeret har for den. Bildene
skrives av [`tools/gen_figures_038.py`](tools/gen_figures_038.py) til
[`docs/figures/0.38/`](docs/figures/0.38/) (aldri tegnet for hånd): `python3 tools/gen_figures_038.py`
skriver dem på nytt fra en bygget motor, og `--check` feiler hvis ett er utdatert eller bildeteksten her avviker.
Der en inndata er en logg, er det en oppdiktet logg som skriptet skriver, fordi de ekte loggene fra tredjeparter
aldri tas inn i repositoriet, og bildeteksten sier det. Alt nedenfor er veiledende: ikke sertifisert, ikke en
typegodkjenning, og ingenting sender. En status nevner det som ble kontrollert og ikke noe mer;
[hvordan en merkelapp opptjenes](#evidence).

### Jammertest-scoring

`kshana jammertest import` gjør den publiserte testkatalogen og sendeplanen fra NPRA om til
planlagt fasit, og `kshana jammertest score` scorer en mottakerlogg mot den: for hver
planlagte test, om den ble detektert, hvor sent, og hvor lang tid mottakeren brukte på å gjenopprette, pluss
falske alarmer utenfor alle tidsluker. Katalogen hentes, den tas aldri inn i repositoriet.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Scoring av én syntetisk mottakerlogg mot en plan med tre tester, fra en ekte kjøring av motoren v0.40.0 (`kshana jammertest score`). Loggen er oppdiktet: 1800 s med NMEA med et fall i C/N0 på 20 dB over to intervaller. Planen lister tre tidsluker; den midterste tidsluken har ingen jammer i loggen. Scoren markerer 2 av 3 tester som detektert (median forsinkelse 0 s) og 1 tapt, med 0 falske alarmforløp over 0.25 h med ren tid. Ingenting her sier noe om en ekte mottaker. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC 61108, IEC 61162): operatøren er fortsatt ansvarlig for fartøyets navigasjon.">
</picture>

**Status i registeret: MODELLED.** Tersklene ble fastsatt før noen scoret kjøring; på dataene fra JammerTest 2024
feilet minimumsdataregelen i begge kjøringene, så ingen terskel kan vurderes og ingenting hevdes.
[Jammertest](docs/JAMMERTEST.md).

### Mottakerens egne flagg

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG og NovAtel RXSTATUS leses inn i en `self_report` per epoke
og settes ved siden av Kshanas alarmer: begge, bare mottakeren, bare Kshana, eller ingen av dem. En
Septentrio SBF-leser og en skrivebeskyttet `--serial`-inndata mater den samme sammenligningen. Ingen av sidene er
fasit.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Mottakerens eget spoofing-flagg satt mot Kshanas alarmer, fra en ekte kjøring av motoren v0.40.0 på en oppdiktet UBX-logg (200 epoker ved 1 Hz). C/N0 faller 20 dB ved 80 til 90 s og 120 til 130 s; mottakeren flagger 120 til 130 s og 160 til 165 s. Av 140 epoker sammenlignet etter kalibrering hadde 11 flagg fra begge, 6 bare fra mottakeren, 11 bare fra Kshana og 112 fra ingen. Ingen av sidene er fasit, og samsvar er ikke validering. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

**Status i registeret: MODELLED.** Samsvar mellom en mottakers detektor og Kshanas er ikke
validering. [Mottakertillit](docs/RECEIVER-TRUST.md).

### Flere mottakere og sensorer

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, GNSS-SDR-overvåkingsstrømmer, en IMU-logg som en andre
sensor, en ROS 2-pakke og en `gnss_lib_py`-bro ender alle i den samme tidslinjen for mottakertillit.
`imu-fit` leser sensorparameterne som hybrid- og fusjonsscenarioene trenger, fra en stillestående IMU-
logg, slik at et scenario kan kjøres med sensoren du faktisk har.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Hva `kshana imu-fit` leser fra en stillestående IMU-logg, fra en ekte kjøring av motoren v0.40.0 på en oppdiktet logg (20,000 sampler ved 100 Hz, 200 s): akselerometerets hastighets-random-walk q_va = 4.02e-06, gyroens vinkel-random-walk q_arw = 9e-08, biasinstabiliteten 0.00296 og de tidlige Allan-helningene (-0.51 og -0.49; omtrent -0.5 der hvit støy dominerer). Tabellen ved siden av er TOML-en kommandoen skriver ut. Estimatoren er bare kontrollert på syntetiske logger. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

**Status i registeret: MODELLED.** Bare egenskrevne testdata; ingen opptak fra en ekte mottaker, IMU,
GNSS-SDR-kjøring eller ROS-graf ble lest. [Maskininndata](docs/MACHINE-INPUTS.md).

### Tester av tidssynkronisering og holdover

Typen `holdover-test` scorer en holdover-test (GNSS fjernet av operatøren, holdover, gjenoppretting)
fra en målt tidsfeilregistrering mot ITU-T-masker, og sier det med de ordene: målt
mot masken. Loggleserne for linuxptp og chrony mater den; maskinvaretrinnene og
feltet `lab-attestation` sier hvem som oppga hva.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="En holdover-test scoret fra en tidsfeilregistrering, fra en ekte kjøring av motoren v0.40.0 på scenarios/holdover-test-example.toml (601 sampler hvert 5. s). GNSS fjernes av operatøren ved 600 s og gjenopprettes ved 2400 s; tidsfeilen driver til 299 ns ved slutten av holdover, forbi budsjettet på 100 ns etter 675 s, og kommer tilbake innenfor båndet på 100 ns 70 s etter gjenopprettingen. Vurderinger: grunnlinjemasker PASS, holdover-masker FAIL, holdover-omslutning FAIL, gjenoppretting RECOVERED. Målt mot masken, ikke en godkjenning. Tidspunktene er operatørens utsagn, ikke verifisert av Kshana. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

**Status i registeret: MODELLED.** Tidspunktene da GNSS ble fjernet og gjenopprettet, er operatørens utsagn,
ikke verifisert. [Timing HIL](docs/TIMING-HIL.md), [Maskinvaresikkerhet](docs/HARDWARE-SAFETY.md).

### Standardpakker

Scorede pakker for DHS Resilient PNT-testprofilene, IMO MSC.1/Circ.1575 og ICAO Doc 9849
Appendix F, pluss en kryssreferanse til NIST IR 8323r1 i `compliance-report`. Hver test kjører et medfølgende
scenario og sammenligner et resultatfelt med en terskel oppgitt før kjøringen; en test som trenger en mottaker-
logg, er oppført som at den trenger en inndata, ikke scoret. Ordlyden er «støtter evidens for».

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Hver test i de tre scorede standardpakkene, fra ekte kjøringer av motoren v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 oppfylt, 1 ikke oppfylt, 2 trenger en inndata; imo-circ-1575: 1 oppfylt, 4 ikke oppfylt, 2 trenger en inndata; icao-doc9849-appf: 6 oppfylt, 0 ikke oppfylt, 2 trenger en inndata. I alt 13 oppfylt, 5 ikke oppfylt og 6 som trenger en inndata motoren ikke har (en mottakerlogg eller utstyrsdokumentasjon). Hver terskel ble oppgitt før kjøringen; en bom beholdes som en bom. En oppfylt terskel sier at et modellert scenario nådde en oppgitt terskel, ingenting om et produkt. Pakkene støtter evidens for radene de viser til; de er ikke en vurdering. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste; det må ikke være eneste grunnlag for noen navigasjons- eller sikkerhetsbeslutning.">
</picture>

**Status i registeret: MODELLED.** En oppfylt terskel sier at et modellert scenario nådde en oppgitt terskel, ingenting om et
produkt; hver bom beholdes og låses fast av en test. [Standarder](docs/STANDARDS.md).

### LunaNet AFS

Kodegeneratoren for LunaNet Augmented Forward Signal (Gold-, Weil- og tertiærkoder, meldings-
rammen og feilkodingen dens) og en kontrollør for en innspilt eller generert symbolstrøm, festet til én
utgave av spesifikasjonen.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="Kodegeneratoren for LunaNet AFS kontrollert mot de trykte kolonnene i spesifikasjonen, fra en ekte kjøring av motoren v0.40.0 (`kshana lunanet-afs-check spec`, festet til LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 January 2025; dokumentet merker kodetabellene sine {LSIS-TBC}). 9 av 10 kontroller er oppfylt; B4 er NOT MET (420 av 421 samsvarte). Den kontrollerer en symbolstrøm mot én utgave av en publisert spesifikasjon og sier ingenting om noen LunaNet-node eller -tjeneste. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste. Den kontrollerer en symbolstrøm mot én utgave av en publisert spesifikasjon og sier ingenting om noen LunaNet-node eller -tjeneste.">
</picture>

**Status i registeret: VALIDATED** for kode- og synkroniseringskontrollene, mot verdiene
spesifikasjonen trykker (som den merker TBC); én kontroll er NOT MET, beholdt og låst fast (én trykt
kolonne for tertiærkoden avviker: dokumentet trykker samme verdi for to PRN-er). LDPC- og CRC-ordene
i delrammene 2 til 4 kontrolleres ikke. Registerradene sier nøyaktig hvilke. [LunaNet AFS](docs/LUNANET-AFS.md).

### Laboratorierundtur

`kshana.test-conditions/1` er en publisert beskrivelse av hva et laboratorium gjorde (hendelser, tidspunkter,
effekter). `kshana evidence round-trip` kobler scenarioets hash, betingelsenes hash, mottakerloggens
hash og scoren sammen i én signert pakke, og avviser en pakke der betingelsene og scoringsscenarioet
er uenige om hendelsene. Kshana produserer eller spiller aldri av et signal: hvordan et scenario nådde en
mottaker, er operatørens ansvar.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Strukturen i en bevispakke. En mottakerlogg (NMEA, u-blox UBX, RINEX 3 eller en Android-logg) og et tidsvindu går inn i kshana receiver-trust evidence, som skriver sju filer: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig og en valgfri timestamp.tsr. Manifestet registrerer SHA-256 for hele loggen og for hver fil og en hashkjede over filene; signaturen dekker manifestet. kshana evidence verify kontrollerer signaturen, hver fils hash, kjeden og at ingen fil som ikke er oppført, finnes, og avslutter med 0 når den er verifisert, 1 når noe feilet og 3 når signereren ikke var festet. En pakke er et teknisk dokument, ikke en juridisk vurdering.">
</picture>

Bildet viser oppbygningen av en pakke. **Status i registeret: MODELLED.**
[Testbetingelser](docs/spec/TEST-CONDITIONS.md), [Testbenk](docs/TEST-BENCH.md).

### kshana-bench

Faste oppgaver, oppdelinger og metrikker for interferensdeteksjon, IQ-deteksjon, holdover-prediksjon og
optimismegapet, med et forseglet tilbakeholdt datasett og en statisk resultatliste. Den scorer innsendinger; den er ikke
en rangering av mottakere.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="De innebygde grunnlinjene for kshana-bench oppgave D (optimismegapet) på testoppdelingen, fra en ekte kjøring av motoren v0.40.0 (`kshana bench baseline`). Hvert søylepar er arealet under ROC-kurven på tilfellene innenfor fordelingen og på de forskjøvne tilfellene; gapet mellom dem er optimismegapet, mot en toleranse på 0.05. fused-max-z: 0.998 og 0.983 (gap 0.015); sqm-imbalance: 0.882 og 0.882 (gap 0.001); agc-excess: 0.848 og 0.819 (gap 0.030); raim-parity: 0.682 og 0.672 (gap 0.010); energy-cn0-drop: 0.595 og 0.565 (gap 0.030). Merkelappene er merkelapper fra en generativ modell for et syntetisk korpus, aldri feltdata: MODELLED. Veiledende: modellert eller målt mot oppgitte referanser, ikke en godkjenning, sertifisering eller samsvarserklæring. En score beskriver en logg eller et korpus, aldri et produkt.">
</picture>

**Status i registeret:** ingen egen registerrad; grunnlinjene er merket MODELLED i resultatfilene.
Mot tersklene som ble fastsatt på forhånd, er scoreren, C1 til C3 og D2 oppfylt, og tre terskler er NOT MET, hver
låst fast av en test: A2 (`agc_k_sigma` AUC 0.766 mot minst 0.80 på testoppdelingen), D1 (største gap
0.0301) og oppgave (b) R1 (overført fra den tidligere kampanjen, ikke kjørt på nytt). Tallene står i
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Interferensobservatorium

Ett produkt per UTC-døgn og region fra et åpent arkiv over flyposisjoner, på et fast, grovt rutenett:
hver celle er degradert, ikke degradert, eller ikke observert (som ikke er «klar»). Utgis tidligst
24 h etter at døgnet er slutt, med små celler undertrykt og ingen tilskrivning av årsak.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="To syntetiske interferenskartdøgn tegnet fra de innsjekkede eksemplene i examples/interference-map/output, hver med sin egen syntetiske rute og andelene av ruteeksponering som motoren rapporterer. Til venstre et ADS-B-døgn: 1 degradert celle, 6 ikke degradert, 4 ikke vurdert (skravert) og celler uten oppføring, tegnet tomme, som ikke ble observert. Ruten er 525 km: 11.5% av lengden i degraderte celler, 38.3% ikke degradert, 9.1% ikke vurdert og 41.1% ikke observert. Til høyre et AIS-døgn: celler flagget av sirkel- og på-land-detektorene, ikke-anomale celler og tomme celler; ruten er 454 km med 10.5% i anomale celler, 21.2% ikke anomale, 0.0% ikke vurdert og 68.3% ikke observert. ADS-B og AIS er separate lag, aldri kombinert. En flagget celle er ikke et funn av interferens, og en celle uten farge ble ikke observert, noe som ikke er det samme som klar. Alle data er oppdiktet, i det åpne midtre Atlanterhavet, og ikke en måling.">
</picture>

Bildet viser de innsjekkede eksempeldøgnene, ikke et observatorieprodukt. **Status i registeret: MODELLED**:
ingen ekstern referanse, ingen fasit og ingen årsakstilskrivning; en celle som ikke er observert, ble ikke
vurdert, noe som ikke er det samme som klar. [Observatoriets metode](docs/observatory/METHOD.md).

### Eksportører

Tillitstelemetri som Prometheus-tekst, CEF, LEEF, OTLP og Home Assistant MQTT-discovery- og tilstands-
meldinger. Kommandoen publiserer bare til et mål du oppgir, og har ingen påloggingsdata.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Ett tillitsresultat i tre eksportformater, fra ekte kjøringer av motoren v0.40.0 (`kshana trust-telemetry`) på examples/maritime-trust: Prometheus-teksteksponering (den siste tillitsscoren er 5.9 og båndet for ikke klarert er det som er satt), og de siste CEF- og LEEF-meldingene. Kommandoen publiserer ingenting med mindre den får et mål, har ingen påloggingsdata og sender ikke noe radiosignal. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC 61108, IEC 61162): operatøren er fortsatt ansvarlig for fartøyets navigasjon.">
</picture>

**Status i registeret: MODELLED.** [Tillitstelemetri](docs/TRUST-TELEMETRY.md).

### Optisk linkmargin over tid

Typen `optical-atmosphere` kan skrive én seedet realisering av et steds vær som en serie av
linkmargin: skyepisoder, en kolonne med flytende vann for hver, ett scintillasjonssample per steg.
Studios side for Optical PNT åpner optical-atmosphere-scenarioene.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Én seedet realisering av linkmarginen for stedet 'northern' over 336 h, fra en ekte kjøring av motoren v0.40.0 på scenarios/optical-atmosphere-network.toml (seed 37, et steg på 600 s). Marginen faller under null under skyepisoder; i dette trekket er linken oppe 40.5 % av tiden, med 27 avbrudd og et lengste avbrudd på 30.7 h. Inndataene er illustrative, serien er ett trekk fra modellen og ikke klimaet, og den avviker fra den statistiske tilgjengeligheten (37.8 %) med samplingsfeilen i trekket. Kun veiledende analyse: ikke et sertifisert produkt for tilgjengelighet, integritet eller navigasjon, og ikke en prediksjon for noe ekte sted med mindre klimainndataene kommer fra et oppgitt datasett.">
</picture>

**Status i registeret: MODELLED.** Ett trekk fra modellen, ikke klimaet. [Optisk atmosfære](docs/OPTICAL-ATMOSPHERE.md).

### Nye Studio-visninger

[kshana.dev/studio](https://kshana.dev/studio/) får en Bridge-avspilling (to kjøringer side om side på én
oppdragsklokke, på [`/studio/replay/`](https://kshana.dev/studio/replay/)), en side for Optical PNT
(`/studio/optical/`), en side for holdover-test (`/studio/holdover/`) og en observatorievisning
(`/studio/observatory/`). De kjører den samme motoren i nettleseren, ingenting lastes opp, og de bærer
den samme veiledende erklæringen. Bildene ovenfor er tegnet fra motorens egne utdata av et skript;
de er ikke skjermbilder av disse sidene.

<a id="space-user-navigation-gnss-ssv"></a>
### Navigasjon for romfartøy (`gnss-ssv`)

For et romfartøy over, rundt eller langt forbi GNSS-banene: hvor mange GNSS-signaler det kan bruke, hvor
sterke de er, hvor god geometrien er, og hva et filter om bord kan gjøre med dem. Én type,
fire moduser, valgt av scenarioets tabeller: et **skall** av brukere (andelen av tiden med ett og fire
signaler, per konstellasjon), en **bane** (signaler, C/N0, presisjonsutvanning og
mediet for randstråler langs en bane), en **navigasjonskjøring** (et filter med ni tilstander på pseudoavstander, til
Månen) og en **formasjon** (relativ navigasjon av følgefartøyer rundt et ledefartøy). Den offentlige kilden for
sammenligningen av tilgjengelighet er heftet om det interoperable GNSS Space Service Volume (UN OOSA
ST/SPACE/75, fra International Committee on GNSS), som selv er en simulering; det hentes, det tas aldri
inn i repositoriet. Hel side: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Signaltilgjengelighet for en bruker på en kule i 36000 km høyde med en halvkuleantenne, fra en ekte kjøring av motoren v0.40.0 på scenarios/gnss-ssv-shell.toml (en redusert kjøring: 162 brukere, 3 døgn, steg på 10 min), ved en terskel på 20 dB-Hz. For hver konstellasjon og hvert bånd to søyler: andelen (bruker, epoke)-par med minst ett signal og med minst fire. Kombinert, L1: 99.4 % minst ett, 73.2 % minst fire, lengste avbrudd under fire signaler 160 min. Kombinert, L5: 100.0 % minst ett, 99.9 % minst fire, lengste avbrudd under fire signaler 20 min. MODELLED: en modellert studie fra oppgitte inndata, ikke en måling og ikke en påstand om tjenestevolum for noe system. Den reduserte størrelsen er ikke sammenligningen med heftet. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Signaler langs én høy jordbane (perigeum 497 km, apogeum 58622 km, periode 18.8 h), fra en ekte kjøring av motoren v0.40.0 på scenarios/gnss-ssv-heo.toml, bånd L1. Øverst: den beste bærebølge-til-støy-tettheten blant signalene i sikte, mot terskelen på 20 dB-Hz. I midten: antall signaler i sikte fra alle konstellasjoner, fra 4 til 55 langs de samplede punktene. Av de mottatte linkene kom 2252 gjennom en hovedlobe og 696 gjennom sidelober, med et merket parametrisk stedfortrederdiagram, ikke noe systems målte diagram. Median PDOP 67, 95. persentil 358. MODELLED: en modellert studie fra oppgitte inndata, ikke en måling og ikke en påstand om tjenestevolum for noe system. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Et filter med ni tilstander om bord på en overføring fra lav bane mot Månen, fra en ekte kjøring av motoren v0.40.0 på scenarios/gnss-ssv-nav-lunar.toml (289 epoker, 13 punkter tegnet). På en logaritmisk akse den sanne posisjonsfeilen og filterets egen én-sigma-grense mot tid siden start. Innenfor GNSS-banene er posisjons-RMS 1.4 m; over dem er den 90 m, med den endelige feilen 184 m i 193,330 km høyde med 1 måling. Gjennomsnittlig normalisert kvadrert estimeringsfeil over hele kjøringen er 4.4 (omtrent 3 for en konsistent posisjonsblokk). Fasit og filter deler stedfortrederne for Sola og Månen. MODELLED: en modellert studie fra oppgitte inndata, ikke en måling og ikke en påstand om tjenestevolum for noe system. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Relativ navigasjon av 2 følgefartøyer rundt et ledefartøy i en høy bane, fra en ekte kjøring av motoren v0.40.0 på scenarios/gnss-ssv-formation-heo.toml (401 epoker). For hvert følgefartøy to søyler: relativ posisjons-RMS ved å trekke fra de to uavhengige absolutte estimatene, og fra det relative filteret på enkeltdifferensierte pseudoavstander. Grunnlinje 0.8 km: 5.1 m og 1.2 m. Grunnlinje 2.0 km: 4.1 m og 2.1 m. Det absolutte filteret er ikke konsistent her: gjennomsnittlig normalisert kvadrert estimeringsfeil 187 mot omtrent 3 for et konsistent filter, så den oppgitte usikkerheten er altfor liten. MODELLED: en modellert studie fra oppgitte inndata, ikke en måling og ikke en påstand om tjenestevolum for noe system. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

**Status i registeret: MODELLED, og sammenligningen med heftet bommer for det meste.** Tersklene ble fastsatt før
kjøringen. Av åtte er bare S0 (det inverse linkbudsjettet, 13 av 13 verdier) og S6 (måneoppdraget)
oppfylt. **S1 til S5 og S7 er NOT MET**: geometrien i øvre og nedre tjenestevolum (43 av 52 og 48 av 52
celler), øvre tjenestevolum ved 15/20/25 dB-Hz, de seks GEO-oppdragene, HEO-oppdraget, og det
parametriske sidelobediagrammet mot målte diagrammer for GPS-paneler. Nesten hver bom i S1 til S5 involverer
GLONASS, og heftet trykker to forskjellige referansevinkler for det; en diagnostisk variant som bruker det
andre paret, bringer S1, S2 og S4 til alle celler, men den erstatter ikke den registrerte kjøringen, og ingen rad er
VALIDATED. Det absolutte filteret i formasjonskjøringen er også overkonfident (gjennomsnittlig normalisert kvadrert feil
godt over verdien på omtrent 3 som et konsistent filter gir).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="Den registrerte sammenligningen av tilgjengelighetsmodellen for romfartøy med det offentlige heftet om Space Service Volume, fra de innsjekkede resultatene av den forhåndsregistrerte kjøringen (xval/gnss-ssv/results-run1.json, skrevet av eksempelet ssv_booklet_check i motoren v0.40.0). Søyle for søyle, cellene innenfor toleransen: S0 13 av 13 (MET); S1 43 av 52 (NOT MET); S2 48 av 52 (NOT MET); S3 122 av 155 (NOT MET); S4 132 av 156 (NOT MET); S5 18 av 26 (NOT MET); S6 26 av 26 (MET); S7 0 av 20 paneldiagrammer (NOT MET). Bare S0 og S6 er oppfylt under den forhåndsregistrerte lesningen. En diagnostisk variant som bruker heftets andre GLONASS-vinkler, bringer S1, S2 og S4 til alle celler, men erstatter ikke den registrerte kjøringen. Ingen registerrad er VALIDATED. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

[Navigasjon for romfartøy](docs/SSV.md), [hva sammenligningen viser](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Måneinfrastruktur (`lunar-infrastructure`)

Månens bane og overflate som navigasjons- og geodetisk infrastruktur, i fem studier valgt med
`study`: **od-consistency** (en banebestemmelse om bord med jord-GNSS i en halobane mot en
uavhengig banebestemmelse fra bakken), **carrier-phase** (fastsetting av heltallsflertydighet mellom overflatestasjoner og en
orbiter), **frame-coestimation** (månedatumet fra avstandsmåling fra jordstasjoner med og uten orbiter-
linker), **space-tie** (laser-, VLBI- og GNSS-forskyvninger på ett romfartøy mot feilen i den lokale knytningen) og
**geodesy-sensitivity** (hvilken familie av observabler som ser Love-tallene h2, k2 og l2). Modellen er en
begrenset trelegememodell med oppgitte forenklinger og illustrative inndata. Hel side:
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
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Konsistensen mellom en banebestemmelse om bord med jord-GNSS i en nesten rettlinjet halobane og en uavhengig banebestemmelse fra bakken, fra ekte kjøringer av motoren v0.40.0 på scenarios/lunar-infrastructure-od-consistency.toml og modellfeilvarianten (400 forsøk hver). Gjennomsnittlig normalisert differanse q er 5.81 uten modellfeil og 5.95 med en injisert akselerasjonsfeil på 3e-10 m/s2, mot 6 forventet: de to baneløsningene er konsistente (terskel C1 MET). Andelen forsøk over 95 %-punktet er 0.040 og 0.052; terskelen for å detektere den injiserte feilen var minst 0.5, så den er NOT MET (C3): løsningen om bord er kjent til omtrent 352 m mot 23 m for den fra bakken, så en forskyvning på ti meter skjuler seg inne i kovariansen. MODELLED: en begrenset trelegememodell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen månestørrelse. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Fastsetting av heltallsflertydighet i bærebølgefase mellom overflatestasjoner på Månen og en orbiter, fra det innsjekkede resultatet av den scorede kjøringen av motoren v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 buelengder, en Monte Carlo med 401 trekk hver, skrevet av scenarios/carrier-phase-scored.toml). 1 døgn: suksess 1.0 % (standardfeil 0.5 %), 134 flertydigheter, orbiterens posisjonssigma 45.6 m flytende og 18.5 m fastsatt; 2 døgn: suksess 0.5 % (standardfeil 0.4 %), 259 flertydigheter, orbiterens posisjonssigma 21.5 m flytende og 8.7 m fastsatt; 3 døgn: suksess 2.8 % (standardfeil 0.8 %), 375 flertydigheter, orbiterens posisjonssigma 6.3 m flytende og 2.1 m fastsatt. Heltallsfastsetting oppnås ikke: suksessen holder seg mellom 1 % og 3 % ved 25 dBi, og ved de registrerte 12 dBi kan problemet ikke stilles opp. MODELLED: en begrenset trelegememodell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen månestørrelse. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Presisjonen til månedatumet med sju parametere (tre translasjoner, en skala og tre rotasjoner) fra avstandsmåling fra jordstasjoner, med og uten avstander fra orbiter til overflatestasjon, fra en ekte kjøring av motoren v0.40.0 på scenarios/lunar-infrastructure-frame-coestimation.toml. Cramer-Rao-sigmaen for translasjonene og rotasjonene faller med orbiter-linkene (for eksempel t_z fra 0.98 m til 0.046 m); den minste egenverdien for informasjon øker 111 ganger og CRLB-sporet faller til 1.0 % (terskel F3 MET). Dette forutsetter at banen er kjent i måneaksene, med feilen båret av orbiterens avstandssigma på 1 m. MODELLED: en begrenset trelegememodell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen månestørrelse. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Presisjonen til forskyvningene mellom posisjonene fra laseravstandsmåling, VLBI og GNSS for ett romfartøy, mot feilen i den lokale knytningen på bakken, fra en ekte kjøring av motoren v0.40.0 på scenarios/lunar-infrastructure-space-tie.toml (én bue på 6.56 døgn, teknikksigmaer GNSS 10 m, VLBI 1 m, laser 0.1 m). Med en lokal knytning fra 1 mm til 1 m holder sigmaen for translasjonen laser minus GNSS seg nær 1.04 m til knytningen når 1 m: den begrenses av teknikkenes målestøy, ikke av den lokale knytningen. Gulvet satt av knytningen alene er kvadratroten av to ganger dens sigma. MODELLED: en begrenset trelegememodell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen månestørrelse. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Hvilken familie av observabler som er følsom for Månens Love-tall h2, k2 og l2, fra en ekte kjøring av motoren v0.40.0 på scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Hver celle er RMS av den partielle deriverte av en families observasjoner med hensyn til en parameter, i familiens egne enheter (så celler sammenlignes langs en rad, ikke nedover en kolonne); en strek betyr at familien ikke har noen følsomhet. laseravstandsmåling: h2 7.6, k2 ingen, l2 9.8. orbitersporing: h2 ingen, k2 0.00086, l2 ingen. overflategravimeter: h2 2.9e+03, k2 4.3e+03, l2 ingen. overflateklokke: h2 2.8e-17, k2 2.8e-17, l2 ingen. Med alle fire familiene er Cramer-Rao-sigmaen 0.36 % av nominell h2, 0.52 % av k2 og 1.16 % av l2. Å legge til en familie senket aldri den minste egenverdien (28 av 28 tillegg), men sporet til pseudoinversen var ikke større i bare 16 av 28: den halvdelen av terskel G3 er NOT MET. Orbiterfamilien ser siktlinjeintegralet av k2-akselerasjonen, et tall i den øvre enden. MODELLED: en begrenset trelegememodell med oppgitte forenklinger og illustrative inndata, ikke en måling av noen månestørrelse. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en livskritisk sikkerhetstjeneste.">
</picture>

**Status i registeret: MODELLED, og tre terskler er NOT MET.** Numerikken er kontrollert mot uavhengige
numpy- og scipy-programmer; ingenting sammenlignes med en måling av en månestørrelse, og ingenting er
VALIDATED. Oppfylt: de to baneløsningene er konsistente (gjennomsnittlig q 5.81 mot 6 forventet), og orbiter-
linker øker den minste egenverdien for datumet omtrent 111 ganger, forutsatt en kjent bane. **Ikke oppfylt**: den
injiserte modellfeilen på 3e-10 m/s2 **detekteres ikke** (C3: løsningen om bord er kjent til omtrent 350 m, så
omtrent ti meter skjuler seg i kovariansen); **heltallsfastsetting oppnås ikke** (1 til 3 % suksess ved
25 dBi, og ved de registrerte 12 dBi kan problemet ikke stilles opp); og spor-halvdelen av G3 for å legge til en
familie av observabler (sporet økte i 12 av 28 tillegg, hver gang fordi familien økte rangen).
Hver bom er låst fast av en test. [Måneinfrastruktur](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Åpne [kshana.dev/studio](https://kshana.dev/studio/), så kjører hele motoren i
nettleseren din, kompilert til WebAssembly. Ingenting å installere, og ingenting lastes opp. Studio har
to visninger av den samme motoren, og en bryter i toppfeltet flytter mellom dem og beholder
scenarioet, visningen og alle innstillinger du har endret.

**Den enkle visningen** er der Studio åpner. Den starter fra spørsmål (hvor mange satellitter
kan jeg se, kan jeg stole på posisjonsbestemmelsen min, hvor lenge kan en klokke holde tiden, hva gjør en jammer
med mottakeren min) og fra et kart over alt motoren kan gjøre, hvert område med sin andel av
validerte metoder. Åpne et scenario, så kommer svaret først: én enkel setning, skrevet for
det scenarioet måler, deretter nøkkeltallene og et diagram. Høyst fem innstillinger
vises, de som endrer svaret mest; resten venter under **Avanserte innstillinger**.
**Slik beregnes dette** forklarer metoden, og **For forskere** gir motorens egne
tall, scenariofilen, koden for å kjøre den fra Python og siteringen.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, enkel visning, på det medfølgende scenarioet integrity-raim, motoren v0.40.0 kjører lokalt. Spørsmålet: oppfyller geometrien alarmgrensene (horisontalt og vertikalt beskyttelsesnivå)? Svaret først, merket Live-resultat: Ja, for det meste: i 95.3 % av de 12 h. Mottakerens feilgrense holdt seg under alarmgrensene (40 m horisontalt og 50 m vertikalt) ved 344 av 361 kontroller, og ingen posisjonsbestemmelse var villedende. Nøkkeltall: tid posisjonsbestemmelsen kan stoles på 95.3 %, lengste gap 10 min, typisk feilgrense 6.5 / 13 m, villedende posisjonsbestemmelser 0. Ved siden av: Prøv andre innstillinger med fem av dem (avstandsfeilen, de to alarmgrensene, varigheten og elevasjonsmasken) og Kjør igjen, deretter de sammenfoldede seksjonene Avanserte innstillinger (13 til), Slik beregnes dette (8 validert, 6 modellert) og For forskere. Nedenfor visningene av dette resultatet og beskyttelsesnivåene plottet mot alarmgrensen." width="100%">
</picture>

**Den avanserte visningen** er hele dashbordet: scenariobiblioteket, fem nummererte trinn
(Velg, Still inn, Kjør, Les resultater, Del eller eksporter), nøkkeltallene med PASS- og FAIL-merker
der kjøringen oppgir en terskel, og hvert panel: oversikt, diagrammer, kart, avspilling,
motorens rapport og eksporter. Én søkeboks når scenarioer, domener og feltene i
dem, og du kan feste opptil fire kjøringer og sammenligne dem side om side.

<details>
<summary>Startskjermen i den enkle visningen, og den avanserte visningen etter en kjøring</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, enkel visning, startskjerm, med tittelen Hva vil du finne ut?, med motoren v0.40.0 live og, i topplinjen, tre lenker: Treningsdebrief, Interferenskart og Mottakertillit. Fire spørsmål: hvor mange satellitter kan jeg se hvor som helst på jorden, kan jeg stole på posisjonsbestemmelsen min, hvor lenge kan en klokke holde tiden uten satellitter, og hva gjør en jammer med mottakeren min. Under det første, det registrerte resultatet: minst 22 satellitter i sikte på hvert sted og 31 i gjennomsnitt med GPS, Galileo, BeiDou og GLONASS sammen, posisjonsbestemmelse mulig på 100 % av steder og tidspunkter, på et verdenskart over satellitter i sikte, med en knapp Åpne dette resultatet. Ved siden av: Alt Kshana kan gjøre: 16 områder og 139 kjøreklare scenarioer, hver flis med et lite diagram fra en registrert kjøring og sin andel av validerte metoder, og registerets 173 av 350 funksjoner validert." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, avansert visning, etter en kjøring av det medfølgende scenarioet constellation-multi-gnss-coverage (Fire GNSS-konstellasjoner, ett kart), motoren v0.40.0 kjører lokalt. Til venstre scenariobiblioteket, 139 scenarioer i 16 domener. De fem trinnene Velg, Still inn, Kjør, Les resultater og Del eller eksporter, med trinn 4 aktivt. Nøkkeltall: 102 satellitter, tilgjengelighet 100 % (PASS), median presisjonsutvanning for posisjon (PDOP) 0.95 (PASS), PDOP 95. persentil 1.105 (PASS), 31.03 satellitter i sikte i gjennomsnitt og 22 som færrest. Nedenfor panelraden med Dekning valgt, avspillingslinjen, et verdenskart over gjennomsnittlig PDOP fra 0.831 til 1.0853 med hver satellitt tegnet, og de globale dekningstallene." width="100%">
</picture>

</details>

Kildekoden til Studio og byggenotatene står i [`web/README.md`](web/README.md).

### Nettstedet

Resten av [kshana.dev](https://kshana.dev) er bygget fra dette repositoriets egne filer og
motorkjøringer: oppdrag, funksjoner, evidensregisteret, den publiserte forskningen og
utgavene.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Tre sider av kshana.dev side om side. Forsidens toppfelt: navnelinjen Kshana · क्षण · the precise instant over overskriften Rehearse the minute GNSS goes dark, med oppdragskonsollen fra en ekte kjøring av motoren v0.40.0 (en globus og tre live-diagrammer: klokkens tidsfeil, bærebølge-til-støy-tetthet og beskyttelsesnivå). Evidens, publisert forskning: de seks arXiv-artiklene bygget på den åpne motoren, den nyeste med en figur fra motoren. Utgaver, Kshana Pro, den samme motoren, forsterket: Free kjører ett scenario, Pro besvarer programmets spørsmål." width="100%">
</picture>

<a id="capabilities"></a>
## Funksjoner

Én motor dekker hele feilkjeden, fra den første jammede satellitten til det siste
nanosekundet av klokke-holdover. Motoren har 92 scenariotyper; `kshana kinds` lister
dem og [`docs/SCENARIOS.md`](docs/SCENARIOS.md) dokumenterer hvert felt.

| Funksjon | Hva den besvarer |
|---|---|
| [Spektrum](docs/SPECTRUM.md) | hvordan en jammer tar GNSS-L-båndet, bånd for bånd, sekund for sekund |
| [Klokker og tidssynkronisering](docs/TELECOM-TIMING.md) | hvor lenge hver klokke holder tiden etter at GNSS er borte |
| [Konstellasjoner rundt ethvert legeme](docs/CONSTELLATION-DESIGN.md) | dekning, presisjonsutvanning og tilgjengelighet rundt Jorden, Månen eller Mars |
| [Solsystemet](docs/SOLAR-SYSTEM.md) | hvor hver planet er, og lystiden for enhver link |
| [Navigasjon i lav jordbane](docs/LEO-PNT.md) | en passering, en link, en navigasjonsmelding og en fusjonert posisjonsbestemmelse, trinn for trinn |
| [Kampanjer](docs/CAMPAIGNS.md) | et kjedet oppdrag, et sveip eller et Monte Carlo-ensemble i ett scenario |
| [Animasjon](docs/ANIMATION.md) | en kjørings tidsserier som en animert tegning, en spiller eller rammer |
| [Rapporter](docs/REPORTS.md) | hvert tall med sin enhet og sin merkelapp, i HTML (HyperText Markup Language) og JSON (JavaScript Object Notation) |
| [Eksport for interoperabilitet](docs/INTEROP.md) | baner og geometri for andre verktøy: SP3, CCSDS OMM og OEM, CZML, KML, GeoJSON, STK og SigMF |
| [Maritim tillit](docs/MARITIME-TRUST.md) | kan broen stole på denne posisjonsbestemmelsen: en score fra 0 til 100 og begrunnelser for et fartøys NMEA, live eller fra en logg (veiledende, ikke typegodkjent navigasjonsutstyr) |
| [NMEA-treningsstrømmer](docs/NMEA-TRAINING.md) | syntetisk NMEA for broen med skriptet jamming og spoofing og en instruktørlogg, for mannskapstrening (bare tekst; aldri for et fartøys aktive navigasjonssystemer; veiledende, ikke typegodkjent navigasjonsutstyr) |
| [Interferenskart](docs/INTERFERENCE-MAP.md) | hvor fly og skip rapporterte degraderte navigasjonsdata, og hvor mye av en rute det berører |
| [Kildeområde](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | hvor, under oppgitte forutsetninger, en kilde til degraderte posisjonsrapporter kan være: områder med oppgitt konfidens, et tyngdepunkt med sin ellipse, aldri et punkt (MODELLED; `kshana interference-map locate`) |
| [Bevispakker](docs/EVIDENCE-PACKS.md) | et signert, frakoblet verifiserbart teknisk dokument over et fartøys loggvindu og hva motoren beregnet fra det, for en hendelsesrapport (veiledende, ikke typegodkjent navigasjonsutstyr) |
| [Tillitstelemetri](docs/TRUST-TELEMETRY.md) | tillitsstrømmen som Prometheus-metrikker, SIEM-hendelser og valgfri OpenTelemetry, med et eksempel på et Grafana-dashbord (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K og OpenCPN](docs/MARINE-INTEGRATIONS.md) | tillitsscoren på en båts Signal K-server og i OpenCPN, med et referansebygg for en liten datamaskin ved siden av mottakeren (veiledende, ikke typegodkjent navigasjonsutstyr) |
| [Testbenkeksport](docs/TEST-BENCH.md) | `kshana bench-export`: et scenarios fartøysbevegelse og hendelser for en GNSS-simulator i laboratoriet (ingen signal skrives), og hvordan mottakerens logg scores etterpå |
| [Kartlegging og rapport mot compliance](docs/compliance/README.md) | `kshana compliance-report`: hvilke rader i offentlige rammeverk for robusthet et sett kjøringer støtter evidens for, og gapet som gjenstår |
| [Notatbøker](notebooks/README.md) | kjørbare veiledninger: fartøystillit og treningsstrømmer, ruteeksponering i et interferenskart, kartlegging mot compliance og testbenken, kvante- mot klassisk GDOP |
| [Galileo OSNMA-verifikator](docs/OSNMA.md) | hvilke satellitters navigasjonsdata en mottaker kan autentisere kryptografisk, og hvorfor en kontroll feiler; Kshana gir ingen rettigheter under EUs OSNMA ICD IPRs (se NOTICE på siden) |

Eksportformatene i sin helhet: SP3 er Standard Product 3; CCSDS OMM og OEM er Orbit
Mean-elements Message og Orbit Ephemeris Message fra Consultative Committee for Space Data
Systems; CZML og KML er Cesium og Keyhole Markup Language; STK er Systems Tool Kit;
SigMF er Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="Den kjedede kampanjen campaign-jam-spoof-holdover-integrity, én ekte kjøring av motoren (seed 20260928): 6 faser (Nominell → Jamming → Spoofing → Holdover → Integritetsalarm → Gjenoppretting) og 18 medlemskjøringer på et rutenett med 10 s over T+01:16:10. Tre baner: klokkens tidsfeil mot en vaktgrense på 50 ns (topp 62.7 ns), effektiv bærebølge-til-støy-tetthet mot et gulv på 25 dB-Hz (minimum -12.2 dB-Hz), og vertikalt beskyttelsesnivå mot en alarmgrense på 50 m (topp 135.4 m), med kjøringens alarmhendelser: T+00:20:00 alarmer fra RF-spoofingdetektoren (fusjonerte overvåkere for konsistens, effekt og signalkvalitet); T+00:26:10 alarmer fra den klokkestøttede spoofingovervåkeren." width="100%">
</picture>

<details>
<summary>Hver funksjon, tegnet fra en ekte kjøring: L-bånd-fossefallet, dekningskartet, solsystemet og en passering i lav jordbane</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="GNSS-L-båndet som én spektral effekttetthet over 60 s, fra en ekte kjøring av spektrumtypen (l-band-waterfall-jamming.toml, seed 7, motoren v0.40.0): frekvens bortover, tid nedover, farge for effekt over støygulvet på -202.0 dBW/Hz. Jammere: personlig chirp-jammer (chirp, på ved 10 s, av ved 40 s); CW-tone på L1 (cw, på ved 30 s); smalbåndsstøy på L2 (narrowband, på ved 45 s). Verste bånd GPS L1 C/A: minste effektive C/N0 3.2 dB-Hz ved 31 s mot et sporingsgulv på 25 dB-Hz. GPS L1 C/A minimum 3.2 dB-Hz; Galileo E1 minimum 4.7 dB-Hz; GPS L2C minimum 36.9 dB-Hz; GPS L5 minimum 44.1 dB-Hz; Galileo E5a minimum 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Satellitter i sikte over hele jorden i ett døgn, fra en ekte kjøring av constellation-design (constellation-multi-gnss-coverage.toml, motoren kjørt av denne generatoren): 102 satellitter (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Hver celle på 10 grader er skyggelagt etter gjennomsnittlig antall satellitter over masken på 10 grader (27.2 til 36.5); prikkene er motorens bakkesporsampler, ett per time per satellitt. Global tilgjengelighet 100.00 % ved PDOP på eller under 6, median PDOP 0.95, gjennomsnitt 31.0 og minimum 22 satellitter i sikte." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Solsystemet ved scenarioets epoke 2026-09-28T00:00:00, fra en ekte kjøring av solar-system-typen (solar-system-tour.toml): Sola, 9 planeter og dvergplaneten Pluto sett ovenfra ekliptikken, avstander komprimert logaritmisk for visning, med hvert legemes enveis lystid fra Jorden. Merkur 0.47 au, 10.1 lysminutter, VALIDATED; Venus 0.73 au, 3.0 lysminutter, VALIDATED; Mars 1.55 au, 14.0 lysminutter, VALIDATED; Jupiter 5.30 au, 49.5 lysminutter, VALIDATED; Saturn 9.44 au, 70.2 lysminutter, VALIDATED; Uranus 19.44 au, 157.4 lysminutter, MODELLED; Neptun 29.88 au, 240.2 lysminutter, MODELLED; Pluto 35.61 au, 292.2 lysminutter, MODELLED. Linker: Mars til Jupiter enveis 2193.5 s; Saturn til Jorden enveis 4212.2 s; Europa til Jupiter enveis 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Én passering i lav jordbane (LEO) fra en ekte kjøring av leo-pass-typen (leo-pass-iridium.toml, motoren kjørt av denne generatoren): Iridium-pass i 781 km, STL-bånd på 1621 MHz, sett av en luftbruker på 50° N 30° W. Over masken på 5° i 750 s, maksimal elevasjon 65.0° ved 444 s. Bærebølge-til-støy-tettheten topper på 80.5 dB-Hz (median 71.3), 34.3 dB over GNSS-medianen på 46.2 dB-Hz fra 8 GPS-satellitter i sikte (38.2 til 51.1 dB-Hz); Doppler når 35.4 kHz." width="100%">
</picture>

Kjør hvilken som helst av dem med `kshana example <scenario> > s.toml && kshana s.toml`: scenarioene
er `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
og `leo-pass-iridium`.

</details>

<details>
<summary>De maritime funksjonene og interferensfunksjonene, tegnet fra innsjekkede syntetiske inndata: en tillitsscore, et interferenskart med ruteeksponering, en treningsstrøm og en bevispakke</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Tillitsscore over én syntetisk overfart, fra en ekte kjøring av motoren v0.40.0 på examples/maritime-trust (en oppdiktet NMEA-logg fra en ferje på en rute fra Tallinn til Helsingfors, 3001 epoker ved 1 Hz). Tre baner deler én tidsakse. Øverst: avstanden mellom posisjonen mottakeren rapporterer og fartøyets virkelige posisjon, som holder seg innenfor noen få meter til omtrent 1576 s, da loggens skriptede posisjonsavdrift trekker den bort, mens mottakeren fortsetter å rapportere en gyldig posisjonsbestemmelse. I midten: tillitsscoren fra 0 til 100, ikke beregnet i de første 300 s med kalibrering, i det nominelle båndet (minst 90) frem til avdriften, deretter fallende gjennom det degraderte båndet (minst 55) ned i båndet for ikke klarert. Nederst: båndet for hver epoke som et farget bånd med navnet sitt. Scoren er veiledende. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC 61108, IEC 61162): operatøren er fortsatt ansvarlig for fartøyets navigasjon. Loggen er oppdiktet for å vise formatet og overvåkerne; den er ikke en måling og sier ingenting om hvordan noen mottaker ville prestere." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="To syntetiske interferenskartdøgn tegnet fra de innsjekkede eksemplene i examples/interference-map/output, hver med sin egen syntetiske rute og andelene av ruteeksponering som motoren rapporterer. Til venstre et ADS-B-døgn: 1 degradert celle, 6 ikke degradert, 4 ikke vurdert (skravert) og celler uten oppføring, tegnet tomme, som ikke ble observert. Ruten er 525 km: 11.5% av lengden i degraderte celler, 38.3% ikke degradert, 9.1% ikke vurdert og 41.1% ikke observert. Til høyre et AIS-døgn: celler flagget av sirkel- og på-land-detektorene, ikke-anomale celler og tomme celler; ruten er 454 km med 10.5% i anomale celler, 21.2% ikke anomale, 0.0% ikke vurdert og 68.3% ikke observert. ADS-B og AIS er separate lag, aldri kombinert. En flagget celle er ikke et funn av interferens, og en celle uten farge ble ikke observert, noe som ikke er det samme som klar. Alle data er oppdiktet, i det åpne midtre Atlanterhavet, og ikke en måling." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Treningsstrøm fra scenarioet coastal-drag-off (motoren v0.40.0, seed 22, 25 minutter med én posisjonsbestemmelse per 10 s i instruktørloggen). Et kart viser fartøyets sanne spor og sporet mottakeren rapporterer: de stemmer overens til en skriptet posisjonsavdrift begynner ved 421 s, det rapporterte sporet vandrer deretter bort fra det sanne mens mottakeren beholder en gyldig posisjonsbestemmelse, og det hopper tilbake når hendelsen slutter ved 1140 s. Ved siden av avstanden mellom de to sporene over tid, og den gjennomsnittlige bærebølge-til-støy-tettheten mottakeren rapporterer, som stiger til ett hevet nivå mens hendelsen varer. Syntetiske treningsdata generert av Kshana. Bare for trening og testing: mat aldri denne strømmen inn i et fartøys aktive navigasjonssystemer. Veiledende, ikke typegodkjent navigasjonsutstyr. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC 61108, IEC 61162): operatøren er fortsatt ansvarlig for fartøyets navigasjon. Posisjoner, datoer og spor er oppdiktet." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Strukturen i en bevispakke. En mottakerlogg (NMEA, u-blox UBX, RINEX 3 eller en Android-logg) og et tidsvindu går inn i kshana receiver-trust evidence, som skriver sju filer: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig og en valgfri timestamp.tsr. Manifestet registrerer SHA-256 for hele loggen og for hver fil og en hashkjede over filene; signaturen dekker manifestet. kshana evidence verify kontrollerer signaturen, hver fils hash, kjeden og at ingen fil som ikke er oppført, finnes, og avslutter med 0 når den er verifisert, 1 når noe feilet og 3 når signereren ikke var festet. En pakke er et teknisk dokument, ikke en juridisk vurdering." width="100%">
</picture>

Alle fire er oppdiktede data og veiledende: de viser formatet og programvarens oppførsel, ikke hvordan noen mottaker eller noe system presterer mot interferens. Kjør den første med `kshana receiver-trust examples/maritime-trust/session.toml`, den andre med `kshana route-exposure` på eksemplene i `examples/interference-map/`, den tredje med `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (bare til trening: mat den aldri inn i aktivt navigasjonsutstyr), og den fjerde som i [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Hele funksjonstabellen, domene for domene</summary>

Hele detaljen domene for domene følger; for et modenhetsregister per funksjon, se
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) og [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Domene | Funksjon |
|--------|------------|
| **Bane og geometri** | SGP4/SDP4-propagering (validert til 4.12 mm mot alle 666 AIAA 2006-6753-vektorer); ekte tolinjeelementer (et innsjekket, datostemplet Celestrak `gps-ops`-øyeblikksbilde) eller syntetiske Walker-delta-konstellasjoner der middelelementene realiserer `i:T/P/F`-formelen til under 1 km over en propagering på 24 h; synlighet for flere konstellasjoner, **presisjonsutvanning — geometrisk, posisjon, horisontal, vertikal og tid (GDOP/PDOP/HDOP/VDOP/TDOP), validert til 1e-6 mot gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), og GNSS-tilgjengelighet; en gradientfri optimerer for konstellasjonsdesign, dimensjonering av minste antall satellitter med streets-of-coverage, et verktøy for å sammenligne flere konstellasjoner, og et Walker-**designsveip** som tabulerer dekning / PDOP / gjenbesøkstid over et rutenett av baneplan × satellitter og rapporterer de Pareto-optimale designene. |
| **Numerisk propagator** | En numerisk **Cowell**-propagator (`src/propagator.rs`) som utfyller den analytiske SGP4/SDP4-veien, med en hierarkisk kraftmodell med **sju perturbasjoner** (`src/forces.rs`): tolegeme + hele det **zonale J2–J6**-feltet (de zonale harmoniske koeffisientene for jordens avflatning J2 til J6; den eksakte analytiske gradienten av forstyrrelsespotensialet), et valgfritt **tesseralt sfærisk-harmonisk EGM2008-geopotensial til grad/orden 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; ekte koeffisienter fra NGA — US (United States) National Geospatial-Intelligence Agency —, Holmes–Featherstone-rekursjon med normaliserte Legendre-funksjoner, kryssjekket mot Legendre-funksjonene på lukket form og den analytiske ∇V-identiteten), **epokestyrt tredjelegemegravitasjon fra Sola og Månen** (en innebygd efemeride med lav presisjon, ingen DE/SPK-kjerne — Development Ephemeris / SPICE Spacecraft and Planet Kernel), **strålingstrykk fra Sola** (kanonkulemodell med konisk umbra+penumbra-skygge), **atmosfærisk luftmotstand** (Vallados stykkevis eksponentielle tetthet, medroterende atmosfære), den **post-newtonske relativistiske Schwarzschild-korreksjonen**, og **Lense–Thirring-leddet for rammedraging** (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, lineært i jordens dreieimpuls, ~1–2 størrelsesordener under Schwarzschild) — drevet av et valg mellom to adaptive integratorer (RK4 — fjerdeordens Runge–Kutta — med stegdobling eller det innebygde **Dormand–Prince RK5(4)**-paret). **Validert mot Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 epoker over LEO (lav jordbane) + GTO (geostasjonær overføringsbane), der nivåene med konservative krefter stemmer overens til i verste fall **\|Δr\| 0.08 m over 24 h** (`tests/numerical_cowell_propagator_reference.rs`); nivået med atmosfærisk luftmotstand karakteriseres separat (≈ 333 m / 24 h), og de absolutte inndataene for efemeridene til Sola/Månen og tettheten forblir ærlig **Modelled**. Ytterligere intern evidens (ikke ekstern validering): den uforstyrrede banen kontrolleres mot den eksakte Kepler-løsningen med universelle variabler til **under en meter over 24 h**, energi/dreieimpuls bevares til ~1e-9, og hver perturbasjon samsvarer med en håndutledet signatur på lukket form. |
| **Manøvrer og banedesign** | Impulsive ΔV-noder med propagering av 6×6-kovarians (ECI — jordsentrert inertialt — / LVLH — lokal vertikal, lokal horisontal — rammer for utførelsesfeil), integrasjon av endelige brenninger kontrollert mot **Tsiolkovskys** rakettligning på lukket form til < 0.01 %, en **Lambert**-løser for ett omløp etter **Izzo-2015**, en eksakt **Kepler**-propagator med universelle variabler, og et **porkchop**-sveip (oppskyting × ankomst) av C3 (oppskytingsenergi) / ankomst-V∞ levert som et JSON-konturnett — ytelsessimuleringslaget over GMAT/Orekit, der hvert Lambert-resultat sendes tur-retur mot tolegemefasit og porkchop-minimumet kontrolleres mot det analytiske Hohmann-gulvet. |
| **Tidssystemer og referansesystemer** | IERS-skalaene med skuddsekunder **UTC / TAI / TT / UT1** (Coordinated Universal Time, International Atomic Time, Terrestrial Time og jordrotasjonstiden Universal Time 1), et API (programmeringsgrensesnitt) for juliansk dato, IAU-2000 (International Astronomical Union) **Earth Rotation Angle** (ERA), GMST-basert (Greenwich Mean Sidereal Time) **TEME ↔ ECEF** (sann ekvator, middel jevndøgnspunkt ↔ jordsentrert, jordfast) med geodetiske WGS-84-rammer (World Geodetic System 1984), IAU 2006-presesjon (Fukushima–Williams), full **IAU 2000A/2000B-nutasjon**, IERS **polbevegelse**, og den jevndøgnsfrie **CIO-baserte IAU 2006/2000A GCRS↔ITRS**-reduksjonen (CIO = Celestial Intermediate Origin) — alt validert **bit for bit** mot SOFA/ERFA-vektorene, og **uavhengig kryssjekket mot ANISE** (den rene Rust-reimplementeringen av NAIF/SPICE; NAIF = Navigation and Ancillary Information Facility ved NASA, US National Aeronautics and Space Administration): kshanas GCRS→ITRS mot ANISEs ITRF93 (International Terrestrial Reference Frame 1993) fra JPLs `earth_latest_high_prec.bpc`, med de samme IERS-parameterne for jordorientering gitt til begge, stemmer overens til **≤ 0.86 m på bakken / ≤ 3.6 m i GNSS-bane** (maks 0.028″) over åtte epoker 2020–2023. |
| **Treghetsnavigasjon** | Treakset strapdown-INS — kvaternionattitude, WGS-84 NED-mekanisering (nord-øst-ned), kompensasjon for coning/sculling, og en deterministisk IMU-feilmodell (skalafaktor, feiljustering, g-følsomhet, kvantisering, drift); et **akselerometer basert på kaldatominterferometri fra grunnprinsipper** (Mach–Zehnder-fase, kvanteprojeksjonsstøy, kontrastforfall, vibrasjonskobling) som *utleder* koeffisienten for hastighets-random-walk; og et **partikkelfilter** med sekvensiell importance-resampling for kartstøttet (terreng-/gravitasjonsreferert) navigasjon uten GPS. |
| **Alt-PNT (uten GPS)** | En **målemodell for gravimeter** med kalde atomer der hvitstøygulvet (`σ = ASD/√τ`, ASD = amplitudespektraltetthet) er utledet fra CAI-akselerometerets fysikk; et fullt normalisert **sfærisk-harmonisk felt for gravitasjonsanomalier** av lav grad (kontrollert mot Legendre-funksjonene på lukket form og en håndutledet enkeltleddsanomali) pluss syntetiske masconer; **syntesekjernen for gravitasjonsfunksjonaler** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — «kartleseren» en gravitasjonsstøttet navigator matcher mot — er validert mot **GRS80-standarden for normaltyngde** (Geodetic Reference System 1980), reproduserer Somiglianas normaltyngde på lukket form og de publiserte γ_e / γ_p til **3.5e-12** og produserer et fysisk avgrenset forstyrrelseskart fra det ekte **EGM2008**-feltet fra ICGEM (International Centre for Global Earth Models) (RMS — kvadratisk middelverdi — ≈ 26 mGal, maks ≈ 89 mGal ved g/o 70; `tests/icgem_gravity_reference.rs`); og et **partikkelfilter for gravitasjonskartmatching** som gjenvinner et spor uten GPS fra anomalisekvensen det flyr gjennom. Det utvides til **terrengreferert navigasjon** (TERCOM/SITAN — terrain contour matching / Sandia Inertial Terrain-Aided Navigation — mot en SRTM-DEM `.hgt` (Shuttle Radar Topography Mission, digital høydemodell), `src/altpnt/terrain.rs`), et **geomagnetisk hovedfelt IGRF-14** (14. generasjon av International Geomagnetic Reference Field) til grad/orden 13 (`src/igrf.rs`, kontrollert mot den skråstilte dipolen på lukket form og endelige differanser av ∇V), og en **kombinert navigator for gravitasjon + magnetisme + terreng** som fusjonerer alle tre skalare kanaler gjennom ett partikkelfilter (informasjon er additiv — ingen kanal gjør posisjonsbestemmelsen dårligere). En **60-minutters benchmark uten GPS** (et avbrudd på ~700 km / én time der treghetsløsningen driver til ~70 km) gjenvinnes til **~145 m (< 500 m)** av en hierarkisk matcher fra grov til fin — målet for ESA NAVISP (Navigation Innovation and Support Programme) *Quantum Wayfarer*. |
| **Fusjon** | Løst koblet GNSS/INS-feiltilstands-EKF (utvidet Kalman-filter) med 15 tilstander og lukket tilbakekobling (`gnss-ins`-pakken); en **tett koblet** pseudoavstandsoppdatering som fortsetter å korrigere med færre enn fire satellitter; et koblet **klokke + posisjon**-filter; en generell **unscented (sigma-punkt) Kalman**-estimator for sterkt ikke-lineære målinger; en tett koblet GNSS/INS-**UKF-navigator** (pseudoavstand + Doppler) der banekystingen med kraftmodell er selvkonsistenskontrollert til **0.77 m RMS** over en 30-minutters buet LEO-passering som inkluderer et GNSS-avbrudd på 120 sekunder (et tall for filterkonsistens, ikke en validering mot en ekstern referanse — denne navigatoren forblir MODELLED); og en full **tett koblet GNSS/INS-UKF med 17 tilstander** (posisjon, hastighet, attitudefeil, akselerometer- og gyrobias, klokkebias og drift) der **kvante-CAI-dødregningen** kyster gjennom et avbrudd på 120 sekunder på den utledede hastighets-random-walken til kaldatomakselerometeret. |
| **Banebestemmelse** | Gjenvinning av en banetilstand `[r, v]` fra avstandssporing fra bakkestasjoner, som setter sammen tolegeme + J2-kraftmodellen og RK4-integratoren med en **Gauss–Newton-batch**-korrektor (`determine_orbit_batch`, under en meter / mm·s⁻¹ fra støyfrie avstander, ~2 m ved et støygulv på 5 m) og en **sekvensiell** variant med unscented-filter (`determine_orbit_sequential`). |
| **Observerbarhet og estimeringsteori** | Et generelt, gjenbrukbart lag for **Fisher-informasjon / Cramér–Rao** (`src/fim.rs`): informasjonsmatrisen M = HᵀWH, **Cramér–Rao-nedre grense**, observerbarhet med **rang og nullrom for datumdefekt** (Moore–Penrose-pseudoinvers), og skalarer for **D/A/E/T-optimal** forsøksdesign fra en symmetrisk Jacobi-egenløser. **Validert** — egenverdier mot `numpy.linalg.eigh`, CRLB-kovariansen mot σ²(XᵀX)⁻¹ via `numpy.linalg.inv`, og GNSS-DOP fra informasjonsmatrisen, alt samsvarende til **1e-9** (`tests/fim_observability_reference.rs`), og i tillegg kryssjekket mot grensene på lukket form fra **Kay (1993)** med oppnåelse av CRLB i Monte Carlo. Det ligger til grunn for DOP-motoren, CRLB for passiv geolokalisering og **observerbarhetsteoremet** for absolutte månestasjoner (nedenfor). |
| **Måne og cislunart rom** | En propagator for det **sirkulære begrensede trelegemeproblemet (CR3BP)** for Jord–Måne i den roterende rammen — bevart Jacobi-konstant og alle fem Lagrange-punkter (`src/cr3bp.rs`) — nå med en **6×6 tilstandsovergangsmatrise (STM) og en differensialkorrektor med enkel skyting** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`) som produserer genuint periodiske **halo-/NRHO**-baner (nesten rettlinjet halobane): STM-en er validert mot endelige differanser, korrigerte baner lukkes til maskinpresisjon, og når den publiserte aposelen-tilstanden brukes som startverdi, reproduseres **den sørlige 9:2-NRHO-en ved L2** (L2 = det andre Lagrange-punktet for Jord–Måne; Gateway-banen) med periode ≈ 6.57 d / periselen ≈ 3,250 km, konsistent med de publiserte ≈ 6.56 d / ≈ 3,370 km (en CR3BP-løsning — sirkulær, uten Sola —, **ikke** validert mot en ekte efemeride for LANS (Lunar Augmented Navigation Service)/Gateway; den selenosentriske MCI/MCMF-transformasjonen (månesentrert inertialt / månesentrert, månefast) av den korrigerte banen er et oppfølgingsarbeid); pluss cislunar PNT-geometri for **LunaNet / LNIS** (LunaNet Interoperability Specification) (MCI↔MCMF-reduksjon, selenografiske koordinater) med en **ARAIM-passering over månens sørpol** som ærlig viser integritetsgapet: en σ_URE (brukeravstandsfeil) på ~30 m driver beskyttelsesnivået godt over en alarmgrense på 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); og en **DOP-forsterkning med overflatefyr** (`src/lunar_beacon.rs`) som viser hvordan noen få innmålte avstandsfyr på overflaten gir siktlinjeradene med lav elevasjon og bred asimut som et sett med bare baner rett over mangler — og dermed kollapser den dårlig kondisjonerte GDOP ved sørpolen og, via et feilbudsjett med kvadratisk sum, den realiserte posisjonsnøyaktigheten i meter (med gjenbruk av den gnss_lib_py-validerte DOP-kjernen og synlighet mot luftløs horisont på lukket form; analysen av presisjonsutvanning er beskrevet i [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **PNT-pakke for Månen** | En navigasjonspakke for Månen/cislunart rom bygget på CR3BP-kjernen, hver del en kjørbar `kind`: **Lunar Coordinate Time** (`lunar-time-offset`, `src/lunar_time.rs` — den sekulære raten LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL = den franske formen, Temps-Coordonnée Lunaire) fra forskjellen i egenpotensial + kinetisk ledd, rapportert sammen med det publiserte båndet på 56–59 µs/døgn); en geodetisk forsinkelsesobservabel for **måne-VLBI** (very-long-baseline interferometry) (`lunar-vlbi`, `src/lunar_vlbi.rs` — en nærfelts forsinkelse + rate fra to avstandsdifferanser på en jordbasislinje, kryssjekket mot Δ-DOR med plane bølger (delta differential one-way ranging) fra samme kodebase i fjernfeltgrensen, partielle deriverte verifisert med endelige differanser); en **felles multiteknikk-estimator for OD + klokke** (`lunar-joint-od-clock`, `src/lunar_combination.rs` — en Gauss–Newton-tilpasning som fusjonerer VLBI + lokale måneavstander + avstander mellom satellitter) med et **observerbarhetsresultat fra Fisher-informasjon**: intern avstandsmåling alene etterlater en **datumdefekt** for stivt legeme med seks frihetsgrader, så en overflatestasjons *absolutte* posisjon er ikke observerbar før en knytning til jordrammen legges til — en **VLBI**-forsinkelse på en jordbasislinje *gjenoppretter* observerbarheten for en tynn konstellasjon og *skjerper* Cramér–Rao-grensen for en rik, og det absolutte datumet lukkes ved **tre** ikke-kollineære jordstasjoner (observerbarhetsresultatet er beskrevet i [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **realisering av referansesystem** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — en Helmert-datumtilpasning med 7 parametere + orienteringsknytning etter IAU 2015 WGCCRE — WGCCRE = IAU Working Group on Cartographic Coordinates and Rotational Elements); en analyse av **tjenestevolum i Moonlight/LCNS-klassen** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / dekning / tilgjengelighet + en generalisert ARAIM-omslutning for HPL/VPL (horisontalt/vertikalt beskyttelsesnivå) på Månen, med gjenbruk av den gnss_lib_py-validerte DOP-kjernen og LunaNet-maskineriet med σ_URE≈30 m); **differensiell PNT på Månen** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — en måneanalog til differensiell GNSS / satellittbasert forsterkningssystem (SBAS): eksakt kansellering av fellesmodus-klokke + førsteordens romlig dekorrelasjon mot basislinje, med gjenbruk av SBAS-beskyttelsesnivået fra DO-229E — DO-229E er minimumsstandarden for operativ ytelse fra RTCA (tidligere Radio Technical Commission for Aeronautics) for SBAS-mottakere); og en **interoperabilitetseksport tilpasset LunaNet/IOAG** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + tur-retur for månetidsskala i IAU 2015-månelegemerammen, pakket i KIF-konvolutten). Evidensnivåene per del står i [verifikasjonsmatrisen](docs/VERIFICATION-MATRIX.md): Lunar Coordinate Time, den felles estimatoren for OD + klokke, realisering av referansesystem og geometrien for tjenestevolum er **VALIDATED** (hver mot den uavhengige referansen raden dens nevner, i likhet med kjernebanen for VLBI-forsinkelsen); VLBI-observabelen, observerbarhetsresultatet for datumdefekt, differensiell PNT og interoperabilitetseksporten er **MODELLED**. Parameterne er **illustrative verdier fra offentlige kilder** — **ikke** validert mot ekte VLBI-/Gateway-sporing, **ikke** tilknyttet eller godkjent av noe byrå, ingen påstand om TRL (teknologimodenhetsnivå) / heritage. |
| **PNT i dypt rom og ved Mars** | En åpen **radiometrisk navigasjonsmotor**: iterativ lystid + relativistisk **Shapiro**-forsinkelse, to-/en-/treveis **Doppler og avstand** (Moyer to-ledd), koherente transponderomvendingsforhold, regenerativ/PN-avstandsmåling (pseudostøy) (CCSDS 414, standarden for pseudostøy-avstandsmåling), og **Δ-DOR** i himmelplanet (CCSDS 506, Delta-DOR-standarden), med medier for solplasma/tropo/iono; tolking og utskrift av sporingsdatameldinger i **CCSDS-TDM (503)**; et **redusert-dynamisk kvadratrot-informasjonsfilter** (empiriske akselerasjoner i RTN — radial, transversal, normal — + en klokke om bord med 3 tilstander + atmosfærisk luftmotstand ved Mars) som gjør **banebestemmelse i lav Mars-bane (LMO) til ≈ 0.2 m** i en syntetisk lukket sløyfe; en felles estimator for **fusjon av enveis + toveis**; en dynamikkjerne for flere legemer (`Body{μ, re, zonals, gravity, IAU-pole}`, Mars-gravitasjon GMM-3 (Goddard Mars Model 3), en IAU-legemefast Mars-ramme, et utskiftbart `EphemerisProvider`-grensesnitt, todelte julianske datoer + TT↔TDB (Barycentric Dynamical Time)); og relay-PNT-scenarioet **`mars-pnt`** (en areostasjonær MARCONI-relékonstellasjon) med en ende-til-ende **GSE-ytelsessimulator** (GSE = bakkestøtteutstyr) (geometri → linkbudsjett → observabler → SRIF → kovarians). **Simuleringsvalidert** (kovarians / ytelsestall for lukket sløyfe); Mars-dynamikken med Sola i sentrum er kryssjekket mot JPL **DE440** (137 m @ bue på 1 døgn, `xval/anise-mars-od`). Validering mot ekte sporingsdata fra DSN/ESTRACK står på veikartet. |
| **Solsystemet og PNT ved ethvert legeme** | En kjernefri **efemeride for hele solsystemet** (`src/ephem.rs`, `src/ephem_provider.rs`): hver planet fra JPLs **Standish Keplerske elementer** (Table 1, 1800–2050 e.Kr.; Tables 2a/2b, 3000 f.Kr.–3000 e.Kr.) med hver planets publiserte nominelle feil, Jorden og Månen delt med måneserien, og Fobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan fra JPLs middelelementer og IAUs (International Astronomical Union) rotasjonsmodell; **ethvert legeme relativt til ethvert annet** i ICRF (International Celestial Reference Frame). `Body` bærer nå **GM (gravitasjonsparameter), radier, J2 (den andre zonale harmoniske) der den er publisert, og IAU-polen og nullmeridianen for atten legemer**. Typen **`solar-system`** rapporterer posisjoner, hastigheter, konstanter, **lystid og en-/toveis avstand** mellom to vilkårlige legemer (den eksisterende radiometriske lystidsløseren, med Shapiro-forsinkelsen fra Sola) og et banespor per legeme — nok til å tegne et interaktivt solsystem; typen **`body-pnt`** posisjonerer en orbiter eller en lander **rundt ethvert legeme** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) med en lokal Walker-konstellasjon, maskineriet for presisjonsutvanning og Gauss–Newton, og en dyprom-avstand fra Jorden. **Validert** mot JPL Horizons (DE441, JPL Development Ephemeris 441): Merkur–Saturn og Jorden fra Table 1 innenfor to ganger den nominelle feilen (verst 1.87×), alle åtte planeter fra Tables 2a/2b (verst 1.71×), og lystiden Jorden–Mars/Jupiter. **Modellert**: Uranus og Neptun fra Table 1 (2.0× og 5.2× den oppgitte feilen mot DE441), Pluto, månene og navigasjonsresultatene fra `body-pnt`. |
| **Fusjonert MEO + LEO PNT** | `src/leo_fusion/`: systemuavhengig posisjonering, navigasjon og tidssynkronisering i LEO over enhver konstellasjon (Walker-skall, elementsett, GNSS-forhåndsinnstillinger) og ethvert signal (bærebølge, chiprate, C/N0-omslutning, avstandsfeil for signalet i rommet), med valgfrie forhåndsinnstillinger i én fil som bærer kildene sine (Xona Pulsar X1/X5, Iridium STL, Starlink-signaler of opportunity, CentiSpace, et representativt C-båndsystem, ATOMIC-efemeridemodellen med null klokke). **`leo-pvt`**: batch-**Doppler-posisjonering** fra avstandsrate (én og flere satellitter, tilstander for klokkedrift og hastighet, geometri langs/på tvers av sporet for én passering og speilløsningen), **felles vektet minste kvadraters metode for GNSS + LEO** med intersystembias per system og sigmaer per signal oppgitt av kalleren, DOP mot antall LEO-satellitter, dekning i **polar- og arktiske** områder, og **tidsoverføring fra LEO til UTC** mot C/N0 og oscillatoren. **`leo-ppp`**: en flytende PPP-EKF (presis punktposisjonering, utvidet Kalman-filter) med bare GNSS og med LEO, konvergenstiden og en kjikvadrat-NEES-konsistenstest. **`ntn-positioning`**: posisjonering i 5G ikke-terrestrisk nettverk fra Cramér-Rao-grensen for båndbredden. **Validert**: Doppler-omslutningen for LEO mot de publiserte tallene for Iridium og Xona. **Modellert**: resten, med PPP-trenden sammenlignet mot Li et al. (2019) — se [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Integritet** | Øyeblikksbilde- og løsningsseparasjons-RAIM (ARAIM-stil) — mottakerens autonome integritetsovervåking — med horisontale/vertikale beskyttelsesnivåer (HPL/VPL), feildeteksjon og -eksklusjon, og Stanford-integritetsdiagrammer; et eksplisitt beskyttelsesnivå med budsjett for integritetsrisiko og **multippel-hypotese-løsningsseparasjon (MHSS)**, inkludert **konstellasjonsdekkende feilmodus for dobbel/flere konstellasjoner** (EU (Den europeiske union) ARAIM / DO-316, ytelsesstandarden fra RTCA for luftbåret GPS-utstyr med flybasert forsterkning), utprøvd på et ekte øyeblikksbilde av GPS + Galileo (`scenarios/araim-gps-galileo.toml`). Beskyttelsesnivået anvender den ensidige **nominelle bias**-projeksjonen `b_k = Σ_i|s_i|·b_nom` per feilmodus og **integritets**-sigmaen σ_URA (brukeravstandsnøyaktighet; forskjellig fra nøyaktighetsverdien σ_URE, brukeravstandsfeil) fra Integrity Support Message — se [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Deteksjonskjernen (χ²/ikke-sentral-χ²/normal-tersklene og K-multiplikatorene) er **eksternt validert mot SciPy** over 171 tilfeller (`tests/raim_reference.rs`); geometrien gjenbruker den gnss_lib_py-validerte DOP-kjernen. Selve *budsjettfordelingen* av integritetsrisiko i ARAIM MHSS har ingen publisert numerisk referanse og forblir ærlig Modelled. |
| **Forsterkning (SBAS)** | **Beskyttelsesnivåer for SBAS / WAAS** (WAAS = Wide Area Augmentation System) i den vektede minste kvadraters formen fra DO-229E (K-faktorer for presisjonsinnflyging og en route) og den **ionosfærefrie L1/L5-kombinasjonen med to frekvenser** (L1 og L5 er to sivile GPS-signalbånd; IS-GPS-705, GPS-grensesnittspesifikasjonen for L5-signalet, γ₁₅ ≈ 1.793) som ligger til grunn for DO-316 — `src/sbas.rs`. Algoritmen for beskyttelsesnivå er **eksternt validert mot RTKLIB SBAS-PL-forken** (RTKLIB = det åpne biblioteket for sanntidskinematisk posisjonering; PL = beskyttelsesnivå) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — den forrige revisjonen av DO-229 — App. J) kjørt på **ekte EGNOS-data** (European Geostationary Navigation Overlay Service), og reproduserer HPL-en dens til < 2e-3 m (`tests/sbas_reference.rs`); gLAB (verktøypakken GNSS Laboratory) v6.0.0 bekreftet den identiske konvensjonen. |
| **Klokke og tidssynkronisering** | Holdover med Kalman med to tilstander (kovarians på Joseph-form, konsistenshelse med NIS/NEES — normalisert kvadrert innovasjon / normalisert kvadrert estimeringsfeil); stabilitet i Allan-familien (ADEV / MDEV / TDEV / HDEV / MTIE — Allan-, modifisert Allan-, tids- og Hadamard-avvik, og maksimal tidsintervallfeil) med konfidensintervaller spesifikke for støytype og en full **IEEE-1139-potenslovtilpasning med fem koeffisienter** (IEEE Std 1139, definisjonene for frekvens- og tidsmetrologi fra Institute of Electrical and Electronics Engineers) — estimatorene er validert på ekte maskinvare mot **Stable32**: en **ekte 5071A cesium-primærstandard mot en hydrogenmaser** (556,990 fasesampler, 16 midlingsfaktorer, OADEV/OHDEV — overlappende Allan-/Hadamard-avvik — til 1e-3; `tests/cs5071a_reference.rs`) og den **kanoniske Stable32 PHASE.DAT**-regresjonsserien (139 midlingsfaktorer, OADEV/MDEV/TDEV til 1e-3; `tests/phasedat_reference.rs`); ADEV/MDEV/TDEV-estimatorene og telekom-vandringsmetrikken **MTIE** er i tillegg kryssjekket mot det **uavhengige allantools 2024.06**-biblioteket til **< 1e-9** på NIST SP 1065-serien (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); geometriske korreksjoner (Sagnac, GNSS common-view); og de operative overføringsmetodene — **TWSTFT** (toveis tids- og frekvensoverføring via satellitt) med Sagnac-formelen på lukket form fra BIPM (International Bureau of Weights and Measures), **GNSS common-view**, ionosfærefri tidsoverføring med **PPP** (presis punktposisjonering), en **optisk** link i fritt rom med turbulensscintillasjon, og en **tidsskala fra klokkeensemble (papirklokke)** med invers varians under den beste bidragende klokken. En **kalkulator for klokke-holdover uten GNSS** (`src/holdover.rs`) eksponerer van Loans vekst i kystfeil på lukket form som en *holdover-til-terskel*-inversjon — hvor lenge en klokke går fritt før tidsfeilen overskrider budsjettet — over representative klasser av klassiske klokker og kvanteklokker; **modellert** (kryssjekket mot flertrinns kovariansrekursjonen i `clock_state`), og ærlig om at for en svært stabil klokke settes holdover til en stram terskel av det *antatte* støygulvet ved lang tau, ikke av den siterte ADEV. Et **betinget Timing Protection Level** (`src/tpl.rs`) utvider holdover til spoofing: en grense for den *udetekterte* tidsfeilen, gitt en uavhengig kryssjekk, som setter sammen et k-sigma-overvåkergulv, van Loans kystvarians over deteksjonsforsinkelsen, og en CUSUM-tid til alarm (kumulativ sum). Kalibrert på en ekte innspilt spoof (JammerTest 2024) og reproduserbar via `cargo run --example tpl_jammertest`; **MODELLED** sammensetning (uten budsjett for integritetsrisiko per time), betinget av deteksjon — det finnes ingen endelig *ubetinget* grense. |
| **GNSS-måledomenet** | Forlengs syntese av pseudoavstand / Doppler med **Klobuchar** (kringkastet) og **IONEX / TEC-grid** (IONosphere map EXchange format / totalt elektroninnhold; målt) ionosfære — inkludert en IONEX-filtolker, tidsinterpolasjon mellom kart og tynnskall-avbildningen for skråobliktet — troposfære etter **Saastamoinen + Niell**, og øyeblikksbilde-RAIM (HPL/VPL). |
| **Robusthet** | **Jamming** ut fra linkbudsjett (J/S → effektiv C/N₀ → tap av låsing — jammer-til-signal-forhold, bærebølge-til-støytetthets-forhold — med den spektrale separasjonsfaktoren for anti-jamming `Q` nå **utledet fra de faktiske effektspektrene til signal og jammer** via `src/navsignal.rs` — `Q = 1/(R_c·κ)`, kryssjekket i CI mot den tidligere representative konstanten); en stokastisk **tidsspoofdetektor** (Neyman–Pearson / χ²₁-energitest med P_fa/P_md på lukket form og i Monte Carlo og et sikkerhets-ytelsestall (FoM) på 1 − P_md); og en **flerlags spoofdetektor** som fusjonerer en paritetstest for RAIM-konsistens (med den blinde flekken for fellesmodus ærlig modellert), en RF-overvåker for AGC-effekt (automatisk forsterkningskontroll), og en overvåker for signalkvalitet (SQM — signalkvalitetsovervåking, early-minus-late); og et **feilbudsjett for kvante-treghetsdødregning** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`) som setter sammen hvitstøy-hastighets-random-walken til kaldatominterferometeret med restbias (kryssjekket mot den uavhengige `AccelModel`-integratoren) og skalafaktorfeil til et tall for posisjonsdrift over holdover — treghetstvillingen til klokke-holdover. En **rammeverkstilpasset motor for robusthetsscoring** (`src/resilience/`) avbilder en arkitekturs simulerte oppførsel til delscorer per dimensjon på tvers av Kshanas egne sju robusthetskategorier (ikke DHS-begreper), tilpasset US Department of Homeland Security Resilient PNT Conformance Framework, og studerer deretter **beslutningsstabiliteten** til enhver enkelt sammensatt score eller ethvert modenhetsnivå under et Dirichlet-vektingssimpleks og et ensemble av fem trusler — Kendall-τ-rangustabilitet, hvor ofte vinneren på topp 1 skifter, og **diversitetskollaps** i fellesmodus (Hill-N2), med en integritetshashet garantirapport (35 håndutledede referansetester). Reproduserbar via `cargo run --example resilience_report`; **MODELLED** syntetiske arkitekturer, en egenvurdering tilpasset RPCF v2.0, **ikke** en sertifisering. Se [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Passiv RF-geolokalisering** | **TDOA/FDOA-geolokalisering av kilder** (tids-/frekvensdifferanse ved ankomst; `src/geolocation.rs`) — lokaliser en jammer eller spoofer (eller en opportunistisk kilde for omvendt PNT) fra hyperboloider for **tidsdifferanse ved ankomst** over et mottakernettverk, løst med Gauss–Newton minste kvadraters metode; ved å legge til **frekvensdifferanse ved ankomst** med mottakere i bevegelse gjenvinnes kildens posisjon *og* hastighet samlet, med **Cramér–Rao**-grensen for posisjonskovariansen utledet fra nettverksgeometrien. **MODELLED** (referanser for intern konsistens: tur-retur forlengs→invers, identiteten J·CRLB = I, GDOP-monotonisitet, og at estimatoren oppnår sin egen CRLB i Monte Carlo) — en punktkildemodell med fri sikt, uten ledd for flerveis / NLOS (uten fri sikt), mottakerklokkebias eller refraksjon. |
| **Navigasjonssignal og kodesporing** | **Signalnivået** mellom linkbudsjettet og måledomenet (`src/navsignal.rs`): **spektrale effekttettheter** (PSD-er) med enhetsareal for **BPSK-R(n)** (binær faseskiftnøkling med rektangulære chips) og **sine-BOC(m,n)** (binary offset carrier); den **spektrale separasjonskoeffisienten** (SSC) κ = ∫ G_s·G_i df, som **utleder anti-jamming-`Q`** som jammingmodellen bruker (`Q = 1/(R_c·κ)`) fra de faktiske signal-/jammerspektrene i stedet for en representativ konstant; **RMS-båndbredden (Gabor)** (BOC > BPSK — målet for avstandsinformasjon / Cramér–Rao); **termisk støyjitter i koherent early–late DLL-kodesporing** (DLL = forsinkelseslåst sløyfe; Kaplan & Hegarty; ~under en meter for C/A — GPS-koden coarse/acquisition — ved 45 dB-Hz); og **flerveisfeilomslutningen** (koherent EML, early-minus-late — undertrykking med smal korrelator). Validert mot ankre på lukket form (BPSK self-SSC = 2/(3·R_c), PSD-er med enhetsareal, C/A-jitter under en meter). Dette er analyse av signal**ytelse**, **ikke** maskinvaredesign for antenne / RF-nyttelast (en nyttelastpartners rolle). |
| **Interoperabilitet** | Innlesing av kringkastede efemerider for flere GNSS fra **RINEX-3** (GPS, Galileo, QZSS — Japans Quasi-Zenith Satellite System —, BeiDou MEO/IGSO — middels jordbane / skrå geosynkron bane — via IS-GPS-200, GPS-grensesnittspesifikasjonen; GLONASS, Russlands Global Navigation Satellite System, via PZ-90 — det russiske datumet Parametry Zemli 1990 — tilstandsvektor-RK4) brukbar som konstellasjonskilde (RINEX inn, PNT-geometri ut); en **RINEX-3**-observasjonstolker (pseudoavstand, bærebølgefase, Doppler, signalstyrke; observasjonsoppsettet i 4.00 forventes å kunne tolkes, men er ikke testet, og RINEX 4-navigasjonsfiler avvises ved navn i stedet for å dekodes feil) som nå **mater en løser for enkeltpunktsposisjonering (SPP)** (`pvt`) — ekte kodeobservasjoner inn, en ekte **mottakerposisjon** ut, validert på IGS-data; en leser/skriver for presise efemerider i **SP3-c/d** med Lagrange-interpolasjon av 9. orden; og eksport til **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) for flydynamikkverktøy (GMAT, Orekit, STK — Systems Tool Kit); og tolking og utskrift av sporingsdatameldinger i **CCSDS-TDM (503)** for radiometrisk sporing i dypt rom. |
| **Oppdragsanalyse (systemteknikk)** | Førsteordens budsjetter for oppdragsdesign, hvert en kjørbar type: tolegeme-**geometri for oppskyting og oppstigning** (`launch-window` — oppskytingsasimut `sin Az = cos i/cos lat`, minste inklinasjon, bonus fra jordrotasjonen, Δv for dogleg-planendring, daglige muligheter; `src/launch.rs`); en **ballistisk gjeninntredenskorridor etter Allen–Eggers** (`reentry` — toppretardasjon, hastighet/høyde ved topp-g, hastighet ved toppoppvarming; `src/reentry.rs`); **dekningsgeometri for jordobservasjon** (`eo-coverage` — sveipebredde / nadir-GSD (bakkesampleavstand) / tilgang utenfor nadir / gjenbesøk via romtriangelet fra SMAD (*Space Mission Analysis and Design*); `src/eo_payload.rs`); et **feilbudsjett for attitude og pekingsnøyaktighet med 3-DOF** (tre frihetsgrader; `attitude-budget` — gravitasjonsgradientmoment i verste fall + RSS-pekebudsjett (kvadratisk sum); `src/attitude_budget.rs`); **prediksjon av passeringer over bakkestasjoner** (`passes` — AOS/TCA/LOS, signalinnhenting / tidspunkt for nærmeste tilnærming / signaltap, maks elevasjon, tilgangstid; `src/passes.rs`); og et **enveis linkbudsjett** over linkligningen i CCSDS 401 / DSN 810-005 (CCSDS-standarden for radiofrekvens og modulasjon / håndboken for linkdesign i Deep Space Network; `link-budget` — FSPL (frirom-baneutbredelsestap), C/N₀, Eb/N₀ (energi per bit til støytetthet), margin, lukking; `src/linkbudget.rs`). **MODELLED** førsteordens analytiske budsjetter — laget før maskinvare under STK/GMAT/Basilisk, ikke en 6-DoF- eller radiometrisk erstatning. |
| **Beslutningsanalyse og avveining (MCDA)** | En full pakke for **flerkriterie-beslutningsanalyse** (MCDA) (`src/mcda/`) som spenner over alle fire metodefamilier — verdiaggregering (**WSM**, **WPM**, **WASPAS** — weighted sum model, weighted product model, weighted aggregated sum product assessment), avstand til ideal (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), kompromissprogrammering (**VIKOR**, fra serbisk for flerkriterieoptimering og kompromissløsning), og outranking (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, fra fransk for eliminasjon og valg som uttrykker virkeligheten), pluss forholdssystemet **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) og proporsjonal **COPRAS** (Complex Proportional Assessment) — med prioritetsvekting ved parvise sammenligninger etter **AHP** (Analytic Hierarchy Process) (Consistency Ratio), en **Pareto**-front av ikke-dominerte løsninger, **sensitivitetsanalyse** av vekter, og **nytteskåring** med flere attributter. De ni aggregatorene reproduserer de uavhengige tredjepartsbibliotekene **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) og **pyDecision** (ELECTRE I, COPRAS) til **< 1e-9**, og AHP-prioritetsvektoren + Consistency Ratio samsvarer med Saatys tabell over Random-Index og hovedegenløseren i SciPy/LAPACK til < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — beslutningslaget under motoren for avveiningsstudier. |
| **Rommiljø** | En **miljømodell for romvær** (`space-weather`, `src/space_weather.rs`): sol- (F10.7 / sentrert 81-døgns F10.7a — solens radiofluks ved 10.7 cm) og geomagnetiske (Kp, den planetære K-indeksen, med definisjonstabellen Kp↔ap — der ap er dens lineære planetære amplitude) aktivitetsindekser, den eksosfæriske temperaturen etter **Jacchia-1971** som de driver (validert mot publiserte solminimum/-middel/-maksimum), og den aktivitetskorrigerte mot den statiske nøytrale tettheten i termosfæren i høyden — tetthetsavhengigheten av solsyklusen som den statiske USSA76-atmosfæren (US Standard Atmosphere 1976) utelater. **MODELLED**: en kalibrert førsteordens skalahøydekobling, **ikke** en datavalidert atmosfære (NRLMSISE — eksosfæremodellen fra US Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar). |
| **AI/ML-evaluering og avveining** | En **testbenk for evaluering av deteksjon av RF-svekkelser** (`impairment-eval`, `src/impairment_eval.rs`): et merket, parameterforankret **syntetisk** korpus (nominell / jamming / tidsspoof / posisjonsspoof / flerveis), et detektoruavhengig **ROC/AUC**-rammeverk (receiver operating characteristic / arealet under kurven) som scorer enhver detektor (energy \| agc \| sqm \| parity \| fused) med Pd (deteksjonssannsynlighet) per klasse ved en mål-Pfa (sannsynlighet for falsk alarm), og **optimismegapet** innenfor mot utenfor fordelingen (modus for fordelingsforskyvning). Pluss en **avveining av kvante- mot klassisk PNT** (`quantum-trade`, `src/quantum_trade.rs`) som kvantifiserer en kandidatklokkes holdover-gevinst for tid/treghet fra en **målt ADEV**-kurve mot en klassisk grunnlinje, med forbeholdet om gulvet ved lang τ båret på artefaktet og en omslutning for robusthet mot tid uten GNSS. Evalueringsmetrikkene (AUC / forvekslingsmatrise / Pd-Pmd, der Pmd er sannsynligheten for tapt deteksjon) er **validert til eksakt samsvar mot scikit-learn 1.9.0** — også på **ekte telemetri fra ESA OPS-SAT** (datasettet OPSSAT-AD for anomalideteksjon, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), der Kshanas Mann–Whitney ROC AUC reproduserer scikit-learns `roc_auc_score` til < 1e-9 på den tilbakeholdte testoppdelingen og en gjennomsiktig toppteller-detektor skiller de merkede anomaliene ved AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`) — og avveiningsmotorens numeriske **kjerner** (ADEV NNLS-tilpasning — ikke-negative minste kvadrater —, χ²-konsistensbånd, van Loans klokke-Q) **mot scipy 1.17.1**; tallene for enhetsgevinst bygget oppå forblir **MODELLED** driftskarakteristikker — aldri felt-/IQ-data (sampler i fase/kvadratur), ingen vurdering av god/dårlig. Med testbenken som grunnlag scorer en dypere **studie av optimismegapet** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) et panel med **13 detektorer** (energi/AGC/SQM/paritet pluss seedede detektorer med logistisk regresjon og MLP med ett skjult lag — flerlagsperseptron), tilpasser **skaleringslover** innenfor mot utenfor fordelingen med en permutasjonsnull, og lærer en **leave-one-out-prediktor** for degradering utenfor fordelingen fra statistikk innenfor fordelingen (`cargo run --example optimism_study`). En **frontend for programvaredefinert mottaker** (`src/sdr.rs` — rå IQ/IF (mellomfrekvens) → korrelatorens early/prompt/late-uttak → SQM) og **adaptere for innlesing av ekte data** (`src/realdata/` — RINEX, u-blox UBX (u-blox' binærprotokoll), GnssLogger, JammerTest, Yunnan, SatGrid) lar de samme detektorene kjøre over opptak som leveres lokalt (ingen datasett er sjekket inn). **Krysningskartet for robusthet kvante mot klassisk** under parameterusikkerhet (`src/crossover.rs`; `cargo run --bin crossover_study`) regenererer krysningsstudiene for treghet og klokke bak figurene i Resultater. |
| **Demonstrator for kvanteaktivert PNT** | Tre kjørbare, **MODELLED** anvendelsesområder bak den åpne motoren, hvert av dem leverer ærlig `TradeEvidence` + en oppføring om representativitet / gap til flyging (`src/representativeness.rs`): **klarert kvantetidsoverføring** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — et ende-til-ende-budsjett for optisk gitterklokke + fotonisk link mot CSAC (atomklokke i brikkeskala) + RF toveis, med et gjenbrukt timing protection level, et sikkerhets-FoM for forsinkelses-/avspillingsangrep (1 − P_md), og deteksjon av klokkeanomalier + CUSUM-forsinkelse); **kvantenavigasjon uten GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — en treghetskysting med kaldatominterferometer mot en INS av navigasjonsklasse over et GNSS-avbrudd, ærlig om at uten ekstern posisjonsbestemmelse er akselerometerbiasen ikke observerbar, så feilen vokser fortsatt); og **feil-/anomalideteksjon** i kvantesystemer (`quantum-anomaly-detect`, `src/quantum_faults.rs` — en merket feilkatalog med en ROC AUC med bootstrap-CI (konfidensintervall) fra den eksternt validerte `eval_stats` og en minste detekterbar feil ved en fast falsk-alarm-rate). Et felles **bibliotek av feilmodeller for kvanteenheter** (`src/quantum_devices.rs`) og et samlet **rammeverk for avveining kvante mot klassisk** (`src/qtrade.rs`) ligger til grunn for dem. De validerte kjernene de bygger på (evalueringsmetrikker mot scikit-learn, avveiningskjerner mot scipy) gjenbrukes; tallene for enhetsgevinst bygget oppå forblir **MODELLED** — **illustrative enhets-/linkparametere fra offentlige kilder**, modellerer *klassen*, ingen TRL / flyheritage / sertifisering, ingen godkjenning fra noe byrå. |
| **Nøktern ingeniørkunst og integritetspåvirkning** | En linse for **ROI per dekning** (avkastning på investering) (`src/frugal.rs`) — kostnad per enhet levert dekning for en arkitekturavveining — og en avbildning fra **tapt deteksjon → integritetspåvirkning** (`src/integrity_impact.rs`) som gjør en overvåkers rate av tapte deteksjoner om til dens bidrag til integritetsrisiko. **MODELLED** budsjetter for beslutningsstøtte, additive. |
| **Utveksling av artefakter** | **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — en versjonert, selvbeskrivende konvolutt som pakker inn et scenarioresultat med typen, skjemaversjonen og MODELLED/VALIDATED-merkelappene, slik at et lagret artefakt forblir selvdokumenterende og eldre konvolutter forblir lesbare med foroverkompatibilitet. |

Hver funksjon kan nås som et Rust-API, en kjørbar scenario-`kind`, eller begge.
Modenhet per funksjon — *validated*, *runnable* eller *library* — spores i
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). En **maskinkontrollert verifikasjonsmatrise**
(`src/verification.rs`) gjengir kryssreferansen krav → modul → test → referanse → status,
med enhetstestede ærlighetsinvarianter som tillater en *validated*-merkelapp
bare der en uavhengig **ekstern** referanse støtter den — og som registrerer
maskinvare-/PA-funksjonene (produktsikring) som Kshana bevisst **ikke** leverer.

</details>

<details>
<summary>De fire sensorpakkene, slik de først ble publisert (resultater)</summary>

### Resultater

Hvert scenario sammenligner en kvantesensor med sin klassiske motpart gjennom et
GNSS-avbrudd på ~1.8 h. Tallene er reproduserbare (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Hva kvantesensorer gir når GNSS er borte, scenarioet clock-holdover: kvante holder 6600 s med autonomi mot 2610 s klassisk, langt lavere tidsfeil, og 100% mot 95.6% tilgjengelighet" width="88%">
  <br><sub>Hva kvantesensorer gir når GNSS er borte — <code>clock-holdover</code> · seed 42 · tegnet med motor 0.40.0, og hvert tall ovenfor kontrolleres på nytt mot den gjeldende motoren ved hvert bygg av <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Fordelen er **avhengig av avbrudd og vibrasjon**, med et eksplisitt balansepunkt der klassisk vinner — vist ærlig langs stigen for teknologimodenhet (tallene for optiske klokker er mål for bakkedemonstratorer; ingen optisk strontiumklokke har fløyet):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Krysning mellom kvante- og klassisk klokke-holdover langs stigen for teknologimodenhet, med konfidensbånd" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Varmekart over treghetsfordelen kvante mot klassisk over avbruddsvarighet og vibrasjon, med en balansekontur der klassisk vinner" width="96%">
  <br><sub>Krysning i robusthet kvante mot klassisk — TRL-stige for klokke-holdover (øverst) · kart over treghetsfordel med balansekontur (nederst). Kan regenereres via <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Treghetsdødregning: posisjonsfeil under et GNSS-avbrudd — kvantesensoren (kalde atomer) holder seg nær spesifikasjonslinjen mens sensoren av navigasjonsklasse divergerer til titalls kilometer" width="80%">
  <br><em>Posisjonsfeil ved dødregning under et GNSS-avbrudd: kvantesensoren (blå)
  holder seg flat nær spesifikasjonen; den klassiske sensoren (rød) divergerer til titalls kilometer.
  Generert av Kshana fra <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Pakke | Scenario | Kvante | Klassisk |
|------|----------|---------|-----------|
| **1 — Klokke-holdover** | `clock-holdover.toml` (spesifikasjon 20 ns) | optisk klokke holder hele avbruddet | CSAC bryter spesifikasjonen midt i avbruddet |
| **2 — Treghetsdødregning** | `imu-deadreckoning.toml` (spesifikasjon 100 m) | kalde atomer: **~41 m**, holder hele avbruddet | navigasjonsklasse: bryter etter **~350 s** → titalls km |
| **3 — Tidsoverføring** (optisk link mellom satellitter) | `timetransfer.toml` | optisk: **~0.3 mm** avstandsmåling | RF (TWSTFT): **~150 mm** avstandsmåling |
| **4 — Hybrid fusjon** (sluttstein) | `hybrid-pnt.toml` | full posisjon+tid for hele avbruddet | **posisjonsbegrenset ved ~350 s** |

Sluttsteinen viser fusjonstesen: optisk tidsoverføring mellom satellitter holder selv
en klassisk *klokke* låst, og isolerer *treghets*sensoren som det svake leddet i den
klassiske pakken — altså kvantetreghet + optisk tidssynkronisering sammen.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Klokke-holdover: fasefeil under et GNSS-avbrudd — den optiske klokken holder seg innenfor spesifikasjonen på 20 ns i hele avbruddet mens klokken i brikkeskala bryter den midt i avbruddet" width="80%">
  <br><em>Klokke-holdover gjennom et GNSS-avbrudd: den optiske klokken (blå) holder seg innenfor
  spesifikasjonen på 20 ns gjennom hele kystingen; klokken i brikkeskala (rød) bryter den underveis.
  Generert av Kshana fra <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Et ytterligere scenario, `orbit-gnss-challenged.toml`, utleder GNSS-tilgjengelighet fra
**banegeometri** i stedet for håndskrevne vinduer: et romfartøy innenfor GNSS-
skallet propageres mot en GPS-lignende Walker-konstellasjon, og antall synlige satellitter
(fri sikt, jordokkultasjon, elevasjonsmaske) bestemmer posisjonsbestemmelsestilstanden ved hvert
steg. Over et døgn har brukeren posisjonsbestemmelse bare ~59% av tiden; kvanteklokken holder en
tidsløsning på 5 ns gjennom hvert gap (tilgjengelighet **1.0**), klokken i brikkeskala
bare **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Bane med utfordret GNSS: klokkens tidsfeil over et døgn for et romfartøy innenfor GNSS-skallet, der dekningsgapene er utledet fra banegeometri — den optiske klokken holder seg innenfor spesifikasjonen på 5 ns gjennom gapene mens klokken i brikkeskala bryter den" width="80%">
  <br><em>Tidsfeil over et døgn med GNSS-tilgjengelighet utledet fra banegeometri:
  antall synlige satellitter (fri sikt, jordokkultasjon, elevasjonsmaske) bestemmer posisjonsbestemmelses-
  tilstanden ved hvert steg, så klokken må kyste gjennom hvert gap — den optiske klokken holder spesifikasjonen
  på 5 ns mens klokken i brikkeskala bryter den. Generert av Kshana fra
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

Konstellasjonen kan også oppgis som ekte tolinjeelementsett (TLE-er). Et *fullt* TLE
(linje 1 + linje 2) propageres med den fulle **SGP4/SDP4**-modellen — inkludert
atmosfærisk luftmotstand og dyprom-leddene for måne-sol og resonans ved 12 h / 24 h som
betyr noe for GNSS-baner på ~12 h — validert mot de offisielle AIAA 2006-6753-vektorene
til i verste fall ≈ 4 mm. `scenarios/orbit-sgp4-gps.toml` leverer et **ekte Celestrak
`gps-ops`-øyeblikksbilde** av den operative GPS-konstellasjonen (2021-07-28, 30 satellitter)
og krever gyldige TLE-kontrollsummer — tolinjeelementsett er åpne data fra katalogen til US
Space Force / 18th Space Defense Squadron, videredistribuert av Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); oppdater med
`scripts/fetch_tles.sh`. En blokk med bare linje 2 beholder
den analytiske tolegemepropageringen (`scenarios/orbit-real-tle.toml`); de to formene kan
blandes i én konstellasjon. En konstellasjon kan like gjerne bygges fra en blokk med
**RINEX-3-poster med kringkastede GPS-efemerider** — formatet en mottaker dekoder —
propagert med brukeralgoritmen i IS-GPS-200 og ført gjennom den samme geometrien
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Hva det er / ikke er, i sin helhet</summary>

<a id="what-it-is--is-not"></a>
### Hva det er / ikke er

**Det er:** en deterministisk motor med få avhengigheter som spenner over PNT-stakken — bane-
geometri, treghetsnavigasjon, GNSS/INS-fusjon, integritet, klokker og tidssynkronisering. Den
kjører et scenario (ofte et GNSS-avbrudd), utvikler kalibrerte sensorfeilmodeller
gjennom den passende estimatoren, og scorer resultatet mot de operative
ytelsestallene — og leverer et reproduserbart JSON-resultat (JavaScript Object Notation) og et SVG-diagram, fra et
Rust-bibliotek, et kommandolinjegrensesnitt (CLI), en Python-utvidelse, en WebAssembly-modul i nettleseren, en
**Model Context Protocol (MCP)-server** for AI-agenter, eller en **JetBrains-IDE-utvidelse (integrert
utviklingsmiljø)**.

**Det er ikke:** flymaskinvare, et design for kvantenyttelast, en full GNSS-signal-
mottaker, en radiofrekvent (RF) signalsimulator eller en hardware-in-the-loop-rigg, eller et
sertifisert avionikkprodukt — og det erstatter ikke MATLAB/Simulink, STK (Systems Tool
Kit) eller Orekit; det står ved siden av dem og utveksler filer med dem. Troverdigheten for kvantemaskinvare kommer fra
publiserte feilmodeller, ikke fra dette verktøyet. Den detaljerte modenheten for hver
funksjon er dokumentert i [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Det er ikke (ennå):** en *full* fysikkmotor for atominterferometri (de fleste kvantesensorer
bruker publiserte Allan-/støybudsjettkoeffisienter; CAI-akselerometeret (kaldatominterferometer) har et
lag fra grunnprinsipper — Mach–Zehnder-fase, projeksjonsstøy, kontrastforfall og
vibrasjonskobling, pluss systematikk fra Coriolis og lysforskyvning — men systematikk fra bølgefronten og
oppløsning av frynseflertydighet forblir et **P2**-lag (veikartfase 2, kvantefysikklaget)
på veikartet, se [`ROADMAP.md`](ROADMAP.md) og [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
en sertifisert GNSS-mottaker eller maskinvaremottaker (den løser en **PVT**-posisjonsbestemmelse (posisjon, hastighet og tid) for ett punkt
fra ekte RINEX-kodeobservasjoner (Receiver Independent Exchange Format) — validert
på ekte IGS-data (International GNSS Service) — og IQ-laget (`kshana iq`, siden 0.31.0)
innhenter og sporer innspilte eller genererte basebåndsampler i programvare, som en analyse-
mottaker: den styrer ikke radiomaskinvare og sender ikke, er ikke en sertifisert mottaker, og gjør
ingen bærebølgefaseposisjonering (RTK eller PPP)); eller en full pakke for oppdragsdesign (den har byggeklosser for Lambert / porkchop /
manøvrer / banebestemmelse, men er ytelsessimuleringslaget
*over* GMAT (General Mission Analysis Tool)/Orekit, ikke en erstatning). Å eie dette omfanget er bevisst. Hvis du trenger feilbudsjetter for kaldatom-
interferometre fra grunnprinsipper (f.eks. på CARIOQA-PMP-nivå — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — eller validering i X-37B-stil), se
P2-veikartet og [ta kontakt](#support--professional-services) for å samarbeide.

</details>

### Navigasjon i lav jordbane

Satellitter i lav jordbane (LEO) passerer raskt og med sterkt signal. Typen `leo-pnt-chain` følger ett
system gjennom hvert trinn: signalet, passeringen og linken, navigasjonsmeldingen, og
den fusjonerte posisjonsbestemmelsen for posisjon, hastighet og tid (PVT) og presis punktposisjonering (PPP). Hvert
trinn gir tallene sine videre til det neste. Se [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="LEO-PNT-kjeden fra en ekte kjøring av leo-pnt-chain (leo-pnt-end-to-end.toml): signaltrinnet (generic-l på 1191.795 MHz, pilot sporet ved 10.23 Mchip/s) gir videre til passeringstrinnet (1080 km, sporet C/N0-topp 58.2 dB-Hz), som gir videre til navigasjonsmeldingen (kepler-rac, tilpasning over 300 s, representasjons-SISRE 0.91 mm RMS, 0.250 m med banebestemmelse), som mater den fusjonerte posisjonsbestemmelsen (bare GNSS 1.60 m RMS 3D, GNSS pluss LEO 0.43 m) og presis punktposisjonering (konvergens 11.5 min bare GNSS, 7.5 min med 240 LEO-satellitter). 11 verdier gis videre mellom trinnene." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Hver scenariotype etter familie

Motorens scenariotyper, ordnet i familier. Hver familie har en side med én oppføring per type (motorens
beskrivelse og felter, en eksempelkommando, hovedtall fra en kjøring, radene i
[verifikasjonsmatrisen](docs/VERIFICATION-MATRIX.md) som nevner den, og diagrammet motoren selv skriver) og et
kontaktark med disse diagrammene; [`docs/KINDS.md`](docs/KINDS.md) indekserer dem alle. Tabellen skrives av
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) og sidene av
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), og begge feiler hvis motoren får en type som ingen familie nevner.

<!-- generated:kind-families -->
| Familie | Hva den besvarer | Typer | Kjør én |
|---|---|---|---|
| **[Klokker, tidssynkronisering og holdover](docs/kinds/clocks-timing-and-holdover.md)** | hvor lenge en klokke holder tiden uten GNSS, og hvordan et tidssynkroniseringssystem holder seg mot maskene sine | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Treghet, fusjon og kvantesensorer](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | dødregning og sensorfusjon gjennom et GNSS-avbrudd, med klassiske sensorer og kvantesensorer | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[Alternativ PNT uten GPS](docs/kinds/gps-denied-alternative-pnt.md)** | navigasjon fra gravitasjon, terreng og andre felt når GNSS er borte | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Konstellasjoner, dekning og geometri](docs/kinds/constellations-coverage-and-geometry.md)** | hvor satellittene er, hvem som ser dem og hvor god geometrien er, rundt Jorden, Månen eller Mars | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[GNSS-målinger, posisjonering og integritet](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudoavstander, posisjonsbestemmelser, beskyttelsesnivåer og rommiljøet | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Jamming, spoofing og spekteret](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | hvordan interferens når en mottaker og om den detekteres | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Navigasjon i lav jordbane](docs/kinds/low-earth-orbit-navigation.md)** | en passering, en link, en navigasjonsmelding og en fusjonert posisjonsbestemmelse, trinn for trinn | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Måne og cislunart rom](docs/kinds/lunar-and-cislunar.md)** | navigasjon, tid, referansesystemer og geodesi ved Månen | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Navigasjon for romfartøy](docs/kinds/space-user-navigation.md)** | GNSS-signaler for romfartøy over, rundt og forbi GNSS-banene | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Optisk PNT](docs/kinds/optical-pnt.md)** | optiske linker gjennom atmosfæren og ytelsestall for optisk pluss RF | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Oppdragsanalyse, linker og romoperasjoner](docs/kinds/mission-analysis-links-and-space-operations.md)** | oppskyting, oppstigning, inntreden, attitude, linker, kontaktplanlegging og filformater | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Oppdragstråder](docs/kinds/mission-threads.md)** | feilbudsjettet for navigasjon og tidssynkronisering i en kjede av faser fra oppskyting til inntreden | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Kampanjer](docs/kinds/campaigns.md)** | kjedede oppdrag, sveip og ensembler bygget fra de andre typene | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Hver kommando

`kshana <scenario.toml>` kjører et scenario; hver annen kommando er en underkommando, og `kshana --help` skriver ut bruken
av dem alle. Kommandoene er `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (med `live` og
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` og `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) gir formålet med hver, et verifisert eksempel og dokumentasjonssiden.

<a id="every-surface"></a>
### Hvert grensesnitt

Én motor, de samme resultatene overalt: kommandolinjen, Rust-biblioteket, Python, JavaScript og WebAssembly,
MCP-serveren med utvidelseskommandoene og ferdighetene sine, Kshana Studio (hver side kjører i nettleseren, ingen installasjon, ingenting lastes opp),
integrasjonene for ROS 2, Signal K, OpenCPN, GNSS-SDR og `gnss_lib_py`, utrullingssettene for systemd, Docker og Grafana, og
JetBrains-utvidelsen. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) lister dem med hvordan du får tak i hver og navnene på alle
utvidelseskommandoene, ferdighetene og Studio-sidene; [`docs/SURFACES.md`](docs/SURFACES.md) sier, for hver kommando og type,
hvilket grensesnitt som har den og hvilke som ikke har den, med begrunnelse.

<a id="how-a-run-works"></a>
## Slik fungerer en kjøring

Et scenario er en TOML-fil (Tom's Obvious, Minimal Language): en type, en seed og
parameterne. Motoren kjører den og skriver resultatet, et diagram og en rapport ved siden av, og
eksportene du ber om.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Hvordan en kjøring flyter. En scenario-TOML-fil (en type, en seed og parameterne) går inn i motoren, kshana 0.40.0, gjennom api::run_toml-fordelingen over 92 scenariotyper, deterministisk ut fra scenario, seed og motorversjon. Motoren skriver result.json, chart.svg, report.html og report.json, en table.csv for typene som definerer en, og på forespørsel eksporter i SP3, CCSDS OMM og OEM, CZML, KML, GeoJSON, STK og SigMF; en suite skriver study.json og study.html. Disse filene mater Kshana Studio i nettleseren, en AI-assistent gjennom kshana-mcp-serveren, og kontinuerlig integrasjon." width="100%">
</picture>

Dette medfølgende scenarioet kjører i 2 h: 10 min med GNSS, deretter omtrent 1.8 h uten GNSS. Det spør
hvor lenge en optisk strontium-gitterklokke og en atomklokke i brikkeskala (CSAC) hver holder
tiden innenfor 20 ns.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

Den optiske klokken holder budsjettet på 20 ns gjennom hele avbruddet på 6600 s; CSAC holder det i
2610 s, og er innenfor budsjettet i 95.6% av kjøringen mot 100% for den optiske klokken.
`kshana example` lister hvert medfølgende scenario.

<a id="missions"></a>
## Oppdrag

Ti sektorer stiller ti forskjellige spørsmål til den samme motoren. Hver har medfølgende scenarioer å
starte fra.

| Sektor | Start med |
|---|---|
| Forsvar og sikkerhet | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Rom, jordbane | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Månen, Mars og dypt rom | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Luftfart og droner | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Maritimt | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Vei | `automotive-urban-canyon` |
| Jernbane | `rail-tunnel-coast` |
| Kritisk infrastruktur og tidssynkronisering | `clock-holdover`, `clock-ensemble` |
| Telekom og 5G (den femte generasjonen mobilnett) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Vitenskap og forskning | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>Spørsmålet hver sektor stiller</summary>

<br>

| Sektor | Spørsmålet den stiller | Start med |
|---|---|---|
| **Forsvar og sikkerhet** | Hvor lenge forblir navigasjonen og tidssynkroniseringen vår pålitelig under jamming og spoofing, og hvilke lag holder oss innenfor spesifikasjonen? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Rom: jordbane** | Ser romfartøyet mitt nok navigasjonssatellitter, hvor lenge holder klokken tiden mellom posisjonsbestemmelser, og hva ville et navigasjonslag i lav bane tilføre? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Månen og dypt rom** | Vil en lander, rover eller orbiter ved Månen, ved Mars eller lenger ut få en pålitelig posisjon og tid? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Luftfart og droner** | Etter at en jammer tar bort GNSS, hvor lenge holder det ubemannede luftfartøysystemet mitt (UAS) seg innenfor posisjonsbudsjettet, og er integritet tilgjengelig på ruten min? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Maritimt** | Hvor langt over vannet rekker en jammer, ville et posisjonsskyv bli fanget opp, og hvor lenge kan et skip kyste inn til havn? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Vei og bil** | Hvor langt driver en bil under en overgang eller forbi en jammer ved veikanten? | `automotive-urban-canyon` |
| **Jernbane** | Hvor mange sekunder inn i en tunnel kan et tog fortsatt avgjøre hvilket spor det er på? | `rail-tunnel-coast` |
| **Kritisk infrastruktur og tidssynkronisering** | Hvis GNSS-tid går tapt eller spoofes, hvor lenge holder et kraftnett, en handelsplass eller et datasenter sporbar tid? | `clock-holdover`, `clock-ensemble` |
| **Telekom og 5G** | Hvis GNSS-tidsreferansen går tapt, holder nettverksklokken min seg innenfor ITU-T-maskene, og hvor lenge? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Vitenskap og forskning** | Kan jeg reprodusere, utvide og sitere et PNT-resultat, helt ned til seeden? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Evidens

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 kontrollert mot alle 666 referansevektorer i AIAA 2006-6753, verste posisjonsfeil 4.12 mm"></a></p>

<strong>176 av 401</strong> funksjoner validert mot uavhengige eksterne referanser; 221 ærlig merket Modelled.
Hver rad i verifikasjonsmatrisen nevner en funksjon, referansen den kontrolleres mot,
testen som kjører kontrollen, og merkelappen som følger. Kontinuerlig integrasjon (CI) gjør
det umulig å kalle en funksjon VALIDATED uten en uavhengig ekstern referanse.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Hvordan en funksjon opptjener merkelappen sin. Hver rad i verifikasjonsmatrisen nevner en funksjon, referansen den kontrolleres mot, testen som kjører kontrollen i kontinuerlig integrasjon, og merkelappen som følger. En rad kan bare være VALIDATED med en uavhengig ekstern referanse; ellers er den MODELLED, eller PARTNER når en maskinvarepartner eier den. Eksempel: SGP4/SDP4, Cowell 6-DOF + perturbasjoner, batch/sekvensiell OD, referanse AIAA 2006-6753 SGP4-verifikasjonsvektorer, test tests/sgp4_verification.rs, merkelapp VALIDATED. Aktuelle tall: 176 VALIDATED, 221 MODELLED, 4 PARTNER av 401 rader. I alt 176 funksjoner validert mot uavhengige eksterne referanser; 221 til er ærlig merket MODELLED og 4 eies av PARTNER." width="100%">
</picture>

| Merkelapp | Rader | Betydning |
|---|---|---|
| VALIDATED | 176 | en uavhengig ekstern referanse er enig: ekte data, en uavhengig implementering eller publiserte referansevektorer |
| MODELLED | 221 | kontrollert mot analytisk fasit eller simuleringens selvkonsistens, og sagt høyt |
| PARTNER | 4 | eid av en maskinvarepartner; Kshana har ingen referanse for den |

Noen av kontrollene: alle 666 SGP4-vektorer (Simplified General Perturbations 4) i AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 til 4.12 mm; Cowell-kraftmodellen
til 0.08 m mot Orekit 12.2; Galileo til 0.61 m og Swarm-A til 0.10 m mot ekte
presise efemerider fra Den europeiske romfartsorganisasjonen (ESA). Testene holder nær 95 % linjedekning av
`src/`, sikret ved 85 % i CI. Registeret er
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), generert fra
`src/verification.rs`: [hele matrisen med 401 rader](docs/VERIFICATION-MATRIX.md), og hvorfor hver
Modelled-rad ikke har noen ekstern referanse, i [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Hvordan validering fungerer, den kuraterte tabellen over høydepunkter og evidensfigurene</summary>

### Validering, reproduserbarhet og ærlighet

- Hvert støyledd er kalibrert til et **publisert, sitert** tall og validert
  mot standardrelasjonen (Allan-avvik for klokker; Groves' vekst i dødregnings-
  feil for treghet; konverteringen tid→avstand for tidsoverføring). Status
  per ledd spores i [`docs/VALIDATION.md`](docs/VALIDATION.md) som `validated` eller
  `not modeled` — ingenting presenteres som validert som ikke er det.
- **Reproduserbar per konstruksjon:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` håndhever det; kvante- og klassiske kjøringer bruker
  uavhengige seeds slik at støyen deres er ukorrelert.
- Modenheten oppgis ærlig: tallene for optiske klokker og optiske linker er resultater for *mål /
  bakkedemonstratorer*, ikke fløyet.

### Evidensmerket på hver figur

Hver figur og tabell en kjøring skriver, sier hvor mye den kan stoles på, og hvilke registerrader det hviler på. Resultat-JSON-en har en
`evidence`-nøkkel, diagram-SVG-en en linje under plottet (og et `<metadata id="kshana-evidence">`-element), og CSV-tabellen
`# evidence:`-kommentarlinjer foran (les med `comment='#'`). Det nevner et nivå, `VALIDATED`, `MODELLED` eller `PARTNER`, og
id-ene (`VM-` og åtte heksadesimale sifre) til radene i verifikasjonsmatrisen som kjøringen brukte. Nivået er det svakeste av disse
radene, så en kjøring som lener seg på én modellert rad, merkes MODELLED uansett hvor mange validerte rader som står ved siden av; merket
kan aldri hevde mer enn registeret gjør. Rader, statuser og id-er leses fra matrisen, de skrives ikke inn for hånd
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), og
`tests/evidence_labels_doc_sync.rs` feiler hvis en figur ikke har noe merke eller et merke er uenig med matrisen.

### Validering i korte trekk

Hver rad håndheves av en navngitt test i CI. Denne tabellen er et **kuratert høydepunkt**;
hele den maskinkontrollerte matrisen er **401 rader — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), med den fullstendige evidensen (og hva som ærlig talt *ikke* er validert
ennå) i [`docs/VALIDATION.md`](docs/VALIDATION.md) og artefaktet
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
for hver utgivelse (generert av `cargo run --bin validation_report`, SLSA-attestert — Supply-chain
Levels for Software Artifacts).

Kolonnen **Status** oppgir *typen* evidens, i samsvar med valideringsstigen ovenfor: **VALIDATED** = kontrollert mot en uavhengig ekstern referanse (ekte data, et uavhengig bibliotek eller publiserte referansevektorer); **MODELLED** = kontrollert mot analytisk fasit eller simuleringens selvkonsistens (ingen uavhengig eksternt datasett). VALIDATED beskriver *metoden* for kontroll, ikke bestått/ikke bestått — en ærlig bom mot en ekte ekstern referanse forblir VALIDATED, mens en sammenligning som ingen rad i matrisen nevner som referanse (LRO-tilpasningen — Lunar Reconnaissance Orbiter — ovenfor) vises som MODELLED. `CI`-rader er prosessvern, ikke ytelsestall. Noen få øyer med ekte data (den målte cesiumklokken, Stable32 PHASE.DAT, og OPS-SAT/ICGEM-kontrollene der rådataene ikke har noen lisens for videredistribusjon) er **dataavhengige**: testen skriver ut en melding om at den hoppes over og forblir grønn når inndataene mangler, og de offentlige referansetallene er sjekket inn under `tests/fixtures/`. Reproduser rådataene med det tilsvarende `scripts/fetch_*.sh`.

| Status | Funksjon | Samsvar | Referanse / uavhengig referanse |
|--------|------------|-----------|--------------------|
| **VALIDATED** | SGP4/SDP4-propagering | 666/666 vektorer, verst **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + direkte sammenligning mot den uavhengige `sgp4`-craten |
| **VALIDATED** | Referansesystemer — IAU 2000A/B-nutasjon, IAU 2006/2000A CIO-kjede, ERA | **bit for bit** (X,Y til 1e-14, s til 1e-18, ERA til 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS mot en uavhengig SPICE-motor | maks **0.028″** → ≤ 0.86 m på bakken, ≤ 3.6 m i GNSS-bane | ANISE (ren Rust NAIF/SPICE), samme IERS `finals2000A` EOP, 8 epoker 2020–2023 (sammenlignet mot denne referansen; ingen rad i verifikasjonsmatrisen nevner den som ekstern referanse, så den er ikke merket VALIDATED) |
| **MODELLED** | EGM2008-geopotensial (grad/orden 70) | akselerasjon = ∇V til **< 1e-6**; zonal kollaps til validert J2 | NGA EGM2008-koeffisienter + analytisk ∇V-identitet |
| **VALIDATED** | Syntese av gravitasjonsfunksjonaler (navigasjonskart med gravitasjonsstøtte / uten GNSS) | GRS80 Somigliana + γ_e/γ_p til **3.5e-12**; ekte EGM2008-forstyrrelseskart fysisk (RMS ≈ 26 mGal, g/o 70) | GRS80 (Moritz 1980, IAG — International Association of Geodesy) Somiglianas normaltyngde + ekte ICGEM EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Allan-estimatorer (ADEV/MDEV/TDEV/HDEV) + konfidensbånd | reproduserer referanseavvik; χ²-bånd samsvarer | NIST SP 1065 (Riley), Table 31/32 med 1000 punkter |
| **VALIDATED** | Allan-estimatorer på en **ekte målt cesiumklokke** | OADEV/OHDEV til **1e-3** (observert ≤ 3e-5), 16 midlingsfaktorer | Stable32 på en ekte 5071A Cs mot H-maser, 556,990 punkter (`tests/cs5071a_reference.rs`, dataavhengig) |
| **VALIDATED** | Allan-estimatorer på den **kanoniske Stable32 PHASE.DAT** | OADEV/MDEV/TDEV til **1e-3** (observert ≤ 5e-5), 139 midlingsfaktorer | Stable32-referanseavvik for PHASE.DAT (`tests/phasedat_reference.rs`, dataavhengig) |
| **MODELLED** | IMU-feilmodell — ARW / VRW / biasinstabilitet | gjenvunnet til **< 5 %** (biasinstabilitet < 15 %) | Analog Devices ADIS16465-datablad; NaveGo-referanseprofil |
| **VALIDATED** | Numerisk Cowell-propagator + kraftmodell (konservative nivåer) | verste posisjonsfeil **0.08 m** over 24 h, 278 epoker (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Cowell-nivået for luftmotstand + absolutte inndata for efemerider for Sola/Månen og tetthet | nivået for luftmotstand karakterisert ≈ 333 m / 24 h; uforstyrret samsvarer med Kepler med universelle variabler under 1 m, energi/impuls ~1e-9 | innebygd efemeride med lav presisjon + analytisk Kepler |
| **MODELLED** | Lambert · Tsiolkovsky · porkchop | tur-retur til tolegemefasit; ΔV **< 0.01 %** | Izzo 2015 · rakettligningen · analytisk Hohmann-gulv |
| **MODELLED** | Banebestemmelse (Gauss–Newton-batch) | under 1 m / mm·s⁻¹ støyfritt; ~2 m ved et støygulv på 5 m | tolegeme + J2 over en RK4-bue |
| **MODELLED** | Kraftmodelltilpasning mot presis Galileo-efemeride (hel bue) | **0.61 m** 3-D RMS, 24 h, g/o-70, bare krefter | ESA/ESOC `ESA0MGNFIN` endelig bane (E11), ekte `finals2000A` EOP (sammenlignet mot denne referansen; ingen rad i verifikasjonsmatrisen nevner den som ekstern referanse, så den er ikke merket VALIDATED) |
| **MODELLED** | Kraftmodelltilpasning mot presis Swarm-A-efemeride (redusert-dynamisk) | **0.10 m** 3-D RMS (grense for det empiriske nivået, ikke en måling) | ESA `SW_OPER_SP3ACOM_2_` presis bane (sammenlignet mot denne referansen; ingen rad i verifikasjonsmatrisen nevner den som ekstern referanse, så den er ikke merket VALIDATED) |
| **MODELLED** | Kraftmodelltilpasning mot LRO ved Månen (ærlig bom) | **6.67 m** redusert-dynamisk, *over* målet på 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (sammenlignet mot denne referansen; ingen rad i verifikasjonsmatrisen nevner den som ekstern referanse, så den er ikke merket VALIDATED) |
| **MODELLED** | OD for Mars i dypt rom (redusert-dynamisk SRIF) | **≈ 0.2 m** Mars-LMO (simulerings-FoM, *ikke* ekte oppdrag) | syntetisk OD i lukket sløyfe — validering av estimatormaskineriet |
| **MODELLED** | Mars-dynamikk med Sola i sentrum mot JPL DE440 | **137 m @ bue på 1 døgn** (vokser med buen = umodellert n-legeme) | JPL DE440 via ANISE (`xval/anise-mars-od`, kjerneavhengig) (sammenlignet mot denne referansen; ingen rad i verifikasjonsmatrisen nevner den som ekstern referanse, så den er ikke merket VALIDATED) |
| **VALIDATED** | Enkeltpunktsposisjonering mot en innmålt IGS-koordinat (ekte observasjoner) | **5.7 m** 3-D RMS / **1.1 m** horisontalt, ionosfærefri kode-SPP med to frekvenser | IGS-stasjonen ABMF innmåling + kringkastet GPS-efemeride, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Tett koblet GNSS/INS-UKF | **0.77 m RMS** over en 30-min LEO-passering inkl. et avbrudd på 120 s | kysting med kraftmodell, håndutledet |
| **MODELLED** | Gravitasjonskartnavigasjon uten GPS | ~70 km INS-drift → **~145 m** gjenvunnet | ESA NAVISP *Quantum Wayfarer*-mål |
| **MODELLED** | Terrengreferert navigasjon (TERCOM/SITAN) | 70 km drift → **< 500 m** (gulv fra rutenettoppløsning ~140 m) | SRTM `.hgt` DEM; håndinjisert drift (ikke-sirkulær kontroll) |
| **MODELLED** | IGRF-14 hovedfelt (grad/orden 13) | pol ~80.7°N, dipol ~29.7 µT, fysisk bånd 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (Schmidt semi-normalisert) |
| **MODELLED** | Modulasjon av navigasjonssignal og kodesporing | BPSK self-SSC = **2/(3·R_c)**; PSD-er med enhetsareal; C/A DLL-jitter **under en meter** @ 45 dB-Hz | Ankre for SSC/PSD på lukket form + Kaplan & Hegartys formel for termisk støy i DLL |
| **MODELLED** | CR3BP-differensialkorrektor for halo/NRHO | STM = endelige differanser; banen lukkes til **maskinpresisjon**; L2 9:2 NRHO **≈ 6.57 d / periselen ≈ 3,250 km** | STM-kontroll med endelige differanser + publisert sørlig L2 9:2 NRHO (≈ 6.56 d / ≈ 3,370 km) — CR3BP, ikke en ekte Gateway-efemeride |
| **MODELLED** | ARAIM-integritet med to konstellasjoner | konstellasjonsdekkende feilmodus på ekte GPS + Galileo | EU ARAIM TR (teknisk rapport) / DO-316; Celestrak `gps-ops` 2021-07-28 (sammenlignet mot denne referansen; ingen rad i verifikasjonsmatrisen nevner den som ekstern referanse, så den er ikke merket VALIDATED) |
| **VALIDATED** | GNSS-geometri / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | samsvar til **1e-6 relativt** over 8 geometrier (godt kondisjonert → nesten singulær) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — uavhengig bibliotek (`tests/dop_reference.rs`) |
| **VALIDATED** | ML-metrikker for evaluering av detektorer (AUC/ROC/forvekslingsmatrise/Pd-Pmd/presisjon/F1) | **eksakte tellinger + < 1e-9** over 5 datasett × 24 terskler | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — uavhengig bibliotek (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC AUC for anomalideteksjon på **ekte telemetri fra ESA OPS-SAT** | AUC reproduserer scikit-learn til **< 1e-9**; toppteller-detektorens AUC **≈ 0.85** på den merkede testoppdelingen | scikit-learn `roc_auc_score` på testoppdelingen i OPSSAT-AD (Ruszczak et al. 2025, CC BY 4.0) — ekte OPS-SAT-telemetri (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Numeriske kjerner for kvanteavveining (ADEV NNLS-tilpasning · χ²-konsistensbånd · van Loans klokke-Q) | NNLS + Q **eksakt**; χ² **< 5e-4** ved operative frihetsgrader ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | Telekom-vandringsmetrikkene MTIE / MDEV / TDEV (ITU-T G.810/G.823/G.8261/G.811 — anbefalingene fra standardiseringssektoren for telekommunikasjon i International Telecommunication Union) | MTIE (9 midlingsfaktorer, bit-eksakt) og MDEV + TDEV (8 faktorer, **< 1e-9** relativt) på LCG-serien (lineær kongruensgenerator) i NIST SP 1065 | allantools 2024.06 `mtie` / `mdev` / `tdev` — uavhengig bibliotek (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | MCDA-metoder for avveiningsstudier — alle fire beslutningsfamilier, ni eksternt validerte aggregatorer (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) pluss prioritetsvekting ved parvise sammenligninger etter **AHP** | scorer / rangeringer / konkordansmatriser reprodusert til **< 1e-9** | pymcdm + pyDecision (uavhengige MCDA-biblioteker fra tredjeparter) + Saaty RI (Random Index) / SciPy-LAPACK eig (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | Doppler-omslutning for LEO fra banen og bærebølgen | Iridium-maksimum innenfor **5 %** av de publiserte ±36 kHz; Xona Pulsar X1 innenfor de publiserte **32–34 kHz** | RNTF LEO PNT-testresultater; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | PPP-konvergens med LEO-forsterkning | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min med 60 / 96 / 192 / 288 LEO-satellitter, monoton; filter-NEES innenfor χ²-båndet | trend sammenlignet med Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); konstellasjoner og støy ikke reprodusert |
| **MODELLED** | Betinget Timing Protection Level (holdover-begrenset udetektert tidsfeil under spoofing) | sammensetningen reproduserer flertrinns kovariansrekursjonen i `clock_state`; kalibrert på en ekte innspilt spoof | skalarer fra JammerTest 2024 (Zenodo 15911589) + van Loan / CUSUM på lukket form (`examples/tpl_jammertest`) |
| **MODELLED** | Scoring av PNT-robusthet + beslutningsustabilitet | 35 håndutledede referansetester; byte-deterministisk studieartefakt (fast seed) | DHS RPCF v2.0-kartlegging + Dirichlet / Kendall-τ / Hill-N2 på lukket form — syntetiske arkitekturer, ikke en sertifisering |
| **MODELLED** | Studie av optimismegapet for RF-svekkelser (skaleringslover + leave-one-out-prediktor) | signifikans mot permutasjonsnull; byte-deterministisk artefakt (5 seeds) | syntetisk parameterforankret korpus — evaluerings*metrikkene* er VALIDATED mot scikit-learn (ovenfor); studien er MODELLED |
| CI | Reproduserbarhet på tvers av plattformer | bit-identiske inndata + form-gylne filer på 3 OS-er (operativsystemer) | CI-matrise for Linux / macOS / Windows, SHA-256-gylne filer |
| CI | Testdekning | **~95 % linjer** på `src/` unntatt `src/*_data.rs` og `src/main.rs`, sikret ≥ 85 % | cargo-tarpaulin (LLVM-motor) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Hvordan en funksjon opptjener merkelappen sin: Krav avbildes til en modul i src, til en test i tests, til en ekstern referanse (ekte datasett, uavhengig referanseimplementering eller publiserte vektorer), til en status — med et vern håndhevet i CI om at ingen funksjon kan være Validated uten en ekstern referanse. Aktuelle tall: 176 Validated, 221 Modelled, 4 Partner, 401 totalt" width="900">
  <br><sub>Hvordan en funksjon opptjener merkelappen sin — invarianten håndhevet i CI: ingen ekstern referanse ⇒ kan ikke være Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Hvordan hver påstand er underbygget: Validated-kolonnen er 176 av 176 ExternalDataset per konstruksjon (håndhevet i CI); Modelled-rader er ærlig merket InternalConsistency, ReferenceImpl eller ExternalDataset; Partner-rader har ingen Kshana-referanse" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Verste posisjonsfeil for SGP4/SDP4 mot referansen AIAA 2006-6753 per regime, logaritmisk skala: hvert regime ligger langt under AIAA-toleransen, verst 4.12 mm i det ikke-resonante dyprom-regimet" width="96%">
  <br><sub>Øverst: hver Validated-rad er underbygget av et eksternt datasett, per konstruksjon. Nederst: SGP4 samsvarer med den offisielle referansen i hvert regime (verst 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Verifikasjonsstatus over alle 401 funksjoner: 176 Validated (kontrollert mot ekstern referanse), 221 Modelled, 4 eid av Partner" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Funksjonsdomener

Hver funksjon i det offentlige kartet, etter domene, med merkelappen fra registeret. Domenetabellen skrives av
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) fra `web/capabilities.json`, den samme filen som
Studios kart over alt leser.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Kshanas funksjoner etter domene og modenhet: validerte og modellerte offentlige funksjoner per domene, tegnet fra web/capabilities.json av tools/gen_validation_figures.py" width="900">
</picture>

Hele tabellen, domene for domene med hver funksjon og merkelappen dens, står i [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Installasjon

Én linje gir deg kommandolinjeverktøyet: **`cargo install kshana`**. Hver kanal leverer
v0.40.0 fra den samme taggede committen.

<!-- channels:begin -->
| Kanal | Installasjon | Veiledning |
|---|---|---|
| Prøv i nettleseren | åpne https://kshana.dev | [Studio-veiledning](https://kshana.dev/docs/studio.html) |
| Kommandolinje (Rust) | `cargo install kshana` | [Bruk av kommandolinjen](https://kshana.dev/docs/rust.html#usage--cli) |
| Rust-bibliotek | `cargo add kshana` | [API-referanse på docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Veiledning for Python-API](https://kshana.dev/docs/python-api.html) |
| JavaScript og WebAssembly | `npm install kshana` | [Veiledning for npm og WebAssembly](https://kshana.dev/docs/npm.html) |
| AI-assistent (MCP-server, cargo) | `cargo install kshana-mcp` | [Veiledning for MCP-serveren](https://kshana.dev/docs/mcp.html) |
| Docker-image | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Veiledning for MCP-serveren: Docker](https://kshana.dev/docs/mcp.html#install) |
| Claude Desktop-utvidelse | dobbeltklikk på `.mcpb` for systemet ditt: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (ett klikk) | [Legg til i Cursor (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Legg til i Cursor (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (ett klikk) | [Installer i VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Installer i VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Forhåndsbygd binærfil | last ned kshana-mcp-<target> fra utgivelsen og kontroller den mot SHA256SUMS | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Offisielt MCP-register | søk etter io.github.ashfordeOU/kshana-mcp | [Alle installasjonsutdrag for MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Ekstern (strømmbar HTTP), selvdriftet | `kshana-mcp --http 127.0.0.1:8080` | [Veiledning for selvdrift](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Claude Code-utvidelsesmarkedet | `/plugin marketplace add ashfordeOU/kshana` | [Bruke Kshana fra en agent](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| JetBrains-IDE-utvidelse | Settings → Plugins → Marketplace → søk etter "Kshana" (utvidelses-ID dev.kshana.ide) | [Veiledning for utvidelsen](https://kshana.dev/docs/jetbrains.html) |
| Signal K-utvidelse | `npm install signalk-kshana-trust` | [Veiledning for Signal K-utvidelsen](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| OpenCPN-utvidelse | last ned utvidelsens tarball fra utgivelsen | [Innsending til OpenCPN-katalogen](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Grafana-dashbord | importer kshana-grafana-*.json fra utgivelsen | [Dashbordets kilde](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Image for referansebygg | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Maritime integrasjoner](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana på JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Bygger med Rust 1.88 eller nyere, rust-version i Cargo.toml"></a></p>

MCP er Model Context Protocol. Fest en utgivelse med `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` eller `npm install kshana@0.40.0`. For å bygge fra kildekode, se
[Installasjon og bygging](#install--build) under Referanse.

<details>
<summary>Kjør et scenario fra Python og fra WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Utover `run` eksponerer modulen `run_full` (JSON, SVG og enlinjesammendraget på én gang),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` og `error_kind`; se
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

npm-pakken er hele motoren kompilert til WebAssembly. I Node.js gir du binærfilen til
`initSync`; i en nettleser henter `await init()` den (se [`README.npm.md`](README.npm.md)).

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

Én åpen motor står i sentrum, og hvert grensesnitt kjører den: kommandolinjen, Rust-
biblioteket, Python, WebAssembly og Kshana Studio, MCP-serveren, Docker-imaget og
JetBrains-utvidelsen. Den samme scenariofilen gir de samme bytene på hver. Kshana Pro ligger
på toppen som et separat overlag som avhenger av motoren og aldri forgrener den.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Kshanas arkitektur: én åpen motor i sentrum, kshana 0.40.0 under AGPL-3.0, med api::run_toml, en typet fordeling over hver type, og verifikasjonsregisteret med 401 funksjoner (176 VALIDATED, 221 MODELLED, 4 PARTNER). Rundt den kjører hvert grensesnitt den samme motoren: Kommandolinje (cargo install kshana); Rust-bibliotek (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); MCP-server (cargo install kshana-mcp); Docker-image (ghcr.io/ashfordeou/kshana-mcp); JetBrains-utvidelse (Marketplace: &quot;Kshana&quot;). Under den Kshana Pro, et proprietært overlag som avhenger av den åpne motoren som et bibliotek og aldri forgrener den, og som ikke legger til noen fysisk modell." width="100%">
</picture>

<details>
<summary>Inne i motoren: domenelagene og verifikasjonsregisteret</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="Kshanas arkitektur i lag. Fem inngangsdører (kommandolinje, Python, JavaScript og WebAssembly, MCP-serveren og JetBrains-utvidelsen) når én api::run_toml, en typet fordeling over 92 typer. Under den ligger åtte domenelag: tid og referansesystemer, klokker og tidssynkronisering, treghet og fusjon, GNSS og integritet, astrodynamikk, LEO-PNT, Månen, Mars og dypt rom, og oppdrag og studier, på en felles kjerne, alle kryssreferert av verifikasjonsmodulen, den maskinkontrollerte matrisen med 401 funksjoner som er den eneste sannhetskilden for hver merkelapp." width="100%">
</picture>

**Én motor, mange inngangsdører.** Én enkelt Rust-kjerne (`kshana`) kjører hvert scenario,
nådd gjennom en CLI, en Python-utvidelse, en WebAssembly-modul i nettleseren, en **MCP-
server** for AI-agenter, og en **JetBrains-IDE-utvidelse** — alle samles i én
`api::run_toml`-fordeling. Inni kobles sensorpakkene til et felles feilmodell-
grensesnitt; ved siden av dem ligger et **lag for referansesystemer** (IAU 2006/2000A
presesjon–nutasjon og den CIO-baserte GCRS↔ITRS-reduksjonen), et **astrodynamisk/numerisk
lag** (analytisk SGP4/SDP4 **og** en numerisk Cowell-propagator med sin
EGM2008-/perturbasjonskraftmodell, manøverdesign og banebestemmelse), et
**integritets-/GNSS-lag** (RAIM/ARAIM, SBAS, måledomenet, jamming, cislunart),
et **fusjons-/alt-PNT-lag** (GNSS/INS-estimatorene og kartmatcherne for gravitasjon/terreng/magnetisme),
et **lag for dypt rom og Månen** (radiometrisk Mars-PNT og
PNT-pakken for Månen, med evidensnivå per del i matrisen — LTC-tid, VLBI, felles OD+klokke, realisering av referansesystem, tjenestevolum,
differensiell PNT, interop), et **lag for oppdragsanalyse** (budsjetter for oppskyting / gjeninntreden / dekning /
peking / passering / link og romværmiljøet), og det åpne
**studielaget for robusthet og AI/ML** (RPCF-robusthetsscoring, optimismegapet for RF-svekkelser,
og demonstratoren for kvanteaktivert PNT) der de reproduserbare artefaktene bygger på
de validerte kjernene.

To frittstående crates som er **utelatt fra arbeidsområdet**, står ved siden av kjernen — `mcp/kshana-mcp`
(MCP-serveren, bygget på `rmcp`-SDK-en for edition 2024) og `xval/anise-frames` (kryssjekken av
referansesystemer med ANISE/SPICE, som trekker inn avhengigheter under MPL-2.0 (Mozilla Public License 2.0)) — holdt utenfor den publiserte
cratens avhengighetsgraf, `Cargo.lock`, lisensporten og MSRV-bygget (minste støttede Rust-versjon) av rotens
`Cargo.toml` `exclude`-liste. JetBrains-utvidelsen (`ide/jetbrains`) er et separat Kotlin-
prosjekt. Se [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for hele settet med diagrammer.

De gjengitte diagrammene (motorflyt, modulkart, distribusjon) står i [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagrammer

Diagrammene er Mermaid-kilder i [`docs/diagrams/`](docs/diagrams/), gjengitt til SVG og PNG i
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` på Linux, de to andre
`render-diagram`-skriptene ellers), og en oppføring binder hver PNG til den nøyaktige SVG-en den kom fra. Tester låser
tallene de oppgir. Diagrammene i seksjonene ovenfor tegnes av verktøy fra motorkjøringer; disse viser hvordan
delene passer sammen.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Systemet: seks inngangsdører (kommandolinje, Python, WebAssembly og npm med Kshana Studio, MCP-server med utvidelser og ferdigheter, JetBrains-utvidelse, integrasjoner) kaller alle én fordeling over hver scenariotype, som kjører én motor av felles kjerne, sensorpakker og referansesystemer, og domenemodeller, og skriver et reproduserbart resultat og diagram" width="900"><br>
  <sub>Én fordeling, én motor, reproduserbare utdata · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · kilde <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Grensesnittene: én deterministisk frakoblet motor mater kommandolinjen, Rust-biblioteket, Python, WebAssembly og npm, og MCP-serveren; Studio kjører på WebAssembly-bygget, utvidelseskommandoer og ferdigheter på MCP-serveren, integrasjoner og utrullingssett på kommandolinjen, og JetBrains-utvidelsen på biblioteket" width="900"><br>
  <sub>Hvert grensesnitt, fra den samme motoren · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · kilde <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Inne i én kjøring: en scenariofil med seed og GNSS-tidslinje mater motoren, som for hvert tidssteg utvikler feilmodellen, kjører estimatoren og scorer ytelsestallene, og skriver et reproduserbart resultat og diagram" width="900"><br>
  <sub>Den indre løkken i en kjøring · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · kilde <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Mottakertillit: en mottakerlogg eller -strøm leses inn til observabler per epoke og mottakerens egne flagg, går gjennom overvåkerne og blir en veiledende tillitsscore med et bånd og begrunnelser, som mater Studio, telemetri, en signert bevispakke, Jammertest- og bench-scoring, og compliance-rapporten" width="900"><br>
  <sub>Fra en mottakerlogg til en tillitsscore og det som bruker den · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · kilde <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="Laboratorierundturen: et scenario eksporteres med hendelsene og testbetingelsene sine, en operatør utenfor Kshana spiller av en fil gjennom en laboratoriesimulator, mottakerloggen scores mot de oppgitte hendelsene, og evidensrundturen kobler hashene for scenario, betingelser og logg og scoren sammen i en signert pakke" width="420"><br>
  <sub>Fra scenario til signert pakke; Kshana produserer eller spiller aldri av et signal · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · kilde <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: nettleseren kjører motoren kompilert til WebAssembly lokalt uten at noe lastes opp, tar medfølgende scenarioer eller et scenario eller en logg du åpner, og viser resultatet i den enkle visningen, den avanserte visningen og oppgavesidene, med eksporter lagret av brukeren" width="900"><br>
  <sub>Slik kjører Studio, lokalt · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · kilde <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Test- og utgivelsesflyten: lokale porter (formatering, clippy, kontrollen mot tilskrivning, skralla for dokumentasjonsdekning, og scripts/gate.sh, som kjører hele suiten og gjentatte kjøringer og skriver kvitteringen som pre-push-kroken kontrollerer) fører til en pull request bare for CI og en grønn full CI; eieren spoler main frem til den grønne committen og en annotert tag legges på den etter kontrollen av versjonssynkronisering; utgivelsesarbeidsflyten verifiserer hele suiten på den taggede committen før noe publiseres, bygger binærfilene med en SBOM, kontrollsummer og byggeproveniens, publiserer til crates.io, PyPI, npm, containerregisteret, MCP-registeret og JetBrains Marketplace, spør hvert register til det leverer den nye versjonen, og starter byggingen av nettstedet fra taggen; en separat vei bare for nettstedet starter pages-arbeidsflyten med taggen main og avvises med mindre ingenting utenfor web/ og .github/ er endret siden siste utgivelse" width="900"><br>
  <sub>Test- og utgivelsesflyt, fra lokale porter til en verifisert utgivelse og veien bare for nettstedet · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · kilde <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="Modulkartet: kommandolinjen, Python, WebAssembly, MCP-serveren og JetBrains-utvidelsen kaller den typede fordelingen over hver type, som når den felles kjernen, tid og referansesystemer, sensorpakker, astrodynamikk, integritet, spoofdeteksjon, fusjon, dypt rom og Månen, robusthet, og dommer- og benchmark-modulene, alt underbygget av verifikasjonsmatrisen" width="1000"><br>
  <sub>Hvor koden ligger · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · kilde <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Distribusjon: ett repositorium leverer kjernecraten, MCP-serveren, IDE-utvidelsen og kryssjekk-cratene til crates.io, PyPI, npm, GitHub Releases, Pages-lekeplassen, containerregisteret, MCP-registeret og JetBrains Marketplace, med et Zenodo-arkiv" width="900"><br>
  <sub>Hva som leveres hvor, og hva som kontrollerer det · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · kilde <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## AI-assistent

[`kshana-mcp`](mcp/kshana-mcp/) er en MCP-server: assistenten din kjører den faktiske motoren og
leser tilbake JSON-en, i stedet for å gjette matematikken. Hvert av de 49 verktøyene er en tynn innpakning
rundt en offentlig funksjon i `kshana`-biblioteket, så ingen simuleringslogikk ligger i serveren.

### Installer MCP-serveren

> Veiledende, ikke typegodkjent navigasjonsutstyr: operatøren er fortsatt ansvarlig for navigasjonen.
> Serveren kjører på datamaskinen din; ingenting sendes til Ashforde OÜ.

Velg en hvilken som helst kanal. Hver lenke og hvert utdrag genereres fra ett skript
(`scripts/gen_mcp_install.py`) og kontrolleres i kontinuerlig integrasjon; utdrag for Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI og Continue står i
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Kanal | Kommando eller knapp | Krever | Festet form |
|---|---|---|---|
| Claude Desktop-utvidelse | dobbeltklikk på `.mcpb` for systemet ditt: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | ingenting | `kshana-mcp-<target>.mcpb` av v0.40.0 |
| Cursor (ett klikk) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node, eller Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (ett klikk) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node, eller Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · utvidelse: `/plugin marketplace add ashfordeOU/kshana` deretter `/plugin install kshana@ashforde` | Node (eller Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ med uv eller pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | formel for v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` deretter `scoop install kshana-mcp` | Scoop (Windows) | manifest for v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Forhåndsbygd binærfil | [utgivelsessiden](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, kontrollert med `SHA256SUMS` og `gh attestation verify` | ingenting | v0.40.0 |
| MCP-register | `io.github.ashfordeOU/kshana-mcp` (funnet av klienter som kjenner registeret) | en klient som kjenner registeret | `0.40.0` |
| Ekstern (strømmbar HTTP) | `kshana-mcp --http 127.0.0.1:8080`, selvdriftet: se [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | din egen vert | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp på Glama, kvalitetsscoren for MCP-serveren"></a></p>

I Claude Code kommer den samme serveren som en utvidelse: `/plugin marketplace add ashfordeOU/kshana`, deretter
`/plugin install kshana@ashforde`. Utvidelsen legger til skråstrekkommandoer over verktøyene: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` og `/kshana-jammertest`. Verktøyene for fartøystillit mater integrasjonene for Signal K og
OpenCPN: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

Oppsett per klient står i [`docs/integrations.md`](docs/integrations.md). Serveren er oppført
i det offisielle MCP-registeret som `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>De 49 verktøyene</summary>

<br>

**Scenarioer og rapporter**

| Verktøy | Hva det gjør |
|---|---|
| `run_scenario` | Kjør et scenario fra en TOML-definisjon (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | De 92 innebygde scenariotypene med beskrivelser + påkrevde/valgfrie felter — slik at agenten kan bygge et gyldig scenario |
| `validate_scenario` | Forhåndskontroll: tolk TOML-en og finn typen, uten å kjøre |
| `list_example_scenarios` | De medfølgende referansescenarioene som JSON |
| `get_example_scenario` | TOML-teksten til ett medfølgende referansescenario, byte for byte filen under `scenarios/` |
| `report_scenario` | Kjør et scenario og returner rapporten |
| `animate_scenario` | Kjør et scenario og returner tidsseriene som en animasjon |
| `sky_geometry` | Himmelgeometri under en asimutavhengig horisontlinje: de synlige og skjulte satellittene, DOP, øst-nord-opp-kovariansen og den horisontale feilellipsen; eller en forhåndsinnstilt horisontlinje med proveniensen sin |

**Eksport og interoperabilitet**

| Verktøy | Hva det gjør |
|---|---|
| `list_export_formats` | Hvilke interoperabilitetsformater som gjelder for et scenario (`czml`, `kml`, `geojson`, `stk`, `sigmf`), begrunnelsen når ett ikke gjør det, og spesifikasjonen hver skriver følger |
| `export_interop` | Eksporter et scenario som CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeride (Systems Tool Kit) `.e`, eller SigMF (Signal Metadata  |
| `import_route` | Skriv en GeoJSON-`LineString`-rute inn i et scenario som flyr et veipunktspor (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`) og returner den nye TOML-en |
| `export_sp3` | Eksporter konstellasjonen i et `orbit`-scenario som presis efemeride i SP3-c (Standard Product 3, revisjon c) |
| `export_omm` | Eksporter elementene i et `orbit`-scenario som en OMM-katalog (Orbit Mean-elements Message) etter CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 |
| `export_oem` | Eksporter tilstandsserien i et `orbit`-scenario som CCSDS OEM-efemeride (Orbit Ephemeris Message) 2.0 — TEME-posisjonen (sann ekvator, middel jevndøgnspunkt) *og*  |
| `export_table_csv` | Kjør et scenario og returner reproduserbarhetstabellen som CSV (kommaseparerte verdier) — den bytestabile tabellen som CLI-en (kommandolinjegrensesnittet) skriver som `<scenario>.table.csv` |
| `export_test_bench` | Et scenarios fartøysbevegelse og hendelser for en GNSS-simulator i laboratoriet (`kshana bench-export`) |

**Mottaker- og fartøystillit**

| Verktøy | Hva det gjør |
|---|---|
| `assess_receiver_log` | Vurder tilliten til en ekte GNSS-mottakerlogg (globalt satellittnavigasjonssystem) |
| `assess_vessel_stream` | Scor et avgrenset NMEA 0183-utdrag (høyst 2 MiB og 20,000 epoker |
| `assess_vessel_log` | Et fartøys NMEA 0183-logg (høyst 4 MiB) som en batch-kjøring, med sesjons-TOML-en som oppgir fartøyets grenser |
| `create_evidence_pack` | En signert bevispakke for et vindu av et fartøys logg (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Bind et tidsstempeltoken etter RFC 3161 (base64 av `.tsr`-bytene) til en pakke, i minnet (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Verifiser en pakke (`kshana evidence verify`) |
| `generate_training_nmea` | Syntetisk NMEA 0183 for broen til mannskapstrening fra en `nmea-scenario`-TOML (jamming, posisjonsavdrift, tidsspoof, avspillingsforsinkelse) med instruktørloggen (`kshana-nmea-training/1`) |
| `build_interference_map` | Et GNSS-interferenskart fra ADS-B- eller AIS-posisjonsrapporter som CSV-tekst (høyst 4 MiB) |
| `route_exposure` | Andelen av en rutes lengde i degraderte, ikke degraderte, ikke vurderte og ikke observerte celler i ett eller flere interferenskart, valgfritt innenfor et datointervall |
| `trust_telemetry` | En tillitsstrøm (JSON-linjer) eller et `receiver-trust`-resultat gjengitt som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP-JSON-nyttelast, med koderne i `kshana trust-telemetry` |
| `jammertest_import` | Les den publiserte Jammertest-testkatalogen og sendeplanen (NPRA/jammertest-plan, MIT) som planlagt fasit (`kshana jammertest import`): ett testområdes tidsluker blir receiver-trust-hendelser med katalog-id og år i hver merkelapp. Planlagte tidsluker, ikke registrerte sendetider; ingen kontaktfelt i planen leses. MODELLED. Se [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Scor en mottakerlogg mot den planen (`kshana jammertest score`): per test deteksjonsforsinkelsen, tapte alarmer og tid til gjenoppretting, og de falske alarmene utenfor alle tidsluker. Tekstlogger som `log`, binære (`ubx`, `sbf`) som `log_base64`. En signert pakke trenger en nøkkel: kommandolinjen. Kun veiledende; MODELLED. |
| `fit_imu_log` | Akselerometer- og gyroparameterne for `hybrid`- og `fusion`-scenarioene tilpasset fra en stillestående IMU-logg (CSV eller EuRoC) med Allan-avvik, med en `[accel_classical]`-tabell klar til innliming og loggens SHA-256 (`kshana imu-fit`). Tekst inn, JSON ut; MODELLED. |

**GNSS IQ (filer i arbeidskatalogen; av i HTTP-modus)**

| Verktøy | Hva det gjør |
|---|---|
| `iq_signals` | Oppsettet for GNSS-IQ-laget |
| `iq_info` | Beskriv ett IQ-opptak (i fase og kvadratur) i arbeidskatalogen uten å behandle det |
| `iq_scene` | Generer en GNSS-IQ-scene med flere satellitter i arbeidskatalogen (`kshana iq scene`) |
| `iq_acquire` | FFT-innhenting (rask Fourier-transform) av én eller flere PRN-er (pseudotilfeldige støykoder) over et opptak (`kshana iq acquire`), valgfritt bak frontend-trinn |
| `iq_track` | Innhent, deretter spor med DLL/PLL/FLL-banken (forsinkelses-, fase- og frekvenslåst sløyfe) (`kshana iq track`), med sløyfene fra en `kshana.loop-desig |
| `iq_frontend` | Anvend mottakerens frontend og DSP for interferensdemping (digital signalbehandling |
| `iq_sweep` | Spill av ett IQ-opptak i arbeidskatalogen over flere design for sporingssløyfe (`kshana iq sweep`) |
| `iq_monitor` | Kjør overvåkerne for deteksjon av interferens og spoofing over et IQ-opptak i arbeidskatalogen (`kshana iq monitor`) |
| `iq_labfit` | Tilpass modellen for tap av låsing i sporingssløyfen til laboratoriekjøringer (`kshana iq labfit`) fra et `iq-labfit`-scenario der loggene er inline (`text` eller `base64` |
| `iq_test_conditions` | Valider en `kshana.test-conditions/1`-fil gitt som tekst og returner de oppløste betingelsene med hashen sin |
| `iq_campaign` | Kjør en kampanje med laboratorieavspilling (`kshana iq campaign`) |
| `iq_campaign_status` | Fremdriften til en kampanjes utdatamappe |

**Kartlegging mot compliance**

| Verktøy | Hva det gjør |
|---|---|
| `compliance_report` | Kartleggingen mot offentlige rammeverk fylt ut fra resultatdokumenter gitt som tekst (`kshana compliance-report`) |
| `compliance_mapping` | De statiske kartleggingstabellene (eller, med `sources`, kildedokumentene de viser til med versjoner og URL-er) som Markdown, innledet av den samme erklæringen |
| `list_standards_packs` | Standardpakkene (`kshana standards-pack list`): scorede scenariosett for testprofilene i DHS Resilient PNT-rammeverket, IMO MSC.1/Circ.1575 og ICAO Doc 9849 Appendix F |
| `run_standards_pack` | Én pakke kjørt mot terskler oppgitt før kjøringen: hver test `MET`, `NOT MET` eller `NEEDS INPUT`; MODELLED, vurderer ikke noe produkt |
| `lunanet_afs_check` | LunaNet Augmented Forward Signal kontrollert mot LNIS V5 AD1 Volume A (LSIS-AFS V1.0): kodene mot de trykte tabellene, eller en symbolstrøm mot rammeformatet; LDPC og CRC-24Q i delrammene 2 til 4 verifiseres ikke |
| `create_round_trip_pack` | Den signerte laboratorierundturpakken: scenario, `kshana.test-conditions/1`-dokument, mottakerlogg og score koblet med hash |

**Benchmark**

| Verktøy | Hva det gjør |
|---|---|
| `score_benchmark` | En kshana-bench-innsending scoret mot en fasitfil, begge som JSON-tekst (`kshana bench score`, `bench/SPEC.md`): resultatfilen med spesifikasjonsversjonen, oppdelingen, inndatahashene og oppgavens metrikker. MODELLED; beskriver en logg eller et korpus, aldri et produkt. |
| `render_leaderboard` | kshana-bench-resultatfiler gjengitt som den statiske resultatlistesiden (HTML-tekst), hver validert først. |

</details>

<a id="editions"></a>
## Utgaver

Hele motoren er gratis. Kshana Pro og skreddersydde studier er for programmer som trenger mer,
og hver betalt vei starter med en melding: det står ingen priser her.

| | Gratis | Kshana Pro | Skreddersydd studie |
|---|---|---|---|
| Hva det er | hele den åpne motoren, alle 92 scenariotyper, ingen funksjonssperre | et proprietært overlag på den samme motoren, under kontrakt | en MODELLED studie av PNT-robustheten til systemet ditt, utført for deg |
| Lisens | AGPL-3.0 (GNU Affero General Public License, versjon 3), eller en kommersiell lisens | proprietær | kontrakt |
| Slik starter du | [installer](#install) eller åpne [kshana.dev](https://kshana.dev) | [be om en Pro-evaluering](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [be om en studie](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Hva Pro er, med ordene i [`docs/PRO.md`](docs/PRO.md):

> **Et strengt overmengde av åpne Kshana.** Pro avhenger av den åpne motoren som et bibliotek og
> forgrener den aldri. Hver åpen scenariotype kjører uendret i Pro, og et åpent scenario kjører
> i Pro uten noen lisens i det hele tatt.
>
> **Ingen ny fysikk.** Pro legger ikke til noen fysisk modell og endrer ingen. Hvert Pro-tall kommer
> fra kjøringer av den åpne motoren, så et Pro-tall er like pålitelig som den åpne scenariotypen
> det kom fra, og aldri mer.

Pro besvarer et programs neste spørsmål: hvilket design som skal fly (en designoptimerer og dens
Pareto-front), hvor sikkert svaret er (usikkerhet og sensitivitet), og om oppdraget
oppfyller kravene sine (en oppdragsmappe, sporbarhet av krav, avveiningsstudier, en
regresjonskontroll av scenarioer, digitale tvillinger av klokker, en studiemappe og en lokal
tjeneste). Den overvåker også en kampanje av tall og får en pipeline til å feile når ett blir verre,
tester kandidater til signalplaner mot de åpne satellittnavigasjonssignalene i begge
retninger (spektral sameksistens), og setter studier i kø i en lokal jobbtjeneste med et
hashkjedet leveringsregister. Hver av dem er beskrevet, med hva den produserer og hva den ikke gjør, i
[`docs/PRO.md`](docs/PRO.md). Ingenting Pro produserer er en sertifisering, og en skreddersydd studie er
heller ikke en sertifisering.

<details>
<summary>Hva Kshana Pro leser fra den åpne motoren, og støtte fra Ashforde® OÜ</summary>

<br>

**Hva Kshana Pro bygger på.** Hver del av Pro arbeider ut fra den åpne motoren og lar
den være uendret:

- **Designoptimereren, usikkerhetsstudien og oppdragsmappen** kjører scenarioer i den åpne motoren
  gjennom motorens offentlige grensesnitt og beregner hvert tall fra kjøringenes
  resultater. Hvert resultat beholder nivået VALIDATED, MODELLED eller PARTNER som den åpne motoren ga
  hvert tall, aldri et høyere.
- **Digitale tvillinger av klokker** bruker den åpne motorens klokkemodell og dens estimator for Allan-avvik:
  en tvilling kalibreres til enhetens publiserte Allan-budsjett, og kontrolleres deretter ved å
  estimere tvillingens Allan-avvik med den åpne estimatoren.
- **Avveiningsstudier** kjører hvert arkitekturalternativ som et scenario i den åpne motoren, uendret,
  og rangerer alternativene etter et ytelsestall lest fra hver kjørings resultat.
- **Kampanjeovervåking** leser tallene sine fra resultatene av kjøringer i den åpne motoren av
  scenarioene i en pakke, og sammenligner dem med den forrige beståtte kjøringen.
- **Spektral sameksistens** leser hvert fysiske tall fra kjøringer i den åpne motoren av
  typene `leo-signal` og `constellation-design`, og legger bare til summen over satellittene
  i sikte og rangeringen av planene.
- **Den lokale jobbtjenesten** kjører åpne scenarioer og Pro-scenarioer gjennom den samme motoren og
  lagrer hvert resultat slik kjøringen returnerte det.
- **Bevispakker** registrerer, for hver kjøring, scenariohashen som den åpne motoren stempler på
  resultatet sitt, slik at et tall i en pakke kan reproduseres ved å kjøre scenarioet på nytt.
- **Verktøy for systemteknikk og programmer.** Kshana Pros verktøy for modellbasert
  systemteknikk (MBSE) og programmer kontrollerer et programs krav
  mot kjøringer av den åpne motoren: det importerer krav som kommaseparerte verdier
  (CSV), eller som en dokumentert delmengde av Requirements Interchange Format (ReqIF) eller av
  tekst i Systems Modeling Language versjon 2 (SysML v2), evaluerer hvert akseptanse-
  kriterium, med enheten sin, mot verdiene en kjøring skrev, og produserer en verifikasjons-
  kryssreferansematrise (VCRM), en SysML v2-modell, en rapport om endringspåvirkning og en frakoblet
  bevispakke. Det kjører ingenting på nytt og beregner ingenting på nytt, og leser bare det den åpne motoren
  publiserer: hver kjørings `result.json` (feltene et kriterium nevner, enhetene deres,
  reproduserbarhetsstempelet med scenariohash, seed, motorversjon og skjemaversjon, og
  kjøringens merkelapp og tallnivåer), dens `report.json` (type, reproduserbarhetsoppføring og
  funksjonsmerkelapper), scenariofilen (hash, type, seed og parametere),
  skjemaet for feltenheter (hvert felts enhet, proveniens og evidensnivå) og
  verifikasjonsmatrisen (hver funksjons merkelapp VALIDATED, MODELLED eller PARTNER).

<a id="support--professional-services"></a>
### Støtte og profesjonelle tjenester

Kshana er gratis og åpen kildekode under AGPL-3.0 og **profesjonelt utviklet og
vedlikeholdt av Ashforde® OÜ** (Estland). Den åpne motoren er komplett og brukbar
alene. For organisasjoner som trenger mer, tilbyr Ashforde® OÜ:

- **Kommersiell støtte og integrasjon** — innbygging av Kshana i verktøykjeden din, skreddersydde
  scenarioer og prioriterte rettelser.
- **Skreddersydde sensormodeller** — kalibrert til maskinvaren din, inkludert eksportsensitive
  robusthetsmodeller vedlikeholdt i et privat overlag.
- **Kshana Pro** — proprietære verktøy for modellbasert systemteknikk (MBSE) og programmer
  som kontrollerer et programs krav mot kjøringer av den åpne motoren og
  produserer en verifikasjons-kryssreferansematrise (VCRM), en modell i Systems Modeling Language
  versjon 2 (SysML v2), en rapport om endringspåvirkning og en frakoblet bevispakke. Det
  kjører ingenting på nytt og leser bare motorens publiserte utdata: hver kjørings `result.json`
  og `report.json`, scenariofilen, skjemaet for feltenheter og
  verifikasjonsmatrisens merkelapper (hele listen står under [Utgaver](#editions)).
- **Kshana Pro-verktøy for design, usikkerhet og oppdrag** — Pareto-fronten for et design-
  rom, usikkerhet og sensitivitet over tusenvis av kjøringer, og en oppdragsmappe
  med én kommando med en verifikasjonsmatrise og en PDF; se [`docs/PRO.md`](docs/PRO.md).
- **Kshana Pro kampanjeovervåking, spektral sameksistens og jobbtjeneste** — en pipeline som
  feiler når et overvåket tall blir verre, signalplaner testet mot de åpne
  satellittnavigasjonssignalene i begge retninger, og en lokal jobbkø med et
  hashkjedet leveringsregister; se [`docs/PRO.md`](docs/PRO.md).
- **Opplæring og rådgivning** i ytelsesanalyse av kvante-/klassisk PNT.

Dette er open-core-modellen: motoren er, og forblir, åpent lisensiert; virksomheten
som bærer den, er ekspertise, støtte og de proprietære utvidelsene — ikke lisensavgifter.
Kontakt **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Forskning

Studier bygget på den åpne motoren publiseres på arXiv. Hver nevner motorkommandoen
bak den, slik at tallene kan regenereres fra et innsjekket scenario eller studieeksempel.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Forskning bygget på den åpne motoren: seks artikler på arXiv, hvert kort med artikkelen, datoen og kategorien, og motorkommandoen som regenererer tallene. De samme seks artiklene, med lenker og kommandoer, står i tabellen nedenfor." width="100%">
</picture>

| Artikkel | Hva den viser | Motorkommando |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | Fallet i scoren til en detektor for GNSS-interferens når forholdene forskyves, kan predikeres fra statistikk innenfor fordelingen alene, på en åpen syntetisk testbenk og deretter på åpne feltopptak. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | En GNSS-tidsmottaker under spoofing har ingen endelig ubetinget grense for udetektert tidsfeil, så artikkelen gir en betinget en, kalibrert på en innspilt spoof over luften fra den offentlige kampanjen JammerTest 2024. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Én sammensatt robusthetsscore er et stabilt beslutningsgrunnlag bare der ett design dominerer; der design konkurrerer, kan omvekting alene endre vinneren. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Avstandsmåling innenfor en månekonstellasjon etterlater en overflatestasjons absolutte posisjon ikke observerbar; en forsinkelse fra very-long-baseline interferometry (VLBI) fra Jorden gjenoppretter den når konstellasjonen er tynn, og skjerper den når den er rik. | typen `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Planlagte konstellasjoner med fire til seks satellitter gir dårlig geometri ved månens sørpol, og noen få avstandsfyr på overflaten retter det langt billigere enn flere satellitter. | typen `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Presisjonsutvanning er udefinert for cislunar sporing med bare avstand, fordi hastigheten ikke er observerbar i et øyeblikksbilde, så artikkelen bruker observerbarhets-Gramian-matrisen på fire plane fjerne retrograde baner: bare avstand har rang 2 av 4 i et øyeblikksbilde og trenger en bue på omtrent 2.09 h for å bli fullt observerbar, med kondisjonering som bedres når buen blir lengre; avstandsrate (Doppler) gir rang 4 umiddelbart; og samestimering av en stasjon med satellittilstander og klokker forblir rangmanglende med én med mindre en ekstern interferometrisk observabel legges til. Krav hører hjemme i budsjetter for buelengde, kondisjonering og måletype, ikke DOP. | typen `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (søsteren `cislunar-arc-recovery` tester terskelen med en uavhengig estimator med endelige differanser) |

De tre studieeksemplene skriver byte-deterministiske artefakter (faste seeds) som registrerer
motorversjonen, seedene og en konfigurasjonshash. De tre artiklene om Månen og cislunart rom er bygget på
månepakken (hver dels evidensnivå står i verifikasjonsmatrisen); påstandene deres om geometri og presisjonsutvanning er også kryssjekket
mot separate referanser i `tests/validate_p*.rs`. Mer i
[Reproduserbare studieartefakter](#reproducible-study-artifacts) under Referanse.

<a id="cite"></a>
## Siter

Hvis du bruker Kshana i akademisk eller teknisk arbeid, vennligst siter versjonen du brukte, med
scenarioet og seeden. [`CITATION.cff`](CITATION.cff) inneholder de maskinlesbare metadataene, og
GitHub viser en «Cite this repository»-knapp ut fra den. Hver utgivelse arkiveres på Zenodo;
konsept-DOI-en (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) peker alltid til den
nyeste versjonen.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Artiklene ovenfor:

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
## Lisens

Kshana er dobbeltlisensiert: GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)), eller en
**kommersiell lisens** fra Ashforde® OÜ for lukket integrasjon som AGPL ikke passer for.
[`LICENSING.md`](LICENSING.md) forklarer hvilken som gjelder. Bidrag lisensieres inn
under AGPL og gir også Ashforde® OÜ retten til å ta dem med i den kommersielle
utgaven; signer hver commit med `git commit -s` (se [`CONTRIBUTING.md`](CONTRIBUTING.md)).
«Kshana» og merkene er varemerker for Ashforde® OÜ: lisensen dekker koden, ikke
navnet, så vennligst gi forgreninger nytt navn.

<a id="reference"></a>
## Referanse

Det lange materialet, sammenfoldet. Hvert dokument er oppført i [Dokumentasjon](#documentation).

<details>
<summary>Installasjon og bygging fra kildekode</summary>

<a id="install--build"></a>
### Installasjon og bygging

Krever en Rust-verktøykjede (≥ 1.88, `rust-version` i Cargo.toml; utviklet på 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Bruk: kommandolinjen i sin helhet</summary>

### Bruk

Kjør et hvilket som helst scenario; CLI-en fordeler etter scenarioets `kind`-felt og skriver
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` og
`<scenario>.report.json` ved siden av det — pluss `<scenario>.table.csv` for typene som
publiserer en tabell. Rapporten (en side i HyperText Markup Language (HTML) og et JSON-dokument
med det samme innholdet) inneholder et sammendrag for ledelsen, hver inndata med enheten sin,
resultatene og diagrammene, en kampanjes sveip-, Monte Carlo- eller kjedetabeller, en tidslinje over hendelser,
merkelappen VALIDATED / MODELLED / PARTNER og kilden for hver funksjon kjøringen brukte,
hva som ikke er modellert, og en reproduserbarhetsoppføring (motorversjon, sammendrag med Secure Hash
Algorithm 256-bit (SHA-256), seed, plattform og den nøyaktige kommandoen). Den skrives ut til
en ren PDF-fil (Portable Document Format) fra nettleseren på A4- eller Letter-papir;
motoren skriver ingen PDF selv. Se [`docs/REPORTS.md`](docs/REPORTS.md).

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
og SigMF-opptak (Signal Metadata Format) ved siden av scenarioet, og
`--import-route <route.geojson>` mater en GeoJSON-linje inn i typene som flyr et spor. Hvert
format er validert mot sin publiserte spesifikasjon, og et scenario som et format ikke
gjelder for, sier hvorfor: se [docs/INTEROP.md](docs/INTEROP.md).

**Andre CLI-moduser** — lint et scenario, mat inn ekte data for jordorientering, eller kjør en hel suite:

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

**Animasjonseksport.** `--animate svg|html|frames|all` skriver `<scenario>.animation.svg`
(nøkkelbilder i Cascading Style Sheets (CSS), uten skript), `<scenario>.animation.html` (spill av, pause, spol, hastighet og
synkroniserte paneler, uten eksterne ressurser) og `<scenario>.frames/` (`frame_0000.svg`, … pluss
`manifest.json` med bilder per sekund og varighet). En kampanje spiller av fasene og
alarmene sine, en spektrumkjøring fossefallet sitt; temaet følger `prefers-color-scheme`, og
`prefers-reduced-motion` viser det ferdige bildet. Den gjengir kjøringens egne sampler,
byte-identisk ved en ny kjøring, og legger ikke til noen evidens. Se [docs/ANIMATION.md](docs/ANIMATION.md).

Et **suite**-manifest er en liten TOML-fil (Tom's Obvious, Minimal Language) — en `title` og en `scenarios = [ … ]`-liste med
scenariostier — som motoren kjører etter tur, og bretter hvert resultat (med sine
MODELLED / VALIDATED-merkelapper) inn i ett selvbeskrivende studieartefakt. Se
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Rolle i interoperabilitet.** Kshana er *ytelsessimulerings*laget som står
ved siden av verktøykjeden for etterbehandling, ikke en erstatning for den: mat **RINEX**-
utdataene inn i RTKLIB eller gLAB for en posisjonsløsning, og bruk **SP3**-utdataene som et
produkt for presise baner for verktøy som Ginan — Kshana besvarer *hvilken robusthet en gitt
PNT-arkitektur gir* før du har ekte signaler, i formater disse verktøyene allerede
leser (`--export-sp3`, eller `export_sp3 = true` i et `orbit`-scenario, skriver
`<scenario>.sp3`). Den samme banen kan publiseres som standardsporede **CCSDS OMM**-
middelelementer (`--export-omm`, eller `export_omm = true`, skriver `<scenario>.omm`) —
én OMM 502.0 KVN-melding (nøkkelord = verdi-notasjon) per TLE-definert satellitt, med hvert objekts ekte
katalognummer fra NORAD (North American Aerospace Defense Command), internasjonale betegnelse fra COSPAR (Committee
on Space Research) og epoke, for enhver
OMM-kompatibel mottaker i stedet for et spesiallaget tolinjeelementsett.

Eksempel på utdata (klokke-holdover — merk hvordan ytelsestallene for Integrity og Security rapporteres):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

Den optiske klokkens tidsfeil ved 95. persentil (p95) er 1.20e-4 ns: sammendraget
skriver ut små verdier med signifikante sifre i stedet for å runde dem av til `0.0`.
`security` viser `n/a (no attack)` fordi dette scenarioet ikke konfigurerer noe angrep, så det
er ingenting å detektere. JSON-resultatet har fortsatt hver klokkes analytiske
grense for spoofdetekterbarhet i `fom.security` (0.997 for den optiske klokken, 0.000 for
atomklokken i brikkeskala, der egen støy over overvåkingsvinduet overskrider spesifikasjonen
på 20 ns), og `figure_tiers`-blokken merker det tallet `applicable: false`. Scenariotypen `spoof`
scorer deteksjon mot et injisert angrep. `figure_tiers` gir også
hvert rapportert tall sitt verifikasjonsnivå — VALIDATED (kontrollert mot en ekstern
referanse) eller MODELLED — og raden i verifikasjonsmatrisen som nivået leses fra. Bane-
scenarioet rapporterer i tillegg en geometriblokk — andelen sampler med posisjonsbestemmelse, og
beste/median presisjonsutvanning for posisjon (PDOP) og posisjonsnøyaktighet — ved siden av
klokkeresultatet.

> **Les disse to tallene nøye.** `security` er en *analytisk grense for spoofdetekterbarhet*
> utledet fra hver klokkes stabilitet — den er meningsfull bare mot et
> konfigurert spoofingscenario og er **ikke** en RAIM-detektor for flere satellitter. `integrity`
> her er filterets *selvkonsistens* (andelen avbruddssampler innenfor sin egen k-sigma-
> grense), **ikke** et integritetstall for HPL/VPL i luftfart. Se
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> For ekte mottakerautonom integritet kjører **scenariotypen `integrity`**
> (`scenarios/integrity-raim.toml`) ekte øyeblikksbilde- og løsningsseparasjons-RAIM
> (ARAIM-stil) over den propagerte konstellasjonsgeometrien: den beregner
> horisontale/vertikale **beskyttelsesnivåer (HPL/VPL)** per epoke og rapporterer
> andelen epoker som oppfyller de konfigurerte alarmgrensene, med et Stanford-
> integritetsdiagram for klassifisering av feil mot PL (beskyttelsesnivå).

<a id="reproducible-study-artifacts"></a>
#### Reproduserbare studieartefakter

Fire åpne studier regenererer hver et byte-deterministisk artefakt (fast seed) fra én
kommando — tallene bak studiene av krysningen kvante mot klassisk, optimismegapet for RF-svekkelser,
scoring av PNT-robusthet og timing protection level:

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

Hvert artefakt registrerer motorversjonen, seedene og en konfigurasjonshash og bærer en ærlig
MODELLED/VALIDATED-merkelapp. Sondene for ekte data (`*_probe`) kjører den samme pipelinen over
opptak du leverer lokalt; ingen datasett leveres i repositoriet. Studien av optimismegapet for
RF-svekkelser er beskrevet i forhåndstrykket
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), og det betingede timing
protection level (`tpl_jammertest` ovenfor) i forhåndstrykket
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (se [Siter](#cite)).

De publiserte studiene av PNT ved Månen ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP med overflatefyr, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) VLBI-
observerbarhet og [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) cislunar observerbarhet
etter buelengde) har påstandene sine om geometri, presisjonsutvanning, prediksjon av referansesystem /
jordorienteringsparametere (EOP) i sanntid, fjerne retrograde baner og RF-avstandsmåling
uavhengig kryssjekket i
`tests/validate_p*.rs` mot separate referanser (`scipy.special.j1`, en uavhengig NumPy-
DOP-løsning med `(HᵀH)⁻¹`, en NumPy-tolkning på nytt av de samme IERS `finals2000A`-radene, og
NASA/JPL Three-Body Periodic Orbit Database). Dette er ytterligere regresjonskontroller over
den **modellerte** månepakken; de endrer ikke antallet i den maskinkontrollerte matrisen.

</details>

<details>
<summary>Scenarioformat</summary>

<a id="scenario-format"></a>
### Scenarioformat

Scenarioer er deklarativ TOML. En `kind` på toppnivå velger pakken — **femti** i
alt (`clock` er standard hvis den utelates): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (testbenk for evaluering av AI/ML-deteksjon av
RF-svekkelser — merket syntetisk korpus + detektoruavhengig ROC/AUC-rammeverk +
optimismegap innenfor/utenfor fordelingen), `quantum-trade` (avveining av kvante- mot klassisk PNT
med innlesing av målt ADEV + omslutning for robusthet uten GNSS; MODELLED),
`space-weather` (sol-/geomagnetiske indekser + eksosfærisk temperatur etter Jacchia-71 +
aktivitetsdrevet termosfærisk tetthet over den statiske atmosfæren; MODELLED),
`oem-interop` (bro for import/tur-retur av CCSDS OEM for efemerider fra GMAT/Orekit/STK;
MODELLED), oppdragsanalysetrioen `launch-window` (oppskytingsasimut med tolegeme /
planendring / muligheter), `reentry` (ballistisk gjeninntredenskorridor etter Allen-Eggers),
`eo-coverage` (geometri for EO-sveipebredde / GSD / tilgang / gjenbesøk), `space-packet` (rammeverk for Space Packet i CCSDS
133.0 TM/TC — telemetri/telekommando — eksakt bitoppsett, verifisert tur-retur), og
`attitude-budget` (3-DOF gravitasjonsgradientmoment + RSS-feilbudsjett for peking),
`passes` (prediksjon av opp-/nedgang for passeringer over bakkestasjoner — AOS/TCA/LOS, maks elevasjon,
tilgang), og `link-budget` (enveis linkligning for CCSDS/DSN — FSPL / Eb·N₀ /
margin / lukking); `telecom-timing` (holdover-tidsfeil, MTIE og TDEV kontrollert
mot ITU-T-masker); `spectrum` (hele GNSS-L-båndet som én spektral effekttetthet:
et fossefall av frekvens mot tid under en skriptet tidslinje av jammere med kontinuerlig bølge, smalbånd, chirp eller
tilpasset støy, jammer-til-signal-forhold per bånd og effektiv
bærebølge-til-støy-tetthet fra den spektrale separasjonskoeffisienten, og inndata og utdata for opptak i Signal Metadata
Format (SigMF) med Welch-spektralestimater; signal-
spektrene VALIDATED mot lærebokverdier, jammerscenarioet MODELLED; se
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); den samme typen tegner paneler for UHF-, S- og C-bånd med
designede signaler i lav jordbane); `leo-signal` (signaldesign for posisjonering, navigasjon og
tidssynkronisering i lav jordbane for ethvert system: båndbegrensede spektre, kodesporingsjitter og avstands-
nøyaktighet, innhentingssøk og -tid, spektral separasjon mot GPS og Galileo, jammer-
toleranse og en avveining fra UHF- til C-bånd, fra offentlige forhåndsinnstillinger som Xona Pulsar, Iridium,
Starlink og CentiSpace eller inline-design; de lukkede formene og LEO-Doppler VALIDATED,
designene MODELLED; se [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (Sola, planetene, Pluto, Månen og sju store
måner ved én epoke — posisjoner, konstanter, lystider og banespor; planetposisjoner
VALIDATED mot JPL Horizons) og `body-pnt` (posisjonering rundt hvilket som helst av disse legemene med en
lokal navigasjonskonstellasjon og en dyprom-link fra Jorden; MODELLED); `campaign` (eksisterende typer satt sammen til en kjedet oppdragstidslinje
med tilstand overlevert mellom faser, et parametersveip, et seedet Monte Carlo-ensemble, eller
flere scenarioer under én felles betingelse; MODELLED, se
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (Walker delta- og stjerne-
mønstre, elementlister og design med flere skall med forhåndsinnstillinger for GPS, Galileo, BeiDou og GLONASS,
og dekning og presisjonsutvanning over et rutenett av bredde/lengde; generatoren
og global GPS-DOP VALIDATED mot de publiserte tjenestedokumentene, se
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (en passering av en satellitt for
posisjonering, navigasjon og tidssynkronisering (PNT) i lav jordbane (LEO) og linkbudsjettet bånd for
bånd, fra enhver konstellasjon og ethvert signaldesign: siktevinkler, Doppler og Doppler-rate,
ITU-R-tap fra regn, gass, scintillasjon og inntrenging i bygninger, bærebølge-til-støy-tetthet mot
MEO-GNSS-satellittene i sikte, førsteordens ionosfære og ionosfærefrie par, og et
budsjett for lavenergi-posisjonsbestemmelse, ionosfæresondering fra hvert båndpar, og spoofingovervåkere etter
konsistens i Doppler og passeringsgeometri og etter konsistens på tvers av bånd; ITU-R-leddene og
Doppler-omslutningen for statisk bruker VALIDATED, passeringen MODELLED, se
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (den kringkastede
efemeride- og klokkemeldingen til en PNT-satellitt i lav jordbane (LEO), for enhver bane og
bærebølge: en tilpasser fra en integrert fasitbane til det Keplerske Galileo-settet, det settet
med korreksjonspolynomer langs sporet, på tvers av sporet og radialt, 22-parametermodellen fra Liu et al. 2025
eller ATOMIC ECEF-polynomet med null klokke; avstandsfeil for signalet i rommet
(SISRE) mot tilpasningsintervall og oppdateringsperiode, en kontroll av kontinuitet ved oppdatering midt i passeringen,
Kshanas egen dokumenterte binærramme med en CRC-24Q syklisk redundanskontroll og et kvantiseringsbudsjett, og en
blokk i RINEX-4-stil merket som en Kshana-utvidelse; SISRE-vektene, Galileo-bruker-
algoritmen og CRC-24Q VALIDATED, tilpasningene MODELLED; valgfrie forhåndsinnstillinger for Xona Pulsar,
Iridium, Starlink, CentiSpace, et representativt C-båndsystem, ATOMIC og Celeste IOD; se
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); trioen for **fusjonert MEO + LEO
PNT** `leo-pvt` (Doppler-posisjonering fra avstandsrate i lav jordbane (LEO), felles
GNSS + LEO-posisjonsbestemmelser med pseudoavstand med intersystembias og DOP mot antall LEO-
satellitter, dekning i polar- og arktiske områder, og tidsoverføring fra LEO til UTC — over enhver konstellasjon,
med valgfrie forhåndsinnstillinger som Xona Pulsar, Iridium og Starlink-signaler of opportunity;
Doppler-omslutningen for LEO VALIDATED mot publiserte tall for Iridium og Xona), `leo-ppp`
(konvergens for presis punktposisjonering med bare GNSS og med LEO-forsterkning, sammenlignet
med Li et al. 2019) og `ntn-positioning` (posisjonering i 5G ikke-terrestrisk nettverk fra
Cramér-Rao-grensen for signalbåndbredden), MODELLED bortsett fra den omslutningen, se
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (ett LEO-PNT-system fra ende
til ende: et `leo-signal`-design båret av et `leo-pass`-bånd, passeringens C/N0 og navigasjons-
meldingens avstandsfeil for signalet i rommet overlevert til en fusjonert `leo-pvt`-posisjonsbestemmelse og `leo-ppp`-
konvergens, hver overlevering oppført; MODELLED, se
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), som også er oversikten over
hver LEO-PNT-type og hvert scenario, inkludert robusthetskampanjene, ett scenario per
fokusområde for eksperimenter og ett per sluttbrukervertikal); **PNT-pakken for Månen** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; **demonstratoren for kvanteaktivert PNT**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; og
forskningstypene for **signalsikkerhet, cislunart rom og lagdelt robusthet** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — oppdragsanalysetrioen og disse senere typene er alle MODELLED
(hver med en validert kjerne på lukket form; se matrisen).
Felles felter: `seed`, et `[time]`-rutenett, en `[gnss]`-tidslinje for tilgjengelighet (driveren
for avbruddet), og blokker per sensor med `provenance`-strenger som siterer kilden til hvert
tall. Eksempel (klokke):

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

Valgfrie felter (av når de mangler): en klokke kan legge til `flicker_floor` (1/f FM — frekvens-
modulasjon — Allan-gulv); en treghetssensor kan legge til `gyro_bias` og `q_arw` (gyrobias og vinkel-
random-walk), og `bias_instability` og `q_aa` (Allan-gulvet for biasinstabilitet og
akselerasjons-random-walk) — sammen et **feilbudsjett for akselerometer med én akse (1-DOF)**
(VRW/ARW — hastighets-/vinkel-random-walk — og biasinstabilitet). Dette er feilbudsjettet som den leverte
`inertial`-scenario*pakken* kjører. Separat har biblioteket nå en verifisert
**treakset strapdown-navigator** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
kvaternionattitude med kompensasjon for coning/sculling, en full NED-mekanisering
(ledd for jordrate og transportrate, WGS-84 Somigliana-gravitasjon), og en
deterministisk IMU-feilmodell der **skalafaktor, feiljustering,
g-følsomhet, kvantisering og rate-rampe er modellert** (IEEE Std 952-1997, IEEE-
standarden for gyrospesifikasjon og testprosedyre, §A.2; Groves 2013 §4.3). Den treaksede veien er nå **koblet inn i en kjørbar
løst koblet GNSS/INS-pakke** (`kind = "gnss-ins"`): en feiltilstands-EKF med 15 tilstander
disiplinerer strapdown-løsningen mot støyende posisjonsbestemmelser mens GNSS er oppe, og
kyster deretter gjennom avbruddet og rapporterer den fusjonerte horisontale feilen mot
den åpne sløyfens frie INS-kysting. En **tett koblet pseudoavstands**oppdatering er også
tilgjengelig (den danner innovasjonen i avstandsdomenet, så den fortsetter å korrigere
med færre enn fire satellitter). Et
klokke-holdover-scenario kan legge til `runs` (> 1) for å kjøre et **Monte Carlo-ensemble** — hvert
ytelsestall rapporteres da som et gjennomsnitt med en spredning fra 5. til 95. persentil, og
diagrammet skraverer konfidensbåndet for feilen (se `scenarios/clock-ensemble.toml`).

Et `fusion`-scenario (samme blokker som `hybrid`) kjører **to uavhengige Kalman-estimatorer**
— én for klokketilstanden, én for posisjonstilstanden — disiplinert av GNSS og støttet av
optisk tidsoverføring, og rapporterer et kombinert holdover-FoM. De to blokkene deler ingen
krysskovarians: dette er et stablet par feilbudsjetter, **ikke** et ekte koblet
felles filter for klokke+posisjon (krysskovarians mellom blokker står på veikartet). Se
`scenarios/fusion-pnt.toml`.

Et `spoof`-scenario injiserer en tidsspoof — én av fire `[attack.shape]`-typer
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; en ren `rate_ns_per_s` godtas fortsatt
som en lineær rampe) — og kjører hver klokkes spoofdetektor. Detektoren er en
tosidig **χ²₁-energitest / Neyman–Pearson-test** på den klokkestøttede overvåkerstatistikken:
terskelen settes ut fra et mål-budsjett for falske alarmer `target_pfa`, og
**sannsynligheten for tapt deteksjon `P_md`** rapporteres både på lukket form og ved
Monte Carlo (`mc_runs` forsøk per hypotese — de to stemmer overens til noen få ×1/√N).
**Sikkerhets-ytelsestallet er `1 − P_md`** ved den operativt skadelige størrelsen (spesifikasjonen),
så en stille klokke som fanger en spoof av spesifikasjonsstørrelse, scorer ≈ 1, og en støyende
klokke som ofte bommer på den, scorer lavere (se `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Et `gnss-sim`-scenario er en simulering i **måledomenet**: for hver synlig
satellitt syntetiserer det pseudoavstanden `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` og L1-Doppler, med **Klobuchar**-ionosfæren for én frekvens
(`[iono]`, IS-GPS-200 §20.3.3.5.2.5) og **Saastamoinen**-senittroposfæren
projisert med avbildningsfunksjonen fra **Niell (1996)** (`[tropo]`).
Residualene mater **øyeblikksbilde-RAIM** for HPL/VPL per epoke, og hver satellitts
pseudoavstand, Doppler, C/N₀ og iono-/troposfærekorreksjoner leveres i JSON-
listen `gnss_measurements`. Det er en forlengs simulator (den genererer målinger fra
en kjent fasit), ikke en mottaker/løser — en kjøring uten støy reproduserer geometrien pluss
korreksjonene til under en millimeter (se `scenarios/gnss-sim-raim.toml`).

Et `jamming`-scenario modellerer RF-interferens som et **linkbudsjett**: en `[jammer]`
(ECEF-posisjon, sendeeffekt `power_dbw`, type) øker jammer-til-signal-forholdet ved en
`[receiver]` som observerer en Walker-`[constellation]`. Fra geometrien (frirom-
baneutbredelsestap og mottaksantennens forsterkning per retning) beregner det hver satellitts
`J/S`, den **effektive C/N₀** via den standard anti-jamming-ligningen (prosesseringsforsterkning fra
avspredning × den spektrale separasjonsfaktoren `Q`; Kaplan & Hegarty §9.4), og
flagger tap av låsing under en konfigurerbar sporingsterskel — og rapporterer et
ytelsestall `availability_under_jamming`. En bredbåndsjammer på 10 W ved 1 km
nekter mottakeren fullstendig (J/S ≈ 72 dB); den samme jammeren ved 100 km
degraderer bare linkene (se `scenarios/jamming-demo.toml`).

Et `sweep`-scenario kjører en **avveiningsstudie**: det varierer én `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` eller `classical_q_wf`) fra `start` til `stop` over `steps`
punkter på en `lin`- eller `log`-`scale`, registrerer en `metric` (f.eks. `holdover_s`) for begge
klokkene, og tegner de to kurvene. Grunnscenarioet legges under `[base]` (se
`scenarios/sweep-clock-stability.toml`).

Et `sweep-nd`-scenario generaliserer dette til **enhver pakke og ethvert antall akser**: det
varierer punktnotasjonsnøkler i TOML for et `[base]`-scenario (av enhver `kind`) over det kartesiske
produktet av `[[axes]]`, kjører hver rutenettnode på nytt, og registrerer `metrics` oppgitt som
JSON-stier med punktnotasjon inn i resultatet (f.eks. `classical.fom.holdover_s`). Det fungerer for
hver pakke fordi det opererer ved grensen mellom TOML og resultat; native kjøringer evaluerer
rutenettet parallelt (ingen ekstra avhengighet, wasm faller tilbake til sekvensielt), og
utdataene er deterministiske og radvise (se `scenarios/sweep-nd-inertial.toml`).

Et `orbit`-scenario utleder `[gnss]`-tidslinjen fra geometri i stedet for å skrive
den for hånd — oppgi en `[user]`-bane, en `[constellation]`, en elevasjons-`mask_deg`, og de to
klokkeblokkene. Det rapporterer også posisjonsnøyaktighet fra satellittgeometrien; den
valgfrie `sigma_uere_m` (1-sigma brukerekvivalent avstandsfeil, standard 1 m) skalerer
presisjonsutvanningen for posisjon til en posisjonssigma. Brukerbanen kan gjøres
**eksentrisk** med `eccentricity` og `argp_deg`, og `j2 = true` legger til sekulær drift fra
jordens avflatning (se `scenarios/orbit-molniya.toml`). Konstellasjonen kan i stedet være en
**ekte**: gi `[constellation]` en `tle`-blokk med tolinjeelementsett, så tolkes
satellittene fra den (se `scenarios/orbit-real-tle.toml`). Legg til én eller flere
`[[constellations]]`-blokker for **flere GNSS** (f.eks. GPS + Galileo; se
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

Typene for **alt-PNT uten GPS** navigerer helt uten GNSS, ved å matche en målt felt-
sekvens mot et kart gjennom et partikkelfilter. Et `gravity-map`-scenario flyr et spor
gjennom et sfærisk-harmonisk felt for gravitasjonsanomalier og gjenvinner det fra avlesningen til et
kaldatomgravimeter (`scenarios/gps-denied-gravity-nav.toml`); et `terrain-nav`-scenario
gjør det samme mot en SRTM-høyde-DEM (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
og et `combined-altpnt`-scenario fusjonerer **gravitasjon + IGRF-magnetisme + terreng** i ett filter
(`scenarios/combined-altpnt.toml`).

Et `lunar-integrity`-scenario evaluerer **cislunar** PNT: det kjører en ARAIM-passering for
beskyttelsesnivå over månens sørpol mot et LunaNet/LNIS-relésett og rapporterer ærlig
integritetsgapet — en σ_URE på ~30 m ved Månen driver beskyttelsesnivået godt over en alarmgrense
på 50 m, så tjenesten er *utilgjengelig* under integritetsregler i luftfartsstil
(`scenarios/lunanet-araim.toml`).

Et `lunar-time-offset`-scenario rapporterer den **relativistiske klokkeraten Jord–Måne** —
grunnlaget for en tidsskala for Lunar Coordinate Time (LTC/TCL). En post-newtonsk identitet fra
grunnprinsipper summerer forskjellen i egenpotensial (IAU `L_G`-geoidepotensialet minus Månens
egenpotensial på overflaten) og Månens kinetiske ledd (andreordens Doppler) til en sekulær
rate på ≈ 57 µs/døgn, rapportert sammen med det publiserte båndet på 56–59 µs/døgn; det gir også
den akkumulerte LTC−TT-forskyvningen over en horisont og et ensemble med invers varians (en
papirklokke for Månen). **MODELLED** — hovedtallet er *referanseavhengig* (jordens geoide
mot Månens selenoide, midlingsvindu), og det er derfor et bånd, ikke ett enkelt sertifisert
tall, som rapporteres (`scenarios/lunar-time-offset.toml`).

Se `scenarios/` for minst ett utarbeidet eksempel på hver type (92 typer, 193 scenario-
`.toml`-filer + 1 suite-manifest — flere typer leveres med mer enn ett eksempel). Ikke hver
type har en fil oppkalt etter seg: `lunar-integrity` → `scenarios/lunanet-araim.toml` og
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` er to av flere slike.
List de fordelbare typene når som helst med feilmeldingene fra `cargo run -- --validate <file>`,
Python-funksjonen `list_kinds()` eller MCP-verktøyet `list_scenario_kinds`.

</details>

<details>
<summary>Utdata</summary>

### Utdata

Resultatartefaktet er versjonert, selvbeskrivende JSON: tidsserier per steg, de
scorede ytelsestallene, de aktive modellspesifikasjonene (med proveniens), seeden, en
**scenariohash** — slik at ethvert diagram kan reproduseres fra filen — og, for hver klokke,
en `adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): det overlappende
Allan-avviket over midlingstider med oktavavstand — standardmåten å lese en klokkes
stabilitet på — nå med et **95% konfidensbånd spesifikt for støytype** per punkt (registreringens
potenslovtype identifiseres fra helningen i modifisert Allan, og χ²-intervallet bruker de
tilsvarende effektive frihetsgradene fra NIST SP 1065). Lekeplassen i nettleseren gjengir det som et
log-log-diagram «Clock stability (ADEV)». (MDEV, TDEV og HDEV er tilgjengelige som bibliotek-
estimatorer; den eksporterte resultatkurven er overlappende ADEV.) Hvert felt, med enheter og en
kildepeker, er dokumentert i [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Hvert diagram er selvbeskrivende.** Lekeplassen i nettleseren, CLI-ens `*.chart.svg`-
eksport og resultatkortet i HTML (HyperText Markup Language) stempler alle hvert diagrambilde med en bunntekst som lyder
`Kshana v<version> · scenario <hash> · kshana.dev`. `scenario <hash>` er de første
12 heksadesimale tegnene i kjøringens **scenariohash** — et SHA-256-sammendrag (256-bit Secure Hash Algorithm) over den kanoniske scenario-
definisjonen (seed, terskler, modellparametere, GNSS-vinduer, …); integritets- og måne-
rapportene, som ikke har noen egen hash, faller tilbake til en SHA-256 av scenariokilden.
Det er det **samme fingeravtrykket** som vises i enlinjesammendraget og resultat-JSON-en, så et
lagret eller innlimt diagram alltid bærer versjonen sin, det nøyaktige scenarioet som produserte det (for
reproduksjon bit for bit), og kilden — endre en hvilken som helst inndata, så endres hashen.

Ytelsestallene følger de standard operative ytelsestallene for PNT:

| Ytelsestall | Hvordan Kshana beregner det |
|-----------------|------------------------|
| Tidsytelse (klokke-/banepakker) | RMS for klokkefasefeil + 95. persentil over avbruddet, i **nanosekunder** (`timing_rms_ns`) — en tidsmetrikk, ikke posisjon |
| Posisjoneringsytelse (treghets-/hybridpakker) | 1-DOF RMS for posisjonsfeil + 95. persentil over avbruddet, i **meter** (`pos_rms_m`); én akse. En enkelt kjøring flagges `monte_carlo: false`; sett `runs = N` for et Monte Carlo-ensemble som rapporterer hver metrikks gjennomsnitt, spredning og bootstrap-95% CI (konfidensintervall). Fortsatt **ikke** en 2-D CEP/2DRMS (sirkulær sannsynlig feil / to ganger kvadratisk middelavstand) eller DOP-vektet nøyaktighet (disse trenger den treaksede modellen — veikart) |
| Autonomi | holdover-varighet — tid innenfor spesifikasjonen etter tap av GNSS (kvantisert til rutenettet: en nedre grense) |
| Robusthet | helningen på feilveksten under avbruddet |
| Tilgjengelighet | andelen av kjøringen med en løsning innenfor spesifikasjonen |
| Integritet | filterets **selvkonsistens** — andelen avbruddssampler der feilen holder seg innenfor Kalman-filterets egen k-sigma-grense. **Ikke** et integritetstall for HPL/VPL/RAIM i luftfart (se [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Sikkerhet | **analytisk grense for spoof-*detekterbarhet*** ut fra klokkestabilitet — hvor liten/langsom en tidsspoof en konsistensovervåker med én klokke kunne flagge. Meningsfull bare med et konfigurert angrep; **ikke** en RAIM-detektor for flere satellitter |

Ny med disse begrepene? Hvert er definert på klart språk i [ordlisten](docs/GLOSSARY.md).

</details>

<details>
<summary>Repositoriets oppbygning</summary>

### Repositoriets oppbygning

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
<summary>FAQ (ofte stilte spørsmål)</summary>

### FAQ

**Må jeg forstå kvantefysikk for å bruke dette?**
Nei. Hvis du kan kjøre en kommandolinje, kan du kjøre Kshana. Start med
[innføringen på klart språk](docs/CONCEPTS.md); slå opp begreper i [ordlisten](docs/GLOSSARY.md).

**Er dette et design for kvantemaskinvare eller flyprogramvare?**
Nei. Det er en ytelses*simulator*. Troverdigheten for kvantemaskinvare kommer fra publiserte
feilmodeller, ikke fra dette verktøyet. Se [Hva det er / ikke er](#what-it-is--is-not).

**Er kvanteresultatene realistiske, eller markedsføring?**
Hver parameter er sitert fra et datablad eller en artikkel, hver modell er validert mot en
lærebokrelasjon, og modenheten er ærlig merket i
[VALIDATION.md](docs/VALIDATION.md) — inkludert at ingen optisk strontiumklokke har
fløyet. Motoren er nøytral: kvante og klassisk er den samme koden med forskjellige
publiserte tall.

**Kan jeg stole på at to kjøringer stemmer overens?**
Ja — kjøringer er deterministiske: `scenario + seed + engine version → bit-identical output`,
håndhevet av `scripts/check-reproducible.sh`.

**Kan jeg bruke det fra Python eller i en nettleser?**
Ja — se [Installasjon](#install): Python- og WebAssembly-eksemplene står under den. Begge kaller den samme motoren.

**Hvordan modellerer jeg min egen sensor?**
Skriv et scenario-`.toml` med sensorens publiserte tall i `provenance`-
feltene. Se [Scenarioformat](#scenario-format) og eksemplene i `scenarios/`.

**Er det gratis til kommersiell bruk?**
Ja — under AGPL-3.0, også i kommersielle sammenhenger, så lenge du respekterer
AGPLs copyleft (særlig: hvis du endrer Kshana og tilbyr det over et nettverk, må du
tilby disse brukerne den endrede kildekoden din). Hvis det ikke passer deg — f.eks. hvis du må
bygge Kshana inn i et proprietært produkt eller drive en lukket nettverkstjeneste — er en kommersiell
lisens tilgjengelig fra Ashforde® OÜ; se [`LICENSING.md`](LICENSING.md) og
[Støtte](#support--professional-services).

</details>

<details>
<summary>Feilsøking</summary>

### Feilsøking

**`cargo build` feiler på en gammel verktøykjede.** Kshana trenger Rust ≥ 1.88. Oppdater med
`rustup update`.

**Bygging av Python-utvidelsen feiler ved lenking på macOS** (`Undefined symbols … _Py…`).
En Python-utvidelse løser opp symbolene sine ved lasting. `maturin` setter riktig lenker-
flagg automatisk — bruk `maturin develop --features python` i stedet for en ren
`cargo build`.

**Python-bygget klager over at tolken er nyere enn PyO3 kjenner til.** Sett
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (abi3-wheels er foroverkompatible på tvers av
CPython-versjoner).

**WebAssembly-bygget finner ikke målet.** Installer det én gang med
`rustup target add wasm32-unknown-unknown`, deretter `wasm-pack build --target web -- --features wasm`.

**Hvor ble utdataene mine av?** Hver kjøring skriver `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` og `<scenario>.report.json` ved siden av
inndata-`.toml`-en, og
`<scenario>.table.csv` også for typene som publiserer en tabell. Alle er
ignorert av git med vilje.

</details>

<details>
<summary>Versjonering og utgivelser</summary>

### Versjonering og utgivelser

Kshana følger [Semantic Versioning](https://semver.org). Før 1.0 kan det offentlige
skjemaet for scenario/resultat fortsatt endres; inkompatible endringer fremheves eksplisitt i
[`CHANGELOG.md`](CHANGELOG.md). Hvert resultat kan reproduseres fra
`scenario + seed + engine version`.

**Hver `vX.Y.Z`-tag publiserer alle kanaler automatisk, i én rekkefølge** — hele
testsuiten kjører først på den taggede committen, ingenting publiseres før den består, og
etterpå kontrollerer pipelinen at hvert register faktisk leverer den nye versjonen
([`docs/RELEASING.md`](docs/RELEASING.md)). Kanalene:

| Kanal | Installer / hent | Innhold |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | Rust-bibliotek + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | MCP-serveren |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | abi3-wheels (Linux/macOS/Windows) + sdist (kildedistribusjon) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | WebAssembly-modul + JS-innpakning |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | OCI-image (Open Container Initiative) for flere arkitekturer — ingen verktøykjede trengs |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | starter: laster ned utgivelsens binærfil, verifiserer `SHA256SUMS`, kjører den |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | den samme starteren for Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | binærfilen `kshana-mcp`, generert fra hver utgivelses `SHA256SUMS` |
| Claude Desktop | dobbeltklikk på `kshana-mcp-<target>.mcpb` fra utgivelsen | utvidelsen, med binærfilen inni |
| offisielt MCP-register | oppdages automatisk av MCP-klienter | `io.github.ashfordeOU/kshana-mcp` (OCI-image, npm- og PyPI-pakker) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → søk etter "Kshana" | IDE-utvidelsen **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | last ned | kommandolinjebinærfilen `kshana` for Linux x86-64, macOS (Apple silicon og Intel) og Windows x86-64, binærfilen `kshana-mcp` for hvert av disse systemene og Linux Arm, en `.mcpb`-utvidelse for Claude Desktop per system, en CycloneDX-**SBOM**, **SLSA**-byggeproveniens, et HTML-sammendrag av valideringen og en kontrollsumfil `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | et siterbart arkiv over hver utgivelse |
| [kshana.dev](https://kshana.dev) | åpne i en nettleser | Kshana Studio, WebAssembly-appen i nettleseren, bygget på nytt fra hver utgivelsestag (så versjonen den viser, er versjonen den kjører) |

MCP-serverens crate-/image-/registerversjon følger motoren (den pakker med
biblioteket); JetBrains-utvidelsen versjoneres uavhengig (den kaller den installerte
`kshana`-binærfilen din).

</details>

<details>
<summary>Veikart</summary>

### Veikart

Se [`ROADMAP.md`](ROADMAP.md) for det fasedelte veikartet, [`CHANGELOG.md`](CHANGELOG.md)
for utgitt historikk, og [`docs/CAPABILITY.md`](docs/CAPABILITY.md) for
veikartet per funksjon. Prioriteringsrekkefølgen er: **evidens for tidssynkronisering og holdover for
kritisk infrastruktur først** (telekom-masker, lengre holdover med aldring og flimmer-
støy, innlesing av målte klokkedata); **den nøytrale avveiningsmetoden kvante mot klassisk
deretter** (resultater merket MODELLED til en partners målte data forfremmer dem); og
**navigasjon ved Månen / i cislunart rom og i dypt rom vedlikeholdt**, ikke utvidet som hovedsatsing. Den **ITRF-presise reduksjonen av referansesystem** er nå levert — den
fulle CIO-baserte IAU 2006/2000A GCRS↔ITRS-kjeden (polbevegelse + nutasjon under buesekundet),
validert bit for bit mot SOFA/ERFA og uavhengig kryssjekket mot ANISE
(ren Rust SPICE) til ≤ 3.6 m i GNSS-bane. Elementer på kort sikt omfatter tett koblet fusjon av bærebølgefase og å gjøre den
løst/tett koblede GNSS/INS-navigatoren tilgjengelig i flere pakker; motoren for **radiometrisk navigasjon i dypt rom / ved
Mars** kom i v0.17.0 (simuleringsvalidert).
**Kvantefysikklaget** er et **P2**-element: CAI-akselerometeret simuleres nå fra
grunnprinsipper (Mach–Zehnder-fase, projeksjonsstøy, kontrastforfall, vibrasjons-
kobling), mens klokke-/tidsoverføringssensorene fortsatt drives av publiserte
Allan-/støybudsjettkoeffisienter. GMST-basert TEME&harr;ECEF, IERS-
tidssystemene med skuddsekunder (UTC/TAI/TT/UT1), SGP4/SDP4-banepropagering (v0.7.0,
validert mot AIAA 2006-6753-vektorene), og den kjørbare `gnss-ins`-fusjons-
pakken er alle **levert**, og treghetshastigheten eksponeres nedstrøms. En aktiv
stokastisk tidsspoofdetektor (Neyman–Pearson / χ²₁-energitest med Monte Carlo-
P_fa/P_md og et sikkerhets-FoM på 1−P_md), en jammingmodell ut fra linkbudsjett (J/S → effektiv
C/N₀ → tap av låsing), tilgjengelighet for flere konstellasjoner, en enakset (1-DOF)
IMU-feilbudsjett, to uavhengige Kalman-estimatorer (klokke + posisjon) rapportert som et
kombinert FoM, ekte konstellasjonsgeometri fra TLE-er, en HTML-resultatkortrapport,
geometriutledet GNSS-tilgjengelighet
*og* presisjonsutvanning fra Keplerske baner med eksentrisitet og J2-drift,
Monte Carlo-konfidensbånd, parametersveip for avveiningsstudier, en WebAssembly-
lekeplass i nettleseren, og valgfrie Python- (PyO3) og WebAssembly-bindinger (wasm-bindgen) har
kommet inn på `main`.

</details>

<details>
<summary>Bidra</summary>

### Bidra

Se [`CONTRIBUTING.md`](CONTRIBUTING.md). Kort sagt: testene består (`cargo test`), de
to vernskriptene består, Conventional Commits, og en `CHANGELOG.md` `[Unreleased]`-
oppføring for hver endring som er synlig for brukeren. Deltakelse styres av våre
[atferdsregler](CODE_OF_CONDUCT.md). For å rapportere et sikkerhetsproblem, se
[sikkerhetspolicyen](SECURITY.md) — vennligst ikke åpne en offentlig sak for sårbarheter.

</details>

<details>
<summary>Dokumentasjon: hvert dokument, og hvem det er for</summary>

<a id="documentation"></a>
### Dokumentasjon

| Dokument | For hvem | Hva det inneholder |
|----------|----------|--------------|
| [Innføring i begreper](docs/CONCEPTS.md) | alle, start her | hva Kshana gjør og hvorfor, fra null til fysikken |
| [Kshana Studio](web/README.md) | alle | kjør motoren i nettleseren din (WebAssembly); notater om bygging og utrulling |
| [Ordliste](docs/GLOSSARY.md) | alle | definisjoner på klart språk av hvert begrep |
| [Scenariotyper](docs/KINDS.md) | alle | hver type motoren fordeler: hva den gjør, feltene, en eksempelkommando, registerradene og diagrammet motoren skriver for den |
| [Partnerdata](docs/PARTNER-DATA.md) | laboratorier og produsenter med målte data | hvilke MODELLED-rader en målt klokke- eller IMU-registrering kan forfremme, formatene, hvordan en innsending kontrolleres (`kshana partner check`), scores og krediteres |
| [Arkitektur](docs/ARCHITECTURE.md) | utviklere / gjennomlesere | modulkart, motorpipeline, fordeling og diagrammer |
| [Valideringsstatus](docs/VALIDATION.md) | gjennomlesere / siterende | hva som er `validated` mot `not modeled`, med evidens |
| [Verifikasjonsmatrise](docs/VERIFICATION-MATRIX.md) | gjennomlesere / siterende | det maskinkontrollerte evidensregisteret — hver funksjonsrad med status, modul, test og ekstern referanse, generert fra `src/verification.rs` |
| [Begrunnelse for Modelled](docs/MODELLED-RATIONALE.md) | gjennomlesere | hvorfor hver **Modelled**-rad ikke har noen ekstern referanse, oppgitt rad for rad |
| [Proveniens](docs/PROVENANCE.md) | gjennomlesere / siterende | hver sensorparameter, modell og hvert datasett sporet til den publiserte kilden, i én siterbar tabell |
| [Reproduserbarhet og proveniens](docs/REPRODUCIBILITY.md) | gjennomlesere / pakkere | garantier for determinisme, festing til gylne filer, SBOM (programvarestykkliste), byggeproveniens |
| [Plattformtagger for wheels](docs/WHEEL_TAGS.md) | pakkere | abi3-matrisen for Python-wheels — hvilken plattformtag `pip install kshana` løser opp |
| [Posisjonering](docs/POSITIONING.md) | evaluerere | hvor Kshana står mot RTKLIB/gLAB (komplementært), og nettlesernivået uten installasjon |
| [Kshana Pro](docs/PRO.md) | evaluerere / programledere | hva det proprietære Pro-overlaget legger til over den samme motoren: designoptimerer, usikkerhet og sensitivitet, oppdragsmappe, kampanjeovervåking, spektral sameksistens, lokal jobbtjeneste, sporbarhet av krav; hva hver produserer og hva den ikke gjør |
| [Teknisk rapport](paper/kshana-technical-report.md) · [JOSS-artikkel](paper/paper.md) | gjennomlesere / siterende / evaluerere | den fulle utvidede forskningsartikkelen — arkitektur, modeller per domene, validering, casestudier og begrensninger — pluss den konsise innsendingen til JOSS (Journal of Open Source Software) |
| [SGP4-validering](docs/SGP4-VALIDATION.md) | gjennomlesere / siterende | samsvar med referansen AIAA 2006-6753 (666 tilstander, ~4 mm) **og** en direkte sammenligning mot den uavhengige `sgp4`-craten (enige til under en mikrometer / 4.12 mm) |
| [Validering av kraftmodell](docs/AGENCY-ORBIT-VALIDATION.md) | gjennomlesere / siterende | motoren med fulle krefter (`src/precise_od.rs`) tilpasset byråenes efemerider — metodikk og validerte residualer |
| [Veiledning for ekte TLE-er](docs/REAL_TLE_GUIDE.md) | brukere | å drive scenarioer fra ekte konstellasjons-TLE-er fra Celestrak / Space-Track (mot det medfølgende syntetiske Walker-settet) |
| [Integritets-FoM](docs/INTEGRITY.md) | evaluerere | hva `integrity`- / `security`-tallene betyr — og hva de **ikke** er sammenlignet med HPL/VPL i luftfart |
| [ARAIM-referanse](docs/ARAIM_REFERENCE.md) | gjennomlesere / integratorer | den åpne implementeringen av beskyttelsesnivå for MHSS ARAIM — projeksjonen av nominell bias `b_k`, σ_URA mot σ_URE, og a priori-sannsynlighetene for feilmodus |
| [Kvantemodeller](docs/QUANTUM.md) · [detaljer](docs/QUANTUM-MODELS.md) | gjennomlesere | fysikklaget for kaldatominterferometeret, og hvor koeffisienter fortsatt slås opp |
| [Compliance](docs/COMPLIANCE.md) | evaluerere | algoritmeomfang for DO-229E / DO-316, og hva som **ikke** er en samsvarspåstand |
| [Maritim tillit](docs/MARITIME-TRUST.md) | sjøfolk / integratorer | GNSS-tillitsscoren fra 0 til 100 for et fartøys NMEA, overvåkerne og grensene (veiledende, ikke typegodkjent navigasjonsutstyr) |
| [NMEA-treningsstrømmer](docs/NMEA-TRAINING.md) | maritime instruktører | syntetisk NMEA for broen med skriptet jamming og spoofing og en instruktørlogg; bare tekst, aldri for aktiv navigasjon |
| [Interferenskart](docs/INTERFERENCE-MAP.md) | analytikere / sjøfolk | hvor fly og skip rapporterte degraderte navigasjonsdata, og hvor mye av en rute det berører |
| [Bevispakker](docs/EVIDENCE-PACKS.md) | operatører / forsikringsselskaper | signerte tekniske dokumenter over en tillitshendelse og hvordan en verifiseres |
| [Tillitstelemetri](docs/TRUST-TELEMETRY.md) | drifts- / sikkerhetsteam | tillitsstrømmen som Prometheus-metrikker, SIEM-hendelser og OpenTelemetry, med et Grafana-dashbord |
| [Maritime integrasjoner](docs/MARINE-INTEGRATIONS.md) | båteiere / integratorer | Signal K-utvidelsen, portmodus i OpenCPN og referansebygget |
| [Testbenk](docs/TEST-BENCH.md) | mottakerprodusenter | avspilling av et eksportert scenario gjennom en laboratoriesimulator og scoring av mottakerens logg |
| [Kartlegging mot compliance](docs/compliance/README.md) | evaluerere | offentlige rammeverk for robusthet kartlagt mot Kshanas utdata, med kilder og gap; `kshana compliance-report` |
| [Notatbøker](notebooks/README.md) | brukere | kjørbare veiledninger med den gjengitte teksten |
| [Standarder og interoperabilitet](docs/STANDARDS.md) | integratorer | utvekslingsformatene for GNSS / flydynamikk / byråer som Kshana leser og skriver (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [LEO-PNT-fusjon](docs/LEO-PNT-FUSION.md) | brukere / evaluerere | fusjonert posisjonering, navigasjon og tidssynkronisering med MEO + LEO: Doppler, felles pseudoavstand, PPP-konvergens, 5G NTN, polar dekning og tidsoverføring fra LEO over enhver konstellasjon; de valgfrie forhåndsinnstillingene og deres offentlige kilder |
| [Kampanjer](docs/CAMPAIGNS.md) | brukere / evaluerere | å sette sammen scenarioer: kjedede oppdragstidslinjer, parametersveip, Monte Carlo-ensembler og kjøringer med felles betingelse, med sammensetningsidentitetene testene låser |
| [Scenariokatalog](docs/SCENARIOS.md) | brukere / integratorer | hver fordelbar type med påkrevde og valgfrie TOML-felter — generert fra `api::list_scenario_kinds()` |
| [Resultatskjema](docs/SCHEMA.md) | integratorer | hvert felt i resultat-JSON-en, med enheter og en kildepeker |
| [Python-API](docs/PYTHON_API.md) | Python-brukere | PyO3-bindingsflaten — å kalle motoren, scenario-/resultattypene og eksempler |
| [Påstander mot virkelighet](docs/CLAIMS-VS-REALITY.md) | gjennomlesere | registeret over lukking av overdrevne påstander + CI-vernet (`tests/no_overclaims.rs`) som holder det løst |
| [Veikart](ROADMAP.md) | alle | det fasedelte veikartet — hva som er levert og hva som kommer |
| [MCP-server](mcp/kshana-mcp/README.md) · [JetBrains-utvidelse](ide/jetbrains/README.md) | agenter / IDE-brukere | kjør Kshana fra en AI-assistent eller et JetBrains-IDE |
| [Agentveiledning](docs/AGENTS.md) · [Grensesnitt](docs/SURFACES.md) | agenter / integratorer | hvilket verktøy som besvarer hvilket spørsmål, hva som skal følge med hvert svar; hvor hver funksjon kan nås (CLI, Rust, Python, WASM, MCP, utvidelse, JetBrains, notatbøker) og hvorfor en celle er N/A |
| [Endringslogg](CHANGELOG.md) | alle | utgitt historikk (Keep a Changelog + SemVer, Semantic Versioning) |
| [Bidra](CONTRIBUTING.md) | bidragsytere | bygging, vern, disiplin for tester/siteringer, DCO (Developer Certificate of Origin) |
| [Styring](GOVERNANCE.md) | bidragsytere / fellesskap | hvordan Kshana styres — hvem som bestemmer, hvordan, og grensen mellom åpent og lukket |
| [Atferdsregler](CODE_OF_CONDUCT.md) | fellesskap | forventet atferd (Contributor Covenant) |
| [Sikkerhetspolicy](SECURITY.md) | rapportører | hvordan du rapporterer en sårbarhet; merknad om dobbelt bruk |

</details>

<details>
<summary>Sentrale referanser</summary>

### Sentrale referanser

**Valideringsreferanser og standarder** — de eksterne autoritetene Kshanas kontroller er forankret i:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [testdata](https://celestrak.org/publications/AIAA/2006-6753/)): SGP4/SDP4-verifikasjonssettet Kshana samsvarer med til 4.12 mm, og de utarbeidede eksemplene på referansesystemer som TEME→ITRF-kjeden kontrolleres mot.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — referanserutinene for tid og referansesystemer som IAU 2000A-nutasjonen og CIO GCRS↔ITRS-reduksjonen er validert bit for bit mot.
- Petit & Luzum (red.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (standarder for jordorientering, polbevegelse og referansesystemer).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (relasjoner for Allan-avvik og referanseserien NBS14; NBS = tidligere US National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): referanseimplementeringene av ROC/AUC, forvekslingsmatrise og presisjon/gjenkalling/F1 som testbenken for evaluering av RF-svekkelser samsvarer eksakt med (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` og `linalg.expm` — referanserutinene som NNLS-tilpasningen av målt ADEV i kvanteavveiningen, χ²-konsistensbåndene og van Loans prosesstøykovarians for klokke er validert mot (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): brukt både som åpen tidligere teknikk (se *Sammenligning og åpen tidligere teknikk* nedenfor) og som den **uavhengige DOP-referansen** som beregningen av GDOP/PDOP/HDOP/VDOP/TDOP samsvarer med til 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): kraftmodellene bak kraftmodelltilpasningen til byråenes presise efemerider.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (halo-/NRHO-familiene som CR3BP-differensialkorrektoren reproduserer).

**Enhets- og metodefysikk** — de siterte kildene bak sensormodellene:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (optisk strontium-gitterklokke, romrettet mål).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (Sr-klokke i laboratoriet, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (hybrid kvanteakselerometertriade).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [veiledning fra IEEE AESS (Aerospace and Electronic Systems Society) (University College London Discovery-repositoriet)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (vekst i dødregningsfeil).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (optisk toveis tids- og frekvensoverføring; den optiske linken mellom satellitter modellerer budsjettet for ikke-resiprositet etter disse).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (BOC-modulasjonen og teorien for spektral separasjon bak `src/navsignal.rs`).
- Kaplan & Hegarty (red.) — *Understanding GPS/GNSS: Principles and Applications* (3. utg., Artech House, 2017): ligningen for effektiv C/N₀ ved anti-jamming og termisk støyjitter i early–late DLL-kodesporing som modellene for navigasjonssignal og jamming bruker.

**Sammenligning og åpen tidligere teknikk** — verktøyene og oversiktene Kshana posisjoneres mot:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): parameterne i testbatteriet for spoofing som flerlagsdetektoren karakteriseres mot.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): de åpne, validerte feilprofilene for treghetsnavigasjon som brukes som klassisk grunnlinje.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): åpen simulator for PNT ved Månen.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): åpen analyse av GNSS-data.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): redusert-dynamisk OD for GRAIL, gulvet for empirisk akselerasjon som LRO-tilpasningen reproduserer.

</details>
