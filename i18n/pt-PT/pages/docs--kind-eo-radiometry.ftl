# docs--kind-eo-radiometry: translations (pt-PT)

# text
seg-99ef7c1d552c = Tipo de cenário do motor v{ $version }, família <a1>Análise de missão, ligações e operações espaciais</a1>. Consultivo: resultados de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado nem um serviço de segurança de vidas. Cada etiqueta aqui é do motor ou da matriz de verificação; um tipo é MODELLED, salvo indicação em contrário da matriz (como se obtém uma etiqueta: a secção Evidence do README).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos (<c1/>))

# text
seg-8f1e7d3f5a07 = Página da família: <a1>Análise de missão, ligações e operações espaciais</a1>

# text
seg-8e62cc4af6ea = Página do tema: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/eo-radiometry.md
seg-841259b04897 = Fonte: <c1/>

# text
# c1: eo-radiometry
seg-1b0ba13fcef1 = <c1/> (tipo de cenário)

# text
seg-816bd5a5808a = Radiometria de imageador no nadir e qualidade de imagem: radiância na abertura de uma cena lambertiana, a equação da câmara, sinal e ruído de disparo/escuro/leitura/quantização e SNR; a MTF do sistema em Nyquist (difração x detector x arrasto x jitter), a resposta relativa de borda a partir dela, Q = lambda F/p e o NIIRS da GIQE versão { "4" } sem compensação de MTF. MODELLED.

# text
# c1: scenarios/eo-radiometry.toml
seg-7d786a7bfb86 = Uma execução de <c1/> resume-se assim: eo-radiometry: GSD { "0.76" } m, Q { "1.06" }, SNR { "39" } (poço { "6" } %), MTF@Nyquist { "0.212" }, RER { "0.573" }, GIQE4 NIIRS { "4.27" } (MODELLED)

# text
# c1: altitude_m
# c2: focal_length_m
# c3: aperture_m
# c4: pixel_pitch_um
# c5: wavelength_um
# c6: bandwidth_um
# c7: fill_factor
# c8: smear_px
# c9: jitter_px_rms
# c10: reflectance
# c11: solar_irradiance_w_m2_um
# c12: sun_zenith_deg
# c13: atmospheric_transmittance
# c14: path_radiance_w_m2_sr_um
# c15: optics_transmittance
# c16: integration_s
# c17: quantum_efficiency
# c18: dark_current_e_s
# c19: read_noise_e
# c20: full_well_e
# c21: adc_bits
seg-3378b7b0716f = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/eo-radiometry.toml
seg-d613181f3fe3 = O exemplo <c1/> define, entre outros:

# text
seg-ffb002276b21 = um

# text
seg-1c15591babed = px

# text
seg-e94f9ad9e6c4 = Rótulo do resultado (o do motor): MODELLED — radiometria de imageador no nadir (cena lambertiana, equação da câmara, ruído de disparo/escuro/leitura/quantização), MTF do sistema em Nyquist (difração x detector x arrasto x jitter), resposta relativa de borda, Q = lambda F/p e NIIRS da GIQE { "4" } sem compensação de MTF; o NIIRS é uma regressão empírica sobre entradas modeladas

# attr:alt
seg-bf7b52f7a01e = O gráfico que o motor gera para scenarios/eo-radiometry.toml, tipo de cenário eo-radiometry

# text
seg-562a7cf2859c = <b>MODELLED</b> Balanço de relação sinal-ruído de imageador no nadir (radiância de cena lambertiana, equação da câmara, ruído de disparo, escuro, de leitura e de quantização), a MTF do sistema em Nyquist como o produto da difração de abertura desobstruída, abertura do detector, arrasto linear e Gaus

# text
seg-dadea618d757 = <b>MODELLED</b> Balanço de relação sinal-ruído de imageador no nadir (radiância de cena lambertiana, equação da câmara, ruído de disparo, escuro, de leitura e de quantização), a MTF do sistema em Nyquist como o prod. Referência independente (InternalConsistency): Formas fechadas: a MTF de difração na metade da frequência de corte, a borda em rampa de um pixel de uma abertura de detector pura (RER { "1" }), a borda de CDF normal de um desfoque gaussiano (RER = erf(0.5/(sigma sqrt { "2" }))), o escalonamento do ruído de disparo e os coeficientes da GIQE { "4" } como publicados (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). O QUE NÃO É: nenhum imageador externo, MTF medida ou imagem classificada foi comparado; a GIQE é uma regressão empírica com a sua

# text
# c1: label
seg-5182b4b0f8d6 = MODELLED — radiometria de imageador no nadir (cena lambertiana, equação da câmara, ruído de disparo/escuro/leitura/quantização), MTF do sistema em Nyquist (difração x detector x arrasto x jitter), resposta relativa de borda, Q = lambda F/p e NIIRS da GIQE { "4" } sem compensação de MTF; o NIIRS é uma regressão empírica sobre entradas modeladas, não uma imagem classificada (resultado <c1/>)

# text
seg-b2f1e6466c2c = Radiometria de imageador no nadir e qualidade de imagem para uma pequena câmara de observação da Terra ILLUSTRATIVE (projeto de nenhum operador): abertura de { "0.40" } m, distância focal de { "3.6" } m (F/9), pixels de { "5.5" } um, a partir de { "500" } km. A execução fornece o balanço de relação sinal-ruído de uma cena de refletância de { "15" } %, a MTF do sistema em Nyquist, a resposta relativa de borda e o NIIRS da GIQE versão { "4" }. MODELLED: o NIIRS é uma regressão empírica avaliada sobre entradas modeladas, n (comentário do ficheiro de cenário, linhas { "1" } a { "5" })

# text
seg-aaf9ed3b0899 = A radiometria de imageadores eletro-óticos, a MTF, a resposta relativa de borda e o NIIRS da GIQE { "4" } são MODELLED, não validados: conferidos contra a sua própria identidade analítica / de forma fechada — deteta erros de transcrição e de coeficientes, mas não é uma referência independente externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-d6c92dc655ab = <s1>Anterior</s1>eo-coverage

# text
seg-a0daef9a496e = <s1>Seguinte</s1>ephemeris
