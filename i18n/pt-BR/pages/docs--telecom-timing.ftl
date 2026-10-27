# docs--telecom-timing: translations (pt-BR)

# text
seg-04ece0eb7bd2 = Id da máscara

# attr:aria-label, text
seg-a13eab564243 = MTIE

# attr:aria-label, text
seg-f155b7ceef1f = TDEV

# text
seg-42cdb8e987e6 = Orçamento

# text
seg-88372b30ed79 = Limite

# text
seg-50fffd444946 = { "100" } ns

# text
seg-79e6a31245f2 = { "400" } ns

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-587beeccaa11 = Predefinição

# text
seg-edb7b16b6c0e = Validação

# text
seg-3c513ef2fd3b = Grandeza

# text
# c1: docs/TELECOM-TIMING.md
seg-62b6e83a9145 = Fonte: <c1/>

# text
seg-95222c3659cd = Temporização para telecomunicações: máscaras, fontes e predefinições

# text
# c1: telecom-timing
# c2: src/telecom_timing.rs
# c3: scenarios/telecom-prtc-holdover-24h.toml
# c4: scenarios/telecom-synce-eec.toml
# c5: scenarios/telecom-tie-ingest.toml
seg-5a604e063370 = Esta página lista todo limite que o tipo de cenário <c1/> verifica, de onde cada um vem e o que ficou de fora. O código é <c2/>. O cenário de referência é <c3/>, o de sincronização de frequência é <c4/> e o exemplo de ingestão é <c5/>.

# text
seg-f078828b2325 = <b>Abreviaturas.</b> ITU-T é o International Telecommunication Union Telecommunication Standardization Sector. GNSS é Global Navigation Satellite System. TE é o erro de tempo, a diferença entre o tempo de um relógio e o tempo de referência. max|TE| é o maior erro de tempo absoluto. MTIE é o erro máximo de intervalo de tempo: o maior erro de tempo pico a pico dentro de qualquer janela de observação de comprimento τ (tau). TDEV é o desvio de tempo, uma medida de valor quadrático médio da oscilação de tempo no tempo de média τ. cTE é o erro de tempo constante (o desvio médio). dTE é o erro de tempo dinâmico (a parte que se move). TE_L e dTE_L são o erro de tempo após um filtro passa-baixa de primeira ordem com largura de banda de { "0.1" } hertz (Hz); dTE_H é a parte acima desse filtro. TE_HO é o erro de tempo em holdover. PRTC é o relógio de tempo de referência primário. ePRTC é o PRTC aprimorado. T-BC é o relógio de fronteira de telecomunicações e T-TSC é o relógio escravo de tempo de telecomunicações. PTP é o Precision Time Protocol. PPS é pulso por segundo. OCXO é oscilador de cristal controlado por forno. CSAC é relógio atômico em escala de chip. CSV é valores separados por vírgula. ADEV é o desvio de Allan (σ_y), a medida padrão de estabilidade de frequência. ns é nanossegundos e µs é microssegundos. ppb é partes por bilhão (uma frequência fracionária de { "1e-9" }), e MHz é megahertz. Amd. é uma emenda a uma Recomendação, e Y.1367 e similares são o número da mesma Recomendação na série Y da ITU-T.

# text
# c1: allantools
seg-a7746845eb05 = <b>O que isto é.</b> Os estimadores (MTIE e TDEV) são verificados em relação ao pacote de terceiros <c1/> e são VALIDATED nesse aspecto. As tabelas de máscara são transcrições das Recomendações abaixo. Um holdover sintético é um modelo construído a partir de valores de datasheets públicos. O tipo de cenário é MODELLED no conjunto. Não é um teste de aderência à norma, e um PASS aqui não é um certificado.

# text
seg-e4adedc8e36d = Fontes lidas

# text
seg-44f6d9a7906c = Todos os textos da ITU-T foram baixados de itu.int em 2026-09-25. Foi usada a edição mais recente que pôde ser lida por completo.

# text
seg-28d4cebb747f = Recomendação

# text
seg-ef3644f3af9c = Edição lida

