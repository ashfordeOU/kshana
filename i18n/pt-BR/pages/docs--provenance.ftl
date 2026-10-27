# docs--provenance: translations (pt-BR)

# text
seg-9a2a5f0a8a02 = Sistema solar

# attr:aria-label, text
seg-d01db1c2710a = Referência

# text
seg-28e87f407a10 = Domínio

# text
seg-ad856ad710eb = Status

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Fonte

# text
seg-638b8d451550 = Sensor

# text
seg-d4a762001549 = Licença

# text
seg-60cd077d82a7 = Modelo

# text
seg-2afa300864a9 = Parâmetros

# text
seg-32b620b3574e = Uso

# text
# c1: docs/PROVENANCE.md
seg-f3de25879362 = Fonte: <c1/>

# text
seg-257526f1f93f = Procedência — cada parâmetro rastreável até uma fonte publicada

# text
seg-8c12958898a8 = A disciplina central de honestidade do Kshana é que <b>cada parâmetro de sensor, modelo físico e conjunto de dados de validação é rastreável até uma fonte publicada</b> — uma folha de dados, um artigo revisado por pares, um ICD (documento de controle de interface) de sinal no espaço ou uma norma. Este documento reúne essas strings de procedência em uma única tabela de referência citável.

# text
# c1: [clock_quantum]
# c2: [clock_classical]
# c3: provenance
# c4: ModelSpec
# c5: src/types.rs
# c6: with_provenance
# c7: src/inertial/imu_errors.rs
# c8: quantum.spec.provenance
# c9: classical.spec.provenance
# c10: units
# c11: input
# c12: computed
# c13: closed-form
# c14: internal-consistency
seg-279914171c2e = A procedência não é apenas documentação: cada tabela de sensor em um cenário (por exemplo <c1/> e <c2/>) traz uma string <c3/> (<c4/> em <c5/>; <c6/> em <c7/> para o modelo de erro da unidade de medição inercial (IMU)) que <b>passa para o JSON de resultado</b> (JavaScript Object Notation) como <c8/> e <c9/>, de modo que toda execução carrega suas próprias citações de parâmetros. O bloco <c10/> do resultado também rotula cada campo numérico com uma classe de procedência (<c11/>, <c12/>, <c13/>, <c14/>, …). As tabelas abaixo são o índice consolidado e legível por pessoas dessas strings, mais a procedência algorítmica e de validação extraída dos comentários do código-fonte.

# text
# c1: VALIDATION.md
# c2: validated
# c3: modelled
# c4: not modeled
# c5: QUANTUM-MODELS.md
seg-683fd369407a = A maturidade é rotulada com honestidade em todo o documento: <b>qualificado para voo</b> (já voou), <b>laboratório em solo / foguete de sondagem</b> (demonstrado, não voou) ou <b>meta espacial em hardware de solo</b> (uma figura aspiracional para hardware que não voou — em especial cada figura de relógio óptico de rede de estrôncio). Consulte <a1><c1/></a1> para os rótulos <c2/> / <c3/> / <c4/> por figura e <a2><c5/></a2> para a discussão de maturidade entre laboratório em solo e voo.

# text
seg-80834864bfdd = { "1" }. Parâmetros de relógios e referências de frequência

# text
seg-305f560d4b08 = Figura principal

# text
seg-c35a20fa2529 = Maturidade

# text
seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (relógio atômico em escala de chip)

# text
seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

# text
seg-222707a1bde3 = Folha de dados do fabricante

# text
seg-97709a803dea = <b>qualificado para voo</b> (componente comercial em uso)

# text
seg-75db01df1aea = Relógio óptico de rede de estrôncio (meta espacial)

# text
seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

# text
seg-1996a1d92bb1 = Origlia, Schiller, Bongs et al., <a1>arXiv:{ "1503.08457" }</a1>

# text
seg-b8c64caf79f3 = <b>meta espacial em hardware de solo</b> — nenhum relógio óptico de Sr já voou

# text
seg-b5a006507475 = Relógio óptico de rede de estrôncio (recorde de laboratório)

# text
seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

# text
seg-b21bb1b6bf40 = Oelker et al., <em>Nature Photonics</em> ({ "2019" })

