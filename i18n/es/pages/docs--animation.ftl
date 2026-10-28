# docs--animation: translations (es)

# text
# c1: docs/ANIMATION.md
seg-8428c41646b0 = Fuente: <c1/>

# text
# c1: --animate
seg-a61d094894fd = <c1/> convierte la serie temporal de una ejecución en algo que se mueve: un archivo Scalable Vector Graphics (SVG) animado, un único reproductor HyperText Markup Language (HTML) autónomo o una secuencia numerada de fotogramas SVG para un codificador de vídeo. Una campaña se reproduce como sus fases (jamming, spoofing, holdover, alarma de integridad) con sus alarmas marcadas; una ejecución de espectro reproduce su cascada fila a fila; una pasada en órbita terrestre baja (LEO) reproduce su enlace por banda y, con un spoofer, las estadísticas del monitor época a época.

# text
# c1: src/animation.rs
# c2: tests/animation.rs
seg-39d69331035d = Código: <c1/>. Pruebas: <c2/>.

# text
seg-0b708f65d8d3 = Qué es y qué no es

# text
seg-ad8c12a3b510 = El exportador lee el documento de resultados que la ejecución ya escribió. No vuelve a ejecutar la física, no remuestrea, suaviza ni interpola entre muestras (salvo el tramo rectilíneo que cierra una traza en el cursor), y no añade ninguna cifra propia. Por tanto, una animación es exactamente tan buena como la ejecución que hay detrás. Su nivel es <b>MODELLED, coherencia interna</b>: es una representación, nunca evidencia, y no lleva ninguna fila propia de la matriz de verificación.

# text
seg-f37311ad7ef0 = Salidas

# text
# c1: result.json
# c2: chart.svg
# c3: report.html
seg-0c21f772932e = Cada formato se escribe junto al escenario, además de los habituales <c1/>, <c2/> y <c3/>:

# text
seg-f2ce7fc60cdf = Formato

# text
seg-51a8df15f356 = Se escribe como

# text
seg-3ea93ae372ca = Qué contiene

# text
seg-3603593b9799 = Un SVG animado con fotogramas clave de Cascading Style Sheets (CSS) y sin script: las trazas se dibujan detrás de un cursor de tiempo móvil, los eventos aparecen en su instante y las filas de la cascada se revelan en orden temporal. Se repite en bucle, con una pausa de { "1.5" } s sobre la imagen terminada.

# text
seg-6c91078b434e = Un archivo con script y estilo en línea y sin ningún recurso externo: reproducir y pausar, un control de desplazamiento, velocidad (0.25x a 4x), todos los paneles con un único cursor sincronizado, un valor en vivo por traza, la franja de fases y una lista de eventos que salta al hacer clic. La barra espaciadora reproduce o pausa, las teclas de flecha avanzan, Inicio y Fin saltan.

# text
# c1: frame_0000.svg
# c2: frame_0001.svg
# c3: manifest.json
seg-df02d37cd729 = <c1/>, <c2/>, … y <c3/>.

# text
# c1: --animate
# c2: --animate svg,html
# c3: all
# c4: --animate-fps
# c5: --animate-duration
seg-2e5ebd60cad0 = <c1/> es repetible y admite una lista separada por comas (<c2/>) o <c3/>. <c4/> ({ "1" } a { "60" }, por defecto { "12" }) y <c5/> ({ "0.5" } s a { "600" } s, por defecto { "8" } s) fijan la reproducción; la secuencia de fotogramas está limitada a { "7,200" } fotogramas.

# text
# c1: --export
# c2: report.html
# c3: --animate
seg-7e012ab53f45 = Cuando <c1/> se ejecuta en el mismo comando, el reproductor HTML enumera los archivos de exportación escritos junto a él (CZML, KML, GeoJSON, STK, SigMF) como enlaces relativos a esos archivos hermanos; solo se escribe un enlace para un nombre de archivo simple, de modo que ninguno puede salir de la carpeta ni llegar a la red. El informe avanzado (<c2/>) incrusta el dibujo animado siempre que el resultado tiene una serie temporal, se haya ejecutado o no <c3/>.

# text
# c1: --animate
# c2: result.json
# c3: animation
# c4: sources
# c5: omitted
# c6: --animate
seg-9c1d2204edab = Cuando se ejecuta <c1/>, <c2/> gana un bloque <c3/>: los formatos, los fotogramas por segundo (fps), la duración, el número de fotogramas, el intervalo de tiempo, los títulos de los paneles, las rutas JSON de las que se leyó cada traza (<c4/>) y cualquier serie encontrada pero no dibujada (<c5/>). Sin <c6/> el resultado es idéntico byte a byte al de una ejecución normal.

