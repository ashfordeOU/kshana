# docs--agency-orbit-validation: translations (pt-BR)

# text
seg-31d58f23c0a2 = Executar

# text
# c1: docs/AGENCY-ORBIT-VALIDATION.md
seg-fbe4b3eb7310 = Fonte: <c1/>

# text
seg-87910a33b87b = Validação do modelo de forças por ajuste de efemérides — metodologia e resíduos validados

# text
# c1: src/precise_od.rs
seg-09a1b1b673fb = O motor de forças completas do Kshana (<c1/>) ajustado a <b>produtos reais de órbita precisa de agências</b>, com resíduos honestos, citáveis e marcados com o hash do commit. Este é o registro de validação do marco P4 do roteiro ("Astrodinâmica precisa: gravidade de alta ordem, SRP (pressão de radiação solar), validação contra conjuntos de dados de agências").

# text
seg-90f366667f78 = O que significa aqui um resíduo validado

# text
# c1: docs/design/2026-06-09-precise-astrodynamics-design.md
seg-3861b68a03e2 = Um resíduo só é informado quando todas as condições a seguir se verificam (design <c1/>):

# text
# c1: src/tides.rs
# c2: C_R
# c3: src/forces.rs
seg-954f4f934461 = O <b>modelo de forças</b> inclui toda perturbação que importa na exatidão-alvo: geopotencial de alto grau EGM2008 (Earth Gravitational Model { "2008" }) (truncado em um grau/ordem declarado, d/o), <b>marés</b> sólidas + oceânicas + atmosféricas (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } cap. { "6" }), terceiro corpo Sol/Lua, SRP de bala de canhão com sombra cônica + <c2/> estimado, arrasto (somente LEO (órbita baixa da Terra)), termos de relatividade geral (GR) de Schwarzschild + Lense–Thirring (<c3/>).

# text
# c1: 1/σ²
seg-710f89c088cc = O <b>estimador</b> é um verdadeiro lote de mínimos quadrados de Gauss–Newton com uma <b>matriz de transição de estado</b> variacional (conferida contra a diferença finita de arco inteiro até < { "1e-6" }), ponderação de observações <c1/> e edição de outliers por n-sigma.

# text
# c1: src/eop.rs
# c2: src/cio.rs
# c3: timescales::gps_to_tt
seg-dd5dcc66ed22 = <b>Referenciais/tempo</b> usam <b>parâmetros reais de orientação da Terra (EOP) finals2000A do IERS</b> (UT1 (Tempo Universal { "1" }, tempo de rotação da Terra)−UTC (Tempo Universal Coordenado), movimento polar; <c1/>) por meio da cadeia IAU (International Astronomical Union) 2006/2000A CIO (Celestial Intermediate Origin) validada (<c2/>). Tempo GPS (Global Positioning System) do SP3 (Standard Product { "3" }, o formato de órbita precisa) → TT (Tempo Terrestre) pelo deslocamento fixo de { "51.184" } s (<c3/>).

# text
seg-665bb53b81fb = Os <b>resíduos</b> são informados em <b>RTN</b> (radial/ao longo da trajetória/transversal) e em 3-D, <b>com e sem</b> acelerações empíricas, junto com a sobreposição bruta (sem ajuste).

# text
seg-fea4515ba842 = Todo número é <b>reprodutível</b> (portão de CI (integração contínua) com dados abertos) e <b>citável</b> (hash do commit + referência do conjunto de dados + SHA-256 da fixture (SHA: Secure Hash Algorithm)).

# text
seg-fa98a174e799 = Método, por conjunto de dados

# text
seg-a98b098e815a = Analisar a órbita precisa SP3; para o satélite escolhido, tomar cada posição fixada em ITRF (International Terrestrial Reference Frame).

# text
# c1: (UT1, xₚ, yₚ)
seg-a25f69a48b5a = Converter a época GPS do SP3 → TT; resolver <c1/> a partir do finals2000A nessa época.

# text
seg-e5338b713d88 = Girar cada posição ITRF para o GCRS (Geocentric Celestial Reference System) por meio da cadeia CIO com esses EOP — as observações de posição inercial. A dinâmica usa os <em>mesmos</em> EOP para a rotação terrestre fixa do geopotencial, de modo que observações e forças compartilham um só referencial.

# text
# c1: [r, v, C_R]
seg-ce987e4dda40 = Inicializar o estado da época (posição = primeira posição fixada; velocidade = diferença finita de 2ª ordem) e ajustar em lote <c1/> (Nível { "1" }), e depois também as { "9" } acelerações empíricas RTN de ciclo por revolução (CPR) (Nível { "2" }, restritas a priori).

