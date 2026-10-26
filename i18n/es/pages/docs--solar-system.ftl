# docs--solar-system: translations (es)

# attr:aria-label, text
seg-31a05429b836 = Cuerpos

# text
seg-1c78d5337e16 = Plutón

# text
seg-6cb7a787ac67 = Referencias

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-60cd077d82a7 = Modelo

# text
seg-c5ce76c91ff7 = Etiqueta

# text
seg-430edd66bda0 = No modelado

# text
seg-7670cf4ceda3 = Valor por defecto

# text
seg-e0eb14018b2c = como arriba

# text
seg-3dbc7ff9f5ab = Tabla

# text
# c1: docs/SOLAR-SYSTEM.md
seg-9fe60d39f2db = Fuente: <c1/>

# text
seg-c44439432020 = Sistema solar y posicionamiento en torno a otros cuerpos

# text
seg-4d4ee55b5fb4 = Dos tipos de escenario funcionan más allá del sistema Tierra-Luna:

# text
# c1: solar-system
seg-fa202376da31 = <c1/> informa de todos los cuerpos del catálogo en una época: posición y velocidad, constantes físicas, tiempo de luz y distancia desde un cuerpo observador, y una trayectoria orbital.

# text
# c1: body-pnt
seg-9859aabbb4f4 = <c1/> sitúa a un usuario de navegación (un orbitador o un módulo de aterrizaje en superficie) alrededor de cualquier cuerpo del catálogo distinto del Sol y la Tierra, con una constelación de navegación local y una distancia opcional de espacio profundo desde la Tierra.

# text
# c1: constellation-design
seg-ec582fa8f67f = El tipo <c1/> usa el mismo catálogo para construir constelaciones alrededor de cualquiera de estos cuerpos (<a1>CONSTELLATION-DESIGN.md</a1>).

# text
# c1: src/body.rs
# c2: src/ephem.rs
# c3: src/ephem_provider.rs
# c4: AnalyticSolarSystem
# c5: src/solar_system.rs
# c6: src/body_pnt.rs
# c7: src/radiometric.rs
# c8: tests/solar_system_horizons_reference.rs
seg-31f150c83173 = Código: <c1/> (el catálogo y sus constantes), <c2/> (las efemérides analíticas), <c3/> (<c4/>, el proveedor que leen ambos tipos), <c5/> y <c6/> (los tipos) y <c7/> (tiempo de luz, distancia bidireccional y retardo de Shapiro). Pruebas: <c8/> y las pruebas unitarias de cada módulo.

# text
seg-3ce9aab4916e = El catálogo

# text
# c1: src/body.rs
# c2: J2
seg-35cd9ebaf04e = Dieciocho cuerpos: el Sol, los ocho planetas, Plutón, la Luna, Fobos, Deimos, las cuatro lunas galileanas (Ío, Europa, Ganimedes, Calisto) y Titán. Los nombres se reconocen sin distinguir mayúsculas de minúsculas. Para cada uno, <c1/> contiene el parámetro gravitacional GM, los radios medios ecuatorial y volumétrico, el segundo armónico zonal <c2/> y su radio de referencia cuando se ha publicado uno, y el modelo de polo y meridiano origen de la Unión Astronómica Internacional (IAU) (periodo de rotación sidéreo, negativo para un rotador retrógrado). Cada valor cita su fuente en el código.

# text
seg-525b8b29345d = De dónde proceden las posiciones

# text
seg-0fd4c3af55ba = De Mercurio a Saturno y la Tierra, a partir de la Tabla { "1" } (de { "1800" } d. C. a { "2050" } d. C.)

# text
seg-9d820791a27b = Elementos keplerianos del Laboratorio de Propulsión a Chorro (JPL) de Standish y Williams, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

# text
seg-d8549658ae99 = Los ocho planetas, a partir de las Tablas 2a/2b (de { "3000" } a. C. a { "3000" } d. C.)

# text
seg-1f0b417c3809 = los elementos de largo intervalo de la misma página

# text
seg-bfe1c209044a = Urano y Neptuno, a partir de la Tabla { "1" }

