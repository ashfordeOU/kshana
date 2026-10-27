# docs--standards: translations (pt-PT)

# text
seg-4a2ce9f33ab2 = escrita

# text
seg-9120d3e96e5e = leitura

# text
seg-5ad814c7ef9e = Notas

# text
seg-aab745a65e76 = Módulo

# text
seg-bf09433a7342 = GeoJSON

# text
seg-906440b861cd = Trama

# text
seg-32b620b3574e = Utilização

# text
seg-8ba331635865 = Normas e interoperabilidade

# text
# c1: docs/STANDARDS.md
seg-96a449a63d11 = Fonte: <c1/>

# text
seg-3ed65a16e7d0 = O Kshana fala os formatos de intercâmbio normalizados das comunidades de GNSS (sistema global de navegação por satélite), de dinâmica de voo e de temporização, para poder estar ao lado do RTKLIB (uma biblioteca de código aberto de posicionamento cinemático em tempo real), do gLAB, do Ginan, do GMAT (General Mission Analysis Tool), do Orekit e das ferramentas dos centros de análise do IGS (International GNSS Service), em vez de numa ilha privada. Esta página associa os <b>formatos de intercâmbio</b> que o motor analisa ou emite ao módulo que implementa cada um e à especificação de referência.

# text
# c1: VERIFICATION-MATRIX.md
seg-d1aa512ad4ee = Está limitada aos formatos — coisas com um sentido de leitura/escrita. As normas de sinal e de algoritmo que o motor <em>implementa</em> em vez de analisar (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (anteriormente Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), a referência WG-C (WG: Working Group) do ARAIM (monitorização avançada da integridade autónoma do recetor), CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)) são evidenciadas linha a linha em <a1><c1/></a1>.

# text
seg-656920618fb7 = Formatos que o motor fala

# text
seg-4fe4920a3fa1 = Norma

# text
seg-d08f1943c53b = Sentido

# text
seg-968a1d48364c = Especificação / autoridade

# text
seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

# text
seg-68d762928f76 = leitura <b>e</b> escrita

# text
seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, forma KVN (notação chave-valor)

# text
# c1: parse_oem
# c2: tests/ccsds_reference.rs
# c3: COVARIANCE_START … COVARIANCE_STOP
# c4: COV_REF_FRAME
# c5: covariance_block_kvn
# c6: parse_covariance_block
# c7: src/oem.rs
seg-be700901c03e = Efeméride tabulada de vetores de estado ingerida pelo GMAT, pelo Orekit e pelo STK (Systems Tool Kit). <c1/> lê-a de volta; <b>validada pela recuperação do exemplo literal da Figura G-11 do Livro Azul CCSDS 502.0-B-3</b> (<a1><c2/></a1>). O <b>bloco de covariância</b> opcional de posição/velocidade de { "6" }×{ "6" } (<c3/>, a serialização KVN do triângulo inferior de 21 elementos com um <c4/> opcional) é escrito (<c5/>) e lido (<c6/>), com simetria de ida e volta (testes de <a2><c7/></a2>).

# text
seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

# text
seg-8e9f975d443b = CCSDS 502.0-B-2, forma KVN

# text
# c1: orbit
# c2: --export-omm <out.omm>
# c3: export_omm = true
# c4: tests/sp3_export_roundtrip.rs
seg-fb5218415d68 = Publicação em via de normalização dos elementos médios SGP4/TLE (SGP4: Simplified General Perturbations { "4" }; TLE: conjunto de elementos de duas linhas) (movimento médio, e, i, Ω, ω, M, BSTAR (o termo de arrasto do propagador de órbita)). Acessível pela CLI (CLI: interface de linha de comandos) num cenário <c1/> através de <c2/> ou <c3/> (um OMM por satélite definido por TLE, com o seu verdadeiro identificador NORAD (North American Aerospace Defense Command), designador COSPAR (Committee on Space Research) e época; <a1><c4/></a1>). A forma XML (Extensible Markup Language) e um leitor são desenvolvimentos futuros.