# text
seg-22f839d05292 = Informar o RMS (raiz do valor quadrático médio) RTN + 3-D pós-ajuste para ambos os níveis e para a sobreposição bruta.

# text
seg-64e2c3662a27 = Órbita terrestre média Galileo — <b>GREEN</b> (limiar de < { "5" } m)

# text
# c1: ESA0MGNFIN
seg-e77e8e35ba80 = <b>Conjunto de dados:</b> órbita final multi-GNSS (GNSS: sistema global de navegação por satélite) da ESA/ESOC (ESA: Agência Espacial Europeia; ESOC: Centro Europeu de Operações Espaciais) <c1/>, ITRF, amostragem de 5 min, satélite <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), MEO nominal (órbita terrestre média)), 2022-01-01.

# text
# c1: navigation-office.esa.int/products/gnss-products/2190/
# c2: datacenter.iers.org/data/9/finals2000A.all
seg-f90d848e7a46 = <b>Fonte aberta (sem login):</b> espelho do ESA Navigation Office, <c1/>. EOP: <c2/> do IERS.

# text
seg-ec7195b80bad = Commit de validação:

# text
# c1: e7297f4c…d3a24a3
# c2: 6b781d36…cb2ed00f
# c3: tests/fixtures/agency/NOTICE.md
seg-c2ad9f9cc050 = <b>Fixtures (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

# text
seg-de3df1639939 = Arco

# text
seg-7db37f753fc1 = RMS 3-D

# text
seg-d39e59df38c0 = RTN (R, T, N)

# text
seg-5ad814c7ef9e = Observações

# text
# c1: C_R
seg-bced8a114852 = Fixture de CI, Nível { "1" } (força + <c1/>)

# text
seg-f040df9ee966 = { "8" } h

# text
seg-459900054e0e = { "0.133" } m

# text
seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

# text
seg-d15ea658058b = sobreposição bruta { "78.7" } km

# text
seg-1ce1bc363541 = Fixture de CI, Nível { "2" } (+ CPR empírico)

# text
seg-461105b5c2f3 = { "0.070" } m

# text
seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

# text
seg-224a7fc75354 = reduz o resíduo à metade

# text
seg-1b422bc76914 = Dispatch de arco completo, Nível { "1" } (antes da correção†)

# text
seg-f57ee3b36d92 = { "24" } h

# text
seg-5fee750a5e30 = { "0.611" } m

# text
seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

# text
# c1: xval/s2-air-tide-fix/
# c2: workflow_dispatch
seg-95879df86618 = Os números da fixture de CI acima foram registrados de novo na { "0.36" } após a correção da maré atmosférica S2 (<c1/>): o Nível { "1" } do Galileo passou de { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), os componentes N do Swarm-A em { "1" }–{ "2" } mm; os valores do dispatch de arco completo não foram executados de novo. † <b>Antes da correção:</b> o valor do dispatch de arco completo foi registrado antes da correção da maré atmosférica S2 da { "0.36" } e não foi executado de novo sobre o código corrigido (os produtos de dia inteiro são buscados pelo fluxo de dispatch, não estando disponíveis na sessão que fez a correção). Nas fixtures de CI, a correção moveu o RMS 3-D do Galileo em menos de { "1" } mm e os componentes do Swarm-A em { "1" }–{ "2" } mm, de modo que se espera uma mudança da mesma ordem; a próxima execução de <c2/> a registra de novo.

# text
seg-5141c1811e35 = O campo MEO converge em gravidade até o grau { "8" } (o resultado do Nível-1 de { "8" } h é idêntico em d/o { "8" }, { "10" } e { "12" } até o milímetro), de modo que o truncamento d/o-12 da fixture de CI é desprezível; o job de dispatch executa o d/o-70 completo. O ajuste de { "8" } h chega a <b>{ "13" } cm</b> em força pura e a <b>{ "7" } cm</b> com o nível empírico; o arco completo de { "24" } h (mais estresse de SRP/eclipse, intervalo dinâmico mais longo) chega a <b>{ "61" } cm</b> — todos bem dentro do limiar de { "5" } m.

# text
seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (limiar de < { "5" } m)

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: RDOD_AR
# c3: L47
seg-cba2e4a9b9b1 = <b>Conjunto de dados:</b> órbita científica precisa de dinâmica reduzida, Nível 2, do ESA Swarm, <c1/> (<c2/>, derivada de GPS, ITRF / IGb14, ~{ "2" } cm, processamento da Delft University of Technology), satélite <b>Swarm-A</b> (id SP3 <c3/>, LEO de ~{ "430" } km), 2022-01-01.

# text
# c1: https://swarm-diss.eo.esa.int/
# c2: Level2daily/Latest_baselines/POD/RD/Sat_A/
# c3: finals2000A
seg-f66ad1515550 = <b>Fonte aberta (sem login):</b> servidor de disseminação do ESA Swarm <c1/> → <c2/> (aberto sob a Política de Dados da ESA). EOP: a mesma série <c3/> 2022-001 do IERS.

# text
# c1: 6cd84b78…acb733e
# c2: tests/fixtures/agency/NOTICE.md
seg-4de8b64c0bf0 = <b>Fixture (SHA-256):</b> SP3 <c1/> (<c2/>).

# text
# c1: C_R
seg-b46c7e1d476d = Um arco LEO acrescenta <b>arrasto atmosférico</b> ao modelo de forças. Como o modelo de densidade é uma exponencial por partes <em>estática</em>, a órbita é ajustada em dois níveis: um nível <b>dinâmico</b> (estimar apenas o estado da época; <c1/> mantido em { "1" }, pois em LEO o arrasto domina e a SRP é mal separável em um arco curto) e um nível <b>de dinâmica reduzida</b> que acrescenta as acelerações empíricas de ciclo por revolução que carregam o arrasto não modelado — a órbita LEO operacionalmente significativa.

# text
# c1: C_R
seg-dac35ad223dd = Fixture de CI, dinâmico (<c1/>={ "1" })

# text
seg-0652aa62d459 = { "3" } h

# text
seg-cc0a14ba2b40 = { "2.687" } m

# text
seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

# text
seg-555712268929 = resíduo ≈ puramente ao longo da trajetória (arrasto)

# text
seg-4f8e7956aa78 = Fixture de CI, dinâmica reduzida (+empírico)

# text
seg-aa5f651bcfab = { "0.098" } m

# text
seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

# text
seg-82a3e25da2bf = o empírico absorve o arrasto

# text
# c1: swarm_full_arc_dispatch
# c2: KSHANA_SWARM_SP3
seg-ff834d33ae70 = O ajuste dinâmico passa no limiar de { "5" } m com o resíduo quase inteiramente ao longo da trajetória — a assinatura clássica do arrasto a ~{ "430" } km. O nível empírico absorve esse erro ao longo da trajetória ({ "2.52" } → { "0.09" } m), dando um ajuste de dinâmica reduzida de <b>~{ "10" } cm</b> contra a órbita própria da ESA de ~{ "2" } cm. A execução de dia inteiro e grau completo é o <c1/> ignorado (o servidor de disseminação serve o produto por meio de sua sessão de navegador de arquivos, de modo que o fundador baixa o SP3 do dia e aponta <c2/> para ele). O NRLMSISE-00 (NRLMSISE: modelo de atmosfera estendida do Naval Research Laboratory com espectrômetro de massa e radar de espalhamento incoerente) com forçantes de clima espacial é a atualização apontada que apertaria ainda mais o nível <em>dinâmico</em>.

# text
seg-e8f5c385de62 = LRO lunar — validado, <b>acima</b> do limiar de { "5" } m (declarado com honestidade) (P4 W4b)

# text
seg-8a22ef5d3765 = <b>Conjunto de dados:</b> a trajetória reconstruída real do <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) da NASA/JPL (NASA: Administração Nacional da Aeronáutica e Espaço; JPL: Jet Propulsion Laboratory) obtida do JPL Horizons, vetores de estado geométricos centrados na Lua no ICRF (International Celestial Reference Frame), 2022-01-01, altitude de ~{ "98" } km, amostragem de 1 minuto ({ "241" } épocas, { "4" } h, ~{ "2" } revoluções). Usar vetores de texto do Horizons <b>dispensa um leitor SPK/SPICE (SPK: kernel de efemérides planetárias; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

# text
seg-2bcf078de340 = <b>Gravidade:</b> o campo <b>GRGM660PRIM</b> do GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, grau { "660" }), truncado em d/o { "150" } e ajustado em d/o { "100" }, avaliado no referencial de <b>eixos principais</b> fixo ao corpo lunar.

