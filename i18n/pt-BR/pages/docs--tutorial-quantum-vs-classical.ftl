# docs--tutorial-quantum-vs-classical: translations (pt-BR)

# text
seg-501d3a72ea43 = Integridade

# text
seg-8980b5ae869b = Valor

# text
seg-e5f926d1055b = Armadilhas e unidades

# text
seg-cb457294fc53 = Próximos passos

# text
# c1: docs/tutorials/03-quantum-vs-classical.md
seg-a3686dd6817d = Fonte: <c1/>

# text
seg-0c2365600795 = Tutorial { "3" } — Resiliência quântica contra clássica do GNSS (capstone)

# text
# c1: spoof
# c2: hybrid
# c3: scenarios/spoof-attack.toml
# c4: scenarios/hybrid-pnt.toml
# c5: scenarios/security.toml
# c6: scenarios/hybrid.toml
seg-cc4017642043 = <c1/> + <c2/> · <b>Cenários:</b> <c3/>, <c4/> (cópias didáticas: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Dificuldade:</b> intermediário · <b>~{ "35" } min</b>

# text
seg-5de2e6656527 = O capstone. Você executará um cenário de detector de spoofing e uma suíte completa fundida de posicionamento, navegação e temporização (PNT), e aprenderá a ler <b>segurança</b>, <b>integridade</b> e <b>navegação por estima</b> em conjunto — a tese inteira: inércia quântica + temporização óptica compram resiliência que a negação do GNSS (Global Navigation Satellite System) tiraria de outra forma.

# text
seg-ffa5242638c2 = Parte A — Segurança: pegando um spoofing de tempo

# text
# c1: 1 − P_md
seg-23c18da1415f = Um atacante injeta um tempo GNSS falso com rampa lenta ({ "0.1" } ns/s, começando em t = { "60" } s). O receptor confronta o tempo afirmado com a predição do próprio relógio em deriva e sinaliza o spoofing quando a discrepância passa do limite de detecção. O detector é um <b>teste de energia χ²₁ / Neyman–Pearson</b> bilateral com probabilidade de falso alarme P_fa = { "0.01" }; a figura de mérito de Segurança é <b><c1/></b> (um menos a probabilidade de detecção perdida) na magnitude de spoofing do tamanho da especificação ({ "20" } ns).

# text
# c1: security 1.000
seg-46aa0e01b330 = <b>Quântico: <c1/>, detectado em { "70" } s.</b> O piso de detecção do relógio óptico é uma fração de nanossegundo, de modo que ele sinaliza o spoofing quase de imediato — muito abaixo da especificação de { "20" } ns.

# text
# c1: security 0.558
seg-022573b3dcc4 = <b>Clássico: <c1/>, detectado em { "430" } s.</b> O próprio ruído de deriva do relógio atômico em escala de chip (CSAC) ao longo da janela é comparável a { "20" } ns, de modo que muitas vezes ele não distingue o spoofing de sua própria deriva — perde { "44" } % das vezes.

# text
seg-27b2b715efcb = A referência independente não circular: P_md analítica contra Monte-Carlo

# text
# c1: 0.442
# c2: 0.444
# c3: ~few × 1/√N
# c4: tests/tutorials.rs::tutorial3_spoof_analytic_matches_montecarlo
# c5: |analytic_pmd − mc_pmd| < 0.05
# c6: quantum security_fom > 0.9
seg-c85651eebd32 = A probabilidade de detecção perdida do detector é calculada de <b>duas formas independentes</b> que devem concordar: uma <b>cauda χ²₁ em forma fechada</b> (o resultado de Neyman–Pearson) e uma estimativa <b>Monte-Carlo</b> (MC). Para o CSAC, a P_md analítica é <c1/> e a P_md MC é <c2/> — concordam a { "0.002" }, bem dentro do erro de amostragem <c3/>. Para o relógio óptico, ambas são { "0.000" }. Duas computações separadas da <em>mesma</em> probabilidade concordando é a verificação cruzada não circular (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; detecção NP / χ² padrão). <c4/> afirma <c5/> para ambos os relógios e <c6/>.

# text
seg-5cf0d909bac7 = Parte B — PNT híbrido: a suíte fundida completa

# text
# c1: [resync]
# c2: src/hybrid.rs
# c3: optical-isl
seg-498a57aae11d = Agora o cenário capstone funde um relógio óptico + uma unidade de medição inercial (IMU) de átomos frios (suíte quântica) contra um CSAC + uma IMU de grau de navegação (suíte clássica), na mesma interrupção de GNSS de { "6600" } s ({ "1.83" } h), contra uma especificação de temporização de { "20" } ns e uma especificação de posição de { "100" } m. Ambas as suítes reancoram seus relógios a cada { "60" } s pelo mesmo enlace óptico de transferência de tempo entre satélites, modelado com jitter de { "1" } ps por ressincronização (<c1/> no cenário; <c2/> constrói um enlace <c3/> para qualquer das suítes).

# text
# c1: (t …/p …)
seg-61934559c7a0 = Leia a divisão <c1/> — holdover de temporização contra holdover de posição:

# text
seg-dee5b1a35bdd = <b>Quântico: holdover de PNT de { "6600" } s</b> — mantém tanto a temporização (t { "6600" } s) quanto a posição (p { "6600" } s) durante toda a interrupção.

# text
seg-6441dfa026dc = <b>Clássico: holdover de PNT de { "350" } s</b> — a <em>temporização</em> mantém os { "6600" } s completos (t { "6600" } s), porque a ressincronização por transferência de tempo óptica mantém travado até o <em>relógio clássico</em>. A suíte é <b>limitada pela posição em p { "350" } s</b>: a IMU de grau de navegação é o elo fraco. Esta é a tese da fusão — isolar a falha da suíte clássica em seu sensor inercial.

# text
# c1: integrity 0.998
# c2: docs/INTEGRITY.md
seg-12e9b7192733 = <b><c1/> para a suíte quântica é real e não é um bug.</b> É a autoconsistência do filtro sobre a ressincronização ruidosa — <b>não</b> uma figura de integridade de aviação (nível de proteção horizontal ou vertical, HPL/VPL). Não leia demais a palavra “integridade” aqui; veja <a1><c2/></a1>.

# text
seg-587efcdcbc13 = A referência independente não circular: o holdover de posição de { "350" } s

# text
# c1: b
seg-a70ad8fc122f = O valor de { "350" } s é física de navegação por estima, não um número ajustado. Um viés constante de acelerômetro <c1/> leva o erro de posição a <b>½·b·T²</b>. Cruzando a especificação de { "100" } m:

# text
# c1: q_va
seg-778e817e3e9b = O mecanismo informa { "350" } s, o último ponto da grade de { "10" } s antes do cruzamento e { "2" } % abaixo dos { "357" } s só com viés: os acelerômetros do cenário também carregam ruído de passeio aleatório de velocidade (<c1/>), que se soma à deriva do viés, de modo que o erro modelado chega a { "100" } m um pouco antes.

# text
seg-e105a8ab605b = Lei de referência: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2ª ed.), crescimento do erro de navegação por estima. Esses dois valores de ½bT² explicam a divisão de { "350" } s / { "6600" } s do mecanismo: uma verificação física em forma fechada, externa ao filtro.

