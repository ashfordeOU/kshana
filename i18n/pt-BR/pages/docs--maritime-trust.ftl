# docs--maritime-trust: translations (pt-BR)

# text
seg-2247a2344710 = Significado

# text
seg-6940543aa3c0 = string

# text
seg-abec93a4a488 = string ou nulo

# text
seg-f5e7215e6835 = objeto

# text
seg-b993ef559bd0 = A partir do código

# text
seg-c353e7bec219 = Chave

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> ou <c4/>

# text
# c1: docs/MARITIME-TRUST.md
seg-2896f449bffb = Fonte: <c1/>

# text
seg-342f34403ac5 = Confiança marítima: a ponte de comando pode confiar nesta posição?

# text
# c1: kshana receiver-trust
seg-49b609a9655c = <c1/> pode calcular, para uma <b>embarcação em movimento</b>, uma pontuação de confiança de 0 a 100 em tempo real para cada posição, a partir do que qualquer receptor já coloca no barramento (primeiro NMEA { "0183" }), e dizer quais verificações a reduziram. É uma camada de software que fica ao lado de um receptor. Não é um receptor, não substitui um e não torna uma posição mais precisa.

# text
seg-3c66739c9250 = <b>Software de caráter consultivo.</b> O Kshana não é um equipamento de navegação homologado (IEC { "61108" }, IEC { "61162" }) e não foi avaliado em relação a nenhuma norma de desempenho. Sua pontuação e seu gate são auxílios ao julgamento do navegador. O operador continua responsável pela navegação segura da embarcação e por qualquer decisão de confiar, ou de deixar de confiar, em uma posição.

# text
# c1: RECEIVER-TRUST.md
seg-a9899ca66661 = Esta página diz o que as verificações examinam, o que cada uma pode e não pode detectar, como executá-lo em tempo real e o que o gate faz. O mapeamento da pontuação e todos os valores padrão estão em <a1><c1/></a1>.

# text
seg-05e79b6c5a58 = O que ele lê

# text
seg-e784fdbe26e6 = Uma embarcação é declarada no arquivo de sessão, com seus limites enunciados antes da execução:

# text
seg-e8e9ee2965cf = Sentença

# text
seg-e127f2f26824 = Lido

# text
seg-5e17bb4156f1 = GGA

# text
seg-b38b8385ddcb = posição, qualidade da posição ({ "0" } = sem posição), altitude acima do nível médio do mar, separação do geoide, HDOP

# text
seg-870056f55c30 = RMC

# text
# c1: A
# c2: V
seg-445c02505551 = status (<c1/> válido, <c2/> não), velocidade e rumo sobre o solo, data, modo

# text
seg-8a259fc7b06d = VTG

# text
seg-eb3e34f58751 = velocidade e rumo sobre o solo, quando o RMC não traz

# text
seg-add66711c27b = HDT, THS

# text
# c1: V
seg-24e36e50b0ad = proa (THS apenas quando seu modo não é <c1/>)

# text
seg-bcfb4cd59951 = VHW, VBW

# text
# c1: A
seg-fa0a0dae1510 = velocidade na água (VBW apenas quando seu status é <c1/>)

# text
seg-774d1991fb0b = ZDA

# text
seg-68d981999c72 = hora

# text
seg-a0cc45088f5f = GSV

# text
seg-0fad368a11cb = intensidade do sinal por satélite (dB-Hz), elevação e azimute (para a geometria)

# text
seg-032eafc03b42 = GSA

# text
seg-71334afb8a7d = diluição de precisão e satélites usados (para a geometria, onde o GSV não dá céu; e o HDOP declarado que a salvaguarda compara)

# text
# c1: A
# c2: F
# c3: N
seg-305f423d3ead = um status OSNMA informado por um receptor, traduzido para esta sentença pelo adaptador que lê o receptor: <c1/> autenticado, <c2/> falhou, <c3/> sem resultado

# text
# c1: V
# c2: E
# c3: M
# c4: S
# c5: N
seg-7ce1d69e710e = Épocas que o próprio receptor diz não serem uma posição por satélite (qualidade GGA { "0" }, ou de { "6" } a { "8" }: estimada, manual, simulador; status RMC <c1/>, ou modo <c2/>, <c3/>, <c4/>, <c5/>) não são usadas nas verificações de posição e não carregam evidência em nenhum sentido: o receptor já o disse.

# text
# c1: calibration_s
seg-a0ae80781c6e = Os primeiros <c1/> segundos formam a linha de base e nunca são pontuados. Cada monitor olha apenas para a época atual e as anteriores, de modo que uma decisão em uma época não muda quando chegam dados posteriores, e um fluxo ao vivo dá a mesma pontuação que o mesmo texto lido como arquivo.

# text
seg-068593ad0a52 = O que cada verificação detecta, e o que ela não consegue detectar

# text
seg-094b90f0c701 = As direções entre posições (o rumo da derrota usado pela verificação da taxa de giro, o rumo implicado por duas posições) são a direção da corda entre elas, que é o <b>azimute médio</b> da geodésica entre as posições, não o azimute direto na primeira posição; os dois diferem em cerca de metade da convergência dos meridianos entre as posições ({ "0.001" } grau para uma linha de base de { "260" } m a { "59.5" } graus de latitude).

# text
seg-ed3cdfcfbff5 = Uma posição falsificada precisa concordar com a física de um navio e com os outros sensores do navio. Cada verificação compara a posição com um deles. Uma verificação é tão independente quanto sua outra fonte: uma proa de uma bússola GNSS, ou uma "velocidade na água" derivada do GNSS, não é independente do receptor sob teste e não acrescenta nada.
