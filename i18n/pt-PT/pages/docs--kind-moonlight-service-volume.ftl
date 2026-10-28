# docs--kind-moonlight-service-volume: translations (pt-PT)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-8f8871ac8a0f = Página do tema: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Página do tema: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/moonlight-service-volume.md
seg-eb9f9a422d38 = Fonte: <c1/>

# text
# c1: moonlight-service-volume
seg-f8988314faf2 = <c1/> (tipo de cenário)

# text
seg-28c6a5644152 = Análise modelada do volume de serviço de navegação lunar a partir de uma constelação de órbita lunar da classe Moonlight/LCNS, ILLUSTRATIVE e de fontes públicas (sem afiliação à ESA): varre uma grelha selenográfica de latitude/longitude ao longo de um horizonte temporal e indica DOP / cobertura / disponibilidade (≥{ "4" } sats E PDOP < limiar) mais uma envolvente generalizada de níveis de proteção ARAIM lunares (HPL/VPL) sobre o volume. A geometria do DOP REAPROVEITA o núcleo VALIDATED face ao gnss_lib_py (crate::orbit::dop); o nível de proteção REAPROVEITA a maquinaria ARAIM lunar LNIS do LunaNet (crate::lunar, σ_URE≈{ "30" } m) e reduz-se ao nível de proteção existente do polo sul como caso particular. Composição MODELLED: um conjunto de retransmissores kepleriano circular/elíptico (não as efemérides LCNS/NRHO reais corrigidas diferencialmente), uma Lua de rotação média (sem libração nem polo em precessão). Determinístico (geometria pura). Sem aval de TRL, de herança de voo nem de agências.

# text
# c1: scenarios/moonlight-service-volume.toml
seg-8516d1ded5dd = Uma execução de <c1/> resume-se assim: moonlight-service-volume | { "8" } sats (classe LCNS ilustrativa, sem afiliação) | { "24" } pts × { "12" } épocas | cobertura de { "37.8" }% (PDOP<{ "6.0" }) | sats { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | disponibilidade de PL { "0.0" }% | MODELLED

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: lat_min_deg
# c7: lat_max_deg
# c8: lat_step_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: lon_step_deg
# c12: horizon_hours
# c13: step_min
# c14: elev_mask_deg
# c15: pdop_threshold
# c16: alert_limit_m
# c17: p_hmi
# c18: perturbed
# c19: sigma_ure_m
# c20: export_site_lat_deg
# c21: export_site_lon_deg
# c22: export_antenna
# c23: ephemeris_path
# c24: planetary_kernel_path
# c25: epoch_utc
# c26: terrain
seg-b59e8773bcb9 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

# text
# c1: scenarios/moonlight-service-volume.toml
seg-0d935e7c43da = O exemplo <c1/> define, entre outros:

# attr:alt
seg-edb738273a3a = O gráfico que o motor escreve para scenarios/moonlight-service-volume.toml, tipo de cenário moonlight-service-volume

# text
seg-1974d1d64c9c = <b>VALIDATED</b> DOP / cobertura / disponibilidade lunares da classe Moonlight + níveis de proteção ARAIM lunares generalizados sobre um volume de serviço. Referência independente (ExternalDataset): Autoridade independente de terceiros, o propagador kepleriano astro::Orbit do ANISE { "0.10.2" } (Nyx Space, MPL-2.0) — um percurso de código de dois corpos equinocial distinto do Kepler de Newton-Raphson do kshana; a posição MCI por satélite concorda até <{ "1e-3" } m e a contagem/conjunto derivado de satélites visíveis coincide exatamente em cada ponto da grelha. O núcleo de DOP está validado face ao gnss_lib_py; a integridade usa parâmetros publicados do LunaNet/LCNS

# text
seg-47f496c1d603 = <b>VALIDATED</b> Ângulos de visada topocêntricos por satélite (azimute no sentido horário a partir do norte, elevação) e distância oblíqua num local selenográfico designado, dado o satélite no do local. Referência independente (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, executado como ferramenta a partir de xval/anise-service-geometry, binário lunar-look-angles-xval, que não chama código do Kshana): a própria rotina de azimute, elevação e distância do ANISE (azimuth_elevation_range_sez) a partir de locais construídos pelo seu construtor de latitude-longitude-altitude sobre a Lua pck00011 (esfera de { "1737.4" } km), com os satélites rodados para MOON_PA_DE440 através de moon_pa_de440_200625.bpc. { "768" } amostras o

# text
# c1: kshana kinds --json
seg-1f12671176ad = Composição MODELLED: um conjunto de retransmissores kepleriano circular/elíptico (não as efemérides LCNS/NRHO reais corrigidas diferencialmente), uma Lua de rotação média (sem libração nem polo em precessão). (catálogo de tipos de cenário (<c1/>))

# text
seg-2ff91fe31123 = HONESTIDADE: composição MODELLED. A geometria do DOP é validada POR REAPROVEITAMENTO do núcleo validado; a composição de cobertura / disponibilidade / integridade é MODELLED — um conjunto de retransmissores kepleriano circular/ elíptico (não umas efemérides LCNS / NRHO { "9" }:{ "2" } corrigidas diferencialmente), uma Lua de rotação média (sem libração física / polo em precessão) e parâmetros de integridade LNIS do LunaNet publicados. Isto demonstra o volume de serviço lunar M (comentário do ficheiro de cenário, linhas { "27" } a { "32" })

# text
seg-f3279128de3b = <s1>Anterior</s1>mars-pnt

# text
seg-92cd937a3fb7 = <s1>Seguinte</s1>ntn-positioning

# text
seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

# text
# c1: lunar-surface
# c2: moonlight-service-volume
seg-25040e105bf7 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: disponibilidade de relés e PDOP, visibilidade da Terra e do Sol e um relógio de superfície disciplinado para cada local e estação, com o perfil do horizonte do terreno de <c2/>; uma execução de local único é igual ao do tipo

# text
seg-6730fa1b9820 = <s1>Anterior</s1>mission-thread
