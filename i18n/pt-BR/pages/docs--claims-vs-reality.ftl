# docs--claims-vs-reality: translations (pt-BR)

# text
seg-a47934361f43 = Fluxos NMEA para treinamento de tripulações

# text
seg-ee2e250497f9 = Exportação para test bench

# text
seg-2bd2101ce454 = Superfície

# text
seg-ad856ad710eb = Status

# text
seg-98d0bc6b40ce = Mapeamento de compliance para frameworks públicos

# text
seg-80f3f0aae42c = Mapa de interferência

# text
# c1: docs/CLAIMS-VS-REALITY.md
seg-28b1885c4ca7 = Fonte: <c1/>

# text
seg-bf5c2811ce29 = Alegações versus realidade: registro de alegações exageradas

# text
# c1: OC-0
# c2: OC-13
seg-592e007bc3cf = Uma auditoria independente de uma versão anterior do Kshana catalogou quatorze <b>alegações exageradas</b> (<c1/>…<c2/>): lugares em que uma superfície voltada ao público (README, playground, rótulos de FoM (figura de mérito), pacotes de cenário) descrevia uma capacidade de forma mais forte do que o código entregava. Esta página é o registro de encerramento: cada linha apresenta a alegação exagerada original, como foi resolvida e a evidência. Aparecem dois tipos de resolução:

# text
seg-39250970dbbf = <b>Alegação retirada</b>: o texto foi corrigido para corresponder ao código (reenquadramento honesto, sem mudança de capacidade). "Zero código = zero alegação."

# text
seg-fb7da0f79ead = <b>Substituída</b>: a capacidade real foi construída e testada depois, de modo que a alegação forte passou a ser <em>exata</em>.

# text
# c1: tests/no_overclaims.rs
# c2: README.md
# c3: docs/CAPABILITY.md
# c4: docs/GLOSSARY.md
# c5: web/capabilities.json
# c6: web/index.html
# c7: web/README.md
# c8: README.crates.md
# c9: README.pypi.md
# c10: README.npm.md
seg-5292f7162e2b = Uma proteção contra regressão (<c1/>) examina as superfícies públicas em vigor (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> e as páginas iniciais do crates.io, do PyPI (Python Package Index) e do npm, <c8/>, <c9/>, <c10/>) a cada execução da CI (integração contínua) e falha se qualquer das expressões de alegação exagerada simples retiradas reaparecer sem ressalva, de modo que uma linha não possa regredir silenciosamente de GREEN.

# text
seg-dafc6f322f34 = Todas as quatorze linhas estão <b>GREEN</b>.

# text
seg-5cf7bf2d1889 = OC (alegação exagerada)

# text
seg-0e01d4053d7f = Alegação exagerada original

# text
seg-36bf87638923 = Resolução

# text
seg-70a952c4150b = "estimador de fusão de Kalman conjunto" sugeria um único filtro de covariância cruzada; o código executava dois estimadores independentes

# text
seg-d5682a7fdb11 = <b>Substituída</b>: foi construído um filtro de Kalman real de relógio+posição acoplado por covariância cruzada

# text
# c1: src/fusion/coupled.rs
seg-1008020cd9e4 = <c1/> ({ "7" } testes, incluindo um conjunto de 100 tentativas, acoplado contra desacoplado, que exige que o RMS (raiz do valor quadrático médio) de posição do filtro acoplado seja inferior a { "0.6" }× o do desacoplado e que o filtro acoplado vença em pelo menos { "90" } das { "100" } tentativas); CAPABILITY "Fusão de sensores" → completa

# text
seg-334fc345d501 = "RAIM (monitoramento autônomo de integridade pelo receptor) de detecção de spoofing auxiliado por relógio" sugeria um detector RAIM de vários satélites

# text
seg-cf0795c2ee02 = <b>Alegação retirada → Substituída</b>: reenquadrada como um limite de detectabilidade de spoofing pela estabilidade do relógio; o RAIM/ARAIM real (HPL/VPL (HPL: nível de proteção horizontal; VPL: nível de proteção vertical)) foi incorporado depois

