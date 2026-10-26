# docs--integrity: translations (pt-PT)

# text
# c1: docs/INTEGRITY.md
seg-668241606715 = Fonte: <c1/>

# text
seg-9a8c218ce054 = Integridade e segurança: o que o Kshana modela e o que não modela

# text
seg-52038c93765d = O Kshana comunica duas figuras de mérito (FoM) — <b>Integridade</b> e <b>Segurança</b> — que são fáceis de confundir com as grandezas de nível aeronáutico com o mesmo nome. Esta página expõe com clareza o que são hoje, o que <em>não</em> são e o que o roteiro acrescenta. Se está a avaliar o Kshana para um contexto de segurança de vidas ou de certificação, leia isto primeiro.

# text
seg-fb6e93a107e7 = Hoje ({ "v0.37.0" })

# text
seg-ecd20ae1a05d = FoM de integridade — autoconsistência do filtro

# text
seg-153391e55508 = A FoM de integridade é a fração das amostras de falha de sinal cujo erro de temporização verdadeiro permanece dentro do limite de proteção k-sigma do próprio filtro de Kalman:

# text
seg-ac2413a97a7b = Mede se a incerteza <em>autodeclarada</em> do filtro é honesta quanto ao seu <em>próprio</em> erro durante uma falha de GNSS (global navigation satellite system). É uma verificação de consistência interna útil.

# text
seg-c9f80760ea53 = <b>Não</b> é:

# text
seg-8899525ad177 = um <b>nível de proteção horizontal/vertical (HPL/VPL)</b> — não existe sequer um nível de proteção no domínio da posição (os pacotes de relógio são do domínio da temporização);

# text
seg-dd9a3e58e10b = um <b>risco de integridade / probabilidade de informação perigosamente enganadora (P_HMI)</b>;

# text
seg-31fa92b3271d = uma comparação com um <b>limite de alerta</b>;

# text
seg-ee998b974e6f = aderente à norma <b>RTCA DO-229E / DO-316</b> ou <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: European Organisation for Civil Aviation Equipment) nem a qualquer outra norma de certificação.

# text
seg-f84a56b6fe10 = FoM de segurança — limite analítico de deteção de spoofing

# text
seg-e532288ed262 = A FoM de segurança é um <b>limite de deteção de spoofing baseado na estabilidade do relógio</b>: dado o ruído de um relógio (PSD (densidades espectrais de potência) de frequência branca e de passeio aleatório) e uma janela de monitorização, é a margem de deteção analítica de um monitor de consistência de relógio único face a um spoofing de falso tempo de rampa lenta. Um relógio mais silencioso (por exemplo, um relógio ótico) deteta um spoofing menor e mais lento do que um mais ruidoso (por exemplo, um CSAC (relógio atómico à escala de chip)) — esse contraste é o objetivo do demonstrador.

# text
# c1: spoof
seg-fc718a805b28 = <b>Não</b> é um detetor RAIM (receiver autonomous integrity monitoring) com vários satélites. Não há resíduos de pseudodistância entre satélites, nem nível de proteção, nem P_HMI. O teste de inovação face a sigma tem a mesma forma matemática da deteção de falhas RAIM clássica (Brown), mas o número é um limite analítico para um dado relógio, não uma implementação de RAIM, e só tem significado no contexto de um cenário de spoofing configurado (ver o tipo de cenário <c1/>, que injeta um ataque de rampa real).

# text
# c1: clock
# c2: orbit
# c3: hybrid
# c4: fusion
# c5: security n/a (no attack)
# c6: fom.security
# c7: applicable: false
# c8: figure_tiers
seg-ae770e25031e = A saída di-lo. Os tipos <c1/>, <c2/>, <c3/> e <c4/> não configuram nenhum ataque, pelo que o seu resumo de uma linha apresenta <c5/> em vez de um número, e o seu documento de resultados marca <c6/> como <c7/>, com o motivo, no bloco <c8/>. O valor em si permanece no documento para quem queira o limite.