# text
seg-ba5dfdd2de52 = la fila de la Tabla { "1" } de { "1992" } (solo de { "1800" } d. C. a { "2050" } d. C.; la página actual la eliminó y no indica ningún error)

# text
seg-001ca2ad22e1 = La Luna

# text
seg-6ff6068aeacf = las series lunares de Montenbruck y Gill, separando el baricentro Tierra-Luna

# text
seg-f906cffa45a2 = Fobos, Deimos, las lunas galileanas, Titán

# text
seg-6ba84144ad88 = elementos medios del JPL con el modelo de rotación de la IAU

# text
# c1: table = "auto"
# c2: table1
# c3: table2
# c4: epoch_jd_tdb
seg-d5640ad2cd08 = <c1/> (el valor predeterminado) toma la Tabla { "1" } entre { "1800" } d. C. y { "2050" } d. C. y las Tablas 2a/2b fuera de ese intervalo; <c2/> y <c3/> fuerzan una de ellas. Plutón fuera de su tabla es un error, no una extrapolación. La época es una fecha y hora ISO { "8601" } en Tiempo Universal Coordinado (UTC), convertida a través del Tiempo Terrestre (TT) con los segundos intercalares al Tiempo Dinámico Baricéntrico (TDB), o una fecha juliana TDB dada directamente con <c4/>.

# text
# c1: tests/fixtures/solar_system/
# c2: cargo test --test solar_system_horizons_reference -- --nocapture
seg-912a2223e495 = La referencia independiente es JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, Development Ephemeris DE441), con los vectores consultados confirmados en <c1/>. Una fila de planeta está VALIDATED cuando permanece dentro del doble del error nominal propio de la página de Standish. Medido por <c2/>:

# text
seg-d8bbd5e4f483 = Tabla { "1" }, de Mercurio a Saturno y el baricentro Tierra-Luna, { "12" } épocas de { "1800" } a { "2049" }: peor caso { "1.87" } veces el error nominal (la distancia de Saturno).

# text
seg-18568cec6c91 = Tablas 2a/2b, los ocho planetas, { "15" } épocas desde aproximadamente { "1000" } a. C. hasta { "2500" } d. C.: peor caso { "1.71" } veces (la distancia de Marte).

# text
seg-7f3aa4a24e8f = Urano y Neptuno de la Tabla { "1" } superan las cifras de la página frente a DE441: { "2.04" } y { "5.16" } veces el error nominal de longitud. Están fijados por debajo de seis veces y siguen siendo MODELLED.

# text
seg-41d2f404224b = Plutón: dentro de { "39.2" } segundos de arco en longitud y { "1.14e9" } m en distancia.

# text
seg-11c31908ba69 = Lunas, peor ángulo visto desde el planeta entre { "2000" } y { "2040" }: Fobos { "5.65" } grados, Deimos { "0.38" }, Ío { "0.40" }, Europa { "1.63" }, Ganimedes { "0.22" }, Calisto { "0.27" }, Titán { "3.31" }. La Luna geocéntrica: { "0.046" } grados.

# text
seg-24d36a3ce8d4 = Velocidades de los planetas: peor error relativo { "3.72e-3" } de la velocidad (MODELLED).

# text
seg-0bae9b8d09ea = La Luna y las siete lunas se miden con umbrales fijados, pero no existe una cota publicada con la que validarlas, por lo que son MODELLED.

# text
# c1: xval/
# c2: EphemerisProvider
seg-2cf791a940ea = Las efemérides analíticas no necesitan ningún archivo de núcleo. Un núcleo de las Development Ephemeris del JPL (posiciones de grado DE) solo lo leen los crates de validación cruzada independientes de <c1/>, mediante el mismo rasgo <c2/>; el crate principal no depende de ellos.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: [[links]]
seg-5bff2c54125b = Entradas: <c1/> (valor predeterminado 2026-01-01T00:{ "00" }:{ "00" }) o <c2/>; <c3/> (por defecto los dieciocho); <c4/> (por defecto la Tierra); <c5/> por órbita (de { "8" } a { "2000" }, por defecto { "120" }); <c6/>; y cualquier número de <c7/>, cada uno recibido en la época.