# text
seg-95fb87b3a118 = apenas laboratório em solo

# text
seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; benchmark da ISS (Estação Espacial Internacional))

# text
seg-9d6acc3191a5 = ordem de { "1" }×{ "10" }⁻¹⁶ após integração de vários dias

# text
seg-1cddc44025d7 = ESA (Agência Espacial Europeia) ACES/PHARAO, operacional na ISS desde abril de { "2025" } (cite os resultados publicados pela ESA)

# text
seg-75b7bb5ca4c8 = <b>qualificado para voo</b> (micro-ondas/maser, não óptico)

# text
# c1: q_wf = σ_y(1 s)²
# c2: flicker_floor
# c3: VALIDATION.md
seg-aeb8f189db37 = O coeficiente de ruído branco de frequência de Allan usado pelo modelo de holdover é <c1/>; a modulação de frequência flicker (flicker FM) e o envelhecimento são modelados apenas quando um <c2/> é definido explicitamente (consulte <a1><c3/></a1>); caso contrário, não são modelados.

# text
seg-bfe4524b6664 = { "2" }. Parâmetros de sensores inerciais

# text
seg-5cd1984ba399 = Figuras principais

# text
seg-53ad9ba8cecb = Tríade de acelerômetros quânticos híbridos da Exail

# text
seg-b40c95a6bea5 = estabilidade de viés { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h); ruído { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

# text
seg-fdb8f1d648ba = Templier et al., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

# text
seg-570f41ff76c9 = Acelerômetro de quartzo de grau de navegação Honeywell QA-2000

# text
seg-a7dbc9a9705e = estabilidade de viés ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; ruído ~{ "20" } µg/√Hz; instabilidade de viés ~{ "1" } µg

# text
seg-3ad7ce01c6e2 = Fabricante / Groves, <em>AESS (Aerospace and Electronic Systems Society) Tutorial</em>

# text
seg-37c841945d3e = Modelo de erros de IMU (fator de escala, desalinhamento, sensibilidade à gravidade, quantização, rampa de taxa)

# text
seg-b7547264e608 = cinco categorias sistemáticas

# text
seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Tabela { "4.1" }

# text
seg-c24b9890cf3b = modelo

# text
seg-67a38b3fe143 = Mecanização strapdown (NED, norte-leste-baixo; coning/sculling)

# text
seg-832b3645b515 = atitude por quatérnions §{ "2.2" }, §{ "5.5" }; mecanização NED §{ "5.4" }; gravidade §{ "2.4" }

# text
seg-58c85c15b0aa = Groves, <em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>, 2ª ed.

# text
seg-ac7ef2be17e0 = { "3" }. Parâmetros de transferência de tempo e frequência

# text
seg-7634c6f4b32c = Enlace

# text
seg-dddf65bbb231 = Óptico bidirecional em espaço livre (entre satélites)

# text
seg-e3a8990e650a = piso de laboratório ~{ "1" } fs; meta { "1" } ps considerada plausível em órbita

# text
seg-1adf3425eda9 = Giorgetta et al. ({ "2013" }, <em>Nature Photonics</em>); Deschênes et al. ({ "2016" }, <em>Physical Review X</em>)

# text
seg-9ab60d7ed2a9 = TWSTFT (transferência bidirecional de tempo e frequência por satélite, banda Ku)

# text
seg-543939310789 = sessão única ~{ "0.5" } ns

# text
seg-7f6127bdb4d9 = BIPM (Bureau Internacional de Pesos e Medidas) / PTB (Physikalisch-Technische Bundesanstalt, o instituto nacional de metrologia da Alemanha) / NIST (National Institute of Standards and Technology)

# text
seg-d1f0ed9c0323 = { "4" }. Modelos de órbita, sistemas de tempo e referenciais

# text
seg-2ad53ecbee02 = Equação / norma

# text
seg-7ed15b9389e0 = Referência (comentário no código-fonte)

# text
seg-4d6989c7153e = Propagação SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" })

# text
seg-0d46975247cc = o modelo SGP4 WGS-72 (WGS: World Geodetic System)

# text
seg-6dcfe89aeb8f = Vallado et al., <em>"Revisiting Spacetrack Report #3"</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

# text
seg-e46bf46a4d35 = Segundos intercalares / sistemas de tempo (UTC/TAI/TT/UT1 (UTC: Tempo Universal Coordenado; TAI: Tempo Atômico Internacional; TT: Tempo Terrestre; UT1: Tempo Universal { "1" }, tempo de rotação da Terra))

# text
seg-7505e93b9bf8 = regime de segundos intercalares inteiros desde 1972-01-01

# text
seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); histórico de segundos intercalares do IERS Bulletin C