# text
# c1: src/raim.rs
seg-960bd91a2b3a = RAIM real de instantâneo, de separação de soluções e ARAIM (<c1/>)

# text
# c1: src/raim.rs
seg-3d31ec251ac0 = Um RAIM genuíno, no domínio da posição, está implementado em <c1/>, separado da FoM de autoconsistência acima:

# text
seg-0e8240812c16 = <b>Monitorização de resíduos com vários satélites</b> — constrói a matriz de geometria da linha de vista para os satélites visíveis, forma a solução de posição/relógio por mínimos quadrados e testa a soma dos quadrados dos resíduos.

# text
# c1: SSE/σ²
# c2: chi2_{1-P_fa}(n-4)
seg-69f1535596e0 = <b>Deteção de falhas por χ²</b> — <c1/> (SSE: soma dos quadrados dos resíduos) é χ²(n−{ "4" }) sob a hipótese de ausência de falha; é declarada uma falha acima de <c2/>. Os limiares de χ² provêm de uma avaliação da função gama incompleta regularizada sem dependências (exata, sem tabelas).

# text
# c1: max_i(slope_i)·pbias·σ
# c2: slope_i
# c3: pbias
# c4: P_md
seg-6721779048f5 = <b>HPL / VPL baseados em declive</b> — <c1/>, em que <c2/> é a sensibilidade do erro de posição por satélite obtida a partir da matriz de projeção e <c3/> é o viés de χ² não central que satisfaz a probabilidade de falha de deteção configurada <c4/>.

# text
# c1: Δ_k = x_k − x₀
seg-8dd60e98088d = <b>RAIM de separação de soluções (MHSS: multiple-hypothesis solution separation)</b> — para a solução com todos os satélites em vista e para cada subsolução com exclusão de um único satélite, a separação do estimador aninhado <c1/> <b>deteta e identifica</b> o satélite com falha e alimenta o limite do nível de proteção.

# text
# c1: araim_raim
# c2: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c3: K_md
seg-719e27fdd2c1 = <b>Orçamento de risco de integridade (P_HMI) do ARAIM (advanced receiver autonomous integrity monitoring)</b> — <c1/> resolve o menor HPL/VPL cuja probabilidade somada de informação perigosamente enganadora <c2/> (Blanch et al., <em>Baseline ARAIM</em>) satisfaz uma atribuição explícita de risco de integridade, e comunica o risco que os níveis alcançam — de modo que a integridade possa ser trocada diretamente pelo limite de alerta, em vez de ficar implícita num multiplicador fixo <c3/>.

# text
# c1: (error, PL)
seg-2f99acf45203 = <b>Diagrama de integridade Stanford–ESA</b> (ESA: European Space Agency) — um acumulador por época classifica <c1/> em regiões Disponível / Indisponível do sistema / Enganador / Perigosamente enganador para um resumo de disponibilidade.

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: scenarios/integrity-raim.toml
seg-33d01969fb0f = <b>Acessível de ponta a ponta</b> — o tipo de cenário <c1/> executa o que precede sobre uma constelação SGP4 (Simplified General Perturbations { "4" }) ou kepleriana, ou lida a partir de TLE reais (conjuntos de elementos de duas linhas) ou de um ficheiro de navegação RINEX (Receiver Independent Exchange Format), e emite um mapa de disponibilidade de HPL/VPL por época face aos limites de alerta configurados (<c2/>). A mesma execução <b>exporta um diagrama de Stanford vertical</b>: em cada época protegida, um sorteio reprodutível, com semente, de erro de distância sem falha é mapeado através da geometria para um erro vertical efetivo e classificado face ao VPL e ao limite de alerta vertical, de modo que o resultado JSON (JavaScript Object Notation) e o resumo da CLI (command-line interface) incluam as contagens por região (eventos de integridade e HMI: hazardously misleading information, informação perigosamente enganadora) — e não apenas uma fração de disponibilidade. No <c3/> incluído, a execução comunica { "344" } de { "361" } épocas disponíveis ({ "95.3" } %) com um limite de alerta de { "40" } m na horizontal e { "50" } m na vertical, com { "0" } eventos de integridade e { "0" } HMI.

