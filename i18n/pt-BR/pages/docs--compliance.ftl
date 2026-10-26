# docs--compliance: translations (pt-BR)

# text
seg-f65b1f2b4182 = Modo

# text
# c1: docs/COMPLIANCE.md
seg-e19db3d5273b = Fonte: <c1/>

# text
seg-045b24defdbb = Mapa de compliance de integridade DO-316 / DO-229E

# text
seg-9100800daa1c = Este documento mapeia os requisitos de nível de proteção e de monitoramento de integridade da RTCA (antiga Radio Technical Commission for Aeronautics) <b>DO-229E</b> (SBAS (sistema de aumento baseado em satélite) MOPS (normas de desempenho operacional mínimo)) e <b>DO-316</b> (equipamento de bordo GPS/SBAS (GPS: Sistema de Posicionamento Global)) para as funções do Kshana que os implementam. É um <b>auxílio de rastreabilidade de engenharia</b>, e não uma declaração de que algum requisito é atendido: o Kshana implementa os algoritmos publicados; não é aviônica aprovada.

# text
# c1: sbas::do316_compliance_map
# c2: docs/ARAIM_REFERENCE.md
seg-0e6ec5617eb5 = A forma legível por máquina é <a1><c1/></a1>; esta prosa é a sua companheira (espelhando <a2><c2/></a2>).

# text
seg-d5d7a2ec9c73 = Níveis de proteção de mínimos quadrados ponderados (DO-229E Apêndice J)

# text
# c1: Elᵢ
# c2: Azᵢ
seg-0dc19f403f5e = Para cada satélite <em>i</em> com elevação <c1/> e azimute <c2/> no usuário, a linha de observação de nível local (ENU (leste-norte-cima) + relógio) é

# text
# c1: wᵢ = 1/σᵢ²
# c2: σᵢ² = σ_flt² + σ_uire² + σ_air² + σ_tropo²
# c3: D = (GᵀWG)⁻¹
seg-6415f7f28e7e = com peso <c1/>, <c2/> (o orçamento de UDRE (erro diferencial de distância do usuário) / GIVE (erro vertical ionosférico em grade) / bordo / troposfera). A covariância de posição é <c3/>; o seu bloco ENU dá os níveis de proteção horizontal e vertical (HPL, VPL):

# text
# c1: D
# c2: orbit::invert4
# c3: D[2][2]
# c4: Σᵢ S_{U,i}²·σᵢ²
# c5: inv(GᵀG)
seg-ea574448bda4 = O Kshana calcula <c1/> invertendo a matriz normal { "4" }×{ "4" } com a mesma rotina que a pilha de RAIM (monitoramento autônomo de integridade pelo receptor) usa (<c2/>), e valida o resultado de duas formas (o caminho da covariância <c3/> e o caminho da projeção <c4/> devem concordar), além de uma geometria de referência numpy <c5/> independente.

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-268ae5b25684 = En-route → NPA (aproximação de não precisão; somente horizontal)

# text
# c1: √(−2·ln 5e-9)
seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

# text
seg-dbae96c75a06 = Aproximação de precisão

# text
seg-1bfafdcf6ab0 = DO-229E MOPS

# text
# c1: 6.0
# c2: Φ⁻¹(1 − 1e-9/2)
# c3: 6.109
# c4: K_V = Φ⁻¹(1 − 1e-7/2) = 5.327
# c5: raim::normal_quantile
seg-1922c53b8340 = Nota de honestidade: o MOPS usa a constante horizontal arredondada <c1/>; o quantil normal bilateral exato <c2/> é <c3/>. O Kshana usa o valor publicado { "6.0" } no código e deriva <c4/> do mesmo <c5/> que a pilha de RAIM usa, uma verificação cruzada não circular (o valor arredonda para o { "5.33" } do MOPS).

# text
seg-ef191c1d3db1 = Combinação livre de ionosfera de dupla frequência L1/L5 (IS-GPS-705)

# text
# c1: f₁ = 1575.42 MHz
# c2: f₅ = 1176.45 MHz
# c3: γ₁₅ = (f₁/f₅)² = 1.79327
seg-b69825ef05d3 = Com <c1/>, <c2/>, <c3/>:

# text
# c1: 40.3·10¹⁶·TEC/f²
# c2: timetransfer_adv::iono_delay_m
# c3: √(c₁² + c₅²) = 2.588
seg-ce81c6b71738 = O atraso ionosférico de primeira ordem (<c1/>) se cancela exatamente, verificado contra a física independente de <c2/> do motor para uma faixa de TEC (conteúdo total de elétrons). A amplificação de ruído para entradas de variância igual é <c3/>.

# text
# c1: γ₁₅
# c2: inv(GᵀG)
# c3: sbas::tests::wls_pl_matches_numpy_on_five_satellite_geometry
seg-e111fb05a7c6 = <b>No repositório, automatizado</b> (a cada commit): os fatores K contra as suas definições distribucionais, <c1/> e os coeficientes livres de ionosfera (IF) contra as frequências do IS-GPS-705 (IS: Interface Specification), o cancelamento ionosférico de primeira ordem contra a física de atraso independente, e os níveis de proteção de mínimos quadrados ponderados (WLS) contra uma geometria de referência numpy <c2/> (<c3/>).

# text
# c1: tests/sbas_reference.rs
# c2: sbas_protection_level
# c3: waasprotlevels()
# c4: zsiki/rtklib_ws
# c5: d_U
# c6: core/filter.c
seg-f30d84abe275 = <b>Referência independente externa, automatizada</b> (<c1/>): dados a elevação, o azimute e o 1-σ total de cada satélite, <c2/> reproduz o HPL de uma implementação independente, <c3/> no fork de nível de proteção SBAS do RTKLIB (uma biblioteca de código aberto de posicionamento cinemático em tempo real) <c4/> (Siki & Takács { "2017" }), em seis épocas que essa ferramenta calculou a partir de mensagens de transmissão do <b>EGNOS (European Geostationary Navigation Overlay Service) real</b> (PRN (número do código pseudoaleatório) geoestacionário { "120" }) e de observações RINEX (Receiver Independent Exchange Format) reais da estação BUTE, em Budapeste (2017-02-19), até <b>< { "2e-3" } m</b>. A referência independente arredonda K_V para { "5.33" }, de modo que a vertical é comparada sem fator K, como <c5/> contra o seu VPL / { "5.33" }. O gLAB { "v6.0.0" } da ESA (European Space Agency) (<c6/>) usa a mesma fórmula.

# text
seg-389e8a57e3e8 = <b>Não feito</b>: o σ por satélite é o da própria referência independente; modelar o σ a partir de mensagens UDRE/GIVE brutas está fora do escopo, e nenhum produto oficial publicado de nível de proteção do WAAS (Wide Area Augmentation System) ou do EGNOS foi reproduzido de ponta a ponta. A DO-229E/DO-316 em si são pagas pela RTCA; a fonte aberta da derivação são as páginas SBAS da ICAO (Organização da Aviação Civil Internacional)/EGNOS do ESA Navipedia.

# text
seg-7686fb3d3e0c = <s1>Anterior</s1>Referência do ARAIM

# text
seg-0457ef382fb0 = <s1>Próximo</s1>Correspondência de resiliência
