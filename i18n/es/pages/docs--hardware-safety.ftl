# docs--hardware-safety: translations (es)

# text
seg-fdbb9db68f1d = ninguna

# text
# c1: docs/HARDWARE-SAFETY.md
seg-2015f437e669 = Fuente: <c1/>

# text
seg-10c7eaab58c5 = Seguridad del hardware: qué hace Kshana con el hardware y qué no hace nunca

# text
seg-fe4873962140 = <b>Estado: revisión jurídica del propietario pendiente.</b> Las notas jurídicas de más abajo son la lectura que hacen los responsables de fuentes públicas, escrita para que el usuario sepa dónde están los límites. No son asesoramiento jurídico, no las ha revisado un abogado y la ley difiere según el país. Léalas como un motivo para consultar a un abogado, no como un permiso.

# text
seg-bd2fbb355834 = Software de carácter consultivo para investigación, simulación y ensayo. No es un equipo homologado y no califica ni aprueba un receptor, un reloj ni un laboratorio. Véase la declaración de carácter consultivo en el README.

# text
seg-f27c286787b1 = La regla

# text
seg-88638e41faab = Recibir es el producto. Transmitir nunca forma parte del motor abierto.

# text
seg-614d381dd0d0 = Kshana no contiene ningún código que controle un transmisor. No hay ninguna ruta de transmisión SDR (ninguna llamada de transmisión de UHD, HackRF, bladeRF o Soapy), y ninguna forma de onda de jamming o spoofing se escribe en un archivo destinado a su reproducción.

# text
# c1: .sdrx
# c2: kshana iq scene
# c3: .sdrx
seg-2e370a1c6c4c = Los archivos que escribe Kshana (escenas IQ, grabaciones SigMF e ION <c1/>, exportaciones NMEA y de bench) describen señales o movimientos <b>simulados y legítimos</b>, y los metadatos que Kshana escribe para una escena indican que la escribió <c2/> (el comentario de ION <c3/> indica que es una escena simulada, no una grabación).

# text
seg-8ce652bc1af6 = Cuando un experimento necesita RF en un banco de pruebas, la produce el <b>equipo propio del operador</b>, en el recinto propio del operador y bajo la autorización propia del operador. Kshana registra lo que el operador dice que se hizo y nunca lo infiere.

# text
seg-c74fc5d82071 = Etapas

# text
seg-01e7633921dc = Cada etapa indica qué hace Kshana, qué hardware interviene, quién emite RF (si alguien lo hace) y la puerta de control que debe satisfacerse antes de que Kshana trate el resultado como evidencia.

# text
seg-324e16b11186 = Etapa

# text
seg-bb269645d988 = Función de Kshana

# text
seg-76c0861cbe83 = Hardware

# text
seg-92ab27525ed1 = Emisión de RF

# text
seg-c822f981cfcf = Puerta de control

# text
seg-00727bb577f9 = Estado en { "0.38" }

# text
seg-1c566ec98a03 = Archivos: registros de reproducción, IQ, exportaciones de bench, NMEA o UBX en vivo por stdin, TCP o UDP

# text
seg-0435986aa760 = incluido en la versión

# text
# c1: iq monitor --follow
seg-56b9a4399108 = Recepción pasiva: receptores de solo lectura; registros de temporización (linuxptp, chrony, TICC); CSV de IMU; <c1/> sobre un archivo SigMF en crecimiento

# text
seg-608fc0a99107 = los receptores, el grandmaster y el SDR en recepción del usuario

# text
# c1: --configure
seg-786d9e5ccf93 = cualquier escritura de configuración en un receptor requiere un <c1/> explícito; por defecto es de solo lectura

# text
# c1: holdover-test
# c2: iq monitor --follow
seg-ab8874046283 = incluido en parte: formatos de registro de temporización, <c1/>, <c2/>; la entrada de receptor por puerto serie está prevista

# text
seg-6b0a194d3f64 = Orquestación de laboratorio sin RF de Kshana: una especificación de condiciones de ensayo, pasos del operador (desconexión de la antena, arranque del simulador) solicitados y con marca de tiempo, puntuación de ida y vuelta y evidencia

# text
seg-8e2847bce9ac = simuladores propiedad del laboratorio, cajas apantalladas