# text
seg-fa8388ae976e = La secuencia de fotogramas

# text
# c1: round(duration × fps)
# c2: t_start + (t_end − t_start) × i / (n − 1)
# c3: manifest.json
# c4: fps
# c5: duration_s
# c6: frame_count
# c7: frame_pattern
# c8: frame_%04d.svg
# c9: t_start
# c10: t_end
# c11: frame_times
# c12: frame_NNNN.svg
seg-db4b53abe7d6 = La secuencia tiene exactamente <c1/> fotogramas. El fotograma <em>i</em> muestra la línea de tiempo hasta <c2/>, de modo que el primer fotograma es el inicio y el último es la imagen terminada. <c3/> registra <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), el tamaño en píxeles, <c9/>, <c10/>, la hora de misión de cada fotograma (<c11/>), las fases, los eventos y las fuentes. Una reexportación en el mismo directorio elimina primero todos los <c12/> que ya hubiera allí (y nada más), de modo que una secuencia más corta nunca deja fotogramas de una más larga para que los lea el codificador.

# text
# c1: ffmpeg
# c2: librsvg
# c3: fps
seg-13b57b6d3c14 = Los fotogramas son SVG, no Portable Network Graphics (PNG). Un <c1/> compilado con la biblioteca <c2/> los lee directamente, a la frecuencia con la que se escribió la secuencia ({ "24" } en el ejemplo de arriba; el <c3/> del manifiesto):

# text
# c1: ffmpeg
# c2: librsvg
# c3: rsvg-convert
seg-b20beeb45fac = Un <c1/> sin <c2/> se detiene con "no decoder found for: svg". Rasterice primero los fotogramas, por ejemplo con <c3/>, y codifique los PNG:

# text
seg-fc61f546f605 = Accesibilidad y tema

# text
# c1: prefers-color-scheme
seg-7015f7ed77dc = <b>Esquema de color.</b> El reproductor sigue <c1/> y se redibuja cuando cambia; el SVG animado lleva una variante clara de su paleta bajo la misma media query. Los fotogramas usan la paleta oscura de los gráficos estáticos, porque un vídeo no tiene esquema.

# text
# c1: prefers-reduced-motion: reduce
seg-c3b1f19f191b = <b>Movimiento reducido.</b> Bajo <c1/> el SVG animado desactiva toda animación y muestra la imagen terminada (sus estilos base son el estado final, de modo que no se oculta nada), y el reproductor se abre en pausa sobre la imagen terminada en lugar de reproducirse; el usuario aún puede desplazarse o pulsar Reproducir.

# text
# c1: <title>
# c2: <desc>
seg-f8dd26194eec = El SVG tiene un <c1/> y un <c2/>; los controles del reproductor son botones etiquetados, una entrada de rango con un valor de tiempo hablado y un selector.

# text
seg-f5356cbf3675 = Qué cuenta como serie temporal

# text
seg-ba43cf36ac20 = Los documentos de resultados difieren de un tipo de escenario a otro, de modo que el exportador reconoce las formas que emite el motor en lugar de una lista de tipos de escenario:

# text
# c1: t
# c2: t_s
# c3: t_hours
# c4: t_min
# c5: t_days
# c6: k
# c7: epochs
# c8: quantum.series[].error_ns
# c9: classical.series[].error_ns
seg-952d09156712 = <b>Una matriz de registros con un campo de tiempo</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, o <c6/> en una matriz <c7/>) que crece estrictamente a lo largo de la matriz. Cada otro campo numérico se convierte en una traza; el mismo campo bajo dos raíces (<c8/> y <c9/>) comparte un panel.

# text
# c1: t_s
# c2: t
# c3: times_s
# c4: channels
# c5: {unit, values}
# c6: campaign
# c7: spectrum
# c8: *_hz
# c9: spectrum
seg-2c3abce3f70a = <b>Un objeto con una matriz de tiempo estrictamente creciente</b> (<c1/>, <c2/>, <c3/>, …) junto a matrices de la misma longitud: matrices numéricas hermanas, un mapa <c4/> de registros <c5/> (la línea de tiempo de <c6/>), una matriz de registros que contienen tales matrices (las bandas de <c7/>, las trazas de satélites de una constelación) y una matriz bidimensional cuyas filas coinciden con el eje de tiempo con un eje de frecuencia <c8/> hermano (la cascada de <c9/>).