# text
seg-d25f68665f8e = Ângulo de Rotação da Terra

# text
seg-a3a803bdc8a0 = IAU (União Astronômica Internacional) { "2000" } resolução B1.8

# text
seg-049ad81ff5e8 = Posição/relógio de SV (veículo espacial, isto é, um satélite) por efemérides transmitidas

# text
# c1: F·e·√A·sin Eₖ
# c2: TGD
seg-a1a595008b2a = algoritmo do usuário, <c1/> relativístico, <c2/>

# text
seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

# text
seg-8e14a54b1f09 = Constantes de efemérides do Galileo / QZSS (Quasi-Zenith Satellite System do Japão) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

# text
seg-93b03e3b3e43 = ICDs de SIS por sistema (documentos de controle de interface)

# text
seg-c7c6759c0373 = ICD de SIS do Galileo OS (Open Service); ICD de SIS do BeiDou OS (CGCS2000, o China Geodetic Coordinate System { "2000" }); ICD do GLONASS (Global Navigation Satellite System da Rússia) (PZ-90 (PZ: Parametry Zemli, o datum geodésico russo))

# text
seg-7d59b9c3dabc = { "5" }. Modelos de domínio de medição GNSS e de resiliência

# text
seg-dd7e88cfd703 = Ionosfera monofrequência de Klobuchar

# text
seg-9920eb06b90c = algoritmo de semicírculos

# text
seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

# text
seg-0358759614c5 = Troposfera zenital de Saastamoinen

# text
seg-b4b7f91f6112 = atraso zenital hidrostático + úmido

# text
seg-ba06204996b7 = Davis et al. ({ "1985" }); Groves §{ "9.4" }

# text
seg-9fc988ebf2aa = Funções de mapeamento de Niell

# text
seg-8eb79ff7faaa = mapeamento por elevação, hidrostático e úmido

# text
seg-ca4642e37561 = Niell ({ "1996" })

# text
seg-7876aa9fc732 = Orçamento de enlace antijamming

# text
# c1: [1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹
seg-75e1c40bdc0f = <c1/> (C/N₀ a razão de densidade de portadora para ruído, J/S a razão jammer-sinal, Q o fator de separação espectral, Rc a taxa de chips) → C/N₀ efetivo → perda de travamento

# text
seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3ª ed., §{ "9.4" }

# text
seg-c6e2f2ee16cb = Detecção de spoofing / de energia

# text
seg-15390c9b849c = teste de energia de Neyman–Pearson / χ²₁ bilateral; Φ⁻¹ via Acklam; erf via Abramowitz & Stegun { "7.1.26" }

# text
seg-1c30c0b6a81f = teoria clássica da detecção

# text
seg-023867611249 = Estabilidade da família de Allan (ADEV/MDEV/TDEV/HDEV (ADEV: desvio de Allan; MDEV: desvio de Allan modificado; TDEV: desvio de tempo; HDEV: desvio de Hadamard))

# text
seg-478bb58f8a7f = com intervalos de confiança

# text
seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

# text
seg-a958238e3d1c = RAIM (monitoramento autônomo de integridade pelo receptor) / integridade (HPL/VPL (HPL: nível de proteção horizontal; VPL: nível de proteção vertical), ARAIM (monitoramento autônomo avançado de integridade pelo receptor) com separação de soluções)

# text
seg-41b219635fbe = snapshot e separação de soluções

# text
# c1: INTEGRITY.md
seg-b971eeb2bf2b = consulte <a1><c1/></a1>

# text
seg-926261321371 = { "6" }. Conjuntos de dados de validação

