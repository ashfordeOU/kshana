# docs--kind-lunar-joint-od-clock: translations (es)

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
# c1: docs/kinds/by-kind/lunar-joint-od-clock.md
seg-593938ee5995 = Fuente: <c1/>

# text
# c1: lunar-joint-od-clock
seg-d54a85227f43 = <c1/> (tipo de escenario)

# text
seg-200e58e189c2 = Estimador por lotes conjunto multitécnica modelado de OD lunar + reloj sobre una red SIMULADA: un ajuste instantáneo de Gauss-Newton que fusiona retardos de VLBI geodésico de línea base terrestre, distancias locales lunares estación↔satélite y distancias entre satélites para recuperar, a la vez, la posición 3D de una estación de superficie lunar, las posiciones de una pequeña constelación y el desfase de reloj de cada elemento a partir de una verdad inyectada. El resultado principal honesto, que el VLBI hace observable la posición 3D completa de la estación allí donde la medición de distancia solo local lunar deja una dirección débilmente observada, se informa como el contraste de error de estación con y sin VLBI. Recuperación simulada en lazo cerrado MODELLED (la verdad comparte el modelo de observación), determinista (con semilla), NO validada con datos reales; sin propagación de modelo de fuerzas dentro del resolutor; sin TRL/herencia/respaldo de ninguna agencia.

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-6419390eeae4 = Una ejecución de <c1/> se resume así: lunar-joint-od-clock | { "3" } sat., { "6" } estaciones terrestres | error 3D de estación con VLBI { "3.54" } m frente a solo distancia { "2184.02" } m ({ "617.5" }× más preciso) | RMS de posición de sat. { "2.20" } m | error de reloj de estación { "2.87e-10" } s | obs 40/16 parám.

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-be3bcad756cc = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-ef164af52468 = El ejemplo <c1/> establece, entre otros:

# text
seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

# attr:alt
seg-cfa051b87e59 = El gráfico que el motor escribe para scenarios/lunar-joint-od-clock.toml, tipo de escenario lunar-joint-od-clock

# text
seg-4c6914c162d1 = <b>VALIDATED</b> Fusión por lotes de VLBI + distancia local lunar + distancia entre satélites para recuperar posiciones y relojes de la estación y de la constelación. Referencia independiente (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq con LAPACK gelsd, numpy.linalg.inv; BSD-3) recalcula cada paso de Gauss-Newton, la solución convergida de mínimos cuadrados ponderados, las sigmas formales y el error de la estación sobre los jacobianos y las observaciones confirmados de seis redes simuladas, preregistrado (5094bc31) a max({ "1e-8" }, { "100" } kappa eps) relativo. La primera ejecución falló en la red sin VLBI ({ "6.1e-7" } frente a { "1e-8" }, una ecuación normal in

# text
seg-5b3f6008f5a7 = <b>VALIDATED</b> Información de Fisher M=HᵀWH, cota inferior de Cramér–Rao, rango de observabilidad / espacio nulo del defecto de datum (pseudoinversa de Moore–Penrose) y diseño de experimentos óptimo D/A/E/T. Referencia independiente (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, respaldado por LAPACK): una autoridad independiente de terceros que calcula los mismos autovalores unívocamente definidos, la covarianza de Cramér–Rao σ²(XᵀX)⁻¹ y los factores de dilución de precisión de GNSS con un algoritmo distinto (divide y vencerás de LAPACK + LU) del barrido cíclico de Jacobi y la pseudoinversa espectral de Kshana; coincidencia hasta { "1e-9" }. La misma clase de biblioteca externa ya valida el D

# text
seg-af12da412a10 = <b>MODELLED</b> Observabilidad por información de Fisher de la solución lunar conjunta: sin líneas base terrestres el datum de marco absoluto está en el espacio nulo de HᵀWH (posición de la estación inobservable. Referencia independiente (InternalConsistency): Estructura analítica del defecto de datum: el modo inobservable de marco absoluto está en el espacio nulo de la información de Fisher (forma cerrada), el umbral de rango coincide con la justificación de diseño publicada de 3 estaciones, y el estimador alcanza la CRLB resultante en Monte Carlo. La propia geometría lunar es una red representativa (no unas efemérides voladas), por lo que la fila sigue siendo MODELLED; el motor subyacente de FIM/CRLB se contrasta con

# text
# c1: kshana kinds --json
seg-865ba2668582 = Recuperación simulada en lazo cerrado MODELLED (la verdad comparte el modelo de observación), determinista (con semilla), NO validada con datos reales; sin propagación de modelo de fuerzas dentro del resolutor; sin TRL/herencia/respaldo de ninguna agencia. (catálogo de tipos de escenario (<c1/>))

# text
seg-a0d4350a1c66 = Honestidad: recuperación simulada en lazo cerrado MODELLED. Una verdad inyectada se transforma en observables sintéticos mediante el MISMO modelo de geometría que invierte el resolutor, se añade ruido gaussiano con semilla, y el estimador recupera la verdad inyectada dentro del ruido. La referencia independiente es la coherencia interna (recuperación de la verdad + realismo de covarianza NEES), NO una validación con datos reales. No hay propagación de modelo de fuerzas dentro del resolutor: los sat (comentario del archivo de escenario, líneas { "24" } a { "29" })

# text
seg-1465694e7e4f = La observabilidad absoluta de estaciones lunares (defecto de datum) es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-e6962535ee72 = <s1>Anterior</s1>lunar-jamming

# text
seg-2ef5c8112d1b = <s1>Siguiente</s1>lunar-llr-datum
