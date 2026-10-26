# docs--kind-realtime-frame-eop: translations (pt-BR)

# text
seg-8e845ce908ee = Tipo de cenário do motor v{ $version }, família <a1>Medições GNSS, posicionamento e integridade</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-f6b7ca020692 = Página da família: <a1>Medições GNSS, posicionamento e integridade</a1>

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-a2889fb2b42a = Página do tema: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/realtime-frame-eop.md
seg-1ad013ffb9d1 = Fonte: <c1/>

# text
# c1: realtime-frame-eop
seg-54620502f0dd = <c1/> (tipo de cenário)

# text
seg-edfcb546d9de = Orçamento de predição de referencial lunar / orientação da Terra em tempo real: Tabela { "1" } do P4 (a verificação de consistência do erro de referencial — pós-processado ~{ "0.27" } m ↔ ~{ "0.010" } ms e tempo real ~{ "15" } m ↔ ~{ "0.5" } ms, cada posição de referencial expressa como o seu erro equivalente de UT1 pelo braço de alavanca L19 Δr = D_EM·ω⊕·ΔUT1) e Tabela { "2" } (erro medido de predição de UT1 contra o horizonte — a curva L18 lida diretamente da série real finals2000A do IERS: o piso final Bulletin A − Bulletin B e o erro do preditor de persistência de vários dias, cada um mapeado para uma posição no referencial lunar por L19), mais o orçamento L21 de erro de referencial em tempo real pela raiz da soma dos quadrados (EOP + efemérides + piso de realização). Forma fechada VALIDATED (o braço de alavanca L19, ω⊕ verificado de forma cruzada contra o ângulo de rotação da Terra CIO) e dados reais VALIDATED (a curva L18 a partir das linhas reais de finals2000A); são MODELLED as magnitudes de covariância de OD do retransmissor lunar e o piso de realização do referencial (alocações representativas) e o preditor de persistência (não o algoritmo operacional do Bulletin A do IERS). Não é um produto certificado de referencial em tempo real.

# text
# c1: scenarios/realtime-frame-eop.toml
seg-488039e4240f = Uma execução de <c1/> resume-se assim: realtime-frame-eop | Table { "1" }: post-proc { "0.27" } m ({ "0.0096" } ms UT1) ↔ real-time { "14.4" } m ({ "0.514" } ms UT1) | Table { "2" }: final floor { "0.0171" } ms → 3-day { "1.6644" } ms | budget total { "20.1" } m ({ "67.0" } ns) | L19 lever arm + L18 real-data (Validated), OD cov (Modelled)

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
seg-66264ec78a4c = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/realtime-frame-eop.toml
seg-45a4ed476311 = O exemplo <c1/> define, entre outros:

# text
seg-c39a26aa1f1e = fixture incluído finals2000A_20260930

# text
seg-9ef8a2b4c144 = Rótulo do resultado (o do motor): orçamento de predição de referencial lunar / orientação da Terra em tempo real. Forma fechada VALIDATED: o braço de alavanca L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ verificado de forma cruzada contra o ângulo de rotação da Terra CIO. Dados reais VALIDATED: as curvas de erro de predição de UT1 e de movimento polar L18 lidas diretamente da série real finals200

# attr:alt
seg-2721ed7727bb = O gráfico que o motor escreve para scenarios/realtime-frame-eop.toml, tipo de cenário realtime-frame-eop

# text
seg-72a1fc2f5c90 = <b>VALIDATED</b> Uma tabela informa o erro de predição de UT1, o erro de polo do movimento polar e a sua combinação em quadratura na Lua sobre um conjunto de épocas IDÊNTICO por horizonte, emitindo as épocas em que cada componente foi medido. Testes: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

