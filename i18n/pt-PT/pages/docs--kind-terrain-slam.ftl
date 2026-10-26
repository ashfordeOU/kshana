# docs--kind-terrain-slam: translations (pt-PT)

# text
seg-216efc4e6fba = Tipo de cenário do motor v{ $version }, família <a1>PNT alternativo sem GPS</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-0df60ac6343f = <b>MODELLED</b> Correspondência com mapa de gravidade, navegação referenciada ao terreno (TERCOM/SITAN), anomalia magnética. Referência independente (InternalConsistency): coeficientes do IGRF-14; CRLB de filtro casado a partir de primeiros princípios. O campo do benchmark de gravidade em campo real é verificado externamente (linha 'Gravity-anomaly synthesis from a spherical-harmonic model'), mas o seu resultado de navegação não tem referência independente externa

# text
seg-d776abd5691c = O PNT alternativo / complementar é MODELLED, não validado: conferido contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Página da família: <a1>PNT alternativo sem GPS</a1>

# text
# c1: docs/kinds/by-kind/terrain-slam.md
seg-bb7c9c4d4b5d = Fonte: <c1/>

# text
# c1: terrain-slam
seg-562e59d703e3 = <c1/> (tipo de cenário)

# text
seg-6bdc150ab25b = Navegação sequencial (recursiva) por referência ao terreno sem GPS: um filtro de partículas executa o modelo de medição de correspondência de terreno época a época (SITAN como filtro em execução), de modo que uma deriva do INS variável no tempo é seguida ao longo da trajetória, ao passo que o terrain-nav em lote só recupera um único desvio constante.

# text
# c1: scenarios/terrain-slam.toml
seg-1e4350c2c5f0 = Uma execução de <c1/> resume-se assim: terrain-slam | { "60" } pontos de passagem | RMS inercial livre { "2947" } m (final { "5082" } m) | RMS com correspondência de terreno { "1241" } m (final { "69" } m, redução de 2x) | ESS médio 2599/4000 | sigma de correspondência { "17.0" } m

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_rate_lat_deg
# c8: drift_rate_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
seg-939d877137f6 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: n_particles
# c2: init_pos_sigma_deg
# c3: process_sigma_deg
# c4: resample_ess_frac
# c5: seed
seg-5ceb5b8597ac = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/terrain-slam.toml
seg-48e022b0945e = O exemplo <c1/> define, entre outros:

# attr:alt
seg-4aca87f022dc = O gráfico que o motor escreve para scenarios/terrain-slam.toml, tipo terrain-slam

# text
seg-832919783819 = <s1>Anterior</s1>terrain-nav

# text
seg-1693abd546fe = <s1>Seguinte</s1>time-transfer-budget
