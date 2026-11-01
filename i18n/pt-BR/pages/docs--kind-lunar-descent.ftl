# docs--kind-lunar-descent: translations (pt-BR)

seg-f942b36a11c4 = Ainda não está no GitHub

seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os demais estão em <a1><c1/></a1>.

seg-98151954f217 = false

seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

seg-6a26b9ab59fe = Página do tópico: <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = differential

seg-2d84b341a41f = Rótulo do resultado (o do motor): MODELLED

seg-626ab55f0424 = MODELLED (resultado <c1/>)

seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Fonte: <c1/>

seg-d4df5aa9b7b0 = <c1/> (tipo de cenário)

seg-2cd0d5385530 = Orçamento de dispersão de pouso MODELLED para uma descida propulsada a um local polar sul (classe Artemis). Por eixo horizontal, um modelo de erro inercial de cinco estados (posição, velocidade, viés do acelerômetro, inclinação de atitude, viés do giroscópio) é conduzido pela força específica da descida; um filtro sequencial recebe soluções de posição dos auxílios habilitados: uma solução AFS a partir dos relés visíveis de uma constelação ILLUSTRATIVE de classe LCNS (isolada, ou diferencial usando o resíduo do enlace de correção de lunar-differential-pnt, com o relógio auxiliado quando apenas três relés estão visíveis) e uma solução relativa ao terreno (o correlacionador TERCOM/SITAN da biblioteca sobre um relevo sintético, ou o limite de Cramer-Rao da correlação de uma janela de elevação do DEM polar sul real do LOLA). O tempo lunar entra pelo relógio do veículo nas soluções (o deslocamento LTC-TT de lunar-time-offset, ou a incerteza de sua faixa publicada) e como um erro de marcação de tempo ao longo da trajetória. Informa a elipse de pouso de 3 sigma, R95, as fontes inerciais em forma fechada, a contribuição de cada auxílio, a ablação de cada combinação de auxílios, uma calibração de Monte Carlo da elipse e a covariância transferida. MODELLED: classe de IMU, conjunto de relés, perfil de descida e termo de guiagem ilustrativos; terrain-nav usa um relevo sintético em escala métrica terrestre; a disponibilidade de AFS é de uma época com uma máscara plana. Sem aval de agência; software de caráter consultivo, não um equipamento de navegação certificado.

seg-c6c1a8f184ed = Uma execução de <c1/> é resumida assim: lunar-descent | -89.50 deg | apenas inercial 517/517 m (L/N) | com auxílios 7.6/4.8 m | dispersão R95 { "51" } m | elipse de 3 sigma { "64" } x { "62" } m | { "99.1" }% dentro (esperado { "98.9" }%) (MODELLED)

seg-dfdb7de68515 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = O exemplo <c1/> define, entre outros:

seg-8073ece4c900 = O gráfico que o motor grava para scenarios/lunar-descent.toml, tipo lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: um modelo de erro inercial de cinco estados por eixo (posição, velocidade, viés do acelerômetro, inclinação, viés do giroscópio) ao longo de uma descida propulsada, auxiliado por soluções AFS (isoladas ou diferenciais, com o caso de três rel

seg-bfe4c0a04288 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: um modelo de erro inercial de cinco estados por eixo (posição, velocidade, viés do acelerômetro, inclinação, viés do giroscópio) ao longo de uma descida propulsada,. Referência independente (InternalConsistency): A deriva inercial em forma fechada, os resultados próprios dos tipos reutilizados e a calibração da elipse de 3 sigma (a fração interna concorda com a esperada) nos testes. Nenhum pouso voado ou testado é comparado

seg-ed286f215c96 = Orçamento de dispersão de pouso MODELLED para uma descida propulsada a um local polar sul (classe Artemis). (catálogo de tipos de cenário (<c1/>))

seg-c1bd92ba429b = MODELLED: classe de IMU, conjunto de relés, perfil de descida e termo de guiagem ilustrativos; terrain-nav usa um relevo sintético em escala métrica terrestre; a disponibilidade de AFS é de uma época com uma máscara plana. (catálogo de tipos de cenário (<c1/>))

seg-85714bc3cf2a = HONESTIDADE: MODELLED. A classe de IMU, o perfil de descida, o conjunto de relés, o erro do sinal no espaço e o termo de guiagem são entradas ILLUSTRATIVE, não medições. O modo terrain-nav usa o relevo sintético autônomo e uma escala métrica terrestre, de modo que o termo de terreno aqui é o comportamento do correlacionador sobre um substituto, e não uma afirmação sobre o relevo polar sul: a variante lola-crlb (lunar-descent-lola.toml) usa o real (comentário do arquivo de cenário, linhas { "14" } a { "20" })

seg-3eb1b3b03600 = O orçamento de dispersão de pouso em um local polar lunar (<c1/>) é MODELLED, não validado: verificado em relação à sua própria identidade em forma fechada / analítica — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Anterior</s1>lunar-beacon

seg-ca9b68783354 = <s1>Próximo</s1>lunar-differential-pnt
