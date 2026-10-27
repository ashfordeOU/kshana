# docs--agency-orbit-validation: translations (es)

# text
seg-31d58f23c0a2 = Ejecutar

# text
# c1: docs/AGENCY-ORBIT-VALIDATION.md
seg-fbe4b3eb7310 = Fuente: <c1/>

# text
seg-87910a33b87b = Validación del modelo de fuerzas mediante ajuste de efemérides: metodología y residuos validados

# text
# c1: src/precise_od.rs
seg-09a1b1b673fb = El motor de fuerzas completo de Kshana (<c1/>) ajustado a <b>productos reales de órbita precisa de agencias</b>, con residuos honestos, citables y sellados con el hash del commit. Este es el registro de validación del hito P4 de la hoja de ruta ("Astrodinámica precisa: gravedad de alto orden, SRP (presión de radiación solar), validación frente a conjuntos de datos de agencias").

# text
seg-90f366667f78 = Qué significa aquí un residuo validado

# text
# c1: docs/design/2026-06-09-precise-astrodynamics-design.md
seg-3861b68a03e2 = Un residuo se informa solo cuando se dan todas las condiciones siguientes (diseño <c1/>):

# text
# c1: src/tides.rs
# c2: C_R
# c3: src/forces.rs
seg-954f4f934461 = El <b>modelo de fuerzas</b> incluye toda perturbación que importa a la exactitud objetivo: geopotencial de alto grado EGM2008 (Earth Gravitational Model { "2008" }) (truncado a un grado/orden declarado, d/o), <b>mareas</b> sólidas, oceánicas y atmosféricas (<c1/>, Convenciones { "2010" } del IERS (International Earth Rotation and Reference Systems Service), cap. { "6" }), tercer cuerpo Sol/Luna, SRP de bola de cañón con sombra cónica y <c2/> estimado, arrastre (solo LEO (órbita terrestre baja)), y términos de relatividad general (GR) de Schwarzschild y Lense–Thirring (<c3/>).

# text
# c1: 1/σ²
seg-710f89c088cc = El <b>estimador</b> es un verdadero ajuste por mínimos cuadrados por lotes de Gauss–Newton con una <b>matriz de transición de estado</b> variacional (contrastada con diferencias finitas sobre el arco completo hasta < { "1e-6" }), ponderación de observaciones <c1/> y edición de valores atípicos de n sigmas.

# text
# c1: src/eop.rs
# c2: src/cio.rs
# c3: timescales::gps_to_tt
seg-dd5dcc66ed22 = <b>Marcos y tiempo</b> usan <b>parámetros reales de orientación de la Tierra (EOP) finals2000A del IERS</b> (UT1 (Universal Time { "1" }, tiempo de rotación de la Tierra)−UTC (Coordinated Universal Time), movimiento polar; <c1/>) a través de la cadena CIO (Celestial Intermediate Origin) 2006/2000A de la IAU (International Astronomical Union) validada (<c2/>). Hora GPS (Global Positioning System) de SP3 (Standard Product { "3" }, el formato de órbita precisa) → TT (Terrestrial Time) mediante el desfase fijo de { "51.184" } s (<c3/>).

# text
seg-665bb53b81fb = Los <b>residuos</b> se informan en <b>RTN</b> (radial/a lo largo de la traza/transversal) y en 3-D, <b>con y sin</b> aceleraciones empíricas, junto con el solapamiento en bruto (sin ajuste).

# text
seg-fea4515ba842 = Cada cifra es <b>reproducible</b> (puerta de CI (integración continua) con datos abiertos) y <b>citable</b> (hash del commit + referencia del conjunto de datos + SHA-256 del fixture (SHA: Secure Hash Algorithm)).

# text
seg-fa98a174e799 = Método, por conjunto de datos

# text
seg-a98b098e815a = Analizar la órbita precisa SP3; para el satélite elegido, tomar cada determinación de posición ITRF (International Terrestrial Reference Frame).

