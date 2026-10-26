# docs--agency-orbit-validation: translations (pt-PT)

# text
seg-31d58f23c0a2 = Executar

# text
# c1: docs/AGENCY-ORBIT-VALIDATION.md
seg-fbe4b3eb7310 = Fonte: <c1/>

# text
seg-87910a33b87b = Validação do modelo de forças por ajuste de efemérides — metodologia e resíduos validados

# text
# c1: src/precise_od.rs
seg-09a1b1b673fb = O motor de forças completo do Kshana (<c1/>) ajustado a <b>produtos reais de órbita precisa de agências</b>, com resíduos honestos, citáveis e carimbados com o hash do commit. Este é o registo de validação do marco P4 do roteiro ("Astrodinâmica precisa: gravidade de ordem elevada, SRP (pressão da radiação solar), validação face a conjuntos de dados de agências").

# text
seg-90f366667f78 = O que significa aqui um resíduo validado

# text
# c1: docs/design/2026-06-09-precise-astrodynamics-design.md
seg-3861b68a03e2 = Um resíduo só é reportado quando se verifica tudo o que se segue (projeto <c1/>):

# text
# c1: src/tides.rs
# c2: C_R
# c3: src/forces.rs
seg-954f4f934461 = O <b>modelo de forças</b> inclui todas as perturbações que importam à exatidão pretendida: geopotencial de grau elevado EGM2008 (Earth Gravitational Model { "2008" }) (truncado num grau/ordem declarado, d/o), <b>marés</b> sólidas + oceânicas + atmosféricas (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } cap. { "6" }), terceiro corpo Sol/Lua, SRP de bala de canhão com sombra cónica + <c2/> estimado, arrasto (apenas LEO (órbita terrestre baixa)), termos de relatividade geral (GR) de Schwarzschild + Lense–Thirring (<c3/>).

# text
# c1: 1/σ²
seg-710f89c088cc = O <b>estimador</b> é um verdadeiro ajuste de mínimos quadrados em lote de Gauss–Newton com uma <b>matriz de transição de estado</b> variacional (verificada por comparação com a diferença finita sobre o arco inteiro até < { "1e-6" }), ponderação das observações por <c1/> e edição de valores atípicos a n sigma.

# text
# c1: src/eop.rs
# c2: src/cio.rs
# c3: timescales::gps_to_tt
seg-dd5dcc66ed22 = <b>Referenciais/tempo</b> usam <b>parâmetros reais de orientação da Terra (EOP) IERS finals2000A</b> (UT1 (Universal Time { "1" }, tempo de rotação da Terra)−UTC (Tempo Universal Coordenado), movimento polar; <c1/>) através da cadeia CIO (Celestial Intermediate Origin) IAU (International Astronomical Union) 2006/2000A validada (<c2/>). Tempo GPS (Global Positioning System) do SP3 (Standard Product { "3" }, o formato de órbita precisa) → TT (Terrestrial Time) através do desvio fixo de { "51.184" } s (<c3/>).

# text
seg-665bb53b81fb = Os <b>resíduos</b> são reportados em <b>RTN</b> (radial/ao longo da trajetória/transversal) e em 3-D, <b>com e sem</b> acelerações empíricas, junto com a sobreposição bruta (sem ajuste).

# text
seg-fea4515ba842 = Cada número é <b>reproduzível</b> (gate de CI (integração contínua) com dados abertos) e <b>citável</b> (hash do commit + referência do conjunto de dados + SHA-256 do ficheiro de teste (SHA: Secure Hash Algorithm)).

# text
seg-fa98a174e799 = Método, por conjunto de dados

# text
seg-a98b098e815a = Analisar a órbita precisa SP3; para o satélite escolhido, tomar cada posição ITRF (International Terrestrial Reference Frame).

# text
# c1: (UT1, xₚ, yₚ)
seg-a25f69a48b5a = Converter a época GPS do SP3 → TT; resolver <c1/> a partir de finals2000A nessa época.

# text
seg-e5338b713d88 = Rodar cada posição ITRF para GCRS (Geocentric Celestial Reference System) através da cadeia CIO com esses EOP — as observações de posição inerciais. A dinâmica usa os <em>mesmos</em> EOP para a rotação do geopotencial fixa à Terra, pelo que observações e forças partilham um único referencial.

# text
# c1: [r, v, C_R]
seg-ce987e4dda40 = Inicializar o estado da época (posição = primeira posição; velocidade = diferença finita de 2.ª ordem) e ajustar em lote <c1/> (nível { "1" }), depois ainda as { "9" } acelerações empíricas de ciclo por revolução (CPR) RTN (nível { "2" }, com restrição a priori).

