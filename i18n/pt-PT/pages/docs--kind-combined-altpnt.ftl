# docs--kind-combined-altpnt: translations (pt-PT)

# text
# c1: docs/kinds/by-kind/combined-altpnt.md
seg-a83b25413fd8 = Fonte: <c1/>

# text
# c1: combined-altpnt
seg-92b24377c9be = <c1/> (tipo de cenário)

# text
seg-216efc4e6fba = Tipo de cenário do motor v{ $version }, família <a1>PNT alternativo sem GPS</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-f496b7f4c63a = Navegador combinado de gravidade + campo magnético + terreno sem GPS: três canais de campo escalares fundidos a cada ponto de passagem para uma correção de deriva mais precisa (CRLB menor) do que qualquer campo isolado.

# text
# c1: scenarios/combined-altpnt.toml
seg-670730bd221e = Uma execução de <c1/> resume-se assim: combined-altpnt | deriva inercial livre { "70659" } m | gravidade { "464" } m magnético { "782" } m terreno { "368" } m | FUSED { "365" } m

# text
# c1: start_lat_deg
# c2: start_lon_deg
# c3: step_lat_deg
# c4: step_lon_deg
# c5: waypoints
# c6: drift_lat_deg
# c7: drift_lon_deg
# c8: search_half_deg
# c9: search_step_deg
# c10: nmax
# c11: gravity_sigma_mgal
# c12: igrf_year
# c13: magnetic_sigma_nt
# c14: dem_seed
# c15: terrain_sigma_m
seg-cf6981466329 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: coeffs
# c2: mascons
# c3: magnetic_mascons
# c4: igrf_alt_km
# c5: refine_stages
# c6: refine_factor
# c7: noise_seed
# c8: magnetic_grid
seg-078f09d100fa = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/combined-altpnt.toml
seg-557db767b9c3 = O exemplo <c1/> define, entre outros:

# text
seg-df8d5e07e737 = mGal

# attr:alt
seg-498b1aea3770 = O gráfico que o motor gera para scenarios/combined-altpnt.toml, tipo de cenário combined-altpnt

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-0df60ac6343f = <b>MODELLED</b> Correspondência com mapa de gravidade, navegação referenciada ao terreno (TERCOM/SITAN), anomalia magnética. Referência independente (InternalConsistency): coeficientes do IGRF-14; CRLB de filtro casado a partir de primeiros princípios. O campo do benchmark de gravidade em campo real é verificado externamente (linha 'Gravity-anomaly synthesis from a spherical-harmonic model'), mas o seu resultado de navegação não tem referência independente externa

# text
seg-d776abd5691c = O PNT alternativo / complementar é MODELLED, não validado: conferido contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Página da família: <a1>PNT alternativo sem GPS</a1>

# text
seg-49efcd2ced81 = <s1>Anterior</s1>clock

# text
seg-f2ccea3bb03e = <s1>Seguinte</s1>conflict-resilience
