# docs--schema: translations (pt-BR)

# text
seg-2247a2344710 = Significado

# text
seg-f42465f7d066 = ns

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-6940543aa3c0 = string

# text
seg-f5e7215e6835 = objeto

# text
seg-9da5d92757bd = objeto, opcional

# text
seg-c353e7bec219 = Chave

# text
seg-a129b9e613d0 = Tipo

# text
# c1: docs/SCHEMA.md
seg-e28387d70be0 = Fonte: <c1/>

# text
# c1: *.result.json
seg-49d2afecf5f1 = Esquema de resultados — como ler um <c1/> do Kshana

# text
# c1: RunResult
# c2: src/report.rs
# c3: FoMScores
# c4: src/fom.rs
seg-c128455c353c = Toda execução grava, ao lado do cenário, um artefato JSON (JavaScript Object Notation) versionado e autodescritivo. Esta página é o guia de leitura, escrito à mão, do envelope de intercâmbio e das formas de resultado de <b>relógio e órbita</b>: a <b>unidade</b> de cada campo, onde ele é calculado na fonte e como lê-lo. O tipo canônico é <c1/> em <a1><c2/></a1>; as figuras de mérito são <c3/> em <a2><c4/></a2>.

# text
seg-092ea1e33a05 = Esta <b>não</b> é a referência completa de campos. O motor despacha sobre muito mais tipos de cenário do que esses dois, e cada um emite seu próprio pacote. A referência completa — unidade, classe de procedência e definição de todo campo numérico de todo tipo de cenário incorporado — é gerada, não escrita à mão: veja <a1>Unidades e procedência, por campo, para todo tipo de cenário</a1> abaixo.

# text
seg-e4c4b66a2f46 = Envelope de intercâmbio (KIF, o Kshana Interchange Format) — reconhecimento e verificação de versão de um artefato

# text
# c1: Envelope
# c2: src/interchange.rs
seg-9b83bb817814 = Os artefatos do Kshana podem ser envolvidos em um <b>envelope de intercâmbio</b> neutro e autodescritivo, para que uma ferramenta de terceiros reconheça o arquivo e decida se consegue lê-lo <em>antes</em> de se comprometer com um esquema de carga útil. O tipo canônico é <c1/> em <a1><c2/></a1>.

# text
# c1: "kshana-interchange"
# c2: FORMAT_TAG
seg-e4fd08930644 = Sempre <c1/> (<c2/>) — como uma ferramenta externa reconhece um artefato do Kshana.

# text
# c1: MAJOR.MINOR
# c2: SCHEMA_VERSION
seg-abd853f2ce49 = A versão de esquema <c1/> (<c2/>, a única fonte de verdade de todo o crate).

# text
# c1: "scenario"
# c2: "run-result"
# c3: "trade-study"
seg-ee9f238072f1 = O tipo de artefato, p. ex., <c1/>, <c2/>, <c3/> — permite que um consumidor encaminhe sem analisar o corpo.

# text
# c1: Cargo.toml
seg-29ad4bedd64f = Versão do crate (<c1/>) que produziu a carga útil.

# text
# c1: Scenario
# c2: RunResult
seg-52f3e962c049 = O artefato envolvido como JSON canônico (um <c1/>, um <c2/>, …).

# text
# c1: MAJOR.MINOR
# c2: #[serde(default)]
# c3: Compatible
# c4: ForwardIncompatible
# c5: MajorIncompatible
# c6: Envelope::parse
seg-6fe0d7cd4165 = <b>Contrato de compatibilidade.</b> As versões são <c1/>. Novos campos são acrescentados com <c2/> (a <em>disciplina aditiva</em>), de modo que um leitor pode analisar qualquer artefato da <b>mesma versão maior e de versão menor igual ou mais antiga</b> (<c3/>). Uma <b>versão menor estritamente mais nova</b> (<c4/>) pode trazer campos que este leitor não consegue atender, e uma <b>versão maior diferente</b> (<c5/>) é uma ruptura estrutural — ambas são recusadas por <c6/>, que valida a etiqueta de formato e a versão na fronteira, em vez de interpretar mal, em silêncio, uma entrada externa.

# text
# c1: scenario + seed + engine_version
# c2: engine_version
# c3: scenario_hash
seg-f7ae91002e56 = <b>Determinismo.</b> O envelope <b>não traz carimbo de tempo</b> — a promessa de reprodutibilidade do Kshana (<c1/> reproduz uma execução) exige isso. A procedência fica em <c2/> e no próprio <c3/> da carga útil.

