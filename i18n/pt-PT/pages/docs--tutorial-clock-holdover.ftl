# docs--tutorial-clock-holdover: translations (pt-PT)

# text
# c1: docs/tutorials/02-clock-holdover.md
seg-b59f529012a6 = Fonte: <c1/>

# text
seg-e66a5042182e = Tutorial { "2" } — Holdover do relógio: durante quanto tempo se consegue navegar em inércia

# text
# c1: clock
# c2: scenarios/clock-holdover.toml
# c3: scenarios/clock.toml
seg-889112bc4c09 = <c1/> · <b>Cenário:</b> <c2/> (cópia didática: <a1><c3/></a1>) · <b>Dificuldade:</b> principiante · <b>~{ "20" } min</b>

# text
seg-a4bdf55d96be = No final, terá executado um holdover de relógio com os sinais GNSS (Global Navigation Satellite System) negados, lido a figura de mérito de temporização e compreendido a lei de deriva √(q_wf·T) que explica <em>porque</em> o relógio ótico dura mais do que o de escala de chip, com a lei obtida do NIST (o National Institute of Standards and Technology dos EUA), não inventada.

# text
seg-51ae9468b92a = O que é este cenário

# text
seg-87334505b228 = Quando os sinais GNSS desaparecem, um sistema mantém a hora com o seu próprio relógio de bordo. A fase desse relógio deriva lentamente e, quando a deriva excede a especificação operacional de temporização, o sistema fica fora de serviço. O <b>Holdover</b> é o tempo que se permanece dentro da especificação após a perda de GNSS — a figura de mérito de autonomia principal.

# text
seg-798ac031b5c6 = O cenário executa uma cronologia de { "2" } h: { "10" } min de sincronização GNSS, depois { "6600" } s ({ "1.83" } h) de negação, face a uma especificação de temporização de { "20" } ns, amostrada a cada { "10" } s. Compara dois relógios com código idêntico e com o seu <em>próprio</em> ruído publicado:

# text
seg-3d53622dbe12 = <b>Quantum</b>: um relógio ótico de rede de estrôncio, objetivo espacial σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), um alvo de demonstrador em terra, não lançado. σ_y(τ) é o desvio de Allan, a medida padrão da estabilidade de frequência de um relógio para o tempo de média τ.

# text
seg-e25af6d0752f = <b>Clássico</b>: um relógio atómico à escala de chip (CSAC) Microchip SA.45s, σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (folha de especificações) — um componente comercial em utilização.

# text
seg-08f3fdc9252a = Ler o resumo de uma linha

# text
seg-baa0cc808987 = Com seed = { "42" }, a especificação de { "20" } ns e a interrupção de { "6600" } s:

# text
# c1: quantum holdover 6600s
seg-76f7739f8b17 = <b><c1/></b> — o relógio ótico mantém-se durante toda a interrupção de { "6600" } s sem violar { "20" } ns. O seu erro de fase no percentil 95 é { "1.20e-4" } ns, cerca de um décimo de milésimo de nanossegundo: praticamente não se move.

# text
# c1: classical holdover 2610s
seg-0ba48fccffae = <b><c1/></b> — o CSAC viola a especificação de { "20" } ns aos ~{ "2610" } s, menos de metade da interrupção. O seu erro de fase p95 ({ "19.7" } ns) fica mesmo sobre a linha da especificação.

# text
# c1: security n/a (no attack)
# c2: fom.security
# c3: applicable: false
# c4: figure_tiers
seg-b745d05e2bf1 = <b><c1/></b> — este cenário não configura nenhum ataque, pelo que não há nada a detetar e o resumo não imprime um número. O JSON continua a conter o limite analítico de deteção de spoofing de cada relógio em <c2/> ({ "0.997" } para o relógio ótico; { "0.000" } para o CSAC, cujo próprio ruído de deriva ao longo da janela já excede { "20" } ns), assinalado como <c3/> no bloco <c4/>. Pontuar a deteção face a um ataque real é a história do <a1>Tutorial { "3" }</a1>.

# text
# c1: integrity 1.000
# c2: docs/INTEGRITY.md
seg-510e1cd8ed40 = <b><c1/></b> — aqui trata-se de <em>autoconsistência do filtro</em> (a fração das amostras da interrupção dentro do limite k-sigma do próprio filtro de Kalman), <b>não</b> de um nível de proteção horizontal ou vertical de aviação (HPL/VPL). Ver <a1><c2/></a1>.

# text
seg-7cc0ba5e5d13 = A referência independente não circular: porquê { "2610" } s para o CSAC?

# text
# c1: q_wf = σ_y(1 s)²
# c2: tests/calibration.rs
seg-2958401e00ca = Para um relógio de modulação de frequência branca (white-FM), o erro de fase de 1-σ cresce como <b>σ_x(T) ≈ √(q_wf · T)</b>, em que <c1/> tem unidades de s². Esta relação provém da <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — as relações σ_y(τ)↔fase — a <em>mesma</em> relação da SP-1065 face à qual <c2/> valida o desvio de Allan do motor até ~{ "2" } %.

