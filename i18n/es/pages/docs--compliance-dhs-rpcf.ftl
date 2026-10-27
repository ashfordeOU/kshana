# docs--compliance-dhs-rpcf: translations (es)

# attr:aria-label, text
seg-d01db1c2710a = Referencia

# text
seg-fdbb9db68f1d = ninguna

# text
# c1: docs/compliance/dhs-rpcf.md
seg-dbec6a166e56 = Fuente: <c1/>

# text
seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: a favor de qué aporta evidencias Kshana

# text
seg-cef4181edf29 = El marco describe niveles de resiliencia del { "0" } al { "4" } construidos a partir de ocho requisitos numerados, y un enfoque de evaluación que combina el análisis estático con un análisis dinámico en el que vectores de prueba sustituyen a las amenazas. No tiene un esquema propio de identificadores de requisitos, de modo que las referencias que siguen son sus números de nivel y de requisito y sus números de sección. Está basado en resultados y no cataloga amenazas.

# text
# c1: kshana compliance-report
seg-ff0e00610721 = Cada fila indica qué salidas de Kshana <b>aportan evidencias a favor de</b> el requisito y qué queda pendiente. Nada de lo aquí expuesto dice que un marco se satisfaga ni que ningún producto haya sido calificado o aprobado por nadie. Ejecute <c1/> sobre sus propios archivos de resultados para ver qué filas respaldan realmente sus ejecuciones; véase <a1>README.md</a1>.

# text
seg-30c8cabb6e90 = Documentos fuente