# text
# c1: src/raim.rs
# c2: docs/INTEGRITY.md
seg-f46432acbfa0 = <c1/> ({ "30" } testes: ARAIM de instantâneo + separação de soluções, HPL/VPL, FDE (detecção e exclusão de falhas), diagramas de Stanford); <c2/>

# text
seg-8b47f69dbb76 = "demonstrador de jamming" sem nenhum código de jamming por trás

# text
seg-bfff34d5a250 = <b>Substituída</b>: foi construído um modelo de jamming por orçamento de enlace J/S → C/N₀ efetivo → perda de travamento

# text
# c1: src/jamming.rs
seg-5f75628b8201 = <c1/> ({ "10" } testes); linha "Resiliência" do README

# text
seg-bae512770cd6 = "Modelo completo de ruído de variância de Allan de IMU (unidade de medição inercial) em uma tríade de IMU": o modelo era de um único eixo

# text
seg-50c0b5855cb9 = <b>Alegação retirada → Substituída</b>: reenquadrada como um orçamento de erro de 1-DOF (DOF: grau de liberdade); um INS (sistema de navegação inercial) strapdown de três eixos foi então entregue

# text
# c1: src/inertial
seg-501bf7d8fff0 = <c1/> strapdown de três eixos (atitude por quatérnio, mecanização NED (norte-leste-baixo), coning/sculling); ROADMAP "Inercial"

# text
seg-ad250a99b05f = "Integração PNT (posicionamento, navegação e temporização) híbrida" sugeria um filtro GNSS/INS (GNSS: sistema global de navegação por satélite) acoplado; era um orçamento de erro de navegação por estima

# text
seg-85fb58d37a5d = <b>Alegação retirada → Substituída</b>: reenquadrada como navegação por estima com uma retravação configurável; a fusão GNSS/INS fortemente acoplada real foi então entregue

# text
# c1: src/fusion/tightly_coupled17.rs
seg-9e6b092d5656 = <c1/> (filtro de Kalman unscented (UKF) de 17 estados com navegação por estima quantum-CAI (CAI: interferômetro de átomos frios)); CAPABILITY "Fusão de sensores" → completa

# text
seg-46a637f8e967 = "validado ~{ "2" }%" sugeria um portão rígido imposto

# text
# c1: VALIDATION.md
seg-5e98d7664558 = <b>Alegação retirada</b>: <c1/> declara o portão <em>imposto</em> ({ "20" }–{ "25" }% com média entre sementes); "~{ "2" }%" passou a ser rotulado como observação típica, e não como o portão

# text
# c1: docs/VALIDATION.md
seg-84f4fcdc7e50 = <c1/>, cabeçalho "Sobre as tolerâncias"

# text
seg-85ec2fe9c7f7 = "determinístico entre plataformas" sem evidência registrada

# text
seg-6e516f04db89 = <b>Alegação retirada</b>: cadeia de ferramentas fixada em uma versão exata; hashes de referência (golden) por cenário registrados com um portão de reprodutibilidade. (Idêntico bit a bit <em>entre</em> SO/arquitetura (SO: sistema operacional) continua sendo um item em aberto, declarado honestamente.)

# text
# c1: rust-toolchain.toml
# c2: 1.93.0
# c3: tests/golden.rs
# c4: tests/cross_platform_golden.rs
# c5: scripts/check-reproducible.sh
seg-9db327be56c3 = <c1/> (canal <c2/>); <c3/> (valores numéricos até { "1e-6" }); <c4/> (hash da impressão digital de entrada e da forma de cada resultado, executado na matriz de CI de Linux, macOS e Windows); <c5/>

# text
seg-2708139388ed = "simulador PNT híbrido quântico-clássico" sugeria física quântica de primeiros princípios

