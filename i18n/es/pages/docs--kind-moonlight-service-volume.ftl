# docs--kind-moonlight-service-volume: translations (es)

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-8f8871ac8a0f = Página temática: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Página temática: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/moonlight-service-volume.md
seg-eb9f9a422d38 = Fuente: <c1/>

# text
# c1: moonlight-service-volume
seg-f8988314faf2 = <c1/> (tipo de escenario)

# text
seg-28c6a5644152 = Análisis modelado del volumen de servicio de navegación lunar a partir de una constelación en órbita lunar ILUSTRATIVA, de fuentes públicas, de clase Moonlight/LCNS (sin afiliación con la ESA): barre una cuadrícula selenográfica de latitud y longitud a lo largo de un horizonte temporal e indica DOP, cobertura y disponibilidad (≥{ "4" } satélites Y PDOP < umbral), además de una envolvente generalizada de nivel de protección (HPL/VPL) de ARAIM lunar sobre el volumen. La geometría de DOP REUTILIZA el núcleo VALIDATED con gnss_lib_py (crate::orbit::dop); el nivel de protección REUTILIZA la maquinaria de ARAIM lunar LNIS de LunaNet (crate::lunar, σ_URE≈{ "30" } m) y se reduce al nivel de protección del polo sur existente como caso particular. Composición MODELLED: un conjunto de relés kepleriano circular o elíptico (no las efemérides reales LCNS/NRHO corregidas diferencialmente), una Luna de rotación media (sin libración ni polo con precesión). Determinista (geometría pura). Sin TRL, herencia de vuelo ni respaldo de agencia alguna.

# text
# c1: scenarios/moonlight-service-volume.toml
seg-8516d1ded5dd = Una ejecución de <c1/> se resume así: moonlight-service-volume | { "8" } satélites (ilustrativos de clase LCNS, sin afiliación) | { "24" } puntos × { "12" } épocas | cobertura { "37.8" }% (PDOP<{ "6.0" }) | satélites { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | disponibilidad de PL { "0.0" }% | MODELLED

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
seg-b59e8773bcb9 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

# text
# c1: scenarios/moonlight-service-volume.toml
seg-0d935e7c43da = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-edb738273a3a = El gráfico que el motor genera para scenarios/moonlight-service-volume.toml, tipo de escenario moonlight-service-volume

# text
seg-1974d1d64c9c = <b>VALIDATED</b> DOP, cobertura y disponibilidad lunares de clase Moonlight + niveles de protección generalizados de ARAIM lunar sobre un volumen de servicio. Referencia independiente (ExternalDataset): Autoridad independiente de terceros, propagador kepleriano astro::Orbit de ANISE { "0.10.2" } (Nyx Space, MPL-2.0): una vía de código equinoccial de dos cuerpos distinta del Kepler por Newton-Raphson de kshana; la posición MCI de cada satélite coincide hasta <{ "1e-3" } m y el recuento y el conjunto derivados de satélites visibles coinciden exactamente en cada punto de la cuadrícula. El núcleo de DOP está validado con gnss_lib_py; la integridad usa parámetros publicados de LunaNet/LCNS

# text
seg-47f496c1d603 = <b>VALIDATED</b> Ángulos de observación topocéntricos por satélite (acimut en sentido horario desde el norte, elevación) y distancia oblicua en un emplazamiento selenográfico con nombre, dado el satélite en el del emplazamiento. Referencia independiente (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, ejecutado como herramienta desde xval/anise-service-geometry, binario lunar-look-angles-xval, que no llama a ningún código de Kshana): la propia rutina de ANISE de acimut, elevación y distancia (azimuth_elevation_range_sez) desde emplazamientos construidos con su constructor de latitud, longitud y altitud sobre la Luna pck00011 (esfera { "1737.4" } km), con los satélites rotados a MOON_PA_DE440 mediante moon_pa_de440_200625.bpc. { "768" } muestras o

# text
# c1: kshana kinds --json
seg-1f12671176ad = Composición MODELLED: un conjunto de relés kepleriano circular o elíptico (no las efemérides reales LCNS/NRHO corregidas diferencialmente), una Luna de rotación media (sin libración ni polo con precesión). (catálogo de tipos (<c1/>))

# text
seg-2ff91fe31123 = HONESTIDAD: composición MODELLED. La geometría de DOP está validada POR REUTILIZACIÓN del núcleo validado; la composición de cobertura, disponibilidad e integridad es MODELLED: un conjunto de relés kepleriano circular o elíptico (no unas efemérides NRHO LCNS { "9" }:{ "2" } corregidas diferencialmente), una Luna de rotación media (sin libración física ni polo con precesión) y parámetros de integridad LNIS de LunaNet publicados. Esto demuestra el volumen de servicio lunar M (comentario del archivo de escenario, líneas { "27" } a { "32" })

# text
seg-f3279128de3b = <s1>Anterior</s1>mars-pnt

# text
seg-92cd937a3fb7 = <s1>Siguiente</s1>ntn-positioning