# text
# c1: araim_dual_raim
# c2: P_const
# c3: IntegritySupportMessage
# c4: σ_URA
# c5: σ_URE
# c6: b_nom
# c7: P_sat
# c8: P_const
# c9: P_const = 0
# c10: araim_raim
# c11: integrity
# c12: araim_dual = true
# c13: scenarios/araim-gps-galileo.toml
seg-54e778eceef4 = <b>ARAIM com duas constelações e uma mensagem de apoio à integridade</b> — <c1/> acrescenta o <b>modo de falha de toda a constelação</b>: além das hipóteses sem falha e de um único satélite, cada constelação contribui com uma hipótese que remove todos os seus satélites, com a probabilidade a priori <c2/>, para a mesma soma de risco de integridade MHSS. A <c3/> (ISM) transporta a precisão de distância do utilizador para a integridade (<c4/>), a raiz do valor quadrático médio da precisão (<c5/>), o viés nominal máximo <c6/> incorporado de forma unilateral em cada modo, e as probabilidades a priori <c7/> e <c8/>; o seu conjunto de referência do WG-C (Working Group C da cooperação União Europeia–Estados Unidos em navegação por satélite, cujo subgrupo técnico de ARAIM publica a referência) é σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } e P_const = { "1e-4" }. <c9/> reproduz bit a bit o resultado de falha única de <c10/>. O tipo <c11/> segue este caminho com <c12/> (<c13/>: GPS + Galileo, { "48" } satélites, { "145" } de { "145" } épocas disponíveis com os mesmos limites de alerta).

# text
# c1: araim-reference-check
# c2: araim_protection_level
# c3: araim_integrity_risk
# c4: VERIFICATION-MATRIX.md
seg-1f06bc1976bd = <b>Níveis de proteção face a vetores de referência publicados</b> — o tipo <c1/> executa <c2/> e <c3/> do motor sobre os exemplos resolvidos do próprio subgrupo ARAIM do WG-C (o Reference Airborne Algorithm Description Document v3.1, { "2019" }, Apêndice D, e o Milestone { "3" } Report, { "2016" }, Anexo A). A maior diferença de nível de proteção vertical/horizontal no vetor de aceitação é de { "0.0437" } m face à tolerância dos próprios documentos de { "0.05" } m. Esta linha é VALIDATED em <a1><c4/></a1>: verifica a equação do nível de proteção, não uma ISM operacional nem um recetor.

# text
seg-1dda7b318c5f = A lacuna restante (roteiro)

# text
# c1: raim.rs
seg-e27215296e1a = O que <c1/> <b>ainda não</b> faz:

# text
seg-964c0634eae0 = <b>não está integrado na FoM dos cenários de relógio/holdover</b> — esses pacotes continuam a comunicar a figura de integridade de autoconsistência do filtro acima, não um HPL/VPL;

# text
seg-eecf2f9f181e = as hipóteses de falha são o caso sem falha, os <b>satélites individuais</b> e as <b>constelações inteiras</b> — as falhas simultâneas em <b>subconjuntos de dois ou mais satélites (SV: space vehicle, isto é, um satélite)</b> não estão modeladas;

# text
seg-fd0f9fb2de83 = a ISM é um conjunto de parâmetros configurável (com os valores de referência do WG-C), não uma mensagem operacional difundida nem um modelo de ameaças validado;

# text
# c1: snapshot_raim_fde
# c2: integrity
seg-88f5242b0809 = a <b>deteção e exclusão de falhas (FDE)</b> é só de um único satélite e de instantâneo: a separação de soluções identifica o satélite com falha, e <c1/> volta a resolver cada exclusão de um único satélite e devolve o satélite excluído com o teste do qui-quadrado e os níveis de proteção do subconjunto restante, mas não é comunicada nenhuma posição protegida por exclusão, e o tipo de cenário <c2/> não executa o passo de exclusão.

