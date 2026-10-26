# docs--kind-pvt: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-8e845ce908ee = Tipo de cenário do motor v{ $version }, família <a1>Medições GNSS, posicionamento e integridade</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
seg-f6b7ca020692 = Página da família: <a1>Medições GNSS, posicionamento e integridade</a1>

# text
seg-f4cf8b629797 = Página do tema: <a1>INTEGRITY.md</a1>

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry e check: um Monte Carlo de semente fixa (N = { "20,000" } épocas por geometria, sigma = { "1.5" } m, semente ChaCha8 { "36" } + i) da solução de mínimos quadrados iterada do próprio motor (pvt::solve_spp, pesos unitários, resolvida a partir da posição verdadeira) em Ensaios: <a1>uere_dop_monte_carlo.rs</a1>.

# text
# c1: docs/kinds/by-kind/pvt.md
seg-aab2f85048b7 = Fonte: <c1/>

# text
# c1: pvt
seg-56f864d32367 = <c1/> (tipo de cenário)

# text
seg-b7b67e03f125 = Posicionamento de ponto único com observações reais: resolve a posição de um recetor a partir de um ficheiro de observação RINEX { "3" } e de um ficheiro de navegação por difusão (pseudodistâncias de código, efemérides por difusão, ionosfera Klobuchar, troposfera Saastamoinen/Niell), opcionalmente validado face a uma coordenada de levantamento.

# text
# c1: scenarios/pvt-abmf.toml
seg-79d2a463393d = Uma execução de <c1/> resume-se assim: pvt 55bdd18628e1 | { "11" } sat nav | 2/3 épocas resolvidas | média { "9.0" } sats, PDOP { "1.8" } | erro 3D RMS { "5.74" } m (máx. { "7.12" } m)

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
seg-d76d59644d84 = O gráfico que o motor escreve para scenarios/pvt-abmf.toml, tipo pvt

# text
seg-e6f678eeb384 = <b>MODELLED</b> Filtro de Hatch sem divergência (código sem ionosfera transportado pela portadora sem ionosfera, janela de N épocas, reinício em caso de perda de bloqueio, salto livre de geometria ou lacuna) na montagem de posicionamento de ponto único preciso

# text
seg-5a42823318a8 = <b>VALIDATED</b> Posição de satélite em ECEF a partir dos elementos keplerianos das efemérides por difusão IS-GPS-200 / Galileo-OS / BeiDou-OS, obtida de um registo de navegação RINEX-3 analisado. Referência independente (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos() compilado a partir do código-fonte em C (T. Takasu, BSD-2-Clause) — uma implementação independente de IS-GPS-200/SIS-ICD, alimentada com os mesmos registos de navegação RINEX-3; posição ECEF do satélite coincidente até ~{ "62" } nm. (A interpolação de efemérides precisas SP3 é validada em separado — ver 'Interpolação de efemérides precisas SP3')

# text
seg-51cac2f918e0 = Página do tema: <a1>POSITIONING.md</a1>

# text
seg-8ea056f1d7e0 = <s1>Anterior</s1>passes

# text
seg-d1dc82bbfb73 = <s1>Seguinte</s1>quantum-anomaly-detect
