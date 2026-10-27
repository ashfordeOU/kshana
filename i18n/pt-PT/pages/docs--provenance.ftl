# docs--provenance: translations (pt-PT)

# text
seg-9a2a5f0a8a02 = Sistema solar

# attr:aria-label, text
seg-d01db1c2710a = Referência

# text
seg-28e87f407a10 = Domínio

# text
seg-ad856ad710eb = Estado

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
seg-32b620b3574e = Utilização

# text
# c1: docs/PROVENANCE.md
seg-f3de25879362 = Fonte: <c1/>

# text
seg-257526f1f93f = Proveniência — cada parâmetro rastreável até uma fonte publicada

# text
seg-8c12958898a8 = A principal disciplina de honestidade do Kshana é que <b>cada parâmetro de sensor, modelo físico e conjunto de dados de validação é rastreável até uma fonte publicada</b> — uma folha de especificações, um artigo revisto por pares, um ICD (documento de controlo de interface) de sinal no espaço ou uma norma. Este documento reúne essas cadeias de proveniência numa única tabela de referência citável.

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
seg-279914171c2e = A proveniência não é apenas documentação: cada tabela de sensor num cenário (por exemplo <c1/> e <c2/>) traz uma cadeia <c3/> (<c4/> em <c5/>; <c6/> em <c7/> para o modelo de erros da unidade de medição inercial (IMU)) que <b>passa para o JSON de resultado</b> (JavaScript Object Notation) como <c8/> e <c9/>, pelo que qualquer execução traz as suas próprias citações de parâmetros. O bloco <c10/> do resultado rotula também cada campo numérico com uma classe de proveniência (<c11/>, <c12/>, <c13/>, <c14/>, …). As tabelas abaixo são o índice consolidado e legível por humanos dessas cadeias, mais a proveniência algorítmica e de validação extraída dos comentários do código-fonte.

# text
# c1: VALIDATION.md
# c2: validated
# c3: modelled
# c4: not modeled
# c5: QUANTUM-MODELS.md
seg-683fd369407a = A maturidade é rotulada com honestidade em todo o lado: <b>qualificado para voo</b> (já voou), <b>laboratório de solo / foguetão de sondagem</b> (demonstrado, não voou) ou <b>objetivo espacial em hardware de solo</b> (um valor aspiracional para hardware que não voou — nomeadamente todos os valores de relógios óticos de rede de estrôncio). Consulte <a1><c1/></a1> para os rótulos <c2/> / <c3/> / <c4/> por valor e <a2><c5/></a2> para a discussão da maturidade laboratório de solo versus voo.

# text
seg-80834864bfdd = { "1" }. Parâmetros de relógios e de referências de frequência

# text
seg-305f560d4b08 = Valor principal

# text
seg-c35a20fa2529 = Maturidade

# text
seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (relógio atómico à escala de chip)

# text
seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

# text
seg-222707a1bde3 = Folha de especificações do fabricante

# text
seg-97709a803dea = <b>qualificado para voo</b> (componente comercial em utilização)

# text
seg-75db01df1aea = Relógio ótico de rede de estrôncio (objetivo espacial)

# text
seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

# text
seg-1996a1d92bb1 = Origlia, Schiller, Bongs et al., <a1>arXiv:{ "1503.08457" }</a1>

# text
seg-b8c64caf79f3 = <b>objetivo espacial em hardware de solo</b> — nenhum relógio ótico de Sr voou

# text
seg-b5a006507475 = Relógio ótico de rede de estrôncio (recorde de laboratório)

# text
seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

# text
seg-b21bb1b6bf40 = Oelker et al., <em>Nature Photonics</em> ({ "2019" })

# text
seg-95fb87b3a118 = apenas laboratório de solo

# text
seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; referência da ISS (International Space Station))

# text
seg-9d6acc3191a5 = ordem de { "1" }×{ "10" }⁻¹⁶ após integração de vários dias

# text
seg-1cddc44025d7 = ESA (European Space Agency) ACES/PHARAO, operacional na ISS desde abril de { "2025" } (citar os resultados publicados pela ESA)

