# docs--kind-gnss-sim: translations (pt-PT)

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os restantes estão em <a1><c1/></a1>.

# text
seg-8e845ce908ee = Tipo de cenário do motor v{ $version }, família <a1>Medições GNSS, posicionamento e integridade</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
seg-f6b7ca020692 = Página da família: <a1>Medições GNSS, posicionamento e integridade</a1>

# text
# c1: docs/kinds/by-kind/gnss-sim.md
seg-d5f4762f8455 = Fonte: <c1/>

# text
# c1: gnss-sim
seg-b634bbba2197 = <c1/> (tipo de cenário)

# text
seg-2ffccc9c1eff = Simulação de pseudodistância no domínio da medição (ionosfera de Klobuchar, troposfera de Saastamoinen/Niell) + RAIM.

# text
# c1: scenarios/gnss-sim-raim.toml
seg-db93cbad6c6d = Uma execução de <c1/> resume-se assim: cenário ab854d9d7886 | gnss-sim | iono média 19.9m tropo 6.8m | RAIM disp { "0.82" } HPL médio 22.2m VPL 39.9m taxa de falhas { "0.000" }

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
seg-55ee4fdf9240 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: iono
# c2: tropo
# c3: mask_deg
# c4: noise_sigma_m
# c5: multipath_m
# c6: sat_clock_rms_m
# c7: uere_m
# c8: p_fa
# c9: p_md
# c10: alert_limit_h_m
# c11: alert_limit_v_m
# c12: skyline
seg-ee0d38971d08 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/gnss-sim-raim.toml
seg-c7b57e696bc3 = O exemplo <c1/> define, entre outros:

# text
seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

# attr:alt
seg-47ee40d4eb73 = O gráfico que o motor gera para scenarios/gnss-sim-raim.toml, tipo de cenário gnss-sim

# text
seg-ccc44a4ac68e = <b>VALIDATED</b> Atraso de grupo ionosférico oblíquo em L1 monofrequência de Klobuchar a partir dos oito coeficientes α/β transmitidos Testes: <a1>klobuchar_reference.rs</a1>.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> Solução de separação de múltiplas hipóteses do ARAIM segundo o ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels e add_v42_protecti. Referência independente (ExternalDataset): Três ferramentas independentes, fixadas antecipadamente (0123cee1) antes de existir qualquer fixture ou saída de referência independente, com tolerâncias fixadas então. ({ "1" }) ARAIM: Stanford MAAST para ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, executado como programa separado no GNU Octave { "8.4" } com um shim de compatibilidade unique() do lado do driver (divulgado, sem alteração de algoritmo), no TOL_PL do ADD de { "0.05" } m: o Rust reproduz a implementação de referência do ADD em

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP a partir da geometria de linha de visada via Q=(HᵀH)⁻¹ com divisão ENU local. Referência independente (ExternalDataset): DOP do gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — biblioteca independente, coincidente a { "1e-6" } relativo

# text
seg-752829346523 = <b>VALIDATED</b> Atraso de grupo ionosférico oblíquo em L1 monofrequência de Klobuchar a partir dos oito coeficientes α/β transmitidos. Referência independente (ExternalDataset): ionmodel do RTKLIB (tomojitakasu/RTKLIB, src/rtkcmn.c) — implementação de referência independente compilada a partir do código-fonte; coincidente a < { "1e-4" } m

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> O núcleo distribucional em que todo nível de proteção se apoia: o limiar de deteção de falha instantâneo χ²₁₋ₚfₐ(dof), a não centralidade de deteção perdida pbias=√λ, e . Referência independente (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — biblioteca independente (Cephes/Boost), um algoritmo diferente da série de gama incompleta do Kshana; coincidente a ≤{ "1e-6" } rel. Apenas o núcleo. A <em>alocação</em> do orçamento de P_HMI do MHSS do ARAIM deixou de ficar sem uma referência independente numérica publicada — o próprio exemplo trabalhado do Subgrupo Técnico ARAIM do WG-C agora sustenta a linha separada 'ARAIM MHSS protection levels against published referen

# text
seg-cc7018560c2c = Página do tópico: <a1>REAL_TLE_GUIDE.md</a1>

# text
seg-53a78e98af12 = Página do tópico: <a1>SKYLINE.md</a1>

# text
seg-659e6288ad72 = <s1>Anterior</s1>gnss-ins

# text
seg-7d677a362edd = <s1>Seguinte</s1>gnss-ssv
