# docs--kinds-gps-denied-alternative-pnt: translations (pt-PT)

# text
seg-b03d56f501c3 = Tipo

# text
seg-f496b7f4c63a = Navegador combinado de gravidade + campo magnético + terreno sem GPS: três canais de campo escalares fundidos a cada ponto de passagem para uma correção de deriva mais precisa (CRLB menor) do que qualquer campo isolado.

# attr:alt
seg-498b1aea3770 = O gráfico que o motor gera para scenarios/combined-altpnt.toml, tipo de cenário combined-altpnt

# text
seg-c8f93431680a = Resiliência a conflitos MODELLED de PNT em camadas (P7): um utilizador em ambiente contestado dispõe de várias camadas de PNT (GNSS de serviço aberto, GNSS de banda larga, uma constelação autenticada, um relé de aumentação), cada uma com uma disponibilidade-base, uma exatidão de 1σ e uma vulnerabilidade de negação por vetor à ameaça partilhada de jamming/spoofing. Um Monte Carlo COM SEMENTE, varrido em intensidade, nega cada camada com probabilidade clamp(vulnerabilidade·intensidade·peso_do_vetor,{ "0,1" }), funde as sobreviventes pela regra de forma fechada de variância inversa σ_fused=(Σ 1/σ_i²)^(−1/2), e indica a probabilidade de perda total (todas as camadas negadas), o erro fundido mediano e estatísticas de utilizável/negada por camada em função da intensidade. A razão de resiliência principal (probabilidade de perda total de camada única contra em camadas) chega a cerca de 7x sob a hipótese de INDEPENDÊNCIA; um varrimento de negação correlacionada por cópula gaussiana de um fator mostra então esse ~7x a colapsar para { "1" } à medida que a correlação da negação aumenta (a correlação derrota a estratificação em camadas). Um bloco de sensibilidade a priors varia o valor principal sobre os priors de vulnerabilidade COM FONTE por meio do tornado mcda + uma realocação de esforço de ameaça de Dirichlet + ICs por percentis. Núcleo VALIDATED: a perda total por Monte Carlo converge para o produto independente de forma fechada Π_i p_deny_i (dentro do erro-padrão do MC com semente fixa e N grande); a fusão por variância inversa é uma identidade de forma fechada; em ρ={ "0" } a cópula reduz-se ao modelo independente e qualquer ρ preserva a taxa de negação marginal de cada camada. MODELLED: as magnitudes de vulnerabilidade/disponibilidade/exatidão por camada são entradas com fonte, porém modeladas (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — ver conflict_threat_params), e a magnitude específica de ~7x e a forma da curva razão-versus-correlação decorrem dessa parametrização. Uma decomposição da sobrevivência por vetor, na secção § { "4.2" }, resolve então a ameaça de RF partilhada nos quatro vetores nomeados (jamming/spoofing/cinético/cibernético) e indica a curva de degradação gradual de PNT utilizável de cada vetor S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibilidade_i,v·x,{ "0,1" }))) — VALIDATED: o Monte Carlo por camada com semente converge para essa forma fechada; o jamming é o vetor mais severo para a linha de base de RF correlacionada e a camada inercial, imune a RF, é a sobrevivente decisiva. Não é um produto de disponibilidade de navegação certificado.

# attr:alt
seg-4dd2bcc206db = O gráfico que o motor gera para scenarios/conflict-resilience.toml, tipo de cenário conflict-resilience

# text
seg-9a58a7b09423 = Navegação por correspondência com mapa de gravidade sem GPS: um gravímetro de átomos frios recupera uma deriva constante do INS a partir da sequência de anomalias de gravidade pela qual voa.

# attr:alt
seg-c42d90057e9f = O gráfico que o motor gera para scenarios/gravity-map-nav.toml, tipo de cenário gravity-map

# text
seg-0d7bf5a4f07e = Navegação por referência ao terreno sem GPS (TERCOM/SITAN): um altímetro radar/barométrico compara o perfil de elevação do solo com um DEM ao estilo SRTM para recuperar a deriva do INS.

