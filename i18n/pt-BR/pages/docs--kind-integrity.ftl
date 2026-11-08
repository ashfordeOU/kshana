# docs--kind-integrity: translations (pt-BR)

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Tipo de cenário do motor v{ $version }, família <a1>Medições GNSS, posicionamento e integridade</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-f6b7ca020692 = Página da família: <a1>Medições GNSS, posicionamento e integridade</a1>

# text
seg-f4cf8b629797 = Página do tópico: <a1>INTEGRITY.md</a1>

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> A seção opcional [integrity] do tipo de cenário clock (clock_integrity::run): a partir de um local e de predefinições de constelação declarados (geometry::sky_geometry), em cada época de integridade enquanto a linha do tempo do GNSS não está negada, RAIM instantâneo (raim::snapshot_ Testes: <a1>clock_integrity.rs</a1>.

# text
seg-ee7dd15019d0 = Página do tópico: <a1>CAMPAIGNS.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> Solução de separação de múltiplas hipóteses do ARAIM segundo o ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels e add_v42_protecti. Referência independente (ExternalDataset): Três ferramentas independentes, fixadas antecipadamente (0123cee1) antes de existir qualquer fixture ou saída de referência independente, com tolerâncias fixadas então. ({ "1" }) ARAIM: Stanford MAAST para ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, executado como programa separado no GNU Octave { "8.4" } com um shim de compatibilidade unique() do lado do driver (divulgado, sem alteração de algoritmo), no TOL_PL do ADD de { "0.05" } m: o Rust reproduz a implementação de referência do ADD em

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP a partir da geometria de linha de visada via Q=(HᵀH)⁻¹ com divisão ENU local. Referência independente (ExternalDataset): DOP do gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — biblioteca independente, coincidente a { "1e-6" } relativo

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> O núcleo distribucional em que todo nível de proteção se apoia: o limiar de detecção de falha instantâneo χ²₁₋ₚfₐ(dof), a não centralidade de detecção perdida pbias=√λ, e . Referência independente (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — biblioteca independente (Cephes/Boost), um algoritmo diferente da série de gama incompleta do Kshana; coincidente a ≤{ "1e-6" } rel. Apenas o núcleo. A <em>alocação</em> do orçamento de P_HMI do MHSS do ARAIM deixou de ficar sem uma referência independente numérica publicada — o próprio exemplo trabalhado do Subgrupo Técnico ARAIM do WG-C agora sustenta a linha separada 'ARAIM MHSS protection levels against published referen

# text
# c1: docs/kinds/by-kind/integrity.md
seg-4bec24cd43f6 = Fonte: <c1/>

# text
# c1: integrity
seg-dd304550e695 = <c1/> (tipo de cenário)

# text
seg-eb7e0c2feb2b = RAIM instantâneo / de separação de soluções / ARAIM com HPL/VPL e um diagrama de Stanford.

# text
# c1: scenarios/integrity-raim.toml
seg-706887c285d8 = Uma execução de <c1/> resume-se assim: integrity | { "24" } satélites | 344/361 épocas disponíveis ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } eventos de integridade, { "0" } HMI

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
seg-c3f7debf260a = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: sigma_ura_m
# c2: b_nom_m
# c3: constellations
# c4: seed
# c5: araim_dual
# c6: p_hmi
# c7: skyline
seg-7b28ab6567df = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/integrity-raim.toml
seg-581a5231b230 = O exemplo <c1/> define, entre outros:

# attr:alt
seg-ce7f6130ddee = O gráfico que o motor gera para scenarios/integrity-raim.toml, tipo de cenário integrity

# text
seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-dff469738ec3 = <b>VALIDATED</b> TPL de separação de soluções em tempo escalar sobre fontes heterogêneas; PL determinado pelo ruído do subconjunto de pior exclusão + viés de UTC(k)

# text
seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); PL semicontínuo inferiormente PL({ "0" }+)≥PL({ "0" }−); máximo corrente K(IR/2); expoentes de fase τ/τ³/τ⁵

# text
seg-4787b0b565df = <b>VALIDATED</b> O envelope de máximo corrente superlimita (sem perfuração do zero) uma série metrológica real em cada defasagem testada tau>=90d em um segmento disjunto; tau curto (<=30d) é uma fronteira modelada declarada Testes: <a1>cti_holdover_coverage_reference.rs</a1>.

# text
seg-090415eca3b7 = e mais { "6" } na matriz.

# text
seg-b4bc9ccbcee2 = <s1>Anterior</s1>ins-trn-coast

# text
seg-f1ba804baade = <s1>Próximo</s1>jamming