# text
# c1: (UT1, xₚ, yₚ)
seg-a25f69a48b5a = Convertir la época GPS de SP3 → TT; resolver <c1/> de finals2000A en esa época.

# text
seg-e5338b713d88 = Rotar cada determinación ITRF a GCRS (Geocentric Celestial Reference System) a través de la cadena CIO con esos EOP: las observaciones de posición inercial. La dinámica usa los <em>mismos</em> EOP para la rotación terrestre fija del geopotencial, de modo que las observaciones y las fuerzas comparten un único marco.

# text
# c1: [r, v, C_R]
seg-ce987e4dda40 = Inicializar el estado de época (posición = primera determinación; velocidad = diferencia finita de 2.º orden) y ajustar por lotes <c1/> (Nivel { "1" }), y después además las { "9" } aceleraciones empíricas RTN de ciclo por revolución (CPR) (Nivel { "2" }, con restricción a priori).

# text
seg-22f839d05292 = Informar del RMS (raíz del error cuadrático medio) posterior al ajuste en RTN y en 3-D para ambos niveles y del solapamiento en bruto.

# text
seg-64e2c3662a27 = Órbita terrestre media de Galileo — <b>GREEN</b> (umbral < { "5" } m)

# text
# c1: ESA0MGNFIN
seg-e77e8e35ba80 = <b>Conjunto de datos:</b> órbita multi-GNSS (GNSS: sistema global de navegación por satélite) final de ESA/ESOC (ESA: Agencia Espacial Europea; ESOC: Centro Europeo de Operaciones Espaciales) <c1/>, ITRF, muestreo de 5 min, satélite <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), MEO (órbita terrestre media) nominal), 2022-01-01.

# text
# c1: navigation-office.esa.int/products/gnss-products/2190/
# c2: datacenter.iers.org/data/9/finals2000A.all
seg-f90d848e7a46 = <b>Fuente abierta (sin inicio de sesión):</b> réplica de la ESA Navigation Office, <c1/>. EOP: IERS <c2/>.

# text
seg-ec7195b80bad = Commit de validación:

# text
# c1: e7297f4c…d3a24a3
# c2: 6b781d36…cb2ed00f
# c3: tests/fixtures/agency/NOTICE.md
seg-c2ad9f9cc050 = <b>Fixtures (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

# text
seg-de3df1639939 = Arco

# text
seg-7db37f753fc1 = RMS 3-D

# text
seg-d39e59df38c0 = RTN (R, T, N)

# text
seg-5ad814c7ef9e = Notas

# text
# c1: C_R
seg-bced8a114852 = Fixture de CI, Nivel { "1" } (fuerza + <c1/>)

# text
seg-f040df9ee966 = { "8" } h

# text
seg-459900054e0e = { "0.133" } m

# text
seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

# text
seg-d15ea658058b = solapamiento en bruto { "78.7" } km

# text
seg-1ce1bc363541 = Fixture de CI, Nivel { "2" } (+ CPR empírico)

# text
seg-461105b5c2f3 = { "0.070" } m

# text
seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

# text
seg-224a7fc75354 = reduce el residuo a la mitad

# text
seg-1b422bc76914 = Envío de arco completo, Nivel { "1" } (antes de la corrección†)

# text
seg-f57ee3b36d92 = { "24" } h

# text
seg-5fee750a5e30 = { "0.611" } m

# text
seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

# text
# c1: xval/s2-air-tide-fix/
# c2: workflow_dispatch
seg-95879df86618 = Las cifras del fixture de CI de arriba se volvieron a registrar en { "0.36" } tras la corrección S2 de la marea atmosférica (<c1/>): el Nivel { "1" } de Galileo pasó de { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), y los componentes N de Swarm-A cambiaron { "1" }–{ "2" } mm; las cifras del envío de arco completo no se volvieron a ejecutar. † <b>Antes de la corrección:</b> la cifra del envío de arco completo se registró antes de la corrección S2 de la marea atmosférica de { "0.36" } y no se ha vuelto a ejecutar con el código corregido (los productos de día completo los descarga el flujo de trabajo de envío, que no está disponible en la sesión que hizo la corrección). En los fixtures de CI la corrección movió el RMS 3-D de Galileo menos de { "1" } mm y los componentes de Swarm-A { "1" }–{ "2" } mm, de modo que se espera un cambio del mismo orden; la próxima ejecución de <c2/> lo volverá a registrar.

# text
seg-5141c1811e35 = El campo de MEO converge en gravedad en el grado { "8" } (el resultado del Nivel 1 de { "8" } h es idéntico con d/o { "8" }, { "10" } y { "12" } hasta el milímetro), de modo que el truncamiento a d/o 12 del fixture de CI es despreciable; el trabajo de envío ejecuta el d/o 70 completo. El ajuste de { "8" } h alcanza <b>{ "13" } cm</b> con fuerza pura y <b>{ "7" } cm</b> con el nivel empírico; el arco completo de { "24" } h (más tensión de SRP y de eclipses, un tramo dinámico más largo) es de <b>{ "61" } cm</b>: todo ello muy por dentro del umbral de { "5" } m.

# text
seg-45a95547dbcc = Swarm-A en LEO — <b>GREEN</b> (umbral < { "5" } m)

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: RDOD_AR
# c3: L47
seg-cba2e4a9b9b1 = <b>Conjunto de datos:</b> órbita científica precisa de dinámica reducida de Nivel 2 de ESA Swarm <c1/> (<c2/>, derivada de GPS, ITRF / IGb14, ~{ "2" } cm, procesamiento de la Universidad Tecnológica de Delft), satélite <b>Swarm-A</b> (id SP3 <c3/>, LEO de ~{ "430" } km), 2022-01-01.

# text
# c1: https://swarm-diss.eo.esa.int/
# c2: Level2daily/Latest_baselines/POD/RD/Sat_A/
# c3: finals2000A
seg-f66ad1515550 = <b>Fuente abierta (sin inicio de sesión):</b> servidor de difusión de ESA Swarm <c1/> → <c2/> (abierto bajo la política de datos de la ESA). EOP: la misma serie <c3/> 2022-001 del IERS.

# text
# c1: 6cd84b78…acb733e
# c2: tests/fixtures/agency/NOTICE.md
seg-4de8b64c0bf0 = <b>Fixture (SHA-256):</b> SP3 <c1/> (<c2/>).

# text
# c1: C_R
seg-b46c7e1d476d = Un arco LEO añade <b>arrastre atmosférico</b> al modelo de fuerzas. Como el modelo de densidad es un exponencial por tramos <em>estático</em>, la órbita se ajusta en dos niveles: un nivel <b>dinámico</b> (estimar solo el estado de época; <c1/> fijado en { "1" }, porque en LEO domina el arrastre y la SRP se separa mal en un arco corto) y un nivel de <b>dinámica reducida</b> que añade las aceleraciones empíricas de ciclo por revolución que absorben el arrastre no modelado: la órbita LEO con significado operativo.

# text
# c1: C_R
seg-dac35ad223dd = Fixture de CI, dinámico (<c1/>={ "1" })

# text
seg-0652aa62d459 = { "3" } h

# text
seg-cc0a14ba2b40 = { "2.687" } m

# text
seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

# text
seg-555712268929 = residuo ≈ puramente a lo largo de la traza (arrastre)

# text
seg-4f8e7956aa78 = Fixture de CI, dinámica reducida (+empírico)

# text
seg-aa5f651bcfab = { "0.098" } m

# text
seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

# text
seg-82a3e25da2bf = el término empírico absorbe el arrastre

# text
# c1: swarm_full_arc_dispatch
# c2: KSHANA_SWARM_SP3
seg-ff834d33ae70 = El ajuste dinámico supera el umbral de { "5" } m con el residuo casi por completo a lo largo de la traza: la firma de manual del arrastre a ~{ "430" } km. El nivel empírico absorbe ese error a lo largo de la traza ({ "2.52" } → { "0.09" } m) y da un ajuste de dinámica reducida de <b>~{ "10" } cm</b> frente a la órbita propia de la ESA de ~{ "2" } cm. La ejecución de día completo y grado completo es la <c1/> ignorada (el servidor de difusión sirve el producto a través de su sesión de explorador de archivos, de modo que el fundador descarga el SP3 del día y apunta <c2/> a él). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) con impulsores de clima espacial es la mejora anotada que ajustaría aún más el nivel <em>dinámico</em>.