# text
seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

# text
seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, forma KVN

# text
# c1: tests/ccsds_reference.rs
seg-cd96db42ab43 = Registos de seguimento de distância / Doppler / ângulo que uma passagem DSN/ESTRACK (ESTRACK: European Space Tracking network) entrega a um sistema de OD (determinação de órbita). <b>Validado pela recuperação do exemplo literal da Figura E-9 do Livro Azul CCSDS 503.0-B-2</b> (<a1><c1/></a1>).

# text
seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

# text
seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

# text
# c1: spacepackets-py
# c2: src/space_packet.rs
seg-ed9c8bdddd6d = O enquadramento do cabeçalho primário TM/TC (TM: telemetria; TC: telecomando) de 6 octetos que os sistemas de terra trocam. <b>O codificador reproduz os vetores de teste ao nível do byte publicados pela biblioteca independente <c1/></b> (testes de <a1><c2/></a1>).

# text
seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, o formato de órbita precisa) / SP3-d</b> (efeméride precisa)

# text
seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

# text
# c1: gps-ops
# c2: tests/sp3_export_roundtrip.rs
seg-8d1089fbd59d = Série temporal de posição fixa à Terra (ECEF) + tempo do relógio. Ida e volta validada a < { "0.5" } m num instantâneo real de <c1/> (<a1><c2/></a1>).

# text
seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (navegação difundida)

# text
seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, ICD do Galileo (documento de controlo de interface), ICD do BeiDou, ICD do GLONASS (sistema global de navegação por satélite da Rússia))

# text
# c1: Propagator
seg-1b7710db3abf = Ingestão NAV multi-GNSS (GPS LNAV (mensagem de navegação legada), Galileo F/NAV, QZSS (sistema japonês Quasi-Zenith Satellite System), BeiDou MEO/IGSO (MEO: órbita terrestre média; IGSO: órbita geossíncrona inclinada), vetor de estado GLONASS); utilizável como fonte de <c1/> de primeira classe.

# text
seg-44991b52d1ff = <b>TLE / 3LE</b> (elementos de duas / três linhas)

# text
seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

# text
seg-8d4dd42edc89 = Propagado pelo núcleo SGP4/SDP4 validado (SDP4: Simplified Deep-space Perturbations { "4" }) ({ "4.12" } mm face aos { "666" } vetores oficiais da AIAA).

# text
seg-498aac915067 = <b>RINEX 3.0x</b> (observação)

# text
seg-437d07b5aa4f = RINEX 3.0x OBS (prevê-se que o { "4.00" } seja analisado, mas nunca foi exercitado num ficheiro { "4.00" })

# text
# c1: parse_obs
# c2: pvt
# c3: tests/pvt_abmf.rs
seg-ac97f77f142c = A outra metade do RINEX: os registos de código/portadora/Doppler/SNR (SNR: razão sinal-ruído) do próprio recetor (<c1/>). É a entrada que o solucionador de posicionamento de ponto único <c2/> consome junto com o ficheiro de navegação difundido (<a1><c3/></a1>, estação IGS real ABMF).

# text
seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format; mapas globais de TEC (conteúdo eletrónico total))

# text
seg-bf1bb42f04c4 = IONEX { "1" }.x (produto de ionosfera do IGS)

# text
# c1: parse_ionex
seg-af9efa0df270 = <c1/> lê as grelhas globais de conteúdo eletrónico total do IGS — a alternativa <em>medida</em> à correção de Klobuchar difundida — com interpolação espacial e temporal bilinear e o mapeamento de obliquidade para o atraso oblíquo.

# text
# c1: finals2000A
seg-6f0da4b59d7c = <b>IERS (International Earth Rotation and Reference Systems Service) <c1/> / Bulletin B</b> (orientação da Terra)

