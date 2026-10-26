# docs--kind-orbit: translations (pt-PT)

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Tipo de cenário do motor v{ $version }, família <a1>Constelações, cobertura e geometria</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-a4f1e7d2041e = Página da família: <a1>Constelações, cobertura e geometria</a1>

# text
seg-be831b52a339 = e mais { "4" } na matriz.

# text
seg-a8d92406e428 = Relógio ótico de rede de estrôncio, meta para uso espacial sigma_y

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Desvio de Allan/modificado/Hadamard + identificação de ruído de lei de potência com ICs de χ². Referência independente (ExternalDataset): NIST SP { "1065" } (Riley) / desvios de referência do Stable32 em NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Crescimento do erro em inércia de forma fechada + holdover até ao limiar; classes de relógios quânticos. Referência independente (ReferenceImpl): Recursão de covariância multipasso de clock_state (conferência cruzada na mesma base de código); o núcleo subjacente de variância de deriva e inversão de holdover é validado externamente contra o scipy (ver 'Clock-holdover coast-variance & threshold inversion'). Os valores de holdover por classe com patamar de ruído vermelho permanecem MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Relógio de Kalman de 3 estados (fase/frequência/deriva) de van Loan, estabilizado por Joseph. Referência independente (ReferenceImpl): KalmanFilter do filterpy { "1.4.5" } (R. Labbe, MIT), com F via scipy.linalg.expm e Q via a matriz em blocos de Van Loan { "1978" } — uma implementação de referência independente que reproduz a trajetória completa do filtro do kshana. Consistência entre implementações: a física do relógio / a calibração de Allan não são validadas externamente, por isso isto permanece MODELLED. Comparação externa { "0.30" }, um achado (permanece MODELLED): em relógios finais do IGS de { "30" } s de { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> χ² auxiliado pelo relógio, RAIM, AGC e SQM fundidos numa figura de mérito de segurança por época. Referência independente (ExternalDataset): parâmetros de cenário do TEXBAT (Humphreys { "2012" }) — caracterização, não vetores fixados. Comparação externa { "0.30" }, um achado (permanece MODELLED): no JammerTest { "2024" } (Bleik; dados GPL-3.0) os monitores em nível de observável (qui-quadrado auxiliado pelo relógio, RAIM, falha de solução) não levantaram alarme em até { "10" } s de nenhum dos { "8" } inícios de spoofing publicados avaliáveis (onde a janela anterior ao início estava limpa, o primeiro alarme veio de { "10.2" } a { "39" } s após o pu

# text
seg-e12f672ae71d = O holdover do relógio sem GNSS é MODELLED, não validado: conferido contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = A estimativa do estado do relógio a bordo é MODELLED, não validada: conferida contra uma implementação separada nesta mesma base de código — independente da unidade sob teste, mas sem autoridade externa. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = A deteção de spoofing é MODELLED, não validada: uma subafirmação é conferida externamente, mas a capacidade inteira compõe peças modeladas, de modo que a capacidade permanece modelada. (matriz de verificação (docs/MODELLED-RATIONALE.md))

# text
seg-d291f20074f0 = <b>VALIDATED</b> Rotação da Terra a partir de uma data juliana UT1 em duas partes no caminho da órbita, de modo que a posição fixa à Terra preserva o microssegundo que uma data num único f64 perde (cerca de { "3e-9" } rad perto de { "2020" }): jd2::gmst82 (GMST da IAU { "1982" }, a convenção TEME, sobre as duas partes), cio:

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo de cenário.

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP a partir da geometria de linha de visada via Q=(HᵀH)⁻¹ com divisão ENU local. Referência independente (ExternalDataset): DOP do gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — biblioteca independente, coincidente a { "1e-6" } relativo

# text
seg-53a78e98af12 = Página do tópico: <a1>SKYLINE.md</a1>

# text
seg-ae15d15bf151 = Página do tema: <a1>LEO-PASS.md</a1>

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } cenários incluídos utilizam este tipo de cenário; os restantes estão em <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/orbit.md
seg-0e3518dc3ddb = Fonte: <c1/>

# text
# c1: orbit
seg-1428025a91e1 = <c1/> (tipo de cenário)

# text
seg-cb4262b66b8f = Disponibilidade GNSS + DOP a partir de uma constelação orbital (Walker / TLE / RINEX).

# text
# c1: scenarios/orbit-rinex.toml
seg-97680b4587c8 = Uma execução de <c1/> resume-se assim: cenário bffc887db977 | 77/361 amostras GNSS nominal | melhor PDOP { "2.53" } pos 2.53m | holdover quântico 0s p95 6.49e-5ns integridade { "1.000" } segurança n/a (sem ataque) | holdover clássico 0s p95 25.0ns integridade { "1.000" } segurança n/a (sem ataque)

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
seg-b3a080b98bd9 = Campos obrigatórios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: sigma_uere_m
# c2: constellations
# c3: epoch
# c4: export_sp3
# c5: export_omm
# c6: export_oem
# c7: skyline
seg-c818cc4f87da = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/orbit-rinex.toml
seg-364139ff447d = O exemplo <c1/> define, entre outros:

# text
seg-d5063dda3971 = Relógio atómico à escala de chip Microchip SA.45s / SA65, sigma_y(1s)

# text
seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

# attr:alt
seg-3b652c0da6de = O gráfico que o motor escreve para scenarios/orbit-rinex.toml, tipo de cenário orbit

# text
seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP a partir da geometria de linha de vista via Q=(HᵀH)⁻¹ com uma separação ENU local Ensaios: <a1>dop_reference.rs</a1>.

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry e check: um Monte Carlo de semente fixa (N = { "20,000" } épocas por geometria, sigma = { "1.5" } m, semente ChaCha8 { "36" } + i) da solução de mínimos quadrados iterada do próprio motor (pvt::solve_spp, pesos unitários, resolvida a partir da posição verdadeira) em Ensaios: <a1>uere_dop_monte_carlo.rs</a1>.

# text
seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: o azimute e a elevação geodésicos (WGS-84) de um satélite a partir de um local em terra, uma tabela de máscara de azimute/elevação interpolada linearmente em azimute com fecho a { "360" } graus, o conjunto visível el Ensaios: <a1>skyline_orekit_oracle.rs</a1>.

# text
seg-d86884be3f98 = <s1>Anterior</s1>optical-atmosphere

# text
seg-da202333ae8d = <s1>Seguinte</s1>passes
