# docs--schema: translations (pt-PT)

# text
seg-2247a2344710 = Significado

# text
seg-f42465f7d066 = ns

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-6940543aa3c0 = cadeia de caracteres

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
seg-49d2afecf5f1 = Esquema de resultados — ler um <c1/> do Kshana

# text
# c1: RunResult
# c2: src/report.rs
# c3: FoMScores
# c4: src/fom.rs
seg-c128455c353c = Cada execução escreve, junto ao cenário, um artefacto JSON (JavaScript Object Notation) versionado e autodescritivo. Esta página é o guia do leitor, escrito à mão, para o envelope de intercâmbio e para as formas de resultado de <b>relógio e órbita</b>: a <b>unidade</b> de cada campo, onde é calculado na origem e como o ler. O tipo canónico é <c1/> em <a1><c2/></a1>; as figuras de mérito são <c3/> em <a2><c4/></a2>.

# text
seg-092ea1e33a05 = <b>Não</b> é a referência completa dos campos. O motor despacha muitos mais tipos de cenário do que estes dois, e cada um emite o seu próprio pacote. A referência completa — unidade, classe de proveniência e definição de cada campo numérico de cada tipo de cenário incorporado — é gerada, não escrita à mão: consulte <a1>Unidades e proveniência, por campo, para cada tipo de cenário</a1> abaixo.

# text
seg-e4c4b66a2f46 = Envelope de intercâmbio (KIF, o Kshana Interchange Format) — reconhecer e verificar a versão de um artefacto

# text
# c1: Envelope
# c2: src/interchange.rs
seg-9b83bb817814 = Os artefactos do Kshana podem ser envolvidos num <b>envelope de intercâmbio</b> neutro e autodescritivo, para que uma ferramenta de terceiros possa reconhecer o ficheiro e decidir se o consegue ler <em>antes</em> de se comprometer com um esquema de carga útil. O tipo canónico é <c1/> em <a1><c2/></a1>.

# text
# c1: "kshana-interchange"
# c2: FORMAT_TAG
seg-e4fd08930644 = Sempre <c1/> (<c2/>) — como uma ferramenta externa reconhece um artefacto do Kshana.

# text
# c1: MAJOR.MINOR
# c2: SCHEMA_VERSION
seg-abd853f2ce49 = A versão <c1/> do esquema (<c2/>, a única fonte de verdade de toda a crate).

# text
# c1: "scenario"
# c2: "run-result"
# c3: "trade-study"
seg-ee9f238072f1 = Tipo de artefacto, por exemplo <c1/>, <c2/>, <c3/> — permite a um consumidor encaminhar sem analisar o corpo.

# text
# c1: Cargo.toml
seg-29ad4bedd64f = Versão da crate (<c1/>) que produziu a carga útil.

# text
# c1: Scenario
# c2: RunResult
seg-52f3e962c049 = O artefacto envolvido como JSON canónico (um <c1/>, um <c2/>, …).

# text
# c1: MAJOR.MINOR
# c2: #[serde(default)]
# c3: Compatible
# c4: ForwardIncompatible
# c5: MajorIncompatible
# c6: Envelope::parse
seg-6fe0d7cd4165 = <b>Contrato de compatibilidade.</b> As versões são <c1/>. Os novos campos são acrescentados com <c2/> (a <em>disciplina aditiva</em>), pelo que um leitor consegue analisar qualquer artefacto da <b>mesma versão principal e de uma secundária igual ou mais antiga</b> (<c3/>). Uma <b>versão secundária estritamente mais recente</b> (<c4/>) pode trazer campos que este leitor não consegue honrar, e uma <b>versão principal diferente</b> (<c5/>) é uma rutura estrutural — ambas são recusadas por <c6/>, que valida a etiqueta de formato e a versão na fronteira em vez de analisar mal, em silêncio, uma entrada externa.

# text
# c1: scenario + seed + engine_version
# c2: engine_version
# c3: scenario_hash
seg-f7ae91002e56 = <b>Determinismo.</b> O envelope não traz <b>nenhuma marca temporal</b> — a promessa de reprodutibilidade do Kshana (<c1/> reproduz uma execução) exige-o. A proveniência está em <c2/> e no <c3/> da própria carga útil.

