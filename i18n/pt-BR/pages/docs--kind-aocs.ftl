# docs--kind-aocs: translations (pt-BR)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, enlaces e operações espaciais</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, enlaces e operações espaciais</a1>

# text
# c1: docs/kinds/by-kind/aocs.md
seg-5cd8b3d8c098 = Fonte: <c1/>

# text
# c1: aocs
seg-7f2ade997df5 = <c1/> (tipo de cenário)

# text
seg-7eff466eb018 = Controle de atitude de espaçonave: uma manobra de apontamento inercial de um hub rígido com três ou mais rodas de reação balanceadas sob realimentação MRP (L = -K sigma - P omega), torques das rodas de norma mínima limitados ao limite de cada motor, RK4 com retentor de ordem zero; opcionalmente fechada sobre um EKF multiplicativo a partir de um giroscópio simulado (passeio aleatório de ângulo e de taxa) e um rastreador de estrelas. Informa o tempo de acomodação, o erro de apontamento final e de pico, a velocidade e o torque de pico das rodas, a fração saturada, a deriva do momento angular e, com o estimador, o seu erro de atitude e o NEES. A malha de estado verdadeiro é VALIDATED contra o Basilisk { "2.9.1" }; o estimador é MODELLED.

# text
# c1: scenarios/aocs-slew.toml
seg-a499721d08b1 = Uma execução de <c1/> resume-se assim: aocs: { "4" } rodas, manobra de { "600" } s a partir de { "82.06" } deg -> acomoda abaixo de { "0.1" } deg em { "481.0" } s | final { "2.37e-2" } deg | roda de pico { "1797" } rpm | malha de estado verdadeiro

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
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-b054c73f22e5 = sem valor

# text
seg-6e22c97374b0 = Rótulo do resultado (o do motor): lei de controle e dinâmica das rodas VALIDATED (contra o Basilisk { "2.9.1" } na malha de estado verdadeiro); as entradas desta execução são as do próprio cenário — controle de atitude por rodas de reação sob realimentação MRP, apontamento inercial, sem ruído de sensor, sem atrito

# attr:alt
seg-08c624d5324d = O gráfico que o motor grava para scenarios/aocs-slew.toml, tipo de cenário aocs

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-d69a588facf1 = <b>VALIDATED</b> Controle de atitude por apontamento inercial de um hub rígido com três ou mais rodas de reação balanceadas: a lei de realimentação MRP L_r = -K sigma_BR - P omega_BR (Schaub e Junkins), torques de motor das rodas de norma mínima G_s u = -L_r limitados ao l de cada roda Testes: <a1>aocs_basilisk_oracle.rs</a1>.

# text
seg-7bc495b05d9a = <b>MODELLED</b> O EKF multiplicativo de Lefferts-Markley-Shuster: estados de erro de atitude no referencial do corpo e de viés do giroscópio, propagação com a taxa do giroscópio menos a estimativa do viés e o ruído de processo discreto de Farrenkopf (passeio aleatório de ângulo e de taxa), atualização do rastreador de estrelas

# text
seg-7e3e0dcc936f = <b>VALIDATED</b> Controle de atitude por apontamento inercial de um hub rígido com três ou mais rodas de reação balanceadas: a lei de realimentação MRP L_r = -K sigma_BR - P omega_BR (Schaub e J. Referência independente (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; o bsk wheel executado como ferramenta separada, nunca vinculado nem incorporado ao repositório): spacecraft hub, reactionWheelStateEffector (BalancedWheels, limite de torque ligado), simpleNav, inertial3D, attTrackingError, mrpFeedback (sem termo integral) e rwMotorTorque a dt = { "0.1" } s com o seu RK4, contra a implementação do próprio Kshana em três casos (três rodas ortogonais; uma pirâmide de quatro rodas; um caso saturante de quatro rodas),

# text
seg-d7889856073b = <b>MODELLED</b> O EKF multiplicativo de Lefferts-Markley-Shuster: estados de erro de atitude no referencial do corpo e de viés do giroscópio, propagação com a taxa do giroscópio menos a estimativa do viés e Farre. Referência independente (InternalConsistency): Consistência interna: o erro de estimação normalizado ao quadrado do filtro contra uma verdade simulada a partir dos mesmos modelos de sensor ao longo de sementes de Monte Carlo, e a convergência das estimativas de atitude e de viés. O QUE NÃO É: nenhum estimador externo ou dado de voo foi comparado (o Basilisk { "2.9.1" } não tem módulo MEKF); os modelos de sensor são os de manual, sem desalinhamento, fator de escala ou efeitos do campo de visão do rastreador de estrelas.

# text
# c1: kshana kinds --json
seg-3b71575e0c23 = A malha de estado verdadeiro é VALIDATED contra o Basilisk { "2.9.1" }; o estimador é MODELLED. (catálogo de tipos de cenário (<c1/>))

# text
seg-c7ff0ddbd040 = A estimação de atitude por EKF multiplicativo a partir de um giroscópio e de um rastreador de estrelas é MODELLED, não validada: verificada contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-cc4e7274d409 = Página do tópico: <a1>AOCS.md</a1>

# text
seg-b022bad77259 = <s1>Anterior</s1>acm-link

# text
seg-1fb6e680fd4a = <s1>Próxima</s1>aperture-duty-cycle
