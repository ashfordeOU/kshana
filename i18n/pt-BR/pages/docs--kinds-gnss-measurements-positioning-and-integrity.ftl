# docs--kinds-gnss-measurements-positioning-and-integrity: translations (pt-BR)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
# c1: published
seg-06197409c717 = Vetores de referência de certificação do ARAIM publicados: os níveis de proteção horizontal e vertical do ARAIM do motor executados contra os PRÓPRIOS exemplos numéricos resolvidos do Subgrupo Técnico de ARAIM do WG-C, na tolerância (TOL_PL = { "5e-2" } m) que esses próprios documentos declaram. Dois vetores estão versionados como fixtures, cada um com o seu URL de obtenção, a data de obtenção, o SHA-256 do arquivo de origem e a página: o Apêndice D do Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) — autoconsistente e o vetor de aceitação — e a Seção A.IX do Anexo A do Milestone { "3" } Report ({ "2016" }), a declaração que as bibliografias de pesquisa citam. Toda entrada publicada (a matriz de geometria de 10 satélites e 2 constelações, as diagonais de variância C_int e C_acc, b_nom, P_sat, P_const e o conjunto de constantes LPV-200) e toda saída publicada (VPL, HPL, EMT, sigma_v_acc, K_fa_3 e os sigma_3, sigma_ss_3 e b_3 dos dois modos de falha de constelação) é informada ao lado do número do próprio motor e da sua diferença absoluta. A equação do nível de proteção NÃO é resolvida de novo aqui: a lista de modos da referência é entregue ao raim::araim_protection_level / araim_integrity_risk já existentes do motor, de modo que a bissecção e a álgebra da cauda gaussiana sob teste são as do próprio motor; só a geometria, as subsoluções, os limiares de detecção e a divisão de orçamento publicada são construídos para ele. EXTERNALLY CHECKED contra o vetor de { "2019" }: VPL { "18.2926" } m contra { "18.3" } m publicado, HPL { "13.4063" } m contra { "13.45" } m, EMT { "7.2997" } m contra { "7.2998" } m, sigma_v_acc { "1.3694" } m contra { "1.3694" } m, e todos os seis intermediários publicados com precisão de meia unidade na última casa decimal impressa. O vetor de { "2016" } traz dois defeitos internos que o relatório declara em vez de ocultar — um erro de sinal na linha { "3" } de G e um K_fa_3 avaliado em { "57" } modos de falha enquanto o documento declara N_fault_max = { "1" } ({ "12" } modos) — de modo que os seus intermediários de geometria são reproduzidos exatamente, enquanto os seus níveis de proteção são informados como discrepâncias medidas e excluídos da figura de aceitação; a tolerância nunca é ampliada para absorvê-los. Todo campo numérico emitido traz uma unidade e uma classe de proveniência, e uma figura transcrita é rotulada <c1/> para que nunca possa ser confundida com uma calculada. ESCOPO: apenas N_fault_max = { "1" } (modos de falha de um único satélite e de uma única constelação) está implementado, e um caso cujas probabilidades a priori exigem subconjuntos de falhas simultâneas de vários eventos é REFUSED em vez de ser truncado silenciosamente; a detecção e exclusão de falhas, a verificação de consistência do qui-quadrado e a etapa de realocação de dupla contagem do algoritmo de referência estão fora do escopo. Isto reproduz o exemplo resolvido de um algoritmo de referência publicado — não é uma certificação, um artefato de aeronavegabilidade nem uma aprovação.

# text
# attr:alt
seg-693c823c85d1 = O gráfico que o motor grava para scenarios/araim-reference-check.toml, tipo de cenário araim-reference-check

# text
seg-2ffccc9c1eff = Simulação de pseudodistância no domínio da medição (ionosfera de Klobuchar, troposfera de Saastamoinen/Niell) + RAIM.

# attr:alt
seg-47ee40d4eb73 = O gráfico que o motor gera para scenarios/gnss-sim-raim.toml, tipo de cenário gnss-sim

