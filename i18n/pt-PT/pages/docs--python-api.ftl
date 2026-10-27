# docs--python-api: translations (pt-PT)

# text
seg-5ad814c7ef9e = Notas

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
seg-aea4d3625c20 = O Kshana distribui uma interface de programação de aplicações (API) Python de primeira classe, construída com <a1>PyO3</a1> e <a2>maturin</a2>. As suas wheels <c1/> são compiladas face à interface binária de aplicações (ABI) estável do Python, pelo que uma wheel por plataforma funciona em CPython ≥ { "3.9" }; as wheels abrangem Linux, macOS e Windows, cada um em x86-64 e ARM de 64 bits (consulte <a3>WHEEL_TAGS.md</a3>). Um stub de tipos incluído (<c2/> + <c3/>) dá aos editores e a <c4/>/<c5/> informação de tipos completa.

# text
seg-8b0ad6639bd5 = Início rápido

# text
# c1: scenarios/
# c2: pip install numpy
seg-28e092a5a781 = Execute estes excertos a partir da raiz de uma cópia de trabalho do repositório: leem ficheiros de cenário em <c1/>. A linha do NumPy precisa de <c2/>.

# text
seg-8c83544270b5 = Assinatura

# text
seg-fa90b5cd182b = Devolve

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
seg-67cd4e7f6ad0 = documento de resultado como cadeia JSON (JavaScript Object Notation)

# text
seg-8246b2be7aaf = tipos de cenário disponíveis + metadados (analisados)

# text
# c1: scenario_kinds
seg-b5ad97d3ec18 = os mesmos metadados como UMA cadeia de lista JSON, não uma lista (mantido para chamadores existentes; use <c1/> para a lista analisada)

# text
seg-8ce669f8e1d0 = mensagens de erro (vazio se válido)

# text
# c1: invalid_input
# c2: non_convergence
# c3: unsupported
# c4: io_error
# c5: None
seg-6017d21f52dd = etiqueta de categoria de falha (<c1/>, <c2/>, <c3/> ou <c4/>), ou <c5/> em caso de êxito

# text
seg-c62c5ab99132 = versão do motor

# text
# c1: receiver-trust
# c2: [platform] kind = "vessel"
seg-fdaaf33250d1 = avaliar um registo real de recetor descrito por um cenário <c1/>: documento de resultado, CSV de confiança por época, gráfico e resumo; uma tabela <c2/> acrescenta os monitores marítimos e a pontuação de confiança de 0-100 com motivos (consultivo)

# text
seg-0fb76af3d043 = um excerto NMEA limitado pontuado da forma como o modo em tempo real pontua: estado por época, pontuação de 0-100 e motivos, um resumo (sem socket, sem barreira; consultivo)

# text
seg-6ecd9bb3a1cd = o registo NMEA de uma embarcação como execução em lote: o modelo de pontuação e a pontuação de cada época com as suas deduções (consultivo)

# text
# c1: events_toml
# c2: events
seg-7cd62f15bc3c = o catálogo e o plano publicados do Jammertest como eventos de referência agendados (<c1/>, <c2/>); janelas planeadas, não horas de emissão registadas

# text
seg-1e2faf2894e3 = um registo de recetor pontuado face a esse calendário: latência por teste, falhas, tempo de recuperação, falsos alarmes (MODELLED; um pacote assinado precisa da linha de comandos)

# text
# c1: files
# c2: public_key
# c3: seed_hex
seg-f94eaef45f04 = um pacote de evidências assinado para uma janela do registo, em memória: <c1/>, <c2/>, <c3/> (mantenha-o privado); um registo técnico, não um parecer jurídico

# text
# c1: verdict
# c2: verified
# c3: intact-signer-not-pinned
# c4: failed
seg-ebd10aea2f6f = verificar um pacote: hashes, cadeia, assinatura, opcionalmente o signatário de confiança, o registo completo e uma marca temporal; <c1/> é <c2/>, <c3/> (sem chave pública indicada: íntegro, signatário não estabelecido) ou <c4/>

# text
# c1: --export-sp3/-omm/-oem
seg-bf13e70f1d5c = os artefactos <c1/> da CLI como texto

# text
seg-1e5eb44bec6f = que formatos de interoperabilidade se aplicam a um cenário, sem o executar

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
seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> ou <c5/> em memória: <c6/>, cada ficheiro <c7/> (texto <c8/> ou <c9/>)

