# docs--python-api: translations (pt-BR)

# text
seg-5ad814c7ef9e = Observações

# text
seg-2bd2101ce454 = Superfície

# text
seg-fffbeccd4266 = Símbolo

# text
seg-a129b9e613d0 = Tipo

# text
# c1: docs/PYTHON_API.md
seg-ce0b6a889a87 = Fonte: <c1/>

# text
# c1: abi3
# c2: kshana.pyi
# c3: py.typed
# c4: mypy
# c5: pyright
seg-aea4d3625c20 = O Kshana distribui uma interface de programação de aplicações (API) Python de primeira classe, construída com <a1>PyO3</a1> e <a2>maturin</a2>. Suas wheels <c1/> são compiladas contra a interface binária de aplicação (ABI) estável do Python, de modo que uma wheel por plataforma funciona em todo CPython ≥ { "3.9" }; as wheels cobrem Linux, macOS e Windows, cada um em x86-64 e ARM de 64 bits (consulte <a3>WHEEL_TAGS.md</a3>). Um stub de tipos incluído (<c2/> + <c3/>) dá a editores e a <c4/>/<c5/> informações de tipo completas.

# text
seg-8b0ad6639bd5 = Início rápido

# text
# c1: scenarios/
# c2: pip install numpy
seg-28e092a5a781 = Execute estes trechos a partir da raiz de um checkout do repositório: eles leem arquivos de cenário em <c1/>. A linha do NumPy precisa de <c2/>.

# text
seg-8c83544270b5 = Assinatura

# text
seg-fa90b5cd182b = Retorna