# text
seg-121fe22c92ec = solo mediante el simulador <b>del laboratorio</b>, por conducción

# text
# c1: lab-attestation
seg-0a704c5443c5 = un <c1/> firmado (más abajo) registrado en el paquete de evidencias; Kshana se niega a puntuar una ejecución de laboratorio sin él

# text
seg-9e94d44cd197 = el registro está implementado en los paquetes de evidencias; la negativa a puntuar sin él aún no (no existe ningún comando de ejecución de laboratorio)

# text
seg-ee5333e346ad = Reproducción por conducción de escenas IQ GNSS <b>legítimas</b>: Kshana escribe el archivo de la escena y el usuario lo reproduce con su propia herramienta a través de un cable con atenuadores y un dispositivo bajo prueba dentro de un recinto de RF

# text
seg-fa5b0f1b41f7 = el SDR, los atenuadores y el recinto del usuario

# text
seg-9049203a2a6e = solo por conducción, responsabilidad del usuario

# text
seg-b4392e583cb8 = ningún código de transmisión en el motor abierto; las formas de onda de interferencia y de spoofing quedan fuera del alcance; revisión de control de exportaciones; asesoría jurídica

# text
seg-ced2afbf108f = no está en el motor abierto; un elemento de la edición comercial que debe tratarse con asesoría jurídica

# text
seg-0f8a0fce4d20 = Hardware en el bucle de RF en bucle cerrado y en tiempo real

# text
seg-d109f8e36ce8 = equipo del socio

# text
seg-fb26b352f56e = socio

# text
seg-38c768d5faa7 = integrar mediante la especificación de la etapa { "2" }

# text
seg-458f37b807ba = no previsto

# text
seg-2e59d363e31b = "Incluido en la versión" significa que el código está en esta versión. Nada de esta tabla afirma que ninguna etapa se haya usado con ningún socio, laboratorio o autoridad; ninguna lo ha sido.

# text
seg-1524fb5b0aba = Principios

# text
seg-82b8ed15bbe6 = Recibir es el producto, y transmitir nunca forma parte del código abierto.

# text
seg-63c000eccfc2 = Cada sesión de hardware produce un paquete de evidencias con los hashes de las entradas, las condiciones y los umbrales usados.

# text
seg-63cc5d9513ff = Una atestación de conducción o de apantallamiento se registra, nunca se infiere.

# text
seg-da1e4f5da956 = Las cifras que proceden del hardware siguen siendo <b>MODELLED</b> hasta que una referencia independiente externa coincida (por ejemplo, una trayectoria de verdad de laboratorio o un reloj de referencia). Un umbral fijado de antemano no se relaja después de una ejecución.

# text
seg-d8e445427d02 = Las antenas con diagramas controlados, las unidades inerciales y los relojes atómicos a escala de chip se tratan como fuentes de datos (diagramas, registros, curvas de estabilidad publicadas), no como dispositivos que Kshana controla.

# text
seg-7a22a9591fa3 = Redacción: un resultado está "medido frente a la máscara" o "aporta evidencias a favor de" un requisito. Kshana no dice que un dispositivo alcance una norma, y nadie lo ha calificado ni aprobado.

# text
seg-913509e5d6b2 = Notas jurídicas (revisión jurídica del propietario pendiente)

# text
seg-c18b68936406 = Recibir señales GNSS es legal casi en todas partes. Transmitir en las bandas GNSS no lo es.