# text
# c1: Envelope::payload_as::<T>()
# c2: Deserialize
# c3: Scenario
# c4: payload
seg-bb0b742d2df8 = Uma leitura tipada (<c1/>) funciona para qualquer carga útil que implemente <c2/> (por exemplo <c3/>). Os artefactos de resultado são apenas de serialização por conceção e são lidos como o valor JSON em bruto de <c4/>.

# text
seg-87be7aa00b17 = Nível superior (pacotes de relógio e de órbita)

# text
seg-cc22d9206eb4 = Tipo / unidade

# text
seg-3a821855c582 = Versão do esquema de resultados (independente da versão do motor).

# text
# c1: Cargo.toml
seg-cc6dded799f9 = Versão da crate (<c1/>) que produziu o ficheiro.

# text
seg-5a69a99b9a87 = cadeia hexadecimal

# text
# c1: scenario + seed + engine_version
seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) sobre o JSON canónico do cenário — a execução é reprodutível a partir de <c1/>.

# text
# c1: seed + 0x9e3779b97f4a7c15
seg-ba73ba76873e = Semente do RNG (gerador de números aleatórios) para a execução quântica (a clássica usa <c1/>).

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
seg-7d3b92769bf5 = A execução do sensor quântico (ver abaixo).

# text
seg-aa665b955931 = A execução do sensor clássico, para comparação.

# text
seg-152ae43896b3 = Mapa de unidade/proveniência por campo para este documento, indexado pelo caminho do campo. Ver §Unidades e proveniência abaixo.

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
seg-119bac9b3e6f = O nível de verificação de cada figura de mérito comunicada, e sempre a última chave do documento. <c1/> lista uma entrada por figura presente: <c2/> (por exemplo <c3/>), <c4/> (<c5/> = verificado face a uma referência independente externa, <c6/> = a partir de primeiros princípios, testado internamente), <c7/> (a linha da matriz de verificação de onde o nível é lido) e <c8/>. <c9/> é <c10/>, com um <c11/>, para <c12/> em todos os cenários sem ataque configurado: o limite mantém-se em <c13/>, mas não responde a uma pergunta que o cenário faça. <c14/> lista qualquer figura que nenhuma linha da matriz detém (as figuras de posição de <c15/> e <c16/>), em vez de lhe dar um nível. Emitido pelos tipos de cenário <c17/> (execução única e conjunto Monte Carlo), <c18/>, <c19/> e <c20/>, que o constroem dentro da sua execução, e ({ "0.36" }, RM-04) por todos os outros tipos de cenário para as suas figuras principais, acrescentado após a execução a partir da tabela por tipo de cenário <c21/>; <c22/> repõe-o ao documento sem níveis, byte a byte. Não é emitido por <c23/>, cujo resultado é uma previsão congelada e fixada antecipadamente (<c24/>): esse tipo de cenário não tem <c25/> até que uma nova previsão datada a substitua. Também não é emitido por <c26/>, <c27/>, <c28/> ({ "0.37" }; matrizes por local), <c29/> e <c30/>, que não têm figura principal escalar, nem por <c31/>, cujo documento é JSON compacto (<c32/> dá cada razão), nem pelos documentos membros incorporados numa campanha. Não traz números.

# text
# c1: samples_total
# c2: samples_with_fix
# c3: sigma_uere_m
# c4: best_pdop
# c5: median_pdop
# c6: best_position_sigma_m
# c7: median_position_sigma_m
# c8: sigma_uere_m
seg-1448f90f0086 = Resumo de geometria do pacote de órbita: <c1/>, <c2/>, <c3/> (m, o orçamento de erro de distância por satélite modelado), <c4/> / <c5/> (adimensionais) e <c6/> / <c7/> (m, PDOP (diluição da precisão de posição) × <c8/>). <b>Apenas no pacote de órbita.</b>

# text
# c1: [x, y, z]
seg-ae4f8eed06ac = matriz de <c1/> km, opcional

# text
seg-d13d827f54b0 = Trajetória inercial centrada na Terra propagada da nave do utilizador, uma entrada por instante amostrado. <b>Apenas no pacote de órbita</b>; omitida nos restantes. Apenas de saída — não entra no hash.

