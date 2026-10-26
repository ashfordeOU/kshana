# docs--machine-inputs: translations (pt-BR)

# text
seg-e9650a618b38 = ID

# text
# c1: BESTPOSA
seg-61d8ec169a17 = A rotina de CRC foi verificada com o CRC que a documentação indica para o seu próprio exemplo <c1/> (citado, não transcrito); os testes usam linhas escritas por nós. Não lidos: ASCII abreviado, outros registros. O indicador de jammer é o relato do próprio receptor, não uma constatação do Kshana; a concordância com os monitores do Kshana não é validação.

# text
# c1: format = "gnss-sdr"
seg-b6c3919c87ad = GNSS-SDR (<c1/>)

# text
# c1: integrations/gnss-sdr/README.md
# c2: nmea
# c3: rinex
# c4: relay.py
# c5: gnss-sdr
seg-0cc992f8d61b = Veja <a1><c1/></a1>. As saídas NMEA e RINEX do GNSS-SDR já são lidas com <c2/> e <c3/>; os fluxos UDP do Monitor e do PVT-monitor (Protocol Buffers) são retransmitidos como linhas JSON por <c4/> e lidos com <c5/>.

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
seg-ab64a0754907 = <c1/>: uma linha de cabeçalho com os nomes das colunas e, depois, uma amostra por linha. Colunas (em qualquer ordem, nomes sem distinção entre maiúsculas e minúsculas): <c2/> segundos no relógio do registro do receptor, <c3/>, <c4/>, <c5/> taxa angular em rad/s, <c6/>, <c7/>, <c8/> força específica em m/s². <c9/>: o layout <c10/> <c11/> do EuRoC MAV (<c12/>, <c13/>, <c14/>); a primeira amostra é <c15/>. Linhas que não podem ser interpretadas e linhas cujo tempo não aumenta são ignoradas. Veja <a1><c16/></a1> para saber como o rumo do girômetro é usado.

# text
# c1: kshana imu-fit
seg-f7007cf35f53 = IMU nos cenários híbrido e de fusão (<c1/>)

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
seg-3fc254763f67 = Os cenários <c1/> e <c2/> (UKF de 17 estados) são simulações: recebem parâmetros de ruído do sensor (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), não uma série medida. <c10/> extrai esses parâmetros de um registro de IMU parada, de modo que um cenário pode ser executado com o sensor que você realmente tem:

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
seg-86efab73b2e6 = Método: o desvio de Allan sobreposto do sinal integrado (<c1/>): <c2/>, o mesmo para o girômetro z (<c3/>), <c4/> e <c5/> como as médias e <c6/> como o mínimo da curva quando a curva sobe depois dele. <c7/> não é ajustado (exige um registro muito mais longo que o piso). O relatório traz a taxa e a duração do registro e a inclinação inicial de Allan de cada canal (cerca de -0,5 onde predomina o ruído branco); um registro que não está parado, ou é curto demais (menos de { "2000" } amostras) ou tem amostragem irregular, é recusado ou produz parâmetros que as inclinações sinalizam. A proveniência da tabela indica o SHA-256 do registro. MODELLED: o estimador é verificado em registros sintéticos de ruído branco com coeficientes conhecidos (recuperados dentro de { "10" } %), não em relação a uma referência independente. Disponível na CLI, em Python (<c8/>), em WebAssembly (<c9/>), no MCP (<c10/>) e no plugin (<c11/>).

# text
# c1: format = "rtcm3"
seg-b3c592f63798 = RTCM { "3" } MSM4 e MSM7 (<c1/>)

# text
seg-0f8b986cff40 = Um fluxo de bytes de quadros RTCM { "3" } (a saída de observações de uma estação base ou de um receptor). Lidas: mensagens MSM4 e MSM7 (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): a época e a relação portadora-ruído de cada célula de sinal (MSM4: { "6" } bits, dB-Hz; MSM7: { "10" } bits, 1/16 dB-Hz), que é o que os monitores de C/N0 precisam. Os campos de pseudodistância e de fase são saltados, não usados; assim, o RTCM fornece aos monitores de confiança o C/N0 e nada mais; não há posição no MSM. Quadros com CRC-24Q inválido são ignorados e contados.

# text
# c1: NOTICE
# c2: GPS TOW <s>
seg-d70038a737dc = <b>De onde vem o layout.</b> Não da norma RTCM (um documento pago, não consultado): do decodificador de código aberto pyrtcm { "1.2.0" }, BSD 3-Clause, cuja licença e aviso estão em <c1/> (decisão do responsável de { "18" } out { "2026" }: "usar decodificadores abertos"). O pyrtcm declara que suas tabelas seguem o RTCM { "10403.3" }; o Kshana se apoia nas tabelas publicadas sob a licença do pyrtcm e não faz nenhuma afirmação sobre a norma. Tempo: o MSM não traz semana, portanto os rótulos mostram <c2/>; as épocas GLONASS (horário de Moscou) são levadas ao tempo GPS com GPS-UTC = { "18" } s (o valor desde 2017-01-01).

# text
# c1: 123456789
# c2: 0xCDE703
seg-ee04a86f8f00 = Verificado em relação a: o valor de verificação do catálogo CRC-24Q (<c1/> resulta em <c2/>) e, uma única vez durante o desenvolvimento, o próprio decodificador do pyrtcm sobre os mesmos quadros escritos por nós (mesmo C/N0). Os fixtures são escritos por nós; nenhuma captura foi feita de um receptor real, de modo que o leitor é MODELLED até ter lido uma.

# text
seg-94f0e4db92df = <s1>Anterior</s1>Jammertest como árbitro

# text
seg-8d660b4049e4 = <s1>Próximo</s1>Protocolos de receptor lidos

# text
seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

# text
seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

# text
seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

# text
seg-b0b5f9a66eed = IMU ([log.imu])

# text
seg-03a6e15dce0a = IMU nos cenários híbrido e de fusão (kshana imu-fit)

# text
seg-53ce2c4ba434 = RTCM { "3" } MSM4 e MSM7 (format = "rtcm3")
