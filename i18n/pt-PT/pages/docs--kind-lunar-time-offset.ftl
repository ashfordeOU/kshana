# docs--kind-lunar-time-offset: translations (pt-PT)

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

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
seg-7f3e13712f10 = Taxa relativista modelada do relógio Terra–Lua (Tempo Coordenado Lunar, LTC/TCL): a taxa secular LTC−TT a partir da diferença de autopotencial e do termo cinético da Lua, indicada com a banda publicada de { "56" }–{ "59" } µs/dia, mais o desvio acumulado ao longo de um horizonte.

# text
# c1: scenarios/lunar-time-offset.toml
seg-9efcf3e1be04 = Uma execução de <c1/> resume-se assim: lunar-time-offset | taxa secular LTC−TT de { "57.04" } µs/dia (banda { "56" }–{ "59" }) | autopot { "57.50" } cinético -0.46 | desvio @ { "1.00" } d = { "57.04" } µs

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
seg-982426693747 = <b>VALIDATED</b> Taxa relativista do relógio Terra-Lua (LTC/TCL) + encadeamento TT/TAI/UTC + conjunto. Referência independente (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; base do LTC LunaNet da IAU/IAG): o autopotencial à superfície da Lua L_m = { "3.13881e-11" } e o total secular de { "56.02" } µs/dia coincidem como valores numéricos publicados; a velocidade geocêntrica da Lua verificada de forma cruzada face ao JPL DE440 (de440s.bsp via SPICE)

# text
seg-96b65f604cc2 = Honestidade: MODELLED, não certificado. O valor principal em us/dia depende da referência (geoide terrestre W0 vs um selenoide lunar, a janela de média temporal, correções centrífugas/J2 inferiores a us/dia desprezadas) -> uma banda, e não um único número, é o resultado honesto. Nada aqui está validado até uma exatidão absoluta inferior ao nanossegundo nem certificado para manutenção da hora operacional. O relatório indica também o desvio LTC-TT acumulado ao longo do hori (comentário do ficheiro de cenário, linhas { "11" } a { "16" })

# text
seg-e4552368a6a7 = <s1>Anterior</s1>lunar-time-budget

# text
seg-777dc23bac6a = <s1>Seguinte</s1>lunar-vlbi-fim

# text
seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>
