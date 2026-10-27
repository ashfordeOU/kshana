# docs--kind-pvt: translations (pt-BR)

# text
seg-debc2f07db78 = true

# text
seg-8e845ce908ee = Tipo de cenário do motor v{ $version }, família <a1>Medições GNSS, posicionamento e integridade</a1>. Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Todo rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED a menos que a matriz diga outra coisa (como um rótulo é obtido: a seção Evidence do README).

# text
seg-f6b7ca020692 = Página da família: <a1>Medições GNSS, posicionamento e integridade</a1>

# text
seg-f4cf8b629797 = Página do tópico: <a1>INTEGRITY.md</a1>

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry e check: um Monte Carlo com semente (N = { "20,000" } épocas por geometria, sigma = { "1.5" } m, semente ChaCha8 { "36" } + i) da própria solução iterada de mínimos quadrados do motor (pvt::solve_spp, pesos unitários, resolvida a partir da posição verdadeira) sobre Testes: <a1>uere_dop_monte_carlo.rs</a1>.

# text
# c1: docs/kinds/by-kind/pvt.md
seg-aab2f85048b7 = Fonte: <c1/>

# text
# c1: pvt
seg-56f864d32367 = <c1/> (tipo de cenário)

# text
seg-b7b67e03f125 = Posicionamento de ponto único com observações reais: resolve a posição de um receptor a partir de um arquivo de observação RINEX { "3" } e de um arquivo de navegação por difusão (pseudodistâncias de código, efemérides de difusão, ionosfera de Klobuchar, troposfera de Saastamoinen/Niell), opcionalmente validado contra uma coordenada levantada.

# text
# c1: scenarios/pvt-abmf.toml
seg-79d2a463393d = Uma execução de <c1/> resume-se assim: pvt 55bdd18628e1 | { "11" } sat nav | 2/3 epochs solved | mean { "9.0" } sats, PDOP { "1.8" } | 3D error RMS { "5.74" } m (max { "7.12" } m)

# text
# c1: obs_rinex
# c2: nav_rinex
seg-fd22bc5c2b67 = Campos obrigatórios: <c1/>, <c2/>

# text
# c1: truth_ecef
# c2: apriori_ecef
# c3: mask_deg
# c4: dual_frequency
seg-4b39ee73d65d = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/pvt-abmf.toml
seg-4f02bdcbc7c7 = O exemplo <c1/> define, entre outros:

# text
seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

# text
seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

# text
seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

# attr:alt
seg-d76d59644d84 = O gráfico que o motor escreve para scenarios/pvt-abmf.toml, tipo de cenário pvt

# text
seg-e6f678eeb384 = <b>MODELLED</b> Filtro de Hatch sem divergência (código livre de ionosfera carregado pela portadora livre de ionosfera, janela de N épocas, reinício em perda de sincronismo, salto livre de geometria ou lacuna) na montagem de posicionamento de ponto único preciso

# text
seg-5a42823318a8 = <b>VALIDATED</b> Posição de satélite em ECEF a partir das efemérides de difusão IS-GPS-200 / Galileo-OS / BeiDou-OS (elementos keplerianos → ECEF), a partir de um registro de navegação RINEX-3 analisado. Referência independente (ExternalDataset): eph2pos() do RTKLIB v2.4.2-p13 compilado a partir do código-fonte em C (T. Takasu, BSD-2-Clause) — uma implementação independente do IS-GPS-200/SIS-ICD, alimentada com os mesmos registros de navegação RINEX-3; a posição ECEF do satélite coincide a ~{ "62" } nm. (A interpolação de efemérides precisas SP3 é validada separadamente — ver 'SP3 precise-ephemeris interpolation')

# text
seg-51cac2f918e0 = Página do tema: <a1>POSITIONING.md</a1>

# text
seg-8ea056f1d7e0 = <s1>Anterior</s1>passes

# text
seg-d1dc82bbfb73 = <s1>Próximo</s1>quantum-anomaly-detect
