# docs--machine-inputs: translations (es)

# text
seg-e9650a618b38 = ID

# text
# c1: docs/MACHINE-INPUTS.md
seg-b9f561201fda = Fuente: <c1/>

# text
seg-536f71da4541 = Entradas de máquina y de sensor ({ "0.38" })

# text
# c1: receiver-trust
seg-1a91f96f22ab = Lectores que incorporan otros receptores, solucionadores y sensores al tipo <c1/>. Todos son de solo lectura: funciones puras sobre bytes o texto que devuelven la misma línea temporal que devuelven los lectores de UBX, RINEX, Android y NMEA, omitiendo y contando los registros dañados en lugar de fallar. Todo aquí es MODELLED: los formatos se leen de documentación pública y ningún resultado está validado frente a una referencia independiente externa más allá de lo indicado.

# text
seg-3176ffff1e44 = <b>Software de carácter consultivo.</b> No es un equipo de navegación homologado. El operador sigue siendo responsable de la navegación segura del buque.

# attr:alt
seg-367ac9b4a8a6 = Lo que `kshana imu-fit` extrae de un registro de IMU estacionaria, a partir de una ejecución real del motor v{ $version } sobre un registro inventado ({ "20,000" } muestras a { "100" } Hz, { "200" } s): el paseo aleatorio de velocidad del acelerómetro q_va = { "4.02e-06" }, el paseo aleatorio de ángulo del giróscopo q_arw = { "9e-08" }, la inestabilidad del sesgo { "0.00296" } y las pendientes de Allan tempranas (-0.51 y -0.49; en torno a -0.5 donde domina el ruido blanco). La tabla contigua es el TOML que imprime el comando. El estimador se ha comprobado solo con registros sintéticos. Consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana.

# text
# c1: .pos
# c2: format = "rtklib-pos"
seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

# text
# c1: rnx2rtkp
# c2: yyyy/mm/dd hh:mm:ss.sss
# c3: GPST
# c4: UTC
# c5: JST
# c6: %
seg-3ba911ed9541 = El archivo de solución que escriben <c1/> y RTKPOST de RTKLIB. Se leen: la hora (calendario <c2/>, o semana GPS y segundos de la semana), la posición (latitud y longitud en grados con altura, o ECEF X/Y/Z convertidas a geodésicas) y el número de satélites. La escala de tiempo de la cabecera de columna (<c3/>, <c4/>, <c5/>) se conserva en la etiqueta. Los archivos en grados-minutos-segundos se rechazan. Las líneas que empiezan por <c6/> son líneas de cabecera.

# text
# c1: format = "novatel"
seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

# text
# c1: #BESTPOSA,...*crc
# c2: AA 44 12
seg-b73d1465ed67 = Registros ASCII (<c1/>) y binarios (cabecera <c2/>), mezclados libremente. Los formatos siguen la documentación pública de OEM7 (docs.novatel.com): las cabeceras de mensaje, el CRC de 32 bits y las tablas de campos de tres registros. Los registros cuyo CRC no coincide se omiten y se cuentan.

# text
seg-078e047b9f82 = Registro

# text
seg-5b59f661e68b = Usado

# text
# c1: SOL_COMPUTED
seg-286c3fb8ac5c = estado de la solución (solo <c1/> da una solución), latitud, longitud, altura sobre el nivel medio del mar más ondulación (la altura de la solución es elipsoidal), satélites usados

# text
seg-3edaffed5d65 = C/No por señal (dB-Hz); sistema a partir de los bits 16-18 del estado de seguimiento, tipo de señal a partir de los bits 21-25

# text
# c1: self_report
# c2: receiver-self-report
# c3: NovatelRead.status
seg-5663c6812797 = el bit { "15" } del estado del receptor (inhibidor detectado) pasa a ser <c1/> de la época (inhibición { "2" } señalada, { "1" } no; RXSTATUS no tiene indicador de suplantación), comparado con las alarmas de Kshana por <c2/>; los { "1" } bits auxiliares de inhibidor (RF1-RF6) se devuelven en <c3/>

# text
# c1: BESTPOSA
seg-61d8ec169a17 = La rutina de CRC se comprobó con el CRC que la documentación indica para su propio ejemplo de <c1/> (citado, no reproducido); las pruebas usan líneas escritas por nosotros. No se leen: ASCII abreviado ni otros registros. El indicador de inhibidor es el propio informe del receptor, no un hallazgo de Kshana; la coincidencia con los monitores de Kshana no es validación.

# text
# c1: format = "gnss-sdr"
seg-b6c3919c87ad = GNSS-SDR (<c1/>)

# text
# c1: integrations/gnss-sdr/README.md
# c2: nmea
# c3: rinex
# c4: relay.py
# c5: gnss-sdr
seg-0cc992f8d61b = Véase <a1><c1/></a1>. Las salidas NMEA y RINEX de GNSS-SDR ya se leen con <c2/> y <c3/>; los flujos UDP de Monitor y de monitor PVT (Protocol Buffers) los retransmite <c4/> como líneas JSON y se leen con <c5/>.

# text
# c1: [log.imu]
seg-cf1bf4944f6a = IMU (<c1/>)