# text
seg-717167714e83 = <b>Alegação retirada → Substituída</b>: reenquadrada como um simulador de resiliência PNT que usa modelos de desempenho de sensores quânticos; a física CAI de Mach–Zehnder de primeiros princípios foi então incorporada

# text
# c1: src/inertial/quantum_imu.rs
# c2: 1/√(N·C²·T²)
# c3: docs/QUANTUM.md
seg-c67fb22add4b = <c1/> ({ "26" } testes: fase de Mach–Zehnder, ruído de projeção <c2/>, função de transferência de vibração, sistemáticos de Coriolis + AC-Stark (AC: corrente alternada)); <c3/>

# text
seg-5c6b7d4f2029 = A FoM "Desempenho de Integridade" sugeria integridade HPL/VPL/RAIM de aviação

# text
seg-ee5487da890c = <b>Alegação retirada + Substituída (em camadas)</b>: a FoM do cenário por execução é rotulada honestamente como <em>autoconsistência do filtro</em> (<b>não</b> como integridade de aviação); o HPL/VPL real do ARAIM é apresentado <em>separadamente</em>, de modo que os dois nunca sejam confundidos

# text
# c1: src/fom.rs:80
# c2: integrity
# c3: src/raim.rs
# c4: docs/INTEGRITY.md
seg-31aacdf17b02 = <c1/> (<c2/>: autoconsistência, com ressalva); <c3/> + <c4/> (ARAIM real)

# text
seg-0686fa147c96 = FoM de Segurança apresentada como sempre significativa, mesmo sem ataque

# text
# c1: 1 − P_md
seg-d6d9296422fc = <b>Alegação retirada</b>: a FoM de Segurança (<c1/>) é enquadrada no contexto do detector de spoofing e só é significativa quando um cenário de ataque está configurado

# text
seg-8f7b211b5a0c = Linha "Resiliência" do README; a FoM de Segurança é definida no ponto de especificação operacionalmente danoso

# text
seg-d66421174e94 = A FoM "Desempenho de Posicionamento" sugeria precisão completa no domínio da posição

# text
# c1: pos_rms_m
seg-9eeb13a16350 = <b>Alegação retirada</b>: rotulada como um <c1/> de 1-DOF para os pacotes inercial/híbrido, explicitamente <b>não</b> como uma precisão 2-D CEP/2DRMS (CEP: erro circular provável) ou ponderada por DOP (DOP: diluição de precisão)

# text
seg-e8115df73c10 = Tabela de figuras de mérito do README (linha "Desempenho de Posicionamento")

# text
seg-5c73759a2454 = números de FoM inercial lidos como estatísticas de conjunto a partir de sementes únicas

# text
# c1: monte_carlo: false
# c2: runs = N
seg-3db3a41ce848 = <b>Alegação retirada</b>: uma execução única é sinalizada com <c1/>; <c2/> informa média/dispersão/IC bootstrap de { "95" }%

# text
seg-bf737455e6f2 = Tabela de FoM do README; testes de envelope de cobertura de cenários

# text
seg-aa362992b5da = o cenário "constelação GPS (Sistema de Posicionamento Global) SGP4 (Simplified General Perturbations { "4" })" usava TLEs (conjuntos de elementos de duas linhas) sintéticos de substituição

# text
# c1: gps-ops
seg-ebae20813a52 = <b>Substituída</b>: o cenário agora incorpora um instantâneo genuíno do Celestrak <c1/> com data, com somas de verificação estritas

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum
# c4: tests/scenario_coverage.rs
seg-2d49f6101571 = <c1/> (<c2/> real, <c3/>); <c4/>

# text
# c1: Cargo.toml
seg-cdefa4ee436a = A cadeia de versão do README divergiu de <c1/>

# text
# c1: Cargo.toml
seg-8e66b9485565 = <b>Alegação retirada</b>: um portão de CI verifica que o selo de situação do README corresponde a <c1/>

