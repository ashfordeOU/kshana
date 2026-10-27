# docs--real-tle-guide: translations (pt-PT)

# text
seg-a6da23b43f90 = <s1>Seguinte</s1>Campanhas

# text
# c1: docs/REAL_TLE_GUIDE.md
seg-bc9ae2eda129 = Fonte: <c1/>

# text
seg-68b27f011ced = Utilizar TLE reais de constelações

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: tests/fixtures/celestrak/gps-ops_2021-07-28.txt
# c5: scripts/fetch_tles.sh
seg-109e8a920fc2 = O ficheiro <c1/> fornecido já contém <b>TLE reais</b> (conjuntos de elementos de duas linhas): o instantâneo <c2/> do Celestrak da constelação GPS (Global Positioning System) operacional catalogada em 2021-07-28, { "30" } satélites, com <c3/>. Cada satélite é propagado com SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), que está validado face aos vetores oficiais AIAA (American Institute of Aeronautics and Astronautics) 2006-6753. O mesmo instantâneo está incluído como <c4/>, e <c5/> obtém um novo. Leia a secção { "3" } antes de citar um valor de geometria a partir dele: esse cenário propaga cada satélite a partir da sua própria época.

# text
# c1: scenarios/orbit-real-tle.toml
# c2: orbit
# c3: tle
seg-faed28835cb2 = Para um exemplo sintético e autónomo, <c1/> fornece seis satélites do tipo GPS como registos simples de linha 2, propagados como elementos keplerianos analíticos, e todos os cenários <c2/> sem um bloco <c3/> constroem uma constelação Walker.

# text
seg-1c9b96a07f5b = Para estudar a constelação GPS <b>atual</b> (ou qualquer outra), introduza um instantâneo recente.

# text
seg-95bb71044de0 = { "1" }. Descarregar um instantâneo atual

# text
seg-ab93ab55ddd9 = O <a1>Celestrak</a1> redistribui os conjuntos de elementos do catálogo NORAD (North American Aerospace Defense Command), atualizados pelo menos diariamente. Para o GPS:

# text
# c1: galileo
# c2: glo-ops
# c3: beidou
# c4: stations
seg-da7b4b89848b = Outros grupos úteis: <c1/>, <c2/> (GLONASS, o Sistema Global de Navegação por Satélite da Rússia), <c3/>, <c4/> (a ISS, Estação Espacial Internacional, e outras estações tripuladas).

# text
seg-d7fe0dccbc36 = O ficheiro é uma sequência de registos de três linhas (nome, linha { "1" }, linha { "2" }). O analisador do Kshana ignora as linhas de nome, pelo que pode colar o ficheiro tal como está.

# text
seg-c2d6ca2089a1 = { "2" }. Introduza-o num cenário

# text
# c1: tle
seg-6e221c5b640a = Em qualquer cenário de órbita, defina o bloco <c1/> da constelação com o conteúdo do instantâneo:

# text
seg-f2b0e78ef568 = (PRN é o número do código de ruído pseudoaleatório que um satélite GPS transmite.)

# text
seg-976bcb48df94 = Um par linha { "1" } + linha { "2" } é propagado com <b>SGP4/SDP4</b> (termos de arrasto e de espaço profundo); uma linha { "2" } isolada é tratada como elementos médios keplerianos analíticos. Os dois podem ser misturados.

# text
# c1: strict_checksum = true
# c2: false
seg-fa1d59fc7817 = <c1/> rejeita qualquer linha cuja soma de verificação módulo 10 da coluna 69 esteja errada — uma boa verificação de integridade num ficheiro acabado de descarregar. Tem por predefinição <c2/> porque os cenários didáticos sintéticos usam somas de verificação de substituição.

# text
seg-90d3872ebf87 = { "3" }. Notas sobre épocas — leia isto antes de citar um valor de geometria

# text
# c1: parse_propagators
# c2: src/tle.rs
# c3: t
# c4: tsince = t
seg-5e9056a30d53 = O SGP4 propaga cada satélite a partir da <b>sua própria época de TLE</b>, e <c1/> (em <c2/>) devolve apenas propagadores, pelo que o tempo de cenário <c3/> é aplicado como <c4/> a cada satélite de forma independente. Essa é a convenção correta apenas se todos os conjuntos de elementos do ficheiro partilharem uma época.