# text
seg-82dcf7b71cdb = Situação em itu.int

# text
seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

# text
seg-f65ca7286466 = em vigor

# text
seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

# text
seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), uma publicação de texto completo

# text
seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

# text
seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), texto completo

# text
seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

# text
seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), texto completo

# text
seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

# text
seg-63c64d128cc6 = 03/2020 e sua Amd. { "1" } (08/2024)

# text
seg-66209db00349 = Existem duas emendas mais novas que não puderam ser lidas: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) e G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Ambas estão pré-publicadas e restritas a membros da ITU (contas do Telecommunication Information Exchange Service, TIES). Se elas alterarem qualquer valor abaixo, esta página e o código ainda não o refletem.

# text
seg-25d639be3a1b = <b>Como os números foram conferidos.</b> A extração de texto desses arquivos Portable Document Format (PDF) perde a letra grega τ e o sinal de micro µ; assim, "{ "0.275" } × { "10" }⁻³τ" sai como "{ "0.275" } × { "10" }⁻³". Por isso, cada linha das Tabelas { "1" } a { "4" } da G.8272, das Tabelas { "1" } a { "5" } da G.8272.1, da Tabela { "1" } da G.8271 e da Tabela 7-1 da G.8271.1 foi lida novamente a partir da imagem renderizada da página. As Tabelas 7-1 a 7-5 da G.8273.2 e as Tabelas 7-2 e 7-3 da G.8271.1 foram lidas a partir de texto extraído em que o τ sobreviveu. Onde uma tabela implica continuidade em um ponto de quebra, um teste unitário a verifica.

# text
seg-33b5f44c513b = Limites implementados

# text
seg-3ce6da7e3e99 = τ está em segundos. Um intervalo escrito "{ "0.1" } < τ ≤ { "273" }" é aberto em { "0.1" } s e fechado em { "273" } s, exatamente como na tabela, e o código mantém cada extremo da mesma forma.

# text
seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A e PRTC-B, modo travado

# text
seg-c54e45baa463 = max|TE|

# text
seg-25887373a479 = { "40" } ns

# text
seg-0e18047889c1 = cláusula { "6.1" }

# text
seg-4ce06948bf3f = MTIE (cláusula { "6.2" }):

# text
seg-f1e336517976 = Máscara

# text
seg-7c40080fe799 = Intervalo

# text
seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

# text
seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

# text
seg-a2ae8d8ad68a = Tabela { "1" }

# text
seg-d1b301281575 = { "0.10" } µs

# text
seg-22afd1138a6a = τ > { "273" }

# text
seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

# text
seg-95049bb8aaa1 = Tabela { "2" }

# text
seg-f2562bdf8fd5 = { "0.04" } µs

# text
seg-72ef2a66af58 = τ > { "54.5" }

# text
seg-d18148049b1e = TDEV (cláusula { "6.2" }):

# text
seg-f492a7e39046 = { "3" } ns

# text
seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

# text
seg-7334c58cd44b = Tabela { "3" }

# text
seg-3bf4d8b009d5 = { "0.03" } τ ns

# text
seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

# text
seg-02bacda97914 = { "30" } ns

# text
seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

# text
seg-1c0341aaa919 = { "1" } ns

# text
seg-70c7899bf805 = Tabela { "4" }

# text
seg-8ec1f8c65e4f = { "0.01" } τ ns

# text
seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

# text
seg-2851f795541f = { "5" } ns

# text
seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

# text
seg-9b8478f86b44 = A cláusula { "6.2" } também declara que o período mínimo de medição para o TDEV é doze vezes o período de integração (T = 12τ). O tipo de cenário aplica essa regra a todo TDEV que informa; assim, o TDEV só é dado para τ até um doze avos do registro. A G.8272 não declara nenhum requisito de holdover para um PRTC.

# text
seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

# text
seg-42c76f7b90ac = Modo travado:

# text
seg-160dced77932 = { "4" } ns

# text
seg-88e8948869fc = { "0.1" } < τ ≤ { "1" }

# text
seg-c89d5cf52ad3 = { "0.11114" } τ + { "3.89" } ns