# text
# c1: realtime-frame-eop
seg-b1d90bf98ac3 = <b>VALIDATED</b> O padrão em tempo de execução de <c1/> é a cópia incorporada da própria biblioteca de um extrato literal do IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } linhas diárias consecutivas, MJD 61224-61397, extraídas do finals2000A.all de 2026-09-30) carrega Testes: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-0298bd40d72f = <b>MODELLED</b> Um ajuste de mínimos quadrados de viés mais taxa sobre uma janela final mais os principais termos periódicos — anual, semianual e as duas principais marés zonais para UT1; Chandler, anual e semianual para o polo — extrapolado com o último na janela Testes: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-12efcd20ca62 = <b>VALIDATED</b> Uma tabela informa o erro de predição de UT1, o erro de polo do movimento polar e a sua combinação em quadratura na Lua sobre um conjunto de épocas IDÊNTICO por horizonte, em. Referência independente (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) lendo o produto finals2000A do IERS com a sua própria regra Bulletin-B-senão-A, e rotações completas celeste-terrestre do pyerfa { "2.0.1.5" } (SOFA) (c2i06a, sp00, pom00, c2tcio; o ângulo de rotação da Terra segundo a eq. { "5.15" } do IERS { "2010" } em aritmética exata), executados como programas separados sobre linhas literais do finals2000A.all congelado de 2026-09-30; com pré-registro (455b8fb5) com as emendas A1 e A2 fixando apenas

# text
# c1: realtime-frame-eop
seg-020e5919c8fd = <b>VALIDATED</b> O padrão em tempo de execução de <c1/> é a cópia incorporada da própria biblioteca de um extrato literal do IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } consecutiv. Referência independente (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), lendo os mesmos bytes com o seu próprio leitor, e a tabela do IERS Bulletin A Vol. XXXIX No. { "039" }, copiada número por número; com pré-registro (6fdae01b) com seis critérios exatos antes de o astropy ser executado. Os seis se verificam: { "30" } linhas finais, { "54" } rápidas e { "90" } preditas com listas de MJD iguais, toda linha predita com o sinalizador P, o censo da execução padrão igual, e as predições iguais ao Bullet

# text
seg-530c87bbff78 = <b>MODELLED</b> Um ajuste de mínimos quadrados de viés mais taxa sobre uma janela final mais os principais termos periódicos — anual, semianual e as duas principais marés zonais para UT1; Cha. Referência independente (ReferenceImpl): três rotas independentes, nenhuma delas um valor publicado de exatidão de predição. ({ "1" }) Um sinal analítico com coeficientes conhecidos — a única forma de exercitar o mecanismo periódico, já que nenhuma série registrada é longa o bastante para admitir um termo anual. ({ "2" }) A solução de mínimos quadrados em forma fechada de manual, com álgebra diferente da resolução matricial sob teste, sobre linhas reais. ({ "3" }) As linhas genuínas arquivadas de predição do Bulletin A que o

# text
# c1: label
seg-a233df86be95 = Orçamento de predição de referencial lunar / orientação da Terra em tempo real. Forma fechada VALIDATED: o braço de alavanca L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ verificado de forma cruzada contra o ângulo de rotação da Terra CIO. Dados reais VALIDATED: as curvas de erro de predição de UT1 e de movimento polar L18 lidas diretamente da série real finals2000A do IERS (Bulletin A rápido contra Bulletin B final, e persistência de vários dias sobre as linhas diárias reais). DERIVED: o referencial (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-60e7ee7e6e3e = Forma fechada VALIDATED (o braço de alavanca L19, ω⊕ verificado de forma cruzada contra o ângulo de rotação da Terra CIO) e dados reais VALIDATED (a curva L18 a partir das linhas reais de finals2000A); são MODELLED as magnitudes de covariância de OD do retransmissor lunar e o piso de realização do referencial (alocações representativas) e o preditor de persistência (não o algoritmo operacional do Bulletin A do IERS). (catálogo de tipos de cenário (<c1/>))

# text
seg-ddf4702f78e5 = Honestidade: VALIDATED na forma fechada (o braço de alavanca L19, omega_earth conferido com o ângulo de rotação da Terra do CIO) e VALIDATED em dados reais (as curvas de UT1 e de movimento polar L18 a partir das linhas reais de finals2000A). Piso de realização do referencial DERIVED (o resíduo pós-ajuste de Helmert). MODELLED são as magnitudes de covariância da OD do relé lunar ({ "0.27" } m pós-processado, ~{ "14.4" } m em tempo real com latência de uma hora — um valor arredondado, não obtido por retrocálculo, all (comentário do arquivo de cenário, linhas { "27" } a { "32" })

# text
seg-bc51b666d070 = O erro de predição da orientação da Terra em estilo operacional, medido entre o predito e o final, é MODELLED, não validado: conferido com outra implementação na mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-653fad5e0afe = <s1>Anterior</s1>quantum-trade

# text
seg-5abe534d4ef1 = <s1>Seguinte</s1>reentry