# text
# c1: finals2000A.all
seg-197dfa18ca19 = IERS Conventions; IERS EOP (parâmetros de orientação da Terra) { "14" } C04 / <c1/>

# text
# c1: tests/operational_eop_predictor_reference.rs
seg-0d102d904cfe = UT1 (Universal Time { "1" }, tempo de rotação da Terra)−UTC (Tempo Universal Coordenado) e movimento polar a partir do produto oficial, incluindo as linhas <b>previstas</b>, de modo que a redução de referencial possa ser executada em tempo real e o crescimento do seu erro de previsão orçamentado (<a1><c1/></a1>).

# text
seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

# text
# c1: SCHEMA.md
seg-193b33461507 = este repositório — ver <a1><c1/></a1>

# text
# c1: format
# c2: schema_version
# c3: kind
# c4: engine_version
# c5: payload
seg-33ef8d792a90 = O envelope neutro e versionado em que qualquer artefacto pode ser embrulhado: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, com um veredicto explícito de compatibilidade maior-menor para um consumidor. Não é uma norma externa; está documentado aqui porque uma ferramenta alheia tem de o reconhecer.

# text
seg-a492f437efd0 = Intercâmbio lunar LunaNet / IOAG (Interagency Operations Advisory Group)

# text
seg-b19cf72da934 = escrita (os metadados de tempo também são lidos)

# text
seg-d641c72a6449 = Especificação de interoperabilidade LunaNet / arquitetura de comunicações lunares do IOAG, sobre CCSDS { "502.0" }

# text
# c1: export_lunar_oem
# c2: export_kif_lunar
# c3: export_lunar_time_metadata
# c4: tests/lunar_interoperability_export_reference.rs
seg-cc796afe7a72 = O referencial lunar, a escala de tempo lunar e a efeméride lunar emitidos em formas CCSDS alinhadas com o LunaNet/IOAG (<c1/>, <c2/>, <c3/>), com uma verificação de campos no OEM emitido (<a1><c4/></a1>).

# text
seg-5abc05382382 = <b>CZML</b> (Cesium Language)

# text
seg-da7e20d3786b = Formato de pacotes CZML do CesiumJS

# text
# c1: INERTIAL
# c2: --export czml
seg-8d3a73646be3 = Um fluxo JSON (JavaScript Object Notation) de pacotes com marca temporal para o globo do CesiumJS; objetos em movimento escritos em GCRS (<c1/>). <c2/> em qualquer tipo de cenário que coloque objetos na Terra.

# text
seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

# text
seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

# text
# c1: --export kml
seg-57468e6d97f2 = Longitude, latitude e altura fixas à Terra para o Google Earth e para ferramentas SIG (sistemas de informação geográfica). <c1/>.

# text
seg-46d977015b07 = escrita <b>e</b> leitura (percurso)

# text
seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

# text
# c1: --export geojson
# c2: LineString
# c3: --import-route <route.geojson>
seg-425a83b44545 = Geometria fixa à Terra para mapas web e ferramentas SIG (<c1/>); um <c2/> é lido de volta como a entrada de trajeto reto dos tipos de cenário que fazem voar um (<c3/>).

# text
# c1: .e
# c2: EphemerisTimePosVel
seg-d9b137e11514 = <b>Efeméride STK</b> (<c1/>, <c2/>)

# text
seg-347ee6f6c1df = Formato de ficheiro de efeméride Ansys STK

# text
# c1: ICRF
# c2: --export stk
seg-45576578d357 = Posição e velocidade inerciais (<c1/>) para o STK e para ferramentas que leem o seu formato de efeméride. <c2/>.

# text
seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

# text
seg-42272f73f456 = Especificação SigMF

# text
# c1: spectrum
# c2: --export sigmf
# c3: [recording]
seg-202b559c30a6 = Gravações complexas em banda de base mais metadados JSON: o tipo de cenário <c1/> escreve as suas amostras sintetizadas em fase/quadratura (IQ) (<c2/>) e lê uma gravação através do seu bloco <c3/>.

