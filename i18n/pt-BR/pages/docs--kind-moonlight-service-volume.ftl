# docs--kind-moonlight-service-volume: translations (pt-BR)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

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
seg-28c6a5644152 = Análise modelada de volume de serviço de navegação lunar a partir de uma constelação em órbita lunar da classe Moonlight/LCNS, ILLUSTRATIVE e de fonte pública (sem afiliação com a ESA): varre uma grade selenográfica de latitude/longitude sobre um horizonte de tempo e informa DOP / cobertura / disponibilidade (≥{ "4" } satélites E PDOP < limiar) mais um envelope generalizado de nível de proteção ARAIM lunar (HPL/VPL) sobre o volume. A geometria do DOP REAPROVEITA o núcleo VALIDATED do gnss_lib_py (crate::orbit::dop); o nível de proteção REAPROVEITA o mecanismo ARAIM lunar LNIS da LunaNet (crate::lunar, σ_URE≈{ "30" } m) e se reduz ao PL existente do polo sul como caso particular. Composição MODELLED: um conjunto de retransmissores kepleriano circular/elíptico (não as efemérides reais LCNS/NRHO corrigidas diferencialmente), uma Lua de rotação média (sem libração nem polo com precessão). Determinístico (geometria pura). Sem TRL, herança nem endosso de agência.

# text
# c1: scenarios/moonlight-service-volume.toml
seg-8516d1ded5dd = Uma execução de <c1/> resume-se assim: moonlight-service-volume | { "8" } sats (illustrative LCNS-class, not affiliated) | { "24" } pts × { "12" } epochs | coverage { "37.8" }% (PDOP<{ "6.0" }) | sats { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL avail { "0.0" }% | MODELLED

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
seg-1974d1d64c9c = <b>VALIDATED</b> DOP / cobertura / disponibilidade lunar da classe Moonlight + níveis de proteção ARAIM lunar generalizados sobre um volume de serviço. Referência independente (ExternalDataset): propagador kepleriano astro::Orbit do ANISE { "0.10.2" }, autoridade independente de terceiros (Nyx Space, MPL-2.0) — um caminho de código de dois corpos equinocial distinto do Kepler de Newton-Raphson do kshana; a posição MCI por satélite concorda a <{ "1e-3" } m e a contagem/conjunto derivado de satélites visíveis coincide exatamente em todo ponto da grade. O núcleo de DOP é validado pelo gnss_lib_py; a integridade usa parâmetros publicados da LunaNet/LCNS

# text
seg-47f496c1d603 = <b>VALIDATED</b> Ângulos de visada topocêntricos por satélite (azimute no sentido horário a partir do norte, elevação) e distância oblíqua em um local selenográfico nomeado, dado o satélite no do local. Referência independente (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, executado como ferramenta a partir de xval/anise-service-geometry, binário lunar-look-angles-xval, que não chama nenhum código do Kshana): a própria rotina de azimute, elevação e distância do ANISE (azimuth_elevation_range_sez) a partir de locais construídos pelo seu construtor de latitude-longitude-altitude sobre a Lua pck00011 (esfera de { "1737.4" } km), com os satélites girados para MOON_PA_DE440 por moon_pa_de440_200625.bpc. { "768" } amostras o

# text
# c1: kshana kinds --json
seg-1f12671176ad = Composição MODELLED: um conjunto de retransmissores kepleriano circular/elíptico (não as efemérides reais LCNS/NRHO corrigidas diferencialmente), uma Lua de rotação média (sem libração nem polo com precessão). (catálogo de tipos de cenário (<c1/>))

# text
seg-2ff91fe31123 = HONESTIDADE: composição MODELLED. A geometria do DOP é validada POR REAPROVEITAMENTO do núcleo validado; a composição de cobertura / disponibilidade / integridade é MODELLED — um conjunto de retransmissores kepleriano circular/ elíptico (não uma efeméride LCNS / NRHO { "9" }:{ "2" } corrigida diferencialmente), uma Lua de rotação média (sem libração física nem polo com precessão) e parâmetros publicados de integridade LNIS da LunaNet. Isto demonstra o volume de serviço lunar M (comentário do arquivo de cenário, linhas { "27" } a { "32" })

# text
seg-f3279128de3b = <s1>Anterior</s1>mars-pnt

# text
seg-92cd937a3fb7 = <s1>Próximo</s1>ntn-positioning

seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-25040e105bf7 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: disponibilidade de relés e PDOP, visibilidade da Terra e do Sol e um relógio de superfície disciplinado para cada local e estação, com o perfil do horizonte do terreno de <c2/>; uma execução de local único é igual ao do tipo

seg-6730fa1b9820 = <s1>Anterior</s1>mission-thread
