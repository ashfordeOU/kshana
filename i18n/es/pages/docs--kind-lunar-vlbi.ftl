# docs--kind-lunar-vlbi: translations (es)

# text
seg-c1ce24cd6008 = analítico

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-df90e5910fb4 = h

# text
seg-3843825d0733 = us

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Derivadas parciales del retardo acumuladas sobre un calendario de líneas base × épocas en una matriz de información de Fisher, invertida hasta la covarianza de las coordenadas de estación y la sigma de estación por coordenada, en sustitución de un vínculo de equipartición isótropo supuesto a partir de

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Una tercera opción de datum, <c1/>, que mantiene fijas todas las estaciones terrestres y estima únicamente las coordenadas de la BALIZA fijas a la Luna: la configuración para la que realmente se cita la incertidumbre de un punto de la superficie lunar, dado que las coordenadas de las estaciones terrestres

# text
# c1: docs/kinds/by-kind/lunar-vlbi.md
seg-afeb6e26c5ad = Fuente: <c1/>

# text
# c1: lunar-vlbi
seg-6d1a32afd780 = <c1/> (tipo de escenario)

# text
seg-e01f77d493a0 = Observable modelada del retardo de VLBI geodésico lunar: una línea base terrestre (dos estaciones en tierra, GCRS) observa una señal unidireccional de una baliza de superficie lunar de clase NovaMoon. Emite el retardo de campo cercano como diferencia de dos distancias, su tasa y la corrección de campo cercano por curvatura del frente de onda a lo largo de un pase, contrastada con la observable Δ-DOR de onda plana del mismo código en el límite de campo lejano, con derivadas parciales verificadas por diferencias finitas. La vía analítica por defecto es MODELLED y lleva las salvedades de coherencia de marcos, de movimiento polar xp=yp={ "0" } y de onda plana frente a campo cercano. Si se establecen planetary_kernel_path, earth_orientation_kernel_path y moon_orientation_kernel_path, se ejecuta en su lugar la vía de núcleos (DE440, MOON_PA_DE440, ITRF93; tiempos de luz baricéntricos convergidos; añade las derivadas parciales de la baliza y de la estación de la época), cuyo retardo newtoniano y cuyas derivadas parciales coinciden con los tiempos de luz convergidos de NAIF SPICE hasta { "0.06" } ps y { "7.4e-9" }. No validado con datos reales de VLBI.

# text
# c1: scenarios/lunar-vlbi.toml
seg-92227c085867 = Una ejecución de <c1/> se resume así: lunar-vlbi | línea base { "10727" } km | distancia a la baliza { "402900" } km | retardo -10049.126 µs (tasa { "1.312e-6" } s/s) | campo cercano { "58.9" } µs | { "13" } muestras a lo largo de { "6.0" } h

# text
# c1: station1_lat_deg
# c2: station1_lon_deg
# c3: station1_alt_m
# c4: station2_lat_deg
# c5: station2_lon_deg
# c6: station2_alt_m
# c7: beacon_lat_deg
# c8: beacon_lon_deg
# c9: beacon_alt_m
# c10: epoch_year
# c11: epoch_month
# c12: epoch_day
# c13: horizon_hours
# c14: step_min
# c15: planetary_kernel_path
# c16: earth_orientation_kernel_path
# c17: moon_orientation_kernel_path
seg-1a38a07a0d70 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

# text
# c1: scenarios/lunar-vlbi.toml
seg-11450a55fc9d = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-07d97fc1abac = El gráfico que el motor genera para scenarios/lunar-vlbi.toml, tipo de escenario lunar-vlbi

# text
seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-61f431e422e5 = <b>MODELLED</b> Retardo de VLBI de campo cercano para una línea base terrestre que observa una baliza lunar + derivadas parciales

# text
seg-7342b50d34e4 = <b>VALIDATED</b> Retardo de VLBI de campo cercano para una línea base terrestre que observa una baliza lunar, con derivadas parciales de la baliza y de la estación, en la vía de núcleos (lunar_vlbi::KernelGeometry): Tierra y Luna de DE440, ejes principales lunares de DE440, orientación terrestre ITRF93 con UT1 y Pruebas: <a1>naif_kernel_reader_check.rs</a1>.

# text
seg-5547f1f662d3 = y { "2" } más en la matriz.

# text
seg-1461c84350d8 = <b>MODELLED</b> Retardo de VLBI de campo cercano para una línea base terrestre que observa una baliza lunar + derivadas parciales. Referencia independiente (ReferenceImpl): delta_dor de onda plana (del mismo código) en el límite de campo lejano; derivadas parciales por diferencias finitas. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): frente a los tiempos de luz convergidos de ANISE { "0.10" } a través de DE440 ({ "75" } retardos el 2024-01-01 sobre tres líneas base de la DSN, generados por xval/anise-lunar-od sin código de Kshana), ningún retardo queda dentro de la tolerancia de { "1" } ps. La mayor diferencia es de { "24" } µs, procedente del centro lunar analítico (a unos { "200" } km de DE

# text
# c1: kshana kinds --json
seg-b41c162b015f = La vía analítica por defecto es MODELLED y lleva las salvedades de coherencia de marcos, de movimiento polar xp=yp={ "0" } y de onda plana frente a campo cercano. (catálogo de tipos (<c1/>))

# text
seg-0beac99bb095 = Honestidad: MODELLED, NO validado con datos reales de VLBI. Se omite el movimiento polar (xp = yp = { "0" }), de modo que las posiciones inerciales de las estaciones llevan un error de marco de unos pocos metros; la baliza mezcla una serie de la Luna de ecuador medio de la fecha con un desfase fijo al cuerpo en ICRF (jd_tdb ~ jd_tt), una incoherencia de marcos inferior a la fidelidad del modelo; sin iteración del tiempo de luz, medios ni aberración más allá del Shapiro diferenciado. Sin TRL, herencia de vuelo ni respaldo de agencia alguna (comentario del archivo de escenario, líneas { "17" } a { "21" })

# text
seg-58b64e5ff3db = El VLBI geodésico lunar es MODELLED, no validado: se comprueba frente a una implementación distinta dentro de este mismo código, independiente de la unidad sometida a prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-04089c4d6fbe = <s1>Anterior</s1>lunar-vlbi-fim

# text
seg-6adcdfbaa8be = <s1>Siguiente</s1>mars-pnt