# text
seg-fad294d3be39 = { "1" } < τ ≤ { "100" }

# text
seg-e18d635df164 = { "0.0375" } × { "10" }⁻³ τ + { "15" } ns

# text
seg-273d60d5cd4a = { "100" } < τ ≤ { "400 000" }

# text
seg-4d971fea7954 = τ > { "400 000" }

# text
seg-4e9052bb688f = { "0.1" } < τ ≤ { "30 000" }

# text
seg-2401257610c6 = { "3.33333" } × { "10" }⁻⁵ τ ns

# text
seg-560ef6f53bf7 = { "30 000" } < τ ≤ { "300 000" }

# text
seg-727399dbf061 = { "10" } ns

# text
seg-3f5b5d8a1ea9 = { "300 000" } < τ < { "1 000 000" }

# text
seg-ca9cb946c8f4 = ePRTC-A holdover, erro de tempo (cláusula { "8.2.1" }, Tabela { "3" }). L é o tempo em que o ePRTC permaneceu travado antes da perda, em dias, e t é o tempo desde o início do holdover, em segundos. O limite aumenta linearmente de { "30" } ns a { "100" } ns ao longo do período de holdover H.

# text
seg-fa700160348e = Duração travada L

# text
seg-61f9dec111cb = Período de holdover H

# text
seg-f6a6df18839c = Limite de |Δx(t)|

# text
seg-9229068d7534 = L < { "6" } dias

# text
seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } dias)

# text
seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

# text
seg-1af75c2d666f = { "6" } dias ≤ L ≤ { "40" } dias

# text
seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

# text
seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

# text
seg-71a6238f1e29 = L > { "40" } dias

# text
seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } dias)

# text
seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

# text
seg-3262966b5eab = ePRTC-A holdover, wander (cláusula { "8.2.2" }):

# text
seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

# text
seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

# text
seg-a4a813c38ef6 = Tabela { "5" }

# text
seg-5d56fb7889b2 = A cláusula { "8.3.1" } define o erro de tempo máximo de holdover padrão, max|TE_HO|, em { "100" } ns. O tipo de cenário o usa como orçamento padrão de tempo até exceder.

# text
seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC and T-TSC

# text
seg-96b5072f792f = Classe A

# text
seg-7737bc0444b1 = Classe B

# text
seg-cd92242017a8 = Classe C

# text
seg-0689443dfc12 = Classe D

# text
seg-54163aca5d46 = max|TE| (sem filtro)

# text
seg-b36412e1acfb = { "70" } ns

# text
seg-ed79e6cdac25 = para estudo futuro

# text
seg-5c2985d408e3 = Tabela 7-1

# text
seg-067c7c90c1e1 = max|TE_L| (passa-baixas de { "0.1" } Hz)

# text
seg-1c5ac746d16b = Tabela 7-2

# text
seg-9802166ed2e2 = faixa de cTE

# text
seg-b94484db77ab = ±{ "50" } ns

# text
seg-17d4f5817950 = ±{ "20" } ns

# text
seg-1399281b7ce6 = ±{ "10" } ns

# text
seg-a694039549c8 = Tabela 7-3

# text
seg-d8799ba27fc3 = dTE_L MTIE, temperatura constante

# text
seg-c332ee79beaf = Tabela 7-4, m ≤ τ ≤ { "1 000" }

# text
seg-2bd284168318 = dTE_L TDEV, temperatura constante

# text
seg-8358cf8c4e50 = { "2" } ns

# text
seg-6a1cc65603b3 = Tabela 7-5

# text
seg-de739a499521 = Na Tabela 7-5, as classes A e B são escritas m < τ ≤ { "1 000" } e a classe C é escrita m ≤ τ ≤ { "1 000" }. m é 1/16 s para um fluxo PTP de { "16" } pacotes por segundo e { "1" } s para uma saída de { "1" } PPS. O tipo de cenário trata a entrada como um erro de intervalo de tempo de { "1" } PPS, portanto m = { "1" } s. A Tabela 7-3, Nota { "1" }, diz que o cTE é estimado pela média do erro de tempo em { "1 000" } s. O tipo de cenário informa a pior média absoluta de blocos consecutivos de { "1 000" } s.