# text
seg-eb7e0c2feb2b = RAIM instantâneo / de separação de soluções / ARAIM com HPL/VPL e um diagrama de Stanford.

# attr:alt
seg-ce7f6130ddee = O gráfico que o motor gera para scenarios/integrity-raim.toml, tipo de cenário integrity

# text
seg-b7b67e03f125 = Posicionamento de ponto único com observações reais: resolve a posição de um receptor a partir de um arquivo de observação RINEX { "3" } e de um arquivo de navegação por difusão (pseudodistâncias de código, efemérides de difusão, ionosfera de Klobuchar, troposfera de Saastamoinen/Niell), opcionalmente validado contra uma coordenada levantada.

# attr:alt
seg-d76d59644d84 = O gráfico que o motor escreve para scenarios/pvt-abmf.toml, tipo de cenário pvt

# text
seg-edfcb546d9de = Orçamento de predição de referencial lunar / orientação da Terra em tempo real: Tabela { "1" } do P4 (a verificação de consistência do erro de referencial — pós-processado ~{ "0.27" } m ↔ ~{ "0.010" } ms e tempo real ~{ "15" } m ↔ ~{ "0.5" } ms, cada posição de referencial expressa como o seu erro equivalente de UT1 pelo braço de alavanca L19 Δr = D_EM·ω⊕·ΔUT1) e Tabela { "2" } (erro medido de predição de UT1 contra o horizonte — a curva L18 lida diretamente da série real finals2000A do IERS: o piso final Bulletin A − Bulletin B e o erro do preditor de persistência de vários dias, cada um mapeado para uma posição no referencial lunar por L19), mais o orçamento L21 de erro de referencial em tempo real pela raiz da soma dos quadrados (EOP + efemérides + piso de realização). Forma fechada VALIDATED (o braço de alavanca L19, ω⊕ verificado de forma cruzada contra o ângulo de rotação da Terra CIO) e dados reais VALIDATED (a curva L18 a partir das linhas reais de finals2000A); são MODELLED as magnitudes de covariância de OD do retransmissor lunar e o piso de realização do referencial (alocações representativas) e o preditor de persistência (não o algoritmo operacional do Bulletin A do IERS). Não é um produto certificado de referencial em tempo real.

# attr:alt
seg-2721ed7727bb = O gráfico que o motor escreve para scenarios/realtime-frame-eop.toml, tipo de cenário realtime-frame-eop

# text
seg-5f25c5b71f0c = Modelo de ambiente de clima espacial: índices de atividade solar (F10.7/F10.7a) e geomagnética (Kp, com a tabela definicional Kp↔ap), a temperatura exosférica de Jacchia-1971 que eles governam (validada contra mínimo/média/máximo solares publicados), e a densidade neutra termosférica de Jacchia-1971 na temperatura exosférica média diurna contra o perfil estático sem atividade em um conjunto de altitudes — a dependência da densidade em relação ao ciclo solar que a atmosfera estática omite. MODELLED: a densidade concorda com densidades derivadas de acelerômetro (TOLEOS CHAMP e GRACE) dentro de um fator { "2" } no máximo solar, mas é cerca de 1.7x densa demais no mínimo solar de { "2008" }.

# attr:alt
seg-c1c6f2f73fb5 = O gráfico que o mecanismo gera para scenarios/space-weather.toml, tipo space-weather

# text
seg-4e31c8daf798 = Registro

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/gnss-measurements-positioning-and-integrity.md
seg-c9cf40c5e609 = Fonte: <c1/>

# text
seg-569fac649b5d = Medições de GNSS, posicionamento e integridade (família de tipos de cenário)

# text
seg-63c3a7483268 = { "6" } tipos de cenário do mecanismo v{ $version }. Consultivo: resultado de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do mecanismo ou da matriz de verificação; um tipo é MODELLED a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

# text
# c1: kshana scenarios/integrity-raim.toml
seg-33a602147cc2 = Páginas de tópico: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Execute uma: <c1/>. Todas as famílias: <a5>KINDS.md</a5>.