# text
seg-347fd8c1f334 = { "0.35" }: alegações mantidas estreitas e uma correção

# text
# c1: tests/no_overclaims.rs
# c2: tests/compliance_report.rs
seg-946ff389cec5 = Os recursos da { "0.35" } foram escritos com seus limites declarados ao lado da alegação, e as mesmas proteções (<c1/> e a proteção de redação em <c2/>) examinam as páginas que os descrevem. Esta tabela não faz parte do registro de quatorze linhas acima; ela registra, para as novas superfícies, o que é alegado e o que não é.

# text
seg-6ac3f9b26aad = O que é alegado

# text
seg-6f558815da86 = O que não é

# text
# c1: receiver_trust
# c2: $PKSHT
seg-d0964d2f9bbc = Pontuação de confiança da embarcação (<c1/>, <c2/>, portão, Signal K, OpenCPN)

# text
seg-ee4d75006bfc = uma pontuação de 0-100 e motivos a partir do próprio NMEA de um receptor, MODELLED

# text
seg-59ff27c84fe4 = consultivo, não um equipamento de navegação homologado; a pontuação de um registro não é uma afirmação sobre outros receptores; não torna um fixo mais preciso

# text
seg-8869e6a5c10b = NMEA sintético de ponte de comando com eventos roteirizados e um registro do instrutor

# text
seg-bc4ba77bc569 = apenas texto, sem saída de radiofrequência; nunca para os sistemas de navegação em operação de uma embarcação; consultivo, não um equipamento de navegação homologado

# text
seg-9482ecbb2748 = um registro técnico assinado que pode ser verificado offline

# text
seg-20ae6dd2b780 = não é um parecer jurídico; não diz o que causou um evento, quem foi responsável, nem que o registro mostra o que o receptor realmente recebeu

# text
seg-4132fc36f1d3 = células agregadas de navegação degradada a partir de relatórios de licença aberta

# text
seg-c64960abf9fb = não é uma previsão; a exposição de uma rota é uma parcela de células, não um risco

# text
seg-ed6d268e0291 = o movimento do veículo e os eventos de um cenário em arquivos que um simulador de laboratório pode ler

# text
seg-85c8ad22ef03 = nenhum sinal é gravado; não se alega desempenho de nenhum simulador ou receptor

# text
seg-1bba9a883650 = para quais linhas um conjunto de execuções fornece evidências em apoio de, com uma lacuna em cada linha

# text
seg-f2a836780831 = nunca que uma estrutura de referência foi atingida ou que um produto foi aprovado; um rótulo de tipo de cenário, por si só, não é evidência

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-31c7009c9914 = <b>Correção registrada na { "0.35" }.</b> Uma versão anterior de <c1/> e dos comentários do módulo de resiliência descrevia sete "categorias de técnicas" do DHS Resilient PNT Conformance Framework. A versão { "2.0" } dessa estrutura define funções centrais (Prevent, Respond, Recover), níveis de { "0" } a { "4" } e oito requisitos numerados, e nenhuma lista de sete categorias. Os sete nomes de subpontuação que o motor de pontuação emite são do próprio Kshana, e a correspondência agora diz isso.

# text
seg-f70787ecb194 = Como uma linha permanece GREEN

# text
# c1: tests/no_overclaims.rs
seg-f2c599e8882a = As alegações fortes (OC-0/2/7/8 e as metades substituídas de OC-1/3/4/12) estão GREEN porque a capacidade foi <b>entregue e testada</b>, e não porque o texto tenha sido suavizado. As linhas com alegação retirada estão GREEN porque o texto em vigor corresponde ao código. O teste de proteção torna a segunda categoria exigível: se uma expressão de alegação exagerada retirada voltar a uma superfície pública, a CI fica vermelha. Veja <c1/>.

# text
seg-39e475441b60 = <s1>Anterior</s1>Por que as linhas permanecem modeladas

# text
seg-07ef8e1e862e = <s1>Próximo</s1>Proveniência