# text
# c1: scripts/fetch_*.sh
# c2: realdata-cache/
seg-04863ce407e7 = <b>Política de inclusão no repositório (vendoring).</b> Versionamos uma cópia literal de todo conjunto de dados de validação cuja licença permite a redistribuição <em>e</em> cujo tamanho cabe confortavelmente no git, de modo que um clone possa reproduzir a validação offline, sem rede e sem links quebrados. Um conjunto de dados fica <b>condicionado a download</b> (baixado por um auxiliar <c1/> para o <c2/> ignorado pelo git, com apenas os pequenos valores de referência <em>derivados</em> versionados) somente quando sua licença não permite claramente a redistribuição, ou quando ele é grande demais para o git. Cada conjunto condicionado registra abaixo o seu motivo específico; nada é condicionado por conveniência.

# text
seg-b966dd26caa6 = Conjunto de dados

# text
seg-e0351f9b83fc = Situação no repositório

# text
seg-ea1ad9965f74 = Vetores de teste SGP4 da AIAA 2006-6753 (todos os { "666" })

# text
seg-cb7efe21070c = validação numérica do SGP4 — pior caso { "4.12" } mm

# text
seg-a624c6877c48 = Vetores de referência publicados (Vallado, AIAA)

# text
seg-d90675af2816 = Incluído no repositório

# text
seg-c1cee31c42df = ADEV σ_y(τ) de relógio óptico de ⁸⁸Sr (Norcia et al., Science { "366" }:{ "93" }, { "2019" })

# text
seg-232e54a0e396 = validação do ajuste de estabilidade medida de relógio óptico

# text
seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Atribuição { "4.0" }; Zenodo 10.5281/zenodo.3382347)

# text
seg-2bb00a0c58ef = Tile de elevação SRTM (Shuttle Radar Topography Mission) v3 da NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) N36W117 (Vale da Morte, decimado para 6 segundos de arco, { "722" } KB)

# text
# c1: .hgt
seg-088a57c3a5b1 = validação do leitor <c1/> de terreno-DEM (DEM: modelo digital de elevação) em relevo real (Bacia de Badwater ≈ −{ "86" } m)

# text
# c1: elevation-tiles-prod
seg-ed90325543c8 = <b>Domínio público</b> (NASA/USGS SRTM v3; via AWS (Amazon Web Services) Open Data <c1/>)

# text
seg-9607b2318cf5 = Exemplos OEM/TDM do Blue Book CCSDS 502.0/503.0 (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message)

# text
seg-b53475918422 = validação de ida e volta do analisador CCSDS

# text
seg-25d9f396b539 = Exemplos de norma publicados (CCSDS)

# text
seg-35dfb14360e3 = Órbita precisa SP3 do IGS (International GNSS Service) (Standard Product { "3" }, o formato de órbita precisa) + amostras de navegação RINEX (Receiver Independent Exchange Format)

# text
seg-5e321b8b5287 = ajuste de órbita + validação de integridade

# text
seg-ec0b6ff10fc5 = Dados abertos do IGS (livres para qualquer uso, com atribuição)

# text
# c1: gps-ops
# c2: galileo
seg-00db9583ce55 = Snapshots de TLE (conjunto de elementos de duas linhas) do Celestrak (<c1/>, <c2/>)

# text
seg-4dabd0f62f90 = cenários de constelações reais

# text
seg-6e7c8deb24b6 = Termos do Celestrak (atribuição; TLEs (conjuntos de elementos de duas linhas) de origem governamental dos EUA)

# text
# c1: tests/fixtures/celestrak/
# c2: scripts/fetch_tles.sh
seg-2827577f7008 = <c1/> + <c2/> ao vivo

# text
seg-c0945969860a = Saídas de referência de scipy / scikit-learn / filterpy

# text
seg-61546d769e23 = validação de kernels numéricos + estimadores

# text
seg-b74e03fddbca = Geradas localmente a partir de bibliotecas BSD/MIT (BSD: licença Berkeley Software Distribution)

# text
# c1: tests/fixtures/scipy/
seg-9d818fc79012 = <c1/> (+ scripts geradores)

# text
seg-4d6c3069b01f = Desvios de referência do Stable32 (escadas de ADEV/HDEV por década)

# text
seg-0a7b677330a6 = paridade do estimador de Allan

# text
seg-3c91f9ae6473 = Valores-resumo derivados (pequenos)

