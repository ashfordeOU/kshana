# docs--kind-realtime-frame-eop: translations (pt-PT)

# text
seg-8e845ce908ee = Tipo de cenário do motor v{ $version }, família <a1>Medições GNSS, posicionamento e integridade</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

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
seg-edfcb546d9de = Orçamento de previsão do referencial lunar / orientação da Terra em tempo real: P4 Tabela { "1" } (a verificação de consistência do erro de referencial — pós-processado ~{ "0.27" } m ↔ ~{ "0.010" } ms e em tempo real ~{ "15" } m ↔ ~{ "0.5" } ms, cada posição de referencial expressa como o erro UT1 equivalente através do braço de alavanca L19 Δr = D_EM·ω⊕·ΔUT1) e Tabela { "2" } (erro de previsão UT1 medido vs horizonte — a curva L18 lida diretamente da série real IERS finals2000A: o patamar final Boletim A − Boletim B e o erro do preditor de persistência a vários dias, cada um projetado numa posição do referencial lunar por L19), mais o orçamento de erro de referencial em tempo real L21 por raiz da soma dos quadrados (EOP + efemérides + patamar de realização). Forma fechada VALIDATED (o braço de alavanca L19, ω⊕ verificada por comparação com o ângulo de rotação da Terra CIO) e dados reais VALIDATED (a curva L18 a partir das linhas reais finals2000A); são MODELLED as magnitudes de covariância OD do relé lunar e o patamar de realização do referencial (atribuições representativas) e o preditor de persistência (não é o algoritmo operacional do Boletim A do IERS). Não é um produto de referencial em tempo real certificado.

# text
# c1: scenarios/realtime-frame-eop.toml
seg-488039e4240f = Uma execução de <c1/> resume-se assim: realtime-frame-eop | Tabela { "1" }: pós-proc. { "0.27" } m ({ "0.0096" } ms UT1) ↔ tempo real { "14.4" } m ({ "0.514" } ms UT1) | Tabela { "2" }: patamar final { "0.0171" } ms → 3 dias { "1.6644" } ms | orçamento total { "20.1" } m ({ "67.0" } ns) | braço de alavanca L19 + dados reais L18 (validados), covariância OD (modelada)

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
seg-c39a26aa1f1e = fixture incluída finals2000A_20260930

# text
seg-9ef8a2b4c144 = Etiqueta de resultado (a do motor): Orçamento de previsão do referencial lunar / orientação da Terra em tempo real. Forma fechada VALIDATED: o braço de alavanca L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ verificada por comparação com o ângulo de rotação da Terra CIO. Dados reais VALIDATED: as curvas de erro de previsão UT1 e de movimento polar L18 lidas diretamente da série real IERS finals200

# attr:alt
seg-2721ed7727bb = O gráfico que o motor escreve para scenarios/realtime-frame-eop.toml, tipo realtime-frame-eop

# text
seg-72a1fc2f5c90 = <b>VALIDATED</b> Uma tabela indica o erro de previsão UT1, o erro do polo de movimento polar e a sua combinação em quadratura na Lua, sobre um conjunto de épocas IDÊNTICO por horizonte, emitindo as épocas em que cada componente foi medido. Ensaios: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

# text
# c1: realtime-frame-eop
seg-b1d90bf98ac3 = <b>VALIDATED</b> A predefinição de execução de <c1/> é a cópia incorporada da própria biblioteca de um extrato textual do IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } linhas diárias consecutivas, MJD 61224-61397, extraídas do finals2000A.all de 2026-09-30) transporta Ensaios: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-0298bd40d72f = <b>MODELLED</b> Um ajuste de mínimos quadrados de enviesamento mais taxa sobre uma janela final mais os principais termos periódicos — anual, semianual e as duas principais marés zonais para UT1; Chandler, anual e semianual para o polo — extrapolado com o último na janela Ensaios: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-12efcd20ca62 = <b>VALIDATED</b> Uma tabela indica o erro de previsão UT1, o erro do polo de movimento polar e a sua combinação em quadratura na Lua, sobre um conjunto de épocas IDÊNTICO por horizonte, em. Referência independente (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) a ler o produto IERS finals2000A com a sua própria regra Boletim-B-senão-A, e pyerfa { "2.0.1.5" } (SOFA) com rotações completas celeste-para-terrestre (c2i06a, sp00, pom00, c2tcio; o ângulo de rotação da Terra segundo IERS { "2010" } eq. { "5.15" } em aritmética exata), executados como programas separados sobre linhas textuais do finals2000A.all congelado de 2026-09-30; pré-registado (455b8fb5) com as emendas A1 e A2 a fixar apenas