# text
seg-e8f5c385de62 = LRO lunar — validado, <b>por encima</b> del umbral de { "5" } m (con honestidad) (P4 W4b)

# text
seg-8a22ef5d3765 = <b>Conjunto de datos:</b> la trayectoria reconstruida real del <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) de NASA/JPL (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory) obtenida de JPL Horizons, vectores de estado geométricos selenocéntricos en el ICRF (International Celestial Reference Frame), 2022-01-01, ~{ "98" } km de altitud, muestreo de 1 minuto ({ "241" } épocas, { "4" } h, ~{ "2" } revoluciones). Usar los vectores de texto de Horizons <b>no necesita lector SPK/SPICE (SPK: núcleo de efemérides planetarias; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

# text
seg-2bcf078de340 = <b>Gravedad:</b> el campo <b>GRGM660PRIM</b> de GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, grado { "660" }), truncado a d/o { "150" } y ajustado con d/o { "100" }, evaluado en el marco de <b>ejes principales</b> fijo al cuerpo lunar.

# text
# c1: ssd.jpl.nasa.gov/api/horizons.api
# c2: icgem.gfz-potsdam.de
seg-1454f78e9ca4 = <b>Fuente abierta (sin inicio de sesión):</b> API (interfaz de programación de aplicaciones) de Horizons <c1/>; gravedad mediante ICGEM (International Centre for Global Earth Models) <c2/>.