# text
# c1: Envelope::payload_as::<T>()
# c2: Deserialize
# c3: Scenario
# c4: payload
seg-bb0b742d2df8 = Uma leitura tipada (<c1/>) funciona para qualquer carga útil que implemente <c2/> (p. ex., <c3/>). Os artefatos de resultado são apenas serializáveis por projeto e são lidos como o valor JSON bruto <c4/>.

# text
seg-87be7aa00b17 = Nível superior (pacotes de relógio e órbita)

# text
seg-cc22d9206eb4 = Tipo / unidade

# text
seg-3a821855c582 = Versão do esquema de resultados (independente da versão do motor).

# text
# c1: Cargo.toml
seg-cc6dded799f9 = Versão do crate (<c1/>) que produziu o arquivo.

# text
seg-5a69a99b9a87 = string hexadecimal

# text
# c1: scenario + seed + engine_version
seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) sobre o JSON canônico do cenário — a execução é reprodutível a partir de <c1/>.

# text
# c1: seed + 0x9e3779b97f4a7c15
seg-ba73ba76873e = Semente do RNG (gerador de números aleatórios) da execução quântica (a clássica usa <c1/>).

# text
seg-a688dd98c588 = nanossegundos

# text
# c1: threshold_ns
seg-24e0f04033fa = A especificação de temporização: um erro dentro de ±<c1/> está "dentro da especificação".

# text
seg-f52388753a1a = cenário

# text
# c1: ClockRun
seg-15b4082a6455 = objeto (<c1/>)

# text
seg-7d3b92769bf5 = A execução do sensor quântico (veja abaixo).

# text
seg-aa665b955931 = A execução do sensor clássico, para comparação.

# text
seg-152ae43896b3 = Mapa de unidade/procedência por campo deste documento, indexado pelo caminho do campo. Veja §Unidades e procedência abaixo.

# text
# c1: figures
# c2: path
# c3: quantum.fom.timing_p95_ns
# c4: tier
# c5: VALIDATED
# c6: MODELLED
# c7: requirement
# c8: applicable
# c9: applicable
# c10: false
# c11: reason
# c12: security
# c13: fom.security
# c14: untiered
# c15: hybrid
# c16: fusion
# c17: clock
# c18: orbit
# c19: hybrid
# c20: fusion
# c21: fom_label::kind_figures
# c22: api::without_figure_tiers
# c23: lunar-station-coverage
# c24: docs/predictions/lunar-reference-station.md
# c25: figure_tiers
# c26: leo-ppp
# c27: solar-system
# c28: optical-atmosphere
# c29: sweep
# c30: sweep-nd
# c31: lunar-attack-surface
# c32: fom_label::KINDS_EXCLUDED_FROM_FIGURE_TIERS
seg-119bac9b3e6f = O nível de verificação de cada figura de mérito informada, e sempre a última chave do documento. <c1/> lista uma entrada por figura presente: <c2/> (p. ex., <c3/>), <c4/> (<c5/> = verificado em relação a uma referência independente externa, <c6/> = de primeiros princípios, testado internamente), <c7/> (a linha da matriz de verificação de onde o nível é lido) e <c8/>. <c9/> é <c10/>, com um <c11/>, para <c12/> em todo cenário sem ataque configurado: o limite permanece em <c13/>, mas não responde a uma pergunta que o cenário faça. <c14/> lista qualquer figura que nenhuma linha da matriz possui (as figuras de posição de <c15/> e <c16/>), em vez de lhe dar um nível. Emitido pelos tipos de cenário <c17/> (execução única e conjunto Monte Carlo), <c18/>, <c19/> e <c20/>, que o constroem dentro de sua execução, e ({ "0.36" }, RM-04) por todos os demais tipos de cenário para suas figuras principais, acrescentado após a execução a partir da tabela por tipo de cenário <c21/>; <c22/> o remove de volta ao documento sem níveis, byte a byte. Não emitido por <c23/>, cujo resultado é uma previsão pré-registrada congelada (<c24/>): esse tipo de cenário não tem <c25/> até que uma nova previsão datada a substitua. Também não emitido por <c26/>, <c27/>, <c28/> ({ "0.37" }; matrizes por local), <c29/> e <c30/>, que não têm figura principal escalar, nem por <c31/>, cujo documento é JSON compacto (<c32/> dá cada motivo), nem pelos documentos de membros incorporados de uma campanha. Não traz números.