# text
# c1: --import-route
seg-bef8250e8453 = uma rota GeoJSON escrita num cenário de trajeto de pontos de passagem (<c1/>)

# text
# c1: {summary, files}
seg-e25bcb6342db = a série temporal da execução como SVG animado, um leitor HTML ou até { "120" } imagens SVG: <c1/>

# text
seg-9b24b9cf0510 = os cenários de referência incluídos e o respetivo TOML

# text
# c1: {files, notes}
seg-f62c11fe1e7d = associar um token RFC { "3161" } (bytes ou base64) a um pacote em memória: <c1/>; o pacote tem de continuar a verificar-se; a assinatura da autoridade não é verificada

# text
# c1: seed_hex
# c2: public_key
# c3: fingerprint
# c4: warning
seg-95fe54b500a7 = uma nova chave de assinatura em memória: <c1/> (PRIVADA), <c2/>, <c3/>, <c4/>; apenas em Python

# text
# c1: iq sweep
seg-646e6aba13db = reproduzir uma gravação com vários projetos de malhas (<c1/>): por projeto e PRN, jitter em regime estacionário, frações de bloqueio e C/N0; uma aquisição por PRN, todos os canais sobre as mesmas amostras

# text
# c1: hash
seg-08d46de5e7cd = descrever uma gravação, ou todas as gravações de uma pasta (lê ficheiros; <c1/> lê-os por inteiro)

# text
# c1: {files: {suffix: text}, notes, notice}
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: notice
seg-7d9cc8394e65 = o movimento do veículo e os eventos de um cenário para um simulador GNSS de laboratório, em memória: <c1/>; tipos <c2/>, <c3/>, <c4/>; nenhum sinal é escrito, mantenha <c5/> junto com os ficheiros

# text
# c1: runs
# c2: {label, result, scenario?}
# c3: {report, markdown}
# c4: status
# c5: report["statement"]
seg-e215c7242eb2 = o mapeamento do quadro público preenchido a partir de textos de resultados: <c1/> é uma lista de dicts <c2/> (texto, no máximo { "64" }); devolve <c3/>; o <c4/> de cada linha diz que as execuções fornecem elementos de prova em apoio das suas capacidades, não que um quadro seja satisfeito; leve <c5/> consigo em qualquer apresentação

# text
seg-18d57e4920dd = as tabelas de mapeamento estáticas (ou os documentos de origem) em Markdown, encabeçadas pela declaração

# text
seg-8284e10dce6a = os pacotes de normas (id, título, quadro, contagens de testes) e um aviso; um pacote mede cenários modelados face a limiares indicados antes da execução

# text
# c1: MET
# c2: NOT MET
# c3: NEEDS INPUT
# c4: markdown
# c5: ValueError
seg-ce6b819604a9 = uma execução de pacote: cada teste <c1/>, <c2/> ou <c3/> com valores medidos e esperados, mais o relatório em Markdown em <c4/>; gera <c5/> para um id desconhecido

# text
seg-0f701bc523c6 = a implementação LunaNet AFS verificada face às tabelas impressas e aos exemplos resolvidos da LSIS-AFS V1.0 (limiares B1 a B10; B4 comunica uma falha fixada)

# text
seg-82aecf261c46 = um fluxo de símbolos AFS (texto de { "0" } e { "1" }) verificado quanto a padrão de sincronização, descodificação de SB1, FID, continuidade e espaçamento de TOI; o LDPC e o CRC-24Q das subtramas { "2" } a { "4" } não são verificados

# text
seg-f72ab45ae10b = um fluxo de símbolos de teste com subtramas provisórias (não é uma forma de onda)

# text
# c1: docs/spec/TEST-CONDITIONS.md
# c2: evidence_create
seg-1da34527bb64 = o pacote assinado do circuito de laboratório que liga por hash o cenário, as condições de ensaio (<c1/>), o registo do recetor e a pontuação; como <c2/>

# text
seg-dd3726fec672 = um ficheiro de resultados kshana-bench (texto JSON) a partir de um ficheiro de referência e de um ficheiro de previsões; MODELLED

# text
seg-b82a110c324c = ficheiros de resultados kshana-bench renderizados como a página estática de classificação (HTML)

