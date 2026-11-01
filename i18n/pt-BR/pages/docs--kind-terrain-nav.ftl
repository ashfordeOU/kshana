# docs--kind-terrain-nav: translations (pt-BR)

# text
seg-216efc4e6fba = Tipo de cenário do motor v{ $version }, família <a1>PNT alternativo sem GPS</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga outra coisa (como um rótulo é conquistado: a seção Evidence do README).

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-0df60ac6343f = <b>MODELLED</b> Correspondência com mapa de gravidade, navegação referenciada ao terreno (TERCOM/SITAN), anomalia magnética. Referência independente (InternalConsistency): coeficientes do IGRF-14; CRLB de filtro casado a partir de primeiros princípios. O campo do benchmark de gravidade em campo real é verificado externamente (linha 'Gravity-anomaly synthesis from a spherical-harmonic model'), mas o seu resultado de navegação não tem referência independente externa

# text
seg-d776abd5691c = O PNT alternativo / complementar é MODELLED, não validado: conferido contra a sua própria identidade analítica / de forma fechada — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Página da família: <a1>PNT alternativo sem GPS</a1>

# text
# c1: docs/kinds/by-kind/terrain-nav.md
seg-1d36a7dc3fd0 = Fonte: <c1/>

# text
# c1: terrain-nav
seg-7bfd6d049799 = <c1/> (tipo de cenário)

# text
seg-0d7bf5a4f07e = Navegação referenciada ao terreno sem GPS (TERCOM/SITAN): um altímetro de radar/barométrico compara o perfil de elevação do solo com um DEM de estilo SRTM para recuperar a deriva do INS.

# text
# c1: scenarios/terrain-nav.toml
seg-54690375328b = Uma execução de <c1/> resume-se assim: terrain-nav | deriva inercial livre { "70659" } m | com correspondência de terreno { "53" } m (corte de 1342x) | sigma de correspondência { "17.0" } m

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
# c11: search_half_deg
# c12: search_step_deg
seg-db286a072e43 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: refine_stages
# c2: refine_factor
# c3: noise_seed
seg-efc57f43bd6f = Campos opcionais: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/terrain-nav.toml
seg-96e3607379e0 = O exemplo <c1/> define, entre outros:

# attr:alt
seg-c5e33c7122e2 = O gráfico que o mecanismo gera para scenarios/terrain-nav.toml, tipo terrain-nav

# text
seg-0fcad0016c78 = <s1>Anterior</s1>telecom-timing

# text
seg-fa50992f818f = <s1>Seguinte</s1>terrain-slam

seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-d5da9ee3c152 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: um modelo de erro inercial de cinco estados por eixo (posição, velocidade, viés do acelerômetro, inclinação, viés do giroscópio) ao longo de uma descida propulsada, auxiliado por soluções AFS (isoladas ou diferenciais, com o caso de três rel
