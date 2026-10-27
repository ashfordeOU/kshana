# docs--kind-gnss-ins: translations (es)

# text
seg-b054c73f22e5 = sin valor

# text
seg-ee7dd15019d0 = Página de tema: <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-7b2721b7588d = Tipo de escenario del motor v{ $version }, familia <a1>Sensores inerciales, de fusión y cuánticos</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro de interferómetro de átomos fríos a partir de primeros principios (k_eff·T², QPN). Referencia independiente (ExternalDataset): vectores numéricos publicados de artículos primarios de CAI (función de transferencia de Cheinet { "2008" }; sensibilidad de Peters/Freier): k_eff·T² coincide exactamente, el suelo unilateral de la ASD de ruido de disparo dentro de ~{ "2" }× de cada instrumento publicado (los dispositivos reales llevan ruido técnico por encima del suelo cuántico). Una cota, no una paridad. { "0.30" } ronda { "2" } (preregistrada fcb9ac64), un hallazgo (sigue siendo MODELLED): el ruido de rotación solo de QPN frente al medido por Gauguet et al.

# text
seg-9955b1b1c018 = El rendimiento de un sensor inercial cuántico es MODELLED, no está validado: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página de familia: <a1>Sensores inerciales, de fusión y cuánticos</a1>

# text
# c1: docs/kinds/by-kind/gnss-ins.md
seg-fd8fad481c81 = Fuente: <c1/>

# text
# c1: gnss-ins
seg-e726a6d74d81 = <c1/> (tipo de escenario)

# text
seg-38df285a3f25 = EKF de estado de error GNSS/INS con acoplamiento débil y fuerte.

# text
# c1: scenarios/gnss-ins.toml
seg-e1e235215947 = Una ejecución de <c1/> se resume así: scenario c55a6246bd6f | gnss-ins | quantum outage-RMS fused 1.9m vs free 130.7m (hold 60s, avail { "1.00" }) | classical fused 3.1m vs free 314.3m (hold 60s, avail { "1.00" })

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: imu_quantum
# c6: imu_classical
seg-e3112eac77af = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: fix_interval_s
# c2: sigma_pos_m
# c3: sigma_vel_mps
# c4: lat_deg
# c5: lon_deg
# c6: alt_m
# c7: trajectory
# c8: tight
seg-6c128eb60a91 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/gnss-ins.toml
seg-79c75d3e461d = El ejemplo <c1/> establece, entre otros:

# text
seg-ca448daf5ec7 = nominal

# text
seg-49f2fa051719 = denegado

# text
seg-327a2c4885bd = Unidad inercial MEMS/cuarzo de grado táctico: mayor residuo de ses

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# attr:alt
seg-7d993b676006 = El gráfico que escribe el motor para scenarios/gnss-ins.toml, tipo de escenario gnss-ins

# text
seg-ea4498cc0324 = <b>VALIDATED</b> EKF de estado de error de 15 estados, con acoplamiento débil (validado en una conducción real con IMU/GNSS frente a NaveGo); un UKF de pseudodistancia/Doppler con acoplamiento fuerte y un reloj+pos acoplado. Referencia independiente (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, ejecutado como herramienta bajo GNU Octave, nunca enlazado): su ins_gnss de acoplamiento débil sobre su propia conducción real de vehículo terrestre con IMU/GNSS Ekinox, con ambas soluciones puntuadas frente a la trayectoria de referencia de Ekinox. Ambos filtros leen la misma entrada float32 de { "20" } Hz, y la configuración de Kshana se asigna mecánicamente a partir de los parámetros publicados del conjunto de datos. El RMS de posición horizontal y vertical de Kshana y su

# text
seg-742a29ca1fb7 = Página de tema: <a1>TEST-BENCH.md</a1>

# text
seg-f3cc3d82aba8 = <s1>Anterior</s1>fusion

# text
seg-af503aa1d900 = <s1>Siguiente</s1>gnss-sim
