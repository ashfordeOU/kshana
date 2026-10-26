# docs--kinds-clocks-timing-and-holdover: translations (pt-PT)

# text
seg-b03d56f501c3 = Tipo

# text
seg-78cba87823f7 = Holdover do relógio face à especificação; conjunto Monte Carlo opcional (execuções > { "1" }).

# attr:alt
seg-cb0b7da83f5c = O gráfico que o motor gera para scenarios/clock-ensemble.toml, tipo de cenário clock

# text
seg-c0924aa36e64 = Teste de holdover MODELLED de um sistema de temporização, pontuado a partir de um registo de erro de tempo que o OPERADOR fornece (um log do ptp4l, phc2sys ou ts2phc do linuxptp, um log de tracking ou statistics do chrony, um log de relógio TICC, TimeLab ou RINEX, ou pares time_s,time_error_ns). O teste tem quatro etapas e o Kshana não executa nenhuma delas: uma LINHA DE BASE bloqueada, GNSS REMOVIDO pelo operador (o cabo da antena ou a saída do simulador; o Kshana não transmite nem aciona nada) num instante declarado, HOLDOVER no oscilador próprio do sistema e RECUPERAÇÃO depois de o operador restabelecer o GNSS num segundo instante declarado. O registo é dividido nesses dois instantes. Linha de base: estatísticas de erro de tempo e as máscaras da ITU-T escritas para um relógio bloqueado. Holdover: estatísticas, o desvio fracionário de frequência que o sistema manteve (uma reta de mínimos quadrados), as máscaras escritas para holdover ou para um relógio autónomo, o envelope de holdover do ePRTC-A a partir da duração bloqueada declarada e o tempo para exceder cada orçamento de erro de tempo. Recuperação: se e quando |TE| entrou numa banda declarada e permaneceu nela, o pico e o maior degrau. Cada limite é transcrito de uma tabela pública da ITU-T (as máscaras de temporização de telecomunicações); as palavras são 'medido em relação à máscara', e os dois instantes são uma declaração do operador, não verificada. Um registo curto demais para uma máscara é INCOMPLETE, nunca extrapolado. Ver docs/TIMING-HIL.md.

# attr:alt
seg-8ce93392747b = O gráfico que o motor gera para scenarios/holdover-test-ptp4l.toml, tipo de cenário holdover-test