# text
seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): limites de rede no ponto de referência C

# text
seg-8c2b01661011 = Os três são o caso de implantação { "1" } e se aplicam após um filtro passa-baixas de primeira ordem de { "0.1" } Hz.

# text
seg-b3f93a59a8eb = Cláusula

# text
seg-23e44eab6e8b = max|TE_L|

# text
seg-cb1a66f62f8e = Limite de MTIE

# text
seg-4aa99615d914 = { "7.3.1" } (aplicações de classe { "4" })

# text
seg-eacfcd0a9ea5 = { "1 100" } ns

# text
seg-dc2351580120 = { "100" } + { "75" } τ ns

# text
seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

# text
seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

# text
seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

# text
seg-884708f2736f = { "580" } ns

# text
seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

# text
seg-17c12885b0d1 = { "7.3.2" } (rede aprimorada)

# text
seg-fcd7cb03855f = { "600" } ns

# text
seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

# text
seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

# text
seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

# text
seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

# text
seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

# text
seg-f7fda527feed = { "200" } ns

# text
seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

# text
seg-1f0b651381ea = { "7.3.3" } (PRTC na rede de acesso)

# text
seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

# text
seg-3aacef0066a0 = { "1" } < τ < { "400" }

# text
seg-f34cbd5ce7e4 = { "44" } ns

# text
seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

# text
seg-b0987b4e2e07 = A Tabela 7-3 deixa o próprio τ = { "400" } s sem limite (uma linha termina em "< { "400" }", a seguinte começa em "{ "400" } <"). O tipo de cenário não informa limite ali, em vez de escolher um. O ponto de referência A (cláusula { "7.1" }) toma seus limites da G.8272, portanto as máscaras de PRTC acima o cobrem.

# text
seg-915182a7500e = Sincronização de frequência: geração de wander das G.811, G.812, G.8262 e G.8262.1 ({ "0.36" })

# text
# c1: scenarios/telecom-synce-eec.toml
seg-fb1342b76953 = Sete máscaras, cada uma o limite de geração de wander de MTIE e TDEV em temperatura constante (dentro de ±{ "1" } K), definido por meio do filtro de medição passa-baixas de primeira ordem equivalente de { "10" } Hz que as cláusulas indicam. Esse filtro atua antes da amostragem, de modo que o tipo de cenário toma o registro como já medido por meio dele e não aplica nada. A máscara PRC é para um relógio autônomo (configuração de relógio independente, G.810 Figura 2a); as demais são limites de modo travado para um relógio sincronizado a uma referência sem wander. O cenário de referência é <c1/>: um OCXO em funcionamento livre contra as três máscaras EEC, o que superestima a contribuição do oscilador em intervalos de observação longos em relação à constante de tempo de qualquer malha.

# text
seg-3faf039b0ed9 = MTIE (ns)

# text
seg-ca33cbe4fd07 = TDEV (ns)

# text
seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

# text
seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

# text
seg-cb38d6327e5c = G.811 (09/1997) cláusula { "6.1" }

# text
seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

# text
seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

# text
seg-5e048893f25e = G.812 (06/2004) Tabelas { "3" } e { "6" }

# text
seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

# text
seg-ae92888ca436 = G.812 (06/2004) Tabelas { "4" } e { "7" }

# text
seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-8e825000b58e = G.8262 (10/2024) Tabelas { "1" } e { "3" }

# text
seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

# text
seg-9ef5ff04e1d4 = como na G.812 Tabela { "7" }, fechada em { "10 000" } s

# text
seg-3ecb8d9128d0 = G.8262 (10/2024) Tabelas { "4" } e { "5" }

# text
seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-47d0f50aa906 = G.8262.1 (11/2025) Tabelas { "1" } e { "3" }