# text
seg-22f839d05292 = Reportar o RMS (raiz do valor quadrático médio) RTN + 3-D pós-ajuste para ambos os níveis e a sobreposição bruta.

# text
seg-64e2c3662a27 = Órbita terrestre média Galileo — <b>GREEN</b> (limiar < { "5" } m)

# text
# c1: ESA0MGNFIN
seg-e77e8e35ba80 = <b>Conjunto de dados:</b> órbita multi-GNSS (GNSS: sistema global de navegação por satélite) final da ESA/ESOC (ESA: Agência Espacial Europeia; ESOC: Centro Europeu de Operações Espaciais) <c1/>, ITRF, amostragem de 5 min, satélite <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), MEO (órbita terrestre média) nominal), 2022-01-01.

# text
# c1: navigation-office.esa.int/products/gnss-products/2190/
# c2: datacenter.iers.org/data/9/finals2000A.all
seg-f90d848e7a46 = <b>Fonte aberta (sem início de sessão):</b> réplica do ESA Navigation Office, <c1/>. EOP: IERS <c2/>.

# text
seg-ec7195b80bad = Commit de validação:

# text
# c1: e7297f4c…d3a24a3
# c2: 6b781d36…cb2ed00f
# c3: tests/fixtures/agency/NOTICE.md
seg-c2ad9f9cc050 = <b>Ficheiros de teste (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

# text
seg-de3df1639939 = Arco

# text
seg-7db37f753fc1 = RMS 3-D

# text
seg-d39e59df38c0 = RTN (R, T, N)

# text
seg-5ad814c7ef9e = Notas

# text
# c1: C_R
seg-bced8a114852 = Ficheiro de teste de CI, nível { "1" } (forças + <c1/>)

# text
seg-f040df9ee966 = { "8" } h

# text
seg-459900054e0e = { "0.133" } m

# text
seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

# text
seg-d15ea658058b = sobreposição bruta { "78.7" } km

# text
seg-1ce1bc363541 = Ficheiro de teste de CI, nível { "2" } (+ CPR empírico)

# text
seg-461105b5c2f3 = { "0.070" } m

# text
seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

# text
seg-224a7fc75354 = reduz o resíduo para metade

# text
seg-1b422bc76914 = Execução de arco completo, nível { "1" } (pré-correção†)

# text
seg-f57ee3b36d92 = { "24" } h

# text
seg-5fee750a5e30 = { "0.611" } m

# text
seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

# text
# c1: xval/s2-air-tide-fix/
# c2: workflow_dispatch
seg-95879df86618 = Os números do ficheiro de teste de CI acima foram regravados na { "0.36" } após a correção S2 da maré atmosférica (<c1/>): o nível { "1" } do Galileo passou de { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), as componentes N do Swarm-A em { "1" }–{ "2" } mm; os valores da execução de arco completo não foram executados de novo. † <b>Pré-correção:</b> o valor da execução de arco completo foi registado antes da correção S2 da maré atmosférica da { "0.36" } e não foi executado de novo com o código corrigido (os produtos de dia inteiro são obtidos pelo fluxo de trabalho de dispatch, não estando disponíveis na sessão que fez a correção). Nos ficheiros de teste de CI, a correção moveu o RMS 3-D do Galileo em menos de { "1" } mm e as componentes do Swarm-A em { "1" }–{ "2" } mm, pelo que se espera uma alteração da mesma ordem; a próxima execução de <c2/> volta a registá-la.

# text
seg-5141c1811e35 = O campo MEO está convergido em gravidade a partir do grau { "8" } (o resultado de nível 1 de { "8" } h é idêntico, ao milímetro, em d/o { "8" }, { "10" } e { "12" }), pelo que o truncamento em d/o-12 do ficheiro de teste de CI é desprezável; a tarefa de dispatch executa o d/o-70 completo. O ajuste de { "8" } h atinge <b>{ "13" } cm</b> com forças puras e <b>{ "7" } cm</b> com o nível empírico; o arco completo de { "24" } h (mais esforço de SRP/eclipse, intervalo dinâmico mais longo) é de <b>{ "61" } cm</b> — tudo muito abaixo do limiar de { "5" } m.

# text
seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (limiar < { "5" } m)

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: RDOD_AR
# c3: L47
seg-cba2e4a9b9b1 = <b>Conjunto de dados:</b> órbita científica precisa de dinâmica reduzida de nível 2 da ESA Swarm <c1/> (<c2/>, derivada de GPS, ITRF / IGb14, ~{ "2" } cm, processamento da Delft University of Technology), satélite <b>Swarm-A</b> (id SP3 <c3/>, LEO a ~{ "430" } km), 2022-01-01.

# text
# c1: https://swarm-diss.eo.esa.int/
# c2: Level2daily/Latest_baselines/POD/RD/Sat_A/
# c3: finals2000A
seg-f66ad1515550 = <b>Fonte aberta (sem início de sessão):</b> servidor de disseminação da ESA Swarm <c1/> → <c2/> (aberto ao abrigo da política de dados da ESA). EOP: a mesma série IERS <c3/> 2022-001.

# text
# c1: 6cd84b78…acb733e
# c2: tests/fixtures/agency/NOTICE.md
seg-4de8b64c0bf0 = <b>Ficheiro de teste (SHA-256):</b> SP3 <c1/> (<c2/>).

# text
# c1: C_R
seg-b46c7e1d476d = Um arco LEO acrescenta <b>arrasto atmosférico</b> ao modelo de forças. Como o modelo de densidade é exponencial por troços <em>estático</em>, a órbita é ajustada em dois níveis: um nível <b>dinâmico</b> (estimar apenas o estado da época; <c1/> mantido em { "1" }, porque em LEO o arrasto domina e a SRP é mal separável num arco curto) e um nível <b>de dinâmica reduzida</b> que acrescenta as acelerações empíricas de ciclo por revolução que absorvem o arrasto não modelado — a órbita LEO operacionalmente significativa.

# text
# c1: C_R
seg-dac35ad223dd = Ficheiro de teste de CI, dinâmico (<c1/>={ "1" })

# text
seg-0652aa62d459 = { "3" } h

# text
seg-cc0a14ba2b40 = { "2.687" } m

# text
seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

# text
seg-555712268929 = resíduo ≈ puramente ao longo da trajetória (arrasto)

# text
seg-4f8e7956aa78 = Ficheiro de teste de CI, dinâmica reduzida (+empírico)

# text
seg-aa5f651bcfab = { "0.098" } m

# text
seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

# text
seg-82a3e25da2bf = o empírico absorve o arrasto

# text
# c1: swarm_full_arc_dispatch
# c2: KSHANA_SWARM_SP3
seg-ff834d33ae70 = O ajuste dinâmico satisfaz o limiar de { "5" } m com o resíduo quase inteiramente ao longo da trajetória — a assinatura clássica do arrasto a ~{ "430" } km. O nível empírico absorve esse erro ao longo da trajetória ({ "2.52" } → { "0.09" } m), dando um ajuste de dinâmica reduzida de <b>~{ "10" } cm</b> face à órbita própria da ESA de ~{ "2" } cm. A execução de dia inteiro e grau completo é o <c1/> ignorado (o servidor de disseminação serve o produto através da sua sessão de navegação de ficheiros, pelo que o fundador descarrega o SP3 do dia e aponta <c2/> para ele). O NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended, modelo de atmosfera) com fatores de meteorologia espacial é a melhoria prevista que apertaria ainda mais o nível <em>dinâmico</em>.

