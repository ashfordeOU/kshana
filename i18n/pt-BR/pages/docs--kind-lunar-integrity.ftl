# docs--kind-lunar-integrity: translations (pt-BR)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> Solução de separação de múltiplas hipóteses do ARAIM segundo o ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels e add_v42_protecti. Referência independente (ExternalDataset): Três ferramentas independentes, fixadas antecipadamente (0123cee1) antes de existir qualquer fixture ou saída de referência independente, com tolerâncias fixadas então. ({ "1" }) ARAIM: Stanford MAAST para ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, executado como programa separado no GNU Octave { "8.4" } com um shim de compatibilidade unique() do lado do driver (divulgado, sem alteração de algoritmo), no TOL_PL do ADD de { "0.05" } m: o Rust reproduz a implementação de referência do ADD em

# text
# c1: docs/kinds/by-kind/lunar-integrity.md
seg-8ed008b206de = Fonte: <c1/>

# text
# c1: lunar-integrity
seg-26f0cf6d63c0 = <c1/> (tipo de cenário)

# text
seg-4b6daea39f5c = Passagem de nível de proteção ARAIM no polo sul lunar contra um conjunto representativo de retransmissores LunaNet. sigma_ure_m expõe a precisão de medição de distância do sinal no espaço (os níveis de proteção escalam linearmente com ela, de modo que varrê-la responde que precisão de medição de distância um limite de alerta exige). O padrão é o caso histórico do polo sul da classe LNIS.

# text
# c1: scenarios/lunanet-araim.toml
seg-a6eb6de27cb5 = Uma execução de <c1/> resume-se assim: lunar-integrity | south pole | 0/24 epochs available ({ "0.0" }%) | AL { "50" } m | σ_URE { "30" } m | HPL { "263" }–{ "452" } m

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-79da500e2726 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/lunanet-araim.toml
seg-21d10aa98c33 = O exemplo <c1/> define, entre outros:

# attr:alt
seg-610fa190a393 = O gráfico que o motor escreve para scenarios/lunanet-araim.toml, tipo de cenário lunar-integrity

# text
seg-1903c67a762d = <b>VALIDATED</b> A etapa de geometria para covariância do nível de proteção lunar — (GᵀG)⁻¹ sobre a visão completa e toda subgeometria de falha única, projetada sobre a vertical local a. Referência independente (ExternalDataset): duas implementações de terceiros consolidadas, compostas, ambas executadas offline, com o fixture regenerado de ponta a ponta e verificado como idêntico byte a byte. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c compilado a partir do código-fonte em C com -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() inverte a matriz normal por LU de Crout com pivoteamento parcial, um algoritmo sem relação com o invert4() de Gauss-Jordan escrito à mão do kshana

# text
seg-3c54da43686e = <s1>Anterior</s1>lunar-infrastructure

# text
seg-f6b399c3fd4a = <s1>Próximo</s1>lunar-interop-export