# text
seg-45e4ed8fa6ea = Cada linha foi conferida com o texto baixado de itu.int em 2026-10-13: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) e G.811 (09/1997). A G.812 (06/2004) consta como substituída por uma edição pré-publicada de 08/2026, e a G.811 tem uma Amd. { "1" } (04/2016); nenhuma das duas pôde ser baixada, portanto, se alterarem algum valor acima, esta página e o código não o refletem. Onde os coeficientes impressos tornam um ponto de quebra descontínuo (por exemplo { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns contra o patamar de { "100" } ns da G.812 Tabela { "4" }), as tabelas são mantidas como impressas e os testes unitários limitam o degrau. Não implementados: as tolerâncias de temperatura variável (G.812 Tabela { "5" }, G.8262 Tabela { "2" }, G.8262.1 Tabela { "2" }), os requisitos de holdover e de transitório, o jitter e a exatidão de frequência da G.811 da cláusula { "5" }.

# text
seg-4f6666854cf7 = Orçamentos (tempo até exceder)

# text
seg-1f3322a94bbb = max|TE_HO| padrão do ePRTC

# text
seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) cláusula { "8.3.1" }

# text
seg-0d5433d85c88 = Alocação de holdover da rede, interrupção curta de GNSS

# text
seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Tabela V.1, cenário de falha (b), "re-arrangements and holdover in the network". Um exemplo de alocação, não um requisito.

# text
seg-afe6c9903ada = Limite de rede no ponto de referência C

# text
seg-0c261b05c3cf = G.8271.1 cláusula { "7.3.1" }. Esta é uma grandeza filtrada; como orçamento, é comparada sem filtro.

# text
seg-4b5a9718d008 = Aplicação final, classe de exatidão { "4" }

# text
seg-2a38e45e7008 = { "1.5" } µs

# text
seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) Tabela { "1" }, classe { "4" }

# text
seg-ded846b5a4bc = <b>O valor clássico de "{ "1.5" } µs de ponta a ponta".</b> É o requisito de erro de tempo da G.8271 Tabela { "1" }, classe { "4" }, declarado em relação a uma referência comum na aplicação final. A G.8271.1 Tabela V.1 mostra como uma rede pode alocá-lo em operação normal: { "100" } ns para o PRTC/grandmaster de telecom, { "200" } ns para o erro de tempo dinâmico da cadeia, um erro de tempo constante para os relógios e enlaces, { "1 100" } ns no total no ponto de referência C, depois { "250" } ns para rearranjos e holdover curto na aplicação final e { "150" } ns para o ruído próprio da aplicação final, { "1 500" } ns no ponto de referência E. O cenário de falha (c) da mesma tabela, "long holdover periods, e.g., { "1" } day", dá { "3 350" } ns em C e { "3 500" } ns em E (sua Nota { "5" } diz que exceder { "1 500" } ns pode degradar o serviço). Assim, nenhuma das duas Recomendações declara um requisito de "{ "1.5" } µs ao longo de { "24" } horas de holdover", e o tipo de cenário não implementa nenhum.

# text
seg-76cab595673a = Não confirmado ou não implementado

# text
seg-175c282ddce2 = Nada abaixo está implementado como máscara. Nada disso foi preenchido por estimativa.

# text
seg-3c74e4ba9579 = <b>Marcado como "para estudo futuro" nas Recomendações:</b> G.8273.2 classe D max|TE|, cTE, dTE_L MTIE e TDEV, dTE_H e holdover; holdover do ePRTC-B (G.8272.1 cláusula { "8.2.1" }); MTIE e TDEV de holdover do ePRTC-A além de { "10 000" } s (Tabela { "4" } Nota { "1" }, Tabela { "5" } Nota { "2" }); descontinuidade de fase do ePRTC (cláusula { "7" }); holdover de fase/tempo de T-BC/T-TSC com as entradas PTP e de camada física perdidas (G.8273.2 cláusula { "7.4.2.1" }); o limite de rede de TDEV no ponto de referência C (G.8271.1 cláusulas { "7.3.1" } a { "7.3.3" }); limites de rede para o caso de implantação { "2" } no ponto C.