# text
# c1: realtime-frame-eop
seg-020e5919c8fd = <b>VALIDATED</b> A predefinição de execução de <c1/> é a cópia incorporada da própria biblioteca de um extrato textual do IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } linhas diárias consecutivas. Referência independente (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), a ler os mesmos bytes com o seu próprio leitor, e a tabela do Boletim A do IERS Vol. XXXIX N.º { "039" }, copiada número a número; pré-registado (6fdae01b) com seis critérios exatos antes de o astropy ser executado. Os seis verificam-se: { "30" } linhas finais, { "54" } rápidas e { "90" } previstas com listas MJD iguais, todas as linhas previstas com o indicador P, o recenseamento da execução predefinida igual, e as previsões iguais às do Bullet

# text
seg-530c87bbff78 = <b>MODELLED</b> Um ajuste de mínimos quadrados de enviesamento mais taxa sobre uma janela final mais os principais termos periódicos — anual, semianual e as duas principais marés zonais para UT1; Cha. Referência independente (ReferenceImpl): três vias independentes, nenhuma delas um valor publicado de exatidão de previsão. ({ "1" }) Um sinal analítico com coeficientes conhecidos — a única forma de exercitar a maquinaria periódica, uma vez que nenhuma série registada é suficientemente longa para admitir um termo anual. ({ "2" }) A solução de mínimos quadrados de forma fechada de manual, com álgebra diferente da resolução matricial em teste, sobre linhas reais. ({ "3" }) As linhas genuínas de previsão arquivadas do Boletim A que o

# text
# c1: label
seg-a233df86be95 = Orçamento de previsão do referencial lunar / orientação da Terra em tempo real. Forma fechada VALIDATED: o braço de alavanca L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ verificada por comparação com o ângulo de rotação da Terra CIO. Dados reais VALIDATED: as curvas de erro de previsão UT1 e de movimento polar L18 lidas diretamente da série real IERS finals2000A (Boletim A rápido vs Boletim B final, e persistência a vários dias sobre as linhas diárias reais). DERIVED: o referencial (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-60e7ee7e6e3e = Forma fechada VALIDATED (o braço de alavanca L19, ω⊕ verificada por comparação com o ângulo de rotação da Terra CIO) e dados reais VALIDATED (a curva L18 a partir das linhas reais finals2000A); são MODELLED as magnitudes de covariância OD do relé lunar e o patamar de realização do referencial (atribuições representativas) e o preditor de persistência (não é o algoritmo operacional do Boletim A do IERS). (catálogo de tipos (<c1/>))

# text
seg-ddf4702f78e5 = Honestidade: forma fechada VALIDATED (o braço de alavanca L19, omega_earth verificada por comparação com o ângulo de rotação da Terra CIO) e dados reais VALIDATED (as curvas L18 de UT1 e de movimento polar a partir das linhas reais finals2000A). Patamar de realização do referencial DERIVED (o resíduo pós-ajuste de Helmert). São MODELLED as magnitudes de covariância OD do relé lunar ({ "0.27" } m pós-processado, ~{ "14.4" } m em tempo real com uma hora de latência — um valor redondo, não resolvido por retrocálculo, tod (comentário do ficheiro de cenário, linhas { "27" } a { "32" })

# text
seg-bc51b666d070 = O erro de previsão da orientação da Terra em estilo operacional, medido entre previsto e final, é MODELLED, não validado: verificado face a uma implementação separada nesta mesma base de código — independente da unidade em ensaio, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-653fad5e0afe = <s1>Anterior</s1>quantum-trade

# text
seg-5abe534d4ef1 = <s1>Seguinte</s1>reentry