# text
# c1: scenarios/inertial.toml
# c2: inertial
# c3: quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m
seg-c2515e55dffa = Você pode ver o elo fraco inercial diretamente no cenário de navegação por estima (<a1><c1/></a1>, tipo de cenário <c2/>): <c3/>: o sensor de grau de navegação diverge para dezenas de quilômetros.

# text
seg-6c688f2e7136 = Como ler as três figuras em conjunto

# text
seg-4f1a49d61cee = O que significa aqui

# text
seg-2e91989b1a89 = O que <b>não</b> significa

# text
# c1: 1 − P_md
# c2: hybrid
# c3: n/a (no attack)
seg-b403ce86b14d = limite analítico de <em>detectabilidade</em> de spoofing (<c1/>) para um ataque configurado; o resumo de <c2/> imprime <c3/> porque esse cenário não configura nenhum

# text
seg-e04c25dd278d = não é um detector RAIM (monitoramento autônomo de integridade pelo receptor) de vários satélites

# text
seg-7e678dd4409e = autoconsistência do filtro (amostras dentro do limite k-σ)

# text
seg-1643e7e71209 = não é integridade de aviação HPL/VPL/RAIM

# text
seg-4095f7ab4b14 = tempo dentro da especificação após a perda do GNSS, dividido em temporização e posição