# text
# c1: kshana osnma verify --json
# c2: advisory
seg-58b8aa919eaf = autenticação Galileo OSNMA de páginas I/NAV ou de um fluxo UBX em memória: o dict que <c1/> imprime, com o aviso consultivo no seu campo <c2/>; apenas consultivo, não é um serviço de integridade de navegação

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
seg-15e4601cd88c = os satélites que um local vê sob um horizonte dependente do azimute: por satélite <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, o cofator e a covariância este-norte-cima e as elipses de erro horizontal; <c3/> é texto JSON ou TOML ou um dict (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); a decisão de visibilidade e a elipse são verificadas face a bibliotecas independentes, o resto é MODELLED, e o resultado traz o aviso consultivo (<c14/>, <c15/> dizem se o céu é representativo ou proveniente de conjuntos de elementos)

# text
# c1: n
# c2: request
seg-51ac7cd68154 = <c1/> ({ "1" } a { "5000" }) erros de mínimos quadrados com semente sobre o conjunto visível de <c2/>, com a sua covariância empírica, o RMS e a fração dentro da elipse de { "95" } %

# text
# c1: city-street
# c2: harbour-approach
# c3: fjord
# c4: container-terminal
seg-8bba3099379a = as predefinições de horizonte (<c1/>, <c2/>, <c3/>, <c4/>) com o seu rótulo REPRESENTATIVE, a proveniência e o corte a cada grau de azimute; geometrias representativas, não levantamentos

# text
seg-f900de61f6e9 = uma secção de horizonte (tabela, canyon de rua, setores, terreno) reduzida à tabela normalizada de 360 entradas que o motor usa

# text
# c1: request
seg-824f3c5951fa = o skyplot de <c1/> como texto SVG estático

# text
# c1: jsonl
# c2: receiver-trust
# c3: kshana trust-telemetry
seg-0ffb65c8f5f3 = um fluxo de confiança (<c1/>) ou um resultado de <c2/> como texto Prometheus, linhas de syslog CEF ou LEEF ou uma carga JSON OTLP, com os codificadores de <c3/>; nada é enviado e nenhum relógio é lido (as linhas de syslog não trazem marca temporal)

# text
# c1: kshana-interference-map/v1
seg-c1ab3dbbe2f2 = um mapa de interferência GNSS a partir de texto CSV de ADS-B ou AIS: um dict por dia UTC com GeoJSON <c1/> (apenas agregado; uma célula degradada não nomeia a interferência como causa)

# text
seg-ff4bc7fdbce7 = a proporção de uma rota através de células degradadas desses mapas, como texto JSON (não é uma previsão; as células não observadas não são prova de uma rota livre)

# text
# c1: nmea
# c2: log_json
# c3: log_text
seg-d70bccba0e03 = NMEA sintético de ponte para formação de tripulações mais o registo do instrutor (<c1/>, <c2/>, <c3/>); apenas texto, nunca para os sistemas de navegação em tempo real de uma embarcação

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
seg-50bf4ad4e23a = uma cena IQ GNSS multissatélite em memória: <c1/> / <c2/> e <c3/> por época

# text
seg-b3199839a37c = o mesmo, com cada satélite GPS na sua geometria de efemérides difundidas a partir de uma mensagem de navegação RINEX (Receiver Independent Exchange Format)

# text
seg-8f0f9efea46b = aquisição por FFT (fast Fourier transform) de cada PRN (código de ruído pseudoaleatório): Doppler, fase do código, estatística, limiar

# text
# c1: kshana.acq-surface/1
# c2: rows[doppler][lag]
# c3: parabolic
# c4: fine_search
seg-3bf994f3f1bf = toda a superfície de aquisição de um PRN (<c1/>): potência de correlação <c2/>, o pico e dois refinamentos de Doppler fino (<c3/>, <c4/>)

# text
seg-393572e31421 = adquirir e depois seguir cada PRN: Doppler por época, fase do código, indicadores de bloqueio, C/N0, correlador prompt

# text
seg-bc39efdb015a = a cadeia de front-end do recetor (passa-banda, notch, blanking, excisão, AGC (controlo automático de ganho), quantizador) sobre amostras complexas

# text
# c1: iq-labfit
seg-ead1b81c712f = ajustar o modelo de perda de bloqueio das malhas de seguimento a uma cronologia de confiança do recetor (um cenário <c1/>)

