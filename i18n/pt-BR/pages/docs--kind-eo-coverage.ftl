# docs--kind-eo-coverage: translations (pt-BR)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, enlaces e operações espaciais</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, enlaces e operações espaciais</a1>

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-98151954f217 = false

# text
seg-8e62cc4af6ea = Página do tópico: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/eo-coverage.md
seg-fc32bcd32dec = Fonte: <c1/>

# text
# c1: eo-coverage
seg-d72c017ca1fa = <c1/> (tipo de cenário)

# text
seg-47b4aea6ed01 = Pegada da carga útil de observação da Terra e geometria de cobertura (triângulo espacial do SMAD): raio angular da Terra, largura da faixa imageada, distância de amostragem no solo no nadir, acesso máximo fora do nadir, período circular, período nodal com J2 e espaçamento equatorial do traço no solo com um indicador de cobertura contígua, para uma altitude orbital, uma inclinação (heliossíncrona por padrão) e um FOV/IFOV do sensor. Geometria de Terra esférica MODELLED (sem radiometria/MTF/atmosfera/jitter/reflexo solar); espaçamento de nós R_e·(ω − Ω̇)·T_nodal com taxas seculares de J2 de primeira ordem.

# text
# c1: scenarios/eo-coverage.toml
seg-105bb8a3c33f = Uma execução de <c1/> resume-se assim: eo-coverage: { "700" } km, ±{ "7.5" }° de FOV -> faixa de { "184" } km, GSD no nadir de { "9.8" } m, acesso até { "745" } km fora do nadir; espaçamento de nós de { "2752" } km (com lacunas) (MODELLED)

# text
# c1: altitude_km
# c2: half_fov_deg
# c3: ifov_microrad
# c4: max_off_nadir_deg
# c5: inclination_deg
seg-609c5b7bc6f1 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/eo-coverage.toml
seg-14f19837e422 = O exemplo <c1/> define, entre outros:

# text
seg-834408a40783 = min

# text
seg-ade2ba71a96c = Rótulo do resultado (o do motor): MODELLED — geometria do triângulo espacial com Terra esférica; faixa/GSD/acesso são geométricos (sem radiometria/MTF/atmosfera/jitter/reflexo solar), o espaçamento do traço no solo é R_e·(ω − Ω̇)·T_nodal com taxas seculares de J2 de primeira ordem

# attr:alt
seg-c2a8332f2ee2 = O gráfico que o motor gera para scenarios/eo-coverage.toml, tipo de cenário eo-coverage

# text
seg-d86d43628cf3 = <b>VALIDATED</b> Geometria do triângulo espacial do SMAD: raio angular da Terra, largura da faixa, GSD no nadir, acesso máximo fora do nadir e período circular, mais o período nodal de J2 de primeira ordem (eo_payload::j2_nodal_period) e o espaçamento equatorial do traço no solo R_e (omega_ Testes: <a1>eo_payload_coverage_reference.rs</a1>.

# text
seg-9938f1de9eb8 = <b>VALIDATED</b> Geometria do triângulo espacial do SMAD: raio angular da Terra, largura da faixa, GSD no nadir, acesso máximo fora do nadir e período circular, mais o período nodal de J2 de primeira ordem (. Referência independente (ExternalDataset): Orekit { "12.2" } (Apache-2.0) e GeographicLib { "2.1" } (MIT), ambos executados como programas separados, fixados antecipadamente (766823f3) antes da mudança no motor e de qualquer execução de referência independente: grandezas da esfera dentro de { "1e-9" } relativo (pior caso: raio angular { "5.4e-16" }, faixa { "7.0e-13" }, acesso { "1.9e-14" }), período { "1e-12" } ({ "1.6e-16" }), GSD no nadir { "1e-7" } ({ "2.9e-10" }), o período nodal de J2 e o espaçamento de nós dentro de { "0.1" } % de uma propagação numérica de J2 do Orekit com um detector de nós ({ "1" }

# text
# c1: label
seg-45625167e59f = MODELLED — geometria do triângulo espacial com Terra esférica; faixa/GSD/acesso são geométricos (sem radiometria/MTF/atmosfera/jitter/reflexo solar), o espaçamento do traço no solo é R_e·(ω − Ω̇)·T_nodal com taxas seculares de J2 de primeira ordem (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-cf22f13c78d3 = Geometria de Terra esférica MODELLED (sem radiometria/MTF/atmosfera/jitter/reflexo solar); espaçamento de nós R_e·(ω − Ω̇)·T_nodal com taxas seculares de J2 de primeira ordem. (catálogo de tipos de cenário (<c1/>))

# text
seg-153325fb00d3 = ESCOPO HONESTO: apenas geometria de Terra esférica MODELLED -- sem modelo de radiometria / MTF / atmosfera / jitter de apontamento / reflexo solar. O espaçamento do traço no solo é R_e*(omega - dOmega/dt)*T_nodal com taxas seculares de J2 de primeira ordem; a inclinação assume por padrão a heliossíncrona para a altitude. Execução: kshana scenarios/eo-coverage.toml (comentário do arquivo de cenário, linhas { "7" } a { "11" })

# text
seg-5dc02c3d10f7 = <s1>Anterior</s1>entry-heating

# text
seg-33f408d48d13 = <s1>Próximo</s1>eo-radiometry
