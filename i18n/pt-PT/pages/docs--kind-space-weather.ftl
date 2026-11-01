# docs--kind-space-weather: translations (pt-PT)

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Tipo de cenário do motor v{ $version }, família <a1>Medições GNSS, posicionamento e integridade</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-f6b7ca020692 = Página da família: <a1>Medições GNSS, posicionamento e integridade</a1>

# text
# c1: docs/kinds/by-kind/space-weather.md
seg-95f8bd8e0078 = Fonte: <c1/>

# text
# c1: space-weather
seg-24c21b5b0cc3 = <c1/> (tipo de cenário)

# text
seg-5f25c5b71f0c = Modelo do ambiente de meteorologia espacial: índices de atividade solar (F10.7/F10.7a) e geomagnética (Kp, com a tabela definicional Kp↔ap), a temperatura exosférica de Jacchia-1971 que estes determinam (validada face aos mínimo/média/máximo solares publicados), e a densidade neutra termosférica de Jacchia-1971 à temperatura exosférica média diurna face ao perfil estático sem atividade a um conjunto de altitudes — a dependência da densidade relativamente ao ciclo solar que a atmosfera estática omite. MODELLED: a densidade concorda com as densidades derivadas de acelerómetros (TOLEOS CHAMP e GRACE) dentro de um fator { "2" } no máximo solar, mas é cerca de 1.7x demasiado densa no mínimo solar de { "2008" }.

# text
# c1: scenarios/space-weather.toml
seg-f2c2860db799 = Uma execução de <c1/> resume-se assim: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; densidade x1.49 a { "300" } km (MODELLED)

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6bb05c41eba2 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-weather.toml
seg-c367f1aacd0b = O exemplo <c1/> define, entre outros:

# text
seg-02dc0d42fb21 = sfu

# text
seg-1dd966268e12 = { "2" } nT

# text
seg-d245f215f331 = Etiqueta de resultado (a do motor): MODELLED — índices solares/geomagnéticos, temperatura exosférica de Jacchia-71 e densidade estática de Jacchia-71 à temperatura média diurna

# attr:alt
seg-c1c6f2f73fb5 = O gráfico que o motor escreve para scenarios/space-weather.toml, tipo space-weather

# text
seg-15587da59e8e = <b>MODELLED</b> Índices solares/geomagnéticos (tabela definicional Kp↔ap), a temperatura exosférica de Jacchia-1971 e a densidade termosférica de Jacchia { "1971" } (SAO Special Report { "332" }: perfis estáticos de difusão que reproduzem a sua Tabela { "7" }, com o diurno, geomagné

# text
seg-f8eef6eabfb2 = <b>MODELLED</b> Índices solares/geomagnéticos (tabela definicional Kp↔ap), a temperatura exosférica de Jacchia-1971 e a densidade termosférica de Jacchia { "1971" } (SAO Special Report { "33" }. Referência independente (ExternalDataset): tabela definicional Kp↔ap + forma fechada da temperatura exosférica de Jacchia-1971 (coincidente a <{ "1" } K com as âncoras publicadas, tests/space_weather_reference.rs); a densidade é caracterizada face ao pymsis NRLMSISE-00 (um modelo NRL independente): a oscilação do ciclo solar a { "800" } km é 10.4x face a NRLMSISE-00 13.6x. Revisão { "0.30" }: o fator de atividade calibrado de primeira ordem foi substituído por Jacchia { "1971" } (densidade do cenário predefinido a { "40" }

# text
# c1: label
seg-72979b637644 = MODELLED — índices solares/geomagnéticos, temperatura exosférica de Jacchia-71 e densidade estática de Jacchia-71 à temperatura média diurna (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-0306ee022298 = MODELLED: a densidade concorda com as densidades derivadas de acelerómetros (TOLEOS CHAMP e GRACE) dentro de um fator { "2" } no máximo solar, mas é cerca de 1.7x demasiado densa no mínimo solar de { "2008" }. (catálogo de tipos (<c1/>))

# text
seg-b86a312077b5 = ÂMBITO HONESTO: MODELLED. A conversão Kp<->ap é a tabela definicional da IAGA e a temperatura exosférica é validada face às magnitudes publicadas de mínimo/média/máximo solar, mas a correção da densidade é um acoplamento de altura de escala DE PRIMEIRA ORDEM CALIBRADO — capta o sinal, a monotonia e a ordem de grandeza corretos, NÃO a exatidão absoluta de uma atmosfera validada com dados (NRLMSISE-00). Executar: kshana scenarios/space-weath (comentário do ficheiro de cenário, linhas { "10" } a { "15" })

# text
seg-10cf16c12a2a = O ambiente de meteorologia espacial e a densidade termosférica determinada pela atividade são MODELLED, não validados: uma subalegação é verificada externamente, mas a capacidade no seu todo compõe peças modeladas, pelo que a capacidade continua modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-3dd29f8fba14 = <s1>Anterior</s1>space-packet

# text
seg-ff9d9a41692b = <s1>Seguinte</s1>spectrum