# text
# c1: kshana.loop-design/1
# c2: name
# c3: hash
# c4: ValueError
seg-0ab8531d0465 = analisar um ficheiro <c1/> (um caminho ou texto TOML) nos seus projetos resolvidos, cada um com o seu <c2/> e <c3/>; <c4/> num ficheiro inválido

# text
# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: header
# c4: records
seg-9c3467d4451e = ler um ficheiro binário de épocas de seguimento (<c1/>, tal como <c2/> o escreve): o <c3/> e um dict por época em <c4/>

# text
# c1: iq monitor
# c2: series
# c3: events
# c4: spectra
# c5: notes
seg-469303e33d2a = os monitores de deteção IQ sobre uma gravação numa única passagem em contínuo (<c1/>): <c2/>, <c3/>, <c4/> e <c5/>; lê um ficheiro

# text
# c1: kshana.test-conditions/1
# c2: hash
seg-bb5c5008f1a8 = validar um ficheiro de condições de ensaio de laboratório (<c1/>, TOML ou JSON, um caminho ou texto) e devolvê-lo resolvido, com o seu <c2/>

# text
# c1: kshana.campaign/1
# c2: out_dir
# c3: kshana iq campaign
# c4: digest
seg-d2441bf762b4 = executar uma campanha de reprodução em laboratório (<c1/>) para <c2/> tal como <c3/> faz; as células concluídas são ignoradas; devolve as contagens de células, as falhas e o <c4/> quando todas as células estão concluídas

# text
# c1: digest
seg-7b6d264d9c7f = reconstruir os quadros de pontuação, o relatório HTML e o resumo de uma campanha a partir das suas células: as contagens de células e de linhas, as linhas que falham um limiar e o <c1/>

# text
seg-e3956268cf1c = Assinaturas de IQ GNSS e de confiança do recetor

# text
# c1: kshana.pyi
# c2: samples_i
# c3: samples_q
# c4: i
# c5: q
# c6: numpy.asarray(...)
seg-817bd0898d46 = As assinaturas completas, tal como <c1/> as indica (cada argumento nomeado após os argumentos obrigatórios tem um valor predefinido; as docstrings no stub dão o significado de cada um). Envolva as listas <c2/> / <c3/>, e as entradas <c4/> / <c5/>, com <c6/> para obter arrays.

# text
# c1: iq_read_epochs
# c2: kshana iq track --epochs
seg-2dd9323829ce = Uma campanha de reprodução em laboratório a partir de Python e depois o seu relatório (o ficheiro da campanha e as suas gravações são seus; uma célula concluída é ignorada na chamada seguinte; <c1/> lê um ficheiro de épocas de seguimento que uma execução de <c2/> escreveu):

# text
# c1: iq_track
# c2: acq_coherent
# c3: None
# c4: acq_coherent=1
seg-5f48b88438df = <c2/> de <c1/> define quantos períodos de código a aquisição de transição integra de forma coerente. A partir da { "0.33.0" } tem por predefinição <c3/>, o que significa automático: cerca de { "4" } ms ({ "4" } períodos para um código de { "1" } ms como o GPS L1 C/A, { "1" } para um código de { "4" } ms ou mais longo), para que o canal comece suficientemente perto para a malha de frequência o puxar para a captura; <c4/> mantém a pesquisa de um período da { "0.32" }.

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
seg-0b4f4c6c6014 = <c1/> tipa os vocabulários fechados para os verificadores (mypy, pyright): <c2/> (cada nome de tipo de cenário, um <c3/>), <c4/> (as quatro etiquetas que <c5/> devolve), <c6/>, e os <c7/> <c8/> (de que <c9/> devolve uma lista) e <c10/> (uma entrada do bloco <c11/> de um resultado, que estende a base de chaves obrigatórias <c12/>). Existem apenas para verificadores de tipos e não são importáveis em tempo de execução; <c13/> mantém-nos iguais às listas do motor.

# text
seg-b5ad0d8e1456 = Membro

# text
seg-2698ab8436e6 = documento de resultado completo (JSON)

# text
seg-7eccc8361120 = SVG (Scalable Vector Graphics) autónomo do gráfico

# text
seg-38c8d20ca07a = resumo humano de uma linha

# text
seg-e21e82ad3fe8 = a tabela de reprodutibilidade, para os tipos que a emitem (consulte abaixo)

# text
seg-aadcc1cc4c79 = o resultado analisado para um dict de Python (consulte a nota sobre a forma abaixo)