# text
seg-070d8a8d5494 = <b>Estados Unidos.</b> La interferencia deliberada en las radiocomunicaciones está prohibida por { "47" } U.S.C. §{ "333" }, y la FCC actúa contra los inhibidores (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Una transmisión desde un banco de pruebas puede llegar más allá de este.

# text
seg-336b48c6f5f2 = <b>En otros lugares.</b> Los responsables no han revisado la legislación de otros países. La comunidad de gps-sdr-sim afirma que transmitir su salida está prohibido por ley en la mayoría de los países; trátese como supuesto de trabajo dondequiera que un asesor jurídico no haya indicado otra cosa.

# text
seg-8d31cbd38718 = <b>Una configuración apantallada o por conducción es una salvaguarda, no una licencia.</b> La atestación que figura más abajo registra la salvaguarda que el operador dice que estaba en vigor. No hace lícita ninguna emisión.

# text
# c1: iq monitor --follow
seg-7373bfd21035 = <b>Grabación.</b> Grabar señales de radio puede plantear cuestiones de privacidad y de legalidad en algunos lugares. <c1/> y cualquier receta de captura son solo de recepción, y el operador es responsable de dónde y qué graba.

# text
seg-2edf9b14e62c = <b>Control de exportaciones.</b> El software de hardware en el bucle que controla generadores de señal puede estar sujeto a normas de control de exportaciones. Por eso la etapa { "3" } queda fuera del motor abierto.

# text
seg-bcd59f201022 = <b>Nada de lo aquí expuesto es un aval ni un acuerdo.</b> Ningún regulador, campo de pruebas, laboratorio o proveedor ha sido consultado sobre este documento ni ha acordado nada de lo que contiene.

# text
# c1: lab-attestation
seg-81091020e648 = El campo <c1/>

# text
# c1: lab-attestation
seg-64918fd6895d = Desde la etapa { "2" } en adelante, una ejecución que haya implicado equipo de laboratorio lleva un objeto <c1/>, registrado en el paquete de evidencias junto a los hashes de las entradas. Es una declaración de un operador identificado, no una medición, y Kshana no la verifica.

# text
seg-3bf153c63fa3 = Lo que está implementado en { "0.38" }:

# text
# c1: kshana receiver-trust evidence ... --lab-attestation <file.toml>
# c2: manifest.json
# c3: lab_attestation
# c4: evidence_create
# c5: lab_attestation_toml
# c6: create_evidence_pack
seg-bf212e141046 = <c1/> valida el archivo y registra la atestación en el <c2/> del paquete. El manifiesto queda cubierto por la firma Ed25519 del paquete, de modo que el registro no puede editarse sin romper la verificación. Lo mismo está disponible como el argumento <c3/> de <c4/> en Python y el argumento <c5/> de la herramienta <c6/> de MCP (la compilación para navegador no crea paquetes).

# text
seg-431036f13a37 = Un paquete creado sin atestación es, byte a byte, idéntico a lo que era antes.

# text
# c1: kshana evidence verify
seg-4360b8fbdafb = <c1/> informa de la atestación y dice que está "atestada por el operador indicado; no verificada por Kshana".

# text
# c1: setup
# c2: conducted
# c3: shielded
seg-438bbe788314 = Una atestación incompleta, o cuyo <c1/> no es ni <c2/> ni <c3/> (una configuración por el aire no se acepta como ejecución de laboratorio), se rechaza y no se crea ningún paquete.

# text
seg-c8c40ed88dde = Lo que <b>no</b> está implementado todavía: la regla de la etapa { "2" } por la que Kshana se niega a <em>puntuar</em> una ejecución de laboratorio que no tenga atestación. Ningún comando admite un indicador de ejecución de laboratorio en { "0.38" }, así que no hay nada que rechazar; la regla llegará con los comandos de orquestación de laboratorio. Una atestación registra la declaración del operador sobre una salvaguarda. No hace lícita ninguna emisión y no cambia la etiqueta de un resultado: una ejecución de laboratorio puntuada es MODELLED a menos que una referencia independiente externa coincida.

# text
seg-b0db377bce58 = Qué significa esto para quien contribuye

# text
seg-c2e215edd86c = No añada una ruta de transmisión, una dependencia de transmisión ni un ejemplo de transmisión al motor abierto.

# text
seg-452b44a9ca8a = No añada un generador de formas de onda cuya salida sea una señal de jamming o de spoofing destinada a su reproducción.

# text
seg-4df4d15a5f1c = Las nuevas entradas de hardware son de solo lectura por defecto; una escritura requiere un indicador explícito y una línea en este archivo.

# text
# c1: SURFACES.md
seg-ee5f1fa9b822 = Un comando nuevo que toque hardware se incluye en todas las superficies o se marca como N/A con un motivo en <a1><c1/></a1>, e indica aquí su etapa.

# text
seg-7d65c3565acd = <s1>Anterior</s1>Formatos de registro de reloj

# text
seg-82eb53d4efbd = <s1>Siguiente</s1>Integridad y seguridad

# text
seg-8a78e520fc9e = El campo lab-attestation