# attr:alt
seg-c5e33c7122e2 = O gráfico que o motor escreve para scenarios/terrain-nav.toml, tipo terrain-nav

# text
seg-6bdc150ab25b = Navegação sequencial (recursiva) por referência ao terreno sem GPS: um filtro de partículas executa o modelo de medição de correspondência de terreno época a época (SITAN como filtro em execução), de modo que uma deriva do INS variável no tempo é seguida ao longo da trajetória, ao passo que o terrain-nav em lote só recupera um único desvio constante.

# attr:alt
seg-4aca87f022dc = O gráfico que o motor escreve para scenarios/terrain-slam.toml, tipo terrain-slam

# text
seg-4e31c8daf798 = Registo

# text
seg-efd15cff3d32 = MODELLED (etiqueta de resultado)

# text
# c1: docs/kinds/gps-denied-alternative-pnt.md
seg-9d9aeff4f2ee = Fonte: <c1/>

# text
seg-d9fdaf3208ca = PNT alternativo sem GPS (família de tipos de cenário)

# text
seg-9fde6af9e09f = { "5" } tipos de cenário do motor v{ $version }. Caráter consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança da vida humana. Todas as etiquetas aqui são do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como uma etiqueta é obtida: a secção Evidence do README).

# text
# c1: kshana scenarios/combined-altpnt.toml
seg-0d3b170b9fbc = Páginas de tema: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Executar uma: <c1/>. Todas as famílias: <a3>KINDS.md</a3>.

# attr:alt
seg-6dfd2dc2721a = Folha de contactos dos gráficos que o motor escreve para os tipos da família PNT alternativo sem GPS

# text
seg-cff60d8c17d2 = Navegação sequencial (recursiva) por referência ao terreno sem GPS: um filtro de partículas executa o modelo de medição de correspondência de terreno época a época (SITAN como filtro em execução), de modo que uma deriva do INS variável no tempo é se

# text
seg-9d8f69b51742 = Resiliência a conflitos de PNT em camadas MODELLED (P7): um utilizador num ambiente contestado dispõe de várias camadas de PNT (GNSS de serviço aberto, GNSS de banda larga, uma constelação autenticada, um relé de aumentação), cada uma com

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
# c14: coeffs
# c15: mascons
# c16: refine_stages
# c17: refine_factor
# c18: noise_seed
# c19: reference
# c20: map_error_mc
seg-28486745bb43 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Opcionais: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

# text
seg-c2187e8291f9 = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>gravity-map</a1>.

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
# c13: refine_stages
# c14: refine_factor
# c15: noise_seed
seg-b1ff6f0e1769 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Opcionais: <c13/>, <c14/>, <c15/>.

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
# c11: n_particles
# c12: init_pos_sigma_deg
# c13: process_sigma_deg
# c14: resample_ess_frac
# c15: seed
seg-3ec7b38184b7 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Opcionais: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-7c777178ee8f = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>terrain-slam</a1>.

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
# c16: coeffs
# c17: mascons
# c18: magnetic_mascons
# c19: igrf_alt_km
# c20: refine_stages
# c21: refine_factor
# c22: noise_seed
# c23: magnetic_grid
seg-c5124441822e = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Opcionais: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

# text
seg-d78bd011956c = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>combined-altpnt</a1>.

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-2d95ddbf01c4 = Campos obrigatórios: nenhum. Opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-ab895b157152 = <b>Registo:</b> nenhuma linha da matriz menciona este tipo; o motor etiqueta o seu próprio resultado. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>conflict-resilience</a1>.

# text
seg-c0ef7d676ec1 = <s1>Anterior</s1>Medições GNSS, posicionamento e integridade

# text
seg-54b45b00a2f0 = <s1>Seguinte</s1>Fusão inercial e sensores quânticos

# text
seg-643fa0f18717 = <b>Registo:</b> MODELLED. Página completa, com as entradas, os resultados, as evidências e as limitações: <a1>terrain-nav</a1>.
