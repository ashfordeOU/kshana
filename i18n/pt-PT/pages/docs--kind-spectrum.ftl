# docs--kind-spectrum: translations (pt-PT)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Não fornecido — o Kshana modela o desempenho de sinal, não o hardware de carga útil/antena. Referência independente (NoneKind): nenhuma: uma disciplina de propriedade do parceiro, sem módulo e sem teste por conceção

# text
seg-cb91473bfdda = Página do tópico: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Tipo de cenário do motor v{ $version }, família <a1>Jamming, spoofing e o espetro</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-5d23d7f8f872 = Página da família: <a1>Jamming, spoofing e o espetro</a1>

# text
seg-f85a85f0c7e4 = MHz

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que mencionam este tipo de cenário.

# text
seg-3319b18ac61f = e mais { "1" } na matriz.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> O tipo de cenário <c1/> alargado para além da banda L: bandas indicadas como um projeto de sinal predefinido (desenhado com todas as componentes, limitado em banda à largura de banda de transmissão, C/N0 e J/S referidos à componente seguida) ou como uma portadora e uma modulação personalizadas Ensaios: <a1>leo_signal_reference.rs</a1>.

# text
# c1: docs/kinds/by-kind/spectrum.md
seg-ab8fe1c3cb79 = Fonte: <c1/>

# text
# c1: spectrum
seg-10a4479141b5 = <c1/> (tipo de cenário)