# text
seg-5787ece2c791 = Por cuerpo, el resultado da su clase y su cuerpo padre, el identificador del Centro de Navegación e Información Auxiliar de la NASA (NAIF), la posición y velocidad heliocéntricas en el Marco Internacional de Referencia Celeste (ICRF, ecuatorial J2000) en metros y metros por segundo, la longitud, latitud y distancia eclípticas, la posición relativa a su cuerpo padre, el periodo orbital, las constantes anteriores, el polo y el meridiano origen en la época, el error nominal de Standish cuando existe, su etiqueta y su cadena de método, y una trayectoria orbital durante una revolución (heliocéntrica para un planeta, centrada en el cuerpo padre para una luna; un solo punto para el Sol). El enlace desde el observador, y cada enlace adicional, da:

# text
seg-36bad4b7b4ba = el tiempo de luz newtoniano unidireccional, resuelto con el resolvedor radiométrico de punto fijo del tiempo de luz con el transmisor en su posición retardada, y la distancia unidireccional correspondiente;

# text
seg-c5602eb76a05 = el tiempo de luz y la distancia bidireccionales;

# text
seg-dab8e2db61d3 = el retardo de Shapiro del Sol, informado por separado y no sumado;

# text
seg-90d00587a59f = el ángulo de separación del Sol.

# text
seg-4c172f9f7cf6 = El tiempo de luz está VALIDATED frente al tiempo de luz unidireccional que informa Horizons: Marte y Júpiter hasta el centro de la Tierra en cuatro épocas de { "2000" } a { "2040" }, peor error { "0.070" } s para Marte frente a un umbral de { "0.207" } s y { "1.31" } s para Júpiter frente a { "4.04" } s. El umbral es el doble de la suma de los errores de distancia de Standish del objetivo y del baricentro Tierra-Luna, dividido por la velocidad de la luz: el tiempo de luz no puede ser mejor que las posiciones. Es el tiempo de luz geométrico newtoniano, no un observable relativista ni corregido por plasma.

# text
# c1: scenarios/solar-system-tour.toml
seg-4f8cd6aef754 = El <c1/> incluido informa de los dieciocho cuerpos en 2026-09-28T00:{ "00" }:{ "00" } con trayectorias de 180 puntos, y añade los enlaces de Marte a Júpiter (unidireccional { "2193.539" } s), de Saturno a la Tierra ({ "4212.176" } s) y de Europa a Júpiter ({ "2.218" } s).

# text
seg-d22cc535f04b = Un usuario navega alrededor de un cuerpo elegido por nombre (cualquier cuerpo del catálogo salvo el Sol y la Tierra, que el tipo rechaza) con dos clases de medida:

# text
# c1: planes
# c2: sats_per_plane
# c3: phasing_f
# c4: J2
seg-9eeb7f77aec7 = pseudodistancias unidireccionales de una constelación de navegación Walker delta alrededor del cuerpo (<c1/> por <c2/>, desfase entre planos <c3/>), volada como órbitas de dos cuerpos con la deriva secular <c4/> propia del cuerpo; el reloj del usuario es desconocido, por lo que estas filas llevan una columna de sesgo de reloj;

# text
# c1: [earth_link]
seg-56ac318f6f27 = opcionalmente una distancia bidireccional desde el centro de la Tierra (<c1/>), que no necesita reloj de usuario y se informa como una distancia unidireccional con su propio ruido. La dirección y la distancia de la Tierra proceden de la efeméride analítica en cada época.

# text
# c1: mars-pnt
seg-551d44492aae = Una línea de visión queda bloqueada cuando pasa por dentro del radio medio del cuerpo (la prueba de cuerda del tipo <c1/>), y un usuario en superficie necesita además la máscara de elevación. En cada época la ejecución calcula la dilución de la precisión geométrica y de posición (GDOP, PDOP) de la constelación por sí sola, la incertidumbre formal de posición de una sigma con y sin la fila de la Tierra, y una solución de mínimos cuadrados de Gauss-Newton con semilla en cada caso, de modo que el informe muestra lo que añade el enlace de espacio profundo.

