# docs--kind-ntn-positioning: translations (es)

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
seg-a3697ad561db = Hz

# text
seg-a849735fcc6e = Página de tema: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Tipo de escenario del motor v{ $version }, familia <a1>Navegación en órbita terrestre baja</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-c5478f572d21 = Página de familia: <a1>Navegación en órbita terrestre baja</a1>

# text
# c1: docs/kinds/by-kind/ntn-positioning.md
seg-8dcdfc5da900 = Fuente: <c1/>

# text
# c1: ntn-positioning
seg-d865fd8ceef6 = <c1/> (tipo de escenario)

# text
seg-4f0edb786a35 = Posicionamiento a partir de un enlace descendente de una red no terrestre (NTN) 5G en la banda S del servicio móvil por satélite (MSS) (banda n256 de 3GPP, enlace descendente de { "2170" } a { "2200" } MHz; portadora por defecto { "2172.5" } MHz): la cota de Cramér-Rao (CRB) del tiempo de llegada, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)) con beta el ancho de banda cuadrático medio (de Gabor) del espectro OFDM plano (B/sqrt({ "12" })), y del Doppler de un tono complejo, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), para cada señal (por defecto un canal New Radio de { "5" } MHz con { "4.5" } MHz ocupados y un canal de banda estrecha de { "200" } kHz con { "180" } kHz ocupados); a continuación, sobre cualquier constelación LEO, fijaciones por tiempo de llegada del enlace descendente con un reloj de receptor desconocido (con semilla, con la cota más un error de sincronización de la red como sigma), su PDOP y su sigma 3D formal, y una fijación Doppler de un solo satélite sobre el pase más largo con la altura fija. MODELLED: el paso del ancho de banda a la cota es la forma cerrada de los libros de texto, comprobada frente a la integración numérica de los espectros BPSK plano y de banda limitada (autoconsistencia interna, sin ninguna cifra publicada de referencia fijada), y la precisión de posicionamiento es una cota sobre un canal sin multitrayecto con un error de sincronización indicado, no un resultado alcanzado.

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-fea5da29df00 = Una ejecución de <c1/> se resume así: posicionamiento 5G NTN a { "2172.5" } MHz, C/N0 de { "38" } a { "50" } dB-Hz, { "324" } satélites ({ "10.0" } a la vista) NR { "5" } MHz: { "4500" } kHz, distancia CRB de { "0.26" } a { "1.03" } m; 3D formal mediano { "2.09" } m, error RMS { "2.01" } m NB { "200" } kHz: { "180" } kHz, distancia CRB de { "6.49" } a { "25.85" } m; 3D formal mediano { "25.94" } m, error RMS { "26.73" } m pase Doppler de un satélite: { "53" } muestras a lo largo de { "520" } s, error horizontal { "1.9" } m

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-145582d62c8c = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-7ff965e77d23 = El ejemplo <c1/> establece, entre otros:

# text
seg-409755afa2dd = NR { "5" } MHz

# text
seg-a99a71f7178a = NB { "200" } kHz

# text
seg-d04c7f65307d = index

# text
seg-3a0cde9988c3 = Etiqueta del resultado (la del motor): posicionamiento MODELLED a partir de cotas de Cramér-Rao: el paso del ancho de banda a la cota es una forma cerrada de libro de texto (comprobada frente a la integración numérica, no frente a una cifra publicada de referencia); la precisión es una cota sobre un canal sin multitrayecto con un error de sincronización indicado, no un resultado alcanzado

# attr:alt
seg-c200240dd65e = El gráfico que el motor genera para scenarios/ntn-5g-positioning.toml, tipo de escenario ntn-positioning

# text
seg-056b5f3c8201 = <b>VALIDATED</b> La cota de Cramér-Rao del tiempo de llegada a partir del ancho de banda cuadrático medio (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), para un espectro OFDM plano (beta = B/sqrt({ "12" })), un espectro BPSK de banda limitada (numerador de forma cerrada) o cualquier espectro por cuadr Pruebas: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-c188cecaf468 = <b>VALIDATED</b> La cota de Cramér-Rao del tiempo de llegada a partir del ancho de banda cuadrático medio (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), para un espectro OFDM plano (beta = B/sqrt({ "12" }). Referencia independiente (ExternalDataset): Valores publicados de referencia (P1): Bachl, Lei y Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), cotas de un solo SSB de NR NTN reproducidas a partir del mapa SSB de 3GPP TS { "38.211" } mediante las propias funciones numéricas de Kshana (W_rms { "1.9616" } frente a { "1.96" } MHz, sigma_t { "38.755" } frente a { "39" } us, sigma_f 100.79/87.28 frente a 101/87 Hz, sigma_rho 0.5970/0.5831 frente a 0.60/0.58 m, cada una dentro de media unidad del último dígito impreso); anchos de banda RMS BPSK-R de Betz { "2001" } Tabla { "1" } (1.128/3.477 frente a

# text
# c1: label
seg-baa462153341 = Posicionamiento MODELLED a partir de cotas de Cramér-Rao: el paso del ancho de banda a la cota es una forma cerrada de libro de texto (comprobada frente a la integración numérica, no frente a una cifra publicada de referencia); la precisión es una cota sobre un canal sin multitrayecto con un error de sincronización indicado, no un resultado alcanzado (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-c4a9693d1191 = MODELLED: el paso del ancho de banda a la cota es la forma cerrada de los libros de texto, comprobada frente a la integración numérica de los espectros BPSK plano y de banda limitada (autoconsistencia interna, sin ninguna cifra publicada de referencia fijada), y la precisión de posicionamiento es una cota sobre un canal sin multitrayecto con un error de sincronización indicado, no un resultado alcanzado. (catálogo de tipos (<c1/>))

# text
seg-e23e35aa1203 = El paso del ancho de banda a la cota es una forma cerrada de libro de texto; la precisión de posicionamiento es MODELLED (una cota sobre un canal sin multitrayecto, no un resultado alcanzado). (comentario del archivo de escenario, líneas { "12" } a { "13" })

# text
seg-ccb921bf73b5 = <s1>Anterior</s1>moonlight-service-volume

# text
seg-467bd80c37f8 = <s1>Siguiente</s1>oem-interop