# text
seg-93c60d44788e = <b>Transcritos, mas não implementados nesta versão:</b> G.8273.2 Tabela 7-6 (MTIE com temperatura variável: { "40" } / { "40" } / { "10" } ns até { "10 000" } s), Tabela 7-7 (dTE_H pico a pico: { "70" } / { "70" } / { "30" } ns, que requer um filtro passa-altas de { "0.1" } Hz), Tabela 7-10 (MTIE de holdover com assistência de frequência da camada física), erro de tempo relativo (Tabelas 7-8 e 7-9) e os limites de dTE_H da G.8271.1, cláusulas { "7.3.2" } ({ "50" } ns) e { "7.3.3" } ({ "70" } ns).

# text
seg-f5fcd3b0f8a5 = <b>Não aplicado:</b> o filtro de média móvel de pelo menos { "100" } amostras que a G.8272 e a G.8272.1 indicam para interfaces PTP. A entrada é tratada como um erro de intervalo de tempo de { "1" } PPS, que essas Recomendações medem sem filtro.

# text
seg-74fe057a4392 = <b>Ilegível:</b> as duas emendas restritas de { "2026" } citadas em "Fontes lidas".

# text
seg-bd4ec59cc872 = <b>Peculiaridade editorial:</b> na G.8272.1 Amd. { "1" }, o cabeçalho da Tabela { "3" } traz uma linha inserida "TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }" em marcação de emenda, acima das colunas de erro de tempo. Ela não é tratada como parte do envelope de erro de tempo. O mesmo TDEV de { "1" } ns está na Tabela { "5" } e é implementado ali.

# text
seg-511db1219de1 = O filtro de medição

# text
seg-5fc683308b31 = G.8273.2 e G.8271.1 definem seus limites filtrados por meio de um filtro passa-baixas de primeira ordem com largura de banda de { "0.1" } Hz. O tipo de cenário aplica o suavizador discreto y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), iniciado na primeira amostra. É uma aproximação de equipamento de ensaio, não uma cópia de nenhum instrumento. É aplicado somente quando o intervalo de amostragem Δt é de { "1" } s ou menos. Um registro mais grosseiro é informado como NOT-EVALUATED contra uma máscara filtrada, em vez de ser filtrado de forma inadequada.

# text
seg-218e5ad620af = Predefinições de oscilador (MODELLED)

# text
seg-28bb7b8ad89f = Todos os valores são os do próprio datasheet, lidos em 2026-09-25.

# text
seg-b4207b682560 = Dispositivo e documento

# text
seg-13f9ba96c063 = Máximos de ADEV usados (τ: σ_y)

# text
seg-d719167df981 = Envelhecimento

# text
seg-f30740907f6a = Temperatura

# text
seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; datasheet Rev 12-1-2021

# text
seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

# text
seg-85f8b8fbbae6 = ±{ "0.15" } ppb/dia após { "72" } h (f ≤ { "10" } MHz)

# text
seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C a +{ "70" } °C, referenciado a +{ "25" } °C

# text
seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, standard performance; DS00003047A (2/20)

# text
seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

# text
seg-ae0f630aba4b = <5e-11/mês após { "30" } dias

# text
seg-dbb2a780ceb9 = coeficiente de temperatura <{ "3E-10" }, { "0" } °C a { "50" } °C

# text
seg-79d5b7a3a453 = Microchip 5071A, tubo de alto desempenho; DS00002980D (5/25)

# text
seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } dias: { "1.0e-14" }; { "30" } dias: { "1.0e-14" }

# text
seg-1fbdd6edc376 = nenhuma taxa publicada; variação ao longo da vida útil ≤{ "5.0e-14" }

# text
seg-bb485faf403a = ±{ "8.0e-14" } em relação ao ambiente ({ "0" } °C a { "50" } °C, umidade, campo magnético, choque)

# text
seg-889f4dc6cafc = Microchip SA.45s CSAC, opções { "001" } e { "003" }; DS00002985D (5/23)

# text
seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

# text
seg-c90e2f590297 = <9e-10/mês após { "30" } dias

# text
seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C a { "70" } °C

# text
seg-63ba00e95bbc = Links dos documentos: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