# text
seg-e8f5c385de62 = LRO lunar — validado, <b>acima</b> do limiar de { "5" } m (honesto) (P4 W4b)

# text
seg-8a22ef5d3765 = <b>Conjunto de dados:</b> a trajetória reconstruída real da <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) da NASA/JPL (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory), obtida do JPL Horizons, vetores de estado geométricos centrados na Lua no ICRF (International Celestial Reference Frame), 2022-01-01, ~{ "98" } km de altitude, amostragem de 1 minuto ({ "241" } épocas, { "4" } h, ~{ "2" } revoluções). Usar vetores de texto do Horizons não exige <b>nenhum leitor de SPK/SPICE (SPK: núcleo de efemérides planetárias; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

# text
seg-2bcf078de340 = <b>Gravidade:</b> o campo <b>GRGM660PRIM</b> da GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, grau { "660" }), truncado em d/o { "150" } e ajustado em d/o { "100" }, avaliado no referencial lunar de <b>eixos principais</b> fixo ao corpo.

# text
# c1: ssd.jpl.nasa.gov/api/horizons.api
# c2: icgem.gfz-potsdam.de
seg-1454f78e9ca4 = <b>Fonte aberta (sem início de sessão):</b> API (interface de programação de aplicações) do Horizons <c1/>; gravidade através do ICGEM (International Centre for Global Earth Models) <c2/>.

