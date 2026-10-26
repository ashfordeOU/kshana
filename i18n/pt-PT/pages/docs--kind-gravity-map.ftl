# docs--kind-gravity-map: translations (pt-PT)

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } cenários incluídos usam este tipo de cenário; os demais estão em <a1><c1/></a1>.

# text
seg-216efc4e6fba = Tipo de cenário do motor v{ $version }, família <a1>PNT alternativo sem GPS</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-df8d5e07e737 = mGal

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-0df60ac6343f = <b>MODELLED</b> Correspondência com mapa de gravidade, navegação referenciada ao terreno (TERCOM/SITAN), anomalia magnética. Referência independente (InternalConsistency): coeficientes do IGRF-14; CRLB de filtro casado a partir de primeiros princípios. O campo do benchmark de gravidade em campo real é verificado externamente (linha 'Gravity-anomaly synthesis from a spherical-harmonic model'), mas o seu resultado de navegação não tem referência independente externa

# text
seg-d776abd5691c = O PNT alternativo / complementar é MODELLED, não validado: conferido contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Página da família: <a1>PNT alternativo sem GPS</a1>

# text
# c1: docs/kinds/by-kind/gravity-map.md
seg-43227f4c8295 = Fonte: <c1/>

# text
# c1: gravity-map
seg-2a4cb69bc920 = <c1/> (tipo de cenário)

# text
seg-9a58a7b09423 = Navegação por correspondência com mapa de gravidade sem GPS: um gravímetro de átomos frios recupera uma deriva constante do INS a partir da sequência de anomalias de gravidade pela qual voa.

# text
# c1: scenarios/gravity-map-nav.toml
seg-c8caaff45826 = Uma execução de <c1/> resume-se assim: gravity-map | deriva inercial livre { "78302" } m | correspondido com a gravidade { "1882" } m | sigma de correspondência { "2.000e0" } mGal

# text
# c1: nmax
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: gravimeter_asd
# c10: averaging_time_s
# c11: map_sigma_mgal
# c12: search_half_deg
# c13: search_step_deg
seg-4d9bcce2dd39 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: coeffs
# c2: mascons
# c3: refine_stages
# c4: refine_factor
# c5: noise_seed
# c6: reference
# c7: map_error_mc
seg-54272925e770 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/gravity-map-nav.toml
seg-5dfee3a0cc22 = O exemplo <c1/> define, entre outros:

# attr:alt
seg-c42d90057e9f = O gráfico que o motor gera para scenarios/gravity-map-nav.toml, tipo de cenário gravity-map

# text
seg-fe3ba7e11502 = <s1>Anterior</s1>gnss-ssv

# text
seg-2b9bdd9def58 = <s1>Seguinte</s1>holdover-test