# text
# c1: tests/igs_real_data.rs
# c2: P_HMI
# c3: tests/araim_dual_real_data.rs
# c4: REAL_TLE_GUIDE.md
# c5: pvt
seg-c85aa5dedc86 = Os núcleos de instantâneo, de separação de soluções e de ARAIM são exercitados com <b>geometria real de órbitas precisas do IGS (International GNSS Service) (SP3: Standard Product { "3" })</b>, e não apenas com constelações sintéticas: <c1/> forma a geometria da linha de vista a partir da primeira época de um produto SP3 genuíno do IGS numa estação terrestre real, e verifica que os níveis de proteção são finitos e se encontram dentro dos limites de alerta APV-I (approach with vertical guidance) de { "40" } m na horizontal e { "50" } m na vertical, que um viés de pseudodistância de { "60" } m dispara o monitor de χ², que a separação de soluções <b>identifica</b> o satélite com falha, e que os níveis do ARAIM satisfazem o <c2/> atribuído. <c3/> executa o caminho de duas constelações nos catálogos reais Celestrak de GPS e Galileo de 2026-06-07, propagados para uma época comum (ver <a1><c4/></a1> §{ "3" }). Uma verificação cruzada mais profunda — comparar os níveis de proteção época a época com o gLAB (a GNSS-Lab Tool, um conjunto de processamento de dados GNSS distribuído pela ESA) ao longo de um arco completo de observações RINEX — acrescentaria paridade no domínio do recetor. Não está feita: o tipo <c5/> calcula uma posição de ponto único por código a partir de observações RINEX reais, mas nenhum nível de proteção dessa solução foi comparado com o do gLAB.

# text
# c1: raim.rs
# c2: integrity
# c3: araim-reference-check
seg-f5fac2e836a6 = Assim, <c1/> é um núcleo real de nível de proteção e de risco de integridade, acessível a partir dos tipos de cenário <c2/> e <c3/>, exercitado com geometria real de órbitas de referência e verificado face aos vetores de referência do WG-C. As falhas em subconjuntos de vários satélites, a paridade com o gLAB no domínio do recetor e a integração na FoM do relógio continuam a ser itens do roteiro, e nada disto é evidência de certificação.

# text
# c1: GLOSSARY.md
seg-487f24ed92d8 = <a1><c1/></a1> — definições de uma linha de cada FoM e abreviatura.

# text
# c1: ARAIM_REFERENCE.md
seg-7d3c12cf802e = <a1><c1/></a1> — os parâmetros da ISM e os vetores de referência do WG-C.

# text
# c1: SLOT-TIMING.md
seg-04532ba5288f = <a1><c1/></a1> — o nível de proteção de temporização (TPL) de um relógio em deriva livre, que está condicionado à deteção.

# text
# c1: VALIDATION.md
seg-43cea496da93 = <a1><c1/></a1> — que grandezas são validadas face a referências e quais são verificações de autoconsistência.

# text
# c1: src/security.rs
seg-3037dde8135f = <c1/> — a derivação do limite de deteção de spoofing.

# text
seg-04d63778ca7f = RAIM ao lado das figuras de mérito de holdover do relógio ({ "0.36" }, opcional)

# text
# c1: [integrity]
# c2: src/clock_integrity.rs
# c3: lat_deg
# c4: lon_deg
# c5: height_m
# c6: systems
# c7: gps-baseline
# c8: integrity_fom
# c9: available
# c10: alarm
# c11: unavailable-pl-above-al
# c12: unavailable-too-few-satellites
# c13: unavailable-gnss-denied
# c14: runs = 1
seg-744e95749978 = Um cenário de relógio pode incluir uma secção <c1/> (<c2/>): um local (<c3/>, <c4/>, <c5/>), predefinições de constelação (<c6/>, por predefinição <c7/>), uma máscara, um sigma do resíduo de distância, as probabilidades de falso alarme e de falha de deteção, os limites de alerta horizontal e vertical, um espaçamento de épocas e um viés indicado opcional num satélite. A execução comunica então um bloco <c8/> separado: por época, os satélites em vista, os níveis de proteção RAIM de instantâneo e um veredicto (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>), e as contagens e a disponibilidade ao longo da execução. Enquanto a cronologia indicar que o GNSS está negado, o RAIM está indisponível e nada é extrapolado; uma janela degradada é avaliada como nominal. As figuras de mérito de holdover não se alteram, e sem a secção a saída é idêntica byte a byte. MODELLED: um céu predefinido representativo, resíduos sintéticos e limites indicados. Requer <c14/>.

