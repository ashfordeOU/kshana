# docs--tutorial-quantum-vs-classical: translations (pt-PT)

# text
seg-501d3a72ea43 = Integridade

# text
seg-8980b5ae869b = Valor

# text
seg-e5f926d1055b = Armadilhas e unidades

# text
seg-cb457294fc53 = Para onde ir a seguir

# text
# c1: docs/tutorials/03-quantum-vs-classical.md
seg-a3686dd6817d = Fonte: <c1/>

# text
seg-0c2365600795 = Tutorial { "3" } — Resiliência GNSS quântica contra clássica (tutorial final)

# text
# c1: spoof
# c2: hybrid
# c3: scenarios/spoof-attack.toml
# c4: scenarios/hybrid-pnt.toml
# c5: scenarios/security.toml
# c6: scenarios/hybrid.toml
seg-cc4017642043 = <c1/> + <c2/> · <b>Cenários:</b> <c3/>, <c4/> (cópias didáticas: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Dificuldade:</b> intermédia · <b>~{ "35" } min</b>

# text
seg-5de2e6656527 = O tutorial final. Vai executar um cenário de detetor de spoofing e um conjunto completo e fundido de posicionamento, navegação e temporização (PNT), e aprender a ler em conjunto a <b>segurança</b>, a <b>integridade</b> e a <b>navegação por estima</b> — toda a tese: a inércia quântica mais a temporização ótica proporcionam uma resiliência que a negação de GNSS (Global Navigation Satellite System) retiraria de outro modo.

# text
seg-ffa5242638c2 = Parte A — Segurança: apanhar um spoofing de tempo

# text
# c1: 1 − P_md
seg-23c18da1415f = Um atacante injeta um tempo GNSS falso com rampa lenta ({ "0.1" } ns/s, a partir de t = { "60" } s). O recetor confronta o tempo afirmado com a previsão do seu próprio relógio em navegação inercial e assinala o spoofing quando a discrepância ultrapassa o limite de deteção. O detetor é um <b>teste de energia χ²₁ / Neyman–Pearson</b> bilateral com probabilidade de falso alarme P_fa = { "0.01" }; a figura de mérito de Segurança é <b><c1/></b> (um menos a probabilidade de falha de deteção) para a magnitude de spoofing da dimensão da especificação ({ "20" } ns).

# text
# c1: security 1.000
seg-46aa0e01b330 = <b>Quântico: <c1/>, detetado aos { "70" } s.</b> O patamar de deteção do relógio ótico é uma fração de nanossegundo, pelo que assinala o spoofing quase de imediato — muito abaixo da especificação de { "20" } ns.

# text
# c1: security 0.558
seg-022573b3dcc4 = <b>Clássico: <c1/>, detetado aos { "430" } s.</b> O próprio ruído de deriva do relógio atómico à escala de chip (CSAC) ao longo da janela é comparável a { "20" } ns, pelo que muitas vezes não consegue distinguir o spoofing da sua própria deriva — falha { "44" } % das vezes.

# text
seg-27b2b715efcb = A referência independente não circular: P_md analítica contra Monte Carlo

# text
# c1: 0.442
# c2: 0.444
# c3: ~few × 1/√N
# c4: tests/tutorials.rs::tutorial3_spoof_analytic_matches_montecarlo
# c5: |analytic_pmd − mc_pmd| < 0.05
# c6: quantum security_fom > 0.9
seg-c85651eebd32 = A probabilidade de falha de deteção do detetor é calculada <b>de duas formas independentes</b> que têm de concordar: uma <b>cauda χ²₁ em forma fechada</b> (o resultado de Neyman–Pearson) e uma estimativa de <b>Monte Carlo</b> (MC). Para o CSAC, a P_md analítica é <c1/> e a P_md de MC é <c2/> — concordam até { "0.002" }, bem dentro do erro de amostragem <c3/>. Para o relógio ótico ambas são { "0.000" }. Duas computações separadas da <em>mesma</em> probabilidade que concordam são a verificação cruzada não circular (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; deteção NP / χ² padrão). <c4/> afirma <c5/> para ambos os relógios e <c6/>.

# text
seg-5cf0d909bac7 = Parte B — PNT híbrido: o conjunto completo fundido

# text
# c1: [resync]
# c2: src/hybrid.rs
# c3: optical-isl
seg-498a57aae11d = Agora o cenário final funde um relógio ótico + uma unidade de medição inercial (IMU) de átomos frios (conjunto quântico) contra um CSAC + uma IMU de grau de navegação (conjunto clássico), através da mesma interrupção GNSS de { "6600" } s ({ "1.83" } h), face a uma especificação de temporização de { "20" } ns e a uma especificação de posição de { "100" } m. Ambos os conjuntos reancoram os seus relógios a cada { "60" } s através da mesma ligação ótica de transferência de tempo entre satélites, modelada com um jitter de { "1" } ps por ressincronização (<c1/> no cenário; <c2/> constrói uma ligação <c3/> para qualquer dos conjuntos).

# text
# c1: (t …/p …)
seg-61934559c7a0 = Leia a divisão <c1/> — holdover de temporização contra holdover de posição:

# text
seg-dee5b1a35bdd = <b>Quântico: PNT-holdover { "6600" } s</b> — mantém a temporização (t { "6600" } s) e a posição (p { "6600" } s) durante toda a interrupção.

# text
seg-6441dfa026dc = <b>Clássico: PNT-holdover { "350" } s</b> — a <em>temporização</em> mantém-se durante os { "6600" } s completos (t { "6600" } s), porque a ressincronização ótica de transferência de tempo mantém bloqueado até o <em>relógio clássico</em>. O conjunto é <b>limitado pela posição a p { "350" } s</b>: a IMU de grau de navegação é o elo fraco. Esta é a tese da fusão — isolar a falha do conjunto clássico no seu sensor inercial.

# text
# c1: integrity 0.998
# c2: docs/INTEGRITY.md
seg-12e9b7192733 = <b><c1/> para o conjunto quântico é real e não é um erro.</b> É a autoconsistência do filtro sobre ressincronização ruidosa — <b>não</b> uma figura de integridade de aviação (nível de proteção horizontal ou vertical, HPL/VPL). Não leia demasiado na palavra “integridade” aqui; ver <a1><c2/></a1>.

# text
seg-587efcdcbc13 = A referência independente não circular: o holdover de posição de { "350" } s

# text
# c1: b
seg-a70ad8fc122f = O valor de { "350" } s é física de navegação por estima, não um número ajustado. Um viés constante do acelerómetro <c1/> leva o erro de posição a crescer como <b>½·b·T²</b>. Ao cruzar a especificação de { "100" } m:

# text
# c1: q_va
seg-778e817e3e9b = O motor comunica { "350" } s, o último ponto da grelha de { "10" } s antes do seu cruzamento e { "2" } % abaixo dos { "357" } s só do viés: os acelerómetros do cenário também têm ruído de passeio aleatório da velocidade (<c1/>), que se soma à deriva do viés, pelo que o erro modelado atinge { "100" } m um pouco mais cedo.

# text
seg-e105a8ab605b = Lei de referência: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2.ª ed.), crescimento do erro da navegação por estima. Estes dois valores de ½bT² explicam a divisão de { "350" } s / { "6600" } s do motor: uma verificação de física em forma fechada, externa ao filtro.