# text
# c1: 574e3518…d100f0
# c2: 0ff04184…f029977ae
# c3: tests/fixtures/agency/NOTICE.md
seg-306ffeb843a9 = <b>Fixtures (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: precise_od::ForceModel
seg-65ff0c37dd74 = Esta es una dinámica <b>selenocéntrica</b>: un modelo de fuerzas distinto (<c1/>): el campo GRGM en el marco fijo al cuerpo lunar (la orientación media Tierra de la IAU { "2015" } <c2/> compuesta con el desfase fijo DE421 (Development Ephemeris { "421" }) de media Tierra → ejes principales (ME→PA)), más la Tierra (la perturbación dominante de la órbita lunar) y el Sol como terceros cuerpos, ajustados mediante el <em>mismo</em> estimador genérico de Gauss–Newton preciso que usan los conjuntos de datos terrestres (el trait <c3/>).

# text
seg-68f1894a1fa5 = Fixture de CI, dinámico (solo estado)

# text
seg-0f055118d77a = { "4" } h

# text
seg-c94fc5bf792b = { "12.05" } m

# text
seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

# text
seg-af395226ca52 = solapamiento en bruto { "39.9" } m

# text
seg-2923b4d58878 = Fixture de CI, dinámica reducida (+empírico { "1" }+2/rev)

# text
seg-19167d54b4ad = { "6.67" } m

# text
seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

# text
seg-706a4d52f6c5 = los términos empíricos de 1 y 2 por revolución absorben el error a lo largo de la traza

# text
# c1: pxform('MOON_ME','MOON_PA')
# c2: tests/lunar_me_pa_offset_spice_oracle.rs
# c3: docs/design/evidence/fut05b-me-pa-offset-sign/
seg-3f33d99fd643 = Corrección de { "0.36" }: hasta { "0.36" } el desfase ME→PA de DE421 se aplicaba en la dirección equivocada (y con el orden de Euler equivocado), lo que situaba el marco PA analítico a unos { "208" }″ del PA en lugar de sobre él. Ahora se transcribe como lo define SPICE (comprobado frente a <c1/> hasta { "2.6e-16" } rad, <c2/>; <c3/>). Las cifras de arriba son posteriores a la corrección; antes eran { "53.8" } m en bruto, <b>{ "12.6" } m</b> dinámico ({ "3.07" }, { "10.19" }, { "6.81" } m) y <b>{ "6.65" } m</b> de dinámica reducida ({ "3.49" }, { "4.56" }, { "3.35" } m).

# text
seg-925d1445fccb = Estos residuos están <b>por encima</b> del umbral de { "5" } m que Galileo ({ "0.13" } m) y Swarm-A ({ "0.10" } m) superan, y se informan con honestidad.

# text
seg-c414e14eaaea = Qué fija realmente el suelo: una validación cruzada de grado DE (y una corrección)

# text
# c1: MOON_PA
# c2: xval/anise-lunar-od
# c3: moon_pa_de440_200625.bpc
# c4: de440s.bsp
# c5: ae96a29
# c6: c1c7fee…
# c7: 60cd55a…
seg-72b06bac7f6b = Planteamos la hipótesis de que el factor limitante era la fidelidad de la <b>orientación y las efemérides lunares analíticas</b> (la serie de libración de la IAU, exacta a decenas de segundos de arco frente a la <c1/> de la DE (Development Ephemeris) de JPL integrada numéricamente, y las efemérides Tierra/Sol de Montenbruck–Gill, de ~{ "0.3" }° frente a un núcleo DE/SPICE). Para comprobarlo directamente, el crate de validación cruzada excluido del workspace <c2/> sustituye <b>solo</b> esas dos entradas por otras de <b>grado DE</b>: la orientación lunar de ejes principales de DE440 (Development Ephemeris { "440" }) (<c3/>) y las efemérides de DE440 (<c4/>), leídas con ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris, un lector de núcleos SPICE en Rust puro), y vuelve a ejecutar el <em>mismo</em> estimador (commit <c5/>, SHA-256 de los núcleos <c6/> / <c7/>):

# text
seg-3a0e724a8a2b = Nivel

# text
seg-c1ce24cd6008 = analítico

# text
seg-7d04fb530a3a = solapamiento en bruto

# text
seg-d9ce88edb49e = { "53.8" } m

# text
seg-55dc7c7d84f0 = { "41.5" } m

# text
seg-7def7880e134 = dinámico

# text
seg-83e37e5e9b3e = { "12.6" } m

# text
seg-c421a0a20278 = { "12.0" } m

# text
seg-f70309824f25 = dinámica reducida ({ "1" }+2/rev)

# text
seg-b8ada0c5fab3 = { "6.65" } m

# text
seg-b6d3daff2f23 = <b>Nota de { "0.36" }: la mayor parte de la mejora del nivel dinámico de abajo se debía al error de desfase, no a las entradas de grado DE.</b> Con el desfase ME→PA corregido, la pila analítica da { "39.9" } m en bruto, { "12.05" } m dinámico y { "6.67" } m de dinámica reducida, frente a { "41.5" }, { "12.0" } y { "6.67" } m de grado DE: los ajustes analítico y de grado DE coinciden ahora en todos los niveles. De ello se sigue la lectura de { "0.30" } de la tabla de abajo, que se conserva tal como se escribió.

