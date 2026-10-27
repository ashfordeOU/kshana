# docs--kind-mars-pnt: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Tipo de escenario del motor v{ $version }, familia <a1>Constelaciones, cobertura y geometría</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> El tipo de escenario <c1/>: un orbitador o un módulo de aterrizaje en superficie alrededor de un cuerpo elegido por nombre navega con pseudodistancias unidireccionales de una constelación de navegación Walker en torno al cuerpo (órbitas de dos cuerpos con la deriva secular J2 del cuerpo, un reloj de usuario desconocido

# text
seg-a4f1e7d2041e = Página de familia: <a1>Constelaciones, cobertura y geometría</a1>

# text
seg-670191cf797f = Página de tema: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Reloj de Kalman de 3 estados (fase/frecuencia/deriva) de van Loan, estabilizado de Joseph. Referencia independiente (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), con F mediante scipy.linalg.expm y Q mediante la matriz por bloques de Van Loan { "1978" } — una implementación de referencia independiente que reproduce la trayectoria completa del filtro de kshana. Consistencia entre implementaciones: la física del reloj y la calibración de Allan no están validadas externamente, por lo que esto sigue siendo MODELLED. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): en relojes finales de IGS de { "30" } s de { "11" } GPS Blo

# text
seg-8de95b3a9229 = La estimación del estado del reloj de a bordo es MODELLED, no está validada: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/mars-pnt.md
seg-c68502b9d675 = Fuente: <c1/>

# text
# c1: mars-pnt
seg-46072326d616 = <c1/> (tipo de escenario)

# text
seg-3f749aef8d89 = PNT de espacio profundo en Marte: una constelación simulada de relés MARCONI (relés areoestacionarios e inclinados que emiten en un sentido y retransmiten en ambos sentidos a una estación de espacio profundo) navega a un usuario de referencia (transfer | lmo | surface) mediante el estimador de fusión radiométrica conjunta unidireccional y bidireccional. Indica la geometría y la visibilidad por época, el RMS alcanzado frente a la verdad, y la covarianza formal (posición 1σ / 3σ): una cifra de mérito simulada honesta, NO un nivel de protección certificado.

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-0254f9bd0ee6 = Una ejecución de <c1/> se resume así: mars-pnt 5aad87fcc94a | usuario lmo, reloj uso | { "5" } relés (media { "3.1" } a la vista) | RMS de posición convergido { "0.25" } m, 1σ formal { "0.31" } m (3σ { "0.93" } m: cifra de mérito de covarianza, no un PL certificado) | σ de frecuencia del reloj { "3.71e-13" } | cov-PD true

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-8eb513e7aeea = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-5a9640a3f9b4 = El ejemplo <c1/> establece, entre otros:

# text
seg-8e0fecea19fc = uso

# text
seg-a16f2332397c = lmo

# attr:alt
seg-c564dca90854 = El gráfico que el motor genera para scenarios/mars-pnt-lmo.toml, tipo de escenario mars-pnt

# text
seg-83c3a84f6b98 = <b>VALIDATED</b> Recuperar un estado de época [r,v] a partir de distancias desde estaciones terrestres mediante un corrector diferencial por lotes de Gauss–Newton y un filtro secuencial, sobre un modelo de fuerzas de dos cuerpos+J2. Referencia independiente (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF): una biblioteca de estimación de terceros independiente sobre un modelo de fuerzas equivalente; el estado de época recuperado y el RMS de los residuos posteriores al ajuste coinciden hasta <{ "1e-3" } m sin ruido y <{ "3" } m con un suelo de ruido de { "5" } m

# text
seg-4be479b81f39 = <s1>Anterior</s1>lunar-vlbi

# text
seg-2854e6a75833 = <s1>Siguiente</s1>moonlight-service-volume