# text
seg-60e7c8505cb5 = <b>Texto de mensagem de navegação LEO</b> (estilo RINEX-4 e CSV (valores separados por vírgulas))

# text
seg-f22442e0e8ea = Estrutura de navegação RINEX { "4" }, adaptada

# text
# c1: leo-navmsg
seg-8338e445b3a5 = A efeméride difundida e o relógio do tipo de cenário <c1/> para um satélite de órbita terrestre baixa (LEO), exportados e reimportados; uma adaptação documentada, e não um tipo de mensagem RINEX registado (MODELLED na matriz de verificação).

# text
seg-1b89ab4e93f7 = Referenciais e tempo

# text
# c1: src/cio.rs
# c2: src/frames.rs
# c3: src/nutation.rs
# c4: VALIDATION.md
seg-dbbd023631b6 = O referencial que o motor emite é explícito, e não implícito. A redução IAU (International Astronomical Union) 2006/2000A baseada no CIO (CIO: Celestial Intermediate Origin) (<a1><c1/></a1>) e a redução TEME (equador verdadeiro, equinócio médio) por equinócio/GMST (GMST: tempo sideral médio de Greenwich) (<a2><c2/></a2>, <a3><c3/></a3>) são validadas bit a bit face aos vetores de referência SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) (ver <a4><c4/></a4>).

# text
seg-819d28bd9361 = Realização

# text
seg-69aca96b7e42 = TEME

# text
seg-ec81608934a6 = SGP4 nativo

# text
seg-7631c594fd1a = Equador verdadeiro, equinócio médio — o referencial de saída do SGP4/SDP4.

# text
seg-eeb28cc286b3 = GCRS (Geocentric Celestial Reference System) / J2000

# text
seg-745285e29202 = Precessão IAU { "2006" } + nutação IAU 2000A/2000B

# text
# c1: teme_to_gcrs
seg-3747add299d5 = <c1/> (cadeia do equinócio).

# text
seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

# text
seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

# text
seg-8891621dc302 = ITRS (International Terrestrial Reference System) / ECEF

# text
seg-a28e26cd2481 = ERA (ângulo de rotação da Terra) + movimento polar do IERS (CIO) ou GMST + movimento polar (equinócio)

# text
# c1: gcrs_to_itrs_matrix
# c2: eraC2tcio
# c3: teme_to_itrf
seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (equinócio).

# text
seg-74a4801fd685 = WGS-84 (WGS: World Geodetic System) geodésico

# text
seg-b58a44eaaa39 = exato + inverso iterativo

# text
seg-4d9472dd73d3 = Escala de tempo

# text
seg-cbe7a7ce7317 = <b>TT</b> (Tempo Terrestre)

# text
# c1: jd_tt
seg-25191c1a4135 = Avaliação do argumento de precessão/nutação/CIO (<c1/>).

# text
# c1: jd_ut1
seg-8c478d6b4786 = Ângulo de rotação da Terra / GMST (<c1/>).

# text
seg-f7033ca0c13f = <b>JD em duas partes</b> (data juliana)

# text
# c1: Jd2
seg-64a5adeacd5b = <c1/> para resolução de época inferior a µs.

# text
seg-210f40885a8e = Campo de saída → mapeamento para a norma (CCSDS { "502.0" })

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: --export-oem
# c3: --export-omm
seg-e9dbc25a3ee9 = O que os dois escritores de mensagens de órbita colocam em cada campo ODM (Orbit Data Messages, { "502.0" }) do CCSDS, lido a partir de uma execução de <c1/> com <c2/> e <c3/>:

# text
seg-d2b91c300b82 = Saída do Kshana

# text
seg-119884b009cc = Campo ODM do CCSDS

# text
seg-8b0593f67c7f = Valor / unidade

