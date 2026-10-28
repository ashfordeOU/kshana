# docs--kind-ephemeris: translations (es)

# text
seg-37d29d8303fe = km

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-c33e3cbba749 = arcsec

# text
seg-11e8c29ecb45 = Tipo de escenario del motor v{ $version }, familia <a1>Constelaciones, cobertura y geometría</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-a4f1e7d2041e = Página de familia: <a1>Constelaciones, cobertura y geometría</a1>

# text
seg-670191cf797f = Página de tema: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-a3697ad561db = Hz

# text
# c1: docs/kinds/by-kind/ephemeris.md
seg-e388fdc74ffa = Fuente: <c1/>

# text
# c1: ephemeris
seg-9860cb88c021 = <c1/> (tipo de escenario)

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Efemérides y traza en tierra: propaga un satélite (TLE→SGP4 u órbita analítica) y emite su estado TEME/GCRS (posición + velocidad), su posición ITRF/ECEF, la latitud/longitud/altitud WGS-84 del punto subsatélite, y por paso el acimut/elevación/distancia de la estación y la velocidad de distancia (Doppler). El satélite procede de un <c1/> o de una <c2/> analítica con su <c3/> (un <c4/> prevalece cuando se dan ambos); con un <c5/>, un <c6/> sustituye a la época propia del TLE como t = { "0" }.

# text
# c1: scenarios/ephemeris.toml
seg-02f2745e0550 = Una ejecución de <c1/> se resume así: scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } samples | alt { "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | speed { "7653" }–{ "7661" } m/s | max el { "25.7" }° peak Doppler { "34.3" } kHz

# text
# c1: tle|orbit+epoch
seg-2ce1ab71e2cc = Campos obligatorios: <c1/>

# text
# c1: step_s
# c2: duration_s
# c3: station
# c4: dut1_s
# c5: xp_arcsec
# c6: yp_arcsec
# c7: carrier_hz
# c8: eop_finals2000a
seg-21dc45b3de59 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/ephemeris.toml
seg-cda81cdb3607 = El ejemplo <c1/> establece, entre otros:

# text
seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

# text
seg-4d208b6c0eb8 = día

# attr:alt
seg-0fd3c58fde09 = El gráfico que escribe el motor para scenarios/ephemeris.toml, tipo de escenario ephemeris

# text
seg-d291f20074f0 = <b>VALIDATED</b> Rotación terrestre a partir de una fecha juliana UT1 en dos partes en la ruta de la órbita, de modo que la posición fija a la Tierra conserva el microsegundo que pierde una fecha en un único f64 (unos { "3e-9" } rad hacia { "2020" }): jd2::gmst82 (GMST de IAU { "1982" }, la convención TEME, sobre las dos partes), cio:

# text
seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell de 6 grados de libertad + perturbaciones, determinación de órbita por lotes/secuencial. Referencia independiente (ExternalDataset): vectores de verificación de SGP4 de AIAA 2006-6753

# text
seg-7cf505668c3c = <b>VALIDATED</b> Precesión-nutación IAU 2006/2000A, GCRS↔ITRS por CIO, escalas de tiempo con segundos intercalares. Referencia independiente (ExternalDataset): vectores de referencia de IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-f19ce44dc0c0 = Página de tema: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

# text
seg-a8ea4ba6e244 = <s1>Anterior</s1>eo-radiometry

# text
seg-971864553611 = <s1>Siguiente</s1>fusion