# text
seg-14aecb331164 = Série de fase <b>bruta</b> do césio 5071A ({ "556 990" } pts, { "12" } MB)

# text
seg-9d43f399613b = ADEV/HDEV sobreposto em um relógio de Cs real

# text
# c1: allantools
seg-87b53409bedb = <b>Indefinido</b> — <c1/> é LGPL-3.0 (a GNU Lesser General Public License, uma licença de software) sem <em>nenhuma concessão explícita de redistribuição de dados</em>; o arquivo é excluído da distribuição do PyPI (Python Package Index)

# text
# c1: scripts/fetch_cs5071a.sh
seg-b741be74c8ad = <c1/>; escadas derivadas versionadas

# text
seg-5e07eabcfe78 = PHASE.DAT <b>bruto</b> (série de regressão de 1000 pts)

# text
seg-d9f61f4b985c = Série de paridade de estimadores do Stable32

# text
seg-df8e0a135895 = <b>Indefinido</b> — distribuído com o Stable32 comercial (Hamilton Technical Services); o NIST SP { "1065" } é de domínio público, mas não imprime os valores

# text
# c1: scripts/fetch_phasedat.sh
seg-332b36d2b91f = <c1/>; escadas derivadas versionadas

# text
seg-dd2ee7a9f1fa = Captura de jamming/spoofing GNSS do JammerTest { "2024" } ({ "1.4" } GB)

# text
seg-20065daf2305 = calibração de cenários de resiliência/anomalia

# text
seg-a4410133d410 = GPL-3.0-or-later (a GNU General Public License; Zenodo 10.5281/zenodo.15910563) — redistribuição permitida, mas <b>o tamanho excede o limite de arquivo de { "100" } MB do GitHub</b> e o copyleft da GPL conflita com a árvore AGPL (Affero General Public License)

# text
seg-d4c7d2f9ea0d = <b>Condicionado a download</b>; cite o DOI (identificador de objeto digital)

# text
seg-c0e39f83efcd = A situação de licença de cada conjunto de dados condicionado a download foi pesquisada junto à autoridade de origem; os dois conjuntos de dados de relógio "indefinidos" continuam condicionados até que haja uma concessão explícita de redistribuição (já versionamos os valores que <em>temos</em> licença para publicar), e o conjunto JammerTest é condicionado por tamanho/copyleft apesar de sua licença aberta.

# text
seg-e104e19931d4 = { "7" }. Domínios mais novos — de onde vêm seus parâmetros

# text
# c1: VERIFICATION-MATRIX.md
seg-c11f7c73d10b = Os tipos de cenário acrescentados desde as tabelas acima seguem a mesma regra. Cada linha nomeia a fonte e o status na matriz de verificação da capacidade construída sobre ela (<a1><c1/></a1> traz a linha completa).

# text
# c1: telecom-timing
seg-5d2c25dd2ff3 = Temporização de telecomunicações (<c1/>)

# text
seg-c2ae6b1fe666 = máscaras de sincronização

# text
# c1: TELECOM-TIMING.md
seg-e247606fe749 = Recomendações do ITU-T (Setor de Normalização das Telecomunicações da União Internacional de Telecomunicações), cada limite com sua tabela ou cláusula, listadas em <a1><c1/></a1>

# text
seg-1150ab344107 = MODELLED (transcrição)

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-01d31590ca44 = predefinições de oscilador <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: TELECOM-TIMING.md
seg-9a4c0c214c54 = quatro folhas de dados da Microchip, com os números dos documentos em <a1><c1/></a1>

# text
seg-a03ea8950ab0 = estimadores de MTIE (erro máximo de intervalo de tempo) e TDEV (desvio de tempo)

# text
# c1: tests/fixtures/telecom_timing/
seg-389e18e1a900 = allantools { "2024.06" } em <c1/>

# text
# c1: solar-system
# c2: body-pnt
seg-29edfc0f6a6d = Sistema solar (<c1/>, <c2/>)

# text
seg-df22756e5209 = posições dos planetas a partir dos elementos keplerianos de Standish do JPL (Jet Propulsion Laboratory)

# text
# c1: tests/fixtures/solar_system/
seg-194e3a13d51a = conferidas com vetores de estado do JPL Horizons DE441 (Development Ephemeris { "441" }) em <c1/>