# text
seg-6f1161567330 = nivel superior

# text
seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, una oposición de Marte

# text
seg-0b688042ed44 = { "86 400" } s, { "600" } s

# text
# c1: orbiter
# c2: surface
seg-c7b3aaecd6e2 = <c1/> (o <c2/>)

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: u0_deg
# c5: eccentricity
seg-c452a6f7a9d4 = orbitador: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
seg-67f7b23bf604 = { "400" } km, { "75" } grados, { "0" }, { "0" }, { "0" }

# text
# c1: lat_deg
# c2: lon_deg
# c3: height_m
seg-b412b65733d8 = superficie: <c1/>, <c2/>, <c3/>

# text
seg-7639d2583131 = tres radios medios

# text
seg-fe4a8d9da406 = { "60" } grados

# text
seg-7ac449fb9569 = { "1" } m

# text
# c1: mask_deg
seg-128c4a5edd9b = <c1/> (usuario en superficie)

# text
seg-3d4b760f6ed6 = { "10" } grados

# text
seg-498493929023 = verdadero, { "1" } m

# text
# c1: raan_deg
# c2: u0_deg
seg-18e477dc7f02 = <c1/> es la ascensión recta del nodo ascendente en el sistema ecuatorial del cuerpo y <c2/> el argumento de latitud en la época.

# text
seg-a743b0b5e668 = Los dos escenarios incluidos, tal como se ejecutan con kshana { "0.36" } (matemática portable, igual en todas las plataformas):

# text
seg-b24010bdb302 = Usuario

# text
seg-cb9cd741ba85 = orbitador, { "300" } km, { "93" } grados

# text
seg-fa11e61f0d1d = superficie, { "20" } grados N, { "60" } grados E

# text
seg-e17a9ae6905c = Relés

# text
seg-359db3c9ad19 = { "12" } a { "10 000" } km, { "60" } grados

# text
seg-1bb041045be4 = { "12" } a { "4500" } km, { "55" } grados, máscara de { "10" } grados

# text
seg-604aefd62668 = Duración

# text
seg-825603e2fbed = un sol, { "296" } épocas

# text
seg-372159825c11 = { "306 822" } s, { "171" } épocas

# text
seg-132e3bbcc94c = Tiempo de luz con la Tierra, de ida / de ida y vuelta

# text
seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

# text
seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

# text
seg-d0f05f440103 = Tierra a la vista

# text
seg-d7ad84776ec6 = { "0.811" } de las épocas

# text
seg-44bf83b16660 = Disponibilidad, solo relés / con la distancia a la Tierra

# text
seg-07e0a8499670 = PDOP mediano

# text
seg-e802f5920237 = Error RMS de la solución de posición, solo relés / con la distancia a la Tierra

# text
seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

# text
seg-873187e2b016 = { "112.742" } m / { "86.499" } m

# text
seg-bcba58871d0b = Sigma formal mediana, solo relés / con la distancia a la Tierra

# text
seg-536757d9f141 = { "1.375" } m / { "1.304" } m

# text
seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

# text
# c1: docs/revisions/STUDIO15-portable-math-rebaseline.md
seg-67d3d30060ad = (RMS: valor cuadrático medio.) Una época de Europa (t = { "16 200" } s) está en el borde de la disponibilidad, donde el último bit de un radio calculado decide si se obtiene su solución con la distancia a la Tierra. Antes de la { "0.36" }, lo decidía la biblioteca matemática del anfitrión, de modo que el mismo escenario imprimía { "0.719" } y { "86.147" } m en Linux x86-64 y { "0.725" } y { "85.800" } m en macOS arm64 para las dos cifras «con la distancia a la Tierra». Desde la { "0.36" }, toda función trascendente la calcula la biblioteca matemática portable, la época se resuelve de una única manera en todas las plataformas (nativa y WebAssembly dan los mismos bytes) y las cifras son { "0.713" } y { "86.499" } m (<a1><c1/></a1>). En torno a Europa, la distancia a la Tierra eleva la disponibilidad de { "0.480" } a { "0.713" } de las épocas. Donde la Tierra nunca supera el limbo, el enlace no aporta nada: un módulo de aterrizaje a { "89.5" } grados S en la Luna bajo una capa de 12 satélites de relés a { "5000" } km tiene la Tierra a la vista en { "0" } de { "145" } épocas, y sus errores son los mismos con el enlace y sin él.