# text
# c1: ssd.jpl.nasa.gov/api/horizons.api
# c2: icgem.gfz-potsdam.de
seg-1454f78e9ca4 = <b>Fonte aberta (sem login):</b> API (interface de programação de aplicações) do Horizons <c1/>; gravidade via ICGEM (International Centre for Global Earth Models) <c2/>.

# text
# c1: 574e3518…d100f0
# c2: 0ff04184…f029977ae
# c3: tests/fixtures/agency/NOTICE.md
seg-306ffeb843a9 = <b>Fixtures (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: precise_od::ForceModel
seg-65ff0c37dd74 = Esta é uma dinâmica <b>centrada na Lua</b> — um modelo de forças distinto (<c1/>): o campo GRGM no referencial fixo ao corpo lunar (a orientação IAU { "2015" } da Terra média <c2/> composta com o deslocamento fixo DE421 (Development Ephemeris { "421" }) Terra média → eixos principais (ME→PA)), mais a Terra (a perturbação dominante da órbita lunar) e o Sol como terceiros corpos, ajustada pelo <em>mesmo</em> estimador genérico preciso de Gauss–Newton que os conjuntos de dados da Terra usam (o trait <c3/>).

# text
seg-68f1894a1fa5 = Fixture de CI, dinâmico (somente estado)

# text
seg-0f055118d77a = { "4" } h

# text
seg-c94fc5bf792b = { "12.05" } m

# text
seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

# text
seg-af395226ca52 = sobreposição bruta { "39.9" } m

# text
seg-2923b4d58878 = Fixture de CI, dinâmica reduzida (+empírico { "1" }+2/rev)

# text
seg-19167d54b4ad = { "6.67" } m

# text
seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

# text
seg-706a4d52f6c5 = os termos empíricos de 1 e 2 por revolução absorvem o erro ao longo da trajetória

# text
# c1: pxform('MOON_ME','MOON_PA')
# c2: tests/lunar_me_pa_offset_spice_oracle.rs
# c3: docs/design/evidence/fut05b-me-pa-offset-sign/
seg-3f33d99fd643 = Correção da { "0.36" }: até a { "0.36" }, o deslocamento ME→PA do DE421 era aplicado no sentido errado (e com a ordem de Euler errada), o que colocava o referencial PA analítico a cerca de { "208" }″ do PA em vez de sobre ele. Agora ele é transcrito como o SPICE o define (conferido contra <c1/> até { "2.6e-16" } rad, <c2/>; <c3/>). Os valores acima são posteriores à correção; antes dela eram { "53.8" } m brutos, <b>{ "12.6" } m</b> dinâmicos ({ "3.07" }, { "10.19" }, { "6.81" } m) e <b>{ "6.65" } m</b> de dinâmica reduzida ({ "3.49" }, { "4.56" }, { "3.35" } m).

# text
seg-925d1445fccb = Esses resíduos estão <b>acima</b> do limiar de { "5" } m que o Galileo ({ "0.13" } m) e o Swarm-A ({ "0.10" } m) atingem, e são informados com honestidade.

# text
seg-c414e14eaaea = O que de fato define o piso — uma validação cruzada de nível DE (e uma correção)

# text
# c1: MOON_PA
# c2: xval/anise-lunar-od
# c3: moon_pa_de440_200625.bpc
# c4: de440s.bsp
# c5: ae96a29
# c6: c1c7fee…
# c7: 60cd55a…
seg-72b06bac7f6b = Levantamos a hipótese de que o fator limitante era a fidelidade da <b>orientação lunar analítica e das efemérides</b> (a série de libração da IAU, exata a dezenas de segundos de arco em relação ao <c1/> integrado numericamente do JPL DE (Development Ephemeris), e as efemérides da Terra/Sol de Montenbruck–Gill, ~{ "0.3" }° em relação a um kernel DE/SPICE). Para testar isso diretamente, o crate de validação cruzada, excluído do workspace, <c2/> troca <b>somente</b> essas duas entradas por entradas de <b>nível DE</b> — a orientação lunar de eixos principais do DE440 (Development Ephemeris { "440" }) (<c3/>) e as efemérides do DE440 (<c4/>), lidas por meio do ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — um leitor de kernels SPICE em Rust puro) — e executa de novo o <em>mesmo</em> estimador (commit <c5/>, SHA-256 do kernel <c6/> / <c7/>):

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
seg-b6d3daff2f23 = <b>Nota da { "0.36" }: a maior parte do ganho do nível dinâmico abaixo vinha do erro de deslocamento, e não das entradas de nível DE.</b> Com o deslocamento ME→PA corrigido, a pilha analítica dá { "39.9" } m brutos, { "12.05" } m dinâmicos e { "6.67" } m de dinâmica reduzida, contra { "41.5" }, { "12.0" } e { "6.67" } m do nível DE: os ajustes analítico e de nível DE agora concordam em todos os níveis. A leitura da { "0.30" } da tabela abaixo decorre disso e foi mantida como foi escrita.