# text
seg-75b7bb5ca4c8 = <b>qualificado para voo</b> (micro-ondas/maser, não ótico)

# text
# c1: q_wf = σ_y(1 s)²
# c2: flicker_floor
# c3: VALIDATION.md
seg-aeb8f189db37 = O coeficiente de ruído branco de frequência de Allan usado pelo modelo de holdover é <c1/>; a modulação de frequência flicker (flicker FM) e o envelhecimento só são modelados quando um <c2/> é definido explicitamente (consulte <a1><c3/></a1>); caso contrário, não são modelados.

# text
seg-bfe4524b6664 = { "2" }. Parâmetros de sensores inerciais

# text
seg-5cd1984ba399 = Valores principais

# text
seg-53ad9ba8cecb = Tríade de acelerómetros quânticos híbridos da Exail

# text
seg-b40c95a6bea5 = estabilidade do enviesamento { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h); ruído { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

# text
seg-fdb8f1d648ba = Templier et al., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

# text
seg-570f41ff76c9 = Acelerómetro de quartzo Honeywell QA-2000 de grau de navegação

# text
seg-a7dbc9a9705e = estabilidade do enviesamento ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; ruído ~{ "20" } µg/√Hz; instabilidade do enviesamento ~{ "1" } µg

# text
seg-3ad7ce01c6e2 = Fabricante / Groves <em>AESS (Aerospace and Electronic Systems Society) Tutorial</em>

# text
seg-37c841945d3e = Modelo de erros da IMU (fator de escala, desalinhamento, sensibilidade a g, quantização, rampa de taxa)

# text
seg-b7547264e608 = cinco categorias sistemáticas

# text
seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Tabela { "4.1" }

# text
seg-c24b9890cf3b = modelo

# text
seg-67a38b3fe143 = Mecanização strapdown (NED, norte-este-baixo; coning/sculling)

# text
seg-832b3645b515 = atitude por quaterniões §{ "2.2" }, §{ "5.5" }; mecanização NED §{ "5.4" }; gravidade §{ "2.4" }

# text
seg-58c85c15b0aa = Groves, <em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>, 2.ª ed.

# text
seg-ac7ef2be17e0 = { "3" }. Parâmetros de transferência de tempo e de frequência

# text
seg-7634c6f4b32c = Ligação

# text
seg-dddf65bbb231 = Ótica bidirecional em espaço livre (entre satélites)

# text
seg-e3a8990e650a = patamar de laboratório ~{ "1" } fs; objetivo de { "1" } ps credível em órbita

# text
seg-1adf3425eda9 = Giorgetta et al. ({ "2013" }, <em>Nature Photonics</em>); Deschênes et al. ({ "2016" }, <em>Physical Review X</em>)

# text
seg-9ab60d7ed2a9 = TWSTFT (transferência bidirecional de tempo e frequência por satélite, banda Ku)

# text
seg-543939310789 = sessão única ~{ "0.5" } ns

# text
seg-7f6127bdb4d9 = BIPM (Bureau International des Poids et Mesures) / PTB (Physikalisch-Technische Bundesanstalt, o instituto nacional de metrologia alemão) / NIST (National Institute of Standards and Technology)

# text
seg-d1f0ed9c0323 = { "4" }. Modelos de órbita, de sistemas de tempo e de referenciais

# text
seg-2ad53ecbee02 = Equação / norma

# text
seg-7ed15b9389e0 = Referência (comentário do código-fonte)

# text
seg-4d6989c7153e = Propagação SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" })

# text
seg-0d46975247cc = o modelo SGP4 WGS-72 (WGS: World Geodetic System)

# text
seg-6dcfe89aeb8f = Vallado et al., <em>"Revisiting Spacetrack Report #3"</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

# text
seg-e46bf46a4d35 = Segundos intercalares / sistemas de tempo (UTC/TAI/TT/UT1 (UTC: Tempo Universal Coordenado; TAI: Tempo Atómico Internacional; TT: Tempo Terrestre; UT1: Tempo Universal { "1" }, tempo de rotação da Terra))

# text
seg-7505e93b9bf8 = regime de segundos intercalares inteiros desde 1972-01-01

# text
seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); histórico de segundos intercalares do IERS Bulletin C

