# docs--kind-lunar-vlbi: translations (pt-PT)

# text
seg-c1ce24cd6008 = analítico

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Tipo de cenário do motor v{ $version }, família <a1>Lunar e cislunar</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-1c1eeb2dcaa0 = Página da família: <a1>Lunar e cislunar</a1>

# text
seg-df90e5910fb4 = h

# text
seg-3843825d0733 = us

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Derivadas parciais do atraso acumuladas ao longo de um calendário de linhas de base × épocas numa matriz de informação de Fisher, invertida para a covariância das coordenadas das estações e o sigma da estação por coordenada, substituindo uma ligação de equipartição isotrópica assumida a partir de

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Uma terceira escolha de datum, <c1/>, que mantém todas as estações terrestres e estima apenas as coordenadas da BALIZA fixas à Lua — a configuração para a qual a incerteza de um ponto da superfície lunar é efetivamente indicada, uma vez que as coordenadas das estações terrestres

# text
# c1: docs/kinds/by-kind/lunar-vlbi.md
seg-afeb6e26c5ad = Fonte: <c1/>

# text
# c1: lunar-vlbi
seg-6d1a32afd780 = <c1/> (tipo de cenário)

# text
seg-e01f77d493a0 = Observável modelado do atraso VLBI geodésico lunar: uma linha de base terrestre (duas estações em terra, GCRS) observa um sinal unidirecional de uma baliza da superfície lunar da classe NovaMoon. Emite o atraso de campo próximo por diferença de duas distâncias, a sua taxa e a correção de campo próximo por curvatura da frente de onda ao longo de uma passagem — verificada de forma cruzada face ao observável Δ-DOR de onda plana da mesma base de código no limite de campo distante, com derivadas parciais verificadas por diferenças finitas. O percurso analítico predefinido é MODELLED e traz as ressalvas de consistência de referencial, de movimento polar xp=yp={ "0" } e de onda plana versus campo próximo. Definir planetary_kernel_path, earth_orientation_kernel_path e moon_orientation_kernel_path executa em vez disso o percurso por núcleos (DE440, MOON_PA_DE440, ITRF93; tempos de luz baricêntricos convergidos; acrescenta as derivadas parciais da baliza e da estação da época), cujo atraso newtoniano e cujas derivadas parciais concordam com os tempos de luz convergidos do NAIF SPICE até { "0.06" } ps e { "7.4e-9" }. Não validado face a dados VLBI reais.

# text
# c1: scenarios/lunar-vlbi.toml
seg-92227c085867 = Uma execução de <c1/> resume-se assim: lunar-vlbi | linha de base de { "10727" } km | distância da baliza de { "402900" } km | atraso -10049.126 µs (taxa { "1.312e-6" } s/s) | campo próximo { "58.9" } µs | { "13" } amostras ao longo de { "6.0" } h

# text
# c1: station1_lat_deg
# c2: station1_lon_deg
# c3: station1_alt_m
# c4: station2_lat_deg
# c5: station2_lon_deg
# c6: station2_alt_m
# c7: beacon_lat_deg
# c8: beacon_lon_deg
# c9: beacon_alt_m
# c10: epoch_year
# c11: epoch_month
# c12: epoch_day
# c13: horizon_hours
# c14: step_min
# c15: planetary_kernel_path
# c16: earth_orientation_kernel_path
# c17: moon_orientation_kernel_path
seg-1a38a07a0d70 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

# text
# c1: scenarios/lunar-vlbi.toml
seg-11450a55fc9d = O exemplo <c1/> define, entre outros:

# attr:alt
seg-07d97fc1abac = O gráfico que o motor escreve para scenarios/lunar-vlbi.toml, tipo de cenário lunar-vlbi

# text
seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: as linhas da <a1>matriz de verificação</a1> que mencionam este tipo de cenário.

# text
seg-61f431e422e5 = <b>MODELLED</b> Atraso VLBI de campo próximo para uma linha de base terrestre que observa uma baliza lunar + derivadas parciais

# text
seg-7342b50d34e4 = <b>VALIDATED</b> Atraso VLBI de campo próximo para uma linha de base terrestre que observa uma baliza lunar, com derivadas parciais da baliza e da estação, no percurso por núcleos (lunar_vlbi::KernelGeometry): Terra e Lua do DE440, eixos principais lunares do DE440, orientação da Terra ITRF93 com UT1 e Ensaios: <a1>naif_kernel_reader_check.rs</a1>.

# text
seg-5547f1f662d3 = e mais { "2" } na matriz.

# text
seg-1461c84350d8 = <b>MODELLED</b> Atraso VLBI de campo próximo para uma linha de base terrestre que observa uma baliza lunar + derivadas parciais. Referência independente (ReferenceImpl): Delta_dor de onda plana (da mesma base de código) no limite de campo distante; derivadas parciais por diferenças finitas. { "0.30" } comparação externa, uma constatação (continua a ser MODELLED): face aos tempos de luz convergidos do ANISE { "0.10" } através do DE440 ({ "75" } atrasos em 2024-01-01 sobre três linhas de base da DSN, gerados por xval/anise-lunar-od sem código do Kshana), nenhum atraso está dentro da tolerância de { "1" } ps. A maior diferença é de { "24" } µs, devida ao centro analítico da Lua (cerca de { "200" } km do DE

# text
# c1: kshana kinds --json
seg-b41c162b015f = O percurso analítico predefinido é MODELLED e traz as ressalvas de consistência de referencial, de movimento polar xp=yp={ "0" } e de onda plana versus campo próximo. (catálogo de tipos de cenário (<c1/>))

# text
seg-0beac99bb095 = Honestidade: MODELLED, NÃO validado face a dados VLBI reais. O movimento polar é desprezado (xp = yp = { "0" }), pelo que as posições inerciais das estações trazem um erro de referencial de alguns metros; a baliza mistura uma série da Lua com equador médio da data com um desvio fixo ao corpo no ICRF (jd_tdb ~ jd_tt), uma discordância de consistência de referencial abaixo da fidelidade do modelo; sem iteração do tempo de luz, meios nem aberração para além do termo de Shapiro diferenciado. Sem TRL, herança de voo nem aval de ag (comentário do ficheiro de cenário, linhas { "17" } a { "21" })

# text
seg-58b64e5ff3db = O VLBI geodésico lunar é MODELLED, não validado: verificado face a uma implementação separada nesta mesma base de código — independente da unidade em teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-04089c4d6fbe = <s1>Anterior</s1>lunar-vlbi-fim

# text
seg-6adcdfbaa8be = <s1>Seguinte</s1>mars-pnt