# text
seg-3d04797ae50e = <b>Um ficheiro de grupo do Celestrak não lhe dá isso.</b> O ficheiro é <em>descarregado</em> num único instante, mas o conjunto de elementos de cada satélite é atualizado com a sua própria cadência, pelo que as épocas no seu interior estão distribuídas por dias. Medido nos conjuntos incluídos neste repositório (linha { "1" }, colunas { "19" }–{ "32" }):

# text
seg-5f67557dd207 = ficheiro de teste

# text
seg-ce4855643f31 = conjuntos

# text
seg-49a5b4798be4 = dispersão das épocas

# text
seg-b758a9b7ee02 = { "70.6" } h

# text
seg-79e6ea88957c = { "76.4" } h

# text
seg-e1e30f69fa4f = { "335.7" } h

# text
# c1: orbit
# c2: integrity
seg-9d38cc073c94 = { "70.6" } h correspondem a { "5.9" } revoluções GPS. Propagado tal como está, o faseamento no plano fica baralhado: os satélites estão nas altitudes e inclinações certas, mas não onde estavam em nenhum dia concreto, pelo que o conjunto visível, o DOP (diluição da precisão) e qualquer disponibilidade calculada a partir deles descrevem uma constelação que nunca existiu. Nada no analisador mede esta dispersão por si, e os tipos de cenário <c1/> e <c2/> não alinham épocas: um bloco TLE num cenário é sempre propagado com a época de cada satélite.

# text
# c1: tsince
# c2: Tle::epoch_days_1950
# c3: tests/igs_real_data.rs
# c4: real_gps_tle_snapshot
seg-fa82a18e4418 = <b>Faça antes isto.</b> Guarde a época junto do propagador, escolha um instante de referência e desloque o <c1/> de cada satélite para esse instante. <c2/> é público, pelo que o ciclo de análise é curto; <c3/> (<c4/>) é o exemplo trabalhado nesta árvore:

# text
# c1: tests/igs_real_data.rs
# c2: teme_to_ecef
seg-78092818695e = TEME é o referencial de equador verdadeiro e equinócio médio em que o SGP4 trabalha; <c1/> roda-o para coordenadas fixas à Terra com <c2/>.

# text
seg-78f483dfc3fa = Se não alinhar, diga-o ao comunicar o valor: é uma afirmação sobre <em>camadas</em> orbitais, não sobre um céu real.

# text
# c1: tests/araim_dual_real_data.rs
seg-34fddbd3d57f = A importância disto é medida em <c1/>, que aplica os mesmos desfasamentos (instante de referência: a época mais recente nos ficheiros de teste GPS + Galileo combinados, 2026-06-07T07:{ "21" }:{ "04" } UTC (Tempo Universal Coordenado)) numa execução de disponibilidade ARAIM (monitorização autónoma avançada da integridade pelo recetor) de dupla constelação durante { "24" } h. Com um VAL (limite de alerta vertical) de { "12" } m, o céu alinhado dá { "0.993" } só com GPS, { "1.000" } com GPS+Galileo combinados e { "0.990" } com a dupla robusta a falhas de constelação; a convenção não alinhada com a época de cada satélite dá { "0.208" }, { "0.671" } e { "0.031" } para as mesmas entradas — uma conclusão diferente, não um pequeno erro.

# text
# c1: README.md
seg-49f6c8f71d99 = <a1><c1/></a1> — os cenários de órbita.

# text
# c1: SCENARIOS.md
# c2: orbit
# c3: integrity
# c4: gnss-sim
# c5: jamming
# c6: constellation-design
# c7: constellation
# c8: ephemeris
# c9: tle
seg-c842884cb3e7 = <a1><c1/></a1> — os campos do tipo de cenário <c2/>; os tipos de cenário <c3/>, <c4/>, <c5/> e <c6/> usam a mesma tabela <c7/>, e <a2><c8/></a2> usa um único <c9/>.

# text
# c1: INTEGRITY.md
seg-a2c5db6dcf42 = <a1><c1/></a1> — o motor ARAIM que o teste com céu real executa.

# text
# c1: src/tle.rs
# c2: parse_propagators
# c3: ParseOpts { strict_checksum }
seg-106047488885 = <c1/> — o analisador (<c2/>, <c3/>).

# text
seg-c9068c1bc579 = <s1>Anterior</s1>Esquema de resultados