# text
# c1: scenarios/inertial.toml
# c2: inertial
# c3: quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m
seg-c2515e55dffa = Pode ver diretamente o elo inercial fraco no cenário de navegação por estima (<a1><c1/></a1>, tipo de cenário <c2/>): <c3/>: o sensor de grau de navegação diverge para dezenas de quilómetros.

# text
seg-6c688f2e7136 = Como ler os três valores em conjunto

# text
seg-4f1a49d61cee = O que significa aqui

# text
seg-2e91989b1a89 = O que <b>não</b> significa

# text
# c1: 1 − P_md
# c2: hybrid
# c3: n/a (no attack)
seg-b403ce86b14d = limite analítico de <em>detetabilidade</em> de spoofing (<c1/>) para um ataque configurado; o resumo de <c2/> imprime <c3/> porque esse cenário não configura nenhum

# text
seg-e04c25dd278d = não é um detetor RAIM (monitorização autónoma da integridade pelo recetor) de vários satélites

# text
seg-7e678dd4409e = autoconsistência do filtro (amostras dentro do limite k-σ)

# text
seg-1643e7e71209 = não é integridade HPL/VPL/RAIM de aviação

# text
seg-4095f7ab4b14 = tempo dentro da especificação após a perda de GNSS, dividido em temporização e posição