# attr:alt
seg-9c60c8803b6b = Folha de contatos dos gráficos que o mecanismo gera para os tipos da família Medições de GNSS, posicionamento e integridade

# text
seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

# text
seg-6698e12e148b = Posicionamento de ponto único com observações reais: resolve a posição de um receptor a partir de um arquivo de observação RINEX { "3" } e de um arquivo de navegação por difusão (pseudodistâncias de código, efemérides transmitidas, ionosfera de Klobuchar, Saastamo

# text
seg-da89c260b1a3 = Vetores de referência publicados de certificação do ARAIM: os níveis de proteção horizontal e vertical do ARAIM do mecanismo executados contra os PRÓPRIOS exemplos numéricos resolvidos do Subgrupo Técnico ARAIM do WG-C, na tole

# text
seg-7a750a89c9c4 = Modelo de ambiente de clima espacial: índices de atividade solar (F10.7/F10.7a) e geomagnética (Kp, com a tabela definicional Kp↔ap), a temperatura exosférica de Jacchia-1971 que eles governam (validada contra publish

# text
seg-d79d4d58275b = Orçamento de predição de referencial lunar / orientação da Terra em tempo real: P4 Tabela { "1" } (a verificação de consistência do erro de referencial — pós-processado ~{ "0.27" } m ↔ ~{ "0.010" } ms e em tempo real ~{ "15" } m ↔ ~{ "0.5" } ms, cada posição de referencial expre

# text
# c1: mask_deg
# c2: sigma_uere_m
# c3: p_fa
# c4: p_md
# c5: al_h_m
# c6: al_v_m
# c7: time
# c8: user|user_site
# c9: constellation
# c10: sigma_ura_m
# c11: b_nom_m
# c12: constellations
# c13: seed
# c14: araim_dual
# c15: p_hmi
# c16: skyline
seg-dc783268156c = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Opcionais: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-7b110aacdb27 = <b>Registro:</b> MODELLED { "6" } · VALIDATED { "4" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>integrity</a1>.

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: iono
# c6: tropo
# c7: mask_deg
# c8: noise_sigma_m
# c9: multipath_m
# c10: sat_clock_rms_m
# c11: uere_m
# c12: p_fa
# c13: p_md
# c14: alert_limit_h_m
# c15: alert_limit_v_m
# c16: skyline
seg-d444fb35cae9 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>. Opcionais: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-b651ec58bcba = <b>Registro:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>gnss-sim</a1>.

# text
# c1: obs_rinex
# c2: nav_rinex
# c3: truth_ecef
# c4: apriori_ecef
# c5: mask_deg
# c6: dual_frequency
seg-b9a21187317d = Campos obrigatórios: <c1/>, <c2/>. Opcionais: <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-143dc4fd1d44 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>pvt</a1>.

# text
# c1: vector
seg-9ca1f6783e8e = Campos obrigatórios: nenhum. Opcionais: <c1/>.

# text
seg-415f1fa78518 = <b>Registro:</b> VALIDATED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>araim-reference-check</a1>.

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6c4655b35c65 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-1e5052c0bce7 = <b>Registro:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>space-weather</a1>.

# text
# c1: epoch
# c2: horizons_days
# c3: ephemeris_pos_sigma_m
# c4: ephemeris_vel_sigma_mps
# c5: latency_s
# c6: frame_realization_floor_m
# c7: delta_ut1_ms
# c8: delta_xp_mas
# c9: delta_yp_mas
# c10: eop_finals2000a
# c11: eop_finals2000a_later
# c12: frame_realization_tie_noise_m
# c13: operational_window_days
# c14: operational_min_cycle_fraction
# c15: operational_anchor_residual
seg-64c512530ee6 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-1c244958d3c4 = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "2" }. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>realtime-frame-eop</a1>.

# text
seg-d4adf4283480 = <s1>Anterior</s1>Constelações, cobertura e geometria

# text
seg-2cdfd7f8bfb3 = <s1>Seguinte</s1>PNT alternativo sem GPS