# text
# c1: 574e3518…d100f0
# c2: 0ff04184…f029977ae
# c3: tests/fixtures/agency/NOTICE.md
seg-306ffeb843a9 = <b>Ficheiros de teste (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: precise_od::ForceModel
seg-65ff0c37dd74 = Esta é uma dinâmica <b>centrada na Lua</b> — um modelo de forças distinto (<c1/>): o campo GRGM no referencial lunar fixo ao corpo (a orientação média Terra IAU { "2015" } <c2/> composta com o desvio fixo DE421 (Development Ephemeris { "421" }) média Terra → eixos principais (ME→PA)), mais a Terra (a perturbação dominante de uma órbita lunar) e o Sol como terceiros corpos, ajustada através do <em>mesmo</em> estimador genérico de Gauss–Newton preciso que os conjuntos de dados da Terra usam (o trait <c3/>).

# text
seg-68f1894a1fa5 = Ficheiro de teste de CI, dinâmico (apenas estado)

# text
seg-0f055118d77a = { "4" } h

# text
seg-c94fc5bf792b = { "12.05" } m

# text
seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

# text
seg-af395226ca52 = sobreposição bruta { "39.9" } m

# text
seg-2923b4d58878 = Ficheiro de teste de CI, dinâmica reduzida (+empírico { "1" }+2/rev)

# text
seg-19167d54b4ad = { "6.67" } m

# text
seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

# text
seg-706a4d52f6c5 = os empíricos de 1 e 2 por revolução absorvem o erro ao longo da trajetória

# text
# c1: pxform('MOON_ME','MOON_PA')
# c2: tests/lunar_me_pa_offset_spice_oracle.rs
# c3: docs/design/evidence/fut05b-me-pa-offset-sign/
seg-3f33d99fd643 = Correção da { "0.36" }: até à { "0.36" }, o desvio ME→PA da DE421 era aplicado no sentido errado (e com a ordem de Euler errada), o que colocava o referencial PA analítico a cerca de { "208" }″ do PA em vez de sobre ele. Agora é transcrito como o SPICE o define (verificado face a <c1/> até { "2.6e-16" } rad, <c2/>; <c3/>). Os valores acima são posteriores à correção; antes dela eram { "53.8" } m brutos, <b>{ "12.6" } m</b> dinâmico ({ "3.07" }, { "10.19" }, { "6.81" } m) e <b>{ "6.65" } m</b> de dinâmica reduzida ({ "3.49" }, { "4.56" }, { "3.35" } m).

# text
seg-925d1445fccb = Estes resíduos estão <b>acima</b> do limiar de { "5" } m que o Galileo ({ "0.13" } m) e o Swarm-A ({ "0.10" } m) satisfazem, e são reportados com honestidade.

# text
seg-c414e14eaaea = O que realmente fixa o piso — uma validação cruzada de nível DE (e uma correção)

# text
# c1: MOON_PA
# c2: xval/anise-lunar-od
# c3: moon_pa_de440_200625.bpc
# c4: de440s.bsp
# c5: ae96a29
# c6: c1c7fee…
# c7: 60cd55a…
seg-72b06bac7f6b = Formulámos a hipótese de que o fator limitante era a fidelidade da <b>orientação lunar e das efemérides analíticas</b> (a série de libração da IAU, exata a dezenas de segundos de arco face ao <c1/> integrado numericamente do JPL DE (Development Ephemeris), e as efemérides da Terra/Sol de Montenbruck–Gill, ~{ "0.3" }° face a um núcleo DE/SPICE). Para testar isso diretamente, a crate de validação cruzada <c2/>, excluída do espaço de trabalho, troca <b>apenas</b> essas duas entradas por entradas de <b>nível DE</b> — a orientação lunar de eixos principais DE440 (Development Ephemeris { "440" }) (<c3/>) e as efemérides DE440 (<c4/>), lidas através do ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — um leitor de núcleos SPICE em Rust puro) — e volta a executar o <em>mesmo</em> estimador (commit <c5/>, SHA-256 dos núcleos <c6/> / <c7/>):

# text
seg-3a0e724a8a2b = Nível

# text
seg-c1ce24cd6008 = analítico

# text
seg-7d04fb530a3a = sobreposição bruta

# text
seg-d9ce88edb49e = { "53.8" } m

# text
seg-55dc7c7d84f0 = { "41.5" } m

# text
seg-7def7880e134 = dinâmico

# text
seg-83e37e5e9b3e = { "12.6" } m

# text
seg-c421a0a20278 = { "12.0" } m

# text
seg-f70309824f25 = dinâmica reduzida ({ "1" }+2/rev)

# text
seg-b8ada0c5fab3 = { "6.65" } m

