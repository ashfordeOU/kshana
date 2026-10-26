# docs--kinds-inertial-fusion-and-quantum-sensors: translations (es)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-ec26df467b88 = PNT con fusión de sensores mediante un filtro de Kalman conjunto sobre las mismas entradas híbridas.

# attr:alt
seg-c8a1c797f4b1 = El gráfico que escribe el motor para scenarios/fusion-pnt.toml, tipo de escenario fusion

# text
seg-38df285a3f25 = EKF de estado de error GNSS/INS con acoplamiento débil y fuerte.

# attr:alt
seg-7d993b676006 = El gráfico que escribe el motor para scenarios/gnss-ins.toml, tipo de escenario gnss-ins

# text
seg-c6edf89eb8d4 = UKF híbrido cuántico + clásico GNSS/INS fuertemente acoplado de 17 estados (MODELLED): { "15" } estados de error INS + corrección del sesgo del acelerómetro derivada de CAI + un reloj de 2 estados (fase + frecuencia) del motor de reloj de parámetros q, accionado por el modelo de error de CAI acotado. La figura de mérito es la autocoherencia del filtro (NEES + blancura de la innovación frente a los límites χ²), una afirmación de autocoherencia, NO una garantía de precisión en el mundo real. Solo simulación; sin TRL>{ "3" }, sin herencia de vuelo, sin validación externa.

# attr:alt
seg-2968660fa880 = El gráfico que el motor escribe para scenarios/hybrid-ukf.toml, tipo de escenario hybrid-ukf

# text
seg-22cd963c7042 = Integración final de PNT híbrido: reloj + IMU + ayuda de transferencia de tiempo.

# attr:alt
seg-52378a7b074c = El gráfico que el motor escribe para scenarios/hybrid-pnt.toml, tipo de escenario hybrid

# text
seg-bdedf28adc48 = Navegación inercial estimada de 1 DOF durante una interrupción de GNSS.

# attr:alt
seg-873c402bb724 = El gráfico que el motor escribe para scenarios/imu-deadreckoning.toml, tipo de escenario inertial

# text
seg-5b9a6efe6337 = Modelo de error de deriva INS/TRN: error de posición frente a la duración de la deriva, construido a partir de coeficientes de IMU en lugar de barrerse como una tasa de deriva supuesta. Cinco contribuciones de crecimiento (sesgo del acelerómetro, inclinación por sesgo del giróscopo a través de la gravedad, paseo aleatorio de velocidad, paseo aleatorio de ángulo y factor de escala frente a la distancia recorrida), cada una propagada a través de un modelo de error inercial de nivel local de nueve estados con realimentación de Schuler a una latitud y altura declaradas (las leyes de primer orden de deriva corta t², t³, t^{ "1.5" }, t^{ "2.5" } y t¹/t² se indican junto a él) y combinadas con una regla DECLARADA (suma cuadrática por defecto, o suma lineal, o suma determinista con rss estocástica; las tres se calculan en cada ejecución para que la elección sea visible y no quede oculta). Las duraciones de deriva que alcanzan los umbrales de posición aportados por quien llama ({ "10" } m y { "50" } m por defecto) las localiza la bisección ya existente del motor, cada una con un desglose por contribución que nombra la fuente dominante, y el cruce de cada contribución individual se invierte además algebraicamente para que ambos coincidan. Un modo de navegación relativa al terreno acota la deriva con fijaciones de posición periódicas e indica el mayor intervalo entre fijaciones que mantiene cada umbral; una fijación solo de posición deja vivos el error de velocidad y la inclinación a través de la fijación, por lo que no siempre acota la deriva a cualquier frecuencia de fijación, y el informe lo dice en lugar de devolver un cero. MODELLED: los coeficientes de clase de IMU son cifras representativas de banda, no una hoja de datos, y el residuo de la fijación de terreno es una entrada. Un umbral no alcanzado se indica como nulo con un estado, nunca como cero. No es un producto certificado de rendimiento de navegación inercial.

# attr:alt
seg-134a4c91da3a = El gráfico que el motor escribe para scenarios/ins-trn-coast.toml, tipo de escenario ins-trn-coast