# text
seg-d25f68665f8e = Ângulo de Rotação da Terra

# text
seg-a3a803bdc8a0 = IAU (International Astronomical Union) { "2000" } resolução B1.8

# text
seg-049ad81ff5e8 = Posição/relógio de SV (veículo espacial, isto é, um satélite) das efemérides difundidas

# text
# c1: F·e·√A·sin Eₖ
# c2: TGD
seg-a1a595008b2a = algoritmo de utilizador, <c1/> relativista, <c2/>

# text
seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

# text
seg-8e14a54b1f09 = Constantes de efemérides Galileo / QZSS (Quasi-Zenith Satellite System do Japão) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

# text
seg-93b03e3b3e43 = ICD de SIS por sistema (documentos de controlo de interface)

# text
seg-c7c6759c0373 = ICD de SIS do Galileo OS (Open Service); ICD de SIS do BeiDou OS (CGCS2000, o China Geodetic Coordinate System { "2000" }); ICD do GLONASS (Global Navigation Satellite System da Rússia) (PZ-90 (PZ: Parametry Zemli, o datum geodésico russo))

# text
seg-7d59b9c3dabc = { "5" }. Modelos de domínio das medições GNSS e de resiliência

# text
seg-dd7e88cfd703 = Ionosfera monofrequência de Klobuchar

# text
seg-9920eb06b90c = algoritmo de semicírculos

# text
seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

# text
seg-0358759614c5 = Troposfera zenital de Saastamoinen

# text
seg-b4b7f91f6112 = atraso zenital hidrostático + húmido

# text
seg-ba06204996b7 = Davis et al. ({ "1985" }); Groves §{ "9.4" }

# text
seg-9fc988ebf2aa = Funções de mapeamento de Niell

# text
seg-8eb79ff7faaa = mapeamento de elevação hidrostático e húmido

# text
seg-ca4642e37561 = Niell ({ "1996" })

# text
seg-7876aa9fc732 = Balanço de ligação anti-jam

# text
# c1: [1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹
seg-75e1c40bdc0f = <c1/> (C/N₀ a relação portadora-ruído, J/S a relação jammer-sinal, Q o fator de separação espectral, Rc a taxa de chips) → C/N₀ efetivo → perda de bloqueio

# text
seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3.ª ed., §{ "9.4" }

# text
seg-c6e2f2ee16cb = Deteção de spoof / de energia

# text
seg-15390c9b849c = Teste de energia de Neyman–Pearson / χ²₁ bilateral; Φ⁻¹ via Acklam; erf via Abramowitz & Stegun { "7.1.26" }

# text
seg-1c30c0b6a81f = teoria clássica da deteção

# text
seg-023867611249 = Estabilidade da família de Allan (ADEV/MDEV/TDEV/HDEV (ADEV: desvio de Allan; MDEV: desvio de Allan modificado; TDEV: desvio de tempo; HDEV: desvio de Hadamard))

# text
seg-478bb58f8a7f = com intervalos de confiança

# text
seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

# text
seg-a958238e3d1c = RAIM (monitorização autónoma da integridade pelo recetor) / integridade (HPL/VPL (HPL: nível de proteção horizontal; VPL: nível de proteção vertical), separação de soluções ARAIM (monitorização autónoma avançada da integridade pelo recetor))

# text
seg-41b219635fbe = instantâneo e separação de soluções

# text
# c1: INTEGRITY.md
seg-b971eeb2bf2b = consulte <a1><c1/></a1>

# text
seg-926261321371 = { "6" }. Conjuntos de dados de validação