# text
seg-b6d3daff2f23 = <b>Nota da { "0.36" }: a maior parte do ganho do nível dinâmico abaixo deveu-se ao erro do desvio, não às entradas de nível DE.</b> Com o desvio ME→PA corrigido, a pilha analítica dá { "39.9" } m brutos, { "12.05" } m dinâmico e { "6.67" } m de dinâmica reduzida, face aos { "41.5" }, { "12.0" } e { "6.67" } m de nível DE: os ajustes analítico e de nível DE concordam agora em todos os níveis. Segue-se a leitura da { "0.30" } sobre a tabela abaixo, mantida tal como foi escrita.

# text
# c1: atol
seg-691df96321d8 = <b>A hipótese está apenas meio certa, e a afirmação principal precisava de correção.</b> A orientação e as efemérides de nível DE <em>melhoram</em> a sobreposição bruta ({ "53.8" } → { "41.5" } m) e o ajuste <b>dinâmico</b> ({ "12.6" } → { "12.0" } m) — pelo que o erro analítico de orientação/efemérides é real e limita esses níveis. Mas deixam o resíduo de <b>dinâmica reduzida</b> essencialmente <b>inalterado</b> ({ "6.65" } → { "6.67" } m): o nível empírico de { "1" }+2 por revolução <em>já</em> absorvia o erro de orientação/efemérides, pelo que o piso operacional de ~{ "6.6" } m é fixado por outra coisa — um resíduo que a base de ciclo por revolução não consegue absorver e que os referenciais de nível DE não removem. A explicação mais coerente é a <b>dinâmica não gravitacional da LRO não modelada</b> (reirradiação térmica, desgaseificação) ao longo do arco curto de { "4" } h; o grau do campo está excluído (idêntico em d/o { "100" } e { "150" }) e a tolerância do integrador está excluída (idêntica com <c1/> { "1e-6" } e { "1e-9" }). O corolário construtivo: <b>a pilha lunar analítica, enxuta e sem núcleos do Kshana já iguala a fidelidade de nível DE para a órbita lunar de dinâmica reduzida (operacional)</b> — a predefinição de coeficientes puros não deixa nada por aproveitar aí. Passar os { "5" } m exigiria modelar as forças não gravitacionais da LRO (um modelo de caixa-asa/térmico específico da nave e um ajuste multiarco mais longo), não melhores referenciais.

# text
seg-4211fbd25380 = Contrato de honestidade

# text
seg-f3b0a26ff5b3 = O limiar "verde" de < { "5" } m é atingido para o <b>Galileo MEO</b> ({ "0.13" } m dinâmico) e o <b>Swarm-A LEO</b> ({ "2.69" } m dinâmico / { "0.10" } m de dinâmica reduzida). <b>A LRO lunar é publicada tal como está, com { "12.05" } m dinâmico / { "6.67" } m de dinâmica reduzida (empírico de { "1" }+2 por revolução) — acima do limiar</b> ({ "0.36" }, após a correção do desvio ME→PA; { "12.6" } / { "6.65" } m antes dela). Uma validação cruzada de nível DE (acima) <b>testou e corrigiu</b> a afirmação do fator limitante: o piso de dinâmica reduzida <b>não</b> é a orientação/efemérides analíticas (os núcleos DE440 deixam-no inalterado em { "6.67" } m), pelo que não se resolve com melhores referenciais mas com a modelação da dinâmica não gravitacional da LRO — o caminho honesto e atualizado até ao nível do metro.

# text
seg-559a269152ae = Em LEO, os níveis <b>dinâmico</b> (apenas estado, densidade estática) e <b>de dinâmica reduzida</b> (com acelerações empíricas) são sempre reportados <b>em separado</b>, para que o leitor veja o que os termos empíricos absorvem; o nível de dinâmica reduzida é a órbita operacional. A mesma separação vale para os níveis empírico/de forças puras em MEO.

# text
seg-d20c7ef90250 = Cada resíduo leva acima o seu hash de commit, a referência do conjunto de dados e a soma de verificação do ficheiro de teste.

# text
seg-733d96129fca = <b>Conjuntos de dados validados face à referência real das agências: { "3" } de { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO lunar). <b>Atingem o limiar < { "5" } m: { "2" } de { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO a { "6.67" } m, honestamente acima dele).

# text
seg-d7c77076c9c6 = <s1>Anterior</s1>Validação do SGP4

# text
seg-d661003da754 = <s1>Seguinte</s1>Sistema solar e outros corpos

# text
seg-36a3b8105d4b = Órbita terrestre média Galileo — GREEN (limiar < { "5" } m)

# text
seg-b6f96cf0d55a = Swarm-A LEO — GREEN (limiar < { "5" } m)

# text
seg-9e739bda7f20 = LRO lunar — validado, acima do limiar de { "5" } m (honesto) (P4 W4b)
