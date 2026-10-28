# docs--kind-lunar-surface: translations (es)

seg-f942b36a11c4 = Aún no está en GitHub

seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

seg-1c1eeb2dcaa0 = Página de la familia: <a1>Lunar y cislunar</a1>

seg-6a26b9ab59fe = Página del tema: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Etiqueta del resultado (la del motor): MODELLED

seg-626ab55f0424 = MODELLED (resultado <c1/>)

seg-e66e2ca31e54 = Página del tema: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-bf92597fdba4 = Software de carácter consultivo, no un equipo de naveg

seg-feea03a2c628 = Fuente: <c1/>

seg-6c0eff9f9211 = <c1/> (tipo de escenario)

seg-6c7d25f672fb = Disponibilidad MODELLED de posicionamiento y temporización en la superficie por emplazamiento y estación para emplazamientos polares sur de clase Artemis. Para cada emplazamiento y estación (una época y una ventana posterior) informa del posicionamiento por relés (cuatro o más relés de una constelación ILLUSTRATIVE de clase LCNS a la vista y PDOP por debajo de un umbral, con las mismas funciones que moonlight-service-volume y, con una sección de terreno, el horizonte trazado por rayos del terreno de lunar-station-coverage), de si la Tierra y el Sol están sobre el horizonte del emplazamiento (Sol, Luna y orientación lunar analíticos, con libración incluida, que es lo que varía con la estación), y de la disponibilidad de temporización (un relé o la Tierra a la vista) con el tramo más largo sin ninguno de los dos, el holdover que debe superar un reloj de superficie. El resultado de un solo emplazamiento es igual al de moonlight-service-volume bit a bit. MODELLED: conjunto de relés kepleriano ilustrativo en una Luna de rotación media; la cifra de relés no cambia con la estación; el terreno es el recorte de LOLA de { "1200" } m. Sin respaldo de ninguna agencia; software de carácter consultivo, no un equipo de navegación certificado.

seg-3c13aefe4093 = Una ejecución de <c1/> se resume así: lunar-surface | { "4" } emplazamientos x { "4" } estaciones | posicionamiento { "41" } % a { "41" } % | peor disponibilidad de temporización { "100.0" } % | mayor hueco de temporización { "0.0" } h (MODELLED)

seg-02bc245c436e = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-4e5ed02a85e1 = El ejemplo <c1/> establece, entre otros:

seg-0ceb87f45323 = polar sur { "89.9" }

seg-94a405fadf2d = mci

seg-8c3e0f75ab98 = pasa sin cambios

seg-94b84de6c958 = El gráfico que escribe el motor para scenarios/lunar-surface.toml, tipo de escenario lunar-surface

seg-25040e105bf7 = <b>MODELLED</b> El tipo de escenario y fase <c1/>: disponibilidad de relés y PDOP, visibilidad de la Tierra y del Sol y un reloj de superficie disciplinado para cada emplazamiento y estación, con el horizonte de terreno de <c2/>; una ejecución de un solo emplazamiento iguala el de ese tipo de escenario

seg-70f63c99a478 = <b>MODELLED</b> El tipo de escenario y fase <c1/>: disponibilidad de relés y PDOP, visibilidad de la Tierra y del Sol y un reloj de superficie disciplinado para cada emplazamiento y estación, con el hor. Referencia independiente (ReferenceImpl): Igualdad exacta con el tipo de escenario existente para un emplazamiento, y comprobaciones de monotonicidad, en las pruebas. El conjunto de relés es ILLUSTRATIVE y no se compara ninguna medición de superficie

seg-ab29e0e308d0 = Disponibilidad MODELLED de posicionamiento y temporización en la superficie por emplazamiento y estación para emplazamientos polares sur de clase Artemis. (catálogo de tipos de escenario (<c1/>))

seg-3f948092eba6 = MODELLED: conjunto de relés kepleriano ilustrativo en una Luna de rotación media; la cifra de relés no cambia con la estación; el terreno es el recorte de LOLA de { "1200" } m. (catálogo de tipos de escenario (<c1/>))

seg-5b217c0bb606 = HONESTIDAD: MODELLED. El conjunto de relés es ilustrativo y kepleriano, con la Luna girando a la tasa media para los relés (sin libración) como en moonlight-service-volume; la Tierra y el Sol usan la orientación analítica, de modo que los dos marcos difieren por esa omisión. La cifra de posicionamiento por relés no cambia con la estación en este modelo; las de la Tierra y el Sol sí. No se afirma concordancia con ningún servicio ni emplazamiento reales. Soft (comentario del archivo de escenario, líneas { "11" } a { "15" })

seg-958f00c2d647 = Disponibilidad de posicionamiento y temporización en la superficie por emplazamiento y estación en los polos lunares (<c1/>) es MODELLED, no validada: comprobada frente a una implementación separada de este mismo código: independiente de la unidad probada, pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Anterior</s1>lunar-station-coverage

seg-625c1973128e = <s1>Siguiente</s1>lunar-time-budget
