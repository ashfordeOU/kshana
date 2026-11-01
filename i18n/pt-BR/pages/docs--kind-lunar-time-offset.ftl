# docs--kind-lunar-time-offset: translations (pt-BR)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-619127334cf3 = Nenhuma linha da matriz nomeia este tipo de cenário pelo nome; o rótulo do seu resultado é o do próprio motor, acima.

# text
seg-4d208b6c0eb8 = dia

# text
# c1: docs/kinds/by-kind/lunar-time-offset.md
seg-64813e3da228 = Fonte: <c1/>

# text
# c1: lunar-time-offset
seg-000bb13909f1 = <c1/> (tipo de cenário)

# text
seg-7f3e13712f10 = Taxa relativística modelada do relógio Terra–Lua (Tempo Coordenado Lunar, LTC/TCL): a taxa secular LTC−TT a partir da diferença de autopotencial e do termo cinético da Lua, informada com a faixa publicada de { "56" }–{ "59" } µs/dia, mais o deslocamento acumulado ao longo de um horizonte.

# text
# c1: scenarios/lunar-time-offset.toml
seg-9efcf3e1be04 = Uma execução de <c1/> resume-se assim: lunar-time-offset | secular LTC−TT rate { "57.04" } µs/day (band { "56" }–{ "59" }) | self-pot { "57.50" } kinetic -0.46 | offset @ { "1.00" } d = { "57.04" } µs

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-9367773c4889 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/lunar-time-offset.toml
seg-4731141e6aac = O exemplo <c1/> define, entre outros:

# text
seg-3843825d0733 = us

# attr:alt
seg-e9deb6ed41c1 = O gráfico que o motor escreve para scenarios/lunar-time-offset.toml, tipo de cenário lunar-time-offset

# text
seg-982426693747 = <b>VALIDATED</b> Taxa relativística do relógio Terra-Lua (LTC/TCL) + encadeamento TT/TAI/UTC + conjunto. Referência independente (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; base do LTC da LunaNet IAU/IAG): o autopotencial na superfície da Lua L_m = { "3.13881e-11" } e o total secular de { "56.02" } µs/dia coincidem como valores numéricos publicados; velocidade geocêntrica da Lua verificada de forma cruzada contra o JPL DE440 (de440s.bsp via SPICE)

# text
seg-96b65f604cc2 = Honestidade: MODELLED, não certificado. O valor principal em us/dia depende da referência (geoide W0 da Terra contra um selenoide lunar, a janela de média no tempo, correções centrífugas/J2 abaixo de us/dia desprezadas) -> uma faixa, e não um único número, é a saída honesta. Nada aqui é validado até exatidão absoluta abaixo de um nanossegundo nem certificado para a manutenção operacional da hora. O relatório também fornece o deslocamento LTC-TT acumulado ao longo do hori (comentário do arquivo de cenário, linhas { "11" } a { "16" })

# text
seg-e4552368a6a7 = <s1>Anterior</s1>lunar-time-budget

# text
seg-777dc23bac6a = <s1>Próximo</s1>lunar-vlbi-fim

seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>
