# docs--kind-entry-heating: translations (es)

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-a44edb1eb84d = kg

# text
seg-8e62cc4af6ea = Página de tema: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-d72b4c5393e0 = earth

# text
# c1: docs/kinds/by-kind/entry-heating.md
seg-13b9e9187ab9 = Fuente: <c1/>

# text
# c1: entry-heating
seg-3a3f732cc2dd = <c1/> (tipo de escenario)

# text
seg-b843e2e0a4ee = Entrada atmosférica de masa puntual en 3 grados de libertad sobre una Tierra o un Marte esféricos en rotación (balística o con sustentación a ángulo de alabeo constante), RK4, a través de US76, una atmósfera exponencial o la de Marte, con calentamiento convectivo en el punto de estancamiento de Sutton-Graves (NASA TR R-376): desaceleración, flujo de calor y presión dinámica máximos, carga térmica, alcance, una comprobación de energía en el marco rotatorio y la forma cerrada de Allen-Eggers a su lado. La desaceleración máxima se contrasta con el nominal publicado de Stardust; el calentamiento es MODELLED.

# text
# c1: scenarios/entry-heating-stardust.toml
seg-05c8dac8d411 = Una ejecución de <c1/> se resume así: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> peak { "35.4" } g at { "54.2" } km, peak q { "746" } W/cm² at { "62.0" } km, heat load { "20970" } J/cm², peak q_dyn { "20.8" } kPa; terminal-altitude at { "317" } s (closed form { "60.2" } g; MODELLED 3-DoF, no radiative/TPS)

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-96504cafb034 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/entry-heating-stardust.toml
seg-1b68d973fd30 = El ejemplo <c1/> establece, entre otros:

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) ballistic consta

# text
seg-3159fc595ac9 = kg/m^{ "3" }

# text
seg-2721e146b7be = Etiqueta del resultado (la del motor): MODELLED — entrada de masa puntual en 3 grados de libertad sobre un planeta esférico en rotación (gravedad central, sin J2), atmósfera sin viento en corrotación, C_D, L/D y alabeo constantes, RK4; calentamiento convectivo en el punto de estancamiento según NASA TR R-376 ({ "1971" }), pared fría, SIN calentamiento radiativo, SIN respuesta de TPS/ablación, NO es de 6 grados de libertad

# attr:alt
seg-dbb618cd6357 = El gráfico que escribe el motor para scenarios/entry-heating-stardust.toml, tipo de escenario entry-heating

# text
seg-e73b339df97b = <b>VALIDATED</b> Una entrada de masa puntual en 3 grados de libertad sobre una Tierra esférica en rotación a través de la Atmósfera Estándar de EE. UU. de { "1976" }, integrada con RK4 a partir de un estado de entrada inercial, que informa de la desaceleración máxima y su altitud; el estado de entrada relativo al planeta a partir del i Pruebas: <a1>entry_stardust_published.rs</a1>.

# text
seg-10124432b79b = <b>MODELLED</b> Flujo de calor convectivo en el punto de estancamiento q = k sqrt(rho/R_n) V^{ "3" } con las constantes de Sutton-Graves para el aire terrestre y la atmósfera de Marte (NASA TR R-376, { "1971" }), su máximo y la carga térmica integrada a lo largo de una entrada en 3 grados de libertad, balística o con sustentación a Pruebas: <a1>entry_stardust_published.rs</a1>.

# text
seg-54d133781215 = <b>VALIDATED</b> Una entrada de masa puntual en 3 grados de libertad sobre una Tierra esférica en rotación a través de la Atmósfera Estándar de EE. UU. de { "1976" }, integrada con RK4 a partir de un estado de entrada inercial, que informa. Referencia independiente (ExternalDataset): El nominal de Stardust de Desai, Mitcheltree y Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): desaceleración máxima de { "33.4" } g a { "12.6" } km/s relativos al planeta con la masa de lanzamiento de { "45.8" } kg, una trayectoria POST de 6 grados de libertad con la base de datos aerodinámica completa; interfaz de entrada de Desai, Lyons, Tooley y Kangas (NTRS { "20090004445" }): radio { "6503.14" } km, inercial { "12.9" } km/s a -8.2 deg. Umbrales preregistrados en xval/entry-stardust/PREREGISTRATION.

# text
seg-03878684f9a1 = <b>MODELLED</b> Flujo de calor convectivo en el punto de estancamiento q = k sqrt(rho/R_n) V^{ "3" } con las constantes de Sutton-Graves para el aire terrestre y la atmósfera de Marte (NASA TR R-376, { "1971" }), su . Referencia independiente (InternalConsistency): Autoconsistencia interna: la relación y las constantes tal como se imprimen en NASA TR R-376, una comprobación de convergencia por semipaso y el orden esperado de los máximos de calentamiento y de desaceleración. LO QUE NO ES: no se ha comparado ningún valor de calentamiento publicado (los artículos de Stardust dan un límite de diseño y una estimación convectiva más radiativa de unos { "1200" } W/cm2, que una relación solo convectiva no puede igualar); sin calentamiento radiativo, temperatura de pared ni

# text
# c1: label
seg-a0f300b2ce78 = MODELLED — entrada de masa puntual en 3 grados de libertad sobre un planeta esférico en rotación (gravedad central, sin J2), atmósfera sin viento en corrotación, C_D, L/D y alabeo constantes, RK4; calentamiento convectivo en el punto de estancamiento según NASA TR R-376 ({ "1971" }), pared fría, SIN calentamiento radiativo, SIN respuesta de TPS/ablación, NO es de 6 grados de libertad (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-47f81ab160cc = La desaceleración máxima se contrasta con el nominal publicado de Stardust; el calentamiento es MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
seg-47cda83af127 = Interfaz de entrada a un radio de { "6503.14" } km, inercial { "12.9" } km/s a -8.2 deg, { "45.8" } kg, { "0.811" } m de diámetro, { "0.2202" } m de radio de morro (Desai et al., NASA NTRS { "20050042027" } y { "20090004445" }). La latitud y el rumbo son una entrada aproximada supuesta sobre el Pacífico; C_D es el valor por defecto del módulo para una esfera-cono de { "60" } deg. Desaceleración máxima nominal publicada de 6 grados de libertad: { "33.4" } g. El calentamiento es solo convectivo de Sutton-Graves, MODELLED. (comentario del archivo de escenario, líneas { "4" } a { "8" })

# text
seg-98af076be1ac = El calentamiento convectivo de entrada en el punto de estancamiento (Sutton-Graves) en una entrada de 3 grados de libertad es MODELLED, no está validado: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-77c073cd5d67 = <s1>Anterior</s1>earth-gnss-lunar

# text
seg-20ce5d56783c = <s1>Siguiente</s1>eo-coverage