# text
seg-5b90536cdfd5 = não é uma exatidão de CEP 2-D (erro circular provável) nem de 2DRMS (duas vezes a raiz quadrada da distância média quadrática)

# text
# c1: integrity
# c2: scenarios/integrity.toml
seg-4b11ef3b6dba = A genuína integridade autónoma do recetor — HPL/VPL reais com limites de alerta e um diagrama de Stanford — encontra-se no pacote <c1/> (<a1><c2/></a1>); esse é o exercício de leitura de Nível 3.

# text
seg-28cddec341ed = O que os testes fixam

# text
# c1: tutorial3_spoof_analytic_matches_montecarlo
# c2: quantum security_fom > 0.9
seg-a27c3195acf3 = <c1/> — a P_md analítica e a de MC concordam a menos de { "0.05" } para ambos os relógios; <c2/>.

# text
# c1: scenarios/hybrid.toml
# c2: scenarios/inertial.toml
# c3: teaching_scenarios_match_their_recorded_expected_summary
# c4: # expected:
seg-78a5a0066e09 = O resumo híbrido ({ "6600" } s / { "350" } s) e a divisão inercial são fixados através dos respetivos cenários didáticos (<a1><c1/></a1>, <a2><c2/></a2>) por <c3/>, que compara cada resumo do motor com a linha <c4/> que o ficheiro regista. A referência independente de ½bT² acima é a verificação de física desses números.

# text
seg-a4371822e379 = <b>A figura de mérito (FoM) de temporização está em nanossegundos; a FoM de posição está em metros e é 1-DOF</b> (um grau de liberdade: eixo único, não CEP/2DRMS).

# text
# c1: integrity 0.998
seg-1331ea80a427 = <c1/> é autoconsistência, não integridade de aviação.

# text
# c1: (t …/p …)
seg-87c49084032c = A <em>temporização</em> do conjunto clássico só sobrevive por causa da ressincronização ótica de transferência de tempo; leia a divisão <c1/>, não apenas o PNT-holdover de destaque.

# text
# c1: scenarios/lunanet-araim.toml
# c2: lunar-integrity
seg-1c93115bf118 = Execute o caso de falha honesta: <c1/> (tipo de cenário <c2/>) comunica uma passagem ARAIM (RAIM avançado) no polo sul em que os níveis de proteção <em>excedem</em> o limite de alerta (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } de { "24" } épocas disponíveis), pelo que o sistema é comunicado como <b>indisponível</b>: uma funcionalidade, não um erro.

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: campaign
seg-ac70d3131064 = Leve a história para a órbita terrestre baixa (LEO): <c1/> (tipo de cenário <c2/>) encadeia uma fase de jamming GNSS, uma camada de posicionamento LEO que leva o utilizador através dela e uma verificação de integridade, numa única cronologia. Ver <a1>as capacidades mais recentes</a1> para os outros cenários de resiliência e verticais.

# text
seg-063422d3c70b = Defenda um resultado: faça o <a1>exercício de Nível 3</a1> — bandas de Monte Carlo, reprodutibilidade e leitura de um nível de proteção.

# text
seg-4f7275a21f44 = <s1>Anterior</s1>{ "2" } · Holdover do relógio

# text
seg-8b0c90f82aab = <s1>Seguinte</s1>Exemplo prático: pipeline de várias ferramentas