# text
# c1: StudyMeta
seg-8f511d5de657 = objeto (<c1/>), opcional

# text
seg-ea152e097d6f = Metadados aditivos do relatório (título do estudo, carimbo de geração, autor, aviso legal). Omitidos quando ausentes, pelo que uma execução sem metadados é idêntica ao byte à saída anterior. Apenas de saída — não entra no hash.

# text
# c1: ClockRun
# c2: quantum
# c3: classical
seg-1041873fba1b = <c1/> (cada um de <c2/> / <c3/>)

# text
# c1: optical-sr-lattice
seg-3fa81140c10d = Identificador do sensor (por exemplo <c1/>).

# text
# c1: clock
seg-80765d202558 = Tipo de modelo (por exemplo <c1/>).

# text
seg-6bf458d964fe = Citação/fonte dos parâmetros do sensor.

# text
seg-9145f04a557f = Os parâmetros do modelo usados, em bruto.

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
seg-b5f4216b55a2 = Série temporal por passo: <c1/> segundos, <c2/> o erro de temporização em <b>nanossegundos</b>, <c3/> um de <c4/>/<c5/>/<c6/>.

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
seg-bbd42065492c = Desvio de Allan sobreposto: <c1/> o tempo de média (s), <c2/> a estabilidade adimensional da frequência fracionária σ_y(τ), <c3/> a contagem de sobreposição por trás desse ponto, <c4/> o tipo de lei de potência identificado a partir da inclinação do MDEV (desvio de Allan modificado) (por exemplo <c5/>), <c6/> os graus de liberdade efetivos específicos do tipo de ruído, e <c7/>/<c8/> a banda de confiança de { "95" }% baseada em χ² de <c9/> nesse τ. Calculado em <c10/>.

# text
# c1: filter_health.rs
seg-1e61fd18257f = Avaliação da consistência do filtro de Kalman (NIS/NEES (NIS: inovação normalizada ao quadrado; NEES: erro de estimação normalizado ao quadrado) face às suas bandas χ²), calculada em <c1/>; omitida nas execuções que não a avaliam.

# text
# c1: FoMScores
# c2: fom
seg-9333864652b0 = <c1/> (o objeto <c2/>)

# text
seg-ce9caeaefd87 = Ressalva

# text
seg-b24de276d788 = Erro RMS (raiz do valor quadrático médio) de fase do relógio (temporização) durante a interrupção.

# text
seg-53e5018ae276 = uma métrica de <b>temporização</b>, não de posição

# text
seg-8cdec6da2072 = Erro de temporização do percentil 95 durante a interrupção.

# text
seg-95f058adb809 = Pior caso (o mais curto) de trecho em inércia dentro da especificação entre os segmentos de interrupção.

# text
seg-48babfd3bd95 = <b>limitado pela grelha</b> — um limite inferior à resolução do passo de tempo

# text
seg-41c08973baa1 = Taxa de crescimento por mínimos quadrados de |erro| durante a interrupção.

# text
seg-707ee74c5c06 = fração [{ "0,1" }]

# text
seg-32e5fe6415f8 = Fração da execução inteira com uma solução dentro da especificação.

# text
seg-361b3b923a45 = fração [{ "0,1" }] ou nulo

# text
seg-5d55682f9349 = <b>Autoconsistência do filtro</b>: fração das amostras da interrupção cujo erro verdadeiro se mantém dentro do limite de k-σ de Kalman.

# text
# c1: INTEGRITY.md
seg-636106cb4a40 = <b>NÃO</b> é integridade HPL/VPL/RAIM (HPL: nível de proteção horizontal; VPL: nível de proteção vertical; RAIM: monitorização autónoma da integridade pelo recetor) — ver <a1><c1/></a1>

# text
seg-f686ade3da21 = <b>Limite analítico de detetabilidade de spoofing</b> a partir da estabilidade do relógio.

# text
# c1: applicable: false
# c2: figure_tiers
# c3: n/a (no attack)
seg-f8783db25141 = só tem significado com um ataque configurado, pelo que os pacotes de relógio e de órbita (que não configuram nenhum) o marcam como <c1/> em <c2/> e o imprimem como <c3/> no resumo; <b>não</b> é um detetor RAIM de vários satélites

