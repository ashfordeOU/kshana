# docs--kind-spectrum: translations (pt-BR)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Não fornecido — o Kshana modela o desempenho de sinal, não o hardware de carga útil/antena. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por projeto

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Tipo de cenário do motor v{ $version }, família <a1>Jamming, spoofing e o espectro</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-5d23d7f8f872 = Página da família: <a1>Jamming, spoofing e o espectro</a1>

# text
seg-f85a85f0c7e4 = MHz

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-3319b18ac61f = e mais { "1" } na matriz.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> O tipo de cenário <c1/> estendido além da banda L: bandas dadas como um projeto de sinal predefinido (desenhado com todos os componentes, limitado em banda à largura de banda de transmissão, com C/N0 e J/S referidos ao componente rastreado) ou como uma portadora e uma modulação personalizadas Testes: <a1>leo_signal_reference.rs</a1>.

# text
# c1: docs/kinds/by-kind/spectrum.md
seg-ab8fe1c3cb79 = Fonte: <c1/>

# text
# c1: spectrum
seg-10a4479141b5 = <c1/> (tipo de cenário)

# text
seg-fef00c827c6a = Modelo de espectro da banda L e cascata (waterfall): toda a banda L do GNSS como uma única densidade espectral de potência (PSD), frequência na horizontal, tempo na vertical, ao longo de uma linha do tempo de jammers roteirizada. SINAIS: GPS L1 C/A e L2C (BPSK({ "1" })), serviço aberto Galileo E1 (MBOC(6,1,1/11), ou BOC({ "1,1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), cada um em sua portadora com a potência recebida mínima da especificação de interface (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), salvo substituição; GLONASS, BeiDou e Galileo E6 não são modelados. JAMMERS: tom de onda contínua, ruído de banda estreita plano, chirp linear em dente de serra e ruído de banda larga casado com a própria modulação de uma banda, cada um com um centro, uma largura de banda, uma potência recebida (direta, ou EIRP e distância pela perda de percurso em espaço livre do tipo jamming) e instantes de ligar/desligar. Cada jammer é avaliado contra cada banda pelo seu coeficiente de separação espectral kappa sobre a largura de banda do receptor, e (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; para um jammer isso é igual à equação anti-jam do tipo jamming com Q = 1/(R_c kappa), e o relatório traz essa verificação cruzada (e, ao lado, o valor de Q representativo do tipo jamming). O piso de ruído é k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }). A cascata faz a média de cada célula sobre o seu bin e a sua linha (chirps exatamente, varreduras inteiras mais a parcial; jammers que comutam no meio da linha pelo seu ciclo de trabalho), de modo que a linha do tempo de C/N0 e a imagem vêm dos mesmos números; result.json traz a grade com média de blocos em potência, C/N0 e J/S por banda em cada linha, e por jammer e por banda o SSC, Q, J/S, J/S em banda e C/N0 em regime. [iq] opcional: o modelo gerado como IQ complexo em um instante, gravado e relido de uma gravação SigMF (cf32_le ou ci16_le), e comparado com uma estimativa de Welch. [recording] opcional (compilações nativas): a PSD de Welch de uma gravação SigMF real ao lado do modelo. VALIDATED: as PSDs dos sinais contra as larguras de lóbulo principal dos livros-texto (BPSK(n) 2n x { "1.023" } MHz de nulo a nulo; lóbulos de BOC({ "1,1" }) centrados em +/-1.023 MHz) e os coeficientes de separação espectral contra suas formas fechadas de Parseval e contra o Q = { "1" } (CW) e { "1.5" } (casado) de Kaplan & Hegarty. MODELLED: potências dos jammers, linha do tempo, larguras de banda do front-end, o tratamento de espectro contínuo (sem linhas de código) e a ausência de AGC, blanking e diagrama de antena.

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-92f1d6d2c0f2 = Uma execução de <c1/> resume-se assim: cenário spectrum | { "5" } bandas | { "3" } jammers | piso de ruído -202.0 dBW/Hz | pior banda gps-l1ca C/N0 mín. { "3.2" } dB-Hz (J/S { "60.2" } dB)

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-ed3a383d6f1e = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-fb332c77fd0e = O exemplo <c1/> define, entre outros:

# text
seg-df78607f9cdb = Rótulo do resultado (do mecanismo): MODELLED: uma densidade espectral de potência da banda L construída a partir de espectros de sinal em forma fechada (VALIDATED contra as larguras de lóbulo principal e os coeficientes de separação espectral dos livros-texto), espectros de jammers e um piso de ruído kT, reduzida a J/S e C/N0 efetivo pelo coeficiente de separação espectral. As potências dos jammers, t

# attr:alt
seg-ea1678eb9e84 = O gráfico que o mecanismo gera para scenarios/l-band-waterfall-jamming.toml, tipo spectrum

# text
seg-ce0afea7b030 = <b>VALIDATED</b> Densidades espectrais de potência de área unitária de GPS L1 C/A e L2C (BPSK({ "1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), seno-BOC({ "1,1" }) e Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, com uma variante MBOC acrescentada), seus nulos localizados numericamente e

# text
# c1: spectrum
seg-7e315c5675d0 = <b>MODELLED</b> O tipo <c1/>: uma grade frequência por tempo da densidade espectral de potência da banda L (piso térmico k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }), os sinais em suas potências recebidas mínimas da especificação de interface, e onda contínua, banda estreita

# text
seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: leitura e gravação de registros no Signal Metadata Format (JSON .sigmf-meta com os campos core global, captures e annotations; .sigmf-data bruto como cf32_le, ci16_le ou ci8, os decodificadores de inteiros compartilhados com realdata::iqif::load_iq), todos em s

# text
seg-4e35cc861b15 = <b>VALIDATED</b> Densidades espectrais de potência de área unitária de GPS L1 C/A e L2C (BPSK({ "1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), seno-BOC({ "1,1" }) e Galileo E1 MBOC(6,1,1/11) (navsignal::M. Referência independente (ExternalDataset): valores publicados de livros-texto: o lóbulo principal de BPSK(n) de 2n x { "1.023" } MHz de nulo a nulo e os coeficientes anti-jam Q = { "1" } para um jammer de banda estreita (CW) e Q = { "1.5" } para um jammer de espectro espalhado casado com o C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3ª ed., seção { "9.4" }); os lóbulos principais de BOC(m,n) centrados em mais ou menos m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); o

# text
# c1: spectrum
# c2: jamming
seg-287de49e90a8 = <b>MODELLED</b> O tipo <c1/>: uma grade frequência por tempo da densidade espectral de potência da banda L (piso térmico k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }), os sinais no. Referência independente (InternalConsistency): redução à equação anti-jam e ao orçamento de enlace do tipo <c2/> existente (o mesmo código, chamado com as mesmas entradas), e à forma fechada do piso de ruído k T0 F. Os espectros de sinal subjacentes são a linha validada acima; as potências dos jammers, a linha do tempo e as larguras de banda do front-end são entradas do cenário, os espectros são contínuos (sem linhas de código de espalhamento), e nenhum controle automático de ganho, blanking ou diagrama de antena atua sobre o j

# text
seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: leitura e gravação de registros no Signal Metadata Format (JSON .sigmf-meta com os campos core global, captures e annotations; .sigmf-data bruto como cf32_le, ci1. Referência independente (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) com a mesma janela de Hann periódica, sobreposição, escala de densidade, sem remoção de tendência e média bilateral: cada bin dentro de { "1e-12" } relativo (observado { "6.0e-14" }) em { "27" } casos, com contagens de segmentos tomadas do próprio spectrogram do scipy. sigmf-python { "1.13.0" } (LGPL-3.0, executado como ferramenta) grava cinco registros de terceiros (cf32_le, ci16_le, ci8, duas capturas com anotações, uma não nula fir

# text
# c1: not_modelled[0]
seg-0cbbe567f1c8 = estrutura de linhas do código de espalhamento (por exemplo, as linhas de { "1" } kHz do C/A): os tons são avaliados contra a envoltória suave (resultado <c1/>)

# text
# c1: not_modelled[1]
seg-2efdae3f5764 = controle automático de ganho, quantização, pulse blanking e filtragem notch (resultado <c1/>)

# text
# c1: not_modelled[2]
seg-f3e58705c9a2 = o diagrama da antena receptora em direção ao jammer além de um único valor de ganho (resultado <c1/>)

# text
# c1: not_modelled[3]
seg-c0d379cb1ab3 = interferência de acesso múltiplo intrassistema entre satélites de uma mesma banda (resultado <c1/>)

# text
# c1: not_modelled[4]
seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 e Galileo E6 (resultado <c1/>)

# text
# c1: not_modelled[5]
seg-249d8a46f95a = as emissões de um sinal projetado fora de sua largura de banda de transmissão: seu espectro é truncado ali, de modo que nenhuma emissão fora da banda alcança uma banda vizinha (resultado <c1/>)

# text
# c1: not_modelled[6]
seg-cc83c047f02a = o efeito de um chirp sobre o loop em taxas de varredura comparáveis à largura de banda do loop: seu C/N0 usa o espectro com média por linha (resultado <c1/>)

# text
# c1: label
seg-7155706bc289 = MODELLED: uma densidade espectral de potência da banda L construída a partir de espectros de sinal em forma fechada (VALIDATED contra as larguras de lóbulo principal e os coeficientes de separação espectral dos livros-texto), espectros de jammers e um piso de ruído kT, reduzida a J/S e C/N0 efetivo pelo coeficiente de separação espectral. As potências dos jammers, a linha do tempo e as larguras de banda do front-end são entradas do cenário, não medições. (resultado <c1/>)

# text
seg-95879767c438 = Página do tópico: <a1>LEO-SIGNAL.md</a1>

# text
seg-ce69d8d2d9d1 = <s1>Anterior</s1>space-weather

# text
seg-ac2c9c25fbb6 = <s1>Seguinte</s1>spoof-detect