# text
seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: versión { "2.0" }, { "26" } de abril de { "2022" } (DHS Science and Technology Directorate, con CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Leído el 2026-10-09: documento leído íntegramente; no se consultó la página de presentación de la publicación.

# text
seg-955191e0baab = Correspondencia

# text
seg-6ba8f74126ee = Qué exige (parafraseado)

# text
seg-0438151025da = Salidas de Kshana que aportan evidencias a favor de ello

# text
seg-3f265e18f56c = Brecha

# text
seg-4263435e702a = Sección { "5.2" } (Prevent, Respond, Recover)

# text
seg-e7b721f6e216 = La resiliencia se describe como tres funciones: prevenir el daño, responder (detectar, notificar, mitigar, contener) y recuperarse. La detección es probabilística, por lo que importan tanto las falsas alarmas como las detecciones fallidas.

# text
seg-3447d3b53fe8 = Evaluación de la confianza del registro del receptor; Detección de spoofing y meaconing; Holdover y marcha libre

# text
seg-ab055a50e16e = La prevención es una propiedad del diseño del producto que ninguna salida de simulación muestra. Las estadísticas de detección de una ejecución sintética o de una sola sesión no son una tasa medida de falsas alarmas o de detecciones fallidas de un producto en servicio.

# text
seg-501badd6a436 = Nivel { "1" }, requisito { "1" }

# text
seg-e8cfbe121084 = Comprobar que los datos almacenados que llegan de fuentes externas se ajustan a los formatos y a los intervalos de valores de las normas pertinentes.

# text
seg-7d7196aefa05 = Una propiedad de garantía de software y de validación de entradas del producto sometido a prueba. Kshana no inspecciona el tratamiento de entradas de un producto.

# text
seg-6085030de980 = Nivel { "1" }, requisito { "2" }

# text
seg-e8cd6fb732ad = Permitir una recuperación manual completa borrando o reiniciando la memoria, devolviendo el sistema a un rendimiento definido una vez desaparecida la amenaza.

# text
seg-8d216d42c776 = Evaluación de la confianza del registro del receptor

# text
seg-e3ca721d9d2e = Un registro de receptor muestra cuándo una posición dejó de ser fiable y cuándo se recuperó; no muestra que un reinicio manual borre todos los estados almacenados.

# text
seg-2c78c15cea96 = Nivel { "1" }, requisito { "3" }

# text
seg-ab9458f8b8fc = Recargar o actualizar el firmware de forma segura.

# text
seg-3a50eceb47f5 = La seguridad de la actualización del firmware queda fuera de lo que observa cualquier salida de Kshana.

# text
seg-752a194674f6 = Nivel { "2" }, requisito { "4" }

# text
seg-a5f263a083c7 = Identificar las fuentes PNT comprometidas e impedir que corrompan la solución.

# text
seg-4e7034acccc0 = Detección de spoofing y meaconing; Evaluación de la confianza del registro del receptor; Monitorización de la integridad y niveles de protección

# text
seg-d5fdef2a78f2 = Kshana puntúa detectores y monitores que modela o que ejecuta sobre un registro; que funcione la exclusión de fuentes propia de un producto exige el estado interno del producto, no solo su registro.

# text
seg-e3ea1208fac9 = Nivel { "2" }, requisito { "5" }

# text
seg-c0219254fe8e = Recuperar las fuentes y el sistema automáticamente sin interrumpir la salida; se sigue proporcionando una solución durante la amenaza, con una degradación posiblemente no acotada.

# text
seg-3dd48cb65cb4 = Holdover y marcha libre; Evaluación de la confianza del registro del receptor

# text
seg-0c36c4a3eb4e = Las ejecuciones de holdover acotan la deriva modelada de un modelo de reloj o inercial indicado, no el comportamiento de recuperación propio del producto.

# text
seg-befbf4b94876 = Nivel { "3" }, requisito { "6" }

# text
seg-45410d1675be = Los datos corruptos de una fuente no deben contaminar a otra fuente.

# text
seg-ff808ce8ec48 = Fuentes PNT alternativas y diversas

# text
seg-ccf628643110 = Kshana ejecuta las fuentes en paralelo; el aislamiento de fuentes dentro de un producto exige una revisión del diseño o la inyección de fallos en el producto.

# text
seg-a1d5a3125697 = Nivel { "3" }, requisito { "7" }

# text
seg-db149ea618dd = Verificar de forma cruzada las soluciones de todas las fuentes y mantener acotada la degradación durante una amenaza.

# text
seg-4afa05ef42fa = Monitorización de la integridad y niveles de protección; Holdover y marcha libre; Fuentes PNT alternativas y diversas

# text
seg-8b1f938c0175 = La degradación acotada se muestra para los sensores modelados; no se observa la verificación cruzada propia del producto.

# text
seg-772244881e5b = Nivel { "4" }, requisito { "8" }

# text
seg-aff5161e6363 = Usar fuentes de tecnologías distintas frente a amenazas de modo común, sin degradación durante la amenaza.

# text
seg-587889f9881c = Fuentes PNT alternativas y diversas; Efectos del balance del enlace en jamming

# text
seg-65b96caf8d6b = Un argumento de modo común exige el conjunto real de fuentes del producto y una amenaza que las abarque; un escenario establece una, pero no demuestra que el producto carezca de una debilidad compartida.

# text
seg-3c4cc0793454 = Sección { "5.5" } (modo común)

# text
seg-a87c9808dd99 = Los mecanismos diversos no deben compartir una debilidad: por ejemplo, un jammer que cubra dos bandas anula la diversidad de bandas.

# text
seg-c10ba3bb01be = Efectos del balance del enlace en jamming; Puntuación de resiliencia sobre conjuntos de amenazas; Fuentes PNT alternativas y diversas

# text
seg-843fe2fc9e33 = La puntuación usa un conjunto de amenazas sintético, indicado como tal; no son datos de campo.

# text
seg-3158e7efd1a5 = Secciones { "8.1" } a { "8.3" } (evaluación)

# text
seg-3942d9cdc64b = La evaluación combina el análisis estático con un análisis dinámico en el que vectores de prueba sustituyen a las amenazas; las clases de prueba son el fallo de fuente, la interferencia y los fallos internos. Se nombra a los simuladores como método de prueba.

# text
seg-9d5c297c1ab9 = Evaluación de la confianza del registro del receptor; Efectos del balance del enlace en jamming; Detección de spoofing y meaconing

# text
seg-bb02568e8f8f = El movimiento y los sucesos exportados pueden impulsar un simulador de laboratorio (docs/TEST-BENCH.md). Kshana no escribe ninguna señal, por lo que el simulador y su operador autorizado aportan la amenaza.

# text
seg-b81625e9e071 = Sección { "8.6" } (elementos del plan de pruebas)

# text
seg-27d645a79672 = Un plan de pruebas indica el nivel, el requisito, las entradas, las referencias, el acceso a datos necesario, el procedimiento con criterios de aprobación o fallo, los resultados y las notas.

# text
seg-1f2898855ccc = Procedencia reproducible de la ejecución; Evaluación de la confianza del registro del receptor

# text
seg-d8b08da48cb2 = Los criterios de aprobación o fallo los elige el evaluador; Kshana registra las entradas, los umbrales y los hashes con los que se ejecutó.

# text
seg-ccfdf53a1e54 = <s1>Anterior</s1>Mapeo de compliance

# text
seg-260ba950eb89 = <s1>Siguiente</s1>Orientaciones de la OMI para buques
