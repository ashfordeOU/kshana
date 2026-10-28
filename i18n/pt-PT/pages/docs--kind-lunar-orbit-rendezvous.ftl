# docs--kind-lunar-orbit-rendezvous: translations (pt-PT)

# attr:title
seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

# text
seg-f942b36a11c4 = Ainda não está no GitHub

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os demais estão em <a1><c1/></a1>.

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Toda etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga o contrário (como uma etiqueta é obtida: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-6a26b9ab59fe = Página do tópico: <a1>MISSION-THREAD.md</a1>

# text
seg-2d84b341a41f = Etiqueta do resultado (a do motor): MODELLED

# text
seg-8732ad9f7e07 = <b>MODELLED</b> O propagador que os tipos de cenário lunares partilham (GRAIL GL0660B de grau e ordem { "150" }, a Terra e o Sol como terceiros corpos, relatividade, orientação lunar DE440) comparado com as trajetórias púb. Referência independente (ExternalDataset): Efemérides de veículos espaciais do JPL Horizons para o LRO e o CAPSTONE, face a limiares fixados antecipadamente em xval/mission-thread-lunar/PREREGISTRATION.md (Alterações { "1" } a { "6" }). LRO: MET, { "33" } m de maior diferença 3-D e { "2.4" } m RMS radial contra { "500" } m e { "60" } m. CAPSTONE: NOT MET, uma diferença de posição final de { "136.8" } km contra { "25" } km e uma diferença de periapsia de { "28.4" } km contra { "10" } km, as causas não isoladas. A linha é modelada porque o limiar do CAPSTON

# text
# c1: label
seg-626ab55f0424 = MODELLED (resultado <c1/>)

# text
seg-e482c9896140 = A propagação do modelo de forças lunares face a trajetórias públicas reconstruídas de orbitadores lunares e cislunares é MODELLED, não validada: uma subafirmação é verificada externamente, mas a capacidade inteira compõe partes modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-orbit-rendezvous.md
seg-9e494e8809e5 = Fonte: <c1/>

# text
# c1: lunar-orbit-rendezvous
seg-8beb22a0eb0b = <c1/> (tipo de cenário)

# text
seg-2deefd8c547b = Navegação relativa MODELLED para uma acoplagem no estilo Orion-módulo de aterragem numa órbita lunar baixa ou numa órbita polar elíptica (classe Artemis). Um veículo perseguidor e um alvo voam na mesma órbita sob o modelo de forças lunares da biblioteca; uma estimativa conjunta de Gauss-Newton em lote de 21 parâmetros ao longo do arco (dois estados de veículo e enviesamentos persistentes do sinal no espaço) funde uma solução absoluta de posição por veículo a partir de um conjunto de relés ILLUSTRATIVE de classe LCNS (relés atrás da Lua descartados, quatro necessários, o erro de modo comum do sinal no espaço a cancelar-se entre os veículos) e uma distância por enlace cruzado, com a precisão de medição de distância vinda do limite de seguimento de código do piloto AFS da LunaNet. Indica o erro relativo formal e de Monte Carlo de posição e velocidade nos eixos LVLH do alvo, a disponibilidade das soluções, o erro de estimação normalizado quadrático médio face ao valor esperado, e qualquer tentativa cuja iteração não convergiu, a deriva por ignorar os harmónicos da gravidade e a covariância 6x6 completa transferida. Uma verificação de Hill/Clohessy-Wiltshire em forma fechada aplica-se ao caso circular. MODELLED: conjunto de relés, orçamento de erro e priores ilustrativos; a referência e o estimador partilham um único modelo de forças, de modo que o NEES verifica a autoconsistência e não o erro do modelo. Sem aval de agência; software de caráter consultivo, não um equipamento de navegação certificado.

# text
# c1: scenarios/lunar-orbit-rendezvous.toml
seg-a6d29fc5f19b = Uma execução de <c1/> é resumida assim: lunar-orbit-rendezvous | llo 100x100 km | sep { "2000" } m | soluções { "74" }% | pos rel 1-sigma R/A/C 0.03/0.06/0.04 m | NEES médio { "6.51" } ({ "6" } esperado) | convergiu em { "2000" } s (MODELLED)

# text
# c1: orbit
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: mean_anomaly_deg
# c7: separation_m
# c8: arc_s
# c9: step_s
# c10: n_relays
# c11: afs_cn0_dbhz
# c12: isl_cn0_dbhz
# c13: integration_s
# c14: sis_ure_m
# c15: common_mode_fraction
# c16: target_pos_sigma_m
# c17: target_vel_sigma_m_s
# c18: carried_pos_sigma_m
# c19: carried_vel_sigma_m_s
# c20: filter_model
# c21: n_trials
# c22: seed
# c23: conv_threshold_m
# c24: gravity_table_path
# c25: gravity_degree
seg-b7c86affeac1 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

# text
# c1: scenarios/lunar-orbit-rendezvous.toml
seg-42fe2ad9cfba = O exemplo <c1/> define, entre outros:

# text
seg-60bd49f09fbc = llo

# text
seg-bf92597fdba4 = Software de caráter consultivo, não um equipamento de navegação certif

# text
seg-4466fb6f4043 = Gauss-Newton em lote ao longo do arco

# attr:alt
seg-d97b2505ac72 = O gráfico que o motor escreve para scenarios/lunar-orbit-rendezvous.toml, tipo lunar-orbit-rendezvous

# text
# c1: lunar-orbit-rendezvous
seg-7ea832b979c9 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: uma estimativa conjunta de Gauss-Newton em lote de dois veículos ao longo do arco (vinte e um parâmetros: os dois estados e enviesamentos persistentes de posição do sinal no espaço, comuns e independentes), ampliada sobre um quarto, me Testes: <s1>mission_thread_lunar_oracles.rs</s1>.

# text
# c1: lunar-orbit-rendezvous
seg-826fd7fd44b9 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: uma estimativa conjunta de Gauss-Newton em lote de dois veículos ao longo do arco (vinte e um parâmetros: os dois estados e enviesamentos persistentes de si. Referência independente (InternalConsistency): Autoconsistência sob um pré-registo (xval/mission-thread-lunar/PREREGISTRATION.md, resultados e histórico do estimador em RESULTS.md): o NEES médio do estado relativo é de { "5.85" } a { "5.93" } contra a intervalo de { "5.2" } a { "6.8" } em quatro configurações, MET no quarto projeto de estimador depois de três projetos de filtro sequencial terem falhado; a referência e o estimador partilham um único modelo de forças, portanto isso nada diz sobre o erro do modelo. O p

# text
# c1: kshana kinds --json
seg-b2f273ea732d = Navegação relativa MODELLED para uma acoplagem no estilo Orion-módulo de aterragem numa órbita lunar baixa ou numa órbita polar elíptica (classe Artemis). (catálogo de tipos de cenário (<c1/>))

# text
# c1: kshana kinds --json
seg-9d4f99557cc5 = MODELLED: conjunto de relés, orçamento de erro e priores ilustrativos; a referência e o estimador partilham um único modelo de forças, de modo que o NEES verifica a autoconsistência e não o erro do modelo. (catálogo de tipos de cenário (<c1/>))

# text
seg-158e44d47c0b = HONESTIDADE: MODELLED. O conjunto de relés, o erro do sinal no espaço, a fração de modo comum e os priores são entradas ILLUSTRATIVE, não medições; a referência e o estimador partilham o modelo de forças (um termo central embutido, J2 e C22). A verificação de consistência B1, fixada antecipadamente (NEES médio em [{ "5.2" }, { "6.8" }]), é atingida nas quatro configurações no projeto em lote: ver xval/mission-thread-lunar/RESULTS.md. Nenhuma concordância com qualquer ve (comentário do ficheiro de cenário, linhas { "10" } a { "14" })

# text
# c1: lunar-orbit-rendezvous
seg-2a88a9650804 = A navegação relativa até à acoplagem numa órbita lunar (<c1/>) é MODELLED, não validada: verificada face à sua própria identidade em forma fechada / analítica — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-6ac5bd1500a8 = <s1>Anterior</s1>lunar-llr-datum

# text
seg-54b1c9200aae = <s1>Seguinte</s1>lunar-station-coverage