# text
# c1: path
# c2: "points.0.coords"
# c3: "/points/0/coords"
seg-409504363c4c = a lista numérica em <c1/> (com pontos, <c2/>, ou um JSON Pointer, <c3/>): 1-D para números, 2-D para listas numéricas de igual comprimento

# text
# c1: path
seg-b6d5d7e5271a = a lista de registos em <c1/> (uma série temporal), um array por cada campo que é um número em todos os registos

# text
# c1: .columns
seg-adb2d15f9f74 = cada lista de registos com um campo numérico, indexada por caminho com pontos, cada uma como <c1/>

# text
# c1: path
seg-7f053ad96880 = escrever essa tabela em <c1/>; devolve os bytes escritos, ou { "0" } (e não escreve nada) quando o tipo não emite nenhuma tabela

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
seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> e <c5/> publicam sempre uma tabela; <c6/> publica uma quando está configurado um local de exportação (<c7/> + <c8/>). Todos os outros tipos devolvem <c9/>. O texto é composto pelos mesmos bytes que a CLI (command-line interface) escreve como <c10/>, pelo que um revisor que reproduza uma tabela publicada a partir da wheel nunca precisa de recorrer à linha de comandos:

# text
seg-3ad2987110ee = Forma do resultado

# text
seg-57c7066d3522 = As figuras de mérito e a série temporal ficam <b>por lado da execução</b>, não ao nível superior. Para uma execução de relógio, o documento é:

# text
# c1: data["quantum"]["fom"]
# c2: data["figures_of_merit"]
# c3: field-units-schema.json
# c4: SCHEMA.md
seg-cb19f961de2b = pelo que as figuras de mérito estão em <c1/>, nunca em <c2/>. Os outros tipos emitem os seus próprios pacotes; a referência completa por campo, com unidades e uma indicação da origem, é <a1><c3/></a1> e o guia do leitor é <a2><c4/></a2>.

# text
# c1: validate_toml
# c2: error_kind
seg-bfd984e0407b = <c1/> e <c2/> <b>executam</b> o cenário, pelo que revelam erros de análise, de configuração <em>e</em> de execução. Nunca geram exceções.

# text
# c1: run
# c2: run_typed
# c3: ValueError
seg-0ca0a1da8356 = <c1/> / <c2/> geram <c3/> perante um cenário inválido.

# text
# c1: seed
# c2: scenario_hash
# c3: REPRODUCIBILITY.md
seg-901c2ede0cd0 = Os resultados são reprodutíveis: um cenário traz a sua <c1/> e o motor regista um <c2/>, pelo que a mesma entrada produz uma saída idêntica ao byte na mesma plataforma (consulte <a1><c3/></a1>).

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
seg-8c0c32fcba2b = <c1/>, <c2/> e <c3/> devolvem exatamente <c4/> dos mesmos valores que <c5/> dá (mesmo dtype, idênticos bit a bit; <c6/>). Importam o NumPy quando chamados e geram <c7/> sem ele; o NumPy fica fora dos requisitos de execução do pacote. <c8/> significa que o caminho não existe, <c9/> que o valor aí não é um array numérico (ou não é uma lista de registos). Há notebooks executáveis em <a1><c10/></a1>.

# text
seg-00a3cf088cde = Não existe em Python: processos de longa duração

# text
# c1: kshana receiver-trust live
# c2: --listen
# c3: docs/TRUST-TELEMETRY.md
# c4: kshana nmea-scenario --tcp/--udp
# c5: receiver_trust
# c6: receiver_trust_replay
# c7: nmea_training
seg-3780dd4973f0 = <c1/> (um processo de fluxo com uma barreira e um servidor TCP <c2/> opcional) e os exportadores de telemetria (Prometheus, OTLP, syslog; <c3/>) e o fluxo de <c4/> existem apenas na linha de comandos: uma ligação devolve quando a chamada devolve e não mantém um socket aberto. O Python cobre a forma em lote de cada um: <c5/> para um registo, <c6/> para um excerto de fluxo (pontuações e estados; a barreira não é aplicada), <c7/> para o texto gerado.

# text
seg-82379c29d438 = <s1>Anterior</s1>Interferómetro de átomos frios

# text
seg-4a457afc63fb = <s1>Seguinte</s1>npm e WebAssembly

# text
seg-dbbce10a12d2 = RunOutput
