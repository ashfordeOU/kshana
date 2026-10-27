# docs--kind-passes: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 da ligação descendente ao longo de cada passagem de um satélite sobre uma estação (EIRP, perda em espaço livre, perda atmosférica em lei da cossecante, outras perdas, G/T, constante de Boltzmann, taxa de símbolos), o MODCOD DVB-S2 mais eficiente que satisfaz o limiar da ETSI EN { "302" } 307-

# text
seg-72fd0321e4af = Página do tema: <a1>CONTACT-SCHEDULING.md</a1>

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Uma execução recebe um plano de contactos (uma lista de janelas aos_s/los_s, cada uma a pedir à abertura navegação ou comunicações — o mesmo vocabulário de janelas que <c1/> emite, convertido por <c2/>), um número de aberturas

# text
seg-11e8c29ecb45 = Tipo de cenário do motor v{ $version }, família <a1>Constelações, cobertura e geometria</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-a4f1e7d2041e = Página da família: <a1>Constelações, cobertura e geometria</a1>

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: as linhas da <a1>matriz de verificação</a1> que mencionam este tipo de cenário.

# text
seg-df90e5910fb4 = h

# text
# c1: docs/kinds/by-kind/passes.md
seg-2544da673115 = Fonte: <c1/>

# text
# c1: passes
seg-0db3f4e2402e = <c1/> (tipo de cenário)

# text
seg-a4bdfc291fce = Previsão de passagens sobre estações em terra: as passagens de visibilidade no domínio do tempo (AOS/TCA/LOS, elevação aparente máxima, duração) de uma órbita circular, como elementos médios SGP4 no início da janela, sobre uma estação acima de uma máscara de elevação ao longo de uma janela, com o tempo total de acesso. Propagação SGP4/SDP4 no referencial fixo à Terra IAU 2006/2000A (UT1 - UTC e movimento polar opcionais), refração troposférica da ITU-R P.834-9 e o tempo de luz da ligação descendente (ambos ativos por predefinição), cruzamentos resolvidos até { "1e-7" } s e a culminação por pesquisa de secção áurea. A geometria da passagem é VALIDATED face ao Orekit { "13.1.8" } em estações ao nível do mar; a órbita e a estação do cenário são entradas ilustrativas.

# text
# c1: scenarios/passes.toml
seg-3050cc7fdc79 = Uma execução de <c1/> resume-se assim: passes: { "5" } passagem(ns) de uma órbita de { "550" } km / { "97.6" }° sobre ({ "52.2" }°, { "4.4" }°) > { "10" }° em { "24" } h; { "1659" } s de acesso total (MODELLED)

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-699b650604d4 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/passes.toml
seg-9d2941ba37e2 = O exemplo <c1/> define, entre outros:

# text
seg-6f849331e33c = Etiqueta do resultado (a do motor): MODELLED — previsão de passagens sobre estações em terra no domínio do tempo; propagação SGP4/SDP4, referencial fixo à Terra IAU 2006/2000A (UT1 = UTC, sem movimento polar a menos que sejam fornecidos parâmetros de orientação da Terra), elevação aparente com refração ITU-R P.834-9 e tempo de luz quando ativados, cruzamentos e culminação refin

# attr:alt
seg-a09be8c586e3 = O gráfico que o motor escreve para scenarios/passes.toml, tipo de cenário passes

# text
seg-db35e4ebd275 = <b>VALIDATED</b> Passagens de visibilidade no domínio do tempo (AOS/TCA/LOS, elevação máxima, duração) de um propagador do motor sobre uma estação acima de uma máscara de elevação, com cruzamentos de nascer/pôr interpolados e acesso total: passes::predict_passes, o escalonador geométrico (sem Ensaios: <a1>ground_station_pass_prediction_reference.rs</a1>.

# text
seg-6799a54acee6 = <b>VALIDATED</b> Passagens de visibilidade (AOS, TCA, LOS, elevação aparente máxima, duração) de um conjunto de elementos SGP4 sobre uma estação WGS-84 no percurso validado de órbita terrestre (IAU 2006/2000A, parâmetros de orientação da Terra opcionais), com troposfera ITU-R P.834-9 Ensaios: <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

# text
seg-42d4290ed718 = <b>VALIDATED</b> Passagens de visibilidade no domínio do tempo (AOS/TCA/LOS, elevação máxima, duração) de um propagador do motor sobre uma estação acima de uma máscara de elevação, com nascimento/ocaso interpolado . Referência independente (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — uma biblioteca independente de dinâmica de voo: ElevationDetector (localizador de raízes de Brent) + EventsLogger sobre uma efeméride ITRF, com a estação como TopocentricFrame WGS-84. AOS/LOS/elevação máxima/número de passagens/acesso total coincidentes com órbita+estação+máscara+janela idênticas (fixture registado; driver xval/orekit-passes)

# text
# c1: label
seg-eb79c117f1df = MODELLED — previsão de passagens de estações terrestres no domínio do tempo; propagação SGP4/SDP4, referencial terrestre IAU 2006/2000A (UT1 = UTC, sem movimento polar, salvo se forem indicados parâmetros de orientação da Terra), elevação aparente com refração ITU-R P.834-9 e tempo de luz quando ativados, cruzamentos e culminação refinados abaixo do passo (resultado <c1/>)

# text
seg-a7ddc8eeaf1e = <s1>Anterior</s1>orbit

# text
seg-3079cfb8decc = <s1>Seguinte</s1>pvt
