# docs--kind-hybrid-ukf: translations (pt-BR)

# text
seg-debc2f07db78 = true

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-7b2721b7588d = Tipo de cenário do motor v{ $version }, família <a1>Sensores inerciais, de fusão e quânticos</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerômetro interferométrico de átomos frios a partir de primeiros princípios (k_eff·T², QPN). Referência independente (ExternalDataset): Vetores numéricos de artigos primários publicados de CAI (função de transferência de Cheinet { "2008" }; sensibilidade de Peters/Freier): k_eff·T² coincide exatamente, o piso unilateral de ASD de ruído de disparo dentro de ~{ "2" }× de cada instrumento publicado (dispositivos reais têm ruído técnico acima do piso quântico). Uma faixa, não uma paridade. { "0.30" } rodada { "2" } (fixada antecipadamente fcb9ac64), um achado (permanece MODELLED): o ruído de rotação somente por QPN contra o medido por Gauguet et al.

# text
seg-9955b1b1c018 = O desempenho de sensores inerciais quânticos é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página da família: <a1>Sensores inerciais, de fusão e quânticos</a1>

# text
seg-ea4498cc0324 = <b>VALIDATED</b> EKF de estado de erro de 15 estados, com acoplamento fraco (validado em um percurso real de IMU/GNSS contra o NaveGo); um UKF de pseudodistância/Doppler com acoplamento forte e um relógio+pos acoplado. Referência independente (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, executado como ferramenta no GNU Octave, nunca vinculado): o seu ins_gnss de acoplamento fraco no próprio percurso real de veículo terrestre com IMU/GNSS Ekinox, ambas as soluções pontuadas contra a trajetória de referência do Ekinox. Os dois filtros leem a mesma entrada float32 de { "20" } Hz, e a configuração do Kshana é mapeada mecanicamente a partir dos parâmetros publicados do conjunto de dados. O RMS de posição horizontal e vertical do Kshana e o seu

# text
# c1: docs/kinds/by-kind/hybrid-ukf.md
seg-4b84d9846715 = Fonte: <c1/>

# text
# c1: hybrid-ukf
seg-d8da1a3f1798 = <c1/> (tipo de cenário)

# text
seg-c6edf89eb8d4 = UKF GNSS/INS híbrido quântico+clássico com acoplamento forte e 17 estados (MODELLED): { "15" } estados de erro do INS + correção de viés do acelerômetro derivada de CAI + um relógio de 2 estados (fase+frequência) do motor de relógio de parâmetros q, conduzido pelo modelo de erro de CAI em faixa. A figura de mérito é a autoconsistência do filtro (NEES + brancura da inovação contra limites de χ²) — uma declaração de autoconsistência, NÃO uma garantia de exatidão no mundo real. Apenas simulação; sem TRL>{ "3" }, sem herança de voo, sem validação externa.

