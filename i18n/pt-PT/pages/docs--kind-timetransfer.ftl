# docs--kind-timetransfer: translations (pt-PT)

# text
seg-c61e88721556 = Tipo de cenário do motor v{ $version }, família <a1>Relógios, temporização e holdover</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-849c08d3ce70 = Página da família: <a1>Relógios, temporização e holdover</a1>

# text
seg-5a70fcb097dc = Campos opcionais: nenhum

# text
seg-a1810bbca337 = <b>MODELLED</b> Bidirecional/TWSTFT (Sagnac), visada comum de GNSS, PPP; jitter do enlace→distância. Referência independente (ExternalDataset): Magnitude de Sagnac conferida contra um VALOR PUBLICADO de autoridade — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: uma circum-navegação equatorial para leste acumula { "207.4" } ns (2ωA_E/c²); o kshana reproduz { "207.386" } ns. Corroborado de forma independente pela geodist() do RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que traz a mesma geometria 2Aω/c². O transponder/visada comum/ BIPM TWSTFT composto

# text
seg-a8beb8dfc757 = O orçamento de erros de transferência de tempo é MODELLED, não validado: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-37a77f49f048 = ps

# text
# c1: docs/kinds/by-kind/timetransfer.md
seg-2ccebbc74d9f = Fonte: <c1/>

# text
# c1: timetransfer
seg-289a9f8dc990 = <c1/> (tipo de cenário)

# text
seg-ccb244e60d60 = Transferência bidirecional de tempo/frequência ótica vs RF.

# text
# c1: scenarios/timetransfer.toml
seg-59347fda6c66 = Uma execução de <c1/> resume-se assim: cenário 8f9c2e0e31a5 | ótica sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-890040dd3d96 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/timetransfer.toml
seg-7b887ea27a86 = O exemplo <c1/> define, entre outros:

# text
seg-2485eaa6dbf4 = Transferência bidirecional de tempo e frequência por satélite (TWSTFT, banda Ku

# text
seg-fa54f1a81b57 = Ligação ótica entre satélites, sincronização ao nível do picossegundo

# text
seg-a30fe2b87ee2 = mm

# attr:alt
seg-bd76bd68eab3 = O gráfico que o motor escreve para scenarios/timetransfer.toml, tipo timetransfer

# text
seg-3c9d28692f9f = <b>MODELLED</b> Bidirecional/TWSTFT (Sagnac), vista comum GNSS, PPP; jitter da ligação→distância Ensaios: <a1>time_transfer_error_budgeting_reference.rs</a1>.

# text
seg-84fcf20588fb = <s1>Anterior</s1>time-transfer-budget

# text
seg-149ad280a1f9 = <s1>Seguinte</s1>tracking-loop