# text
# c1: q_wf = (3×10⁻¹⁰)² = 9×10⁻²⁰ s²
seg-d6c8f68b42b9 = Para o CSAC, <c1/>. Resolva para o tempo em que a fase de 1-σ atinge { "20" } ns = { "2" }×{ "10" }⁻⁸ s:

# text
# c1: holdover_s
# c2: step_s = 10
# c3: src/fom.rs
seg-0f28d1a1163f = Os { "2610" } s do motor não são esse tempo de 1-σ, e não devem ser. <c1/> é o primeiro ponto da grelha de { "10" } s (<c2/>) em que o erro de fase absoluto <em>desta realização com seed</em> excede { "20" } ns (<c3/>). A primeira travessia de um nível por um passeio aleatório ocorre muitas vezes bastante antes do tempo em que o seu envelope de 1-σ atinge esse nível, e a realização traz ainda o erro de frequência residual com que o filtro fica após a sincronização de { "600" } s. Assim, a lei fixa a escala, alguns milhares de segundos para um relógio de { "3" }×{ "10" }⁻¹⁰ face a { "20" } ns, não o valor exato. O teste afirma uma <b>banda de { "2000" }–{ "3200" } s</b> em torno dele, não o número.

# text
# c1: provenance
# c2: adev_curve
# c3: tests/calibration.rs
seg-2e7cbdefa9b7 = As âncoras das folhas de especificações são elas próprias externas, citadas nas cadeias <c1/> do cenário: objetivo de rede ótica de Sr { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (folha de especificações). E o <c2/> exportado coincide com o σ_y(τ) da folha de especificações até ~{ "2" } % (<c3/>, NIST SP { "1065" }). Represente-o como um gráfico log-log “Estabilidade do relógio (ADEV, desvio de Allan)” no playground.

# text
seg-def5271a207d = O que o teste fixa

# text
# c1: quantum holdover >= classical holdover
seg-ebddc1f5ffe2 = <c1/> (o relógio ótico tem de aguentar pelo menos tanto tempo),

# text
# c1: quantum holdover ≈ 6600 s
seg-8e570268f107 = <c1/> (aguenta toda a interrupção),

# text
# c1: classical holdover ∈ [2000, 3200] s
seg-d60483c1af2e = <c1/> — uma banda de tolerância em torno da escala white-FM da SP-1065, <em>não</em> um número mágico. A referência independente é a lei, não o valor.

# text
seg-e5f926d1055b = Armadilhas e unidades

# text
seg-0f57e35ed833 = <b>Os valores de temporização estão em nanossegundos</b>, nunca em metros. (O holdover de posição é um pacote <em>diferente</em> — ver a secção inercial do Tutorial { "3" }.)

# text
# c1: q_wf
seg-2e476b213141 = <b><c1/> tem unidades de s² e é igual a σ_y({ "1" } s)².</b> É a ponte entre um valor de Allan da folha de especificações e o modelo.

# text
# c1: step_s
seg-75951a150b44 = <b>O holdover é um limite inferior quantizado pela grelha</b> (<c1/>). Não leia demasiado no valor exato; leia a <em>banda</em>.

# text
# c1: integrity
seg-959eb86066f1 = <c1/> aqui é autoconsistência do filtro, não integridade de aviação.

# text
seg-cb457294fc53 = Para onde ir a seguir

# text
# c1: threshold_ns
# c2: exercises/tier2_sweep.py
# c3: kind = "sweep"
# c4: classical_q_wf
# c5: scenarios/sweep-clock-stability.toml
seg-aa3e50f2c699 = <b>Nível { "2" }:</b> aperte <c1/> de { "20" } para { "10" } e veja o holdover do CSAC <em>descer</em> ({ "2610" } s → { "1300" } s, medido com <c2/>), ou use <c3/> para tabelar o holdover face ao nível de ruído do CSAC <c4/> (<c5/>: { "25" } pontos de { "10" }⁻²⁴ a { "10" }⁻¹⁸ s², holdover clássico { "2610" } s → { "250" } s).

# text
# c1: runs = 200
# c2: scenarios/clock-ensemble.toml
# c3: classical holdover 844s [220-2130]
seg-cb31f104d104 = <b>Nível { "3" }:</b> acrescente <c1/> para transformar isto num ensemble de Monte Carlo e ler a banda de holdover [p05–p95] (<c2/> imprime <c3/>).

# text
seg-9cb56e10f0fd = Depois, o tutorial final: <a1>Tutorial { "3" } — Resiliência quântica contra clássica</a1>.

# text
seg-7dc19a98c7ee = <s1>Anterior</s1>{ "1" } · A sua primeira órbita

# text
seg-c274e92fdcb5 = <s1>Seguinte</s1>{ "3" } · Quântico contra clássico
