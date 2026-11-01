# docs--kind-eo-coverage: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-98151954f217 = false

# text
seg-8e62cc4af6ea = Página de tema: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/eo-coverage.md
seg-fc32bcd32dec = Fuente: <c1/>

# text
# c1: eo-coverage
seg-d72c017ca1fa = <c1/> (tipo de escenario)

# text
seg-47b4aea6ed01 = Huella y geometría de cobertura de una carga útil de observación de la Tierra (triángulo espacial de SMAD): radio angular de la Tierra, anchura de franja, distancia de muestreo en el suelo en el nadir, acceso máximo fuera del nadir, periodo circular, periodo nodal con J2 y separación de trazas en tierra en el ecuador con un indicador de cobertura contigua, para una altitud orbital, una inclinación (heliosíncrona por defecto) y un FOV/IFOV del sensor. Geometría MODELLED de Tierra esférica (sin radiometría/MTF/atmósfera/vibración/destello); separación de nodos R_e·(ω − Ω̇)·T_nodal con tasas seculares de J2 de primer orden.

# text
# c1: scenarios/eo-coverage.toml
seg-105bb8a3c33f = Una ejecución de <c1/> se resume así: eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> { "184" } km swath, { "9.8" } m nadir GSD, access to { "745" } km off-nadir; node spacing { "2752" } km (gapped) (MODELLED)

# text
# c1: altitude_km
# c2: half_fov_deg
# c3: ifov_microrad
# c4: max_off_nadir_deg
# c5: inclination_deg
seg-609c5b7bc6f1 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/eo-coverage.toml
seg-14f19837e422 = El ejemplo <c1/> establece, entre otros:

# text
seg-834408a40783 = min

# text
seg-ade2ba71a96c = Etiqueta del resultado (la del motor): MODELLED — geometría de triángulo espacial de Tierra esférica; franja/GSD/acceso son geométricos (sin radiometría/MTF/atmósfera/vibración/destello), la separación de trazas en tierra es R_e·(ω − Ω̇)·T_nodal con tasas seculares de J2 de primer orden

# attr:alt
seg-c2a8332f2ee2 = El gráfico que escribe el motor para scenarios/eo-coverage.toml, tipo de escenario eo-coverage

# text
seg-d86d43628cf3 = <b>VALIDATED</b> Geometría del triángulo espacial de SMAD: radio angular de la Tierra, anchura de franja, GSD en el nadir, acceso máximo fuera del nadir y periodo circular, más el periodo nodal de J2 de primer orden (eo_payload::j2_nodal_period) y la separación de trazas en tierra en el ecuador R_e (omega_ Pruebas: <a1>eo_payload_coverage_reference.rs</a1>.

# text
seg-9938f1de9eb8 = <b>VALIDATED</b> Geometría del triángulo espacial de SMAD: radio angular de la Tierra, anchura de franja, GSD en el nadir, acceso máximo fuera del nadir y periodo circular, más el periodo nodal de J2 de primer orden (. Referencia independiente (ExternalDataset): Orekit { "12.2" } (Apache-2.0) y GeographicLib { "2.1" } (MIT), ambos ejecutados como programas separados, preregistrados (766823f3) antes del cambio del motor y de cualquier ejecución de la referencia independiente: magnitudes de la esfera dentro de { "1e-9" } relativo (peor caso: radio angular { "5.4e-16" }, franja { "7.0e-13" }, acceso { "1.9e-14" }), periodo { "1e-12" } ({ "1.6e-16" }), GSD en el nadir { "1e-7" } ({ "2.9e-10" }), el periodo nodal de J2 y la separación de nodos dentro del { "0.1" } % de una propagación numérica de J2 de Orekit con un detector de nodos ({ "1" }

# text
# c1: label
seg-45625167e59f = MODELLED — geometría de triángulo espacial de Tierra esférica; franja/GSD/acceso son geométricos (sin radiometría/MTF/atmósfera/vibración/destello), la separación de trazas en tierra es R_e·(ω − Ω̇)·T_nodal con tasas seculares de J2 de primer orden (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-cf22f13c78d3 = Geometría MODELLED de Tierra esférica (sin radiometría/MTF/atmósfera/vibración/destello); separación de nodos R_e·(ω − Ω̇)·T_nodal con tasas seculares de J2 de primer orden. (catálogo de tipos de escenario (<c1/>))

# text
seg-153325fb00d3 = ALCANCE HONESTO: solo geometría MODELLED de Tierra esférica -- sin modelo de radiometría / MTF / atmósfera / vibración de apuntamiento / destello solar. La separación de trazas en tierra es R_e*(omega - dOmega/dt)*T_nodal con tasas seculares de J2 de primer orden; la inclinación por defecto es la heliosíncrona para la altitud. Ejecución: kshana scenarios/eo-coverage.toml (comentario del archivo de escenario, líneas { "7" } a { "11" })

# text
seg-5dc02c3d10f7 = <s1>Anterior</s1>entry-heating

# text
seg-33f408d48d13 = <s1>Siguiente</s1>eo-radiometry