# text
seg-139639263c90 = A reprodução do URA máximo do Milestone { "3" } do ARAIM do WG-C UE-EUA (CAP-05c)

# text
seg-97906754d4c8 = Um plano anterior prometia uma comparação com a "Table A-3" de uma nota técnica do EU-ARAIM. Não foi possível encontrar nenhuma fonte pública dessa tabela (os relatórios públicos Milestone { "1" } a { "3" } do ARAIM Technical Subgroup do Working Group C UE-EUA não têm Table A-3), pelo que essa comparação está <b>retirada</b> e nada é prometido com esse nome.

# text
# c1: 156147e1...13d8
# c2: sigma_URA
# c3: xval/araim-m3/PREREGISTRATION.md
# c4: src/bin/gen_araim_m3_study.rs
# c5: xval/araim-m3/results.json
# c6: tests/araim_m3_reproduction.rs
seg-b61607c477f2 = O que se tenta em alternativa é o relatório que é público: o <b>Milestone { "3" } Report</b> ({ "25" } de fevereiro de { "2016" }, cópia do GPS.gov, SHA-256 <c1/>), Tabelas { "5" }, { "6" } e { "7" }, que apresentam, para cada configuração de constelação e para cada um de RNP { "0.1" } e RNP { "0.3" }, o maior <c2/> para o qual { "90" } % dos utilizadores têm { "99.5" } % de disponibilidade. Doze entradas apresentadas (as linhas Depleted e Baseline das tabelas de dupla frequência) são verificadas, segundo limiares fixados antecipadamente em <a1><c3/></a1> antes de qualquer execução pontuada, com os desvios que não podem ser removidos indicados aí: sem ficheiros de almanaque, camadas Walker em vez dos slots reais, uma grelha e um passo mais grosseiros, e o caminho horizontal ADD v4.2 do motor em vez do texto do próprio relatório. As Tabelas { "8" } a { "13" } (frequência única) e as linhas Optimistic não são tentadas, com os motivos indicados aí. <b>Resultado: { "8" } de { "12" } entradas reproduzidas, { "4" } NOT MET (fixadas):</b> as entradas de duas constelações e todas as entradas só de Galileo coincidem (incluindo as linhas N/A), a entrada dupla Depleted RNP { "0.1" } atinge uma cobertura de { "0.847" } a { "9" } m face aos { "9" } m apresentados (exige { "0.90" }), e três entradas só de GPS falham por larga margem (cobertura de { "0.70" } a { "4" } m, { "0.58" } a { "6" } m, { "0.65" } a { "10" } m face aos { "4" } m, { "6" } m e ">{ "10" } m" apresentados). As falhas só de GPS podem dever-se à camada Walker uniforme que substitui os slots reais do GPS (D1); isso é uma hipótese, não uma constatação. O resultado permanece MODELLED seja qual for. O estudo é <c4/>; as suas coberturas medidas estão em <c5/> e são pontuadas por <c6/>. O próprio relatório é citado, não incluído.

# text
seg-0e98826cedcc = <s1>Anterior</s1>Segurança do hardware

# text
seg-e6f1e38977b7 = <s1>Seguinte</s1>Espectro e cascata

# text
seg-38ab3bb65327 = RAIM real de instantâneo, de separação de soluções e ARAIM (src/raim.rs)