# text
# c1: format = "csv"
# c2: t_s
# c3: gx
# c4: gy
# c5: gz
# c6: ax
# c7: ay
# c8: az
# c9: format = "euroc"
# c10: imu0
# c11: data.csv
# c12: #timestamp [ns]
# c13: w_RS_S_x/y/z [rad s^-1]
# c14: a_RS_S_x/y/z [m s^-2]
# c15: t_s = 0
# c16: RECEIVER-TRUST.md
seg-ab64a0754907 = <c1/>: una fila de cabecera que nombra las columnas y después una muestra por fila. Columnas (en cualquier orden, nombres sin distinguir mayúsculas): <c2/> segundos en el reloj del registro del receptor, <c3/>, <c4/>, <c5/> velocidad angular en rad/s, <c6/>, <c7/>, <c8/> fuerza específica en m/s². <c9/>: el formato EuRoC MAV <c10/> <c11/> (<c12/>, <c13/>, <c14/>); la primera muestra es <c15/>. Las filas que no se analizan y las filas cuyo tiempo no aumenta se omiten. Véase <a1><c16/></a1> para saber cómo se usa el rumbo del giróscopo.

# text
# c1: kshana imu-fit
seg-f7007cf35f53 = IMU en los escenarios híbridos y de fusión (<c1/>)

# text
# c1: hybrid
# c2: fusion
# c3: [accel_quantum]
# c4: [accel_classical]
# c5: bias
# c6: q_va
# c7: gyro_bias
# c8: q_arw
# c9: bias_instability
# c10: imu-fit
seg-3fc254763f67 = Los escenarios <c1/> y <c2/> (UKF de 17 estados) son simulaciones: toman parámetros de ruido del sensor (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), no una serie medida. <c10/> lee esos parámetros de un registro de IMU estacionaria, de modo que un escenario puede ejecutarse con el sensor que realmente se tiene:

# text
# c1: allan::overlapping_adev_curve
# c2: q_va = (sigma(tau0) sqrt(tau0))^2
# c3: q_arw
# c4: bias
# c5: gyro_bias
# c6: bias_instability
# c7: q_aa
# c8: imu_fit
# c9: imu_fit
# c10: fit_imu_log
# c11: /kshana-fit-imu
seg-86efab73b2e6 = Método: la desviación de Allan solapada de la señal integrada (<c1/>): <c2/>, lo mismo para el giróscopo z (<c3/>), <c4/> y <c5/> como las medias, y <c6/> como el mínimo de la curva cuando esta sube después de él. <c7/> no se ajusta (requiere un registro mucho más largo que el mínimo). El informe incluye la tasa y la duración del registro y la pendiente de Allan temprana de cada canal (en torno a -0.5 donde domina el ruido blanco); un registro que no esté quieto, que sea demasiado corto (menos de { "2000" } muestras) o que tenga un muestreo desigual se rechaza o da parámetros que las pendientes señalan. La procedencia de la tabla nombra el SHA-256 del registro. MODELLED: el estimador se comprueba con registros sintéticos de ruido blanco con coeficientes conocidos (recuperados con una diferencia de hasta { "10" } %), no frente a una referencia independiente externa. Disponible en la CLI, Python (<c8/>), WebAssembly (<c9/>), MCP (<c10/>) y el complemento (<c11/>).

# text
# c1: format = "rtcm3"
seg-b3c592f63798 = RTCM { "3" } MSM4 y MSM7 (<c1/>)

# text
seg-0f8b986cff40 = Un flujo de bytes de tramas RTCM { "3" } (la salida de observación de una estación base o de un receptor). Se leen: mensajes MSM4 y MSM7 (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): la época y la relación portadora a ruido de cada celda de señal (MSM4: { "6" } bits, dB-Hz; MSM7: { "10" } bits, 1/16 dB-Hz), que es lo que necesitan los monitores de C/N0. Los campos de seudodistancia y de fase se saltan, no se usan, de modo que RTCM aporta a los monitores de confianza la C/N0 y nada más; MSM no contiene posición. Las tramas con un CRC-24Q erróneo se omiten y se cuentan.

# text
# c1: NOTICE
# c2: GPS TOW <s>
seg-d70038a737dc = <b>De dónde sale la disposición.</b> No del estándar RTCM (un documento de pago, no consultado): sino del decodificador de código abierto pyrtcm { "1.2.0" }, BSD 3-Clause, cuya licencia y aviso están en <c1/> (decisión del propietario del { "18" } de octubre de { "2026" }: "usar decodificadores abiertos"). pyrtcm indica que sus tablas siguen RTCM { "10403.3" }; Kshana se apoya en las tablas publicadas bajo la licencia de pyrtcm y no hace ninguna afirmación sobre el estándar. Tiempo: MSM no lleva semana, por lo que las etiquetas dicen <c2/>; las épocas de GLONASS (hora de Moscú) se pasan a tiempo GPS con GPS-UTC = { "18" } s (el valor desde 2017-01-01).

# text
# c1: 123456789
# c2: 0xCDE703
seg-ee04a86f8f00 = Comprobado frente a: el valor de comprobación del catálogo de CRC-24Q (<c1/> da <c2/>) y, una sola vez durante el desarrollo, el propio decodificador de pyrtcm sobre las mismas tramas escritas por nosotros (la misma C/N0). Los datos de prueba están escritos por nosotros; no se tomó ninguna captura de un receptor real, de modo que el lector es MODELLED hasta que lea una.

# text
seg-94f0e4db92df = <s1>Anterior</s1>Jammertest como árbitro

# text
seg-8d660b4049e4 = <s1>Siguiente</s1>Protocolos de receptor leídos

# text
seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

# text
seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

# text
seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

# text
seg-b0b5f9a66eed = IMU ([log.imu])

# text
seg-03a6e15dce0a = IMU en los escenarios híbridos y de fusión (kshana imu-fit)

# text
seg-53ce2c4ba434 = RTCM { "3" } MSM4 y MSM7 (format = "rtcm3")
