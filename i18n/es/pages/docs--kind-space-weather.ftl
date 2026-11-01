# docs--kind-space-weather: translations (es)

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Tipo de escenario del motor v{ $version }, familia <a1>Mediciones GNSS, posicionamiento e integridad</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-f6b7ca020692 = Página de familia: <a1>Mediciones GNSS, posicionamiento e integridad</a1>

# text
# c1: docs/kinds/by-kind/space-weather.md
seg-95f8bd8e0078 = Fuente: <c1/>

# text
# c1: space-weather
seg-24c21b5b0cc3 = <c1/> (tipo de escenario)

# text
seg-5f25c5b71f0c = Modelo del entorno de clima espacial: índices de actividad solar (F10.7/F10.7a) y geomagnética (Kp, con la tabla definicional Kp↔ap), la temperatura exosférica de Jacchia-1971 que estos determinan (validada frente a los mínimos, medios y máximos solares publicados), y la densidad neutra termosférica de Jacchia-1971 a la temperatura exosférica media diurna frente al perfil estático sin actividad en un conjunto de altitudes: la dependencia de la densidad respecto del ciclo solar que omite la atmósfera estática. MODELLED: la densidad coincide con las densidades derivadas de acelerómetros (TOLEOS CHAMP y GRACE) dentro de un factor { "2" } en el máximo solar, pero es unas 1.7x demasiado densa en el mínimo solar de { "2008" }.

# text
# c1: scenarios/space-weather.toml
seg-f2c2860db799 = Una ejecución de <c1/> se resume así: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; densidad x1.49 a { "300" } km (MODELLED)

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6bb05c41eba2 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-weather.toml
seg-c367f1aacd0b = El ejemplo <c1/> establece, entre otros:

# text
seg-02dc0d42fb21 = sfu

# text
seg-1dd966268e12 = { "2" } nT

# text
seg-d245f215f331 = Etiqueta del resultado (la del motor): MODELLED — índices solares y geomagnéticos, temperatura exosférica de Jacchia-71 y densidad estática de Jacchia-71 a la temperatura media diurna

# attr:alt
seg-c1c6f2f73fb5 = El gráfico que el motor genera para scenarios/space-weather.toml, tipo de escenario space-weather

# text
seg-15587da59e8e = <b>MODELLED</b> Índices solares y geomagnéticos (tabla definicional Kp↔ap), la temperatura exosférica de Jacchia-1971 y la densidad termosférica de Jacchia { "1971" } (SAO Special Report { "332" }: perfiles de difusión estáticos que reproducen su Tabla { "7" }, con la variación diurna, geomagné

# text
seg-f8eef6eabfb2 = <b>MODELLED</b> Índices solares y geomagnéticos (tabla definicional Kp↔ap), la temperatura exosférica de Jacchia-1971 y la densidad termosférica de Jacchia { "1971" } (SAO Special Report { "33" }. Referencia independiente (ExternalDataset): Tabla definicional Kp↔ap + forma cerrada de la temperatura exosférica de Jacchia-1971 (coincidente hasta <{ "1" } K con los valores de anclaje publicados, tests/space_weather_reference.rs); la densidad se caracteriza frente a pymsis NRLMSISE-00 (un modelo independiente del NRL): la oscilación del ciclo solar a { "800" } km es 10.4x frente a 13.6x de NRLMSISE-00. Revisión { "0.30" }: el factor de actividad de primer orden calibrado se sustituyó por Jacchia { "1971" } (densidad del escenario por defecto a { "40" }

# text
# c1: label
seg-72979b637644 = MODELLED — índices solares y geomagnéticos, temperatura exosférica de Jacchia-71 y densidad estática de Jacchia-71 a la temperatura media diurna (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-0306ee022298 = MODELLED: la densidad coincide con las densidades derivadas de acelerómetros (TOLEOS CHAMP y GRACE) dentro de un factor { "2" } en el máximo solar, pero es unas 1.7x demasiado densa en el mínimo solar de { "2008" }. (catálogo de tipos (<c1/>))

# text
seg-b86a312077b5 = ALCANCE HONESTO: MODELLED. La conversión Kp<->ap es la tabla definicional de la IAGA y la temperatura exosférica está validada frente a las magnitudes publicadas de mínimo, medio y máximo solar, pero la corrección de la densidad es un acoplamiento de altura de escala de PRIMER ORDEN CALIBRADO: capta el signo, la monotonía y el orden de magnitud correctos, NO la exactitud absoluta de una atmósfera validada con datos (NRLMSISE-00). Ejecución: kshana scenarios/space-weath (comentario del archivo de escenario, líneas { "10" } a { "15" })

# text
seg-10cf16c12a2a = El entorno de clima espacial y la densidad termosférica determinada por la actividad son MODELLED, no validados: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-3dd29f8fba14 = <s1>Anterior</s1>space-packet

# text
seg-ff9d9a41692b = <s1>Siguiente</s1>spectrum
