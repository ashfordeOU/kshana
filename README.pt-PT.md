> Esta é uma tradução automática do README.md na v0.40.0, ainda não revista por um falante nativo; o README em inglês é a referência. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: o símbolo, um retículo de bússola que marca o instante preciso, ao lado do logótipo kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>o instante preciso</em></strong><br>
  Um simulador de código aberto para a resiliência PNT (posicionamento, navegação e temporização).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Estado da integração contínua no ramo main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Cobertura de linhas perto de 95 % de src/, medida em docs/COVERAGE.md e com limite mínimo de 85 % na integração contínua"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 de 401 capacidades VALIDATED face a uma referência independente externa, segundo a matriz de verificação"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Estado do controlo de qualidade do SonarQube Cloud"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Versão v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Inglês e mais 17 línguas, em tradução automática"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Licença: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, o registo conceptual Zenodo de todas as versões"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Está disponível uma licença comercial da Ashforde® OÜ, ver Edições"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana no crates.io, a versão publicada atual"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana no PyPI, a versão publicada atual"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana no npm, a versão publicada atual"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Abrir o Kshana Studio</a> ·
  <a href="#install">Instalar</a> ·
  <a href="#capabilities">Capacidades</a> ·
  <a href="#evidence">Evidências</a> ·
  <a href="#research">Investigação</a> ·
  <a href="docs/CONCEPTS.md">Documentação</a> ·
  <a href="#cite">Citar</a>
</p>

<p align="center">
  <strong>Línguas:</strong> <a href="README.md">English</a> ·
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
  <sub>A linha de comandos, os resumos de execução, os gráficos e os relatórios falam cada língua com <code>--lang &lt;tag&gt;</code>
  (por exemplo <code>kshana scenarios/holdover-test-example.toml --lang de</code>), e o mesmo acontece com as interfaces Python, WebAssembly e MCP.
  São traduções automáticas que nenhum falante nativo reviu ainda; o inglês é a referência.
  Ver <a href="docs/i18n.md">Localização</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Ensaie o minuto em que o GNSS se apaga. A consola de missão do Kshana, desenhada a partir de uma execução real do motor v0.40.0: a campanha encadeada campaign-jam-spoof-holdover-integrity (semente 20260928, 6 fases, 18 execuções membro ao longo de T+01:16:10) e os 102 satélites do GPS, Galileo, BeiDou e GLONASS de constellation-multi-gnss-coverage, cada um desenhado na órbita circular de dois corpos recuperada a partir do traço no solo do motor, com raios comprimidos para visualização. O erro de tempo do relógio atinge um pico de 62.7 ns face a uma guarda de 50 ns, a densidade portadora-ruído desce para -12.2 dB-Hz face a um piso de 25 dB-Hz, e o nível de proteção vertical chega a 135.4 m face a um limite de alerta de 50 m." width="100%">
</picture>

<details>
<summary><strong>Índice</strong></summary>