# text
# c1: scenarios/hybrid-ukf.toml
seg-d43a562eb9c2 = Uma execução de <c1/> resume-se assim: cenário e8be19a6199e | hybrid-ukf (17 estados, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | relógio q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 em [10.12,{ "14.04" }] | NEES 7.11/8 em [6.48,{ "9.68" }] | CONSISTENT | auxiliado 0.4m -> inércia 7.7m em 120s | autoconsistência, não exatidão

# text
# c1: seed
# c2: time
# c3: gnss
# c4: accel
# c5: clock
seg-be1b25b8551d = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: residual_accel_bias_m_s2
# c2: speed_m_s
# c3: sigma_pr_m
# c4: sigma_rr_mps
# c5: consistency_seeds
# c6: q_factor
# c7: r_factor
seg-139800576fb7 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/hybrid-ukf.toml
seg-40773fa1ab5f = O exemplo <c1/> define, entre outros:

# text
seg-5e9c8b22ed24 = Acelerômetro interferométrico de átomos frios (Rb-87 D2); em faixa

# text
seg-4c8e2caeba5b = Classe de oscilador de bordo ultraestável/óptico, FM branco sigm

# attr:alt
seg-2968660fa880 = O gráfico que o motor gera para scenarios/hybrid-ukf.toml, tipo de cenário hybrid-ukf

# text
seg-5719161d0b2a = <b>MODELLED</b> Desempenho de interferômetro de átomos frios em faixa (melhor/nominal/conservador) — instabilidade de viés, passeio aleatório de velocidade/ângulo, estabilidade do fator de escala, interrogação. Referência independente (InternalConsistency): Consistência interna: a faixa de VRW citada conferida contra a física de CaiAccelerometer::accel_asd + a faixa dinâmica bruta calculada a partir do limite de ambiguidade de franjas; os números são faixas MODELLED de levantamento de literatura (needs_source_confirmation), nenhum dispositivo validado, nenhum halo de validação

# text
# c1: modelled_note
seg-8632967dc5f8 = SIMULAÇÃO MODELLED. Autoconsistência do filtro (NEES + brancura da inovação) sob entradas de ruído de CAI e de relógio em faixa — uma declaração de autoconsistência, NÃO uma garantia de exatidão no mundo real. Não são resultados de campo/voo; sem TRL>{ "3" }, sem herança de voo, sem validação externa. O hardware de CAI é de propriedade do parceiro. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-e55c8e2bc619 = UKF GNSS/INS híbrido quântico+clássico com acoplamento forte e 17 estados (MODELLED): { "15" } estados de erro do INS + correção de viés do acelerômetro derivada de CAI + um relógio de 2 estados (fase+frequência) do motor de relógio de parâmetros q, conduzido pelo modelo de erro de CAI em faixa. (catálogo de tipos de cenário (<c1/>))

# text
seg-b06538ca3a8c = UKF GNSS/INS híbrido quântico + clássico com acoplamento forte e 17 estados (MODELLED). (comentário do arquivo de cenário, linha { "1" })

# text
seg-b5fc96916b4e = FIGURA DE MÉRITO — autoconsistência do filtro (NEES + brancura da inovação), a única coisa que uma simulação pode afirmar honestamente sobre um estimador. Em um conjunto Monte Carlo cuja verdade é gerada exatamente a partir do ruído que o filtro supõe, as médias agrupadas de NIS (brancura) e NEES devem cair dentro das suas faixas de qui-quadrado de { "95" }%. Esta é uma declaração de AUTOCONSISTÊNCIA, NÃO uma garantia de exatidão no mundo real. (comentário do arquivo de cenário, linhas { "21" } a { "25" })

# text
seg-91afdc2d3ee2 = FRANQUEZA: tudo aqui é MODELLED / SIMULAÇÃO. As entradas de CAI e de relógio são valores em faixa, representativos da literatura, não hardware medido; o hardware de CAI e a sua pessoa-chave permanecem de propriedade do parceiro. Sem TRL>{ "3" }, sem herança de voo, sem validação externa. (comentário do arquivo de cenário, linhas { "27" } a { "29" })

# text
seg-9b94bd3ce7df = Sementes de Monte Carlo sobre as quais a referência independente de consistência agrupa os resultados, e os multiplicadores de dessintonia do filtro. { "24" } sementes dão faixas de NEES de qui-quadrado baseadas em execuções ({ "8" }*{ "24" } graus de liberdade) estreitas o bastante para discriminar um filtro sintonizado de um dessintonizado, mantendo a execução barata. Defina q_factor / r_factor longe de { "1.0" } para dessintonizar o filtro e observar a barreira de consistência rejeitá-lo (q_factor escala o ruído de processo suposto, r_factor o ruído de medição suposto (comentário do arquivo de cenário, linhas { "44" } a { "48" })

# text
seg-496b17a8d3b9 = Página do tópico: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Página do tópico: <a1>QUANTUM.md</a1>

# text
seg-963425965e64 = <s1>Anterior</s1>hybrid-optical-rf

# text
seg-437eb2e463b3 = <s1>Próximo</s1>hybrid