# text
seg-d33eb162d179 = Metadados do segmento OEM

# text
# c1: EARTH
# c2: TEME
# c3: GPS
seg-4b338284e56a = <c1/> / <c2/> / <c3/> — o referencial em que os propagadores integram e a escala de tempo da grelha de épocas, sem nova etiquetagem

# text
seg-e0a44af9aaf8 = Época de estado do OEM

# text
seg-b0623bab9fcc = primeira coluna de cada linha de dados

# text
seg-410bd5a9ba14 = tempo de calendário ISO-8601 (ISO: International Organization for Standardization), escala de tempo GPS

# text
seg-a7c95802e01a = Posição e velocidade do OEM

# text
# c1: X Y Z X_DOT Y_DOT Z_DOT
seg-0539cafabf60 = colunas de dados <c1/>

# text
seg-8add7e800e0e = km, km/s

# text
seg-8b386548c03c = Metadados do OMM

# text
seg-e2c63414d7c2 = Época do OMM

# text
seg-5109e5948d2a = forma ISO-8601 de dia do ano (a época do TLE)

# text
seg-b74289a29c24 = Elementos médios do OMM

# text
seg-f3492fa95178 = rev/dia, –, graus, 1/raios terrestres

# text
# c1: ephemeris
# c2: jd_utc
# c3: teme_r_m
# c4: teme_v_m_s
# c5: gcrs_r_m
# c6: gcrs_v_m_s
# c7: ecef_r_m
# c8: lat_deg
# c9: lon_deg
# c10: alt_km
seg-fc82185abe10 = O JSON (JavaScript Object Notation) de resultado do tipo de cenário <c1/> transporta o mesmo estado em unidades SI (Sistema Internacional de Unidades) por amostra: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), mais <c8/>, <c9/>, <c10/>.

# text
seg-014d1392018e = Âmbito honesto

# text
# c1: INTEROP.md
seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF e o texto de mensagem de navegação LEO são de <b>leitura e escrita</b>; OMM, CZML, KML e a efeméride STK são <b>escritores</b> (um leitor de OMM e a serialização XML são desenvolvimentos futuros); o GeoJSON é escrito e lido de volta como um percurso; RINEX NAV, RINEX OBS, IONEX, os produtos EOP do IERS e o TLE são <b>leitores</b>; a exportação lunar LunaNet/IOAG é um escritor cujos metadados de tempo fazem ida e volta. <a1><c1/></a1> indica que exportação se aplica a cada cenário incluído.

# text
seg-68b4f5116419 = O mapeamento de campos CCSDS/IGS acima é documentação, e não uma declaração de que qualquer norma seja satisfeita; a avaliação formal face a essas normas (e o registo no catálogo aberto da ESA (European Space Agency) ESSR (European Space Software Repository) / NASA (National Aeronautics and Space Administration)) é acompanhada separadamente e está pendente de revisão.

# text
# c1: xval/anise-frames/
# c2: gcrs_to_itrs_matrix
# c3: VALIDATION.md
seg-e461587ad2cf = A verificação cruzada numérica independente SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — um conjunto de ferramentas de geometria planetária em Rust puro) da redução de referencial é entregue no crate autónomo, excluído do workspace, <c1/>: <c2/> face à rotação GCRF (Geocentric Celestial Reference Frame) → ITRF93 (International Terrestrial Reference Frame { "1993" }) do ANISE, ao longo de oito épocas { "2020" }–{ "2023" }, concorda a ≤ { "0.86" } m à superfície e a ≤ { "3.6" } m na órbita GNSS (ver <a1><c3/></a1>). Precisa de kernels SPICE, pelo que não é uma barreira predefinida da integração contínua (CI).

# text
seg-f6d67027d669 = <s1>Anterior</s1>Mapa de capacidades

# text
seg-01b6270b6c6a = <s1>Seguinte</s1>Cobertura de linhas