# text
seg-90e2980430b9 = Como é o "bom"

# text
# c1: adev_curve
# c2: holdover_s
# c3: security
seg-c1afc6f3c545 = Um <b>relógio mais silencioso</b> (<c1/> mais baixo) dá um <c2/> mais longo e um limite de detetabilidade <c3/> mais alto — esse é o contraste quântico-versus-clássico.

# text
# c1: availability
seg-0fa38207813a = <c1/> próximo de { "1.0" } significa que o sistema se manteve dentro da especificação durante quase toda a execução; numa interrupção longa, desce para o relógio mais ruidoso.

# text
# c1: integrity
seg-4dcba241d5a6 = <c1/> próximo de { "1.0" } significa que o limite de incerteza do próprio filtro foi honesto quanto ao seu erro — uma afirmação de <em>autoconsistência</em>, não uma garantia de segurança da vida humana.

# text
seg-3099d75a04a5 = Outros tipos de cenário

# text
seg-43cd9f67f384 = Todos os outros tipos de cenário emitem a sua própria forma de resultado. Alguns dos mais comuns:

# text
# c1: pos_rms_m
# c2: pos_p95_m
# c3: CAPABILITY.md
seg-6b59ef9dfe85 = <b>inertial</b>: figuras de mérito no domínio da posição em <b>metros</b> (<c1/>, <c2/>) — de eixo único (1-DOF (DOF: grau de liberdade)), de semente única (ver <a1><c3/></a1>).

# text
# c1: timing_spec_ns
# c2: position_spec_m
# c3: position_p95_m
# c4: position_holdover_s
# c5: pnt_holdover_s
# c6: figure_tiers
# c7: untiered
seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> e <c2/> ao nível superior, e por lado as figuras de temporização e de posição de um conjunto de sensores (<c3/>, <c4/> e <c5/>, o tempo até uma das especificações ser violada), com um bloco <c6/> como o do pacote de relógio, em que as figuras de posição constam como <c7/>.

# text
# c1: src/spoof.rs
seg-e38e8a8adec8 = <b>spoof</b>: desvio de spoofing por passo face ao limite de deteção do relógio, mais se o spoofing atingiu a especificação antes da deteção (<c1/>).

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
seg-dfd972d160e1 = <b>skyline</b> (<c1/> e <c2/> com <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; presente apenas quando o cenário tem uma secção <c8/>, pelo que um cenário sem ela fica inalterado): um objeto <c9/> de nível superior com <c10/> (cadeia: <c11/>, <c12/> ou <c13/>), <c14/> (fração [{ "0,1" }] do ângulo sólido do hemisfério superior acima de <c15/>) e <c16/> (cadeia); por amostra <c17/> (contagem de satélites acima da máscara mas atrás da linha de horizonte: <c18/> de <c19/> e <c20/>, <c21/> de <c22/>, <c23/> de <c24/>); e para <c25/> <c26/> (contagem de épocas). As suas unidades e classes de proveniência estão no bloco <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

# text
# c1: field-units-schema.json
# c2: SCENARIOS.md
# c3: *Result
# c4: src/
seg-d113122b7454 = Para o conjunto exato de campos de qualquer tipo de cenário, leia a sua entrada em <a1><c1/></a1> (abaixo), a secção desse tipo de cenário em <a2><c2/></a2>, ou a estrutura <c3/> correspondente em <c4/>.

# text
seg-e0c63207c019 = Outros ficheiros que uma execução escreve

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
seg-cc97989ca06b = Junto a <c1/>, a CLI (interface de linha de comandos) escreve <c2/>, um <c3/> imprimível e o mesmo relatório como <c4/>, cujo bloco <c5/> regista a versão do motor, o SHA-256 do ficheiro de cenário, a semente, a plataforma e o comando exato (ver <a1><c6/></a1> e <a2><c7/></a2>). Os tipos de cenário que publicam uma tabela de reprodutibilidade escrevem também <c8/> (CSV: valores separados por vírgulas). <c9/> escreve ficheiros de troca (ver <a3><c10/></a3>) e <c11/> uma animação (ver <a4><c12/></a4>).