# text
# c1: samples_total
# c2: samples_with_fix
# c3: sigma_uere_m
# c4: best_pdop
# c5: median_pdop
# c6: best_position_sigma_m
# c7: median_position_sigma_m
# c8: sigma_uere_m
seg-1448f90f0086 = Resumo de geometria do pacote de órbita: <c1/>, <c2/>, <c3/> (m, o orçamento modelado de erro de distância por satélite), <c4/> / <c5/> (adimensionais) e <c6/> / <c7/> (m, PDOP (diluição da precisão de posição) × <c8/>). <b>Somente no pacote de órbita.</b>

# text
# c1: [x, y, z]
seg-ae4f8eed06ac = matriz de <c1/> km, opcional

# text
seg-d13d827f54b0 = Trajetória inercial centrada na Terra propagada da espaçonave do usuário, uma entrada por instante amostrado. <b>Somente no pacote de órbita</b>; omitida nos demais. Apenas de saída — sem hash.

# text
# c1: StudyMeta
seg-8f511d5de657 = objeto (<c1/>), opcional

# text
seg-ea152e097d6f = Metadados aditivos do relatório (título do estudo, carimbo de geração, autor, aviso legal). Omitidos quando ausentes, de modo que uma execução sem metadados é idêntica byte a byte à saída legada. Apenas de saída — sem hash.

# text
# c1: ClockRun
# c2: quantum
# c3: classical
seg-1041873fba1b = <c1/> (cada um de <c2/> / <c3/>)

# text
# c1: optical-sr-lattice
seg-3fa81140c10d = Identificador do sensor (p. ex., <c1/>).

# text
# c1: clock
seg-80765d202558 = Tipo de modelo (p. ex., <c1/>).

# text
seg-6bf458d964fe = Citação/fonte dos parâmetros do sensor.

# text
seg-9145f04a557f = Os parâmetros brutos do modelo usados.

# text
# c1: {t, error_ns, gnss}
seg-697940342a28 = matriz de <c1/>

# text
# c1: t
# c2: error_ns
# c3: gnss
# c4: nominal
# c5: degraded
# c6: denied
seg-b5f4216b55a2 = Série temporal por passo: <c1/> segundos, <c2/> o erro de tempo em <b>nanossegundos</b>, <c3/> um de <c4/>/<c5/>/<c6/>.

# text
# c1: FoMScores
seg-7fba0b91b75e = objeto (<c1/>)

# text
seg-5c4b60012f0e = As figuras de mérito pontuadas (abaixo).

# text
# c1: {tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}
seg-1308a29c6a5b = matriz de <c1/>

# text
# c1: tau_s
# c2: adev
# c3: n_samples
# c4: noise
# c5: WhiteFm
# c6: edf
# c7: ci_lo
# c8: ci_hi
# c9: adev
# c10: allan.rs:overlapping_adev_curve
seg-bbd42065492c = Desvio de Allan sobreposto: <c1/> o tempo de média (s), <c2/> a estabilidade fracionária de frequência adimensional σ_y(τ), <c3/> a contagem de sobreposição por trás desse ponto, <c4/> o tipo de lei de potência identificado pela inclinação do MDEV (desvio de Allan modificado) (p. ex., <c5/>), <c6/> os graus de liberdade efetivos específicos do tipo de ruído, e <c7/>/<c8/> a faixa de confiança de { "95" }% baseada em χ² sobre <c9/> naquele τ. Calculado em <c10/>.

# text
# c1: filter_health.rs
seg-1e61fd18257f = Avaliação de consistência do filtro de Kalman (NIS/NEES (NIS: inovação normalizada ao quadrado; NEES: erro de estimação normalizado ao quadrado) contra suas faixas χ²), calculada em <c1/>; omitida nas execuções que não a avaliam.

# text
# c1: FoMScores
# c2: fom
seg-9333864652b0 = <c1/> (o objeto <c2/>)

# text
seg-ce9caeaefd87 = Ressalva

# text
seg-b24de276d788 = Erro RMS (valor quadrático médio) de fase do relógio (temporização) durante a interrupção.

# text
seg-53e5018ae276 = uma métrica de <b>temporização</b>, não de posição

# text
seg-8cdec6da2072 = Erro de temporização no percentil 95 durante a interrupção.

# text
seg-95f058adb809 = Pior caso (o mais curto) de trecho por inércia dentro da especificação entre os segmentos de interrupção.

# text
seg-48babfd3bd95 = <b>limitado pela grade</b> — um limite inferior na resolução do passo de tempo

