# docs--kind-ephemeris: translations (pt-PT)

# text
seg-37d29d8303fe = km

# text
seg-3068552e4ab4 = VALIDATED: as linhas da <a1>matriz de verificação</a1> que nomeiam este tipo.

# text
seg-c33e3cbba749 = arcsec

# text
seg-11e8c29ecb45 = Tipo de cenário do motor v{ $version }, família <a1>Constelações, cobertura e geometria</a1>. Consultivo: resultado de análise de uma ferramenta de investigação e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Cada rótulo aqui é do motor ou da matriz de verificação; um tipo de cenário é MODELLED salvo indicação em contrário da matriz (como se obtém um rótulo: a secção Evidence do README).

# text
seg-a4f1e7d2041e = Página da família: <a1>Constelações, cobertura e geometria</a1>

# text
seg-670191cf797f = Página do tópico: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-a3697ad561db = Hz

# text
# c1: docs/kinds/by-kind/ephemeris.md
seg-e388fdc74ffa = Fonte: <c1/>

# text
# c1: ephemeris
seg-9860cb88c021 = <c1/> (tipo de cenário)

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Efemérides e traço no solo: propaga um satélite (TLE→SGP4 ou órbita analítica) e emite o seu estado TEME/GCRS (posição + velocidade), a posição ITRF/ECEF, latitude/longitude/altitude subsatélite WGS-84 e, a cada passo, azimute/elevação/distância da estação + taxa de variação da distância (Doppler). O satélite vem de um <c1/> ou de uma <c2/> analítica com a sua <c3/> (um <c4/> prevalece quando ambos são dados); com um <c5/>, um <c6/> substitui a própria época do TLE como t = { "0" }.

# text
# c1: scenarios/ephemeris.toml
seg-02f2745e0550 = Uma execução de <c1/> resume-se assim: cenário 0d4dd01b3160 | sgp4 (TLE) | { "559" } amostras | alt { "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | velocidade { "7653" }–{ "7661" } m/s | el máx. { "25.7" }° Doppler de pico { "34.3" } kHz

# text
# c1: tle|orbit+epoch
seg-2ce1ab71e2cc = Campos obrigatórios: <c1/>

# text
# c1: step_s
# c2: duration_s
# c3: station
# c4: dut1_s
# c5: xp_arcsec
# c6: yp_arcsec
# c7: carrier_hz
# c8: eop_finals2000a
seg-21dc45b3de59 = Campos opcionais: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/ephemeris.toml
seg-cda81cdb3607 = O exemplo <c1/> define, entre outros:

# text
seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

# text
seg-4d208b6c0eb8 = dia

# attr:alt
seg-0fd3c58fde09 = O gráfico que o motor gera para scenarios/ephemeris.toml, tipo de cenário ephemeris

# text
seg-d291f20074f0 = <b>VALIDATED</b> Rotação da Terra a partir de uma data juliana UT1 em duas partes no caminho da órbita, de modo que a posição fixa à Terra preserva o microssegundo que uma data num único f64 perde (cerca de { "3e-9" } rad perto de { "2020" }): jd2::gmst82 (GMST da IAU { "1982" }, a convenção TEME, sobre as duas partes), cio:

# text
seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell 6-DOF + perturbações, OD em lote/sequencial. Referência independente (ExternalDataset): vetores de verificação do SGP4 do AIAA 2006-6753

# text
seg-7cf505668c3c = <b>VALIDATED</b> Precessão-nutação IAU 2006/2000A, GCRS↔ITRS pelo CIO, escalas de tempo com segundos intercalares. Referência independente (ExternalDataset): vetores de referência IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-f19ce44dc0c0 = Página do tópico: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

# text
seg-a8ea4ba6e244 = <s1>Anterior</s1>eo-radiometry

# text
seg-971864553611 = <s1>Seguinte</s1>fusion