# text
# c1: atol
seg-691df96321d8 = <b>La hipótesis solo es correcta a medias, y la afirmación principal necesitaba corregirse.</b> La orientación y las efemérides de grado DE <em>sí</em> mejoran el solapamiento en bruto ({ "53.8" } → { "41.5" } m) y el ajuste <b>dinámico</b> ({ "12.6" } → { "12.0" } m), de modo que el error de orientación y efemérides analíticas es real y limita esos niveles. Pero dejan el residuo de <b>dinámica reducida</b> esencialmente <b>sin cambios</b> ({ "6.65" } → { "6.67" } m): el nivel empírico de { "1" }+2 por revolución <em>ya</em> estaba absorbiendo el error de orientación y efemérides, de modo que el suelo operativo de ~{ "6.6" } m lo fija otra cosa: un residuo que la base de ciclo por revolución no puede absorber y que los marcos de grado DE no eliminan. La explicación más coherente es la <b>dinámica no gravitatoria de LRO sin modelar</b> (reirradiación térmica, desgasificación) a lo largo del arco corto de { "4" } h; se excluye el grado del campo (idéntico con d/o { "100" } y { "150" }) y se excluye la tolerancia del integrador (idéntica con <c1/> { "1e-6" } frente a { "1e-9" }). El corolario constructivo: <b>la pila lunar analítica, ligera y sin núcleos de Kshana ya iguala la fidelidad de grado DE para la órbita lunar de dinámica reducida (operativa)</b>: el valor predeterminado de solo coeficientes no deja nada sobre la mesa ahí. Superar los { "5" } m exigiría modelar las fuerzas no gravitatorias de LRO (un modelo de caja-ala/térmico específico de la nave y un ajuste más largo de varios arcos), no mejores marcos.

# text
seg-4211fbd25380 = Contrato de honestidad

# text
seg-f3b0a26ff5b3 = El umbral "verde" de < { "5" } m se alcanza para <b>Galileo MEO</b> ({ "0.13" } m dinámico) y <b>Swarm-A LEO</b> ({ "2.69" } m dinámico / { "0.10" } m de dinámica reducida). <b>LRO lunar se publica tal cual con { "12.05" } m dinámico / { "6.67" } m de dinámica reducida (empírico de { "1" }+2 por revolución): por encima del umbral</b> ({ "0.36" }, tras la corrección del desfase ME→PA; { "12.6" } / { "6.65" } m antes de ella). Una validación cruzada de grado DE (arriba) <b>puso a prueba y corrigió</b> la afirmación del factor limitante: el suelo de dinámica reducida <b>no</b> es la orientación y efemérides analíticas (los núcleos DE440 lo dejan sin cambios en { "6.67" } m), de modo que no se cierra con mejores marcos sino modelando la dinámica no gravitatoria de LRO: el camino honesto y actualizado hacia el nivel del metro.

# text
seg-559a269152ae = Para LEO, los niveles <b>dinámico</b> (solo estado, densidad estática) y de <b>dinámica reducida</b> (con aceleraciones empíricas) se informan siempre <b>por separado</b>, para que el lector vea lo que absorben los términos empíricos; el nivel de dinámica reducida es la órbita operativa. La misma separación vale para los niveles empírico y de fuerza pura de MEO.

# text
seg-d20c7ef90250 = Cada residuo lleva arriba su hash de commit, la referencia del conjunto de datos y la suma de verificación del fixture.

# text
seg-733d96129fca = <b>Conjuntos de datos validados frente a la verdad real de agencias: { "3" } de { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO lunar). <b>Que alcanzan el umbral de < { "5" } m: { "2" } de { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO con { "6.67" } m, con honestidad por encima).

# text
seg-d7c77076c9c6 = <s1>Anterior</s1>Validación de SGP4

# text
seg-d661003da754 = <s1>Siguiente</s1>Sistema solar y otros cuerpos

# text
seg-36a3b8105d4b = Órbita terrestre media de Galileo — GREEN (umbral < { "5" } m)

# text
seg-b6f96cf0d55a = Swarm-A en LEO — GREEN (umbral < { "5" } m)

# text
seg-9e739bda7f20 = LRO lunar — validado, por encima del umbral de { "5" } m (con honestidad) (P4 W4b)