# text
seg-489953601f3b = Unidades e proveniência, por campo, para cada tipo de cenário

# text
seg-61b33dbb44dd = Esta página é escrita à mão e abrange os pacotes de relógio e de órbita. A contraparte legível por máquina abrange <b>todos</b> os tipos de cenário incorporados:

# text
# c1: units
# c2: {"unit", "provenance", "note"}
# c3: []
# c4: *
# c5: src/field_schema.rs
seg-1e20fcda7f0b = <b>No próprio resultado.</b> O documento de resultado de cada cenário traz um objeto <c1/> de nível superior que associa o caminho de um campo emitido a <c2/>. A gramática de caminhos (uma matriz contribui com um segmento com sufixo <c3/> partilhado pelas suas linhas; <c4/> é um curinga de segmento único para objetos indexados por dados) e o vocabulário fechado de proveniência estão definidos em <a1><c5/></a1>.

# text
seg-b8256437c0b7 = Como um único ficheiro.

# text
# c1: field-units-schema.json
# c2: coverage
seg-ae7136e34306 = <a1><c1/></a1> é a união recolhida: para cada tipo de cenário, cada campo numérico que emite numa fonte indicada, com a sua unidade, classe de proveniência, nível de evidência e definição — e, nomeado em vez de omitido, cada campo que ainda não tem uma. O seu bloco <c2/> traz as contagens.

# text
# c1: tests/field_units_global.rs
# c2: UNCOVERED_KINDS
seg-66af6dc065f7 = Ambos são impostos por <c1/>, que executa todos os tipos de cenário registados e falha se um campo numérico emitido não tiver unidade e classe de proveniência. Os tipos de cenário ainda não cobertos são nomeados individualmente em <c2/> desse ficheiro com a razão de cada um estar em aberto, e a contagem está fixada para que a lista só possa diminuir.

# text
# c1: units
seg-ca49a577a07b = Regenere o JSON após qualquer alteração à forma de um relatório ou a um bloco <c1/>:

# text
seg-ce4351cf7673 = <s1>Anterior</s1>Referência de cenários

# text
seg-b988dcc329a4 = <s1>Seguinte</s1>Utilizar TLE reais

# text
seg-6585c8a3643d = ClockRun (cada um de quantum / classical)

# text
seg-299f8a9643f1 = FoMScores (o objeto fom)

# text
# c1: tier
# c2: VALIDATED
# c3: MODELLED
# c4: PARTNER
# c5: matrix
# c6: docs/VERIFICATION-MATRIX.md
# c7: id_rule
# c8: rows
# c9: advanced_report::KIND_CAPABILITIES
# c10: id
# c11: VM-
# c12: requirement
# c13: status
# c14: api::run_toml
# c15: figure_tiers
# c16: evidence_label::strip_json
# c17: <metadata id="kshana-evidence">
# c18: # evidence:
seg-d17376a1ea92 = ({ "0.40" }) A etiqueta de evidência da execução: <c1/> (<c2/>, <c3/> ou <c4/>: o estado <em>mais fraco</em> entre as linhas, de modo que nunca afirma mais que a sua linha mais fraca), <c5/> (<c6/>), <c7/> e <c8/>, um por linha da matriz de verificação que a execução exercitou (as linhas que o seu relatório avançado lista, a partir de <c9/>): <c10/> (<c11/> e os primeiros { "8" } dígitos hexadecimais do SHA-256 do texto do requisito da linha), <c12/> e <c13/>, todos lidos da matriz, nenhum escrito à mão. Acrescentado por <c14/> ao resultado de todo tipo de cenário, antes do bloco <c15/> final quando há um (esse bloco continua a ser a última chave); <c16/> o remove byte a byte. O SVG do gráfico e a tabela CSV da mesma execução trazem a mesma etiqueta (<c17/> e uma linha visível sob o gráfico; linhas de comentário <c18/> na frente do CSV). Os membros de campanha embutidos no resultado de outro tipo de cenário não trazem nenhuma: o documento externo traz-a. Não contém números.