# text
# c1: phases
# c2: name
# c3: t0_s
# c4: t1_s
# c5: events
# c6: t_s
# c7: label
# c8: alarm
# c9: *_t_s
seg-0edf8c38f9eb = Junto a esa matriz de tiempo, <c1/> (<c2/>, <c3/>, <c4/>) se convierten en la franja de fases y <c5/> (<c6/>, <c7/>, <c8/>) en los marcadores. Los escalares <c9/> de una banda (su primera pérdida de enganche, su relación portadora-ruido más baja) también se marcan.

# text
# c1: omitted
seg-608c4fed9e98 = Las trazas con unidad comparten un panel cuando sus magnitudes están dentro de un factor de { "100" }, de modo que una guarda de { "50" } ns no aplana un error de { "2" } ns. Se dibujan como máximo { "6" } paneles de { "6" } trazas; el resto se enumera en <c1/>. Las trazas de más de { "2,400" } muestras se aclaran con un paso uniforme que conserva la última muestra, y una cascada de más de { "96" } × { "120" } celdas se promedia a la baja (en potencia, para celdas en decibelios, de modo que un jammer estrecho no se diluya).

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: leo-ppp
# c4: leo-pvt
# c5: trace = true
# c6: leo-navmsg
# c7: leo-signal
# c8: ntn-positioning
seg-c386389e4f1d = Entre los tipos de escenario LEO, todo escenario <c1/>, <c2/> y <c3/> incluido se anima. <c4/> se anima en sus modos de Doppler, de posicionamiento conjunto y de temporización (una ejecución de temporización necesita <c5/>, que hace que cada fila informe de su error de tiempo y de su sigma previsto en cada época) y se rechaza en su modo de cobertura polar. <c6/> anima su actualización a mitad de pasada y se rechaza para los análisis de codificación, de intervalo de ajuste y de comparación de modelos. Los resultados de <c7/> y <c8/> no llevan eje de tiempo y se rechazan.

# text
seg-eb31ec7a07b7 = Determinismo

# text
seg-82bcf8a5b042 = La salida es una función pura del documento de resultados y de las opciones: sin reloj, sin números aleatorios, sin iteración de mapas hash, sin acceso a archivos ni a la red en la biblioteca, y sin marca de tiempo en ningún sitio, de modo que el mismo escenario, la misma semilla y las mismas opciones dan archivos idénticos byte a byte. El módulo se compila para WebAssembly sin cambios; solo la interfaz de línea de comandos escribe archivos.

# text
seg-77e1f459f3d3 = Uso como biblioteca

# text
# c1: kshana::animation::animate_result
# c2: extract_timeline
seg-b3fa41e48ea5 = <c1/> anima un documento de resultados que usted ya tiene, y <c2/> devuelve lo que se dibujaría sin renderizarlo.

# text
seg-0857a94a948e = Límites

# text
# c1: animate_scenario
seg-02f0f03af2fb = El wheel de Python y el módulo WebAssembly todavía no exponen el exportador; se llega a él desde la línea de comandos, la biblioteca de Rust y la herramienta <c1/> del servidor Model Context Protocol (MCP) (que devuelve como máximo { "120" } fotogramas en una respuesta).

# text
seg-cd3ec7b403ba = Los ejes son lineales. Una serie que abarca muchas décadas (el crecimiento del error de un reloj de { "0.1" } ns a un microsegundo) se ve plana hasta tarde en la ejecución.

# text
seg-ed21d370a73c = El SVG animado se apoya en la animación CSS de un rectángulo de recorte; los motores actuales de Chromium, Firefox y Safari lo reproducen, mientras que un visor sin animación CSS muestra la imagen terminada.

# text
seg-9dfb9596ecf3 = Las campañas de barrido, Monte Carlo y composición no llevan eje de tiempo y se rechazan; las estadísticas de resumen de un barrido o de un conjunto no son una serie temporal. Una campaña encadenada se anima.

# text
seg-be1f1afe7424 = <s1>Anterior</s1>Informes de ejecución

# text
seg-6817433f69f6 = <s1>Siguiente</s1>Exportaciones e importaciones de interoperabilidad

seg-51cd8d5f527b = Un tipo de escenario cuyo resultado no lleva ninguna de estas formas (un balance de enlace, una geometría de una sola época, un resumen Monte Carlo solo de estadísticas, o el holdover de telecomunicaciones, cuyo resultado publica el hash del registro pero no el registro) se rechaza con <c1/>, y no se escribe nada. Con kshana { $version }, { "94" } de los { "193" } archivos de escenario ejecutables (todos salvo un conjunto de estudio) se animan y { "99" } se rechazan. <c2/> imprime el censo.