# text
# c1: atol
seg-691df96321d8 = <b>A hipótese está apenas meio certa, e a afirmação principal precisou ser corrigida.</b> A orientação e as efemérides de nível DE <em>melhoram</em> a sobreposição bruta ({ "53.8" } → { "41.5" } m) e o ajuste <b>dinâmico</b> ({ "12.6" } → { "12.0" } m) — de modo que o erro da orientação/efemérides analíticas é real e de fato limita esses níveis. Mas elas deixam o resíduo de <b>dinâmica reduzida</b> essencialmente <b>inalterado</b> ({ "6.65" } → { "6.67" } m): o nível empírico { "1" }+2 por revolução <em>já</em> absorvia o erro de orientação/efemérides, de modo que o piso operacional de ~{ "6.6" } m é definido por outra coisa — um resíduo que a base de ciclo por revolução não consegue absorver e que referenciais de nível DE não removem. A explicação mais consistente é a <b>dinâmica não gravitacional não modelada do LRO</b> (reirradiação térmica, desgaseificação) ao longo do arco curto de { "4" } h; o grau do campo está excluído (idêntico em d/o { "100" } e { "150" }) e a tolerância do integrador está excluída (idêntica em <c1/> { "1e-6" } e { "1e-9" }). O corolário construtivo: <b>a pilha lunar analítica enxuta e sem kernels do Kshana já iguala a fidelidade de nível DE para a órbita lunar de dinâmica reduzida (operacional)</b> — o padrão de puros coeficientes não deixa nada de lado ali. Ultrapassar { "5" } m exigiria modelar as forças não gravitacionais do LRO (um modelo de caixa-asa/térmico específico da espaçonave e um ajuste mais longo, de vários arcos), e não referenciais melhores.