# text
seg-41507568efb8 = <b>MODELLED.</b> Las órbitas de los relés ignoran los terceros cuerpos (no se modela la atracción de Júpiter sobre los relés alrededor de Europa), el ruido es gaussiano con los niveles indicados y el modelo de medida es instantáneo, no con retardo de tiempo de luz. Lo que se comprueba: el periodo de los relés frente a la tercera ley de Kepler para el cuerpo, un orbitador que conserva su radio y un módulo de aterrizaje en la superficie, que la distancia a la Tierra nunca empeore la incertidumbre formal, que los errores de las soluciones con semilla concuerden con la sigma formal (valor cuadrático medio del error sobre sigma en [{ "0.6" }, { "1.5" }]) y una ejecución determinista. Nada de esto son datos de navegación de una misión.

# text
# c1: ephemeris
seg-b78c9e331a43 = El tipo <c1/>

# text
# c1: ephemeris
# c2: eop_finals2000a
# c3: finals2000A
# c4: src/ephemeris.rs
seg-b9f40c641a49 = A pesar del nombre, <c1/> es un tipo de satélite terrestre: un satélite, a partir de un conjunto de elementos de dos líneas (TLE) mediante el propagador de Perturbaciones Generales Simplificadas { "4" } (SGP4) o a partir de una órbita analítica, sobre una malla temporal. En cada paso emite el estado inercial (posición y velocidad) en el sistema de ecuador verdadero y equinoccio medio (TEME) y en el Sistema Celeste de Referencia Geocéntrico (GCRS), la posición fija a la Tierra, el punto subsatélite del Sistema Geodésico Mundial { "1984" } (WGS { "84" }) y, para una estación terrestre opcional, acimut, elevación, distancia y velocidad de distancia. <c2/> toma el texto de un archivo <c3/> del Servicio Internacional de Rotación de la Tierra y Sistemas de Referencia (IERS) para UT1−UTC y movimiento polar por época. Código: <c4/>.

# text
seg-1babcba7b4ba = Términos relativistas de tiempo de luz más allá del retardo de Shapiro informado por separado, y el retardo por plasma solar.

# text
seg-0c49dfc777ca = Posiciones mejores que la precisión de Standish y de elementos medios indicada más arriba; el crate principal no tiene lector de núcleos.

# text
# c1: body-pnt
# c2: constellation-design
seg-18d925e53ce0 = Perturbaciones de terceros cuerpos en los relés de <c1/> y en las órbitas de <c2/>.

# text
seg-3968ed54e3fe = Terreno en cualquier cuerpo: un cuerpo es su esfera media.

# text
# c1: solar-system
# c2: body-pnt
seg-4650526c532e = Exportaciones de interoperabilidad: CZML, KML y GeoJSON describen posiciones en torno a la Tierra, por lo que los escenarios <c1/> y <c2/> no exportan ninguna (<a1>INTEROP.md</a1>).

# text
seg-cb7e3d4bf5aa = E. M. Standish y J. G. Williams, "Keplerian Elements for Approximate Positions of the Major Planets", JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

# text
seg-aaf6a1f91c1a = O. Montenbruck y E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

# text
seg-8b7aa3bb95f0 = B. A. Archinal et al., "Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }", <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

# text
seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

# text
seg-e95a41f0ded7 = <s1>Anterior</s1>Validación del modelo de fuerzas

# text
seg-a801b99f7040 = <s1>Siguiente</s1>Estación de referencia lunar

# text
seg-e0aba02258f4 = El tipo ephemeris
