# docs--kinds-inertial-fusion-and-quantum-sensors: translations (pt-PT)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-ec26df467b88 = PNT por fusão de sensores com filtro de Kalman conjunto sobre as mesmas entradas híbridas.

# attr:alt
seg-c8a1c797f4b1 = O gráfico que o motor gera para scenarios/fusion-pnt.toml, tipo de cenário fusion

# text
seg-38df285a3f25 = EKF de estado de erro GNSS/INS com acoplamento fraco e forte.

# attr:alt
seg-7d993b676006 = O gráfico que o motor gera para scenarios/gnss-ins.toml, tipo de cenário gnss-ins

# text
seg-c6edf89eb8d4 = UKF GNSS/INS híbrido quântico+clássico com acoplamento forte e 17 estados (MODELLED): { "15" } estados de erro do INS + correção de viés do acelerómetro derivada de CAI + um relógio de 2 estados (fase+frequência) do motor de relógio de parâmetros q, conduzido pelo modelo de erro de CAI em intervalo. A figura de mérito é a autoconsistência do filtro (NEES + brancura da inovação contra limites de χ²) — uma declaração de autoconsistência, NÃO uma garantia de exatidão no mundo real. Apenas simulação; sem TRL>{ "3" }, sem herança de voo, sem validação externa.

# attr:alt
seg-2968660fa880 = O gráfico que o motor gera para scenarios/hybrid-ukf.toml, tipo de cenário hybrid-ukf

# text
seg-22cd963c7042 = Capstone de PNT híbrido: relógio + IMU + auxílio por transferência de tempo.

# attr:alt
seg-52378a7b074c = O gráfico que o motor gera para scenarios/hybrid-pnt.toml, tipo de cenário hybrid

# text
seg-bdedf28adc48 = Navegação inercial por estima em 1-DOF durante uma interrupção do GNSS.

# attr:alt
seg-873c402bb724 = O gráfico que o motor gera para scenarios/imu-deadreckoning.toml, tipo de cenário inertial

# text
seg-5b9a6efe6337 = Modelo de erro de INS/TRN em inércia: erro de posição em função da duração da inércia, construído a partir de coeficientes da IMU em vez de varrido como uma taxa de deriva presumida. Cinco contribuições de crescimento — viés do acelerómetro, inclinação por viés do giroscópio através da gravidade, passeio aleatório de velocidade, passeio aleatório de ângulo e fator de escala em função da distância percorrida — cada uma propagada por um modelo de erro inercial de nove estados em nível local com realimentação de Schuler a uma latitude e altura declaradas (as leis de ordem dominante para inércia curta t², t³, t^{ "1.5" }, t^{ "2.5" } e t¹/t² são indicadas ao lado) e combinadas sob uma regra DECLARADA (raiz da soma dos quadrados por predefinição, ou soma linear, ou soma determinística com rss estocástico; as três são calculadas em cada execução, de modo que a escolha fica visível em vez de enterrada). As durações de inércia que atingem limiares de posição fornecidos pelo chamador ({ "10" } m e { "50" } m por predefinição) são localizadas pela bisseção já existente no motor, cada uma com uma decomposição por contribuição que nomeia a fonte dominante, e o cruzamento de cada contribuição isolada é, além disso, invertido algebricamente para que os dois coincidam. Um modo de navegação relativa ao terreno limita a inércia com correções de posição periódicas e indica o maior intervalo entre correções que mantém cada limiar; uma correção apenas de posição deixa o erro de velocidade e a inclinação vivos através da correção, de modo que nem sempre limita a inércia, seja qual for a taxa de correções, e o relatório diz isso em vez de devolver um zero. MODELLED: os coeficientes de classe da IMU são valores representativos de intervalo, não de uma ficha técnica, e o resíduo da correção de terreno é uma entrada. Um limiar não alcançado é indicado como nulo com um status, nunca como zero. Não é um produto de desempenho de navegação inercial certificado.

# attr:alt
seg-134a4c91da3a = O gráfico que o motor gera para scenarios/ins-trn-coast.toml, tipo de cenário ins-trn-coast