# text
seg-31ad29d092ee = Deixados de fora de propósito: a linha de { "10" } s do 8040C, que o datasheet imprime como "<{ "1.0" } x { "10" }^{ "11" }" (um expoente impresso errado), e as linhas do 5071A abaixo de { "1" } s. O OX-049 foi considerado para o OCXO e não foi usado, porque sua linha de envelhecimento não pode ser lida sem ambiguidade em sua tabela desalinhada.

# text
seg-8d4a915bc7fc = <b>Como os valores se tornam um modelo.</b> Estas são escolhas deste mecanismo, e cada uma é informada na saída da execução:

# text
seg-f1e6ea28601c = <b>Ajuste de ruído.</b> Os níveis de ruído de frequência branco, flicker e de passeio aleatório são um ajuste de mínimos quadrados não negativos aos máximos de ADEV, depois ampliados até que o modelo esteja igual ou acima de todos os pontos. Os valores do datasheet são máximos, portanto o modelo os envolve.

# text
seg-0e5ab055094a = <b>Piso de flicker.</b> O piso nunca fica abaixo da ADEV no maior τ listado. Um datasheet deixa de listar onde o fabricante deixa de prometer melhora, de modo que o modelo não deixa o relógio melhorar além desse ponto. Isso só pode piorar um holdover.

# text
seg-ebefbd6f119b = <b>Envelhecimento.</b> Um valor mensal é convertido a { "30" } dias por mês e aplicado como deriva linear de frequência a partir do momento da perda. A predefinição de césio não tem envelhecimento.

# text
seg-bb08c7b5baf5 = <b>Temperatura.</b> O limite declarado é lido linearmente sobre metade da faixa de operação (por exemplo, ±{ "5e-10" } sobre −{ "10" } °C a { "70" } °C dá { "1.25e-11" } por kelvin), e então conduzido por um perfil de temperatura senoidal cuja amplitude e período são entradas do cenário. Nada em um datasheet diz que a dependência é linear; esta é uma leitura de pior caso.

# text
seg-47a256757cfc = <b>Antes da perda</b> o relógio está disciplinado e seu erro de tempo é ruído de fase branco com um valor de 1-sigma declarado.

# text
seg-3ef60b128bb7 = <b>O que o cenário de referência mostra.</b> Nas entradas registradas (rubídio, variação diária de temperatura de ±{ "2" } K, holdover de { "24" } h após { "1" } h travado) o registro atinge um erro de tempo absoluto máximo de { "603.2" } ns. Ele cruza o orçamento de { "100" } ns do ePRTC { "8 206" } s após a perda e a alocação de { "400" } ns após { "25 713" } s, e permanece dentro de { "1 100" } ns e { "1.5" } µs durante o dia inteiro. Ele falha no envelope de holdover do ePRTC-A { "3 627" } s após a perda, o que é esperado: esse requisito pressupõe uma referência de classe césio. O termo de temperatura sozinho pode chegar a { "660" } ns, de modo que, nessas entradas, importa mais que o envelhecimento ({ "72" } ns ao fim do dia).

# text
# c1: tests/telecom_timing_reference.rs
# c2: allantools
# c3: tests/fixtures/telecom_timing/holdover_te_series.csv
# c4: docs/VERIFICATION-MATRIX.md
seg-ba87d450423c = <c1/> confere o MTIE e o TDEV do tipo de cenário com <c2/> { "2024.06" } em <c3/>, uma série de holdover de CSAC de { "2" } 048 amostras com envelhecimento, flicker e temperatura. Em { "17" } fatores de média de MTIE e { "12" } de TDEV, o MTIE concorda exatamente e o TDEV concorda até { "1.1e-15" } em valor relativo. As mesmas curvas são lidas de volta de uma execução completa que ingere o CSV. Isso valida os estimadores nesse registro. Não valida o holdover sintético, as máscaras nem as predefinições, que são linhas MODELLED em <c4/>.

# text
seg-6fdc3cc32a2f = <s1>Anterior</s1>Temporização por slot

# text
seg-1108b114de88 = <s1>Próximo</s1>Tempo enganado