# text
# c1: .json
# c2: .svg
# c3: .summary
# c4: .csv
# c5: .data()
# c6: .array()
# c7: .columns()
# c8: .series()
# c9: .write_csv()
seg-6f62744a47df = resultado tipado (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

# text
seg-67cd4e7f6ad0 = documento de resultado como uma string JSON (JavaScript Object Notation)

# text
seg-8246b2be7aaf = tipos de cenário disponíveis + metadados (analisados)

# text
# c1: scenario_kinds
seg-b5ad97d3ec18 = os mesmos metadados como UMA string de matriz JSON, não uma lista (mantida para chamadores existentes; use <c1/> para a lista analisada)

# text
seg-8ce669f8e1d0 = mensagens de erro (vazio se válido)

# text
# c1: invalid_input
# c2: non_convergence
# c3: unsupported
# c4: io_error
# c5: None
seg-6017d21f52dd = etiqueta de categoria de falha (<c1/>, <c2/>, <c3/> ou <c4/>), ou <c5/> em caso de sucesso

# text
seg-c62c5ab99132 = versão do motor

# text
# c1: receiver-trust
# c2: [platform] kind = "vessel"
seg-fdaaf33250d1 = avaliar um registro real de receptor descrito por um cenário <c1/>: documento de resultado, CSV de confiança por época, gráfico e resumo; uma tabela <c2/> acrescenta os monitores marítimos e a pontuação de confiança de 0 a 100 com os motivos (consultivo)

# text
seg-0fb76af3d043 = um trecho limitado de NMEA pontuado do modo como o modo ao vivo o pontua: estado por época, pontuação de 0 a 100 e motivos, um resumo (sem socket, sem gate; consultivo)

# text
seg-6ecd9bb3a1cd = o registro NMEA de uma embarcação como execução em lote: o modelo de pontuação e a pontuação de cada época com suas deduções (consultivo)

# text
# c1: events_toml
# c2: events
seg-7cd62f15bc3c = o catálogo e o plano publicados do Jammertest como eventos de verdade agendada (<c1/>, <c2/>); slots planejados, não horários de transmissão registrados

# text
seg-1e2faf2894e3 = um registro de receptor pontuado em relação a esse cronograma: latência por teste, perdidos, tempo de recuperação, falsos alarmes (MODELLED; um pacote assinado exige a linha de comando)

# text
# c1: files
# c2: public_key
# c3: seed_hex
seg-f94eaef45f04 = um pacote de evidências assinado para uma janela do registro, em memória: <c1/>, <c2/>, <c3/> (mantenha-a privada); um registro técnico, não um parecer jurídico

# text
# c1: verdict
# c2: verified
# c3: intact-signer-not-pinned
# c4: failed
seg-ebd10aea2f6f = verificar um pacote: hashes, cadeia, assinatura, opcionalmente o signatário confiável, o registro completo e um carimbo de tempo; <c1/> é <c2/>, <c3/> (sem chave pública informada: íntegro, signatário não estabelecido) ou <c4/>

# text
# c1: --export-sp3/-omm/-oem
seg-bf13e70f1d5c = os artefatos <c1/> da CLI como texto

# text
seg-1e5eb44bec6f = quais formatos de interoperabilidade se aplicam a um cenário, sem executá-lo

# text
# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
# c6: {format, spec_url, files}
# c7: {suffix, bytes, sha256, encoding, content}
# c8: utf-8
# c9: base64
seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> ou <c5/> em memória: <c6/>, cada arquivo <c7/> (texto <c8/> ou <c9/>)

# text
# c1: --import-route
seg-bef8250e8453 = uma rota GeoJSON gravada em um cenário de trilha de pontos de passagem (<c1/>)

# text
# c1: {summary, files}
seg-e25bcb6342db = a série temporal da execução como um SVG animado, um player HTML ou até { "120" } quadros SVG: <c1/>

# text
seg-9b24b9cf0510 = os cenários de referência incluídos e seu TOML

# text
# c1: {files, notes}
seg-f62c11fe1e7d = vincular um token RFC { "3161" } (bytes ou base64) a um pacote em memória: <c1/>; o pacote ainda precisa ser verificado; a assinatura da autoridade não é conferida

# text
# c1: seed_hex
# c2: public_key
# c3: fingerprint
# c4: warning
seg-95fe54b500a7 = uma nova chave de assinatura em memória: <c1/> (PRIVADA), <c2/>, <c3/>, <c4/>; somente Python

# text
# c1: iq sweep
seg-646e6aba13db = reproduzir uma gravação em vários projetos de malha (<c1/>): por projeto e PRN, jitter em regime permanente, frações de travamento e C/N0; uma aquisição por PRN, todos os canais sobre as mesmas amostras

# text
# c1: hash
seg-08d46de5e7cd = descrever uma gravação, ou todas as gravações de uma pasta (lê arquivos; <c1/> os lê por completo)

# text
# c1: {files: {suffix: text}, notes, notice}
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: notice
seg-7d9cc8394e65 = o movimento do veículo e os eventos de um cenário para um simulador GNSS de laboratório, em memória: <c1/>; tipos de cenário <c2/>, <c3/>, <c4/>; nenhum sinal é gravado, mantenha <c5/> junto com os arquivos

# text
# c1: runs
# c2: {label, result, scenario?}
# c3: {report, markdown}
# c4: status
# c5: report["statement"]
seg-e215c7242eb2 = o mapeamento do referencial público preenchido a partir de textos de resultado: <c1/> é uma lista de dicts <c2/> (texto, no máximo { "64" }); retorna <c3/>; o <c4/> de cada linha diz que as execuções fornecem evidências em apoio de suas capacidades, não que um referencial seja atendido; leve <c5/> junto com qualquer exibição

# text
seg-18d57e4920dd = as tabelas estáticas de mapeamento (ou os documentos de origem) em Markdown, iniciadas pela declaração

# text
seg-8284e10dce6a = os pacotes de normas (id, título, referencial, contagens de testes) e um aviso; um pacote mede cenários modelados em relação a limiares declarados antes da execução

# text
# c1: MET
# c2: NOT MET
# c3: NEEDS INPUT
# c4: markdown
# c5: ValueError
seg-ce6b819604a9 = uma execução de pacote: cada teste <c1/>, <c2/> ou <c3/> com valores medidos e esperados, mais o relatório em Markdown em <c4/>; levanta <c5/> para um id desconhecido

# text
seg-0f701bc523c6 = a implementação do AFS do LunaNet conferida com as tabelas impressas e os exemplos práticos do LSIS-AFS V1.0 (limiares B1 a B10; B4 relata uma falha fixada)

# text
seg-82aecf261c46 = um fluxo de símbolos AFS (texto de { "0" } e { "1" }) conferido quanto a padrão de sincronismo, decodificação de SB1, FID, continuidade e espaçamento de TOI; o LDPC e o CRC-24Q dos subquadros { "2" } a { "4" } não são verificados

# text
seg-f72ab45ae10b = um fluxo de símbolos de teste com subquadros provisórios (não uma forma de onda)

# text
# c1: docs/spec/TEST-CONDITIONS.md
# c2: evidence_create
seg-1da34527bb64 = o pacote assinado de ida e volta em laboratório que vincula por hash o cenário, as condições de teste (<c1/>), o registro do receptor e a pontuação; como <c2/>

# text
seg-dd3726fec672 = um arquivo de resultado do kshana-bench (texto JSON) a partir de um arquivo de verdade e um arquivo de previsões; MODELLED

# text
seg-b82a110c324c = arquivos de resultado do kshana-bench renderizados como a página estática de classificação (HTML)

# text
# c1: kshana osnma verify --json
# c2: advisory
seg-58b8aa919eaf = autenticação OSNMA do Galileo de páginas I/NAV ou de um fluxo UBX em memória: o dict que <c1/> imprime, com o aviso consultivo em seu campo <c2/>; apenas consultivo, não um serviço de integridade de navegação

# text
# c1: visible
# c2: masked
# c3: request
# c4: site
# c5: time_s
# c6: systems
# c7: tle
# c8: satellites
# c9: mask_deg
# c10: skyline
# c11: clock
# c12: sigma_uere_m
# c13: confidence
# c14: sky_source
# c15: sky_statement
seg-15e4601cd88c = os satélites que um local enxerga sob um horizonte dependente do azimute: por satélite <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, o cofator e a covariância leste-norte-cima e as elipses de erro horizontal; <c3/> é um texto JSON ou TOML ou um dict (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); a decisão de visibilidade e a elipse são conferidas em relação a bibliotecas independentes, o restante é MODELLED, e o resultado traz o aviso consultivo (<c14/>, <c15/> dizem se o céu é representativo ou vem de conjuntos de elementos)

# text
# c1: n
# c2: request
seg-51ac7cd68154 = <c1/> ({ "1" } a { "5000" }) erros de mínimos quadrados com semente no conjunto visível de <c2/>, com sua covariância empírica, RMS e a fração dentro da elipse de { "95" } %

# text
# c1: city-street
# c2: harbour-approach
# c3: fjord
# c4: container-terminal
seg-8bba3099379a = as predefinições de horizonte (<c1/>, <c2/>, <c3/>, <c4/>) com seu rótulo REPRESENTATIVE, procedência e o corte a cada grau de azimute; geometrias representativas, não levantamentos

# text
seg-f900de61f6e9 = uma seção de horizonte (tabela, cânion urbano, setores, terreno) reduzida à tabela normalizada de 360 entradas que o motor usa

# text
# c1: request
seg-824f3c5951fa = o skyplot de <c1/> como texto SVG estático

# text
# c1: jsonl
# c2: receiver-trust
# c3: kshana trust-telemetry
seg-0ffb65c8f5f3 = um fluxo de confiança (<c1/>) ou um resultado de <c2/> como texto Prometheus, linhas de syslog CEF ou LEEF, ou uma carga JSON OTLP, com os codificadores de <c3/>; nada é enviado e nenhum relógio é lido (as linhas de syslog não trazem carimbo de tempo)

# text
# c1: kshana-interference-map/v1
seg-c1ab3dbbe2f2 = um mapa de interferência GNSS a partir de texto CSV de ADS-B ou AIS: um dict por dia UTC com GeoJSON <c1/> (apenas agregado; uma célula degradada não aponta a interferência como causa)

# text
seg-ff4bc7fdbce7 = parcela de uma rota por células degradadas desses mapas, como texto JSON (não é uma previsão; células não observadas não são evidência de uma rota livre)

# text
# c1: nmea
# c2: log_json
# c3: log_text
seg-d70bccba0e03 = NMEA sintético de ponte para treinamento de tripulação mais o registro do instrutor (<c1/>, <c2/>, <c3/>); somente texto, nunca para os sistemas de navegação reais de uma embarcação

# text
# c1: iq_scene
# c2: iq_acquire
# c3: iq_track
# c4: gps-l1ca
# c5: galileo-e1b
# c6: glonass-l1of
seg-3fe13851ac82 = os nomes de sinais IQ GNSS que <c1/>, <c2/> e <c3/> aceitam (<c4/>, <c5/>, <c6/>, ...)

# text
# c1: samples_i
# c2: samples_q
# c3: truth
seg-50bf4ad4e23a = uma cena IQ GNSS com vários satélites em memória: <c1/> / <c2/> e <c3/> por época

# text
seg-b3199839a37c = o mesmo, com cada satélite GPS na geometria de suas efemérides transmitidas a partir de uma mensagem de navegação RINEX (Receiver Independent Exchange Format)

# text
seg-8f0f9efea46b = aquisição por FFT (transformada rápida de Fourier) de cada PRN (código de ruído pseudoaleatório): Doppler, fase do código, estatística, limiar

# text
# c1: kshana.acq-surface/1
# c2: rows[doppler][lag]
# c3: parabolic
# c4: fine_search
seg-3bf994f3f1bf = a superfície de aquisição inteira de um PRN (<c1/>): potência de correlação <c2/>, o pico e dois refinamentos de Doppler fino (<c3/>, <c4/>)

# text
seg-393572e31421 = adquirir e depois rastrear cada PRN: Doppler por época, fase do código, indicadores de travamento, C/N0, correlador prompt

# text
seg-bc39efdb015a = a cadeia de front-end do receptor (passa-faixa, notch, blanking, excisão, AGC (controle automático de ganho), quantizador) sobre amostras complexas

# text
# c1: iq-labfit
seg-ead1b81c712f = ajustar o modelo de perda de travamento da malha de rastreamento a uma linha do tempo de confiança do receptor (um cenário <c1/>)

# text
# c1: kshana.loop-design/1
# c2: name
# c3: hash
# c4: ValueError
seg-0ab8531d0465 = analisar um arquivo <c1/> (um caminho ou texto TOML) em seus projetos resolvidos, cada um com seu <c2/> e <c3/>; <c4/> em um arquivo inválido

# text
# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: header
# c4: records
seg-9c3467d4451e = ler um arquivo binário de épocas de rastreamento (<c1/>, como <c2/> o grava): o <c3/> e um dict por época em <c4/>

# text
# c1: iq monitor
# c2: series
# c3: events
# c4: spectra
# c5: notes
seg-469303e33d2a = os monitores de detecção IQ sobre uma gravação em uma única passagem de fluxo (<c1/>): <c2/>, <c3/>, <c4/> e <c5/>; lê um arquivo

# text
# c1: kshana.test-conditions/1
# c2: hash
seg-bb5c5008f1a8 = validar um arquivo de condições de teste de laboratório (<c1/>, TOML ou JSON, um caminho ou texto) e devolvê-lo resolvido, com seu <c2/>

# text
# c1: kshana.campaign/1
# c2: out_dir
# c3: kshana iq campaign
# c4: digest
seg-d2441bf762b4 = executar uma campanha de replay em laboratório (<c1/>) em <c2/> como <c3/> faz; as células concluídas são puladas; devolve as contagens de células, as falhas e o <c4/> quando todas as células estiverem prontas

# text
# c1: digest
seg-7b6d264d9c7f = reconstruir os painéis de pontuação, o relatório HTML e o resumo de uma campanha a partir de suas células: as contagens de células e de linhas, as linhas que falham em um limiar e o <c1/>

# text
seg-e3956268cf1c = Assinaturas de IQ GNSS e de confiança do receptor

# text
# c1: kshana.pyi
# c2: samples_i
# c3: samples_q
# c4: i
# c5: q
# c6: numpy.asarray(...)
seg-817bd0898d46 = As assinaturas completas, como <c1/> as declara (toda palavra-chave após os argumentos obrigatórios tem um valor padrão; as docstrings no stub dão o significado de cada uma). Envolva as listas <c2/> / <c3/>, e as entradas <c4/> / <c5/>, com <c6/> para obter matrizes.

# text
# c1: iq_read_epochs
# c2: kshana iq track --epochs
seg-2dd9323829ce = Uma campanha de replay em laboratório a partir de Python e depois o seu relatório (o arquivo da campanha e suas gravações são seus; uma célula concluída é pulada na chamada seguinte; <c1/> lê um arquivo de épocas de rastreamento que uma execução de <c2/> gravou):

# text
# c1: iq_track
# c2: acq_coherent
# c3: None
# c4: acq_coherent=1
seg-5f48b88438df = O <c2/> de <c1/> define quantos períodos de código a aquisição de transferência integra de forma coerente. A partir da { "0.33.0" } o padrão é <c3/>, que significa automático: cerca de { "4" } ms ({ "4" } períodos para um código de { "1" } ms como o GPS L1 C/A, { "1" } para um código de { "4" } ms ou mais longo), de modo que o canal comece perto o bastante para a malha de frequência fazer a captura; <c4/> mantém a busca de um período da { "0.32" }.

# text
seg-012a83181bd3 = Tipos

# text
# c1: kshana.pyi
# c2: ScenarioKind
# c3: Literal
# c4: ErrorKind
# c5: error_kind
# c6: ProvenanceClass
# c7: TypedDict
# c8: KindMeta
# c9: scenario_kinds()
# c10: FieldUnit
# c11: units
# c12: _FieldUnitBase
# c13: tests/typed_api_sync.rs
seg-0b4f4c6c6014 = <c1/> tipa os vocabulários fechados para verificadores (mypy, pyright): <c2/> (o nome de cada tipo de cenário, um <c3/>), <c4/> (as quatro etiquetas que <c5/> devolve), <c6/>, e os <c7/>s <c8/> (do que <c9/> devolve uma lista) e <c10/> (uma entrada do bloco <c11/> de um resultado, que estende a base de chaves obrigatórias <c12/>). Eles existem apenas para verificadores de tipos e não podem ser importados em tempo de execução; <c13/> os mantém iguais às listas do motor.

# text
seg-b5ad0d8e1456 = Membro

# text
seg-2698ab8436e6 = documento de resultado completo (JSON)

# text
seg-7eccc8361120 = SVG (Scalable Vector Graphics) de gráfico autônomo

# text
seg-38c8d20ca07a = resumo humano de uma linha

# text
seg-e21e82ad3fe8 = a tabela de reprodutibilidade, para os tipos de cenário que a emitem (veja abaixo)

# text
seg-aadcc1cc4c79 = o resultado analisado em um dict Python (veja a nota sobre a forma abaixo)

# text
# c1: path
# c2: "points.0.coords"
# c3: "/points/0/coords"
seg-409504363c4c = a lista numérica em <c1/> (com pontos, <c2/>, ou um JSON Pointer, <c3/>): 1-D para números, 2-D para listas numéricas de mesmo comprimento

# text
# c1: path
seg-b6d5d7e5271a = a lista de registros em <c1/> (uma série temporal), uma matriz por campo que seja número em todos os registros

# text
# c1: .columns
seg-adb2d15f9f74 = toda lista de registros com um campo numérico, indexada por caminho com pontos, cada uma como <c1/>

# text
# c1: path
seg-7f053ad96880 = gravar essa tabela em <c1/>; devolve os bytes gravados, ou { "0" } (e não grava nada) quando o tipo de cenário não emite tabela

# text
seg-276104139e73 = A tabela de reprodutibilidade

# text
# c1: realtime-frame-eop
# c2: lunar-time-budget
# c3: lunar-jamming
# c4: telecom-timing
# c5: leo-navmsg
# c6: moonlight-service-volume
# c7: export_site_lat_deg
# c8: export_site_lon_deg
# c9: csv = None
# c10: <scenario>.table.csv
seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> e <c5/> sempre publicam uma tabela; <c6/> publica uma quando um local de exportação (<c7/> + <c8/>) está configurado. Todos os outros tipos de cenário devolvem <c9/>. O texto são os mesmos bytes que a CLI (interface de linha de comando) grava como <c10/>, de modo que um revisor que reproduz uma tabela publicada a partir da wheel nunca precise recorrer à linha de comando:

# text
seg-3ad2987110ee = Forma do resultado

# text
seg-57c7066d3522 = As figuras de mérito e a série temporal ficam <b>por lado da execução</b>, não no nível superior. Para uma execução de relógio, o documento é:

# text
# c1: data["quantum"]["fom"]
# c2: data["figures_of_merit"]
# c3: field-units-schema.json
# c4: SCHEMA.md
seg-cb19f961de2b = de modo que as figuras de mérito são <c1/>, nunca <c2/>. Os outros tipos de cenário emitem seus próprios pacotes; a referência completa por campo, com unidades e uma indicação da fonte, é <a1><c3/></a1> e o guia do leitor é <a2><c4/></a2>.

# text
# c1: validate_toml
# c2: error_kind
seg-bfd984e0407b = <c1/> e <c2/> <b>executam</b> o cenário, de modo que revelam erros de análise, de configuração <em>e</em> de execução. Eles nunca levantam exceção.

# text
# c1: run
# c2: run_typed
# c3: ValueError
seg-0ca0a1da8356 = <c1/> / <c2/> levantam <c3/> em um cenário inválido.

# text
# c1: seed
# c2: scenario_hash
# c3: REPRODUCIBILITY.md
seg-901c2ede0cd0 = Os resultados são reproduzíveis: um cenário carrega sua <c1/> e o motor registra um <c2/>, de modo que a mesma entrada produz uma saída idêntica byte a byte na mesma plataforma (consulte <a1><c3/></a1>).

# text
# c1: .array
# c2: .columns
# c3: .series
# c4: numpy.asarray(...)
# c5: .data()
# c6: tests/python/test_numpy_runoutput.py
# c7: ImportError
# c8: KeyError
# c9: ValueError
# c10: notebooks/
seg-8c0c32fcba2b = <c1/>, <c2/> e <c3/> devolvem exatamente <c4/> dos mesmos valores que <c5/> fornece (mesmo dtype, idêntico bit a bit; <c6/>). Elas importam o NumPy quando chamadas e levantam <c7/> sem ele; o NumPy fica fora dos requisitos de execução do pacote. <c8/> significa que o caminho não existe, <c9/> que o valor ali não é uma matriz numérica (ou não é uma lista de registros). Notebooks executáveis estão em <a1><c10/></a1>.

# text
seg-00a3cf088cde = Fora do Python: processos de longa duração

# text
# c1: kshana receiver-trust live
# c2: --listen
# c3: docs/TRUST-TELEMETRY.md
# c4: kshana nmea-scenario --tcp/--udp
# c5: receiver_trust
# c6: receiver_trust_replay
# c7: nmea_training
seg-3780dd4973f0 = <c1/> (um processo de fluxo com um gate e um servidor TCP <c2/> opcional) e os exportadores de telemetria (Prometheus, OTLP, syslog; <c3/>) e o fluxo de <c4/> são exclusivos da linha de comando: uma ligação retorna quando a chamada retorna e não mantém um socket aberto. O Python cobre a forma em lote de cada um: <c5/> para um registro, <c6/> para um trecho de fluxo (pontuações e estados; o gate não é aplicado), <c7/> para o texto gerado.

# text
seg-82379c29d438 = <s1>Anterior</s1>Interferômetro de átomos frios

# text
seg-4a457afc63fb = <s1>Próximo</s1>npm e WebAssembly

# text
seg-dbbce10a12d2 = RunOutput

seg-a4c68601516f = regiões estimadas de emissores a partir de texto CSV de ADS-B ou AIS: <c1/>, cada uma rotulada MODELLED; regiões com confiança declarada com um centroide e uma elipse de incerteza, nunca um ponto isolado; apenas agregados, e uma região não é a posição de ninguém nem uma constatação da causa