- [Ensaie o minuto em que o GNSS se apaga](#rehearse-the-minute-gnss-goes-dark)
- [Novidades da 0.40](#whats-new-in-040), [Novidades da 0.39](#whats-new-in-039), [Novidades da 0.38](#whats-new-in-038) e [A 0.38 em pormenor](#038-in-depth): pontuação do Jammertest, os indicadores do próprio recetor, entradas de máquina, temporização e holdover, pacotes de normas, LunaNet AFS, o ciclo completo com o laboratório, kshana-bench, o observatório, exportadores, ótica, [navegação de utilizadores espaciais](#space-user-navigation-gnss-ssv) e [infraestrutura lunar](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) e todas as páginas do Studio
- [Capacidades](#capabilities): a tabela de áreas, [todos os tipos de cenário por família](#every-scenario-kind-by-family), [todos os comandos](#every-command), [todas as interfaces](#every-surface)
- [Como funciona uma execução](#how-a-run-works), [Missões](#missions)
- [Evidências](#evidence): o registo, [domínios de capacidade](#capability-domains)
- [Instalar](#install), [Arquitetura](#architecture) (e os [diagramas](#diagrams)), [Assistente de IA](#ai-assistant)
- [Edições](#editions), [Investigação](#research), [Citar](#cite), [Licença](#licence)
- [Referência](#reference): utilização, formato de cenário, resultados, organização do repositório, perguntas frequentes, resolução de problemas, versões, roteiro, contribuições, documentação

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Ensaie o minuto em que o GNSS se apaga

O Kshana reproduz jamming, spoofing e holdover do relógio quando os sinais GNSS (Global Navigation Satellite
System) falham, e diz-lhe durante quanto tempo um sistema mantém a hora e a posição dentro do seu
orçamento, e que relógio ou sensor proporciona mais margem. É um único motor em Rust. Funciona num
terminal, num notebook, num IDE (ambiente de desenvolvimento integrado), num assistente de IA (inteligência
artificial) ou no seu navegador.

Cada execução é reprodutível bit a bit a partir do cenário, da semente e da versão do motor.
Cada capacidade tem uma de três etiquetas num registo verificado por máquina: **VALIDATED** (uma
referência independente externa concorda), **MODELLED** (internamente consistente, e dito abertamente)
ou **PARTNER** (é da responsabilidade de um parceiro de hardware).

> **Estado: v0.40.0.** Um substrato de simulação validado e reprodutível para a resiliência PNT.
> A temporização e o holdover vêm primeiro, porque esse é o domínio mais bem validado. O Kshana é um
> instrumento de estudo e de compromissos: não é hardware gerador de sinais de radiofrequência (RF) (não
> comanda nenhum rádio e não transmite nada; a sua saída ao nível do sinal são ficheiros de amostras IQ em banda base
> para recetores de software), não é um recetor GNSS de hardware nem certificado (o seu recetor de software
> é uma ferramenta de análise) e não é um produto de voo. É novo na área? Comece pelo
> [guia em linguagem simples](docs/CONCEPTS.md) e pelo [glossário](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Novidades da 0.40

A 0.40 acrescenta um orçamento de erro ao nível da missão, rotula cada figura e tabela com o seu nível de evidência, lê registos de relógios medidos,
verifica as submissões de parceiros de dados, estima onde pode estar um emissor de interferência e fala dezassete línguas além do inglês.
O registo tem agora 401 linhas: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Nenhuma linha foi promovida a VALIDATED, e cada falha abaixo está
fixada por um teste.

- **Fio da missão.** O tipo `mission-thread` encadeia fases do lançamento à reentrada (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` e quatro tipos lunares) com regras de passagem declaradas, uma margem face a requisitos declarados e o elo
  mais fraco; um exemplo de ponta a ponta da classe Artemis com 11 fases (segmentos terrestre e lunar), 92 tipos de cenário ao todo. Todos os números são MODELLED. A propagação cislunar face à trajetória pública da Artemis I
  **falha** o seu limiar pré-registado (45.3 km e 0.25 m/s face a 5 km e 0.05 m/s; a causa são pequenas manobras que o modelo não inclui), e o propagador lunar face à órbita da CAPSTONE
  **falha** (136.8 km face a 25 km no fim de uma revolução); a comparação com o LRO é cumprida. As linhas mantêm-se MODELLED
  ([Fio da missão](docs/MISSION-THREAD.md), [segmento lunar](docs/MISSION-THREAD-LUNAR.md)). No Studio o fio é lido em `/studio/mission-thread/`.
- **Etiquetas de evidência.** Cada figura e tabela que uma execução escreve indica o nível e os ids das linhas do registo em que assenta, lidos da matriz.
- **Relógios medidos.** São lidos oito formatos de registo de relógio ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)) e uma
  série ajustada pode alimentar o holdover. Face aos limiares pré-registados, o ajuste **falha** F1(a) em cinco de seis registos e F2 num; ambos
  ficam MODELLED ([Registo de alterações](CHANGELOG.md#0400---2026-10-29)).
- **Parceiros de dados.** `kshana partner check` verifica o formato de uma submissão e não pontua nada ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Região do emissor.** `kshana interference-map locate` indica uma região e uma elipse, nunca um ponto isolado, a partir de relatórios ADS-B ou AIS.
  Comparado uma vez com os locais dos transmissores do Jammertest 2025, o resultado é **NOT ASSESSABLE** para ambas as fontes (demasiado poucas
  sessões programadas nos dados abertos), pelo que a linha fica MODELLED ([Mapa de interferência](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Benchmark.** A nova campanha da 0.40 cumpre A3, D3 (ambos EXPLORATORY), R3 e R4; A2, D1 e R1 ficam NOT MET ([Bench](docs/BENCH.md)).
- **Línguas.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja e zh-Hans, como **traduções automáticas que nenhum falante
  nativo reviu**; o inglês é a referência, e as execuções noutras línguas demoram cerca do dobro
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Novidades da 0.39

A 0.39 não acrescenta nenhuma funcionalidade nem altera nenhum resultado; a saída do motor é a saída da 0.38. Corrige uma coisa
na linha de comandos, atualiza dependências das ferramentas de validação cruzada e apresenta por extenso os veredictos do
benchmark.

- **Linha de comandos.** `kshana kinds | head` (qualquer saída padrão fechada) já não entra em pânico: o programa termina
  silenciosamente com o estado 141, como fazem outras ferramentas perante um pipe fechado. Os outros erros de escrita continuam a ser reportados.
- **Dependências.** `memmap2` 0.9.11 nos dois ficheiros de bloqueio da verificação cruzada ANISE e `pillow` 13.0.0 e
  `certifi` 2026.10.19 nas versões fixadas do ambiente de referência, tudo em `xval/`: nada do que é distribuído mudou.
- **kshana-bench, todos os veredictos.** Face aos limiares pré-registados, três são NOT MET, cada um fixado por um teste:
  A2 (`agc_k_sigma` AUC 0.766 face a pelo menos 0.80), D1 (maior diferença 0.0301) e a tarefa (b) R1 (transportado,
  não reexecutado). Nenhum limiar foi afrouxado ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Novidades da 0.38

A 0.38 torna mensurável o árbitro neutro: pontua registos de recetores face a um calendário de testes
publicado, lê mais recetores e sensores, testa sistemas de temporização e inclui um benchmark e um
observatório de interferência. Continua a ser consultivo: nada aqui é certificado, nenhum resultado é uma homologação,
e nada transmite. Cada linha indica o que o registo contém para ela ([como uma etiqueta é obtida](#evidence));
um estado nomeia apenas o que foi verificado, e a linha do registo e a página ligada dizem o que não foi.

| Novo na 0.38 | O que faz, e porquê | Estado no registo | Ler |
|---|---|---|---|
| **Pontuação do Jammertest** | `kshana jammertest import` lê o catálogo de testes e o plano de transmissão publicados pela NPRA como verdade programada; `jammertest score` pontua um registo de recetor por teste (latência de deteção, alarmes falhados, falsos alarmes, tempo de recuperação), como pacote de evidências assinado se fornecer uma chave | **MODELLED**: uma linha do registo. Os limiares foram pré-registados antes de qualquer execução pontuada; nos dados do JammerTest 2024 a regra de dados mínimos falhou em ambas as execuções (4 e 7 janelas pontuáveis face a 10 exigidas), pelo que **nenhum limiar é avaliável** e nada é afirmado | [Jammertest](docs/JAMMERTEST.md) |
| **Os indicadores do próprio recetor** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG e NovAtel RXSTATUS lidos para um `self_report` por época e comparados com os alarmes do Kshana (ambos, só o recetor, só o Kshana, nenhum); um leitor Septentrio SBF e uma entrada `--serial` só de leitura | **MODELLED**; a concordância entre o detetor de um recetor e o do Kshana não é validação | [Confiança no recetor](docs/RECEIVER-TRUST.md) |
| **Mais recetores e sensores** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (a partir das tabelas pyrtcm com licença BSD, não do texto RTCM), fluxos de monitorização GNSS-SDR, um registo de IMU como segundo sensor, um pacote ROS 2, uma ponte `gnss_lib_py` e `imu-fit` para parâmetros de sensores híbridos | **MODELLED**: seis linhas do registo; apenas dados de teste escritos pelo próprio projeto, não foi lida nenhuma captura de um recetor real, IMU, execução GNSS-SDR ou grafo ROS | [Entradas de máquina](docs/MACHINE-INPUTS.md) |
| **Testes de temporização e holdover** | o tipo `holdover-test` pontua um teste de holdover (GNSS removido pelo operador, holdover, recuperação) a partir de um registo medido de erro de tempo face às máscaras ITU-T, "medido face à máscara"; leitores de registos linuxptp e chrony; as fases de hardware e o campo `lab-attestation` | **MODELLED**: duas linhas do registo; os tempos são declaração do operador, não verificados | [Timing HIL](docs/TIMING-HIL.md), [Segurança do hardware](docs/HARDWARE-SAFETY.md) |
| **Pacotes de normas, LunaNet AFS, ciclo completo com o laboratório** | pacotes pontuados para DHS RPCF, IMO MSC.1/Circ.1575 e ICAO Doc 9849 Appendix F face a limiares declarados antes da execução, "contribui com evidência para"; uma correspondência com NIST IR 8323r1; um gerador e verificador de códigos LunaNet AFS; um pacote assinado que liga o cenário, as condições de teste, o registo do recetor e a pontuação de uma execução em laboratório | **MODELLED** para os pacotes e o ciclo completo; a verificação de códigos AFS é **VALIDATED** face às suas colunas de verificação impressas (ver as linhas do registo) | [Normas](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench e o observatório** | tarefas, partições e métricas fixas para deteção de interferência, deteção em IQ, previsão de holdover e o desvio de otimismo, com um conjunto reservado selado e uma tabela de classificação estática; um produto diário de interferência reprodutível com 24 h de atraso, células grosseiras e sem atribuição | sem linha própria no registo: pontua submissões, e as suas linhas de base estão rotuladas MODELLED nos ficheiros de resultados; face aos limiares pré-registados, o avaliador, C1 a C3 e D2 são cumpridos e três limiares são **NOT MET** (fixados por testes): A2 (`agc_k_sigma` AUC 0.766 face a pelo menos 0.80 na partição de teste), D1 (maior diferença 0.0301) e a tarefa (b) R1 (transportado, não reexecutado); ver `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatório](docs/observatory/METHOD.md) |
| **Exportadores** | telemetria de confiança como mensagens de descoberta e de estado MQTT do Home Assistant (só publicação, sem credenciais) ao lado de Prometheus, CEF, LEEF e OTLP | **MODELLED**: uma linha do registo | [Telemetria de confiança](docs/TRUST-TELEMETRY.md) |
| **Margem da ligação ótica ao longo do tempo** | o tipo `optical-atmosphere` pode escrever uma realização com semente da meteorologia de um local como série de margem da ligação | **MODELLED**: uma linha do registo; uma amostra do modelo, não o clima | [Atmosfera ótica](docs/OPTICAL-ATMOSPHERE.md) |

Destaques da 0.37: [registo de alterações](CHANGELOG.md#0370---2026-10-17). A lista completa da 0.38 está no
[registo de alterações](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## A 0.38 em pormenor

Cada capacidade da tabela acima, em poucas linhas: o que faz, um comando para a executar, uma
imagem desenhada a partir de uma execução real do motor e o que o registo contém para ela. As imagens
são escritas por [`tools/gen_figures_038.py`](tools/gen_figures_038.py) em
[`docs/figures/0.38/`](docs/figures/0.38/) (nunca desenhadas à mão): `python3 tools/gen_figures_038.py`
reescreve-as a partir de um motor compilado, e `--check` falha se alguma estiver desatualizada ou se a sua legenda aqui for diferente.
Quando uma entrada é um registo, é um registo inventado que o script escreve, porque os registos reais de terceiros
nunca são incluídos no repositório, e a legenda di-lo. Tudo o que segue é consultivo: não é certificado, não é uma
homologação, e nada transmite. Um estado nomeia o que foi verificado e nada mais;
[como uma etiqueta é obtida](#evidence).

### Pontuação do Jammertest

`kshana jammertest import` transforma o catálogo de testes e o plano de transmissão publicados pela NPRA em
verdade programada, e `kshana jammertest score` pontua um registo de recetor face a ela: para cada
teste programado, se foi detetado, com que atraso e quanto tempo o recetor levou a recuperar, além dos
falsos alarmes fora de todas as janelas. O catálogo é descarregado, nunca incluído no repositório.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Pontuação de um registo sintético de recetor face a um calendário de três testes, a partir de uma execução real do motor v0.40.0 (`kshana jammertest score`). O registo é inventado: 1800 s de NMEA com uma queda de 20 dB no C/N0 em dois intervalos. O calendário lista três janelas; a janela do meio não tem jammer no registo. A pontuação marca 2 de 3 testes detetados (latência mediana 0 s) e 1 falhado, com 0 sequências de falsos alarmes em 0.25 h de tempo limpo. Nada aqui diz algo sobre um recetor real. Software de caráter consultivo, não um equipamento de navegação homologado (IEC 61108, IEC 61162): o operador continua a ser responsável pela navegação da embarcação.">
</picture>

**Estado no registo: MODELLED.** Os limiares foram fixados antes de qualquer execução pontuada; nos dados do JammerTest 2024
a regra de dados mínimos falhou em ambas as execuções, pelo que nenhum limiar é avaliável e nada é afirmado.
[Jammertest](docs/JAMMERTEST.md).

### Os indicadores do próprio recetor

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG e NovAtel RXSTATUS são lidos para um `self_report` por época
e colocados ao lado dos alarmes do Kshana: ambos, só o recetor, só o Kshana, ou nenhum. Um
leitor Septentrio SBF e uma entrada `--serial` só de leitura alimentam a mesma comparação. Nenhum dos lados é
a verdade de referência.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="O indicador de spoofing do próprio recetor ao lado dos alarmes do Kshana, a partir de uma execução real do motor v0.40.0 sobre um registo UBX inventado (200 épocas a 1 Hz). O C/N0 cai 20 dB de 80 a 90 s e de 120 a 130 s; o recetor assinala de 120 a 130 s e de 160 a 165 s. Das 140 épocas comparadas após a calibração, 11 tiveram ambos a assinalar, 6 só o recetor, 11 só o Kshana e 112 nenhum. Nenhum dos lados é a verdade de referência e a concordância não é validação. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

**Estado no registo: MODELLED.** A concordância entre o detetor de um recetor e o do Kshana não é
validação. [Confiança no recetor](docs/RECEIVER-TRUST.md).

### Mais recetores e sensores

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, fluxos de monitorização GNSS-SDR, um registo de IMU como segundo
sensor, um pacote ROS 2 e uma ponte `gnss_lib_py` terminam todos na mesma linha temporal de confiança no recetor.
`imu-fit` lê os parâmetros de sensor de que os cenários híbridos e de fusão precisam a partir de um registo de IMU
estacionária, para que um cenário possa ser executado com o sensor que realmente tem.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="O que `kshana imu-fit` lê de um registo de IMU estacionária, a partir de uma execução real do motor v0.40.0 sobre um registo inventado (20,000 amostras a 100 Hz, 200 s): o passeio aleatório de velocidade do acelerómetro q_va = 4.02e-06, o passeio aleatório de ângulo do giroscópio q_arw = 9e-08, a instabilidade do bias 0.00296 e os declives iniciais de Allan (-0.51 e -0.49; cerca de -0.5 onde domina o ruído branco). A tabela ao lado é o TOML que o comando imprime. O estimador só é verificado em registos sintéticos. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

**Estado no registo: MODELLED.** Apenas dados de teste escritos pelo próprio projeto; não foi lida nenhuma captura de um recetor real, IMU,
execução GNSS-SDR ou grafo ROS. [Entradas de máquina](docs/MACHINE-INPUTS.md).

### Testes de temporização e holdover

O tipo `holdover-test` pontua um teste de holdover (GNSS removido pelo operador, holdover, recuperação)
a partir de um registo medido de erro de tempo face às máscaras ITU-T, e di-lo com essas palavras: medido
face à máscara. Os leitores de registos linuxptp e chrony alimentam-no; as fases de hardware e o
campo `lab-attestation` dizem quem declarou o quê.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Um teste de holdover pontuado a partir de um registo de erro de tempo, de uma execução real do motor v0.40.0 sobre scenarios/holdover-test-example.toml (601 amostras a cada 5 s). O GNSS é removido pelo operador aos 600 s e reposto aos 2400 s; o erro de tempo deriva até 299 ns no fim do holdover, ultrapassa o orçamento de 100 ns após 675 s e regressa à banda de 100 ns 70 s após a reposição. Veredictos: máscaras da linha de base PASS, máscaras de holdover FAIL, envolvente de holdover FAIL, recuperação RECOVERED. Medido face à máscara, não uma aprovação. Os tempos são declaração do operador, não verificados pelo Kshana. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

**Estado no registo: MODELLED.** Os momentos em que o GNSS foi removido e reposto são declaração do operador,
não verificados. [Timing HIL](docs/TIMING-HIL.md), [Segurança do hardware](docs/HARDWARE-SAFETY.md).

### Pacotes de normas

Pacotes pontuados para os perfis de teste DHS Resilient PNT, IMO MSC.1/Circ.1575 e ICAO Doc 9849
Appendix F, além de uma correspondência com NIST IR 8323r1 em `compliance-report`. Cada teste executa um
cenário incluído e compara um campo do resultado com um limiar declarado antes da execução; um teste que precisa de um registo de recetor
é listado como precisando de uma entrada, não pontuado. A formulação é "contribui com evidência para".

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Todos os testes dos três pacotes de normas pontuados, a partir de execuções reais do motor v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 cumpridos, 1 não cumprido, 2 precisam de uma entrada; imo-circ-1575: 1 cumprido, 4 não cumpridos, 2 precisam de uma entrada; icao-doc9849-appf: 6 cumpridos, 0 não cumpridos, 2 precisam de uma entrada. Ao todo, 13 cumpridos, 5 não cumpridos e 6 precisam de uma entrada que o motor não tem (um registo de recetor ou documentação do equipamento). Cada limiar foi declarado antes da execução; uma falha é mantida como falha. Um limiar cumprido diz que um cenário modelado cumpriu um limiar declarado, nada sobre um produto. Os pacotes contribuem com evidência para as linhas que citam; não são uma avaliação. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana; não deve ser a única base para qualquer decisão de navegação ou de segurança.">
</picture>

**Estado no registo: MODELLED.** Um limiar cumprido diz que um cenário modelado cumpriu um limiar declarado, nada sobre um
produto; cada falha é mantida e fixada por um teste. [Normas](docs/STANDARDS.md).

### LunaNet AFS

O gerador de códigos do LunaNet Augmented Forward Signal (códigos Gold, Weil e terciários, a trama
da mensagem e a sua codificação de erros) e um verificador para um fluxo de símbolos gravado ou gerado, fixados a uma
edição da especificação.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="O gerador de códigos LunaNet AFS verificado face às colunas impressas da especificação, a partir de uma execução real do motor v0.40.0 (`kshana lunanet-afs-check spec`, fixado a LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 de janeiro de 2025; o documento marca as suas tabelas de códigos {LSIS-TBC}). 9 de 10 verificações são cumpridas; B4 é NOT MET (420 de 421 coincidentes). Verifica um fluxo de símbolos face a uma edição de uma especificação publicada e nada diz sobre qualquer nó ou serviço LunaNet. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana. Verifica um fluxo de símbolos face a uma edição de uma especificação publicada e nada diz sobre qualquer nó ou serviço LunaNet.">
</picture>

**Estado no registo: VALIDATED** para as verificações de código e de sincronização, face aos valores que a
especificação imprime (que marca como TBC); uma verificação é NOT MET, mantida e fixada (uma coluna impressa de
código terciário difere: o documento imprime o mesmo valor para dois PRN). As palavras LDPC e CRC
das subtramas 2 a 4 não são verificadas. As linhas do registo dizem exatamente quais. [LunaNet AFS](docs/LUNANET-AFS.md).

### Ciclo completo com o laboratório

`kshana.test-conditions/1` é uma descrição publicada do que um laboratório fez (eventos, tempos,
potências). `kshana evidence round-trip` liga o hash do cenário, o hash das condições, o hash do registo
do recetor e a pontuação num único pacote assinado, e recusa um pacote cujas condições e cenário de pontuação
discordem quanto aos eventos. O Kshana nunca produz nem reproduz um sinal: a forma como um cenário chegou a um
recetor é da responsabilidade do operador.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="A estrutura de um pacote de evidências. Um registo de recetor (NMEA, u-blox UBX, RINEX 3 ou um registo Android) e uma janela temporal entram em kshana receiver-trust evidence, que escreve sete ficheiros: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig e um timestamp.tsr opcional. O manifesto regista o SHA-256 do registo completo e de cada ficheiro e uma cadeia de hashes sobre os ficheiros; a assinatura cobre o manifesto. kshana evidence verify verifica a assinatura, o hash de cada ficheiro, a cadeia e que não está presente nenhum ficheiro não listado, e termina com 0 quando verificado, 1 quando algo falhou e 3 quando o signatário não estava fixado. Um pacote é um registo técnico, não um parecer jurídico.">
</picture>

A imagem mostra a organização de um pacote. **Estado no registo: MODELLED.**
[Condições de teste](docs/spec/TEST-CONDITIONS.md), [Bancada de teste](docs/TEST-BENCH.md).

### kshana-bench

Tarefas, partições e métricas fixas para deteção de interferência, deteção em IQ, previsão de holdover e
o desvio de otimismo, com um conjunto reservado selado e uma tabela de classificação estática. Pontua submissões; não é
uma classificação de recetores.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="As linhas de base incluídas da tarefa D do kshana-bench (o desvio de otimismo) na partição de teste, a partir de uma execução real do motor v0.40.0 (`kshana bench baseline`). Cada par de barras é a área sob a curva ROC nos casos dentro da distribuição e nos casos deslocados; a diferença entre elas é o desvio de otimismo, face a uma tolerância de 0.05. fused-max-z: 0.998 e 0.983 (diferença 0.015); sqm-imbalance: 0.882 e 0.882 (diferença 0.001); agc-excess: 0.848 e 0.819 (diferença 0.030); raim-parity: 0.682 e 0.672 (diferença 0.010); energy-cn0-drop: 0.595 e 0.565 (diferença 0.030). As etiquetas são etiquetas de modelo generativo de um corpus sintético, nunca dados de campo: MODELLED. Consultivo: modelado ou medido face a referências declaradas, não uma aprovação, certificação ou declaração de conformidade. Uma pontuação descreve um registo ou um corpus, nunca um produto.">
</picture>

**Estado no registo:** sem linha própria no registo; as linhas de base estão rotuladas MODELLED nos ficheiros de resultados.
Face aos limiares pré-registados, o avaliador, C1 a C3 e D2 são cumpridos e três limiares são NOT MET, cada um
fixado por um teste: A2 (`agc_k_sigma` AUC 0.766 face a pelo menos 0.80 na partição de teste), D1 (maior diferença
0.0301) e a tarefa (b) R1 (transportado da campanha anterior, não reexecutado). Os valores estão em
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Observatório de interferência

Um produto por dia UTC e por região a partir de um arquivo aberto de posições de aeronaves, numa grelha grosseira fixa:
cada célula está degradada, não degradada ou não observada (o que não significa "limpa"). Publicado nunca antes
de 24 h após o fim do dia, com as células pequenas suprimidas e sem atribuição de causa.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Dois dias sintéticos de mapa de interferência desenhados a partir das amostras incluídas em examples/interference-map/output, cada um com a sua rota sintética e as percentagens de exposição da rota que o motor indica. À esquerda, um dia ADS-B: 1 célula degradada, 6 não degradadas, 4 não avaliadas (tracejadas) e células sem entrada, desenhadas vazias, que não foram observadas. A rota tem 525 km: 11.5% do seu comprimento em células degradadas, 38.3% não degradadas, 9.1% não avaliadas e 41.1% não observadas. À direita, um dia AIS: células assinaladas pelos detetores de círculo e em terra, células não anómalas e células vazias; a rota tem 454 km com 10.5% em células anómalas, 21.2% não anómalas, 0.0% não avaliadas e 68.3% não observadas. ADS-B e AIS são camadas separadas, nunca combinadas. Uma célula assinalada não é uma constatação de interferência, e uma célula sem cor não foi observada, o que não é o mesmo que limpa. Todos os dados são inventados, em pleno Atlântico médio, e não são uma medição.">
</picture>

A imagem mostra os dias de amostra incluídos, não um produto do observatório. **Estado no registo: MODELLED**:
sem referência externa, sem verdade de referência e sem atribuição de causa; uma célula que não é observada não foi
avaliada, o que não é o mesmo que limpa. [Método do observatório](docs/observatory/METHOD.md).

### Exportadores

Telemetria de confiança como texto Prometheus, CEF, LEEF, OTLP e mensagens de descoberta e de estado MQTT do Home Assistant.
O comando publica apenas para um destino que lhe indicar e não guarda credenciais.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Um resultado de confiança em três formatos de exportação, a partir de execuções reais do motor v0.40.0 (`kshana trust-telemetry`) sobre examples/maritime-trust: exposição de texto Prometheus (a pontuação de confiança mais recente é 5.9 e a banda não fiável é a que está ativa) e as últimas mensagens CEF e LEEF. O comando não publica nada se não lhe for dado um destino, não guarda credenciais e não transmite nenhum sinal de rádio. Software de caráter consultivo, não um equipamento de navegação homologado (IEC 61108, IEC 61162): o operador continua a ser responsável pela navegação da embarcação.">
</picture>

**Estado no registo: MODELLED.** [Telemetria de confiança](docs/TRUST-TELEMETRY.md).

### Margem da ligação ótica ao longo do tempo

O tipo `optical-atmosphere` pode escrever uma realização com semente da meteorologia de um local como série de margem
da ligação: episódios de nuvens, uma coluna de água líquida para cada um, uma amostra de cintilação por passo. A
página Optical PNT do Studio abre os cenários optical-atmosphere.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Uma realização com semente da margem da ligação do local 'northern' ao longo de 336 h, a partir de uma execução real do motor v0.40.0 sobre scenarios/optical-atmosphere-network.toml (semente 37, passo de 600 s). A margem desce abaixo de zero durante os episódios de nuvens; nesta amostra a ligação está ativa 40.5 % do tempo, com 27 interrupções e uma interrupção máxima de 30.7 h. As entradas são ilustrativas, a série é uma amostra do modelo e não o clima, e difere da disponibilidade estatística (37.8 %) pelo erro de amostragem da amostra. Apenas análise consultiva: não é um produto certificado de disponibilidade, integridade ou navegação, e não é uma previsão para nenhum local real, a menos que as suas entradas climáticas venham de um conjunto de dados declarado.">
</picture>

**Estado no registo: MODELLED.** Uma amostra do modelo, não o clima. [Atmosfera ótica](docs/OPTICAL-ATMOSPHERE.md).

### Novas vistas do Studio

[kshana.dev/studio](https://kshana.dev/studio/) ganha uma reprodução Bridge (duas execuções lado a lado num mesmo
relógio de missão, em [`/studio/replay/`](https://kshana.dev/studio/replay/)), uma página Optical PNT
(`/studio/optical/`), uma página de teste de holdover (`/studio/holdover/`) e um visualizador do observatório
(`/studio/observatory/`). Executam o mesmo motor no navegador, nada é carregado para fora, e apresentam
a mesma declaração consultiva. As imagens acima são desenhadas a partir da saída do próprio motor por um script;
não são capturas de ecrã destas páginas.

<a id="space-user-navigation-gnss-ssv"></a>
### Navegação de utilizadores espaciais (`gnss-ssv`)

Para um veículo espacial acima, em torno ou muito para lá das órbitas GNSS: quantos sinais GNSS pode usar, quão
fortes são, quão boa é a geometria e o que um filtro a bordo consegue fazer com eles. Um tipo,
quatro modos, escolhidos pelas tabelas do cenário: uma **camada** de utilizadores (a fração de tempo com um e com quatro
sinais, por constelação), uma **trajetória** (sinais, C/N0, diluição da precisão e o
meio atravessado pelo raio no limbo ao longo de uma órbita), uma execução de **navegação** (um filtro de nove estados sobre pseudodistâncias, até à
Lua) e uma **formação** (navegação relativa de satélites secundários em torno de um principal). A fonte pública para a
comparação de disponibilidade é a brochura do GNSS Space Service Volume interoperável (UN OOSA
ST/SPACE/75, do International Committee on GNSS), que é ela própria uma simulação; é descarregada, nunca
incluída no repositório. Página completa: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Disponibilidade de sinal para um utilizador numa esfera a 36000 km de altitude com uma antena hemisférica, a partir de uma execução real do motor v0.40.0 sobre scenarios/gnss-ssv-shell.toml (uma execução reduzida: 162 utilizadores, 3 dias, passos de 10 min), com um limiar de 20 dB-Hz. Para cada constelação e banda, duas barras: a fração de pares (utilizador, época) com pelo menos um sinal e com pelo menos quatro. Combinado, L1: 99.4 % pelo menos um, 73.2 % pelo menos quatro, maior interrupção abaixo de quatro sinais 160 min. Combinado, L5: 100.0 % pelo menos um, 99.9 % pelo menos quatro, maior interrupção abaixo de quatro sinais 20 min. MODELLED: um estudo modelado a partir de entradas declaradas, não uma medição nem uma afirmação de volume de serviço para qualquer sistema. O tamanho reduzido não é a comparação com a brochura. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Sinais ao longo de uma órbita terrestre alta (perigeu 497 km, apogeu 58622 km, período 18.8 h), a partir de uma execução real do motor v0.40.0 sobre scenarios/gnss-ssv-heo.toml, banda L1. Em cima: a melhor densidade portadora-ruído entre os sinais visíveis, face ao limiar de 20 dB-Hz. Ao meio: o número de sinais visíveis de todas as constelações, de 4 a 55 ao longo dos pontos amostrados. Das ligações recebidas, 2252 chegaram por um lóbulo principal e 696 por lóbulos secundários, usando um diagrama paramétrico substituto rotulado, não o diagrama medido de nenhum sistema. PDOP mediano 67, percentil 95 358. MODELLED: um estudo modelado a partir de entradas declaradas, não uma medição nem uma afirmação de volume de serviço para qualquer sistema. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Um filtro de nove estados a bordo numa transferência de órbita baixa em direção à Lua, a partir de uma execução real do motor v0.40.0 sobre scenarios/gnss-ssv-nav-lunar.toml (289 épocas, 13 pontos desenhados). Num eixo logarítmico, o erro de posição verdadeiro e o limite a um sigma do próprio filtro em função do tempo desde o início. Dentro das órbitas GNSS o RMS de posição é 1.4 m; acima delas é 90 m, com um erro final de 184 m a 193,330 km de altitude com 1 medição. O erro de estimação normalizado ao quadrado médio ao longo de toda a execução é 4.4 (cerca de 3 para um bloco de posição consistente). A verdade e o filtro partilham os seus substitutos do Sol e da Lua. MODELLED: um estudo modelado a partir de entradas declaradas, não uma medição nem uma afirmação de volume de serviço para qualquer sistema. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Navegação relativa de 2 satélites secundários em torno de um principal numa órbita alta, a partir de uma execução real do motor v0.40.0 sobre scenarios/gnss-ssv-formation-heo.toml (401 épocas). Para cada satélite secundário, duas barras: o RMS da posição relativa obtido subtraindo as duas estimativas absolutas independentes, e obtido pelo filtro relativo sobre pseudodistâncias de diferenças simples. Linha de base 0.8 km: 5.1 m e 1.2 m. Linha de base 2.0 km: 4.1 m e 2.1 m. O filtro absoluto não é consistente aqui: erro de estimação normalizado ao quadrado médio 187 face a cerca de 3 para um filtro consistente, pelo que a sua incerteza declarada é muito pequena demais. MODELLED: um estudo modelado a partir de entradas declaradas, não uma medição nem uma afirmação de volume de serviço para qualquer sistema. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

**Estado no registo: MODELLED, e a comparação com a brochura falha na maior parte.** Os limiares foram fixados antes
da execução. Dos oito, só S0 (o orçamento de ligação inverso, 13 de 13 valores) e S6 (a missão lunar) são
cumpridos. **S1 a S5 e S7 são NOT MET**: a geometria do volume de serviço superior e inferior (43 de 52 e 48 de 52
células), o volume de serviço superior a 15/20/25 dB-Hz, as seis missões GEO, a missão HEO e o
diagrama paramétrico de lóbulos secundários face aos diagramas medidos dos painéis GPS. Quase todas as falhas em S1 a S5 envolvem
o GLONASS, e a brochura imprime dois ângulos de referência diferentes para ele; uma variante de diagnóstico que usa o
outro par leva S1, S2 e S4 a todas as células, mas não substitui a execução de referência e nenhuma linha é
VALIDATED. O filtro absoluto da execução em formação também é demasiado confiante (erro normalizado ao quadrado médio
muito acima do valor de cerca de 3 que um filtro consistente dá).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="A comparação registada do modelo de disponibilidade para utilizadores espaciais com a brochura pública do Space Service Volume, a partir dos resultados incluídos da execução pré-registada (xval/gnss-ssv/results-run1.json, escrito pelo exemplo ssv_booklet_check do motor v0.40.0). Barra a barra, as células dentro da tolerância: S0 13 de 13 (MET); S1 43 de 52 (NOT MET); S2 48 de 52 (NOT MET); S3 122 de 155 (NOT MET); S4 132 de 156 (NOT MET); S5 18 de 26 (NOT MET); S6 26 de 26 (MET); S7 0 de 20 diagramas de painel (NOT MET). Só S0 e S6 são cumpridos segundo a leitura pré-registada. Uma variante de diagnóstico que usa os outros ângulos GLONASS da brochura leva S1, S2 e S4 a todas as células, mas não substitui a execução de referência. Nenhuma linha do registo é VALIDATED. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

[Navegação de utilizadores espaciais](docs/SSV.md), [o que a comparação mostra](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Infraestrutura lunar (`lunar-infrastructure`)

A órbita e a superfície da Lua como infraestrutura de navegação e geodésica, em cinco estudos escolhidos por
`study`: **od-consistency** (uma determinação de órbita a bordo com GNSS terrestre numa órbita halo face a uma
determinação independente a partir do solo), **carrier-phase** (fixação de ambiguidades inteiras entre estações de superfície e um
orbitador), **frame-coestimation** (o datum lunar a partir da telemetria de estações terrestres com e sem ligações do
orbitador), **space-tie** (desvios entre laser, VLBI e GNSS num mesmo veículo espacial face ao erro da ligação local) e
**geodesy-sensitivity** (que família de observáveis vê os números de Love h2, k2 e l2). O modelo é um modelo
restrito de três corpos com simplificações declaradas e entradas ilustrativas. Página completa:
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
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Consistência de uma determinação de órbita a bordo com GNSS terrestre numa órbita halo quase retilínea com uma determinação de órbita independente a partir do solo, a partir de execuções reais do motor v0.40.0 sobre scenarios/lunar-infrastructure-od-consistency.toml e a variante com erro de modelo (400 ensaios cada). A diferença normalizada média q é 5.81 sem erro de modelo e 5.95 com um erro de aceleração injetado de 3e-10 m/s2, face a 6 esperados: as duas soluções de órbita são consistentes (limiar C1 MET). A fração de ensaios acima do ponto de 95 % é 0.040 e 0.052; o limiar para detetar o erro injetado era de pelo menos 0.5, pelo que é NOT MET (C3): a solução a bordo é conhecida com cerca de 352 m face a 23 m para a do solo, pelo que um deslocamento de dez metros se esconde na sua covariância. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Fixação de ambiguidades inteiras da fase da portadora entre estações de superfície lunares e um orbitador, a partir do resultado incluído da execução pontuada do motor v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 comprimentos de arco, um Monte Carlo de 401 amostras cada, escrito por scenarios/carrier-phase-scored.toml). 1 dia: sucesso 1.0 % (erro padrão 0.5 %), 134 ambiguidades, sigma de posição do orbitador 45.6 m flutuante e 18.5 m fixada; 2 dias: sucesso 0.5 % (erro padrão 0.4 %), 259 ambiguidades, sigma de posição do orbitador 21.5 m flutuante e 8.7 m fixada; 3 dias: sucesso 2.8 % (erro padrão 0.8 %), 375 ambiguidades, sigma de posição do orbitador 6.3 m flutuante e 2.1 m fixada. A fixação inteira não é alcançada: o sucesso fica entre 1 % e 3 % a 25 dBi, e com os 12 dBi registados o problema não pode ser formulado. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Precisão do datum lunar de sete parâmetros (três translações, uma escala e três rotações) a partir da telemetria de estações terrestres, com e sem distâncias entre o orbitador e as estações de superfície, a partir de uma execução real do motor v0.40.0 sobre scenarios/lunar-infrastructure-frame-coestimation.toml. O sigma de Cramer-Rao das translações e rotações desce com as ligações do orbitador (por exemplo t_z de 0.98 m para 0.046 m); o menor valor próprio da informação sobe 111 vezes e o traço do CRLB desce para 1.0 % (limiar F3 MET). Isto pressupõe que a órbita é conhecida nos eixos lunares, com o seu erro transportado pelo sigma de distância do orbitador de 1 m. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Precisão dos desvios entre as posições de telemetria laser, VLBI e GNSS de um veículo espacial, face ao erro da ligação local no solo, a partir de uma execução real do motor v0.40.0 sobre scenarios/lunar-infrastructure-space-tie.toml (um arco de 6.56 dias, sigmas das técnicas GNSS 10 m, VLBI 1 m, laser 0.1 m). Com uma ligação local de 1 mm a 1 m, o sigma da translação laser menos GNSS mantém-se perto de 1.04 m até a ligação atingir 1 m: é limitado pelo ruído de medição das técnicas, não pela ligação local. O piso fixado apenas pela ligação é a raiz quadrada de dois vezes o seu sigma. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Que família de observáveis é sensível aos números de Love lunares h2, k2 e l2, a partir de uma execução real do motor v0.40.0 sobre scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Cada célula é a derivada parcial RMS das observações de uma família em relação a um parâmetro, nas unidades próprias dessa família (por isso as células comparam-se ao longo de uma linha, não de uma coluna); um traço significa que a família não tem sensibilidade. telemetria laser: h2 7.6, k2 nenhuma, l2 9.8. seguimento do orbitador: h2 nenhuma, k2 0.00086, l2 nenhuma. gravímetro de superfície: h2 2.9e+03, k2 4.3e+03, l2 nenhuma. relógio de superfície: h2 2.8e-17, k2 2.8e-17, l2 nenhuma. Com as quatro famílias, o sigma de Cramer-Rao é 0.36 % do h2 nominal, 0.52 % do k2 e 1.16 % do l2. Acrescentar uma família nunca baixou o menor valor próprio (28 de 28 adições), mas o traço da pseudo-inversa não foi maior em apenas 16 de 28: essa metade do limiar G3 é NOT MET. A família do orbitador vê o integral na linha de visada da aceleração k2, um valor de extremo superior. MODELLED: um modelo restrito de três corpos com simplificações declaradas e entradas ilustrativas, não uma medição de qualquer grandeza lunar. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana.">
</picture>

**Estado no registo: MODELLED, e três limiares são NOT MET.** Os cálculos numéricos são verificados face a programas
independentes em numpy e scipy; nada é comparado com uma medição de uma grandeza lunar, e nada é
VALIDATED. Cumpridos: as duas soluções de órbita são consistentes (q médio 5.81 face a 6 esperados), e as ligações
do orbitador elevam o menor valor próprio do datum cerca de 111 vezes, pressupondo uma órbita conhecida. **Não cumpridos**: o
erro de modelo injetado de 3e-10 m/s2 **não é detetado** (C3: a solução a bordo é conhecida com cerca de 350 m, pelo que
cerca de dez metros se escondem na sua covariância); **a fixação inteira não é alcançada** (1 a 3 % de sucesso a
25 dBi, e com os 12 dBi registados o problema não pode ser formulado); e a metade do traço de G3 ao acrescentar uma
família de observáveis (o traço subiu em 12 de 28 adições, sempre porque a família aumentou a característica).
Cada falha é fixada por um teste. [Infraestrutura lunar](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Abra [kshana.dev/studio](https://kshana.dev/studio/) e todo o motor corre no seu
navegador, compilado para WebAssembly. Nada para instalar, e nada é carregado para fora. O Studio tem
duas vistas do mesmo motor, e um interruptor no cabeçalho alterna entre elas, mantendo o
cenário, a vista e quaisquer definições que tenha alterado.

**A vista Simples** é onde o Studio abre. Parte de perguntas (quantos satélites
consigo ver, posso confiar na minha posição, durante quanto tempo um relógio consegue manter a hora, o que faz um jammer
ao meu recetor) e de um mapa de tudo o que o motor consegue fazer, cada área com a sua fração de
métodos validados. Abra um cenário e a resposta vem primeiro: uma frase simples, escrita para
aquilo que esse cenário mede, depois os seus valores principais e um gráfico. No máximo cinco definições estão
visíveis, as que mais alteram a resposta; as restantes aguardam em **Definições avançadas**.
**Como isto é calculado** explica o método, e **Para investigadores** dá os valores do próprio motor,
o ficheiro do cenário, o código para o executar a partir de Python e a citação.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, vista Simples, no cenário incluído integrity-raim, motor v0.40.0 a correr localmente. A pergunta: a geometria cumpre os limites de alerta (nível de proteção horizontal e vertical)? Primeiro a resposta, marcada Resultado em direto: Sim, na maior parte: durante 95.3 % das 12 h. O limite de erro do recetor ficou abaixo dos limites de alerta (40 m horizontal e 50 m vertical) em 344 de 361 verificações, e nenhuma posição foi enganadora. Valores principais: tempo em que a posição é fiável 95.3 %, maior lacuna 10 min, limite de erro típico 6.5 / 13 m, posições enganadoras 0. Ao lado, Experimentar outras definições com cinco delas (o erro de distância, os dois limites de alerta, a duração e a máscara de elevação) e Executar novamente, depois as secções recolhidas Definições avançadas (mais 13), Como isto é calculado (8 validados, 6 modelados) e Para investigadores. Em baixo, as vistas deste resultado e os níveis de proteção representados face ao limite de alerta." width="100%">
</picture>

**A vista Avançada** é o painel completo: a biblioteca de cenários, cinco passos numerados
(Escolher, Definir, Executar, Ler resultados, Partilhar ou exportar), os valores principais com etiquetas PASS e FAIL
quando a execução declara um limiar, e todos os painéis: visão geral, gráficos, mapas, reprodução, o
relatório do motor e exportações. Uma caixa de pesquisa alcança cenários, domínios e os campos dentro
deles, e pode fixar até quatro execuções e compará-las lado a lado.

<details>
<summary>O ecrã inicial da vista Simples e a vista Avançada após uma execução</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, vista Simples, ecrã inicial, intitulado O que gostaria de descobrir?, com o motor v0.40.0 ativo e, na barra superior, três ligações: Análise do treino, Mapa de interferência e Confiança no recetor. Quatro perguntas: quantos satélites consigo ver em qualquer ponto da Terra, posso confiar na minha posição, durante quanto tempo um relógio consegue manter a hora sem satélites, e o que faz um jammer ao meu recetor. Por baixo da primeira, o seu resultado registado: pelo menos 22 satélites visíveis em todos os locais e 31 em média com GPS, Galileo, BeiDou e GLONASS em conjunto, uma posição possível em 100 % dos locais e momentos, sobre um mapa-mundo dos satélites visíveis, com um botão Abrir este resultado. Ao lado, Tudo o que o Kshana consegue fazer: 16 áreas e 139 cenários prontos a executar, cada mosaico com um pequeno gráfico de uma execução registada e a sua fração de métodos validados, e 173 de 350 capacidades do registo validadas." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, vista Avançada, após uma execução do cenário incluído constellation-multi-gnss-coverage (Quatro constelações GNSS, um mapa), motor v0.40.0 a correr localmente. À esquerda a biblioteca de cenários, 139 cenários em 16 domínios. Os cinco passos Escolher, Definir, Executar, Ler resultados e Partilhar ou exportar, com o passo 4 atual. Valores principais: 102 satélites, disponibilidade 100 % (PASS), diluição da precisão de posição (PDOP) mediana 0.95 (PASS), percentil 95 do PDOP 1.105 (PASS), 31.03 satélites visíveis em média e 22 no mínimo. Em baixo, a fila de painéis com Cobertura selecionada, a barra de reprodução, um mapa-mundo do PDOP médio de 0.831 a 1.0853 com todos os satélites desenhados, e os valores de cobertura global." width="100%">
</picture>

</details>

O código-fonte do Studio e as suas notas de compilação estão em [`web/README.md`](web/README.md).

### O site

O resto de [kshana.dev](https://kshana.dev) é construído a partir dos próprios ficheiros e execuções do motor
deste repositório: missões, capacidades, o registo de evidências, a investigação publicada e as
edições.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Três páginas de kshana.dev lado a lado. O destaque da página inicial: a linha de nome Kshana · क्षण · o instante preciso por cima do título Ensaie o minuto em que o GNSS se apaga, com a consola de missão de uma execução real do motor v0.40.0 (um globo e três gráficos em direto: erro de tempo do relógio, densidade portadora-ruído e nível de proteção). Evidências, Investigação publicada: os seis artigos arXiv construídos sobre o motor aberto, o mais recente com uma figura do motor. Edições, Kshana Pro, o mesmo motor, amplificado: o Free executa um cenário, o Pro responde à pergunta do programa." width="100%">
</picture>

<a id="capabilities"></a>
## Capacidades

Um único motor cobre toda a cadeia de falha, desde o primeiro satélite sob jamming até ao último
nanossegundo de holdover do relógio. O motor tem 92 tipos de cenário; `kshana kinds` lista-os
e [`docs/SCENARIOS.md`](docs/SCENARIOS.md) documenta todos os campos.

| Capacidade | A que responde |
|---|---|
| [Espectro](docs/SPECTRUM.md) | como um jammer ocupa a banda L do GNSS, banda a banda, segundo a segundo |
| [Relógios e temporização](docs/TELECOM-TIMING.md) | durante quanto tempo cada relógio mantém a hora depois de o GNSS se perder |
| [Constelações em torno de qualquer corpo](docs/CONSTELLATION-DESIGN.md) | cobertura, diluição da precisão e disponibilidade em torno da Terra, da Lua ou de Marte |
| [Sistema solar](docs/SOLAR-SYSTEM.md) | onde está cada planeta, e o tempo-luz de qualquer ligação |
| [Navegação em órbita terrestre baixa](docs/LEO-PNT.md) | uma passagem, uma ligação, uma mensagem de navegação e uma posição fundida, fase a fase |
| [Campanhas](docs/CAMPAIGNS.md) | uma missão encadeada, um varrimento ou um conjunto Monte Carlo num único cenário |
| [Animação](docs/ANIMATION.md) | as séries temporais de uma execução como desenho animado, leitor ou fotogramas |
| [Relatórios](docs/REPORTS.md) | cada valor com a sua unidade e a sua etiqueta, em HTML (HyperText Markup Language) e JSON (JavaScript Object Notation) |
| [Exportações de interoperabilidade](docs/INTEROP.md) | órbitas e geometria para outras ferramentas: SP3, CCSDS OMM e OEM, CZML, KML, GeoJSON, STK e SigMF |
| [Confiança marítima](docs/MARITIME-TRUST.md) | pode a ponte confiar nesta posição: uma pontuação de 0-100 e as razões para o NMEA de uma embarcação, em direto ou a partir de um registo (consultivo, não um equipamento de navegação homologado) |
| [Fluxos NMEA de treino](docs/NMEA-TRAINING.md) | NMEA sintético de ponte com jamming e spoofing programados e um registo do instrutor, para treino de tripulações (apenas texto; nunca para os sistemas de navegação em uso de uma embarcação; consultivo, não um equipamento de navegação homologado) |
| [Mapa de interferência](docs/INTERFERENCE-MAP.md) | onde aeronaves e navios reportaram dados de navegação degradados, e que parte de uma rota isso afeta |
| [Região do emissor](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | onde, sob pressupostos declarados, pode estar uma fonte de relatórios de posição degradados: regiões com confiança declarada, um centroide com a sua elipse, nunca um ponto (MODELLED; `kshana interference-map locate`) |
| [Pacotes de evidências](docs/EVIDENCE-PACKS.md) | um registo técnico assinado e verificável offline de uma janela do registo de uma embarcação e do que o motor calculou a partir dela, para um relatório de incidente (consultivo, não um equipamento de navegação homologado) |
| [Telemetria de confiança](docs/TRUST-TELEMETRY.md) | o fluxo de confiança como métricas Prometheus, eventos SIEM e OpenTelemetry opcional, com um painel Grafana de exemplo (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K e OpenCPN](docs/MARINE-INTEGRATIONS.md) | a pontuação de confiança no servidor Signal K de uma embarcação e no OpenCPN, com uma montagem de referência para um pequeno computador junto ao recetor (consultivo, não um equipamento de navegação homologado) |
| [Exportação para bancada de teste](docs/TEST-BENCH.md) | `kshana bench-export`: o movimento do veículo e os eventos de um cenário para um simulador GNSS de laboratório (não é escrito nenhum sinal), e como pontuar depois o registo do recetor |
| [Mapeamento e relatório de conformidade](docs/compliance/README.md) | `kshana compliance-report`: para que linhas de enquadramentos públicos de resiliência um conjunto de execuções contribui com evidência, e a lacuna que resta |
| [Notebooks](notebooks/README.md) | tutoriais executáveis: confiança de embarcações e fluxos de treino, exposição de uma rota no mapa de interferência, mapeamento de conformidade e a bancada de teste, GDOP quântico face a clássico |
| [Verificador Galileo OSNMA](docs/OSNMA.md) | os dados de navegação de que satélites um recetor consegue autenticar criptograficamente, e porque falha uma verificação; o Kshana não concede quaisquer direitos ao abrigo dos IPR do OSNMA ICD da UE (ver o NOTICE na página) |

Os formatos de exportação por extenso: SP3 é Standard Product 3; CCSDS OMM e OEM são as Orbit
Mean-elements and Orbit Ephemeris Messages do Consultative Committee for Space Data
Systems; CZML e KML são as Cesium e Keyhole Markup Languages; STK é o Systems Tool Kit;
SigMF é o Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="A campanha encadeada campaign-jam-spoof-holdover-integrity, uma execução real do motor (semente 20260928): 6 fases (Nominal → Jamming → Spoofing → Holdover → Alarme de integridade → Recuperação) e 18 execuções membro numa grelha de 10 s ao longo de T+01:16:10. Três faixas: erro de tempo do relógio face a uma guarda de 50 ns (pico 62.7 ns), densidade portadora-ruído efetiva face a um piso de 25 dB-Hz (mínimo -12.2 dB-Hz) e nível de proteção vertical face a um limite de alerta de 50 m (pico 135.4 m), com os eventos de alarme da execução: T+00:20:00 alarmes do detetor de spoofing RF (monitores fundidos de consistência, potência e qualidade do sinal); T+00:26:10 alarmes do monitor de spoofing assistido pelo relógio." width="100%">
</picture>

<details>
<summary>Cada capacidade, desenhada a partir de uma execução real: a cascata da banda L, o mapa de cobertura, o sistema solar e uma passagem em órbita terrestre baixa</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="A banda L do GNSS como uma densidade espectral de potência ao longo de 60 s, a partir de uma execução real do tipo spectrum (l-band-waterfall-jamming.toml, semente 7, motor v0.40.0): frequência na horizontal, tempo na vertical, cor para a potência acima do piso de ruído de -202.0 dBW/Hz. Jammers: dispositivo de privacidade chirp (chirp, ligado aos 10 s, desligado aos 40 s); tom CW em L1 (cw, ligado aos 30 s); ruído de banda estreita em L2 (narrowband, ligado aos 45 s). Pior banda GPS L1 C/A: C/N0 efetivo mínimo de 3.2 dB-Hz aos 31 s face a um piso de seguimento de 25 dB-Hz. GPS L1 C/A mínimo 3.2 dB-Hz; Galileo E1 mínimo 4.7 dB-Hz; GPS L2C mínimo 36.9 dB-Hz; GPS L5 mínimo 44.1 dB-Hz; Galileo E5a mínimo 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Satélites visíveis sobre toda a Terra durante um dia, a partir de uma execução real de constellation-design (constellation-multi-gnss-coverage.toml, motor executado por este gerador): 102 satélites (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Cada célula de 10 graus é sombreada pelo número médio de satélites acima da máscara de 10 graus (27.2 a 36.5); os pontos são as amostras do traço no solo do motor, uma por hora por satélite. Disponibilidade global de 100.00 % com PDOP igual ou inferior a 6, PDOP mediano 0.95, média de 31.0 e mínimo de 22 satélites visíveis." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="O sistema solar na época do cenário 2026-09-28T00:00:00, a partir de uma execução real do tipo solar-system (solar-system-tour.toml): o Sol, 9 planetas e o planeta anão Plutão vistos de cima da eclíptica, com distâncias comprimidas logaritmicamente para visualização, com o tempo-luz num só sentido de cada corpo a partir da Terra. Mercúrio 0.47 au, 10.1 minutos-luz, VALIDATED; Vénus 0.73 au, 3.0 minutos-luz, VALIDATED; Marte 1.55 au, 14.0 minutos-luz, VALIDATED; Júpiter 5.30 au, 49.5 minutos-luz, VALIDATED; Saturno 9.44 au, 70.2 minutos-luz, VALIDATED; Úrano 19.44 au, 157.4 minutos-luz, MODELLED; Neptuno 29.88 au, 240.2 minutos-luz, MODELLED; Plutão 35.61 au, 292.2 minutos-luz, MODELLED. Ligações: Marte a Júpiter num só sentido 2193.5 s; Saturno à Terra num só sentido 4212.2 s; Europa a Júpiter num só sentido 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Uma passagem em órbita terrestre baixa (LEO) a partir de uma execução real do tipo leo-pass (leo-pass-iridium.toml, motor executado por este gerador): Iridium-pass a 781 km, banda STL a 1621 MHz, vista por um utilizador aéreo a 50° N 30° W. Acima da máscara de 5° durante 750 s, elevação máxima de 65.0° aos 444 s. A densidade portadora-ruído atinge um pico de 80.5 dB-Hz (mediana 71.3), 34.3 dB acima da mediana GNSS de 46.2 dB-Hz de 8 satélites GPS visíveis (38.2 a 51.1 dB-Hz); o Doppler chega a 35.4 kHz." width="100%">
</picture>

Execute qualquer uma delas com `kshana example <scenario> > s.toml && kshana s.toml`: os cenários
são `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
e `leo-pass-iridium`.

</details>

<details>
<summary>As capacidades marítimas e de interferência, desenhadas a partir de entradas sintéticas incluídas: uma pontuação de confiança, um mapa de interferência com exposição de rota, um fluxo de treino e um pacote de evidências</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Pontuação de confiança ao longo de uma travessia sintética, a partir de uma execução real do motor v0.40.0 sobre examples/maritime-trust (um registo NMEA inventado de um ferry numa rota Tallinn–Helsínquia, 3001 épocas a 1 Hz). Três faixas partilham um eixo temporal. Em cima: a distância entre a posição que o recetor indica e a posição real da embarcação, que se mantém dentro de poucos metros até cerca de 1576 s, quando o arrastamento de posição programado no registo a afasta, enquanto o recetor continua a indicar uma posição válida. Ao meio: a pontuação de confiança de 0 a 100, não calculada durante os primeiros 300 s de calibração, na banda nominal (pelo menos 90) até ao arrastamento, descendo depois pela banda degradada (pelo menos 55) até à banda não fiável. Em baixo: a banda de cada época como uma fita colorida com o seu nome. A pontuação é consultiva. Software de caráter consultivo, não um equipamento de navegação homologado (IEC 61108, IEC 61162): o operador continua a ser responsável pela navegação da embarcação. O registo é inventado para mostrar o formato e os monitores; não é uma medição e nada diz sobre o desempenho de qualquer recetor." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Dois dias sintéticos de mapa de interferência desenhados a partir das amostras incluídas em examples/interference-map/output, cada um com a sua rota sintética e as percentagens de exposição da rota que o motor indica. À esquerda, um dia ADS-B: 1 célula degradada, 6 não degradadas, 4 não avaliadas (tracejadas) e células sem entrada, desenhadas vazias, que não foram observadas. A rota tem 525 km: 11.5% do seu comprimento em células degradadas, 38.3% não degradadas, 9.1% não avaliadas e 41.1% não observadas. À direita, um dia AIS: células assinaladas pelos detetores de círculo e em terra, células não anómalas e células vazias; a rota tem 454 km com 10.5% em células anómalas, 21.2% não anómalas, 0.0% não avaliadas e 68.3% não observadas. ADS-B e AIS são camadas separadas, nunca combinadas. Uma célula assinalada não é uma constatação de interferência, e uma célula sem cor não foi observada, o que não é o mesmo que limpa. Todos os dados são inventados, em pleno Atlântico médio, e não são uma medição." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Fluxo de treino do cenário coastal-drag-off (motor v0.40.0, semente 22, 25 minutos a uma posição por cada 10 s do registo do instrutor). Um mapa mostra a trajetória verdadeira da embarcação e a trajetória que o recetor indica: coincidem até que um arrastamento de posição programado começa aos 421 s; a trajetória indicada afasta-se então da verdadeira enquanto o recetor mantém uma posição válida, e regressa quando o evento termina aos 1140 s. Ao lado, a distância entre as duas trajetórias ao longo do tempo, e a densidade portadora-ruído média que o recetor indica, que sobe para um nível elevado enquanto o evento dura. Dados de treino sintéticos gerados pelo Kshana. Apenas para treino e ensaio: nunca alimente com este fluxo os sistemas de navegação em uso de uma embarcação. Consultivo, não um equipamento de navegação homologado. Software de caráter consultivo, não um equipamento de navegação homologado (IEC 61108, IEC 61162): o operador continua a ser responsável pela navegação da embarcação. As posições, datas e trajetórias são inventadas." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="A estrutura de um pacote de evidências. Um registo de recetor (NMEA, u-blox UBX, RINEX 3 ou um registo Android) e uma janela temporal entram em kshana receiver-trust evidence, que escreve sete ficheiros: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig e um timestamp.tsr opcional. O manifesto regista o SHA-256 do registo completo e de cada ficheiro e uma cadeia de hashes sobre os ficheiros; a assinatura cobre o manifesto. kshana evidence verify verifica a assinatura, o hash de cada ficheiro, a cadeia e que não está presente nenhum ficheiro não listado, e termina com 0 quando verificado, 1 quando algo falhou e 3 quando o signatário não estava fixado. Um pacote é um registo técnico, não um parecer jurídico." width="100%">
</picture>

Os quatro são dados inventados e consultivos: mostram o formato e o comportamento do software, não o desempenho de qualquer recetor ou sistema face a interferência. Execute o primeiro com `kshana receiver-trust examples/maritime-trust/session.toml`, o segundo com `kshana route-exposure` sobre as amostras em `examples/interference-map/`, o terceiro com `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (apenas para treino: nunca o envie para equipamento de navegação em uso) e o quarto como em [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>A tabela completa de capacidades, domínio a domínio</summary>

O pormenor completo domínio a domínio segue-se; para um registo de maturidade por capacidade ver
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) e [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Domínio | Capacidade |
|--------|------------|
| **Órbita e geometria** | Propagação SGP4/SDP4 (validada a 4.12 mm face a todos os 666 vetores AIAA 2006-6753); elementos reais de duas linhas (um instantâneo Celestrak `gps-ops` incluído e datado) ou constelações sintéticas Walker-delta cujos elementos médios realizam a fórmula `i:T/P/F` a menos de 1 km ao longo de uma propagação de 24 h; visibilidade multiconstelação, **diluição da precisão — geométrica, de posição, horizontal, vertical e de tempo (GDOP/PDOP/HDOP/VDOP/TDOP), validada a 1e-6 face a gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), e disponibilidade GNSS; um otimizador de conceção de constelações sem gradiente, dimensionamento do número mínimo de satélites por streets-of-coverage, uma ferramenta de comparação multiconstelação e um **varrimento de conceção** Walker que tabula cobertura / PDOP / tempo de revisita sobre uma grelha planos × satélites e indica as conceções ótimas de Pareto. |
| **Propagador numérico** | Um propagador numérico de **Cowell** (`src/propagator.rs`) que complementa a via analítica SGP4/SDP4, com um modelo de forças hierárquico de **sete perturbações** (`src/forces.rs`): dois corpos + o campo **zonal J2–J6** completo (os coeficientes harmónicos zonais do achatamento terrestre J2 a J6; o gradiente analítico exato do seu potencial perturbador), um **geopotencial harmónico esférico tesseral EGM2008 até grau/ordem 70** opcional (Earth Gravitational Model 2008; `src/gravity_sh.rs`; coeficientes reais da NGA — National Geospatial-Intelligence Agency dos EUA (Estados Unidos) —, recorrência de Legendre normalizada de Holmes–Featherstone, verificada de forma cruzada face às funções de Legendre em forma fechada e à identidade analítica ∇V), gravidade de **terceiro corpo do Sol e da Lua dependente da época** (uma efeméride integrada de baixa precisão, sem kernel DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel), **pressão de radiação solar** (modelo de bala de canhão com uma sombra cónica umbra+penumbra), **arrasto atmosférico** (densidade exponencial por troços de Vallado, atmosfera co-rotativa), a **correção relativista pós-newtoniana de Schwarzschild** e o termo de **arrastamento de referencial de Lense–Thirring** (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, linear no momento angular da Terra, ~1–2 ordens abaixo de Schwarzschild) — conduzido por uma escolha de dois integradores adaptativos (RK4 — Runge–Kutta de quarta ordem — com duplicação de passo ou o par embebido **Dormand–Prince RK5(4)**). **Validado face ao Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 épocas em LEO (órbita terrestre baixa) + GTO (órbita de transferência geoestacionária), com os níveis de forças conservativas a concordarem no pior caso a **\|Δr\| 0.08 m em 24 h** (`tests/numerical_cowell_propagator_reference.rs`); o nível do arrasto atmosférico é caracterizado à parte (≈ 333 m / 24 h) e as entradas absolutas das efemérides do Sol/Lua e da densidade ficam honestamente **Modelled**. Evidência interna adicional (não validação externa): a órbita não perturbada é verificada face à solução de Kepler exata em variável universal a **menos de um metro em 24 h**, a energia/momento angular conservam-se a ~1e-9, e cada perturbação coincide com uma assinatura em forma fechada deduzida à mão. |
| **Manobras e conceção de trajetórias** | Nós impulsivos de ΔV com propagação de covariância 6×6 (referenciais de erro de execução ECI — inercial centrado na Terra — / LVLH — vertical local, horizontal local), integração de queima finita verificada face à equação do foguetão de **Tsiolkovsky** em < 0.01 %, um solucionador de **Lambert** de uma revolução **Izzo-2015**, um propagador de **Kepler** exato em variável universal e um varrimento **porkchop** (lançamento × chegada) de C3 (energia de lançamento) / V∞ de chegada emitido como grelha de contornos JSON — a camada de simulação de desempenho acima do GMAT/Orekit, com cada saída de Lambert verificada em ciclo completo face à verdade de dois corpos e o mínimo do porkchop verificado face ao piso analítico de Hohmann. |
| **Sistemas de tempo e referenciais** | Escalas IERS com segundos intercalares **UTC / TAI / TT / UT1** (Tempo Universal Coordenado, Tempo Atómico Internacional, Tempo Terrestre e o tempo de rotação da Terra Tempo Universal 1), uma API (interface de programação de aplicações) de data juliana, o **Ângulo de Rotação da Terra** (ERA) IAU-2000 (International Astronomical Union), **TEME ↔ ECEF** baseado em GMST (Tempo Sideral Médio de Greenwich) (equador verdadeiro, equinócio médio ↔ centrado na Terra, fixo à Terra) com referenciais geodésicos WGS-84 (World Geodetic System 1984), precessão IAU 2006 (Fukushima–Williams), **nutação IAU 2000A/2000B** completa, **movimento do polo** IERS e a redução **GCRS↔ITRS IAU 2006/2000A baseada no CIO**, sem equinócio (CIO = Celestial Intermediate Origin) — tudo validado **bit a bit** face aos vetores SOFA/ERFA, e **verificado de forma cruzada e independente face ao ANISE** (a reimplementação em Rust puro do NAIF/SPICE; NAIF = a Navigation and Ancillary Information Facility da NASA, a National Aeronautics and Space Administration dos EUA): o GCRS→ITRS do kshana e o ITRF93 (International Terrestrial Reference Frame 1993) do ANISE a partir do `earth_latest_high_prec.bpc` do JPL, com os mesmos parâmetros de orientação da Terra do IERS fornecidos a ambos, concordam a **≤ 0.86 m no solo / ≤ 3.6 m na órbita GNSS** (máx. 0.028″) em oito épocas de 2020–2023. |
| **Inercial** | INS strapdown de três eixos — atitude em quaterniões, mecanização WGS-84 NED (norte-este-baixo), compensação de coning/sculling e um modelo determinístico de erros da IMU (fator de escala, desalinhamento, sensibilidade a g, quantização, deriva); um **acelerómetro de interferometria de átomos frios a partir de primeiros princípios** (fase de Mach–Zehnder, ruído de projeção quântica, decaimento do contraste, acoplamento de vibrações) que *deduz* o coeficiente de passeio aleatório de velocidade; e um **filtro de partículas** com reamostragem por importância sequencial para navegação sem GPS assistida por mapas (referenciada ao terreno/gravidade). |
| **Alt-PNT (sem GPS)** | Um **modelo de medição de gravímetro** de átomos frios cujo piso de ruído branco (`σ = ASD/√τ`, ASD = densidade espectral de amplitude) é deduzido da física do acelerómetro CAI; um **campo de anomalias gravíticas em harmónicos esféricos** de baixo grau e totalmente normalizado (verificado face às funções de Legendre em forma fechada e a uma anomalia de termo único deduzida à mão) mais mascons sintéticos; o **kernel de síntese de funcionais gravíticos** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — o "leitor de mapas" contra o qual um navegador assistido por gravidade faz a correspondência — é validado face à **norma de gravidade normal GRS80** (Geodetic Reference System 1980), reproduzindo a gravidade normal de Somigliana em forma fechada e os γ_e / γ_p publicados a **3.5e-12** e produzindo um mapa de perturbações fisicamente limitado a partir do campo real **EGM2008** do ICGEM (International Centre for Global Earth Models) (RMS — valor quadrático médio — ≈ 26 mGal, máx. ≈ 89 mGal com g/o 70; `tests/icgem_gravity_reference.rs`); e um **filtro de partículas de correspondência com mapas gravíticos** que recupera uma trajetória sem GPS a partir da sequência de anomalias que atravessa. Estende-se à **navegação referenciada ao terreno** (TERCOM/SITAN — correspondência de contornos do terreno / Sandia Inertial Terrain-Aided Navigation — face a um DEM (modelo digital de elevação) SRTM (Shuttle Radar Topography Mission) `.hgt`, `src/altpnt/terrain.rs`), a um **campo geomagnético principal IGRF-14** (International Geomagnetic Reference Field de 14.ª geração) até grau/ordem 13 (`src/igrf.rs`, verificado face à forma fechada do dipolo inclinado e a diferenças finitas de ∇V), e a um navegador **combinado gravidade + magnético + terreno** que funde os três canais escalares num único filtro de partículas (a informação é aditiva — nenhum canal piora a posição). Um **benchmark de 60 minutos sem GPS** (uma interrupção de ~700 km / uma hora em que a solução inercial deriva até ~70 km) é recuperado até **~145 m (< 500 m)** por um correspondedor hierárquico do grosseiro para o fino — o alvo *Quantum Wayfarer* do ESA NAVISP (Navigation Innovation and Support Programme). |
| **Fusão** | EKF (filtro de Kalman estendido) de estado de erro GNSS/INS de 15 estados fracamente acoplado com realimentação em malha fechada (o pacote `gnss-ins`); uma atualização de pseudodistância **fortemente acoplada** que continua a corrigir com menos de quatro satélites; um filtro acoplado **relógio + posição**; um estimador de **Kalman unscented (pontos sigma)** geral para medições fortemente não lineares; um **navegador UKF** GNSS/INS fortemente acoplado (pseudodistância + Doppler) cuja propagação orbital pelo modelo de forças é verificada quanto à autoconsistência a **0.77 m RMS** ao longo de uma passagem LEO curva de 30 minutos que inclui uma interrupção GNSS de 120 segundos (um valor de consistência do filtro, não uma validação por referência externa — este navegador fica MODELLED); e um **UKF GNSS/INS fortemente acoplado de 17 estados** completo (posição, velocidade, erro de atitude, bias do acelerómetro e do giroscópio, bias e deriva do relógio) cuja **navegação estimada quântica CAI** atravessa uma interrupção de 120 segundos com o passeio aleatório de velocidade deduzido do acelerómetro de átomos frios. |
| **Determinação de órbita** | Recuperação de um estado orbital `[r, v]` a partir do seguimento de distâncias por estações terrestres, compondo o modelo de forças dois corpos + J2 e o integrador RK4 com um corretor **em lote de Gauss–Newton** (`determine_orbit_batch`, abaixo do metro / mm·s⁻¹ a partir de distâncias sem ruído, ~2 m com um piso de ruído de 5 m) e uma variante **sequencial** com filtro unscented (`determine_orbit_sequential`). |
| **Observabilidade e teoria da estimação** | Uma camada geral e reutilizável de **informação de Fisher / Cramér–Rao** (`src/fim.rs`): a matriz de informação M = HᵀWH, o **limite inferior de Cramér–Rao**, a **característica e o espaço nulo do defeito de datum** da observabilidade (pseudo-inversa de Moore–Penrose) e escalares de conceção experimental **D/A/E/T-ótimos** a partir de um solucionador de valores próprios de Jacobi simétrico. **Validado** — valores próprios face a `numpy.linalg.eigh`, a covariância CRLB face a σ²(XᵀX)⁻¹ via `numpy.linalg.inv`, e o DOP GNSS a partir da matriz de informação, todos coincidentes a **1e-9** (`tests/fim_observability_reference.rs`), e adicionalmente verificados de forma cruzada face aos limites em forma fechada de **Kay (1993)** com obtenção do CRLB por Monte-Carlo. Sustenta o motor de DOP, o CRLB da geolocalização passiva e o **teorema de observabilidade** da estação lunar absoluta (abaixo). |
| **Lunar e cislunar** | Um propagador do **problema restrito circular de três corpos (CR3BP)** Terra–Lua no referencial em rotação — constante de Jacobi conservada e os cinco pontos de Lagrange (`src/cr3bp.rs`) — agora com uma **matriz de transição de estado (STM) 6×6 e um corretor diferencial de tiro simples** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`) que produz órbitas **halo / NRHO** (órbita halo quase retilínea) genuinamente periódicas: a STM é validada face a diferenças finitas, as órbitas corrigidas fecham à precisão da máquina, e semear com o estado de apolúnio publicado reproduz a **NRHO 9:2 sul de L2** (L2 = o segundo ponto de Lagrange Terra–Lua; a órbita do Gateway) com período ≈ 6.57 d / perilúnio ≈ 3,250 km, consistente com os ≈ 6.56 d / ≈ 3,370 km publicados (uma solução CR3BP — circular, sem Sol —, **não** validada face a uma efeméride real do LANS (Lunar Augmented Navigation Service)/Gateway; a transformação selenocêntrica MCI/MCMF (inercial centrado na Lua / centrado na Lua, fixo à Lua) da órbita corrigida é um trabalho subsequente); mais a geometria PNT cislunar **LunaNet / LNIS** (LunaNet Interoperability Specification) (redução MCI↔MCMF, coordenadas selenográficas) com uma passagem **ARAIM no polo sul lunar** que expõe honestamente a lacuna de integridade: um σ_URE (erro de distância do utilizador) de ~30 m leva o nível de proteção bem acima de um limite de alerta de 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); e um **aumento do DOP por balizas de superfície** (`src/lunar_beacon.rs`) que mostra como algumas balizas de telemetria de superfície levantadas fornecem as linhas de visada de baixa elevação e amplo azimute que falta a um conjunto apenas orbital, todo por cima — colapsando o GDOP mal condicionado do polo sul e, por um orçamento de erro em raiz da soma dos quadrados, a exatidão de posição realizada em metros (reutilizando o kernel de DOP validado com gnss_lib_py e a forma fechada da visibilidade sobre um horizonte sem atmosfera; a análise da diluição da precisão está descrita em [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Conjunto PNT lunar** | Um conjunto de navegação lunar/cislunar sobre o núcleo CR3BP, cada um um `kind` executável: **Tempo Coordenado Lunar** (`lunar-time-offset`, `src/lunar_time.rs` — a taxa secular LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL = a sua forma francesa, Temps-Coordonnée Lunaire) a partir da diferença de autopotencial + termo cinético, apresentada com a banda publicada de 56–59 µs/dia); um observável de atraso **VLBI lunar** (interferometria de muito longa base) geodésico (`lunar-vlbi`, `src/lunar_vlbi.rs` — um atraso + taxa de diferença de duas distâncias em campo próximo com base terrestre, verificado de forma cruzada face ao Δ-DOR (telemetria diferencial num só sentido delta) de onda plana do mesmo código no limite de campo distante, com derivadas parciais verificadas por diferenças finitas); um estimador em lote **conjunto multitécnica de OD + relógio** (`lunar-joint-od-clock`, `src/lunar_combination.rs` — um ajuste de Gauss–Newton que funde VLBI + distâncias locais lunares + distâncias entre satélites) com um resultado de **observabilidade por informação de Fisher**: a telemetria interna, sozinha, deixa um **defeito de datum** de corpo rígido com seis graus de liberdade, pelo que a posição *absoluta* de uma estação de superfície não é observável até ser acrescentada uma ligação ao referencial terrestre — um atraso **VLBI** com base terrestre *restaura* a observabilidade para uma constelação esparsa e *aperta* o limite de Cramér–Rao para uma rica, com o datum absoluto a fechar com **três** estações terrestres não colineares (o resultado de observabilidade descrito em [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **realização do referencial** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — um ajuste de datum de Helmert de 7 parâmetros + ligação à orientação IAU 2015 WGCCRE — WGCCRE = o IAU Working Group on Cartographic Coordinates and Rotational Elements); uma análise de **volume de serviço da classe Moonlight/LCNS** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / cobertura / disponibilidade + uma envolvente HPL/VPL (nível de proteção horizontal/vertical) ARAIM lunar generalizada, reutilizando o kernel de DOP validado com gnss_lib_py e a maquinaria LunaNet σ_URE≈30 m); **PNT diferencial lunar** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — um análogo lunar do GNSS diferencial / sistema de aumento baseado em satélites (SBAS): cancelamento exato do relógio em modo comum + descorrelação espacial de primeira ordem em função da linha de base, reutilizando o nível de proteção SBAS DO-229E — sendo o DO-229E a norma de desempenho operacional mínimo da RTCA (antiga Radio Technical Commission for Aeronautics) para recetores SBAS); e uma **exportação de interoperabilidade alinhada com LunaNet/IOAG** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + ciclo completo da escala de tempo lunar no referencial do corpo lunar IAU 2015, envolvido no envelope KIF). Os níveis de evidência de cada parte estão na [matriz de verificação](docs/VERIFICATION-MATRIX.md): o Tempo Coordenado Lunar, o estimador conjunto de OD + relógio, a realização do referencial e a geometria do volume de serviço são **VALIDATED** (cada um face à referência independente que a sua linha nomeia, tal como a via do kernel do atraso VLBI); o observável VLBI, o resultado de observabilidade do defeito de datum, o PNT diferencial e a exportação de interoperabilidade são **MODELLED**. Os parâmetros são valores **ilustrativos de fontes públicas** — **não** validados face a seguimento real VLBI/Gateway, **sem** afiliação nem aval de qualquer agência, sem afirmação de TRL (nível de maturidade tecnológica) / herança. |
| **PNT no espaço profundo e em Marte** | Um **motor de navegação radiométrica** aberto: tempo-luz iterativo + atraso relativista de **Shapiro**, **Doppler e distância** em dois/um/três sentidos (dois troços de Moyer), razões de retorno coerentes do transponder, telemetria regenerativa/PN (pseudorruído) (CCSDS 414, a norma de telemetria por pseudorruído) e **Δ-DOR** no plano do céu (CCSDS 506, a norma Delta-DOR), com meios de plasma solar/troposfera/ionosfera; leitura + emissão de mensagens de dados de seguimento **CCSDS-TDM (503)**; um **Square-Root Information Filter de dinâmica reduzida** (acelerações empíricas RTN — radial, transversal, normal — + um relógio de bordo de 3 estados + arrasto atmosférico de Marte) que faz **determinação de órbita Mars-LMO a ≈ 0.2 m** num ciclo fechado sintético; um estimador conjunto de **fusão num sentido + dois sentidos**; um núcleo de dinâmica multicorpo (`Body{μ, re, zonals, gravity, IAU-pole}`, gravidade Mars GMM-3 (Goddard Mars Model 3), um referencial de Marte fixo ao corpo IAU, uma interface `EphemerisProvider` substituível, datas julianas em duas partes + TT↔TDB (Tempo Dinâmico Baricêntrico)); e o cenário de PNT por retransmissão **`mars-pnt`** (uma constelação de retransmissão areostacionária MARCONI) com um **simulador de desempenho GSE** de ponta a ponta (GSE = equipamento de apoio no solo) (geometria → orçamento de ligação → observáveis → SRIF → covariância). **Validado por simulação** (valores de mérito de covariância / ciclo fechado); a dinâmica de Marte centrada no Sol é verificada de forma cruzada face ao **DE440** do JPL (137 m num arco de 1 dia, `xval/anise-mars-od`). A validação com dados reais de seguimento DSN/ESTRACK está no roteiro. |
| **Sistema solar e PNT em qualquer corpo** | Uma **efeméride de todo o sistema solar** sem kernels (`src/ephem.rs`, `src/ephem_provider.rs`): cada planeta a partir dos **elementos keplerianos de Standish** do JPL (Tabela 1, 1800–2050 d.C.; Tabelas 2a/2b, 3000 a.C.–3000 d.C.) com o erro nominal publicado de cada planeta, a Terra e a Lua separadas pela série lunar, e Fobos, Deimos, Io, Europa, Ganimedes, Calisto e Titã a partir dos elementos médios do JPL e do modelo de rotação da IAU (International Astronomical Union); **qualquer corpo relativamente a qualquer outro** no ICRF (International Celestial Reference Frame). `Body` contém agora **GM (parâmetro gravitacional), raios, J2 (o segundo harmónico zonal) quando publicado e o polo e meridiano principal IAU para dezoito corpos**. O tipo **`solar-system`** indica posições, velocidades, constantes, **tempo-luz e distância num/dois sentidos** entre quaisquer dois corpos (o solucionador radiométrico de tempo-luz existente, com o atraso de Shapiro solar) e um traço de órbita por corpo — o suficiente para desenhar um sistema solar interativo; o tipo **`body-pnt`** posiciona um orbitador ou um módulo de aterragem **em torno de qualquer corpo** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) com uma constelação Walker local, a maquinaria de diluição da precisão e de Gauss–Newton, e uma distância de espaço profundo a partir da Terra. **Validado** face ao JPL Horizons (DE441, JPL Development Ephemeris 441): Mercúrio–Saturno e a Terra a partir da Tabela 1 dentro do dobro do erro nominal (pior 1.87×), os oito planetas a partir das Tabelas 2a/2b (pior 1.71×) e o tempo-luz Terra–Marte/Júpiter. **Modelled**: Úrano e Neptuno a partir da Tabela 1 (2.0× e 5.2× o erro declarado face ao DE441), Plutão, as luas e os resultados de navegação de `body-pnt`. |
| **PNT fundido MEO + LEO** | `src/leo_fusion/`: posicionamento, navegação e temporização LEO independentes do sistema sobre qualquer constelação (camadas Walker, conjuntos de elementos, predefinições GNSS) e qualquer sinal (portadora, taxa de chip, envolvente de C/N0, erro de distância do sinal no espaço), com predefinições opcionais num só ficheiro que indicam as suas fontes (Xona Pulsar X1/X5, Iridium STL, sinais de oportunidade Starlink, CentiSpace, um sistema representativo em banda C, o modelo de efemérides de relógio zero ATOMIC). **`leo-pvt`**: **posicionamento Doppler** em lote a partir da taxa de variação da distância (um e vários satélites, estados de deriva do relógio e de velocidade, geometria ao longo/transversal de uma passagem e a solução espelho), **mínimos quadrados ponderados conjuntos GNSS + LEO** com biases entre sistemas por sistema e sigmas por sinal fornecidos pelo utilizador, o DOP em função do número de satélites LEO, cobertura **polar e ártica**, e **transferência de tempo LEO para UTC** em função do C/N0 e do oscilador. **`leo-ppp`**: um EKF (filtro de Kalman estendido) PPP (posicionamento preciso por ponto) flutuante só com GNSS e com LEO, o seu tempo de convergência e um teste de consistência NEES qui-quadrado. **`ntn-positioning`**: posicionamento em rede não terrestre 5G a partir do limite de Cramér-Rao da largura de banda. **Validado**: a envolvente Doppler LEO face aos valores publicados da Iridium e da Xona. **Modelled**: o resto, com a tendência PPP comparada com Li et al. (2019) — ver [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Integridade** | RAIM — monitorização autónoma da integridade pelo recetor — instantâneo e por separação de soluções (estilo ARAIM), com níveis de proteção horizontal/vertical (HPL/VPL), deteção e exclusão de falhas e diagramas de integridade de Stanford; um nível de proteção explícito com orçamento de risco de integridade por **separação de soluções com múltiplas hipóteses (MHSS)**, incluindo o **modo de falha de constelação inteira dupla/multiconstelação** (ARAIM da UE (União Europeia) / DO-316, a norma de desempenho da RTCA para equipamento GPS de bordo com aumento baseado na aeronave), exercitado num instantâneo real GPS + Galileo (`scenarios/araim-gps-galileo.toml`). O nível de proteção aplica a projeção unilateral do **bias nominal** `b_k = Σ_i|s_i|·b_nom` por modo de falha e o sigma de **integridade** σ_URA (exatidão de distância do utilizador; distinto do σ_URE de exatidão, erro de distância do utilizador) da Integrity Support Message — ver [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). O kernel de deteção (os limiares χ²/χ² não central/normal e os multiplicadores K) é **validado externamente face ao SciPy** em 171 casos (`tests/raim_reference.rs`); a geometria reutiliza o kernel de DOP validado com gnss_lib_py. A própria *atribuição do orçamento* de risco de integridade ARAIM MHSS não tem referência numérica publicada e fica honestamente Modelled. |
| **Aumento (SBAS)** | **Níveis de proteção SBAS / WAAS** (WAAS = o Wide Area Augmentation System) na forma de mínimos quadrados ponderados do DO-229E (fatores K de aproximação de precisão e em rota) e a combinação **livre de ionosfera de dupla frequência L1/L5** (sendo L1 e L5 duas bandas de sinais civis GPS; IS-GPS-705, a especificação de interface GPS para o sinal L5, γ₁₅ ≈ 1.793) que sustenta o DO-316 — `src/sbas.rs`. O algoritmo do nível de proteção é **validado externamente face ao fork RTKLIB SBAS-PL** (RTKLIB = a biblioteca aberta de posicionamento cinemático em tempo real; PL = nível de proteção) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — a revisão anterior do DO-229 — App. J) executado sobre **dados reais EGNOS** (European Geostationary Navigation Overlay Service), reproduzindo o seu HPL a < 2e-3 m (`tests/sbas_reference.rs`); o gLAB (o conjunto de ferramentas GNSS Laboratory) v6.0.0 confirmou a mesma convenção. |
| **Relógio e temporização** | Holdover de Kalman de dois estados (covariância na forma de Joseph, saúde da consistência NIS/NEES — inovação normalizada ao quadrado / erro de estimação normalizado ao quadrado); estabilidade da família de Allan (ADEV / MDEV / TDEV / HDEV / MTIE — desvio de Allan, de Allan modificado, de tempo e de Hadamard, e erro máximo do intervalo de tempo) com intervalos de confiança específicos do tipo de ruído e um **ajuste completo de lei de potência de cinco coeficientes IEEE-1139** (IEEE Std 1139, as definições de metrologia de frequência e tempo do Institute of Electrical and Electronics Engineers) — os estimadores são validados em hardware real face ao **Stable32**: um **padrão primário de césio 5071A real face a um maser de hidrogénio** (556,990 amostras de fase, 16 fatores de média, OADEV/OHDEV — desvio de Allan/Hadamard sobreposto — a 1e-3; `tests/cs5071a_reference.rs`) e a série de regressão **canónica Stable32 PHASE.DAT** (139 fatores de média, OADEV/MDEV/TDEV a 1e-3; `tests/phasedat_reference.rs`); os estimadores ADEV/MDEV/TDEV e a métrica de wander de telecomunicações **MTIE** são adicionalmente verificados de forma cruzada face à **biblioteca independente allantools 2024.06** a **< 1e-9** na série NIST SP 1065 (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); correções geométricas (Sagnac, vista comum GNSS); e os métodos operacionais de transferência — **TWSTFT** (transferência de tempo e frequência por satélite em dois sentidos) com a forma fechada de Sagnac do BIPM (Bureau Internacional de Pesos e Medidas), **vista comum GNSS**, transferência de tempo livre de ionosfera **PPP** (posicionamento preciso por ponto), uma ligação **ótica** em espaço livre com cintilação por turbulência e uma **escala de tempo de conjunto de relógios (papel)** por variância inversa abaixo do melhor relógio contribuinte. Uma **calculadora de holdover de relógio sem GNSS** (`src/holdover.rs`) expõe o crescimento em forma fechada de van-Loan do erro em roda livre como inversão *holdover até ao limiar* — durante quanto tempo um relógio funciona livremente antes de o seu erro de temporização exceder o orçamento — em classes representativas de relógios clássicos e quânticos; **modelled** (verificado de forma cruzada face à recursão de covariância `clock_state` em vários passos), e honesto quanto ao facto de, para um relógio muito estável, o holdover até um limiar apertado ser fixado pelo piso de ruído de tau longo *pressuposto*, não pelo ADEV citado. Um **Timing Protection Level condicional** (`src/tpl.rs`) estende o holdover ao spoofing: um limite do erro de tempo *não detetado*, dada uma verificação cruzada independente, que compõe um piso de monitor de k-sigma, a variância em roda livre de van-Loan ao longo da latência de deteção e um tempo até ao alarme CUSUM (soma cumulativa). Calibrado num spoof real gravado (JammerTest 2024) e reprodutível via `cargo run --example tpl_jammertest`; composição **MODELLED** (sem orçamento de risco de integridade por hora), condicional à deteção — não existe um limite *incondicional* finito. |
| **Domínio das medições GNSS** | Síntese direta de pseudodistância / Doppler com ionosfera **Klobuchar** (difundida) e **IONEX / grelha TEC** (IONosphere map EXchange format / conteúdo eletrónico total; medida) — incluindo um leitor de ficheiros IONEX, interpolação temporal entre mapas e o mapeamento de obliquidade inclinada em camada fina —, troposfera **Saastamoinen + Niell** e RAIM instantâneo (HPL/VPL). |
| **Resiliência** | **Jamming** por orçamento de ligação (J/S → C/N₀ efetivo → perda de seguimento — razão jammer-sinal, razão portadora-densidade de ruído — com o fator de separação espetral antijamming `Q` agora **deduzido dos espetros reais de potência do sinal e do jammer** via `src/navsignal.rs` — `Q = 1/(R_c·κ)`, verificado de forma cruzada na CI face à constante representativa anterior); um **detetor estocástico de spoofing de tempo** (teste de energia de Neyman–Pearson / χ²₁ com P_fa/P_md em forma fechada e por Monte-Carlo e um valor de mérito (FoM) de Segurança de 1 − P_md); e um **detetor de spoofing multicamada** que funde um teste de paridade de consistência RAIM (com o ponto cego de modo comum modelado honestamente), um monitor RF de potência AGC (controlo automático de ganho) e um monitor de qualidade do sinal (SQM — monitorização da qualidade do sinal, early-minus-late); e um **orçamento de erro de navegação estimada inercial quântica** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`) que compõe o passeio aleatório de velocidade de ruído branco do interferómetro de átomos frios com o bias residual (verificado de forma cruzada face ao integrador independente `AccelModel`) e o erro de fator de escala num valor de deriva de posição ao longo do holdover — o gémeo inercial do holdover do relógio. Um **motor de pontuação de resiliência alinhado com enquadramentos** (`src/resilience/`) mapeia o comportamento simulado de uma arquitetura em subpontuações por dimensão nas sete categorias de resiliência próprias do Kshana (não termos do DHS), alinhadas com o Resilient PNT Conformance Framework do Department of Homeland Security dos EUA, e depois estuda a **estabilidade da decisão** de qualquer pontuação composta única ou Nível de maturidade sob um simplex de ponderação de Dirichlet e um conjunto de cinco ameaças — instabilidade de ordenação de Kendall-τ, taxa de troca do primeiro classificado e **colapso da diversidade** em modo comum (Hill-N2), com um relatório de garantia com hash de integridade (35 testes de referência deduzidos à mão). Reprodutível via `cargo run --example resilience_report`; arquiteturas sintéticas **MODELLED**, uma autoavaliação alinhada com o RPCF v2.0, **não** uma certificação. Ver [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Geolocalização RF passiva** | **Geolocalização de emissores TDOA/FDOA** (diferença de tempo/frequência de chegada; `src/geolocation.rs`) — localizar uma fonte de jamming ou spoofing (ou uma fonte oportunista para PNT inverso) a partir de hiperboloides de **diferença de tempo de chegada** numa rede de recetores, resolvidos por mínimos quadrados de Gauss–Newton; acrescentar a **diferença de frequência de chegada** com recetores em movimento recupera em conjunto a posição *e* a velocidade do emissor, com o limite de **Cramér–Rao** da covariância de posição deduzido da geometria da rede. **MODELLED** (referências de consistência interna: ciclos completos direto→inverso, a identidade J·CRLB = I, monotonia do GDOP e o estimador a atingir o seu próprio CRLB em Monte-Carlo) — um modelo de fonte pontual em linha de visada, sem termos de multipercurso / NLOS (sem linha de visada), bias do relógio do recetor ou refração. |
| **Sinal de navegação e seguimento de código** | O **nível do sinal** entre o orçamento de ligação e o domínio das medições (`src/navsignal.rs`): **densidades espetrais de potência** (PSD) de área unitária para **BPSK-R(n)** (modulação por desvio de fase binária com chips retangulares) e **sine-BOC(m,n)** (portadora com desvio binário); o **coeficiente de separação espetral** (SSC) κ = ∫ G_s·G_i df, que **deduz o `Q` antijamming** que o modelo de jamming usa (`Q = 1/(R_c·κ)`) a partir dos espetros reais do sinal/jammer em vez de uma constante representativa; a **largura de banda RMS (de Gabor)** (BOC > BPSK — a medida de informação de distância / Cramér–Rao); o **jitter de ruído térmico do seguimento de código DLL early–late coerente** (DLL = malha de seguimento de atraso; Kaplan & Hegarty; ~abaixo do metro para C/A — o código GPS coarse/acquisition — a 45 dB-Hz); e a **envolvente de erro de multipercurso** (EML coerente, early-minus-late — supressão por correlador estreito). Validado face a âncoras em forma fechada (SSC próprio BPSK = 2/(3·R_c), PSD de área unitária, jitter C/A abaixo do metro). Isto é análise de **desempenho** do sinal, **não** conceção de hardware de antena / carga útil RF (o papel de um parceiro de carga útil). |
| **Interoperabilidade** | Ingestão de efemérides difundidas multi-GNSS **RINEX-3** (GPS, Galileo, QZSS — o Quasi-Zenith Satellite System do Japão —, BeiDou MEO/IGSO — órbita terrestre média / órbita geossíncrona inclinada — via IS-GPS-200, a especificação de interface GPS; GLONASS, o Global Navigation Satellite System da Rússia, via vetor de estado RK4 PZ-90 — o datum russo Parametry Zemli 1990) utilizável como fonte de constelação (RINEX à entrada, geometria PNT à saída); um leitor de observações **RINEX-3** (pseudodistância, fase da portadora, Doppler, intensidade do sinal; espera-se que o formato de observações 4.00 seja lido, mas não está testado, e os ficheiros de navegação RINEX 4 são recusados pelo nome em vez de mal descodificados) que agora **alimenta um solucionador de posicionamento por ponto simples (SPP)** (`pvt`) — observações de código reais à entrada, uma **posição do recetor** real à saída, validado com dados IGS; um leitor/escritor de efemérides precisas **SP3-c/d** com interpolação de Lagrange de 9.ª ordem; e exportação **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) para ferramentas de dinâmica de voo (GMAT, Orekit, STK — Systems Tool Kit); e leitura + emissão de mensagens de dados de seguimento **CCSDS-TDM (503)** para seguimento radiométrico no espaço profundo. |
| **Análise de missão (engenharia de sistemas)** | Orçamentos de conceção de missão de primeira ordem, cada um um tipo executável: **geometria de lançamento e subida** de dois corpos (`launch-window` — azimute de lançamento `sin Az = cos i/cos lat`, inclinação mínima, bónus da rotação terrestre, Δv de mudança de plano em dogleg, oportunidades diárias; `src/launch.rs`); um **corredor de reentrada balística de Allen–Eggers** (`reentry` — desaceleração máxima, velocidade/altitude no pico de g, velocidade no pico de aquecimento; `src/reentry.rs`); **geometria de cobertura de observação da Terra** (`eo-coverage` — faixa / GSD (distância de amostragem no solo) no nadir / acesso fora do nadir / revisita via o triângulo espacial do SMAD (*Space Mission Analysis and Design*); `src/eo_payload.rs`); um **orçamento de erro de atitude e apontamento 3-DOF** (três graus de liberdade; `attitude-budget` — binário de gradiente gravítico no pior caso + orçamento de apontamento RSS (raiz da soma dos quadrados); `src/attitude_budget.rs`); **previsão de passagens sobre estações terrestres** (`passes` — AOS/TCA/LOS, aquisição do sinal / tempo de maior aproximação / perda do sinal, elevação máxima, tempo de acesso; `src/passes.rs`); e um **orçamento de ligação num sentido** segundo a equação de ligação CCSDS 401 / DSN 810-005 (a norma de radiofrequência e modulação do CCSDS / o manual de conceção de ligações da Deep Space Network; `link-budget` — FSPL (perda de percurso em espaço livre), C/N₀, Eb/N₀ (razão energia por bit / densidade de ruído), margem, fecho; `src/linkbudget.rs`). Orçamentos analíticos de primeira ordem **MODELLED** — a camada anterior ao hardware abaixo do STK/GMAT/Basilisk, não um substituto 6-DoF ou radiométrico. |
| **Análise de decisão e compromissos (MCDA)** | Um conjunto completo de **análise de decisão multicritério** (MCDA) (`src/mcda/`) que abrange as quatro famílias de métodos — agregação de valores (**WSM**, **WPM**, **WASPAS** — modelo de soma ponderada, modelo de produto ponderado, avaliação agregada ponderada soma-produto), distância ao ideal (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), programação de compromisso (**VIKOR**, do sérvio para otimização multicritério e solução de compromisso) e sobreclassificação (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, do francês para eliminação e escolha que exprime a realidade), mais o sistema de razões **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) e o proporcional **COPRAS** (Complex Proportional Assessment) — com ponderação de prioridades por comparação par a par **AHP** (Analytic Hierarchy Process) (Razão de Consistência), uma frente não dominada de **Pareto**, análise de **sensibilidade** aos pesos e pontuação de **utilidade** multiatributo. Os nove agregadores reproduzem as bibliotecas independentes de terceiros **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) e **pyDecision** (ELECTRE I, COPRAS) a **< 1e-9**, e o vetor de prioridades AHP + Razão de Consistência coincidem com a tabela de Índice Aleatório de Saaty e com o solucionador de valores próprios principal SciPy/LAPACK a < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — a camada de decisão sob o motor de estudos de compromissos. |
| **Ambiente espacial** | Um **modelo do ambiente de meteorologia espacial** (`space-weather`, `src/space_weather.rs`): índices de atividade solar (F10.7 / F10.7a centrado de 81 dias — o fluxo rádio solar de 10.7 cm) e geomagnética (Kp, o índice K planetário, com a tabela de definição Kp↔ap — sendo ap a sua amplitude planetária linear), a temperatura exosférica **Jacchia-1971** que determinam (validada face aos mínimos/médios/máximos solares publicados) e a densidade neutra termosférica corrigida pela atividade face à estática em altitude — a dependência da densidade em relação ao ciclo solar que a atmosfera estática USSA76 (US Standard Atmosphere 1976) omite. **MODELLED**: um acoplamento de altura de escala de primeira ordem calibrado, **não** uma atmosfera validada com dados (NRLMSISE — o modelo de exosfera Mass Spectrometer and Incoherent Scatter Radar do US Naval Research Laboratory). |
| **Avaliação e compromissos de IA/ML** | Uma **bancada de avaliação da deteção de perturbações RF** (`impairment-eval`, `src/impairment_eval.rs`): um corpus **sintético** rotulado e fundamentado em parâmetros (nominal / jamming / spoof-time / spoof-position / multipercurso), um mecanismo **ROC/AUC** (característica operacional do recetor / área sob a curva) independente do detetor que pontua qualquer detetor (energy \| agc \| sqm \| parity \| fused) com Pd (probabilidade de deteção) por classe a uma Pfa (probabilidade de falso alarme) alvo, e o **desvio de otimismo** dentro vs fora da distribuição (modo de deslocamento da distribuição). Mais um **estudo de compromissos PNT quântico vs clássico** (`quantum-trade`, `src/quantum_trade.rs`) que quantifica o benefício de holdover de temporização/inercial de um relógio candidato a partir de uma curva de **ADEV medido** face a uma linha de base clássica, com a ressalva do piso de τ longo transportada no artefacto e uma envolvente de resiliência sem GNSS em função do tempo. As **métricas** de avaliação (AUC / confusão / Pd-Pmd, sendo Pmd a probabilidade de deteção falhada) são **validadas com coincidência exata face ao scikit-learn 1.9.0** — incluindo em **telemetria real do ESA OPS-SAT** (o conjunto de dados de deteção de anomalias OPSSAT-AD, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), onde a ROC AUC de Mann–Whitney do Kshana reproduz o `roc_auc_score` do scikit-learn a < 1e-9 na partição de teste reservada e um detetor transparente por contagem de picos separa as anomalias rotuladas com AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`) — e os **kernels** numéricos do motor de compromissos (ajuste ADEV NNLS — mínimos quadrados não negativos —, bandas de consistência χ², Q do relógio de van-Loan) **face ao scipy 1.17.1**; os números de benefício dos dispositivos construídos por cima ficam como características operacionais **MODELLED** — nunca dados de campo/IQ (amostras em fase/quadratura), sem veredicto bom/mau. Partindo da bancada, um **estudo mais aprofundado do desvio de otimismo** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) pontua um painel de **13 detetores** (energy/AGC/SQM/parity mais detetores de regressão logística com semente e MLP — perceptrão multicamada — de uma camada oculta), ajusta **leis de escala** dentro vs fora da distribuição com uma hipótese nula por permutação e aprende um **preditor leave-one-out** da degradação fora da distribuição a partir de estatísticas dentro da distribuição (`cargo run --example optimism_study`). Uma **frente de recetor definido por software** (`src/sdr.rs` — IQ/IF (frequência intermédia) em bruto → derivações early/prompt/late do correlador → SQM) e **adaptadores de ingestão de dados reais** (`src/realdata/` — RINEX, u-blox UBX (o protocolo binário u-blox), GnssLogger, JammerTest, Yunnan, SatGrid) permitem que os mesmos detetores corram sobre gravações fornecidas localmente (nenhum conjunto de dados é incluído no repositório). O **mapa de cruzamento da resiliência quântico vs clássico** sob incerteza de parâmetros (`src/crossover.rs`; `cargo run --bin crossover_study`) regenera os estudos de cruzamento inercial e de relógio por trás das figuras de Resultados. |
| **Demonstrador de PNT com tecnologia quântica** | Três áreas de aplicação executáveis **MODELLED** por trás do motor aberto, cada uma a emitir `TradeEvidence` honesto + um registo de representatividade / lacunas até ao voo (`src/representativeness.rs`): **transferência de tempo quântica fiável** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — um orçamento de ponta a ponta de relógio de rede ótica + ligação fotónica face a CSAC (relógio atómico à escala de chip) + RF em dois sentidos, com um nível de proteção de temporização reutilizado, um FoM de segurança contra ataques de atraso/repetição (1 − P_md) e deteção de anomalias do relógio + latência CUSUM); **navegação quântica sem GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — navegação inercial em roda livre com interferómetro de átomos frios face a um INS de grau de navegação durante uma interrupção GNSS, honesto quanto ao facto de, sem posição externa, o bias do acelerómetro não ser observável, pelo que o erro continua a crescer); e **deteção de falhas/anomalias** de sistemas quânticos (`quantum-anomaly-detect`, `src/quantum_faults.rs` — um catálogo de falhas rotulado com uma ROC AUC com IC (intervalo de confiança) por bootstrap a partir do `eval_stats` validado externamente e uma falha mínima detetável a uma taxa de falsos alarmes fixa). Uma **biblioteca partilhada de modelos de erro de dispositivos quânticos** (`src/quantum_devices.rs`) e um **mecanismo unificado de compromissos quântico vs clássico** (`src/qtrade.rs`) sustentam-nas. Os kernels validados em que assentam (métricas de avaliação face ao scikit-learn, kernels de compromissos face ao scipy) são reutilizados; os números de benefício dos dispositivos construídos por cima ficam **MODELLED** — parâmetros de dispositivo/ligação **ilustrativos de fontes públicas**, modela a *classe*, sem TRL / herança de voo / certificação, sem aval de agências. |
| **Engenharia frugal e impacto na integridade** | Uma lente de **ROI por cobertura** (retorno do investimento) (`src/frugal.rs`) — custo por unidade de cobertura entregue para um estudo de compromissos de arquitetura — e um mapeamento **deteção falhada → impacto na integridade** (`src/integrity_impact.rs`) que converte a taxa de deteções falhadas de um monitor na sua contribuição para o risco de integridade. Orçamentos de apoio à decisão **MODELLED**, aditivos. |
| **Intercâmbio de artefactos** | O **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — um envelope versionado e autodescritivo que envolve um resultado de cenário com o seu tipo, versão do esquema e etiquetas MODELLED/VALIDATED, para que um artefacto guardado se mantenha autodocumentado e os envelopes mais antigos continuem legíveis de forma compatível. |

Cada capacidade é acessível como API Rust, como `kind` de cenário executável, ou ambos.
A maturidade de cada capacidade — *validated*, *runnable* ou *library* — é acompanhada em
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). Uma **matriz de verificação verificada por máquina**
(`src/verification.rs`) apresenta a referência cruzada requisito → módulo → teste → referência → estado,
com invariantes de honestidade testados por testes unitários que só permitem uma etiqueta *validated*
quando uma referência **externa** independente a sustenta — e que registam as
capacidades de hardware/PA (garantia do produto) que o Kshana deliberadamente **não** fornece.

</details>

<details>
<summary>Os quatro pacotes de sensores, tal como publicados pela primeira vez (resultados)</summary>

### Resultados

Cada cenário compara um sensor quântico com o seu equivalente clássico ao longo de uma
interrupção GNSS de ~1.8 h. Os números são reprodutíveis (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="O que os sensores quânticos proporcionam quando o GNSS desaparece, cenário de holdover do relógio: o quântico mantém 6600 s de autonomia face a 2610 s do clássico, com erro de temporização muito menor, e disponibilidade de 100% face a 95.6%" width="88%">
  <br><sub>O que os sensores quânticos proporcionam quando o GNSS desaparece — <code>clock-holdover</code> · semente 42 · desenhado com o motor 0.40.0, e cada valor acima reverificado face ao motor atual em cada compilação por <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

A vantagem **depende da interrupção e da vibração**, com um ponto de equilíbrio explícito a partir do qual o clássico ganha — mostrado honestamente ao longo da escala de maturidade tecnológica (os valores do relógio ótico são alvos de demonstradores em terra; nenhum relógio ótico de estrôncio voou):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Cruzamento quântico vs clássico do holdover do relógio ao longo da escala de maturidade tecnológica, com bandas de confiança" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Mapa de calor da vantagem inercial quântica vs clássica em função da duração da interrupção e da vibração, com um contorno de equilíbrio onde o clássico ganha" width="96%">
  <br><sub>Cruzamento de resiliência quântico vs clássico — escala TRL do holdover do relógio (em cima) · mapa da vantagem inercial com contorno de equilíbrio (em baixo). Regenerável via <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Navegação inercial estimada: erro de posição durante uma interrupção GNSS — o sensor quântico (átomos frios) fica perto da linha da especificação enquanto o sensor de grau de navegação diverge para dezenas de quilómetros" width="80%">
  <br><em>Erro de posição da navegação estimada durante uma interrupção GNSS: o sensor quântico (azul)
  mantém-se plano perto da especificação; o sensor clássico (vermelho) diverge para dezenas de quilómetros.
  Gerado pelo Kshana a partir de <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Pacote | Cenário | Quântico | Clássico |
|------|----------|---------|-----------|
| **1 — Holdover do relógio** | `clock-holdover.toml` (especificação de 20 ns) | o relógio ótico aguenta toda a interrupção | o CSAC viola a especificação a meio da interrupção |
| **2 — Navegação inercial estimada** | `imu-deadreckoning.toml` (especificação de 100 m) | átomos frios: **~41 m**, aguenta toda a interrupção | grau de navegação: viola em **~350 s** → dezenas de km |
| **3 — Transferência de tempo** (ligação ótica entre satélites) | `timetransfer.toml` | ótica: telemetria de **~0.3 mm** | RF (TWSTFT): telemetria de **~150 mm** |
| **4 — Fusão híbrida** (remate) | `hybrid-pnt.toml` | posição+temporização completas durante toda a interrupção | **limitado em posição aos ~350 s** |

O remate mostra a tese da fusão: a transferência de tempo ótica entre satélites mantém bloqueado até
um *relógio* clássico, isolando o sensor *inercial* como o elo fraco do conjunto
clássico — ou seja, inercial quântico + temporização ótica em conjunto.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Holdover do relógio: erro de fase durante uma interrupção GNSS — o relógio ótico fica dentro da especificação de 20 ns durante toda a interrupção enquanto o relógio à escala de chip a viola a meio da interrupção" width="80%">
  <br><em>Holdover do relógio ao longo de uma interrupção GNSS: o relógio ótico (azul) fica dentro da
  especificação de 20 ns durante todo o período em roda livre; o relógio à escala de chip (vermelho) viola-a a meio.
  Gerado pelo Kshana a partir de <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Um cenário adicional, `orbit-gnss-challenged.toml`, deduz a disponibilidade GNSS a partir da
**geometria orbital** em vez de janelas definidas à mão: um veículo espacial dentro da camada
GNSS é propagado face a uma constelação Walker semelhante ao GPS, e o número de satélites visíveis
(linha de visada, ocultação pela Terra, máscara de elevação) define o estado da posição em cada
passo. Ao longo de um dia, o utilizador só tem posição ~59% do tempo; o relógio quântico mantém uma
solução de temporização de 5 ns ao longo de todas as lacunas (disponibilidade **1.0**), o relógio à escala de chip
só **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Órbita com GNSS limitado: erro de temporização do relógio ao longo de um dia para um veículo espacial dentro da camada GNSS, onde as lacunas de cobertura são deduzidas da geometria orbital — o relógio ótico fica dentro da especificação de 5 ns ao longo das lacunas enquanto o relógio à escala de chip a viola" width="80%">
  <br><em>Erro de temporização ao longo de um dia com a disponibilidade GNSS deduzida da geometria orbital: o
  número de satélites visíveis (linha de visada, ocultação pela Terra, máscara de elevação) define o estado
  da posição em cada passo, pelo que o relógio tem de atravessar cada lacuna em roda livre — o relógio ótico mantém a especificação
  de 5 ns enquanto o relógio à escala de chip a viola. Gerado pelo Kshana a partir de
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

A constelação também pode ser dada como conjuntos reais de elementos de duas linhas (TLE). Um TLE *completo*
(linha 1 + linha 2) é propagado com o modelo **SGP4/SDP4** completo — incluindo
o arrasto atmosférico e os termos lunissolares de espaço profundo e de ressonância de 12 h / 24 h que
importam para órbitas GNSS de ~12 h — validado face aos vetores oficiais AIAA 2006-6753
a ≈ 4 mm no pior caso. `scenarios/orbit-sgp4-gps.toml` inclui um **instantâneo real Celestrak
`gps-ops`** da constelação GPS operacional (2021-07-28, 30 satélites)
e exige checksums de TLE válidos — os conjuntos de elementos de duas linhas são dados abertos do catálogo da US
Space Force / 18th Space Defense Squadron, redistribuídos pela Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); atualize com
`scripts/fetch_tles.sh`. Um bloco só com a linha 2 mantém
a propagação analítica de dois corpos (`scenarios/orbit-real-tle.toml`); as duas formas podem
ser misturadas numa constelação. Uma constelação pode igualmente ser construída a partir de um bloco de
registos de **efemérides difundidas GPS RINEX-3** — o formato que um recetor descodifica —
propagados pelo algoritmo de utilizador IS-GPS-200 e passados pela mesma geometria
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>O que é / não é, por extenso</summary>

<a id="what-it-is--is-not"></a>
### O que é / não é

**É:** um motor determinístico, com poucas dependências, que abrange a pilha PNT — geometria
orbital, navegação inercial, fusão GNSS/INS, integridade, relógios e temporização. Executa
um cenário (muitas vezes uma interrupção GNSS), faz evoluir modelos calibrados de erros dos sensores
através do estimador adequado e pontua o resultado face aos valores de mérito
operacionais — emitindo um resultado JSON (JavaScript Object Notation) reprodutível e um gráfico SVG, a partir de uma
biblioteca Rust, de uma interface de linha de comandos (CLI), de uma extensão Python, de um módulo WebAssembly no navegador, de um
**servidor Model Context Protocol (MCP)** para agentes de IA ou de um **plugin para IDE (ambiente de
desenvolvimento integrado) JetBrains**.

**Não é:** hardware de voo, uma conceção de carga útil quântica, um recetor completo de sinais
GNSS, um simulador de sinais de radiofrequência (RF) ou uma bancada hardware-in-the-loop, nem um
produto de aviónica certificado — e não substitui o MATLAB/Simulink, o STK (Systems Tool
Kit) ou o Orekit; fica ao lado deles e troca ficheiros com eles. A fidelidade ao hardware quântico vem de
modelos de erro publicados, não desta ferramenta. A maturidade detalhada de cada
capacidade está documentada em [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Não é (ainda):** um motor de física de interferometria atómica *completo* (a maioria dos sensores quânticos
consome coeficientes publicados de Allan/orçamento de ruído; o acelerómetro CAI (interferómetro de átomos frios) tem uma
camada de primeiros princípios — fase de Mach–Zehnder, ruído de projeção, decaimento do contraste e
acoplamento de vibrações, mais os efeitos sistemáticos de Coriolis e de desvio luminoso — mas os efeitos sistemáticos da frente de onda e
a resolução da ambiguidade das franjas continuam a ser uma camada **P2** (fase 2 do roteiro, a camada de física quântica)
do roteiro, ver [`ROADMAP.md`](ROADMAP.md) e [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
um recetor GNSS certificado ou de hardware (resolve uma posição **PVT** (posição, velocidade e tempo) por ponto simples
a partir de observações de código RINEX (Receiver Independent Exchange Format) reais — validado
com dados reais do IGS (International GNSS Service) — e a sua camada IQ (`kshana iq`, desde 0.31.0)
adquire e segue amostras em banda base gravadas ou geradas em software, como recetor de
análise: não comanda hardware de rádio nem transmite, não é um recetor certificado e não faz
posicionamento por fase da portadora (RTK ou PPP)); nem um conjunto completo de conceção de missões (tem blocos de construção de Lambert / porkchop /
manobras / determinação de órbita, mas é a camada de simulação de desempenho
*acima* do GMAT (General Mission Analysis Tool)/Orekit, não um substituto). Assumir este âmbito é deliberado. Se precisar de orçamentos de erro
de interferómetros de átomos frios a partir de primeiros princípios (p. ex. de grau CARIOQA-PMP — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — ou validação ao estilo X-37B), consulte
o roteiro P2 e [entre em contacto](#support--professional-services) para colaborar.

</details>

### Navegação em órbita terrestre baixa

Os satélites em órbita terrestre baixa (LEO) passam depressa e com sinal forte. O tipo `leo-pnt-chain` segue um
sistema por todas as fases: o sinal, a passagem e a sua ligação, a mensagem de navegação, e
a posição, velocidade e tempo (PVT) fundidos e o posicionamento preciso por ponto (PPP). Cada
fase passa os seus números à seguinte. Ver [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="A cadeia PNT LEO a partir de uma execução real de leo-pnt-chain (leo-pnt-end-to-end.toml): a fase do sinal (generic-l a 1191.795 MHz, piloto seguido a 10.23 Mchip/s) passa à fase da passagem (1080 km, pico de C/N0 seguido de 58.2 dB-Hz), que passa à mensagem de navegação (kepler-rac, ajuste de 300 s, SISRE de representação 0.91 mm RMS, 0.250 m com determinação de órbita), que alimenta a posição fundida (só GNSS 1.60 m RMS 3D, GNSS mais LEO 0.43 m) e o posicionamento preciso por ponto (convergência de 11.5 min só com GNSS, 7.5 min com 240 satélites LEO). São passados 11 valores entre fases." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Todos os tipos de cenário por família

Os tipos de cenário do motor, organizados por famílias. Cada família tem uma página com uma entrada por tipo (a
descrição e os campos do motor, um comando de exemplo, valores principais de uma execução, as linhas da
[matriz de verificação](docs/VERIFICATION-MATRIX.md) que o nomeiam e o gráfico que o próprio motor escreve) e uma
folha de contactos desses gráficos; [`docs/KINDS.md`](docs/KINDS.md) indexa-os a todos. A tabela é escrita por
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) e as páginas por
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), e ambos falham se o motor ganhar um tipo que nenhuma família nomeie.

<!-- generated:kind-families -->
| Família | A que responde | Tipos | Executar um |
|---|---|---|---|
| **[Relógios, temporização e holdover](docs/kinds/clocks-timing-and-holdover.md)** | durante quanto tempo um relógio mantém a hora sem GNSS, e como um sistema de temporização se comporta face às suas máscaras | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Sensores inerciais, fusão e sensores quânticos](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | navegação estimada e fusão de sensores durante uma interrupção GNSS, com sensores clássicos e quânticos | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[PNT alternativo sem GPS](docs/kinds/gps-denied-alternative-pnt.md)** | navegar a partir da gravidade, do terreno e de outros campos quando o GNSS desaparece | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Constelações, cobertura e geometria](docs/kinds/constellations-coverage-and-geometry.md)** | onde estão os satélites, quem os vê e quão boa é a geometria, em torno da Terra, da Lua ou de Marte | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[Medições GNSS, posicionamento e integridade](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudodistâncias, posições, níveis de proteção e o ambiente espacial | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Jamming, spoofing e o espectro](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | como a interferência chega a um recetor e se é detetada | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Navegação em órbita terrestre baixa](docs/kinds/low-earth-orbit-navigation.md)** | uma passagem, uma ligação, uma mensagem de navegação e uma posição fundida, fase a fase | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Lunar e cislunar](docs/kinds/lunar-and-cislunar.md)** | navegação, tempo, referenciais e geodesia na Lua | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Navegação de utilizadores espaciais](docs/kinds/space-user-navigation.md)** | sinais GNSS para veículos espaciais acima, em torno e para lá das órbitas GNSS | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[PNT ótico](docs/kinds/optical-pnt.md)** | ligações óticas através da atmosfera e valores de mérito ótico mais RF | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Análise de missão, ligações e operações espaciais](docs/kinds/mission-analysis-links-and-space-operations.md)** | lançamento, subida, reentrada, atitude, ligações, planeamento de contactos e formatos de ficheiro | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Fios de missão](docs/kinds/mission-threads.md)** | o orçamento de erro de navegação e temporização de uma cadeia de fases do lançamento à reentrada | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Campanhas](docs/kinds/campaigns.md)** | missões encadeadas, varrimentos e conjuntos construídos a partir dos outros tipos | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Todos os comandos

`kshana <scenario.toml>` executa um cenário; todos os outros comandos são subcomandos, e `kshana --help` imprime a utilização
de todos eles. Os comandos são `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (com `live` e
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` e `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) indica a finalidade de cada um, um exemplo verificado e a sua página de documentação.

<a id="every-surface"></a>
### Todas as interfaces

Um motor, os mesmos resultados em todo o lado: a linha de comandos, a biblioteca Rust, Python, JavaScript e WebAssembly,
o servidor MCP com os seus comandos de plugin e skills, o Kshana Studio (todas as páginas correm no navegador, sem instalação, nada é carregado para fora), as
integrações ROS 2, Signal K, OpenCPN, GNSS-SDR e `gnss_lib_py`, os kits de implementação systemd, Docker e Grafana, e o
plugin JetBrains. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) lista-as com a forma de obter cada uma e os nomes de todos
os comandos de plugin, skills e páginas do Studio; [`docs/SURFACES.md`](docs/SURFACES.md) indica, para cada comando e tipo,
que interface o suporta e quais não, com a razão.

<a id="how-a-run-works"></a>
## Como funciona uma execução

Um cenário é um ficheiro TOML (Tom's Obvious, Minimal Language): um tipo, uma semente e os
parâmetros. O motor executa-o e escreve o resultado, um gráfico e um relatório ao lado dele, e
as exportações que pedir.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Como decorre uma execução. Um ficheiro TOML de cenário (um tipo, uma semente e os seus parâmetros) entra no motor, kshana 0.40.0, através do despacho api::run_toml sobre 92 tipos de cenário, determinístico a partir do cenário, da semente e da versão do motor. O motor escreve result.json, chart.svg, report.html e report.json, um table.csv para os tipos que o definem e, a pedido, exportações SP3, CCSDS OMM e OEM, CZML, KML, GeoJSON, STK e SigMF; um conjunto escreve study.json e study.html. Esses ficheiros alimentam o Kshana Studio no navegador, um assistente de IA através do servidor kshana-mcp, e a integração contínua." width="100%">
</picture>

Este cenário incluído dura 2 h: 10 min de GNSS e depois cerca de 1.8 h sem GNSS. Pergunta
durante quanto tempo um relógio ótico de rede de estrôncio e um relógio atómico à escala de chip (CSAC) mantêm cada um
a hora dentro de 20 ns.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

O relógio ótico mantém o orçamento de 20 ns durante toda a interrupção de 6600 s; o CSAC mantém-no durante
2610 s, e está dentro do orçamento em 95.6% da execução face a 100% para o relógio ótico.
`kshana example` lista todos os cenários incluídos.

<a id="missions"></a>
## Missões

Dez setores fazem dez perguntas diferentes ao mesmo motor. Cada um tem cenários incluídos por onde
começar.

| Setor | Começar por |
|---|---|
| Defesa e segurança | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Espaço, órbita terrestre | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Lua, Marte e espaço profundo | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Aviação e drones | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Marítimo | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Rodoviário | `automotive-urban-canyon` |
| Ferroviário | `rail-tunnel-coast` |
| Infraestruturas críticas e temporização | `clock-holdover`, `clock-ensemble` |
| Telecomunicações e 5G (a quinta geração de redes móveis) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Ciência e investigação | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>A pergunta que cada setor faz</summary>

<br>

| Setor | A pergunta que faz | Começar por |
|---|---|---|
| **Defesa e segurança** | Durante quanto tempo a nossa navegação e temporização se mantêm fiáveis sob jamming e spoofing, e que camadas nos mantêm dentro da especificação? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Espaço: órbita terrestre** | O meu veículo espacial vê satélites de navegação suficientes, durante quanto tempo o seu relógio mantém a hora entre posições, e o que acrescentaria uma camada de navegação em órbita baixa? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Lunar e espaço profundo** | Um módulo de aterragem, rover ou orbitador na Lua, em Marte ou mais longe obterá uma posição e uma hora fiáveis? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Aviação e drones** | Depois de um jammer retirar o GNSS, durante quanto tempo o meu sistema de aeronave não tripulada (UAS) se mantém dentro do seu orçamento de posição, e está a integridade disponível na minha rota? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Marítimo** | Até onde sobre a água chega um jammer, seria detetado um desvio de posição, e durante quanto tempo um navio consegue navegar em roda livre até ao porto? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Rodoviário e automóvel** | Quanto deriva um carro sob um viaduto ou ao passar por um jammer na berma da estrada? | `automotive-urban-canyon` |
| **Ferroviário** | Quantos segundos depois de entrar num túnel consegue um comboio ainda saber em que via está? | `rail-tunnel-coast` |
| **Infraestruturas críticas e temporização** | Se a hora GNSS se perder ou for alvo de spoofing, durante quanto tempo uma rede elétrica, uma plataforma de negociação ou um centro de dados mantêm uma hora rastreável? | `clock-holdover`, `clock-ensemble` |
| **Telecomunicações e 5G** | Se a referência de tempo GNSS se perder, o relógio da minha rede mantém-se dentro das máscaras ITU-T, e durante quanto tempo? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Ciência e investigação** | Consigo reproduzir, estender e citar um resultado PNT, até à semente? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Evidências

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 verificado face a todos os 666 vetores de referência AIAA 2006-6753, pior erro de posição 4.12 mm"></a></p>

<strong>176 de 401</strong> capacidades validadas face a referências independentes externas; 221 honestamente rotuladas Modelled.
Cada linha da matriz de verificação nomeia uma capacidade, a referência face à qual é verificada,
o teste que executa a verificação e a etiqueta que daí resulta. A integração contínua (CI) torna
impossível chamar VALIDATED a uma capacidade sem uma referência independente externa.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Como uma capacidade obtém a sua etiqueta. Cada linha da matriz de verificação nomeia uma capacidade, a referência face à qual é verificada, o teste que executa a verificação na integração contínua e a etiqueta que daí resulta. Uma linha só pode ser VALIDATED com uma referência independente externa; caso contrário é MODELLED, ou PARTNER quando é da responsabilidade de um parceiro de hardware. Exemplo: SGP4/SDP4, Cowell 6-DOF + perturbações, OD em lote/sequencial, referência vetores de verificação SGP4 AIAA 2006-6753, teste tests/sgp4_verification.rs, etiqueta VALIDATED. Contagens atuais: 176 VALIDATED, 221 MODELLED, 4 PARTNER de 401 linhas. Ao todo, 176 capacidades validadas face a referências independentes externas; outras 221 estão honestamente rotuladas MODELLED e 4 são da responsabilidade de PARTNER." width="100%">
</picture>

| Etiqueta | Linhas | Significado |
|---|---|---|
| VALIDATED | 176 | uma referência independente externa concorda: dados reais, uma implementação independente ou vetores de referência publicados |
| MODELLED | 221 | verificado face a uma verdade analítica ou à autoconsistência da simulação, e dito abertamente |
| PARTNER | 4 | da responsabilidade de um parceiro de hardware; o Kshana não tem referência para isso |

Algumas das verificações: todos os 666 vetores SGP4 (Simplified General Perturbations 4) AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 a 4.12 mm; o modelo de forças de Cowell
a 0.08 m face ao Orekit 12.2; Galileo a 0.61 m e Swarm-A a 0.10 m face a efemérides precisas reais
da Agência Espacial Europeia (ESA). Os testes mantêm cerca de 95 % de cobertura de linhas de
`src/`, com limite mínimo de 85 % na CI. O registo é
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), gerado a partir de
`src/verification.rs`: a [matriz completa de 401 linhas](docs/VERIFICATION-MATRIX.md), e a razão pela qual cada
linha Modelled não tem referência externa em [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Como funciona a validação, a tabela de destaques selecionados e as figuras de evidência</summary>

### Validação, reprodutibilidade e honestidade

- Cada termo de ruído é calibrado para um valor **publicado e citado** e validado
  face à relação padrão (desvio de Allan para relógios; crescimento do erro da navegação estimada de Groves
  para sensores inerciais; a conversão temporização→distância para a transferência de tempo). O estado
  de cada termo é acompanhado em [`docs/VALIDATION.md`](docs/VALIDATION.md) como `validated` ou
  `not modeled` — nada é apresentado como validado sem o ser.
- **Reprodutível por construção:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` impõe-no; as execuções quânticas e clássicas usam
  sementes independentes para que o seu ruído não esteja correlacionado.
- A maturidade é declarada honestamente: os valores do relógio ótico e da ligação ótica são resultados de *alvos /
  demonstradores em terra*, não voados.

### A etiqueta de evidência em cada figura

Cada figura e tabela que uma execução escreve diz até que ponto se pode confiar nela, e em que linhas do registo assenta. O JSON do resultado tem uma
chave `evidence`, o SVG do gráfico uma linha por baixo do gráfico (e um elemento `<metadata id="kshana-evidence">`), e a tabela CSV
linhas de comentário `# evidence:` no início (ler com `comment='#'`). Nomeia um nível, `VALIDATED`, `MODELLED` ou `PARTNER`, e
os ids (`VM-` e oito dígitos hexadecimais) das linhas da matriz de verificação que a execução exercitou. O nível é o mais fraco dessas
linhas, pelo que uma execução que se apoia numa linha modelada é rotulada MODELLED independentemente de quantas linhas validadas estejam ao lado; a etiqueta
nunca pode afirmar mais do que o registo. As linhas, os estados e os ids são lidos da matriz, não escritos à mão
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), e
`tests/evidence_labels_doc_sync.rs` falha se uma figura não tiver etiqueta ou se uma etiqueta discordar da matriz.

### Validação num relance

Cada linha é imposta por um teste nomeado na CI. Esta tabela é um **destaque selecionado**;
a matriz completa verificada por máquina tem **401 linhas — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), com a evidência completa (e o que honestamente *ainda não* está
validado) em [`docs/VALIDATION.md`](docs/VALIDATION.md) e no artefacto
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
de cada versão (gerado por `cargo run --bin validation_report`, com atestação SLSA — Supply-chain
Levels for Software Artifacts).

A coluna **Estado** indica o *tipo* de evidência, de acordo com a escala de validação acima: **VALIDATED** = verificado face a uma referência independente externa (dados reais, uma biblioteca independente ou vetores de referência publicados); **MODELLED** = verificado face a uma verdade analítica ou à autoconsistência da simulação (sem conjunto de dados externo independente). VALIDATED descreve o *método* de verificação, não um aprovado/reprovado — uma falha honesta face a uma referência externa real continua VALIDATED, enquanto uma comparação que nenhuma linha da matriz nomeia como referência (o ajuste ao LRO — Lunar Reconnaissance Orbiter — acima) é apresentada como MODELLED. As linhas `CI` são salvaguardas de processo, não valores de mérito. Algumas ilhas de dados reais (o relógio de césio medido, o Stable32 PHASE.DAT e as verificações OPS-SAT/ICGEM em que as entradas em bruto não têm licença de redistribuição) **dependem dos dados**: o teste imprime um aviso de omissão e fica verde quando a entrada está ausente, e os números públicos de referência estão incluídos em `tests/fixtures/`. Reproduza as entradas em bruto com o `scripts/fetch_*.sh` correspondente.

| Estado | Capacidade | Concordância | Referência |
|--------|------------|-----------|--------------------|
| **VALIDATED** | Propagação SGP4/SDP4 | 666/666 vetores, pior **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + comparação direta com o crate independente `sgp4` |
| **VALIDATED** | Referenciais — nutação IAU 2000A/B, cadeia CIO IAU 2006/2000A, ERA | **bit a bit** (X,Y a 1e-14, s a 1e-18, ERA a 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS face a um motor SPICE independente | máx. **0.028″** → ≤ 0.86 m no solo, ≤ 3.6 m na órbita GNSS | ANISE (NAIF/SPICE em Rust puro), mesmos EOP IERS `finals2000A`, 8 épocas 2020–2023 (comparado com esta referência; nenhuma linha da matriz de verificação a nomeia como referência externa, pelo que não está rotulado VALIDATED) |
| **MODELLED** | Geopotencial EGM2008 (grau/ordem 70) | aceleração = ∇V a **< 1e-6**; colapso zonal para o J2 validado | coeficientes NGA EGM2008 + identidade analítica ∇V |
| **VALIDATED** | Síntese de funcionais gravíticos (mapa de navegação assistida por gravidade / sem GNSS) | GRS80 Somigliana + γ_e/γ_p a **3.5e-12**; mapa de perturbações EGM2008 real fisicamente plausível (RMS ≈ 26 mGal, g/o 70) | Gravidade normal de Somigliana GRS80 (Moritz 1980, IAG — International Association of Geodesy) + EGM2008 real do ICGEM (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Estimadores de Allan (ADEV/MDEV/TDEV/HDEV) + bandas de confiança | reproduzem os desvios de referência; as bandas χ² coincidem | NIST SP 1065 (Riley), Tabela 31/32 de 1000 pontos |
| **VALIDATED** | Estimadores de Allan num **relógio de césio real medido** | OADEV/OHDEV a **1e-3** (observado ≤ 3e-5), 16 fatores de média | Stable32 sobre um Cs 5071A real face a um maser H, 556,990 pts (`tests/cs5071a_reference.rs`, depende dos dados) |
| **VALIDATED** | Estimadores de Allan no **PHASE.DAT canónico do Stable32** | OADEV/MDEV/TDEV a **1e-3** (observado ≤ 5e-5), 139 fatores de média | Desvios de referência Stable32 para PHASE.DAT (`tests/phasedat_reference.rs`, depende dos dados) |
| **MODELLED** | Modelo de erros da IMU — ARW / VRW / instabilidade do bias | recuperados a **< 5 %** (instabilidade do bias < 15 %) | Folha de dados Analog Devices ADIS16465; perfil de referência NaveGo |
| **VALIDATED** | Propagador numérico de Cowell + modelo de forças (níveis conservativos) | pior erro de posição **0.08 m** em 24 h, 278 épocas (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Nível de arrasto de Cowell + entradas absolutas de efemérides Sol/Lua e densidade | nível de arrasto caracterizado ≈ 333 m / 24 h; não perturbado coincide com Kepler em variável universal abaixo do metro, energia/momento ~1e-9 | efeméride integrada de baixa precisão + Kepler analítico |
| **MODELLED** | Lambert · Tsiolkovsky · porkchop | ciclo completo face à verdade de dois corpos; ΔV **< 0.01 %** | Izzo 2015 · equação do foguetão · piso analítico de Hohmann |
| **MODELLED** | Determinação de órbita (lote de Gauss–Newton) | abaixo do m / mm·s⁻¹ sem ruído; ~2 m com um piso de ruído de 5 m | dois corpos + J2 sobre um arco RK4 |
| **MODELLED** | Ajuste do modelo de forças face à efeméride precisa Galileo (arco completo) | **0.61 m** RMS 3-D, 24 h, g/o-70, só forças | órbita final ESA/ESOC `ESA0MGNFIN` (E11), EOP `finals2000A` reais (comparado com esta referência; nenhuma linha da matriz de verificação a nomeia como referência externa, pelo que não está rotulado VALIDATED) |
| **MODELLED** | Ajuste do modelo de forças face à efeméride precisa Swarm-A (dinâmica reduzida) | **0.10 m** RMS 3-D (limite do nível empírico, não uma medida) | órbita precisa ESA `SW_OPER_SP3ACOM_2_` (comparado com esta referência; nenhuma linha da matriz de verificação a nomeia como referência externa, pelo que não está rotulado VALIDATED) |
| **MODELLED** | Ajuste do modelo de forças face ao LRO lunar (falha honesta) | **6.67 m** em dinâmica reduzida, *acima* do alvo de 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (comparado com esta referência; nenhuma linha da matriz de verificação a nomeia como referência externa, pelo que não está rotulado VALIDATED) |
| **MODELLED** | OD de Marte no espaço profundo (SRIF de dinâmica reduzida) | **≈ 0.2 m** Mars-LMO (FoM de simulação, *não* de missão real) | OD sintética em ciclo fechado — validação da maquinaria do estimador |
| **MODELLED** | Dinâmica de Marte centrada no Sol face ao JPL DE440 | **137 m num arco de 1 dia** (cresce com o arco = n corpos não modelados) | JPL DE440 via ANISE (`xval/anise-mars-od`, depende do kernel) (comparado com esta referência; nenhuma linha da matriz de verificação a nomeia como referência externa, pelo que não está rotulado VALIDATED) |
| **VALIDATED** | Posicionamento por ponto simples face a uma coordenada IGS levantada (observações reais) | **5.7 m** RMS 3-D / **1.1 m** horizontal, SPP de código livre de ionosfera em dupla frequência | levantamento da estação IGS ABMF + efemérides difundidas GPS, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | UKF GNSS/INS fortemente acoplado | **0.77 m RMS** ao longo de uma passagem LEO de 30 min incl. uma interrupção de 120 s | roda livre pelo modelo de forças, deduzido à mão |
| **MODELLED** | Navegação sem GPS por mapa gravítico | deriva INS de ~70 km → **~145 m** recuperados | alvo ESA NAVISP *Quantum Wayfarer* |
| **MODELLED** | Navegação referenciada ao terreno (TERCOM/SITAN) | deriva de 70 km → **< 500 m** (piso da resolução da grelha ~140 m) | DEM SRTM `.hgt`; deriva injetada à mão (verificação não circular) |
| **MODELLED** | Campo principal IGRF-14 (grau/ordem 13) | polo ~80.7°N, dipolo ~29.7 µT, banda física 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (semi-normalizado de Schmidt) |
| **MODELLED** | Modulação do sinal de navegação e seguimento de código | SSC próprio BPSK = **2/(3·R_c)**; PSD de área unitária; jitter DLL C/A **abaixo do metro** a 45 dB-Hz | Âncoras SSC/PSD em forma fechada + fórmula do ruído térmico DLL de Kaplan & Hegarty |
| **MODELLED** | Corretor diferencial halo/NRHO CR3BP | STM = diferenças finitas; a órbita fecha à **precisão da máquina**; NRHO 9:2 de L2 **≈ 6.57 d / perilúnio ≈ 3,250 km** | verificação da STM por diferenças finitas + NRHO 9:2 sul de L2 publicada (≈ 6.56 d / ≈ 3,370 km) — CR3BP, não uma efeméride real do Gateway |
| **MODELLED** | Integridade ARAIM com duas constelações | modo de falha de constelação inteira sobre GPS + Galileo reais | EU ARAIM TR (relatório técnico) / DO-316; Celestrak `gps-ops` 2021-07-28 (comparado com esta referência; nenhuma linha da matriz de verificação a nomeia como referência externa, pelo que não está rotulado VALIDATED) |
| **VALIDATED** | Geometria GNSS / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | coincidência a **1e-6 relativo** em 8 geometrias (bem condicionada → quase singular) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — biblioteca independente (`tests/dop_reference.rs`) |
| **VALIDATED** | Métricas de avaliação de detetores ML (AUC/ROC/confusão/Pd-Pmd/precisão/F1) | **contagens exatas + < 1e-9** em 5 conjuntos de dados × 24 limiares | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — biblioteca independente (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC AUC de deteção de anomalias em **telemetria real do ESA OPS-SAT** | a AUC reproduz o scikit-learn a **< 1e-9**; AUC do detetor por contagem de picos **≈ 0.85** na partição de teste rotulada | scikit-learn `roc_auc_score` na partição de teste OPSSAT-AD (Ruszczak et al. 2025, CC BY 4.0) — telemetria real OPS-SAT (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Kernels numéricos do estudo de compromissos quântico (ajuste ADEV NNLS · bandas de consistência χ² · Q do relógio de van-Loan) | NNLS + Q **exatos**; χ² **< 5e-4** com graus de liberdade operacionais ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | Métricas de wander de telecomunicações MTIE / MDEV / TDEV (ITU-T G.810/G.823/G.8261/G.811 — as recomendações do Setor de Normalização das Telecomunicações da União Internacional das Telecomunicações) | MTIE (9 fatores de média, exato ao bit) e MDEV + TDEV (8 fatores, **< 1e-9** relativo) na série NIST SP 1065 LCG (gerador congruencial linear) | allantools 2024.06 `mtie` / `mdev` / `tdev` — biblioteca independente (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | Métodos de estudo de compromissos MCDA — as quatro famílias de decisão, nove agregadores validados externamente (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) mais a ponderação de prioridades por comparação par a par **AHP** | pontuações / ordenações / matrizes de concordância reproduzidas a **< 1e-9** | pymcdm + pyDecision (bibliotecas MCDA independentes de terceiros) + Saaty RI (Índice Aleatório) / eig SciPy-LAPACK (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | Envolvente Doppler LEO a partir da órbita e da portadora | máximo Iridium dentro de **5 %** dos ±36 kHz publicados; Xona Pulsar X1 dentro dos **32–34 kHz** publicados | Resultados de testes LEO PNT da RNTF; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | Convergência PPP com aumento LEO | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min com 60 / 96 / 192 / 288 satélites LEO, monótona; NEES do filtro dentro da banda χ² | tendência comparada com Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); constelações e ruído não reproduzidos |
| **MODELLED** | Timing Protection Level condicional (erro de tempo não detetado limitado pelo holdover sob spoofing) | a composição reproduz a recursão de covariância `clock_state` em vários passos; calibrado num spoof real gravado | escalares do JammerTest 2024 (Zenodo 15911589) + formas fechadas de van-Loan / CUSUM (`examples/tpl_jammertest`) |
| **MODELLED** | Pontuação de resiliência PNT + instabilidade da decisão | 35 testes de referência deduzidos à mão; artefacto do estudo determinístico ao byte (semente fixa) | mapeamento DHS RPCF v2.0 + formas fechadas de Dirichlet / Kendall-τ / Hill-N2 — arquiteturas sintéticas, não uma certificação |
| **MODELLED** | Estudo do desvio de otimismo das perturbações RF (leis de escala + preditor leave-one-out) | significância por hipótese nula de permutação; artefacto determinístico ao byte (5 sementes) | corpus sintético fundamentado em parâmetros — as *métricas* de avaliação são VALIDATED face ao scikit-learn (acima); o estudo é MODELLED |
| CI | Reprodutibilidade multiplataforma | entradas idênticas ao bit + goldens de forma em 3 SO (sistemas operativos) | matriz de CI Linux / macOS / Windows, goldens SHA-256 |
| CI | Cobertura de testes | **~95 % de linhas** em `src/` excluindo `src/*_data.rs` e `src/main.rs`, com limite ≥ 85 % | cargo-tarpaulin (motor LLVM) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Como uma capacidade obtém a sua etiqueta: o Requisito corresponde a um módulo em src, a um teste em tests, a uma referência externa (conjunto de dados real, implementação de referência independente ou vetores publicados), a um estado — com uma salvaguarda imposta pela CI de que nenhuma capacidade pode ser Validated sem uma referência externa. Contagens atuais: 176 Validated, 221 Modelled, 4 Partner, 401 no total" width="900">
  <br><sub>Como uma capacidade obtém a sua etiqueta — o invariante imposto pela CI: sem referência externa ⇒ não pode ser Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Como cada afirmação é sustentada: a coluna Validated é 176 de 176 ExternalDataset por construção (imposto pela CI); as linhas Modelled estão honestamente marcadas InternalConsistency, ReferenceImpl ou ExternalDataset; as linhas Partner não têm referência do Kshana" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Pior erro de posição SGP4/SDP4 face à referência AIAA 2006-6753 por regime, escala logarítmica: todos os regimes ficam muito abaixo da tolerância AIAA, pior caso 4.12 mm no regime de espaço profundo não ressonante" width="96%">
  <br><sub>Em cima: cada linha Validated é sustentada por um conjunto de dados externo, por construção. Em baixo: o SGP4 coincide com a referência oficial em todos os regimes (pior 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Estado de verificação das 401 capacidades: 176 Validated (verificadas face a referência externa), 221 Modelled, 4 da responsabilidade de Partner" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Domínios de capacidade

Cada capacidade do mapa público, por domínio, com a sua etiqueta no registo. A tabela de domínios é escrita por
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) a partir de `web/capabilities.json`, o mesmo ficheiro que o
mapa de tudo do Studio lê.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Capacidades do Kshana por domínio e maturidade: capacidades públicas validadas e modeladas por domínio, desenhadas a partir de web/capabilities.json por tools/gen_validation_figures.py" width="900">
</picture>

A tabela completa, domínio a domínio com cada capacidade e a sua etiqueta, está em [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Instalar

Uma linha instala a ferramenta de linha de comandos: **`cargo install kshana`**. Todos os canais distribuem
a v0.40.0 a partir do mesmo commit etiquetado.

<!-- channels:begin -->
| Canal | Instalar | Guia |
|---|---|---|
| Experimentar no navegador | abrir https://kshana.dev | [Guia do Studio](https://kshana.dev/docs/studio.html) |
| Linha de comandos (Rust) | `cargo install kshana` | [Utilização da linha de comandos](https://kshana.dev/docs/rust.html#usage--cli) |
| Biblioteca Rust | `cargo add kshana` | [Referência da API em docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Guia da API Python](https://kshana.dev/docs/python-api.html) |
| JavaScript e WebAssembly | `npm install kshana` | [Guia de npm e WebAssembly](https://kshana.dev/docs/npm.html) |
| Assistente de IA (servidor MCP, cargo) | `cargo install kshana-mcp` | [Guia do servidor MCP](https://kshana.dev/docs/mcp.html) |
| Imagem Docker | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Guia do servidor MCP: Docker](https://kshana.dev/docs/mcp.html#install) |
| Extensão Claude Desktop | faça duplo clique no `.mcpb` para o seu sistema: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (um clique) | [Adicionar ao Cursor (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Adicionar ao Cursor (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (um clique) | [Instalar no VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Instalar no VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Binário pré-compilado | descarregue kshana-mcp-<target> da versão e verifique-o face a SHA256SUMS | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Registo MCP oficial | pesquise io.github.ashfordeOU/kshana-mcp | [Todos os excertos de instalação MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Remoto (HTTP com streaming), alojamento próprio | `kshana-mcp --http 127.0.0.1:8080` | [Guia de alojamento próprio](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Marketplace de plugins do Claude Code | `/plugin marketplace add ashfordeOU/kshana` | [Usar o Kshana a partir de um agente](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| Plugin para IDE JetBrains | Settings → Plugins → Marketplace → pesquisar "Kshana" (ID do plugin dev.kshana.ide) | [Guia do plugin](https://kshana.dev/docs/jetbrains.html) |
| Plugin Signal K | `npm install signalk-kshana-trust` | [Guia do plugin Signal K](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| Plugin OpenCPN | descarregue o tarball do plugin a partir da versão | [Submissão ao catálogo OpenCPN](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Painel Grafana | importe kshana-grafana-*.json a partir da versão | [Fonte do painel](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Imagem da montagem de referência | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Integrações marítimas](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana no JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Compila com Rust 1.88 ou mais recente, a rust-version em Cargo.toml"></a></p>

MCP é o Model Context Protocol. Fixe uma versão com `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` ou `npm install kshana@0.40.0`. Para compilar a partir do código-fonte, ver
[Instalar e compilar](#install--build) em Referência.

<details>
<summary>Executar um cenário a partir de Python e de WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Além de `run`, o módulo expõe `run_full` (JSON, SVG e o resumo de uma linha de uma só vez),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` e `error_kind`; ver
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

O pacote npm é o motor inteiro compilado para WebAssembly. Em Node.js, passe o binário a
`initSync`; num navegador, `await init()` vai buscá-lo (ver [`README.npm.md`](README.npm.md)).

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
## Arquitetura

Um motor aberto está no centro, e todas as interfaces o executam: a linha de comandos, a biblioteca
Rust, Python, WebAssembly e o Kshana Studio, o servidor MCP, a imagem Docker e o
plugin JetBrains. O mesmo ficheiro de cenário dá os mesmos bytes em cada uma. O Kshana Pro fica
por cima, como camada separada que depende do motor e nunca cria uma bifurcação dele.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="A arquitetura do Kshana: um motor aberto no centro, kshana 0.40.0 sob a AGPL-3.0, com api::run_toml, um despacho tipado sobre todos os tipos, e o registo de verificação de 401 capacidades (176 VALIDATED, 221 MODELLED, 4 PARTNER). À volta, todas as interfaces executam o mesmo motor: Linha de comandos (cargo install kshana); Biblioteca Rust (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); Servidor MCP (cargo install kshana-mcp); Imagem Docker (ghcr.io/ashfordeou/kshana-mcp); Plugin JetBrains (Marketplace: &quot;Kshana&quot;). Por baixo, o Kshana Pro, uma camada proprietária que depende do motor aberto como biblioteca e nunca cria uma bifurcação dele, e não acrescenta nenhum modelo físico." width="100%">
</picture>

<details>
<summary>Dentro do motor: as camadas de domínio e o registo de verificação</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="A arquitetura do Kshana em camadas. Cinco portas de entrada (linha de comandos, Python, JavaScript e WebAssembly, o servidor MCP e o plugin JetBrains) chegam a um único api::run_toml, um despacho tipado sobre 92 tipos. Por baixo estão oito camadas de domínio: tempo e referenciais, relógios e temporização, inercial e fusão, GNSS e integridade, astrodinâmica, PNT LEO, Lua, Marte e espaço profundo, e missões e estudos, sobre um núcleo partilhado, todas com referência cruzada no módulo de verificação, a matriz verificada por máquina de 401 capacidades que é a única fonte de verdade para cada etiqueta." width="100%">
</picture>

**Um motor, muitas portas de entrada.** Um único núcleo Rust (`kshana`) executa todos os cenários,
acessível através de uma CLI, de uma extensão Python, de um módulo WebAssembly no navegador, de um **servidor
MCP** para agentes de IA e de um **plugin para IDE JetBrains** — todos convergindo num único
despacho `api::run_toml`. No interior, os pacotes de sensores ligam-se a uma interface comum de modelo
de erro; ao lado deles estão uma **camada de referenciais** (precessão–nutação IAU 2006/2000A
e a redução GCRS↔ITRS baseada no CIO), uma **camada de astrodinâmica/numérica**
(SGP4/SDP4 analítico **e** um propagador numérico de Cowell com o seu
modelo de forças EGM2008/perturbações, conceção de manobras e determinação de órbita), uma
**camada de integridade/GNSS** (RAIM/ARAIM, SBAS, o domínio das medições, jamming, cislunar),
uma **camada de fusão / alt-PNT** (os estimadores GNSS/INS e os correspondedores de mapas
de gravidade/terreno/magnéticos), uma **camada de espaço profundo e lunar** (Mars-PNT radiométrico e o
conjunto PNT lunar, com o seu nível de evidência por parte na matriz — tempo LTC, VLBI, OD+relógio conjunto, realização do referencial, volume de serviço,
PNT diferencial, interoperabilidade), uma **camada de análise de missão** (orçamentos de lançamento / reentrada / cobertura /
apontamento / passagem / ligação e o ambiente de meteorologia espacial), e a
**camada aberta de estudos de resiliência e IA/ML** (pontuação de resiliência RPCF, o desvio de otimismo
das perturbações RF e o demonstrador de PNT com tecnologia quântica) cujos artefactos reprodutíveis assentam nos
kernels validados.

Dois crates autónomos, **excluídos do workspace**, ficam ao lado do núcleo — `mcp/kshana-mcp`
(o servidor MCP, construído sobre o SDK `rmcp` da edição 2024) e `xval/anise-frames` (a
verificação cruzada de referenciais ANISE/SPICE, que traz dependências MPL-2.0 (Mozilla Public License 2.0)) — mantidos fora do grafo
de dependências do crate publicado, do `Cargo.lock`, do controlo de licenças e da compilação MSRV (versão mínima suportada do Rust) pela lista
`exclude` do `Cargo.toml` da raiz. O plugin JetBrains (`ide/jetbrains`) é um projeto Kotlin
separado. Ver [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) para o conjunto completo de diagramas.

Os diagramas renderizados (fluxo do motor, mapa de módulos, distribuição) estão em [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagramas

Os diagramas são fontes Mermaid em [`docs/diagrams/`](docs/diagrams/), renderizadas em SVG e PNG para
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` em Linux, os outros dois
scripts `render-diagram` noutros sistemas), e um registo associa cada PNG ao SVG exato de que veio. Os testes fixam as
contagens que indicam. Os gráficos nas secções acima são desenhados por ferramentas a partir de execuções do motor; estes mostram como as
partes encaixam.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="O sistema: seis portas de entrada (linha de comandos, Python, WebAssembly e npm com o Kshana Studio, servidor MCP com plugins e skills, plugin JetBrains, integrações) chamam todas um único despacho sobre todos os tipos de cenário, que executa um motor de núcleo partilhado, pacotes de sensores e referenciais, e modelos de domínio, e escreve um resultado e um gráfico reprodutíveis" width="900"><br>
  <sub>Um despacho, um motor, saída reprodutível · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · fonte <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="As interfaces: um motor determinístico offline alimenta a linha de comandos, a biblioteca Rust, Python, WebAssembly e npm, e o servidor MCP; o Studio corre sobre a compilação WebAssembly, os comandos de plugin e skills sobre o servidor MCP, as integrações e os kits de implementação sobre a linha de comandos, e o plugin JetBrains sobre a biblioteca" width="900"><br>
  <sub>Todas as interfaces, a partir do mesmo motor · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · fonte <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Dentro de uma execução: um ficheiro de cenário com a sua semente e a cronologia GNSS alimenta o motor, que em cada passo temporal faz evoluir o modelo de erro, executa o estimador e pontua os valores de mérito, e escreve um resultado e um gráfico reprodutíveis" width="900"><br>
  <sub>O ciclo interno de uma execução · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · fonte <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Confiança no recetor: um registo ou fluxo do recetor é ingerido em observáveis por época e nos indicadores do próprio recetor, passa pelos monitores e torna-se uma pontuação de confiança consultiva com uma banda e razões, que alimenta o Studio, a telemetria, um pacote de evidências assinado, a pontuação Jammertest e bench, e o relatório de conformidade" width="900"><br>
  <sub>De um registo de recetor a uma pontuação de confiança e ao que a usa · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · fonte <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="O ciclo completo com o laboratório: um cenário é exportado com os seus eventos e condições de teste, um operador fora do Kshana reproduz um ficheiro num simulador de laboratório, o registo do recetor é pontuado face aos eventos declarados, e o ciclo completo de evidências liga os hashes do cenário, das condições e do registo e a pontuação num pacote assinado" width="420"><br>
  <sub>Do cenário ao pacote assinado; o Kshana nunca produz nem reproduz um sinal · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · fonte <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: o navegador executa localmente o motor compilado para WebAssembly sem carregar nada para fora, aceita cenários incluídos ou um cenário ou registo que abra, e mostra o resultado na vista Simples, na vista Avançada e nas páginas de tarefas, com exportações guardadas pelo utilizador" width="900"><br>
  <sub>Como o Studio corre, localmente · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · fonte <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="O fluxo de testes e lançamento: os controlos locais (formatação, clippy, a verificação de ausência de atribuição, a catraca de cobertura da documentação e scripts/gate.sh, que executa o conjunto completo e execuções repetidas e escreve o recibo que o hook pre-push verifica) levam a um pull request só de CI e a uma CI completa verde; o responsável avança main em fast-forward até ao commit verde e uma etiqueta anotada é colocada nele após a verificação de sincronização de versões; o workflow de lançamento verifica o conjunto completo no commit etiquetado antes de publicar seja o que for, compila os binários com um SBOM, checksums e proveniência de compilação, publica no crates.io, PyPI, npm, no registo de contentores, no registo MCP e no JetBrains Marketplace, consulta cada registo até servir a nova versão, e despoleta a compilação do site a partir da etiqueta; um caminho separado só para o site despoleta o workflow das páginas com a etiqueta main e é recusado a menos que nada fora de web/ e .github/ tenha mudado desde a versão mais recente" width="900"><br>
  <sub>Fluxo de testes e lançamento, dos controlos locais a uma versão verificada e ao caminho só para o site · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · fonte <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="O mapa de módulos: a linha de comandos, Python, WebAssembly, o servidor MCP e o plugin JetBrains chamam o despacho tipado sobre todos os tipos, que chega ao núcleo partilhado, tempo e referenciais, pacotes de sensores, astrodinâmica, integridade, deteção de spoofing, fusão, espaço profundo e lunar, resiliência, e os módulos de árbitro e de benchmark, todos sustentados pela matriz de verificação" width="1000"><br>
  <sub>Onde vive o código · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · fonte <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Distribuição: um repositório distribui o crate principal, o servidor MCP, o plugin para IDE e os crates de verificação cruzada para crates.io, PyPI, npm, GitHub Releases, o playground do Pages, o registo de contentores, o registo MCP e o JetBrains Marketplace, com um arquivo Zenodo" width="900"><br>
  <sub>O que é distribuído e onde, e o que o verifica · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · fonte <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## Assistente de IA

[`kshana-mcp`](mcp/kshana-mcp/) é um servidor MCP: o seu assistente executa o motor real e
lê de volta o JSON dele, em vez de adivinhar a matemática. Cada uma das suas 49 ferramentas é um invólucro fino
sobre uma função pública da biblioteca `kshana`, pelo que nenhuma lógica de simulação vive no servidor.

### Instalar o servidor MCP

> Consultivo, não um equipamento de navegação homologado: o operador continua a ser responsável pela navegação.
> O servidor corre no seu computador; nada é enviado para a Ashforde OÜ.

Escolha qualquer canal. Cada ligação e excerto é gerado a partir de um único script
(`scripts/gen_mcp_install.py`) e verificado na integração contínua; os excertos para Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI e Continue estão em
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Canal | Comando ou botão | Requer | Forma fixada |
|---|---|---|---|
| Extensão Claude Desktop | faça duplo clique no `.mcpb` para o seu sistema: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | nada | `kshana-mcp-<target>.mcpb` da v0.40.0 |
| Cursor (um clique) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node, ou Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (um clique) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node, ou Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · plugin: `/plugin marketplace add ashfordeOU/kshana` e depois `/plugin install kshana@ashforde` | Node (ou Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ com uv ou pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | fórmula para a v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` e depois `scoop install kshana-mcp` | Scoop (Windows) | manifesto para a v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Binário pré-compilado | [a página da versão](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, verificado por `SHA256SUMS` e `gh attestation verify` | nada | v0.40.0 |
| Registo MCP | `io.github.ashfordeOU/kshana-mcp` (encontrado por clientes que conhecem o registo) | um cliente que conheça o registo | `0.40.0` |
| Remoto (HTTP com streaming) | `kshana-mcp --http 127.0.0.1:8080`, alojamento próprio: ver [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | o seu próprio servidor | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp no Glama, a pontuação de qualidade do seu servidor MCP"></a></p>

No Claude Code o mesmo servidor chega como plugin: `/plugin marketplace add ashfordeOU/kshana` e depois
`/plugin install kshana@ashforde`. O plugin acrescenta comandos de barra sobre as ferramentas: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` e `/kshana-jammertest`. As ferramentas de confiança de embarcações alimentam as integrações Signal K e
OpenCPN: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

A configuração por cliente está em [`docs/integrations.md`](docs/integrations.md). O servidor está listado
no registo MCP oficial como `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>As 49 ferramentas</summary>

<br>

**Cenários e relatórios**

| Ferramenta | O que faz |
|---|---|
| `run_scenario` | Executa um cenário a partir de uma definição TOML (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | Os 92 tipos de cenário integrados com descrições + campos obrigatórios/opcionais — para que o agente possa construir um cenário válido |
| `validate_scenario` | Verificação prévia: lê o TOML e deteta o seu tipo, sem executar |
| `list_example_scenarios` | Os cenários de referência incluídos, em JSON |
| `get_example_scenario` | O texto TOML de um cenário de referência incluído, byte a byte o ficheiro em `scenarios/` |
| `report_scenario` | Executa um cenário e devolve o seu relatório |
| `animate_scenario` | Executa um cenário e devolve as suas séries temporais como animação |
| `sky_geometry` | Geometria do céu sob uma linha de horizonte dependente do azimute: os satélites visíveis e ocultos, DOP, a covariância este-norte-cima e a elipse de erro horizontal; ou uma predefinição de linha de horizonte com a sua proveniência |

**Exportação e interoperabilidade**

| Ferramenta | O que faz |
|---|---|
| `list_export_formats` | Que formatos de interoperabilidade se aplicam a um cenário (`czml`, `kml`, `geojson`, `stk`, `sigmf`), a razão quando um não se aplica, e a especificação que cada escritor segue |
| `export_interop` | Exporta um cenário como CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemérides STK (Systems Tool Kit) `.e` ou SigMF (Signal Metadata  |
| `import_route` | Escreve uma rota GeoJSON `LineString` num cenário que percorre uma trajetória de waypoints (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`) e devolve o novo TOML |
| `export_sp3` | Exporta a constelação de um cenário `orbit` como efemérides precisas SP3-c (Standard Product 3, revisão c) |
| `export_omm` | Exporta os elementos de um cenário `orbit` como catálogo OMM (Orbit Mean-elements Message) CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 |
| `export_oem` | Exporta a série de estados de um cenário `orbit` como efemérides CCSDS OEM (Orbit Ephemeris Message) 2.0 — a posição TEME (equador verdadeiro, equinócio médio) *e*  |
| `export_table_csv` | Executa um cenário e devolve a sua tabela de reprodutibilidade em CSV (valores separados por vírgulas) — a tabela estável ao byte que a CLI (interface de linha de comandos) escreve como `<scenario>.table.csv` |
| `export_test_bench` | O movimento do veículo e os eventos de um cenário para um simulador GNSS de laboratório (`kshana bench-export`) |

**Confiança no recetor e na embarcação**

| Ferramenta | O que faz |
|---|---|
| `assess_receiver_log` | Avalia a confiança de um registo real de recetor GNSS (sistema global de navegação por satélite) |
| `assess_vessel_stream` | Pontua um excerto NMEA 0183 limitado (no máximo 2 MiB e 20,000 épocas |
| `assess_vessel_log` | O registo NMEA 0183 de uma embarcação (no máximo 4 MiB) como execução em lote, com o TOML da sessão a declarar os limites da embarcação |
| `create_evidence_pack` | Um pacote de evidências assinado para uma janela do registo de uma embarcação (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Associa um token de carimbo temporal RFC 3161 (base64 dos bytes `.tsr`) a um pacote, em memória (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Verifica um pacote (`kshana evidence verify`) |
| `generate_training_nmea` | NMEA 0183 sintético de ponte para treino de tripulações a partir de um TOML `nmea-scenario` (jamming, arrastamento de posição, spoofing de tempo, atraso de repetição) com o registo do instrutor (`kshana-nmea-training/1`) |
| `build_interference_map` | Um mapa de interferência GNSS a partir de relatórios de posição ADS-B ou AIS em texto CSV (no máximo 4 MiB) |
| `route_exposure` | A fração do comprimento de uma rota em células degradadas, não degradadas, não avaliadas e não observadas de um ou mais mapas de interferência, opcionalmente dentro de um intervalo de datas |
| `trust_telemetry` | Um fluxo de confiança (linhas JSON) ou um resultado `receiver-trust` apresentado como texto Prometheus, linhas syslog CEF ou LEEF ou um payload JSON OTLP, com os codificadores de `kshana trust-telemetry` |
| `jammertest_import` | Lê o catálogo de testes e o plano de transmissão publicados do Jammertest (NPRA/jammertest-plan, MIT) como verdade programada (`kshana jammertest import`): as janelas de uma área de teste tornam-se eventos receiver-trust com o id do catálogo e o ano em cada etiqueta. Janelas planeadas, não tempos de emissão registados; nenhum campo de contacto do plano é lido. MODELLED. Ver [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Pontua um registo de recetor face a esse calendário (`kshana jammertest score`): por teste, a latência de deteção, os alarmes falhados e o tempo de recuperação, e os falsos alarmes fora de todas as janelas. Registos de texto como `log`, binários (`ubx`, `sbf`) como `log_base64`. Um pacote assinado precisa de uma chave: linha de comandos. Apenas consultivo; MODELLED. |
| `fit_imu_log` | Parâmetros do acelerómetro e do giroscópio dos cenários `hybrid` e `fusion` ajustados a partir de um registo de IMU estacionária (CSV ou EuRoC) por desvio de Allan, com uma tabela `[accel_classical]` pronta a colar e o SHA-256 do registo (`kshana imu-fit`). Texto à entrada, JSON à saída; MODELLED. |

**IQ GNSS (ficheiros do diretório de trabalho; desativado em modo HTTP)**

| Ferramenta | O que faz |
|---|---|
| `iq_signals` | A configuração da camada IQ GNSS |
| `iq_info` | Descreve uma gravação IQ (em fase e quadratura) no diretório de trabalho sem a processar |
| `iq_scene` | Gera uma cena IQ GNSS multissatélite no diretório de trabalho (`kshana iq scene`) |
| `iq_acquire` | Aquisição por FFT (transformada rápida de Fourier) de um ou mais PRN (códigos de pseudorruído) sobre uma gravação (`kshana iq acquire`), opcionalmente atrás de fases de frente de recetor |
| `iq_track` | Adquire e depois segue com o banco DLL/PLL/FLL (malhas de seguimento de atraso, fase e frequência) (`kshana iq track`), com as malhas a partir de um `kshana.loop-desig |
| `iq_frontend` | Aplica a frente de recetor e o DSP de mitigação de interferência (processamento digital de sinal |
| `iq_sweep` | Reproduz uma gravação IQ no diretório de trabalho com vários desenhos de malha de seguimento (`kshana iq sweep`) |
| `iq_monitor` | Executa os monitores de deteção de interferência e spoofing sobre uma gravação IQ no diretório de trabalho (`kshana iq monitor`) |
| `iq_labfit` | Ajusta o modelo de perda de seguimento da malha a execuções de laboratório (`kshana iq labfit`) a partir de um cenário `iq-labfit` cujos registos estão incorporados (`text` ou `base64` |
| `iq_test_conditions` | Valida um ficheiro `kshana.test-conditions/1` dado como texto e devolve as condições resolvidas com o seu hash |
| `iq_campaign` | Executa uma campanha de reprodução em laboratório (`kshana iq campaign`) |
| `iq_campaign_status` | O progresso de uma pasta de saída de campanha |

**Mapeamento de conformidade**

| Ferramenta | O que faz |
|---|---|
| `compliance_report` | O mapeamento de enquadramentos públicos preenchido a partir de documentos de resultado dados como texto (`kshana compliance-report`) |
| `compliance_mapping` | As tabelas de mapeamento estáticas (ou, com `sources`, os documentos-fonte que citam com versões e URL) em Markdown, encabeçadas pela mesma declaração |
| `list_standards_packs` | Os pacotes de normas (`kshana standards-pack list`): conjuntos de cenários pontuados para os perfis de teste do enquadramento DHS Resilient PNT, IMO MSC.1/Circ.1575 e ICAO Doc 9849 Appendix F |
| `run_standards_pack` | A execução de um pacote face a limiares declarados antes da execução: cada teste `MET`, `NOT MET` ou `NEEDS INPUT`; MODELLED, não classifica nenhum produto |
| `lunanet_afs_check` | O LunaNet Augmented Forward Signal verificado face a LNIS V5 AD1 Volume A (LSIS-AFS V1.0): os códigos face às tabelas impressas, ou um fluxo de símbolos face ao formato da trama; o LDPC e o CRC-24Q das subtramas 2 a 4 não são verificados |
| `create_round_trip_pack` | O pacote assinado do ciclo completo com o laboratório: cenário, documento `kshana.test-conditions/1`, registo do recetor e pontuação ligados por hash |

**Benchmark**

| Ferramenta | O que faz |
|---|---|
| `score_benchmark` | Uma submissão ao kshana-bench pontuada face a um ficheiro de verdade, ambos texto JSON (`kshana bench score`, `bench/SPEC.md`): o ficheiro de resultado com a versão da especificação, a partição, os hashes das entradas e as métricas da tarefa. MODELLED; descreve um registo ou corpus, nunca um produto. |
| `render_leaderboard` | Ficheiros de resultado do kshana-bench apresentados como a página estática da tabela de classificação (texto HTML), cada um validado primeiro. |

</details>

<a id="editions"></a>
## Edições

O motor inteiro é gratuito. O Kshana Pro e os estudos personalizados destinam-se a programas que precisam de mais,
e todas as vias pagas começam com uma mensagem: não há preços aqui.

| | Free | Kshana Pro | Estudo personalizado |
|---|---|---|---|
| O que é | o motor aberto completo, os 92 tipos de cenário, sem funcionalidades bloqueadas | uma camada proprietária sobre o mesmo motor, sob contrato | um estudo MODELLED de resiliência PNT do seu sistema, feito por nós |
| Licença | AGPL-3.0 (GNU Affero General Public License, versão 3), ou uma licença comercial | proprietária | contrato |
| Como começar | [instalar](#install) ou abrir [kshana.dev](https://kshana.dev) | [pedir uma avaliação do Pro](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [pedir um estudo](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

O que é o Pro, nas palavras de [`docs/PRO.md`](docs/PRO.md):

> **Um superconjunto estrito do Kshana aberto.** O Pro depende do motor aberto como biblioteca e
> nunca cria uma bifurcação dele. Todos os tipos de cenário abertos correm no Pro sem alterações, e um cenário aberto corre
> no Pro sem qualquer licença.
>
> **Nenhuma física nova.** O Pro não acrescenta nenhum modelo físico nem altera nenhum. Cada número do Pro vem
> de execuções do motor aberto, pelo que um valor do Pro é tão fiável quanto o tipo de cenário aberto
> de que veio, e nunca mais.

O Pro responde às perguntas seguintes de um programa: que conceção levar a voo (um otimizador de conceção e a sua
frente de Pareto), quão segura é a resposta (incerteza e sensibilidade), e se a missão
cumpre os seus requisitos (um dossiê de missão, rastreabilidade de requisitos, estudos de compromissos, uma
verificação de regressão de cenários, gémeos digitais de relógios, um dossiê de estudo e um serviço
local). Também vigia uma campanha de valores e faz falhar um pipeline quando um piora,
testa planos de sinais candidatos face aos sinais abertos de navegação por satélite nos dois
sentidos (coexistência espetral), e coloca estudos em fila num serviço local de tarefas com um
registo de entregas encadeado por hashes. Cada um é descrito, com o que produz e o que não faz, em
[`docs/PRO.md`](docs/PRO.md). Nada do que o Pro produz é uma certificação, e um estudo personalizado também
não é uma certificação.

<details>
<summary>O que o Kshana Pro lê do motor aberto, e o suporte da Ashforde® OÜ</summary>

<br>

**Em que assenta o Kshana Pro.** Cada parte do Pro trabalha a partir do motor aberto e deixa-o
inalterado:

- **O otimizador de conceção, o estudo de incerteza e o dossiê de missão** executam cenários do
  motor aberto através da interface pública do motor e calculam cada número a partir dos resultados das
  execuções. Cada saída mantém o nível VALIDATED, MODELLED ou PARTNER que o motor aberto deu a
  cada valor, nunca um superior.
- **Os gémeos digitais de relógios** usam o modelo de relógio do motor aberto e o seu estimador de desvio
  de Allan: um gémeo é calibrado para o orçamento de Allan publicado do dispositivo e depois verificado
  estimando o desvio de Allan do gémeo com o estimador aberto.
- **Os estudos de compromissos** executam cada opção de arquitetura como cenário do motor aberto, sem alterações,
  e ordenam as opções por um valor de mérito lido do resultado de cada execução.
- **A vigilância de campanhas** lê os seus valores dos resultados de execuções do motor aberto dos
  cenários de um pacote, e compara-os com a execução aprovada anterior.
- **A coexistência espetral** lê cada número físico de execuções do motor aberto dos tipos
  `leo-signal` e `constellation-design`, e acrescenta apenas a soma sobre os satélites
  visíveis e a ordenação dos planos.
- **O serviço local de tarefas** executa cenários abertos e Pro através do mesmo motor e
  guarda cada resultado tal como a execução o devolveu.
- **Os pacotes de evidências** registam, para cada execução, o hash do cenário que o motor aberto carimba no
  seu resultado, para que um valor de um pacote possa ser reproduzido reexecutando o seu cenário.
- **Ferramentas de engenharia de sistemas e de programa.** As ferramentas de engenharia de sistemas
  baseada em modelos (MBSE) e de programa do Kshana Pro verificam os requisitos de um programa
  face a execuções do motor aberto: importam requisitos como valores separados por vírgulas
  (CSV), ou como um subconjunto documentado do Requirements Interchange Format (ReqIF) ou do
  texto da Systems Modeling Language versão 2 (SysML v2), avaliam cada critério de
  aceitação, com a sua unidade, face aos valores que uma execução escreveu, e produzem uma matriz de
  referência cruzada de verificação (VCRM), um modelo SysML v2, um relatório de impacto de alterações e um pacote
  de evidências offline. Não reexecutam nem recalculam nada, e leem apenas o que o motor aberto
  publica: o `result.json` de cada execução (os campos que um critério nomeia, as suas unidades, o
  carimbo de reprodutibilidade do hash do cenário, semente, versão do motor e versão do esquema, e
  a etiqueta e os níveis dos valores da execução), o seu `report.json` (tipo, registo de reprodutibilidade e
  etiquetas de capacidade), o ficheiro do cenário (o seu hash, tipo, semente e parâmetros), o
  esquema de unidades dos campos (a unidade, a proveniência e o nível de evidência de cada campo) e a
  matriz de verificação (a etiqueta VALIDATED, MODELLED ou PARTNER de cada capacidade).

<a id="support--professional-services"></a>
### Suporte e serviços profissionais

O Kshana é gratuito e de código aberto sob a AGPL-3.0 e **desenvolvido e
mantido profissionalmente pela Ashforde® OÜ** (Estónia). O motor aberto é completo e utilizável por
si só. Para organizações que precisam de mais, a Ashforde® OÜ oferece:

- **Suporte comercial e integração** — incorporação do Kshana na sua cadeia de ferramentas, cenários
  personalizados e correções prioritárias.
- **Modelos de sensores personalizados** — calibrados para o seu hardware, incluindo modelos de resiliência
  sensíveis em termos de exportação mantidos numa camada privada.
- **Kshana Pro** — ferramentas proprietárias de engenharia de sistemas baseada em modelos (MBSE) e de programa
  que verificam os requisitos de um programa face a execuções do motor aberto e
  produzem uma matriz de referência cruzada de verificação (VCRM), um modelo Systems Modeling Language
  versão 2 (SysML v2), um relatório de impacto de alterações e um pacote de evidências offline. Não
  reexecutam nada e leem apenas as saídas publicadas do motor: o `result.json`
  e o `report.json` de cada execução, o ficheiro do cenário, o esquema de unidades dos campos e as etiquetas da
  matriz de verificação (a lista completa está em [Edições](#editions)).
- **Ferramentas de conceção, incerteza e missão do Kshana Pro** — a frente de Pareto de um espaço
  de conceção, incerteza e sensibilidade ao longo de milhares de execuções, e um dossiê de missão
  num só comando com uma matriz de verificação e um PDF; ver [`docs/PRO.md`](docs/PRO.md).
- **Vigilância de campanhas, coexistência espetral e serviço de tarefas do Kshana Pro** — um pipeline que
  falha quando um valor vigiado piora, planos de sinais testados face aos sinais abertos de
  navegação por satélite nos dois sentidos, e uma fila local de tarefas com um
  registo de entregas encadeado por hashes; ver [`docs/PRO.md`](docs/PRO.md).
- **Formação e consultoria** em análise de desempenho PNT quântico/clássico.

Este é o modelo open-core: o motor tem, e mantém, uma licença aberta; o negócio que o
sustenta é o conhecimento especializado, o suporte e as extensões proprietárias — não taxas de licença.
Contacto **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Investigação

Os estudos construídos sobre o motor aberto são publicados no arXiv. Cada um nomeia o comando do motor
por trás dele, para que os seus números possam ser regenerados a partir de um cenário ou exemplo de estudo incluído.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Investigação construída sobre o motor aberto: seis artigos no arXiv, cada cartão com o nome do artigo, a sua data e categoria, e o comando do motor que regenera os seus números. Os mesmos seis artigos, com ligações e comandos, estão na tabela abaixo." width="100%">
</picture>

| Artigo | O que mostra | Comando do motor |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | A queda da pontuação de um detetor de interferência GNSS quando as condições mudam pode ser prevista apenas a partir de estatísticas dentro da distribuição, numa bancada sintética aberta e depois em gravações de campo abertas. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Um recetor de temporização GNSS sob spoofing não tem um limite incondicional finito para o erro de tempo não detetado, pelo que o artigo dá um condicional, calibrado num spoof real gravado por via rádio da campanha pública JammerTest 2024. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Uma pontuação de resiliência composta única só é uma base estável para uma decisão quando uma conceção domina; quando as conceções competem, a reponderação por si só pode mudar o vencedor. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | A telemetria dentro de uma constelação lunar deixa a posição absoluta de uma estação de superfície não observável; um atraso de interferometria de muito longa base (VLBI) a partir da Terra restaura-a quando a constelação é esparsa, e aperta-a quando é rica. | o tipo `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | As constelações planeadas de quatro a seis satélites dão uma geometria fraca no polo sul lunar, e algumas balizas de telemetria de superfície corrigem-na de forma muito mais barata do que mais satélites. | o tipo `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | A diluição da precisão não está definida para o seguimento cislunar só por distância, porque a velocidade não é observável num instantâneo, pelo que o artigo usa o gramiano de observabilidade em quatro órbitas retrógradas distantes planas: só distância tem característica 2 de 4 num instantâneo e precisa de um arco de cerca de 2.09 h para se tornar totalmente observável, com o condicionamento a melhorar à medida que o arco se alonga; a taxa de variação da distância (Doppler) dá característica 4 instantaneamente; e co-estimar uma estação com os estados e relógios dos satélites mantém uma deficiência de característica de um, a menos que seja acrescentado um observável interferométrico externo. Os requisitos pertencem a orçamentos de comprimento de arco, condicionamento e tipo de medição, não ao DOP. | o tipo `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (o seu irmão `cislunar-arc-recovery` testa o limiar com um estimador independente por diferenças finitas) |

Os três exemplos de estudo escrevem artefactos determinísticos ao byte (sementes fixas) que registam a sua
versão do motor, as sementes e um hash da configuração. Os três artigos lunares e cislunares são construídos sobre o
conjunto lunar (o nível de evidência de cada parte está na matriz de verificação); as suas afirmações de geometria e de diluição da precisão são também verificadas de forma cruzada
face a referências separadas em `tests/validate_p*.rs`. Mais em
[Artefactos de estudo reprodutíveis](#reproducible-study-artifacts) em Referência.

<a id="cite"></a>
## Citar

Se usar o Kshana em trabalho académico ou técnico, cite a versão que usou, com o
cenário e a semente. [`CITATION.cff`](CITATION.cff) contém os metadados legíveis por máquina, e
o GitHub mostra a partir dele um botão "Cite this repository". Todas as versões são arquivadas no Zenodo;
o DOI (Digital Object Identifier) conceptual
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) resolve sempre para a
versão mais recente.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Os artigos acima:

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
## Licença

O Kshana tem licença dupla: a GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)), ou uma
**licença comercial** da Ashforde® OÜ para integração fechada à qual a AGPL não se adeque.
[`LICENSING.md`](LICENSING.md) explica qual se aplica. As contribuições são licenciadas à entrada
sob a AGPL e concedem também à Ashforde® OÜ o direito de as incluir na edição
comercial; assine cada commit com `git commit -s` (ver [`CONTRIBUTING.md`](CONTRIBUTING.md)).
"Kshana" e as suas marcas são marcas registadas da Ashforde® OÜ: a licença cobre o código, não o
nome, pelo que se pede que mude o nome dos forks.

<a id="reference"></a>
## Referência

O material extenso, recolhido. Todos os documentos estão listados em [Documentação](#documentation).

<details>
<summary>Instalar e compilar a partir do código-fonte</summary>

<a id="install--build"></a>
### Instalar e compilar

Requer uma toolchain Rust (≥ 1.88, a `rust-version` em Cargo.toml; desenvolvido em 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Utilização: a linha de comandos por extenso</summary>

### Utilização

Execute qualquer cenário; a CLI despacha pelo campo `kind` do cenário e escreve
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` e
`<scenario>.report.json` ao lado dele — mais `<scenario>.table.csv` para os tipos que
publicam uma tabela. O relatório (uma página em HyperText Markup Language (HTML) e um documento JSON
com o mesmo conteúdo) contém um resumo executivo, cada entrada com a sua unidade, os
resultados e gráficos, as tabelas de varrimento, Monte Carlo ou cadeia de uma campanha, uma cronologia de eventos,
a etiqueta VALIDATED / MODELLED / PARTNER e a fonte de cada capacidade que a execução usou,
o que não é modelado, e um registo de reprodutibilidade (versão do motor, resumos Secure Hash
Algorithm 256-bit (SHA-256), semente, plataforma e o comando exato). Imprime-se para
um ficheiro PDF (Portable Document Format) limpo a partir do navegador em papel A4 ou Letter; o
motor não escreve nenhum PDF por si. Ver [`docs/REPORTS.md`](docs/REPORTS.md).

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

`--export <czml|kml|geojson|stk|sigmf|all|list>` escreve CZML (a Cesium Language), KML
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), efemérides Ansys STK (Systems Tool Kit) `.e`
e gravações SigMF (Signal Metadata Format) ao lado do cenário, e
`--import-route <route.geojson>` alimenta os tipos que percorrem trajetórias com uma linha GeoJSON. Cada
formato é validado face à sua especificação publicada, e um cenário ao qual um formato não
se aplica diz porquê: ver [docs/INTEROP.md](docs/INTEROP.md).

**Outros modos da CLI** — verificar um cenário, fornecer dados reais de orientação da Terra, ou executar um conjunto inteiro:

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

**Exportação de animações.** `--animate svg|html|frames|all` escreve `<scenario>.animation.svg`
(keyframes de Cascading Style Sheets (CSS), sem script), `<scenario>.animation.html` (reproduzir, pausar, percorrer, velocidade e
painéis sincronizados, sem nenhum recurso externo) e `<scenario>.frames/` (`frame_0000.svg`, … mais
`manifest.json` com os fotogramas por segundo e a duração). Uma campanha reproduz as suas fases e
alarmes, uma execução de espectro a sua cascata; o tema segue `prefers-color-scheme` e
`prefers-reduced-motion` mostra a imagem final. Apresenta as próprias amostras da execução,
idênticas ao byte numa reexecução, e não acrescenta nenhuma evidência. Ver [docs/ANIMATION.md](docs/ANIMATION.md).

Um manifesto de **conjunto** é um pequeno ficheiro TOML (Tom's Obvious, Minimal Language) — um `title` e uma lista `scenarios = [ … ]` de
caminhos de cenários — que o motor executa por ordem, integrando cada resultado (com as suas
etiquetas MODELLED / VALIDATED) num único artefacto de estudo autodescritivo. Ver
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Papel na interoperabilidade.** O Kshana é a camada de *simulação de desempenho* que fica
ao lado da cadeia de ferramentas de pós-processamento, não um substituto dela: passe a sua saída **RINEX**
ao RTKLIB ou ao gLAB para uma solução de posição, e use a sua saída **SP3** como
produto de órbita precisa para ferramentas como o Ginan — o Kshana responde a *que resiliência uma dada
arquitetura PNT proporciona* antes de ter sinais reais, em formatos que essas ferramentas já
ingerem (`--export-sp3`, ou `export_sp3 = true` num cenário `orbit`, escreve
`<scenario>.sp3`). A mesma órbita pode ser publicada como elementos médios **CCSDS OMM**
normalizados (`--export-omm`, ou `export_omm = true`, escreve `<scenario>.omm`) —
uma mensagem OMM 502.0 KVN (notação palavra-chave = valor) por satélite definido por TLE, com o número
de catálogo NORAD (North American Aerospace Defense Command) real de cada objeto, o designador internacional COSPAR (Committee
on Space Research) e a época, para qualquer
consumidor que conheça o OMM em vez de um conjunto de elementos de duas linhas feito à medida.

Exemplo de saída (holdover do relógio — repare como são indicados os valores de mérito de Integridade e Segurança):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

O erro de temporização no percentil 95 (p95) do relógio ótico é 1.20e-4 ns: o resumo
imprime valores pequenos com algarismos significativos em vez de os arredondar para `0.0`.
`security` indica `n/a (no attack)` porque este cenário não configura nenhum ataque, pelo que não há
nada a detetar. O resultado JSON continua a conter o limite analítico de
detetabilidade de spoofing de cada relógio em `fom.security` (0.997 para o relógio ótico, 0.000 para o
relógio atómico à escala de chip, cujo próprio ruído ao longo da janela de monitorização excede a especificação
de 20 ns), e o seu bloco `figure_tiers` marca esse valor `applicable: false`. O tipo de cenário `spoof`
pontua a deteção face a um ataque injetado. `figure_tiers` dá também a
cada valor indicado o seu nível de verificação — VALIDATED (verificado face a uma referência
externa) ou MODELLED — e a linha da matriz de verificação de onde o nível é lido. O cenário
de órbita indica adicionalmente um bloco de geometria — fração de amostras com posição, e
diluição da precisão de posição (PDOP) melhor/mediana e exatidão de posição — ao lado do
resultado do relógio.

> **Leia estes dois números com cuidado.** `security` é um *limite analítico de
> detetabilidade de spoofing* deduzido da estabilidade de cada relógio — só tem significado face a um
> cenário de spoofing configurado e **não** é um detetor RAIM multissatélite. `integrity`
> aqui é a *autoconsistência* do filtro (fração de amostras da interrupção dentro do seu próprio limite
> k-sigma), **não** um valor de integridade HPL/VPL de aviação. Ver
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Para uma verdadeira integridade autónoma do recetor, o **tipo de cenário `integrity`**
> (`scenarios/integrity-raim.toml`) executa RAIM real instantâneo e por separação de soluções
> (estilo ARAIM) sobre a geometria da constelação propagada: calcula
> **níveis de proteção (HPL/VPL)** horizontal/vertical por época e indica a
> fração de épocas que cumprem os limites de alerta configurados, com um diagrama de integridade
> de Stanford para a classificação erro vs PL (nível de proteção).

<a id="reproducible-study-artifacts"></a>
#### Artefactos de estudo reprodutíveis

Quatro estudos abertos regeneram cada um um artefacto determinístico ao byte (semente fixa) a partir de um
comando — os números por trás dos estudos de cruzamento quântico vs clássico, de desvio de otimismo das
perturbações RF, de pontuação de resiliência PNT e de nível de proteção de temporização:

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

Cada artefacto regista a sua versão do motor, as sementes e um hash da configuração, e traz uma etiqueta honesta
MODELLED/VALIDATED. As sondas de dados reais (`*_probe`) executam o mesmo pipeline sobre
gravações que fornece localmente; nenhum conjunto de dados é distribuído no repositório. O estudo do desvio de otimismo
das perturbações RF está descrito no preprint
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), e o nível de proteção de temporização
condicional (`tpl_jammertest` acima) no preprint
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (ver [Citar](#cite)).

Os estudos de PNT lunar publicados ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP com balizas de superfície, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) observabilidade
VLBI e [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) observabilidade cislunar por
comprimento de arco) têm as suas afirmações de geometria, diluição da precisão, previsão em tempo real de referenciais /
parâmetros de orientação da Terra (EOP), órbitas retrógradas distantes e telemetria RF
verificadas de forma cruzada e independente em
`tests/validate_p*.rs` face a referências separadas (`scipy.special.j1`, uma resolução independente de DOP
`(HᵀH)⁻¹` em NumPy, uma releitura em NumPy das mesmas linhas IERS `finals2000A`, e a
NASA/JPL Three-Body Periodic Orbit Database). São verificações de regressão adicionais sobre
o conjunto lunar **modelado**; não alteram a contagem da matriz verificada por máquina.

</details>

<details>
<summary>Formato de cenário</summary>

<a id="scenario-format"></a>
### Formato de cenário

Os cenários são TOML declarativo. Um `kind` de nível superior seleciona o pacote — **cinquenta** ao
todo (`clock` é o predefinido se omitido): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (bancada de avaliação da deteção de perturbações RF
por IA/ML — corpus sintético rotulado + mecanismo ROC/AUC independente do detetor +
desvio de otimismo dentro/fora da distribuição), `quantum-trade` (estudo de compromissos PNT quântico vs clássico
com ingestão de ADEV medido + envolvente de resiliência sem GNSS; MODELLED),
`space-weather` (índices solares/geomagnéticos + temperatura exosférica Jacchia-71 +
densidade termosférica determinada pela atividade sobre a atmosfera estática; MODELLED),
`oem-interop` (ponte de importação/ciclo completo CCSDS OEM para efemérides GMAT/Orekit/STK;
MODELLED), o trio de análise de missão `launch-window` (azimute de lançamento de dois corpos /
mudança de plano / oportunidades), `reentry` (corredor de reentrada balística de Allen-Eggers),
`eo-coverage` (geometria de faixa / GSD / acesso / revisita de observação da Terra), `space-packet` (enquadramento
Space Packet CCSDS 133.0 TM/TC — telemetria/telecomando — com disposição exata dos bits, verificado em ciclo completo), e
`attitude-budget` (binário de gradiente gravítico 3-DOF + orçamento de erro de apontamento RSS),
`passes` (previsão de passagens nascer/pôr sobre estações terrestres — AOS/TCA/LOS, elevação máxima,
acesso), e `link-budget` (equação de ligação CCSDS/DSN num sentido — FSPL / Eb·N₀ /
margem / fecho); `telecom-timing` (erro de tempo em holdover, MTIE e TDEV verificados
face às máscaras ITU-T); `spectrum` (toda a banda L do GNSS como uma densidade espectral de potência:
uma cascata frequência-tempo sob uma cronologia programada de jammers de onda contínua, banda estreita, chirp ou
ruído adaptado, razão jammer-sinal por banda e densidade portadora-ruído efetiva
a partir do coeficiente de separação espetral, e entrada e saída de gravações Signal Metadata
Format (SigMF) com estimativas espetrais de Welch; os espetros dos sinais
VALIDATED face a valores de manual, o cenário de jammer MODELLED; ver
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); o mesmo tipo desenha painéis das bandas UHF, S e C com
sinais de órbita terrestre baixa concebidos); `leo-signal` (conceções de sinais de posicionamento, navegação e
temporização em órbita terrestre baixa para qualquer sistema: espetros de banda limitada, jitter de seguimento de código e exatidão
de distância, pesquisa e tempo de aquisição, separação espetral face ao GPS e ao Galileo, tolerância a jammers
e um estudo de compromissos de UHF a banda C, a partir de predefinições públicas como Xona Pulsar, Iridium,
Starlink e CentiSpace ou de conceções incorporadas; as formas fechadas e o Doppler LEO VALIDATED, as
conceções MODELLED; ver [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (o Sol, os planetas, Plutão, a Lua e sete luas
principais numa época — posições, constantes, tempos-luz e traços de órbita; posições dos planetas
VALIDATED face ao JPL Horizons) e `body-pnt` (posicionamento em torno de qualquer desses corpos com uma
constelação de navegação local e uma ligação de espaço profundo a partir da Terra; MODELLED); `campaign` (tipos existentes compostos numa cronologia de missão encadeada
com estado passado entre fases, um varrimento de parâmetros, um conjunto Monte Carlo com semente, ou
vários cenários sob uma condição partilhada; MODELLED, ver
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (padrões Walker delta e estrela,
listas de elementos e conceções multicamada com predefinições GPS, Galileo, BeiDou e GLONASS,
e cobertura e diluição da precisão sobre uma grelha de latitude/longitude; o
gerador e o DOP global GPS VALIDATED face aos documentos de serviço publicados, ver
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (uma passagem de satélite de
posicionamento, navegação e temporização (PNT) em órbita terrestre baixa (LEO) e o seu orçamento de ligação banda a
banda, a partir de qualquer constelação e qualquer conceção de sinal: ângulos de observação, Doppler e taxa de Doppler,
perdas ITU-R por chuva, gases, cintilação e entrada em edifícios, densidade portadora-ruído face aos
satélites GNSS MEO visíveis, a ionosfera de primeira ordem e pares livres de ionosfera, e um
orçamento de posição de baixa energia, sondagem da ionosfera a partir de cada par de bandas, e monitores de spoofing por
consistência do Doppler e da geometria da passagem e por consistência entre bandas; os termos ITU-R e a
envolvente Doppler de utilizador estático VALIDATED, a passagem MODELLED, ver
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (a mensagem difundida de
efemérides e relógio de um satélite PNT em órbita terrestre baixa (LEO), para qualquer órbita e
portadora: um ajustador de uma órbita de verdade integrada para o conjunto kepleriano Galileo, esse conjunto
com polinómios de correção ao longo da trajetória, transversal e radial, o modelo de Liu et al. 2025
de 22 parâmetros ou o polinómio ECEF de relógio zero ATOMIC; erro de distância do sinal no espaço
(SISRE) em função do intervalo de ajuste e do período de atualização, uma verificação de continuidade de atualização a meio da passagem,
a trama binária documentada própria do Kshana com uma verificação de redundância cíclica CRC-24Q e um orçamento de quantização, e um
bloco ao estilo RINEX-4 rotulado como extensão do Kshana; os pesos SISRE, o algoritmo de utilizador
Galileo e o CRC-24Q VALIDATED, os ajustes MODELLED; predefinições opcionais para Xona Pulsar,
Iridium, Starlink, CentiSpace, um sistema representativo em banda C, ATOMIC e Celeste IOD; ver
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); o trio de **PNT fundido MEO + LEO**
`leo-pvt` (posicionamento Doppler a partir da taxa de variação da distância em órbita terrestre baixa (LEO), posições conjuntas por
pseudodistância GNSS + LEO com biases entre sistemas e o DOP em função do número de satélites
LEO, cobertura polar e ártica, e transferência de tempo LEO para UTC — sobre qualquer constelação,
com predefinições opcionais como sinais de oportunidade Xona Pulsar, Iridium e Starlink; a
envolvente Doppler LEO VALIDATED face aos valores publicados da Iridium e da Xona), `leo-ppp`
(convergência do posicionamento preciso por ponto só com GNSS e com aumento LEO, comparada
com Li et al. 2019) e `ntn-positioning` (posicionamento em rede não terrestre 5G a partir do
limite de Cramér-Rao da largura de banda do sinal), MODELLED à exceção dessa envolvente, ver
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (um sistema LEO-PNT de ponta
a ponta: uma conceção `leo-signal` transportada por uma banda `leo-pass`, o C/N0 da passagem e o erro de distância
do sinal no espaço da mensagem de navegação passados a uma posição fundida `leo-pvt` e à convergência `leo-ppp`,
com cada passagem listada; MODELLED, ver
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), que é também a visão geral de
todos os tipos e cenários LEO-PNT, incluindo as campanhas de resiliência, um cenário por
área de foco experimental e um por setor de utilizador final); o **conjunto PNT lunar** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; o **demonstrador de PNT com tecnologia quântica**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; e os tipos de investigação
de **segurança do sinal, cislunar e resiliência em camadas** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — o trio de análise de missão e estes tipos posteriores todos MODELLED
(cada um com um núcleo em forma fechada validado; ver a matriz).
Campos comuns: `seed`, uma grelha `[time]`, uma cronologia de disponibilidade `[gnss]` (o motor
da interrupção) e blocos por sensor com strings `provenance` que citam a fonte de cada
valor. Exemplo (relógio):

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

Campos opcionais (desligados quando ausentes): um relógio pode acrescentar `flicker_floor` (piso de Allan de FM 1/f — modulação
de frequência); um sensor inercial pode acrescentar `gyro_bias` e `q_arw` (bias do giroscópio e passeio aleatório
angular), e `bias_instability` e `q_aa` (o piso de instabilidade do bias de Allan e o
passeio aleatório da aceleração) — em conjunto um **orçamento de erro de acelerómetro
de eixo único (1-DOF)** (VRW/ARW — passeio aleatório de velocidade/angular — e instabilidade do bias). Este é o orçamento de erro que o *pacote*
de cenário `inertial` distribuído executa. Separadamente, a biblioteca contém agora um **navegador
strapdown de 3 eixos** verificado (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
atitude em quaterniões com compensação de coning/sculling, uma mecanização NED completa
(termos de taxa da Terra e taxa de transporte, gravidade de Somigliana WGS-84), e um
modelo determinístico de erros da IMU em que **fator de escala, desalinhamento,
sensibilidade a g, quantização e rampa de taxa são modelados** (IEEE Std 952-1997, a norma IEEE
de especificação e procedimento de teste de giroscópios, §A.2; Groves 2013 §4.3). Essa via de 3 eixos está agora **ligada a um pacote
GNSS/INS fracamente acoplado executável** (`kind = "gnss-ins"`): um EKF de estado de erro de 15 estados
disciplina a solução strapdown face a posições com ruído enquanto o GNSS está disponível, e depois
atravessa a interrupção em roda livre, indicando o erro horizontal fundido face à
roda livre INS livre em malha aberta. Está também disponível uma atualização de **pseudodistância fortemente acoplada**
(forma a inovação no domínio da distância, pelo que continua a corrigir
com menos de quatro satélites). Um
cenário de holdover do relógio pode acrescentar `runs` (> 1) para executar um **conjunto Monte Carlo** — cada
valor de mérito é então indicado como média com uma dispersão entre os percentis 5 e 95 e o
gráfico sombreia a banda de confiança do erro (ver `scenarios/clock-ensemble.toml`).

Um cenário `fusion` (os mesmos blocos que `hybrid`) executa **dois estimadores de Kalman independentes**
— um para o estado do relógio, um para o estado da posição — disciplinados pelo GNSS e assistidos pela
transferência de tempo ótica, e indica um FoM de holdover combinado. Os dois blocos não partilham
covariância cruzada: isto é um par empilhado de orçamentos de erro, **não** um verdadeiro filtro conjunto
acoplado relógio+posição (a covariância entre blocos é um item do roteiro). Ver
`scenarios/fusion-pnt.toml`.

Um cenário `spoof` injeta um spoofing de tempo — um de quatro tipos `[attack.shape]`
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; um `rate_ns_per_s` isolado continua a ser
aceite como rampa linear) — e executa o detetor de spoofing de cada relógio. O detetor é um
**teste de energia χ²₁ / Neyman–Pearson** bilateral sobre a estatística do monitor assistido pelo relógio:
o limiar é fixado a partir de um orçamento alvo de falsos alarmes `target_pfa`, e a
**probabilidade de deteção falhada `P_md`** é indicada tanto em forma fechada como por
Monte-Carlo (`mc_runs` ensaios por hipótese — os dois concordam a poucos ×1/√N). O
**valor de mérito de Segurança é `1 − P_md`** na magnitude operacionalmente prejudicial (a da especificação),
pelo que um relógio silencioso que apanha um spoofing do tamanho da especificação pontua ≈ 1 e um com ruído
que muitas vezes o falha pontua menos (ver `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Um cenário `gnss-sim` é uma simulação no **domínio das medições**: para cada satélite
visível sintetiza a pseudodistância `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` e o Doppler L1, com a ionosfera de frequência única **Klobuchar**
(`[iono]`, IS-GPS-200 §20.3.3.5.2.5) e a troposfera zenital de **Saastamoinen**
projetada pela função de mapeamento de **Niell (1996)** (`[tropo]`). Os
resíduos alimentam o **RAIM instantâneo** para HPL/VPL por época, e a pseudodistância, o Doppler, o C/N₀ e as
correções iono/tropo de cada satélite são emitidos no array JSON
`gnss_measurements`. É um simulador direto (gera medições a partir de
uma verdade conhecida), não um recetor/solucionador — uma execução sem ruído reproduz a geometria mais as
correções abaixo do milímetro (ver `scenarios/gnss-sim-raim.toml`).

Um cenário `jamming` modela a interferência RF como um **orçamento de ligação**: um `[jammer]`
(posição ECEF, `power_dbw` transmitida, tipo) eleva a razão jammer-sinal num
`[receiver]` que observa uma `[constellation]` Walker. A partir da geometria (perda de percurso
em espaço livre e o ganho da antena recetora por direção) calcula o `J/S` de cada satélite,
o **C/N₀ efetivo** através da equação antijamming padrão (ganho de processamento por
desespalhamento × o fator de separação espetral `Q`; Kaplan & Hegarty §9.4), e
assinala a perda de seguimento abaixo de um limiar de seguimento configurável — indicando um
valor de mérito `availability_under_jamming`. Um jammer de banda larga de 10 W a 1 km
nega totalmente o recetor (J/S ≈ 72 dB); o mesmo jammer a 100 km apenas
degrada as ligações (ver `scenarios/jamming-demo.toml`).

Um cenário `sweep` executa um **estudo de compromissos**: faz variar um `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` ou `classical_q_wf`) de `start` a `stop` ao longo de `steps`
pontos numa `scale` `lin` ou `log`, regista uma `metric` (p. ex. `holdover_s`) para ambos os
relógios e desenha as duas curvas. O cenário de base vai em `[base]` (ver
`scenarios/sweep-clock-stability.toml`).

Um cenário `sweep-nd` generaliza isto a **qualquer pacote e qualquer número de eixos**: faz
variar chaves TOML pontuadas de um cenário `[base]` (de qualquer `kind`) sobre o produto
cartesiano dos `[[axes]]`, reexecuta cada nó da grelha e regista `metrics` dadas como
caminhos JSON pontuados no resultado (p. ex. `classical.fom.holdover_s`). Funciona para
todos os pacotes porque opera na fronteira TOML/resultado; as execuções nativas avaliam
a grelha em paralelo (sem dependência extra, o wasm recorre ao modo sequencial) e a
saída é determinística e por linhas (ver `scenarios/sweep-nd-inertial.toml`).

Um cenário `orbit` deduz a cronologia `[gnss]` a partir da geometria em vez de a definir
à mão — forneça uma órbita `[user]`, uma `[constellation]`, uma `mask_deg` de elevação e os dois
blocos de relógio. Indica também a exatidão de posição a partir da geometria dos satélites; o
`sigma_uere_m` opcional (erro de distância equivalente do utilizador a 1 sigma, predefinido 1 m) escala a
diluição da precisão de posição para um sigma de posição. A órbita do utilizador pode ser tornada
**excêntrica** com `eccentricity` e `argp_deg`, e `j2 = true` acrescenta a deriva secular do
achatamento da Terra (ver `scenarios/orbit-molniya.toml`). A constelação pode em alternativa ser uma
**constelação real**: dê a `[constellation]` um bloco `tle` de conjuntos de elementos de duas linhas e os
satélites são lidos a partir dele (ver `scenarios/orbit-real-tle.toml`). Acrescente um ou mais
blocos `[[constellations]]` para **multi-GNSS** (p. ex. GPS + Galileo; ver
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

Os tipos de **alt-PNT sem GPS** navegam sem qualquer GNSS, comparando uma sequência medida de um campo
com um mapa através de um filtro de partículas. Um cenário `gravity-map` percorre uma trajetória
através de um campo de anomalias gravíticas em harmónicos esféricos e recupera-a a partir da leitura de um
gravímetro de átomos frios (`scenarios/gps-denied-gravity-nav.toml`); um cenário `terrain-nav`
faz o mesmo face a um DEM de elevação SRTM (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
e um cenário `combined-altpnt` funde **gravidade + magnético IGRF + terreno** num único filtro
(`scenarios/combined-altpnt.toml`).

Um cenário `lunar-integrity` avalia o PNT **cislunar**: executa uma passagem de nível de proteção ARAIM
no polo sul lunar face a um conjunto de retransmissores LunaNet/LNIS e indica honestamente a
lacuna de integridade — um σ_URE lunar de ~30 m leva o nível de proteção bem acima de um limite de alerta
de 50 m, pelo que o serviço está *indisponível* segundo regras de integridade ao estilo da aviação
(`scenarios/lunanet-araim.toml`).

Um cenário `lunar-time-offset` indica a **taxa relativista entre relógios da Terra e da Lua** — a
base de uma escala de Tempo Coordenado Lunar (LTC/TCL). Uma identidade pós-newtoniana a partir de primeiros princípios
soma a diferença de autopotencial (o potencial do geoide IAU `L_G` menos o autopotencial
à superfície da Lua) e o termo cinético da Lua (Doppler de segunda ordem) numa taxa
secular de ≈ 57 µs/dia, apresentada com a banda publicada de 56–59 µs/dia; dá também o
desvio LTC−TT acumulado ao longo de um horizonte e um conjunto por variância inversa (um
relógio de papel lunar). **MODELLED** — o valor principal *depende da referência* (geoide terrestre
face ao selenoide lunar, janela de média), razão pela qual é indicada uma banda e não um único número
certificado (`scenarios/lunar-time-offset.toml`).

Ver `scenarios/` para pelo menos um exemplo resolvido de cada tipo (92 tipos, 193 ficheiros de cenário
`.toml` + 1 manifesto de conjunto — vários tipos incluem mais do que um exemplo). Nem todos os
tipos têm um ficheiro com o seu nome: `lunar-integrity` → `scenarios/lunanet-araim.toml` e
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` são dois de vários casos destes.
Liste os tipos despacháveis a qualquer momento com os erros de `cargo run -- --validate <file>`,
o `list_kinds()` do Python ou a ferramenta MCP `list_scenario_kinds`.

</details>

<details>
<summary>Saída</summary>

### Saída

O artefacto de resultado é JSON versionado e autodescritivo: séries temporais por passo, os
valores de mérito pontuados, as especificações dos modelos ativos (com proveniência), a semente, um
**hash do cenário** — para que qualquer gráfico possa ser reproduzido a partir do ficheiro — e, para cada relógio,
uma `adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): o desvio de Allan
sobreposto ao longo de tempos de média espaçados por oitavas — a forma padrão de ler a
estabilidade de um relógio — agora com uma **banda de confiança de 95% específica do tipo de ruído** por ponto (o
tipo de lei de potência do registo é identificado a partir do seu declive de Allan modificado, e o intervalo χ² usa os
graus de liberdade efetivos NIST SP 1065 correspondentes). O playground do navegador apresenta-o como um
gráfico log-log "Clock stability (ADEV)". (MDEV, TDEV e HDEV estão disponíveis como estimadores
da biblioteca; a curva de resultado exportada é o ADEV sobreposto.) Cada campo, com unidades e uma
indicação da fonte, está documentado em [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Cada gráfico é autodescritivo.** O playground do navegador, a exportação `*.chart.svg`
da CLI e o quadro de pontuação HTML (HyperText Markup Language) carimbam todos cada imagem de gráfico com um rodapé que diz
`Kshana v<version> · scenario <hash> · kshana.dev`. O `scenario <hash>` são os primeiros
12 caracteres hexadecimais do **hash do cenário** da execução — um resumo SHA-256 (o Secure Hash Algorithm de 256 bits) sobre a definição
canónica do cenário (semente, limiares, parâmetros dos modelos, janelas GNSS, …); os relatórios de integridade e
lunares, que não têm hash próprio, recorrem a um SHA-256 da fonte do cenário.
É a **mesma impressão digital** mostrada no resumo de uma linha e no JSON do resultado, pelo que um
gráfico guardado ou colado traz sempre a sua versão, o cenário exato que o produziu (para
reprodução bit a bit) e a fonte — altere qualquer entrada e o hash muda.

Os valores de mérito seguem os valores de mérito PNT operacionais padrão:

| Valor de mérito | Como o Kshana o calcula |
|-----------------|------------------------|
| Desempenho de temporização (pacotes de relógio/órbita) | RMS do erro de fase do relógio + percentil 95 ao longo da interrupção, em **nanossegundos** (`timing_rms_ns`) — uma métrica de temporização, não de posição |
| Desempenho de posicionamento (pacotes inercial/híbrido) | RMS do erro de posição 1-DOF + percentil 95 ao longo da interrupção, em **metros** (`pos_rms_m`); eixo único. Uma execução única é marcada `monte_carlo: false`; defina `runs = N` para um conjunto Monte Carlo que indica a média, a dispersão e o IC (intervalo de confiança) de 95% por bootstrap de cada métrica. Continua a **não** ser um CEP/2DRMS 2-D (erro circular provável / duas vezes o valor quadrático médio da distância) nem uma exatidão ponderada pelo DOP (esses precisam do modelo de 3 eixos — roteiro) |
| Autonomia | duração do holdover — tempo dentro da especificação após a perda do GNSS (quantizado pela grelha: um limite inferior) |
| Resiliência | declive do crescimento do erro durante a interrupção |
| Disponibilidade | fração da execução com uma solução dentro da especificação |
| Integridade | **autoconsistência** do filtro — fração de amostras da interrupção cujo erro fica dentro do próprio limite k-sigma do filtro de Kalman. **Não** é um valor de integridade HPL/VPL/RAIM de aviação (ver [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Segurança | **limite analítico de *detetabilidade* de spoofing** a partir da estabilidade do relógio — quão pequeno/lento pode ser um spoofing de tempo que um monitor de consistência de relógio único conseguiria assinalar. Só tem significado com um ataque configurado; **não** é um detetor RAIM multissatélite |

É novo nestes termos? Cada um está definido em linguagem simples no [glossário](docs/GLOSSARY.md).

</details>

<details>
<summary>Organização do repositório</summary>

### Organização do repositório

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
<summary>Perguntas frequentes (FAQ)</summary>

### Perguntas frequentes

**Preciso de perceber física quântica para usar isto?**
Não. Se consegue executar uma linha de comandos, consegue executar o Kshana. Comece pelo
[guia em linguagem simples](docs/CONCEPTS.md); procure os termos no [glossário](docs/GLOSSARY.md).

**Isto é uma conceção de hardware quântico ou software de voo?**
Não. É um *simulador* de desempenho. A fidelidade ao hardware quântico vem de modelos de erro
publicados, não desta ferramenta. Ver [O que é / não é](#what-it-is--is-not).

**Os resultados quânticos são realistas, ou marketing?**
Cada parâmetro é citado a partir de uma folha de dados ou de um artigo, cada modelo é validado face a uma
relação de manual, e a maturidade é rotulada honestamente em
[VALIDATION.md](docs/VALIDATION.md) — incluindo que nenhum relógio ótico de estrôncio
voou. O motor é neutro: quântico e clássico são o mesmo código com números
publicados diferentes.

**Posso confiar que duas execuções concordam?**
Sim — as execuções são determinísticas: `scenario + seed + engine version → bit-identical output`,
imposto por `scripts/check-reproducible.sh`.

**Posso usá-lo a partir de Python ou num navegador?**
Sim — ver [Instalar](#install): os exemplos de Python e WebAssembly estão nessa secção. Ambos chamam o mesmo motor.

**Como modelo o meu próprio sensor?**
Escreva um cenário `.toml` com os valores publicados do seu sensor nos campos
`provenance`. Ver [Formato de cenário](#scenario-format) e os exemplos em `scenarios/`.

**É gratuito para uso comercial?**
Sim — sob a AGPL-3.0, incluindo em contextos comerciais, desde que respeite o
copyleft da AGPL (nomeadamente: se modificar o Kshana e o disponibilizar através de uma rede, tem de
disponibilizar a esses utilizadores o seu código-fonte modificado). Se isso não lhe convier — p. ex. se precisar de
incorporar o Kshana num produto proprietário ou de executar um serviço de rede fechado — está disponível
uma licença comercial da Ashforde® OÜ; ver [`LICENSING.md`](LICENSING.md) e
[Suporte](#support--professional-services).

</details>

<details>
<summary>Resolução de problemas</summary>

### Resolução de problemas

**`cargo build` falha numa toolchain antiga.** O Kshana precisa de Rust ≥ 1.88. Atualize com
`rustup update`.

**A compilação da extensão Python falha na ligação em macOS** (`Undefined symbols … _Py…`).
Uma extensão Python resolve os seus símbolos no momento do carregamento. O `maturin` define automaticamente a opção
de ligação correta — use `maturin develop --features python` em vez de um simples
`cargo build`.

**A compilação Python queixa-se de que o interpretador é mais recente do que o PyO3 conhece.** Defina
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (as wheels abi3 são compatíveis com versões futuras do
CPython).

**A compilação WebAssembly não encontra o alvo.** Instale-o uma vez com
`rustup target add wasm32-unknown-unknown`, e depois `wasm-pack build --target web -- --features wasm`.

**Para onde foi a minha saída?** Cada execução escreve `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` e `<scenario>.report.json` ao lado
do `.toml` de entrada, e
também `<scenario>.table.csv` para os tipos que publicam uma tabela. Todos são
ignorados pelo git por conceção.

</details>

<details>
<summary>Versões e lançamentos</summary>

### Versões e lançamentos

O Kshana segue o [Semantic Versioning](https://semver.org). Enquanto estiver antes da 1.0, o esquema público
de cenários/resultados ainda pode mudar; as alterações incompatíveis são assinaladas explicitamente no
[`CHANGELOG.md`](CHANGELOG.md). Cada resultado é reprodutível a partir de
`scenario + seed + engine version`.

**Cada etiqueta `vX.Y.Z` publica automaticamente todos os canais, por uma ordem fixa** — o conjunto
completo de testes corre primeiro no commit etiquetado, nada é publicado até passar, e
depois o pipeline verifica que cada registo serve realmente a nova versão
([`docs/RELEASING.md`](docs/RELEASING.md)). Os canais:

| Canal | Instalar / obter | Conteúdo |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | Biblioteca Rust + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | o servidor MCP |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | wheels abi3 (Linux/macOS/Windows) + sdist (distribuição de código-fonte) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | Módulo WebAssembly + invólucro JS |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | imagem OCI (Open Container Initiative) multiarquitetura — não é precisa toolchain |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | lançador: descarrega o binário da versão, verifica `SHA256SUMS`, executa-o |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | o mesmo lançador para Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | o binário `kshana-mcp`, gerado a partir do `SHA256SUMS` de cada versão |
| Claude Desktop | duplo clique em `kshana-mcp-<target>.mcpb` da versão | a extensão, com o binário lá dentro |
| registo MCP oficial | descoberto automaticamente pelos clientes MCP | `io.github.ashfordeOU/kshana-mcp` (imagem OCI, pacotes npm e PyPI) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → pesquisar "Kshana" | o plugin para IDE **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | descarregar | o binário de linha de comandos `kshana` para Linux x86-64, macOS (Apple silicon e Intel) e Windows x86-64, o binário `kshana-mcp` para cada um desses sistemas e Linux Arm, uma extensão Claude Desktop `.mcpb` por sistema, um **SBOM** CycloneDX, proveniência de compilação **SLSA**, um resumo de validação em HTML e um ficheiro de checksums `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | um arquivo citável de todas as versões |
| [kshana.dev](https://kshana.dev) | abrir num navegador | o Kshana Studio, a aplicação WebAssembly no navegador, recompilada a partir de cada etiqueta de versão (pelo que a versão que mostra é a versão que executa) |

A versão do crate / imagem / registo do servidor MCP acompanha o motor (inclui a
biblioteca); o plugin JetBrains tem versões independentes (invoca o binário
`kshana` que tiver instalado).

</details>

<details>
<summary>Roteiro</summary>

### Roteiro

Ver [`ROADMAP.md`](ROADMAP.md) para o roteiro por fases, [`CHANGELOG.md`](CHANGELOG.md)
para o histórico de versões e [`docs/CAPABILITY.md`](docs/CAPABILITY.md) para o
roteiro por capacidade. A ordem de prioridade é: **primeiro a evidência de temporização e holdover para
infraestruturas críticas** (máscaras de telecomunicações, holdover mais longo com envelhecimento e ruído
flicker, ingestão de dados medidos de relógios); **em segundo lugar o método neutro de compromissos quântico vs clássico**
(resultados rotulados MODELLED até que os dados medidos de um parceiro os promovam); e
**a navegação lunar / cislunar e no espaço profundo mantida**, não expandida como prioridade. A **redução de referenciais com precisão ITRF** está agora entregue — a
cadeia GCRS↔ITRS IAU 2006/2000A completa baseada no CIO (movimento do polo + nutação abaixo do segundo de arco),
validada bit a bit face ao SOFA/ERFA e verificada de forma cruzada e independente face ao ANISE
(SPICE em Rust puro) a ≤ 3.6 m na órbita GNSS. Os itens de curto prazo incluem a fusão de fase da portadora fortemente acoplada e a disponibilização
do navegador GNSS/INS fraca/fortemente acoplado em mais pacotes; o motor de **navegação radiométrica
no espaço profundo / Marte** chegou na v0.17.0 (validado por simulação). A
**camada de física quântica** é um item **P2**: o acelerómetro CAI é agora simulado a partir de
primeiros princípios (fase de Mach–Zehnder, ruído de projeção, decaimento do contraste, acoplamento
de vibrações), enquanto os sensores de relógio/transferência de tempo continuam a ser conduzidos por coeficientes publicados
de Allan/orçamento de ruído. TEME&harr;ECEF baseado em GMST, os sistemas de tempo IERS
com segundos intercalares (UTC/TAI/TT/UT1), a propagação de órbitas SGP4/SDP4 (v0.7.0,
validada face aos vetores AIAA 2006-6753) e o pacote de fusão executável `gnss-ins`
foram todos **entregues**, e a velocidade inercial é exposta a jusante. Um detetor
estocástico ativo de spoofing de tempo (teste de energia de Neyman–Pearson / χ²₁ com P_fa/P_md por Monte-Carlo
e um FoM de Segurança de 1−P_md), um modelo de jamming por orçamento de ligação (J/S → C/N₀
efetivo → perda de seguimento), disponibilidade multiconstelação, um orçamento de erro de IMU
de eixo único (1-DOF), dois estimadores de Kalman independentes (relógio + posição) indicados como um
FoM combinado, geometria de constelação real a partir de TLE, um relatório de quadro de pontuação HTML,
disponibilidade GNSS deduzida da geometria
*e* diluição da precisão a partir de órbitas keplerianas com excentricidade e deriva J2,
bandas de confiança Monte Carlo, varrimentos de parâmetros para estudos de compromissos, um playground WebAssembly
no navegador e ligações opcionais Python (PyO3) e WebAssembly (wasm-bindgen) foram
integrados em `main`.

</details>

<details>
<summary>Contribuir</summary>

### Contribuir

Ver [`CONTRIBUTING.md`](CONTRIBUTING.md). Em resumo: os testes passam (`cargo test`), os
dois scripts de salvaguarda passam, Conventional Commits, e uma entrada `[Unreleased]` no `CHANGELOG.md`
para cada alteração visível pelo utilizador. A participação rege-se pelo nosso
[Código de Conduta](CODE_OF_CONDUCT.md). Para reportar um problema de segurança, consulte a
[Política de segurança](SECURITY.md) — não abra uma issue pública para vulnerabilidades.

</details>

<details>
<summary>Documentação: todos os documentos, e a quem se destinam</summary>

<a id="documentation"></a>
### Documentação

| Documento | Para quem | O que contém |
|----------|----------|--------------|
| [Guia de conceitos](docs/CONCEPTS.md) | todos, comece aqui | o que o Kshana faz e porquê, do zero até à física |
| [Kshana Studio](web/README.md) | todos | executar o motor no seu navegador (WebAssembly); notas de compilação e implementação |
| [Glossário](docs/GLOSSARY.md) | todos | definições em linguagem simples de todos os termos |
| [Tipos de cenário](docs/KINDS.md) | todos | todos os tipos que o motor despacha: o que faz, os seus campos, um comando de exemplo, as suas linhas do registo e o gráfico que o motor escreve para ele |
| [Dados de parceiros](docs/PARTNER-DATA.md) | laboratórios e fabricantes com dados medidos | que linhas MODELLED um registo medido de relógio ou de IMU poderia promover, os formatos, como uma submissão é verificada (`kshana partner check`), pontuada e creditada |
| [Arquitetura](docs/ARCHITECTURE.md) | programadores / revisores | mapa de módulos, pipeline do motor, despacho e diagramas |
| [Estado da validação](docs/VALIDATION.md) | revisores / quem cita | o que é `validated` vs `not modeled`, com evidência |
| [Matriz de verificação](docs/VERIFICATION-MATRIX.md) | revisores / quem cita | o registo de evidências verificado por máquina — cada linha de capacidade com o seu estado, módulo, teste e referência externa, gerado a partir de `src/verification.rs` |
| [Justificação das linhas Modelled](docs/MODELLED-RATIONALE.md) | revisores | porque é que cada linha **Modelled** não tem referência externa, indicado linha a linha |
| [Proveniência](docs/PROVENANCE.md) | revisores / quem cita | cada parâmetro de sensor, modelo e conjunto de dados rastreado até à sua fonte publicada, numa tabela citável |
| [Reprodutibilidade e proveniência](docs/REPRODUCIBILITY.md) | revisores / empacotadores | garantias de determinismo, fixação de goldens, SBOM (lista de materiais de software), proveniência de compilação |
| [Etiquetas de plataforma das wheels](docs/WHEEL_TAGS.md) | empacotadores | a matriz de wheels Python abi3 — que etiqueta de plataforma `pip install kshana` resolve |
| [Posicionamento](docs/POSITIONING.md) | avaliadores | onde o Kshana se situa face ao RTKLIB/gLAB (complementar), e o nível no navegador sem instalação |
| [Kshana Pro](docs/PRO.md) | avaliadores / gestores de programa | o que a camada proprietária Pro acrescenta sobre o mesmo motor: otimizador de conceção, incerteza e sensibilidade, dossiê de missão, vigilância de campanhas, coexistência espetral, serviço local de tarefas, rastreabilidade de requisitos; o que cada um produz e o que não faz |
| [Relatório técnico](paper/kshana-technical-report.md) · [Artigo JOSS](paper/paper.md) | revisores / quem cita / avaliadores | o artigo de investigação alargado completo — arquitetura, modelos por domínio, validação, estudos de caso e limitações — mais a submissão concisa ao JOSS (Journal of Open Source Software) |
| [Validação SGP4](docs/SGP4-VALIDATION.md) | revisores / quem cita | concordância com a referência AIAA 2006-6753 (666 estados, ~4 mm) **e** uma comparação direta com o crate independente `sgp4` (concordam abaixo do mícron / 4.12 mm) |
| [Validação do modelo de forças](docs/AGENCY-ORBIT-VALIDATION.md) | revisores / quem cita | o motor de forças completo (`src/precise_od.rs`) ajustado a efemérides de agências — metodologia e resíduos validados |
| [Guia de TLE reais](docs/REAL_TLE_GUIDE.md) | utilizadores | conduzir cenários a partir de TLE reais de constelações da Celestrak / Space-Track (em vez do conjunto Walker sintético incluído) |
| [FoM de integridade](docs/INTEGRITY.md) | avaliadores | o que significam os valores `integrity` / `security` — e o que **não** são face ao HPL/VPL de aviação |
| [Referência ARAIM](docs/ARAIM_REFERENCE.md) | revisores / integradores | a implementação aberta do nível de proteção ARAIM MHSS — a projeção do bias nominal `b_k`, σ_URA vs σ_URE, e as probabilidades a priori dos modos de falha |
| [Modelos quânticos](docs/QUANTUM.md) · [pormenores](docs/QUANTUM-MODELS.md) | revisores | a camada de física do interferómetro de átomos frios, e onde os coeficientes ainda são consultados em tabelas |
| [Conformidade](docs/COMPLIANCE.md) | avaliadores | âmbito dos algoritmos DO-229E / DO-316, e o que **não** é uma afirmação de conformidade |
| [Confiança marítima](docs/MARITIME-TRUST.md) | navegadores / integradores | a pontuação de confiança GNSS de 0-100 para o NMEA de uma embarcação, os seus monitores e os seus limites (consultivo, não um equipamento de navegação homologado) |
| [Fluxos NMEA de treino](docs/NMEA-TRAINING.md) | formadores marítimos | NMEA sintético de ponte com jamming e spoofing programados e um registo do instrutor; apenas texto, nunca para navegação em uso |
| [Mapa de interferência](docs/INTERFERENCE-MAP.md) | analistas / navegadores | onde aeronaves e navios reportaram dados de navegação degradados, e que parte de uma rota isso afeta |
| [Pacotes de evidências](docs/EVIDENCE-PACKS.md) | operadores / seguradoras | registos técnicos assinados de um evento de confiança e como verificar um |
| [Telemetria de confiança](docs/TRUST-TELEMETRY.md) | equipas de operações / segurança | o fluxo de confiança como métricas Prometheus, eventos SIEM e OpenTelemetry, com um painel Grafana |
| [Integrações marítimas](docs/MARINE-INTEGRATIONS.md) | proprietários de embarcações / integradores | o plugin Signal K, o modo gate do OpenCPN e a montagem de referência |
| [Bancada de teste](docs/TEST-BENCH.md) | fabricantes de recetores | reproduzir um cenário exportado num simulador de laboratório e pontuar o registo do recetor |
| [Mapeamento de conformidade](docs/compliance/README.md) | avaliadores | enquadramentos públicos de resiliência mapeados para as saídas do Kshana, com fontes e lacunas; `kshana compliance-report` |
| [Notebooks](notebooks/README.md) | utilizadores | tutoriais executáveis com o seu texto renderizado |
| [Normas e interoperabilidade](docs/STANDARDS.md) | integradores | os formatos de intercâmbio GNSS / de dinâmica de voo / de agências que o Kshana lê e escreve (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [Fusão PNT LEO](docs/LEO-PNT-FUSION.md) | utilizadores / avaliadores | posicionamento, navegação e temporização fundidos MEO + LEO: Doppler, pseudodistância conjunta, convergência PPP, 5G NTN, cobertura polar e transferência de tempo LEO sobre qualquer constelação; as predefinições opcionais e as suas fontes públicas |
| [Campanhas](docs/CAMPAIGNS.md) | utilizadores / avaliadores | compor cenários: cronologias de missão encadeadas, varrimentos de parâmetros, conjuntos Monte Carlo e execuções com condição partilhada, com as identidades de composição que os testes fixam |
| [Catálogo de cenários](docs/SCENARIOS.md) | utilizadores / integradores | todos os tipos despacháveis com os seus campos TOML obrigatórios e opcionais — gerado a partir de `api::list_scenario_kinds()` |
| [Esquema do resultado](docs/SCHEMA.md) | integradores | todos os campos do JSON do resultado, com unidades e uma indicação da fonte |
| [API Python](docs/PYTHON_API.md) | utilizadores de Python | a interface da ligação PyO3 — chamar o motor, os tipos de cenário/resultado e exemplos |
| [Afirmações vs realidade](docs/CLAIMS-VS-REALITY.md) | revisores | o registo de fecho de afirmações exageradas + a salvaguarda de CI (`tests/no_overclaims.rs`) que o mantém resolvido |
| [Roteiro](ROADMAP.md) | todos | o roteiro por fases — o que foi entregue e o que vem a seguir |
| [Servidor MCP](mcp/kshana-mcp/README.md) · [Plugin JetBrains](ide/jetbrains/README.md) | agentes / utilizadores de IDE | executar o Kshana a partir de um assistente de IA ou de um IDE JetBrains |
| [Guia para agentes](docs/AGENTS.md) · [Interfaces](docs/SURFACES.md) | agentes / integradores | que ferramenta responde a que pergunta, o que guardar com cada resposta; onde cada capacidade é acessível (CLI, Rust, Python, WASM, MCP, plugin, JetBrains, notebooks) e porque é que uma célula é N/A |
| [Registo de alterações](CHANGELOG.md) | todos | histórico de versões (Keep a Changelog + SemVer, Semantic Versioning) |
| [Contribuir](CONTRIBUTING.md) | contribuidores | compilação, salvaguardas, disciplina de testes/citações, DCO (Developer Certificate of Origin) |
| [Governação](GOVERNANCE.md) | contribuidores / comunidade | como o Kshana é governado — quem decide, como, e a fronteira entre aberto e fechado |
| [Código de Conduta](CODE_OF_CONDUCT.md) | comunidade | conduta esperada (Contributor Covenant) |
| [Política de segurança](SECURITY.md) | quem reporta | como reportar uma vulnerabilidade; nota sobre duplo uso |

</details>

<details>
<summary>Referências principais</summary>

### Referências principais

**Referências de validação e normas** — as autoridades externas a que as verificações do Kshana estão ancoradas:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [dados de teste](https://celestrak.org/publications/AIAA/2006-6753/)): o conjunto de verificação SGP4/SDP4 que o Kshana reproduz a 4.12 mm, e os exemplos resolvidos de referenciais face aos quais a cadeia TEME→ITRF é verificada.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — as rotinas de referência de tempo e referenciais face às quais a nutação IAU 2000A e a redução GCRS↔ITRS do CIO são validadas bit a bit.
- Petit & Luzum (eds.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (normas de orientação da Terra, movimento do polo e referenciais).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (relações do desvio de Allan e a série de referência NBS14; NBS = o antigo National Bureau of Standards dos EUA).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): as implementações de referência de ROC/AUC, matriz de confusão e precisão/sensibilidade/F1 com que a bancada de avaliação das perturbações RF coincide exatamente (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` e `linalg.expm` — as rotinas de referência face às quais o ajuste NNLS de ADEV medido do estudo de compromissos quântico, as bandas de consistência χ² e a covariância do ruído de processo do relógio de van-Loan são validados (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): usado tanto como trabalho anterior aberto (ver *Comparação e trabalho anterior aberto* abaixo) como **referência DOP independente** com que o cálculo de GDOP/PDOP/HDOP/VDOP/TDOP coincide a 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): os modelos de forças por trás do ajuste do modelo de forças a efemérides precisas de agências.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (as famílias halo/NRHO que o corretor diferencial CR3BP reproduz).

**Física dos dispositivos e métodos** — as fontes citadas por trás dos modelos de sensores:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (relógio ótico de rede de estrôncio, objetivo orientado para o espaço).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (relógio de Sr de laboratório, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (tríade de acelerómetros quânticos híbridos).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [tutorial IEEE AESS (Aerospace and Electronic Systems Society) (repositório Discovery do University College London)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (crescimento do erro da navegação estimada).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (transferência ótica de tempo e frequência em dois sentidos; a ligação ótica entre satélites modela o seu orçamento de não reciprocidade com base nestes).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (a teoria da modulação BOC e da separação espetral por trás de `src/navsignal.rs`).
- Kaplan & Hegarty (eds.) — *Understanding GPS/GNSS: Principles and Applications* (3.ª ed., Artech House, 2017): a equação antijamming do C/N₀ efetivo e o jitter de ruído térmico do seguimento de código DLL early–late que os modelos de sinal de navegação e de jamming usam.

**Comparação e trabalho anterior aberto** — as ferramentas e revisões face às quais o Kshana se posiciona:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (the Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): os parâmetros da bateria de testes de spoofing face aos quais o detetor multicamada é caracterizado.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): os perfis de erro de navegação inercial abertos e validados usados como linha de base clássica.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): simulador aberto de PNT lunar.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): análise aberta de dados GNSS.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): OD de dinâmica reduzida do GRAIL, o piso de aceleração empírica que o ajuste ao LRO reproduz.

</details>
