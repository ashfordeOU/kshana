# docs--kind-contact-schedule: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-dfe78b9d0811 = GHz

# text
seg-37d16b499bc5 = dB

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 da ligação descendente ao longo de cada passagem de um satélite sobre uma estação (EIRP, perda em espaço livre, perda atmosférica em lei da cossecante, outras perdas, G/T, constante de Boltzmann, taxa de símbolos), o MODCOD DVB-S2 mais eficiente que satisfaz o limiar da ETSI EN { "302" } 307-

# text
seg-c246881f6fd4 = <b>VALIDATED</b> Passagens de visibilidade (AOS, TCA, LOS, elevação aparente máxima, duração) de um conjunto de elementos SGP4 sobre uma estação WGS-84 no caminho validado de órbita terrestre (IAU { "2006" }. Referência independente (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) com Hipparchus { "4.0.3" }: TLEPropagator sobre os mesmos conjuntos de elementos num TEME que o Orekit constrói segundo a definição indicada (a sua rotação TOD IERS { "2010" } por GAST - GMST), ElevationDetector e ElevationExtremumDetector com e sem ITURP834AtmosphericRefraction, e AngularAzEl com AngularRadioRefractionModifier para o caso do tempo de luz, cruzamentos e máximo resolvidos pelo Hipparchus; { "60" } casos (f

# text
seg-35588ca8e9bb = <b>MODELLED</b> Es/N0 da ligação descendente ao longo de cada passagem de um satélite sobre uma estação (EIRP, perda em espaço livre, perda atmosférica em lei da cossecante, outras perdas, G/T, constante de Boltzmann,. Referência independente (InternalConsistency): Consistência interna: a eficiência espetral calculada em forma fechada a partir de K_bch da Tabela 5a e dos comprimentos de trama concorda com as eficiências que a Tabela { "13" } apresenta (uma verificação de transcrição da tabela de limiares); as partes do balanço de ligação concordam com as suas formas fechadas; a seleção é monótona em Es/N0 e respeita a margem; o ACM transfere pelo menos o volume de codificação constante. A geometria da passagem provém do VALIDATED em separado a

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos (<c1/>))

# text
seg-7f8667e8d8fe = A codificação e modulação adaptativas DVB-S2 ao longo de uma passagem de descida LEO são MODELLED, não validadas: verificadas face à sua própria identidade analítica / de forma fechada — apanha erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
seg-72fd0321e4af = Página do tema: <a1>CONTACT-SCHEDULING.md</a1>

# text
# c1: docs/kinds/by-kind/contact-schedule.md
seg-b79fcddea1d6 = Fonte: <c1/>

# text
# c1: contact-schedule
seg-040d160b3fdd = <c1/> (tipo de cenário)

# text
seg-be4e928a5865 = Planeamento de contactos com o solo para vários satélites sobre várias estações: janelas de acesso aparentes (SGP4, referencial fixo à Terra IAU 2006/2000A, refração ITU-R P.834, tempo de luz), o volume de dados DVB-S2 ACM de cada passagem (limiares da Tabela { "13" } da ETSI EN { "302" } 307-1) e um calendário sem conflitos (um satélite por antena com um tempo de retorno, uma estação por satélite, entrega ponderada por prioridade limitada a cada backlog) por um método guloso de valor marginal, uma linha de base de ordem de chegada e um branch and bound exato em conjuntos pequenos, com a lacuna de otimalidade do método guloso. MODELLED.

# text
# c1: scenarios/contact-schedule.toml
seg-7a3fad06a9fc = Uma execução de <c1/> resume-se assim: contact-schedule: { "3" } satélites x { "3" } estações em { "12" } h -> { "31" } contactos candidatos, { "22" } agendados; { "797266" } de { "860000" } Mbit entregues (MODELLED)

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-a03d83f5866a = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/contact-schedule.toml
seg-5ba0968796ac = O exemplo <c1/> define, entre outros:

# text
seg-cade59b5a371 = Rótulo do resultado (o do motor): MODELLED — plano de contactos de vários satélites e várias estações: janelas de acesso aparentes (SGP4, IAU 2006/2000A, refração ITU-R P.834, tempo de luz), volume de dados DVB-S2 ACM por passagem a partir de um balanço de enlace em céu claro (limiares da Tabela { "13" } da ETSI EN { "302" } 307-1) e resolução de conflitos (um satélite por antena com tu

# attr:alt
seg-e26b549579e2 = O gráfico que o motor gera para scenarios/contact-schedule.toml, tipo de cenário contact-schedule

# text
seg-036b708ed2b9 = <b>MODELLED</b> Contactos candidatos de cada passagem satélite-estação com o seu volume de dados ACM; conflitos em que uma antena serviria dois satélites dentro do seu tempo de retorno ou um satélite faria downlink para duas estações ao mesmo tempo; uma entrega ponderada por priorida

# text
seg-60431931082a = <b>MODELLED</b> Contactos candidatos de cada passagem satélite-estação com o seu volume de dados ACM; conflitos em que uma antena serviria dois satélites dentro do seu tempo de retorno ou u. Referência independente (InternalConsistency): Consistência interna: o branch and bound exato concorda com a enumeração por força bruta em conjuntos aleatórios pequenos, cada plano é verificado como viável contra as regras de conflito, e o método guloso nunca supera o ótimo exato. O QUE NÃO É: nenhum escalonador externo ou plano operacional foi comparado; os contactos são tomados inteiros (sem divisão), o backlog é fixo no início da janela, o tempo de apontamento além do tempo de retorno fixo e o de bordo s

# text
# c1: label
seg-9941b9f6d4a8 = MODELLED — plano de contactos de vários satélites e várias estações: janelas de acesso aparentes (SGP4, IAU 2006/2000A, refração ITU-R P.834, tempo de luz), volume de dados DVB-S2 ACM por passagem a partir de um balanço de enlace em céu claro (limiares da Tabela { "13" } da ETSI EN { "302" } 307-1) e resolução de conflitos (um satélite por antena com tempo de retorno, uma estação por satélite) por um método guloso de valor marginal conferido contra um branch and bound exato; sem desvanecimento por chuva, (resultado <c1/>)

# text
seg-f8ef88bc82b5 = Cada número abaixo é ILLUSTRATIVE: sem as órbitas, estações ou balanço de enlace de nenhum operador. MODELLED: o escalonador é conferido contra o seu próprio solucionador exato, não contra uma ferramenta externa. (comentário do ficheiro de cenário, linhas { "11" } a { "12" })

# text
seg-fe2b4799b397 = O escalonamento de contactos com o solo de vários satélites e várias estações com resolução de conflitos é MODELLED, não validado: conferido contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-be14d99cb86d = <s1>Anterior</s1>constellation-design

# text
seg-3784be57d6df = <s1>Seguinte</s1>earth-gnss-lunar