# text
# c1: scripts/fetch_*.sh
# c2: realdata-cache/
seg-04863ce407e7 = <b>Política de inclusão no repositório.</b> Registamos uma cópia literal de cada conjunto de dados de validação cuja licença permita a redistribuição <em>e</em> cuja dimensão caiba com folga no git, para que um clone possa reproduzir a validação offline, sem rede e sem ligações quebradas. Um conjunto de dados tem <b>obtenção condicionada</b> (descarregado por um auxiliar <c1/> para <c2/>, ignorado pelo git, com apenas os pequenos valores de referência <em>derivados</em> registados) apenas quando a sua licença não permite claramente a redistribuição, ou quando é demasiado grande para o git. Cada conjunto condicionado regista abaixo o seu motivo específico; nada é condicionado por conveniência.

# text
seg-b966dd26caa6 = Conjunto de dados

# text
seg-e0351f9b83fc = Estado no repositório

# text
seg-ea1ad9965f74 = Vetores de teste SGP4 AIAA 2006-6753 (todos os { "666" })

# text
seg-cb7efe21070c = Validação numérica do SGP4 — pior caso { "4.12" } mm

# text
seg-a624c6877c48 = Vetores de referência publicados (Vallado, AIAA)

# text
seg-d90675af2816 = Incluído no repositório

# text
seg-c1cee31c42df = ADEV σ_y(τ) de relógio ótico de ⁸⁸Sr (Norcia et al., Science { "366" }:{ "93" }, { "2019" })

# text
seg-232e54a0e396 = validação do ajuste da estabilidade medida de relógios óticos

# text
seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }; Zenodo 10.5281/zenodo.3382347)

# text
seg-2bb00a0c58ef = Mosaico de elevação NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) SRTM (Shuttle Radar Topography Mission) v3 N36W117 (Vale da Morte, decimado para 6 segundos de arco, { "722" } KB)

# text
# c1: .hgt
seg-088a57c3a5b1 = validação do leitor <c1/> de terrain-DEM (DEM: modelo digital de elevação) em relevo real (Badwater Basin ≈ −{ "86" } m)

# text
# c1: elevation-tiles-prod
seg-ed90325543c8 = <b>Domínio público</b> (NASA/USGS SRTM v3; via AWS (Amazon Web Services) Open Data <c1/>)

# text
seg-9607b2318cf5 = Exemplos CCSDS 502.0/503.0 Blue Book OEM/TDM (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message)

# text
seg-b53475918422 = validação da ida-e-volta do analisador CCSDS

# text
seg-25d9f396b539 = Exemplos publicados de normas (CCSDS)

# text
seg-35dfb14360e3 = Amostras de órbita precisa SP3 (Standard Product { "3" }, o formato de órbita precisa) do IGS (International GNSS Service) + amostras de navegação RINEX (Receiver Independent Exchange Format)

# text
seg-5e321b8b5287 = ajuste de órbita + validação de integridade

# text
seg-ec0b6ff10fc5 = Dados abertos do IGS (livres para qualquer uso, com atribuição)

# text
# c1: gps-ops
# c2: galileo
seg-00db9583ce55 = Instantâneos de TLE (conjunto de elementos de duas linhas) do Celestrak (<c1/>, <c2/>)

# text
seg-4dabd0f62f90 = cenários de constelações reais

# text
seg-6e7c8deb24b6 = Termos do Celestrak (atribuição; TLE de origem governamental dos EUA (US: Estados Unidos) (conjuntos de elementos de duas linhas))

# text
# c1: tests/fixtures/celestrak/
# c2: scripts/fetch_tles.sh
seg-2827577f7008 = <c1/> + <c2/> em tempo real

# text
seg-c0945969860a = Saídas de referência do scipy / scikit-learn / filterpy

# text
seg-61546d769e23 = validação de núcleos numéricos + estimadores

# text
seg-b74e03fddbca = Geradas localmente a partir de bibliotecas BSD/MIT (BSD: licença Berkeley Software Distribution)

# text
# c1: tests/fixtures/scipy/
seg-9d818fc79012 = <c1/> (+ scripts geradores)

# text
seg-4d6c3069b01f = Desvios de referência do Stable32 (escadas decádicas de ADEV/HDEV)

# text
seg-0a7b677330a6 = paridade do estimador de Allan

