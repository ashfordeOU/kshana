# docs--kind-aocs: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
# c1: docs/kinds/by-kind/aocs.md
seg-5cd8b3d8c098 = Fonte: <c1/>

# text
# c1: aocs
seg-7f2ade997df5 = <c1/> (tipo de cenário)

# text
seg-7eff466eb018 = Controlo de atitude de veículos espaciais: uma reorientação com apontamento inercial de um corpo rígido com três ou mais rodas de reação equilibradas sob realimentação MRP (L = -K sigma - P omega), binários de roda de norma mínima limitados ao limite de cada motor, RK4 com retenção de ordem zero; opcionalmente fechada sobre um EKF multiplicativo a partir de um giroscópio simulado (passeio aleatório de ângulo e de taxa) e de um seguidor de estrelas. Comunica o tempo de estabilização, o erro de apontamento final e máximo, a velocidade e o binário máximos das rodas, a fração saturada, a deriva do momento angular e, com o estimador, o seu erro de atitude e o NEES. O ciclo de estado verdadeiro é VALIDATED face ao Basilisk { "2.9.1" }; o estimador é MODELLED.

# text
# c1: scenarios/aocs-slew.toml
seg-a499721d08b1 = Uma execução de <c1/> resume-se assim: aocs: { "4" } wheels, { "600" } s slew from { "82.06" } deg -> settles below { "0.1" } deg at { "481.0" } s | final { "2.37e-2" } deg | peak wheel { "1797" } rpm | true-state loop

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
seg-2ad4d3f07a6a = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: duration_s
# c2: dt_s
# c3: sample_s
# c4: omega0_rad_s
# c5: pointing_threshold_deg
# c6: estimator
seg-ed0c5c6266d9 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/aocs-slew.toml
seg-a09eb69b36d7 = O exemplo <c1/> define, entre outros:

# text
seg-8b51cfcf5bd5 = N m

# text
seg-6876b0214e4c = N m s

# text
seg-8e4dea0df19e = kg m^{ "2" }

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os restantes estão em <a1><c1/></a1>.

# text
seg-b054c73f22e5 = sem valor

# text
seg-6e22c97374b0 = Etiqueta do resultado (a do motor): lei de controlo e dinâmica das rodas VALIDATED (face ao Basilisk { "2.9.1" } no ciclo de estado verdadeiro); as entradas desta execução são as do próprio cenário — controlo de atitude por rodas de reação sob realimentação MRP, apontamento inercial, sem ruído de sensores, sem atrito

# attr:alt
seg-08c624d5324d = O gráfico que o motor escreve para scenarios/aocs-slew.toml, tipo aocs

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
seg-d69a588facf1 = <b>VALIDATED</b> Controlo de atitude com apontamento inercial de um corpo rígido com três ou mais rodas de reação equilibradas: a lei de realimentação MRP L_r = -K sigma_BR - P omega_BR (Schaub e Junkins), binários dos motores das rodas de norma mínima G_s u = -L_r limitados ao l Testes: <a1>aocs_basilisk_oracle.rs</a1>.

# text
seg-7bc495b05d9a = <b>MODELLED</b> O EKF multiplicativo de Lefferts-Markley-Shuster: estados de erro de atitude no referencial do corpo e de viés do giroscópio, propagação com a taxa do giroscópio menos a estimativa do viés e o ruído de processo discreto de Farrenkopf (passeio aleatório de ângulo e de taxa), atualização do seguidor de estrelas

# text
seg-7e3e0dcc936f = <b>VALIDATED</b> Controlo de atitude com apontamento inercial de um corpo rígido com três ou mais rodas de reação equilibradas: a lei de realimentação MRP L_r = -K sigma_BR - P omega_BR (Schaub e J. Referência independente (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; a execução de rodas do bsk como ferramenta separada, nunca ligada nem incluída no repositório): spacecraft hub, reactionWheelStateEffector (BalancedWheels, limite de binário ativo), simpleNav, inertial3D, attTrackingError, mrpFeedback (sem termo integral) e rwMotorTorque com dt = { "0.1" } s com o seu RK4, face à implementação do próprio Kshana em três casos (três rodas ortogonais; uma pirâmide de quatro rodas; um caso de quatro rodas com saturação),

# text
seg-d7889856073b = <b>MODELLED</b> O EKF multiplicativo de Lefferts-Markley-Shuster: estados de erro de atitude no referencial do corpo e de viés do giroscópio, propagação com a taxa do giroscópio menos a estimativa do viés e Farre. Referência independente (InternalConsistency): Consistência interna: o erro de estimação normalizado quadrático do filtro face a uma referência simulada com os mesmos modelos de sensores ao longo de sementes de Monte Carlo, e a convergência das estimativas de atitude e de viés. O QUE NÃO É: nenhum estimador externo nem dados de voo foram comparados (o Basilisk { "2.9.1" } não tem módulo MEKF); os modelos de sensores são os de manual, sem desalinhamento, fator de escala nem efeitos do campo de visão do seguidor de estrelas.

# text
# c1: kshana kinds --json
seg-3b71575e0c23 = O ciclo de estado verdadeiro é VALIDATED face ao Basilisk { "2.9.1" }; o estimador é MODELLED. (catálogo de tipos (<c1/>))

# text
seg-c7ff0ddbd040 = A estimação de atitude por EKF multiplicativo a partir de um giroscópio e de um seguidor de estrelas é MODELLED, não validada: verificada face à sua própria identidade analítica / de forma fechada — apanha erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-cc4e7274d409 = Página do tema: <a1>AOCS.md</a1>

# text
seg-b022bad77259 = <s1>Anterior</s1>acm-link

# text
seg-1fb6e680fd4a = <s1>Seguinte</s1>aperture-duty-cycle
