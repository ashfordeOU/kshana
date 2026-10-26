# docs--kind-orbit: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Tipo de escenario del motor v{ $version }, familia <a1>Constelaciones, cobertura y geometría</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-a4f1e7d2041e = Página de familia: <a1>Constelaciones, cobertura y geometría</a1>

# text
seg-be831b52a339 = y { "4" } más en la matriz.

# text
seg-a8d92406e428 = Reloj óptico de red de estroncio, objetivo orientado al espacio sigma_y

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Desviación de Allan / modificada / de Hadamard + identificación de ruido de ley de potencias con intervalos de confianza χ². Referencia independiente (ExternalDataset): NIST SP { "1065" } (Riley) / desviaciones de referencia de Stable32 en NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Crecimiento del error de inercia en forma cerrada + holdover hasta el umbral; clases de reloj cuántico. Referencia independiente (ReferenceImpl): Recursión de covarianza de clock_state en varios pasos (comprobación cruzada en el mismo código base); el núcleo subyacente de varianza de inercia e inversión de holdover está validado externamente frente a scipy (véase «Clock-holdover coast-variance & threshold inversion»). Las cifras de holdover por clase con suelo de ruido rojo siguen siendo MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Reloj de Kalman de 3 estados (fase/frecuencia/deriva) de van Loan, estabilizado de Joseph. Referencia independiente (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), con F mediante scipy.linalg.expm y Q mediante la matriz por bloques de Van Loan { "1978" } — una implementación de referencia independiente que reproduce la trayectoria completa del filtro de kshana. Consistencia entre implementaciones: la física del reloj y la calibración de Allan no están validadas externamente, por lo que esto sigue siendo MODELLED. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): en relojes finales de IGS de { "30" } s de { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> Chi-cuadrado asistido por reloj, RAIM, AGC, FoM de seguridad por época fusionada con SQM. Referencia independiente (ExternalDataset): parámetros de escenario de TEXBAT (Humphreys { "2012" }) — caracterización, no vectores fijados. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): en JammerTest { "2024" } (Bleik; datos GPL-3.0) los monitores de nivel de observable (chi-cuadrado asistido por reloj, RAIM, fallo de solución) no dieron ninguna alarma dentro de { "10" } s de ninguno de los { "8" } inicios de suplantación publicados evaluables (donde la ventana previa al inicio estaba limpia, la primera alarma llegó entre { "10.2" } y { "39" } s después del pu

# text
seg-e12f672ae71d = El holdover del reloj sin GNSS es MODELLED, no está validado: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = La estimación del estado del reloj de a bordo es MODELLED, no está validada: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = La detección de spoofing es MODELLED, no está validada: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-d291f20074f0 = <b>VALIDATED</b> Rotación terrestre a partir de una fecha juliana UT1 en dos partes en la ruta de la órbita, de modo que la posición fija a la Tierra conserva el microsegundo que pierde una fecha en un único f64 (unos { "3e-9" } rad hacia { "2020" }): jd2::gmst82 (GMST de IAU { "1982" }, la convención TEME, sobre las dos partes), cio:

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP a partir de la geometría de línea de visión mediante Q=(HᵀH)⁻¹ con una descomposición ENU local. Referencia independiente (ExternalDataset): DOP de gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — biblioteca independiente, coincidente a { "1e-6" } relativo

# text
seg-53a78e98af12 = Página de tema: <a1>SKYLINE.md</a1>

# text
seg-ae15d15bf151 = Página temática: <a1>LEO-PASS.md</a1>

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.