# text
seg-3c91f9ae6473 = Valores de resumo derivados (pequenos)

# text
seg-14aecb331164 = Série de fase <b>bruta</b> de césio 5071A ({ "556 990" } pts, { "12" } MB)

# text
seg-9d43f399613b = ADEV/HDEV sobrepostos num relógio de Cs real

# text
# c1: allantools
seg-87b53409bedb = <b>Pouco claro</b> — <c1/> está sob LGPL-3.0 (a GNU Lesser General Public License, uma licença de software) <em>sem concessão explícita de redistribuição de dados</em>; o ficheiro está excluído da distribuição PyPI (Python Package Index)

# text
# c1: scripts/fetch_cs5071a.sh
seg-b741be74c8ad = <c1/>; escadas derivadas registadas

# text
seg-5e07eabcfe78 = PHASE.DAT <b>bruto</b> (série de regressão de 1000 pts)

# text
seg-d9f61f4b985c = Série de paridade de estimadores do Stable32

# text
seg-df8e0a135895 = <b>Pouco claro</b> — distribuído com o Stable32 comercial (Hamilton Technical Services); o NIST SP { "1065" } é de domínio público mas não imprime os valores

# text
# c1: scripts/fetch_phasedat.sh
seg-332b36d2b91f = <c1/>; escadas derivadas registadas

# text
seg-dd2ee7a9f1fa = Captura de jamming/spoofing GNSS do JammerTest { "2024" } ({ "1.4" } GB)

# text
seg-20065daf2305 = calibração de cenários de resiliência/anomalias

# text
seg-a4410133d410 = GPL-3.0-or-later (a GNU General Public License; Zenodo 10.5281/zenodo.15910563) — redistribuição permitida, mas <b>a dimensão excede o limite de { "100" } MB por ficheiro do GitHub</b> e o copyleft da GPL entra em conflito com a árvore AGPL (Affero General Public License)

# text
seg-d4c7d2f9ea0d = <b>Obtenção condicionada</b>; referir o DOI (identificador digital de objeto)

# text
seg-c0e39f83efcd = O estatuto de licença de cada conjunto de dados de obtenção condicionada foi investigado junto da autoridade de origem; os dois conjuntos de dados de relógios "pouco claros" permanecem condicionados até haver uma concessão explícita de redistribuição (já registamos os valores que <em>estamos</em> licenciados para publicar), e o conjunto JammerTest é condicionado por razões de dimensão/copyleft apesar da sua licença aberta.

# text
seg-e104e19931d4 = { "7" }. Domínios mais recentes — de onde vêm os seus parâmetros

# text
# c1: VERIFICATION-MATRIX.md
seg-c11f7c73d10b = Os tipos acrescentados desde as tabelas acima mantêm a mesma regra. Cada linha nomeia a fonte e o estado na matriz de verificação da capacidade construída sobre ela (<a1><c1/></a1> tem a linha completa).

# text
# c1: telecom-timing
seg-5d2c25dd2ff3 = Temporização de telecomunicações (<c1/>)

# text
seg-c2ae6b1fe666 = máscaras de sincronização

# text
# c1: TELECOM-TIMING.md
seg-e247606fe749 = Recomendações do ITU-T (Setor de Normalização das Telecomunicações da União Internacional das Telecomunicações), cada limite com a sua tabela ou cláusula, listadas em <a1><c1/></a1>

# text
seg-1150ab344107 = MODELLED (transcrição)

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-01d31590ca44 = predefinições de osciladores <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: TELECOM-TIMING.md
seg-9a4c0c214c54 = quatro folhas de especificações da Microchip, números de documento em <a1><c1/></a1>

# text
seg-a03ea8950ab0 = Estimadores MTIE (erro máximo de intervalo de tempo) e TDEV (desvio de tempo)

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
seg-194e3a13d51a = verificado face aos vetores de estado JPL Horizons DE441 (Development Ephemeris { "441" }) em <c1/>

# text
seg-6d23934b3cb7 = VALIDATED; Úrano, Neptuno, Plutão e as luas MODELLED