# text
seg-4211fbd25380 = Contrato de honestidade

# text
seg-f3b0a26ff5b3 = O limiar "verde" de < { "5" } m é atingido para o <b>Galileo MEO</b> ({ "0.13" } m dinâmico) e o <b>Swarm-A LEO</b> ({ "2.69" } m dinâmico / { "0.10" } m de dinâmica reduzida). <b>O LRO lunar é publicado como está, em { "12.05" } m dinâmico / { "6.67" } m de dinâmica reduzida (empírico { "1" }+2 por revolução) — acima do limiar</b> ({ "0.36" }, após a correção do deslocamento ME→PA; { "12.6" } / { "6.65" } m antes dela). Uma validação cruzada de nível DE (acima) <b>testou e corrigiu</b> a afirmação sobre o fator limitante: o piso de dinâmica reduzida <b>não</b> é a orientação/efemérides analíticas (os kernels DE440 o deixam inalterado em { "6.67" } m), de modo que ele não é fechado por referenciais melhores, mas pela modelagem da dinâmica não gravitacional do LRO — o caminho honesto e atualizado até o nível de metro.

# text
seg-559a269152ae = Para LEO, os níveis <b>dinâmico</b> (somente estado, densidade estática) e de <b>dinâmica reduzida</b> (com acelerações empíricas) são sempre informados <b>separadamente</b>, para que o leitor veja o que os termos empíricos absorvem; o nível de dinâmica reduzida é a órbita operacional. A mesma separação vale para os níveis empírico/de força pura de MEO.

# text
seg-d20c7ef90250 = Todo resíduo traz acima seu hash de commit, a referência do conjunto de dados e o checksum da fixture.

# text
seg-733d96129fca = <b>Conjuntos de dados validados contra a verdade real de agências: { "3" } de { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO lunar). <b>Atingindo o limiar de < { "5" } m: { "2" } de { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO a { "6.67" } m, honestamente acima dele).

# text
seg-d7c77076c9c6 = <s1>Anterior</s1>Validação do SGP4

# text
seg-d661003da754 = <s1>Próximo</s1>Sistema solar e outros corpos

# text
seg-36a3b8105d4b = Órbita terrestre média Galileo — GREEN (limiar de < { "5" } m)

# text
seg-b6f96cf0d55a = Swarm-A LEO — GREEN (limiar de < { "5" } m)

# text
seg-9e739bda7f20 = LRO lunar — validado, acima do limiar de { "5" } m (declarado com honestidade) (P4 W4b)
