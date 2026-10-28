# docs--kind-spoof: translations (pt-PT)

# text
seg-f42465f7d066 = ns

# text
seg-debc2f07db78 = true

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os restantes estão em <a1><c1/></a1>.

# text
seg-f4cf8b629797 = Página do tema: <a1>INTEGRITY.md</a1>

# text
seg-b0a5473bec67 = Ficha técnica do CSAC Microchip SA65 / SA.45s sigma_y(1s)={ "3e-10" }; q_

# text
seg-a8d92406e428 = Relógio ótico de rede de estrôncio, meta para uso espacial sigma_y

# text
seg-b9174c70772f = <b>MODELLED</b> χ² auxiliado pelo relógio, RAIM, AGC e SQM fundidos numa figura de mérito de segurança por época. Referência independente (ExternalDataset): parâmetros de cenário do TEXBAT (Humphreys { "2012" }) — caracterização, não vetores fixados. Comparação externa { "0.30" }, um achado (permanece MODELLED): no JammerTest { "2024" } (Bleik; dados GPL-3.0) os monitores em nível de observável (qui-quadrado auxiliado pelo relógio, RAIM, falha de solução) não levantaram alarme em até { "10" } s de nenhum dos { "8" } inícios de spoofing publicados avaliáveis (onde a janela anterior ao início estava limpa, o primeiro alarme veio de { "10.2" } a { "39" } s após o pu

# text
seg-e4b64d7277da = A deteção de spoofing é MODELLED, não validada: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-ee7dd15019d0 = Página do tópico: <a1>CAMPAIGNS.md</a1>

# text
seg-5a70fcb097dc = Campos opcionais: nenhum

# text
seg-304496607bd7 = Tipo de cenário do motor v{ $version }, família <a1>Jamming, spoofing e o espetro</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-5d23d7f8f872 = Página da família: <a1>Jamming, spoofing e o espetro</a1>

# text
seg-03d8dc3de7ca = <b>MODELLED</b> χ² assistido por relógio, RAIM, AGC, SQM: FoM de segurança fundida por época Ensaios: <a1>spoof_texbat_validation.rs</a1>.

# text
# c1: docs/kinds/by-kind/spoof.md
seg-09125f609abe = Fonte: <c1/>

# text
# c1: spoof
seg-8bf73eca4115 = <c1/> (tipo de cenário)

# text
seg-cbd77f6ffd63 = Detetor estocástico de spoofing de tempo (Neyman–Pearson / χ²₁) com P_fa/P_md de Monte Carlo.

# text
# c1: scenarios/spoof-attack.toml
seg-2a1e4e7893ba = Uma execução de <c1/> resume-se assim: cenário 2b6bd22c3b80 | spoof LinearRamp { "{" } rate_ns_per_s: { "0.1" } { "}" } vs especificação de { "20.000" } ns (P_fa { "0.010" }) | segurança quântica { "1.000" } (P_md { "0.000" }, MC { "0.000" }) detetado 70s | segurança clássica { "0.558" } (P_md { "0.442" }, MC { "0.444" }) detetado 430s

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-b577342dfe39 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/spoof-attack.toml
seg-adb7ff15a702 = O exemplo <c1/> define, entre outros:

# attr:alt
seg-6f6a8c975111 = O gráfico que o motor escreve para scenarios/spoof-attack.toml, tipo spoof

# text
# c1: leo-pass
# c2: [spoofer]
seg-ecc2dc8489bb = <b>MODELLED</b> A secção <c2/> do tipo <c1/>: um spoofer forja, de forma autoconsistente em distância e taxa de distância, os sinais vistos numa posição alegada que salta e/ou é empurrada da verdadeira após um início (por banda LEO e para o MEO Ensaios: <a1>leo_resilience_verticals.rs</a1>.

# text
# c1: [spoofer]
seg-8b3523b5fa2c = <b>MODELLED</b> Para cada satélite LEO e par de bandas de medição de distância, a secção <c1/> forma a combinação de pseudodistâncias livre de geometria, remove o modelo ionosférico do recetor e testa o seu degrau de época para época face ao ruído de código das duas bandas e a um Ensaios: <a1>leo_resilience_verticals.rs</a1>.

# text
seg-e5bbd2fca4fb = <s1>Anterior</s1>spoof-detect

# text
seg-8d3311751876 = <s1>Seguinte</s1>sweep-nd