# text
seg-6d23934b3cb7 = VALIDATED; Urano, Netuno, Plutão e as luas MODELLED

# text
seg-a2624ce2e89a = parâmetros gravitacionais, raios e rotação de cada corpo

# text
seg-4d501821b508 = registros de corpos do JPL Horizons e a tabela de parâmetros físicos de satélites do JPL

# text
# c1: constellation-design
seg-f2715a76f0ec = Projeto de constelações (<c1/>)

# text
seg-784e471cdada = slots nominais de GPS, Galileo e GLONASS

# text
seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5ª edição

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
seg-b5e3dc8605b1 = PNT em LEO (órbita baixa da Terra) (<c1/>, <c2/>, <c3/>)

# text
seg-0a535468ad51 = predefinições de sistemas nomeados

# text
seg-aae7fe16f69a = as figuras públicas citadas, cada predefinição com sua fonte

# text
# c1: leo-navmsg
seg-a72c37136e3a = Mensagem de navegação LEO (<c1/>)

# text
seg-ac50550a250f = pesos do erro de distância do sinal no espaço

# text
seg-5dae296d5484 = Montenbruck, Steigenberger e Hauschild ({ "2018" }), <em>Advances in Space Research</em>

# text
seg-9148986e8610 = modelo de efemérides de 22 parâmetros

# text
seg-5b82ad0bd2c9 = Liu et al. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

# text
seg-2080b4fc31a8 = Rodapé de procedência do gráfico

# text
# c1: *.chart.svg
# c2: *.report.html
seg-22d0b06d5df4 = Todo gráfico que o Kshana renderiza — no playground do navegador, na exportação <c1/> da CLI (interface de linha de comando) e no gráfico dentro do relatório imprimível <c2/> (HTML, HyperText Markup Language) — é carimbado, no canto inferior direito, com:

# text
# c1: scenario <hash>
# c2: scenario_hash
# c3: scenario_hash
seg-d8b4de856202 = O <c1/> são os primeiros { "12" } caracteres hexadecimais do <b>hash do cenário</b> da execução: um SHA-256 (SHA: Secure Hash Algorithm) sobre a definição <em>canônica</em> do cenário (semente, limiares, parâmetros de modelo, janelas GNSS e assim por diante). É a mesma impressão digital que aparece no resumo de uma linha da execução e no campo <c2/> do JSON de resultado. (Os tipos de cenário cujo documento de resultado não traz <c3/>, como os relatórios de integridade e lunares, recorrem a um SHA-256 do TOML (Tom's Obvious, Minimal Language) de origem do cenário, de modo que todo gráfico ainda tenha uma impressão digital estável.)

# text
seg-8d218131da01 = Como o hash é determinístico e sensível à entrada, uma imagem de gráfico salva ou colada se autoidentifica: ela registra a versão do motor, o cenário exato que a produziu (para reprodução bit a bit) e a fonte — e qualquer parâmetro alterado gera um hash diferente, de modo que um gráfico com rótulo errado pode ser detectado.

# text
seg-89c9b001868f = Como citar e reproduzir

# text
# c1: scenario + seed + engine version
# c2: CITATION.cff
# c3: provenance
seg-6eca19b7978c = Todo resultado é reproduzível a partir de <c1/>. Cite o motor por meio de <a1><c2/></a1> / o DOI de conceito do Zenodo <a2>10.5281/zenodo.20528627</a2>, e cite as fontes dos <em>parâmetros</em> acima para as figuras de que uma dada execução depende — elas viajam nos campos <c3/> do JSON de resultado, de modo que um resultado publicado seja autodocumentado.

# text
seg-c5c58ef3771c = Quando uma figura é uma meta espacial em hardware de solo (todo número de relógio óptico de estrôncio) ou uma demonstração de laboratório em solo (acelerômetro de átomos frios), este documento e a procedência do resultado dizem isso explicitamente. O Kshana não apresenta figuras de laboratório ou de meta como desempenho em voo.

# text
seg-925d456df88c = <s1>Anterior</s1>Afirmações versus realidade

# text
seg-19e8fefd1ceb = <s1>Próximo</s1>Reprodutibilidade
