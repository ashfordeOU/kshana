# docs--kind-lunar-orbit-rendezvous: translations (pt-BR)

seg-34bdcfd66ded = Na ramificação do repositório de onde vêm estes documentos; ainda não está no GitHub

seg-f942b36a11c4 = Ainda não está no GitHub

seg-51362910dcb7 = { "2" } cenários incluídos usam este tipo; os demais estão em <a1><c1/></a1>.

seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED, a menos que a matriz diga o contrário (como um rótulo é obtido: a seção Evidence do README).

seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

seg-6a26b9ab59fe = Página do tópico: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Rótulo do resultado (o do motor): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> O propagador que os tipos de cenário lunares compartilham (GRAIL GL0660B de grau e ordem { "150" }, a Terra e o Sol como terceiros corpos, relatividade, orientação lunar DE440) comparado com as trajetórias púb. Referência independente (ExternalDataset): Efemérides de espaçonaves do JPL Horizons para o LRO e o CAPSTONE, em relação a limiares fixados antecipadamente em xval/mission-thread-lunar/PREREGISTRATION.md (Emendas { "1" } a { "6" }). LRO: MET, { "33" } m de maior diferença 3-D e { "2.4" } m RMS radial contra { "500" } m e { "60" } m. CAPSTONE: NOT MET, uma diferença de posição final de { "136.8" } km contra { "25" } km e uma diferença de periapsia de { "28.4" } km contra { "10" } km, as causas não isoladas. A linha é modelada porque o limiar do CAPSTON

seg-626ab55f0424 = MODELLED (resultado <c1/>)

seg-e482c9896140 = A propagação do modelo de forças lunares em relação a trajetórias públicas reconstruídas de orbitadores lunares e cislunares é MODELLED, não validada: uma subafirmação é verificada externamente, mas a capacidade inteira compõe partes modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Página do tópico: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Fonte: <c1/>

seg-8beb22a0eb0b = <c1/> (tipo de cenário)

seg-2deefd8c547b = Navegação relativa MODELLED para uma acoplagem no estilo Orion-módulo de pouso em uma órbita lunar baixa ou em uma órbita polar elíptica (classe Artemis). Um veículo perseguidor e um alvo voam a mesma órbita sob o modelo de forças lunares da biblioteca; uma estimativa conjunta de Gauss-Newton em lote de 21 parâmetros ao longo do arco (dois estados de veículo e viéses persistentes do sinal no espaço) funde uma solução absoluta de posição por veículo a partir de um conjunto de relés ILLUSTRATIVE de classe LCNS (relés atrás da Lua descartados, quatro necessários, o erro de modo comum do sinal no espaço se cancelando entre os veículos) e uma distância por enlace cruzado, com a precisão de medição de distância vinda do limite de rastreamento de código do piloto AFS da LunaNet. Informa o erro relativo formal e de Monte Carlo de posição e velocidade nos eixos LVLH do alvo, a disponibilidade das soluções, o erro de estimação normalizado quadrático médio em relação ao valor esperado, e qualquer tentativa cuja iteração não convergiu, a deriva por ignorar os harmônicos da gravidade e a covariância 6x6 completa transferida. Uma verificação de Hill/Clohessy-Wiltshire em forma fechada se aplica ao caso circular. MODELLED: conjunto de relés, orçamento de erro e priores ilustrativos; a referência e o estimador compartilham um único modelo de forças, de modo que o NEES verifica a autoconsistência e não o erro do modelo. Sem aval de agência; software de caráter consultivo, não um equipamento de navegação certificado.

seg-a6d29fc5f19b = Uma execução de <c1/> é resumida assim: lunar-orbit-rendezvous | llo 100x100 km | sep { "2000" } m | soluções { "74" }% | pos rel 1-sigma R/A/C 0.03/0.06/0.04 m | NEES médio { "6.51" } ({ "6" } esperado) | convergiu em { "2000" } s (MODELLED)

seg-b7c86affeac1 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = O exemplo <c1/> define, entre outros:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Software de caráter consultivo, não um equipamento de navegação certif

seg-4466fb6f4043 = Gauss-Newton em lote ao longo do arco

seg-d97b2505ac72 = O gráfico que o motor grava para scenarios/lunar-orbit-rendezvous.toml, tipo lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: uma estimativa conjunta de Gauss-Newton em lote de dois veículos ao longo do arco (vinte e um parâmetros: os dois estados e viéses persistentes de posição do sinal no espaço, comuns e independentes), ampliada sobre um quarto, me Testes: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> O tipo de cenário e fase <c1/>: uma estimativa conjunta de Gauss-Newton em lote de dois veículos ao longo do arco (vinte e um parâmetros: os dois estados e viéses persistentes de si. Referência independente (InternalConsistency): Autoconsistência sob um pré-registro (xval/mission-thread-lunar/PREREGISTRATION.md, resultados e histórico do estimador em RESULTS.md): o NEES médio do estado relativo é de { "5.85" } a { "5.93" } contra a faixa de { "5.2" } a { "6.8" } em quatro configurações, MET no quarto projeto de estimador depois que três projetos de filtro sequencial falharam; a referência e o estimador compartilham um único modelo de forças, portanto isso nada diz sobre o erro do modelo. O p

seg-b2f273ea732d = Navegação relativa MODELLED para uma acoplagem no estilo Orion-módulo de pouso em uma órbita lunar baixa ou em uma órbita polar elíptica (classe Artemis). (catálogo de tipos de cenário (<c1/>))

seg-9d4f99557cc5 = MODELLED: conjunto de relés, orçamento de erro e priores ilustrativos; a referência e o estimador compartilham um único modelo de forças, de modo que o NEES verifica a autoconsistência e não o erro do modelo. (catálogo de tipos de cenário (<c1/>))

seg-158e44d47c0b = HONESTIDADE: MODELLED. O conjunto de relés, o erro do sinal no espaço, a fração de modo comum e os priores são entradas ILLUSTRATIVE, não medições; a referência e o estimador compartilham o modelo de forças (um termo central embutido, J2 e C22). A verificação de consistência B1, fixada antecipadamente (NEES médio em [{ "5.2" }, { "6.8" }]), é atingida nas quatro configurações no projeto em lote: ver xval/mission-thread-lunar/RESULTS.md. Nenhuma concordância com qualquer ve (comentário do arquivo de cenário, linhas { "10" } a { "14" })

seg-2a88a9650804 = A navegação relativa até a acoplagem em uma órbita lunar (<c1/>) é MODELLED, não validada: verificada em relação à sua própria identidade em forma fechada / analítica — detecta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Anterior</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Próximo</s1>lunar-station-coverage
