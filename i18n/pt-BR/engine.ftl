# SPDX-License-Identifier: AGPL-3.0-only
# pt-BR catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = formato de registro de relógio { $other } desconhecido; esperado um de { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = política de lacunas { $other } desconhecida; esperado refuse, longest ou linear

engine-e-clock-log-give-either-the-log-text = informe o texto do registro ou o seu caminho, não ambos

engine-e-clock-log-clock-log-needs-its-text = um registro de relógio exige seu texto ou um caminho

engine-e-clock-log-tau0-must-be-finite-and = tau0_s deve ser finito e > 0 (recebido { $t })

engine-e-clock-log-units-and-data-apply-to = units e data se aplicam apenas ao formato timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel se aplica apenas ao formato ticc

engine-e-clock-log-cannot-read-clock-log = não foi possível ler o registro de relógio { $path }: { $e }

engine-e-clock-log-clock-log-path-is-not = um caminho de registro de relógio não está disponível na build WebAssembly; informe o registro como texto

engine-e-clock-log-the-log-has-missing-epoch =
    { $n_missing ->
        [one]
            { $n_gaps ->
                [one] o registro { $format } tem { $n_missing } época ausente em { $n_gaps } lacuna em uma grade de { $tau0 } s; defina gaps = "longest" para manter a sequência contínua mais longa ou gaps = "linear" para interpolar
                [many] o registro { $format } tem { $n_missing } época ausente em { $n_gaps } de lacunas em uma grade de { $tau0 } s; defina gaps = "longest" para manter a sequência contínua mais longa ou gaps = "linear" para interpolar
               *[other] o registro { $format } tem { $n_missing } época ausente em { $n_gaps } lacunas em uma grade de { $tau0 } s; defina gaps = "longest" para manter a sequência contínua mais longa ou gaps = "linear" para interpolar
            }
        [many]
            { $n_gaps ->
                [one] o registro { $format } tem { $n_missing } de épocas ausentes em { $n_gaps } lacuna em uma grade de { $tau0 } s; defina gaps = "longest" para manter a sequência contínua mais longa ou gaps = "linear" para interpolar
                [many] o registro { $format } tem { $n_missing } de épocas ausentes em { $n_gaps } de lacunas em uma grade de { $tau0 } s; defina gaps = "longest" para manter a sequência contínua mais longa ou gaps = "linear" para interpolar
               *[other] o registro { $format } tem { $n_missing } de épocas ausentes em { $n_gaps } lacunas em uma grade de { $tau0 } s; defina gaps = "longest" para manter a sequência contínua mais longa ou gaps = "linear" para interpolar
            }
       *[other]
            { $n_gaps ->
                [one] o registro { $format } tem { $n_missing } épocas ausentes em { $n_gaps } lacuna em uma grade de { $tau0 } s; defina gaps = "longest" para manter a sequência contínua mais longa ou gaps = "linear" para interpolar
                [many] o registro { $format } tem { $n_missing } épocas ausentes em { $n_gaps } de lacunas em uma grade de { $tau0 } s; defina gaps = "longest" para manter a sequência contínua mais longa ou gaps = "linear" para interpolar
               *[other] o registro { $format } tem { $n_missing } épocas ausentes em { $n_gaps } lacunas em uma grade de { $tau0 } s; defina gaps = "longest" para manter a sequência contínua mais longa ou gaps = "linear" para interpolar
            }
    }


engine-e-clock-log-the-log-yields-usable-sample = o registro { $format } fornece { $x } amostra(s) utilizável(is); são necessárias ao menos 3

engine-e-clock-log-not-rinex-clock-file-no = não é um arquivo de relógio RINEX: nenhum registro END OF HEADER

engine-e-clock-log-the-rinex-clock-file-has = o arquivo de relógio RINEX não tem registros AS nem AR

engine-e-clock-log-the-rinex-clock-file-holds = o arquivo de relógio RINEX contém { $many } relógios; indique um com clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = nenhum registro AS nem AR para o relógio { $id }

engine-e-clock-log-the-clock-has-single-epoch = o relógio tem uma única época; não é possível determinar tau0

engine-e-clock-log-the-log-has-no-readings = o registro { $format } não tem leituras

engine-e-clock-log-unknown-phase-unit-expected-ms = unidade de fase { $other } desconhecida; esperado s, ms, us, ns ou ps

engine-e-clock-log-timelab-line-has-column-the = a linha { $v1 } do TimeLab tem { $v } coluna(s); a primeira linha de dados tem { $first }

engine-e-clock-log-timelab-line-has-columns-one = a linha { $v1 } do TimeLab tem { $v } colunas; lê-se uma (valor) ou duas (tempo valor)

engine-e-clock-log-timelab-line-is-not-numeric = a linha { $v1 } do TimeLab não é numérica: { $l }

engine-e-clock-log-the-timelab-log-has-no = o registro timelab não tem leituras

engine-e-clock-log-unknown-data-expected-phase-or = data { $other } desconhecido; esperado phase ou frequency

engine-e-clock-log-tau0-header-is-not-positive = o cabeçalho tau0 { $v } não é um número positivo de segundos

engine-e-clock-log-frequency-data-is-fractional-frequency = os dados de frequência são frequência fracionária; suas unidades só podem ser 1

engine-e-clock-log-two-column-frequency-logs-are = registros de frequência de duas colunas não são lidos; informe a frequência como uma única coluna com tau0

engine-e-clock-log-unknown-time-units-expected-or = time_units { $o } desconhecido; esperado s ou mjd

engine-e-clock-log-the-timelab-log-time-column = a coluna de tempo do registro timelab deve ser crescente

engine-e-clock-log-single-reading-tau0-cannot-be = uma única leitura; não é possível determinar tau0

engine-e-clock-log-the-timelab-log-has-non = o registro timelab tem { $non_finite } leitura(s) não finita(s)

engine-e-clock-log-the-ticc-log-holds-channels = o registro TICC contém os canais { $many }; indique um com channel = "..."

engine-e-clock-log-no-readings-on-channel-found = nenhuma leitura no canal { $channel } (encontrado: { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = as linhas do modo de intervalo do TICC não trazem tempo; informe tau0_s (o período do evento)

engine-e-clock-log-the-readings-do-not-increase = as leituras de { $channel } não são crescentes, portanto não são carimbos de tempo (a saída do modo Period do TICC não é lida; use o modo Timestamp)

engine-e-clock-log-single-time-stamp-tau0-cannot = um único carimbo de tempo; não é possível determinar tau0

engine-e-clock-log-two-time-stamps-apart-under = dois carimbos de tempo { $channel } separados por { $w } s, menos da metade de tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = os carimbos de tempo { $format } de { $clock } retrocedem (um daemon reiniciado ou um salto de relógio); divida o registro e leia cada parte

engine-e-clock-log-the-log-has-no-readings-2 = o registro não tem leituras { $what }

engine-e-clock-log-the-log-holds-sources-name = o registro contém { $many } fontes; indique uma com { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = nenhuma leitura { $what } para { $id } (encontrado: { $names })

engine-e-clock-log-the-servo-of-never-reached = o servo de { $id } nunca atingiu o estado travado s2

engine-e-clock-log-the-log-has-no-chrony = o registro não tem leituras de rastreamento do chrony

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = a taxa de amostragem { $fs_hz } Hz não é um número inteiro de amostras por milissegundo

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms e noncoherent devem ser positivos

engine-e-acquisition-the-doppler-grid-needs-positive = a grade Doppler exige um passo positivo e um máximo não negativo

engine-e-acquisition-pfa-must-lie-in = pfa deve estar em (0, 1)

engine-e-acquisition-samples-supplied-needed = { $samples } amostras fornecidas, { $needed } necessárias

engine-e-acquisition-empty-doppler-grid = grade Doppler vazia

engine-e-acquisition-the-samples-carry-no-power = as amostras não têm potência

## src/adm.rs

engine-e-adm-unknown-attitude-type = ATTITUDE_TYPE { $s } desconhecido

engine-e-adm-an-aem-needs-at-least = um AEM exige ao menos um segmento

engine-e-adm-segment-is-not-version-attitude = segmento { $i }: { $t } não é um tipo de atitude da versão { $version }

engine-e-adm-segment-values-for = segmento { $i }: { $values } valores para { $t }

engine-e-adm-aem-version-has-no-ndm = a versão 1.0 do AEM não tem forma NDM/XML aqui; escreva KVN

engine-e-adm-this-attitude-type-has-no = este tipo de atitude não tem forma na versão 2.0

engine-e-adm-expected-meta-start-found = esperado META_START, encontrado { $l }

engine-e-adm-meta-start-without-meta-stop = META_START sem META_STOP

engine-e-adm-unexpected-metadata-line = linha de metadados { $other } inesperada

engine-e-adm-in-version-aem = { $att } em um AEM de versão { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = esperado DATA_START após META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START sem DATA_STOP

engine-e-adm-empty-data-line = linha de dados vazia

engine-e-adm-values-on-line = { $vals } valores em uma linha { $att }: { $b }

engine-e-adm-unexpected-data-line = linha de dados { $other } inesperada

engine-e-adm-attitude-type-has-no-xml = o tipo de atitude não tem forma XML

engine-e-adm-message-without-version-attribute = mensagem sem atributo de versão

engine-e-adm-expected-found = esperado { $vers_key }, encontrado { $other }

engine-e-adm-header-without-creation-date-or = cabeçalho sem CREATION_DATE ou ORIGINATOR

engine-e-adm-missing = { $k } ausente

engine-e-adm-unexpected-keyword = palavra-chave { $k } inesperada

engine-e-adm-spin-block-holds-nutation-or = um bloco de rotação própria contém dados de nutação ou de momento, não ambos

engine-e-adm-unexpected-apm-keyword = palavra-chave APM { $other } inesperada

engine-e-adm-unexpected-apm-line = linha APM { $b } inesperada

engine-e-adm-without = { $b } sem { $stop }

engine-e-adm-unexpected-line-in = linha inesperada em { $b }: { $other }

engine-e-adm-incomplete-group = grupo { $keys } incompleto

engine-e-adm-unknown-apm-block-start = bloco APM { $other }_START desconhecido

engine-e-adm-apm-metadata-needs-object-name = os metadados APM exigem OBJECT_NAME, OBJECT_ID e TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM sem EPOCH

engine-e-adm-rotation-axis = eixo de rotação { $o }

engine-e-adm-values-for = { $values } valores para { $t }

engine-e-adm-euler-record-without-euler-rot = registro de Euler sem EULER_ROT_SEQ

engine-e-adm-rotation-sequence = sequência de rotação { $seq }

engine-e-adm-epoch-has-no = a época { $s } não tem 'T'

engine-e-adm-epoch-date = data da época { $date }

engine-e-adm-epoch-time = hora da época { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = “{ $s }” (texto tal como indicado no documento)

engine-advanced-report-mean-5th-to-95th-percentile = média { $fmt_num } (percentil 5 a 95: { $fmt_num2 } a { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = esquema de unidades de campo: entrada units `{ $key }`

engine-advanced-report-field-units-schema-input-entry = esquema de unidades de campo: entrada input `{ $key }`, associada pelo nome do campo

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } linha de uma coluna não numérica
        [many] { $n } de linhas de uma coluna não numérica
       *[other] { $n } linhas de uma coluna não numérica
    }


engine-advanced-report-rows-from-to = { $nums } linhas, de { $fmt_num } a { $fmt_num2 }

engine-advanced-report-phase-ended-by = fase { $name } (encerrada por { $ended })

engine-advanced-report-result-timeline-phases = resultado `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = transferência para a fase { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = resultado `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = entrada de cenário `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = comentário do arquivo de cenário, linha { $start }

engine-advanced-report-scenario-file-comment-lines-to = comentário do arquivo de cenário, linhas { $start } a { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } é MODELLED, não verificado frente a uma referência externa independente: { $it }.

engine-advanced-report-sweep-of-scale = Varredura de { $param } (escala { $str_of })

engine-e-advanced-report-the-result-document-is-not = o documento de resultado não é JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = o cenário não é TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Distribuição Monte Carlo de { $metric }

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-recorded-at-build-time-from = registrado em tempo de compilação a partir da variável de ambiente { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = não registrado: este motor foi compilado sem a variável de ambiente { $GIT_COMMIT_ENV }; a versão do motor identifica o lançamento

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (a impressão digital do cenário calculada pelo próprio tipo; não o digest do arquivo)

engine-advanced-report-input-file = Arquivo de entrada { $path }

engine-advanced-report-study-generated = { " " }Estudo gerado { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = linha EMAG2 { $v1 }: esperadas 8 colunas separadas por vírgulas, encontradas { $p }

engine-e-altpnt-maps-emag2-line-bad = linha EMAG2 { $v1 }: { $what } `{ $p }` inválido

engine-e-altpnt-maps-emag2-line-non-finite-value = linha EMAG2 { $v1 }: valor não finito

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: nenhuma linha de dados

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: { $rows } linhas não preenchem a malha de { $n_lat } x { $n_lon } que abrangem

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: nó duplicado em { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = o passo da grade deve ser finito e positivo, recebido { $step }

engine-e-altpnt-maps-grid-box-must-have-north = a caixa da grade deve ter norte > sul e leste > oeste, recebido [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = uma grade de { $n_lat } x { $n_lon } nós é grande demais

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: o eixo { $what } exige ao menos 2 valores distintos

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: o eixo { $what } não é regular ({ $w } a { $w2 } contra um passo médio de { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = o sigma de erro deve ser finito e não negativo, recebido { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = o comprimento de correlação deve ser finito e positivo, recebido { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side deve ser >= 2, recebido { $n }

engine-e-altpnt-terrain-srtm-hgt-length = comprimento do SRTM .hgt { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = uma janela .hgt exige ao menos 2 x 2 amostras, recebido { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = o passo deve ser finito e positivo, recebido { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = comprimento da janela { "." }hgt { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: coluna magnetic_grid `{ $other }` desconhecida (use "sealevel" ou "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: não foi possível ler magnetic_grid csv_path { $csv_path }: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = formato de animação '{ $other }' desconhecido; esperado svg, html, frames ou all

engine-e-animation-no-animation-format-given-expected = nenhum formato de animação informado; esperado svg, html, frames ou all

engine-e-animation-animation-fps-must-be-between = os fps da animação devem estar entre 1 e 60, recebido { $fps }

engine-e-animation-animation-duration-must-be-between = a duração da animação deve estar entre 0.5 s e 600 s, recebido { $duration_s }

engine-e-animation-animation-width-must-be-between = a largura da animação deve estar entre 480 e 3840 pixels, recebido { $width }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] duração x fps resulta em { $n } quadro; a sequência de quadros exige entre 2 e { $v1 }
        [many] duração x fps resulta em { $n } de quadros; a sequência de quadros exige entre 2 e { $v1 }
       *[other] duração x fps resulta em { $n } quadros; a sequência de quadros exige entre 2 e { $v1 }
    }


engine-e-animation-result-is-not-json = o resultado não é JSON: { $e }

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-mission-time = tempo de missão ({ $lay })

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (requer um ffmpeg compilado com librsvg; caso contrário, rasterize antes os quadros)

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-animation-further-series-were-found-but = { " " }Foram encontradas { $omitted } séries adicionais que não foram desenhadas (o player exibe no máximo { $MAX_CHARTS } painéis de { $MAX_TRACES } traços); elas estão listadas no manifesto da exportação frames.

## src/antenna.rs

engine-antenna-altitude-beamwidth-deg-points = altitude { $a_lo }-{ $a_hi } m x largura de feixe { $b_lo }-{ $b_hi } deg, { $points } pontos

engine-antenna-limb-capture-is-reached-on = a captura do limbo É atingida nesta grade ({ $grid }): { $points } de { $points2 } pontos de operação amostrados capturam o limbo e { $crossings } cruzamento(s) de eixo foram localizados; o maior J/S de limbo amostrado é { $limb_js_db } dB na altitude { $altitude_m } m / largura de feixe { $hpbw_deg } deg, em relação a um limiar de captura de { $thr } dB.

engine-antenna-limb-capture-is-not-reached = a captura do limbo NÃO é atingida em nenhum ponto desta grade ({ $grid }): não é captura nula, mas ausência de captura do limbo; o melhor J/S de limbo é { $limb_js_db } dB na altitude { $altitude_m } m / largura de feixe { $hpbw_deg } deg, { $shortfall } dB abaixo do limiar de captura de { $thr } dB; esse ponto de operação capturaria o limbo com uma potência de transmissão de { $limb_capture_tx_power_dbw } dBW, em relação aos { $p_tx_dbw } dBW em voo.

engine-e-antenna-azimuths-must-strictly-increase = os azimutes devem ser estritamente crescentes

engine-e-antenna-azimuths-must-span-less-than = os azimutes devem abranger menos de 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = os ângulos fora do eixo devem ser estritamente crescentes

engine-e-antenna-gain-grid-does-not-match = a grade de ganho não corresponde aos eixos

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = os ganhos K e P devem ser finitos e positivos

engine-e-aocs-at-least-three-reaction-wheels = são necessárias ao menos três rodas de reação

engine-e-aocs-wheel-spin-axis-must-be = roda { $i }: o eixo de rotação deve ser um vetor unitário

engine-e-aocs-wheel-js-and-max-must = roda { $i }: js e u_max devem ser finitos e positivos

engine-e-aocs-the-wheel-spin-axes-do = os eixos de rotação das rodas não geram um espaço de três dimensões

engine-e-aocs-inertia-minus-the-wheels-spin = a inércia menos a inércia de rotação das rodas deve ser definida positiva

engine-e-aocs-inertia-must-be-finite-and = a inércia deve ser finita e simétrica

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis deve ser um vetor finito não nulo

engine-e-aocs-kind-must-be-finite-and-positive = { $n } deve ser finito e positivo

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s deve resultar em no máximo 2e6 passos

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s deve ser um múltiplo inteiro de dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 e omega0_rad_s devem ser finitos

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm deve ser finito

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s deve ser finito

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s deve ser no mínimo dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg =
    { $n_w ->
        [one] aocs: { $n_w } roda, manobra de { $duration_s } s a partir de { $series_err } deg -> { $settle } | final { $final_err } deg | pico de roda { $peak_speed } rpm | { $v7 }
        [many] aocs: { $n_w } de rodas, manobra de { $duration_s } s a partir de { $series_err } deg -> { $settle } | final { $final_err } deg | pico de roda { $peak_speed } rpm | { $v7 }
       *[other] aocs: { $n_w } rodas, manobra de { $duration_s } s a partir de { $series_err } deg -> { $settle } | final { $final_err } deg | pico de roda { $peak_speed } rpm | { $v7 }
    }


## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = serviço '{ $other }' desconhecido (esperado navigation|nav ou communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = política de arbitragem '{ $other }' desconhecida (esperado navigation-priority, communications-priority ou first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = um plano de contatos exige ao menos uma janela de contato

engine-e-aperture-duty-apertures-must-be = apertures deve ser >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = o horizonte de relatório deve ser finito

engine-e-aperture-duty-contact-has-non-finite-aos = o contato '{ $name }' tem aos_s ou los_s não finito

engine-e-aperture-duty-contact-must-have-los-aos = o contato '{ $name }' deve ter los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = um plano de contatos exige ao menos uma janela [[contacts]]

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: { $sessions } sessão(ões) em { $apertures } abertura(s) sob { $policy } -> ocupação de navegação { $navigation_duty }, ocupação de comunicações { $communications_duty }, ociosidade { $idle_duty }; { $total_outage_s } s de { $total_requested_s } s solicitados perdidos por disputa (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Estudo gerado { $html_escape }.

engine-e-api-failed-to-serialise-report-to = falha ao serializar o relatório em JSON: { $e }

engine-e-api-invalid-scenario = cenário inválido: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-unknown-scenario-kind-did-you =
    { $n ->
        [one] tipo de cenário { $other } desconhecido — seria { $hint }? `kshana kinds` lista { $n } tipo integrado.
        [many] tipo de cenário { $other } desconhecido — seria { $hint }? `kshana kinds` lista todos os { $n } de tipos integrados.
       *[other] tipo de cenário { $other } desconhecido — seria { $hint }? `kshana kinds` lista todos os { $n } tipos integrados.
    }


engine-api-unknown-scenario-kind-kshana-kinds =
    { $n ->
        [one] tipo de cenário { $other } desconhecido. `kshana kinds` lista { $n } tipo integrado.
        [many] tipo de cenário { $other } desconhecido. `kshana kinds` lista todos os { $n } de tipos integrados.
       *[other] tipo de cenário { $other } desconhecido. `kshana kinds` lista todos os { $n } tipos integrados.
    }


engine-api-required-fields = - **Campos obrigatórios:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Campos opcionais:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = erro de análise de TOML: { $e }

engine-api-could-not-classify-scenario-kind = não foi possível determinar o tipo de cenário: { $e }

engine-api-missing-required-field = { $kind_name }: campo(s) obrigatório(s) ausente(s) — { $options }

engine-api-missing-required-field-2 = { $kind_name }: campo obrigatório "{ $entry }" ausente

engine-e-api-invalid-orbit-scenario = cenário de órbita inválido: { $e }

engine-e-api-sp3-export-requires-an-orbit = a exportação SP3 exige um cenário de órbita, não '{ $k }'

engine-e-api-omm-export-requires-an-orbit = a exportação OMM exige um cenário de órbita, não '{ $k }'

engine-e-api-oem-export-requires-an-orbit = a exportação OEM exige um cenário de órbita, não '{ $k }'

engine-e-api-invalid-scenario-toml = TOML de cenário inválido: { $e }

engine-e-api-could-not-re-serialise-scenario = não foi possível serializar novamente o cenário: { $e }

engine-api-scenario-jamming-availability-under-jamming = cenário { $r } | jamming { $v2 } | disponibilidade sob jamming { $availability_under_jamming } (nominal { $availability_nominal }) | rastreamento mín. { $min_tracking } | J/S médio { $v6 }

engine-e-api-the-result-document-already-carries = o documento de resultado já contém `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = falha ao serializar figure_tiers: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = cenário { $label } inválido: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = cenário { $r } | holdover quântico { $holdover_s }s p95 { $pos_p95_m }m | holdover clássico { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = cenário { $r } | spoofing { $scn } contra especificação de { $threshold_ns } ns (P_fa { $target_pfa }) | segurança quântica { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | segurança clássica { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] integridade | { $n_sats } satélite | { $samples_available }/{ $samples_total } épocas disponíveis ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } eventos de integridade, { $report3 } HMI
        [many] integridade | { $n_sats } de satélites | { $samples_available }/{ $samples_total } épocas disponíveis ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } eventos de integridade, { $report3 } HMI
       *[other] integridade | { $n_sats } satélites | { $samples_available }/{ $samples_total } épocas disponíveis ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): { $report2 } eventos de integridade, { $report3 } HMI
    }


engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | polo sul | { $samples_available }/{ $samples_total } épocas disponíveis ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | taxa secular LTC−TT { $secular_rate_us_per_day } µs/day (faixa { $band_low }–{ $band_high }) | autopotencial { $self_potential_us_per_day } cinético { $kinetic_us_per_day } | deslocamento @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | linha de base { $baseline_km } km | distância até o farol { $beacon_range_km } km | atraso { $report } µs (taxa { $delay_rate_s_per_s } s/s) | campo próximo { $near_field_correction_us } µs | { $samples } amostras em { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats =
    { $n_sat ->
        [one]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satélite, { $n_earth } estação terrestre | erro 3-D da estação com VLBI { $station_pos_err_m } m contra apenas distância { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× mais preciso) | posição do satélite RMS { $sat_pos_rms_m } m | erro de relógio da estação { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parâmetros
                [many] lunar-joint-od-clock | { $n_sat } satélite, { $n_earth } de estações terrestres | erro 3-D da estação com VLBI { $station_pos_err_m } m contra apenas distância { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× mais preciso) | posição do satélite RMS { $sat_pos_rms_m } m | erro de relógio da estação { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parâmetros
               *[other] lunar-joint-od-clock | { $n_sat } satélite, { $n_earth } estações terrestres | erro 3-D da estação com VLBI { $station_pos_err_m } m contra apenas distância { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× mais preciso) | posição do satélite RMS { $sat_pos_rms_m } m | erro de relógio da estação { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parâmetros
            }
        [many]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } de satélites, { $n_earth } estação terrestre | erro 3-D da estação com VLBI { $station_pos_err_m } m contra apenas distância { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× mais preciso) | posição do satélite RMS { $sat_pos_rms_m } m | erro de relógio da estação { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parâmetros
                [many] lunar-joint-od-clock | { $n_sat } de satélites, { $n_earth } de estações terrestres | erro 3-D da estação com VLBI { $station_pos_err_m } m contra apenas distância { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× mais preciso) | posição do satélite RMS { $sat_pos_rms_m } m | erro de relógio da estação { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parâmetros
               *[other] lunar-joint-od-clock | { $n_sat } de satélites, { $n_earth } estações terrestres | erro 3-D da estação com VLBI { $station_pos_err_m } m contra apenas distância { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× mais preciso) | posição do satélite RMS { $sat_pos_rms_m } m | erro de relógio da estação { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parâmetros
            }
       *[other]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satélites, { $n_earth } estação terrestre | erro 3-D da estação com VLBI { $station_pos_err_m } m contra apenas distância { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× mais preciso) | posição do satélite RMS { $sat_pos_rms_m } m | erro de relógio da estação { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parâmetros
                [many] lunar-joint-od-clock | { $n_sat } satélites, { $n_earth } de estações terrestres | erro 3-D da estação com VLBI { $station_pos_err_m } m contra apenas distância { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× mais preciso) | posição do satélite RMS { $sat_pos_rms_m } m | erro de relógio da estação { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parâmetros
               *[other] lunar-joint-od-clock | { $n_sat } satélites, { $n_earth } estações terrestres | erro 3-D da estação com VLBI { $station_pos_err_m } m contra apenas distância { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× mais preciso) | posição do satélite RMS { $sat_pos_rms_m } m | erro de relógio da estação { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } parâmetros
            }
    }


engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } ponto | erro de translação { $trans_err_norm_m } m, erro de rotação { $rot_err_norm_rad } rad, erro de escala { $scale_err_ppb } ppb | resíduo RMS { $rms_residual_m } m | convergiu { $converged }
        [many] lunar-frame-realisation | { $n_points } de pontos | erro de translação { $trans_err_norm_m } m, erro de rotação { $rot_err_norm_rad } rad, erro de escala { $scale_err_ppb } ppb | resíduo RMS { $rms_residual_m } m | convergiu { $converged }
       *[other] lunar-frame-realisation | { $n_points } pontos | erro de translação { $trans_err_norm_m } m, erro de rotação { $rot_err_norm_rad } rad, erro de escala { $scale_err_ppb } ppb | resíduo RMS { $rms_residual_m } m | convergiu { $converged }
    }


engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } satélites ({ $geometry_label }) | { $n_grid_points } pts × { $n_epochs } épocas | cobertura { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satélites { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | disponibilidade PL { $pl_availability_pct }% | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemérides { $report } ({ $provenance }) σ_URE necessário { $fmt } contra kepleriano { $fmt2 } contra perturbado { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative =
    { $n_sats ->
        [one] lunar-differential-pnt | { $n_sats } satélite (ilustrativo, classe LCNS, sem afiliação) | linha de base { $baseline_km } km | erro do usuário { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (redução de { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
        [many] lunar-differential-pnt | { $n_sats } de satélites (ilustrativos, classe LCNS, sem afiliação) | linha de base { $baseline_km } km | erro do usuário { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (redução de { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
       *[other] lunar-differential-pnt | { $n_sats } satélites (ilustrativos, classe LCNS, sem afiliação) | linha de base { $baseline_km } km | erro do usuário { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (redução de { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
    }


engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } pontos x { $n_epochs } épocas x { $n_trials } ensaios | disponibilidade { $v4 } % | cobertura { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | corrigido p{ $percentile } 3-D { $f } (não corrigido { $f2 }) | HPL máx. { $f3 } | MODELLED; não é uma declaração sobre nenhum sistema real

engine-api-builtins-terrain-horizon-at-the-station = { " " }| horizonte do terreno ({ $sources }) na estação máx. { $horizon_max_deg } deg, pontos de usuário média do máx. { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame =
    { $n_states ->
        [one]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estado, OEM { $oem_line_count } linha | verificação de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida e volta de OEM { $v8 } | ida e volta de metatempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estado, OEM { $oem_line_count } de linhas | verificação de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida e volta de OEM { $v8 } | ida e volta de metatempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estado, OEM { $oem_line_count } linhas | verificação de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida e volta de OEM { $v8 } | ida e volta de metatempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
        [many]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } de estados, OEM { $oem_line_count } linha | verificação de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida e volta de OEM { $v8 } | ida e volta de metatempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } de estados, OEM { $oem_line_count } de linhas | verificação de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida e volta de OEM { $v8 } | ida e volta de metatempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } de estados, OEM { $oem_line_count } linhas | verificação de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida e volta de OEM { $v8 } | ida e volta de metatempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
       *[other]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estados, OEM { $oem_line_count } linha | verificação de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida e volta de OEM { $v8 } | ida e volta de metatempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estados, OEM { $oem_line_count } de linhas | verificação de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida e volta de OEM { $v8 } | ida e volta de metatempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } estados, OEM { $oem_line_count } linhas | verificação de formato { $v5 } ({ $present_fields } presentes / { $missing_fields } ausentes) | ida e volta de OEM { $v8 } | ida e volta de metatempo { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
    }


engine-api-builtins-scenario-optical-sync-rms-ps = cenário { $r } | óptico sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | cadeia quântica { $quantum_chain_sigma_s }s contra clássica { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | segurança Pd { $security_pd } (Pfa { $monitor_pfa }) | anomalia Pd { $anomaly_pd } | comparação: o quântico vence { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | interrupção { $outage_s }s | erro de posição quântico { $quantum_pos_err_m } m contra clássico { $classical_pos_err_m } m ({ $improvement_x }x) | holdover quântico { $quantum_holdover_s }s contra clássico { $classical_holdover_s }s (limiar { $threshold_m } m) | comparação: o quântico vence { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC quântico { $quantum_auc } contra clássico { $classical_auc } | falha mínima detectável quântica { $quantum_min_detectable } contra clássica { $classical_min_detectable } | { $fault_catalog } classes de falha | comparação: o quântico vence { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] aplica-se apenas ao tipo fusion

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = cenário { $r } | holdover PNT quântico { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integridade { $integ } segurança { $security_na } | holdover PNT clássico { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integridade { $integ2 } segurança { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = cenário { $r } | fundido | holdover PNT quântico { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integridade { $integ } segurança { $security_na } | holdover PNT clássico { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integridade { $integ2 } segurança { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = cenário { $r } | hybrid-ukf (17 estados, MODELLED) | sensor { $v2 } (q_va { $effective_q_va }) | relógio q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } em [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } em [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | assistido { $aided_pos_rms_m }m -> em deriva { $coast_end_pos_rms_m }m ao longo de { $coast_duration_s }s | autoconsistência, não exatidão

engine-api-builtins-scenario-gnss-ins-quantum-outage = cenário { $r } | gnss-ins | RMS de interrupção quântico fundido { $fused_outage_rms_m }m contra livre { $free_outage_rms_m }m (holdover { $holdover_s }s, disp. { $availability }) | clássico fundido { $fused_outage_rms_m2 }m contra livre { $free_outage_rms_m2 }m (holdover { $holdover_s2 }s, disp. { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = cenário { $r } | gnss-sim | iono média { $mean_iono_m }m tropo { $mean_tropo_m }m | disp. RAIM { $raim_availability } HPL médio { $mean_hpl_m }m VPL médio { $mean_vpl_m }m taxa de falha { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = cenário { $r } | spoof-detect | { $n_sats } SVs, +{ $power_advantage_db } dB{ $v4 } | empurrão { $push } | pontuação fundida { $score } (limiar { $fusion_threshold }) | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = varredura { $metric } sobre { $parameter } ({ $first }..{ $last }, { $points } pts, escala { $scale }) | quântico { $first2 }->{ $last2 } | clássico { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = cenário { $r } | { $nominal }/{ $series } amostras GNSS nominal | melhor PDOP { $fnum } pos. { $posm } | holdover quântico { $holdover_s }s p95 { $ns1 }ns integridade { $integ } segurança { $security_na } | holdover clássico { $holdover_s2 }s p95 { $ns12 }ns integridade { $integ2 } segurança { $security_na }

engine-e-api-builtins-ephemeris = efemérides: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| elev. máx. { $el }° pico Doppler { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] cenário { $r } | { $source } | { $n_samples } amostra | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | velocidade { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
        [many] cenário { $r } | { $source } | { $n_samples } de amostras | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | velocidade { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] cenário { $r } | { $source } | { $n_samples } amostras | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | velocidade { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }


engine-api-builtins-generic-sweep-of-over-nodes = varredura genérica de `{ $kind }` sobre [{ $keys }] | { $points } nós (forma { $shape }) | métricas [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | deriva inercial livre { $free_inertial_drift_m } m | correspondência gravimétrica { $map_matched_error_m } m | sigma de correspondência { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| grau de referência { $reference_nmax } desvio padrão da anomalia { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| erro de mapa MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% dentro de { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | deriva inercial livre { $free_inertial_drift_m } m | correspondência com o terreno { $matched_error_m } m ({ $v3 }x de redução) | sigma de correspondência { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } pontos de passagem | RMS inercial livre { $free_inertial_rms_m } m (final { $free_inertial_final_m } m) | RMS com correspondência com o terreno { $matched_rms_m } m (final { $matched_final_m } m, { $v6 }x de redução) | ESS médio { $mean_ess }/{ $cfg } | sigma de correspondência { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | deriva inercial livre { $free_inertial_drift_m } m | gravidade { $gravity_only_m } m magnético { $magnetic_only_m } m terreno { $terrain_only_m } m | FUNDIDO { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] exige runs = 1: um registro medido é um único registro de dados

engine-api-builtins-scenario-runs-quantum-holdover-p95 = cenário { $r } | { $runs } execuções | holdover quântico { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns segurança { $security_na } | holdover clássico { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns segurança { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = cenário { $r } | holdover quântico { $holdover_s }s p95 { $ns1 }ns integridade { $integ } segurança { $security_na } | holdover clássico { $holdover_s2 }s p95 { $ns12 }ns integridade { $integ2 } segurança { $security_na }

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one] { " " }| RAIM disponível { $n_available } de { $n_epochs } época (negadas: { $n_denied }, alarmes: { $n_alarm }; MODELLED)
        [many] { " " }| RAIM disponível { $n_available } de { $n_epochs } de épocas (negadas: { $n_denied }, alarmes: { $n_alarm }; MODELLED)
       *[other] { " " }| RAIM disponível { $n_available } de { $n_epochs } épocas (negadas: { $n_denied }, alarmes: { $n_alarm }; MODELLED)
    }


## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = um caso de referência exige ao menos um satélite

engine-e-araim-reference-reference-case-needs-at-least-2 = um caso de referência exige ao menos uma constelação

engine-e-araim-reference-satellite-names-constellation-but-only = o satélite { $i } nomeia a constelação { $constellation }, mas apenas { $constellations } estão declaradas

engine-e-araim-reference-satellite-has-non-positive-error = o satélite { $i } tem uma variância de erro não positiva

engine-e-araim-reference-both-integrity-risk-allocations-must = ambas as alocações de risco de integridade devem ser positivas

engine-e-araim-reference-this-reference-implementation-monitors-single = esta implementação de referência monitora apenas modos de falha de evento único, mas as probabilidades a priori do caso exigem N_fault,max = { $nfm } (subconjuntos de múltiplos eventos simultâneos). Recusa-se o caso em vez de subcontar os modos de falha.

engine-e-araim-reference-the-all-in-view-geometry = a geometria com todos os satélites à vista é singular

engine-e-araim-reference-no-fault-mode-is-observable = nenhum modo de falha é observável nesta geometria

engine-e-araim-reference-unknown-reference-vector-known-vectors = vetor de referência '{ $vector }' desconhecido; vetores conhecidos: { $ids } (ou 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: { $wanted } vetor(es) de referência WG-C publicado(s); pior concordância VPL/HPL { $worst_acceptance } m em relação à própria TOL_PL da referência = { $tol } m em { $acceptance_checked } vetor(es) de aceitação

engine-e-araim-reference-sat-needs-one-value-per = P_sat exige um valor por satélite e P_const um por constelação

engine-e-araim-reference-satellite-names-an-undeclared-constellation = um satélite nomeia uma constelação não declarada

engine-e-araim-reference-every-prior-must-lie-in = cada probabilidade a priori deve estar em [0, 1)

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] as probabilidades a priori exigem subconjuntos de { $n_fault_max } evento simultâneo; este caminho enumera no máximo { $most }
        [many] as probabilidades a priori exigem subconjuntos de { $n_fault_max } de eventos simultâneos; este caminho enumera no máximo { $most }
       *[other] as probabilidades a priori exigem subconjuntos de { $n_fault_max } eventos simultâneos; este caminho enumera no máximo { $most }
    }


engine-e-araim-reference-the-all-in-view-solution = a solução com todos os satélites à vista não foi selecionada

engine-e-araim-reference-an-add-v4-case-needs = um caso ADD v4.2 exige satélites e constelações

engine-e-araim-reference-nom-and-sat-need-one = b_nom e P_sat exigem um valor por satélite

engine-e-araim-reference-const-needs-one-value-per = P_const exige um valor por constelação

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = o satélite { $i } nomeia uma constelação não declarada

engine-e-araim-reference-one-constellation-index-per-satellite = um índice de constelação por satélite

engine-e-araim-reference-satellite-names-constellation-with-no = o satélite { $i } nomeia a constelação { $c } sem ISM

engine-e-araim-reference-fewer-than-four-satellites-above = menos de quatro satélites acima da máscara

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m deve conter ao menos uma distância de afastamento

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (faixa { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoofing@{ $value } m { $nearest } W | pegada { $a2 }% capt., limbo { $footprint_limb_captured } | captura por spoofing { $spoof_captured } (travamento { $spoof_lock_time_s } s) | alcance do mastro { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% de 50 bit/s), latência { $nma_auth_latency_s } s

engine-attack-surface-reached-crossing-best-db = atingido ({ $crossings } cruzamento(s), melhor { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = NÃO atingido nesta grade (melhor { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB abaixo; exige { $best_limb_capture_tx_power_dbw } dBW contra { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| varredura de pegada { $s }x{ $s2 } (alt. { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), captura { $v5 }-{ $v6 }% | limbo { $limb }

engine-attack-surface-afs-received-dbw = AFS recebido: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Déficit: { $deficit_db } dB (faixa { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Pegada de captura: { $a }% do disco, limbo capturado: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Arrasto por spoofing: { $spoof_captured } (travamento { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Alcance do mastro: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Limbo: capturado na grade { $na }x{ $nb }, { $crossings } cruzamento(s)

engine-attack-surface-limb-not-captured-on-grid = Limbo: não capturado na grade { $na }x{ $nb }; exige { $best_limb_capture_tx_power_dbw } dBW (em voo { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km deve ser finito e positivo

engine-e-attitude-budget-inertias-must-be-finite-and = as inércias devem ser finitas e positivas

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 deve ser >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = é necessário ao menos um contribuinte de apontamento

engine-e-attitude-budget-contributor-sigma-must-be-finite = o sigma do contribuinte '{ $name }' deve ser finito e >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> torque GG { $t_gg } N·m; apontamento { $total }" RSS (dominante: { $dominant }) (orçamento escalar MODELLED)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } exige um valor

engine-bench-cli-unknown-option = opção `{ $a }` desconhecida

engine-bench-cli-unexpected-argument = argumento `{ $pos }` inesperado

engine-bench-cli-cannot-read = não foi possível ler { $p }: { $e }

engine-bench-cli-cannot-create = não foi possível criar { $d }: { $e }

engine-bench-cli-cannot-write = não foi possível gravar { $p }: { $e }

engine-bench-cli-unknown-task-or = tarefa `{ $t }` desconhecida (a, b, c ou d)

engine-bench-cli-scored-epochs-in-folder = { $labels } épocas pontuadas em { $folders } pasta(s)

engine-bench-cli-wrote-cases-json-and-truth = { $out }/cases.json e { $out }/truth.json gravados

engine-bench-cli-refused-this-commitment-is-provisional = RECUSADO: este compromisso é provisório e sua semente foi exposta; não é um conjunto reservado de publicação

engine-bench-cli-mismatch-the-seed-is-not = DIVERGÊNCIA: a semente não é a que corresponde a este compromisso

engine-bench-cli-is-not-json = { $f } não é JSON: { $e }

engine-bench-cli-cannot-read-2 = não foi possível ler { $i }: { $e }

engine-bench-cli-result-rendered = { $results } resultado(s) gerado(s)

engine-bench-cli-unknown-subcommand =
    subcomando `{ $other }` desconhecido
    { $BENCH_USAGE }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-cannot-create-an-existing-seed = não foi possível criar { $path } (um arquivo de semente existente nunca é sobrescrito): { $e }

engine-bench-cli-cannot-write-2 = não foi possível gravar { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = semente gravada em { $path }: mantenha-a fora do controle de versão e de qualquer mensagem; somente o hash abaixo é público

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (herdado, não reexecutado)

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-cli-impairment-eval-baseline = linha de base de impairment-eval: { $det }

engine-bench-cli-no-scenario-json-under = nenhum scenario.json em { $root }

engine-bench-cli-is-not-json-2 = { $path } não é JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } ok, { $bad } divergente(s), { $missing } ausente(s), { $unpinned } não fixado(s)

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = partição `{ $other }` desconhecida (dev, test ou holdout)

engine-bench-score-for-is-not-finite = a pontuação de `{ $id }` não é finita

engine-bench-case-have-no-score-the = { $missing } caso(s) sem pontuação, o primeiro é `{ $first_missing }`

engine-bench-predictions-name-case-that-is = as previsões nomeiam um caso que não está na referência: `{ $extra }`

engine-bench-schema-must-be = `schema` deve ser `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` deve ser um SHA-256 hexadecimal de 64 dígitos

engine-bench-truth-is-not-json = a referência não é JSON: { $e }

engine-bench-predictions-are-not-json = as previsões não são JSON: { $e }

engine-bench-truth-schema-must-be = o `schema` da referência deve ser `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = o `schema` das previsões deve ser `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = a referência foi elaborada com uma versão da especificação diferente de { $SPEC_VERSION }; resultados de versões principais diferentes nunca são misturados

engine-bench-unknown-task = tarefa `{ $other }` desconhecida

## src/bench/site.rs

engine-bench-site-result-is-not-valid = o resultado { $v1 } não é válido: { $p }

engine-bench-site-result-is-task-holdout-result = o resultado { $v1 } é um resultado reservado da tarefa (d) sem `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = o resultado { $v1 } foi pontuado com uma semente de conjunto reservado provisória e exposta: não é um conjunto reservado de publicação

engine-bench-site-result-was-scored-under-this = o resultado { $v1 } foi pontuado com { $v }; esta página é para { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = a pontuação de `{ $k }` não é um número

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (estatística de monitor padrão 0.35)

engine-bench-tasks-malformed-clock-line = linha de relógio `{ $line }` malformada

engine-bench-tasks-the-clock-file-does-not = o arquivo de relógio não corresponde ao SHA-256 fixado (obtido { $got }, esperado { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = o satélite { $prn } não está no arquivo de relógio

engine-bench-tasks-kshana-bench-baseline = linha de base do kshana-bench: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = as previsões cobrem { $pmap } casos, a referência tem { $tarr }

engine-bench-tasks-case-has-no-number-array = o caso `{ $id }` não tem matriz de números

engine-bench-tasks-case-needs-values-has =
    { $n ->
        [one] o caso `{ $id }` exige { $n } valor, tem { $a }
        [many] o caso `{ $id }` exige { $n } de valores, tem { $a }
       *[other] o caso `{ $id }` exige { $n } valores, tem { $a }
    }


engine-bench-tasks-case-has-non-finite-value = o caso `{ $id }` tem um valor não finito

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serialização de { $name }: { $e }

engine-e-bin-crossover-study-write = gravação de { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = erro: não foi possível criar { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = concluído: inercial { $nodes } nós, relógio { $curves } curvas (semente 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } época de usuário x 3 valores de URA em { $dt } s = { $v1 } ms por época de usuário ({ $ok } resolvível(is))
        [many] { $n } de épocas de usuário x 3 valores de URA em { $dt } s = { $v1 } ms por época de usuário ({ $ok } resolvível(is))
       *[other] { $n } épocas de usuário x 3 valores de URA em { $dt } s = { $v1 } ms por época de usuário ({ $ok } resolvível(is))
    }


## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = docs/INTEROP.md gravado (tabela de exportação)

## src/bin/validation_report.rs

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-bin-validation-report-wrote-validation-summary-to = resumo de verificação gravado em { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = corpo '{ $body_name }' desconhecido

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navega em torno de um corpo que não seja a Terra com um enlace com a Terra; { $name } não é suportado aqui

engine-e-body-pnt-duration-and-step-must-be = duration_s e step_s devem ser positivos, com no máximo 20000 épocas; recebidos { $duration } e { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind deve ser orbiter ou surface; recebido '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = a altitude do usuário deve ser positiva e a excentricidade deve estar em [0, 0.9)

engine-e-body-pnt-the-user-orbit-periapsis-is = o periapse da órbita do usuário está abaixo da superfície

engine-e-body-pnt-constellation-needs-to-200-satellites = a constelação exige de 1 a 200 satélites em ao menos um plano

engine-e-body-pnt-constellation-altitude-must-be-positive = a altitude da constelação deve ser positiva

engine-e-body-pnt-range-sigmas-must-be-positive = os sigmas de distância devem ser positivos

engine-e-body-pnt-no-earth-position-relative-to = nenhuma posição da Terra relativa a { $name } em JD { $jd }

engine-e-body-pnt-serialising-report = serialização do relatório: { $e }

engine-e-body-pnt-the-report-must-serialise-to = o relatório deve ser serializado como um objeto JSON

engine-body-pnt-positioning-around-user-relays-at =
    Posicionamento em torno de { $name } — usuário { $user_kind }, { $n_relays } retransmissores a { $r } km, { $n_epochs } épocas
    { "  " }Tempo-luz da Terra { $one_way_light_time_s } s de ida, { $two_way_light_time_s } s de ida e volta; ângulo Sol-Terra-corpo { $sun_separation_deg } deg
    { "  " }disponibilidade: { $availability_relays } apenas constelação, { $availability_with_earth } com a distância até a Terra (Terra à vista { $earth_visibility })
    { "  " }PDOP mediano { $opt }; erro RMS { $opt2 } apenas constelação, { $opt3 } com a distância até a Terra
    { "  " }sigma formal mediano { $opt4 } apenas constelação, { $opt5 } com a distância até a Terra{ "\u000A" }

engine-body-pnt-positioning-around = Posicionamento em torno de { $name }

engine-body-pnt-user-relays-earth-light-time =
    { $n_relays ->
        [one] usuário { $user_kind } · { $n_relays } retransmissor · tempo-luz da Terra { $one_way_light_time_s } s · MODELLED
        [many] usuário { $user_kind } · { $n_relays } de retransmissores · tempo-luz da Terra { $one_way_light_time_s } s · MODELLED
       *[other] usuário { $user_kind } · { $n_relays } retransmissores · tempo-luz da Terra { $one_way_light_time_s } s · MODELLED
    }


## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = o cenário E1 não é uma tabela

engine-e-calibration-ensembles-e1-scenario-has-no-monte = o cenário E1 não tem [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: final_error.{ $k } ausente

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 é `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 conjuntos de 200 realizações cada, contra a forma fechada: média 0, sigma = { $sigma } ns. O conjunto j usa a semente base 1 000 000 + 1000 j e a semente de bootstrap 20260928 + j. O maior erro relativo de ADEV foi { $max } para E2 e { $max2 } para E3 (em 1, 10 e 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = caminho de resultado vazio

engine-e-campaign-result-path-has-an-empty = o caminho de resultado `{ $path }` tem um segmento vazio

engine-e-campaign-result-path-bad-index-in = caminho de resultado `{ $path }`: índice inválido em `{ $part }`

engine-e-campaign-result-path-no-field = caminho de resultado `{ $path }`: não há campo `{ $name }`

engine-e-campaign-result-path-indexed-value-is = caminho de resultado `{ $path }`: o valor indexado não é uma matriz

engine-e-campaign-result-path-index-out-of = caminho de resultado `{ $path }`: índice { $i } fora do intervalo ({ $n })

engine-e-campaign-result-path-value-is-not = caminho de resultado `{ $path }`: o valor não é um número nem um sinalizador

engine-e-campaign-result-path-is-not-an = caminho de resultado `{ $path }`: `{ $k }` não é uma matriz

engine-e-campaign-result-path-must-name-one = o caminho de resultado `{ $path }` deve indicar um único valor, não linhas

engine-e-campaign-result-path-is-not-an-2 = caminho de resultado `{ $path }`: `{ $name }` não é uma matriz

engine-e-campaign-metric-path-has-no-entry = o caminho de métrica `{ $path }` não tem entrada no bloco units desse tipo; declare seu `unit` na campanha

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` deve ser composto por letras, dígitos, `_` ou `-` e não pode ser vazio

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: uma campanha não pode conter outra campanha

engine-e-campaign-serialise = { $label }: serialização: { $e }

engine-e-campaign-result-did-not-parse = { $label }: o resultado não pôde ser analisado: { $e }

engine-e-campaign-seed-key-no-field-in = chave de semente `{ $key }`: não há campo `{ $part }` no cenário

engine-e-campaign-seed-key-is-not-non = a chave de semente `{ $key }` não é um inteiro não negativo

engine-e-campaign-seed-does-not-fit-toml = a semente { $seed } não cabe em um inteiro TOML

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-campaign-time-path-must-name-rows = o caminho de tempo `{ $t }` deve indicar linhas com `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` não é below, above nem abs_above

engine-campaign-threshold-is-null = o limiar `{ $p }` é nulo

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` não é mean, min, max nem count

engine-campaign-time-path-gives-several-values = o caminho de tempo `{ $t }` fornece vários valores por linha

engine-campaign-value-path-has-fewer-rows = o caminho de valor `{ $y }` tem menos linhas que `{ $t }`

engine-campaign-value-path-has-rows-time = o caminho de valor `{ $y }` tem { $r } linhas, o caminho de tempo `{ $t }` tem { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = uma campanha com fases exige um [timeline] com step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s deve ser positivo, recebido { $step }

engine-e-campaign-phase-is-named-twice = a fase `{ $name }` é nomeada duas vezes

engine-e-campaign-phase-duration-must-be-non = fase `{ $name }`: duration_s deve ser não negativo

engine-e-campaign-phase-has-no-runs = a fase `{ $name }` não tem execuções

engine-e-campaign-phase-the-first-phase-has = fase `{ $name }`: a primeira fase não tem nada a transferir

engine-e-campaign-phase-handoff-from-channel-which = fase `{ $name }`: transferência do canal `{ $ch }`, com o qual a fase anterior não terminou

engine-e-campaign-phase-handoff-from-run-does = fase `{ $name }`: a transferência from_run { $from_run } não existe

engine-e-campaign-phase-handoff-is-null = fase `{ $name }`: a transferência `{ $from }` é nula

engine-e-campaign-phase-handoff-run-does-not = fase `{ $name }`: a execução de transferência { $run } não existe

engine-e-campaign-phase = fase `{ $name }`: { $e }

engine-campaign-phase-run = fase { $name }/execução { $ri }

engine-e-campaign-phase-end-at-run-does = fase `{ $name }`: end_at_run { $end_at_run } não existe

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s é posterior)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } é nulo)

engine-e-campaign-phase-side-is-not-classical = fase `{ $name }`: o lado `{ $side }` não é classical nem quantum

engine-e-campaign-phase-skip-must-be-non = fase `{ $name }`: skip_s deve ser não negativo

engine-e-campaign-phase-alarm-compare-is-not = fase `{ $name }`: o compare de alarme `{ $compare }` não é below, above nem abs_above

engine-e-campaign-phase-alarm-threshold-is-null = fase `{ $name }`: o limiar de alarme `{ $p }` é nulo

engine-e-campaign-phase-channel-is-in-not = fase `{ $name }`: o canal `{ $channel }` está em { $u }, não em { $du }

engine-e-campaign-phase-channel-needs-unit = fase `{ $name }`: o canal `{ $channel }` precisa de uma unidade

engine-e-campaign-phase-two-runs-both-provide = fase `{ $name }`: duas execuções fornecem o canal `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = a fase `{ $name }` transporta `{ $ch }`, com o qual a fase anterior não terminou

engine-e-campaign-phase-carries-but-no-run = a fase `{ $name }` transporta `{ $ch }`, mas nenhuma execução dela fornece `{ $ch }`

engine-e-campaign-channel-is-in-in-one = o canal `{ $name }` está em { $unit } em uma fase e em { $unit2 } em outra

engine-e-campaign-at-least-one-metric-is = é necessária ao menos uma métrica

engine-e-campaign-metric-is-named-twice = a métrica `{ $name }` é nomeada duas vezes

engine-e-campaign-seed-overflow-in-the-ensemble = estouro de semente no conjunto

engine-e-campaign-an-ensemble-needs-at-least = um conjunto exige ao menos uma execução

engine-e-campaign-sweep-takes-one-to-three = uma varredura aceita de um a três eixos, recebido { $axes }

engine-e-campaign-axis-is-named-twice = o eixo `{ $name }` é nomeado duas vezes

engine-e-campaign-axis-needs-at-least-two = o eixo `{ $name }` exige ao menos dois passos

engine-e-campaign-axis-scale-must-be-lin = eixo `{ $name }`: scale deve ser lin ou log

engine-e-campaign-axis-log-axis-needs-positive = eixo `{ $name }`: um eixo log exige extremos positivos

engine-campaign-sweep-node = nó { $flat } da varredura

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs deve ser no mínimo dois

engine-e-campaign-compose-needs-at-least-one = compose exige ao menos um membro

engine-e-campaign-shared-value-must-be-number = o valor compartilhado `{ $name }` deve ser um número ou números

engine-e-campaign-shared-value-is-named-twice = o valor compartilhado `{ $name }` é nomeado duas vezes

engine-e-campaign-member-binds-unknown-shared = o membro `{ $label }` vincula o valor compartilhado desconhecido `{ $name }`

engine-e-campaign-member = membro `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = a métrica `{ $name }` está em { $u } para um membro e em { $unit } para `{ $label }`

engine-e-campaign-member-is-named-twice = o membro `{ $label }` é nomeado duas vezes

engine-e-campaign-invalid-campaign-scenario = cenário de campanha inválido: { $e }

engine-e-campaign-invalid-campaign = campanha inválida: { $e }

engine-e-campaign-sweep = sweep: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } de { $what } entre as realizações

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-value-of-at-the-end = valor de { $ch } ao fim da fase anterior, somado ao { $ch } desta fase

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-on-the-timeline-grid-the = { $label } na grade da linha do tempo: a amostra mais recente da execução da fase proprietária em ou antes de cada instante da grade (retenção de ordem zero); nulo onde nenhuma execução dessa fase a fornece

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-values-of-the-scenario-key = valores da chave de cenário { $key } ao longo do eixo { $name }

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-value-of-the-scenario-key = valor da chave de cenário { $key } neste nó

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-of-the-node-result = { $path } do resultado do nó

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-of-each-realisation-in-seed = { $path } de cada realização, em ordem de semente

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-shared-value-written-into-every = valor compartilhado { $name }, gravado em todo membro que o vincula

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-metric-read-from-the-member = métrica { $name } lida do resultado do membro

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-smallest-across-the-members = menor valor de { $name } entre os membros

engine-campaign-largest-across-the-members = maior valor de { $name } entre os membros

engine-campaign-mean-across-the-members = média de { $name } entre os membros

engine-e-campaign-failed-to-serialise-campaign-result = falha ao serializar o resultado da campanha: { $e }

engine-campaign-chain-phases-over-events-alarm = chain: { $phases } fases em { $duration_s } s, { $events } eventos, alarme acionado em { $alarm_s } s da grade

engine-campaign-sweep-of-nodes-over = varredura de `{ $scenario_kind }`: { $nodes } nós sobre [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Monte Carlo de `{ $scenario_kind }`: { $runs } sementes

engine-campaign-compose-members = compose: { $members } membros

engine-campaign-member-runs-modelled = { $runs_total } execuções de membros (MODELLED)

engine-campaign-sweep-of-over-nodes-each = varredura de `{ $scenario_kind }` sobre { $axis_order } ({ $nodes } nós{ $v4 }; cada linha em seu próprio intervalo)

engine-campaign-campaign-modelled-composition-every-value = campanha { $r } | composição MODELLED; cada valor lido de uma execução real do tipo indicado

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = uma otimização aceita de um a três parâmetros, recebido { $params }

engine-e-campaign-optimize-param-is-named-twice = o parâmetro `{ $name }` é nomeado duas vezes

engine-e-campaign-optimize-param-needs-finite-lo-hi = parâmetro `{ $name }`: exige lo < hi finitos

engine-e-campaign-optimize-param-scale-must-be-lin = parâmetro `{ $name }`: scale deve ser lin ou log

engine-e-campaign-optimize-param-log-param-needs-positive = parâmetro `{ $name }`: um parâmetro log exige limites positivos

engine-e-campaign-optimize-param-start-must-lie-in = parâmetro `{ $name }`: start deve estar em [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = parâmetro `{ $name }`: uma grade exige steps de ao menos dois

engine-e-campaign-optimize-objective-target-is-only-read = objective.target só é lido com goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" exige um objective.target finito

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal deve ser minimize, maximize ou target, recebido `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = uma grade de { $total } nós excede o limite de 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps só é lido com method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals deve cobrir o simplex inicial (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step deve estar em (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol e xtol devem ser não negativos

engine-e-campaign-optimize-method-must-be-grid-or = method deve ser grid ou nelder-mead, recebido `{ $other }`

engine-campaign-optimize-optimize-eval = avaliação de optimize { $trace }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-lower-bound-of-the-scenario = limite inferior da chave de cenário { $key }

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-upper-bound-of-the-scenario = limite superior da chave de cenário { $key }

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key = valor da chave de cenário { $key } na melhor avaliação

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key-2 = valor da chave de cenário { $key } nesta avaliação

engine-campaign-optimize-target-value-of = valor-alvo de { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } na melhor avaliação

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } desta avaliação (a média das sementes quando runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) de `{ $scenario_kind }` por { $method }: { $evals } avaliações ({ $stop_reason }), melhor { $o2 } em [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START antes do cabeçalho CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: linha de cabeçalho malformada: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: linha de metadados malformada: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: linha de dados malformada: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: palavra-chave de dados { $k } não reconhecida

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: linha de dados { $k } sem época

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: linha de dados { $k } sem valor

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: linha de dados { $k } com valor { $val_str } inválido

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: segmento não terminado (META_STOP/DATA_STOP ausente)

engine-ccsds-tdm-ccsds-tdm-vers = CCSDS_TDM_VERS = { $version }{ "\u000A" }

engine-ccsds-tdm-creation-date = CREATION_DATE = { $creation_date }{ "\u000A" }

engine-ccsds-tdm-time-system = TIME_SYSTEM = { $time_system }{ "\u000A" }

engine-ccsds-tdm-transmit-band = TRANSMIT_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-receive-band = RECEIVE_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-turnaround-numerator = TURNAROUND_NUMERATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-turnaround-denominator = TURNAROUND_DENOMINATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-range-units = RANGE_UNITS = { $u }{ "\u000A" }

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: TURNAROUND_NUMERATOR { $value } inválido

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: TURNAROUND_DENOMINATOR { $value } inválido

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = observável `{ $other }` desconhecido: esperado um de range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = coordenadas `{ $other }` desconhecidas: esperado um de cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours deve ser finito e positivo, recebido { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs deve ser ≥ 2, recebido { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps deve ser ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials deve ser ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations deve ser ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd deve ser finito e positivo, recebido { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor deve ser finito e positivo, recebido { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km deve ser finito e positivo, recebido { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m deve ser finito e positivo, recebido { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s deve ser finito e positivo, recebido { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = a constelação deve ter ao menos um satélite chief e uma referência

engine-e-cislunar-arc-recovery-family-is-an-out-of = a família `{ $family }` é uma família fora do plano e não tem representação planar de quatro estados: defina spatial = true para varrê-la

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = o modelo direto produziu uma medição de referência não finita

engine-cislunar-arc-recovery-first-arc-length-at-which = primeiro comprimento de arco em que a solução em lote sem ruído de CADA ensaio com semente reduz o erro de estado final a no máximo { $recovery_factor } vezes o deslocamento a priori de que partiu. Este é o análogo de recuperação do critério de posto: com medições exatas, a pergunta `is the state observable?` torna-se `can an estimator get it back?`, e nenhuma tolerância de valor singular entra na resposta.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = primeiro comprimento de arco em que o erro RMS de recuperação de posição de Monte Carlo, sobre { $trials } realizações de ruído com semente, cai a { $error_bound_km } km ou menos. Este é o análogo de recuperação do critério de estimabilidade, medido e não previsto: o erro é a distância da estimativa à referência conhecida, não o traço de uma covariância formal.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED dentro de um passo da grade de épocas: o estimador recupera a partir de { $e } h, o critério de posto da gramiana muda em { $g } h (razão { $v1 }, grade { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED como fronteira de recuperabilidade: o estimador recupera a partir de { $e } h, { $v1 } os { $g } h do critério de posto da gramiana (razão { $v2 }, grade { $grid_hours } h). O critério de posto é uma convenção relativa de valor singular; a fronteira de recuperação é um erro de estado medido, e as duas não coincidem aqui.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: o estimador nunca atinge seu limite de recuperação neste arco, enquanto o critério de posto da gramiana muda em { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = o critério de posto da gramiana nunca é atingido neste arco (a geometria nunca alcança posto completo), enquanto o estimador recupera a partir de { $e } h — os dois divergem quanto a existir sequer uma fronteira.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | família { $family }, { $state_dim } estados, { $n_spacecraft } s/c, observável { $observable }, parametrização { $coordinates } | arco de { $arc_hours } h, { $epochs } épocas (grade { $grid_hours } h), { $trials } ensaios, semente { $seed } | derivadas parciais por diferenças finitas, sem jacobiana analítica / STM / SVD / SRIF | recuperação sem ruído a partir de { $nf } (fator { $recovery_factor }) contra limiar de posto da gramiana { $gram } | estimabilidade de Monte Carlo a partir de { $est } (RMS pos ≤ { $error_bound_km } km, σ { $sigma_range_m } m) contra estimabilidade da gramiana { $gram_est } | RMS pos ao fim do arco { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = família `{ $other }` desconhecida: esperado um de dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = a DRO na distância de cruzamento { $d } não convergiu na correção diferencial

engine-e-cislunar-observability-member-at-x0-did-not = o membro { $i } de { $label } em x0 = { $x0 } não convergiu na correção diferencial

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft deve estar entre 2 e { $MAX_SPACECRAFT }, recebido { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs deve ser ≥ 2, recebido { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol deve ser finito e positivo, recebido { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m deve ser finito e não negativo, recebido { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km deve ser finito e positivo, recebido { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs =
    { $n_links ->
        [one] cislunar-observability | { $c } s/c ({ $refs } refs) | arco de { $arc_hours } h, { $rank_arc } épocas | posto { $first } → { $last } de { $state_dim } ao longo do arco | λ da gramiana [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | posto instantâneo apenas distância { $rank_range_only } → distância+taxa { $rank_range_rate } ({ $n_links } enlace) | GDOP apenas distância { $ro } distância+taxa { $rr } | condições iniciais da DRO (resíduo máximo de periodicidade { $max_resid }) | SRIF posterior finito na época de posto 4 { $srif_epoch } (verificados: posto/STM/fechamento da DRO/SRIF; modelado: projeto)
        [many] cislunar-observability | { $c } s/c ({ $refs } refs) | arco de { $arc_hours } h, { $rank_arc } épocas | posto { $first } → { $last } de { $state_dim } ao longo do arco | λ da gramiana [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | posto instantâneo apenas distância { $rank_range_only } → distância+taxa { $rank_range_rate } ({ $n_links } de enlaces) | GDOP apenas distância { $ro } distância+taxa { $rr } | condições iniciais da DRO (resíduo máximo de periodicidade { $max_resid }) | SRIF posterior finito na época de posto 4 { $srif_epoch } (verificados: posto/STM/fechamento da DRO/SRIF; modelado: projeto)
       *[other] cislunar-observability | { $c } s/c ({ $refs } refs) | arco de { $arc_hours } h, { $rank_arc } épocas | posto { $first } → { $last } de { $state_dim } ao longo do arco | λ da gramiana [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | posto instantâneo apenas distância { $rank_range_only } → distância+taxa { $rank_range_rate } ({ $n_links } enlaces) | GDOP apenas distância { $ro } distância+taxa { $rr } | condições iniciais da DRO (resíduo máximo de periodicidade { $max_resid }) | SRIF posterior finito na época de posto 4 { $srif_epoch } (verificados: posto/STM/fechamento da DRO/SRIF; modelado: projeto)
    }


engine-cislunar-observability-never-rank-of = nunca (posto { $rank } de { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | família { $family }, { $state_dim } estados, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | limiar de posto { $rank_thr } (grade { $c } h) | limiar de estimabilidade (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = primeiro comprimento de arco em que a incerteza formal de posição 1σ do estado INICIAL do chief, σ_pos = sqrt(trace(P_rr)) com P = (ÕᵀÕ)⁻¹ e Õ a matriz de observabilidade branqueada pelo ruído de medição, cai a { $sigma_pos_threshold_km } km ou menos. Este é o critério sob o qual um limiar de comprimento de arco depende do ruído: P escala com σ², logo σ_pos escala com σ, ao passo que o critério de posto acima não se move com σ. O limite é uma escolha de engenharia DECLARADA, não ajustada — estimability_sweep informa o limiar em outros quatro limites.

engine-cislunar-observability-extension-r3-this-run-is =
    { $n_spacecraft ->
        [one] EXTENSÃO (R3) — esta execução NÃO é a configuração DRO planar que o `label` acima descreve. Dimensão de estado { $state_dim }; família de órbita { $family }; { $n_spacecraft } espaçonave; sigma de medição de distância { $sigma_range_m } m. Onde `label` diz "planar" e "DROs planares", leia a família indicada aqui. Acréscimos VALIDATED: a STM variacional 6x6 é a mesma STM da CR3BP verificada por diferenças finitas (crate::cr3bp) usada em largura total; as linhas jacobianas espaciais de distância / taxa de distância são derivadas parciais analíticas verificadas por diferenças finitas, e a linha de taxa de distância foi conferida componente a componente com o deepspace_od::range_rate_observable 3-D independente da crate; as condições iniciais halo / NRHO são órbitas periódicas corrigidas diferencialmente pelo mesmo corretor que reproduz a NRHO 9:2 sul do L2 publicada, continuadas a partir dessa semente publicada, e o resíduo de fechamento de cada membro é informado; os veredictos de POSTO de seis estados são confirmados por um posto INDEPENDENTE por escalonamento (eliminação gaussiana com pivotamento parcial) que não compartilha código com a via de autovalores/SVD. ALCANCE REAL DO RAMO SRIF: a validação cruzada com SRIF acima consome as MESMAS jacobianas de medição e se reduz ao mesmo O^T O; sua concordância é, portanto, uma verificação de consistência entre duas máquinas numéricas, NÃO uma corroboração independente do limiar — ela não é contada como verificação de nenhum valor aqui. MODELLED: o projeto da família (quais abscissas, amplitudes e fases), a grade de épocas, o arco de enlace único e o limite de posição declarado do critério de estimabilidade.
        [many] EXTENSÃO (R3) — esta execução NÃO é a configuração DRO planar que o `label` acima descreve. Dimensão de estado { $state_dim }; família de órbita { $family }; { $n_spacecraft } de espaçonaves; sigma de medição de distância { $sigma_range_m } m. Onde `label` diz "planar" e "DROs planares", leia a família indicada aqui. Acréscimos VALIDATED: a STM variacional 6x6 é a mesma STM da CR3BP verificada por diferenças finitas (crate::cr3bp) usada em largura total; as linhas jacobianas espaciais de distância / taxa de distância são derivadas parciais analíticas verificadas por diferenças finitas, e a linha de taxa de distância foi conferida componente a componente com o deepspace_od::range_rate_observable 3-D independente da crate; as condições iniciais halo / NRHO são órbitas periódicas corrigidas diferencialmente pelo mesmo corretor que reproduz a NRHO 9:2 sul do L2 publicada, continuadas a partir dessa semente publicada, e o resíduo de fechamento de cada membro é informado; os veredictos de POSTO de seis estados são confirmados por um posto INDEPENDENTE por escalonamento (eliminação gaussiana com pivotamento parcial) que não compartilha código com a via de autovalores/SVD. ALCANCE REAL DO RAMO SRIF: a validação cruzada com SRIF acima consome as MESMAS jacobianas de medição e se reduz ao mesmo O^T O; sua concordância é, portanto, uma verificação de consistência entre duas máquinas numéricas, NÃO uma corroboração independente do limiar — ela não é contada como verificação de nenhum valor aqui. MODELLED: o projeto da família (quais abscissas, amplitudes e fases), a grade de épocas, o arco de enlace único e o limite de posição declarado do critério de estimabilidade.
       *[other] EXTENSÃO (R3) — esta execução NÃO é a configuração DRO planar que o `label` acima descreve. Dimensão de estado { $state_dim }; família de órbita { $family }; { $n_spacecraft } espaçonaves; sigma de medição de distância { $sigma_range_m } m. Onde `label` diz "planar" e "DROs planares", leia a família indicada aqui. Acréscimos VALIDATED: a STM variacional 6x6 é a mesma STM da CR3BP verificada por diferenças finitas (crate::cr3bp) usada em largura total; as linhas jacobianas espaciais de distância / taxa de distância são derivadas parciais analíticas verificadas por diferenças finitas, e a linha de taxa de distância foi conferida componente a componente com o deepspace_od::range_rate_observable 3-D independente da crate; as condições iniciais halo / NRHO são órbitas periódicas corrigidas diferencialmente pelo mesmo corretor que reproduz a NRHO 9:2 sul do L2 publicada, continuadas a partir dessa semente publicada, e o resíduo de fechamento de cada membro é informado; os veredictos de POSTO de seis estados são confirmados por um posto INDEPENDENTE por escalonamento (eliminação gaussiana com pivotamento parcial) que não compartilha código com a via de autovalores/SVD. ALCANCE REAL DO RAMO SRIF: a validação cruzada com SRIF acima consome as MESMAS jacobianas de medição e se reduz ao mesmo O^T O; sua concordância é, portanto, uma verificação de consistência entre duas máquinas numéricas, NÃO uma corroboração independente do limiar — ela não é contada como verificação de nenhum valor aqui. MODELLED: o projeto da família (quais abscissas, amplitudes e fases), a grade de épocas, o arco de enlace único e o limite de posição declarado do critério de estimabilidade.
    }


engine-cislunar-observability-validated-each-constellation-initial-condition = Verificado: cada condição inicial da constelação é uma órbita periódica corrigida diferencialmente da família { $family }, fechando ao longo de um período até o resíduo de periodicidade informado (as DROs planares são, além disso, retrógradas em torno da Lua). A família é corrigida na razão de massa Terra-Lua. Modelado: a escolha dos parâmetros e das fases da família (o projeto da constelação). O nome de chave `dro_provenance` é mantido para o esquema do documento publicado; ele traz a família que esta execução pediu.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integridade: { $n } deve ser finito e positivo, recebido { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integridade: { $n } deve estar em (0, 1), recebido { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integridade: mask_deg deve estar em [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integridade: systems deve nomear ao menos uma predefinição

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integridade: injected_bias exige bias_m, t0_s e t1_s finitos

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] integridade: { $n } época excede o teto de { $MAX_EPOCHS } épocas; aumente step_s
        [many] integridade: { $n } de épocas excedem o teto de { $MAX_EPOCHS } épocas; aumente step_s
       *[other] integridade: { $n } épocas excedem o teto de { $MAX_EPOCHS } épocas; aumente step_s
    }


## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: sem registros

engine-e-clock-library-card-records-at-different-tau0 = { $name }: registros com tau0 diferentes

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: falha nos mínimos quadrados periódicos

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: { $used } pontos de estabilidade com edf >= { $MIN_FIT_EDF }; um cartão exige três

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = lacunas { $g }, valores atípicos de fase { $o }, saltos de fase { $p }, rajadas { $b }, saltos de frequência { $f } (sigma_y robusto { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` não é um inteiro não negativo

engine-e-compliance-is-missing = `{ $p }` está ausente

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } excede events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } excede predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: contagens de receiver-trust malformadas ({ $malformed_counts }); excluído

engine-e-compliance-not-json = { $label }: não é JSON: { $e }

engine-compliance-cannot-read = { $label }: não foi possível ler: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: o cenário irmão indica o tipo `{ $s }`, mas o resultado indica `{ $o }`; não utilizado

engine-e-compliance-scenario-kind-not-found-no = { $label }: tipo de cenário não encontrado (sem arquivo de cenário irmão, não é um resultado de receiver-trust, sem `kind` de nível superior)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` não é um tipo de cenário conhecido pelo motor; não utilizado

engine-compliance-written-by-kshana = Escrito pelo kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    { $met } teste(s) com todos os limiares declarados atingidos, { $not_met } com um limiar não atingido, { $needs_input } aguardando entrada.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = a grade de intensidade deve ter min < max finitos, recebido [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = a grade de intensidade exige >= 2 passos, recebido { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = a grade de correlação deve ter ao menos um valor

engine-e-conflict-resilience-correlation-values-must-lie-in = os valores de correlação devem estar em [0, 1], recebido { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience exige ao menos uma camada

engine-e-conflict-resilience-layer-availability-not-in = a disponibilidade { $availability } da camada { $i } não está em [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = camada { $i }: sigma_m deve ser finito e positivo

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = camada { $i }: vulnerability deve ser finito e >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = camada { $i }: vector_weight deve ser finito e >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } fora do intervalo (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials deve ser >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } camadas ({ $primary } de linha de base) | intensidade de referência { $reference_intensity } | razão de resiliência em forma fechada { $ratio_closed_form }x MC { $ratio_mc_independent }x (em camadas contra camada única) | a correlação anula a vantagem das camadas: razão { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | IC a priori [{ $ratio_lo }-{ $ratio_hi }]x | sobrevivência por vetor @ jam de referência { $surv }% spoof { $surv2 }% cinético { $surv3 }% cibernético { $surv4 }% (mais agudo { $sharpest }) | ~7x destaque MODELLED, VALIDATED MC->forma fechada / identidade de fusão / marginais de cópula / sobrevivência por vetor

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = corpo central { $name } desconhecido: esperado um planeta, Plutão, a Lua ou uma lua principal (earth, moon, mars, europa, titan, ...; veja crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = uma casca Walker exige total > 0 e planes > 0

engine-e-constellation-walker-total-is-not-multiple = o total Walker { $total } não é múltiplo de planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = a defasagem Walker F = { $phasing } deve estar em 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } não é um slot GPS expansível (a Tabela 3.2-2 do SPS PS lista B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: informe altitude_km ou semi_major_axis_km, não ambos

engine-e-constellation-needs-altitude-km-or-semi = { $what }: exige altitude_km ou semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: o semieixo maior { $v1 } km não está acima do raio de { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what }: a excentricidade { $e } deve estar em [0, 0.9)

engine-e-constellation-perigee-is-below-the-surface = { $what }: o perigeu está abaixo da superfície de { $name }

engine-e-constellation-constellation-preset-is-an-earth = constelação { $name }: a predefinição { $p } é uma constelação da Terra, o corpo é { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = constelação { $name }: predefinição { $other } desconhecida (esperado gps-baseline, gps-expandable, galileo, beidou, beidou-meo ou glonass)

engine-e-constellation-constellation-expanded-applies-only-to = constelação { $name }: `expanded` se aplica apenas à predefinição gps-expandable

engine-constellation-constellation-shell = constelação { $name } casca { $v2 }

engine-constellation-explicit-element-sets = { $satellite } conjuntos de elementos explícitos

engine-constellation-constellation-satellite = constelação { $name } satélite { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = a constelação { $name } não tem satélites: informe uma predefinição, uma [[constellation.shell]] ou uma [[constellation.satellite]]

engine-e-constellation-no-constellation-given = nenhuma constelação informada

engine-e-constellation-constellations-with-one-clock-each = { $constellations } constelações com um relógio cada excedem o limite de { $MAX_CLOCKS } relógios; use clock = "common" ou una as constelações

engine-e-constellation-must-be-finite = { $what } deve ser finito

engine-e-constellation-need-step-and-duration-step = é necessário step_s > 0 e duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = mais de 100 000 épocas; aumente step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg deve estar em [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold deve ser positivo

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg deve estar em [0.25, 90]

engine-e-constellation-need-90-lat-min-deg = é necessário -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = é necessário lon_min_deg < lon_max_deg abrangendo no máximo 360 deg

engine-e-constellation-give-at-least-one-constellation = informe ao menos uma [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points é limitado a 2000

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } satélites excedem o limite de 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: { $total } satélites ({ $names }) em torno de { $name }; disponibilidade { $global_availability_pct }% (PDOP <= { $pdop_threshold } com máscara de { $mask_deg } deg), pior local { $worst_site_availability_pct }%, PDOP mediano { $cov }, média de { $global_mean_visible } à vista; { $grid_points } pontos de grade x { $epochs } épocas (MODELLED)

engine-constellation-constellation-coverage-over-the = Cobertura da constelação sobre { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } deve ser finito e positivo

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } deve ser finito e >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw deve ser finito

engine-e-contact-schedule-satellite-altitude-km-must-be = satélite '{ $name }': altitude_km deve estar em (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satélite '{ $name }': inclination_deg deve estar em [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satélite '{ $name }': backlog_mbit deve ser >= 0

engine-e-contact-schedule-satellite-priority-must-be = satélite '{ $name }': priority deve ser > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satélite '{ $name }': eirp_dbw deve ser finito

engine-e-contact-schedule-station-lat-deg-in-90 = estação '{ $name }': lat_deg em [-90, 90], lon_deg finito

engine-e-contact-schedule-station-mask-deg-must-be = estação '{ $name }': mask_deg deve estar em [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = estação '{ $name }': alt_m deve estar em [0, 3000] (faixa da ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = estação '{ $name }': setup_s >= 0 e g_over_t_db finito

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours deve estar em (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s deve estar em (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = são necessários ao menos um satélite e uma estação

engine-e-contact-schedule-at-most-32-satellites-and = no máximo 32 satélites e 32 estações

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: { $satellites } satélites x { $stations } estações em { $duration_hours } h -> { $cands } contatos candidatos, { $greedy } agendados; { $total_del } de { $total_backlog } Mbit entregues{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: { $pairs } passagem(ns); ACM { $acm } Mbit contra CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = são necessários ao menos 2 ensaios e um sigma_m > 0 finito

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total deve estar em (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = nenhum referencial local no usuário

engine-e-dop-error-ci-singular-geometry = { $name }: geometria singular

engine-e-dop-error-ci-no-noise-free-fix = { $name }: sem solução de posição sem ruído

engine-e-dop-error-ci-no-fix = { $name }: sem solução de posição

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: geometria singular

engine-e-dop-error-mc-no-fix = { $label }: sem solução de posição

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km deve ser positivo; recebido { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes e sats_per_plane devem ser ambos diferentes de zero

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz deve ser positivo; recebido { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency deve estar em (0, 1]; recebido { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k deve ser positivo; recebido { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db deve ser não negativo; recebido { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m deve estar fora da Terra; recebido { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] GNSS da Terra à distância lunar — { $n_satellites } satélite, receptor a { $r } km{ "\u000A" }
        [many] GNSS da Terra à distância lunar — { $n_satellites } de satélites, receptor a { $r } km{ "\u000A" }
       *[other] GNSS da Terra à distância lunar — { $n_satellites } satélites, receptor a { $r } km{ "\u000A" }
    }


engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Limbo da Terra visto da constelação: { $earth_limb_half_angle_deg } deg fora do nadir — qualquer raio dirigido à Lua deve exceder esse valor{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the =
    { $n_satellites ->
        [one]
            { $n_trackable ->
                [one] { "  " }{ $n_geometrically_visible } de { $n_satellites } não ocultado; { $n_trackable } supera o limiar de rastreamento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
                [many] { "  " }{ $n_geometrically_visible } de { $n_satellites } não ocultado; { $n_trackable } superam o limiar de rastreamento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
               *[other] { "  " }{ $n_geometrically_visible } de { $n_satellites } não ocultado; { $n_trackable } superam o limiar de rastreamento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
            }
        [many]
            { $n_trackable ->
                [one] { "  " }{ $n_geometrically_visible } de { $n_satellites } não ocultados; { $n_trackable } supera o limiar de rastreamento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
                [many] { "  " }{ $n_geometrically_visible } de { $n_satellites } não ocultados; { $n_trackable } superam o limiar de rastreamento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
               *[other] { "  " }{ $n_geometrically_visible } de { $n_satellites } não ocultados; { $n_trackable } superam o limiar de rastreamento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
            }
       *[other]
            { $n_trackable ->
                [one] { "  " }{ $n_geometrically_visible } de { $n_satellites } não ocultados; { $n_trackable } supera o limiar de rastreamento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
                [many] { "  " }{ $n_geometrically_visible } de { $n_satellites } não ocultados; { $n_trackable } superam o limiar de rastreamento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
               *[other] { "  " }{ $n_geometrically_visible } de { $n_satellites } não ocultados; { $n_trackable } superam o limiar de rastreamento de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
            }
    }


engine-earth-gnss-lunar-best-link-db-hz = { "  " }melhor enlace { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }toda linha de visada rastreável fica dentro de um semicone de { $a } deg — a geometria é quase degenerada{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }VARREDURA sobre { $epochs } épocas / { $span_s } s: disponibilidade de sinal { $signal_availability }, disponibilidade de solução de posição { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }enlaces rastreáveis média { $mean_trackable }, máx. { $max_trackable }; melhor C/N0 { $w }; melhor PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = são necessários de um a seis estágios

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg deve ser finito e não negativo

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 deve ser finito e não negativo

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg deve ser finito e não negativo

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m deve ser finito e não negativo

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg deve estar em [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s deve ser finito e não negativo

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = a razão empuxo-peso na decolagem { $tw } deve exceder 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: dv ideal { $ideal_dv_m_s } m/s, perdas { $losses } m/s (gravidade { $gravity_loss_m_s }, arrasto { $drag_loss_m_s }, direcionamento { $steering_loss_m_s }, contrapressão { $back_pressure_loss_m_s }); fim da queima { $r } km a { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } deve ser finito e positivo

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body deve ser "earth" ou "mars", recebido "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = a atmosfera "{ $a }" não está disponível para o corpo "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg deve estar em (0, 90) (positivo para baixo)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m deve estar em [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg deve ser finito com |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg e longitude_deg devem ser finitos

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag deve estar em [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg deve ser finito

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s deve estar em (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m deve estar em [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s deve estar em (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame deve ser inertial|relative, recebido "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> pico { $pk_g } g a { $r } km, q de pico { $r2 } W/cm² a { $r3 } km, carga térmica { $r4 } J/cm², q_dyn de pico { $r5 } kPa; { $outcome } em { $end_time_s } s (forma fechada { $cf_g } g; MODELLED 3-DoF, sem radiativo/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } deve estar em (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } deve ser finito e não negativo

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg deve estar em [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits deve estar em 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (poço { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = o ângulo de nadir { $eta_rad }° excede o raio angular da Terra { $rho }° (não atinge a Terra)

engine-e-eo-payload-no-sun-synchronous-inclination-at = não há inclinação heliossíncrona a { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg deve estar em (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad deve ser finito e positivo

engine-e-eo-payload-half-fov-too-large = half_fov grande demais: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, FOV de ±{ $half_fov_deg }° -> faixa de { $v3 } km, GSD no nadir de { $gsd } m, acesso até { $v5 } km fora do nadir; espaçamento entre nós { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = baricentro Terra-Lua a partir de { $table }, dividido pela série lunar de Montenbruck & Gill precessada para J2000

engine-ephem-provider-jpl-mean-elements-in-the = elementos médios do JPL no plano de Laplace, taxa de longitude média a partir da taxa de rotação síncrona da IAU, somados ao seu planeta a partir de { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = direção de rotação síncrona da IAU na distância média do JPL, somada a Saturno a partir de { $table }

engine-e-ephem-provider-read = leitura de { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = o TLE não tem a linha 1 (uma linha iniciada por `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = o TLE não tem a linha 2 (uma linha iniciada por `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = efemérides analíticas `orbit` exigem um `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = o cenário de efemérides exige um `tle` ou um `orbit`

engine-e-ephemeris-step-must-be-positive = step_s deve ser positivo

engine-e-ephemeris-duration-must-be-non-negative = duration_s deve ser não negativo

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz deve ser uma frequência positiva e finita

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] { $source } traço no solo · { $n_samples } amostra · alt. { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
        [many] { $source } traço no solo · { $n_samples } de amostras · alt. { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
       *[other] { $source } traço no solo · { $n_samples } amostras · alt. { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
    }


## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` não é finito

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` não é nem segundos nem um horário UTC ISO-8601

engine-e-evidence-assemble-no-epoch-of-the-log = nenhuma época do registro cai entre { $t0 } s e { $t1 } s (o registro abrange de 0 a { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config não é um objeto

engine-e-evidence-assemble-config-json-already-has-an = config.json já tem uma entrada `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = de { $from_s } a { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` não é um horário UTC como 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } em um registro de { $log_bytes } bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } exige um valor

engine-e-evidence-cli-cannot-create = não foi possível criar { $path }: { $e }

engine-e-evidence-cli-cannot-write = não foi possível gravar { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = aviso: { $path } é legível por outros usuários; restrinja-o (chmod 600)

engine-e-evidence-cli-cannot-read-key = não foi possível ler a chave { $path }: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } não é uma chave hexadecimal

engine-e-evidence-cli-must-hold-32-byte-key = { $path } deve conter uma chave de 32 bytes como 64 dígitos hexadecimais

engine-e-evidence-cli-cannot-read = não foi possível ler { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = não foi possível ler { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } existe e não está vazio

engine-e-evidence-cli-cannot-create-2 = não foi possível criar { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = aviso: { $arg } é somente do proprietário (modo 600) e não se chama *.pub: pode ser uma chave privada. Informe o arquivo da chave pública.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` não é nem 64 dígitos hexadecimais nem um arquivo legível ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` não contém dígitos hexadecimais

engine-evidence-cli-private-key-keep-it-secret = chave privada: { $out }  (mantenha-a em segredo; nunca a envie ao repositório)

engine-evidence-cli-public-key-pub = chave pública:  { $out }.pub

engine-evidence-cli-public-key-hex = chave pública (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Entregue a chave pública aos verificadores por um canal em que confiem; eles a fixam com --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify exige um diretório de pacote

engine-e-evidence-cli-cannot-read-3 = não foi possível ler { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: nenhum certificado PEM encontrado

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }assinatura da autoridade de carimbo de tempo não verificada pelo Kshana

engine-evidence-cli-this-is-technical-record-not = Este é um registro técnico, não um parecer jurídico.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp exige um diretório de pacote

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp exige um arquivo de token

engine-e-evidence-cli-cannot-read-4 = não foi possível ler { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = não foi possível gravar { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = nota: o token fica ao lado do manifesto assinado, não dentro dele; use verify com --require-timestamp para exigi-lo.

engine-e-evidence-cli-round-trip-packs-are-not = pacotes de ida e volta não são gerados para WebAssembly

engine-e-evidence-cli-needs-scenario-path = exige um caminho de cenário

engine-e-evidence-cli-needs-from = exige --from

engine-e-evidence-cli-needs-to = exige --to

engine-e-evidence-cli-cannot-read-lab-attestation = não foi possível ler o atestado de laboratório { $p }: { $e }

engine-e-evidence-cli-cannot-read-5 = não foi possível ler { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = cenário receiver-trust inválido: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation se aplica a `receiver-trust evidence`, não a `evidence round-trip` (cujo pacote registra as condições de ensaio)

engine-e-evidence-cli-cannot-read-6 = não foi possível ler { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = não foi possível ler { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = pacote de evidências gravado em { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }épocas na janela: { $epochs_in_window }  ({ $from_s } s a { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }impressão digital do signatário: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 de manifest.json (o que uma autoridade RFC 3161 deve carimbar): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }fatia do registro: bytes { $a } a { $b } de { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }fatia do registro: registro inteiro (este registro não indica intervalo de bytes para a janela)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }atestado de laboratório registrado no manifesto assinado ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Um pacote é um registro técnico, não um parecer jurídico.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s a { $to_s } s após a primeira época do registro

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = TOML de lab-attestation inválido: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` deve ser uma tabela

engine-e-evidence-lab-invalid-lab-attestation = lab-attestation inválido: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } é obrigatório

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } excede { $MAX_FIELD } bytes

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: a data { $date } não é um dia como 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: uma montagem blindada exige enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup deve ser "conducted" ou "shielded" (recebido { $other }); uma montagem pelo ar não é aceita como ensaio de laboratório

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db deve ser finito

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = as condições de ensaio indicam { $events } evento(s), mas o cenário de pontuação tem { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = o evento '{ $id }' nas condições de ensaio ({ $onset_s } s a { $offset_s } s) não corresponde a '{ $label }' no cenário de pontuação ({ $onset_s2 } s a { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = o SHA-256 do registro ({ $have }) não é o indicado pelas condições de ensaio ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = DER truncado

engine-e-evidence-tsa-bad-der-length = comprimento DER inválido

engine-e-evidence-tsa-unexpected-der-tag = { $what }: tag DER inesperada { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = AlgorithmIdentifier vazio

engine-e-evidence-tsa-bad-utctime = UTCTime inválido

engine-e-evidence-tsa-bad-generalizedtime = GeneralizedTime inválido

engine-e-evidence-tsa-bad-time = hora inválida

engine-e-evidence-tsa-time-not-in-utc = hora não está em UTC

engine-e-evidence-tsa-bad-time-digits = dígitos de hora inválidos

engine-e-evidence-tsa-bad-bit-string = BIT STRING inválida

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: esperados três elementos

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: curto demais

engine-e-evidence-tsa-empty-extension = Extension vazia

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: o valor não é uma OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: vazio

engine-e-evidence-tsa-validity-short = Validity: curto

engine-e-evidence-tsa-pem-end-without-begin = PEM: END sem BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: base64 inválido

engine-e-evidence-tsa-pem-bad-base64-length = PEM: comprimento base64 inválido

engine-e-evidence-tsa-spki-empty = SPKI: vazio

engine-e-evidence-tsa-spki-no-oid = SPKI: sem OID

engine-e-evidence-tsa-spki-no-key = SPKI: sem chave

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: esperados dois inteiros

engine-e-evidence-tsa-unsupported-elliptic-curve = curva elíptica não suportada

engine-e-evidence-tsa-unsupported-public-key-algorithm = algoritmo de chave pública não suportado

engine-e-evidence-tsa-rsa-key-or-signature-too = chave ou assinatura RSA grande demais

engine-e-evidence-tsa-rsa-modulus-not-odd = módulo RSA não é ímpar

engine-e-evidence-tsa-rsa-signature-out-of-range = assinatura RSA fora do intervalo

engine-e-evidence-tsa-rsa-key-too-small = chave RSA pequena demais

engine-e-evidence-tsa-invalid-padding = preenchimento inválido

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: mensagem codificada longa demais

engine-e-evidence-tsa-last-octet-invalid = último octeto inválido

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: bits mais à esquerda não são zero

engine-e-evidence-tsa-pss-bad-padding = PSS: preenchimento inválido

engine-e-evidence-tsa-pss-signature-mismatch = PSS: assinatura não corresponde

engine-e-evidence-tsa-unsupported-mask-generation-function = função de geração de máscara não suportada

engine-e-evidence-tsa-mgf1-without-hash = MGF1 sem hash

engine-e-evidence-tsa-bad-pss-salt-length = comprimento de sal PSS inválido

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = uma assinatura ECDSA exige uma chave EC

engine-e-evidence-tsa-an-rsa-signature-needs-an = uma assinatura RSA exige uma chave RSA

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption sem algoritmo de resumo

engine-e-evidence-tsa-an-rsa-pss-signature-needs = uma assinatura RSA-PSS exige uma chave RSA

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey sem algoritmo de resumo

engine-e-evidence-tsa-unsupported-signature-algorithm = algoritmo de assinatura não suportado

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: vazio

engine-e-evidence-tsa-time-stamp-request-not-granted = solicitação de carimbo de tempo não concedida

engine-e-evidence-tsa-no-time-stamp-token-in = nenhum token de carimbo de tempo na resposta

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = não é um TimeStampResp nem um TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = não é CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: sem conteúdo

engine-e-evidence-tsa-signeddata-short = SignedData: curto

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: vazio

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = o conteúdo encapsulado não é um TSTInfo

engine-e-evidence-tsa-no-tstinfo = sem TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo fora de uma OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: curto

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: sem genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: sem signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = esperado exatamente um SignerInfo

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: sem sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: sem algoritmo de resumo

engine-e-evidence-tsa-signerinfo-short = SignerInfo: curto

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: sem atributos assinados

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: sem algoritmo de assinatura

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: sem assinatura

engine-e-evidence-tsa-no-serial = sem número de série

engine-e-evidence-tsa-signer-certificate-not-found = certificado do signatário não encontrado

engine-e-evidence-tsa-attribute-empty = Attribute: vazio

engine-e-evidence-tsa-attribute-no-values = Attribute: sem valores

engine-e-evidence-tsa-attribute-no-value = Attribute: sem valor

engine-e-evidence-tsa-content-type-attribute-mismatch = o atributo content-type não corresponde

engine-e-evidence-tsa-digest-failure = falha de resumo

engine-e-evidence-tsa-signature-not-an-octet-string = a assinatura não é uma OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = atributo de certificado de assinatura ess ausente

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: vazio

engine-e-evidence-tsa-ess-cert-id-not-found = id de certificado ess não encontrado

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: sem hash

engine-e-evidence-tsa-unsuitable-certificate-purpose = finalidade do certificado inadequada

engine-e-evidence-tsa-certificate-is-not-yet-valid = o certificado ainda não é válido

engine-e-evidence-tsa-certificate-has-expired = o certificado expirou

engine-e-evidence-tsa-invalid-ca-certificate = certificado de CA inválido

engine-e-evidence-tsa-certificate-chain-too-long = cadeia de certificados longa demais

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: vazio

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: sem resumo

engine-e-evidence-tsa-message-imprint-mismatch = a impressão da mensagem não corresponde

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER de comprimento indefinido não é suportado

engine-e-evidence-tsr-expected-tag-found = esperado { $what } (tag { $tag }), encontrado { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = PKIStatusInfo malformado

engine-e-evidence-tsr-the-timestamp-response-was-not = a resposta de carimbo de tempo não foi concedida

engine-e-evidence-tsr-not-timestamp-token = não é um token de carimbo de tempo

engine-e-evidence-tsr-the-token-content-type-is = o tipo de conteúdo do token não é CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = o token não contém um TSTInfo

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = a impressão da mensagem usa um algoritmo de hash não suportado

engine-e-evidence-tsr-the-imprint-is-bytes-not = a impressão tem { $digest } bytes, e não os { $want_len } que { $hash_alg } fornece

engine-e-evidence-tsr-gentime-is-not-utc = genTime não está em UTC

engine-e-evidence-tsr-malformed-gentime = genTime malformado

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime não é uma hora de calendário real

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = não é hexadecimal em minúsculas

engine-e-evidence-verify-expected-bytes-found = esperados { $N } bytes, encontrados { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = o pacote já tem um token de carimbo de tempo; use --replace para substituí-lo

engine-e-evidence-verify-not-attached-the-pack-with = não anexado: o pacote com este token não passa na verificação ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = o pacote registra um atestado de laboratório de { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = o arquivo de assinatura não termina com uma quebra de linha

engine-evidence-verify-signer-not-pinned-the-signature = signatário não fixado: a assinatura prova que o pacote está íntegro em relação à chave { $r }, que o próprio pacote indica. Compare essa impressão digital com uma obtida do signatário, ou informe a chave.

engine-evidence-verify-range-is-not-inside-log = o intervalo { $start }..{ $end } não está dentro de um registro de { $full_bytes } bytes

engine-evidence-verify-timestamp-token-states-its-imprint = o token de carimbo de tempo indica { $gen_time }; sua impressão { $v2 } manifest.json. Assinatura da autoridade de carimbo de tempo não verificada pelo Kshana: verifique-a com `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = o token de carimbo de tempo indica { $gen_time }; sua impressão { $v2 } manifest.json; a assinatura e a cadeia da autoridade de carimbo de tempo { $v3 } em relação às âncoras fornecidas.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` é a cadeia vazia

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } está fora do vocabulário

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = a faixa de custo deve ser finita, não negativa, ordenada low≤nominal≤high e ter uma fonte

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction e availability devem ser frações em [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } deve ser finito e > 0 (recebido { $v })

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } deve ser finito e >= 0 (recebido { $v })

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg deve estar em [-90, 90) (recebido { $mask_deg })

engine-e-fusion-carrier-tc-constellation-has-no-satellites = a constelação não tem satélites

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats deve ser >= 1 quando definido

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = satélite de salto { $sat } fora do intervalo

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = linha { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = linha { $lineno }: { $v } colunas, esperadas ao menos { $min }

engine-e-fusion-kfgins-line-columns = linha { $v1 }: { $v } colunas

engine-e-fusion-kfgins-line-block-lists-are-not = linha { $lineno }: listas em bloco não são suportadas

engine-e-fusion-kfgins-line-expected-key-value = linha { $lineno }: esperado `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = linha { $lineno }: chave indentada sem chave pai

engine-e-fusion-kfgins-line-only-one-level-of = linha { $lineno }: apenas um nível de aninhamento

engine-e-fusion-kfgins-line-unterminated-flow-list = linha { $lineno }: lista em fluxo não terminada

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` é uma lista, esperado um escalar

engine-e-fusion-kfgins-missing = `{ $k }` ausente

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` deve ser uma lista de três elementos

engine-e-fusion-kfgins-no-imu-sample-at-or = nenhuma amostra de IMU em starttime ou depois

engine-e-fusion-kfgins-imu-time-not-increasing-at = tempo da IMU não crescente em { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } deve ser finito e > 0 (recebido { $v })

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m deve ser finito e > 0 (recebido { $sigma_range_m })

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg deve estar em [-90, 90) (recebido { $mask_deg })

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = linha { $v1 } do CSV de trajetória: não são números: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = linha { $v1 } do CSV de trajetória: esperadas 10 colunas, recebidas { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = linha { $v1 } do CSV de trajetória: o tempo não cresce

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = o CSV de trajetória exige ao menos duas linhas

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = o CSV de trajetória cobre { $rows } s, mas o cenário dura { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: lat_deg de site deve estar em [-90, 90] e todos os campos devem ser finitos

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" não é uma predefinição GNSS ({ $e_gnss }) nem uma predefinição LEO ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: informe o usuário como `site` ou `user_ecef_m`, não ambos

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m deve ser finito e diferente do geocentro

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satélite { $id }: azimute/elevação fora do intervalo

engine-e-geometry-sky-satellite-is-given-in = sky: o satélite { $id } é dado em ECEF; a solicitação exige `site` ou `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: satélite { $id }: posição ECEF não finita

engine-e-geometry-sky-satellite-coincides-with-the = sky: o satélite { $id } coincide com o usuário

engine-e-geometry-sky-satellite-give-az-deg = sky: satélite { $id }: informe az_deg e el_deg, ou ecef_m, e nada mais

engine-e-geometry-sky-tle-is-bytes-the = sky: tle tem { $text } bytes; o limite é { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = conjunto de elementos recusado: { $e }

engine-geometry-sky-tle-holds-no-complete =
    { $n_ignored ->
        [one] sky: tle não contém nenhum conjunto completo de elementos de duas linhas; { $n_ignored } linha ignorada, a primeira: { $first }
        [many] sky: tle não contém nenhum conjunto completo de elementos de duas linhas; { $n_ignored } de linhas ignoradas, a primeira: { $first }
       *[other] sky: tle não contém nenhum conjunto completo de elementos de duas linhas; { $n_ignored } linhas ignoradas, a primeira: { $first }
    }


engine-e-geometry-sky-epoch = sky: epoch: { $e }

engine-geometry-and-more = { "." }.. e mais { $more }

engine-geometry-element-sets-propagated-by-the =
    { $n ->
        [one] { $n } conjunto de elementos propagado pelo SGP4 (WGS-72) do motor até { $iso } e rotacionado para o referencial fixo à Terra com UT1 tomado como UTC e sem movimento polar: o céu que esse conjunto de elementos dá nessa época, não uma medição dele.
        [many] { $n } de conjuntos de elementos propagados pelo SGP4 (WGS-72) do motor até { $iso } e rotacionados para o referencial fixo à Terra com UT1 tomado como UTC e sem movimento polar: o céu que esses conjuntos de elementos dão nessa época, não uma medição dele.
       *[other] { $n } conjuntos de elementos propagados pelo SGP4 (WGS-72) do motor até { $iso } e rotacionados para o referencial fixo à Terra com UT1 tomado como UTC e sem movimento polar: o céu que esses conjuntos de elementos dão nessa época, não uma medição dele.
    }


engine-geometry-element-sets-propagated-by-the-2 =
    { $n ->
        [one] { $n } conjunto de elementos propagado pelo SGP4 (WGS-72) do motor até a época do conjunto de elementos mais recente mais time_s ({ $iso }). Nenhuma época foi informada; este é, portanto, um céu representativo, não o céu de uma data indicada.
        [many] { $n } de conjuntos de elementos propagados pelo SGP4 (WGS-72) do motor até a época do conjunto de elementos mais recente mais time_s ({ $iso }). Nenhuma época foi informada; este é, portanto, um céu representativo, não o céu de uma data indicada.
       *[other] { $n } conjuntos de elementos propagados pelo SGP4 (WGS-72) do motor até a época do conjunto de elementos mais recente mais time_s ({ $iso }). Nenhuma época foi informada; este é, portanto, um céu representativo, não o céu de uma data indicada.
    }


engine-e-geometry-sky-give-systems-or-tle = sky: informe `systems` ou `tle` (com um `site`), ou `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system nomeia os satélites de `tle`; a solicitação não tem `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg deve estar em [-90, 90) (recebido { $m })

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` exige um `site` (ou `user_ecef_m`) de onde observar

engine-e-geometry-sky-time-must-be-finite = sky: time_s deve ser finito

engine-e-geometry-sky-system-asks-for-satellites = sky: o sistema "{ $name }" pede { $asked } satélites; uma solicitação comporta no máximo { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: mais de { $MAX_SATELLITES } satélites

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` exige um `site` (ou `user_ecef_m`) de onde observar

engine-e-geometry-sky-more-than-satellites-above = sky: mais de { $MAX_SATELLITES } satélites acima do horizonte

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m deve ser positivo (recebido { $sigma })

engine-e-geometry-sky-confidence-must-be-in = sky: confidence deve estar em (0, 1) (recebido { $confidence })

engine-e-geometry-sky-more-than-systems-in = sky: mais de { $MAX_CLOCKS } sistemas à vista, cada um com seu próprio relógio; agrupe os satélites em menos rótulos `system` ou use clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n deve estar em 1..={ $MAX_MC_SAMPLES } (recebido { $n })

engine-e-geometry-sky-too-few-satellites-in = sky: poucos satélites à vista para uma solução de posição; sem nuvem de Monte Carlo

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = céu TLE em { $e }, não uma medição

engine-e-geometry-invalid-sky-request-json = solicitação sky inválida (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = solicitação sky inválida (TOML): { $e }

engine-e-geometry-invalid-skyline-json = skyline inválida (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = skyline inválida (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = PRN GLONASS inválido em { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = o tipo de página { $pt } não é codificado aqui

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } bits, esperados { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } bits, esperados { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = os bits finais não são zero

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q não corresponde

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = o tipo de página { $pt } não é decodificado aqui

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } símbolos, esperados { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = padrão de sincronização não encontrado

engine-e-gnss-navmsg-gal-fnav-page-type-missing = tipo de página { $t } ausente

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav do tipo de página { $t } difere do tipo de página 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = nenhum campo Galileo { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = o tipo de palavra { $wt } não é codificado aqui

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } bits, esperados { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = o tipo de palavra { $wt } não é decodificado aqui

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = as partes da página devem ter 120 bits

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = os indicadores par/ímpar não são 0 e depois 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = não é uma página nominal (o tipo de página 1 é uma página de alerta)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } bits, esperados { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } símbolos, esperados { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = tipo de palavra { $t } ausente

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav do tipo de palavra { $t } difere do tipo de palavra 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = o registro é do sistema { $system }, não Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = o tipo 10 não tem o campo { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = o tipo 11 não tem o campo { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = o tipo 30 não tem o campo { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = o corpo CNAV tem { $body } bits, esperados 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } ou contagem TOW { $tow_count } fora do intervalo

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } bits, esperados { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = o preâmbulo não é 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = o tipo de mensagem { $t } não é decodificado aqui

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = são necessárias uma mensagem do tipo 10 e uma do tipo 11

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } no LSB { $value2 } não cabe em { $bits } { $v4 } bits

engine-e-gnss-navmsg-bits-layout-needs = { $bits } bits, o layout exige { $need }

engine-e-gnss-navmsg-no-field = nenhum campo { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } na escala 2^{ $scale_pow2 } não cabe em { $bits } { $v1 } bits

engine-e-gps-lnav-no-value-for = nenhum valor para { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: o modelo de referência "gfc" exige `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: não foi possível ler gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: modelo de referência `{ $other }` desconhecido (use "egm2008" ou "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: elipsoide `{ $other }` desconhecido (use "wgs84" ou "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations deve ser pelo menos 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations é limitado a 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = real '{ $t }' inválido

engine-e-gravity-pds-bad-integer = inteiro '{ $t }' inválido

engine-e-gravity-pds-empty-shadr-table = tabela SHADR vazia

engine-e-gravity-pds-shadr-header-has-fields-expected = o cabeçalho SHADR tem { $f } campos, esperados ao menos 6

engine-e-gravity-pds-shadr-header-negative-degree-order = cabeçalho SHADR: grau/ordem negativo ou normalização desconhecida

engine-e-gravity-pds-shadr-normalization-state-only-fully = estado de normalização SHADR { $normalization } (apenas o totalmente normalizado, estado 1, é suportado)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = a longitude/latitude de referência SHADR deve ser 0

engine-e-gravity-pds-non-physical-gm-must-be = GM não físico (deve ser finito e positivo)

engine-e-gravity-pds-non-physical-reference-radius-must = raio de referência não físico (deve ser finito e positivo)

engine-e-gravity-pds-shadr-record-fields = registro SHADR { $v1 }: { $f } campos

engine-e-gravity-pds-shadr-record-bad = registro SHADR { $v1 }: (n, m) = ({ $n }, { $m }) inválido

engine-e-gravity-pds-shadr-record-non-finite-coefficient = registro SHADR { $v1 }: coeficiente não finito

engine-e-gravity-pds-no-shadr-coefficient-records = nenhum registro de coeficientes SHADR

engine-e-gravity-pds-shadr-table-incomplete-missing = tabela SHADR incompleta: falta (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = earth_gravity_constant / gravity_constant ausente

engine-e-gravity-sh-missing-radius = radius ausente

engine-e-gravity-sh-non-physical-earth-gravity-constant = earth_gravity_constant não físico (deve ser finito e positivo)

engine-e-gravity-sh-non-physical-radius-must-be = radius não físico (deve ser finito e positivo)

engine-e-gravity-sh-no-gfc-coefficient-lines = nenhuma linha de coeficientes gfc

engine-e-gravity-sh-read-error = erro de leitura: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = linha { $lineno }: norm { $v } não é suportado (apenas fully_normalized)

engine-gravity-sh-line-bad = linha { $lineno }: { $what } inválido

engine-e-gravity-sh-line-degree-above-the-declared = linha { $lineno }: grau { $n } acima do max_degree declarado { $dm }

engine-e-gravity-sh-line-order-above-degree = linha { $lineno }: ordem { $m } acima do grau { $n }

engine-e-gravity-sh-line-time-variable-term-is = linha { $lineno }: o termo variável no tempo `{ $key }` não é suportado (apenas modelos estáticos)

engine-e-gravity-sh-missing-end-of-head = end_of_head ausente

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s deve ser positivo (recebido { $step_s })

engine-e-gse-sim-duration-must-be-positive-got = duration_s deve ser positivo (recebido { $duration_s })

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    { $n ->
        [one] o cenário produz { $n } época (são necessárias ≥ 2); aumente duration_s ou diminua step_s
        [many] o cenário produz { $n } de épocas (são necessárias ≥ 2); aumente duration_s ou diminua step_s
       *[other] o cenário produz { $n } épocas (são necessárias ≥ 2); aumente duration_s ou diminua step_s
    }


## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = o registro contém um erro de tempo não finito

engine-e-holdover-test-unknown-mask-expected-one-of = máscara { $id } desconhecida; esperada uma de { $masks }

engine-e-holdover-test-every-budget-max-abs-te = todo max_abs_te_ns de orçamento deve ser finito e positivo

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } está fora do registro ({ $t0_s } a { $t_end } s em seu próprio eixo de tempo)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } deve ser posterior a gnss_removed_s ({ $gnss_removed_s }) e não ultrapassar o fim do registro ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = a etapa de holdover não contém nenhuma amostra

engine-holdover-test-the-record-has-no-step = o registro não tem etapa { $step }: o GNSS foi removido na primeira amostra

engine-holdover-test-the-step-has-samples-the = a etapa { $step } tem { $te_ns } amostras; os estimadores exigem pelo menos 13

engine-e-holdover-test-step-with-mask-has-no = uma etapa com máscara não tem curva

engine-e-holdover-test-cannot-read-csv-path = não foi possível ler csv_path { $path }: { $e }

engine-holdover-test-recovered-after-gnss-returned = ; recuperado { $t } s após o retorno do GNSS

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }{ $rec } (MODELLED, medido em relação à máscara)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m deve ser finito e > 0 (recebido { $sigma_pr_m })

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba deve ser >= 0 e coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = RECUSADO: os dois ramos não têm um tempo de média comum. O ramo óptico acumula sobre integration_s = { $integration_s } s; a largura de banda de ruído de malha do ramo RF, B_L = { $dll_bandwidth_hz } Hz, faz a média sobre 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Uma razão entre dois sigmas tomados em tempos de média diferentes não é uma comparação, de modo que nenhuma é apresentada. Remova a substituição rf_dll_bandwidth_hz (ela passa então a 1/(2*integration_s)) ou defina-a como { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = RECUSADO: um ramo não é um sigma finito positivo utilizável (óptico { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), de modo que nenhuma razão é formada.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = rf_band '{ $other }' desconhecido (esperado s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } deve ser finito

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db deve ser finito e >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    { $n_sites ->
        [one] hybrid-optical-rf | área óptica { $footprint_m } m, { $detected_photons } fótons -> σ de distância { $c } mm, σ de tempo { $c2 } ps | HPL cross-RAIM { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilidade { $c4 }% ({ $n_sites } local) | transferência sem salto { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjunta { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | verificados em relação a referência externa independente: CRLB/χ²-PL/união/transferência; calculados a partir de um modelo, sem referência externa: σ/climatologia
        [many] hybrid-optical-rf | área óptica { $footprint_m } m, { $detected_photons } fótons -> σ de distância { $c } mm, σ de tempo { $c2 } ps | HPL cross-RAIM { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilidade { $c4 }% ({ $n_sites } de locais) | transferência sem salto { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjunta { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | verificados em relação a referência externa independente: CRLB/χ²-PL/união/transferência; calculados a partir de um modelo, sem referência externa: σ/climatologia
       *[other] hybrid-optical-rf | área óptica { $footprint_m } m, { $detected_photons } fótons -> σ de distância { $c } mm, σ de tempo { $c2 } ps | HPL cross-RAIM { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilidade { $c4 }% ({ $n_sites } locais) | transferência sem salto { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjunta { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | verificados em relação a referência externa independente: CRLB/χ²-PL/união/transferência; calculados a partir de um modelo, sem referência externa: σ/climatologia
    }


## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa deve estar em [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class deve ser >= 1

engine-impairment-eval-impairment-eval-detector-auc-in =
    { $n_cases ->
        [one] impairment-eval | detector { $detector } | AUC { $auc_in } dentro / { $auc_out } fora (diferença { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ alvo { $target_pfa } | { $n_cases } caso | MODELLED sintético
        [many] impairment-eval | detector { $detector } | AUC { $auc_in } dentro / { $auc_out } fora (diferença { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ alvo { $target_pfa } | { $n_cases } de casos | MODELLED sintético
       *[other] impairment-eval | detector { $detector } | AUC { $auc_in } dentro / { $auc_out } fora (diferença { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ alvo { $target_pfa } | { $n_cases } casos | MODELLED sintético
    }


engine-e-impairment-eval-unknown-detector-energy-agc-sqm = detector '{ $other }' desconhecido (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = imu_grade { $other } desconhecido; esperado um de navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = combination { $other } desconhecida; esperada uma de rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = trn_fix_mode { $other } desconhecido; esperado um de none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } deve ser finito e não negativo (recebido { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m deve indicar ao menos um limiar

engine-e-inertial-coast-crossing-thresholds-entries-must-be = as entradas de crossing_thresholds_m devem ser finitas e positivas (recebido { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades deve indicar ao menos uma classe de IMU

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s deve ser finito e não negativo (recebido { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 deve ser finito e não negativo (recebido { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg deve ser finito e estar dentro de (-89, 89) (recebido { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m deve estar dentro de [-1000, 100000] (recebido { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s deve ser positivo

engine-e-inertial-coast-drift-band-must-satisfy-lo = a faixa de deriva deve satisfazer 0 < lo < hi (recebido lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = serializando o resultado de ins-trn-coast: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | IMU { $grade }, { $speed } m/s, combinação { $comb } | { $heads } | TRN { $mode } pico { $peak_error_m } m ao longo de { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va derivado da física do interferômetro de átomos frios)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = o cenário tem { $toml_text } bytes, acima do limite de { $max_bytes } bytes

engine-e-inline-only-the-scenario-kind-reads-its = o tipo de cenário `{ $kind }` lê seus dados de arquivos do host, portanto esta superfície não o executa; use a linha de comando `kshana`

engine-e-inline-only-the-field-names-file-this = o campo `{ $k }` nomeia um arquivo: esta superfície aceita apenas conteúdo embutido

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = JSON de trace: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = conjunto de dados `{ $key }` desconhecido; permitidos: { $v1 }, ou um conjunto de dados personalizado

engine-e-interference-map-api-dataset-is-data-but-the = o conjunto de dados `{ $key }` é de dados { $kind }, mas o tipo de entrada é { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } não é uma data YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = opção `{ $a }` desconhecida

engine-e-interference-map-cli-expected-positional-argument-got = esperado(s) { $positionals } argumento(s) posicional(is), recebido(s) { $pos }

engine-e-interference-map-cli-cannot-read = não foi possível ler { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom exige { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } já existe; o Kshana não sobrescreve mapas. Remova-o ou escolha outro diretório em --out

engine-interference-map-cli-note-cell-deg-is-not = nota: --cell-deg { $cell_deg } não é o tamanho de célula fixado antecipadamente ({ $PREREGISTERED_CELL_DEG }); os mapas o indicam

engine-e-interference-map-cli-cannot-create = não foi possível criar { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged =
    { $n_deg ->
        [one] gravado { $path }: { $cells } células publicadas, { $n_deg } sinalizada
        [many] gravado { $path }: { $cells } células publicadas, { $n_deg } sinalizadas
       *[other] gravado { $path }: { $cells } células publicadas, { $n_deg } sinalizadas
    }


engine-interference-map-cli-no-usable-rows-nothing-written = nenhuma linha utilizável: nada gravado

engine-e-interference-map-cli-unknown-subcommand = subcomando `{ $other }` desconhecido

engine-e-interference-map-cli-the-downloaded-file-sha-256 = o SHA-256 do arquivo baixado ({ $got }) não coincide com o valor fixado ({ $expected }); o arquivo foi descartado

engine-e-interference-map-cli-cannot-write = não foi possível gravar { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl não foi encontrado no PATH. Instale o curl ou baixe { $NATURAL_EARTH_LAND_URL } por conta própria e confira se seu SHA-256 é { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = não foi possível executar o curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = gravado { $out }: polígonos de terra do Natural Earth, SHA-256 verificado (domínio público, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = nenhum arquivo trace_full_* em { $path }

engine-e-interference-map-cli-cannot-read-2 = não foi possível ler { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } não é uma data YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: data de mapa inválida

engine-e-interference-map-cli-cannot-write-2 = não foi possível gravar { $out }: { $e }

engine-interference-map-cli-route-length-km = comprimento da rota { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Ressalvas: uma célula degradada não identifica interferência como causa; células não observadas não são evidência de rota livre; isto não é uma previsão.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = polígonos de terra: JSON inválido: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = coluna obrigatória `{ $name }` ausente

engine-e-interference-map-cannot-read-input = não foi possível ler a entrada: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` não é uma data (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours deve ser { $MIN_DELAY_HOURS } ou mais: o observatório não publica antes disso

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg deve ser { $MIN_CELL_DEG } ou mais grosseiro: o observatório publica apenas células grosseiras

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } ainda não pode ser publicado: seu produto é liberado somente a partir de { $fmt_utc } ({ $delay_hours } h após o fim do dia)

engine-interference-map-observatory-kshana-observatory-ads = OBSERVATÓRIO KSHANA  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = CÉLULAS DE { $trim_deg } DEG  DIA UTC  NÃO OBSERVADO NÃO SIGNIFICA LIVRE  NENHUMA CAUSA ATRIBUÍDA

engine-interference-map-observatory-source-licence = FONTE { $dataset }  LICENÇA { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADADAS  { $summary2 } NÃO DEGRADADAS  { $summary3 } NÃO OBSERVADAS (CÉLULAS PUBLICADAS)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Observatório Kshana, mapa de precisão de navegação ADS-B, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = não foi possível criar { $path } (o Kshana não sobrescreve produtos): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = a entrada não tem relatório utilizável para { $day } (dias encontrados: { $days })

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } já existe; o Kshana não sobrescreve produtos

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interference-map-observatory-cells-published-degraded-incident = { $p } células publicadas, { $p2 } degradadas, { $p3 } incidente(s)

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } linhas reexecutadas sob { $variants } variantes: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = o mapa não é um JSON válido: { $e }

engine-e-interference-map-route-route-invalid-json = rota: JSON inválido: { $e }

engine-e-interference-map-route-route-line-is-not-lat = rota: a linha { $v1 } não é `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Exportação do Kshana { $v1 }. Época: { $epoch_note }. Objetos em movimento: GCRS (referenceFrame INERTIAL), metros, segundos após a época. Locais fixos: WGS 84 fixo à Terra (referenceFrame FIXED), metros.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Posição: GCRS, metros.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Latitude { $lat_deg } deg, longitude { $lon_deg } deg, altura { $h_m } m acima do elipsoide WGS 84. Posição: fixa à Terra, metros.

engine-interop-czml-radius-along-the-ground = { $description }. Raio de { $radius_m } m ao longo do solo.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Sem tempo: longitude e latitude WGS 84 em graus, fixadas ao solo.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Posições fixas à Terra; uma MultiLineString é cortada no antimeridiano, e times_utc então lista apenas as amostras originais.

engine-interop-geojson-kshana-export-epoch = Exportação do Kshana { $v1 }. Época: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = GeoJSON inválido: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString não tem array coordinates

engine-e-interop-geojson-an-rfc-7946-linestring-needs = uma LineString RFC 7946 exige duas ou mais posições

engine-interop-geojson-position-is-not-an-array = a posição { $i } não é um array de dois ou três números

engine-interop-geojson-position-longitude-is-not-number = posição { $i }: a longitude não é um número

engine-interop-geojson-position-latitude-is-not-number = posição { $i }: a latitude não é um número

engine-e-interop-geojson-position-longitude-is-outside-180 = posição { $i }: a longitude { $lon } está fora de [-180, 180] (o GeoJSON põe a longitude primeiro)

engine-e-interop-geojson-position-latitude-is-outside-90 = posição { $i }: a latitude { $lat } está fora de [-90, 90] (o GeoJSON põe a longitude primeiro)

engine-e-interop-geojson-track-needs-two-or-more = uma trajetória exige dois ou mais pontos de passagem

engine-e-interop-geojson-the-route-spans-more-than = a rota abrange mais de 180 graus de longitude; os tipos de trajetória avançam em graus simples e não podem cruzar o antimeridiano

engine-e-interop-geojson-position-is-deg-from-an = a posição { $worst } está a { $worst2 } deg de uma trajetória reta com espaçamento uniforme (tolerância { $tol_deg } deg); os tipos de trajetória percorrem start + i*step, portanto informe posições com espaçamento uniforme sobre uma reta, ou apenas as duas extremidades

engine-e-interop-geojson-route-applies-to-the-kinds = uma rota se aplica aos tipos que percorrem uma trajetória de pontos de passagem (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` não aceita entrada de trajetória

engine-e-interop-geojson-scenario-toml-is-not-table = o TOML do cenário não é uma tabela

engine-e-interop-geojson-cannot-serialise-scenario = não foi possível serializar o cenário: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = formato de exportação '{ $other }' desconhecido; esperado um entre czml, kml, geojson, stk, sigmf, all ou list

engine-e-interop-member = membro { $label }: { $e }

engine-interop-the-scenario-could-not-be = não foi possível exportar o cenário: { $m }

engine-e-interop-invalid-spectrum-scenario = cenário de espectro inválido: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } amostra de tempo é mais do que uma exportação grava ({ $MAX_SAMPLES })
        [many] { $n } de amostras de tempo são mais do que uma exportação grava ({ $MAX_SAMPLES })
       *[other] { $n } amostras de tempo são mais do que uma exportação grava ({ $MAX_SAMPLES })
    }


engine-e-interop-scene-objects-samples-is-more-than = { $items } objetos x { $times } amostras é mais do que uma exportação grava ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = cenário { $kind } inválido: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = jammer { $jammer_type }, potência de transmissão de { $power_dbw } dBW, ganho de antena de { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, a partir das equações de enlace do tipo jamming, com o jammer no horizonte do receptor e perda em espaço livre

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (a etapa [pass] da cadeia)

engine-interop-scene-circular-orbit-km-altitude-deg = órbita circular, altitude de { $altitude_km } km, inclinação de { $inclination_deg } deg (elementos médios SGP4 no início da janela, como o tipo passes os propaga)

engine-interop-scene-ground-station-deg-elevation-mask = estação terrestre, máscara de elevação de { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; os estados GCRS e fixos à Terra são a saída própria do tipo ephemeris (UT1 e movimento polar como o cenário os define)

engine-interop-scene-static-scene-the-kind-flies = cena estática: o tipo { $kind } percorre uma trajetória de pontos de passagem sem tempo

engine-interop-scene-true-track-flown-gps-denied = trajetória verdadeira percorrida sem GPS: { $track } pontos de passagem a partir de start_lat_deg/start_lon_deg em passos de step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` não tem cena

engine-e-interop-scene-missing-numeric = `{ $k }` numérico ausente

engine-e-interop-scene-missing-integer-waypoints = `waypoints` inteiro ausente

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } está fora de 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } a { $altitude_km } km, inclinação de { $inclination_deg } deg (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = o cenário não informa `epoch`; t = 0 é { $epoch }, a época mais antiga entre os dados próprios dos satélites (época de TLE, de efemérides de transmissão ou de SP3). Cada satélite é propagado a partir de sua própria época, e essas épocas abrangem { $spread_h } h: as marcas de tempo seguem a premissa do motor de que todo satélite começa em t = 0, enquanto cada posição é rotacionada para os referenciais GCRS e fixo à Terra no instante do próprio satélite. As exportações SP3 e OEM rotulam t = 0 como 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = o cenário não informa `epoch`; t = 0 é { $epoch }, a época dos dados próprios dos satélites (época de TLE, de efemérides de transmissão ou de SP3). As exportações SP3 e OEM rotulam t = 0 como 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } objetos x { $times_s } amostras é mais do que uma exportação grava ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = usuário { $user_environment }, em movimento (velocidade e rumo constantes do tipo)

engine-interop-scene-user-receiver = usuário { $user_environment } (receptor)

engine-interop-scene-user-orbit-km-altitude-deg = órbita do usuário, altitude de { $altitude_km } km, inclinação de { $inclination_deg } deg (kepleriana{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = nenhum objeto em movimento { $index }

engine-interop-stk-kshana-export-object = # Exportação do Kshana { $v1 }: { $scene }, objeto { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = jammer { $jammer_type }, potência de transmissão de { $power_dbw } dBW, ganho de antena de { $gain_dbi } dBi (um parâmetro do orçamento de enlace do cenário, não um sinal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` não tem trajetória de veículo para exportar; a exportação para bancada de testes abrange os tipos gnss-ins, jamming e gnss-sim

engine-e-interop-testbench-empty-motion-csv = CSV de movimento vazio

engine-e-interop-testbench-motion-csv-header-is-not = o cabeçalho do CSV de movimento não corresponde às colunas esperadas: { $head }

engine-e-interop-testbench-row-fields-expected = linha { $v1 }: { $f } campos, esperados { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = linha { $v1 }: a coluna { $motion_columns } não é um número

engine-e-interop-testbench-line-no = linha { $v1 }: sem `$`

engine-e-interop-testbench-line-no-checksum = linha { $v1 }: sem soma de verificação

engine-e-interop-testbench-line-bad-checksum-field = linha { $v1 }: campo de soma de verificação inválido

engine-e-interop-testbench-line-checksum-mismatch = linha { $v1 }: soma de verificação divergente

engine-e-interop-testbench-line-short-gga = linha { $v1 }: GGA curta

engine-interop-testbench-line-bad-latitude = linha { $v1 }: latitude inválida

engine-interop-testbench-line-bad-longitude = linha { $v1 }: longitude inválida

engine-e-interop-testbench-line-bad-altitude = linha { $v1 }: altitude inválida

engine-e-interop-testbench-line-bad-separation = linha { $v1 }: separação inválida

engine-e-interop-testbench-line-short-rmc = linha { $v1 }: RMC curta

engine-e-interop-testbench-line-rmc-with-no-preceding = linha { $v1 }: RMC sem GGA anterior

engine-e-interop-testbench-line-gga-and-rmc-times = linha { $v1 }: os tempos de GGA e RMC diferem

engine-e-interop-testbench-line-bad-speed = linha { $v1 }: velocidade inválida

engine-e-interop-testbench-line-bad-course = linha { $v1 }: rumo inválido

engine-e-interop-testbench-line-bad-time-or-date = linha { $v1 }: hora ou data inválida

engine-e-interop-testbench-gga-with-no-following-rmc = uma GGA sem RMC seguinte

engine-e-interop-testbench-waypoint-file-needs-at-least = um arquivo de pontos de passagem exige ao menos duas amostras

engine-e-interop-testbench-the-sample-step-is-not = o passo de amostragem de { $step } s não é um número inteiro de milissegundos

engine-e-interop-testbench-the-samples-are-not-equally = as amostras não têm espaçamento uniforme: o intervalo { $v1 } é de { $dt } s, o primeiro é de { $step } s

engine-e-interop-testbench-empty-waypoint-file = arquivo de pontos de passagem vazio

engine-e-interop-testbench-waypoint-not-three-numbers = ponto de passagem { $v1 }: não são três números

engine-e-interop-testbench-waypoint-fields-expected = ponto de passagem { $v1 }: { $f } campos, esperados 3

engine-e-interop-testbench-events-csv-header-is-not = o cabeçalho do CSV de eventos não é label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = linha de evento { $v1 }: esperados 5 campos

engine-e-interop-testbench-event-row-unknown-kind = linha de evento { $v1 }: tipo { $f } desconhecido

engine-e-interop-testbench-event-row-bad-onset = linha de evento { $v1 }: início inválido

engine-e-interop-testbench-event-row-bad-end = linha de evento { $v1 }: fim inválido

engine-interop-testbench-events-label-kind-onset-end =
    { "\u000A" }{ "[" }[events]]
    label = { $label }
    kind = { $kind }
    onset_s = { $round_dp }
    end_s = { $round_dp2 }{ "\u000A" }

engine-interop-testbench-no-waypoints-txt-written = nenhum .waypoints.txt gravado: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = não é um horário UTC `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = { $what } ausente

engine-e-ionex-bad-number-in = { $what }: número inválido em { $col }

engine-e-ionex-two-digit-year = { $what }: ano de dois dígitos { $year }

engine-e-ionex-no-end-of-header = sem END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = mapas IONEX dependentes de altura (3-D) não são suportados

engine-e-ionex-zero-grid-step = passo de grade igual a zero

engine-e-ionex-grid-needs-at-least-nodes = a grade exige ao menos 2 x 2 nós

engine-e-ionex-map-no = mapa { $index }: sem { $end_label }

engine-e-ionex-map-band-latitude-header-grid = mapa { $index }: faixa { $band } latitude { $band_lat }, grade do cabeçalho { $want }

engine-e-ionex-map-band-longitudes-differ = mapa { $index }: as longitudes da faixa { $band } diferem

engine-e-ionex-map-band-truncated = mapa { $index }: faixa { $band } truncada

engine-e-ionex-map-bands-header-grid-has = mapa { $index }: { $band } faixas, a grade do cabeçalho tem { $n_lat }

engine-e-ionex-map-no-epoch-of-current = mapa { $index }: sem EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } mapas TEC, cabeçalho # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = épocas dos mapas TEC não crescentes

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz não comporta um número inteiro de amostras por período de { $code } ({ $spc } amostras)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods e noncoherent devem ser positivos

engine-e-iq-acq-stream-ended-after-of-samples = o fluxo terminou após { $got } de { $needed } amostras

engine-e-iq-acq-cfar-reference-cells-must-be = as células de referência CFAR devem ser em número par e no mínimo 2 (recebido { $n })

engine-e-iq-acq-cfar-stride-must-be-at = o passo CFAR deve ser de ao menos 1 atraso

engine-e-iq-acq-cfar-per-cell-pfa-must = a Pfa por célula do CFAR deve estar em (0, 1) (recebido { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = a janela CFAR alcança { $reach } atrasos de cada lado, larga demais para um período de { $samples_per_period } atrasos

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = formato de superfície { $s } desconhecido: esperado csv, json ou bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = a superfície teria { $spc_cells } células (limite { $MAX_SURFACE_CELLS }): aumente o passo Doppler ou reduza a faixa Doppler

engine-e-iq-acq-surface-surface-header = cabeçalho da superfície: { $e }

engine-e-iq-acq-surface-surface-schema-expected = esquema da superfície { $schema }; esperado { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = corpo da superfície: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = gravação '{ $id }': format e sample_rate_hz devem ser informados juntos

engine-e-iq-campaign-conditions-test-conditions-json = condições de ensaio (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = condições de ensaio (TOML): { $e }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf exige uma gravação SigMF (recebido { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = metadados SigMF: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = metadados SigMF: global core:sample_rate ausente

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: core:sample_start ausente

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: sem core:sample_count e sem pontos de potência para encerrar o evento

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema deve ser "{ $SCHEMA }" (recebido "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id não deve ser vazio

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s deve ser finito e >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 deve ter 64 dígitos hexadecimais

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind deve ser "iq" ou "receiver-log" (recebido "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = é necessário ao menos um grupo [[expected]]

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids não deve ser vazio

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at }: { $key } lista { $n } valor; informe um por id ({ $ids })
        [many] { $at }: { $key } lista { $n } de valores; informe um por id ({ $ids })
       *[other] { $at }: { $key } lista { $n } valores; informe um por id ({ $ids })
    }


engine-e-iq-campaign-conditions-duplicate-id = { $at }: id duplicado

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s deve ser posterior a onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects deve ser "all" ou uma lista de ids

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: o id { $bad } de affects não está em [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q deve ser positivo

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points não deve ser vazio

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points deve estar em ordem de tempo

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points deve ser finito

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" exige reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = os eventos '{ $id }' e '{ $id2 }' se sobrepõem em um satélite compartilhado

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s deve ser >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s deve ser positivo

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = gravação '{ $id }': o SHA-256 { $sha } não corresponde ao declarado { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to =
    { $n ->
        [one] { $code }: a gravação contém { $buf } amostras, { $n } necessária para a aquisição
        [many] { $code }: a gravação contém { $buf } amostras, { $n } necessárias para a aquisição
       *[other] { $code }: a gravação contém { $buf } amostras, { $n } necessárias para a aquisição
    }


engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s deve ser positivo

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db deve ser positivo

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s deve ser >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz deve ser positivo

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs deve ser no mínimo 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = campanha (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = campanha (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions deve listar ao menos um arquivo ou padrão glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds deve ser >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = os nomes de frontend devem ser não vazios e únicos ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' não corresponde a nenhum arquivo

engine-e-iq-campaign-spec-recording-id-appears-in-both = o id de gravação '{ $w }' aparece em { $w2 } e em { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names exige inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: nenhum projeto '{ $n }' em { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = linha de referência { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = perfil de C/N0: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = perfil de C/N0: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segmento { $i }: os valores de step devem ser finitos

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segmento { $i }: ramp exige end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segmento { $i }: points exige t_s e db de mesmo tamanho e não vazios

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segmento { $i }: t_s deve ser estritamente crescente

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segmento { $i }: points deve ser finito

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segmento { $i }: o s4 de fade deve estar em (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segmento { $i }: o tau_s de fade deve ser positivo

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: a gravação contém { $samples } amostras, { $need } necessárias para esta busca

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: indique o formato com --surface-format csv|json|bin, ou termine o caminho em .csv, .json ou .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = aquisição: { $fs_hz } Hz, { $coherent_periods } período(s) coerente(s) x { $noncoherent } não coerente(s), pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = relatório reconstruído: { $cells_present } de { $cells_total } célula(s), { $rows } linha(s), { $rows_failed } não atendendo a um limiar; resumo { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    campanha { $name }: { $cells_total } célula(s); { $cells_skipped } já concluída(s), { $cells_run } executada(s) agora, { $cells_failed } com falha, { $cells_pending } pendente(s)
    saída: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    primeira falha ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: { $events } evento(s), { $tc } satélite(s) esperado(s); hash das condições { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono oblíquo { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono vertical { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = cintilação S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = multipercurso { $h }m solo { $multipath_ground }

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground deve ser dry, wet ou sea (recebido { $other })

engine-e-iq-cli-channel-give-at-most-one-of = informe no máximo um entre --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass espera lo,hi (recebido { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass exige lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } com transição de { $transition } Hz não cabe abaixo de fs/2 ({ $v1 } Hz); estreite a banda ou a transição

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits deve estar em 1..=16 (recebido { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = { $total } amostras filtradas ({ $fs_hz } Hz) para { $out } ({ $format }); arquivo auxiliar { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = não foi possível ler { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = cenário labfit inválido: { $e }

engine-iq-cli-labfit-fitted-run-wrote = { $runs } execução(ões) ajustada(s); gravado { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = { $fit_units } unidade(s) ajustada(s) a partir da campanha; gravado { $written }

engine-iq-cli-labfit-cannot-write = não foi possível gravar { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } exige um valor

engine-e-iq-cli-cannot-parse = { $k }: não foi possível interpretar { $v }

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } aceita { $n } argumento posicional, recebido(s) { $pos }
        [many] iq { $cmd } aceita { $n } de argumentos posicionais, recebido(s) { $pos }
       *[other] iq { $cmd } aceita { $n } argumentos posicionais, recebido(s) { $pos }
    }


engine-e-iq-cli-cannot-parse-2 = { $k }: não foi possível interpretar { $p }

engine-iq-cli-unknown-iq-processing-command-expected = comando de processamento iq { $other } desconhecido; esperado scene, acquire, track, sweep, labfit, frontend, monitor, campaign ou conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = o PRN { $id } está fora da faixa para GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = nenhuma efeméride GPS íntegra encontrada para os PRNs solicitados

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos espera lat,lon,alt (recebido { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; perfil de C/N0 ({ $segments } segmento(s))

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format deve ser csv ou jsonl (recebido { $other })

engine-iq-cli-scene-integer-scale-lsb-noise-normalised = ; escala inteira: 1 LSB = { $sc } unidades normalizadas ao ruído (RMS esperado { $v1 } LSB por componente), { $clipped } elemento(s) saturado(s)

engine-iq-cli-scene-written-by-kshana-iq-scene = gravado por kshana iq scene: uma cena SIMULADA, não uma gravação{ $scale_note }

engine-iq-cli-scene-ion-sdr-metadata = metadados ION SDR { $path }

engine-iq-cli-scene-sigmf-data-meta = dados SigMF { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = gravado por kshana iq scene{ $scale_note }

engine-iq-cli-scene-wrote-samples-hz-to-truth = { $samples } amostras gravadas ({ $format }, { $fs_hz } Hz) em { $data_path }; { $truth_records } registros de referência em { $truth_path }; { $meta_note }; canal: { $chan_desc }{ $scale_note }

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } não pode ser combinado com --design: sweep executa todos os projetos do arquivo

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-cli-sweep-loop-design-sweep-design-prn = varredura de projetos de malha: { $rows } resultado(s) (projeto, PRN){ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: a gravação contém { $samples } amostras, { $need } necessárias para a aquisição

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: não adquirido (estatística { $statistic } < limiar { $threshold }); aumente --doppler-max, --acq-coherent ou --acq-noncoherent, ou verifique a gravação

engine-iq-cli-track-designs-and-differ-in-integration = os projetos { $first } e { $d } diferem em integration.extra_taps_chips; os projetos de uma mesma execução devem coincidir para que todo registro de saída tenha as mesmas colunas

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: indique o formato com --epochs-format csv|jsonl|bin, ou termine o caminho em .csv, .jsonl ou .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz equivalem a { $r } amostras por chip de { $c }: uma amostragem comensurável transforma o discriminador de código em uma escada (com 2 amostras/chip o DLL oscila, cerca de 0.09 chip RMS de erro de código a 45 dB-Hz); o jitter e o viés das malhas de código desta gravação não são representativos. Use uma taxa que não seja múltipla da metade da taxa de chip para avaliar as malhas de código.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = o processo de trabalho terminou antes de processar esta entrada

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = opção { $s } desconhecida

engine-e-iq-io-cli-format-needs-rate = --format exige --rate

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } aceita { $n } argumento de caminho, recebido(s) { $pos }
        [many] iq { $cmd } aceita { $n } de argumentos de caminho, recebido(s) { $pos }
       *[other] iq { $cmd } aceita { $n } argumentos de caminho, recebido(s) { $pos }
    }


engine-iq-io-cli-unknown-iq-command = comando iq { $other } desconhecido

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] { $n } amostra gravada ({ $to }, { $fs_hz } Hz) em { $files }; { $w } elemento(s) saturado(s){ $v4 }
        [many] { $n } de amostras gravadas ({ $to }, { $fs_hz } Hz) em { $files }; { $w } elemento(s) saturado(s){ $v4 }
       *[other] { $n } amostras gravadas ({ $to }, { $fs_hz } Hz) em { $files }; { $w } elemento(s) saturado(s){ $v4 }
    }


## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow lê apenas gravações de canal único

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow lê uma gravação com uma captura, esta tem { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: sem core:sample_rate positivo

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: a captura não começa em um limite de byte

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = formato de amostra { $name } desconhecido: esperado, por exemplo, ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, opcionalmente terminando em _qi para complexo

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = o sample_rate_hz { $sample_rate_hz } do arquivo auxiliar não é positivo

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: as gravações .sdrx contêm um fluxo; o canal { $channel } não existe

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: arquivo bruto sem arquivo auxiliar; indique seu formato ou grave { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = não foi possível serializar a linha: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = projeto de filtro { $design } inválido: passband_frac em (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = a FI { $if_hz } Hz deve estar estritamente entre 0 e metade da taxa de amostragem ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }dados sdrx: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization } bits { $enc } { $fmt } ({ $packed_bits } bits/amostra)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = core:datatype SigMF { $datatype } não suportado: os suportados são ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be e os reais ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } não é um core:datatype SigMF

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = metadados SigMF inválidos: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } não tem core:datatype SigMF; grave-o como bruto

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } não corresponde ao { $c0 } da primeira gravação

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: sem core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } não é positivo

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } a { $rate } Hz não corresponde ao { $f0 } a { $r0 } Hz da primeira gravação

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $n_file ->
        [one] { $name }: a captura na amostra { $sample_start } está fora de ordem ou além da { $n_file } amostra dos dados
        [many] { $name }: a captura na amostra { $sample_start } está fora de ordem ou além das { $n_file } de amostras dos dados
       *[other] { $name }: a captura na amostra { $sample_start } está fora de ordem ou além das { $n_file } amostras dos dados
    }


engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: a primeira captura não começa em um limite de byte

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = canal { $channel } solicitado; a gravação tem { $channels } (os canais são contados a partir de 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = coleção SigMF inválida: { $e }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: o SHA-512 { $got } não corresponde ao { $h } da coleção

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = o fluxo { $select } de { $channels } fluxos intercalados não existe (os fluxos são contados a partir de 0)

engine-e-iq-io-stream-sample-of-does-not-start = a amostra { $k } de { $format } não começa em um limite de byte

engine-e-iq-io-stream-time-window-start-duration-both = janela de tempo início { $start_s } s, duração { $duration_s } s: ambos devem ser não negativos

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = Q declarado mais prejudicial (cw): nenhum valor de tabela para o tipo `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: a campanha não está completa

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: o DIGEST { $on_disk } não corresponde às células ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = gravação `{ $id }`: o hash das condições de ensaio { $h } não corresponde ao registrado { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = sinal `{ $signal }`: taxa de chip desconhecida

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = nenhuma execução é utilizável para o ajuste de travamento: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = dados insuficientes: não ajustado ({ $m } gravações; são necessárias ao menos { $min_rec })

engine-iq-labfit-iqfit-uncensored-span-db-is-under = a faixa de J/S não censurada de { $span_db } dB é inferior a { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff e delta não são identificáveis separadamente (|corr| { $full } >= { $v2 }): o modelo depende apenas de delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    { $n_reacq ->
        [one] não ajustado: { $n_reacq } reaquisição observada (são necessárias ao menos 3)
        [many] não ajustado: { $n_reacq } de reaquisições observadas (são necessárias ao menos 3)
       *[other] não ajustado: { $n_reacq } reaquisições observadas (são necessárias ao menos 3)
    }


engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = modo `{ $m }` desconhecido (apenas `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage deve ser [lower, upper] dentro de [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds deve ser [lower, upper] com 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db deve ser [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = a campanha não tem nenhum evento com perfil de potência declarado para ajustar

## src/iq/labfit/iqreport.rs

# legal: native review
engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Ajuste de laboratório a partir da campanha de IQ: { $r }

    Esquema `{ $schema }`, motor { $engine_version }. Rótulo: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = DIGEST da campanha `{ $campaign_digest }`; SHA-256 de `campaign.json` `{ $campaign_json_sha256 }`; SHA-256 do cenário `{ $scenario_sha256 }`; { $cells } células; { $bootstrap } réplicas de bootstrap (semente { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Unidade { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Estado: { $status }. { $recordings } gravações, { $satellites } satélites, { $events } eventos; { $bins_used } intervalos ajustados, { $bins_censored } censurados.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = Modelo de C/N0 ({ $q_mode }): `delta_eff` = { $ci } dB (o deslocamento identificável, referido a Q = 1); `Q_eff` = { $q }; `delta` nesse Q = { $ci2 } dB; corr(Q, delta) { $om }; RMS residual { $residual_rms_db } dB sobre uma faixa de J/S de { $span_db } dB. Q_eff não é identificável a partir de dados de C/N0 sem uma medição independente de potência.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q mantido em seu valor declarado: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over =
    { $n ->
        [one] J/S limiar, direto: mediana { $om } dB sobre { $n } perda (IQR { $t }).{ "\u000A\u000A" }
        [many] J/S limiar, direto: mediana { $om } dB sobre { $n } de perdas (IQR { $t }).{ "\u000A\u000A" }
       *[other] J/S limiar, direto: mediana { $om } dB sobre { $n } perdas (IQR { $t }).{ "\u000A\u000A" }
    }


engine-iq-labfit-iqreport-hold-out-leave-one-recording = Conjunto reservado (uma gravação deixada de fora), interpolação: { $bins } intervalos, RMS de C/N0 { $om } dB, cobertura PI90 { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 =
    { $n ->
        [one] ; { $model }: { $n } evento, RMS do tempo de perda { $om } s, cobertura PI90 { $om2 }
        [many] ; { $model }: { $n } de eventos, RMS do tempo de perda { $om } s, cobertura PI90 { $om2 }
       *[other] ; { $model }: { $n } eventos, RMS do tempo de perda { $om } s, cobertura PI90 { $om2 }
    }


engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    SHA-256 da tabela de validação `{ $table_sha256 }` (registrada { $registered }):

    | limiar | limite | valor | veredito |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = registro da execução `{ $label }`

engine-e-iq-labfit-run = execução `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = o [input] do cenário não indica nenhuma campanha

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign e [[runs]] são mutuamente exclusivos: informe um

engine-e-iq-labfit-iq-labfit-scenario = cenário iq-labfit: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = o registro não traz C/N0 por satélite{ $cfg } (observáveis: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = nenhuma época antes do início em { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = nenhuma época no início em { $onset } s ou depois dele

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Ajuste de laboratório: { $r }

    Rótulo: **{ $label }**. SHA-256 das configurações `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { $n_samples ->
        [one] { "\u000A" }{ $n_samples } amostra de C/N0, RMS residual { $om } dB.{ $r }{ "\u000A" }
        [many] { "\u000A" }{ $n_samples } de amostras de C/N0, RMS residual { $om } dB.{ $r }{ "\u000A" }
       *[other] { "\u000A" }{ $n_samples } amostras de C/N0, RMS residual { $om } dB.{ $r }{ "\u000A" }
    }


engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Modelo: { $model } ({ $label })

    | parâmetro | valor | limites | no limite | desvio-padrão de bootstrap (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { $n_events ->
        [one]
            { "\u000A" }RMS do tempo de evento { $om } s sobre { $n_events } evento; perdas não detectadas { $loss_missed } / extras { $loss_extra }, reaquisições não detectadas { $reacq_missed } / extras { $reacq_extra }.

            | execução | queda dB-Hz | novo travamento dB-Hz | eventos | RMS s |
            |---|---|---|---|---|{ "\u000A" }
        [many]
            { "\u000A" }RMS do tempo de evento { $om } s sobre { $n_events } de eventos; perdas não detectadas { $loss_missed } / extras { $loss_extra }, reaquisições não detectadas { $reacq_missed } / extras { $reacq_extra }.

            | execução | queda dB-Hz | novo travamento dB-Hz | eventos | RMS s |
            |---|---|---|---|---|{ "\u000A" }
       *[other]
            { "\u000A" }RMS do tempo de evento { $om } s sobre { $n_events } eventos; perdas não detectadas { $loss_missed } / extras { $loss_extra }, reaquisições não detectadas { $reacq_missed } / extras { $reacq_extra }.

            | execução | queda dB-Hz | novo travamento dB-Hz | eventos | RMS s |
            |---|---|---|---|---|{ "\u000A" }
    }


engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Conjunto reservado ({ $scheme }, { $folds } partições): total { $om } s, interpolação { $om2 } s, extrapolação { $om3 } s.

    | execução reservada | classe | distância | execução de treino mais próxima | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = o FID { $fid } é reservado para uso futuro (apenas o FID 0 é definido)

engine-iq-lunanet-afs-toi-is-outside-99 = o TOI { $toi } está fora de 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = { $sb1_err } símbolo(s) SB1 divergem do campo decodificado

engine-iq-lunanet-afs-frames-at-and-are-symbols = os quadros em { $w } e { $w2 } estão separados por { $gap } símbolos, e não por { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = o TOI { $w } segue o TOI { $w2 }, esperado { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = caractere { $c } inesperado em um fluxo de símbolos (apenas 0, 1 e espaço em branco)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: os primeiros 24 chips diferem

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: os últimos 24 chips diferem

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (o documento imprime A14850 tanto para o PRN 147 quanto para o PRN 151; o gerador reproduz o do PRN 151, portanto a entrada do PRN 147 é muito provavelmente um erro de impressão no documento)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = codificado 0x{ $word }, decodificado FID { $fid } TOI { $toi }

## src/iq/monitor/cn0.rs

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = configurações do monitor: { $e }

## src/iq/monitor/sqm.rs

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

## src/iq/scene/code.rs

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = posição estática não finita

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = trajetória de velocidade constante não finita

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = a trajetória de pontos de passagem não tem pontos de passagem

engine-e-iq-scene-geometry-waypoint-not-finite = ponto de passagem não finito

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = os tempos dos pontos de passagem devem ser estritamente crescentes

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = o PRN { $prn } não é um PRN GPS C/A

engine-e-iq-scene-ephemeris-system-is-not-gps = o sistema de efemérides { $system } não é GPS

engine-e-iq-scene-satellite = satélite { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = é um componente piloto (sem dados) e não carrega dados de navegação

engine-e-iq-scene-nav-carries-data-the-scene-does = carrega dados que a cena não modela; gere-o sem dados

engine-e-iq-scene-nav-does-not-carry-gps-lnav = não carrega GPS LNAV (apenas o GPS L1 C/A carrega); use dados com semente

engine-e-iq-scene-nav-not-an-lnav-source = não é uma fonte LNAV

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = uma cena exige ao menos um satélite (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler lista { $dopplers } valor(es); informe um por --prn ({ $ids }) ou um único valor

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = a linha de referência tem { $f } campos, esperados 10

engine-e-iq-scene-truth-truth-field = campo de referência { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = sat_id de referência: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz deve ser um número positivo

engine-e-iq-short-duration-must-be-in = duration_s deve estar em (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids deve conter de 1 a { $MAX_SATELLITES } satélites

engine-e-iq-short-dopplers-must-be-finite = dopplers deve ser finito

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] { $n } amostra solicitada; uma execução curta comporta no máximo { $MAX_SAMPLES }
        [many] { $n } de amostras solicitadas; uma execução curta comporta no máximo { $MAX_SAMPLES }
       *[other] { $n } amostras solicitadas; uma execução curta comporta no máximo { $MAX_SAMPLES }
    }


## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C dados PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C piloto PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: o PRN { $id } está fora da faixa

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = o canal de frequência GLONASS L1OF { $id } está fora de -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = sinal { $other } desconhecido; esperado um entre: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = linha { $v1 }: sem ';'

engine-e-iq-signals-galileo-line-no-code-number-in = linha { $v1 }: sem número de código em { $label }

engine-e-iq-signals-galileo-code-appears-twice = o código { $number } aparece duas vezes

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $n ->
        [one] { $path }: { $n } código, o ICD define { $CODES_PER_COMPONENT }
        [many] { $path }: { $n } de códigos, o ICD define { $CODES_PER_COMPONENT }
       *[other] { $path }: { $n } códigos, o ICD define { $CODES_PER_COMPONENT }
    }


engine-iq-signals-galileo-galileo-e1-prn = Galileo E1-B PRN { $prn }

engine-iq-signals-galileo-galileo-e1-prn-2 = Galileo E1-C PRN { $prn }

engine-iq-signals-galileo-galileo-e5a-prn = Galileo E5a-I PRN { $prn }

engine-iq-signals-galileo-galileo-e5a-prn-2 = Galileo E5a-Q PRN { $prn }

## src/iq/signals/gps.rs

engine-iq-signals-gps-gps-l1cd-prn = GPS L1CD PRN { $prn }

engine-iq-signals-gps-gps-l1cp-prn = GPS L1CP PRN { $prn }

engine-iq-signals-gps-gps-l5-i5-prn = GPS L5 I5 PRN { $prn }

engine-iq-signals-gps-gps-l5-q5-prn = GPS L5 Q5 PRN { $prn }

engine-iq-signals-gps-gps-l2-cm-prn = GPS L2 CM PRN { $prn }

engine-iq-signals-gps-gps-l2-cl-prn = GPS L2 CL PRN { $prn }

engine-iq-signals-gps-gps-l2c-prn = GPS L2C PRN { $prn }

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-prn = LunaNet AFS-I PRN { $prn }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q primário { $primary_prn } S{ $secondary } terciário { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primário { $primary_prn } S{ $secondary } (terciário omitido)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = caractere não hexadecimal { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } símbolos hexadecimais não comportam exatamente { $len } chips

engine-iq-signals-primary-only = { $name } (somente primário)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = o rastreamento BOC exige um espaçamento early-late em (0, { $max }) chips para que E e L permaneçam no pico principal (recebido { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = o limiar de bump-jump deve ser pelo menos 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = a taxa de amostragem deve ser positiva

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods deve ser positivo

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows deve ser positivo

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } deve dividir o comprimento de bit { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = há suporte para no máximo { $MAX_EXTRA_TAPS } taps extras (recebido { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = os deslocamentos dos taps extras devem ser finitos e estar dentro de ±{ $MAX_TAP_OFFSET_CHIPS } chips (recebido { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = uma janela de C/N0 exige pelo menos 2 prompts

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: esperado atan2, costas-atan ou costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: esperado cross-product, atan2 ou atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: esperado pull-in ou always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: esperado eml-power, dot-product ou eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: esperado pll, fll ou fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } não se aplica a carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: esperado um número >= 0 (0 desativa o limite)

engine-e-iq-track-design-must-be-positive-number-got = { $k } deve ser um número positivo (recebido { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods deve ser pelo menos 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips deve estar em (0, 2] (recebido { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips comporta no máximo { $MAX_EXTRA_TAPS } deslocamentos (recebido { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = os deslocamentos de integration.extra_taps_chips devem ser finitos e estar dentro de ±{ $MAX_TAP_OFFSET_CHIPS } chips (recebido { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) deve ser inferior a carrier.fll_off_pli ({ $off }), ambos em (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s deve ser zero ou positivo (recebido { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s deve ser positivo (recebido { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order deve ser 1, 2 ou 3 (recebido { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order deve ser 1 ou 2 (recebido { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order deve ser 1 ou 2 (recebido { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold deve estar em [-1, 1] (recebido { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows deve ser pelo menos 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods deve ser pelo menos 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) não deve ser inferior a lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db deve ser finito

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes deve ser pelo menos 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods deve ser pelo menos 1 (ou "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent deve ser pelo menos 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa deve estar em (0, 1) (recebido { $pfa })

engine-e-iq-track-design-design-overrides = substituições do projeto: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = as substituições do projeto não podem definir name nem extends

engine-e-iq-track-design-loop-design-file = arquivo de projeto de malha: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = arquivo de projeto de malha: o schema { $other } não é suportado; esperado { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = arquivo de projeto de malha: falta schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = arquivo de projeto de malha: nenhuma tabela [[design]]

engine-e-iq-track-design-loop-design-file-design-number = arquivo de projeto de malha: a tabela [[design]] de número { $v1 } não tem name

engine-e-iq-track-design-loop-design-file-design-name = arquivo de projeto de malha: o nome de projeto { $name } é reservado ou vazio

engine-e-iq-track-design-loop-design-file-design-is = arquivo de projeto de malha: o projeto { $name } está definido duas vezes

engine-e-iq-track-design-no-design-named-the-file = nenhum projeto chamado { $n }; o arquivo contém { $value }

engine-e-iq-track-design-loop-design-file-design-extends = arquivo de projeto de malha: o projeto { $name } estende a si mesmo (um ciclo)

engine-e-iq-track-design-loop-design-file-design-extends-2 = arquivo de projeto de malha: o projeto { $name } estende um projeto desconhecido { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = a malha de fase exige ordem 1..=3 e Bn > 0 (recebido { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = a malha de frequência exige Bn > 0 (recebido { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = a ordem da malha de frequência deve ser 1 ou 2 (recebido { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = um filtro de malha exige um caminho de fase, um caminho de frequência ou ambos

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = o espaçamento early-late deve estar em (0, 2] chips (recebido { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = a ordem da DLL deve ser 1 ou 2 (recebido { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = a taxa de chips e a frequência da portadora devem ser positivas

## src/iq/track/sink.rs

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-e-iq-track-sink-an-epoch-carries-extra-taps = uma época traz { $extra } taps extras, mas a saída foi configurada para { $n }: todos os canais de uma execução devem usar o mesmo extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = um registro tem { $b } bytes; esperado { $want }

engine-e-iq-track-sink-unknown-lock-state-code = código de estado de travamento desconhecido { $b }

engine-e-iq-track-sink-epoch-file-header = cabeçalho do arquivo de épocas: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = schema do arquivo de épocas { $schema }; esperado { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = os registros do arquivo de épocas têm { $record_bytes } bytes; este leitor espera { $want } ({ $BINARY_RECORD_BYTES } mais { $BINARY_TAP_BYTES } por tap extra)

engine-e-iq-track-sink-epoch-file-ends-inside-record = o arquivo de épocas termina no meio de um registro ({ $got } de { $size } bytes)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = formato de épocas { $o }: esperado csv, jsonl ou bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` não é um número

engine-e-jammertest-cli-is-not-utf-text = { $path } não é texto UTF-8

engine-e-jammertest-cli-needs-catalog = exige --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = exige pelo menos um --plan

engine-e-jammertest-cli-is-not-utf = { $cat } não é UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } não é UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` não é um de ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` não é UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = exige --log-start ou --log com --format

engine-e-jammertest-cli-log-needs-format = --log exige --format

engine-e-jammertest-cli-the-log-does-not-state = o registro não informa a hora de início: use --log-start

engine-e-jammertest-cli-the-log-states-its-start = o registro informa o início como `{ $label }`: use --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } não é UTF-8

engine-e-jammertest-cli-cannot-write = não foi possível gravar { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } eventos { $SCHEDULED_TRUTH } gravados em { $o } ({ $skipped_non_rf } slots não RF ignorados, { $outside_log } fora do registro, { $unknown_ids } ids fora do catálogo)

engine-jammertest-cli-note-ids-not-in-the = nota: ids fora do catálogo: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = nota: estes são os slots programados do plano, não horários gravados no ar.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  nome do ensaio

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } ensaios, { $evaluable } avaliáveis: { $detected } detectados dentro da tolerância, { $late } tardios, { $missed } perdidos; latência mediana { $fmt_opt }, tempo mediano de recuperação { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = alarmes falsos fora de todos os slots: { $false_alarm_runs } execuções, { $false_alarm_epochs } de { $clean_epochs } épocas limpas

engine-e-jammertest-cli-needs-session-path = exige um caminho de sessão

engine-e-jammertest-cli-needs-catalog-and-plan-or = exige --catalog e --plan, ou --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = pacote de evidências gravado em { $out }; impressão digital do signatário { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = nenhuma pasta com um scenario.json e um .ubx em { $root }

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-e-jammertest-dataset-scenario = cenário: { $e }

engine-e-jammertest-dataset-read = leitura: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json não tem data

engine-e-jammertest-dataset-scenario-json-date-is-not = a data `{ $date }` de scenario.json não é uma data

engine-e-jammertest-dataset-no-readable-epoch-in-mon = nenhuma época legível em mon_rf.csv ou rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = nenhuma pasta com um scenario.json em { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } recuperados ({ $recovered } de { $alarmed }), mediana { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = o registro informa o início como `{ $l }`, que não é UTC ISO-8601: informe o início explicitamente

engine-e-jammertest-the-log-does-not-state = o registro não informa a hora de início: informe-a explicitamente

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = o catálogo não é JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = o catálogo não tem o array `test_types`

engine-e-jammertest-plan-test-type-has-no-type = um tipo de ensaio não tem `type_id`

engine-e-jammertest-plan-test-group-has-no-group = um grupo de ensaios não tem `group_id`

engine-e-jammertest-plan-test-has-no-test-id = um ensaio não tem `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = o catálogo não lista nenhum ensaio

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` não é um horário de plano como 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = o plano não é JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = o plano não tem o array `locations`

engine-e-jammertest-plan-test-end-time-is-not = ensaio { $id }: end_time não é posterior a start_time

engine-e-jammertest-plan-the-plan-has-no-test = o plano não tem a área de ensaio { $l }; tem { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = o plano tem várias áreas de ensaio { $areas }; indique em qual delas o registro foi gravado

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json não é JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = nenhum array `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024, ensaio { $id }, janela { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = o attack_log não contém nenhuma janela de início/fim

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = { $events } eventos programados, mas a execução pontuou { $events2 }: passe os eventos da própria execução

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s deve ser positivo e guard_s não negativo

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m deve listar pelo menos um elemento

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m deve ser finito

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: esperado "null-steering" ou "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz deve ser positivo (recebido { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: a seção exige um [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) deve ser finito e igual ou superior a tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s deve ser finito e não negativo (recebido { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits deve estar entre 1 e 16 (recebido { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz deve ser positivo (recebido { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side deve ser pelo menos 2 (recebido { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } deve ser finito (recebido { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } deve ser positivo (recebido { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: o ponto { $points } do perfil ({ $lat }, { $lon }) está fora do bloco DEM

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: o ponto { $points } do perfil ({ $lat }, { $lon }) está em um vazio do DEM

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = data do calendário UTC fora do intervalo: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = não existe essa data de calendário: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = segundo UTC { $second } fora do intervalo em { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = um local de lançamento no polo não tem azimute definido

engine-e-launch-inclination-unreachable-from-latitude-without = inclinação { $inclination_rad }° inalcançável a partir da latitude { $lat_rad }° sem uma manobra dogleg (é preciso |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = a velocidade do local no polo verdadeiro exige `epoch` e `eop_finals2000a` (um corpo IERS finals2000A real)

engine-e-launch-site-lon-deg-must-be = site_lon_deg deve estar em [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a não continha linhas IERS finals2000A legíveis

engine-e-launch-epoch-mjd-is-outside-the = a época { $epoch } (MJD { $mjd_utc }) está fora das linhas EOP fornecidas (MJD { $mjd } a { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg deve estar em [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg deve estar em [0, 180]

engine-launch-launch-window-lat-az-asc = janela de lançamento: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° asc, v_circ { $v_orbit } m/s, bônus de rotação da Terra de +{ $site_rotation_speed } m/s, { $opportunities } oportunidades/dia (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = cada taxa de distância exige um sigma positivo e finito

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns =
    { $n_meas ->
        [one]
            { $n ->
                [one] { $n_meas } medição não resolve { $n } incógnita Doppler
                [many] { $n_meas } medição não resolve { $n } de incógnitas Doppler
               *[other] { $n_meas } medição não resolve { $n } incógnitas Doppler
            }
        [many]
            { $n ->
                [one] { $n_meas } de medições não resolvem { $n } incógnita Doppler
                [many] { $n_meas } de medições não resolvem { $n } de incógnitas Doppler
               *[other] { $n_meas } de medições não resolvem { $n } incógnitas Doppler
            }
       *[other]
            { $n ->
                [one] { $n_meas } medições não resolvem { $n } incógnita Doppler
                [many] { $n_meas } medições não resolvem { $n } de incógnitas Doppler
               *[other] { $n_meas } medições não resolvem { $n } incógnitas Doppler
            }
    }


engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = a geometria Doppler é singular

engine-e-leo-fusion-doppler-no-covariance = sem covariância

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = cada pseudodistância exige um sigma positivo e finito

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position =
    { $n ->
        [one]
            { $n_clock ->
                [one] { $obs } pseudodistâncias não resolvem { $n } incógnita (3 de posição + { $n_clock } relógio)
                [many] { $obs } pseudodistâncias não resolvem { $n } incógnita (3 de posição + { $n_clock } de relógios)
               *[other] { $obs } pseudodistâncias não resolvem { $n } incógnita (3 de posição + { $n_clock } relógios)
            }
        [many]
            { $n_clock ->
                [one] { $obs } pseudodistâncias não resolvem { $n } de incógnitas (3 de posição + { $n_clock } relógio)
                [many] { $obs } pseudodistâncias não resolvem { $n } de incógnitas (3 de posição + { $n_clock } de relógios)
               *[other] { $obs } pseudodistâncias não resolvem { $n } de incógnitas (3 de posição + { $n_clock } relógios)
            }
       *[other]
            { $n_clock ->
                [one] { $obs } pseudodistâncias não resolvem { $n } incógnitas (3 de posição + { $n_clock } relógio)
                [many] { $obs } pseudodistâncias não resolvem { $n } incógnitas (3 de posição + { $n_clock } de relógios)
               *[other] { $obs } pseudodistâncias não resolvem { $n } incógnitas (3 de posição + { $n_clock } relógios)
            }
    }


engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = um satélite coincide com a estimativa de posição

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = a geometria é singular

engine-e-leo-fusion-joint-pvt-no-iteration-ran = nenhuma iteração foi executada

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = geometria final degenerada

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = o DOP não é finito

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } deve ser positivo

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m deve ser não negativo e a execução ter no máximo 5000 épocas

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = cada sinal exige uma largura de banda positiva

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    { $n_satellites ->
        [one] posicionamento 5G NTN a { $r } MHz, C/N0 { $r2 } a { $r3 } dB-Hz, { $n_satellites } satélite ({ $mean_in_view } à vista){ "\u000A" }
        [many] posicionamento 5G NTN a { $r } MHz, C/N0 { $r2 } a { $r3 } dB-Hz, { $n_satellites } de satélites ({ $mean_in_view } à vista){ "\u000A" }
       *[other] posicionamento 5G NTN a { $r } MHz, C/N0 { $r2 } a { $r3 } dB-Hz, { $n_satellites } satélites ({ $mean_in_view } à vista){ "\u000A" }
    }


engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, faixa CRB { $range_sigma_zenith_m } a { $range_sigma_mask_m } m; 3D formal mediano { $s2 } m, erro RMS { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { $n_obs ->
        [one] { "  " }passagem Doppler de um satélite: { $n_obs } amostra em { $duration_s } s, erro horizontal { $horizontal_error_m } m{ "\u000A" }
        [many] { "  " }passagem Doppler de um satélite: { $n_obs } de amostras em { $duration_s } s, erro horizontal { $horizontal_error_m } m{ "\u000A" }
       *[other] { "  " }passagem Doppler de um satélite: { $n_obs } amostras em { $duration_s } s, erro horizontal { $horizontal_error_m } m{ "\u000A" }
    }


engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = o PPP exige pelo menos um sistema

engine-e-leo-fusion-ppp-duration-and-step-must-be = a duração e o passo devem ser positivos, com no máximo 20000 épocas

engine-e-leo-fusion-ppp-runs-must-be-to-200 = o número de execuções deve estar entre 1 e 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = os limiares de convergência devem ser positivos

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    { $n_gnss ->
        [one] convergência do PPP a { $criterion_horizontal_m } m na horizontal / { $criterion_vertical_m } m na vertical, { $runs_per_case } execuções por caso, { $n_gnss } satélite GNSS{ "\u000A" }
        [many] convergência do PPP a { $criterion_horizontal_m } m na horizontal / { $criterion_vertical_m } m na vertical, { $runs_per_case } execuções por caso, { $n_gnss } de satélites GNSS{ "\u000A" }
       *[other] convergência do PPP a { $criterion_horizontal_m } m na horizontal / { $criterion_vertical_m } m na vertical, { $runs_per_case } execuções por caso, { $n_gnss } satélites GNSS{ "\u000A" }
    }


engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  mediana { $c } min  convergidos { $v4 }%  NEES médio { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = erro horizontal mediano em { $runs_per_case } execuções · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = a predefinição { $id } não traz nenhum sinal

engine-e-leo-fusion-presets-preset-has-no-signal-it = a predefinição { $id } não tem o sinal { $n }; tem { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = predefinição LEO desconhecida { $id }; conhecidas: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s e step_s devem ser positivos, com no máximo 20000 épocas

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = os passos polares devem ser positivos

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode deve ser doppler, joint, polar ou timing; recebido { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = o modo doppler exige pelo menos um sistema LEO

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = o modo timing exige um sistema LEO com medição de distância por código

engine-e-leo-fusion-pvt-kind-unknown-clock-class = classe de relógio desconhecida { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = PVT LEO ({ $mode }) em { $user_lat_deg }, { $user_lon_deg } ao longo de { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz =
    { $n_satellites ->
        [one] { "  " }{ $name } { $role } { $n_satellites } satélite a { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
        [many] { "  " }{ $name } { $role } { $n_satellites } de satélites a { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
       *[other] { "  " }{ $name } { $role } { $n_satellites } satélites a { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
    }


engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { $n_obs ->
        [one]
            { $n_sats ->
                [one] { "  " }solução de posição Doppler: { $n_obs } medição de { $n_sats } satélite, erro 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }solução de posição Doppler: { $n_obs } medição de { $n_sats } de satélites, erro 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }solução de posição Doppler: { $n_obs } medição de { $n_sats } satélites, erro 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
            }
        [many]
            { $n_sats ->
                [one] { "  " }solução de posição Doppler: { $n_obs } de medições de { $n_sats } satélite, erro 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }solução de posição Doppler: { $n_obs } de medições de { $n_sats } de satélites, erro 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }solução de posição Doppler: { $n_obs } de medições de { $n_sats } satélites, erro 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
            }
       *[other]
            { $n_sats ->
                [one] { "  " }solução de posição Doppler: { $n_obs } medições de { $n_sats } satélite, erro 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }solução de posição Doppler: { $n_obs } medições de { $n_sats } de satélites, erro 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }solução de posição Doppler: { $n_obs } medições de { $n_sats } satélites, erro 3D { $error_3d_m } m (horizontal { $horizontal_error_m } m){ "\u000A" }
            }
    }


engine-leo-fusion-pvt-kind-window-sats-3d-error =
    { $n_sats ->
        [one] { "    " }janela { $window_s } s: { $n_sats } satélite, erro 3D { $f } m{ "\u000A" }
        [many] { "    " }janela { $window_s } s: { $n_sats } de satélites, erro 3D { $f } m{ "\u000A" }
       *[other] { "    " }janela { $window_s } s: { $n_sats } satélites, erro 3D { $f } m{ "\u000A" }
    }


engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } passagem zenital: Doppler máx. { $max_doppler_hz } Hz, taxa { $max_doppler_rate_hz_s } Hz/s, jerk { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }satélite LEO de medição de distância à vista em { $v1 }% das épocas{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } disponibilidade { $availability }, PDOP mediano { $f }, erro 3D RMS { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } fundido { $f3 }; à vista { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, máx. { $row3 } ns (à vista { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = PVT LEO — modo { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = sistema { $name }: role deve ser gnss ou leo, recebido { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = sistema { $name }: clock deve ser estimated ou known, recebido { $c }

engine-e-leo-fusion-system-system-must-be-positive = sistema { $name }: { $what } deve ser positivo

engine-e-leo-fusion-system-system-mask-deg-must-be = sistema { $name }: mask_deg deve estar em [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = sistema { $name }: sigma_pr_m deve ser positivo

engine-e-leo-fusion-system-give-at-least-one-system = informe pelo menos um [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = o espaçamento entre épocas deve ser positivo

engine-e-leo-fusion-timing-no-epochs = sem épocas

engine-e-leo-fusion-timing-no-satellite-was-ever-in = nenhum satélite esteve à vista: o receptor nunca adquiriu o tempo

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = a polarização deve ser rhcp, lhcp ou linear; recebido '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = código de erro SGP4 { $code } em t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = uma órbita com inclinação de { $inc } deg nunca passa sobre a latitude { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = a elevação máxima solicitada está abaixo do alcance do horizonte

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = a classe de edificação deve ser traditional ou thermally-efficient; recebido '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = o campo { $name } não é finito

engine-e-leo-navmsg-codec-field-is-outside-its-bit = o campo { $name } = { $value } { $unit } está fora de sua faixa de { $bits } bits (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = mensagem truncada

engine-e-leo-navmsg-codec-field-list-exhausted = lista de campos esgotada

engine-e-leo-navmsg-codec-field-order-mismatch-vs = ordem dos campos divergente: { $name } contra { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID deve estar entre 1 e 255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = cada polinômio de correção exige de 1 a 8 coeficientes

engine-e-leo-navmsg-codec-correction-time-scale-must-be = a escala de tempo da correção deve ser uma potência de dois de 1 s a 32768 s; recebido { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = o polinômio ECEF exige de 1 a 11 coeficientes, iguais por eixo

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = o grau do polinômio ECEF { $v1 } excede 10

engine-e-leo-navmsg-codec-unknown-model-id = id de modelo desconhecido { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = a carga útil excede 4095 bytes

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = o quadro é mais curto que o cabeçalho e o CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = preâmbulo inválido 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = versão não suportada { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = o comprimento do quadro { $frame } não corresponde à carga útil declarada de { $len } bytes

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = divergência de CRC-24Q: calculado 0x{ $crc }, o quadro traz 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = cada valor de rac_degrees deve ser no máximo 7; recebido { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree deve estar entre 1 e 10; recebido { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = modelo de efemérides desconhecido '{ $other }': use kepler16, kepler-rac, liu22 ou ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = o intervalo de ajuste deve ser pelo menos 10 s; recebido { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = a janela de ajuste [{ $t0 }, { $v1 }] s está fora do arco de referência [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = o ajuste do polinômio ECEF é singular (poucas amostras para o grau)

engine-e-leo-navmsg-fit-clock-fit-is-singular = o ajuste do relógio é singular

engine-e-leo-navmsg-fit-keplerian-fit-diverged = o ajuste kepleriano divergiu

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = predefinição desconhecida '{ $k }'; disponíveis: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s deve estar entre 10 e 3600 s e update_period_s em (0, fit_interval_s]; recebido { $fit_interval_s } e { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s e eval_step_s devem estar entre 0.5 e 60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz deve exceder 10 MHz; recebido { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid deve estar entre 1 e 255

engine-e-leo-navmsg-band-must-be-15-and = band deve estar entre 0 e 15 e health entre 0 e 3

engine-e-leo-navmsg-unknown-csv-schema = csv_schema desconhecido '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis deve nomear pelo menos uma análise

engine-e-leo-navmsg-unknown-analysis-use = análise desconhecida '{ $a }'; use { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind deve ser leo-navmsg; recebido { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg deve estar em [0, 60); recebido { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    mensagem de navegação LEO — { $res } km, { $res2 } deg, grau de gravidade { $gravity_degree }, modelo { $res3 }
    { "  " }pesos SISRE: w_R { $w_r }, w_AC^2 1/{ $v6 } (máscara { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s deve estar entre 60 e 86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s deve ser não vazio, cada um entre 10 e 3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }compromisso do intervalo de ajuste em { $span } s (período de uso = intervalo de ajuste):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE de órbita RMS { $sisre_orb_rms_m } m  máx. { $sisre_orb_max_m } m  com relógio RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s deve ser não vazio, cada um entre 10 e 3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s deve estar entre 60 e 86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } parâmetros  SISRE de órbita RMS { $sisre_orb_rms_m } m  com relógio { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = nenhuma passagem acima de { $mask } deg para o usuário em { $lat }, { $lon } em { $search } s; amplie midpass.search_s ou mova o usuário

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }atualização no meio da passagem: passagem { $p0 }-{ $p1 } s (elevação máxima { $pmax } deg), { $switches } trocas, maior salto de distância do usuário { $max_jump } m (geometria do pior caso { $max_worst } m) contra o limiar { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }codificação-decodificação: modelo { $m }, quadro { $frame } bytes ({ $payload_bits } bits de carga útil, { $eph_bits } bits de efemérides+relógio), CRC-24Q 0x{ $hex }
    { "    " }quantização: maior mudança de posição { $v6 } mm, relógio { $v7 } mm; SISRE exato { $acc_exact } m, quantizado { $acc_q } m
    { "    " }quadro corrompido rejeitado: { $corrupted_rejected }; ida e volta RINEX { $rin_dp } m; ida e volta CSV { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs deve estar entre 1 e 20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  publicado { $published } m  razão { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = O conjunto kepleriano de 16 parâmetros se degrada de { $a } m a { $lo } s para { $b } m a { $hi } s: um único conjunto kepleriano com harmônicos de duas vezes por revolução não consegue acompanhar os termos de gravidade de maior frequência nem o arrasto de um arco LEO por mais de poucos minutos, e seu resíduo de mínimos quadrados oscila ao longo da janela. Os polinômios ao longo da trajetória/transversal/radial, de grau superior ao que o conjunto kepleriano abrange, absorvem o que resta, resultando em { $c } m a { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = O conjunto kepleriano de 16 parâmetros passa de { $a } m a { $lo } s para { $b } m a { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, grau de gravidade { $gravity_degree } · erro de representação em relação à referência · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` é da biblioteca do host

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: os amostradores de `rand_distr` chamam `exp` e `ln` do host em seus ramos raros; use `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` é o campo gravitacional da biblioteca do host; use `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` não foi revisado

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = nenhuma linha END OF HEADER

engine-e-leo-navmsg-text-expected-eph-record-header-got = esperado um cabeçalho de registro '> EPH', recebido { $head }

engine-e-leo-navmsg-text-bad-satellite-id = id de satélite inválido { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = falta a linha de época

engine-e-leo-navmsg-text-bad-epoch-line = linha de época inválida { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = campo de época inválido em { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = a linha de época exige três termos de relógio: { $ep }

engine-e-leo-navmsg-text-record-truncated = registro truncado

engine-e-leo-navmsg-text-unknown-record-type = tipo de registro desconhecido { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = a tabela CSV traz mensagens kepler16 e kepler-rac; recebido { $m }

engine-e-leo-navmsg-text-empty-csv = CSV vazio

engine-e-leo-navmsg-text-row-has-cells-header = a linha tem { $cells } células, o cabeçalho { $header }

engine-e-leo-navmsg-text-bad-number-in-column = número inválido { $c } na coluna { $k }

engine-e-leo-navmsg-text-csv-row-lacks = a linha CSV não tem { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = a altitude da órbita deve estar entre 100 km e 3000 km; recebido { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = a excentricidade deve estar em [0, 0.1) para um ajuste LEO; recebido { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = o passo de integração deve estar em (0, 30] s; recebido { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = a duração deve ser positiva, com no máximo 200000 passos; recebido { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree deve ser 0, 2-6 (zonal) ou 7-{ $v1 } (EGM2008); recebido { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = a propagação de referência divergiu

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = a órbita de referência decaiu abaixo de 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = o espaçamento dos nós deve estar em (0, 60] s; recebido { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = uma órbita de referência tabulada exige pelo menos dois estados; recebido { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = o estado { $k } não é finito

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = adev_1s do relógio deve estar em [0, 1e-6); recebido { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = um relógio medido é construído com TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = um relógio disciplinado exige sigma_s em [0, 1e-3) e tau_s > 0; recebido { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = um relógio medido exige um passo positivo e pelo menos duas amostras

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = uma amostra de relógio medido não é finita

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = a época '{ $s }' não está no formato YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = a época '{ $s }' não está no formato YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = a época '{ $s }' tem um campo de segundos inválido

engine-e-leo-pass-epoch-is-out-of-range = a época '{ $s }' está fora do intervalo

engine-e-leo-pass-band-unknown-signal-design-public = banda '{ $name }': projeto de sinal desconhecido '{ $n }'; projetos públicos: { $v2 }

engine-e-leo-pass-band-is-not-in-the = a banda '{ $name }' não está na predefinição do sistema: informe frequency_mhz e eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = a banda '{ $name }' exige eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern deve ser isoflux, gaussian ou flat; recebido '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = frequência da banda '{ $name }' fora do intervalo

engine-leo-pass-overridden-in-the-scenario = { $source } (substituído no cenário)

engine-e-leo-pass-system-has-no-band = o sistema '{ $id }' não tem a banda '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = um satélite LEO exige pelo menos uma banda

engine-e-leo-pass-at-most-12-bands-per = no máximo 12 bandas por satélite

engine-leo-pass-unknown-system-presets-in-this = sistema desconhecido '{ $n }'; predefinições nesta build: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = nenhuma órbita heliossíncrona a { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (no máximo 86400) e step_s devem ser positivos, com no máximo 20000 épocas; recebido { $duration } e { $step }

engine-leo-pass-leo-satellite-km-deg = satélite LEO { $system }, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = o `epoch` { $epoch } do cenário, lido como UTC

engine-leo-pass-the-kind-default-epoch-utc = a época padrão do kind { $epoch } UTC (o cenário não informa nenhuma)

engine-e-leo-pass-user-environment-must-be-ground = user.environment deve ser ground, maritime, air ou indoor; recebido '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg deve estar dentro de +/-90

engine-e-leo-pass-user-speed-must-be-to = a velocidade do usuário deve estar entre 0 e 3000 m/s e a altura entre -500 e 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna deve ser patch, hemispherical ou isotropic; recebido '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability deve estar em (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model deve ser klobuchar, vtec ou none; recebido '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction deve ser ascending ou descending; recebido '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satélite { $id }: excentricidade ou perigeu inválido

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satélite { $id }: tle exige tle_line1 e tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit deve ser pass, elements ou tle; recebido '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation exige um sistema ou um projeto

engine-e-leo-pass-no-sun-synchronous-inclination = nenhuma inclinação heliossíncrona

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: no máximo 5000 satélites

engine-e-leo-pass-no-leo-satellite-rises-above = nenhum satélite LEO se eleva acima da máscara na janela

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s deve estar em (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' não é uma banda de nenhum satélite LEO ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = nenhum sinal GNSS '{ $bname }' para a constelação '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = constelação GNSS vazia

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' não são duas bandas distintas de { $id }

engine-e-leo-pass-iot-powers-and-battery-must = as potências e a bateria de IoT devem ser positivas

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from deve ser median ou peak; recebido '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = limiar de detecção de { $detection_snr_db } dB após a integração

engine-leo-pass-coherent-integration-at-most-ms = integração coerente de no máximo { $rx } ms, limitada pela taxa Doppler

engine-leo-pass-serial-search-with-correlators = busca serial com { $correlators } correladores

engine-leo-pass-hot-start-doppler-known-to = partida a quente: Doppler conhecido a +/-{ $aided } Hz, efemérides válidas

engine-leo-pass-leo-pass-link-budget-user = balanço de enlace da passagem LEO, usuário { $environment } em { $lat_deg }, { $lon_deg }; { $satellites } satélite(s) LEO, janela de { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, elevação máxima { $max_elevation_deg } deg em { $tca_s } s, { $duration_above_mask_s } s acima da máscara{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 pico { $opt } mediana { $opt2 }; |Doppler| máx. { $opt3 }; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: { $satellites_in_view } à vista, C/N0 { $opt } a { $opt2 } (mediana { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } pico { $leo_peak_cn0_dbhz } dB-Hz está { $leo_peak_above_gnss_median_db } dB acima da mediana GNSS; acima da portadora GNSS mais forte por { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: TTFF a frio { $ttff_s } s ({ $energy_per_fix_mj } mJ), a quente { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer a partir de { $onset_s } s (salto { $offset_m } m, empurrão { $push_rate_m_s } m/s): teste Doppler GNSS { $t }, LEO { $t2 }, fundido { $t3 }; entre bandas { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = usuário { $environment } · pico LEO { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB acima da mediana GNSS · MODELLED

engine-leo-pass-user-modelled = usuário { $environment } · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler da primeira banda de cada satélite LEO (±{ $v1 } kHz de fundo de escala)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = tabela [{ $what }] inválida: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' não está em [signal] nem é um projeto público ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' não tem componente rastreado por código, portanto não fornece pseudodistância

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind deve ser leo-pnt-chain; recebido { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = o componente rastreado não tem taxa de chips

engine-e-leo-pnt-chain-no-band-of-pass-names = nenhuma banda de [pass] nomeia signal = "{ $name }"; a cadeia precisa de uma para transportar o projeto

engine-e-leo-pnt-chain-the-pass-gives-no-code = a passagem não fornece jitter de código

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m deve estar em [0, 100] m; recebido { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] deve executar mode = "joint"; recebido { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = C/N0 rastreado na máscara de { $mask } deg (ajuste de reta em sen da elevação)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] não tem sistema LEO para receber os valores da cadeia

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] não produziu bloco joint

engine-leo-pnt-chain-leo-pnt-chain = cadeia LEO-PNT: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }sinal { $name2 } ({ $design }), { $design2 } rastreado a { $v4 } Mchip/s, deslocamento de C/N0 { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }passagem { $id } { $sat } km: pico de C/N0 rastreado { $peak_tracked_cn0_dbhz } dB-Hz, jitter de código mediano { $jitter_median } m; reta de C/N0 { $a } + { $b } sen(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }mensagem { $res } ajuste de { $fit_interval_s } s / atualização de { $update_period_s } s: SISRE de representação { $stats } mm RMS (órbita { $stats2 } mm), com { $od } m de determinação de órbita: { $sisre } m repassados{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }solução de posição fundida: apenas GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }convergência do PPP: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } valores repassados entre as etapas. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Jitter do rastreamento de código, o erro de medição de distância (m, 0 a { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · apenas GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulação { $label }: a largura deve ser positiva

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = predefinição de sinal desconhecida { $name }: a biblioteca tem { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = predefinição { $name }: arquivo de predefinição inválido: { $e }

engine-e-leo-signal-preset-file-names-itself = o arquivo de predefinição { $name } denomina-se { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz deve ser positivo

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz deve ser positivo

engine-e-leo-signal-signal-needs-at-least-one = { $name }: um sinal exige pelo menos um componente

engine-e-leo-signal-component-power-fraction-must-be = { $name }: power_fraction do componente { $v1 } deve ser positivo

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: o componente { $v1 } tem fdma_shares, mas não tem fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: fdma_shares do componente { $v1 } deve ser positivo e somar um

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: o componente { $v1 } exige um fdma_share por deslocamento

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps deve ser positivo

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips deve ser positivo

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: as frações de potência dos componentes somam { $total }, não 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km deve ser positivo

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: um componente plano (tipo OFDM) não pode ser colocado no modelo de espectro

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: o componente rastreado está em subportadoras FDMA; o modelo de espectro rastreia um componente no centro da banda

engine-e-leo-signal-signal-is-given-twice = o sinal { $w } foi informado duas vezes

engine-e-leo-signal-signals-is-more-than-the = { $out } sinais é mais do que os 24 permitidos

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receptor: loop_bandwidth_hz x integration_time_s deve ser inferior a 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receptor: informe de 1 a 40 valores de cn0_dbhz

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 e slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points deve estar entre 21 e 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: use "coherent" ou "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = a temperatura de ruído do sistema deve ser positiva

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: sinal GNSS { $n } desconhecido (conhecidos: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } não é um sinal do cenário

engine-e-leo-signal-shape-check-signal-is-not = verificação de forma: o sinal { $signal } não está no cenário

engine-leo-signal-scenario-leo-signal-signals-noise = cenário leo-signal | { $runs } sinais | piso de ruído { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = à esquerda: PSD de banda limitada de cada projeto (dB abaixo do pico, em toda a sua banda de transmissão); à direita: jitter de código em função do C/N0 total com espaçamento de { $reference_spacing_chips } chips

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = banda '{ $other }' desconhecida (esperado s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km deve ser finito e positivo

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps deve ser finito e positivo

engine-e-linkbudget-other-losses-db-must-be = other_losses_db deve ser finito e >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k deve ser finito e positivo quando informado

engine-linkbudget-link-budget-band-km-bit = link-budget: banda { $value }, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, margem { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = não foi possível escutar em { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: escutando em tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: cliente tcp conectado

engine-live-io-kshana-live-warning-is-not = kshana live: aviso: { $addr } não é um endereço de loopback; qualquer pessoa que consiga alcançá-lo pode ler o fluxo

engine-e-live-io-cannot-open = não foi possível abrir { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: um cliente tcp que não conseguiu acompanhar o ritmo foi descartado

engine-e-live-io-cannot-open-2 = não foi possível abrir { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: aviso: { $addr } não é um endereço de loopback; qualquer pessoa que consiga alcançá-lo pode enviar um fluxo a esta camada

engine-e-live-io-cannot-bind-udp = não foi possível associar o udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: escutando em udp { $addr }

engine-e-live-io-cannot-connect-to = não foi possível conectar-se a { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: conectado ao tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: lendo a porta serial { $path } a { $baud } baud (somente leitura)

engine-live-io-the-was-closed-by-the = o { $v1 } foi encerrado pelo par (a camada não se reconecta: execute-a sob um supervisor que a reinicie)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: use 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 ou 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } não é um dispositivo serial (tcgetattr falhou)

engine-e-live-io-cannot-set-baud = não foi possível definir { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = não foi possível definir o modo de linha de { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial é compatível apenas com Unix; use --file, --tcp ou --stdin

engine-live-io-unknown-option = opção { $s } desconhecida

engine-live-io-cannot-read = não foi possível ler { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: plataforma de embarcação, calibrando por { $calibration_s } s; gate { $v2 }. Software de caráter consultivo, não um equipamento de navegação homologado: o operador continua responsável.

engine-live-io-write-failed = falha de gravação: { $e }

engine-live-io-kshana-live-dropped-udp-datagram =
    { $n ->
        [one] kshana live: descartado { $n } datagrama udp que o motor não pôde receber ({ $udp_dropped } no total)
        [many] kshana live: descartados { $n } de datagramas udp que o motor não pôde receber ({ $udp_dropped } no total)
       *[other] kshana live: descartados { $n } datagramas udp que o motor não pôde receber ({ $udp_dropped } no total)
    }


## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = o PRN AFS { $prn } está fora de 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = índice de inserção { $p } fora de 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = os arquivos do Annex 3 contêm { $gold } e { $ter } códigos, esperados 210

engine-e-lunar-afs-codes-annex-afs-prn-is-not = o PRN AFS-I { $v1 } do Annex 3 não é um código Gold de g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = o código secundário S{ $id } não existe (S0 a S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = a Table 11 do LSIS V1.0 atribui códigos apenas aos identificadores de nó de 1 a 12, não a { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = o FID { $fid } não cabe em dois bits (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = o TOI { $toi } está fora de 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = esperados { $SB1_SYMBOLS } símbolos do subquadro 1

engine-e-lunar-afs-frame-subframe-data-lengths-expected = comprimentos de dados dos subquadros { $sb2 }/{ $sb3 }/{ $sb4 } (esperados { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = esperados { $FRAME_SYMBOLS } símbolos, recebidos { $soft }

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = linha { $v1 }: esperado `row,column`

engine-e-lunar-afs-ldpc-line = linha { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = linha { $v1 }: ({ $r },{ $c }) fora de { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: esperados { $info_bits } bits de informação, recebidos { $info }

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = os dados do LSIS V1.0 não estão em { $cache_dir } (defina KSHANA_LSIS_DIR ou execute xval/lunar-afs/fetch_lsis.sh, que baixa { $LSIS_PDF_URL } e extrai os seus anexos; eles não são redistribuídos com o Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } não é um arquivo LSIS fixado

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } tem SHA-256 { $got }, esperado { $want } (fixado no LSIS V1.0 de 29 January 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = banda base do LunaNet Augmented Forward Signal, { $LSIS_VERSION }; gerador de referência do Kshana

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = nó AFS { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = nó AFS { $node_id } quadro TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites deve ser pelo menos 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites deve ser pelo menos 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg deve estar em [0, 90); recebido { $mask_deg }

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } satélite, sem beacons
        [many] { $n_sats } de satélites, sem beacons
       *[other] { $n_sats } satélites, sem beacons
    }


engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one]
            { $n_vis_beacons ->
                [one] { $n_sats } satélite + { $n_vis_beacons } beacon visível
                [many] { $n_sats } satélite + { $n_vis_beacons } de beacons visíveis
               *[other] { $n_sats } satélite + { $n_vis_beacons } beacons visíveis
            }
        [many]
            { $n_vis_beacons ->
                [one] { $n_sats } de satélites + { $n_vis_beacons } beacon visível
                [many] { $n_sats } de satélites + { $n_vis_beacons } de beacons visíveis
               *[other] { $n_sats } de satélites + { $n_vis_beacons } beacons visíveis
            }
       *[other]
            { $n_vis_beacons ->
                [one] { $n_sats } satélites + { $n_vis_beacons } beacon visível
                [many] { $n_sats } satélites + { $n_vis_beacons } de beacons visíveis
               *[other] { $n_sats } satélites + { $n_vis_beacons } beacons visíveis
            }
    }


engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } satélite, sem beacons
        [many] { $n_cmp } de satélites, sem beacons
       *[other] { $n_cmp } satélites, sem beacons
    }


engine-e-lunar-beacon-serialising-beacon-report = serialização do relatório de beacons: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = o relatório de beacons deve ser serializado como um objeto JSON

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Aumento por beacons na superfície lunar — máscara { $elevation_mask_deg } deg, época +{ $epoch_s } s, sigma_URE por beacon { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  sats { $n_visible_sats }  beacons { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  1-sigma realizado: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }os beacons melhoram o PDOP em { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = uma constelação maior, em vez disso, { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = não foi possível ler as efemérides lunares { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = efemérides lunares: a primeira linha deve ser `{ $MAGIC }`, encontrado `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = efemérides lunares: o arquivo está vazio

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = efemérides lunares: `# format:` deve ser `states` ou `elements`, encontrado `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = efemérides lunares: nenhuma linha de dados

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = efemérides lunares: coluna `{ $name }` ausente

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = efemérides lunares: `# elements_frame:` deve ser `icrf` ou `mci`, encontrado `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = efemérides lunares: `elements_frame: icrf` exige `# epoch_jd_tdb:` (a época a que os elementos se referem, que é também onde a rotação do ICRF para o referencial fixo da Lua é avaliada): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = efemérides lunares: linha de elementos { $v1 } curta demais

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = efemérides lunares: linha de elementos { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = efemérides lunares: a linha de elementos { $v1 } tem um semieixo maior não positivo

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = efemérides lunares: a linha de elementos { $v1 } tem excentricidade { $ecc }, fora de [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = efemérides lunares: um arquivo `states` exige `# frame: icrf` ou `# frame: mci`, encontrado `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = efemérides lunares: um arquivo de estados `icrf` exige `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = efemérides lunares: linha de estados { $v1 } curta demais

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = efemérides lunares: linha de estados { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = efemérides lunares: a linha de estados { $v1 } não é finita

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = efemérides lunares: a linha de estados { $v1 } do satélite { $sat } retrocede no tempo ({ $t } depois de { $last }); as épocas devem ser estritamente crescentes por satélite

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Efemérides de estado tabuladas, centradas na Lua (referencial { $e }), interpoladas por Lagrange na ordem { $LAGRANGE_ORDER } entre as épocas da tabela e reduzidas ao MCMF por { $v2 }. Os estados NÃO são propagados por este motor. Classe de proveniência `published-ephemeris`: distinta de qualquer valor derivado de elementos.

engine-lunar-ephemeris-published-constellation-definition-stated-in = DEFINIÇÃO publicada da constelação, expressa em ICRF centrado na Lua (`{ $v1 }`), propagada pelo solucionador de Kepler do próprio motor nesse mesmo referencial inercial e reduzida ao MCMF pela orientação lunar IAU 2015 / WGCCRE (polo com precessão, libração física analítica) em cada época. SEM aproximação de referencial: a fonte indica o referencial e a época, e ambos são usados. Classe de proveniência `published-elements`: distinta de qualquer valor derivado de kernel.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = DEFINIÇÃO publicada da constelação, propagada pelo solucionador de Kepler do próprio motor e reduzida pelo modelo de rotação lunar de rotação média — exatamente o caminho que a constelação ilustrativa segue, de modo que a única diferença entre as duas execuções é o projeto da constelação. A fonte indica os elementos no referencial `{ $v1 }`; aqui eles são lidos como MCI, o que inclina a constelação em `published_frame_tie_angle_deg`. Classe de proveniência `published-elements`: distinta de qualquer valor derivado de kernel.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = station_datum { $other } desconhecido: esperado "fixed" ou "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = uma campanha VLBI exige pelo menos 2 estações para formar uma linha de base, recebidas { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = a estação { $name } tem uma coordenada não finita

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = a latitude { $lat } deg da estação { $name } está fora de [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = um datum de Helmert de sete parâmetros exige pelo menos 3 beacons não colineares, recebidos { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = o beacon { $name } tem uma coordenada não finita

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = a latitude { $lat } deg do beacon { $name } está fora de [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours deve ser positivo e finito, recebido { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min deve ser positivo e finito, recebido { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = o cronograma de { $v1 } épocas excede o limite de 5000 épocas deste cenário; aumente step_min ou reduza arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s deve ser positivo e finito, recebido { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg deve ser finito e estar em [-90, 90), recebido { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg deve ser finito e estar em [-90, 90), recebido { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol deve ser finito e estar em [0, 1), recebido { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m deve ser positivo e finito, recebido { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver deve ser "spectral" ou "srif", recebido "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = serialização do resultado de lunar-frame-campaign: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign =
    { $n_epochs ->
        [one]
            { $n_beacons ->
                [one] nenhuma observação da campanha supera a máscara de elevação de { $mask } deg do lado da Terra nas duas extremidades de uma linha de base E a máscara de { $earth_mask } deg acima do horizonte do próprio beacon: { $n_epochs } época x { $v1 } linhas de base x { $n_beacons } beacon, todos rejeitados. Aumente arc_hours, reduza uma máscara ou mude as estações.
                [many] nenhuma observação da campanha supera a máscara de elevação de { $mask } deg do lado da Terra nas duas extremidades de uma linha de base E a máscara de { $earth_mask } deg acima do horizonte do próprio beacon: { $n_epochs } época x { $v1 } linhas de base x { $n_beacons } de beacons, todos rejeitados. Aumente arc_hours, reduza uma máscara ou mude as estações.
               *[other] nenhuma observação da campanha supera a máscara de elevação de { $mask } deg do lado da Terra nas duas extremidades de uma linha de base E a máscara de { $earth_mask } deg acima do horizonte do próprio beacon: { $n_epochs } época x { $v1 } linhas de base x { $n_beacons } beacons, todos rejeitados. Aumente arc_hours, reduza uma máscara ou mude as estações.
            }
        [many]
            { $n_beacons ->
                [one] nenhuma observação da campanha supera a máscara de elevação de { $mask } deg do lado da Terra nas duas extremidades de uma linha de base E a máscara de { $earth_mask } deg acima do horizonte do próprio beacon: { $n_epochs } de épocas x { $v1 } linhas de base x { $n_beacons } beacon, todos rejeitados. Aumente arc_hours, reduza uma máscara ou mude as estações.
                [many] nenhuma observação da campanha supera a máscara de elevação de { $mask } deg do lado da Terra nas duas extremidades de uma linha de base E a máscara de { $earth_mask } deg acima do horizonte do próprio beacon: { $n_epochs } de épocas x { $v1 } linhas de base x { $n_beacons } de beacons, todos rejeitados. Aumente arc_hours, reduza uma máscara ou mude as estações.
               *[other] nenhuma observação da campanha supera a máscara de elevação de { $mask } deg do lado da Terra nas duas extremidades de uma linha de base E a máscara de { $earth_mask } deg acima do horizonte do próprio beacon: { $n_epochs } de épocas x { $v1 } linhas de base x { $n_beacons } beacons, todos rejeitados. Aumente arc_hours, reduza uma máscara ou mude as estações.
            }
       *[other]
            { $n_beacons ->
                [one] nenhuma observação da campanha supera a máscara de elevação de { $mask } deg do lado da Terra nas duas extremidades de uma linha de base E a máscara de { $earth_mask } deg acima do horizonte do próprio beacon: { $n_epochs } épocas x { $v1 } linhas de base x { $n_beacons } beacon, todos rejeitados. Aumente arc_hours, reduza uma máscara ou mude as estações.
                [many] nenhuma observação da campanha supera a máscara de elevação de { $mask } deg do lado da Terra nas duas extremidades de uma linha de base E a máscara de { $earth_mask } deg acima do horizonte do próprio beacon: { $n_epochs } épocas x { $v1 } linhas de base x { $n_beacons } de beacons, todos rejeitados. Aumente arc_hours, reduza uma máscara ou mude as estações.
               *[other] nenhuma observação da campanha supera a máscara de elevação de { $mask } deg do lado da Terra nas duas extremidades de uma linha de base E a máscara de { $earth_mask } deg acima do horizonte do próprio beacon: { $n_epochs } épocas x { $v1 } linhas de base x { $n_beacons } beacons, todos rejeitados. Aumente arc_hours, reduza uma máscara ou mude as estações.
            }
    }


engine-lunar-frame-campaign-full-rank-all-similarity-parameters = posto completo: todos os 7 parâmetros de similaridade são restringidos por esta campanha (número de condição { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = POSTO DEFICIENTE: { $defect } de 7 direções de similaridade não são observáveis nesta campanha, portanto NENHUM sigma de datum é publicado; as direções não observáveis são listadas na base de sete parâmetros

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines =
    { $n_beacons ->
        [one]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } beacon x { $v1 } linhas de base x { $n_epochs } época = { $n_obs } obs (sigma de atraso { $sigma_tau } s) | datum da estação { $station_datum } | posto de Helmert { $rank }/7 cond { $condition } | sigma de translação do datum { $v5 } vs erro de recuperação da transformação injetada { $trans_err_norm_m } m (razão { $v7 })
                [many] lunar-frame-campaign | { $n_beacons } beacon x { $v1 } linhas de base x { $n_epochs } de épocas = { $n_obs } obs (sigma de atraso { $sigma_tau } s) | datum da estação { $station_datum } | posto de Helmert { $rank }/7 cond { $condition } | sigma de translação do datum { $v5 } vs erro de recuperação da transformação injetada { $trans_err_norm_m } m (razão { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } beacon x { $v1 } linhas de base x { $n_epochs } épocas = { $n_obs } obs (sigma de atraso { $sigma_tau } s) | datum da estação { $station_datum } | posto de Helmert { $rank }/7 cond { $condition } | sigma de translação do datum { $v5 } vs erro de recuperação da transformação injetada { $trans_err_norm_m } m (razão { $v7 })
            }
        [many]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } de beacons x { $v1 } linhas de base x { $n_epochs } época = { $n_obs } obs (sigma de atraso { $sigma_tau } s) | datum da estação { $station_datum } | posto de Helmert { $rank }/7 cond { $condition } | sigma de translação do datum { $v5 } vs erro de recuperação da transformação injetada { $trans_err_norm_m } m (razão { $v7 })
                [many] lunar-frame-campaign | { $n_beacons } de beacons x { $v1 } linhas de base x { $n_epochs } de épocas = { $n_obs } obs (sigma de atraso { $sigma_tau } s) | datum da estação { $station_datum } | posto de Helmert { $rank }/7 cond { $condition } | sigma de translação do datum { $v5 } vs erro de recuperação da transformação injetada { $trans_err_norm_m } m (razão { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } de beacons x { $v1 } linhas de base x { $n_epochs } épocas = { $n_obs } obs (sigma de atraso { $sigma_tau } s) | datum da estação { $station_datum } | posto de Helmert { $rank }/7 cond { $condition } | sigma de translação do datum { $v5 } vs erro de recuperação da transformação injetada { $trans_err_norm_m } m (razão { $v7 })
            }
       *[other]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } beacons x { $v1 } linhas de base x { $n_epochs } época = { $n_obs } obs (sigma de atraso { $sigma_tau } s) | datum da estação { $station_datum } | posto de Helmert { $rank }/7 cond { $condition } | sigma de translação do datum { $v5 } vs erro de recuperação da transformação injetada { $trans_err_norm_m } m (razão { $v7 })
                [many] lunar-frame-campaign | { $n_beacons } beacons x { $v1 } linhas de base x { $n_epochs } de épocas = { $n_obs } obs (sigma de atraso { $sigma_tau } s) | datum da estação { $station_datum } | posto de Helmert { $rank }/7 cond { $condition } | sigma de translação do datum { $v5 } vs erro de recuperação da transformação injetada { $trans_err_norm_m } m (razão { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } beacons x { $v1 } linhas de base x { $n_epochs } épocas = { $n_obs } obs (sigma de atraso { $sigma_tau } s) | datum da estação { $station_datum } | posto de Helmert { $rank }/7 cond { $condition } | sigma de translação do datum { $v5 } vs erro de recuperação da transformação injetada { $trans_err_norm_m } m (razão { $v7 })
            }
    }


engine-lunar-frame-campaign-of-beacons-have-no-observation = { $names } de { $beacons } beacons não têm observação neste cronograma ({ $names2 }); não trazem informação, seus sigmas são nulos e o datum é realizado apenas a partir dos beacons observados

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = todos os sigmas devem ser positivos

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane e altitude_km devem ser positivos

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency deve estar em (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: sigma de posição GNSS { $v } m vs terrestre { $v2 } m, q médio { $v3 } (qui-quadrado 6 espera 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: { $last } ambiguidades, sucesso de ILS { $last2 } (bootstrap { $last3 }) no arco mais longo

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: menor autovalor de informação x{ $v } com enlaces do orbitador, traço do CRLB x{ $v2 }

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: { $last } pontos de varredura em { $v } arcos; sigma de translação laser vs GNSS x { $last2 } m no vínculo local registrado

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: sigma do CRLB h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = estudo `{ $other }` desconhecido: esperado um de { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = o conjunto de medições não determina a órbita (informação singular)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials deve ser pelo menos 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = os sigmas terrestres devem ser positivos

engine-e-lunar-infra-od-unknown-station-dss-14-dss = estação `{ $nm }` desconhecida: DSS-14, DSS-63 ou DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = medições terrestres insuficientes para determinar a órbita

engine-e-lunar-infra-od-the-covariance-of-the-difference = a covariância da diferença é singular

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = a correção diferencial da NRHO não convergiu a partir da semente

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo exige 0 < altitude do periluna < altitude do apoluna

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = família de órbitas `{ $other }` desconhecida: nrho ou elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s e arc_days devem ser positivos

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = nenhum satélite em comum entre os receptores

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = as equações normais da fase da portadora são singulares

engine-e-lunar-infra-phase-the-position-block-is-singular = o bloco de posição é singular

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = a covariância das ambiguidades não é positiva definida

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = os sigmas das técnicas devem ser positivos

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = os sigmas do vínculo local devem ser positivos

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz deve ser finito e positivo

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz deve ser finito e positivo

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k deve ser finito e positivo

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km deve ser finito e superior ao raio lunar

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity deve estar em [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw deve ser finito

engine-lunar-jamming-lunar-jamming-sats-epochs-links =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } época, { $n_links } enlace a partir de ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (média { $mean_js_db }) | { $n_lost } LOST | disponibilidade { $availability_under_jamming } de { $availability_nominal } nominal
                [many] lunar-jamming | { $n_sats } sats, { $n_epochs } época, { $n_links } de enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (média { $mean_js_db }) | { $n_lost } LOST | disponibilidade { $availability_under_jamming } de { $availability_nominal } nominal
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } época, { $n_links } enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (média { $mean_js_db }) | { $n_lost } LOST | disponibilidade { $availability_under_jamming } de { $availability_nominal } nominal
            }
        [many]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } de épocas, { $n_links } enlace a partir de ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (média { $mean_js_db }) | { $n_lost } LOST | disponibilidade { $availability_under_jamming } de { $availability_nominal } nominal
                [many] lunar-jamming | { $n_sats } sats, { $n_epochs } de épocas, { $n_links } de enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (média { $mean_js_db }) | { $n_lost } LOST | disponibilidade { $availability_under_jamming } de { $availability_nominal } nominal
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } de épocas, { $n_links } enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (média { $mean_js_db }) | { $n_lost } LOST | disponibilidade { $availability_under_jamming } de { $availability_nominal } nominal
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } épocas, { $n_links } enlace a partir de ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (média { $mean_js_db }) | { $n_lost } LOST | disponibilidade { $availability_under_jamming } de { $availability_nominal } nominal
                [many] lunar-jamming | { $n_sats } sats, { $n_epochs } épocas, { $n_links } de enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (média { $mean_js_db }) | { $n_lost } LOST | disponibilidade { $availability_under_jamming } de { $availability_nominal } nominal
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } épocas, { $n_links } enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (média { $mean_js_db }) | { $n_lost } LOST | disponibilidade { $availability_under_jamming } de { $availability_nominal } nominal
            }
    }


engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } época, { $n_links } enlace a partir de ({ $site_lat_deg }, { $site_lon_deg }) | sem jammer (linha de base lunar de céu limpo) | { $n_lost } LOST | disponibilidade { $availability_nominal }
                [many] lunar-jamming | { $n_sats } sats, { $n_epochs } época, { $n_links } de enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | sem jammer (linha de base lunar de céu limpo) | { $n_lost } LOST | disponibilidade { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } época, { $n_links } enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | sem jammer (linha de base lunar de céu limpo) | { $n_lost } LOST | disponibilidade { $availability_nominal }
            }
        [many]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } de épocas, { $n_links } enlace a partir de ({ $site_lat_deg }, { $site_lon_deg }) | sem jammer (linha de base lunar de céu limpo) | { $n_lost } LOST | disponibilidade { $availability_nominal }
                [many] lunar-jamming | { $n_sats } sats, { $n_epochs } de épocas, { $n_links } de enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | sem jammer (linha de base lunar de céu limpo) | { $n_lost } LOST | disponibilidade { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } de épocas, { $n_links } enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | sem jammer (linha de base lunar de céu limpo) | { $n_lost } LOST | disponibilidade { $availability_nominal }
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sats, { $n_epochs } épocas, { $n_links } enlace a partir de ({ $site_lat_deg }, { $site_lon_deg }) | sem jammer (linha de base lunar de céu limpo) | { $n_lost } LOST | disponibilidade { $availability_nominal }
                [many] lunar-jamming | { $n_sats } sats, { $n_epochs } épocas, { $n_links } de enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | sem jammer (linha de base lunar de céu limpo) | { $n_lost } LOST | disponibilidade { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sats, { $n_epochs } épocas, { $n_links } enlaces a partir de ({ $site_lat_deg }, { $site_lon_deg }) | sem jammer (linha de base lunar de céu limpo) | { $n_lost } LOST | disponibilidade { $availability_nominal }
            }
    }


## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = cabeçalho inesperado do catálogo de refletores { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = linha curta demais do catálogo de refletores { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = campo de refletor { $i } ilegível em { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = refletor { $f }: |(x,y,z)| = { $norm3 } m, mas a coluna de raio publicada indica { $radius } m — a linha foi editada

engine-e-lunar-llr-reflector-catalogue-has-no-rows = o catálogo de refletores não tem linhas

engine-e-lunar-llr-unreadable-position-epoch-year = position_epoch_year { $rest } ilegível

engine-e-lunar-llr-unexpected-station-catalogue-header = cabeçalho inesperado do catálogo de estações { $t }

engine-e-lunar-llr-short-station-catalogue-row = linha curta demais do catálogo de estações { $t }

engine-e-lunar-llr-unreadable-station-field-in = campo de estação { $i } ilegível em { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = id ILRS ilegível em { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = o catálogo de estações não tem linhas

engine-e-lunar-llr-cannot-read-this-scenario-runs = não foi possível ler { $path } ({ $e }). Este cenário é executado sobre a fatia de dados reais registrada em { $DEFAULT_DATA_DIR }, que acompanha o repositório, mas não o crate publicado; aponte `data_dir` para uma cópia dela.

engine-e-lunar-llr-only-usable-normal-points-for = apenas { $used } pontos normais utilizáveis para { $reflectors } refletores — poucos para delimitar { $v3 } coordenadas; amplie a fatia do arquivo

engine-e-lunar-llr-the-simulated-campaign-own-report = o relatório da própria campanha simulada não pôde ser analisado: { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal =
    { $n_parsed ->
        [one] lunar-llr-datum: { $used } pontos normais arquivados ({ $n_parsed } analisado) de { $station_counts } estação(ões) para { $reflectors } matrizes de retrorrefletores ao longo de { $v5 } d; precisão mediana medida dos pontos normais { $median } mm de ida; posto de informação dos refletores { $rank }/{ $n }; posto de Helmert { $rank2 }/{ $n_helmert } cond { $condition }; sigma de translação do datum { $v12 } m; RMS do resíduo de ida observado menos calculado { $rms_m } m ({ $v14 })
        [many] lunar-llr-datum: { $used } pontos normais arquivados ({ $n_parsed } analisados) de { $station_counts } estação(ões) para { $reflectors } matrizes de retrorrefletores ao longo de { $v5 } d; precisão mediana medida dos pontos normais { $median } mm de ida; posto de informação dos refletores { $rank }/{ $n }; posto de Helmert { $rank2 }/{ $n_helmert } cond { $condition }; sigma de translação do datum { $v12 } m; RMS do resíduo de ida observado menos calculado { $rms_m } m ({ $v14 })
       *[other] lunar-llr-datum: { $used } pontos normais arquivados ({ $n_parsed } analisados) de { $station_counts } estação(ões) para { $reflectors } matrizes de retrorrefletores ao longo de { $v5 } d; precisão mediana medida dos pontos normais { $median } mm de ida; posto de informação dos refletores { $rank }/{ $n }; posto de Helmert { $rank2 }/{ $n_helmert } cond { $condition }; sigma de translação do datum { $v12 } m; RMS do resíduo de ida observado menos calculado { $rms_m } m ({ $v14 })
    }


engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg deve ser finito e estar em [-90, 90), recebido { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } tem uma coordenada não finita

engine-e-lunar-llr-latitude-deg-is-outside-90 = a latitude { $lat_deg } deg de { $kind } { $name } está fora de [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = falha na serialização do relatório de lunar-llr-datum: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = o passo de integração deve dividir o passo de saída

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receptor: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } deve ser finito e não negativo

engine-lunar-receiver-must-be-finite-and-positive = { $n } deve ser finito e positivo

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: exportação do sítio: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = as efemérides lunares { $path } cobrem { $until } s após a sua época, mas o horizonte do cenário alcança { $last } s; reduza horizon_hours ou obtenha um arco mais longo (a extrapolação de efemérides tabuladas é recusada)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path exige epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = referencial OP em { $epoch } UTC (normal da órbita aparente da Terra em torno da Lua, x ao longo do seu nó no equador lunar IAU); GM, J2 e C22 lunares no referencial fixo da Lua IAU, Terra e Sol como terceiros corpos nas posições DE440 de { $spk_path }; Runge-Kutta de quarta ordem, passo de 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m deve ser finito e positivo

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m deve ser finito e positivo

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 exige height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites deve ser 3 ou 4, recebido { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs deve estar entre 1 e 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } deve ser finito e positivo

engine-lunar-station-must-be-finite-and-not = { $name } deve ser finito e não negativo

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } excede { $MAX_WORK }; reduza n_trials, torne grid_lat_step_deg mais grosseiro (ou liste menos pontos), ou aumente t_step_s / reduza t_span_s

engine-e-lunar-station-kind-must-be-got = kind deve ser { $KIND }; recebido { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: as efemérides { $path } cobrem { $until } s, mas a execução alcança { $last } s (a última época mais latency_s); reduza t_span_s

engine-e-lunar-station-no-case = { $KIND }: nenhum caso ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = { $n_grid_points } pontos · { $n_epochs } épocas · { $n_trials } ensaios

engine-lunar-station-hpl-max = HPL máx. { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = levantamento { $survey_sigma_m } m · latência { $latency_s } s · { $quantization_bits } bits

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines e samples devem estar entre 2 e { $MAX_DEM_SIDE }, recebido { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: { $heights_m } alturas para uma grade de { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m deve ser positivo, recebido { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m deve ser positivo, recebido { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: não foi possível ler { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection deve ser south-polar-stereographic, recebido { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type deve ser int16-le, recebido { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: não foi possível ler { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: grade acima do limite de { $MAX_DEM_SIDE } pixels

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } tem { $bytes } bytes; { $lines } x { $samples } int16 exige { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: o SHA-256 { $digest } de { $img } não coincide com { $image_sha256 } do descritor

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor deve ser positivo

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: não foi possível ler { $path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: exige pelo menos 2 x 2 pontos, uma extensão crescente dentro de [-90, 90] deg e 360 deg de longitude, e alturas finitas

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } deve ser finito e positivo, recebido { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m deve ser finito e não negativo, recebido { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg deve ser no máximo 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m deve estar entre 1 e 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: o sítio está fora do campo de alturas

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: um horizonte informado exige uma fonte não vazia

engine-e-lunar-terrain-terrain-stated-horizon = terrain: horizonte informado: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: informe dem_path ou dem_tile_path, não ambos

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km deve ser finito e positivo

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m deve ser finito e positivo

engine-e-lunar-terrain-site-deg-deg = { $e } (sítio { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = relógio { $other } desconhecido; esperado um de optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks deve nomear pelo menos uma classe de relógio

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s deve ser finito e positivo, recebido { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s deve ser finito e maior que tau_min_s ({ $lo }), recebido { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade deve ser ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = o termo { $name } é mais curto do que a grade de tau

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | relógio { $clock } | x_Σ(τ) de 7 termos em { $taus } pontos τ ({ $taus2 }–{ $taus3 } s) | cruzamento τ { $crossover_tau_s } s (x { $crossover_x_s } s) | piso do referencial { $frame_term_s } s | x(1 d) do relógio { $x_1day_ns } ns (MODELLED)

engine-lunar-time-budget-scenario-time-lab-to-ltc-ns = { $summary } | laboratório de tempo: { $lab } { $lab2 } até LTC, x(1 d) { $lab3 } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: relógio { $other } desconhecido; esperado um de optical-master, passive-h-maser, rafs, mini-rafs, ou informe um device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: informe clock ou device_card, não ambos

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s deve ser finito e positivo, recebido { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } deve ser finito e não negativo, recebido { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s deve conter números positivos

engine-lunar-time-lab-station-height-not-modelled-exactly = altura da estação não modelada com exatidão: um erro de altura de um sigma de { $height_sigma_m } m enviesa a taxa em { $value } ns/day, aplicado como termo linear desde o último ajuste

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = o tempo de luz não convergiu para 1e-15 s em 30 iterações

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = o caminho de kernel exige planetary_kernel_path, earth_orientation_kernel_path e moon_orientation_kernel_path em conjunto

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = datum { $other } desconhecido: esperado "anchor-first-station", "free-network" ou "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = um cronograma VLBI exige pelo menos 2 estações para formar uma linha de base, recebidas { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = as coordenadas do beacon devem ser finitas

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = a latitude { $lat } deg do beacon está fora de [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = o cronograma de { $v1 } épocas excede o limite de 20000 épocas deste cenário; aumente step_min ou reduza arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g deve ser positivo e finito, recebido { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = serialização do resultado de lunar-vlbi-fim: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule =
    { $n_epochs ->
        [one] nenhuma observação do cronograma supera a máscara de elevação de { $mask } deg nas duas extremidades de uma linha de base: { $n_epochs } época x { $v1 } linhas de base, todas rejeitadas. Aumente arc_hours, reduza elevation_mask_deg ou mude as estações.
        [many] nenhuma observação do cronograma supera a máscara de elevação de { $mask } deg nas duas extremidades de uma linha de base: { $n_epochs } de épocas x { $v1 } linhas de base, todas rejeitadas. Aumente arc_hours, reduza elevation_mask_deg ou mude as estações.
       *[other] nenhuma observação do cronograma supera a máscara de elevação de { $mask } deg nas duas extremidades de uma linha de base: { $n_epochs } épocas x { $v1 } linhas de base, todas rejeitadas. Aumente arc_hours, reduza elevation_mask_deg ou mude as estações.
    }


engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = o datum não deixa nenhum parâmetro a estimar

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = POSTO DEFICIENTE: { $defect } de { $dim } direções não são observáveis, portanto nenhum sigma por coordenada é informado; o valor do subespaço observável abaixo é uma pseudoinversa restrita às { $rank } direções observáveis e NÃO é um sigma de estação

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines =
    { $n_stations ->
        [one]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } estação / { $v2 } linhas de base x { $n_epochs } época = { $n_obs } obs (máscara { $mask } deg) | datum { $datum } | posto { $rank }/{ $dim } cond { $condition } | sigma de estação { $v10 } vs equipartição g={ $g } { $eq_g } m (razão { $v13 })
                [many] lunar-vlbi-fim | { $n_stations } estação / { $v2 } linhas de base x { $n_epochs } de épocas = { $n_obs } obs (máscara { $mask } deg) | datum { $datum } | posto { $rank }/{ $dim } cond { $condition } | sigma de estação { $v10 } vs equipartição g={ $g } { $eq_g } m (razão { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } estação / { $v2 } linhas de base x { $n_epochs } épocas = { $n_obs } obs (máscara { $mask } deg) | datum { $datum } | posto { $rank }/{ $dim } cond { $condition } | sigma de estação { $v10 } vs equipartição g={ $g } { $eq_g } m (razão { $v13 })
            }
        [many]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } de estações / { $v2 } linhas de base x { $n_epochs } época = { $n_obs } obs (máscara { $mask } deg) | datum { $datum } | posto { $rank }/{ $dim } cond { $condition } | sigma de estação { $v10 } vs equipartição g={ $g } { $eq_g } m (razão { $v13 })
                [many] lunar-vlbi-fim | { $n_stations } de estações / { $v2 } linhas de base x { $n_epochs } de épocas = { $n_obs } obs (máscara { $mask } deg) | datum { $datum } | posto { $rank }/{ $dim } cond { $condition } | sigma de estação { $v10 } vs equipartição g={ $g } { $eq_g } m (razão { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } de estações / { $v2 } linhas de base x { $n_epochs } épocas = { $n_obs } obs (máscara { $mask } deg) | datum { $datum } | posto { $rank }/{ $dim } cond { $condition } | sigma de estação { $v10 } vs equipartição g={ $g } { $eq_g } m (razão { $v13 })
            }
       *[other]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } estações / { $v2 } linhas de base x { $n_epochs } época = { $n_obs } obs (máscara { $mask } deg) | datum { $datum } | posto { $rank }/{ $dim } cond { $condition } | sigma de estação { $v10 } vs equipartição g={ $g } { $eq_g } m (razão { $v13 })
                [many] lunar-vlbi-fim | { $n_stations } estações / { $v2 } linhas de base x { $n_epochs } de épocas = { $n_obs } obs (máscara { $mask } deg) | datum { $datum } | posto { $rank }/{ $dim } cond { $condition } | sigma de estação { $v10 } vs equipartição g={ $g } { $eq_g } m (razão { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } estações / { $v2 } linhas de base x { $n_epochs } épocas = { $n_obs } obs (máscara { $mask } deg) | datum { $datum } | posto { $rank }/{ $dim } cond { $condition } | sigma de estação { $v10 } vs equipartição g={ $g } { $eq_g } m (razão { $v13 })
            }
    }


## src/main.rs

engine-main-error-validate-needs-scenario-path = erro: --validate exige o caminho de um cenário

engine-main-error-study-needs-suite-manifest = erro: --study exige o caminho de um manifesto de suíte

engine-main-error-study-name-needs-value = erro: --study-name exige um valor

engine-main-error-export-sp3-needs-path = erro: --export-sp3 exige um caminho

engine-main-error-export-omm-needs-path = erro: --export-omm exige um caminho

engine-main-error-export-oem-needs-path = erro: --export-oem exige um caminho

engine-main-error-animate-needs-format-svg = erro: --animate exige um formato: svg, html, frames ou all

engine-main-error-animate = erro: --animate: { $e }

engine-main-error-animate-fps-needs-whole = erro: --animate-fps exige um número inteiro de quadros por segundo

engine-main-error-export-needs-format-czml = erro: --export exige um formato: czml, kml, geojson, stk, sigmf, all ou list

engine-main-error-animate-duration-needs-length = erro: --animate-duration exige uma duração em segundos

engine-main-error-import-route-needs-geojson = erro: --import-route exige o caminho de um arquivo GeoJSON

engine-main-error-eop-needs-finals2000a-file = erro: --eop exige o caminho de um arquivo finals2000A

engine-main-error-unknown-option = erro: opção '{ $other }' desconhecida

engine-main-error-unexpected-argument-one-scenario = erro: argumento '{ $other }' inesperado; um arquivo de cenário por execução

engine-main-warning-animate-fps-and-animate = aviso: --animate-fps e --animate-duration não têm efeito sem --animate

engine-main-error-animate-exports-one-scenario = erro: --animate exporta a execução de um cenário; não se combina com --validate nem com --study

engine-main-error-validate-lints-one-scenario = erro: --validate analisa um cenário; não informe também um arquivo de cenário

engine-main-error-cannot-read = erro: não foi possível ler { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — o tipo é resolvido; este tipo não exige nenhum campo (um corpo vazio executa a sua configuração de referência), portanto não havia mais nada a verificar

engine-main-ok-kind-resolves-and-all =
    { $n_required ->
        [one] ok: { $kind } — o tipo é resolvido e { $n_required } entrada de campo obrigatório publicada está satisfeita; os valores dos campos não são verificados
        [many] ok: { $kind } — o tipo é resolvido e todas as { $n_required } de entradas de campos obrigatórios publicadas estão satisfeitas; os valores dos campos não são verificados
       *[other] ok: { $kind } — o tipo é resolvido e todas as { $n_required } entradas de campos obrigatórios publicadas estão satisfeitas; os valores dos campos não são verificados
    }


engine-main-error-study-runs-suite-do = erro: --study executa uma suíte; não informe também um único arquivo de cenário

engine-main-warning-study-name-is-ignored = aviso: --study-name é ignorado com --study; um estudo recebe o título de `title =` no manifesto da suíte

engine-main-error-cannot-read-2 = erro: não foi possível ler { $path }: { $e }

engine-main-hint-kshana-example-lists-the = dica: `kshana example` lista os cenários de referência incluídos; `kshana example clock-holdover > clock-holdover.toml` grava um deles

engine-main-error-cannot-read-3 = erro: não foi possível ler { $eop_file }: { $e }

engine-main-error-eop = erro: --eop: { $e }

engine-main-error-cannot-read-4 = erro: não foi possível ler { $route_file }: { $e }

engine-main-error-import-route = erro: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: não se aplica: { $why }

engine-main-error-export = erro: --export: { $e }

engine-main-error-animate-2 = erro: --animate { $f }: { $e }

engine-main-error-export-2 = erro: exportação { $fmt }: { $e }

engine-main-error-cannot-write = erro: não foi possível gravar { $json_path }: { $e }

engine-main-error-cannot-write-2 = erro: não foi possível gravar { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = erro: não foi possível montar o relatório: { $e }

engine-main-error-cannot-write-3 = erro: não foi possível gravar { $html_path }: { $e }

engine-main-error-cannot-write-4 = erro: não foi possível gravar { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = erro: não foi possível gravar { $csv_path }: { $e }

engine-main-wrote-and = gravados { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } e { $csv_path }

engine-main-wrote-and-2 = gravados { $json_path }, { $svg_path }, { $html_path } e { $report_json_path }

engine-main-error-cannot-write-6 = erro: não foi possível gravar { $target }: { $e }

engine-main-error-cannot-write-7 = erro: não foi possível gravar { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = erro: falha na exportação SP3: { $e }

engine-main-error-cannot-write-8 = erro: não foi possível gravar { $omm_path }: { $e }

engine-main-error-omm-export-failed = erro: falha na exportação OMM: { $e }

engine-main-error-cannot-write-9 = erro: não foi possível gravar { $oem_path }: { $e }

engine-main-error-oem-export-failed = erro: falha na exportação OEM: { $e }

engine-main-error-unexpected-argument-after-kinds = erro: argumento '{ $other }' inesperado após `kinds`; apenas --json é aceito

engine-main-bundled-reference-scenarios-write-one =
    Cenários de referência incluídos ({ $v1 }). Grave um em um arquivo e execute-o:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (não incluído: { $name } — execute `kshana example { $name }` para saber o motivo)

engine-main-error-is-not-bundled-it = erro: '{ $name }' não está incluído: ele { $why }

engine-main-error-no-bundled-scenario-named = erro: nenhum cenário incluído com o nome '{ $name }'; `kshana example` lista os { $v1 } existentes

engine-main-error-cannot-read-5 = erro: não foi possível ler { $suite_path }: { $e }

engine-main-wrote-and-3 = gravados { $json_path } e { $html_path }

engine-main-error-needs-value = erro: { $a } exige um valor

engine-main-error-expected-mean-needs-number = erro: --expected-mean exige um número

engine-main-error-unknown-imu-fit-option = erro: opção de imu-fit { $x } desconhecida

engine-main-error-imu-fit-needs-an = erro: imu-fit exige o caminho de um registro de IMU

engine-main-error-needs-value-2 = erro: { $args } exige um valor

engine-main-error-epoch = erro: --epoch: { $e }

engine-main-error-unknown-bench-export-option = erro: opção de bench-export { $a } desconhecida

engine-main-error-bench-export-needs-scenario = erro: bench-export exige o caminho de um cenário

engine-main-needs-value = { $a } exige um valor

engine-main-site-takes-lat-lon-height = --site recebe lat,lon[,height_m], recebido { $v }

engine-main-error-is-bytes-the-tle = erro: { $p } tem { $m } bytes; o limite de TLE é { $cap } (4 MiB)

engine-main-error-cannot-read-6 = erro: não foi possível ler { $p }: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = opção de sky { $a } desconhecida

engine-e-main-svg-and-monte-carlo-are = --svg e --monte-carlo são saídas distintas; informe apenas uma

engine-main-error-preset-needs-name =
    erro: --preset exige um nome
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    erro: --profile exige um arquivo
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } símbolos, { $r2 } quadro(s) encontrado(s); { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }quadro em { $f }: FID { $f2 } TOI { $f3 } (métrica SB1 { $f4 }, { $f5 } erro(s) de SP, { $f6 } erro(s) de SB1)

engine-main-not-checked = não verificado: { $r }

engine-main-wrote-frame-of-6000-symbols = gravado { $out }: { $frames } quadro(s) de 6000 símbolos; os subquadros 2 a 4 são marcadores de posição (sem codificação LDPC, sem mensagem)

engine-main-error-cannot-write-10 = erro: não foi possível gravar { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = subcomando de lunanet-afs-check { $other } desconhecido

engine-main-needs-pack-id = { $cmd } exige um id de pacote

engine-main-unknown-standards-pack-run-option = opção de standards-pack run { $a } desconhecida

engine-main-unknown-standards-pack-subcommand = subcomando de standards-pack { $other } desconhecido

engine-main-error-out-needs-value = erro: --out exige um valor

engine-main-error-unknown-compliance-report-option = erro: opção de compliance-report { $a } desconhecida

engine-main-error-compliance-report-needs-at = erro: compliance-report exige pelo menos um arquivo .json de resultado

engine-main-runs-read-not-used-rows = { $runs } execuções lidas, { $unrecognised } não utilizadas; linhas: { $n } com evidência, { $n2 } parcialmente, { $n3 } sem evidência, { $n4 } fora do escopo

engine-main-error-receiver-trust-needs-scenario = erro: receiver-trust exige o caminho de um cenário

engine-main-error-invalid-receiver-trust-scenario = erro: cenário de receiver-trust inválido: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = a queima esgota a massa: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, queima={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = o tempo de voo deve ser positivo

engine-e-maneuver-collinear-endpoints-transfer-plane-is = extremidades colineares: o plano de transferência é indefinido (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs destina-se a M >= 1; use lambert para M = 0

engine-e-maneuver-no-revolution-transfer-the-time = nenhuma transferência de { $revs } revolução(ões): o tempo de voo está abaixo do mínimo

engine-e-maneuver-grid-step-days-must-be = grid_step_days deve ser positivo, obtido { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = cada janela deve avançar no tempo (início <= fim)

engine-e-maneuver-no-transfer-of-the-requested = nenhuma transferência do tipo solicitado nas janelas

engine-e-maneuver-the-optimum-left-the-feasible = o ótimo saiu da região viável

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: esperados 3 valores

engine-e-mars-od-dss-epoch-is-not-2003 = a época de DSS-{ $id } não é 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } não tem DXYZ

engine-e-mars-od-no-coordinates-for-dss = sem coordenadas para a DSS { $station }

engine-e-mars-od-no-ramps-for-dss = sem rampas para a DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = a tabela de rampas não cobre o intervalo

engine-e-mars-od-epoch-outside-the-integrated-span = época { $et } fora do intervalo integrado

engine-e-mars-od-normal-matrix-is-not-positive = a matriz normal não é definida positiva

engine-e-mars-od-no-points = nenhum ponto

engine-e-mars-od-parameter-has-no-partial-on = um parâmetro não tem derivada parcial nos pontos mantidos

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays =
    { $n_relays ->
        [one] mars-pnt { $r } | usuário { $user }, relógio { $clock_class } | { $n_relays } retransmissor (média de { $mean_relays_in_view } à vista) | RMS de posição convergido { $converged_pos_rms_m } m, 1σ formal { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — FoM de covariância, não é um PL certificado) | σ de frequência do relógio { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
        [many] mars-pnt { $r } | usuário { $user }, relógio { $clock_class } | { $n_relays } de retransmissores (média de { $mean_relays_in_view } à vista) | RMS de posição convergido { $converged_pos_rms_m } m, 1σ formal { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — FoM de covariância, não é um PL certificado) | σ de frequência do relógio { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
       *[other] mars-pnt { $r } | usuário { $user }, relógio { $clock_class } | { $n_relays } retransmissores (média de { $mean_relays_in_view } à vista) | RMS de posição convergido { $converged_pos_rms_m } m, 1σ formal { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — FoM de covariância, não é um PL certificado) | σ de frequência do relógio { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
    }


engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — usuário { $user }, relógio { $clock_class }: erro de posição 3-D em relação à referência (RMS convergido { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = a matriz de comparação par a par está vazia

engine-e-mcda-ahp-pairwise-matrix-is-not-square = a matriz de comparação par a par não é quadrada (a linha { $i } tem { $row } de { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = a entrada a[{ $i }][{ $j }] = { $v } deve ser finita e positiva

engine-e-mcda-ahp-diagonal-must-be = a diagonal a[{ $i }][{ $i }] = { $row } deve ser 1

engine-e-mcda-ahp-entries-must-be-reciprocal = as entradas a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } devem ser recíprocas (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = a linha superior { $i } tem { $row } entradas, esperadas { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = a entrada superior ({ $i },{ $j }) = { $v } deve ser finita e positiva

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: matriz de decisão vazia

engine-e-mcda-copras-copras-no-criteria = COPRAS: nenhum critério

engine-e-mcda-copras-copras-weights-but-criterion-types =
    { $n ->
        [one] COPRAS: { $n } peso, mas { $types } tipos de critério
        [many] COPRAS: { $n } de pesos, mas { $types } tipos de critério
       *[other] COPRAS: { $n } pesos, mas { $types } tipos de critério
    }


engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: exige pelo menos um critério de custo (Min)

engine-e-mcda-copras-copras-alternative-has-values-but =
    { $n ->
        [one] COPRAS: a alternativa { $i } tem { $row } valores, mas há { $n } critério
        [many] COPRAS: a alternativa { $i } tem { $row } valores, mas há { $n } de critérios
       *[other] COPRAS: a alternativa { $i } tem { $row } valores, mas há { $n } critérios
    }


engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: o valor { $x } da alternativa { $i } no critério { $j } deve ser finito e > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: conjunto de dados vazio

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: nenhum critério

engine-e-mcda-electre-electre-alternative-has-values-but =
    { $n ->
        [one] ELECTRE I: a alternativa { $i } tem { $row } valores, mas há { $n } critério
        [many] ELECTRE I: a alternativa { $i } tem { $row } valores, mas há { $n } de critérios
       *[other] ELECTRE I: a alternativa { $i } tem { $row } valores, mas há { $n } critérios
    }


engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: a alternativa { $i } tem um valor não finito

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: matriz de decisão vazia

engine-e-mcda-moora-moora-no-criteria = MOORA: nenhum critério

engine-e-mcda-moora-moora-weights-but-criterion-types =
    { $n ->
        [one] MOORA: { $n } peso, mas { $types } tipos de critério
        [many] MOORA: { $n } de pesos, mas { $types } tipos de critério
       *[other] MOORA: { $n } pesos, mas { $types } tipos de critério
    }


engine-e-mcda-moora-moora-alternative-has-values-but =
    { $n ->
        [one] MOORA: a alternativa { $i } tem { $row } valores, mas há { $n } critério
        [many] MOORA: a alternativa { $i } tem { $row } valores, mas há { $n } de critérios
       *[other] MOORA: a alternativa { $i } tem { $row } valores, mas há { $n } critérios
    }


engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: a alternativa { $i } tem um valor não finito

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: o critério { $j } tem norma L2 nula

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: matriz de decisão vazia

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: nenhum critério

engine-e-mcda-promethee-promethee-ii-weights-but-types =
    { $n ->
        [one] PROMETHEE II: { $n } peso, mas { $types } tipos / { $prefs } funções de preferência
        [many] PROMETHEE II: { $n } de pesos, mas { $types } tipos / { $prefs } funções de preferência
       *[other] PROMETHEE II: { $n } pesos, mas { $types } tipos / { $prefs } funções de preferência
    }


engine-e-mcda-promethee-promethee-ii-alternative-has-values =
    { $n ->
        [one] PROMETHEE II: a alternativa { $i } tem { $row } valores, mas há { $n } critério
        [many] PROMETHEE II: a alternativa { $i } tem { $row } valores, mas há { $n } de critérios
       *[other] PROMETHEE II: a alternativa { $i } tem { $row } valores, mas há { $n } critérios
    }


engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: a alternativa { $i } tem um valor não finito

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: matriz de decisão vazia

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: nenhum critério

engine-e-mcda-topsis-topsis-weights-but-criterion-types =
    { $n ->
        [one] TOPSIS: { $n } peso, mas { $types } tipos de critério
        [many] TOPSIS: { $n } de pesos, mas { $types } tipos de critério
       *[other] TOPSIS: { $n } pesos, mas { $types } tipos de critério
    }


engine-e-mcda-topsis-topsis-alternative-has-values-but =
    { $n ->
        [one] TOPSIS: a alternativa { $i } tem { $row } valores, mas há { $n } critério
        [many] TOPSIS: a alternativa { $i } tem { $row } valores, mas há { $n } de critérios
       *[other] TOPSIS: a alternativa { $i } tem { $row } valores, mas há { $n } critérios
    }


engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: a alternativa { $i } tem um valor não finito

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = a utilidade aditiva não tem atributos

engine-e-mcda-utility-attributes-but-weights = { $attributes } atributos, mas { $weights } pesos

engine-e-mcda-utility-invalid-scaling-constant = constante de escala { $w } inválida

engine-e-mcda-utility-scaling-constants-sum-to-zero = as constantes de escala somam zero

engine-e-mcda-utility-attribute-values-expected-got = esperados { $attributes } valores de atributo, obtidos { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: matriz de decisão vazia

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: nenhum critério

engine-e-mcda-vikor-vikor-weights-but-criterion-types =
    { $n ->
        [one] VIKOR: { $n } peso, mas { $types } tipos de critério
        [many] VIKOR: { $n } de pesos, mas { $types } tipos de critério
       *[other] VIKOR: { $n } pesos, mas { $types } tipos de critério
    }


engine-e-mcda-vikor-vikor-alternative-has-values-but =
    { $n ->
        [one] VIKOR: a alternativa { $i } tem { $row } valores, mas há { $n } critério
        [many] VIKOR: a alternativa { $i } tem { $row } valores, mas há { $n } de critérios
       *[other] VIKOR: a alternativa { $i } tem { $row } valores, mas há { $n } critérios
    }


engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: a alternativa { $i } tem um valor não finito

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: matriz de decisão vazia

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: nenhum critério

engine-e-mcda-waspas-waspas-weights-but-criterion-types =
    { $n ->
        [one] WASPAS: { $n } peso, mas { $types } tipos de critério
        [many] WASPAS: { $n } de pesos, mas { $types } tipos de critério
       *[other] WASPAS: { $n } pesos, mas { $types } tipos de critério
    }


engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } deve estar em [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but =
    { $n ->
        [one] WASPAS: a alternativa { $i } tem { $row } valores, mas há { $n } critério
        [many] WASPAS: a alternativa { $i } tem { $row } valores, mas há { $n } de critérios
       *[other] WASPAS: a alternativa { $i } tem { $row } valores, mas há { $n } critérios
    }


engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: o valor { $x } da alternativa { $i } no critério { $j } deve ser finito e > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: matriz de decisão vazia

engine-e-mcda-wpm-wpm-no-criteria = WPM: nenhum critério

engine-e-mcda-wpm-wpm-weights-but-criterion-types =
    { $n ->
        [one] WPM: { $n } peso, mas { $types } tipos de critério
        [many] WPM: { $n } de pesos, mas { $types } tipos de critério
       *[other] WPM: { $n } pesos, mas { $types } tipos de critério
    }


engine-e-mcda-wpm-wpm-alternative-has-values-but =
    { $n ->
        [one] WPM: a alternativa { $i } tem { $row } valores, mas há { $n } critério
        [many] WPM: a alternativa { $i } tem { $row } valores, mas há { $n } de critérios
       *[other] WPM: a alternativa { $i } tem { $row } valores, mas há { $n } critérios
    }


engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: o valor { $x } da alternativa { $i } no critério { $j } deve ser finito e > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = a matriz de decisão não tem critérios

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = a matriz de decisão não tem alternativas

engine-e-mcda-wsm-criterion-has-an-invalid-weight = o critério '{ $name }' tem um peso { $weight } inválido

engine-e-mcda-wsm-criterion-weights-sum-to-zero = os pesos dos critérios somam zero

engine-e-mcda-wsm-alternative-has-values-but-there =
    { $n ->
        [one] a alternativa '{ $name }' tem { $values } valores, mas há { $n } critério
        [many] a alternativa '{ $name }' tem { $values } valores, mas há { $n } de critérios
       *[other] a alternativa '{ $name }' tem { $values } valores, mas há { $n } critérios
    }


engine-e-mcda-wsm-alternative-has-non-finite-value = a alternativa '{ $name }' tem um valor não finito no critério '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = não é um DAF: menor que um registro

engine-e-naif-kernel-not-daf-identification-word = não é um DAF: palavra de identificação { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = formato binário de DAF { $other } não suportado

engine-e-naif-kernel-implausible-daf-header-nd-ni = cabeçalho de DAF implausível: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = endereço de DAF { $addr } além do fim do arquivo

engine-e-naif-kernel-bad-daf-address-range = intervalo de endereços de DAF { $first }..={ $last } inválido

engine-e-naif-kernel-daf-summary-list-does-not = a lista de sumários de DAF não termina

engine-e-naif-kernel-daf-summary-record-claims-summaries =
    { $count ->
        [one] o registro de sumário de DAF { $rec } declara { $count } sumário
        [many] o registro de sumário de DAF { $rec } declara { $count } de sumários
       *[other] o registro de sumário de DAF { $rec } declara { $count } sumários
    }


engine-e-naif-kernel-malformed-type-segment-rsize-intlen = segmento de tipo 2 malformado: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = o tamanho do segmento de tipo 2 não corresponde ao seu diretório

engine-e-naif-kernel-epoch-outside-the-record = época { $et } fora do registro [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = o tamanho do segmento de tipo 1 não corresponde ao seu N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = registro de tipo 1 malformado: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = não é um SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = o sumário de SPK não é ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = sem dados de SPK de tipo 1/2 para o corpo { $target } em ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = o segmento de SPK para { $target } está no referencial { $frame }, não J2000

engine-e-naif-kernel-spk-centre-chain-does-not = a cadeia de centros do SPK não alcança o baricentro

engine-e-naif-kernel-not-binary-pck = não é um PCK binário: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = o sumário de PCK não é ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = sem dados de PCK de tipo 2 para o referencial { $body_frame } em ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = o referencial de PCK { $body_frame } é dado em relação ao referencial { $other }, que não é J2000 nem ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = número { $s } inválido

engine-e-navsignal-must-be-positive-number = { $s } deve ser um número positivo

engine-e-navsignal-modulation-expected-name-args-bpsk = modulação { $label }: esperado NOME(args), por exemplo BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulação { $label }: falta o parêntese de fechamento

engine-e-navsignal-modulation-is-not-one-of = a modulação { $label } não é BPSK(n), BOC(m,n) nem MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = entidade não terminada em { $s }

engine-e-ndm-xml-bad-character-reference = referência de caractere &{ $ent }; inválida

engine-e-ndm-xml-unknown-entity = entidade &{ $ent }; desconhecida

engine-e-ndm-xml-unterminated-processing-instruction = instrução de processamento não terminada

engine-e-ndm-xml-unterminated-comment = comentário não terminado

engine-e-ndm-xml-unterminated-declaration = declaração não terminada

engine-e-ndm-xml-expected-an-element-at-byte = esperado um elemento no byte { $pos }

engine-e-ndm-xml-unterminated-start-tag = tag de abertura não terminada

engine-e-ndm-xml-attribute-without-value = atributo sem valor

engine-e-ndm-xml-unterminated-attribute-value = valor de atributo não terminado

engine-e-ndm-xml-unterminated-end-tag = tag de fechamento não terminada

engine-e-ndm-xml-unterminated-cdata = CDATA não terminado

engine-e-ndm-xml-content-after-the-root-element = conteúdo após o elemento raiz

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } deve ser finito e não negativo

engine-e-nma-budget-subframe-must-be-positive = subframe_s deve ser positivo

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps deve ser positivo

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed deve ser 0 ou positivo

engine-e-nmea-synth-cli-unexpected-argument = argumento { $s } inesperado

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-nmea-synth-cli-instructor-log = registro do instrutor: { $e }

engine-nmea-synth-cli-instructor-log-and = registro do instrutor: { $jp } e { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = servidor TCP escutando em { $s }; aguardando { $wait_clients } cliente(s)

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = esperado YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = data ou hora fora do intervalo (anos de 1980 a 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = data de calendário inexistente

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } deve ser um número finito

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s deve estar entre 1 e 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz deve ser 1, 2, 5 ou 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = a posição da embarcação deve estar a até 89 graus do equador

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn deve estar entre 0 e 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = os limites de taxa de giro e de aceleração da embarcação devem ser positivos

engine-e-nmea-synth-config-give-at-least-one-waypoint = informe pelo menos um [[waypoint]] ou vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = o waypoint { $v1 } está fora do intervalo

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = speed_kn do waypoint { $v1 } deve estar entre 0 e 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems deve nomear pelo menos uma constelação

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } não é um de { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s deve ser de pelo menos 1

engine-e-nmea-synth-config-event = evento { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s deve estar dentro da execução

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s deve ser positivo; ramp_s e recovery_s não podem ser negativos

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s não deve exceder duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } não se aplica a este tipo

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz deve estar entre 20 e 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db é obrigatório

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db deve estar entre 0 e 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db deve estar entre 0 e 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m é obrigatório

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m deve estar entre 0 e 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = o arrasto aceleraria a trilha falsa em até { $need } m/s^2, acima de max_accel_mps2 = { $a }; aumente ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = informe exatamente um entre bearing_deg e relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s é obrigatório

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s deve ser diferente de zero e estar dentro de um dia

engine-e-nmea-synth-config-delay-is-required = delay_s é obrigatório

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s deve estar entre 0 e 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = o horizonte não descreve nenhuma obstrução

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } terminou

engine-nmea-synth-gen-the-receiver-reports-fix-again =
    { $n_used ->
        [one] o receptor volta a informar uma solução de posição ({ $n_used } satélite usadoo)
        [many] o receptor volta a informar uma solução de posição ({ $n_used } de satélites usados)
       *[other] o receptor volta a informar uma solução de posição ({ $n_used } satélites usados)
    }


engine-nmea-synth-gen-the-receiver-has-no-fix =
    { $n_used ->
        [one] o receptor não tem solução de posição ({ $n_used } satélite utilizável, quatro necessários)
        [many] o receptor não tem solução de posição ({ $n_used } de satélites utilizáveis, quatro necessários)
       *[other] o receptor não tem solução de posição ({ $n_used } satélites utilizáveis, quatro necessários)
    }


## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = de T+{ $start_s } s por { $duration_s } s (rampa de início { $ramp_s } s, rampa de recuperação { $recovery_s } s)

engine-nmea-synth-log-every-tracked-satellite-shows-db = ; todo satélite rastreado mostra { $c } dB-Hz enquanto durar

engine-nmea-synth-log-jamming-received-n0-falls-by = jamming: o C/N0 recebido cai em até { $cn0_drop_db } dB (dispersão por satélite { $spread_db } dB); satélites deixam de ser rastreados e a solução de posição é perdida quando restam menos de quatro utilizáveis

engine-nmea-synth-log-towards-deg-true = rumo a { $b } deg verdadeiros

engine-nmea-synth-log-towards-deg-true-deg-relative = rumo a { $t } deg verdadeiros ({ $r } deg em relação ao curso no início, depois mantido)

engine-nmea-synth-log-position-drag-off-the-reported = arrasto de posição: a posição informada se afasta { $final_offset_m } m { $dir } enquanto o receptor mantém uma solução de posição válida (a trilha falsa atinge o pico de { $pv } m/s e { $pa } m/s^2){ $cf }

engine-nmea-synth-log-time-spoof-reported-utc-moves = spoofing de tempo: o UTC informado se desloca { $offset_s } s do valor verdadeiro; a posição permanece verdadeira{ $cf }

engine-nmea-synth-log-replay-delay-meaconing-style-position = atraso de reprodução (estilo meaconing): a posição{ $v1 } fica atrás da referência em { $delay_s } s{ $cf }

engine-nmea-synth-log-natural-degradation-the-sky-closes = degradação natural: o céu se fecha atrás de um horizonte declarado ({ $e }); os satélites atrás dele permanecem listados sem SNR e não são usados, o C/N0 dos demais não muda e nada é falsificado

engine-nmea-synth-log-instructor-log = REGISTRO DO INSTRUTOR: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Nota do instrutor: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Início { $start_utc }   duração { $duration_s } s   semente { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }PICOS  verdadeiro: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   informado: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: constelação { $other } desconhecida (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }A tolerância está abaixo do piso de ruído de leitura de posto em f64, { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): o piso equivalente de autovalor rel_tol^2 = { $v1 } fica abaixo do ruído de arredondamento da matriz de Gram, de modo que as direções extras são resíduo aritmético, não observabilidade.

engine-observability-gramian-rank-clamped-from-the-singular = posto limitado da contagem de valores singulares { $counted } a min(linhas, colunas) = min({ $n_rows }, { $n_cols }) = { $shape_bound } em rel_tol { $rel_tol }: uma matriz { $n_rows }x{ $n_cols } não pode ter posto { $counted }.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP indefinido (geometria com posto deficiente / singular): posto { $rank } de { $n } estados, defeito de datum { $v3 }, condição { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bytes não é um número inteiro de registros de 36 bytes

engine-e-odf-record-precedes-any-group-header = o registro { $v1 } precede qualquer cabeçalho de grupo

engine-e-odf-no-orbit-data-group = nenhum grupo de dados de órbita

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } não é uma palavra-chave de { $name }

engine-e-odm-without = { $name } sem { $k }

engine-e-odm-needs-exactly-one-of = { $name } exige exatamente um de { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION e MESSAGE_ID são palavras-chave de cabeçalho da versão 3.0 (versão { $version })

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-e-odm-unexpected-line = linha { $b } inesperada

engine-e-odm-unknown-keyword = palavra-chave { $k } desconhecida

engine-e-odm-block-repeated-or-out-of = bloco { $block } repetido ou fora de ordem em { $key }

engine-e-odm-repeated = { $key } repetido

engine-e-odm-comments-after-the-last-keyword = comentários após a última palavra-chave

engine-e-odm-given-twice = { $b } informado duas vezes

engine-e-odm-opm-without-metadata = OPM sem metadados

engine-e-odm-opm-without-state-vector = OPM sem vetor de estado

engine-e-odm-omm-without-metadata = OMM sem metadados

engine-e-odm-omm-without-mean-elements = OMM sem elementos médios

engine-e-odm-is-not-keyword-of-the = { $k } não é uma palavra-chave do bloco { $kind }

engine-e-odm-block-without = bloco { $kind } sem { $k }

engine-e-odm-block-with-data-lines = bloco { $kind } com linhas de dados

engine-e-odm-line-has-values-expected = a linha { $l } de { $kind } tem { $l2 } valores, esperados { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } não é uma palavra-chave de metadados de OCM

engine-e-odm-ocm-metadata-without = metadados de OCM sem { $k }

engine-e-odm-block-repeated = bloco { $kind } repetido

engine-e-odm-inside-block = { $t } dentro de um bloco

engine-e-odm-unsupported-ocm-block = bloco de OCM { $tag } não suportado

engine-odm-outside-block = { $t } fora de um bloco

engine-e-odm-closes-block = { $t } fecha um bloco { $want }

engine-e-odm-unexpected-line-2 = linha { $t } inesperada

engine-e-odm-outside-block = { $k } fora de um bloco

engine-e-odm-unterminated-block = bloco não terminado

## src/oem.rs

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-e-oem-epoch-missing-date-time-separator = época sem o separador 'T' de data/hora: { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = data de época de OEM '{ $date }' não suportada (esperado yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = hora de época de OEM '{ $time }' não suportada (esperado HH:MM:SS)

engine-e-oem-bad-epoch-year = ano de época inválido: { $d }

engine-e-oem-bad-epoch-month = mês de época inválido: { $d }

engine-e-oem-bad-epoch-day = dia de época inválido: { $d }

engine-e-oem-bad-epoch-hour = hora de época inválida: { $t }

engine-e-oem-bad-epoch-minute = minuto de época inválido: { $t }

engine-e-oem-bad-epoch-second = segundo de época inválido: { $t }

engine-e-oem-oem-epoch-field-out-of = campo de época de OEM fora do intervalo: { $s }

engine-e-oem-unexpected-oem-header-line = linha de cabeçalho de OEM inesperada: { $line }

engine-e-oem-expected-meta-start-found = esperado META_START, encontrado: { $line }

engine-e-oem-unexpected-oem-metadata-line = linha de metadados de OEM inesperada: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = metadados do segmento de OEM sem META_STOP

engine-e-oem-oem-metadata-missing-object-name = metadados de OEM sem OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = metadados de OEM sem OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = metadados de OEM sem CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = metadados de OEM sem REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = metadados de OEM sem TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = metadados de OEM sem START_TIME

engine-e-oem-oem-metadata-missing-stop-time = metadados de OEM sem STOP_TIME

engine-e-oem-oem-data-line-needs-position = a linha de dados de OEM exige componentes de posição+velocidade (6) ou +aceleração (9), obtidos { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = valor de estado de OEM não numérico '{ $t }' em: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM sem o cabeçalho CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = OEM sem o cabeçalho CREATION_DATE

engine-e-oem-oem-missing-originator-header = OEM sem o cabeçalho ORIGINATOR

engine-e-oem-oem-carried-no-segments = o OEM não continha segmentos

engine-oem-oem-interop-round-tripped-segment =
    { $n_states_total ->
        [one] oem-interop: ida e volta de { $segments } segmento(s), { $n_states_total } estado; erro máximo de ida e volta { $p } km / { $v } km/s (interop MODELLED)
        [many] oem-interop: ida e volta de { $segments } segmento(s), { $n_states_total } de estados; erro máximo de ida e volta { $p } km / { $v } km/s (interop MODELLED)
       *[other] oem-interop: ida e volta de { $segments } segmento(s), { $n_states_total } estados; erro máximo de ida e volta { $p } km / { $v } km/s (interop MODELLED)
    }


engine-oem-oem-interop-ingested-segment-states =
    { $n_states_total ->
        [one] oem-interop: ingeridos { $segments } segmento(s), { $n_states_total } estado de um OEM externo (originador { $originator }) (interop MODELLED)
        [many] oem-interop: ingeridos { $segments } segmento(s), { $n_states_total } de estados de um OEM externo (originador { $originator }) (interop MODELLED)
       *[other] oem-interop: ingeridos { $segments } segmento(s), { $n_states_total } estados de um OEM externo (originador { $originator }) (interop MODELLED)
    }


engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-e-oem-no-covariance-start-block = nenhum bloco COVARIANCE_START

engine-e-oem-no-covariance-stop = nenhum COVARIANCE_STOP

engine-e-oem-bad-covariance-value = valor de covariância '{ $tok }' inválido: { $e }

engine-e-oem-expected-21-covariance-values-found = esperados 21 valores de covariância, encontrados { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = a exportação para OMM exige TLEs completos (linha 1 + linha 2); este bloco não tem nenhum

engine-omm-ccsds-omm-vers = CCSDS_OMM_VERS = { $version }{ "\u000A" }

engine-omm-mean-element-theory = MEAN_ELEMENT_THEORY = { $mean_element_theory }{ "\u000A" }

engine-omm-mean-motion = MEAN_MOTION = { $mean_motion_rev_day }{ "\u000A" }

engine-omm-ra-of-asc-node = RA_OF_ASC_NODE = { $ra_of_asc_node_deg }{ "\u000A" }

engine-omm-arg-of-pericenter = ARG_OF_PERICENTER = { $arg_of_pericenter_deg }{ "\u000A" }

engine-omm-mean-anomaly = MEAN_ANOMALY = { $mean_anomaly_deg }{ "\u000A" }

engine-omm-ephemeris-type = EPHEMERIS_TYPE = { $ephemeris_type }{ "\u000A" }

engine-omm-classification-type = CLASSIFICATION_TYPE = { $classification }{ "\u000A" }

engine-omm-norad-cat-id = NORAD_CAT_ID = { $norad_cat_id }{ "\u000A" }

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } deve estar em [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg deve estar em [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave deve ser "plane" ou "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction deve ser "downlink" ou "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = as entradas de availability_targets_pct devem estar em (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h deve ser no máximo 8760 (um ano)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } passos é mais do que os { $MAX_STEPS } que um resultado comporta; aumente step_s ou reduza duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = classe de relógio "{ $c }" desconhecida

engine-e-optical-atmosphere-scenario-every-site-needs-name = todo sítio precisa de um nome

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = sítio { $name }: latitude/longitude fora do intervalo

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = sítio { $name }: altitude_m deve estar em [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm a { $elevation_deg } deg de elevação, margem { $margin0 } dB antes da atmosfera; melhor sítio { $scn } { $v5 } %; rede de { $order } sítios { $last } % com clima independente / { $last2 } % com clima correlacionado (MODELLED, consultivo)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = o bloco rinex foi lido, mas não continha efemérides suportadas

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg deve estar em [-90, 90] e todos os campos devem ser finitos

engine-e-orbit-no-satellites-to-export = nenhum satélite para exportar

engine-e-orbit-time-step-must-be-positive = time.step_s deve ser positivo para a exportação SP3

engine-e-orbit-time-step-must-be-positive-2 = time.step_s deve ser positivo para a exportação OEM

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } deve ser positivo; obtido { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s deve ser finito e não negativo

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate deve ser finito e não negativo

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = a elevação mínima do spoofer deve estar em [0, 90) graus

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns da verificação cruzada deve ser finito e não negativo

engine-orbital-timing-the-in-plane-neighbour-degrees = o vizinho no mesmo plano, { $v1 } graus à frente, está fora da área de cobertura de um único spoofer ({ $v2 } graus de largura)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = o vizinho no mesmo plano, { $v1 } graus à frente, pode estar dentro da área de cobertura do mesmo spoofer ({ $v2 } graus de largura), de modo que os dois relógios podem ser puxados juntos

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = arquivo de entrada ausente

engine-e-osnma-cli-max-time-error-has-no = --max-time-error não tem efeito sem --reference-time

engine-e-osnma-cli-not-number = não é um número: { $s }

engine-e-osnma-cli-public-key-must-be-id = a chave pública deve ser ID:TIPO:HEX

engine-e-osnma-cli-public-key-type-must-be = o tipo da chave pública deve ser p256 ou p521

engine-e-osnma-cli-unknown-format = formato { $f } desconhecido

engine-e-osnma-cli-is-not-text-use-format = { $label } não é texto; use --format ubx para um fluxo UBX

engine-e-osnma-cli-vector-csv-needs-start-gst = um CSV de vetores exige --start-gst ou um nome de arquivo com data

# legal: native review
engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    erro: não foi possível ler { $input }: { $e }

# legal: native review
engine-osnma-cli-galileo-osnma-verification =
    Verificação OSNMA do Galileo
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = entrada: { $input } ({ $pages } páginas)

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: { $frames } quadros; { $inav_pages } páginas I/NAV decodificadas, { $pages } situadas no tempo ({ $bad_crc } com CRC inválido, { $unstamped } não situáveis, { $time_conflicts } conflitos de tempo)

engine-osnma-cli-overall-nma-status = geral: { $status_word }   estado NMA: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ALERTA: foi recebida uma mensagem de alerta OSNMA verificada. Pare de usar os dados OSNMA; nada é informado como autenticado.

engine-osnma-cli-freshness-not-enforced-no-reference = atualidade: NÃO aplicada. Nenhum tempo de referência foi informado, de modo que os tempos dos subquadros são tomados da entrada e uma reprodução de dados antigos seria autenticada.

engine-osnma-cli-freshness-sub-frames-within-of = atualidade: são usados os subquadros a até { $max_err } s do tempo de referência { $v2 }; { $set_aside } foram postos de lado. Um tempo de referência é um único instante.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satélite  estado          autenticados  falhos  pendentes  descartados  última autenticada

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }época (subquadro da tag)      tx   dados  adkd  ctr  resultado

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = linha { $v1 }: esperados 3 campos

engine-e-osnma-input-line-bad-svid = linha { $v1 }: SVID inválido

engine-e-osnma-input-line-bad-bit-count = linha { $v1 }: contagem de bits inválida

engine-e-osnma-input-line-data-is-not-hex = linha { $v1 }: os dados não estão em hexadecimal

engine-e-osnma-input-line-bit-count-does-not = linha { $v1 }: a contagem de bits não corresponde aos dados

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = a tolerância de tempo deve ser inferior a um subquadro ({ $SUBFRAME_S } s), obtido { $t } s

## src/palette.rs

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = a refração ITU-R P.834 é definida para alturas de estação de 0 a 3 km; obtido { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s e step_s devem ser positivos

engine-e-passes-station-lat-deg-must-be = station_lat_deg deve estar em [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg deve estar em [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours deve ser finito e positivo

engine-e-passes-step-must-be-finite-and = step_s deve ser finito e positivo

engine-passes-passes-pass-es-of-km = passagens: { $passes } passagem(ns) de uma órbita de { $altitude_km } km / { $inclination_deg }° sobre ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° em { $duration_hours } h; { $total_access_s } s de acesso total (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = registro { $record } curto: { $line }

engine-e-precise-products-bad-number-in = número { $s } inválido em { $line }

engine-e-precise-products-bad-field-in = campo { $s } inválido em { $line }

engine-e-precise-products-bad-antex-epoch = época ANTEX { $s } inválida

engine-e-precise-products-bad-offset = deslocamento { $body } inválido

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = o provedor de efemérides não tem { $name } geocêntrico em JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| erro 3D RMS { $rms } m (máx. { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS pós-ajuste { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } sat nav | { $epochs_solved }/{ $epochs_total } épocas resolvidas | média de { $mean_n_used } sats, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Posicionamento de ponto único — erro 3D em relação à coordenada levantada (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Posicionamento de ponto único — RMS do resíduo pós-ajuste (média de { $mean_postfit_rms_m } m)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = os acessores de array de RunOutput exigem NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } não é um array numérico (uma lista de números, ou de listas de números de mesmo comprimento)

engine-e-python-is-not-non-empty-list = { $path } não é uma lista não vazia de registros

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bytes, svg={ $svg } bytes, csv={ $value } bytes, summary={ $value2 })

engine-e-python-and-must-be-the-same = i e q devem ter o mesmo comprimento ({ $i } vs { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: não adquirido (estatística { $statistic } < limiar { $threshold })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-python-design-prn-channels-at-most = { $designs } canais (projeto, PRN); no máximo 256 por varredura

engine-python-not-acquired-statistic-threshold = { $code }: não adquirido (estatística { $statistic } < limiar { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] precisa de `label`

engine-e-python-runs-needs-result = runs[{ $i }] precisa de `result`

engine-e-python-must-be-between-and-32 = { $name } deve estar entre 0 e 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | semente { $seed } | v{ $engine_version } | o quântico vence { $value }/{ $foms } FoMs | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } de { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = baseline_clock_class '{ $s }' desconhecida (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = candidate_clock_class '{ $other }' desconhecida (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = os taus/valores de ADEV devem ser finitos e > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | candidato { $candidate_source } | holdover de temporização { $timing_holdover_s }s vs { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inercial { $inertial_holdover_s }s vs { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | resiliência em navegação inercial { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = o arquivo de relógio RINEX declara o sistema de tempo { $id }, que este leitor não conhece (conhecidos: { $known_clock_time_systems }); ele é recusado em vez de ler suas épocas como tempo GPS

engine-e-realdata-clk-rinex-clock-file-has-satellite = o arquivo de relógio RINEX tem o sistema de satélites { $other } e não declara TIME SYSTEM ID; recusa-se a adivinhar o sistema de tempo de suas épocas

engine-e-realdata-clk-rinex-clock-files-declare-different = os arquivos de relógio RINEX declaram sistemas de tempo diferentes ({ $s } e { $ts }); recusa-se a juntá-los em um único eixo de tempo

engine-e-realdata-clk-no-as-or-ar-records = nenhum registro AS ou AR para { $id }

engine-e-realdata-clk-short-circular-row = linha Circular T curta: { $t }

engine-e-realdata-clk-bad-value-in = valor { $s } inválido em { $t }

engine-e-realdata-clk-no-section-mjd-header-found = nenhum cabeçalho MJD da Seção 1 encontrado

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = tag de fechamento não terminada

engine-e-realdata-ion-sdr-unbalanced-closing-tag = tag de fechamento sem correspondência

engine-e-realdata-ion-sdr-unterminated-tag = tag não terminada

engine-e-realdata-ion-sdr-attribute-value-missing = valor de atributo ausente

engine-e-realdata-ion-sdr-element-outside-the-document = elemento fora do documento

engine-e-realdata-ion-sdr-text-outside-the-document = texto fora do documento

engine-e-realdata-ion-sdr-element-left-open = { $stack } elemento(s) deixado(s) abertos

engine-e-realdata-ion-sdr-expected-one-root-element-found =
    { $n ->
        [one] esperado um elemento raiz, encontrado { $n }
        [many] esperado um elemento raiz, encontrados { $n }
       *[other] esperado um elemento raiz, encontrados { $n }
    }


engine-e-realdata-ion-sdr-unknown-frequency-format = formato de frequência { $f } desconhecido

engine-e-realdata-ion-sdr-unsupported-encoding = codificação { $other } não suportada

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } fluxos: apenas arquivos de fluxo único são lidos

engine-e-realdata-ion-sdr-block-of-cycles-with-header = repete-se um bloco de { $cycles } ciclos com cabeçalho ou rodapé; apenas um único bloco que abranja o arquivo é lido

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = bloco de { $words_per_chunk } palavras de { $word_bytes } bytes

engine-e-realdata-ion-sdr-unsupported-sample-format = formato de amostra não suportado { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = quantização { $quantization } em { $packed_bits } bits empacotados por amostra

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = uma taxa de amostragem de { $sample_rate_hz } Hz não é múltiplo inteiro do fator de taxa { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = um bloco não contém nenhum lump inteiro

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = amostras { $start }..{ $v1 } solicitadas, o arquivo contém { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = versão CRD ilegível { $f }

engine-realdata-llr-crd-crd-format-version-is-not = a versão { $v } do formato CRD não é suportada (somente 1 e 2 compartilham a ordem dos campos do registro 11 em que este leitor se baseia)

engine-realdata-llr-crd-unreadable-station-id = identificador de estação ilegível { $f }

engine-realdata-llr-crd-unreadable-time-scale = escala de tempo ilegível { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = a escala de tempo de época CRD { $time_scale } não é uma das três que a especificação do formato diz que os analistas aceitam (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); recusando lê-la como UTC

engine-realdata-llr-crd-unreadable-h4-field = campo h4 ilegível { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = campo ilegível { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = evento de época ilegível { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = tempo de voo não físico { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = não é possível ler o diretório de pontos normais { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = nenhum arquivo de pontos normais *.npt em { $dir } — este cenário lê medições reais arquivadas e não será executado sem elas

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = número inválido '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = o DEM tem dimensão nula

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = codificação { $encoding }: um lote LuGRE é em complemento de dois

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } bytes: menor que o cabeçalho IQS

engine-e-realdata-lugre-not-an-iqs-frame = não é um quadro IQS: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = taxa de amostragem: metadados { $sample_rate_hz } Hz, cabeçalho { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = quantização: metadados { $quantization } bits, cabeçalho { $quant_bits } bits

engine-realdata-lugre-centre-frequency-metadata-hz-header = frequência central: metadados { $center_freq_hz } Hz, cabeçalho { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = frequência intermediária: metadados { $translated_freq_hz } Hz, cabeçalho { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = número de amostras: o layout dos metadados dá { $layout }, cabeçalho { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = cabeçalho/rodapé: metadados { $header_bytes }/{ $footer_bytes } bytes, formato { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = o comprimento do arquivo { $file_len } não é cabeçalho + { $value } bytes de amostras + rodapé

engine-realdata-lugre-field-missing = campo { $key } ausente

engine-e-realdata-lugre-field-unreadable = campo { $key } ilegível

engine-realdata-lugre-raw-line = linha RAW { $v1 }: { $e }

engine-realdata-lugre-acq-line = linha ACQ { $v1 }: { $e }

engine-realdata-lugre-nav-line = linha NAV { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = linha CLK { $v1 }: ilegível

engine-e-realdata-lugre-clk-row-columns-expected = linha CLK { $v1 }: { $v } colunas, esperadas 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = análise de JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = esperado um objeto JSON no nível superior

engine-e-realdata-yunnan-missing-recordtime-array = matriz recordTime ausente

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = não é possível ler o arquivo EOP { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s deve ser finito e não negativo, obtido { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = não é possível ler o arquivo EOP de versão posterior { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = VAZIA, e de propósito: uma linha previsto-versus-final exige uma época de emissão com uma janela de ajuste COMPLETA de { $window_days } dias atrás dela e um Bulletin B final publicado na época-alvo. A entrada em vigor ({ $eop_source }) não fornece nenhuma época que atenda a ambos os requisitos. Reduza `operational_window_days` ou forneça uma série real finals2000A mais longa — nenhuma linha é fabricada para preencher a tabela.

engine-realtime-frame-eop-measured-over-the-real-series = Medido sobre a série real em vigor ({ $eop_source }). Cada linha é um erro de previsão genuíno: uma previsão para T+h formada a partir de linhas rápidas do Bulletin A em T ou antes, avaliada em relação ao final do Bulletin B PUBLICADO DEPOIS em T+h. A persistência é avaliada sobre o mesmo conjunto de épocas e os mesmos finais, de modo que as duas colunas diferem no preditor e em nada mais. `improvement_factor` abaixo de 1 significa que o preditor operacional é PIOR que a persistência nesse horizonte, e é informado como tal.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Medido sobre um par genuíno de duas versões: a versão original ({ $eop_source }) traz previsões reais do Bulletin A além do seu próprio limite de dados, e a versão posterior arquivada ({ $c }) traz os finais do Bulletin B que essas datas acabaram recebendo. Três previsões são avaliadas em relação a esse final — a própria previsão arquivada do Bulletin A, o ajuste de estilo operacional deste crate sobre a versão original e a persistência no limite de dados.

engine-realtime-frame-eop-empty-and-deliberately-so-later = VAZIA, e de propósito: foi fornecida uma versão posterior ({ $c }), mas nenhuma data consta como PREVISÃO do Bulletin A no arquivo original ({ $eop_source }) e como FINAL do Bulletin B no posterior em nenhum horizonte solicitado. Nenhuma linha é sintetizada.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = VAZIA, e de propósito. Avaliar uma previsão ARQUIVADA GENUÍNA exige duas versões do mesmo produto finals2000A; esta execução recebeu uma ({ $eop_source }). O repositório não inclui nenhuma versão anterior arquivada, e uma NÃO é fabricada perturbando a versão que ele tem — um arquivo sintetizado faria de cada número desta tabela uma medição da perturbação. Forneça uma versão posterior arquivada real por meio de `eop_finals2000a_later` para preenchê-la. Até então, os erros genuínos previsto-versus-final que este relatório traz estão em `table5_operational_vs_persistence`, onde a previsão é a deste crate e a referência é o final do Bulletin B publicado depois.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Tabela 1: pós-processamento { $c } m ({ $c2 } ms UT1) ↔ tempo real { $c3 } m ({ $c4 } ms UT1) | Tabela 2: piso final { $floor } ms → { $far } dias { $far2 } ms | orçamento total { $total_m } m ({ $total_time_ns } ns) | braço de alavanca L19 + dados reais L18 (verificado em relação a uma referência externa independente), cov. OD (calculado a partir de um modelo)

engine-realtime-frame-eop-table3-joint-eop = table3_joint_eop[].{ $q }.n

engine-realtime-frame-eop-table3-joint-eop-truth-fallback = table3_joint_eop[].{ $q }.truth_fallback_rows

engine-realtime-frame-eop-table3-joint-eop-epochs-mjd = table3_joint_eop[].{ $q }.epochs_mjd

engine-realtime-frame-eop-table3-joint-eop-rms-native = table3_joint_eop[].{ $q }.rms_native

engine-realtime-frame-eop-table3-joint-eop-p50-native = table3_joint_eop[].{ $q }.p50_native

engine-realtime-frame-eop-table3-joint-eop-p95-native = table3_joint_eop[].{ $q }.p95_native

engine-realtime-frame-eop-table3-joint-eop-max-native = table3_joint_eop[].{ $q }.max_native

engine-realtime-frame-eop-table3-joint-eop-rms-position = table3_joint_eop[].{ $q }.rms_position_m

engine-realtime-frame-eop-table3-joint-eop-p95-position = table3_joint_eop[].{ $q }.p95_position_m

engine-realtime-frame-eop-table3-joint-eop-rms-light = table3_joint_eop[].{ $q }.rms_light_time_ns

engine-realtime-frame-eop-operational-predictor-model-representative-fit = operational_predictor_model.representative_fit.{ $q }.issue_mjd

engine-realtime-frame-eop-operational-predictor-model-representative-fit-2 = operational_predictor_model.representative_fit.{ $q }.window_first_mjd

engine-realtime-frame-eop-operational-predictor-model-representative-fit-3 = operational_predictor_model.representative_fit.{ $q }.window_last_mjd

engine-realtime-frame-eop-operational-predictor-model-representative-fit-4 = operational_predictor_model.representative_fit.{ $q }.n_fit

engine-realtime-frame-eop-operational-predictor-model-representative-fit-5 = operational_predictor_model.representative_fit.{ $q }.rms_fit_residual_native

engine-realtime-frame-eop-operational-predictor-model-representative-fit-6 = operational_predictor_model.representative_fit.{ $q }.anchor_residual_native

engine-realtime-frame-eop-operational-predictor-model-representative-fit-7 = operational_predictor_model.representative_fit.{ $q }.terms_rejected[].period_days

engine-realtime-frame-eop-operational-predictor-model-representative-fit-8 = operational_predictor_model.representative_fit.{ $q }.terms_rejected[].cycles_spanned

engine-realtime-frame-eop-operational-predictor-model-representative-fit-9 = operational_predictor_model.representative_fit.{ $q }.terms_rejected[].threshold_cycles

engine-realtime-frame-eop-rows-horizon-days = { $t5 }.rows[].horizon_days

engine-realtime-frame-eop-rows-epochs-mjd = { $t5 }.rows[].epochs_mjd

engine-realtime-frame-eop-rows-target-mjds = { $t5 }.rows[].target_mjds

engine-realtime-frame-eop-rows-min-fit-lead-days = { $t5 }.rows[].min_fit_lead_days

engine-realtime-frame-eop-rows-fit-rows-min = { $t5 }.rows[].fit_rows_min

engine-realtime-frame-eop-rows-fit-rows-max = { $t5 }.rows[].fit_rows_max

engine-realtime-frame-eop-rows-improvement-factor = { $t5 }.rows[].*.improvement_factor

engine-realtime-frame-eop-rows-rms-native = { $t5 }.rows[].*.{ $p }.rms_native

engine-realtime-frame-eop-rows-p50-native = { $t5 }.rows[].*.{ $p }.p50_native

engine-realtime-frame-eop-rows-p95-native = { $t5 }.rows[].*.{ $p }.p95_native

engine-realtime-frame-eop-rows-max-native = { $t5 }.rows[].*.{ $p }.max_native

engine-realtime-frame-eop-rows-rms-position = { $t5 }.rows[].*.{ $p }.rms_position_m

engine-realtime-frame-eop-rows-p95-position = { $t5 }.rows[].*.{ $p }.p95_position_m

engine-realtime-frame-eop-rows-rms-light-time-ns = { $t5 }.rows[].*.{ $p }.rms_light_time_ns

engine-realtime-frame-eop-equivalent-horizon-days-target-position = { $t5 }.equivalent_horizon_days.target_position_m

engine-realtime-frame-eop-equivalent-horizon-days = { $t5 }.equivalent_horizon_days.{ $q }.{ $p }

engine-realtime-frame-eop-rows-horizon-days-2 = { $t6 }.rows[].horizon_days

engine-realtime-frame-eop-rows-issue-mjd = { $t6 }.rows[].issue_mjd

engine-realtime-frame-eop-rows-epochs-mjd-2 = { $t6 }.rows[].epochs_mjd

engine-realtime-frame-eop-rows-rms-native-2 = { $t6 }.rows[].*.{ $p }.rms_native

engine-realtime-frame-eop-rows-p50-native-2 = { $t6 }.rows[].*.{ $p }.p50_native

engine-realtime-frame-eop-rows-p95-native-2 = { $t6 }.rows[].*.{ $p }.p95_native

engine-realtime-frame-eop-rows-max-native-2 = { $t6 }.rows[].*.{ $p }.max_native

engine-realtime-frame-eop-rows-rms-position-2 = { $t6 }.rows[].*.{ $p }.rms_position_m

engine-realtime-frame-eop-rows-p95-position-2 = { $t6 }.rows[].*.{ $p }.p95_position_m

engine-realtime-frame-eop-rows-rms-light-time-ns-2 = { $t6 }.rows[].*.{ $p }.rms_light_time_ns

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Medido sobre um par genuíno de duas versões: o UT1 PREVISTO do Bulletin A do arquivo original ({ $eop_source }) comparado, por diferença, com o FINAL do Bulletin B da versão posterior arquivada ({ $c }), em { $predicted_vs_final } horizonte(s).

engine-realtime-frame-eop-empty-and-deliberately-so-an = VAZIA, e de propósito: foi fornecida uma versão posterior arquivada ({ $c }), mas nenhuma data consta como PREVISÃO do Bulletin A no arquivo original ({ $eop_source }) e como FINAL do Bulletin B no posterior em nenhum horizonte solicitado, de modo que não há resíduo previsto-versus-final a informar. Nenhuma linha é sintetizada.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = VAZIA, e de propósito: um resíduo previsto-versus-final exige DUAS versões do mesmo produto finals2000A. Esta execução recebeu uma ({ $eop_source }). Suas linhas de previsão do Bulletin A são de datas futuras que ainda não têm final do Bulletin B, portanto o resíduo não existe para ser medido e nenhum é inventado aqui. Forneça uma versão posterior arquivada por meio de `eop_finals2000a_later` para preencher esta tabela. Até então, o crescimento ao longo de vários dias informado em `table2_error_vs_horizon` é o do preditor de PERSISTÊNCIA avaliado sobre os finais reais — um erro real medido, mas de um preditor calculado a partir de um modelo, e não o resíduo da previsão do IERS Bulletin A.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = uma avaliação de embarcação exige [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = o trecho tem { $excerpt } bytes; o limite é { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = o trecho contém mais de { $MAX_EXCERPT_EPOCHS } épocas; reduza-o

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = o trecho termina dentro da janela de calibração de { $calibration_s } s ({ $epochs } épocas): nada foi pontuado

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = nenhuma época rotulada em UTC no registro UBX

engine-e-receiver-trust-calibration-no-scenario-json-under = nenhum scenario.json em { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: Pfa limpa reservada <= { $B1_MAX_PFA } (calibrada: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } deve ser finito e > 0 (obtido { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel deve ser finito e >= 0 (obtido { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used deve ser pelo menos 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg deve estar em [0, 90] (obtido { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg deve estar em (0, 360] (obtido { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points deve estar em [0, 100] (obtido { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio deve ser finito e > 1 (obtido { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor deve estar em (0, 100] (obtido { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) está abaixo do degraded_min da pontuação ({ $degraded_min }): a geometria sozinha poderia chegar à faixa não confiável

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    { $n_used ->
        [one] geometria { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satélite{ $v6 }
        [many] geometria { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } de satélites{ $v6 }
       *[other] geometria { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satélites{ $v6 }
    }


engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: a dedução de geometria é classificada como inconsistência

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: informado, não pontuado (a geometria não é ruim)

engine-receiver-trust-geometry-not-scored-the-score-deducts = não pontuado (a pontuação só deduz acima de HDOP { $hdop_max }, PDOP { $pdop_max } ou abaixo de { $min_used } satélites)

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] derivado de { $n } satélite registradoo
        [many] derivado de { $n } de satélites registrados
       *[other] derivado de { $n } satélites registrados
    }


engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] segundo o que o receptor informa, { $n } satélite usadoo
        [many] segundo o que o receptor informa, { $n } de satélites usados
       *[other] segundo o que o receptor informa, { $n } satélites usados
    }


engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = o HDOP declarado { $fmt_dop } discorda do HDOP { $fmt_dop2 } derivado do céu declarado, além da tolerância

engine-receiver-trust-geometry-satellites-in-view-but-not = satélites à vista, mas não rastreados ({ $g } de { $in_view } a { $low_elev_deg } deg ou acima): ambiente de sinal, não geometria

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } satélite, menos que { $min_used }
        [many] { $n } de satélites, menos que { $min_used }
       *[other] { $n } satélites, menos que { $min_used }
    }


engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } acima de { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } acima de { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } satélites atrás da linha de horizonte declarada

engine-receiver-trust-geometry-every-satellite-in-one-half = todos os satélites em uma metade do céu (intervalo { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = degradado pela geometria: { $parts } ({ $from }); não é uma inconsistência

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = o registro não contém épocas: nada nele pôde ser lido como { $name } ({ $skipped_records } registros ignorados por estarem corrompidos ou não analisáveis); verifique a configuração de formato

engine-receiver-trust-ingest-gps-week-tow = semana GPS { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = semana GPS { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (data ausente do registro)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } deve ser finito e >= 0 (obtido { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s deve ser maior que 0

engine-e-receiver-trust-live-invalid-session = sessão inválida: { $e }

engine-receiver-trust-live-no-score-could-be-produced = não foi possível produzir nenhuma pontuação: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = nenhum registro synchro ou pvt do GNSS-SDR pôde ser lido ({ $skipped } linhas ignoradas); consulte integrations/gnss-sdr/README.md para o formato de linha

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = o arquivo IMU está vazio

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: nenhuma coluna `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: nenhuma coluna `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = o arquivo IMU não contém nenhuma amostra legível

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis deve ser 0, 1 ou 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean deve ser finito

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] o registro tem { $n } amostra; são necessárias pelo menos { $MIN_SAMPLES } para um ajuste de Allan
        [many] o registro tem { $n } de amostras; são necessárias pelo menos { $MIN_SAMPLES } para um ajuste de Allan
       *[other] o registro tem { $n } amostras; são necessárias pelo menos { $MIN_SAMPLES } para um ajuste de Allan
    }


engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = o tempo do registro não avança

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not =
    { $n ->
        [one] o intervalo de amostragem não é uniforme ({ $uneven } de { $n } intervalo difere em mais de 25 %): reamostre o registro primeiro
        [many] o intervalo de amostragem não é uniforme ({ $uneven } de { $n } de intervalos diferem em mais de 25 %): reamostre o registro primeiro
       *[other] o intervalo de amostragem não é uniforme ({ $uneven } de { $n } intervalos diferem em mais de 25 %): reamostre o registro primeiro
    }


engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = o registro é curto demais para formar uma curva de Allan

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = a inclinação inicial da curva de { $name } é { $v }, e não cerca de -0.5: o ruído branco não domina (o sensor está parado?), portanto seu coeficiente de ruído não é confiável

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = a curva de { $name } é curta demais para verificar sua inclinação

engine-receiver-trust-machines-imu-fit-id-provenance-bias-va-gyro =
    { "[" }{ $table }]
    id = { $id }
    provenance = { $provenance }
    bias = { $bias }
    q_va = { $q_va }
    gyro_bias = { $gyro_bias }
    q_arw = { $q_arw }
    bias_instability = { $bias_instability }{ "\u000A" }

## src/receiver_trust/machines/novatel.rs

engine-receiver-trust-machines-novatel-gps-week-tow = semana GPS { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = nenhum registro BESTPOS, RANGE ou RXSTATUS pôde ser lido ({ $skipped } registros ignorados)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = nenhum quadro RTCM 3 válido foi encontrado ({ $skipped } candidatos falharam no CRC)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } deve ser finito e > 0 (obtido { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard deve estar em (0, 1) (obtido { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac deve estar em [0, 1] (obtido { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } deve estar em (0, 1) (obtido { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats deve ser pelo menos 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s deve ser pelo menos 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = configuração de monitor: perfil desconhecido "{ $other }"; conhecidos: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = configuração de monitor: { $name } deve ser finito e > 0 (obtido { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = configuração de monitor: jam_ind_threshold deve ser finito

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = configuração de monitor: mask_deg deve estar em [-90, 90) (obtido { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = configuração de monitor: raim_pfa deve estar em (0, 1) (obtido { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = configuração de monitor: cn0_min_sats deve ser pelo menos 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = configuração de monitor: sats_lost deve ser pelo menos 1

engine-receiver-trust-monitors-the-receiver-own-set-against = o conjunto próprio do receptor, { $self_report_source }, confrontado com os monitores do Kshana; nenhum dos dois é referência, a concordância não é validação

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = a linha do tempo do receptor tem um tempo de época não finito

engine-e-receiver-trust-monitors-the-log-is-shorter-than = o registro é mais curto que a janela de calibração: { $calibration_epochs } época(s) antes de { $cal_s } s (o registro abrange { $span } s); são necessárias pelo menos 3 para formar a linha de base

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } deve estar em ({ $lo }, { $hi }] (obtido { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } aplica-se apenas a kind = "vessel" (kind é "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = não é possível ler { $path }: a compilação WebAssembly não tem sistema de arquivos; passe o arquivo em linha como `text` ou `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` não é base64 padrão válido

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: informe um entre `path`, `text` ou `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: informe apenas um entre `path`, `text` ou `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } deve ser um número positivo, obtido { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = evento { $label }: onset_s deve ser um número não negativo

engine-e-receiver-trust-scenario-event-end-must-be-after = evento { $label }: end_s deve ser posterior a onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg e time_offset_s devem ser finitos

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = confiável do início ao fim: nenhum monitor deu alarme em { $after_cal } épocas após a calibração

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = primeiro alarme em { $t } s; não confiável em { $untrusted_epochs } e degradado em { $degraded_epochs } de { $after_cal } épocas após a calibração

engine-receiver-trust-scenario-of-stated-events-detected-within = ; { $events_detected } de { $events_evaluable } eventos declarados detectados em até { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = ; { $predictions_agreeing } de { $predictions_evaluable } previsões de C/N0 em até { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = ; pontuação de confiança mínima { $min }, final { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = cenário { $r } | receiver-trust | registro { $format_name }, { $epochs } épocas em { $duration_s } s | monitores { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = este é um cenário { $k }, não um cenário receiver-trust

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } deve ser finito (obtido { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: é preciso 0 < degraded_min < nominal_min <= 100 (obtidos { $degraded_min } e { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s deve ser finito e >= 0 (obtido { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: é preciso 0 <= onset_ratio < full_ratio (obtidos { $onset_ratio } e { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: o peso de { $m } deve estar em [0, 100] (obtido { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s deve ser finito e positivo

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg deve estar em (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 deve ser finito e positivo

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m e rho0_kg_m3 devem ser finitos e positivos

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m deve estar em [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = reentrada (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> pico { $v3 } g a { $v4 } km, { $velocity_at_peak_deceleration } m/s; o aquecimento atinge o pico a { $velocity_at_peak_heating } m/s; massa pontual (gravidade, curvatura, US76) pico { $peak_deceleration_g } g (balística MODELLED, sem aerotermia)

## src/registry.rs

engine-e-registry-unknown-scenario-id = identificador de cenário desconhecido: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = a faixa de TRL ({ $lo },{ $hi }) não é bem formada (é preciso 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = uma afirmação calculada a partir de um modelo (apenas simulação) não pode ser representativa acima de TRL { $MODELLED_TRL_CEILING } (faixa hi={ $hi }); um TRL mais alto é uma lacuna, não um resultado de simulação

engine-representativeness-representativeness-representative-for-trl = Representatividade [{ $status }] — { $claim } (representativa para TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = declarado({ $arch }) x qualidade média das fontes

engine-resilience-score-weakest-rpcf-sub-score-bounded = subpontuação RPCF mais fraca = { $min_sub }; degradação limitada = { $bounded } (limita-se ao Nível 2 se ilimitada)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = cabeçalho de registro de navegação não suportado { $head }: uma linha iniciada por '>' é um cabeçalho de registro RINEX 4, não um registro de navegação RINEX 3

engine-e-rinex-bad-prn-in = PRN inválido em { $head }

engine-e-rinex-rinex-navigation-expected-record-header = navegação RINEX 4: esperado um cabeçalho de registro '>', encontrado { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = o registro RINEX 4 { $head } tem { $body } linhas, e uma efemérides { $msg } precisa de 8

engine-e-rinex-rinex-record-is-followed-by = o registro RINEX 4 { $head } é seguido por { $body }, e não por { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = { $what } inválido: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = o arquivo de observação RINEX não tem END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = o arquivo de observação RINEX não continha registros de época

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s deve ser finito e > 0 (obtido { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s deve ser finito e > 0 (obtido { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) não deve exceder time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps =
    { $n ->
        [one] grade de tempo grande demais: { $n } passo excede MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); use um passo maior ou uma duração menor
        [many] grade de tempo grande demais: { $n } de passos excedem MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); use um passo maior ou uma duração menor
       *[other] grade de tempo grande demais: { $n } passos excedem MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); use um passo maior ou uma duração menor
    }


## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = a taxa de amostragem é comensurável com a taxa de código ({ $samples_per_chip } amostras/chip, a { $offset_from_integer_samples } amostras de um número inteiro): a réplica de código com retenção de ordem zero não consegue resolver uma mudança de fase de código abaixo de { $dead_band_chips } chips, de modo que o discriminador Early/Late é uma escada com banda morta de uma amostra em vez de um triângulo, e o DLL se estabiliza no atraso errado. Desloque a taxa de amostragem para fora do múltiplo inteiro (5 MHz dá 4.8876 amostras/chip; 25 MHz dá 24.4379) ou superamostre o bastante para que a banda morta fique abaixo da exatidão de fase de código de que você precisa.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = código de erro SGP4 { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = core:datatype do SigMF não suportado { $other }: este leitor trata os tipos complexos cf32_le, ci16_le e ci8

engine-e-sigmf-sigmf-core-num-channels-only = core:num_channels do SigMF = { $ch }: somente gravações de canal único são lidas

engine-e-sigmf-cannot-serialise-sigmf-metadata = não é possível serializar os metadados SigMF: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = namespace de extensão SigMF inválido { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } mapas de extensão de anotação para { $annotations2 } anotações

engine-e-sigmf-extension-key-is-not-in = a chave de extensão { $k } não está no namespace { $ns }

engine-e-sigmf-extension-key-is-already-present = a chave de extensão { $k } já está presente

engine-e-sigmf-global-is-not-an-object = global não é um objeto

engine-e-sigmf-annotations-is-not-an-array = annotations não é uma matriz

engine-e-sigmf-annotation-is-not-an-object = a anotação não é um objeto

engine-e-sigmf-invalid-sigmf-metadata-json = JSON de metadados SigMF inválido: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = a gravação SigMF não declara nenhum core:sample_rate positivo

engine-e-sigmf-sigmf-capture-starts-at-sample = a captura SigMF começa na amostra { $start }, além das { $data } amostras dos dados

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } deve estar em [0, 90) graus, obtido { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } deve ser um número finito, obtido { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: um cânion exige width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m deve ser positivo, obtido { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: as alturas do cânion e antenna_m devem ser não negativas

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m deve ser positivo, obtido { $l }

engine-e-skyline-skyline-table-is-empty = skyline: a tabela está vazia

engine-e-skyline-skyline-table-has-rows-over = skyline: a tabela tem { $rows } linhas, acima do limite de { $MAX_TABLE_ROWS } linhas

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: o azimute { $az } da tabela está fora de [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: os azimutes da tabela devem ser estritamente crescentes ({ $az } segue { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: mais de { $MAX_SECTORS } setores

engine-e-skyline-skyline-the-sector-az-from = skyline: o setor az_from = { $az_from } até az_to = { $az_to } é vazio (um círculo completo é uma tabela ou a máscara)

engine-e-skyline-skyline-more-than-terrain-points = skyline: mais de { $MAX_TABLE_ROWS } pontos de terreno

engine-e-skyline-skyline-terrain-distance-must-be = skyline: distance_m do terreno deve ser positivo, obtido { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-skyline-with-fields-overridden-or-added = { $provenance }; com campos substituídos ou acrescentados por { $user }

engine-skyline-stated-input = Entrada declarada: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = predefinição de skyline desconhecida "{ $name }"; predefinições conhecidas: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = uma folha de dados exige pelo menos dois pontos de desvio de Allan

engine-e-slot-timing-datasheet-point-must-have-positive = o ponto da folha de dados ({ $t }, { $s }) deve ter um tempo de média positivo e um desvio de Allan positivo

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s deve ser um número positivo de segundos

engine-e-slot-timing-phase-record-needs-at-least = um registro de fase exige pelo menos 32 amostras para ajustar um modelo de ruído; obtido { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = o registro de fase contém uma amostra não finita

engine-e-slot-timing-the-phase-record-yields-fewer = o registro de fase produz menos de três pontos de desvio de Allan

engine-e-slot-timing-must-be-finite-and-non = { $name } deve ser finito e não negativo; obtido { $v }

engine-e-slot-timing-the-slot-guard-must-be = a guarda do slot deve ser um tempo positivo

engine-e-slot-timing-sigma-must-be-positive = k_sigma deve ser positivo

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset deve ser finito

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k deve ser finito

engine-e-slot-timing-give-exactly-one-of-oscillator = informe exatamente um entre oscillator.class, oscillator.preset, oscillator.datasheet ou oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = oscillator.class desconhecido '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = oscillator.preset desconhecido '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = padrão da classe { $c }: sigma_y(1 s) a partir de { $c2 }; piso de ruído vermelho sintetizado duas e quatro décadas abaixo dele (uma hipótese, não uma medição)

engine-slot-timing-fitted-to-the-allan-deviation = ajustado aos máximos do desvio de Allan de { $document }, escalonado para ficar no nível de todos os pontos ou acima deles

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] ajustado ao desvio de Allan sobreposto de um registro de { $n_samples } amostra a { $tau0_s } s, na base de modulação de frequência da IEEE Std 1139
        [many] ajustado ao desvio de Allan sobreposto de um registro de { $n_samples } de amostras a { $tau0_s } s, na base de modulação de frequência da IEEE Std 1139
       *[other] ajustado ao desvio de Allan sobreposto de um registro de { $n_samples } amostras a { $tau0_s } s, na base de modulação de frequência da IEEE Std 1139
    }


engine-slot-timing-slot-timing-source-guard-ns =
    { $n ->
        [one] slot-timing ({ $n } fonte): guarda de { $c } ns com k={ $k_sigma } se rompe { $fmt_s } após uma solução de posição (restam { $fmt_s2 }); uma solução de posição ao menos a cada { $fmt_s3 } ({ $fixes_per_day } por dia); termo dominante: { $b }{ $v9 }
        [many] slot-timing ({ $n } de fontes): guarda de { $c } ns com k={ $k_sigma } se rompe { $fmt_s } após uma solução de posição (restam { $fmt_s2 }); uma solução de posição ao menos a cada { $fmt_s3 } ({ $fixes_per_day } por dia); termo dominante: { $b }{ $v9 }
       *[other] slot-timing ({ $n } fontes): guarda de { $c } ns com k={ $k_sigma } se rompe { $fmt_s } após uma solução de posição (restam { $fmt_s2 }); uma solução de posição ao menos a cada { $fmt_s3 } ({ $fixes_per_day } por dia); termo dominante: { $b }{ $v9 }
    }


## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = a época '{ $s }' deve ser YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = época '{ $s }': { $what } '{ $v }' inválido

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb deve ser finito

engine-e-solar-system-table-must-be-auto-table1 = table deve ser auto, table1 ou table2; obtido '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = nenhuma efemérides para o enlace de { $name } a { $name2 } em JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = a época JD { $jd } TDB está fora de 3000 BC a 3000 AD, o intervalo das tabelas de Standish

engine-e-solar-system-track-points-must-be-to = track_points deve ser de 8 a 2000; obtido { $n_track }

engine-e-solar-system-unknown-observer-body = corpo observador desconhecido '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies deve nomear pelo menos um corpo

engine-e-solar-system-unknown-body = corpo desconhecido '{ $n }'

engine-e-solar-system-no-position-for-at-jd = nenhuma posição para { $name } em JD { $jd } TDB (Plutão só vale de 1800 AD a 2050 AD)

engine-e-solar-system-no-standish-elements-for = nenhum elemento de Standish para { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), estado heliocêntrico lido pelo leitor próprio do motor

engine-e-solar-system-unknown-link-body = corpo de enlace desconhecido '{ $from }'

engine-e-solar-system-unknown-link-body-2 = corpo de enlace desconhecido '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = um enlace exige dois corpos diferentes; obtido { $name }

engine-solar-system-solar-system-at-jd-tdb =
    { $n_bodies ->
        [one]
            Sistema solar em { $input } (JD { $jd_tdb } TDB), { $n_bodies } corpo, observador { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
        [many]
            Sistema solar em { $input } (JD { $jd_tdb } TDB), { $n_bodies } de corpos, observador { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
       *[other]
            Sistema solar em { $input } (JD { $jd_tdb } TDB), { $n_bodies } corpos, observador { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
    }


engine-solar-system-light-time = tempo de luz { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lon { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }enlace { $from } -> { $to }: ida { $one_way_light_time_s } s, ida e volta { $two_way_light_time_s } s, Shapiro { $l } us, Sol { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = época { $input } · { $standish_table } · posições a partir dos elementos de Standish

## src/sp3.rs

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-e-sp3-epoch-needs-time-fields-got = a época exige 6 campos de tempo, obtidos { $tokens }

engine-e-sp3-bad-second = segundo inválido: { $tokens }

engine-e-sp3-record-needs-values-missing-column = o registro exige 4 valores, coluna { $v1 } ausente

engine-e-sp3-bad-number = número inválido: { $field }

engine-e-sp3-empty-sp3-input = entrada SP3 vazia

engine-e-sp3-first-line-is-not-an = a primeira linha não é um cabeçalho SP3: { $first }

engine-e-sp3-unsupported-sp3-version-in = versão SP3 não suportada em { $first }

engine-e-sp3-missing-epoch-count-on-header = contagem de épocas ausente na linha de cabeçalho 1

engine-e-sp3-record-has-no-satellite-id = o registro não tem identificador de satélite: { $line }

engine-e-sp3-position-record-before-any-epoch = registro de posição antes de qualquer cabeçalho de época

engine-e-sp3-sp3-file-contained-no-epoch = o arquivo SP3 não continha registros de época

engine-e-sp3-bad-accuracy-exponent-in = expoente de exatidão inválido { $f } em { $line }

engine-e-sp3-bad-header-accuracy = exatidão de cabeçalho inválida { $t }

engine-e-sp3-short-line = linha %f curta { $line }

engine-e-sp3-bad-base-in = base %f inválida em { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = a versão excede 3 bits

engine-e-space-packet-apid-exceeds-11-bits-2047 = o APID excede 11 bits (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count excede 14 bits (0..=16383)

engine-e-space-packet-data-field-must-be-at = o campo de dados deve ter pelo menos um octeto

engine-e-space-packet-data-field-exceeds-65536-octets = o campo de dados excede 65536 octetos

engine-e-space-packet-packet-shorter-than-the-octet = pacote menor que o cabeçalho de 6 octetos: { $bytes } bytes

engine-e-space-packet-declared-data-length-header-octets = comprimento de dados declarado { $data_len } (+6 de cabeçalho) = { $total } octetos, mas o buffer tem { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = octetos grosseiros CUC { $coarse_octets } fora de 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = octetos finos CUC { $fine_octets } fora de 0..=3 (o P-field estendido não é suportado)

engine-e-space-packet-cuc-field-extended-field-not = P-field CUC { $p }: P-field estendido não suportado

engine-e-space-packet-field-time-code-id-is = P-field { $p }: o identificador de código de tempo { $id } não é CUC

engine-e-space-packet-field-is-not-cds-field = o P-field { $p } não é um P-field CDS

engine-e-space-packet-cds-field-reserved-sub-ms = P-field CDS { $p }: código de submilissegundo reservado 11

engine-e-space-packet-cuc-coarse-does-not-fit = o valor grosseiro CUC { $coarse } não cabe em { $c } octetos

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] o valor fino CUC { $fine } não cabe em { $n } octeto
        [many] o valor fino CUC { $fine } não cabe em { $n } de octetos
       *[other] o valor fino CUC { $fine } não cabe em { $n } octetos
    }


engine-e-space-packet-cds-days-do-not-fit = os dias CDS { $days } não cabem em { $f } octetos

engine-e-space-packet-cds-ms-of-day-above = ms do dia CDS { $ms_of_day } acima de 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = submilissegundo CDS { $submillis } acima de { $max_sub }

engine-e-space-packet-time-code-format-and-value = o formato e o valor do código de tempo são de códigos diferentes

engine-e-space-packet-time-code-no-field-octet = código de tempo: nenhum octeto de P-field

engine-e-space-packet-time-code-needs-octets-present = o código de tempo exige { $end } octetos, há { $bytes }

engine-e-space-packet-time-code-format-differs-from = o formato do código de tempo difere do P-field implícito

engine-e-space-packet-the-format-has-time-code = o formato tem um campo de código de tempo; nenhum foi informado

engine-e-space-packet-the-format-has-no-time = o formato não tem campo de código de tempo

engine-e-space-packet-ancillary-data-is-octets-the = os dados auxiliares têm { $ancillary } octetos; o formato diz { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = um cabeçalho secundário deve conter pelo menos um octeto

engine-e-space-packet-secondary-header-needs-octets-present = o cabeçalho secundário exige { $end } octetos, há { $bytes }

engine-e-space-packet-the-format-has-secondary-header = o formato tem um cabeçalho secundário; nenhum foi informado

engine-e-space-packet-the-format-has-no-secondary = o formato não tem cabeçalho secundário

engine-e-space-packet-secondary-header-flag-disagrees-with = o indicador de cabeçalho secundário { $v1 } discorda do formato

engine-e-space-packet-data-field-shorter-than-the = o campo de dados é menor que o PEC

engine-e-space-packet-pec-does-not-match-the = o PEC { $v1 } não corresponde ao CRC { $crc16_ccitt_false } do pacote

engine-e-space-packet-nothing-to-segment-empty-user = nada a segmentar: dados de usuário vazios

engine-e-space-packet-max-user-octets-must-be = max_user_octets deve ser pelo menos 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count excede 14 bits (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid } onde se esperava { $a }

engine-space-packet-sequence-count-repeated = contagem de sequência { $sequence_count } repetida

engine-space-packet-sequence-count-gap-after-packet = lacuna na contagem de sequência: { $sequence_count } após { $last } ({ $v2 } pacote(s) ausente(s))

engine-space-packet-sequence-count-out-of-order = contagem de sequência fora de ordem: { $sequence_count } após { $last }

engine-space-packet-packet-with-no-unit-open = pacote { $f } sem unidade aberta

engine-space-packet-packet-while-unit-is-open = pacote { $f } enquanto há uma unidade aberta

engine-e-space-packet-packet = pacote { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = a sequência termina com uma unidade ainda aberta (sem último pacote)

engine-e-space-packet-apid-must-be-in-2047 = apid deve estar em 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count deve ser >= 1

engine-e-space-packet-data-len-must-be-in = data_len deve estar em 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = erro interno: divergência no ciclo de codificação/decodificação

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet: { $packet_count } pacote CCSDS-133.0 { $v2 } enquadrado, APID { $apid }, { $total_bytes } octetos no total, ciclo completo exato ({ $round_trip_ok })
        [many] space-packet: { $packet_count } de pacotes CCSDS-133.0 { $v2 } enquadrados, APID { $apid }, { $total_bytes } octetos no total, ciclo completo exato ({ $round_trip_ok })
       *[other] space-packet: { $packet_count } pacotes CCSDS-133.0 { $v2 } enquadrados, APID { $apid }, { $total_bytes } octetos no total, ciclo completo exato ({ $round_trip_ok })
    }


## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 deve ser finito e positivo

engine-e-space-weather-f107a-must-be-finite-and = f107a deve ser finito e positivo

engine-e-space-weather-kp-must-be-in = kp deve estar em [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km não deve estar vazio

engine-e-space-weather-altitude-km-must-be-finite = a altitude { $h } km deve ser finita e positiva

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; densidade x{ $density_activity_factor } a { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: um jammer { $what } exige bandwidth_mhz positivo

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: um jammer chirp exige sweep_period_us positivo

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to nomeia uma banda desconhecida { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: informe received_power_dbw ou eirp_dbw com range_m positivo (não ambos)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s deve ser posterior a on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: a taxa de amostragem deve ser positiva

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } deve ser uma potência de dois, de pelo menos 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: { $x } amostras é menos que um segmento de { $nfft } pontos

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } deve ser uma potência de dois, de pelo menos 16

engine-e-spectrum-cannot-read-recording-meta-path = não é possível ler o meta_path da gravação { $meta_path }: { $e }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-e-spectrum-cannot-read-recording-data = não foi possível ler os dados de gravação { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz deve ser positivo

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: a modulação { $m } não é selecionável (somente galileo-e1 aceita "mboc" ou "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: o sinal { $sig } não está na biblioteca de predefinições de sinais ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: um sinal predefinido traz a sua própria modulação; remova `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: o sinal { $sig } não publica potência recebida; informe signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: uma banda personalizada exige `modulation`, por exemplo "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: uma banda personalizada exige signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: informe `signal` ou `centre_mhz`, não ambos

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: informe rx_bandwidth_mhz (não foi possível localizar nenhum lóbulo principal)

engine-e-spectrum-duration-must-be-at-least = duration_s deve ser de ao menos um step_s

engine-e-spectrum-time-rows-is-more-than = { $rows } linhas de tempo excedem as 5000 permitidas

engine-e-spectrum-at-most-extra-panels = no máximo 8 painéis extras

engine-e-spectrum-panel-need-max-mhz-min = painel { $name }: é necessário f_max_mhz > f_min_mhz e 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = grade: é necessário f_max_mhz > f_min_mhz e 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = espectro do cenário | { $bands } bandas | { $jammers } jammers | piso de ruído { $n0_db } dBW/Hz | pior banda { $name } C/N0 mín. { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = espectro do cenário | nenhuma banda | piso de ruído { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples deve estar entre 10 e 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: use cf32_le ou ci16_le

engine-spectrum-frequency-across-time-down-colour = frequência na horizontal, tempo na vertical, cor = densidade espectral de potência (dBW/Hz); piso de ruído { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = cada painel com a sua faixa de frequência, uma linha do tempo na vertical, uma escala de cor (dBW/Hz); piso de ruído { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = o referencial { $other } não tem código NAIF suportado

engine-e-spk-writer-segment-name-longer-than-40 = nome de segmento com mais de 40 caracteres: { $name }

engine-e-spk-writer-segment-name-has-non-printing = o nome do segmento tem caracteres não imprimíveis: { $name }

engine-e-spk-writer-bad-target-for-centre = alvo { $target } inválido para o centro { $centre }

engine-e-spk-writer-degree-outside-27 = grau { $degree } fora de 1..=27

engine-e-spk-writer-type-13-degree-is-not = o grau { $degree } do tipo 13 não é ímpar

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] { $states } estados para { $n } época
        [many] { $states } estados para { $n } de épocas
       *[other] { $states } estados para { $n } épocas
    }


engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } estado; o grau { $degree } exige { $value }
        [many] { $n } de estados; o grau { $degree } exige { $value }
       *[other] { $n } estados; o grau { $degree } exige { $value }
    }


engine-e-spk-writer-descriptor-start-is-not-before = o início do descritor não é anterior ao seu fim

engine-e-spk-writer-epochs-are-not-strictly-increasing = as épocas não são estritamente crescentes

engine-e-spk-writer-the-epochs-do-not-cover = as épocas não cobrem o intervalo do descritor

engine-e-spk-writer-type-or-13-segment-carries = um segmento do tipo 9 ou 13 contém estados, não registros

engine-e-spk-writer-type-segment-needs-at-least = um segmento do tipo 3 exige ao menos um registro

engine-e-spk-writer-type-degree-outside-27 = grau { $degree } do tipo 3 fora de 0..=27

engine-e-spk-writer-type-interval-length-is-not = o comprimento de intervalo { $intlen } do tipo 3 não é positivo

engine-e-spk-writer-type-record-has-coefficients-expected = o registro { $i } do tipo 3 tem { $value } coeficientes, esperados { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = o início do descritor é posterior ao seu fim

engine-e-spk-writer-descriptor-starts-before-the-first = o descritor começa antes do primeiro registro

engine-e-spk-writer-descriptor-ends-after-the-last = o descritor termina depois do último registro

engine-e-spk-writer-type-segment-carries-records-not = um segmento do tipo 3 contém registros, não épocas nem estados

engine-e-spk-writer-type-21-segment-needs-at = um segmento do tipo 21 exige ao menos uma linha de diferenças

engine-e-spk-writer-difference-line-size-is-not = o tamanho de linha de diferenças { $dlsize } não é 4 MAXDIM + 11 com MAXDIM em 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = linhas de diferenças de tamanhos diferentes

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] { $epochs } épocas para { $n } linha de diferenças
        [many] { $epochs } épocas para { $n } de linhas de diferenças
       *[other] { $epochs } épocas para { $n } linhas de diferenças
    }


engine-e-spk-writer-difference-line-epochs-are-not = as épocas das linhas de diferenças não são estritamente crescentes

engine-e-spk-writer-the-last-difference-line-ends = a última linha de diferenças termina antes do descritor

engine-e-spk-writer-zero-step-size-in-difference = tamanho de passo nulo { $j } na linha de diferenças { $i }

engine-e-spk-writer-type-21-segment-carries-difference = um segmento do tipo 21 contém linhas de diferenças, não estados

engine-e-spk-writer-an-spk-needs-at-least = um SPK exige ao menos um segmento

engine-e-spk-writer-segment = segmento { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = a linha de comentário tem caracteres não imprimíveis: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = os comentários exigem { $nchars } caracteres; { $v1 } estão reservados (aumente ncomch)

engine-e-spk-writer-difference-line-orders-out-of = ordens da linha de diferenças { $kqmax1 } { $kq } fora do intervalo

engine-e-spk-writer-zero-step-size-at-index = tamanho de passo nulo no índice { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } fora do segmento [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = segmento { $name } do tipo 3 curto demais

engine-e-spk-writer-type-segment-words-for-rsize = segmento { $name } do tipo 3: { $nw } palavras para N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = segmento { $name } do tipo 21 curto demais

engine-e-spk-writer-type-21-segment-words-for = segmento { $name } do tipo 21: { $nw } palavras para N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segmento { $name } curto demais

engine-e-spk-writer-segment-words-for = segmento { $name }: { $nw } palavras para N = { $n }

engine-e-spk-writer-segment-is-in-frame = o segmento { $name } está no referencial { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = a cadeia de centros do SPK não termina

engine-e-spk-writer-no-spk-chain-connects-and = nenhuma cadeia SPK liga { $target } e { $observer } em ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = a época { $s } não está no formato YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = sistema de tempo { $other } não suportado (UTC ou TDB)

engine-e-spk-writer-centre-has-no-supported-naif = o centro { $other } não tem identificador NAIF suportado

engine-e-spk-writer-oem-segment-has-no-data = o segmento OEM { $name } não tem linhas de dados

engine-e-spk-writer-oem-segment-no = segmento OEM { $idx }: sem { $k }

engine-e-spk-writer-no-export-settings-for-oem = nenhuma configuração de exportação para o segmento OEM { $idx }

engine-e-spk-writer-oem-data-line-has-fields = a linha de dados OEM tem { $f } campos: { $line }

engine-e-spk-writer-oem-value = valor OEM { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $out } segmentos OEM para { $exports } configurações de exportação

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOFING DETECTADO (fundido) — camadas: { $fired }

engine-spoof-detect-single-layer-indication-below-the = indicação de camada única ({ $fired }) abaixo do limiar fundido — é necessária corroboração

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg deve ser positivo, obtido { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = painel { $i }: a área deve ser >= 0

engine-e-srp-boxwing-panel-outside = painel { $i }: { $name } = { $c } fora de [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = painel { $i }: absorção + especular + difusa = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = painel { $i }: normal/eixo nulo

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = a matriz normal do ECOM2 é singular ou mal condicionada

## src/ssv/check.rs

engine-ssv-check-mod1-min = { $key } MOD1 mín.

engine-ssv-check-mod4-min = { $key } MOD4 mín.

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-e-ssv-check-heo-preset = predefinição heo

engine-e-ssv-check-lunar-preset = predefinição lunar

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = uma formação exige ao menos um deputy

engine-e-ssv-formation-duration-min-and-step-must = duration_min e step_s devem ser positivos

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = nenhum sinal para as constelações e bandas escolhidas

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = antena `{ $other }` desconhecida

engine-e-ssv-scenario-pattern-csv-is-empty = o CSV de diagrama está vazio

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` não é um número no CSV de diagrama

engine-e-ssv-scenario-pattern-csv-row-has-columns = a linha `{ $l }` do CSV de diagrama tem { $f } colunas, esperadas { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" exige exatamente um entre pattern_csv e pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` não é booklet, parametric nem table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receptor: informe cn0_min_dbhz ou weak_signal, não ambos

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = o laço da portadora não consegue manter a taxa de Doppler indicada em nenhum C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` não é acquisition, tracking nem both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz deve ser finito

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: informe exatamente um entre preset e orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` não é leo, meo, geo, heo nem lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: informe exatamente um entre duration_min e duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } deve ser positivo

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg exige de 1 a 8 deslocamentos finitos

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd não deve ser negativo

engine-e-ssv-scenario-give-exactly-one-of-shell = informe exatamente um entre [shell], [trajectory] e [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] exige uma tabela [navigation] para o chief

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include e constellations.bands não devem estar vazios

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km deve ser superior a 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels acima de 5 não é suportado

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna deve ser hemisphere ou omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = a varredura de shell suporta apenas o diagrama de transmissão booklet (um diagrama modelado exige a varredura de trajectory)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] aplica-se a uma [trajectory], não a um [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: informe exatamente um entre preset e orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` não é leo, meo, geo, heo nem lunar-transfer

engine-e-ssv-scenario-unknown-preset = predefinição desconhecida

engine-ssv-scenario-gnss-ssv-shell-km = shell gnss-ssv { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = navegação gnss-ssv: RMS de posição { $p } no total, { $p2 } dentro das órbitas GNSS, { $p3 } acima; maior lacuna { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = deputy a { $offset_deg } deg ({ $baseline_km } km): RMS relativo { $rel_rms_filter_m } m filtrado contra { $rel_rms_from_absolute_m } m a partir de soluções de posição absolutas

engine-ssv-scenario-combined-max-outage-min = { $band } combinado 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (interrupção máx. { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = trajetória gnss-ssv { $perigee_alt_km } a { $apogee_alt_km } km de altitude: { $parts }

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min e step_min devem ser positivos

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } deve ser um número positivo, obtido { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = nenhum pacote de normas chamado `{ $id }`; os pacotes são: { $ids }

engine-e-standards-pack-pack-manifest = manifesto do pacote: { $e }

engine-e-standards-pack-test-duplicate-id = ensaio { $id }: identificador duplicado

engine-e-standards-pack-test-scenario-is-not-in = ensaio { $id }: o cenário `{ $s }` não está no pacote

engine-e-standards-pack-test-scored-test-needs-bar = ensaio { $id }: um ensaio pontuado exige um limiar

engine-e-standards-pack-test-test-that-needs-input = ensaio { $id }: um ensaio que precisa de entrada não tem limiares

engine-e-standards-pack-test-give-either-scenario-or = ensaio { $id }: informe `scenario` ou `needs_input`, não ambos nem nenhum

engine-e-standards-pack-test-supports-unknown-row = ensaio { $id }: apoia a linha desconhecida `{ $r }`

engine-e-standards-pack-test-unknown-op = ensaio { $id }: operação `{ $op }` desconhecida

engine-e-standards-pack-test-bar-on-needs-exactly = ensaio { $id }: o limiar em { $pointer } exige exatamente um entre `value` e `against`

engine-e-standards-pack-row-duplicate-id = linha { $id }: identificador duplicado

engine-e-standards-pack-row-asks-must-be-short = linha { $id }: `asks` deve ser uma paráfrase curta

engine-e-standards-pack-row-no-test-supports-it = linha { $id }: nenhum ensaio a apoia

engine-standards-pack-not-scored-needs-input = não pontuado: precisa de entrada ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = o estudo não tem cenários para executar

engine-e-study-cannot-read-scenario = não foi possível ler o cenário { $path }: { $e }

engine-e-study-scenario-failed = o cenário { $path } falhou: { $e }

engine-e-study-scenario-produced-unparseable-json = o cenário { $path } produziu JSON não analisável: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = manifesto de suíte inválido: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = fonte `{ $o }` desconhecida: use `adsb` ou `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } tem { $len } bytes, acima do limite de { $limit } bytes

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` não é um horário UTC ISO-8601

engine-e-surface-invalid-receiver-trust-session = sessão receiver-trust inválida: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` não é um horário UTC ISO-8601

engine-e-surface-dataset-custom-needs-licence-licence = o conjunto de dados `custom` exige licence, licence_url e attribution

engine-e-surface-at-least-one-map-is = é necessário ao menos um mapa

engine-e-surface-epoch = época: { $e }

engine-e-surface-not-utf = { $suffix }: não é UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = tipo de cenário `{ $k }` desconhecido; a lista de tipos nomeia todos os tipos

engine-surface-is-not-bundled-it = `{ $name }` não está incluído: ele { $why }

engine-surface-no-bundled-scenario-named-the = nenhum cenário incluído chamado `{ $name }`; a lista de exemplos nomeia os { $v1 } que estão incluídos

engine-e-surface-invalid-toml = TOML inválido: { $e }

engine-e-surface-unknown-export-format-expected-one = formato de exportação `{ $format }` desconhecido; esperado um entre czml, kml, geojson, stk ou sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps resulta em { $opts } quadros e no máximo { $MAX_ANIMATION_FRAMES } são retornados; reduza fps ou duration_s, ou grave uma sequência mais longa pela linha de comando

engine-e-surface-scenario-run-failed = a execução do cenário falhou: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log nomeia um arquivo `path`; informe o registro como `text` ou `base64` (esta superfície não lê arquivos)

engine-e-surface-max-sp-errors-must-be = max_sp_errors deve ser no máximo 20

engine-e-surface-frames-must-be-to = frames deve estar entre 1 e { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 deve estar entre 0 e 99

engine-e-surface-runs-given-at-most-per = { $runs } execuções informadas; no máximo { $MAX_COMPLIANCE_RUNS } por relatório

engine-e-surface-the-runs-total-bytes-the = as execuções somam { $total } bytes; o limite para um relatório é { $max_bytes }

engine-e-surface-result-files-given-at-most = { $results } arquivos de resultado informados, no máximo 256

engine-e-surface-result-is-not-json = o resultado { $v1 } não é JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = formato `{ $o }` desconhecido: use `prometheus`, `cef`, `leef`, `otlp` ou `mqtt`

engine-e-surface-unknown-imu-format-use-csv = formato de IMU `{ $o }` desconhecido: use `csv` ou `euroc`

engine-e-surface-unknown-axis-use-or = eixo `{ $o }` desconhecido: use `x`, `y` ou `z`

engine-e-surface-id-must-be-to-64 = id deve ter de 1 a 64 caracteres ASCII imprimíveis, sem espaços

engine-surface-fitted-from-stationary-imu-log = ajustado a partir de um registro de IMU estacionária, sha256 { $sha }, eixo { $axis }, estimador de Allan

engine-e-surface-unknown-input-kind-use-result = input_kind `{ $o }` desconhecido: use `result` ou `jsonl`

engine-e-surface-the-input-holds-no-trust = a entrada não contém nenhuma época de confiança

engine-e-surface-the-reply-is-over-the = a resposta excede o limite de { $max_bytes } bytes; envie menos épocas ou deixe `syslog_all` desativado

engine-e-surface-otlp-needs-build-with-the = otlp exige uma build com o recurso `otlp`

engine-e-surface-the-pack-and-token-total = o pacote e o token somam { $total } bytes; o limite é { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = o token de carimbo de tempo está vazio

engine-e-surface-must-be-64-lower-case = { $what } deve ter 64 dígitos hexadecimais em minúsculas

engine-e-surface-must-be-32-bytes = { $what } deve ter 32 bytes

engine-surface-verified-against-the-public-key = VERIFICADO com a chave pública fornecida (impressão digital do signatário { $fp }).

engine-surface-intact-but-the-signer-is = ÍNTEGRO, MAS O SIGNATÁRIO NÃO ESTÁ FIXADO: os hashes e a assinatura são consistentes com a chave { $fp }, que o próprio pacote nomeia. Forneça a chave pública do signatário, obtida do signatário por outra via, para estabelecer quem o assinou.

engine-e-surface-files-must-be-json-object = files deve ser um objeto JSON de nome para conteúdo

engine-e-surface-pack-has-at-most-64 = um pacote tem no máximo 64 arquivos

engine-e-surface-file-name-must-be-plain = o nome de arquivo `{ $k }` deve ser um nome simples

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` não é base64 padrão válido

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = parâmetro de varredura desconhecido: { $other }

engine-e-sweep-unknown-sweep-metric = métrica de varredura desconhecida: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep exige ao menos um eixo

engine-e-sweep-sweep-key-is-malformed = a chave de varredura `{ $key }` está malformada

engine-e-sweep-sweep-key-follows-an-array = chave de varredura `{ $key }`: `{ $part }` segue um array, portanto deve ser um índice

engine-e-sweep-unreachable = inalcançável

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] chave de varredura `{ $key }`: o índice { $i } está além da { $n } entrada do array
        [many] chave de varredura `{ $key }`: o índice { $i } está além das { $n } de entradas do array
       *[other] chave de varredura `{ $key }`: o índice { $i } está além das { $n } entradas do array
    }


engine-e-sweep-sweep-key-parent-is-not = chave de varredura `{ $key }`: o pai de `{ $part }` não é uma tabela

engine-e-sweep-sweep-key-no-field = chave de varredura `{ $key }`: nenhum campo `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = chave de varredura `{ $key }`: o pai de `{ $last }` não é uma tabela

engine-e-sweep-sweep-key-no-field-2 = chave de varredura `{ $key }`: nenhum campo `{ $last }`

engine-e-sweep-metric-no-field-in-result = métrica `{ $path }`: nenhum campo `{ $part }` no resultado

engine-e-sweep-metric-value-is-not-number = métrica `{ $path }`: o valor não é um número

engine-e-sweep-sweep-node-serialize = serialização do nó de varredura: { $e }

engine-e-sweep-sweep-node-result-parse = análise do resultado do nó de varredura: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = eixo de varredura `{ $key }`: unidade `{ $d }` declarada, mas o pacote varrido publica `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = a thread de trabalho da varredura sofreu pânico

engine-e-sweep-generic-sweep-needs-at-least = a varredura genérica exige ao menos um eixo

engine-e-sweep-generic-sweep-needs-at-least-2 = a varredura genérica exige ao menos uma métrica

engine-e-sweep-generic-sweep-base-must-carry = o `base` da varredura genérica deve trazer o seu próprio `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = uma varredura genérica não pode varrer outra varredura

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = oscilador { $oscillator } desconhecido; esperado um entre { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day e temperature_coeff_per_k devem ser finitos

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s deve ser finito e positivo

engine-e-telecom-timing-duration-must-be-finite-and = duration_s deve ser finito e ter ao menos doze amostras de comprimento

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s deve estar em [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns deve ser finito e >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = as entradas de temperatura e de deslocamento de frequência devem ser finitas (período > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = o registro excederia 5 000 000 amostras; aumente sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = uma série de erro de tempo exige ao menos 13 amostras, obtidas { $pairs }

engine-e-telecom-timing-every-time-and-time-error = todos os time_s e time_error_ns devem ser finitos

engine-e-telecom-timing-time-must-increase = time_s deve ser crescente

engine-e-telecom-timing-the-series-must-be-uniformly = a série deve ser amostrada uniformemente: o passo { $v1 } é de { $d } s, o primeiro é de { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = a linha { $v1 } do CSV não é `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = a máscara é definida por meio de um filtro passa-baixa de 0.1 Hz, que este motor aplica apenas a intervalos de amostragem de { $MAX_FILTER_DT_S } s ou menos; este registro é amostrado a cada { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = informe [holdover] ou [series], não ambos

engine-e-telecom-timing-give-either-series-samples-or = informe series.samples ou series.csv_path, não ambos

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days deve ser finito e >= 0

engine-telecom-timing-ns-budget-exceeded-after = ; orçamento de { $max_abs_te_ns } ns excedido após { $t } s

engine-telecom-timing-ns-budget-never-exceeded = ; orçamento de { $max_abs_te_ns } ns nunca excedido

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns em { $v2 } s; { $masks }{ $first_budget } (MODELLED)

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = --format `{ $f }` desconhecido (cef ou leef)

engine-e-telemetry-cli-unknown-option = opção `{ $x }` desconhecida

engine-e-telemetry-cli-input-and-result-are-alternatives = --input e --result são alternativas

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: nenhum endereço

engine-telemetry-cli-warning-metrics-is-served-without = aviso: /metrics é servido sem autenticação em { $addr }; vincule a localhost ou coloque-o atrás de seu próprio controle de acesso

engine-e-telemetry-cli-bind = vínculo { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = servindo http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp e --syslog-tcp são alternativas

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting aplica-se a --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: uma parte de tópico deve ser não vazia, sem #, + nem / inicial

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp exige uma build com `--features otlp`

engine-telemetry-cli-warning-input-line = aviso: linha de entrada { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = não foi possível abrir { $p }: { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] aviso: { $n } mensagem MQTT não foi entregue
        [many] aviso: { $n } de mensagens MQTT não foram entregues
       *[other] aviso: { $n } mensagens MQTT não foram entregues
    }


## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = o endpoint deve começar com http://

engine-e-telemetry-otlp-endpoint-has-no-host = o endpoint não tem host

engine-e-telemetry-otlp-resolve = resolução de { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = nenhum endereço para { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = aviso: a exportação otlp falhou: { $e }

## src/telemetry/prometheus.rs

engine-telemetry-prometheus-kshana-build-info-version = kshana_build_info{ "{" }version="{ $escape_label }"{ "}" } 1{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-score = kshana_trust_score { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-band-band = kshana_trust_band{ "{" }band="{ $b }"{ "}" } { $on }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-gate-gate = kshana_trust_gate{ "{" }gate="{ $st }"{ "}" } { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-reason-active-reason = kshana_trust_reason_active{ "{" }reason="{ $escape_label }"{ $class }{ "}" } { $v2 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-epochs-total-band = kshana_trust_epochs_total{ "{" }band="{ $b }"{ "}" } { $value }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-reason-epochs-total = kshana_trust_reason_epochs_total{ "{" }reason="{ $escape_label }"{ "}" } { $n }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-input-errors-total = kshana_trust_input_errors_total { $input_errors }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-reason-overflow-total = kshana_trust_reason_overflow_total { $reason_overflow }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-syslog-send-failures = kshana_trust_syslog_send_failures_total { $value }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-epoch-offset-seconds = kshana_trust_epoch_offset_seconds { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-last-sample-timestamp = kshana_trust_last_sample_timestamp_seconds { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-status = kshana_trust_geometry{ "{" }status="{ $st }"{ "}" } { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-degraded = kshana_trust_geometry_degraded { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-signal-loss = kshana_trust_geometry_signal_loss { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-epochs-total = kshana_trust_geometry_epochs_total{ "{" }status="{ $st }"{ "}" } { $value }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-label-label = kshana_trust_geometry_label{ "{" }label="{ $l }"{ "}" } { $v1 }{ "\u000A" }

engine-telemetry-prometheus-kshana-trust-geometry-vdop = kshana_trust_geometry_vdop { $fmt_f64 }{ "\u000A" }

engine-telemetry-prometheus-help-type =
    # HELP { $name } { $help }
    # TYPE { $name } { $kind }{ "\u000A" }

## src/telemetry/sample.rs

engine-e-telemetry-sample-not-json = não é JSON: { $e }

engine-e-telemetry-sample-not-json-object = não é um objeto JSON

engine-e-telemetry-sample-is-not-number = `{ $k }` não é um número

engine-e-telemetry-sample-is-not-finite = `{ $k }` não é finito

engine-e-telemetry-sample-missing = `t_s` ausente

engine-e-telemetry-sample-score-outside-100 = `score` { $s } fora de 0..=100

engine-e-telemetry-sample-missing-state = `state` ausente

engine-e-telemetry-sample-is-not-an-array = `{ $key }` não é um array

engine-e-telemetry-sample-entry-has-no-name = uma entrada de `{ $key }` não tem nome

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` está ausente ou não é um número finito

engine-e-telemetry-sample-position-is-not-an-object = `position` não é um objeto nem null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` está ausente ou não é uma string

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` não é um número finito >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` não é uma string

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` não é um booleano

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` não é um objeto nem null

engine-e-telemetry-sample-result-has-no-epochs = o resultado não tem `epochs`

engine-e-telemetry-sample-bad-epochs = `epochs` inválido: { $e }

## src/telemetry/syslog.rs

engine-telemetry-syslog-cat-gnss-trust-dvchost-cs1label = cat=gnss-trust dvchost={ $cef_ext_escape } cs1Label=band cs1={ $band }

engine-telemetry-syslog-cs2label-reasons-cs2 = { " " }cs2Label=reasons cs2={ $cef_ext_escape }

engine-telemetry-syslog-cs3label-previousband-cs3 = { " " }cs3Label=previousBand cs3={ $p }

engine-telemetry-syslog-cfp1label-trustscore-cfp1 = { " " }cfp1Label=trustScore cfp1={ $num }

engine-telemetry-syslog-cfp2label-epochoffsetseconds-cfp2 = { " " }cfp2Label=epochOffsetSeconds cfp2={ $num }

engine-telemetry-syslog-cs4label-logtime-cs4 = { " " }cs4Label=logTime cs4={ $cef_ext_escape }

engine-telemetry-syslog-cs5label-gate-cs5 = { " " }cs5Label=gate cs5={ $cef_ext_escape }

engine-telemetry-syslog-cs6label-geometry-cs6 = { " " }cs6Label=geometry cs6={ $status }{ $classes }

engine-telemetry-syslog-cfp3label-geometryhdop-cfp3 = { " " }cfp3Label=geometryHdop cfp3={ $num }

engine-telemetry-syslog-cfp4label-geometrypdop-cfp4 = { " " }cfp4Label=geometryPdop cfp4={ $num }

engine-telemetry-syslog-cn1label-geometryusedsatellites-cn1 = { " " }cn1Label=geometryUsedSatellites cn1={ $v1 }

engine-telemetry-syslog-cef-gnss-trust = CEF:0|{ $cef_header_escape }|{ $cef_header_escape2 }|{ $cef_header_escape3 }|{ $EVENT_PREFIX }.{ $band }|GNSS trust { $band }|{ $cef_severity }|{ $ext }

engine-e-telemetry-syslog-host-is-bytes-syslog-host = o host tem { $host } bytes; um nome de host syslog tem no máximo 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = o host deve ser ASCII imprimível, sem espaços

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } contra { $w } (não representável como f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: presente, esperado ausente

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: ausente, esperado presente

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } deve ser finito

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu deve ser finito e não negativo

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: linha { $v1 }: não é MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: nenhum registro AR para { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = formato de série { $f } desconhecido (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } deve ser finito

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s devem resultar em 16 a 20000 medições

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } deslocamento { $ns } ns (Sagnac { $ns2 } ns, ionosfera { $ns3 } ns); u combinada { $ns4 } ns (tipo A { $ns5 } ns a { $averaging_s } s); { $series } série(s) real(is) (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = caracteres não ASCII no TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE truncado ao ler { $what } (colunas { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } curto demais para uma soma de verificação na coluna 69

engine-e-tle-tle-has-no-checksum-digit = o TLE { $label } não tem dígito de soma de verificação na coluna 69

engine-e-tle-tle-checksum-mismatch-column-69 = soma de verificação do TLE { $label } divergente: a coluna 69 indica { $want }, calculado { $got }

engine-e-tle-not-tle-line = não é uma linha 1 de TLE: { $line1 }

engine-e-tle-not-tle-line-2 = não é uma linha 2 de TLE: { $line2 }

engine-e-tle-invalid-in-tle = { $what } inválido no TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = ano de época inválido no TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = número de catálogo inválido no TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = inclinação fora do intervalo [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = excentricidade fora do intervalo [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = movimento médio não positivo: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = mantissa de { $what } inválida no TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = expoente de { $what } inválido no TLE: { $exp }

engine-tle-satellite-line-only-element-set = satélite { $satnum }: conjunto de elementos só com a linha 2 analisado como elementos keplerianos analíticos (dois corpos) — o arrasto/B* da linha 1 e os termos seculares do SGP4 estão ausentes, de modo que esta órbita se afasta de um ajuste SGP4 verdadeiro longe da época; forneça a linha 1 correspondente para a exatidão do SGP4

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: o perfil de C/N0 exige uma época e uma duração positivas

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: o perfil de C/N0 exigiria mais de { $MAX_DETECTOR_STEPS } passos de detector ({ $total } s a { $epoch_s } s por época); reduza ramp_duration_s ou aumente predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } deve ser finito

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } deve ser positivo (obtido { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips deve ser inferior a 1.9 chips (obtido { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio deve ser de ao menos 1 (obtido { $pullin_bandwidth_ratio }) — um laço que volta a capturar com largura de banda MENOR do que a usada no rastreamento inverteria a histerese

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s não deve ser negativo

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) não deve exceder cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } não deve estar vazio

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } tem { $axis } entradas; o limite é { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } contém um valor não finito

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: as permanências de confirmação devem ser de ao menos 1 época

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = são necessárias ao menos oito amostras

engine-e-twstft-budget-samples-must-increase-in-time = as amostras devem ser crescentes no tempo

engine-e-twstft-budget-samples-must-be-on-regular = as amostras devem estar em uma grade regular

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } linhas: { $validated } verificadas em relação a uma referência externa independente, { $modelled } calculadas a partir de um modelo, { $partner_owned } a cargo de parceiros.{ "\u000A" }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-verification-the-complete-machine-checked-evidence = O registro de evidências completo, verificado por máquina: **{ $total } linhas — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Uma linha só pode ser VALIDATED com uma referência externa independente (os ensaios de invariantes da matriz impõem isso). Os mesmos dados, com links clicáveis por linha para cada ensaio, módulo e fixture versionada, estão no *Registro de validação* em https://kshana.dev. Veja [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md) para saber por que cada linha calculada a partir de um modelo não é verificada em relação a uma referência externa independente.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } capacidades rotuladas como MODELLED.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json não é JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json não é JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] exige `label`

engine-wasm-runs-needs-result = runs[{ $i }] exige `result`

engine-wasm-results-json-is-not-json = results_json não é um array JSON de strings: { $e }

engine-wasm-maps-json-must-be-json = maps_json deve ser um array JSON de strings: { $e }

engine-wasm-plans-json-is-not-json = plans_json não é um array JSON de strings: { $e }

engine-wasm-options-json-is-not-json = options_json não é JSON: { $e }

engine-wasm-input-is-about-bytes-over = a entrada tem cerca de { $b64 } bytes, acima do limite de { $v2 } bytes

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Navegação sequencial referenciada ao terreno (SITAN recursivo)

engine-altpnt-sequential-free-inertial-drift-grows = deriva inercial livre (crescente)

engine-altpnt-sequential-terrain-matched-bounded = com correspondência com o terreno (limitada)

engine-altpnt-sequential-waypoint-full-scale = ponto de passagem →    escala total { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Relatório de execução do Kshana

engine-advanced-report-meta = Tipo <code>{ $kind }</code> · motor { $engine } · cenário <code>{ $scenario }</code> (digest do arquivo { $digest }…)

engine-advanced-report-toc-summary = 1 Resumo

engine-advanced-report-toc-inputs = 2 Entradas

engine-advanced-report-toc-results = 3 Resultados

engine-advanced-report-toc-aggregation = 3a Agregação

engine-advanced-report-toc-companions = 3b Animação e exportações

engine-advanced-report-toc-events = 4 Eventos

engine-advanced-report-toc-labels = 5 Rótulos de verificação

engine-advanced-report-toc-not-modelled = 6 Não modelado

engine-advanced-report-toc-reproducibility = 7 Reprodutibilidade

engine-advanced-report-h-summary = 1. Resumo executivo

engine-advanced-report-honesty-label = <strong>Rótulo de honestidade</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Capacidades utilizadas:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (utilizadas, não fornecidas); ver seção 5.

engine-advanced-report-member-runs = <strong>Execuções-membro:</strong> { $n }, agregadas na seção 3a.

engine-advanced-report-h-inputs = 2. Entradas

engine-advanced-report-inputs-note = Todos os campos que o arquivo de cenário define, achatados até o seu caminho. As unidades vêm do bloco <code>units</code> do resultado (o esquema de unidades de campo, docs/field-units-schema.json) quando ele descreve o campo; caso contrário, do sufixo do nome do campo; uma unidade que nenhum dos dois indica é exibida como não indicada.

engine-advanced-report-th-parameter = Parâmetro

engine-advanced-report-th-value = Valor

engine-advanced-report-th-unit = Unidade

engine-advanced-report-th-unit-source = Origem da unidade

engine-advanced-report-h-results = 3. Resultados

engine-advanced-report-chart-alt = Gráfico do resultado

engine-advanced-report-also-written-to = { " " }(gravado também em { $file })

engine-advanced-report-h-scalars = Resultados escalares

engine-advanced-report-h-columns = Colunas numéricas

engine-advanced-report-th-result = Resultado

engine-advanced-report-th-column = Coluna

engine-advanced-report-th-count = Contagem

engine-advanced-report-th-min = Mín.

engine-advanced-report-th-max = Máx.

engine-advanced-report-th-first = Primeiro

engine-advanced-report-th-last = Último

engine-advanced-report-omitted-inputs = <p class="note">{ $n } outras entradas foram omitidas desta página; report.json lista as mesmas linhas, e o documento de resultado contém todos os valores.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">{ $n } outros resultados escalares foram omitidos desta página; report.json lista as mesmas linhas, e o documento de resultado contém todos os valores.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">{ $n } outras colunas numéricas foram omitidas desta página; report.json lista as mesmas linhas, e o documento de resultado contém todos os valores.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">{ $n } outros eventos foram omitidos desta página; report.json lista as mesmas linhas, e o documento de resultado contém todos os valores.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Agregação das execuções-membro

engine-advanced-report-mode = <p>Modo <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Modo <strong>{ $mode }</strong> sobre o tipo <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Modo <strong>{ $mode }</strong>, { $n_runs } execuções-membro.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Modo <strong>{ $mode }</strong> sobre o tipo <code>{ $kind }</code>, { $n_runs } execuções-membro.</p>{ "\u000A" }

engine-advanced-report-run-digest = Digest da execução (SHA-256 sobre os digests de resultado dos membros, em ordem de despacho): <code>{ $digest }</code>

engine-advanced-report-table-empty = Esta tabela não tem linhas: o resultado não lista nenhuma.

engine-advanced-report-distribution-caption = Distribuição Monte Carlo de { $metric } ({ $n } amostras), 20 intervalos de mesma largura; as linhas tracejadas marcam os percentis 5, 50 e 95.

engine-advanced-report-distribution-caption-unit = Distribuição Monte Carlo de { $metric } ({ $n } amostras, { $unit }), 20 intervalos de mesma largura; as linhas tracejadas marcam os percentis 5, 50 e 95.

engine-advanced-report-h-companions = 3b. Animação e exportações

engine-advanced-report-animation-alt = Animação das séries temporais da execução

engine-advanced-report-animation-caption = As próprias amostras da execução sendo traçadas atrás de um cursor de tempo em movimento (o desenho animado de <code>--animate svg</code>; mostra a imagem final sob movimento reduzido e na impressão).

engine-advanced-report-no-animation = Sem animação: { $reason }

engine-advanced-report-no-animation-default = o resultado não contém série temporal

engine-advanced-report-player-written-by = O player interativo é gravado por <code>{ $command }</code>.

engine-advanced-report-written-beside = Gravado ao lado deste relatório: { $links }.

engine-advanced-report-th-export = Exportação

engine-advanced-report-th-applies = Aplica-se

engine-advanced-report-th-files-or-reason = Arquivos ou motivo

engine-advanced-report-written-by = gravado por <code>{ $command }</code>

engine-advanced-report-does-not-apply = não se aplica

engine-advanced-report-yes = sim

engine-advanced-report-no = não

engine-advanced-report-h-events = 4. Linha do tempo dos eventos

engine-advanced-report-events-caption = Janelas como barras, eventos pontuais como pontos, no eixo de tempo da própria execução.

engine-advanced-report-th-start = Início (s)

engine-advanced-report-th-end = Fim (s)

engine-advanced-report-th-event = Evento

engine-advanced-report-th-source = Fonte

engine-advanced-report-point-event = evento pontual

engine-advanced-report-events-timeline = Linha do tempo dos eventos

engine-advanced-report-point-events = eventos pontuais ({ $n })

engine-advanced-report-distribution-of = Distribuição de { $metric }

engine-advanced-report-max-bin = intervalo máx. { $n }

engine-advanced-report-h-labels = 5. Rótulos de verificação

engine-advanced-report-th-capability = Capacidade (requisito da matriz)

engine-advanced-report-th-label = Rótulo

engine-advanced-report-th-used-by = Utilizado por

engine-advanced-report-th-oracle = Fonte: referência independente

engine-advanced-report-th-test-evidence = Evidência de teste

engine-advanced-report-h-figure-tiers = Níveis por grandeza indicados pelo resultado

engine-advanced-report-th-figure = Grandeza

engine-advanced-report-th-tier = Nível

engine-advanced-report-th-matrix-requirement = Requisito da matriz

engine-advanced-report-th-applicable = Aplicável

engine-advanced-report-no-attack = não (nenhum ataque configurado)

engine-advanced-report-h-not-modelled = 6. Não modelado e premissas

engine-advanced-report-not-modelled-note = Cada item é citado de onde está indicado: o documento de resultado, o catálogo de tipos, o arquivo de cenário ou o motivo pelo qual uma linha MODELLED da matriz de verificação continua modelada.

engine-advanced-report-th-statement = Declaração

engine-advanced-report-h-reproducibility = 7. Registro de reprodutibilidade

engine-advanced-report-rk-command = Comando para reproduzir

engine-advanced-report-rk-working-directory = Diretório de trabalho

engine-advanced-report-rk-engine-version = Versão do motor

engine-advanced-report-rk-source-commit = Commit do código-fonte

engine-advanced-report-rk-scenario-file = Arquivo de cenário

engine-advanced-report-rk-scenario-sha = SHA-256 do arquivo de cenário (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = scenario_hash do resultado

engine-advanced-report-rk-result-sha = SHA-256 do documento de resultado

engine-advanced-report-rk-seed = Semente

engine-advanced-report-rk-platform = Plataforma

engine-advanced-report-rk-generated = Estudo gerado (UTC)

engine-advanced-report-rk-determinism = Determinismo

engine-advanced-report-result-hash-none = o documento de resultado não indica nenhum

engine-advanced-report-print-note = Para imprimir esta página em um arquivo Portable Document Format (PDF), use a caixa de diálogo de impressão do navegador e escolha “Salvar como PDF”; a folha de estilo de impressão se ajusta ao papel A4 e US Letter, repete os cabeçalhos de tabela entre as páginas e inicia em nova página as seções de entradas, resultados, rótulos e reprodutibilidade. O motor não grava nenhum PDF por si. report.json contém o mesmo conteúdo que esta página.

engine-advanced-report-footer = Gerado pelo Kshana { $engine }.{ $stamp } Reproduzível a partir de cenário + semente + versão do motor. Livre e de código aberto (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">código-fonte e documentação</a>.

engine-advanced-report-empty-inputs = O cenário não define nenhum campo além de `kind`: o tipo executou sua configuração de referência a partir dos padrões documentados.

engine-advanced-report-empty-scalars = O documento de resultado não contém nenhum escalar fora de suas matrizes; seus números são resumidos por coluna abaixo.

engine-advanced-report-empty-series = O documento de resultado não contém nenhuma matriz numérica: todo resultado é um escalar na tabela acima.

engine-advanced-report-empty-events = Nenhum evento temporizado: o cenário não programa nenhuma janela nem instante de início e o resultado não relata nenhum evento. O tipo avalia sua configuração como um único caso.

engine-advanced-report-empty-not-modelled = Nada no resultado, no catálogo de tipos, no cenário ou nas linhas da matriz utilizadas indica uma limitação de modelagem para esta execução.

engine-advanced-report-capabilities-statement = Cada linha é uma linha da matriz de verificação que os tipos desta execução exercitam, com o rótulo e a referência independente que a matriz lhe atribui (src/verification.rs, docs/VERIFICATION-MATRIX.md). Um rótulo classifica a capacidade tal como a matriz a registra; não classifica a configuração deste cenário, e uma linha VALIDATED não faz das entradas da execução dados medidos. Uma linha PARTNER é uma disciplina de que a execução depende e que o Kshana não fornece.

engine-advanced-report-no-run-label = O resultado não contém nenhum rótulo de honestidade no nível da execução; os rótulos de verificação das capacidades utilizadas são listados em sua própria seção, e os níveis por grandeza, onde o resultado os indica.

engine-advanced-report-no-seed = Nem o cenário nem o resultado contêm uma semente. O resultado é determinado apenas pelo arquivo de cenário e pela compilação do motor; o teste de determinismo reexecuta todos os cenários incluídos e exige uma saída idêntica byte a byte.

engine-advanced-report-working-directory = Execute o comando a partir do diretório em que a execução original foi iniciada: o caminho do cenário e qualquer caminho de dados relativo dentro do cenário são resolvidos em relação a ele. Verifique antes o arquivo de cenário com scenario_sha256.

engine-advanced-report-determinism-stamped = Os mesmos bytes de cenário, a mesma semente e a mesma compilação do motor dão o mesmo documento de resultado, exceto pelo carimbo meta.generated_utc, que --study-name grava a partir do relógio; execute sem --study-name para obter uma saída idêntica byte a byte. Os resultados de ponto flutuante são fixados por plataforma; outro sistema operacional ou outra arquitetura pode diferir nos últimos dígitos.

engine-advanced-report-determinism-plain = Os mesmos bytes de cenário, a mesma semente e a mesma compilação do motor dão um documento de resultado e um relatório idênticos byte a byte; este relatório não contém carimbo de data e hora. Os resultados de ponto flutuante são fixados por plataforma; outro sistema operacional ou outra arquitetura pode diferir nos últimos dígitos.

engine-advanced-report-not-applicable-no-attack = não aplicável (nenhum ataque configurado)

engine-advanced-report-what-ran-default = Um cenário `{ $kind }`.

engine-advanced-report-nothing-carried = nada contido

engine-advanced-report-tbl-sweep-nodes = Nós da varredura

engine-advanced-report-tbl-mc-summary = Resumo da distribuição Monte Carlo (os percentis são de posto mais próximo; o intervalo de confiança de 95% da média é um bootstrap de percentis com semente fixa)

engine-advanced-report-tbl-chain-phases = Fases da cadeia

engine-advanced-report-tbl-shared = Condições compartilhadas

engine-advanced-report-tbl-members = Membros

engine-advanced-report-tbl-combined = Combinado entre os membros

engine-advanced-report-tbl-optimiser-best = Melhor resultado do otimizador (um ótimo local dentro dos limites indicados)

engine-advanced-report-tbl-optimiser-trace = Traço do otimizador

engine-advanced-report-tbl-sweep-grid = Grade da varredura

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Navegação referenciada ao terreno (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Navegação por correspondência com mapa gravimétrico

engine-altpnt-terrain-title-combined = alt-PNT combinado de gravidade + magnético + terreno

engine-altpnt-terrain-free-inertial-drift = deriva inercial livre

engine-altpnt-terrain-terrain-matched = com correspondência com o terreno

engine-altpnt-terrain-gravity-matched = com correspondência gravimétrica

engine-altpnt-terrain-gravity-only = apenas gravidade

engine-altpnt-terrain-magnetic-only = apenas magnético

engine-altpnt-terrain-terrain-only = apenas terreno

engine-altpnt-terrain-combined-fused = combinado (fundido)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · cenário { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Superfície de ataque à segurança do sinal lunar (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = retransmissores à vista

engine-body-pnt-chart-count = contagem

engine-body-pnt-chart-formal-one-sigma-position = posição formal de um sigma (log10 m): azul apenas constelação, âmbar com a distância até a Terra

engine-body-pnt-chart-time-since-epoch = tempo desde a época, 0 a { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = erro de tempo do relógio vs guarda (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 vs piso de rastreamento (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = nível de proteção vs limite de alerta (m)

engine-campaign-chart-position-error-vs-threshold = erro de posição vs limiar (m)

engine-campaign-chart-satellites-tracking = satélites rastreados

engine-campaign-chart-alarm-flags-and-events = indicadores de alarme e eventos

engine-campaign-chart-mission-time = { $duration } s de tempo de missão

engine-campaign-chart-sweep-percentile-band = , mediana com faixa dos percentis 5 a 95 sobre { $n_runs } sementes

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) em { $lead }

engine-campaign-chart-monte-carlo-of = Monte Carlo de `{ $scenario_kind }`: { $n_runs } sementes a partir de { $base_seed } (percentis 5, 50, 95; barra = intervalo de confiança bootstrap de 95% da média)

engine-campaign-chart-composed-members = membros compostos sob condições compartilhadas: { $shared }

engine-campaign-chart-not-available = n/d

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Recuperação do comprimento de arco cislunar — um estimador que não compartilha as jacobianas

engine-cislunar-arc-recovery-chart-subtitle = mínimos quadrados em lote por diferenças finitas · erro de recuperação de estado medido · sem jacobiana analítica, sem STM variacional, sem tolerância de posto por SVD

engine-cislunar-arc-recovery-chart-bound = limite { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = limiar de posto da gramiana

engine-cislunar-arc-recovery-chart-monte-carlo-rms = erro RMS de recuperação de posição Monte Carlo (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = pior razão de recuperação sem ruído (erro final / deslocamento)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Observabilidade cislunar ao longo de um arco de rastreamento (P6)

engine-cislunar-observability-chart-subtitle = posto vs arco (enlace único apenas distância) · espectro de autovalores da gramiana · condições iniciais da DRO corrigidas diferencialmente + verificação cruzada por SRIF · projeto { $modelled }, posto/STM/fechamento { $validated }

engine-cislunar-observability-chart-observable-rank = posto observável vs comprimento do arco

engine-cislunar-observability-chart-arc-length = comprimento do arco (unidades de tempo do referencial rotativo, { $arc_hours } h no total)

engine-cislunar-observability-chart-gramian-eigenvalues = autovalores da gramiana (log10)

engine-cislunar-observability-chart-condition = condição κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Resiliência a conflito de PNT em camadas (P7)

engine-conflict-resilience-chart-subtitle = perda total vs intensidade da ameaça (MC vs forma fechada) · razão de resiliência vs correlação de negação · { $modelled } premissas a priori, { $validated } MC->forma fechada / marginais de cópula

engine-conflict-resilience-chart-total-loss-probability = probabilidade de perda total vs intensidade

engine-conflict-resilience-chart-threat-intensity = intensidade da ameaça

engine-conflict-resilience-chart-layered-mc = MC em camadas

engine-conflict-resilience-chart-single-layer = camada única

engine-conflict-resilience-chart-resilience-ratio = razão de resiliência vs correlação de negação

engine-conflict-resilience-chart-denial-correlation = correlação de negação ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = disponibilidade (%)

engine-constellation-chart-mean-pdop = PDOP médio

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = GNSS terrestre à distância lunar — C/N0 em função do ângulo fora do eixo

engine-earth-gnss-lunar-chart-track-threshold = rastreamento { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = limbo da Terra { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = ângulo fora do eixo (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = dourado = rastreável · vermelho = fraco demais · cinza = ocultado pela Terra · diagrama de transmissão { $modelled }

## src/ensemble.rs

engine-ensemble-chart-title = Holdover do relógio: faixa de confiança do erro de temporização ({ $n_runs } execuções)

engine-ensemble-chart-timing-error-ns = erro de temporização (ns)

engine-ensemble-chart-spec-threshold = especificação { $threshold } ns

engine-ensemble-chart-time-s = tempo (s)

engine-ensemble-chart-classical-median-band = clássico: { $id } (mediana, faixa de 5 a 95%)

engine-ensemble-chart-quantum-median-band = quântico: { $id } (mediana, faixa de 5 a 95%)

## src/fom_label.rs

engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

## src/frame_eop.rs

engine-frame-eop-chart-title = Orçamento de predição de referencial / EOP em tempo real para temporização lunar

engine-frame-eop-chart-ut1-error-ms = erro de UT1 (ms)

engine-frame-eop-chart-position-at-moon-m = posição na Lua (m)

engine-frame-eop-chart-equiv-timing-ns = temporização equiv. (ns)

engine-frame-eop-chart-prediction-horizon-days = horizonte de predição (dias)

engine-frame-eop-chart-iers-final-floor = piso final do IERS { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m na Lua

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = UKF híbrido de 17 estados — autoconsistência do filtro (modelado)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + brancura da inovação vs faixas χ² de 95%; 1.0 = consistente. Autoconsistência, não exatidão.

engine-fusion-hybrid-ukf-chart-target = alvo 1.0

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (brancura)

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = CONSISTENTE

engine-fusion-hybrid-ukf-chart-inconsistent = INCONSISTENTE

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Erro horizontal de GNSS/INS fracamente acoplado

engine-fusion-pack-chart-horizontal-error-m = erro horizontal (m)

engine-fusion-pack-chart-spec-threshold = especificação { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Skyplot ({ $label })

engine-geometry-chart-north = N

engine-geometry-chart-east = L

engine-geometry-chart-south = S

engine-geometry-chart-west = O

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } el { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } el { $el } (oculto pelo horizonte local)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } el { $el } (abaixo da máscara)

engine-geometry-chart-no-fix = sem solução de posição

engine-geometry-chart-in-view-hidden = { $n_visible } à vista, { $n_masked } ocultos pelo horizonte local · { $dop } · vazado: fora de vista

engine-geometry-chart-satellites-as-given = satélites como informados

engine-geometry-chart-representative-sky = céu representativo, não de uma data específica

engine-geometry-chart-footer = Kshana v{ $version } · geometria sob um modelo de erro indicado · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = Níveis de proteção RAIM vs limites de alerta

engine-gnss-sim-chart-protection-level-m = nível de proteção (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

## src/main.rs

engine-main-fail = erro: { $e }

## legal (advisories, disclaimers and notices; the English text is the source, the constant in code is what machine files carry)

# legal: native review
engine-legal-compliance-statement = Uma linha marcada como evidenciada significa que uma execução deste conjunto fornece evidências em apoio das capacidades que a linha nomeia. Isso não é uma constatação de que um referencial normativo é atendido, e não significa que algum produto tenha sido classificado ou aprovado por quem quer que seja. A coluna de lacuna indica o que as execuções não mostram.

# legal: native review
engine-legal-bench-surface-notice = Apenas movimento do veículo e intervalos de eventos rotulados. Nada do que é exportado aqui é, modela ou aciona um sinal de radiofrequência ou de banda base, e um evento é um intervalo de tempo, não uma receita para produzir interferência. O simulador de laboratório e seu operador fornecem os sinais e são responsáveis por executá-los somente onde isso for permitido (conduzido ou blindado, segundo as próprias instruções de segurança do simulador). O Kshana não publica resultados dessas execuções.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ROC em nível de janela de cada monitor nas gravações fornecidas. Cada janela de evento indicada é um positivo e cada janela roc_window_s fora dos eventos é um negativo; uma janela conta em um limiar quando a estatística de teste do monitor o alcança na janela. P_fa é por janela negativa, não por teste.

# legal: native review
engine-legal-lunanet-afs-advisory = Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana. Ela verifica um fluxo de símbolos em relação a uma edição de uma especificação publicada e não diz nada sobre qualquer nó ou serviço LunaNet.

# legal: native review
engine-legal-iqfit-statement = MODELLED: todo número ajustado descreve o receptor aberto (o projeto de malha indicado e a cadeia de entrada de RF) nas gravações que lhe foram fornecidas, ajustado aos resultados pontuados da campanha. Não é uma medição de nenhum outro receptor. As previsões são rotuladas PREDICTION, com a gravação testada mais próxima e a distância fora das condições testadas.

# legal: native review
engine-legal-iqfit-advisory = Consultivo: saída de análise, não um equipamento de navegação homologado; as previsões são saídas de modelo com erro indicado, não garantias.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Declaração de fonte, não uma alegação: o material ICG WG-B Lunar PNT de junho de 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, fonte S3 do estudo) descreve um laboratório de referência de tempo lunar na estação com uma meta de tempo da ordem do nanossegundo. O Kshana cita essa meta apenas como contexto; não a adota, e nada neste bloco mostra que algum relógio de estação real a atinja.

# legal: native review
engine-legal-standards-pack-notice = Um pacote de normas mede cenários modelados em relação a limiares indicados antes da execução. Ele fornece evidências em apoio das linhas de referencial normativo que nomeia; não classifica nem aprova nenhum produto, e um limiar MET diz apenas que a saída modelada do cenário atingiu o limiar indicado.

# legal: native review
engine-legal-standards-pack-advisory = Consultivo: saída de análise de uma ferramenta de pesquisa e engenharia, não um equipamento de navegação homologado e não um serviço de segurança da vida humana; não deve ser a única base de nenhuma decisão de navegação ou de segurança.

# legal: native review
engine-legal-geometry-statement = Geometria sob um modelo de erro indicado (MODELLED): visibilidade em linha de visada em relação ao horizonte local indicado, diluição da precisão e uma elipse de erro gaussiana para erros de distância gaussianos independentes, iguais e de média zero, com o erro equivalente de distância do usuário indicado. Não é uma previsão do erro real de um receptor, que também tem vieses, multipercurso e erros sem linha de visada, e não é um limite de integridade. As constelações predefinidas são uma geometria representativa, não o céu daquela data naquele local.

# legal: native review
engine-legal-resilience-disclaimer = Autoavaliação derivada de simulação alinhada ao DHS RPCF v2.0. Isto não é uma certificação nem uma acreditação, e não representa nenhuma aprovação de autoridade (DHS, IEEE ou outra). Toda subpontuação é MODELLED, a menos que seja expressamente marcada como VALIDATED, e as pontuações são figuras de mérito de domínio de tempo e de detecção, não exatidão no domínio da posição.

# legal: native review
engine-legal-observatory-notice = Uma célula degradada significa que uma parcela elevada de aeronaves relatou baixa exatidão de navegação ali naquele dia. Nenhuma causa é atribuída. Uma célula não observada, ou ausente, não foi avaliada, o que não equivale a livre. Apenas consultivo: não é uma aprovação, certificação nem declaração de conformidade.

# legal: native review
engine-legal-receiver-trust-advisory = Software de caráter consultivo, não um equipamento de navegação homologado (IEC 61108, IEC 61162): o operador continua responsável pela navegação da embarcação.

# legal: native review
engine-legal-evidence-roundtrip-notice = Vincula quatro registros por hash: o cenário, as condições de teste indicadas pelo laboratório, o registro do receptor e a pontuação desse registro em relação aos eventos indicados. Não é um sinal, não é uma receita de reprodução e não é uma certificação. A forma como o movimento do cenário chegou ao receptor (um arquivo reproduzido por um simulador de laboratório, conduzido ou blindado) foi responsabilidade do operador e é registrada aqui apenas como indicada.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Este pacote é um registro técnico do que o motor do Kshana calculou a partir do registro de receptor indicado com a configuração indicada. Não é um parecer jurídico, não é uma constatação de fato sobre qualquer evento ou sua causa e não é uma certificação.

# legal: native review
engine-legal-bench-notice = Consultivo: modelado ou medido em relação a referências indicadas, não uma aprovação, certificação nem declaração de conformidade. Uma pontuação descreve um registro ou um corpus, nunca um produto.

# legal: native review
engine-legal-osnma-advisory = Consultivo: esta é uma saída de análise e de monitoramento, e não um equipamento de navegação homologado. O status de autenticação aqui relatado não é um serviço de integridade de navegação e não deve ser a única base de nenhuma decisão de navegação ou de segurança.

## added by the second pass

engine-holdover-test-not-recovered-within-record = ; não recuperado dentro do registro

engine-holdover-test-chart-title = Teste de holdover: erro de tempo por etapa

engine-holdover-test-chart-y-title = |erro de tempo| (ns)

engine-holdover-test-chart-panel-caption = erro de tempo absoluto; etapa de holdover sombreada; as linhas tracejadas são os orçamentos de erro de tempo

engine-holdover-test-chart-gnss-removed = GNSS removido

engine-holdover-test-chart-gnss-restored = GNSS restabelecido

engine-holdover-test-chart-time-axis = tempo no eixo do registro ({ $min } min)

engine-hybrid-chart-title = Utilização da especificação do PNT híbrido durante a interrupção do GNSS (1.0 = especificação)

engine-hybrid-chart-y-title = utilização da especificação

engine-hybrid-chart-spec-line = especificação (1.0)

engine-hybrid-chart-classical-suite = conjunto clássico

engine-hybrid-chart-quantum-suite = conjunto quântico

engine-hybrid-integrity-chart-availability = disponibilidade

engine-hybrid-integrity-chart-precision = precisão

engine-hybrid-integrity-chart-integrity = integridade

engine-hybrid-integrity-chart-joint-indep = conjunta (indep.)

engine-hybrid-integrity-chart-joint-corr = conjunta (corr.)

engine-hybrid-integrity-chart-title = Figura de mérito conjunta do PNT híbrido óptico + RF

engine-hybrid-integrity-chart-subtitle = P(disponível E com grau de precisão E com integridade assegurada)

engine-inertial-chart-title = Erro de posição por navegação estimada durante a interrupção do GNSS

engine-inertial-chart-y-title = erro de posição (m)

engine-inertial-chart-spec-line = especificação { $m } m

engine-inertial-chart-classical = clássico: { $id }

engine-inertial-chart-quantum = quântico: { $id }

engine-iq-campaign-report-roc-aria-label = ROC de detecção por monitor

engine-iq-campaign-report-roc-x-title = P_fa (por janela negativa)

engine-iq-campaign-report-curve-aria-label = Degradação de C/N0 em função do J/S declarado para { $rec } evento { $ev }

engine-iq-campaign-report-curve-x-title = J/S declarado (dB)

engine-iq-campaign-report-curve-y-title = degradação de C/N0 (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: referência SSC, Q = { $q }

engine-iq-campaign-report-curve-model-legend = referência { $label } (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } séries adicionais na tabela do painel de resultados

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, degradação medida { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (medido)

engine-jamming-chart-title = Satélites visíveis versus rastreados sob jamming

engine-jamming-chart-y-title = satélites

engine-jamming-chart-four-sv-fix = solução de posição com 4 SV

engine-jamming-chart-visible = visíveis

engine-jamming-chart-tracking = rastreados

engine-leo-fusion-ntn-chart-title = Posicionamento 5G NTN: limite de Cramér-Rao da distância por largura de banda

engine-leo-fusion-ntn-chart-caption = desvio-padrão da distância (log10 m): barra = da máscara ao zênite de C/N0; ponto = erro RMS da solução de posição 3D

engine-leo-fusion-ppp-chart-title = Convergência do PPP com aumento por LEO

engine-leo-fusion-ppp-chart-caption = erro horizontal mediano (log10 m) em função dos minutos

engine-leo-fusion-ppp-chart-n-leo = { $n } LEO

engine-leo-fusion-pvt-kind-chart-doppler-caption = erro da solução Doppler 3D (log10 m) em função da duração da janela

engine-leo-fusion-pvt-kind-chart-doppler-x-label = janela (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = PDOP mediano (azul) e VDOP (âmbar), log10, em função dos satélites LEO adicionados

engine-leo-fusion-pvt-kind-chart-joint-x-label = satélites LEO adicionados

engine-leo-fusion-pvt-kind-chart-polar-caption = VDOP mediano (log10): cinza GNSS, azul LEO, âmbar fusionado

engine-leo-fusion-pvt-kind-chart-polar-x-label = latitude (graus)

engine-leo-fusion-pvt-kind-chart-timing-caption = erro RMS de tempo em relação ao UTC (log10 ns) em função do deslocamento de C/N0, uma linha por oscilador

engine-leo-fusion-pvt-kind-chart-timing-x-label = deslocamento de C/N0 (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: { $x0 } a { $x1 }

engine-leo-navmsg-chart-title = Mensagem de navegação LEO: SISRE versus intervalo de ajuste

engine-leo-navmsg-chart-no-trade-encode-decode = Nenhuma compensação nesta execução; consulte result.json para as tabelas de codificação/decodificação e de orçamento.

engine-leo-navmsg-chart-no-fit-interval-trade = Nenhuma compensação de intervalo de ajuste nesta execução; consulte result.json.

engine-leo-navmsg-chart-caption = SISRE RMS somente de órbita (m, escala logarítmica) vs intervalo de ajuste (s)

engine-leo-pass-chart-title = Passagem LEO: C/N0 por banda e Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20 a 80): bandas LEO em cor, GNSS em cinza

engine-leo-pass-chart-time-axis = tempo desde a época, 0 a { $s } s

engine-leo-pnt-chain-chart-subtitle = projeto do sinal -> C/N0 da passagem e jitter de código -> SISRE da mensagem -> solução de posição fusionada · { $label }

engine-leo-pnt-chain-chart-cn0-caption = C/N0 do componente rastreado ao longo da passagem (dB-Hz, 20 a 80)

engine-leo-pnt-chain-chart-not-available = n/d

engine-leo-signal-chart-title = Projetos de sinal LEO-PNT

engine-leo-signal-chart-psd-axis = deslocamento em ±0.6 × largura de banda de transmissão; 0 a −50 dB abaixo de cada pico

engine-leo-signal-chart-jitter-caption = jitter de código (m, escala logarítmica) vs C/N0 total (dB-Hz)