# text
seg-fef00c827c6a = Modelo de espetro da banda L e cascata: toda a banda L do GNSS como uma única densidade espetral de potência (PSD), com a frequência na horizontal e o tempo na vertical, sobre uma cronologia de jammers com guião. SINAIS: GPS L1 C/A e L2C (BPSK({ "1" })), serviço aberto Galileo E1 (MBOC(6,1,1/11), ou BOC({ "1,1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), cada um na sua portadora com a potência recebida mínima da especificação de interface (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), salvo indicação em contrário; GLONASS, BeiDou e Galileo E6 não são modelados. JAMMERS: tom de onda contínua, ruído plano de banda estreita, chirp linear em dente de serra e ruído de banda larga adaptado à modulação da própria banda, cada um com um centro, uma largura de banda, uma potência recebida (direta, ou EIRP e distância através da perda de percurso em espaço livre do tipo jamming) e instantes de ligação/desligamento. Cada jammer é avaliado em cada banda pelo seu coeficiente de separação espetral kappa sobre a largura de banda do recetor, e (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; para um jammer, isto é igual à equação anti-jam do tipo jamming com Q = 1/(R_c kappa), e o relatório inclui essa verificação cruzada (e, a seu lado, o valor de Q representativo do tipo jamming). O patamar de ruído é k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }). A cascata faz a média de cada célula sobre o seu intervalo e a sua linha (chirps exatamente, varrimentos completos mais o parcial; jammers que comutam a meio da linha pelo seu ciclo de trabalho), de modo que a cronologia de C/N0 e a imagem vêm dos mesmos números; result.json inclui a grelha com média em blocos em potência, o C/N0 e o J/S por banda e por linha, e, por jammer e por banda, o SSC, Q, J/S, J/S em banda e C/N0 estável. [iq] opcional: o modelo desenhado como IQ complexo num instante, escrito e relido de uma gravação SigMF (cf32_le ou ci16_le), e comparado com uma estimativa de Welch. [recording] opcional (compilações nativas): a PSD de Welch de uma gravação SigMF real ao lado do modelo. VALIDATED: as PSD dos sinais face às larguras de lóbulo principal de manual (BPSK(n) 2n x { "1.023" } MHz de nulo a nulo; lóbulos BOC({ "1,1" }) centrados em +/-1.023 MHz) e os coeficientes de separação espetral face às suas formas fechadas de Parseval e ao Q = { "1" } (CW) e { "1.5" } (adaptado) de Kaplan & Hegarty. MODELLED: as potências dos jammers, a cronologia, as larguras de banda do front-end, o tratamento de espetro contínuo (sem linhas de código) e a ausência de AGC, de blanking e de diagrama de antena.

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-92f1d6d2c0f2 = Uma execução de <c1/> resume-se assim: espetro do cenário | { "5" } bandas | { "3" } jammers | patamar de ruído -202.0 dBW/Hz | pior banda gps-l1ca C/N0 mín. { "3.2" } dB-Hz (J/S { "60.2" } dB)

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
seg-df78607f9cdb = Etiqueta de resultado (a do motor): MODELLED: uma densidade espetral de potência da banda L construída a partir de espetros de sinal de forma fechada (VALIDATED face às larguras de lóbulo principal de manual e aos coeficientes de separação espetral), espetros de jammers e um patamar de ruído kT, reduzida a J/S e C/N0 efetivo pelo coeficiente de separação espetral. As potências dos jammers, t

# attr:alt
seg-ea1678eb9e84 = O gráfico que o motor escreve para scenarios/l-band-waterfall-jamming.toml, tipo spectrum

# text
seg-ce0afea7b030 = <b>VALIDATED</b> Densidades espetrais de potência de área unitária de GPS L1 C/A e L2C (BPSK({ "1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), seno-BOC({ "1,1" }) e Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, com uma variante MBOC acrescentada), os seus nulos localizados numericamente e

# text
# c1: spectrum
seg-7e315c5675d0 = <b>MODELLED</b> O tipo <c1/>: uma grelha frequência-por-tempo da densidade espetral de potência da banda L (patamar térmico k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }), os sinais às suas potências recebidas mínimas da especificação de interface, e onda contínua, banda estreita

# text
seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: ler e escrever gravações no Signal Metadata Format (JSON .sigmf-meta com os campos principais global, captures e annotations; .sigmf-data em bruto como cf32_le, ci16_le ou ci8, os descodificadores de inteiros partilhados com realdata::iqif::load_iq), tudo em s

# text
seg-4e35cc861b15 = <b>VALIDATED</b> Densidades espetrais de potência de área unitária de GPS L1 C/A e L2C (BPSK({ "1" })), GPS L5 e Galileo E5a (BPSK({ "10" })), seno-BOC({ "1,1" }) e Galileo E1 MBOC(6,1,1/11) (navsignal::M. Referência independente (ExternalDataset): valores de manual publicados: o lóbulo principal BPSK(n) de 2n x { "1.023" } MHz de nulo a nulo e os coeficientes anti-jam Q = { "1" } para um jammer de banda estreita (CW) e Q = { "1.5" } para um jammer de espalhamento espetral adaptado ao C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3.ª ed., secção { "9.4" }); os lóbulos principais BOC(m,n) centrados em mais ou menos m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); o

# text
# c1: spectrum
# c2: jamming
seg-287de49e90a8 = <b>MODELLED</b> O tipo <c1/>: uma grelha frequência-por-tempo da densidade espetral de potência da banda L (patamar térmico k T_sys com T_sys = T_ant + { "290" } K (F - { "1" }), os sinais nos. Referência independente (InternalConsistency): redução à equação anti-jam e ao orçamento de ligação do tipo <c2/> existente (o mesmo código, chamado com as mesmas entradas), e à forma fechada do patamar de ruído k T0 F. Os espetros de sinal subjacentes são a linha validada acima; as potências dos jammers, a cronologia e as larguras de banda do front-end são entradas do cenário, os espetros são contínuos (sem linhas de código de espalhamento), e nenhum controlo automático de ganho, blanking ou diagrama de antena atua sobre o j

# text
seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: ler e escrever gravações no Signal Metadata Format (JSON .sigmf-meta com os campos principais global, captures e annotations; .sigmf-data em bruto como cf32_le, ci1. Referência independente (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) com a mesma janela de Hann periódica, sobreposição, escala de densidade, sem remoção de tendência e média bilateral: cada intervalo dentro de { "1e-12" } em termos relativos (observado { "6.0e-14" }) em { "27" } casos, com contagens de segmentos retiradas do próprio spectrogram do scipy. sigmf-python { "1.13.0" } (LGPL-3.0, executado como ferramenta) escreve cinco gravações de terceiros (cf32_le, ci16_le, ci8, duas capturas com anotações, um fir diferente de zero

# text
# c1: not_modelled[0]
seg-0cbbe567f1c8 = estrutura de linhas do código de espalhamento (por exemplo as linhas de { "1" } kHz do C/A): os tons são avaliados face à envolvente suave (resultado <c1/>)

# text
# c1: not_modelled[1]
seg-2efdae3f5764 = controlo automático de ganho, quantização, blanking de pulsos e filtragem por entalhe (resultado <c1/>)

# text
# c1: not_modelled[2]
seg-f3e58705c9a2 = o diagrama da antena de receção na direção do jammer além de um único valor de ganho (resultado <c1/>)

# text
# c1: not_modelled[3]
seg-c0d379cb1ab3 = interferência de acesso múltiplo intrassistema entre satélites de uma mesma banda (resultado <c1/>)

# text
# c1: not_modelled[4]
seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 e Galileo E6 (resultado <c1/>)

# text
# c1: not_modelled[5]
seg-249d8a46f95a = as emissões de um sinal concebido fora da sua largura de banda de transmissão: o seu espetro é truncado aí, pelo que nenhuma emissão fora de banda atinge uma banda vizinha (resultado <c1/>)

# text
# c1: not_modelled[6]
seg-cc83c047f02a = o efeito de um chirp no laço a taxas de varrimento comparáveis à largura de banda do laço: o seu C/N0 usa o espetro com média por linha (resultado <c1/>)

# text
# c1: label
seg-7155706bc289 = MODELLED: uma densidade espetral de potência da banda L construída a partir de espetros de sinal de forma fechada (VALIDATED face às larguras de lóbulo principal de manual e aos coeficientes de separação espetral), espetros de jammers e um patamar de ruído kT, reduzida a J/S e C/N0 efetivo pelo coeficiente de separação espetral. As potências dos jammers, a cronologia e as larguras de banda do front-end são entradas do cenário, não medições. (resultado <c1/>)

# text
seg-95879767c438 = Página do tema: <a1>LEO-SIGNAL.md</a1>

# text
seg-ce69d8d2d9d1 = <s1>Anterior</s1>space-weather

# text
seg-ac2c9c25fbb6 = <s1>Seguinte</s1>spoof-detect

# text
seg-a349aa76b0ed = PARTNER