# text
seg-5b90536cdfd5 = não é uma exatidão 2-D CEP (erro circular provável) nem 2DRMS (duas vezes a raiz quadrada média da distância)

# text
# c1: integrity
# c2: scenarios/integrity.toml
seg-4b11ef3b6dba = A integridade autônoma genuína do receptor — HPL/VPL reais com limites de alerta e um diagrama de Stanford — está no pacote <c1/> (<a1><c2/></a1>); esse é o exercício de leitura do Nível 3.

# text
seg-28cddec341ed = O que os testes fixam

# text
# c1: tutorial3_spoof_analytic_matches_montecarlo
# c2: quantum security_fom > 0.9
seg-a27c3195acf3 = <c1/> — a P_md analítica e a MC concordam a < { "0.05" } para ambos os relógios; <c2/>.

# text
# c1: scenarios/hybrid.toml
# c2: scenarios/inertial.toml
# c3: teaching_scenarios_match_their_recorded_expected_summary
# c4: # expected:
seg-78a5a0066e09 = O resumo híbrido ({ "6600" } s / { "350" } s) e a divisão inercial são fixados por seus cenários didáticos (<a1><c1/></a1>, <a2><c2/></a2>) por <c3/>, que compara cada resumo do mecanismo com a linha <c4/> que o arquivo registra. A referência independente ½bT² acima é a verificação física desses números.

# text
seg-a4371822e379 = <b>A figura de mérito (FoM) de temporização está em nanossegundos; a FoM de posição está em metros e é de 1-DOF</b> (um grau de liberdade: eixo único, não CEP/2DRMS).

# text
# c1: integrity 0.998
seg-1331ea80a427 = <c1/> é autoconsistência, não integridade de aviação.

# text
# c1: (t …/p …)
seg-87c49084032c = A <em>temporização</em> da suíte clássica sobrevive apenas por causa da ressincronização por transferência de tempo óptica; leia a divisão <c1/>, não só o PNT-holdover do título.

# text
# c1: scenarios/lunanet-araim.toml
# c2: lunar-integrity
seg-1c93115bf118 = Execute o caso de falha honesta: <c1/> (tipo de cenário <c2/>) informa uma passagem de ARAIM (RAIM avançado) no polo sul em que os níveis de proteção <em>excedem</em> o limite de alerta (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } de { "24" } épocas disponíveis), de modo que o sistema é informado como <b>indisponível</b>: uma característica, não um bug.

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: campaign
seg-ac70d3131064 = Leve a história para a órbita terrestre baixa (LEO): <c1/> (tipo de cenário <c2/>) encadeia uma fase de jamming do GNSS, uma camada de posicionamento LEO que leva o usuário por ela e uma verificação de integridade em uma única linha do tempo. Veja <a1>as capacidades mais novas</a1> para os demais cenários de resiliência e de verticais.

# text
seg-063422d3c70b = Defenda um resultado: faça o <a1>exercício do Nível 3</a1> — faixas Monte-Carlo, reprodutibilidade e leitura de um nível de proteção.

# text
seg-4f7275a21f44 = <s1>Anterior</s1>{ "2" } · Holdover de relógio

# text
seg-8b0c90f82aab = <s1>Próximo</s1>Exemplo prático: pipeline de várias ferramentas
