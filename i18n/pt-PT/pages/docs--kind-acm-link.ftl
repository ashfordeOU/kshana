# docs--kind-acm-link: translations (pt-PT)

# text
# c1: docs/kinds/by-kind/acm-link.md
seg-a686bcdc6cc9 = Fonte: <c1/>

# text
# c1: acm-link
seg-a53e57719a74 = <c1/> (tipo de cenário)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-cb9447893c7f = Um satélite sobre uma estação: a distância oblíqua, a elevação e o Es/N0 de cada passagem ao longo da passagem, o MODCOD DVB-S2 escolhido em cada passo (limiares da Tabela { "13" } da ETSI EN { "302" } 307-1 mais uma margem de implementação) e o volume de dados que o ACM transfere face à linha de base de codificação constante que fecha na máscara. MODELLED.

# text
# c1: scenarios/acm-link.toml
seg-1ab30ff9616a = Uma execução de <c1/> resume-se assim: acm-link: { "3" } pass(es); ACM { "92866" } Mbit vs CCM 8PSK 3/4 { "58495" } Mbit -> gain x1.59 (MODELLED)

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellite
# c8: station
seg-54e2159e532d = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/acm-link.toml
seg-c7d1b4b1f247 = O exemplo <c1/> define, entre outros:

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-dfe78b9d0811 = GHz

# text
seg-37d16b499bc5 = dB

# text
seg-b77b8420b4f5 = Mbit

# text
seg-37d29d8303fe = km

# text
seg-eeaa777e4301 = 8PSK 3/4

# text
seg-d62795b9fdc0 = Etiqueta do resultado (a do motor): MODELLED — codificação e modulação adaptativas DVB-S2 ao longo das passagens de um satélite numa estação: Es/N0 em céu limpo ao longo de cada passagem aparente, o MODCOD mais eficiente que satisfaz o limiar da Tabela { "13" } da ETSI EN { "302" } 307-1 mais uma margem, face ao MODCOD de codificação constante que fecha na máscara; sem chuva f

# attr:alt
seg-046f69293874 = O gráfico que o motor escreve para scenarios/acm-link.toml, tipo acm-link

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 da ligação descendente ao longo de cada passagem de um satélite sobre uma estação (EIRP, perda em espaço livre, perda atmosférica em lei da cossecante, outras perdas, G/T, constante de Boltzmann, taxa de símbolos), o MODCOD DVB-S2 mais eficiente que satisfaz o limiar da ETSI EN { "302" } 307-

# text
seg-c246881f6fd4 = <b>VALIDATED</b> Passagens de visibilidade (AOS, TCA, LOS, elevação aparente máxima, duração) de um conjunto de elementos SGP4 sobre uma estação WGS-84 no caminho validado de órbita terrestre (IAU { "2006" }. Referência independente (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) com Hipparchus { "4.0.3" }: TLEPropagator sobre os mesmos conjuntos de elementos num TEME que o Orekit constrói segundo a definição indicada (a sua rotação TOD IERS { "2010" } por GAST - GMST), ElevationDetector e ElevationExtremumDetector com e sem ITURP834AtmosphericRefraction, e AngularAzEl com AngularRadioRefractionModifier para o caso do tempo de luz, cruzamentos e máximo resolvidos pelo Hipparchus; { "60" } casos (f

# text
seg-35588ca8e9bb = <b>MODELLED</b> Es/N0 da ligação descendente ao longo de cada passagem de um satélite sobre uma estação (EIRP, perda em espaço livre, perda atmosférica em lei da cossecante, outras perdas, G/T, constante de Boltzmann,. Referência independente (InternalConsistency): Consistência interna: a eficiência espetral calculada em forma fechada a partir de K_bch da Tabela 5a e dos comprimentos de trama concorda com as eficiências que a Tabela { "13" } apresenta (uma verificação de transcrição da tabela de limiares); as partes do balanço de ligação concordam com as suas formas fechadas; a seleção é monótona em Es/N0 e respeita a margem; o ACM transfere pelo menos o volume de codificação constante. A geometria da passagem provém do VALIDATED em separado a

# text
# c1: label
seg-02e9f2e87410 = MODELLED — codificação e modulação adaptativas DVB-S2 ao longo das passagens de um satélite numa estação: Es/N0 em céu limpo ao longo de cada passagem aparente, o MODCOD mais eficiente que satisfaz o limiar da Tabela { "13" } da ETSI EN { "302" } 307-1 mais uma margem, face ao MODCOD de codificação constante que fecha na máscara; sem desvanecimento por chuva nem perda de apontamento ao longo da passagem (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos (<c1/>))

# text
seg-a2cdc7dff1e3 = Todos os números abaixo são ILLUSTRATIVE: nenhuma órbita, estação ou balanço de ligação de um operador. MODELLED. (comentário do ficheiro de cenário, linha { "8" })

# text
seg-7f8667e8d8fe = A codificação e modulação adaptativas DVB-S2 ao longo de uma passagem de descida LEO são MODELLED, não validadas: verificadas face à sua própria identidade analítica / de forma fechada — apanha erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
seg-72fd0321e4af = Página do tema: <a1>CONTACT-SCHEDULING.md</a1>

# text
seg-1f67ae89028b = <s1>Seguinte</s1>aocs