# text
seg-a2624ce2e89a = parâmetros gravitacionais, raios e rotação de cada corpo

# text
seg-4d501821b508 = registos de corpos do JPL Horizons e a tabela de parâmetros físicos de satélites do JPL

# text
# c1: constellation-design
seg-f2715a76f0ec = Projeto de constelações (<c1/>)

# text
seg-784e471cdada = posições nominais GPS, Galileo e GLONASS

# text
seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5.ª edição

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
seg-b5e3dc8605b1 = PNT em LEO (órbita terrestre baixa) (<c1/>, <c2/>, <c3/>)

# text
seg-0a535468ad51 = predefinições de sistemas nomeados

# text
seg-aae7fe16f69a = os valores públicos citados, cada predefinição com a sua fonte

# text
# c1: leo-navmsg
seg-a72c37136e3a = Mensagem de navegação em LEO (<c1/>)

# text
seg-ac50550a250f = pesos do erro de distância do sinal no espaço

# text
seg-5dae296d5484 = Montenbruck, Steigenberger e Hauschild ({ "2018" }), <em>Advances in Space Research</em>

# text
seg-9148986e8610 = modelo de efemérides de 22 parâmetros

# text
seg-5b82ad0bd2c9 = Liu et al. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

# text
seg-2080b4fc31a8 = Rodapé de proveniência do gráfico

# text
# c1: *.chart.svg
# c2: *.report.html
seg-22d0b06d5df4 = Cada gráfico que o Kshana renderiza — no playground no navegador, na exportação <c1/> da CLI (command-line interface) e no gráfico dentro do relatório imprimível <c2/> (HTML, HyperText Markup Language) — é carimbado, em baixo à direita, com:

# text
# c1: scenario <hash>
# c2: scenario_hash
# c3: scenario_hash
seg-d8b4de856202 = O <c1/> são os primeiros { "12" } carateres hexadecimais do <b>hash do cenário</b> da execução: um SHA-256 (SHA: Secure Hash Algorithm) sobre a definição <em>canónica</em> do cenário (semente, limiares, parâmetros dos modelos, janelas GNSS, etc.). É a mesma impressão digital que aparece no resumo de uma linha da execução e no campo <c2/> do JSON de resultado. (Os tipos cujo documento de resultado não traz <c3/>, como os relatórios de integridade e lunares, recorrem a um SHA-256 do TOML (Tom's Obvious, Minimal Language) de origem do cenário, para que todos os gráficos tenham sempre uma impressão digital estável.)

# text
seg-8d218131da01 = Como o hash é determinista e sensível à entrada, uma imagem de gráfico guardada ou colada identifica-se a si própria: regista a versão do motor, o cenário exato que a produziu (para reprodução bit a bit) e a origem — e qualquer parâmetro alterado produz um hash diferente, pelo que um gráfico mal rotulado é detetável.

# text
seg-89c9b001868f = Como citar e reproduzir

# text
# c1: scenario + seed + engine version
# c2: CITATION.cff
# c3: provenance
seg-6eca19b7978c = Cada resultado é reproduzível a partir de <c1/>. Cite o motor através de <a1><c2/></a1> / do DOI de conceito do Zenodo <a2>10.5281/zenodo.20528627</a2>, e cite as fontes dos <em>parâmetros</em> acima para os valores de que uma dada execução depende — viajam nos campos <c3/> do JSON de resultado, pelo que um resultado publicado é autodocumentado.

# text
seg-c5c58ef3771c = Quando um valor é um objetivo espacial em hardware de solo (todos os números de relógios óticos de estrôncio) ou uma demonstração de laboratório de solo (acelerómetro de átomos frios), este documento e a proveniência do resultado dizem-no explicitamente. O Kshana não apresenta valores de laboratório ou de objetivos como desempenho em voo.

# text
seg-925d456df88c = <s1>Anterior</s1>Afirmações face à realidade

# text
seg-19e8fefd1ceb = <s1>Seguinte</s1>Reprodutibilidade