# text
seg-41c08973baa1 = Taxa de crescimento de |erro| por mínimos quadrados durante a interrupção.

# text
seg-707ee74c5c06 = fração [{ "0,1" }]

# text
seg-32e5fe6415f8 = Fração da execução inteira com uma solução dentro da especificação.

# text
seg-361b3b923a45 = fração [{ "0,1" }] ou nulo

# text
seg-5d55682f9349 = <b>Autoconsistência do filtro</b>: fração das amostras da interrupção cujo erro verdadeiro permanece dentro do limite k-σ do Kalman.

# text
# c1: INTEGRITY.md
seg-636106cb4a40 = <b>NÃO</b> é integridade HPL/VPL/RAIM (HPL: nível de proteção horizontal; VPL: nível de proteção vertical; RAIM: monitoramento de integridade autônomo pelo receptor) — veja <a1><c1/></a1>

# text
seg-f686ade3da21 = <b>Limite analítico de detectabilidade de spoofing</b> a partir da estabilidade do relógio.

# text
# c1: applicable: false
# c2: figure_tiers
# c3: n/a (no attack)
seg-f8783db25141 = significativo apenas com um ataque configurado, de modo que os pacotes de relógio e de órbita (que não configuram nenhum) o marcam como <c1/> em <c2/> e o imprimem como <c3/> no resumo; <b>não</b> é um detector RAIM de vários satélites

# text
seg-90e2980430b9 = Como é um valor "bom"

# text
# c1: adev_curve
# c2: holdover_s
# c3: security
seg-c1afc6f3c545 = Um <b>relógio mais silencioso</b> (<c1/> menor) dá um <c2/> mais longo e um limite de detectabilidade <c3/> maior — esse é o contraste quântico versus clássico.

# text
# c1: availability
seg-0fa38207813a = <c1/> próximo de { "1.0" } significa que o sistema ficou dentro da especificação quase toda a execução; durante uma interrupção longa, cai para o relógio mais ruidoso.

# text
# c1: integrity
seg-4dcba241d5a6 = <c1/> próximo de { "1.0" } significa que o limite de incerteza do próprio filtro foi honesto quanto ao seu erro — uma afirmação de <em>autoconsistência</em>, não uma garantia de segurança da vida humana.

# text
seg-3099d75a04a5 = Outros tipos de cenário

# text
seg-43cd9f67f384 = Todo outro tipo de cenário emite sua própria forma de resultado. Alguns dos mais comuns:

# text
# c1: pos_rms_m
# c2: pos_p95_m
# c3: CAPABILITY.md
seg-6b59ef9dfe85 = <b>inertial</b>: figuras de mérito no domínio da posição em <b>metros</b> (<c1/>, <c2/>) — eixo único (1-DOF (DOF: grau de liberdade)), semente única (veja <a1><c3/></a1>).

# text
# c1: timing_spec_ns
# c2: position_spec_m
# c3: position_p95_m
# c4: position_holdover_s
# c5: pnt_holdover_s
# c6: figure_tiers
# c7: untiered
seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> e <c2/> no nível superior e, por lado, as figuras de temporização e de posição de uma suíte de sensores (<c3/>, <c4/> e <c5/>, o tempo até que qualquer das especificações seja violada), com um bloco <c6/> como o do pacote de relógio, em que as figuras de posição são listadas como <c7/>.

# text
# c1: src/spoof.rs
seg-e38e8a8adec8 = <b>spoof</b>: deslocamento de spoofing por passo contra o limite de detecção do relógio, mais se o spoofing atingiu a especificação antes da detecção (<c1/>).

# text
# c1: orbit
# c2: integrity
# c3: user_site
# c4: gnss-sim
# c5: jamming
# c6: leo-pvt
# c7: leo-pass
# c8: [skyline]
# c9: skyline
# c10: source
# c11: preset:<name>
# c12: preset:<name>+overrides
# c13: custom
# c14: open_fraction
# c15: max(mask_deg, skyline)
# c16: provenance
# c17: masked_by_skyline
# c18: epochs[]
# c19: integrity
# c20: jamming
# c21: gnss_measurements[]
# c22: gnss-sim
# c23: joint.epochs[]
# c24: leo-pvt
# c25: leo-pass
# c26: satellites[].pass.epochs_masked_by_skyline
# c27: units
# c28: src/skyline.rs
# c29: UNITS
# c30: SKYLINE.md
seg-dfd972d160e1 = <b>skyline</b> (<c1/> e <c2/> com <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; presente apenas quando o cenário tem uma seção <c8/>, de modo que um cenário sem ela permanece inalterado): um objeto <c9/> de nível superior com <c10/> (string: <c11/>, <c12/> ou <c13/>), <c14/> (fração [{ "0,1" }] do ângulo sólido do hemisfério superior acima de <c15/>) e <c16/> (string); por amostra <c17/> (contagem de satélites acima da máscara mas atrás da linha de horizonte: <c18/> de <c19/> e <c20/>, <c21/> de <c22/>, <c23/> de <c24/>); e, para <c25/>, <c26/> (contagem de épocas). Suas unidades e classes de procedência estão no bloco <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

# text
# c1: field-units-schema.json
# c2: SCENARIOS.md
# c3: *Result
# c4: src/
seg-d113122b7454 = Para o conjunto preciso de campos de qualquer tipo de cenário, leia sua entrada em <a1><c1/></a1> (abaixo), a seção do tipo de cenário em <a2><c2/></a2> ou a struct <c3/> correspondente em <c4/>.

# text
seg-e0c63207c019 = Outros arquivos que uma execução grava

# text
# c1: <scenario>.result.json
# c2: <scenario>.chart.svg
# c3: <scenario>.report.html
# c4: <scenario>.report.json
# c5: reproducibility
# c6: REPORTS.md
# c7: REPRODUCIBILITY.md
# c8: <scenario>.table.csv
# c9: --export
# c10: INTEROP.md
# c11: --animate
# c12: ANIMATION.md
seg-cc97989ca06b = Além de <c1/>, a CLI (interface de linha de comando) grava <c2/>, um <c3/> imprimível e o mesmo relatório como <c4/>, cujo bloco <c5/> registra a versão do motor, o SHA-256 do arquivo de cenário, a semente, a plataforma e o comando exato (veja <a1><c6/></a1> e <a2><c7/></a2>). Os tipos de cenário que publicam uma tabela de reprodutibilidade também gravam <c8/> (CSV: valores separados por vírgula). <c9/> grava arquivos de intercâmbio (veja <a3><c10/></a3>) e <c11/> uma animação (veja <a4><c12/></a4>).

# text
seg-489953601f3b = Unidades e procedência, por campo, para todo tipo de cenário

# text
seg-61b33dbb44dd = Esta página é escrita à mão e cobre os pacotes de relógio e de órbita. A contrapartida legível por máquina cobre <b>todo</b> tipo de cenário incorporado:

# text
# c1: units
# c2: {"unit", "provenance", "note"}
# c3: []
# c4: *
# c5: src/field_schema.rs
seg-1e20fcda7f0b = <b>No próprio resultado.</b> O documento de resultado de cada cenário traz um objeto <c1/> de nível superior que mapeia o caminho de um campo emitido para <c2/>. A gramática de caminhos (uma matriz contribui com um segmento com sufixo <c3/> compartilhado por suas linhas; <c4/> é um curinga de um único segmento para objetos indexados por dados) e o vocabulário fechado de procedência estão definidos em <a1><c5/></a1>.

# text
seg-b8256437c0b7 = Como um único arquivo.

# text
# c1: field-units-schema.json
# c2: coverage
seg-ae7136e34306 = <a1><c1/></a1> é a união colhida: para cada tipo de cenário, todo campo numérico que ele emite em uma fonte declarada, com sua unidade, classe de procedência, nível de evidência e definição — e, nomeado em vez de omitido, todo campo que ainda não tem uma. Seu bloco <c2/> traz as contagens.

# text
# c1: tests/field_units_global.rs
# c2: UNCOVERED_KINDS
seg-66af6dc065f7 = Ambos são impostos por <c1/>, que executa todo tipo de cenário registrado e falha se um campo numérico emitido não tem unidade e classe de procedência. Os tipos de cenário ainda não cobertos são nomeados individualmente em <c2/> desse arquivo, com o motivo de cada um estar em aberto, e a contagem é fixada para que a lista só possa diminuir.

# text
# c1: units
seg-ca49a577a07b = Regenere o JSON após qualquer alteração na forma de um relatório ou em um bloco <c1/>:

# text
seg-ce4351cf7673 = <s1>Anterior</s1>Referência de cenários

# text
seg-b988dcc329a4 = <s1>Próximo</s1>Uso de TLEs reais

# text
seg-6585c8a3643d = ClockRun (cada um de quantum / classical)

# text
seg-299f8a9643f1 = FoMScores (o objeto fom)
