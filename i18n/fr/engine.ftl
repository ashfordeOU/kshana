# SPDX-License-Identifier: AGPL-3.0-only
# fr catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = format de journal d'horloge { $other } inconnu ; l'un des formats suivants est attendu : { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = politique de lacune { $other } inconnue ; refuse, longest ou linear est attendu

engine-e-clock-log-give-either-the-log-text = indiquez soit le texte du journal, soit son chemin, pas les deux

engine-e-clock-log-clock-log-needs-its-text = un journal d'horloge nécessite son texte ou un chemin

engine-e-clock-log-tau0-must-be-finite-and = tau0_s doit être fini et > 0 (reçu : { $t })

engine-e-clock-log-units-and-data-apply-to = units et data ne s'appliquent qu'au format timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel ne s'applique qu'au format ticc

engine-e-clock-log-cannot-read-clock-log = impossible de lire le journal d'horloge { $path } : { $e }

engine-e-clock-log-clock-log-path-is-not = un chemin de journal d'horloge n'est pas disponible dans la version WebAssembly ; fournissez le journal sous forme de texte

engine-e-clock-log-the-log-has-missing-epoch =
    { $n_missing ->
        [one]
            { $n_gaps ->
                [one] le journal { $format } comporte { $n_missing } époque manquante dans { $n_gaps } lacune sur une grille de { $tau0 } s ; définissez gaps = "longest" pour conserver la plus longue séquence sans lacune ou gaps = "linear" pour interpoler
                [many] le journal { $format } comporte { $n_missing } époque manquante dans { $n_gaps } de lacunes sur une grille de { $tau0 } s ; définissez gaps = "longest" pour conserver la plus longue séquence sans lacune ou gaps = "linear" pour interpoler
               *[other] le journal { $format } comporte { $n_missing } époque manquante dans { $n_gaps } lacunes sur une grille de { $tau0 } s ; définissez gaps = "longest" pour conserver la plus longue séquence sans lacune ou gaps = "linear" pour interpoler
            }
        [many]
            { $n_gaps ->
                [one] le journal { $format } comporte { $n_missing } d'époques manquantes dans { $n_gaps } lacune sur une grille de { $tau0 } s ; définissez gaps = "longest" pour conserver la plus longue séquence sans lacune ou gaps = "linear" pour interpoler
                [many] le journal { $format } comporte { $n_missing } d'époques manquantes dans { $n_gaps } de lacunes sur une grille de { $tau0 } s ; définissez gaps = "longest" pour conserver la plus longue séquence sans lacune ou gaps = "linear" pour interpoler
               *[other] le journal { $format } comporte { $n_missing } d'époques manquantes dans { $n_gaps } lacunes sur une grille de { $tau0 } s ; définissez gaps = "longest" pour conserver la plus longue séquence sans lacune ou gaps = "linear" pour interpoler
            }
       *[other]
            { $n_gaps ->
                [one] le journal { $format } comporte { $n_missing } époques manquantes dans { $n_gaps } lacune sur une grille de { $tau0 } s ; définissez gaps = "longest" pour conserver la plus longue séquence sans lacune ou gaps = "linear" pour interpoler
                [many] le journal { $format } comporte { $n_missing } époques manquantes dans { $n_gaps } de lacunes sur une grille de { $tau0 } s ; définissez gaps = "longest" pour conserver la plus longue séquence sans lacune ou gaps = "linear" pour interpoler
               *[other] le journal { $format } comporte { $n_missing } époques manquantes dans { $n_gaps } lacunes sur une grille de { $tau0 } s ; définissez gaps = "longest" pour conserver la plus longue séquence sans lacune ou gaps = "linear" pour interpoler
            }
    }


engine-e-clock-log-the-log-yields-usable-sample = le journal { $format } fournit { $x } échantillon(s) utilisable(s) ; au moins 3 sont nécessaires

engine-e-clock-log-not-rinex-clock-file-no = pas un fichier d'horloge RINEX : aucun enregistrement END OF HEADER

engine-e-clock-log-the-rinex-clock-file-has = le fichier d'horloge RINEX ne contient aucun enregistrement AS ou AR

engine-e-clock-log-the-rinex-clock-file-holds = le fichier d'horloge RINEX contient { $many } horloges ; nommez-en une avec clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = aucun enregistrement AS ou AR pour l'horloge { $id }

engine-e-clock-log-the-clock-has-single-epoch = l'horloge n'a qu'une seule époque ; tau0 ne peut pas être déterminé

engine-e-clock-log-the-log-has-no-readings = le journal { $format } ne contient aucune mesure

engine-e-clock-log-unknown-phase-unit-expected-ms = unité de phase { $other } inconnue ; s, ms, us, ns ou ps est attendu

engine-e-clock-log-timelab-line-has-column-the = ligne TimeLab { $v1 } : { $v } colonne(s), la première ligne de données en a { $first }

engine-e-clock-log-timelab-line-has-columns-one = la ligne TimeLab { $v1 } a { $v } colonnes ; une (valeur) ou deux (temps valeur) sont lues

engine-e-clock-log-timelab-line-is-not-numeric = la ligne TimeLab { $v1 } n'est pas numérique : { $l }

engine-e-clock-log-the-timelab-log-has-no = le journal timelab ne contient aucune mesure

engine-e-clock-log-unknown-data-expected-phase-or = data { $other } inconnu ; phase ou frequency est attendu

engine-e-clock-log-tau0-header-is-not-positive = l'en-tête tau0 { $v } n'est pas un nombre positif de secondes

engine-e-clock-log-frequency-data-is-fractional-frequency = les données de fréquence sont une fréquence fractionnaire ; leur unité ne peut être que 1

engine-e-clock-log-two-column-frequency-logs-are = les journaux de fréquence à deux colonnes ne sont pas lus ; fournissez la fréquence en une seule colonne avec tau0

engine-e-clock-log-unknown-time-units-expected-or = time_units { $o } inconnu ; s ou mjd est attendu

engine-e-clock-log-the-timelab-log-time-column = la colonne de temps du journal timelab doit être croissante

engine-e-clock-log-single-reading-tau0-cannot-be = une seule mesure ; tau0 ne peut pas être déterminé

engine-e-clock-log-the-timelab-log-has-non = le journal timelab comporte { $non_finite } mesure(s) non finie(s)

engine-e-clock-log-the-ticc-log-holds-channels = le journal TICC contient les canaux { $many } ; nommez-en un avec channel = "..."

engine-e-clock-log-no-readings-on-channel-found = aucune mesure sur le canal { $channel } (trouvé : { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = les lignes TICC en mode intervalle ne portent aucun temps ; indiquez tau0_s (la période de l'événement)

engine-e-clock-log-the-readings-do-not-increase = les mesures { $channel } ne sont pas croissantes, ce ne sont donc pas des horodatages (la sortie du mode Period de TICC n'est pas lue ; utilisez le mode Timestamp)

engine-e-clock-log-single-time-stamp-tau0-cannot = un seul horodatage ; tau0 ne peut pas être déterminé

engine-e-clock-log-two-time-stamps-apart-under = deux horodatages { $channel } espacés de { $w } s, moins de la moitié de tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = les horodatages { $format } de { $clock } reculent (démon redémarré ou saut d'horloge) ; scindez le journal et lisez chaque partie

engine-e-clock-log-the-log-has-no-readings-2 = le journal ne contient aucune mesure { $what }

engine-e-clock-log-the-log-holds-sources-name = le journal contient { $many } sources ; nommez-en une avec { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = aucune mesure { $what } pour { $id } (trouvé : { $names })

engine-e-clock-log-the-servo-of-never-reached = l'asservissement de { $id } n'a jamais atteint l'état verrouillé s2

engine-e-clock-log-the-log-has-no-chrony = le journal ne contient aucune mesure de suivi chrony

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = la fréquence d'échantillonnage { $fs_hz } Hz n'est pas un nombre entier d'échantillons par milliseconde

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms et noncoherent doivent être positifs

engine-e-acquisition-the-doppler-grid-needs-positive = la grille Doppler nécessite un pas positif et un maximum non négatif

engine-e-acquisition-pfa-must-lie-in = pfa doit être compris dans (0, 1)

engine-e-acquisition-samples-supplied-needed = { $samples } échantillons fournis, { $needed } nécessaires

engine-e-acquisition-empty-doppler-grid = grille Doppler vide

engine-e-acquisition-the-samples-carry-no-power = les échantillons ne portent aucune puissance

## src/adm.rs

engine-e-adm-unknown-attitude-type = ATTITUDE_TYPE { $s } inconnu

engine-e-adm-an-aem-needs-at-least = un AEM nécessite au moins un segment

engine-e-adm-segment-is-not-version-attitude = segment { $i } : { $t } n'est pas un type d'attitude de la version { $version }

engine-e-adm-segment-values-for = segment { $i } : { $values } valeurs pour { $t }

engine-e-adm-aem-version-has-no-ndm = la version 1.0 d'AEM n'a pas de forme NDM/XML ici ; écrivez du KVN

engine-e-adm-this-attitude-type-has-no = ce type d'attitude n'a pas de forme en version 2.0

engine-e-adm-expected-meta-start-found = META_START attendu, trouvé : { $l }

engine-e-adm-meta-start-without-meta-stop = META_START sans META_STOP

engine-e-adm-unexpected-metadata-line = ligne de métadonnées { $other } inattendue

engine-e-adm-in-version-aem = { $att } dans un AEM de version { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d } : { $e }

engine-e-adm-expected-data-start-after-meta = DATA_START attendu après META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START sans DATA_STOP

engine-e-adm-empty-data-line = ligne de données vide

engine-e-adm-values-on-line = { $vals } valeurs sur une ligne { $att } : { $b }

engine-e-adm-unexpected-data-line = ligne de données { $other } inattendue

engine-e-adm-attitude-type-has-no-xml = le type d'attitude n'a pas de forme XML

engine-e-adm-message-without-version-attribute = message sans attribut de version

engine-e-adm-expected-found = { $vers_key } attendu, trouvé : { $other }

engine-e-adm-header-without-creation-date-or = en-tête sans CREATION_DATE ou ORIGINATOR

engine-e-adm-missing = { $k } manquant

engine-e-adm-unexpected-keyword = mot-clé { $k } inattendu

engine-e-adm-spin-block-holds-nutation-or = un bloc de rotation propre contient des données de nutation ou de moment cinétique, pas les deux

engine-e-adm-unexpected-apm-keyword = mot-clé APM { $other } inattendu

engine-e-adm-unexpected-apm-line = ligne APM { $b } inattendue

engine-e-adm-without = { $b } sans { $stop }

engine-e-adm-unexpected-line-in = ligne inattendue dans { $b } : { $other }

engine-e-adm-incomplete-group = groupe { $keys } incomplet

engine-e-adm-unknown-apm-block-start = bloc APM { $other }_START inconnu

engine-e-adm-apm-metadata-needs-object-name = les métadonnées APM nécessitent OBJECT_NAME, OBJECT_ID et TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM sans EPOCH

engine-e-adm-rotation-axis = axe de rotation { $o }

engine-e-adm-values-for = { $values } valeurs pour { $t }

engine-e-adm-euler-record-without-euler-rot = enregistrement d'Euler sans EULER_ROT_SEQ

engine-e-adm-rotation-sequence = séquence de rotation { $seq }

engine-e-adm-epoch-has-no = l'époque { $s } ne contient pas de 'T'

engine-e-adm-epoch-date = date d'époque { $date }

engine-e-adm-epoch-time = heure d'époque { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = « { $s } » (texte tel que l'indique le document)

engine-advanced-report-mean-5th-to-95th-percentile = moyenne { $fmt_num } (5e au 95e centile { $fmt_num2 } à { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = schéma des unités de champ : entrée units `{ $key }`

engine-advanced-report-field-units-schema-input-entry = schéma des unités de champ : entrée input `{ $key }`, appariée par nom de champ

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } ligne d'une colonne non numérique
        [many] { $n } de lignes d'une colonne non numérique
       *[other] { $n } lignes d'une colonne non numérique
    }


engine-advanced-report-rows-from-to = { $nums } lignes, de { $fmt_num } à { $fmt_num2 }

engine-advanced-report-phase-ended-by = phase { $name } (terminée par { $ended })

engine-advanced-report-result-timeline-phases = résultat `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = transfert vers la phase { $phase } : { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = résultat `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = entrée de scénario `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = commentaire du fichier de scénario, ligne { $start }

engine-advanced-report-scenario-file-comment-lines-to = commentaire du fichier de scénario, lignes { $start } à { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement } est MODELLED, et non vérifié par rapport à une référence externe indépendante : { $it }.

engine-advanced-report-sweep-of-scale = Balayage de { $param } (échelle { $str_of })

engine-e-advanced-report-the-result-document-is-not = le document de résultat n'est pas du JSON : { $e }

engine-e-advanced-report-the-scenario-is-not-toml = le scénario n'est pas du TOML : { $e }

engine-advanced-report-monte-carlo-distribution-of = Distribution Monte Carlo de { $metric }

engine-advanced-report-monte-carlo-metrics = monte_carlo.metrics.{ $name }.{ $q }

engine-advanced-report-recorded-at-build-time-from = enregistré à la compilation à partir de la variable d'environnement { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = non enregistré : ce moteur a été compilé sans la variable d'environnement { $GIT_COMMIT_ENV } ; la version du moteur identifie la publication

engine-advanced-report-kshana-animate-html = kshana { $q } --animate html

engine-advanced-report-kshana-export-all = kshana { $q } --export all

engine-advanced-report-bg-fg-muted-line-card = --bg:{ $p };--fg:{ $i };--muted:{ $m };--line:{ $r };--card:{ $c };--accent:{ $i };--val:{ $i };--mod:{ $i };--par:{ $i };

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (l'empreinte du scénario calculée par le type lui-même ; pas le condensat du fichier)

engine-advanced-report-input-file = Fichier d'entrée { $path }

engine-advanced-report-study-generated = { " " }Étude générée { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = ligne EMAG2 { $v1 } : 8 colonnes séparées par des virgules attendues, trouvé : { $p }

engine-e-altpnt-maps-emag2-line-bad = ligne EMAG2 { $v1 } : { $what } `{ $p }` invalide

engine-e-altpnt-maps-emag2-line-non-finite-value = ligne EMAG2 { $v1 } : valeur non finie

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2 : aucune ligne de données

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2 : { $rows } lignes ne remplissent pas la grille de { $n_lat } x { $n_lon } qu'elles couvrent

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2 : nœud en double à { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = le pas de grille doit être fini et positif, reçu : { $step }

engine-e-altpnt-maps-grid-box-must-have-north = la boîte de grille doit avoir nord > sud et est > ouest, reçu : [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = une grille de { $n_lat } x { $n_lon } nœuds est trop grande

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2 : l'axe { $what } nécessite au moins 2 valeurs distinctes

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2 : l'axe { $what } n'est pas régulier ({ $w } à { $w2 } pour un pas moyen de { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = le sigma d'erreur doit être fini et non négatif, reçu : { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = la longueur de corrélation doit être finie et positive, reçu : { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side doit être >= 2, reçu : { $n }

engine-e-altpnt-terrain-srtm-hgt-length = longueur SRTM .hgt { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = une fenêtre .hgt nécessite au moins 2 x 2 échantillons, reçu : { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = le pas doit être fini et positif, reçu : { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = longueur de fenêtre { "." }hgt { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt : colonne magnetic_grid `{ $other }` inconnue (utilisez "sealevel" ou "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt : impossible de lire magnetic_grid csv_path { $csv_path } : { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = format d'animation '{ $other }' inconnu ; svg, html, frames ou all est attendu

engine-e-animation-no-animation-format-given-expected = aucun format d'animation indiqué ; svg, html, frames ou all est attendu

engine-e-animation-animation-fps-must-be-between = les fps de l'animation doivent être compris entre 1 et 60, reçu : { $fps }

engine-e-animation-animation-duration-must-be-between = la durée de l'animation doit être comprise entre { $lit_0_5 } s et 600 s, reçu : { $duration_s }

engine-e-animation-animation-width-must-be-between = la largeur de l'animation doit être comprise entre 480 et 3840 pixels, reçu : { $width }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] durée x fps donne { $n } image ; la séquence d'images nécessite entre 2 et { $v1 }
        [many] durée x fps donne { $n } d'images ; la séquence d'images nécessite entre 2 et { $v1 }
       *[other] durée x fps donne { $n } images ; la séquence d'images nécessite entre 2 et { $v1 }
    }


engine-e-animation-result-is-not-json = le résultat n'est pas du JSON : { $e }

engine-animation-bg-fill-fg-fill-mu = { "." }bg{ "{" }fill:{ $bg }{ "}" }.fg{ "{" }fill:{ $fg }{ "}" }.mu{ "{" }fill:{ $mu }{ "}" }.gr{ "{" }stroke:{ $gr }{ "}" }.ax{ "{" }stroke:{ $ax }{ "}" }.ph0{ "{" }fill:{ $ph0 }{ "}" }.ph1{ "{" }fill:{ $ph1 }{ "}" }.phl{ "{" }fill:{ $phl }{ "}" }.ev{ "{" }stroke:{ $mu }{ "}" }.eva{ "{" }stroke:{ $alarm }{ "}" }.evt{ "{" }fill:{ $mu }{ "}" }.evta{ "{" }fill:{ $alarm }{ "}" }.cur{ "{" }stroke:{ $cur }{ "}" }

engine-animation-text-font-family-tr-fill = text{ "{" }font-family:{ $v1 }{ "}" }.tr{ "{" }fill:none;stroke-width:1.6;stroke-linejoin:round{ "}" }.ev,.eva{ "{" }stroke-dasharray:3 3{ "}" }.cur{ "{" }stroke-width:1.4{ "}" }

engine-animation-mission-time = temps de mission ({ $lay })

engine-animation-frame-svg = frame_{ $i }.svg

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (nécessite un ffmpeg compilé avec librsvg ; sinon, rastérisez d'abord les images)

engine-animation-bg-panel-fg-mu-grid = --bg:{ $t };--panel:{ $t2 };--fg:{ $t3 };--mu:{ $t4 };--grid:{ $t5 };--axis:{ $t6 };--ph0:{ $t7 };--ph1:{ $t8 };--cur:{ $t9 };--alarm:{ $t10 };--s0:{ $t11 };--s1:{ $t12 };--s2:{ $t13 };--s3:{ $t14 };--s4:{ $t15 };--s5:{ $t16 }

engine-animation-root-color-scheme-light-dark =
    :root{ "{" }color-scheme:light dark;{ $vars }{ "}" }
    @media (prefers-color-scheme: dark){ "{" }:root{ "{" }{ $vars2 }{ "}" }{ "}" }{ "\u000A" }

engine-animation-further-series-were-found-but = { " " }{ $omitted } autres séries ont été trouvées mais non tracées (le lecteur affiche au plus { $MAX_CHARTS } panneaux de { $MAX_TRACES } courbes) ; elles sont listées dans le manifeste de l'export frames.

## src/antenna.rs

engine-antenna-limb-capture-is-reached-on = la capture du limbe est ATTEINTE sur cette grille (altitude { $a_lo }-{ $a_hi } m x largeur de faisceau { $b_lo }-{ $b_hi } deg, { $points2 } points) : { $points } points de fonctionnement échantillonnés sur { $points2 } capturent le limbe et { $crossings } croisement(s) d'axe ont été localisé(s) ; le J/S du limbe le plus fort échantillonné est de { $limb_js_db } dB à l'altitude { $altitude_m } m / largeur de faisceau { $hpbw_deg } deg, pour un seuil de capture de { $thr } dB.

engine-antenna-limb-capture-is-not-reached = la capture du limbe n'est atteinte NULLE PART sur cette grille (altitude { $a_lo }-{ $a_hi } m x largeur de faisceau { $b_lo }-{ $b_hi } deg, { $points } points) - ce n'est pas une capture nulle, mais aucune capture du limbe : le meilleur J/S du limbe est de { $limb_js_db } dB à l'altitude { $altitude_m } m / largeur de faisceau { $hpbw_deg } deg, soit { $shortfall } dB sous le seuil de capture de { $thr } dB ; ce point de fonctionnement capturerait le limbe avec une puissance d'émission de { $limb_capture_tx_power_dbw } dBW, contre { $p_tx_dbw } dBW en vol.

engine-e-antenna-azimuths-must-strictly-increase = les azimuts doivent être strictement croissants

engine-e-antenna-azimuths-must-span-less-than = les azimuts doivent couvrir moins de 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = les angles hors axe doivent être strictement croissants

engine-e-antenna-gain-grid-does-not-match = la grille de gain ne correspond pas aux axes

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = les gains K et P doivent être finis et positifs

engine-e-aocs-at-least-three-reaction-wheels = au moins trois roues de réaction sont requises

engine-e-aocs-wheel-spin-axis-must-be = roue { $i } : l'axe de rotation doit être un vecteur unitaire

engine-e-aocs-wheel-js-and-max-must = roue { $i } : js et u_max doivent être finis et positifs

engine-e-aocs-the-wheel-spin-axes-do = les axes de rotation des roues n'engendrent pas un espace à trois dimensions

engine-e-aocs-inertia-minus-the-wheels-spin = l'inertie moins l'inertie de rotation des roues doit être définie positive

engine-e-aocs-inertia-must-be-finite-and = l'inertie doit être finie et symétrique

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis doit être un vecteur fini non nul

engine-e-aocs-kind-must-be-finite-and-positive = { $n } doit être fini et positif

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s doit donner au plus 2e6 pas

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s doit être un multiple entier de dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 et omega0_rad_s doivent être finis

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm doit être fini

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s doit être fini

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s doit être au moins égal à dt_s

engine-aocs-kind-aocs-wheels-slew-from-deg =
    { $n_w ->
        [one] aocs : { $n_w } roue, réorientation de { $duration_s } s depuis { $series_err } deg -> { $settle } | final { $final_err } deg | pic de roue { $peak_speed } rpm | { $v7 }
        [many] aocs : { $n_w } de roues, réorientation de { $duration_s } s depuis { $series_err } deg -> { $settle } | final { $final_err } deg | pic de roue { $peak_speed } rpm | { $v7 }
       *[other] aocs : { $n_w } roues, réorientation de { $duration_s } s depuis { $series_err } deg -> { $settle } | final { $final_err } deg | pic de roue { $peak_speed } rpm | { $v7 }
    }


## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = service '{ $other }' inconnu (navigation|nav ou communications|comms est attendu)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = politique d'arbitrage '{ $other }' inconnue (navigation-priority, communications-priority ou first-come-first-served est attendu)

engine-e-aperture-duty-contact-plan-needs-at-least = un plan de contacts nécessite au moins une fenêtre de contact

engine-e-aperture-duty-apertures-must-be = apertures doit être >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = l'horizon de rapport doit être fini

engine-e-aperture-duty-contact-has-non-finite-aos = le contact '{ $name }' a un aos_s ou un los_s non fini

engine-e-aperture-duty-contact-must-have-los-aos = le contact '{ $name }' doit avoir los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = un plan de contacts nécessite au moins une fenêtre [[contacts]]

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle : { $sessions } session(s) sur { $apertures } ouverture(s) sous { $policy } -> occupation navigation { $navigation_duty }, occupation communications { $communications_duty }, inactivité { $idle_duty } ; { $total_outage_s } s sur { $total_requested_s } s demandées perdues par contention (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Étude générée { $html_escape }.

engine-e-api-failed-to-serialise-report-to = échec de la sérialisation du rapport en JSON : { $e }

engine-e-api-invalid-scenario = scénario invalide : { $e }

engine-e-api-clock-log = clock_log : { $e }

engine-api-unknown-scenario-kind-did-you =
    { $n ->
        [one] type de scénario { $other } inconnu — vouliez-vous dire { $hint } ? `kshana kinds` liste le seul type intégré ({ $n }).
        [many] type de scénario { $other } inconnu — vouliez-vous dire { $hint } ? `kshana kinds` liste les { $n } de types intégrés.
       *[other] type de scénario { $other } inconnu — vouliez-vous dire { $hint } ? `kshana kinds` liste les { $n } types intégrés.
    }


engine-api-unknown-scenario-kind-kshana-kinds =
    { $n ->
        [one] type de scénario { $other } inconnu. `kshana kinds` liste le seul type intégré ({ $n }).
        [many] type de scénario { $other } inconnu. `kshana kinds` liste les { $n } de types intégrés.
       *[other] type de scénario { $other } inconnu. `kshana kinds` liste les { $n } types intégrés.
    }


engine-api-required-fields = - **Champs obligatoires :** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Champs facultatifs :** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = erreur d'analyse TOML : { $e }

engine-api-could-not-classify-scenario-kind = impossible de déterminer le type de scénario : { $e }

engine-api-missing-required-field = { $kind_name } : champ(s) obligatoire(s) manquant(s) — { $options }

engine-api-missing-required-field-2 = { $kind_name } : champ obligatoire "{ $entry }" manquant

engine-e-api-invalid-orbit-scenario = scénario d'orbite invalide : { $e }

engine-e-api-sp3-export-requires-an-orbit = l'export SP3 nécessite un scénario d'orbite, pas '{ $k }'

engine-e-api-omm-export-requires-an-orbit = l'export OMM nécessite un scénario d'orbite, pas '{ $k }'

engine-e-api-oem-export-requires-an-orbit = l'export OEM nécessite un scénario d'orbite, pas '{ $k }'

engine-e-api-invalid-scenario-toml = TOML de scénario invalide : { $e }

engine-e-api-could-not-re-serialise-scenario = impossible de resérialiser le scénario : { $e }

engine-api-scenario-jamming-availability-under-jamming = scénario { $r } | brouillage { $v2 } | disponibilité sous brouillage { $availability_under_jamming } (nominale { $availability_nominal }) | suivi min. { $min_tracking } | J/S moyen { $v6 }

engine-e-api-the-result-document-already-carries = le document de résultat contient déjà `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = échec de la sérialisation de figure_tiers : { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = scénario { $label } invalide : { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = scénario { $r } | holdover quantique { $holdover_s }s p95 { $pos_p95_m }m | holdover classique { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = scénario { $r } | leurrage { $scn } contre spéc. { $threshold_ns } ns (P_fa { $target_pfa }) | sécurité quantique { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | sécurité classique { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] intégrité | { $n_sats } satellite | { $samples_available }/{ $samples_total } époques disponibles ({ $report } %) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V) : { $report2 } événements d'intégrité, { $report3 } HMI
        [many] intégrité | { $n_sats } de satellites | { $samples_available }/{ $samples_total } époques disponibles ({ $report } %) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V) : { $report2 } événements d'intégrité, { $report3 } HMI
       *[other] intégrité | { $n_sats } satellites | { $samples_available }/{ $samples_total } époques disponibles ({ $report } %) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V) : { $report2 } événements d'intégrité, { $report3 } HMI
    }


engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | pôle Sud | { $samples_available }/{ $samples_total } époques disponibles ({ $report } %) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | taux séculaire LTC−TT { $secular_rate_us_per_day } µs/day (bande { $band_low }–{ $band_high }) | potentiel propre { $self_potential_us_per_day } cinétique { $kinetic_us_per_day } | décalage @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | base { $baseline_km } km | distance de la balise { $beacon_range_km } km | délai { $report } µs (taux { $delay_rate_s_per_s } s/s) | champ proche { $near_field_correction_us } µs | { $samples } échantillons sur { $horizon_hours } h

engine-api-builtins-lunar-joint-od-clock-sats =
    { $n_sat ->
        [one]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satellite, { $n_earth } station terrestre | erreur 3-D de station avec VLBI { $station_pos_err_m } m contre distance seule { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× plus net) | position du satellite RMS { $sat_pos_rms_m } m | erreur d'horloge de station { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } paramètres
                [many] lunar-joint-od-clock | { $n_sat } satellite, { $n_earth } de stations terrestres | erreur 3-D de station avec VLBI { $station_pos_err_m } m contre distance seule { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× plus net) | position du satellite RMS { $sat_pos_rms_m } m | erreur d'horloge de station { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } paramètres
               *[other] lunar-joint-od-clock | { $n_sat } satellite, { $n_earth } stations terrestres | erreur 3-D de station avec VLBI { $station_pos_err_m } m contre distance seule { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× plus net) | position du satellite RMS { $sat_pos_rms_m } m | erreur d'horloge de station { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } paramètres
            }
        [many]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } de satellites, { $n_earth } station terrestre | erreur 3-D de station avec VLBI { $station_pos_err_m } m contre distance seule { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× plus net) | position du satellite RMS { $sat_pos_rms_m } m | erreur d'horloge de station { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } paramètres
                [many] lunar-joint-od-clock | { $n_sat } de satellites, { $n_earth } de stations terrestres | erreur 3-D de station avec VLBI { $station_pos_err_m } m contre distance seule { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× plus net) | position du satellite RMS { $sat_pos_rms_m } m | erreur d'horloge de station { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } paramètres
               *[other] lunar-joint-od-clock | { $n_sat } de satellites, { $n_earth } stations terrestres | erreur 3-D de station avec VLBI { $station_pos_err_m } m contre distance seule { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× plus net) | position du satellite RMS { $sat_pos_rms_m } m | erreur d'horloge de station { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } paramètres
            }
       *[other]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satellites, { $n_earth } station terrestre | erreur 3-D de station avec VLBI { $station_pos_err_m } m contre distance seule { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× plus net) | position du satellite RMS { $sat_pos_rms_m } m | erreur d'horloge de station { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } paramètres
                [many] lunar-joint-od-clock | { $n_sat } satellites, { $n_earth } de stations terrestres | erreur 3-D de station avec VLBI { $station_pos_err_m } m contre distance seule { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× plus net) | position du satellite RMS { $sat_pos_rms_m } m | erreur d'horloge de station { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } paramètres
               *[other] lunar-joint-od-clock | { $n_sat } satellites, { $n_earth } stations terrestres | erreur 3-D de station avec VLBI { $station_pos_err_m } m contre distance seule { $station_pos_err_m2 } m ({ $station_observability_improvement_factor }× plus net) | position du satellite RMS { $sat_pos_rms_m } m | erreur d'horloge de station { $station_clock_err_s } s | obs. { $n_obs }/{ $n_params } paramètres
            }
    }


engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } point | erreur de translation { $trans_err_norm_m } m, erreur de rotation { $rot_err_norm_rad } rad, erreur d'échelle { $scale_err_ppb } ppb | résidu RMS { $rms_residual_m } m | convergé { $converged }
        [many] lunar-frame-realisation | { $n_points } de points | erreur de translation { $trans_err_norm_m } m, erreur de rotation { $rot_err_norm_rad } rad, erreur d'échelle { $scale_err_ppb } ppb | résidu RMS { $rms_residual_m } m | convergé { $converged }
       *[other] lunar-frame-realisation | { $n_points } points | erreur de translation { $trans_err_norm_m } m, erreur de rotation { $rot_err_norm_rad } rad, erreur d'échelle { $scale_err_ppb } ppb | résidu RMS { $rms_residual_m } m | convergé { $converged }
    }


engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | { $n_sats } satellites ({ $geometry_label }) | { $n_grid_points } points × { $n_epochs } époques | couverture { $coverage_pct } % (PDOP<{ $pdop_threshold }) | satellites { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | disponibilité PL { $pl_availability_pct } % | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| éphéméride { $report } ({ $provenance }) σ_URE requis { $fmt } contre képlérien { $fmt2 } contre perturbé { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-differential-pnt-sats-illustrative =
    { $n_sats ->
        [one] lunar-differential-pnt | { $n_sats } satellite (illustratif, de classe LCNS, sans affiliation) | base { $baseline_km } km | erreur utilisateur { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (réduction ×{ $reduction_factor }) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
        [many] lunar-differential-pnt | { $n_sats } de satellites (illustratifs, de classe LCNS, sans affiliation) | base { $baseline_km } km | erreur utilisateur { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (réduction ×{ $reduction_factor }) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
       *[other] lunar-differential-pnt | { $n_sats } satellites (illustratifs, de classe LCNS, sans affiliation) | base { $baseline_km } km | erreur utilisateur { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (réduction ×{ $reduction_factor }) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
    }


engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } points x { $n_epochs } époques x { $n_trials } essais | disponibilité { $v4 } % | couverture { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | corrigé p{ $percentile } 3-D { $f } (non corrigé { $f2 }) | HPL max. { $f3 } | MODELLED ; aucune affirmation sur un système réel

engine-api-builtins-terrain-horizon-at-the-station = { " " }| horizon du terrain ({ $sources }) à la station max. { $horizon_max_deg } deg, points utilisateur moyenne des max. { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame =
    { $n_states ->
        [one]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } état, OEM { $oem_line_count } ligne | contrôle de format { $v5 } ({ $present_fields } présent(s) / { $missing_fields } manquant(s)) | aller-retour OEM { $v8 } | aller-retour des méta-temps { $v9 } | KIF { $kif_bytes } bytes | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } état, OEM { $oem_line_count } de lignes | contrôle de format { $v5 } ({ $present_fields } présent(s) / { $missing_fields } manquant(s)) | aller-retour OEM { $v8 } | aller-retour des méta-temps { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } état, OEM { $oem_line_count } lignes | contrôle de format { $v5 } ({ $present_fields } présent(s) / { $missing_fields } manquant(s)) | aller-retour OEM { $v8 } | aller-retour des méta-temps { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
        [many]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } d'états, OEM { $oem_line_count } ligne | contrôle de format { $v5 } ({ $present_fields } présent(s) / { $missing_fields } manquant(s)) | aller-retour OEM { $v8 } | aller-retour des méta-temps { $v9 } | KIF { $kif_bytes } bytes | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } d'états, OEM { $oem_line_count } de lignes | contrôle de format { $v5 } ({ $present_fields } présent(s) / { $missing_fields } manquant(s)) | aller-retour OEM { $v8 } | aller-retour des méta-temps { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } d'états, OEM { $oem_line_count } lignes | contrôle de format { $v5 } ({ $present_fields } présent(s) / { $missing_fields } manquant(s)) | aller-retour OEM { $v8 } | aller-retour des méta-temps { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
       *[other]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } états, OEM { $oem_line_count } ligne | contrôle de format { $v5 } ({ $present_fields } présent(s) / { $missing_fields } manquant(s)) | aller-retour OEM { $v8 } | aller-retour des méta-temps { $v9 } | KIF { $kif_bytes } bytes | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } états, OEM { $oem_line_count } de lignes | contrôle de format { $v5 } ({ $present_fields } présent(s) / { $missing_fields } manquant(s)) | aller-retour OEM { $v8 } | aller-retour des méta-temps { $v9 } | KIF { $kif_bytes } bytes | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } états, OEM { $oem_line_count } lignes | contrôle de format { $v5 } ({ $present_fields } présent(s) / { $missing_fields } manquant(s)) | aller-retour OEM { $v8 } | aller-retour des méta-temps { $v9 } | KIF { $kif_bytes } bytes | MODELLED
            }
    }


engine-api-builtins-scenario-optical-sync-rms-ps = scénario { $r } | optique sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | chaîne quantique { $quantum_chain_sigma_s }s contre classique { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | sécurité Pd { $security_pd } (Pfa { $monitor_pfa }) | anomalie Pd { $anomaly_pd } | arbitrage, victoires du quantique { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | interruption { $outage_s }s | erreur de position quantique { $quantum_pos_err_m } m contre classique { $classical_pos_err_m } m ({ $improvement_x }x) | holdover quantique { $quantum_holdover_s }s contre classique { $classical_holdover_s }s (seuil { $threshold_m } m) | arbitrage, victoires du quantique { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC quantique { $quantum_auc } contre classique { $classical_auc } | défaut minimal détectable quantique { $quantum_min_detectable } contre classique { $classical_min_detectable } | { $fault_catalog } classes de défauts | arbitrage, victoires du quantique { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] ne s'applique qu'au type fusion

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = scénario { $r } | holdover PNT quantique { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) intégrité { $integ } sécurité { $security_na } | holdover PNT classique { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) intégrité { $integ2 } sécurité { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = scénario { $r } | fusionné | holdover PNT quantique { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) intégrité { $integ } sécurité { $security_na } | holdover PNT classique { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) intégrité { $integ2 } sécurité { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = scénario { $r } | hybrid-ukf (17 états, MODELLED) | capteur { $v2 } (q_va { $effective_q_va }) | horloge q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } dans [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } dans [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | assisté { $aided_pos_rms_m }m -> en roue libre { $coast_end_pos_rms_m }m sur { $coast_duration_s }s | auto-cohérence, pas exactitude

engine-api-builtins-scenario-gnss-ins-quantum-outage = scénario { $r } | gnss-ins | RMS d'interruption quantique fusionné { $fused_outage_rms_m }m contre libre { $free_outage_rms_m }m (hold { $holdover_s }s, disp. { $availability }) | classique fusionné { $fused_outage_rms_m2 }m contre libre { $free_outage_rms_m2 }m (hold { $holdover_s2 }s, disp. { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = scénario { $r } | gnss-sim | iono moyenne { $mean_iono_m }m tropo { $mean_tropo_m }m | disp. RAIM { $raim_availability } HPL moyen { $mean_hpl_m }m VPL moyen { $mean_vpl_m }m taux de défaut { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = scénario { $r } | spoof-detect | { $n_sats } SV, +{ $power_advantage_db } dB{ $v4 } | poussée { $push } | score fusionné { $score } (seuil { $fusion_threshold }) | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = balayage { $metric } sur { $parameter } ({ $first }..{ $last }, { $points } pts, échelle { $scale }) | quantique { $first2 }->{ $last2 } | classique { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = scénario { $r } | { $nominal }/{ $series } échantillons GNSS nominal | meilleur PDOP { $fnum } pos. { $posm } | holdover quantique { $holdover_s }s p95 { $ns1 }ns intégrité { $integ } sécurité { $security_na } | holdover classique { $holdover_s2 }s p95 { $ns12 }ns intégrité { $integ2 } sécurité { $security_na }

engine-e-api-builtins-ephemeris = éphéméride : { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| él. max. { $el }° pic Doppler { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] scénario { $r } | { $source } | { $n_samples } échantillon | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | vitesse { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
        [many] scénario { $r } | { $source } | { $n_samples } d'échantillons | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | vitesse { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] scénario { $r } | { $source } | { $n_samples } échantillons | alt. { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | vitesse { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }


engine-api-builtins-generic-sweep-of-over-nodes = balayage générique de `{ $kind }` sur [{ $keys }] | { $points } nœuds (forme { $shape }) | métriques [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | dérive inertielle libre { $free_inertial_drift_m } m | recalage gravimétrique { $map_matched_error_m } m | sigma d'appariement { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| degré de référence { $reference_nmax } écart-type d'anomalie { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| erreur de carte MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 } % à moins de { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | dérive inertielle libre { $free_inertial_drift_m } m | recalage sur le terrain { $matched_error_m } m ({ $v3 }x de réduction) | sigma d'appariement { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | { $waypoints } points de passage | RMS inertiel libre { $free_inertial_rms_m } m (final { $free_inertial_final_m } m) | RMS avec recalage sur le terrain { $matched_rms_m } m (final { $matched_final_m } m, { $v6 }x de réduction) | ESS moyen { $mean_ess }/{ $cfg } | sigma d'appariement { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | dérive inertielle libre { $free_inertial_drift_m } m | gravité { $gravity_only_m } m magnétique { $magnetic_only_m } m terrain { $terrain_only_m } m | FUSIONNÉ { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] nécessite runs = 1 : un journal mesuré est un seul enregistrement

engine-api-builtins-scenario-runs-quantum-holdover-p95 = scénario { $r } | { $runs } exécutions | holdover quantique { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns sécurité { $security_na } | holdover classique { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns sécurité { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = scénario { $r } | holdover quantique { $holdover_s }s p95 { $ns1 }ns intégrité { $integ } sécurité { $security_na } | holdover classique { $holdover_s2 }s p95 { $ns12 }ns intégrité { $integ2 } sécurité { $security_na }

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one]
            { $n_alarm ->
                [one] { " " }| RAIM disponible { $n_available } sur { $n_epochs } époque ({ $n_denied } refusées, { $n_alarm } alarme ; MODELLED)
                [many] { " " }| RAIM disponible { $n_available } sur { $n_epochs } époque ({ $n_denied } refusées, { $n_alarm } d'alarmes ; MODELLED)
               *[other] { " " }| RAIM disponible { $n_available } sur { $n_epochs } époque ({ $n_denied } refusées, { $n_alarm } alarmes ; MODELLED)
            }
        [many]
            { $n_alarm ->
                [one] { " " }| RAIM disponible { $n_available } sur { $n_epochs } d'époques ({ $n_denied } refusées, { $n_alarm } alarme ; MODELLED)
                [many] { " " }| RAIM disponible { $n_available } sur { $n_epochs } d'époques ({ $n_denied } refusées, { $n_alarm } d'alarmes ; MODELLED)
               *[other] { " " }| RAIM disponible { $n_available } sur { $n_epochs } d'époques ({ $n_denied } refusées, { $n_alarm } alarmes ; MODELLED)
            }
       *[other]
            { $n_alarm ->
                [one] { " " }| RAIM disponible { $n_available } sur { $n_epochs } époques ({ $n_denied } refusées, { $n_alarm } alarme ; MODELLED)
                [many] { " " }| RAIM disponible { $n_available } sur { $n_epochs } époques ({ $n_denied } refusées, { $n_alarm } d'alarmes ; MODELLED)
               *[other] { " " }| RAIM disponible { $n_available } sur { $n_epochs } époques ({ $n_denied } refusées, { $n_alarm } alarmes ; MODELLED)
            }
    }


## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = un cas de référence nécessite au moins un satellite

engine-e-araim-reference-reference-case-needs-at-least-2 = un cas de référence nécessite au moins une constellation

engine-e-araim-reference-satellite-names-constellation-but-only = le satellite { $i } nomme la constellation { $constellation } mais seules { $constellations } sont déclarées

engine-e-araim-reference-satellite-has-non-positive-error = le satellite { $i } a une variance d'erreur non positive

engine-e-araim-reference-both-integrity-risk-allocations-must = les deux allocations de risque d'intégrité doivent être positives

engine-e-araim-reference-this-reference-implementation-monitors-single = cette implémentation de référence ne surveille que les modes de défaut à événement unique, mais les a priori du cas exigent N_fault,max = { $nfm } (sous-ensembles d'événements multiples simultanés). Exécution refusée plutôt qu'un sous-dénombrement des modes de défaut.

engine-e-araim-reference-the-all-in-view-geometry = la géométrie avec tous les satellites en vue est singulière

engine-e-araim-reference-no-fault-mode-is-observable = aucun mode de défaut n'est observable sur cette géométrie

engine-e-araim-reference-unknown-reference-vector-known-vectors = vecteur de référence '{ $vector }' inconnu ; vecteurs connus : { $ids } (ou 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check : { $wanted } vecteur(s) de référence WG-C publié(s) ; pire concordance VPL/HPL { $worst_acceptance } m par rapport à la TOL_PL propre à la référence = { $tol } m sur { $acceptance_checked } vecteur(s) de recette

engine-e-araim-reference-sat-needs-one-value-per = P_sat nécessite une valeur par satellite et P_const une par constellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation = un satellite nomme une constellation non déclarée

engine-e-araim-reference-every-prior-must-lie-in = chaque a priori doit être compris dans [0, 1)

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] les a priori nécessitent des sous-ensembles de { $n_fault_max } événement simultané ; ce chemin en énumère au plus { $most }
        [many] les a priori nécessitent des sous-ensembles de { $n_fault_max } d'événements simultanés ; ce chemin en énumère au plus { $most }
       *[other] les a priori nécessitent des sous-ensembles de { $n_fault_max } événements simultanés ; ce chemin en énumère au plus { $most }
    }


engine-e-araim-reference-the-all-in-view-solution = la solution avec tous les satellites en vue n'a pas été sélectionnée

engine-e-araim-reference-an-add-v4-case-needs = un cas ADD v4.2 nécessite des satellites et des constellations

engine-e-araim-reference-nom-and-sat-need-one = b_nom et P_sat nécessitent une valeur par satellite

engine-e-araim-reference-const-needs-one-value-per = P_const nécessite une valeur par constellation

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = le satellite { $i } nomme une constellation non déclarée

engine-e-araim-reference-one-constellation-index-per-satellite = un indice de constellation par satellite

engine-e-araim-reference-satellite-names-constellation-with-no = le satellite { $i } nomme la constellation { $c } sans ISM

engine-e-araim-reference-fewer-than-four-satellites-above = moins de quatre satellites au-dessus du masque

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m doit contenir au moins une distance d'éloignement

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (bande { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | leurrage@{ $value } m { $nearest } W | empreinte { $a2 } % capt., limbe { $footprint_limb_captured } | capture par leurrage { $spoof_captured } (verrouillage { $spoof_lock_time_s } s) | portée du mât { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 } % de 50 bit/s), latence { $nma_auth_latency_s } s

engine-attack-surface-reached-crossing-best-db = atteinte ({ $crossings } croisement(s), meilleur { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = NON atteinte sur cette grille (meilleur { $best_limb_js_db } dB, { $best_limb_shortfall_db } dB en dessous ; nécessite { $best_limb_capture_tx_power_dbw } dBW contre { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| balayage d'empreinte { $s }x{ $s2 } (alt. { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), capture { $v5 }-{ $v6 } % | limbe { $limb }

engine-attack-surface-afs-received-dbw = AFS reçu : { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Déficit : { $deficit_db } dB (bande { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Empreinte de capture : { $a } % du disque, limbe capturé : { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Accrochage par leurrage : { $spoof_captured } (verrouillage { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Portée du mât : { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 } %)

engine-attack-surface-limb-captured-on-grid-crossing = Limbe : capturé sur la grille { $na }x{ $nb }, { $crossings } croisement(s)

engine-attack-surface-limb-not-captured-on-grid = Limbe : non capturé sur la grille { $na }x{ $nb } ; nécessite { $best_limb_capture_tx_power_dbw } dBW (en vol { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km doit être fini et positif

engine-e-attitude-budget-inertias-must-be-finite-and = les inerties doivent être finies et positives

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 doit être >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = au moins un contributeur de pointage est requis

engine-e-attitude-budget-contributor-sigma-must-be-finite = le sigma du contributeur '{ $name }' doit être fini et >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget : { $altitude_km } km, ΔI { $delta_i } kg·m² -> couple GG { $t_gg } N·m ; pointage { $total }" RSS (dominant : { $dominant }) (budget scalaire MODELLED)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } nécessite une valeur

engine-bench-cli-unknown-option = option `{ $a }` inconnue

engine-bench-cli-unexpected-argument = argument `{ $pos }` inattendu

engine-bench-cli-cannot-read = impossible de lire { $p } : { $e }

engine-bench-cli-cannot-create = impossible de créer { $d } : { $e }

engine-bench-cli-cannot-write = impossible d'écrire { $p } : { $e }

engine-bench-cli-unknown-task-or = tâche `{ $t }` inconnue (a, b, c ou d)

engine-bench-cli-scored-epochs-in-folder = { $labels } époques notées dans { $folders } dossier(s)

engine-bench-cli-wrote-cases-json-and-truth = { $out }/cases.json et { $out }/truth.json écrits

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED : cet engagement est provisoire et sa graine a été exposée ; ce n'est pas un jeu réservé de publication

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH : la graine n'est pas celle qui correspond à cet engagement

engine-bench-cli-is-not-json = { $f } n'est pas du JSON : { $e }

engine-bench-cli-cannot-read-2 = impossible de lire { $i } : { $e }

engine-bench-cli-result-rendered = { $results } résultat(s) rendu(s)

engine-bench-cli-unknown-subcommand =
    sous-commande `{ $other }` inconnue
    { $BENCH_USAGE }

engine-bench-cli-predictions-json = { $stem }.predictions.json

engine-bench-cli-result-json = { $stem }.result.json

engine-bench-cli-cannot-create-an-existing-seed = impossible de créer { $path } (un fichier de graine existant n'est jamais écrasé) : { $e }

engine-bench-cli-cannot-write-2 = impossible d'écrire { $path } : { $e }

engine-bench-cli-seed-written-to-keep-it = graine écrite dans { $path } : gardez-la hors du contrôle de version et hors de tout message ; seul le condensat ci-dessous est public

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (reporté, non réexécuté)

engine-bench-cli-truth-json = a-{ $split }.truth.json

engine-bench-cli-truth-json-2 = c-{ $split }.truth.json

engine-bench-cli-truth-json-3 = d-{ $split }.truth.json

engine-bench-cli-impairment-eval-baseline = référence de base impairment-eval : { $det }

engine-bench-cli-no-scenario-json-under = aucun scenario.json sous { $root }

engine-bench-cli-is-not-json-2 = { $path } n'est pas du JSON : { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = { $ok } ok, { $bad } discordant(s), { $missing } manquant(s), { $unpinned } non épinglé(s)

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = partition `{ $other }` inconnue (dev, test ou holdout)

engine-bench-score-for-is-not-finite = le score de `{ $id }` n'est pas fini

engine-bench-case-have-no-score-the = { $missing } cas sans score, le premier est `{ $first_missing }`

engine-bench-predictions-name-case-that-is = les prédictions nomment un cas qui n'est pas dans la vérité terrain : `{ $extra }`

engine-bench-schema-must-be = `schema` doit être `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` doit être un SHA-256 hexadécimal de 64 chiffres

engine-bench-truth-is-not-json = la vérité terrain n'est pas du JSON : { $e }

engine-bench-predictions-are-not-json = les prédictions ne sont pas du JSON : { $e }

engine-bench-truth-schema-must-be = le `schema` de la vérité terrain doit être `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = le `schema` des prédictions doit être `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = la vérité terrain a été établie sous une autre version de la spécification que { $SPEC_VERSION } ; les résultats de versions majeures différentes ne sont jamais mélangés

engine-bench-unknown-task = tâche `{ $other }` inconnue

## src/bench/site.rs

engine-bench-site-result-is-not-valid = le résultat { $v1 } n'est pas valide : { $p }

engine-bench-site-result-is-task-holdout-result = le résultat { $v1 } est un résultat de jeu réservé de la tâche (d) sans `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = le résultat { $v1 } est noté sur une graine de jeu réservé provisoire et exposée : ce n'est pas un jeu réservé de publication

engine-bench-site-result-was-scored-under-this = le résultat { $v1 } a été noté sous { $v } ; cette page concerne { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = le score de `{ $k }` n'est pas un nombre

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (statistique de surveillance par défaut { $lit_0_35 })

engine-bench-tasks-malformed-clock-line = ligne d'horloge `{ $line }` mal formée

engine-bench-tasks-the-clock-file-does-not = le fichier d'horloge ne correspond pas au SHA-256 épinglé (obtenu { $got }, attendu { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = le satellite { $prn } n'est pas dans le fichier d'horloge

engine-bench-tasks-kshana-bench-baseline = référence de base kshana-bench : { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = les prédictions couvrent { $pmap } cas, la vérité terrain en a { $tarr }

engine-bench-tasks-case-has-no-number-array = le cas `{ $id }` n'a pas de tableau de nombres

engine-bench-tasks-case-needs-values-has =
    { $n ->
        [one] le cas `{ $id }` nécessite { $n } valeur, en a { $a }
        [many] le cas `{ $id }` nécessite { $n } de valeurs, en a { $a }
       *[other] le cas `{ $id }` nécessite { $n } valeurs, en a { $a }
    }


engine-bench-tasks-case-has-non-finite-value = le cas `{ $id }` a une valeur non finie

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = sérialisation de { $name } : { $e }

engine-e-bin-crossover-study-write = écriture de { $path } : { $e }

engine-bin-crossover-study-error-cannot-create = erreur : impossible de créer { $dir } : { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = terminé : inertiel { $nodes } nœuds, horloge { $curves } courbes (graine 42)

## src/bin/gen_araim_m3_study.rs

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } époque utilisateur x 3 valeurs d'URA en { $dt } s = { $v1 } ms par époque utilisateur ({ $ok } résoluble(s))
        [many] { $n } d'époques utilisateur x 3 valeurs d'URA en { $dt } s = { $v1 } ms par époque utilisateur ({ $ok } résoluble(s))
       *[other] { $n } époques utilisateur x 3 valeurs d'URA en { $dt } s = { $v1 } ms par époque utilisateur ({ $ok } résoluble(s))
    }


## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = docs/INTEROP.md écrit (table d'export)

## src/bin/validation_report.rs

engine-bin-validation-report-body-font-14px-background-var = body{ "{" }font:14px/1.5 { $v1 };background:var(--bg);color:var(--fg);max-width:64rem;margin:2rem auto;padding:0 1rem{ "}" }h1{ "{" }font-size:1.5rem;margin:0 0 .25rem{ "}" }.sub{ "{" }color:var(--muted);margin:0 0 1.5rem{ "}" }table{ "{" }border-collapse:collapse;width:100%{ "}" }th,td{ "{" }border:1px solid var(--line);padding:.5rem .6rem;text-align:left;vertical-align:top{ "}" }th{ "{" }background:var(--card){ "}" }code{ "{" }font-size:.85em{ "}" }.ok{ "{" }color:var(--val);font-weight:600{ "}" }footer{ "{" }margin-top:1.5rem;color:var(--muted);font-size:.85em{ "}" }@media print{ "{" }body{ "{" }margin:0;max-width:none{ "}" }a{ "{" }color:inherit;text-decoration:none{ "}" }{ "}" }{ "\u000A" }

engine-bin-validation-report-wrote-validation-summary-to = synthèse de vérification écrite dans { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = corps '{ $body_name }' inconnu

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt navigue autour d'un corps autre que la Terre avec une liaison Terre ; { $name } n'est pas pris en charge ici

engine-e-body-pnt-duration-and-step-must-be = duration_s et step_s doivent être positifs, avec au plus 20000 époques ; reçu { $duration } et { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind doit être orbiter ou surface ; reçu '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = l'altitude de l'utilisateur doit être positive et l'excentricité dans [0, { $lit_0_9 })

engine-e-body-pnt-the-user-orbit-periapsis-is = le périapse de l'orbite de l'utilisateur est sous la surface

engine-e-body-pnt-constellation-needs-to-200-satellites = la constellation nécessite de 1 à 200 satellites dans au moins un plan

engine-e-body-pnt-constellation-altitude-must-be-positive = l'altitude de la constellation doit être positive

engine-e-body-pnt-range-sigmas-must-be-positive = les sigmas de distance doivent être positifs

engine-e-body-pnt-no-earth-position-relative-to = aucune position de la Terre relative à { $name } à JD { $jd }

engine-e-body-pnt-serialising-report = sérialisation du rapport : { $e }

engine-e-body-pnt-the-report-must-serialise-to = le rapport doit se sérialiser en un objet JSON

engine-body-pnt-positioning-around-user-relays-at =
    Positionnement autour de { $name } — utilisateur { $user_kind }, { $n_relays } relais à { $r } km, { $n_epochs } époques
    { "  " }Temps de lumière Terre { $one_way_light_time_s } s aller simple, { $two_way_light_time_s } s aller-retour ; angle Soleil-Terre-corps { $sun_separation_deg } deg
    { "  " }disponibilité : { $availability_relays } constellation seule, { $availability_with_earth } avec la distance Terre (Terre en vue { $earth_visibility })
    { "  " }PDOP médian { $opt } ; erreur RMS { $opt2 } constellation seule, { $opt3 } avec la distance Terre
    { "  " }sigma formel médian { $opt4 } constellation seule, { $opt5 } avec la distance Terre{ "\u000A" }

engine-body-pnt-positioning-around = Positionnement autour de { $name }

engine-body-pnt-user-relays-earth-light-time = utilisateur { $user_kind } · { $n_relays } relais · temps de lumière Terre { $one_way_light_time_s } s · MODELLED

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = le scénario E1 n'est pas une table

engine-e-calibration-ensembles-e1-scenario-has-no-monte = le scénario E1 n'a pas de [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1 : final_error.{ $k } manquant

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 est `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ensembles de 200 réalisations chacun, comparés à la forme fermée : moyenne 0, sigma = { $sigma } ns. L'ensemble j utilise la graine de base 1 000 000 + 1000 j et la graine de bootstrap 20260928 + j. L'erreur relative maximale d'ADEV était de { $max } pour E2 et de { $max2 } pour E3 (sur 1, 10 et 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = chemin de résultat vide

engine-e-campaign-result-path-has-an-empty = le chemin de résultat `{ $path }` a un segment vide

engine-e-campaign-result-path-bad-index-in = chemin de résultat `{ $path }` : indice incorrect dans `{ $part }`

engine-e-campaign-result-path-no-field = chemin de résultat `{ $path }` : aucun champ `{ $name }`

engine-e-campaign-result-path-indexed-value-is = chemin de résultat `{ $path }` : la valeur indexée n'est pas un tableau

engine-e-campaign-result-path-index-out-of = chemin de résultat `{ $path }` : indice { $i } hors limites ({ $n })

engine-e-campaign-result-path-value-is-not = chemin de résultat `{ $path }` : la valeur n'est ni un nombre ni un indicateur

engine-e-campaign-result-path-is-not-an = chemin de résultat `{ $path }` : `{ $k }` n'est pas un tableau

engine-e-campaign-result-path-must-name-one = le chemin de résultat `{ $path }` doit désigner une seule valeur, et non des lignes

engine-e-campaign-result-path-is-not-an-2 = chemin de résultat `{ $path }` : `{ $name }` n'est pas un tableau

engine-e-campaign-metric-path-has-no-entry = le chemin de métrique `{ $path }` n'a aucune entrée dans le bloc units de ce type ; déclarez son `unit` dans la campagne

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` doit être non vide et ne contenir que des lettres, des chiffres, `_` ou `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label } : une campagne ne peut pas contenir une campagne

engine-e-campaign-serialise = { $label } : sérialisation : { $e }

engine-e-campaign-result-did-not-parse = { $label } : le résultat n'a pas pu être analysé : { $e }

engine-e-campaign-seed-key-no-field-in = clé de graine `{ $key }` : aucun champ `{ $part }` dans le scénario

engine-e-campaign-seed-key-is-not-non = la clé de graine `{ $key }` n'est pas un entier non négatif

engine-e-campaign-seed-does-not-fit-toml = la graine { $seed } ne tient pas dans un entier TOML

engine-campaign-series-error-ns = { $side }.series[].error_ns

engine-campaign-series-offset-ns = { $side }.series[].offset_ns

engine-campaign-detect-time = { $side }.detect_time_s

engine-campaign-series-error = { $side }.series[].error_m

engine-campaign-time-path-must-name-rows = le chemin de temps `{ $t }` doit désigner des lignes avec `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` n'est pas below, above ou abs_above

engine-campaign-threshold-is-null = le seuil `{ $p }` est nul

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` n'est pas mean, min, max ou count

engine-campaign-time-path-gives-several-values = le chemin de temps `{ $t }` donne plusieurs valeurs par ligne

engine-campaign-value-path-has-fewer-rows = le chemin de valeur `{ $y }` a moins de lignes que `{ $t }`

engine-campaign-value-path-has-rows-time = le chemin de valeur `{ $y }` a { $r } lignes, le chemin de temps `{ $t }` en a { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = une campagne avec phases nécessite un [timeline] avec step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s doit être positif, reçu : { $step }

engine-e-campaign-phase-is-named-twice = la phase `{ $name }` est nommée deux fois

engine-e-campaign-phase-duration-must-be-non = phase `{ $name }` : duration_s doit être non négatif

engine-e-campaign-phase-has-no-runs = la phase `{ $name }` n'a aucune exécution

engine-e-campaign-phase-the-first-phase-has = phase `{ $name }` : la première phase n'a rien à transférer

engine-e-campaign-phase-handoff-from-channel-which = phase `{ $name }` : transfert depuis le canal `{ $ch }`, que la phase précédente n'avait pas à sa fin

engine-e-campaign-phase-handoff-from-run-does = phase `{ $name }` : le transfert from_run { $from_run } n'existe pas

engine-e-campaign-phase-handoff-is-null = phase `{ $name }` : le transfert `{ $from }` est nul

engine-e-campaign-phase-handoff-run-does-not = phase `{ $name }` : l'exécution { $run } du transfert n'existe pas

engine-e-campaign-phase = phase `{ $name }` : { $e }

engine-campaign-phase-run = phase { $name }/exécution { $ri }

engine-e-campaign-phase-end-at-run-does = phase `{ $name }` : end_at_run { $end_at_run } n'existe pas

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s est postérieur)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } est nul)

engine-e-campaign-phase-side-is-not-classical = phase `{ $name }` : le côté `{ $side }` n'est pas classical ou quantum

engine-e-campaign-phase-skip-must-be-non = phase `{ $name }` : skip_s doit être non négatif

engine-e-campaign-phase-alarm-compare-is-not = phase `{ $name }` : le compare d'alarme `{ $compare }` n'est pas below, above ou abs_above

engine-e-campaign-phase-alarm-threshold-is-null = phase `{ $name }` : le seuil d'alarme `{ $p }` est nul

engine-e-campaign-phase-channel-is-in-not = phase `{ $name }` : le canal `{ $channel }` est en { $u }, et non en { $du }

engine-e-campaign-phase-channel-needs-unit = phase `{ $name }` : le canal `{ $channel }` nécessite une unité

engine-e-campaign-phase-two-runs-both-provide = phase `{ $name }` : deux exécutions fournissent toutes deux le canal `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = la phase `{ $name }` transporte `{ $ch }`, que la phase précédente n'avait pas à sa fin

engine-e-campaign-phase-carries-but-no-run = la phase `{ $name }` transporte `{ $ch }` mais aucune de ses exécutions ne fournit `{ $ch }`

engine-e-campaign-channel-is-in-in-one = le canal `{ $name }` est en { $unit } dans une phase et en { $unit2 } dans une autre

engine-e-campaign-at-least-one-metric-is = au moins une métrique est nécessaire

engine-e-campaign-metric-is-named-twice = la métrique `{ $name }` est nommée deux fois

engine-e-campaign-seed-overflow-in-the-ensemble = dépassement de graine dans l'ensemble

engine-e-campaign-an-ensemble-needs-at-least = un ensemble nécessite au moins une exécution

engine-e-campaign-sweep-takes-one-to-three = un balayage prend de un à trois axes, reçu : { $axes }

engine-e-campaign-axis-is-named-twice = l'axe `{ $name }` est nommé deux fois

engine-e-campaign-axis-needs-at-least-two = l'axe `{ $name }` nécessite au moins deux pas

engine-e-campaign-axis-scale-must-be-lin = axe `{ $name }` : scale doit être lin ou log

engine-e-campaign-axis-log-axis-needs-positive = axe `{ $name }` : un axe log nécessite des extrémités positives

engine-campaign-sweep-node = nœud de balayage { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs doit valoir au moins deux

engine-e-campaign-compose-needs-at-least-one = compose nécessite au moins un membre

engine-e-campaign-shared-value-must-be-number = la valeur partagée `{ $name }` doit être un nombre ou des nombres

engine-e-campaign-shared-value-is-named-twice = la valeur partagée `{ $name }` est nommée deux fois

engine-e-campaign-member-binds-unknown-shared = le membre `{ $label }` lie une valeur partagée inconnue `{ $name }`

engine-e-campaign-member = membre `{ $label }` : { $e }

engine-e-campaign-metric-is-in-for-one = la métrique `{ $name }` est en { $u } pour un membre et en { $unit } pour `{ $label }`

engine-e-campaign-member-is-named-twice = le membre `{ $label }` est nommé deux fois

engine-e-campaign-invalid-campaign-scenario = scénario de campagne invalide : { $e }

engine-e-campaign-invalid-campaign = campagne invalide : { $e }

engine-e-campaign-sweep = sweep : { $e }

engine-e-campaign-monte-carlo = monte_carlo : { $e }

engine-e-campaign-compose = compose : { $e }

engine-e-campaign-optimize = optimize : { $e }

engine-campaign-of-across-the-realisations = { $d } de { $what } sur les réalisations

engine-campaign-timeline-phases-carried = timeline.phases[].carried.{ $ch }

engine-campaign-value-of-at-the-end = valeur de { $ch } à la fin de la phase précédente, ajoutée à { $ch } de cette phase

engine-campaign-timeline-channels-values = timeline.channels.{ $name }.values[]

engine-campaign-on-the-timeline-grid-the = { $label } sur la grille de la chronologie : le dernier échantillon de l'exécution de la phase propriétaire à l'instant de chaque point de la grille ou avant (maintien d'ordre zéro) ; nul là où aucune exécution de cette phase n'en fournit

engine-campaign-sweep-axes-values = sweep.axes.{ $name }.values[]

engine-campaign-values-of-the-scenario-key = valeurs de la clé de scénario { $key } le long de l'axe { $name }

engine-campaign-sweep-nodes-coords = sweep.nodes[].coords.{ $name }

engine-campaign-value-of-the-scenario-key = valeur de la clé de scénario { $key } à ce nœud

engine-campaign-sweep-nodes-metrics = sweep.nodes[].metrics.{ $name }

engine-campaign-of-the-node-result = { $path } du résultat du nœud

engine-campaign-monte-carlo-metrics = monte_carlo.metrics.{ $name }

engine-campaign-of-each-realisation-in-seed = { $path } de chaque réalisation, dans l'ordre des graines

engine-campaign-compose-shared-value = compose.shared.{ $name }.value[]

engine-campaign-compose-shared-value-2 = compose.shared.{ $name }.value

engine-campaign-shared-value-written-into-every = valeur partagée { $name }, écrite dans chaque membre qui la lie

engine-campaign-compose-members-metrics = compose.members.*.metrics.{ $name }

engine-campaign-metric-read-from-the-member = métrique { $name } lue dans le résultat du membre

engine-campaign-compose-combined = compose.combined.{ $name }

engine-campaign-smallest-across-the-members = plus petit { $name } parmi les membres

engine-campaign-largest-across-the-members = plus grand { $name } parmi les membres

engine-campaign-mean-across-the-members = { $name } moyen parmi les membres

engine-e-campaign-failed-to-serialise-campaign-result = échec de la sérialisation du résultat de campagne : { $e }

engine-campaign-chain-phases-over-events-alarm = chaîne : { $phases } phases sur { $duration_s } s, { $events } événements, alarme levée sur { $alarm_s } s de la grille

engine-campaign-sweep-of-nodes-over = balayage de `{ $scenario_kind }` : { $nodes } nœuds sur [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Monte Carlo de `{ $scenario_kind }` : { $runs } graines

engine-campaign-compose-members = compose : { $members } membres

engine-campaign-member-runs-modelled = { $runs_total } exécutions de membres (MODELLED)

engine-campaign-sweep-of-over-nodes-each = balayage de `{ $scenario_kind }` sur { $axis_order } ({ $nodes } nœuds ; chaque ligne sur sa propre plage)

engine-campaign-campaign-modelled-composition-every-value = campagne { $r } | composition MODELLED ; chaque valeur est lue dans une exécution réelle du type nommé

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = une optimisation prend de un à trois params, reçu : { $params }

engine-e-campaign-optimize-param-is-named-twice = le param `{ $name }` est nommé deux fois

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }` : nécessite lo < hi finis

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }` : scale doit être lin ou log

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }` : un param log nécessite des bornes positives

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }` : start doit être dans [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }` : une grille nécessite des steps d'au moins deux

engine-e-campaign-optimize-objective-target-is-only-read = objective.target n'est lu qu'avec goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" nécessite un objective.target fini

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal doit être minimize, maximize ou target, reçu : `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = une grille de { $total } nœuds dépasse la limite de 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps n'est lu qu'avec method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals doit couvrir le simplexe initial (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step doit être dans (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol et xtol doivent être non négatifs

engine-e-campaign-optimize-method-must-be-grid-or = method doit être grid ou nelder-mead, reçu : `{ $other }`

engine-campaign-optimize-optimize-eval = évaluation d'optimisation { $trace }

engine-campaign-optimize-optimize-params-lo = optimize.params.{ $name }.lo

engine-campaign-optimize-lower-bound-of-the-scenario = borne inférieure de la clé de scénario { $key }

engine-campaign-optimize-optimize-params-hi = optimize.params.{ $name }.hi

engine-campaign-optimize-upper-bound-of-the-scenario = borne supérieure de la clé de scénario { $key }

engine-campaign-optimize-optimize-best-coords = optimize.best_coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key = valeur de la clé de scénario { $key } à la meilleure évaluation

engine-campaign-optimize-optimize-trace-coords = optimize.trace[].coords.{ $name }

engine-campaign-optimize-value-of-the-scenario-key-2 = valeur de la clé de scénario { $key } à cette évaluation

engine-campaign-optimize-target-value-of = valeur cible de { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } à la meilleure évaluation

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } de cette évaluation (moyenne sur les graines lorsque runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimisation `{ $objective_name }` ({ $goal } { $o }) de `{ $scenario_kind }` par { $method } : { $evals } évaluations ({ $stop_reason }), meilleur { $o2 } en [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM : META_START avant l'en-tête CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM : ligne d'en-tête mal formée : { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM : ligne de métadonnées mal formée : { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM : ligne de données mal formée : { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM : mot-clé de données { $k } non reconnu

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM : ligne de données { $k } : époque manquante

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM : ligne de données { $k } : valeur manquante

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM : ligne de données { $k } : valeur { $val_str } incorrecte

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM : segment non terminé (META_STOP/DATA_STOP manquant)

engine-ccsds-tdm-ccsds-tdm-vers = CCSDS_TDM_VERS = { $version }{ "\u000A" }

engine-ccsds-tdm-creation-date = CREATION_DATE = { $creation_date }{ "\u000A" }

engine-ccsds-tdm-time-system = TIME_SYSTEM = { $time_system }{ "\u000A" }

engine-ccsds-tdm-transmit-band = TRANSMIT_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-receive-band = RECEIVE_BAND = { $b }{ "\u000A" }

engine-ccsds-tdm-turnaround-numerator = TURNAROUND_NUMERATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-turnaround-denominator = TURNAROUND_DENOMINATOR = { $fmt_num }{ "\u000A" }

engine-ccsds-tdm-range-units = RANGE_UNITS = { $u }{ "\u000A" }

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM : TURNAROUND_NUMERATOR { $value } incorrect

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM : TURNAROUND_DENOMINATOR { $value } incorrect

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = observable `{ $other }` inconnue ; range ou range-rate est attendu

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = coordonnées `{ $other }` inconnues ; cartesian ou polar est attendu

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours doit être fini et positif, reçu : { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs doit être ≥ 2, reçu : { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps doit être ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials doit être ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations doit être ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd doit être fini et positif, reçu : { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor doit être fini et positif, reçu : { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km doit être fini et positif, reçu : { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m doit être fini et positif, reçu : { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s doit être fini et positif, reçu : { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = la constellation doit comporter au moins un satellite principal et une référence

engine-e-cislunar-arc-recovery-family-is-an-out-of = la famille `{ $family }` est une famille hors plan et n'a pas de représentation plane à quatre états : définissez spatial = true pour la balayer

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = le modèle direct a produit une mesure de vérité terrain non finie

engine-cislunar-arc-recovery-first-arc-length-at-which = première longueur d'arc pour laquelle la résolution par lots sans bruit de CHAQUE essai à graine ramène l'erreur d'état finale à au plus { $recovery_factor } fois le déplacement a priori dont elle est partie. C'est l'analogue de récupération du critère de rang : avec des mesures exactes, la question `is the state observable?` devient `can an estimator get it back?`, et aucune tolérance sur les valeurs singulières n'intervient dans la réponse.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = première longueur d'arc pour laquelle l'erreur RMS de récupération de position par Monte Carlo sur { $trials } réalisations de bruit à graine tombe à { $error_bound_km } km ou moins. C'est l'analogue de récupération du critère d'estimabilité, mesuré plutôt que prédit : l'erreur est la distance de l'estimation à la vérité connue, et non la trace d'une covariance formelle.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED à un pas de grille d'époques près : l'estimateur récupère à partir de { $e } h, le critère de rang du gramien bascule à { $g } h (rapport { $v1 }, grille { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED comme frontière de récupérabilité : l'estimateur récupère à partir de { $e } h, { $v1 } les { $g } h du critère de rang du gramien (rapport { $v2 }, grille { $grid_hours } h). Le critère de rang est une convention relative sur les valeurs singulières ; la frontière de récupération est une erreur d'état mesurée, et les deux ne coïncident pas ici.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED : l'estimateur n'atteint jamais sa borne de récupération sur cet arc, alors que le critère de rang du gramien bascule à { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = le critère de rang du gramien n'est jamais atteint sur cet arc (la géométrie n'atteint jamais le rang plein), alors que l'estimateur récupère à partir de { $e } h — les deux divergent sur l'existence même d'une frontière.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | famille { $family }, { $state_dim } états, { $n_spacecraft } s/c, observable { $observable }, paramétrisation { $coordinates } | arc de { $arc_hours } h, { $epochs } époques (grille { $grid_hours } h), { $trials } essais, graine { $seed } | dérivées partielles par différences finies, sans jacobien analytique / STM / SVD / SRIF | récupération sans bruit à partir de { $nf } (facteur { $recovery_factor }) contre seuil de rang du gramien { $gram } | estimabilité Monte Carlo à partir de { $est } (RMS pos ≤ { $error_bound_km } km, σ { $sigma_range_m } m) contre estimabilité du gramien { $gram_est } | RMS pos de fin d'arc { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = famille `{ $other }` inconnue ; dro, halo ou nrho est attendu

engine-e-cislunar-observability-dro-at-crossing-distance-did = la DRO à la distance de croisement { $d } n'a pas convergé en correction différentielle

engine-e-cislunar-observability-member-at-x0-did-not = { $label } membre { $i } à x0 = { $x0 } n'a pas convergé en correction différentielle

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft doit être compris entre 2 et { $MAX_SPACECRAFT }, reçu : { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs doit être ≥ 2, reçu : { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol doit être fini et positif, reçu : { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m doit être fini et non négatif, reçu : { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km doit être fini et positif, reçu : { $sigma_pos_threshold_km }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs =
    { $n_links ->
        [one] cislunar-observability | { $c } s/c ({ $refs } références) | arc de { $arc_hours } h, { $rank_arc } époques | rang { $first } → { $last } sur { $state_dim } au long de l'arc | λ du gramien [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rang instantané distance seule { $rank_range_only } → distance+taux { $rank_range_rate } ({ $n_links } liaison) | GDOP distance seule { $ro } distance+taux { $rr } | CI de DRO (résidu de périodicité max. { $max_resid }) | a posteriori SRIF fini à l'époque de rang 4 { $srif_epoch } (vérifié : rang/STM/fermeture de DRO/SRIF ; modélisé : conception)
        [many] cislunar-observability | { $c } s/c ({ $refs } références) | arc de { $arc_hours } h, { $rank_arc } époques | rang { $first } → { $last } sur { $state_dim } au long de l'arc | λ du gramien [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rang instantané distance seule { $rank_range_only } → distance+taux { $rank_range_rate } ({ $n_links } de liaisons) | GDOP distance seule { $ro } distance+taux { $rr } | CI de DRO (résidu de périodicité max. { $max_resid }) | a posteriori SRIF fini à l'époque de rang 4 { $srif_epoch } (vérifié : rang/STM/fermeture de DRO/SRIF ; modélisé : conception)
       *[other] cislunar-observability | { $c } s/c ({ $refs } références) | arc de { $arc_hours } h, { $rank_arc } époques | rang { $first } → { $last } sur { $state_dim } au long de l'arc | λ du gramien [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rang instantané distance seule { $rank_range_only } → distance+taux { $rank_range_rate } ({ $n_links } liaisons) | GDOP distance seule { $ro } distance+taux { $rr } | CI de DRO (résidu de périodicité max. { $max_resid }) | a posteriori SRIF fini à l'époque de rang 4 { $srif_epoch } (vérifié : rang/STM/fermeture de DRO/SRIF ; modélisé : conception)
    }


engine-cislunar-observability-never-rank-of = jamais (rang { $rank } sur { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | famille { $family }, { $state_dim } états, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | seuil de rang { $rank_thr } (grille { $c } h) | seuil d'estimabilité (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = première longueur d'arc pour laquelle l'incertitude formelle à 1σ de la position de l'état INITIAL du satellite principal, σ_pos = sqrt(trace(P_rr)) avec P = (ÕᵀÕ)⁻¹ et Õ la matrice d'observabilité blanchie du bruit de mesure, tombe à { $sigma_pos_threshold_km } km ou moins. C'est le critère selon lequel un seuil de longueur d'arc dépend du bruit : P varie comme σ², donc σ_pos varie comme σ, alors que le critère de rang ci-dessus ne bouge pas avec σ. La borne est un choix d'ingénierie DÉCLARÉ, non ajusté — estimability_sweep rapporte le seuil pour quatre autres bornes.

engine-cislunar-observability-extension-r3-this-run-is =
    { $n_spacecraft ->
        [one] EXTENSION (R3) — cette exécution n'est PAS la configuration DRO plane que décrit le `label` ci-dessus. Dimension d'état { $state_dim } ; famille d'orbites { $family } ; { $n_spacecraft } engin spatial ; sigma de mesure de distance { $sigma_range_m } m. Là où `label` dit "planar" et "planar DROs", lisez la famille nommée ici. Ajouts VALIDATED : la STM variationnelle 6x6 est la même STM CR3BP vérifiée par différences finies (crate::cr3bp) utilisée en pleine largeur ; les lignes jacobiennes spatiales de distance / taux de distance sont des dérivées partielles analytiques vérifiées par différences finies, la ligne du taux de distance étant recoupée composante par composante avec deepspace_od::range_rate_observable, indépendante et 3-D, de la bibliothèque ; les conditions initiales halo / NRHO sont des orbites périodiques à correction différentielle issues du même correcteur qui reproduit la NRHO 9:2 australe L2 publiée, prolongées à partir de cette graine publiée, et le résidu de fermeture de chaque membre est rapporté ; les verdicts de RANG à six états sont confirmés par un rang par échelonnement de lignes INDÉPENDANT (élimination de Gauss avec pivot partiel) qui ne partage aucun code avec la voie valeurs propres/SVD. PORTÉE HONNÊTE DU VOLET SRIF : la validation croisée SRIF ci-dessus consomme les MÊMES jacobiennes de mesure et se ramène au même O^T O ; son accord est donc un contrôle de cohérence entre deux machines numériques, et PAS une corroboration indépendante du seuil — il n'est pas compté comme une vérification d'aucun chiffre ici. MODELLED : la conception de la famille (quelles abscisses, amplitudes et phases), la grille d'époques, l'arc à liaison unique et la borne de position déclarée du critère d'estimabilité.
        [many] EXTENSION (R3) — cette exécution n'est PAS la configuration DRO plane que décrit le `label` ci-dessus. Dimension d'état { $state_dim } ; famille d'orbites { $family } ; { $n_spacecraft } d'engins spatiaux ; sigma de mesure de distance { $sigma_range_m } m. Là où `label` dit "planar" et "planar DROs", lisez la famille nommée ici. Ajouts VALIDATED : la STM variationnelle 6x6 est la même STM CR3BP vérifiée par différences finies (crate::cr3bp) utilisée en pleine largeur ; les lignes jacobiennes spatiales de distance / taux de distance sont des dérivées partielles analytiques vérifiées par différences finies, la ligne du taux de distance étant recoupée composante par composante avec deepspace_od::range_rate_observable, indépendante et 3-D, de la bibliothèque ; les conditions initiales halo / NRHO sont des orbites périodiques à correction différentielle issues du même correcteur qui reproduit la NRHO 9:2 australe L2 publiée, prolongées à partir de cette graine publiée, et le résidu de fermeture de chaque membre est rapporté ; les verdicts de RANG à six états sont confirmés par un rang par échelonnement de lignes INDÉPENDANT (élimination de Gauss avec pivot partiel) qui ne partage aucun code avec la voie valeurs propres/SVD. PORTÉE HONNÊTE DU VOLET SRIF : la validation croisée SRIF ci-dessus consomme les MÊMES jacobiennes de mesure et se ramène au même O^T O ; son accord est donc un contrôle de cohérence entre deux machines numériques, et PAS une corroboration indépendante du seuil — il n'est pas compté comme une vérification d'aucun chiffre ici. MODELLED : la conception de la famille (quelles abscisses, amplitudes et phases), la grille d'époques, l'arc à liaison unique et la borne de position déclarée du critère d'estimabilité.
       *[other] EXTENSION (R3) — cette exécution n'est PAS la configuration DRO plane que décrit le `label` ci-dessus. Dimension d'état { $state_dim } ; famille d'orbites { $family } ; { $n_spacecraft } engins spatiaux ; sigma de mesure de distance { $sigma_range_m } m. Là où `label` dit "planar" et "planar DROs", lisez la famille nommée ici. Ajouts VALIDATED : la STM variationnelle 6x6 est la même STM CR3BP vérifiée par différences finies (crate::cr3bp) utilisée en pleine largeur ; les lignes jacobiennes spatiales de distance / taux de distance sont des dérivées partielles analytiques vérifiées par différences finies, la ligne du taux de distance étant recoupée composante par composante avec deepspace_od::range_rate_observable, indépendante et 3-D, de la bibliothèque ; les conditions initiales halo / NRHO sont des orbites périodiques à correction différentielle issues du même correcteur qui reproduit la NRHO 9:2 australe L2 publiée, prolongées à partir de cette graine publiée, et le résidu de fermeture de chaque membre est rapporté ; les verdicts de RANG à six états sont confirmés par un rang par échelonnement de lignes INDÉPENDANT (élimination de Gauss avec pivot partiel) qui ne partage aucun code avec la voie valeurs propres/SVD. PORTÉE HONNÊTE DU VOLET SRIF : la validation croisée SRIF ci-dessus consomme les MÊMES jacobiennes de mesure et se ramène au même O^T O ; son accord est donc un contrôle de cohérence entre deux machines numériques, et PAS une corroboration indépendante du seuil — il n'est pas compté comme une vérification d'aucun chiffre ici. MODELLED : la conception de la famille (quelles abscisses, amplitudes et phases), la grille d'époques, l'arc à liaison unique et la borne de position déclarée du critère d'estimabilité.
    }


engine-cislunar-observability-validated-each-constellation-initial-condition = Vérifié : chaque condition initiale de la constellation est une orbite périodique à correction différentielle de la famille { $family }, se refermant sur une période avec le résidu de périodicité rapporté (les DRO planes sont en outre rétrogrades autour de la Lune). La famille est corrigée au rapport de masse Terre-Lune. Modélisé : le choix des paramètres et des phases de la famille (la conception de la constellation). Le nom de clé `dro_provenance` est conservé pour le schéma de document publié ; il porte la famille demandée par cette exécution.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = intégrité : { $n } doit être fini et positif, reçu : { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = intégrité : { $n } doit être dans (0, 1), reçu : { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = intégrité : mask_deg doit être dans [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = intégrité : systems doit nommer au moins un préréglage

engine-e-clock-integrity-integrity-injected-bias-needs-finite = intégrité : injected_bias nécessite des bias_m, t0_s et t1_s finis

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] intégrité : { $n } époque dépasse le plafond de { $MAX_EPOCHS } époques ; augmentez step_s
        [many] intégrité : { $n } d'époques dépassent le plafond de { $MAX_EPOCHS } époques ; augmentez step_s
       *[other] intégrité : { $n } époques dépassent le plafond de { $MAX_EPOCHS } époques ; augmentez step_s
    }


## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name } : aucun enregistrement

engine-e-clock-library-card-records-at-different-tau0 = { $name } : enregistrements à des tau0 différents

engine-e-clock-library-card-periodic-least-squares-failed = { $name } : échec des moindres carrés périodiques

engine-e-clock-library-card-stability-points-with-edf-card = { $name } : { $used } points de stabilité avec edf >= { $MIN_FIT_EDF } ; une fiche en nécessite trois

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = lacunes { $g }, valeurs aberrantes de phase { $o }, sauts de phase { $p }, rafales { $b }, sauts de fréquence { $f } (sigma_y robuste { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` n'est pas un entier non négatif

engine-e-compliance-is-missing = `{ $p }` est manquant

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } dépasse events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } dépasse predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label } : comptes de confiance du récepteur mal formés ({ $malformed_counts }) ; exclu

engine-e-compliance-not-json = { $label } : pas du JSON : { $e }

engine-compliance-cannot-read = { $label } : impossible de lire : { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label } : le scénario voisin indique le type `{ $s }` mais le résultat indique `{ $o }` ; non utilisé

engine-e-compliance-scenario-kind-not-found-no = { $label } : type de scénario introuvable (aucun fichier de scénario voisin, pas un résultat receiver-trust, aucun `kind` de premier niveau)

engine-e-compliance-is-not-scenario-kind-the = { $label } : `{ $kind }` n'est pas un type de scénario connu du moteur ; non utilisé

engine-compliance-written-by-kshana = Écrit par kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    { $met } test(s) avec chaque seuil fixé atteint, { $not_met } avec un seuil non atteint, { $needs_input } en attente de données.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = la grille d'intensité doit avoir min < max finis, reçu : [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = la grille d'intensité nécessite >= 2 pas, reçu : { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = la grille de corrélation doit avoir au moins une valeur

engine-e-conflict-resilience-correlation-values-must-lie-in = les valeurs de corrélation doivent être dans [0, 1], reçu : { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience nécessite au moins une couche

engine-e-conflict-resilience-layer-availability-not-in = couche { $i } : disponibilité { $availability } hors de [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = sigma_m de la couche { $i } doit être fini et positif

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = vulnerability de la couche { $i } doit être fini et >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = vector_weight de la couche { $i } doit être fini et >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } hors limites (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials doit être >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | { $layers } couches ({ $primary } de référence) | intensité de référence { $reference_intensity } | rapport de résilience forme fermée { $ratio_closed_form }x MC { $ratio_mc_independent }x (en couches contre couche unique) | la corrélation neutralise la mise en couches : rapport { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | IC a priori [{ $ratio_lo }-{ $ratio_hi }]x | survie par vecteur @ brouillage de référence { $surv } % leurrage { $surv2 } % cinétique { $surv3 } % cyber { $surv4 } % (le plus net { $sharpest }) | titre ~7x MODELLED, VALIDATED MC->forme fermée / identité de fusion / marginales de copule / survie par vecteur

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = corps central { $name } inconnu : une planète, Pluton, la Lune ou une lune majeure est attendu (earth, moon, mars, europa, titan, ... ; voir crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = une coque Walker nécessite total > 0 et planes > 0

engine-e-constellation-walker-total-is-not-multiple = le total Walker { $total } n'est pas un multiple de planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = le phasage Walker F = { $phasing } doit être dans 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } n'est pas un emplacement GPS extensible (SPS PS Table 3.2-2 répertorie B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what } : indiquez altitude_km ou semi_major_axis_km, pas les deux

engine-e-constellation-needs-altitude-km-or-semi = { $what } : nécessite altitude_km ou semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what } : le demi-grand axe { $v1 } km n'est pas supérieur au rayon de { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what } : l'excentricité { $e } doit être dans [0, { $lit_0_9 })

engine-e-constellation-perigee-is-below-the-surface = { $what } : le périgée est sous la surface de { $name }

engine-e-constellation-constellation-preset-is-an-earth = constellation { $name } : le préréglage { $p } est une constellation terrestre, le corps est { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = constellation { $name } : préréglage { $other } inconnu (gps-baseline, gps-expandable, galileo, beidou, beidou-meo ou glonass est attendu)

engine-e-constellation-constellation-expanded-applies-only-to = constellation { $name } : `expanded` ne s'applique qu'au préréglage gps-expandable

engine-constellation-constellation-shell = constellation { $name } coque { $v2 }

engine-constellation-explicit-element-sets = { $satellite } jeux d'éléments explicites

engine-constellation-constellation-satellite = constellation { $name } satellite { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = constellation { $name } n'a aucun satellite : indiquez un préréglage, un [[constellation.shell]] ou un [[constellation.satellite]]

engine-e-constellation-no-constellation-given = aucune constellation indiquée

engine-e-constellation-constellations-with-one-clock-each = { $constellations } constellations avec une horloge chacune dépassent la limite de { $MAX_CLOCKS } horloges ; utilisez clock = "common" ou fusionnez les constellations

engine-e-constellation-must-be-finite = { $what } doit être fini

engine-e-constellation-need-step-and-duration-step = step_s > 0 et duration_s >= step_s sont requis

engine-e-constellation-more-than-100-000-epochs = plus de 100 000 époques ; augmentez step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg doit être dans [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold doit être positif

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg doit être dans [{ $lit_0_25 }, 90]

engine-e-constellation-need-90-lat-min-deg = -90 <= lat_min_deg < lat_max_deg <= 90 est requis

engine-e-constellation-need-lon-min-deg-lon = lon_min_deg < lon_max_deg couvrant au plus 360 deg est requis

engine-e-constellation-give-at-least-one-constellation = indiquez au moins une [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points est plafonné à 2000

engine-e-constellation-satellites-exceeds-the-50-000 = { $total } satellites dépassent la limite de 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design : { $total } satellites ({ $names }) autour de { $name } ; disponibilité { $global_availability_pct } % (PDOP <= { $pdop_threshold } à un masque de { $mask_deg } deg), pire site { $worst_site_availability_pct } %, PDOP médian { $cov }, { $global_mean_visible } en vue en moyenne ; { $grid_points } points de grille x { $epochs } époques (MODELLED)

engine-constellation-constellation-coverage-over-the = Couverture de la constellation sur { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } doit être fini et positif

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } doit être fini et >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw doit être fini

engine-e-contact-schedule-satellite-altitude-km-must-be = satellite '{ $name }' : altitude_km doit être dans (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satellite '{ $name }' : inclination_deg doit être dans [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satellite '{ $name }' : backlog_mbit doit être >= 0

engine-e-contact-schedule-satellite-priority-must-be = satellite '{ $name }' : priority doit être > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satellite '{ $name }' : eirp_dbw doit être fini

engine-e-contact-schedule-station-lat-deg-in-90 = station '{ $name }' : lat_deg dans [-90, 90], lon_deg fini

engine-e-contact-schedule-station-mask-deg-must-be = station '{ $name }' : mask_deg doit être dans [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = station '{ $name }' : alt_m doit être dans [0, 3000] (plage ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = station '{ $name }' : setup_s >= 0 et g_over_t_db fini

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours doit être dans (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s doit être dans (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = au moins un satellite et une station sont requis

engine-e-contact-schedule-at-most-32-satellites-and = au plus 32 satellites et 32 stations

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule : { $satellites } satellites x { $stations } stations sur { $duration_hours } h -> { $cands } contacts candidats, { $greedy } planifiés ; { $total_del } sur { $total_backlog } Mbit livrés{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link : { $pairs } passage(s) ; ACM { $acm } Mbit contre CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = au moins 2 essais et un sigma_m > 0 fini sont requis

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total doit être dans (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = aucun repère local à l'utilisateur

engine-e-dop-error-ci-singular-geometry = { $name } : géométrie singulière

engine-e-dop-error-ci-no-noise-free-fix = { $name } : aucune solution sans bruit

engine-e-dop-error-ci-no-fix = { $name } : aucune solution

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label } : géométrie singulière

engine-e-dop-error-mc-no-fix = { $label } : aucune solution

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km doit être positif ; reçu : { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes et sats_per_plane doivent tous deux être non nuls

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz doit être positif ; reçu : { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency doit être dans (0, 1] ; reçu : { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k doit être positif ; reçu : { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db doit être non négatif ; reçu : { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m doit être hors de la Terre ; reçu : { $range_m }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] Earth-GNSS à distance lunaire — { $n_satellites } satellite, récepteur à { $r } km{ "\u000A" }
        [many] Earth-GNSS à distance lunaire — { $n_satellites } de satellites, récepteur à { $r } km{ "\u000A" }
       *[other] Earth-GNSS à distance lunaire — { $n_satellites } satellites, récepteur à { $r } km{ "\u000A" }
    }


engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Limbe terrestre vu de la constellation : { $earth_limb_half_angle_deg } deg hors nadir — tout rayon à destination de la Lune doit dépasser cette valeur{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the =
    { $n_trackable ->
        [one] { "  " }{ $n_geometrically_visible } sur { $n_satellites } non occultés ; { $n_trackable } franchit le seuil de poursuite de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
        [many] { "  " }{ $n_geometrically_visible } sur { $n_satellites } non occultés ; { $n_trackable } de franchissent le seuil de poursuite de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
       *[other] { "  " }{ $n_geometrically_visible } sur { $n_satellites } non occultés ; { $n_trackable } franchissent le seuil de poursuite de { $tracking_threshold_dbhz } dB-Hz{ "\u000A" }
    }


engine-earth-gnss-lunar-best-link-db-hz = { "  " }meilleure liaison { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }toute ligne de visée poursuivable se trouve dans un demi-cône de { $a } deg — la géométrie est presque dégénérée{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }BALAYAGE sur { $epochs } époques / { $span_s } s : disponibilité du signal { $signal_availability }, disponibilité de la solution de position { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }liaisons poursuivables moyenne { $mean_trackable }, max { $max_trackable } ; meilleur C/N0 { $w } ; meilleur PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = de un à six étages sont requis

engine-entry-eo-ascent-ascent-stages-propellant-kg = stages[{ $i }].propellant_kg

engine-entry-eo-ascent-ascent-stages-thrust-vac = stages[{ $i }].thrust_vac_n

engine-entry-eo-ascent-ascent-stages-isp-vac = stages[{ $i }].isp_vac_s

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg doit être fini et non négatif

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 doit être fini et non négatif

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg doit être fini et non négatif

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m doit être fini et non négatif

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg doit être dans [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s doit être fini et non négatif

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = le rapport poussée/poids au décollage { $tw } doit dépasser 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses : dv idéal { $ideal_dv_m_s } m/s, pertes { $losses } m/s (gravité { $gravity_loss_m_s }, traînée { $drag_loss_m_s }, pilotage { $steering_loss_m_s }, contre-pression { $back_pressure_loss_m_s }) ; extinction { $r } km à { $end_speed_m_s } m/s, gamma { $r2 } deg ; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } doit être fini et positif

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body doit être "earth" ou "mars", reçu "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = l'atmosphère "{ $a }" n'est pas disponible pour le corps "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg doit être dans (0, 90) (positif vers le bas)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m doit être dans [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg doit être fini avec |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg et longitude_deg doivent être finis

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag doit être dans [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg doit être fini

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s doit être dans (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m doit être dans [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s doit être dans (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame doit être inertial|relative, reçu "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }) : V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> pic { $pk_g } g à { $r } km, q pic { $r2 } W/cm² à { $r3 } km, charge thermique { $r4 } J/cm², q_dyn pic { $r5 } kPa ; { $outcome } à { $end_time_s } s (forme fermée { $cf_g } g ; MODELLED 3-DoF, sans rayonnement ni TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } doit être dans (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } doit être fini et non négatif

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg doit être dans [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits doit être dans 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry : GSD { $gsd } m, Q { $im }, SNR { $snr } (puits { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = l'angle au nadir { $eta_rad }° dépasse le rayon angulaire de la Terre { $rho }° (manque la Terre)

engine-e-eo-payload-no-sun-synchronous-inclination-at = aucune inclinaison héliosynchrone à { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg doit être dans (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad doit être fini et positif

engine-e-eo-payload-half-fov-too-large = half_fov trop grand : { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage : { $altitude_km } km, FOV ±{ $half_fov_deg }° -> fauchée de { $v3 } km, GSD au nadir de { $gsd } m, accès jusqu'à { $v5 } km hors nadir ; espacement des nœuds { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = barycentre Terre-Lune d'après { $table }, scindé par la série lunaire de Montenbruck & Gill précessée à J2000

engine-ephem-provider-jpl-mean-elements-in-the = éléments moyens JPL dans le plan de Laplace, taux de longitude moyenne tiré du taux de rotation synchrone de l'IAU, ajoutés à sa planète d'après { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = direction de rotation synchrone de l'IAU à la distance moyenne JPL, ajoutée à Saturne d'après { $table }

engine-e-ephem-provider-read = lecture de { $path } : { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = il manque la ligne 1 du TLE (une ligne commençant par `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = il manque la ligne 2 du TLE (une ligne commençant par `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = une éphéméride `orbit` analytique nécessite un `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = un scénario d'éphéméride nécessite soit un `tle`, soit un `orbit`

engine-e-ephemeris-step-must-be-positive = step_s doit être positif

engine-e-ephemeris-duration-must-be-non-negative = duration_s doit être non négatif

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz doit être une fréquence positive et finie

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] trace au sol { $source } · { $n_samples } échantillon · alt { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
        [many] trace au sol { $source } · { $n_samples } d'échantillons · alt { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
       *[other] trace au sol { $source } · { $n_samples } échantillons · alt { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°
    }


## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` n'est pas fini

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` n'est ni des secondes ni une heure UTC ISO-8601

engine-e-evidence-assemble-no-epoch-of-the-log = aucune époque du journal ne tombe entre { $t0 } s et { $t1 } s (le journal couvre de 0 à { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config n'est pas un objet

engine-e-evidence-assemble-config-json-already-has-an = config.json a déjà une entrée `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = de { $from_s } à { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` n'est pas une heure UTC comme 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } dans un journal de { $log_bytes } octets

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } nécessite une valeur

engine-e-evidence-cli-cannot-create = impossible de créer { $path } : { $e }

engine-e-evidence-cli-cannot-write = impossible d'écrire { $path } : { $e }

engine-evidence-cli-warning-is-readable-by-other = avertissement : { $path } est lisible par d'autres utilisateurs ; restreignez-le (chmod 600)

engine-e-evidence-cli-cannot-read-key = impossible de lire la clé { $path } : { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } n'est pas une clé hexadécimale

engine-e-evidence-cli-must-hold-32-byte-key = { $path } doit contenir une clé de 32 octets sous forme de 64 chiffres hexadécimaux

engine-e-evidence-cli-cannot-read = impossible de lire { $dir } : { $e }

engine-e-evidence-cli-cannot-read-2 = impossible de lire { $name } : { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } existe et n'est pas vide

engine-e-evidence-cli-cannot-create-2 = impossible de créer { $dir } : { $e }

engine-evidence-cli-warning-is-owner-only-mode = avertissement : { $arg } est réservé à son propriétaire (mode 600) et ne se nomme pas *.pub : ce peut être une clé privée. Passez le fichier de clé publique.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` n'est ni 64 chiffres hexadécimaux ni un fichier lisible ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` ne contient pas de chiffres hexadécimaux

engine-evidence-cli-private-key-keep-it-secret = clé privée : { $out }  (gardez-la secrète ; ne la versionnez jamais)

engine-evidence-cli-public-key-pub = clé publique : { $out }.pub

engine-evidence-cli-public-key-hex = clé publique (hex) : { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Donnez la clé publique aux vérificateurs par une voie de confiance ; ils l'épinglent avec --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify nécessite un répertoire de paquet

engine-e-evidence-cli-cannot-read-3 = impossible de lire { $p } : { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p } : aucun certificat PEM trouvé

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }signature de l'autorité d'horodatage non vérifiée par Kshana

engine-evidence-cli-this-is-technical-record-not = Ceci est un enregistrement technique, et non un avis juridique.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp nécessite un répertoire de paquet

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp nécessite un fichier de jeton

engine-e-evidence-cli-cannot-read-4 = impossible de lire { $tok } : { $e }

engine-e-evidence-cli-cannot-write-2 = impossible d'écrire { $target } : { $e }

engine-evidence-cli-note-the-token-sits-beside = note : le jeton se trouve à côté du manifeste signé, et non à l'intérieur ; vérifiez avec --require-timestamp pour l'exiger.

engine-e-evidence-cli-round-trip-packs-are-not = les paquets aller-retour ne sont pas construits pour WebAssembly

engine-e-evidence-cli-needs-scenario-path = nécessite un chemin de scénario

engine-e-evidence-cli-needs-from = nécessite --from

engine-e-evidence-cli-needs-to = nécessite --to

engine-e-evidence-cli-cannot-read-lab-attestation = impossible de lire l'attestation de laboratoire { $p } : { $e }

engine-e-evidence-cli-cannot-read-5 = impossible de lire { $scn_path } : { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = scénario receiver-trust invalide : { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation s'applique à `receiver-trust evidence`, et non à `evidence round-trip` (dont le paquet consigne les conditions d'essai)

engine-e-evidence-cli-cannot-read-6 = impossible de lire { $sp } : { $e }

engine-e-evidence-cli-cannot-read-7 = impossible de lire { $cp } : { $e }

engine-evidence-cli-evidence-pack-written-to = paquet de preuves écrit dans { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }époques dans la fenêtre : { $epochs_in_window }  ({ $from_s } s à { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }empreinte du signataire : { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 de manifest.json (ce qu'une autorité RFC 3161 doit horodater) : { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }tranche du journal : octets { $a } à { $b } sur { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }tranche du journal : journal entier (ce journal ne donne aucune plage d'octets pour la fenêtre)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }attestation de laboratoire consignée dans le manifeste signé ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Un paquet est un enregistrement technique, et non un avis juridique.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s à { $to_s } s après la première époque du journal

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = TOML d'attestation de laboratoire invalide : { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` doit être une table

engine-e-evidence-lab-invalid-lab-attestation = attestation de laboratoire invalide : { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation : { $name } est obligatoire

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation : { $name } dépasse { $MAX_FIELD } octets

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation : la date { $date } n'est pas un jour comme 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation : une configuration blindée nécessite enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation : setup doit valoir "conducted" ou "shielded" (reçu : { $other }) ; une configuration par voie hertzienne n'est pas acceptée comme essai de laboratoire

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation : attenuation_db doit être fini

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = les conditions d'essai indiquent { $events } événement(s) mais le scénario de notation en compte { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = l'événement '{ $id }' des conditions d'essai ({ $onset_s } s à { $offset_s } s) ne correspond pas à '{ $label }' du scénario de notation ({ $onset_s2 } s à { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = le SHA-256 du journal ({ $have }) n'est pas celui qu'indiquent les conditions d'essai ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = DER tronqué

engine-e-evidence-tsa-bad-der-length = longueur DER invalide

engine-e-evidence-tsa-unexpected-der-tag = { $what } : balise DER { $tag } inattendue

engine-e-evidence-tsa-empty-algorithmidentifier = AlgorithmIdentifier vide

engine-e-evidence-tsa-bad-utctime = UTCTime invalide

engine-e-evidence-tsa-bad-generalizedtime = GeneralizedTime invalide

engine-e-evidence-tsa-bad-time = heure invalide

engine-e-evidence-tsa-time-not-in-utc = heure non exprimée en UTC

engine-e-evidence-tsa-bad-time-digits = chiffres de l'heure invalides

engine-e-evidence-tsa-bad-bit-string = BIT STRING invalide

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate : trois éléments attendus

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate : trop court

engine-e-evidence-tsa-empty-extension = Extension vide

engine-e-evidence-tsa-extension-value-not-an-octet = Extension : la valeur n'est pas une OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity : vide

engine-e-evidence-tsa-validity-short = Validity : trop court

engine-e-evidence-tsa-pem-end-without-begin = PEM : END sans BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM : base64 invalide

engine-e-evidence-tsa-pem-bad-base64-length = PEM : longueur base64 invalide

engine-e-evidence-tsa-spki-empty = SPKI : vide

engine-e-evidence-tsa-spki-no-oid = SPKI : pas d'OID

engine-e-evidence-tsa-spki-no-key = SPKI : pas de clé

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey : deux entiers attendus

engine-e-evidence-tsa-unsupported-elliptic-curve = courbe elliptique non prise en charge

engine-e-evidence-tsa-unsupported-public-key-algorithm = algorithme de clé publique non pris en charge

engine-e-evidence-tsa-rsa-key-or-signature-too = clé ou signature RSA trop grande

engine-e-evidence-tsa-rsa-modulus-not-odd = module RSA non impair

engine-e-evidence-tsa-rsa-signature-out-of-range = signature RSA hors plage

engine-e-evidence-tsa-rsa-key-too-small = clé RSA trop petite

engine-e-evidence-tsa-invalid-padding = bourrage invalide

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS : message encodé trop long

engine-e-evidence-tsa-last-octet-invalid = dernier octet invalide

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS : bits de gauche non nuls

engine-e-evidence-tsa-pss-bad-padding = PSS : bourrage invalide

engine-e-evidence-tsa-pss-signature-mismatch = PSS : signature non concordante

engine-e-evidence-tsa-unsupported-mask-generation-function = fonction de génération de masque non prise en charge

engine-e-evidence-tsa-mgf1-without-hash = MGF1 sans fonction de hachage

engine-e-evidence-tsa-bad-pss-salt-length = longueur de sel PSS invalide

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = une signature ECDSA nécessite une clé EC

engine-e-evidence-tsa-an-rsa-signature-needs-an = une signature RSA nécessite une clé RSA

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption sans algorithme de condensat

engine-e-evidence-tsa-an-rsa-pss-signature-needs = une signature RSA-PSS nécessite une clé RSA

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey sans algorithme de condensat

engine-e-evidence-tsa-unsupported-signature-algorithm = algorithme de signature non pris en charge

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo : vide

engine-e-evidence-tsa-time-stamp-request-not-granted = demande d'horodatage non accordée

engine-e-evidence-tsa-no-time-stamp-token-in = aucun jeton d'horodatage dans la réponse

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = ni un TimeStampResp ni un TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = pas un SignedData CMS

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo : aucun contenu

engine-e-evidence-tsa-signeddata-short = SignedData : trop court

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo : vide

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = le contenu encapsulé n'est pas un TSTInfo

engine-e-evidence-tsa-no-tstinfo = aucun TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo n'est pas dans une OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo : trop court

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo : pas de genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData : pas de signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = exactement un SignerInfo attendu

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo : pas de sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo : pas d'algorithme de condensat

engine-e-evidence-tsa-signerinfo-short = SignerInfo : trop court

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo : pas d'attributs signés

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo : pas d'algorithme de signature

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo : pas de signature

engine-e-evidence-tsa-no-serial = pas de numéro de série

engine-e-evidence-tsa-signer-certificate-not-found = certificat du signataire introuvable

engine-e-evidence-tsa-attribute-empty = Attribute : vide

engine-e-evidence-tsa-attribute-no-values = Attribute : aucune valeur

engine-e-evidence-tsa-attribute-no-value = Attribute : pas de valeur

engine-e-evidence-tsa-content-type-attribute-mismatch = attribut content-type non concordant

engine-e-evidence-tsa-digest-failure = échec du condensat

engine-e-evidence-tsa-signature-not-an-octet-string = la signature n'est pas une OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = attribut ess signing certificate manquant

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate : vide

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id introuvable

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2 : pas de hachage

engine-e-evidence-tsa-unsuitable-certificate-purpose = usage de certificat inadapté

engine-e-evidence-tsa-certificate-is-not-yet-valid = le certificat n'est pas encore valide

engine-e-evidence-tsa-certificate-has-expired = le certificat a expiré

engine-e-evidence-tsa-invalid-ca-certificate = certificat d'AC invalide

engine-e-evidence-tsa-certificate-chain-too-long = chaîne de certificats trop longue

engine-e-evidence-tsa-messageimprint-empty = MessageImprint : vide

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint : pas de condensat

engine-e-evidence-tsa-message-imprint-mismatch = empreinte du message non concordante

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = le BER à longueur indéfinie n'est pas pris en charge

engine-e-evidence-tsr-expected-tag-found = { $what } attendu (balise { $tag }), trouvé : { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = PKIStatusInfo mal formé

engine-e-evidence-tsr-the-timestamp-response-was-not = la réponse d'horodatage n'a pas été accordée

engine-e-evidence-tsr-not-timestamp-token = pas un jeton d'horodatage

engine-e-evidence-tsr-the-token-content-type-is = le type de contenu du jeton n'est pas CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = le jeton ne contient pas de TSTInfo

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = l'empreinte du message utilise un algorithme de hachage non pris en charge

engine-e-evidence-tsr-the-imprint-is-bytes-not = l'empreinte fait { $digest } octets, et non les { $want_len } que donne { $hash_alg }

engine-e-evidence-tsr-gentime-is-not-utc = genTime n'est pas en UTC

engine-e-evidence-tsr-malformed-gentime = genTime mal formé

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime n'est pas une heure calendaire réelle

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = pas de l'hexadécimal en minuscules

engine-e-evidence-verify-expected-bytes-found = { $N } octets attendus, { $v } trouvés

engine-e-evidence-verify-the-pack-already-has-timestamp = le paquet contient déjà un jeton d'horodatage ; passez --replace pour le remplacer

engine-e-evidence-verify-not-attached-the-pack-with = non attaché : le paquet avec ce jeton ne se vérifie pas ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = le paquet consigne une attestation de laboratoire de { $operator } ({ $organisation }, { $setup }) : { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = le fichier de signature ne se termine pas par un saut de ligne

engine-evidence-verify-signer-not-pinned-the-signature = signataire non épinglé : la signature prouve que le paquet est intact au regard de la clé { $r }, que le paquet désigne lui-même. Comparez cette empreinte avec une empreinte obtenue auprès du signataire, ou fournissez la clé.

engine-evidence-verify-range-is-not-inside-log = la plage { $start }..{ $end } n'est pas dans un journal de { $full_bytes } octets

engine-evidence-verify-timestamp-token-states-its-imprint = le jeton d'horodatage indique { $gen_time } ; son empreinte { $v2 } manifest.json. Signature de l'autorité d'horodatage non vérifiée par Kshana : vérifiez-la avec `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = le jeton d'horodatage indique { $gen_time } ; son empreinte { $v2 } manifest.json ; la signature et la chaîne de l'autorité d'horodatage { $v3 } par rapport aux ancres fournies.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` est la chaîne vide

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } est hors du vocabulaire

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = la fourchette de coût doit être finie, non négative, ordonnée bas≤nominal≤haut, et porter une source

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction et availability doivent être des fractions dans [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } doit être fini et > 0, reçu : { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } doit être fini et >= 0, reçu : { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg doit être dans [-90, 90), reçu : { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = la constellation n'a aucun satellite

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats doit être >= 1 lorsqu'il est défini

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = satellite de saut { $sat } hors plage

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = ligne { $lineno } : { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = ligne { $lineno } : { $v } colonnes, au moins { $min } attendues

engine-e-fusion-kfgins-line-columns = ligne { $v1 } : { $v } colonnes

engine-e-fusion-kfgins-line-block-lists-are-not = ligne { $lineno } : les listes en bloc ne sont pas prises en charge

engine-e-fusion-kfgins-line-expected-key-value = ligne { $lineno } : `key: value` attendu

engine-e-fusion-kfgins-line-indented-key-without-parent = ligne { $lineno } : clé indentée sans parent

engine-e-fusion-kfgins-line-only-one-level-of = ligne { $lineno } : un seul niveau d'imbrication

engine-e-fusion-kfgins-line-unterminated-flow-list = ligne { $lineno } : liste de flux non terminée

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` est une liste, un scalaire est attendu

engine-e-fusion-kfgins-missing = `{ $k }` manquant

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` doit être une liste de trois éléments

engine-e-fusion-kfgins-no-imu-sample-at-or = aucun échantillon IMU à starttime ou après

engine-e-fusion-kfgins-imu-time-not-increasing-at = temps IMU non croissant à { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } doit être fini et > 0, reçu : { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m doit être fini et > 0, reçu : { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg doit être dans [-90, 90), reçu : { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = ligne { $v1 } du CSV de trajectoire : pas des nombres : { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = ligne { $v1 } du CSV de trajectoire : 10 colonnes attendues, { $v } reçues

engine-e-fusion-trajectory-trajectory-csv-line-time-does = ligne { $v1 } du CSV de trajectoire : le temps n'est pas croissant

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = le CSV de trajectoire nécessite au moins deux lignes

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = le CSV de trajectoire couvre { $rows } s mais le scénario dure { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = ciel : lat_deg du site doit être dans [-90, 90] et chaque champ fini

engine-e-geometry-sky-is-neither-gnss-preset = ciel : "{ $name }" n'est ni un préréglage GNSS ({ $e_gnss }) ni un préréglage LEO ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = ciel : donnez l'utilisateur par `site` ou `user_ecef_m`, pas les deux

engine-e-geometry-sky-user-ecef-must-be = ciel : user_ecef_m doit être fini et différent du géocentre

engine-e-geometry-sky-satellite-azimuth-elevation-out = ciel : satellite { $id } : azimut/élévation hors plage

engine-e-geometry-sky-satellite-is-given-in = ciel : le satellite { $id } est donné en ECEF ; la requête nécessite `site` ou `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = ciel : satellite { $id } : position ECEF non finie

engine-e-geometry-sky-satellite-coincides-with-the = ciel : le satellite { $id } coïncide avec l'utilisateur

engine-e-geometry-sky-satellite-give-az-deg = ciel : satellite { $id } : donnez az_deg et el_deg, ou ecef_m, et rien d'autre

engine-e-geometry-sky-tle-is-bytes-the = ciel : tle fait { $text } octets ; le plafond est { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = jeu d'éléments refusé : { $e }

engine-geometry-sky-tle-holds-no-complete =
    { $n_ignored ->
        [one] ciel : tle ne contient aucun jeu d'éléments complet à deux lignes ; { $n_ignored } ligne ignorée, la première : { $first }
        [many] ciel : tle ne contient aucun jeu d'éléments complet à deux lignes ; { $n_ignored } de lignes ignorées, la première : { $first }
       *[other] ciel : tle ne contient aucun jeu d'éléments complet à deux lignes ; { $n_ignored } lignes ignorées, la première : { $first }
    }


engine-e-geometry-sky-epoch = ciel : epoch : { $e }

engine-geometry-and-more = { "." }.. et { $more } autres

engine-geometry-element-sets-propagated-by-the =
    { $n ->
        [one] { $n } jeu d'éléments propagé par le SGP4 du moteur (WGS-72) jusqu'à { $iso } puis tournés vers le repère terrestre, avec UT1 pris égal à UTC et sans mouvement du pôle : le ciel que ce jeu d'éléments donne à cette époque, et non une mesure de celui-ci.
        [many] { $n } de jeux d'éléments propagés par le SGP4 du moteur (WGS-72) jusqu'à { $iso } puis tournés vers le repère terrestre, avec UT1 pris égal à UTC et sans mouvement du pôle : le ciel que ces jeux d'éléments donnent à cette époque, et non une mesure de celui-ci.
       *[other] { $n } jeux d'éléments propagés par le SGP4 du moteur (WGS-72) jusqu'à { $iso } puis tournés vers le repère terrestre, avec UT1 pris égal à UTC et sans mouvement du pôle : le ciel que ces jeux d'éléments donnent à cette époque, et non une mesure de celui-ci.
    }


engine-geometry-element-sets-propagated-by-the-2 =
    { $n ->
        [one] { $n } jeu d'éléments propagé par le SGP4 du moteur (WGS-72) jusqu'à l'époque du jeu d'éléments le plus récent plus time_s ({ $iso }). Aucune époque n'a été donnée ; il s'agit donc d'un ciel représentatif, et non du ciel d'une date indiquée.
        [many] { $n } de jeux d'éléments propagés par le SGP4 du moteur (WGS-72) jusqu'à l'époque du jeu d'éléments le plus récent plus time_s ({ $iso }). Aucune époque n'a été donnée ; il s'agit donc d'un ciel représentatif, et non du ciel d'une date indiquée.
       *[other] { $n } jeux d'éléments propagés par le SGP4 du moteur (WGS-72) jusqu'à l'époque du jeu d'éléments le plus récent plus time_s ({ $iso }). Aucune époque n'a été donnée ; il s'agit donc d'un ciel représentatif, et non du ciel d'une date indiquée.
    }


engine-e-geometry-sky-give-systems-or-tle = ciel : donnez `systems` ou `tle` (avec un `site`), ou `satellites`

engine-e-geometry-sky-tle-system-names-the = ciel : tle_system nomme les satellites de `tle` ; la requête n'a pas de `tle`

engine-e-geometry-sky-mask-deg-must-be = ciel : mask_deg doit être dans [-90, 90), reçu : { $m }

engine-e-geometry-sky-systems-needs-site-or = ciel : `systems` nécessite un `site` (ou `user_ecef_m`) d'où observer

engine-e-geometry-sky-time-must-be-finite = ciel : time_s doit être fini

engine-e-geometry-sky-system-asks-for-satellites = ciel : le système "{ $name }" demande { $asked } satellites ; une requête en contient au plus { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = ciel : plus de { $MAX_SATELLITES } satellites

engine-e-geometry-sky-tle-needs-site-or = ciel : `tle` nécessite un `site` (ou `user_ecef_m`) d'où observer

engine-e-geometry-sky-more-than-satellites-above = ciel : plus de { $MAX_SATELLITES } satellites au-dessus de l'horizon

engine-e-geometry-sky-sigma-uere-must-be = ciel : sigma_uere_m doit être positif, reçu : { $sigma }

engine-e-geometry-sky-confidence-must-be-in = ciel : confidence doit être dans (0, 1), reçu : { $confidence }

engine-e-geometry-sky-more-than-systems-in = ciel : plus de { $MAX_CLOCKS } systèmes en vue, chacun avec sa propre horloge ; regroupez les satellites sous moins d'étiquettes `system` ou utilisez clock = "common"

engine-e-geometry-sky-must-be-in-got = ciel : n doit être dans 1..={ $MAX_MC_SAMPLES }, reçu : { $n }

engine-e-geometry-sky-too-few-satellites-in = ciel : trop peu de satellites en vue pour une solution ; pas de nuage Monte Carlo

engine-e-geometry-sky = ciel : { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = ciel TLE à { $e }, et non une mesure

engine-e-geometry-invalid-sky-request-json = requête de ciel invalide (JSON) : { $e }

engine-e-geometry-invalid-sky-request-toml = requête de ciel invalide (TOML) : { $e }

engine-e-geometry-invalid-skyline-json = ligne d'horizon invalide (JSON) : { $e }

engine-e-geometry-invalid-skyline-toml = ligne d'horizon invalide (TOML) : { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = PRN GLONASS invalide dans { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = le type de page { $pt } n'est pas encodé ici

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } bits, { $DATA_BITS } attendus

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } bits, { $PAGE_BITS } attendus

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = les bits de queue ne sont pas nuls

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q non concordant

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = le type de page { $pt } n'est pas décodé ici

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } symboles, { $PAGE_SYMBOLS } attendus

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = motif de synchronisation introuvable

engine-e-gnss-navmsg-gal-fnav-page-type-missing = type de page { $t } manquant

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav du type de page { $t } diffère du type de page 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = aucun champ Galileo { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = le type de mot { $wt } n'est pas encodé ici

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } bits, { $WORD_BITS } attendus

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = le type de mot { $wt } n'est pas décodé ici

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = les parties de page doivent faire 120 bits

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = les indicateurs pair/impair ne sont pas 0 puis 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = pas une page nominale (le type de page 1 est une page d'alerte)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } bits, { $PART_BITS } attendus

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } symboles, { $PART_SYMBOLS } attendus

engine-e-gnss-navmsg-gal-inav-word-type-missing = type de mot { $t } manquant

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav du type de mot { $t } diffère du type de mot 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = l'enregistrement est du système { $system }, et non Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = le type 10 n'a pas de champ { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = le type 11 n'a pas de champ { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = le type 30 n'a pas de champ { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = le corps CNAV fait { $body } bits, 238 attendus

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } ou comptage TOW { $tow_count } hors plage

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } bits, { $MESSAGE_BITS } attendus

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = le préambule n'est pas 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = le type de message { $t } n'est pas décodé ici

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = un message de type 10 et un message de type 11 sont nécessaires

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name } : { $value } au LSB { $value2 } ne tient pas dans { $bits } { $v4 } bits

engine-e-gnss-navmsg-bits-layout-needs = { $bits } bits, la structure en nécessite { $need }

engine-e-gnss-navmsg-no-field = aucun champ { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } à l'échelle 2^{ $scale_pow2 } ne tient pas dans { $bits } { $v1 } bits

engine-e-gps-lnav-no-value-for = aucune valeur pour { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map : le modèle de référence "gfc" nécessite `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map : impossible de lire gfc_path { $path } : { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map : modèle de référence `{ $other }` inconnu (utilisez "egm2008" ou "gfc")

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map : ellipsoïde `{ $other }` inconnu (utilisez "wgs84" ou "grs80")

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map : map_error_mc.realisations doit valoir au moins 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map : map_error_mc.realisations est plafonné à 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = réel '{ $t }' invalide

engine-e-gravity-pds-bad-integer = entier '{ $t }' invalide

engine-e-gravity-pds-empty-shadr-table = table SHADR vide

engine-e-gravity-pds-shadr-header-has-fields-expected = l'en-tête SHADR a { $f } champs, au moins 6 attendus

engine-e-gravity-pds-shadr-header-negative-degree-order = en-tête SHADR : degré/ordre négatif ou normalisation inconnue

engine-e-gravity-pds-shadr-normalization-state-only-fully = état de normalisation SHADR { $normalization } (seul l'état 1, entièrement normalisé, est pris en charge)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = la longitude/latitude de référence SHADR doit être 0

engine-e-gravity-pds-non-physical-gm-must-be = GM non physique (doit être fini et positif)

engine-e-gravity-pds-non-physical-reference-radius-must = rayon de référence non physique (doit être fini et positif)

engine-e-gravity-pds-shadr-record-fields = enregistrement SHADR { $v1 } : { $f } champs

engine-e-gravity-pds-shadr-record-bad = enregistrement SHADR { $v1 } : (n, m) = ({ $n }, { $m }) invalide

engine-e-gravity-pds-shadr-record-non-finite-coefficient = enregistrement SHADR { $v1 } : coefficient non fini

engine-e-gravity-pds-no-shadr-coefficient-records = aucun enregistrement de coefficients SHADR

engine-e-gravity-pds-shadr-table-incomplete-missing = table SHADR incomplète : (n, m) = ({ $n }, { $m }) manquant

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = earth_gravity_constant / gravity_constant manquant

engine-e-gravity-sh-missing-radius = radius manquant

engine-e-gravity-sh-non-physical-earth-gravity-constant = earth_gravity_constant non physique (doit être fini et positif)

engine-e-gravity-sh-non-physical-radius-must-be = radius non physique (doit être fini et positif)

engine-e-gravity-sh-no-gfc-coefficient-lines = aucune ligne de coefficients gfc

engine-e-gravity-sh-read-error = erreur de lecture : { $e }

engine-e-gravity-sh-line-norm-is-not-supported = ligne { $lineno } : norm { $v } n'est pas pris en charge (fully_normalized uniquement)

engine-gravity-sh-line-bad = ligne { $lineno } : { $what } invalide

engine-e-gravity-sh-line-degree-above-the-declared = ligne { $lineno } : degré { $n } au-dessus du max_degree déclaré { $dm }

engine-e-gravity-sh-line-order-above-degree = ligne { $lineno } : ordre { $m } au-dessus du degré { $n }

engine-e-gravity-sh-line-time-variable-term-is = ligne { $lineno } : le terme variable dans le temps `{ $key }` n'est pas pris en charge (modèles statiques uniquement)

engine-e-gravity-sh-missing-end-of-head = end_of_head manquant

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s doit être positif, reçu : { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s doit être positif, reçu : { $duration_s }

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    { $n ->
        [one] le scénario produit { $n } époque (≥ 2 nécessaires) ; augmentez duration_s ou diminuez step_s
        [many] le scénario produit { $n } d'époques (≥ 2 nécessaires) ; augmentez duration_s ou diminuez step_s
       *[other] le scénario produit { $n } époques (≥ 2 nécessaires) ; augmentez duration_s ou diminuez step_s
    }


## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = l'enregistrement contient une erreur de temps non finie

engine-e-holdover-test-unknown-mask-expected-one-of = masque { $id } inconnu ; l'un des suivants est attendu : { $masks }

engine-e-holdover-test-every-budget-max-abs-te = chaque max_abs_te_ns de budget doit être fini et positif

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } se situe hors de l'enregistrement ({ $t0_s } à { $t_end } s sur son propre axe de temps)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } doit être postérieur à gnss_removed_s ({ $gnss_removed_s }) et ne pas dépasser la fin de l'enregistrement ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = l'étape de holdover ne contient aucun échantillon

engine-holdover-test-the-record-has-no-step = l'enregistrement n'a pas d'étape { $step } : le GNSS a été retiré dès son premier échantillon

engine-holdover-test-the-step-has-samples-the = l'étape { $step } compte { $te_ns } échantillons ; les estimateurs en exigent au moins 13

engine-e-holdover-test-step-with-mask-has-no = une étape avec masque n'a pas de courbe

engine-e-holdover-test-cannot-read-csv-path = impossible de lire csv_path { $path } : { $e }

engine-holdover-test-holdover-test-holdover-max-te = holdover-test : holdover { $hold } s, max|TE| { $max_abs } ns ; { $masks } (MODELLED, mesuré par rapport au masque)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m doit être fini et > 0, reçu : { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba doit être >= 0 et coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED : les deux branches ne sont pas à un temps de moyennage commun. La branche optique accumule sur integration_s = { $integration_s } s ; la largeur de bande de bruit de boucle de la branche RF B_L = { $dll_bandwidth_hz } Hz moyenne sur 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Un rapport de deux sigmas pris à des temps de moyennage différents n'est pas une comparaison ; aucun n'est donc cité. Retirez le remplacement rf_dll_bandwidth_hz (il vaut alors par défaut 1/(2*integration_s)) ou fixez-le à { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED : une branche n'est pas un sigma positif fini utilisable (optique { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m) ; aucun rapport n'est donc formé.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = rf_band '{ $other }' inconnu (s|x|ka attendu)

engine-e-hybrid-integrity-must-be-finite = { $name } doit être fini

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db doit être fini et >= 0

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    { $n_sites ->
        [one] hybrid-optical-rf | empreinte optique { $footprint_m } m, { $detected_photons } photons -> σ de distance { $c } mm, σ de datation { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilité { $c4 } % ({ $n_sites } site) | transfert sans saut { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjoint { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Vérifié par référence externe indépendante : CRLB/χ²-PL/union/transfert ; calculé à partir d'un modèle : σ/climatologie
        [many] hybrid-optical-rf | empreinte optique { $footprint_m } m, { $detected_photons } photons -> σ de distance { $c } mm, σ de datation { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilité { $c4 } % ({ $n_sites } de sites) | transfert sans saut { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjoint { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Vérifié par référence externe indépendante : CRLB/χ²-PL/union/transfert ; calculé à partir d'un modèle : σ/climatologie
       *[other] hybrid-optical-rf | empreinte optique { $footprint_m } m, { $detected_photons } photons -> σ de distance { $c } mm, σ de datation { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | disponibilité { $c4 } % ({ $n_sites } sites) | transfert sans saut { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | FoM conjoint { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Vérifié par référence externe indépendante : CRLB/χ²-PL/union/transfert ; calculé à partir d'un modèle : σ/climatologie
    }


## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa doit être dans [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class doit être >= 1

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | détecteur { $detector } | AUC { $auc_in } en échantillon / { $auc_out } hors échantillon (écart { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ cible { $target_pfa } | { $n_cases } cas | MODELLED synthétique

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = détecteur '{ $other }' inconnu (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = imu_grade { $other } inconnu ; l'un des suivants est attendu : navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = combination { $other } inconnue ; l'une des suivantes est attendue : rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = trn_fix_mode { $other } inconnu ; l'un des suivants est attendu : none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } doit être fini et non négatif (reçu : { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m doit nommer au moins un seuil

engine-e-inertial-coast-crossing-thresholds-entries-must-be = les entrées de crossing_thresholds_m doivent être finies et positives (reçu : { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades doit nommer au moins une classe d'IMU

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s doit être fini et non négatif (reçu : { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 doit être fini et non négatif (reçu : { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg doit être fini et dans (-89, 89) (reçu : { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m doit être dans [-1000, 100000] (reçu : { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s doit être positif

engine-e-inertial-coast-drift-band-must-satisfy-lo = la bande de dérive doit satisfaire 0 < lo < hi (reçu : lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = sérialisation du résultat ins-trn-coast : { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | IMU { $grade }, { $speed } m/s, combinaison { $comb } | { $heads } | TRN { $mode } pic { $peak_error_m } m sur { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va dérivé de la physique de l'interféromètre à atomes froids)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = le scénario fait { $toml_text } octets, au-delà de la limite de { $max_bytes } octets

engine-e-inline-only-the-scenario-kind-reads-its = le type de scénario `{ $kind }` lit ses données dans des fichiers de l'hôte ; cette interface ne l'exécute donc pas ; utilisez la ligne de commande `kshana`

engine-e-inline-only-the-field-names-file-this = le champ `{ $k }` désigne un fichier : cette interface n'accepte que du contenu en ligne

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip : { $e }

engine-e-interference-map-adsb-trace-json = JSON de trace : { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = jeu de données `{ $key }` inconnu ; reconnus : { $v1 }, ou un jeu de données personnalisé

engine-e-interference-map-api-dataset-is-data-but-the = le jeu de données `{ $key }` contient des données { $kind } mais le type d'entrée est { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } n'est pas une date YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = option `{ $a }` inconnue

engine-e-interference-map-cli-expected-positional-argument-got = { $positionals } argument(s) positionnel(s) attendu(s), { $pos } reçu(s)

engine-e-interference-map-cli-cannot-read = impossible de lire { $path } : { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom nécessite { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } existe déjà ; Kshana n'écrase pas les cartes. Supprimez-le ou choisissez un autre répertoire --out

engine-interference-map-cli-note-cell-deg-is-not = note : --cell-deg { $cell_deg } n'est pas la taille de cellule préenregistrée ({ $PREREGISTERED_CELL_DEG }) ; les cartes le signalent

engine-e-interference-map-cli-cannot-create = impossible de créer { $out } : { $e }

engine-interference-map-cli-wrote-cells-published-flagged = { $path } écrit : { $cells } cellules publiées, { $n_deg } signalées

engine-interference-map-cli-no-usable-rows-nothing-written = aucune ligne utilisable : rien n'a été écrit

engine-e-interference-map-cli-unknown-subcommand = sous-commande `{ $other }` inconnue

engine-e-interference-map-cli-the-downloaded-file-sha-256 = le SHA-256 du fichier téléchargé ({ $got }) ne correspond pas à la valeur épinglée ({ $expected }) ; il a été écarté

engine-e-interference-map-cli-cannot-write = impossible d'écrire { $dest } : { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl est introuvable dans PATH. Installez curl, ou téléchargez { $NATURAL_EARTH_LAND_URL } vous-même et vérifiez que son SHA-256 est { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = impossible d'exécuter curl : { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = { $out } écrit : polygones terrestres Natural Earth, SHA-256 vérifié (domaine public, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = aucun fichier trace_full_* sous { $path }

engine-e-interference-map-cli-cannot-read-2 = impossible de lire { $spec } : { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } n'est pas une date YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f } : date de carte invalide

engine-e-interference-map-cli-cannot-write-2 = impossible d'écrire { $out } : { $e }

engine-interference-map-cli-route-length-km = longueur de la route { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Réserves : une cellule dégradée n'identifie pas l'interférence comme cause ; les cellules non observées ne prouvent pas que la route est dégagée ; ceci n'est pas une prévision.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = polygones terrestres : JSON invalide : { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = colonne obligatoire `{ $name }` manquante

engine-e-interference-map-cannot-read-input = impossible de lire l'entrée : { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` n'est pas une date (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours doit valoir { $MIN_DELAY_HOURS } ou plus : l'observatoire ne publie pas plus tôt

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg doit valoir { $MIN_CELL_DEG } ou plus grossier : l'observatoire ne publie que des cellules grossières

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } n'est pas encore publiable : son produit n'est diffusé que { $fmt_utc } au plus tôt ({ $delay_hours } h après la fin du jour)

engine-interference-map-observatory-kshana-observatory-ads = OBSERVATOIRE KSHANA  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = CELLULES DE { $trim_deg } DEG  JOUR UTC  NOT OBSERVED NE VEUT PAS DIRE DÉGAGÉ  AUCUNE CAUSE ATTRIBUÉE

engine-interference-map-observatory-source-licence = SOURCE { $dataset }  LICENCE { $dataset2 }

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (CELLULES PUBLIÉES)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Observatoire Kshana, carte de précision de navigation ADS-B, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = impossible de créer { $path } (Kshana n'écrase pas les produits) : { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = l'entrée ne contient aucun rapport exploitable pour { $day } (jours trouvés : { $days })

engine-interference-map-observatory-observatory-adsb = observatory-adsb-{ $key }-{ $day }

engine-interference-map-observatory-incidents-json = { $stem }.incidents.json

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } existe déjà ; Kshana n'écrase pas les produits

engine-interference-map-observatory-manifest-json = { $stem }.manifest.json

engine-interference-map-observatory-cells-published-degraded-incident = { $p } cellules publiées, { $p2 } dégradées, { $p3 } incident(s)

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } lignes rejouées sous { $variants } variantes : { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = la carte n'est pas du JSON valide : { $e }

engine-e-interference-map-route-route-invalid-json = route : JSON invalide : { $e }

engine-e-interference-map-route-route-line-is-not-lat = route : la ligne { $v1 } n'est pas `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Export Kshana { $v1 }. Époque : { $epoch_note }. Objets mobiles : GCRS (referenceFrame INERTIAL), mètres, secondes après l'époque. Sites fixes : WGS 84 fixe par rapport à la Terre (referenceFrame FIXED), mètres.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Position : GCRS, mètres.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Latitude { $lat_deg } deg, longitude { $lon_deg } deg, hauteur { $h_m } m au-dessus de l'ellipsoïde WGS 84. Position : fixe par rapport à la Terre, mètres.

engine-interop-czml-radius-along-the-ground = { $description }. Rayon { $radius_m } m le long du sol.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Sans horodatage : longitude et latitude WGS 84 en degrés, plaquées au sol.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Positions fixes par rapport à la Terre ; une MultiLineString est coupée à l'antiméridien, et times_utc ne liste alors que les échantillons d'origine.

engine-interop-geojson-kshana-export-epoch = Export Kshana { $v1 }. Époque : { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = GeoJSON invalide : { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = la LineString n'a pas de tableau coordinates

engine-e-interop-geojson-an-rfc-7946-linestring-needs = une LineString RFC 7946 nécessite au moins deux positions

engine-interop-geojson-position-is-not-an-array = la position { $i } n'est pas un tableau de deux ou trois nombres

engine-interop-geojson-position-longitude-is-not-number = position { $i } : la longitude n'est pas un nombre

engine-interop-geojson-position-latitude-is-not-number = position { $i } : la latitude n'est pas un nombre

engine-e-interop-geojson-position-longitude-is-outside-180 = position { $i } : la longitude { $lon } est hors de [-180, 180] (GeoJSON place la longitude en premier)

engine-e-interop-geojson-position-latitude-is-outside-90 = position { $i } : la latitude { $lat } est hors de [-90, 90] (GeoJSON place la longitude en premier)

engine-e-interop-geojson-track-needs-two-or-more = une trajectoire nécessite au moins deux points de passage

engine-e-interop-geojson-the-route-spans-more-than = la route couvre plus de 180 degrés de longitude ; les types de trajectoire avancent en degrés simples et ne peuvent pas franchir l'antiméridien

engine-e-interop-geojson-position-is-deg-from-an = la position { $worst } est à { $worst2 } deg d'une trajectoire rectiligne à espacement régulier (tolérance { $tol_deg } deg) ; les types de trajectoire suivent début + i*pas, donnez donc des positions régulièrement espacées sur une droite, ou seulement les deux extrémités

engine-e-interop-geojson-route-applies-to-the-kinds = une route s'applique aux types qui suivent une trajectoire de points de passage (terrain-nav, terrain-slam, gravity-map, combined-altpnt) ; `{ $k }` n'accepte aucune entrée de trajectoire

engine-e-interop-geojson-scenario-toml-is-not-table = le TOML de scénario n'est pas une table

engine-e-interop-geojson-cannot-serialise-scenario = impossible de sérialiser le scénario : { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = format d'export '{ $other }' inconnu ; l'un des formats czml, kml, geojson, stk, sigmf, all ou list est attendu

engine-e-interop-member = membre { $label } : { $e }

engine-interop-the-scenario-could-not-be = le scénario n'a pas pu être exporté : { $m }

engine-e-interop-invalid-spectrum-scenario = scénario de spectre invalide : { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } échantillon temporel dépasse ce qu'un export écrit ({ $MAX_SAMPLES })
        [many] { $n } d'échantillons temporels dépassent ce qu'un export écrit ({ $MAX_SAMPLES })
       *[other] { $n } échantillons temporels dépassent ce qu'un export écrit ({ $MAX_SAMPLES })
    }


engine-e-interop-scene-objects-samples-is-more-than = { $items } objets x { $times } échantillons dépassent ce qu'un export écrit ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = scénario { $kind } invalide : { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = brouilleur { $jammer_type }, puissance d'émission { $power_dbw } dBW, gain d'antenne { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what } ; { $r } m, d'après les équations de liaison du type jamming, le brouilleur étant à l'horizon du récepteur, avec perte en espace libre

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (étape [pass] de la chaîne)

engine-interop-scene-circular-orbit-km-altitude-deg = orbite circulaire, altitude { $altitude_km } km, inclinaison { $inclination_deg } deg (éléments moyens SGP4 au début de la fenêtre, tels que le type passes les propage)

engine-interop-scene-ground-station-deg-elevation-mask = station au sol, masque d'élévation { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source } ; les états GCRS et fixes par rapport à la Terre sont la sortie propre du type ephemeris (UT1 et mouvement du pôle tels que le scénario les définit)

engine-interop-scene-static-scene-the-kind-flies = scène statique : le type { $kind } suit une trajectoire sans horodatage de points de passage

engine-interop-scene-true-track-flown-gps-denied = trajectoire vraie suivie sans GPS : { $track } points de passage à partir de start_lat_deg/start_lon_deg par pas de step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` n'a pas de scène

engine-e-interop-scene-missing-numeric = `{ $k }` numérique manquant

engine-e-interop-scene-missing-integer-waypoints = `waypoints` entier manquant

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } est hors de 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } à { $altitude_km } km, inclinaison { $inclination_deg } deg (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = le scénario ne donne pas d'`epoch` ; t = 0 est { $epoch }, la plus ancienne époque contenue dans les données propres des satellites (époque TLE, d'éphéméride diffusée ou SP3). Chaque satellite est propagé depuis sa propre époque, et celles-ci s'étendent sur { $spread_h } h : les étiquettes de temps suivent la prémisse du moteur selon laquelle tous les satellites partent de t = 0, tandis que chaque position est tournée dans les référentiels GCRS et fixe par rapport à la Terre à l'instant propre de ce satellite. Les exports SP3 et OEM étiquettent à la place t = 0 comme 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = le scénario ne donne pas d'`epoch` ; t = 0 est { $epoch }, l'époque contenue dans les données propres des satellites (époque TLE, d'éphéméride diffusée ou SP3). Les exports SP3 et OEM étiquettent à la place t = 0 comme 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } objets x { $times_s } échantillons dépassent ce qu'un export écrit ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = utilisateur { $user_environment }, en mouvement (vitesse et cap constants du type)

engine-interop-scene-user-receiver = utilisateur { $user_environment } (récepteur)

engine-interop-scene-user-orbit-km-altitude-deg = orbite de l'utilisateur, altitude { $altitude_km } km, inclinaison { $inclination_deg } deg (képlérienne{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = aucun objet mobile { $index }

engine-interop-stk-kshana-export-object = # Export Kshana { $v1 } : { $scene }, objet { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = brouilleur { $jammer_type }, puissance d'émission { $power_dbw } dBW, gain d'antenne { $gain_dbi } dBi (paramètre du bilan de liaison du scénario, et non un signal)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` n'a aucune trajectoire de véhicule à exporter ; l'export pour banc d'essai couvre les types gnss-ins, jamming et gnss-sim

engine-e-interop-testbench-empty-motion-csv = CSV de mouvement vide

engine-e-interop-testbench-motion-csv-header-is-not = l'en-tête du CSV de mouvement n'est pas celui des colonnes attendues : { $head }

engine-e-interop-testbench-row-fields-expected = ligne { $v1 } : { $f } champs, { $motion_columns } attendus

engine-e-interop-testbench-row-column-is-not-number = ligne { $v1 } : la colonne { $motion_columns } n'est pas un nombre

engine-e-interop-testbench-line-no = ligne { $v1 } : pas de `$`

engine-e-interop-testbench-line-no-checksum = ligne { $v1 } : pas de somme de contrôle

engine-e-interop-testbench-line-bad-checksum-field = ligne { $v1 } : champ de somme de contrôle invalide

engine-e-interop-testbench-line-checksum-mismatch = ligne { $v1 } : somme de contrôle discordante

engine-e-interop-testbench-line-short-gga = ligne { $v1 } : GGA trop court

engine-interop-testbench-line-bad-latitude = ligne { $v1 } : latitude invalide

engine-interop-testbench-line-bad-longitude = ligne { $v1 } : longitude invalide

engine-e-interop-testbench-line-bad-altitude = ligne { $v1 } : altitude invalide

engine-e-interop-testbench-line-bad-separation = ligne { $v1 } : séparation invalide

engine-e-interop-testbench-line-short-rmc = ligne { $v1 } : RMC trop court

engine-e-interop-testbench-line-rmc-with-no-preceding = ligne { $v1 } : RMC sans GGA précédent

engine-e-interop-testbench-line-gga-and-rmc-times = ligne { $v1 } : les temps GGA et RMC diffèrent

engine-e-interop-testbench-line-bad-speed = ligne { $v1 } : vitesse invalide

engine-e-interop-testbench-line-bad-course = ligne { $v1 } : route invalide

engine-e-interop-testbench-line-bad-time-or-date = ligne { $v1 } : heure ou date invalide

engine-e-interop-testbench-gga-with-no-following-rmc = un GGA sans RMC suivant

engine-e-interop-testbench-waypoint-file-needs-at-least = un fichier de points de passage nécessite au moins deux échantillons

engine-e-interop-testbench-the-sample-step-is-not = le pas d'échantillonnage { $step } s n'est pas un nombre entier de millisecondes

engine-e-interop-testbench-the-samples-are-not-equally = les échantillons ne sont pas régulièrement espacés : l'intervalle { $v1 } vaut { $dt } s, le premier vaut { $step } s

engine-e-interop-testbench-empty-waypoint-file = fichier de points de passage vide

engine-e-interop-testbench-waypoint-not-three-numbers = point de passage { $v1 } : pas trois nombres

engine-e-interop-testbench-waypoint-fields-expected = point de passage { $v1 } : { $f } champs, 3 attendus

engine-e-interop-testbench-events-csv-header-is-not = l'en-tête du CSV d'événements n'est pas label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = ligne d'événement { $v1 } : 5 champs attendus

engine-e-interop-testbench-event-row-unknown-kind = ligne d'événement { $v1 } : type { $f } inconnu

engine-e-interop-testbench-event-row-bad-onset = ligne d'événement { $v1 } : début invalide

engine-e-interop-testbench-event-row-bad-end = ligne d'événement { $v1 } : fin invalide

engine-interop-testbench-events-label-kind-onset-end =
    { "\u000A" }{ "[" }[events]]
    label = { $label }
    kind = { $kind }
    onset_s = { $round_dp }
    end_s = { $round_dp2 }{ "\u000A" }

engine-interop-testbench-no-waypoints-txt-written = aucun .waypoints.txt écrit : { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = pas un temps UTC `YYYY-MM-DDTHH:MM:SS` : { $why } : { $text }

## src/ionex.rs

engine-e-ionex-missing = { $what } manquant

engine-e-ionex-bad-number-in = { $what } : nombre invalide dans { $col }

engine-e-ionex-two-digit-year = { $what } : année à deux chiffres { $year }

engine-e-ionex-no-end-of-header = aucun END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = les cartes IONEX dépendant de la hauteur (3-D) ne sont pas prises en charge

engine-e-ionex-zero-grid-step = pas de grille nul

engine-e-ionex-grid-needs-at-least-nodes = la grille nécessite au moins 2 x 2 nœuds

engine-e-ionex-map-no = carte { $index } : aucun { $end_label }

engine-e-ionex-map-band-latitude-header-grid = carte { $index } : la bande { $band } a la latitude { $band_lat }, la grille d'en-tête { $want }

engine-e-ionex-map-band-longitudes-differ = carte { $index } : les longitudes de la bande { $band } diffèrent

engine-e-ionex-map-band-truncated = carte { $index } : bande { $band } tronquée

engine-e-ionex-map-bands-header-grid-has = carte { $index } : { $band } bandes, la grille d'en-tête en a { $n_lat }

engine-e-ionex-map-no-epoch-of-current = carte { $index } : aucun EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = { $tec_maps } cartes TEC, en-tête # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = les époques des cartes TEC ne sont pas croissantes

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz ne contient pas un nombre entier d'échantillons par période { $code } ({ $spc } échantillons)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods et noncoherent doivent être positifs

engine-e-iq-acq-stream-ended-after-of-samples = le flux s'est terminé après { $got } échantillons sur { $needed }

engine-e-iq-acq-cfar-reference-cells-must-be = les cellules de référence CFAR doivent être en nombre pair et au moins 2 (reçu : { $n })

engine-e-iq-acq-cfar-stride-must-be-at = le pas CFAR doit être d'au moins 1 décalage

engine-e-iq-acq-cfar-per-cell-pfa-must = la Pfa CFAR par cellule doit être comprise dans (0, 1) (reçu : { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = la fenêtre CFAR s'étend sur { $reach } décalages de chaque côté, trop large pour une période de { $samples_per_period } décalages

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = format de surface { $s } inconnu : csv, json ou bin est attendu

engine-e-iq-acq-surface-the-surface-would-hold-cells = la surface contiendrait { $spc_cells } cellules (limite { $MAX_SURFACE_CELLS }) : élargissez le pas Doppler ou réduisez la plage Doppler

engine-e-iq-acq-surface-surface-header = en-tête de surface : { $e }

engine-e-iq-acq-surface-surface-schema-expected = schéma de surface { $schema } ; { $SURFACE_SCHEMA } attendu

engine-e-iq-acq-surface-surface-body = corps de surface : { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = enregistrement '{ $id }' : format et sample_rate_hz doivent être donnés ensemble

engine-e-iq-campaign-conditions-test-conditions-json = conditions d'essai (JSON) : { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = conditions d'essai (TOML) : { $e }

engine-iq-campaign-conditions-sigmf-meta = { $base }.sigmf-meta

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path } : events_from_sigmf nécessite un enregistrement SigMF (reçu : { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = métadonnées SigMF : { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = métadonnées SigMF : global core:sample_rate est manquant

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at } : core:sample_start est manquant

engine-iq-campaign-conditions-no-core-sample-count-and = { $at } : ni core:sample_count ni points de puissance pour terminer l'événement

engine-e-iq-campaign-conditions-kshana-test-event = { $at } : kshana:test_event : { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema doit être "{ $SCHEMA }" (reçu "{ $schema }")

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id ne doit pas être vide

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s doit être fini et >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 doit comporter 64 chiffres hexadécimaux

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind doit être "iq" ou "receiver-log" (reçu "{ $k }")

engine-e-iq-campaign-conditions-at-least-one-expected-group = au moins un groupe [[expected]] est requis

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at } : ids ne doit pas être vide

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at } : { $key } liste { $n } valeur ; donnez-en une par id ({ $ids })
        [many] { $at } : { $key } liste { $n } de valeurs ; donnez-en une par id ({ $ids })
       *[other] { $at } : { $key } liste { $n } valeurs ; donnez-en une par id ({ $ids })
    }


engine-e-iq-campaign-conditions-duplicate-id = { $at } : id en double

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at } : offset_s doit être postérieur à onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at } : affects doit être "all" ou une liste d'ids

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at } : l'id affects { $bad } n'est pas dans [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at } : q doit être positif

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at } : power.points ne doit pas être vide

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at } : power.points doit être dans l'ordre chronologique

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at } : power.points doit être fini

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at } : power.quantity = "jammer_dbm" nécessite reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = les événements '{ $id }' et '{ $id2 }' se chevauchent sur un satellite commun

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s doit être >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s doit être positif

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = enregistrement '{ $id }' : le SHA-256 { $sha } ne correspond pas à la valeur indiquée { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl : { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code } : l'enregistrement contient { $buf } échantillons, { $n } nécessaires pour l'acquisition

engine-iq-campaign-runner-events-jsonl = { $key }.events.jsonl

engine-iq-campaign-runner-events-jsonl-tmp = { "." }{ $key }.events.jsonl.tmp{ $pid }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s doit être positif

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db doit être positif

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s doit être >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz doit être positif

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs doit être au moins 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = campagne (JSON) : { $e }

engine-e-iq-campaign-spec-campaign-toml = campagne (TOML) : { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions doit lister au moins un fichier ou un motif glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds doit être >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = les noms de frontal doivent être non vides et uniques ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions : '{ $pat }' ne correspond à aucun fichier

engine-e-iq-campaign-spec-recording-id-appears-in-both = l'id d'enregistrement '{ $w }' apparaît dans { $w2 } et dans { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names nécessite inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names : aucune conception '{ $n }' dans { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = ligne de vérité terrain { $v1 } : { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = profil C/N0 : { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = profil C/N0 : { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segment { $i } : les valeurs de palier doivent être finies

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segment { $i } : une rampe nécessite end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segment { $i } : les points nécessitent des t_s et db de même longueur, non vides

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segment { $i } : t_s doit être strictement croissant

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segment { $i } : les points doivent être finis

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segment { $i } : le S4 d'évanouissement doit être dans (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segment { $i } : le tau_s d'évanouissement doit être positif

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code } : l'enregistrement contient { $samples } échantillons, { $need } nécessaires pour cette recherche

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path } : indiquez le format avec --surface-format csv|json|bin, ou terminez le chemin par .csv, .json ou .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = acquisition : { $fs_hz } Hz, { $coherent_periods } période(s) cohérente(s) x { $noncoherent } non cohérente(s), pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = rapport reconstruit : { $cells_present } cellule(s) sur { $cells_total }, { $rows } ligne(s), { $rows_failed } ne respectant pas un seuil ; condensat { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    campagne { $name } : { $cells_total } cellule(s) ; { $cells_skipped } déjà faite(s), { $cells_run } exécutée(s) maintenant, { $cells_failed } en échec, { $cells_pending } en attente
    sortie : { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    première défaillance ({ $key }…) : { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK : { $events } événement(s), { $tc } satellite(s) attendu(s) ; condensat des conditions { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono oblique { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono verticale { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo doy { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = scint S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = multitrajet { $h }m sol { $multipath_ground }

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground doit être dry, wet ou sea (reçu : { $other })

engine-e-iq-cli-channel-give-at-most-one-of = donnez au plus un parmi --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass attend lo,hi (reçu : { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass nécessite lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } avec une transition de { $transition } Hz ne tient pas sous fs/2 ({ $v1 } Hz) ; réduisez la bande ou la transition

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits doit être 1..=16 (reçu : { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = { $total } échantillons filtrés ({ $fs_hz } Hz) vers { $out } ({ $format }) ; fichier annexe { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = impossible de lire { $path } : { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = scénario labfit invalide : { $e }

engine-iq-cli-labfit-fitted-run-wrote = { $runs } exécution(s) ajustée(s) ; { $written } écrit

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = { $fit_units } unité(s) ajustée(s) à partir de la campagne ; { $written } écrit

engine-iq-cli-labfit-cannot-write = impossible d'écrire { $target } : { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } nécessite une valeur

engine-e-iq-cli-cannot-parse = { $k } : impossible d'analyser { $v }

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } prend { $n } argument positionnel, { $pos } reçu(s)
        [many] iq { $cmd } prend { $n } d'arguments positionnels, { $pos } reçu(s)
       *[other] iq { $cmd } prend { $n } arguments positionnels, { $pos } reçu(s)
    }


engine-e-iq-cli-cannot-parse-2 = { $k } : impossible d'analyser { $p }

engine-iq-cli-unknown-iq-processing-command-expected = commande de traitement iq { $other } inconnue ; scene, acquire, track, sweep, labfit, frontend, monitor, campaign ou conditions est attendu

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = le PRN { $id } est hors plage pour GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = aucune éphéméride GPS saine trouvée pour les PRN demandés

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos attend lat,lon,alt (reçu : { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc } ; profil C/N0 ({ $segments } segment(s))

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format doit être csv ou jsonl (reçu : { $other })

engine-iq-cli-scene-written-by-kshana-iq-scene = écrit par kshana iq scene : une scène SIMULÉE, pas un enregistrement

engine-iq-cli-scene-ion-sdr-metadata = métadonnées ION SDR { $path }

engine-iq-cli-scene-sigmf-data-meta = données SigMF { $data_path }, méta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = écrit par kshana iq scene

engine-iq-cli-scene-wrote-samples-hz-to-truth = { $samples } échantillons ({ $format }, { $fs_hz } Hz) écrits dans { $data_path } ; { $truth_records } enregistrements de vérité terrain dans { $truth_path } ; { $meta_note } ; canal : { $chan_desc }

engine-iq-cli-scene-sigmf-data = { $sigmf_base }.sigmf-data

engine-iq-cli-scene-sigmf-meta = { $sigmf_base }.sigmf-meta

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } ne peut pas être combiné avec --design : sweep exécute toutes les conceptions du fichier

engine-iq-cli-sweep-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $pll }
    { "[" }code]
    bw_hz = { $dll }
    { "[" }integration]
    spacing_chips = { $sp }
    coherent_periods = { $coh }{ "\u000A" }

engine-iq-cli-sweep-pll-dll-sp-coh = pll{ $pll }_dll{ $dll }_sp{ $sp }_coh{ $coh }

engine-iq-cli-sweep-loop-design-sweep-design-prn = balayage de conception de boucle : { $rows } résultat(s) (conception, PRN){ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code } : l'enregistrement contient { $samples } échantillons, { $need } nécessaires pour l'acquisition

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code } : non acquis (statistique { $statistic } < seuil { $threshold }) ; augmentez --doppler-max, --acq-coherent ou --acq-noncoherent, ou vérifiez l'enregistrement

engine-iq-cli-track-designs-and-differ-in-integration = les conceptions { $first } et { $d } diffèrent par integration.extra_taps_chips ; les conceptions d'une même exécution doivent concorder pour que chaque enregistrement de sortie ait les mêmes colonnes

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p } : indiquez le format avec --epochs-format csv|jsonl|bin, ou terminez le chemin par .csv, .jsonl ou .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz font { $r } échantillons par chip de { $c } : un échantillonnage commensurable transforme le discriminateur de code en escalier (à 2 échantillons/chip la DLL oscille, environ { $lit_0_09 } chip d'erreur de code RMS à 45 dB-Hz) ; la gigue et le biais de boucle de code issus de cet enregistrement ne sont pas représentatifs. Utilisez une fréquence qui n'est pas un multiple de la moitié de la cadence de chip pour juger les boucles de code.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = le processus de travail s'est arrêté avant de traiter cette entrée

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = option { $s } inconnue

engine-e-iq-io-cli-format-needs-rate = --format nécessite --rate

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } prend { $n } argument de chemin, { $pos } reçu(s)
        [many] iq { $cmd } prend { $n } d'arguments de chemin, { $pos } reçu(s)
       *[other] iq { $cmd } prend { $n } arguments de chemin, { $pos } reçu(s)
    }


engine-iq-io-cli-unknown-iq-command = commande iq { $other } inconnue

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] { $n } échantillon ({ $to }, { $fs_hz } Hz) écrits dans { $files } ; { $w } élément(s) saturé(s){ $v4 }
        [many] { $n } d'échantillons ({ $to }, { $fs_hz } Hz) écrits dans { $files } ; { $w } élément(s) saturé(s){ $v4 }
       *[other] { $n } échantillons ({ $to }, { $fs_hz } Hz) écrits dans { $files } ; { $w } élément(s) saturé(s){ $v4 }
    }


## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path } : --follow ne lit que les enregistrements monocanal

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path } : --follow lit un enregistrement à une seule capture, celui-ci en a { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path } : aucun core:sample_rate positif

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path } : la capture ne commence pas sur une frontière d'octet

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = format d'échantillon { $name } inconnu : attendu par ex. ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, éventuellement terminé par _qi pour le complexe

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sample_rate_hz { $sample_rate_hz } du fichier annexe n'est pas positif

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path } : les enregistrements .sdrx contiennent un seul flux ; le canal { $channel } n'existe pas

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path } : fichier brut sans fichier annexe ; indiquez son format, ou écrivez { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = impossible de sérialiser la ligne : { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = conception de filtre { $design } invalide : passband_frac dans (0, 1), attenuation > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = la FI { $if_hz } Hz doit être strictement comprise entre 0 et la moitié de la fréquence d'échantillonnage ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx data : { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization } bits { $enc } { $fmt } ({ $packed_bits } bits/échantillon)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = core:datatype SigMF { $datatype } non pris en charge : sont pris en charge ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be et les réels ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } n'est pas un core:datatype SigMF

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = métadonnées SigMF invalides : { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } n'a pas de core:datatype SigMF ; écrivez-le en brut

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name } : core:num_channels { $ch } ne correspond pas à { $c0 } du premier enregistrement

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name } : aucun core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name } : core:sample_rate { $rate } n'est pas positif

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name } : { $f } à { $rate } Hz ne correspond pas à { $f0 } à { $r0 } Hz du premier enregistrement

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $n_file ->
        [one] { $name } : la capture à l'échantillon { $sample_start } est hors d'ordre ou au-delà de l'unique échantillon ({ $n_file }) des données
        [many] { $name } : la capture à l'échantillon { $sample_start } est hors d'ordre ou au-delà des { $n_file } d'échantillons des données
       *[other] { $name } : la capture à l'échantillon { $sample_start } est hors d'ordre ou au-delà des { $n_file } échantillons des données
    }


engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name } : la première capture ne commence pas sur une frontière d'octet

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = canal { $channel } demandé ; l'enregistrement en a { $channels } (les canaux sont numérotés à partir de 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = collection SigMF invalide : { $e }

engine-iq-io-sigmf-stream-sigmf-data = { $base }.sigmf-data

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp } : le SHA-512 { $got } ne correspond pas à { $h } de la collection

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = le flux { $select } sur { $channels } flux entrelacés n'existe pas (les flux sont numérotés à partir de 0)

engine-e-iq-io-stream-sample-of-does-not-start = l'échantillon { $k } de { $format } ne commence pas sur une frontière d'octet

engine-e-iq-io-stream-time-window-start-duration-both = fenêtre temporelle début { $start_s } s, durée { $duration_s } s : les deux doivent être non négatifs

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = Q indiqué le plus dommageable (cw) : aucune valeur de table pour le type `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir } : la campagne n'est pas terminée

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir } : le DIGEST { $on_disk } ne correspond pas aux cellules ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = enregistrement `{ $id }` : le condensat des conditions d'essai { $h } ne correspond pas à la valeur enregistrée { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = signal `{ $signal }` : cadence de chip inconnue

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = aucune exécution n'est utilisable pour l'ajustement du verrouillage : { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = données insuffisantes : non ajusté ({ $m } enregistrements ; au moins { $min_rec } sont nécessaires)

engine-iq-labfit-iqfit-uncensored-span-db-is-under = l'étendue J/S non censurée { $span_db } dB est inférieure à { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff et delta ne sont pas identifiables séparément (|corr| { $full } >= { $v2 }) : le modèle ne dépend que de delta - 10 log10 Q_eff

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    { $n_reacq ->
        [one] non ajusté : { $n_reacq } réacquisition observée (au moins 3 sont nécessaires)
        [many] non ajusté : { $n_reacq } de réacquisitions observées (au moins 3 sont nécessaires)
       *[other] non ajusté : { $n_reacq } réacquisitions observées (au moins 3 sont nécessaires)
    }


engine-iq-labfit-iqfit-loss-time-rms = loss_time_rms_s[{ $model }]

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = mode `{ $m }` inconnu (seulement `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage doit être [lower, upper] dans [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds doit être [lower, upper] avec 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db doit être [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = la campagne n'a aucun événement avec un profil de puissance indiqué à ajuster

## src/iq/labfit/iqreport.rs

# legal: native review
engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Ajustement de laboratoire à partir d'une campagne IQ : { $r }

    Schéma `{ $schema }`, moteur { $engine_version }. Libellé : **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = DIGEST de campagne `{ $campaign_digest }` ; SHA-256 de `campaign.json` `{ $campaign_json_sha256 }` ; SHA-256 du scénario `{ $scenario_sha256 }` ; { $cells } cellules ; { $bootstrap } réplicats bootstrap (graine { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Unité { $i } : { $signal } / { $name } / { $name2 } / { $jammer_type }

    Statut : { $status }. { $recordings } enregistrements, { $satellites } satellites, { $events } événements ; { $bins_used } intervalles ajustés, { $bins_censored } censurés.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = Modèle C/N0 ({ $q_mode }) : `delta_eff` = { $ci } dB (le décalage identifiable, ramené à Q = 1) ; `Q_eff` = { $q } ; `delta` à ce Q = { $ci2 } dB ; corr(Q, delta) { $om } ; RMS résiduel { $residual_rms_db } dB sur une étendue J/S de { $span_db } dB. Q_eff n'est pas identifiable à partir des données C/N0 sans une mesure de puissance indépendante.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q maintenu à sa valeur indiquée : { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over =
    { $n ->
        [one] J/S de seuil, direct : médiane { $om } dB sur { $n } perte (IQR { $t }).{ "\u000A\u000A" }
        [many] J/S de seuil, direct : médiane { $om } dB sur { $n } de pertes (IQR { $t }).{ "\u000A\u000A" }
       *[other] J/S de seuil, direct : médiane { $om } dB sur { $n } pertes (IQR { $t }).{ "\u000A\u000A" }
    }


engine-iq-labfit-iqreport-hold-out-leave-one-recording = Mise de côté (un enregistrement laissé de côté à la fois), interpolation : { $bins } intervalles, RMS C/N0 { $om } dB, couverture PI90 { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 =
    { $n ->
        [one] { $model } : { $n } événement, RMS du temps de perte { $om } s, couverture PI90 { $om2 }
        [many] { $model } : { $n } d'événements, RMS du temps de perte { $om } s, couverture PI90 { $om2 }
       *[other] { $model } : { $n } événements, RMS du temps de perte { $om } s, couverture PI90 { $om2 }
    }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    SHA-256 de la table de validation `{ $table_sha256 }` (enregistrée { $registered }) :

    | seuil | limite | valeur | verdict |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = journal de l'exécution `{ $label }`

engine-e-iq-labfit-run = exécution `{ $label }` : { $e }

engine-e-iq-labfit-the-scenario-input-names-no = le [input] du scénario ne nomme aucune campagne

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign et [[runs]] sont exclusifs : donnez-en un seul

engine-e-iq-labfit-iq-labfit-scenario = scénario iq-labfit : { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = le journal ne contient aucun C/N0 par satellite{ $cfg } (observables : [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = aucune époque avant le début à { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = aucune époque au début ou après le début à { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Ajustement de laboratoire : { $r }

    Libellé : **{ $label }**. SHA-256 des réglages `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { $n_samples ->
        [one] { "\u000A" }{ $n_samples } échantillon C/N0, RMS résiduel { $om } dB.{ $r }{ "\u000A" }
        [many] { "\u000A" }{ $n_samples } d'échantillons C/N0, RMS résiduel { $om } dB.{ $r }{ "\u000A" }
       *[other] { "\u000A" }{ $n_samples } échantillons C/N0, RMS résiduel { $om } dB.{ $r }{ "\u000A" }
    }


engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Modèle : { $model } ({ $label })

    | paramètre | valeur | bornes | à la borne | écart-type bootstrap (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { $n_events ->
        [one]
            { "\u000A" }RMS du temps d'événement { $om } s sur { $n_events } événement ; pertes manquées { $loss_missed } / en trop { $loss_extra }, réacquisitions manquées { $reacq_missed } / en trop { $reacq_extra }.

            | exécution | chute dB-Hz | reverrouillage dB-Hz | événements | RMS s |
            |---|---|---|---|---|{ "\u000A" }
        [many]
            { "\u000A" }RMS du temps d'événement { $om } s sur { $n_events } d'événements ; pertes manquées { $loss_missed } / en trop { $loss_extra }, réacquisitions manquées { $reacq_missed } / en trop { $reacq_extra }.

            | exécution | chute dB-Hz | reverrouillage dB-Hz | événements | RMS s |
            |---|---|---|---|---|{ "\u000A" }
       *[other]
            { "\u000A" }RMS du temps d'événement { $om } s sur { $n_events } événements ; pertes manquées { $loss_missed } / en trop { $loss_extra }, réacquisitions manquées { $reacq_missed } / en trop { $reacq_extra }.

            | exécution | chute dB-Hz | reverrouillage dB-Hz | événements | RMS s |
            |---|---|---|---|---|{ "\u000A" }
    }


engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Mise de côté ({ $scheme }, { $folds } partitions) : tout { $om } s, interpolation { $om2 } s, extrapolation { $om3 } s.

    | exécution mise de côté | classe | distance | exécution d'entraînement la plus proche | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } est réservé à un usage futur (seul FID 0 est défini)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } est hors de 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = { $sb1_err } symbole(s) SB1 en désaccord avec le champ décodé

engine-iq-lunanet-afs-frames-at-and-are-symbols = les trames à { $w } et { $w2 } sont distantes de { $gap } symboles, et non de { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } suit TOI { $w2 }, { $want } attendu

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = caractère { $c } inattendu dans un flux de symboles (seuls 0, 1 et les espaces sont admis)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn } : les 24 premiers chips diffèrent

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn } : les 24 derniers chips diffèrent

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (le document imprime A14850 pour le PRN 147 et le PRN 151 ; le générateur reproduit celui du PRN 151, de sorte que l'entrée du PRN 147 est très probablement une coquille du document)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = codé 0x{ $word }, décodé FID { $fid } TOI { $toi }

## src/iq/monitor/cn0.rs

engine-iq-monitor-cn0-cn0-baseline-dbhz = cn0.{ $l }.baseline_dbhz

engine-iq-monitor-cn0-cn0-arl0-samples-independent = cn0.{ $l }.arl0_samples_independent

engine-iq-monitor-cn0-cn0-arl1-samples-independent = cn0.{ $l }.arl1_samples_independent

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = réglages du moniteur : { $e }

## src/iq/monitor/sqm.rs

engine-iq-monitor-sqm-sqm-pair = sqm_pair_{ $x }

engine-iq-monitor-sqm-sqm-spacing-chips = sqm.{ $label }.spacing_chips

engine-iq-monitor-sqm-sqm-baseline = sqm.{ $label }.{ $name }.baseline

## src/iq/scene/code.rs

engine-iq-scene-code-gps-l1-prn = GPS L1 C/A PRN { $prn }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = position statique non finie

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = trajectoire à vitesse constante non finie

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = la trajectoire de points de passage n'a aucun point de passage

engine-e-iq-scene-geometry-waypoint-not-finite = point de passage non fini

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = les temps des points de passage doivent être strictement croissants

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = le PRN { $prn } n'est pas un PRN GPS C/A

engine-e-iq-scene-ephemeris-system-is-not-gps = le système d'éphéméride { $system } n'est pas GPS

engine-e-iq-scene-satellite = satellite { $value } : { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = est une composante pilote (sans données) et ne porte aucune donnée de navigation

engine-e-iq-scene-nav-carries-data-the-scene-does = porte des données que la scène ne modélise pas ; générez-le sans données

engine-e-iq-scene-nav-does-not-carry-gps-lnav = ne porte pas le LNAV GPS (seul GPS L1 C/A le porte) ; utilisez des données à graine

engine-e-iq-scene-nav-not-an-lnav-source = pas une source LNAV

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = une scène nécessite au moins un satellite (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler liste { $dopplers } valeur(s) ; donnez-en une par --prn ({ $ids }) ou une seule valeur

engine-e-iq-scene-synthetic-data = --data : { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = la ligne de vérité terrain a { $f } champs, 10 attendus

engine-e-iq-scene-truth-truth-field = champ de vérité terrain { $i } : { $e }

engine-e-iq-scene-truth-truth-sat-id = sat_id de vérité terrain : { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz doit être un nombre positif

engine-e-iq-short-duration-must-be-in = duration_s doit être dans (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids doit contenir de 1 à { $MAX_SATELLITES } satellites

engine-e-iq-short-dopplers-must-be-finite = dopplers doit être fini

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] { $n } échantillon demandé ; une exécution courte contient au plus { $MAX_SAMPLES }
        [many] { $n } d'échantillons demandés ; une exécution courte contient au plus { $MAX_SAMPLES }
       *[other] { $n } échantillons demandés ; une exécution courte contient au plus { $MAX_SAMPLES }
    }


## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C données PRN { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C pilote PRN { $prn }

engine-iq-signals-beidou-beidou-b1i-prn = BeiDou B1I PRN { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal } : le PRN { $id } est hors plage

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = le canal de fréquence { $id } de GLONASS L1OF est hors de -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = signal { $other } inconnu ; l'un des suivants est attendu : { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = ligne { $v1 } : pas de ';'

engine-e-iq-signals-galileo-line-no-code-number-in = ligne { $v1 } : aucun numéro de code dans { $label }

engine-e-iq-signals-galileo-code-appears-twice = le code { $number } apparaît deux fois

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $n ->
        [one] { $path } : { $n } code, l'ICD en définit { $CODES_PER_COMPONENT }
        [many] { $path } : { $n } de codes, l'ICD en définit { $CODES_PER_COMPONENT }
       *[other] { $path } : { $n } codes, l'ICD en définit { $CODES_PER_COMPONENT }
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

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q primaire { $primary_prn } S{ $secondary } tertiaire { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primaire { $primary_prn } S{ $secondary } (tertiaire omis)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = caractère non hexadécimal { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } symboles hexadécimaux ne peuvent pas contenir exactement { $len } chips

engine-iq-signals-primary-only = { $name } (primaire seulement)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = le suivi BOC nécessite un espacement avance-retard dans (0, { $max }) chips afin que E et L restent sur le pic principal (reçu : { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = le seuil de bump-jump doit être au moins égal à 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = la fréquence d'échantillonnage doit être positive

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods doit être positif

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows doit être positif

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } doit diviser la longueur de bit { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = au plus { $MAX_EXTRA_TAPS } prises supplémentaires sont prises en charge (reçu : { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = les décalages des prises supplémentaires doivent être finis et compris dans ±{ $MAX_TAP_OFFSET_CHIPS } chips (reçu : { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = une fenêtre C/N0 nécessite au moins 2 prompts

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o } : atan2, costas-atan ou costas-decision-directed est attendu

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o } : cross-product, atan2 ou atan2-pilot est attendu

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o } : pull-in ou always est attendu

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o } : eml-power, dot-product ou eml-envelope est attendu

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k } : pll, fll ou fll-assisted-pll est attendu

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } ne s'applique pas à carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v } : un nombre >= 0 est attendu (0 désactive l'écrêtage)

engine-e-iq-track-design-must-be-positive-number-got = { $k } doit être un nombre positif (reçu : { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods doit être au moins égal à 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips doit être compris dans (0, 2] (reçu : { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips contient au plus { $MAX_EXTRA_TAPS } décalages (reçu : { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = les décalages de integration.extra_taps_chips doivent être finis et compris dans ±{ $MAX_TAP_OFFSET_CHIPS } chips (reçu : { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) doit être inférieur à carrier.fll_off_pli ({ $off }), tous deux dans (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s doit être nul ou positif (reçu : { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s doit être positif (reçu : { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order doit valoir 1, 2 ou 3 (reçu : { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order doit valoir 1 ou 2 (reçu : { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order doit valoir 1 ou 2 (reçu : { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold doit être compris dans [-1, 1] (reçu : { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows doit être au moins égal à 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods doit être au moins égal à 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) ne doit pas être inférieur à lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db doit être fini

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes doit être au moins égal à 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods doit être au moins égal à 1 (ou "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent doit être au moins égal à 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa doit être compris dans (0, 1) (reçu : { $pfa })

engine-e-iq-track-design-design-overrides = surcharges de conception : { $e }

engine-e-iq-track-design-design-overrides-may-not-set = les surcharges de conception ne peuvent pas définir name ou extends

engine-e-iq-track-design-loop-design-file = fichier de conception de boucle : { $e }

engine-e-iq-track-design-loop-design-file-schema-is = fichier de conception de boucle : le schéma { $other } n'est pas pris en charge ; { $SCHEMA } est attendu

engine-e-iq-track-design-loop-design-file-missing-schema = fichier de conception de boucle : schema = { $SCHEMA } manquant

engine-e-iq-track-design-loop-design-file-no-design = fichier de conception de boucle : aucune table [[design]]

engine-e-iq-track-design-loop-design-file-design-number = fichier de conception de boucle : la conception [[design]] numéro { $v1 } n'a pas de nom

engine-e-iq-track-design-loop-design-file-design-name = fichier de conception de boucle : le nom de conception { $name } est réservé ou vide

engine-e-iq-track-design-loop-design-file-design-is = fichier de conception de boucle : la conception { $name } est définie deux fois

engine-e-iq-track-design-no-design-named-the-file = aucune conception nommée { $n } ; le fichier contient { $value }

engine-e-iq-track-design-loop-design-file-design-extends = fichier de conception de boucle : la conception { $name } s'étend elle-même (un cycle)

engine-e-iq-track-design-loop-design-file-design-extends-2 = fichier de conception de boucle : la conception { $name } étend une conception inconnue { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = une boucle de phase nécessite un ordre 1..=3 et Bn > 0 (reçu : { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = une boucle de fréquence nécessite Bn > 0 (reçu : { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = l'ordre d'une boucle de fréquence doit valoir 1 ou 2 (reçu : { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = un filtre de boucle nécessite une voie de phase, une voie de fréquence, ou les deux

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = l'espacement avance-retard doit être compris dans (0, 2] chips (reçu : { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = l'ordre du DLL doit valoir 1 ou 2 (reçu : { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = le débit de chips et la fréquence de la porteuse doivent être positifs

## src/iq/track/sink.rs

engine-iq-track-sink-offset-chips = x{ $k }_offset_chips

engine-e-iq-track-sink-an-epoch-carries-extra-taps = une époque porte { $extra } prises supplémentaires mais la sortie a été configurée pour { $n } : tous les canaux d'une exécution doivent utiliser le même extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = un enregistrement fait { $b } octets ; { $want } est attendu

engine-e-iq-track-sink-unknown-lock-state-code = code d'état de verrouillage { $b } inconnu

engine-e-iq-track-sink-epoch-file-header = en-tête du fichier d'époques : { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = schéma du fichier d'époques { $schema } ; { $EPOCH_SCHEMA } est attendu

engine-e-iq-track-sink-epoch-file-records-are-bytes = les enregistrements du fichier d'époques font { $record_bytes } octets ; ce lecteur attend { $want } ({ $BINARY_RECORD_BYTES } plus { $BINARY_TAP_BYTES } par prise supplémentaire)

engine-e-iq-track-sink-epoch-file-ends-inside-record = le fichier d'époques se termine au milieu d'un enregistrement ({ $got } sur { $size } octets)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = format d'époques { $o } : csv, jsonl ou bin est attendu

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name } : `{ $s }` n'est pas un nombre

engine-e-jammertest-cli-is-not-utf-text = { $path } n'est pas du texte UTF-8

engine-e-jammertest-cli-needs-catalog = nécessite --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = nécessite au moins un --plan

engine-e-jammertest-cli-is-not-utf = { $cat } n'est pas en UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } n'est pas en UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format : `{ $s }` n'est pas l'un de ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` n'est pas de l'ISO-8601 UTC

engine-e-jammertest-cli-needs-log-start-or-log = nécessite --log-start ou --log avec --format

engine-e-jammertest-cli-log-needs-format = --log nécessite --format

engine-e-jammertest-cli-the-log-does-not-state = le journal n'indique pas son heure de début : utilisez --log-start

engine-e-jammertest-cli-the-log-states-its-start = le journal indique son début comme `{ $label }` : utilisez --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } n'est pas en UTF-8

engine-e-jammertest-cli-cannot-write = impossible d'écrire { $o } : { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } événements { $SCHEDULED_TRUTH } écrits dans { $o } ({ $skipped_non_rf } créneaux non RF ignorés, { $outside_log } hors du journal, { $unknown_ids } identifiants absents du catalogue)

engine-jammertest-cli-note-ids-not-in-the = note : identifiants absents du catalogue : { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = note : ce sont les créneaux planifiés du plan, et non des heures d'émission enregistrées.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  nom du test

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = { $tests } tests, { $evaluable } évaluables : { $detected } détectés dans la tolérance, { $late } tardifs, { $missed } manqués ; latence médiane { $fmt_opt }, temps de rétablissement médian { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = fausses alarmes hors de tout créneau : { $false_alarm_runs } exécutions, { $false_alarm_epochs } sur { $clean_epochs } époques saines

engine-e-jammertest-cli-needs-session-path = nécessite un chemin de session

engine-e-jammertest-cli-needs-catalog-and-plan-or = nécessite --catalog et --plan, ou --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = paquet de preuves écrit dans { $out } ; empreinte du signataire { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = aucun dossier avec un scenario.json et un .ubx sous { $root }

engine-jammertest-dataset-log-format-text =
    { "[" }log]
    format = "{ $format }"
    text = ""
    { $platform }

engine-e-jammertest-dataset-scenario = scénario : { $e }

engine-e-jammertest-dataset-read = lecture : { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json n'a pas de date

engine-e-jammertest-dataset-scenario-json-date-is-not = la date `{ $date }` de scenario.json n'est pas une date

engine-e-jammertest-dataset-no-readable-epoch-in-mon = aucune époque lisible dans mon_rf.csv ou rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = aucun dossier avec un scenario.json sous { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } rétabli(s) ({ $recovered } sur { $alarmed }), médiane { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = le journal indique son début comme `{ $l }`, ce qui n'est pas de l'ISO-8601 UTC : indiquez le début explicitement

engine-e-jammertest-the-log-does-not-state = le journal n'indique pas son heure de début : indiquez-la explicitement

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = le catalogue n'est pas du JSON : { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = le catalogue n'a pas de tableau `test_types`

engine-e-jammertest-plan-test-type-has-no-type = un type de test n'a pas de `type_id`

engine-e-jammertest-plan-test-group-has-no-group = un groupe de tests n'a pas de `group_id`

engine-e-jammertest-plan-test-has-no-test-id = un test n'a pas de `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = le catalogue ne liste aucun test

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` n'est pas une heure de plan comme 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = le plan n'est pas du JSON : { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = le plan n'a pas de tableau `locations`

engine-e-jammertest-plan-test-end-time-is-not = test { $id } : end_time n'est pas postérieur à start_time

engine-e-jammertest-plan-the-plan-has-no-test = le plan n'a pas de zone d'essai { $l } ; il a { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = le plan a plusieurs zones d'essai { $areas } ; indiquez dans laquelle le journal a été enregistré

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json n'est pas du JSON : { $e }

engine-e-jammertest-plan-no-attack-log-array = pas de tableau `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH } : Jammertest 2024 test { $id } fenêtre { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = l'attack_log ne contient aucune fenêtre début/fin

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = { $events } événements planifiés mais l'exécution en a noté { $events2 } : fournissez les événements propres à l'exécution

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s doit être positif et guard_s non négatif

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m doit lister au moins un élément

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m doit être fini

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting } : "null-steering" ou "mvdr" est attendu

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz doit être positif (reçu : { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain : la section nécessite un [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) doit être fini et supérieur ou égal à tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s doit être fini et non négatif (reçu : { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits doit être compris entre 1 et 16 (reçu : { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz doit être positif (reçu : { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side doit être au moins égal à 2 (reçu : { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } doit être fini (reçu : { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } doit être positif (reçu : { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt } : { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain : le point de profil { $points } ({ $lat }, { $lon }) est hors de la tuile MNT

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain : le point de profil { $points } ({ $lat }, { $lon }) est sur un vide du MNT

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = date calendaire UTC hors limites : { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = date calendaire inexistante : { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = seconde UTC { $second } hors limites à { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = un site de lancement au pôle n'a pas d'azimut défini

engine-e-launch-inclination-unreachable-from-latitude-without = inclinaison { $inclination_rad }° inatteignable depuis la latitude { $lat_rad }° sans manœuvre de dogleg (il faut |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = la vitesse d'un site au pôle vrai nécessite à la fois `epoch` et `eop_finals2000a` (un vrai corps IERS finals2000A)

engine-e-launch-site-lon-deg-must-be = site_lon_deg doit être dans [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a ne contenait aucune ligne IERS finals2000A lisible

engine-e-launch-epoch-mjd-is-outside-the = l'époque { $epoch } (MJD { $mjd_utc }) est hors des lignes EOP fournies (MJD { $mjd } à { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg doit être dans [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg doit être dans [0, 180]

engine-launch-launch-window-lat-az-asc = fenêtre de lancement : lat { $site_lat_deg }° -> i { $target_inclination_deg }° : Az { $asc }° asc, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s de gain de rotation terrestre, { $opportunities } opportunités/jour (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = chaque vitesse radiale nécessite un sigma positif et fini

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns =
    { $n_meas ->
        [one]
            { $n ->
                [one] { $n_meas } mesure ne peut pas résoudre { $n } inconnue Doppler
                [many] { $n_meas } mesure ne peut pas résoudre { $n } d'inconnues Doppler
               *[other] { $n_meas } mesure ne peut pas résoudre { $n } inconnues Doppler
            }
        [many]
            { $n ->
                [one] { $n_meas } de mesures ne peuvent pas résoudre { $n } inconnue Doppler
                [many] { $n_meas } de mesures ne peuvent pas résoudre { $n } d'inconnues Doppler
               *[other] { $n_meas } de mesures ne peuvent pas résoudre { $n } inconnues Doppler
            }
       *[other]
            { $n ->
                [one] { $n_meas } mesures ne peuvent pas résoudre { $n } inconnue Doppler
                [many] { $n_meas } mesures ne peuvent pas résoudre { $n } d'inconnues Doppler
               *[other] { $n_meas } mesures ne peuvent pas résoudre { $n } inconnues Doppler
            }
    }


engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = la géométrie Doppler est singulière

engine-e-leo-fusion-doppler-no-covariance = aucune covariance

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = chaque pseudodistance nécessite un sigma positif et fini

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position =
    { $n ->
        [one]
            { $n_clock ->
                [one] { $obs } pseudodistances ne peuvent pas résoudre { $n } inconnue (3 de position + { $n_clock } horloge)
                [many] { $obs } pseudodistances ne peuvent pas résoudre { $n } inconnue (3 de position + { $n_clock } d'horloges)
               *[other] { $obs } pseudodistances ne peuvent pas résoudre { $n } inconnue (3 de position + { $n_clock } horloges)
            }
        [many]
            { $n_clock ->
                [one] { $obs } pseudodistances ne peuvent pas résoudre { $n } d'inconnues (3 de position + { $n_clock } horloge)
                [many] { $obs } pseudodistances ne peuvent pas résoudre { $n } d'inconnues (3 de position + { $n_clock } d'horloges)
               *[other] { $obs } pseudodistances ne peuvent pas résoudre { $n } d'inconnues (3 de position + { $n_clock } horloges)
            }
       *[other]
            { $n_clock ->
                [one] { $obs } pseudodistances ne peuvent pas résoudre { $n } inconnues (3 de position + { $n_clock } horloge)
                [many] { $obs } pseudodistances ne peuvent pas résoudre { $n } inconnues (3 de position + { $n_clock } d'horloges)
               *[other] { $obs } pseudodistances ne peuvent pas résoudre { $n } inconnues (3 de position + { $n_clock } horloges)
            }
    }


engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = un satellite coïncide avec l'estimation de position

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = la géométrie est singulière

engine-e-leo-fusion-joint-pvt-no-iteration-ran = aucune itération n'a été exécutée

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = géométrie finale dégénérée

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = le DOP n'est pas fini

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } doit être positif

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m doit être non négatif et l'exécution d'au plus 5000 époques

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = chaque signal nécessite une largeur de bande positive

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    { $n_satellites ->
        [one] Positionnement 5G NTN à { $r } MHz, C/N0 de { $r2 } à { $r3 } dB-Hz, { $n_satellites } satellite ({ $mean_in_view } en vue){ "\u000A" }
        [many] Positionnement 5G NTN à { $r } MHz, C/N0 de { $r2 } à { $r3 } dB-Hz, { $n_satellites } de satellites ({ $mean_in_view } en vue){ "\u000A" }
       *[other] Positionnement 5G NTN à { $r } MHz, C/N0 de { $r2 } à { $r3 } dB-Hz, { $n_satellites } satellites ({ $mean_in_view } en vue){ "\u000A" }
    }


engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name } : { $s } kHz, plage CRB de { $range_sigma_zenith_m } à { $range_sigma_mask_m } m ; 3D formel médian { $s2 } m, erreur RMS { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { $n_obs ->
        [one] { "  " }passage Doppler d'un satellite : { $n_obs } échantillon sur { $duration_s } s, erreur horizontale { $horizontal_error_m } m{ "\u000A" }
        [many] { "  " }passage Doppler d'un satellite : { $n_obs } d'échantillons sur { $duration_s } s, erreur horizontale { $horizontal_error_m } m{ "\u000A" }
       *[other] { "  " }passage Doppler d'un satellite : { $n_obs } échantillons sur { $duration_s } s, erreur horizontale { $horizontal_error_m } m{ "\u000A" }
    }


engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = le PPP nécessite au moins un système

engine-e-leo-fusion-ppp-duration-and-step-must-be = la durée et le pas doivent être positifs, avec au plus 20000 époques

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs doit être compris entre 1 et 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = les seuils de convergence doivent être positifs

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    { $n_gnss ->
        [one] Convergence PPP vers { $criterion_horizontal_m } m en horizontal / { $criterion_vertical_m } m en vertical, { $runs_per_case } exécutions par cas, { $n_gnss } satellite GNSS{ "\u000A" }
        [many] Convergence PPP vers { $criterion_horizontal_m } m en horizontal / { $criterion_vertical_m } m en vertical, { $runs_per_case } exécutions par cas, { $n_gnss } de satellites GNSS{ "\u000A" }
       *[other] Convergence PPP vers { $criterion_horizontal_m } m en horizontal / { $criterion_vertical_m } m en vertical, { $runs_per_case } exécutions par cas, { $n_gnss } satellites GNSS{ "\u000A" }
    }


engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } { $n_leo } LEO  médiane { $c } min  convergé { $v4 } %  NEES moyen { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = erreur horizontale médiane sur { $runs_per_case } exécutions · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = le préréglage { $id } ne porte aucun signal

engine-e-leo-fusion-presets-preset-has-no-signal-it = le préréglage { $id } n'a pas de signal { $n } ; il a { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = préréglage LEO { $id } inconnu ; connus : { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s et step_s doivent être positifs, avec au plus 20000 époques

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = les pas polaires doivent être positifs

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode doit être doppler, joint, polar ou timing ; reçu { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = le mode doppler nécessite au moins un système LEO

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = le mode timing nécessite un système LEO avec mesure de distance par code

engine-e-leo-fusion-pvt-kind-unknown-clock-class = classe d'horloge { $c } inconnue

engine-leo-fusion-pvt-kind-leo-pvt-at-over = PVT LEO ({ $mode }) à { $user_lat_deg }, { $user_lon_deg } sur { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } { $n_satellites } sat. à { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { $n_obs ->
        [one]
            { $n_sats ->
                [one] { "  " }Point Doppler : { $n_obs } mesure de { $n_sats } satellite, erreur 3D { $error_3d_m } m (horizontale { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }Point Doppler : { $n_obs } mesure de { $n_sats } de satellites, erreur 3D { $error_3d_m } m (horizontale { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }Point Doppler : { $n_obs } mesure de { $n_sats } satellites, erreur 3D { $error_3d_m } m (horizontale { $horizontal_error_m } m){ "\u000A" }
            }
        [many]
            { $n_sats ->
                [one] { "  " }Point Doppler : { $n_obs } de mesures de { $n_sats } satellite, erreur 3D { $error_3d_m } m (horizontale { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }Point Doppler : { $n_obs } de mesures de { $n_sats } de satellites, erreur 3D { $error_3d_m } m (horizontale { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }Point Doppler : { $n_obs } de mesures de { $n_sats } satellites, erreur 3D { $error_3d_m } m (horizontale { $horizontal_error_m } m){ "\u000A" }
            }
       *[other]
            { $n_sats ->
                [one] { "  " }Point Doppler : { $n_obs } mesures de { $n_sats } satellite, erreur 3D { $error_3d_m } m (horizontale { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }Point Doppler : { $n_obs } mesures de { $n_sats } de satellites, erreur 3D { $error_3d_m } m (horizontale { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }Point Doppler : { $n_obs } mesures de { $n_sats } satellites, erreur 3D { $error_3d_m } m (horizontale { $horizontal_error_m } m){ "\u000A" }
            }
    }


engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }fenêtre { $window_s } s : { $n_sats } sat., erreur 3D { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } passage au zénith : Doppler max. { $max_doppler_hz } Hz, taux { $max_doppler_rate_hz_s } Hz/s, à-coup { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }satellite LEO de mesure de distance en vue sur { $v1 } % des époques{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } disponibilité { $availability }, PDOP médian { $f }, erreur 3D RMS { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }lat { $lat_deg } : VDOP GNSS { $f } LEO { $f2 } fusionné { $f3 } ; en vue { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB : RMS { $row } ns, 95 % { $row2 } ns, max. { $row3 } ns (en vue { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = PVT LEO — mode { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = système { $name } : role doit être gnss ou leo, reçu { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = système { $name } : clock doit être estimated ou known, reçu { $c }

engine-e-leo-fusion-system-system-must-be-positive = système { $name } : { $what } doit être positif

engine-e-leo-fusion-system-system-mask-deg-must-be = système { $name } : mask_deg doit être dans [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = système { $name } : sigma_pr_m doit être positif

engine-e-leo-fusion-system-give-at-least-one-system = indiquez au moins un [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = l'espacement des époques doit être positif

engine-e-leo-fusion-timing-no-epochs = aucune époque

engine-e-leo-fusion-timing-no-satellite-was-ever-in = aucun satellite n'a jamais été en vue : le récepteur n'a jamais acquis le temps

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = la polarisation doit être rhcp, lhcp ou linear ; reçu '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = code d'erreur SGP4 { $code } à t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = une orbite inclinée de { $inc } deg ne passe jamais au-dessus de la latitude { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = l'élévation maximale demandée est inférieure à la portée de l'horizon

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = la classe de bâtiment doit être traditional ou thermally-efficient ; reçu '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = le champ { $name } n'est pas fini

engine-e-leo-navmsg-codec-field-is-outside-its-bit = le champ { $name } = { $value } { $unit } est hors de sa plage de { $bits } bits (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = message tronqué

engine-e-leo-navmsg-codec-field-list-exhausted = liste de champs épuisée

engine-e-leo-navmsg-codec-field-order-mismatch-vs = ordre des champs discordant : { $name } contre { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID doit être compris entre 1 et 255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = chaque polynôme de correction nécessite de 1 à 8 coefficients

engine-e-leo-navmsg-codec-correction-time-scale-must-be = l'échelle de temps de correction doit être une puissance de deux de 1 s à 32768 s ; reçu { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = un polynôme ECEF nécessite de 1 à 11 coefficients, en nombre égal par axe

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = le degré du polynôme ECEF { $v1 } dépasse 10

engine-e-leo-navmsg-codec-unknown-model-id = identifiant de modèle { $m } inconnu

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = la charge utile dépasse 4095 octets

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = trame plus courte que l'en-tête et le CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = préambule 0x{ $frame } incorrect

engine-e-leo-navmsg-codec-unsupported-version = version { $version } non prise en charge

engine-e-leo-navmsg-codec-frame-length-does-not-match = la longueur de trame { $frame } ne correspond pas à la charge utile déclarée de { $len } octets

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = discordance CRC-24Q : calculé 0x{ $crc }, la trame porte 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = chaque rac_degrees doit valoir au plus 7 ; reçu { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree doit être compris entre 1 et 10 ; reçu { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = modèle d'éphéméride '{ $other }' inconnu : utilisez kepler16, kepler-rac, liu22 ou ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = l'intervalle d'ajustement doit être d'au moins 10 s ; reçu { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = la fenêtre d'ajustement [{ $t0 }, { $v1 }] s est hors de l'arc de vérité terrain [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = l'ajustement du polynôme ECEF est singulier (trop peu d'échantillons pour ce degré)

engine-e-leo-navmsg-fit-clock-fit-is-singular = l'ajustement d'horloge est singulier

engine-e-leo-navmsg-fit-keplerian-fit-diverged = l'ajustement képlérien a divergé

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = préréglage '{ $k }' inconnu ; disponibles : { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s doit être compris entre 10 et 3600 s et update_period_s dans (0, fit_interval_s] ; reçu { $fit_interval_s } et { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s et eval_step_s doivent être compris entre { $lit_0_5 } et 60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz doit dépasser 10 MHz ; reçu { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid doit être compris entre 1 et 255

engine-e-leo-navmsg-band-must-be-15-and = band doit être compris entre 0 et 15 et health entre 0 et 3

engine-e-leo-navmsg-unknown-csv-schema = csv_schema '{ $csv_schema }' inconnu

engine-e-leo-navmsg-analysis-must-name-at-least = analysis doit nommer au moins une analyse

engine-e-leo-navmsg-unknown-analysis-use = analyse '{ $a }' inconnue ; utilisez { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind doit être leo-navmsg ; reçu { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg doit être dans [0, 60) ; reçu { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    Message de navigation LEO — { $res } km, { $res2 } deg, degré de gravité { $gravity_degree }, modèle { $res3 }
    { "  " }poids SISRE : w_R { $w_r }, w_AC^2 1/{ $v6 } (masque { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s doit être compris entre 60 et 86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s doit être non vide, chaque valeur entre 10 et 3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }compromis sur l'intervalle d'ajustement sur { $span } s (période d'utilisation = intervalle d'ajustement) :{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE orbite RMS { $sisre_orb_rms_m } m  max. { $sisre_orb_max_m } m  avec horloge RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s doit être non vide, chaque valeur entre 10 et 3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s doit être compris entre 60 et 86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } paramètres  SISRE orbite RMS { $sisre_orb_rms_m } m  avec horloge { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = aucun passage au-dessus de { $mask } deg pour l'utilisateur à { $lat }, { $lon } dans { $search } s ; élargissez midpass.search_s ou déplacez l'utilisateur

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }mise à jour en milieu de passage : passage { $p0 }-{ $p1 } s (élévation max. { $pmax } deg), { $switches } commutations, plus grand saut de distance utilisateur { $max_jump } m (géométrie du pire cas { $max_worst } m) contre seuil { $threshold } m : { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }encodage-décodage : modèle { $m }, trame { $frame } octets ({ $payload_bits } bits de charge utile, { $eph_bits } bits d'éphéméride+horloge), CRC-24Q 0x{ $hex }
    { "    " }quantification : plus grand changement de position { $v6 } mm, horloge { $v7 } mm ; SISRE exact { $acc_exact } m, quantifié { $acc_q } m
    { "    " }trame corrompue rejetée : { $corrupted_rejected } ; aller-retour RINEX { $rin_dp } m ; aller-retour CSV { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs doit être compris entre 1 et 20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  publié { $published } m  rapport { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = L'ensemble képlérien à 16 paramètres se dégrade de { $a } m à { $lo } s à { $b } m à { $hi } s : un seul ensemble képlérien avec des harmoniques à deux fois par révolution ne peut pas suivre les termes de gravité de plus haute fréquence ni la traînée d'un arc LEO au-delà de quelques minutes, et son résidu des moindres carrés oscille sur la fenêtre. Les polynômes along/cross/radial, de degré supérieur à ce que couvre l'ensemble képlérien, absorbent ce qui reste, donnant { $c } m à { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = L'ensemble képlérien à 16 paramètres passe de { $a } m à { $lo } s à { $b } m à { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, degré de gravité { $gravity_degree } · erreur de représentation par rapport à la vérité terrain · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 } : `{ $call }` est celui de la bibliothèque hôte

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 } : les échantillonneurs `rand_distr` appellent `exp` et `ln` de l'hôte dans leurs branches rares ; utilisez `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 } : `.acceleration(` est le champ de gravité de la bibliothèque hôte ; utilisez `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 } : `{ $path }` n'a pas été relu

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = aucune ligne END OF HEADER

engine-e-leo-navmsg-text-expected-eph-record-header-got = en-tête d'enregistrement '> EPH' attendu, reçu { $head }

engine-e-leo-navmsg-text-bad-satellite-id = identifiant de satellite { $parts } incorrect

engine-e-leo-navmsg-text-missing-epoch-line = ligne d'époque manquante

engine-e-leo-navmsg-text-bad-epoch-line = ligne d'époque { $ep } incorrecte

engine-e-leo-navmsg-text-bad-epoch-field-in = champ d'époque incorrect dans { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = la ligne d'époque nécessite trois termes d'horloge : { $ep }

engine-e-leo-navmsg-text-record-truncated = enregistrement tronqué

engine-e-leo-navmsg-text-unknown-record-type = type d'enregistrement { $other } inconnu

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = la table CSV porte des messages kepler16 et kepler-rac ; reçu { $m }

engine-e-leo-navmsg-text-empty-csv = CSV vide

engine-e-leo-navmsg-text-row-has-cells-header = la ligne a { $cells } cellules, l'en-tête { $header }

engine-e-leo-navmsg-text-bad-number-in-column = nombre { $c } incorrect dans la colonne { $k }

engine-e-leo-navmsg-text-csv-row-lacks = il manque { $k } à la ligne CSV

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = l'altitude d'orbite doit être comprise entre 100 km et 3000 km ; reçu { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = l'excentricité doit être dans [0, { $lit_0_1 }) pour un ajustement LEO ; reçu { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = le pas d'intégration doit être dans (0, 30] s ; reçu { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = la durée doit être positive avec au plus 200000 pas ; reçu { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree doit valoir 0, 2-6 (zonal) ou 7-{ $v1 } (EGM2008) ; reçu { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = la propagation de la vérité terrain a divergé

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = l'orbite de vérité terrain s'est dégradée sous 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = l'espacement des nœuds doit être dans (0, 60] s ; reçu { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = une orbite de vérité terrain tabulée nécessite au moins deux états ; reçu { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = l'état { $k } n'est pas fini

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = adev_1s de l'horloge doit être dans [0, 1e-6) ; reçu { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = une horloge mesurée se construit avec TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = une horloge pilotée nécessite sigma_s dans [0, 1e-3) et tau_s > 0 ; reçu { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = une horloge mesurée nécessite un pas positif et au moins deux échantillons

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = un échantillon d'horloge mesurée n'est pas fini

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = l'époque '{ $s }' n'est pas au format YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = l'époque '{ $s }' n'est pas au format YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = l'époque '{ $s }' a un champ de secondes incorrect

engine-e-leo-pass-epoch-is-out-of-range = l'époque '{ $s }' est hors limites

engine-e-leo-pass-band-unknown-signal-design-public = bande '{ $name }' : conception de signal '{ $n }' inconnue ; conceptions publiques : { $v2 }

engine-e-leo-pass-band-is-not-in-the = la bande '{ $name }' n'est pas dans le préréglage du système : indiquez frequency_mhz et eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = la bande '{ $name }' nécessite eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern doit être isoflux, gaussian ou flat ; reçu '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = fréquence de la bande '{ $name }' hors limites

engine-leo-pass-overridden-in-the-scenario = { $source } (surchargé dans le scénario)

engine-e-leo-pass-system-has-no-band = le système '{ $id }' n'a pas de bande '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = un satellite LEO nécessite au moins une bande

engine-e-leo-pass-at-most-12-bands-per = au plus 12 bandes par satellite

engine-leo-pass-unknown-system-presets-in-this = système '{ $n }' inconnu ; préréglages de cette version : { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = aucune orbite héliosynchrone à { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (au plus 86400) et step_s doivent être positifs, avec au plus 20000 époques ; reçu { $duration } et { $step }

engine-leo-pass-leo-satellite-km-deg = satellite LEO { $system }, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = `epoch` du scénario { $epoch }, lue en UTC

engine-leo-pass-the-kind-default-epoch-utc = époque par défaut du type { $epoch } UTC (le scénario n'en donne aucune)

engine-e-leo-pass-user-environment-must-be-ground = user.environment doit être ground, maritime, air ou indoor ; reçu '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg doit être compris dans +/-90

engine-e-leo-pass-user-speed-must-be-to = la vitesse de l'utilisateur doit être comprise entre 0 et 3000 m/s et la hauteur entre -500 et 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna doit être patch, hemispherical ou isotropic ; reçu '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability doit être dans (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model doit être klobuchar, vtec ou none ; reçu '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction doit être ascending ou descending ; reçu '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satellite { $id } : excentricité ou périgée incorrect

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satellite { $id } : tle nécessite tle_line1 et tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit doit être pass, elements ou tle ; reçu '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation nécessite un système ou une conception

engine-e-leo-pass-no-sun-synchronous-inclination = aucune inclinaison héliosynchrone

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation : au plus 5000 satellites

engine-e-leo-pass-no-leo-satellite-rises-above = aucun satellite LEO ne s'élève au-dessus du masque dans la fenêtre

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s doit être dans (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands : '{ $b }' n'est une bande d'aucun satellite LEO ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = aucun signal GNSS '{ $bname }' pour la constellation '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = constellation GNSS vide

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs : '{ $a }'/'{ $b }' ne sont pas deux bandes distinctes de { $id }

engine-e-leo-pass-iot-powers-and-battery-must = les puissances et la batterie de l'IoT doivent être positives

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from doit être median ou peak ; reçu '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = seuil de détection { $detection_snr_db } dB après intégration

engine-leo-pass-coherent-integration-at-most-ms = intégration cohérente d'au plus { $rx } ms, plafonnée par le taux Doppler

engine-leo-pass-serial-search-with-correlators = recherche en série avec { $correlators } corrélateurs

engine-leo-pass-hot-start-doppler-known-to = démarrage à chaud : Doppler connu à +/-{ $aided } Hz, éphéméride valide

engine-leo-pass-leo-pass-link-budget-user = Bilan de liaison de passage LEO, utilisateur { $environment } à { $lat_deg }, { $lon_deg } ; { $satellites } satellite(s) LEO, fenêtre de { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }] : { $sat } km, élévation max. { $max_elevation_deg } deg à { $tca_s } s, { $duration_above_mask_s } s au-dessus du masque{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz : C/N0 pic { $opt } médiane { $opt2 } ; |Doppler| max. { $opt3 } ; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band } : { $satellites_in_view } en vue, C/N0 de { $opt } à { $opt2 } (médiane { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } pic { $leo_peak_cn0_dbhz } dB-Hz, soit { $leo_peak_above_gnss_median_db } dB au-dessus de la médiane GNSS ; au-dessus de la porteuse GNSS la plus forte pendant { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal } : TTFF à froid { $ttff_s } s ({ $energy_per_fix_mj } mJ), à chaud { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Leurreur à partir de { $onset_s } s (saut { $offset_m } m, poussée { $push_rate_m_s } m/s) : test Doppler GNSS { $t }, LEO { $t2 }, fusionné { $t3 } ; inter-bandes { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = utilisateur { $environment } · pic LEO { $leo_peak_cn0_dbhz } dB-Hz, { $leo_peak_above_gnss_median_db } dB au-dessus de la médiane GNSS · MODELLED

engine-leo-pass-user-modelled = utilisateur { $environment } · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler de la première bande de chaque satellite LEO (±{ $v1 } kHz pleine échelle)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = table [{ $what }] invalide : { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' n'est ni dans [signal] ni une conception publique ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' n'a pas de composante suivie par code, il ne donne donc aucune pseudodistance

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind doit être leo-pnt-chain ; reçu { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = la composante suivie n'a pas de débit de chips

engine-e-leo-pnt-chain-no-band-of-pass-names = aucune bande de [pass] ne nomme signal = "{ $name }" ; la chaîne en nécessite une pour porter la conception

engine-e-leo-pnt-chain-the-pass-gives-no-code = le passage ne donne aucune gigue de code

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m doit être dans [0, 100] m ; reçu { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] doit exécuter mode = "joint" ; reçu { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = C/N0 suivi au masque de { $mask } deg (droite ajustée en sin élévation)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] n'a aucun système LEO pour recevoir les valeurs de la chaîne

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] n'a produit aucun bloc joint

engine-leo-pnt-chain-leo-pnt-chain = Chaîne LEO-PNT : { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }signal { $name2 } ({ $design }), { $design2 } suivi à { $v4 } Mchip/s, décalage C/N0 { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }passage { $id } { $sat } km : pic de C/N0 suivi { $peak_tracked_cn0_dbhz } dB-Hz, gigue de code médiane { $jitter_median } m ; droite de C/N0 { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }message { $res } ajustement de { $fit_interval_s } s / mise à jour de { $update_period_s } s : SISRE de représentation { $stats } mm RMS (orbite { $stats2 } mm), avec { $od } m de détermination d'orbite : { $sisre } m transmis{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }point fusionné : GNSS seul { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }Convergence PPP : { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } valeurs transmises entre les étapes. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Gigue de suivi de code, l'erreur de mesure de distance (m, 0 à { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · GNSS seul RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulation { $label } : la largeur doit être positive

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = préréglage de signal { $name } inconnu : la bibliothèque contient { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = préréglage { $name } : fichier de préréglage invalide : { $e }

engine-e-leo-signal-preset-file-names-itself = le fichier de préréglage { $name } se nomme lui-même { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name } : centre_mhz doit être positif

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name } : tx_bandwidth_mhz doit être positif

engine-e-leo-signal-signal-needs-at-least-one = { $name } : un signal nécessite au moins une composante

engine-e-leo-signal-component-power-fraction-must-be = { $name } : le power_fraction de la composante { $v1 } doit être positif

engine-e-leo-signal-component-has-fdma-shares-but = { $name } : la composante { $v1 } a fdma_shares mais pas de fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name } : fdma_shares de la composante { $v1 } doit être positif et de somme égale à un

engine-e-leo-signal-component-needs-one-fdma-share = { $name } : la composante { $v1 } nécessite un fdma_share par décalage

engine-e-leo-signal-data-rate-sps-must-be = { $name } : data_rate_sps doit être positif

engine-e-leo-signal-code-length-chips-must-be = { $name } : code_length_chips doit être positif

engine-e-leo-signal-component-power-fractions-sum-to = { $name } : les fractions de puissance des composantes ont pour somme { $total }, et non 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name } : orbit_altitude_km doit être positif

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name } : une composante plate (de type OFDM) ne peut pas être placée dans le modèle de spectre

engine-e-leo-signal-the-tracked-component-sits-on = { $name } : la composante suivie se situe sur des sous-porteuses FDMA ; le modèle de spectre suit une composante au centre de la bande

engine-e-leo-signal-signal-is-given-twice = le signal { $w } est donné deux fois

engine-e-leo-signal-signals-is-more-than-the = { $out } signaux dépassent les 24 admis

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = récepteur : loop_bandwidth_hz x integration_time_s doit être inférieur à 1

engine-e-leo-signal-receiver-give-to-40-cn0 = récepteur : indiquez de 1 à 40 valeurs cn0_dbhz

engine-e-leo-signal-trade-slant-range-km-and = trade : slant_range_km > 0 et slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points doit être compris entre 21 et 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o } : utilisez "coherent" ou "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = la température de bruit du système doit être positive

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibilité : signal GNSS { $n } inconnu (connus : { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } n'est pas un signal du scénario

engine-e-leo-signal-shape-check-signal-is-not = vérification de forme : le signal { $signal } n'est pas dans le scénario

engine-leo-signal-scenario-leo-signal-signals-noise = scénario leo-signal | { $runs } signaux | plancher de bruit { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = à gauche : PSD limitée en bande de chaque conception (dB sous le pic, sur sa bande d'émission) ; à droite : gigue de code en fonction du C/N0 total à un espacement de { $reference_spacing_chips } chips

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = bande '{ $other }' inconnue (s|x|ka attendu)

engine-e-linkbudget-range-km-must-be-finite = range_km doit être fini et positif

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps doit être fini et positif

engine-e-linkbudget-other-losses-db-must-be = other_losses_db doit être fini et >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k doit être fini et positif s'il est fourni

engine-linkbudget-link-budget-band-km-bit = bilan de liaison : bande { $value }, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, marge { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = impossible d'écouter sur { $addr } : { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live : écoute sur tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live : client tcp connecté

engine-live-io-kshana-live-warning-is-not = kshana live : avertissement : { $addr } n'est pas une adresse de bouclage ; tout ce qui peut l'atteindre peut lire le flux

engine-e-live-io-cannot-open = impossible d'ouvrir { $spec } : { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live : client tcp abandonné car il ne pouvait pas suivre le rythme

engine-e-live-io-cannot-open-2 = impossible d'ouvrir { $path } : { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live : avertissement : { $addr } n'est pas une adresse de bouclage ; tout ce qui peut l'atteindre peut envoyer un flux à cette couche

engine-e-live-io-cannot-bind-udp = impossible de lier udp { $addr } : { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live : écoute sur udp { $addr }

engine-e-live-io-cannot-connect-to = impossible de se connecter à { $addr } : { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live : connecté à tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live : lecture du port série { $path } à { $baud } baud (lecture seule)

engine-live-io-the-was-closed-by-the = le { $v1 } a été fermé par le pair (la couche ne se reconnecte pas : exécutez-la sous un superviseur qui la relance)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud } : utilisez 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 ou 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } n'est pas un périphérique série (échec de tcgetattr)

engine-e-live-io-cannot-set-baud = impossible de régler { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = impossible de régler le mode de ligne de { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial n'est pris en charge que sous Unix ; utilisez --file, --tcp ou --stdin

engine-live-io-unknown-option = option { $s } inconnue

engine-live-io-cannot-read = impossible de lire { $session } : { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live : plateforme navire, étalonnage pendant { $calibration_s } s ; porte { $v2 }. Logiciel à titre consultatif, et non un équipement de navigation homologué : l'opérateur reste responsable.

engine-live-io-write-failed = échec d'écriture : { $e }

engine-live-io-kshana-live-dropped-udp-datagram =
    { $n ->
        [one] kshana live : { $n } datagramme udp abandonné, que le moteur n'a pas pu prendre ({ $udp_dropped } au total)
        [many] kshana live : { $n } de datagrammes udp abandonnés, que le moteur n'a pas pu prendre ({ $udp_dropped } au total)
       *[other] kshana live : { $n } datagrammes udp abandonnés, que le moteur n'a pas pu prendre ({ $udp_dropped } au total)
    }


## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = le PRN AFS { $prn } est hors de 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = l'indice d'insertion { $p } est hors de 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = les fichiers de l'Annexe 3 contiennent { $gold } codes de Gold et { $ter } codes ternaires, 210 attendus

engine-e-lunar-afs-codes-annex-afs-prn-is-not = le PRN AFS-I { $v1 } de l'Annexe 3 n'est pas un code de Gold de g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = le code secondaire S{ $id } n'existe pas (S0 à S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = le Tableau 11 de LSIS V1.0 n'attribue des codes qu'aux identifiants de nœud 1 à 12, et non { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } ne tient pas sur deux bits (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } hors de 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = { $SB1_SYMBOLS } symboles de sous-trame 1 attendus

engine-e-lunar-afs-frame-subframe-data-lengths-expected = longueurs de données des sous-trames { $sb2 }/{ $sb3 }/{ $sb4 } (attendu { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = { $FRAME_SYMBOLS } symboles attendus, { $soft } fournis

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = ligne { $v1 } : `row,column` attendu

engine-e-lunar-afs-ldpc-line = ligne { $v1 } : { $e }

engine-e-lunar-afs-ldpc-line-outside = ligne { $v1 } : ({ $r },{ $c }) hors de { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe } : { $info_bits } bits d'information attendus, { $info } fournis

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = les données LSIS V1.0 ne sont pas dans { $cache_dir } (définissez KSHANA_LSIS_DIR ou exécutez xval/lunar-afs/fetch_lsis.sh, qui télécharge { $LSIS_PDF_URL } et en extrait les pièces jointes ; elles ne sont pas redistribuées avec Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } n'est pas un fichier LSIS épinglé

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } a pour SHA-256 { $got }, { $want } attendu (épinglé sur LSIS V1.0 du 29 janvier 2025) ; { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = bande de base du signal direct augmenté LunaNet, { $LSIS_VERSION } ; générateur de référence Kshana

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = nœud AFS { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = nœud AFS { $node_id } trame TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites doit valoir au moins 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites doit valoir au moins 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg doit être dans [0, 90) ; reçu { $mask_deg }

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } satellite, sans balise
        [many] { $n_sats } de satellites, sans balise
       *[other] { $n_sats } satellites, sans balise
    }


engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one]
            { $n_vis_beacons ->
                [one] { $n_sats } satellite + { $n_vis_beacons } balise visible
                [many] { $n_sats } satellite + { $n_vis_beacons } de balises visibles
               *[other] { $n_sats } satellite + { $n_vis_beacons } balises visibles
            }
        [many]
            { $n_vis_beacons ->
                [one] { $n_sats } de satellites + { $n_vis_beacons } balise visible
                [many] { $n_sats } de satellites + { $n_vis_beacons } de balises visibles
               *[other] { $n_sats } de satellites + { $n_vis_beacons } balises visibles
            }
       *[other]
            { $n_vis_beacons ->
                [one] { $n_sats } satellites + { $n_vis_beacons } balise visible
                [many] { $n_sats } satellites + { $n_vis_beacons } de balises visibles
               *[other] { $n_sats } satellites + { $n_vis_beacons } balises visibles
            }
    }


engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } satellite, sans balise
        [many] { $n_cmp } de satellites, sans balise
       *[other] { $n_cmp } satellites, sans balise
    }


engine-e-lunar-beacon-serialising-beacon-report = sérialisation du rapport de balises : { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = le rapport de balises doit se sérialiser en un objet JSON

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Augmentation par balises de surface lunaire — masque { $elevation_mask_deg } deg, époque +{ $epoch_s } s, sigma_URE par balise { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  sat. { $n_visible_sats }  balises { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  1-sigma réalisé : 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }les balises améliorent le PDOP d'un facteur { $f }x ;{ " " }

engine-lunar-beacon-larger-constellation-instead = une constellation plus grande à la place, { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = impossible de lire l'éphéméride lunaire { $path } : { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = éphéméride lunaire : la première ligne doit être `{ $MAGIC }`, trouvé `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = éphéméride lunaire : le fichier est vide

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = éphéméride lunaire : `# format:` doit être `states` ou `elements`, trouvé `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = éphéméride lunaire : aucune ligne de données

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = éphéméride lunaire : colonne `{ $name }` manquante

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = éphéméride lunaire : `# elements_frame:` doit être `icrf` ou `mci`, trouvé `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = éphéméride lunaire : `elements_frame: icrf` nécessite `# epoch_jd_tdb:` (l'époque à laquelle les éléments sont rapportés, qui est aussi celle où la rotation ICRF vers référentiel lié à la Lune est évaluée) : { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = éphéméride lunaire : ligne d'éléments { $v1 } trop courte

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = éphéméride lunaire : ligne d'éléments { $v1 } : { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = éphéméride lunaire : la ligne d'éléments { $v1 } a un demi-grand axe non positif

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = éphéméride lunaire : la ligne d'éléments { $v1 } a une excentricité { $ecc }, hors de [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = éphéméride lunaire : un fichier `states` nécessite `# frame: icrf` ou `# frame: mci`, trouvé `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = éphéméride lunaire : un fichier d'états `icrf` nécessite `# epoch_jd_tdb:` : { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = éphéméride lunaire : ligne d'état { $v1 } trop courte

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = éphéméride lunaire : ligne d'état { $v1 } : { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = éphéméride lunaire : la ligne d'état { $v1 } n'est pas finie

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = éphéméride lunaire : la ligne d'état { $v1 } du satellite { $sat } remonte dans le temps ({ $t } après { $last }) ; les époques doivent être strictement croissantes pour chaque satellite

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Éphéméride d'états tabulés centrée sur la Lune (référentiel { $e }), interpolée par Lagrange à l'ordre { $LAGRANGE_ORDER } entre les époques de la table et ramenée au MCMF par { $v2 }. Les états ne sont PAS propagés par ce moteur. Classe de provenance `published-ephemeris` : distincte de tout chiffre issu d'éléments.

engine-lunar-ephemeris-published-constellation-definition-stated-in = DÉFINITION de constellation publiée, énoncée dans l'ICRF centré sur la Lune (`{ $v1 }`), propagée par le propre solveur de Kepler de ce moteur dans ce même référentiel inertiel et ramenée au MCMF par l'orientation lunaire IAU 2015 / WGCCRE (pôle en précession, libration physique analytique) à chaque époque. AUCUNE approximation de référentiel : la source nomme le référentiel et l'époque, et les deux sont utilisés. Classe de provenance `published-elements` : distincte de tout chiffre issu d'un noyau.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = DÉFINITION de constellation publiée, propagée par le propre solveur de Kepler de ce moteur et ramenée par le modèle de rotation lunaire moyenne — exactement le chemin suivi par la constellation illustrative, de sorte que la seule différence entre les deux exécutions est la conception de la constellation. La source énonce les éléments dans le référentiel `{ $v1 }` ; ils sont lus ici comme MCI, ce qui incline la constellation de `published_frame_tie_angle_deg`. Classe de provenance `published-elements` : distincte de tout chiffre issu d'un noyau.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = station_datum { $other } inconnu : "fixed" ou "estimated-anchor-first" attendu

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = une campagne VLBI nécessite au moins 2 stations pour former une base, reçu { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = la station { $name } a une coordonnée non finie

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = la latitude { $lat } deg de la station { $name } est hors de [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = un datum de Helmert à sept paramètres nécessite au moins 3 balises non colinéaires, reçu { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = la balise { $name } a une coordonnée non finie

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = la latitude { $lat } deg de la balise { $name } est hors de [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours doit être positif et fini, reçu { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min doit être positif et fini, reçu { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = un calendrier de { $v1 } époques dépasse la limite de 5000 époques de ce scénario ; allongez step_min ou raccourcissez arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s doit être positif et fini, reçu { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg doit être fini et dans [-90, 90), reçu { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg doit être fini et dans [-90, 90), reçu { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol doit être fini et dans [0, 1), reçu { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m doit être positif et fini, reçu { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver doit être "spectral" ou "srif", reçu "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = sérialisation du résultat lunar-frame-campaign : { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign =
    { $n_epochs ->
        [one]
            { $n_beacons ->
                [one] aucune observation de la campagne ne franchit le masque d'élévation côté Terre de { $mask } deg aux deux extrémités d'une base ET le masque de { $earth_mask } deg au-dessus de l'horizon propre de la balise : { $n_epochs } époque x { $v1 } bases x { $n_beacons } balise toutes rejetées. Allongez arc_hours, abaissez un masque ou déplacez les stations.
                [many] aucune observation de la campagne ne franchit le masque d'élévation côté Terre de { $mask } deg aux deux extrémités d'une base ET le masque de { $earth_mask } deg au-dessus de l'horizon propre de la balise : { $n_epochs } époque x { $v1 } bases x { $n_beacons } de balises toutes rejetées. Allongez arc_hours, abaissez un masque ou déplacez les stations.
               *[other] aucune observation de la campagne ne franchit le masque d'élévation côté Terre de { $mask } deg aux deux extrémités d'une base ET le masque de { $earth_mask } deg au-dessus de l'horizon propre de la balise : { $n_epochs } époque x { $v1 } bases x { $n_beacons } balises toutes rejetées. Allongez arc_hours, abaissez un masque ou déplacez les stations.
            }
        [many]
            { $n_beacons ->
                [one] aucune observation de la campagne ne franchit le masque d'élévation côté Terre de { $mask } deg aux deux extrémités d'une base ET le masque de { $earth_mask } deg au-dessus de l'horizon propre de la balise : { $n_epochs } d'époques x { $v1 } bases x { $n_beacons } balise toutes rejetées. Allongez arc_hours, abaissez un masque ou déplacez les stations.
                [many] aucune observation de la campagne ne franchit le masque d'élévation côté Terre de { $mask } deg aux deux extrémités d'une base ET le masque de { $earth_mask } deg au-dessus de l'horizon propre de la balise : { $n_epochs } d'époques x { $v1 } bases x { $n_beacons } de balises toutes rejetées. Allongez arc_hours, abaissez un masque ou déplacez les stations.
               *[other] aucune observation de la campagne ne franchit le masque d'élévation côté Terre de { $mask } deg aux deux extrémités d'une base ET le masque de { $earth_mask } deg au-dessus de l'horizon propre de la balise : { $n_epochs } d'époques x { $v1 } bases x { $n_beacons } balises toutes rejetées. Allongez arc_hours, abaissez un masque ou déplacez les stations.
            }
       *[other]
            { $n_beacons ->
                [one] aucune observation de la campagne ne franchit le masque d'élévation côté Terre de { $mask } deg aux deux extrémités d'une base ET le masque de { $earth_mask } deg au-dessus de l'horizon propre de la balise : { $n_epochs } époques x { $v1 } bases x { $n_beacons } balise toutes rejetées. Allongez arc_hours, abaissez un masque ou déplacez les stations.
                [many] aucune observation de la campagne ne franchit le masque d'élévation côté Terre de { $mask } deg aux deux extrémités d'une base ET le masque de { $earth_mask } deg au-dessus de l'horizon propre de la balise : { $n_epochs } époques x { $v1 } bases x { $n_beacons } de balises toutes rejetées. Allongez arc_hours, abaissez un masque ou déplacez les stations.
               *[other] aucune observation de la campagne ne franchit le masque d'élévation côté Terre de { $mask } deg aux deux extrémités d'une base ET le masque de { $earth_mask } deg au-dessus de l'horizon propre de la balise : { $n_epochs } époques x { $v1 } bases x { $n_beacons } balises toutes rejetées. Allongez arc_hours, abaissez un masque ou déplacez les stations.
            }
    }


engine-lunar-frame-campaign-full-rank-all-similarity-parameters = rang plein : les 7 paramètres de similitude sont tous contraints par cette campagne (nombre de conditionnement { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT : { $defect } directions de similitude sur 7 sont inobservables à partir de cette campagne, donc AUCUN sigma de datum n'est publié ; les directions inobservables sont listées dans la base à sept paramètres

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines =
    { $n_beacons ->
        [one]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } balise x { $v1 } bases x { $n_epochs } époque = { $n_obs } obs (sigma de délai { $sigma_tau } s) | datum de station { $station_datum } | rang de Helmert { $rank }/7 cond { $condition } | sigma de translation du datum { $v5 } contre erreur de récupération de la transformation injectée { $trans_err_norm_m } m (rapport { $v7 })
                [many] lunar-frame-campaign | { $n_beacons } balise x { $v1 } bases x { $n_epochs } d'époques = { $n_obs } obs (sigma de délai { $sigma_tau } s) | datum de station { $station_datum } | rang de Helmert { $rank }/7 cond { $condition } | sigma de translation du datum { $v5 } contre erreur de récupération de la transformation injectée { $trans_err_norm_m } m (rapport { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } balise x { $v1 } bases x { $n_epochs } époques = { $n_obs } obs (sigma de délai { $sigma_tau } s) | datum de station { $station_datum } | rang de Helmert { $rank }/7 cond { $condition } | sigma de translation du datum { $v5 } contre erreur de récupération de la transformation injectée { $trans_err_norm_m } m (rapport { $v7 })
            }
        [many]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } de balises x { $v1 } bases x { $n_epochs } époque = { $n_obs } obs (sigma de délai { $sigma_tau } s) | datum de station { $station_datum } | rang de Helmert { $rank }/7 cond { $condition } | sigma de translation du datum { $v5 } contre erreur de récupération de la transformation injectée { $trans_err_norm_m } m (rapport { $v7 })
                [many] lunar-frame-campaign | { $n_beacons } de balises x { $v1 } bases x { $n_epochs } d'époques = { $n_obs } obs (sigma de délai { $sigma_tau } s) | datum de station { $station_datum } | rang de Helmert { $rank }/7 cond { $condition } | sigma de translation du datum { $v5 } contre erreur de récupération de la transformation injectée { $trans_err_norm_m } m (rapport { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } de balises x { $v1 } bases x { $n_epochs } époques = { $n_obs } obs (sigma de délai { $sigma_tau } s) | datum de station { $station_datum } | rang de Helmert { $rank }/7 cond { $condition } | sigma de translation du datum { $v5 } contre erreur de récupération de la transformation injectée { $trans_err_norm_m } m (rapport { $v7 })
            }
       *[other]
            { $n_epochs ->
                [one] lunar-frame-campaign | { $n_beacons } balises x { $v1 } bases x { $n_epochs } époque = { $n_obs } obs (sigma de délai { $sigma_tau } s) | datum de station { $station_datum } | rang de Helmert { $rank }/7 cond { $condition } | sigma de translation du datum { $v5 } contre erreur de récupération de la transformation injectée { $trans_err_norm_m } m (rapport { $v7 })
                [many] lunar-frame-campaign | { $n_beacons } balises x { $v1 } bases x { $n_epochs } d'époques = { $n_obs } obs (sigma de délai { $sigma_tau } s) | datum de station { $station_datum } | rang de Helmert { $rank }/7 cond { $condition } | sigma de translation du datum { $v5 } contre erreur de récupération de la transformation injectée { $trans_err_norm_m } m (rapport { $v7 })
               *[other] lunar-frame-campaign | { $n_beacons } balises x { $v1 } bases x { $n_epochs } époques = { $n_obs } obs (sigma de délai { $sigma_tau } s) | datum de station { $station_datum } | rang de Helmert { $rank }/7 cond { $condition } | sigma de translation du datum { $v5 } contre erreur de récupération de la transformation injectée { $trans_err_norm_m } m (rapport { $v7 })
            }
    }


engine-lunar-frame-campaign-of-beacons-have-no-observation = { $names } balises sur { $beacons } n'ont aucune observation dans ce calendrier ({ $names2 }) ; elles ne portent aucune information, leurs sigmas sont null, et le datum est réalisé à partir des seules balises observées

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = tous les sigmas doivent être positifs

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss : planes, sats_per_plane et altitude_km doivent être positifs

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss : tx_efficiency doit être dans (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency : GNSS { $v } m contre sol { $v2 } m de sigma de position, q moyen { $v3 } (khi-deux 6 attend 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase : { $last } ambiguïtés, succès ILS { $last2 } (amorçage { $last3 }) sur l'arc le plus long

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation : plus petite valeur propre d'information x{ $v } avec les liaisons d'orbiteur, trace CRLB x{ $v2 }

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie : { $last } points de balayage sur { $v } arcs ; laser contre GNSS x sigma de translation { $last2 } m au rattachement local enregistré

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity : sigma CRLB h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = étude `{ $other }` inconnue : l'une des suivantes est attendue : { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = l'ensemble de mesures ne détermine pas l'orbite (information singulière)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials doit valoir au moins 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = les sigmas du sol doivent être positifs

engine-e-lunar-infra-od-unknown-station-dss-14-dss = station `{ $nm }` inconnue : DSS-14, DSS-63 ou DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = trop peu de mesures au sol pour déterminer l'orbite

engine-e-lunar-infra-od-the-covariance-of-the-difference = la covariance de la différence est singulière

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = la correction différentielle NRHO n'a pas convergé à partir de la graine

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo nécessite 0 < altitude du périlune < altitude de l'apolune

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = famille d'orbites `{ $other }` inconnue : nrho ou elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s et arc_days doivent être positifs

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = aucun satellite commun entre les récepteurs

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = les équations normales de la phase de la porteuse sont singulières

engine-e-lunar-infra-phase-the-position-block-is-singular = le bloc de position est singulier

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = la covariance des ambiguïtés n'est pas définie positive

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = les sigmas de technique doivent être positifs

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = les sigmas de rattachement local doivent être positifs

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz doit être fini et positif

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz doit être fini et positif

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k doit être fini et positif

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km doit être fini et supérieur au rayon lunaire

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity doit être dans [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw doit être fini

engine-lunar-jamming-lunar-jamming-sats-epochs-links =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } époque, { $n_links } liaison depuis ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (moyenne { $mean_js_db }) | { $n_lost } LOST | disponibilité { $availability_under_jamming } (nominale { $availability_nominal })
                [many] lunar-jamming | { $n_sats } sat., { $n_epochs } époque, { $n_links } de liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (moyenne { $mean_js_db }) | { $n_lost } LOST | disponibilité { $availability_under_jamming } (nominale { $availability_nominal })
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } époque, { $n_links } liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (moyenne { $mean_js_db }) | { $n_lost } LOST | disponibilité { $availability_under_jamming } (nominale { $availability_nominal })
            }
        [many]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } d'époques, { $n_links } liaison depuis ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (moyenne { $mean_js_db }) | { $n_lost } LOST | disponibilité { $availability_under_jamming } (nominale { $availability_nominal })
                [many] lunar-jamming | { $n_sats } sat., { $n_epochs } d'époques, { $n_links } de liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (moyenne { $mean_js_db }) | { $n_lost } LOST | disponibilité { $availability_under_jamming } (nominale { $availability_nominal })
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } d'époques, { $n_links } liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (moyenne { $mean_js_db }) | { $n_lost } LOST | disponibilité { $availability_under_jamming } (nominale { $availability_nominal })
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } époques, { $n_links } liaison depuis ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (moyenne { $mean_js_db }) | { $n_lost } LOST | disponibilité { $availability_under_jamming } (nominale { $availability_nominal })
                [many] lunar-jamming | { $n_sats } sat., { $n_epochs } époques, { $n_links } de liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (moyenne { $mean_js_db }) | { $n_lost } LOST | disponibilité { $availability_under_jamming } (nominale { $availability_nominal })
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } époques, { $n_links } liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (moyenne { $mean_js_db }) | { $n_lost } LOST | disponibilité { $availability_under_jamming } (nominale { $availability_nominal })
            }
    }


engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 =
    { $n_epochs ->
        [one]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } époque, { $n_links } liaison depuis ({ $site_lat_deg }, { $site_lon_deg }) | aucun brouilleur (référence lunaire en ciel dégagé) | { $n_lost } LOST | disponibilité { $availability_nominal }
                [many] lunar-jamming | { $n_sats } sat., { $n_epochs } époque, { $n_links } de liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | aucun brouilleur (référence lunaire en ciel dégagé) | { $n_lost } LOST | disponibilité { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } époque, { $n_links } liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | aucun brouilleur (référence lunaire en ciel dégagé) | { $n_lost } LOST | disponibilité { $availability_nominal }
            }
        [many]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } d'époques, { $n_links } liaison depuis ({ $site_lat_deg }, { $site_lon_deg }) | aucun brouilleur (référence lunaire en ciel dégagé) | { $n_lost } LOST | disponibilité { $availability_nominal }
                [many] lunar-jamming | { $n_sats } sat., { $n_epochs } d'époques, { $n_links } de liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | aucun brouilleur (référence lunaire en ciel dégagé) | { $n_lost } LOST | disponibilité { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } d'époques, { $n_links } liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | aucun brouilleur (référence lunaire en ciel dégagé) | { $n_lost } LOST | disponibilité { $availability_nominal }
            }
       *[other]
            { $n_links ->
                [one] lunar-jamming | { $n_sats } sat., { $n_epochs } époques, { $n_links } liaison depuis ({ $site_lat_deg }, { $site_lon_deg }) | aucun brouilleur (référence lunaire en ciel dégagé) | { $n_lost } LOST | disponibilité { $availability_nominal }
                [many] lunar-jamming | { $n_sats } sat., { $n_epochs } époques, { $n_links } de liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | aucun brouilleur (référence lunaire en ciel dégagé) | { $n_lost } LOST | disponibilité { $availability_nominal }
               *[other] lunar-jamming | { $n_sats } sat., { $n_epochs } époques, { $n_links } liaisons depuis ({ $site_lat_deg }, { $site_lon_deg }) | aucun brouilleur (référence lunaire en ciel dégagé) | { $n_lost } LOST | disponibilité { $availability_nominal }
            }
    }


## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = en-tête de catalogue de réflecteurs { $t } inattendu

engine-e-lunar-llr-short-reflector-catalogue-row = ligne de catalogue de réflecteurs { $t } trop courte

engine-e-lunar-llr-unreadable-reflector-field-in = champ de réflecteur { $i } illisible dans { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = réflecteur { $f } : |(x,y,z)| = { $norm3 } m mais la colonne de rayon publiée indique { $radius } m — la ligne a été modifiée

engine-e-lunar-llr-reflector-catalogue-has-no-rows = le catalogue de réflecteurs n'a aucune ligne

engine-e-lunar-llr-unreadable-position-epoch-year = position_epoch_year { $rest } illisible

engine-e-lunar-llr-unexpected-station-catalogue-header = en-tête de catalogue de stations { $t } inattendu

engine-e-lunar-llr-short-station-catalogue-row = ligne de catalogue de stations { $t } trop courte

engine-e-lunar-llr-unreadable-station-field-in = champ de station { $i } illisible dans { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = identifiant ILRS illisible dans { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = le catalogue de stations n'a aucune ligne

engine-e-lunar-llr-cannot-read-this-scenario-runs = impossible de lire { $path } ({ $e }). Ce scénario s'exécute sur la tranche de données réelles versionnée sous { $DEFAULT_DATA_DIR }, livrée avec le dépôt mais pas avec le crate publié ; faites pointer `data_dir` vers une copie de celle-ci.

engine-e-lunar-llr-only-usable-normal-points-for = seulement { $used } points normaux utilisables pour { $reflectors } réflecteurs — trop peu pour borner { $v3 } coordonnées ; élargissez la tranche d'archive

engine-e-lunar-llr-the-simulated-campaign-own-report = le rapport propre de la campagne simulée n'a pas pu être analysé : { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum : { $used } points normaux archivés ({ $n_parsed } analysés) depuis { $station_counts } station(s) vers { $reflectors } réseaux de rétroréflecteurs sur { $v5 } d ; précision médiane mesurée des points normaux { $median } mm aller simple ; rang d'information des réflecteurs { $rank }/{ $n } ; rang de Helmert { $rank2 }/{ $n_helmert } cond { $condition } ; sigma de translation du datum { $v12 } m ; RMS du résidu aller simple observé moins calculé { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg doit être fini et dans [-90, 90), reçu { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } a une coordonnée non finie

engine-e-lunar-llr-latitude-deg-is-outside-90 = la latitude { $lat_deg } deg de { $kind } { $name } est hors de [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = la sérialisation du rapport lunar-llr-datum a échoué : { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = le pas d'intégration doit diviser le pas de sortie

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = récepteur : { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } doit être fini et non négatif

engine-lunar-receiver-must-be-finite-and-positive = { $n } doit être fini et positif

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume : { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume : export du site : { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = l'éphéméride lunaire { $path } couvre { $until } s après son époque mais l'horizon du scénario atteint { $last } s ; raccourcissez horizon_hours ou récupérez un arc plus long (l'extrapolation d'une éphéméride tabulée est refusée)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path nécessite epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = Référentiel OP à { $epoch } UTC (normale à l'orbite apparente de la Terre autour de la Lune, x le long de son nœud sur l'équateur lunaire IAU) ; GM, J2 et C22 lunaires dans le référentiel IAU lié à la Lune, Terre et Soleil comme corps tiers aux positions DE440 issues de { $spk_path } ; Runge-Kutta d'ordre quatre, pas de 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution : height_sigma_m doit être fini et positif

engine-e-lunar-solution-solution-range-sigma-must-be = solution : range_sigma_m doit être fini et positif

engine-e-lunar-solution-solution-min-satellites-needs-height = solution : min_satellites = 3 nécessite height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution : min_satellites doit valoir 3 ou 4, reçu { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution : window_epochs doit être de 1 à 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } doit être fini et positif

engine-lunar-station-must-be-finite-and-not = { $name } doit être fini et non négatif

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } dépasse { $MAX_WORK } ; réduisez n_trials, grossissez grid_lat_step_deg (ou listez moins de points), ou augmentez t_step_s / raccourcissez t_span_s

engine-e-lunar-station-kind-must-be-got = kind doit être { $KIND } ; reçu { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND } : l'éphéméride { $path } couvre { $until } s mais l'exécution atteint { $last } s (la dernière époque plus latency_s) ; raccourcissez t_span_s

engine-e-lunar-station-no-case = { $KIND } : aucun cas ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = { $n_grid_points } points · { $n_epochs } époques · { $n_trials } essais

engine-lunar-station-hpl-max = HPL max. { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = relevé { $survey_sigma_m } m · latence { $latency_s } s · { $quantization_bits } bits

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem : lines et samples doivent être de 2 à { $MAX_DEM_SIDE }, reçu { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem : { $heights_m } hauteurs pour une grille de { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem : map_scale_m doit être positif, reçu { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem : reference_radius_m doit être positif, reçu { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem : impossible de lire { $descriptor_path } : { $e }

engine-e-lunar-terrain-dem = dem : { $descriptor_path } : { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem : projection doit être south-polar-stereographic, reçu { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem : sample_type doit être int16-le, reçu { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem : impossible de lire { $img } : { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem : grille au-delà du plafond de { $MAX_DEM_SIDE } pixels

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem : { $img } fait { $bytes } octets ; { $lines } x { $samples } int16 nécessite { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem : { $img } SHA-256 { $digest } ne correspond pas à { $image_sha256 } du descripteur

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem : scaling_factor doit être positif

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile : impossible de lire { $path } : { $e }

engine-e-lunar-terrain-dem-tile = dem_tile : { $path } : { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile : { $path } : nécessite au moins 2 x 2 points, une étendue croissante dans [-90, 90] deg et 360 deg de longitude, et des hauteurs finies

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain : { $what } doit être fini et positif, reçu { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain : antenna_height_m doit être fini et non négatif, reçu { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain : azimuth_step_deg doit être au plus 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain : max_range_m / range_step_m doit être de 1 à 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain : le site est hors du champ de hauteurs

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain : un horizon déclaré nécessite une source non vide

engine-e-lunar-terrain-terrain-stated-horizon = terrain : horizon déclaré : { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain : indiquez dem_path ou dem_tile_path, pas les deux

engine-e-lunar-terrain-terrain-max-range-km-must = terrain : max_range_km doit être fini et positif

engine-e-lunar-terrain-terrain-range-step-must-be = terrain : range_step_m doit être fini et positif

engine-e-lunar-terrain-site-deg-deg = { $e } (site { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = horloge { $other } inconnue ; l'une des suivantes est attendue : optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks doit nommer au moins une classe d'horloge

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s doit être fini et positif, reçu { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s doit être fini et supérieur à tau_min_s ({ $lo }), reçu { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade doit être ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = le terme { $name } est plus court que la grille tau

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | horloge { $clock } | x_Σ(τ) à 7 termes sur { $taus } points τ ({ $taus2 }–{ $taus3 } s) | croisement τ { $crossover_tau_s } s (x { $crossover_x_s } s) | plancher de référentiel { $frame_term_s } s | horloge x(1 d) { $x_1day_ns } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab : horloge { $other } inconnue ; l'une des suivantes est attendue : optical-master, passive-h-maser, rafs, mini-rafs, ou indiquez plutôt une device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab : indiquez soit clock soit device_card, pas les deux

engine-e-lunar-time-lab-time-lab-device-card = time_lab : device_card : { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab : steer_interval_s doit être fini et positif, reçu { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab : { $name } doit être fini et non négatif, reçu { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab : horizons_s doit être composé de nombres positifs

engine-lunar-time-lab-station-height-not-modelled-exactly = hauteur de station non modélisée exactement : une erreur de hauteur à un sigma de { $height_sigma_m } m biaise le taux de { $value } ns/jour, appliquée comme terme linéaire depuis le dernier pilotage

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = le temps de lumière n'a pas convergé à 1e-15 s en 30 itérations

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = le chemin du noyau nécessite planetary_kernel_path, earth_orientation_kernel_path et moon_orientation_kernel_path ensemble

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = datum { $other } inconnu : "anchor-first-station", "free-network" ou "all-stations-fixed" attendu

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = un calendrier VLBI nécessite au moins 2 stations pour former une base, reçu { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = les coordonnées de la balise doivent être finies

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = la latitude { $lat } deg de la balise est hors de [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = un calendrier de { $v1 } époques dépasse la limite de 20000 époques de ce scénario ; allongez step_min ou raccourcissez arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g doit être positif et fini, reçu { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = sérialisation du résultat lunar-vlbi-fim : { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule =
    { $n_epochs ->
        [one] aucune observation du calendrier ne franchit le masque d'élévation de { $mask } deg aux deux extrémités d'une base : { $n_epochs } époque x { $v1 } bases toutes rejetées. Allongez arc_hours, abaissez elevation_mask_deg ou déplacez les stations.
        [many] aucune observation du calendrier ne franchit le masque d'élévation de { $mask } deg aux deux extrémités d'une base : { $n_epochs } d'époques x { $v1 } bases toutes rejetées. Allongez arc_hours, abaissez elevation_mask_deg ou déplacez les stations.
       *[other] aucune observation du calendrier ne franchit le masque d'élévation de { $mask } deg aux deux extrémités d'une base : { $n_epochs } époques x { $v1 } bases toutes rejetées. Allongez arc_hours, abaissez elevation_mask_deg ou déplacez les stations.
    }


engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = le datum ne laisse aucun paramètre à estimer

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT : { $defect } directions sur { $dim } sont inobservables, donc aucun sigma par coordonnée n'est rapporté ; la valeur du sous-espace observable ci-dessous est une pseudo-inverse restreinte aux { $rank } directions observables et n'est PAS un sigma de station

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines =
    { $n_stations ->
        [one]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } station / { $v2 } bases x { $n_epochs } époque = { $n_obs } obs (masque { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | sigma de station { $v10 } contre équipartition g={ $g } { $eq_g } m (rapport { $v13 })
                [many] lunar-vlbi-fim | { $n_stations } station / { $v2 } bases x { $n_epochs } d'époques = { $n_obs } obs (masque { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | sigma de station { $v10 } contre équipartition g={ $g } { $eq_g } m (rapport { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } station / { $v2 } bases x { $n_epochs } époques = { $n_obs } obs (masque { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | sigma de station { $v10 } contre équipartition g={ $g } { $eq_g } m (rapport { $v13 })
            }
        [many]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } de stations / { $v2 } bases x { $n_epochs } époque = { $n_obs } obs (masque { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | sigma de station { $v10 } contre équipartition g={ $g } { $eq_g } m (rapport { $v13 })
                [many] lunar-vlbi-fim | { $n_stations } de stations / { $v2 } bases x { $n_epochs } d'époques = { $n_obs } obs (masque { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | sigma de station { $v10 } contre équipartition g={ $g } { $eq_g } m (rapport { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } de stations / { $v2 } bases x { $n_epochs } époques = { $n_obs } obs (masque { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | sigma de station { $v10 } contre équipartition g={ $g } { $eq_g } m (rapport { $v13 })
            }
       *[other]
            { $n_epochs ->
                [one] lunar-vlbi-fim | { $n_stations } stations / { $v2 } bases x { $n_epochs } époque = { $n_obs } obs (masque { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | sigma de station { $v10 } contre équipartition g={ $g } { $eq_g } m (rapport { $v13 })
                [many] lunar-vlbi-fim | { $n_stations } stations / { $v2 } bases x { $n_epochs } d'époques = { $n_obs } obs (masque { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | sigma de station { $v10 } contre équipartition g={ $g } { $eq_g } m (rapport { $v13 })
               *[other] lunar-vlbi-fim | { $n_stations } stations / { $v2 } bases x { $n_epochs } époques = { $n_obs } obs (masque { $mask } deg) | datum { $datum } | rang { $rank }/{ $dim } cond { $condition } | sigma de station { $v10 } contre équipartition g={ $g } { $eq_g } m (rapport { $v13 })
            }
    }


## src/main.rs

engine-main-error-validate-needs-scenario-path = erreur : --validate nécessite un chemin de scénario

engine-main-error-study-needs-suite-manifest = erreur : --study nécessite un chemin de manifeste de suite

engine-main-error-study-name-needs-value = erreur : --study-name nécessite une valeur

engine-main-error-export-sp3-needs-path = erreur : --export-sp3 nécessite un chemin

engine-main-error-export-omm-needs-path = erreur : --export-omm nécessite un chemin

engine-main-error-export-oem-needs-path = erreur : --export-oem nécessite un chemin

engine-main-error-animate-needs-format-svg = erreur : --animate nécessite un format : svg, html, frames ou all

engine-main-error-animate = erreur : --animate : { $e }

engine-main-error-animate-fps-needs-whole = erreur : --animate-fps nécessite un nombre entier d'images par seconde

engine-main-error-export-needs-format-czml = erreur : --export nécessite un format : czml, kml, geojson, stk, sigmf, all ou list

engine-main-error-animate-duration-needs-length = erreur : --animate-duration nécessite une durée en secondes

engine-main-error-import-route-needs-geojson = erreur : --import-route nécessite un chemin de fichier GeoJSON

engine-main-error-eop-needs-finals2000a-file = erreur : --eop nécessite un chemin de fichier finals2000A

engine-main-error-unknown-option = erreur : option '{ $other }' inconnue

engine-main-error-unexpected-argument-one-scenario = erreur : argument '{ $other }' inattendu ; un seul fichier de scénario par exécution

engine-main-warning-animate-fps-and-animate = avertissement : --animate-fps et --animate-duration ne font rien sans --animate

engine-main-error-animate-exports-one-scenario = erreur : --animate exporte l'exécution d'un seul scénario ; il ne se combine pas avec --validate ou --study

engine-main-error-validate-lints-one-scenario = erreur : --validate analyse un seul scénario ; ne passez pas en plus un fichier de scénario

engine-main-error-cannot-read = erreur : impossible de lire { $validate_file } : { $e }

engine-main-ok-kind-resolves-this-kind = ok : { $kind } — le type est reconnu ; ce type n'exige aucun champ (un corps vide exécute sa configuration de référence), il n'y avait donc rien d'autre à vérifier

engine-main-ok-kind-resolves-and-all =
    { $n_required ->
        [one] ok : { $kind } — le type est reconnu et l'unique entrée de champ obligatoire publiée ({ $n_required }) est remplie ; les valeurs des champs ne sont pas vérifiées
        [many] ok : { $kind } — le type est reconnu et les { $n_required } d'entrées de champs obligatoires publiées sont toutes remplies ; les valeurs des champs ne sont pas vérifiées
       *[other] ok : { $kind } — le type est reconnu et les { $n_required } entrées de champs obligatoires publiées sont toutes remplies ; les valeurs des champs ne sont pas vérifiées
    }


engine-main-error-study-runs-suite-do = erreur : --study exécute une suite ; ne passez pas en plus un seul fichier de scénario

engine-main-warning-study-name-is-ignored = avertissement : --study-name est ignoré avec --study ; une étude est titrée par le `title =` du manifeste de la suite

engine-main-error-cannot-read-2 = erreur : impossible de lire { $path } : { $e }

engine-main-hint-kshana-example-lists-the = indice : `kshana example` liste les scénarios de référence intégrés ; `kshana example clock-holdover > clock-holdover.toml` en écrit un

engine-main-error-cannot-read-3 = erreur : impossible de lire { $eop_file } : { $e }

engine-main-error-eop = erreur : --eop : { $e }

engine-main-error-cannot-read-4 = erreur : impossible de lire { $route_file } : { $e }

engine-main-error-import-route = erreur : --import-route : { $e }

engine-main-does-not-apply = { $fmt } : ne s'applique pas : { $why }

engine-main-error-export = erreur : --export : { $e }

engine-main-error-animate-2 = erreur : --animate { $f } : { $e }

engine-main-error-export-2 = erreur : export { $fmt } : { $e }

engine-main-error-cannot-write = erreur : impossible d'écrire { $json_path } : { $e }

engine-main-error-cannot-write-2 = erreur : impossible d'écrire { $svg_path } : { $e }

engine-main-error-cannot-build-the-report = erreur : impossible de construire le rapport : { $e }

engine-main-error-cannot-write-3 = erreur : impossible d'écrire { $html_path } : { $e }

engine-main-error-cannot-write-4 = erreur : impossible d'écrire { $report_json_path } : { $e }

engine-main-error-cannot-write-5 = erreur : impossible d'écrire { $csv_path } : { $e }

engine-main-wrote-and = écrits : { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } et { $csv_path }

engine-main-wrote-and-2 = écrits : { $json_path }, { $svg_path }, { $html_path } et { $report_json_path }

engine-main-error-cannot-write-6 = erreur : impossible d'écrire { $target } : { $e }

engine-main-error-cannot-write-7 = erreur : impossible d'écrire { $sp3_path } : { $e }

engine-main-error-sp3-export-failed = erreur : échec de l'export SP3 : { $e }

engine-main-error-cannot-write-8 = erreur : impossible d'écrire { $omm_path } : { $e }

engine-main-error-omm-export-failed = erreur : échec de l'export OMM : { $e }

engine-main-error-cannot-write-9 = erreur : impossible d'écrire { $oem_path } : { $e }

engine-main-error-oem-export-failed = erreur : échec de l'export OEM : { $e }

engine-main-error-unexpected-argument-after-kinds = erreur : argument '{ $other }' inattendu après `kinds` ; seul --json est accepté

engine-main-bundled-reference-scenarios-write-one =
    Scénarios de référence intégrés ({ $v1 }). Écrivez-en un dans un fichier et exécutez-le :
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (non intégré : { $name } — exécutez `kshana example { $name }` pour savoir pourquoi)

engine-main-error-is-not-bundled-it = erreur : '{ $name }' n'est pas intégré : il { $why }

engine-main-error-no-bundled-scenario-named = erreur : aucun scénario intégré nommé '{ $name }' ; `kshana example` liste les { $v1 } qui le sont

engine-main-error-cannot-read-5 = erreur : impossible de lire { $suite_path } : { $e }

engine-main-wrote-and-3 = écrits : { $json_path } et { $html_path }

engine-main-error-needs-value = erreur : { $a } nécessite une valeur

engine-main-error-expected-mean-needs-number = erreur : --expected-mean nécessite un nombre

engine-main-error-unknown-imu-fit-option = erreur : option imu-fit { $x } inconnue

engine-main-error-imu-fit-needs-an = erreur : imu-fit nécessite un chemin de journal IMU

engine-main-error-needs-value-2 = erreur : { $args } nécessite une valeur

engine-main-error-epoch = erreur : --epoch : { $e }

engine-main-error-unknown-bench-export-option = erreur : option bench-export { $a } inconnue

engine-main-error-bench-export-needs-scenario = erreur : bench-export nécessite un chemin de scénario

engine-main-needs-value = { $a } nécessite une valeur

engine-main-site-takes-lat-lon-height = --site prend lat,lon[,height_m], reçu { $v }

engine-main-error-is-bytes-the-tle = erreur : { $p } fait { $m } octets ; le plafond TLE est de { $cap } (4 MiB)

engine-main-error-cannot-read-6 = erreur : impossible de lire { $p } : { $e }

engine-e-main-monte-carlo = --monte-carlo : { $e }

engine-e-main-seed = --seed : { $e }

engine-main-unknown-sky-option = option sky { $a } inconnue

engine-e-main-svg-and-monte-carlo-are = --svg et --monte-carlo sont des sorties distinctes ; indiquez-en une

engine-main-error-preset-needs-name =
    erreur : --preset nécessite un nom
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    erreur : --profile nécessite un fichier
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = { $r } symboles, { $r2 } trame(s) trouvée(s) ; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }trame à { $f } : FID { $f2 } TOI { $f3 } (métrique SB1 { $f4 }, { $f5 } erreur(s) SP, { $f6 } erreur(s) SB1)

engine-main-not-checked = non vérifié : { $r }

engine-main-wrote-frame-of-6000-symbols = { $out } écrit : { $frames } trame(s) de 6000 symboles ; les sous-trames 2 à 4 sont des substituts (non codées LDPC, sans message)

engine-main-error-cannot-write-10 = erreur : impossible d'écrire { $out } : { $e }

engine-main-unknown-lunanet-afs-check-subcommand = sous-commande lunanet-afs-check { $other } inconnue

engine-main-needs-pack-id = { $cmd } nécessite un identifiant de paquet

engine-main-unknown-standards-pack-run-option = option d'exécution standards-pack { $a } inconnue

engine-main-unknown-standards-pack-subcommand = sous-commande standards-pack { $other } inconnue

engine-main-error-out-needs-value = erreur : --out nécessite une valeur

engine-main-error-unknown-compliance-report-option = erreur : option compliance-report { $a } inconnue

engine-main-error-compliance-report-needs-at = erreur : compliance-report nécessite au moins un fichier de résultat .json

engine-main-runs-read-not-used-rows = { $runs } exécutions lues, { $unrecognised } non utilisées ; lignes : { $n } avec preuves, { $n2 } partielles, { $n3 } sans preuves, { $n4 } hors périmètre

engine-main-error-receiver-trust-needs-scenario = erreur : receiver-trust nécessite un chemin de scénario

engine-main-error-invalid-receiver-trust-scenario = erreur : scénario receiver-trust invalide : { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = la combustion épuise la masse : m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, combustion={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = le temps de vol doit être positif

engine-e-maneuver-collinear-endpoints-transfer-plane-is = extrémités colinéaires : le plan de transfert est indéfini (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs est pour M >= 1 ; utilisez lambert pour M = 0

engine-e-maneuver-no-revolution-transfer-the-time = aucun transfert à { $revs } révolution(s) : le temps de vol est inférieur à son minimum

engine-e-maneuver-grid-step-days-must-be = grid_step_days doit être positif, reçu : { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = chaque fenêtre doit aller vers l'avant (début <= fin)

engine-e-maneuver-no-transfer-of-the-requested = aucun transfert du type demandé dans les fenêtres

engine-e-maneuver-the-optimum-left-the-feasible = l'optimum a quitté la région admissible

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field } : { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field } : 3 valeurs attendues

engine-e-mars-od-dss-epoch-is-not-2003 = l'époque de DSS-{ $id } n'est pas 2003-JAN-01 : { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } n'a pas de DXYZ

engine-e-mars-od-no-coordinates-for-dss = aucune coordonnée pour DSS { $station }

engine-e-mars-od-no-ramps-for-dss = aucune rampe pour DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = la table de rampes ne couvre pas l'intervalle

engine-e-mars-od-epoch-outside-the-integrated-span = l'époque { $et } est hors de l'intervalle intégré

engine-e-mars-od-normal-matrix-is-not-positive = la matrice normale n'est pas définie positive

engine-e-mars-od-no-points = aucun point

engine-e-mars-od-parameter-has-no-partial-on = un paramètre n'a pas de dérivée partielle sur les points conservés

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | utilisateur { $user }, horloge { $clock_class } | { $n_relays } relais (moyenne { $mean_relays_in_view } en vue) | RMS de position convergé { $converged_pos_rms_m } m, 1σ formel { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — FoM de covariance, pas un PL certifié) | σ de fréquence d'horloge { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — utilisateur { $user }, horloge { $clock_class } : erreur de position 3-D par rapport à la vérité terrain (RMS convergé { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = la matrice de comparaisons par paires est vide

engine-e-mcda-ahp-pairwise-matrix-is-not-square = la matrice de comparaisons par paires n'est pas carrée (la ligne { $i } compte { $row } sur { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = l'entrée a[{ $i }][{ $j }] = { $v } doit être finie et positive

engine-e-mcda-ahp-diagonal-must-be = la diagonale a[{ $i }][{ $i }] = { $row } doit valoir 1

engine-e-mcda-ahp-entries-must-be-reciprocal = les entrées a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } doivent être réciproques (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = la ligne supérieure { $i } compte { $row } entrées, { $v2 } attendues

engine-e-mcda-ahp-upper-entry-must-be-finite = l'entrée supérieure ({ $i },{ $j }) = { $v } doit être finie et positive

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS : matrice de décision vide

engine-e-mcda-copras-copras-no-criteria = COPRAS : aucun critère

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS : { $n } poids mais { $types } types de critère

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS : nécessite au moins un critère de coût (Min)

engine-e-mcda-copras-copras-alternative-has-values-but =
    { $n ->
        [one] COPRAS : l'alternative { $i } a { $row } valeurs mais il y a { $n } critère
        [many] COPRAS : l'alternative { $i } a { $row } valeurs mais il y a { $n } de critères
       *[other] COPRAS : l'alternative { $i } a { $row } valeurs mais il y a { $n } critères
    }


engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS : la valeur { $x } du critère { $j } de l'alternative { $i } doit être finie et > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I : jeu de données vide

engine-e-mcda-electre-electre-no-criteria = ELECTRE I : aucun critère

engine-e-mcda-electre-electre-alternative-has-values-but =
    { $n ->
        [one] ELECTRE I : l'alternative { $i } a { $row } valeurs mais il y a { $n } critère
        [many] ELECTRE I : l'alternative { $i } a { $row } valeurs mais il y a { $n } de critères
       *[other] ELECTRE I : l'alternative { $i } a { $row } valeurs mais il y a { $n } critères
    }


engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I : l'alternative { $i } a une valeur non finie

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA : matrice de décision vide

engine-e-mcda-moora-moora-no-criteria = MOORA : aucun critère

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA : { $n } poids mais { $types } types de critère

engine-e-mcda-moora-moora-alternative-has-values-but =
    { $n ->
        [one] MOORA : l'alternative { $i } a { $row } valeurs mais il y a { $n } critère
        [many] MOORA : l'alternative { $i } a { $row } valeurs mais il y a { $n } de critères
       *[other] MOORA : l'alternative { $i } a { $row } valeurs mais il y a { $n } critères
    }


engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA : l'alternative { $i } a une valeur non finie

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA : le critère { $j } a une norme L2 nulle

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II : matrice de décision vide

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II : aucun critère

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II : { $n } poids mais { $types } types / { $prefs } fonctions de préférence

engine-e-mcda-promethee-promethee-ii-alternative-has-values =
    { $n ->
        [one] PROMETHEE II : l'alternative { $i } a { $row } valeurs mais il y a { $n } critère
        [many] PROMETHEE II : l'alternative { $i } a { $row } valeurs mais il y a { $n } de critères
       *[other] PROMETHEE II : l'alternative { $i } a { $row } valeurs mais il y a { $n } critères
    }


engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II : l'alternative { $i } a une valeur non finie

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS : matrice de décision vide

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS : aucun critère

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS : { $n } poids mais { $types } types de critère

engine-e-mcda-topsis-topsis-alternative-has-values-but =
    { $n ->
        [one] TOPSIS : l'alternative { $i } a { $row } valeurs mais il y a { $n } critère
        [many] TOPSIS : l'alternative { $i } a { $row } valeurs mais il y a { $n } de critères
       *[other] TOPSIS : l'alternative { $i } a { $row } valeurs mais il y a { $n } critères
    }


engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS : l'alternative { $i } a une valeur non finie

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = l'utilité additive n'a aucun attribut

engine-e-mcda-utility-attributes-but-weights = { $attributes } attributs mais { $weights } poids

engine-e-mcda-utility-invalid-scaling-constant = constante d'échelle { $w } invalide

engine-e-mcda-utility-scaling-constants-sum-to-zero = les constantes d'échelle ont une somme nulle

engine-e-mcda-utility-attribute-values-expected-got = { $attributes } valeurs d'attribut attendues, reçu : { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR : matrice de décision vide

engine-e-mcda-vikor-vikor-no-criteria = VIKOR : aucun critère

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR : { $n } poids mais { $types } types de critère

engine-e-mcda-vikor-vikor-alternative-has-values-but =
    { $n ->
        [one] VIKOR : l'alternative { $i } a { $row } valeurs mais il y a { $n } critère
        [many] VIKOR : l'alternative { $i } a { $row } valeurs mais il y a { $n } de critères
       *[other] VIKOR : l'alternative { $i } a { $row } valeurs mais il y a { $n } critères
    }


engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR : l'alternative { $i } a une valeur non finie

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS : matrice de décision vide

engine-e-mcda-waspas-waspas-no-criteria = WASPAS : aucun critère

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS : { $n } poids mais { $types } types de critère

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS : lambda { $lambda } doit être compris dans [0, 1]

engine-e-mcda-waspas-waspas-alternative-has-values-but =
    { $n ->
        [one] WASPAS : l'alternative { $i } a { $row } valeurs mais il y a { $n } critère
        [many] WASPAS : l'alternative { $i } a { $row } valeurs mais il y a { $n } de critères
       *[other] WASPAS : l'alternative { $i } a { $row } valeurs mais il y a { $n } critères
    }


engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS : la valeur { $x } du critère { $j } de l'alternative { $i } doit être finie et > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM : matrice de décision vide

engine-e-mcda-wpm-wpm-no-criteria = WPM : aucun critère

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM : { $n } poids mais { $types } types de critère

engine-e-mcda-wpm-wpm-alternative-has-values-but =
    { $n ->
        [one] WPM : l'alternative { $i } a { $row } valeurs mais il y a { $n } critère
        [many] WPM : l'alternative { $i } a { $row } valeurs mais il y a { $n } de critères
       *[other] WPM : l'alternative { $i } a { $row } valeurs mais il y a { $n } critères
    }


engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM : la valeur { $x } du critère { $j } de l'alternative { $i } doit être finie et > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = la matrice de décision n'a aucun critère

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = la matrice de décision n'a aucune alternative

engine-e-mcda-wsm-criterion-has-an-invalid-weight = le critère '{ $name }' a un poids { $weight } invalide

engine-e-mcda-wsm-criterion-weights-sum-to-zero = les poids des critères ont une somme nulle

engine-e-mcda-wsm-alternative-has-values-but-there =
    { $n ->
        [one] l'alternative '{ $name }' a { $values } valeurs mais il y a { $n } critère
        [many] l'alternative '{ $name }' a { $values } valeurs mais il y a { $n } de critères
       *[other] l'alternative '{ $name }' a { $values } valeurs mais il y a { $n } critères
    }


engine-e-mcda-wsm-alternative-has-non-finite-value = l'alternative '{ $name }' a une valeur non finie sur le critère '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = pas un DAF : plus court qu'un enregistrement

engine-e-naif-kernel-not-daf-identification-word = pas un DAF : mot d'identification { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = format binaire DAF { $other } non pris en charge

engine-e-naif-kernel-implausible-daf-header-nd-ni = en-tête DAF invraisemblable : ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = l'adresse DAF { $addr } dépasse la fin du fichier

engine-e-naif-kernel-bad-daf-address-range = plage d'adresses DAF { $first }..={ $last } incorrecte

engine-e-naif-kernel-daf-summary-list-does-not = la liste de résumés DAF ne se termine pas

engine-e-naif-kernel-daf-summary-record-claims-summaries =
    { $count ->
        [one] l'enregistrement de résumés DAF { $rec } déclare { $count } résumé
        [many] l'enregistrement de résumés DAF { $rec } déclare { $count } de résumés
       *[other] l'enregistrement de résumés DAF { $rec } déclare { $count } résumés
    }


engine-e-naif-kernel-malformed-type-segment-rsize-intlen = segment de type 2 mal formé : RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = la taille du segment de type 2 ne correspond pas à son répertoire

engine-e-naif-kernel-epoch-outside-the-record = l'époque { $et } est hors de l'enregistrement [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = la taille du segment de type 1 ne correspond pas à son N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = enregistrement de type 1 mal formé : KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = pas un SPK : { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = le résumé SPK n'est pas ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = aucune donnée SPK de type 1/2 pour le corps { $target } à ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = le segment SPK de { $target } est dans le repère { $frame }, et non J2000

engine-e-naif-kernel-spk-centre-chain-does-not = la chaîne de centres SPK n'atteint pas le barycentre

engine-e-naif-kernel-not-binary-pck = pas un PCK binaire : { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = le résumé PCK n'est pas ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = aucune donnée PCK de type 2 pour le repère { $body_frame } à ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = le repère PCK { $body_frame } est donné par rapport au repère { $other }, qui n'est ni J2000 ni ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = nombre { $s } incorrect

engine-e-navsignal-must-be-positive-number = { $s } doit être un nombre positif

engine-e-navsignal-modulation-expected-name-args-bpsk = modulation { $label } : NOM(args) attendu, par ex. BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulation { $label } : parenthèse fermante manquante

engine-e-navsignal-modulation-is-not-one-of = la modulation { $label } n'est ni BPSK(n), ni BOC(m,n), ni MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = entité non terminée dans { $s }

engine-e-ndm-xml-bad-character-reference = référence de caractère &{ $ent }; incorrecte

engine-e-ndm-xml-unknown-entity = entité &{ $ent }; inconnue

engine-e-ndm-xml-unterminated-processing-instruction = instruction de traitement non terminée

engine-e-ndm-xml-unterminated-comment = commentaire non terminé

engine-e-ndm-xml-unterminated-declaration = déclaration non terminée

engine-e-ndm-xml-expected-an-element-at-byte = élément attendu à l'octet { $pos }

engine-e-ndm-xml-unterminated-start-tag = balise ouvrante non terminée

engine-e-ndm-xml-attribute-without-value = attribut sans valeur

engine-e-ndm-xml-unterminated-attribute-value = valeur d'attribut non terminée

engine-e-ndm-xml-unterminated-end-tag = balise fermante non terminée

engine-e-ndm-xml-unterminated-cdata = CDATA non terminé

engine-e-ndm-xml-content-after-the-root-element = contenu après l'élément racine

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } doit être fini et non négatif

engine-e-nma-budget-subframe-must-be-positive = subframe_s doit être positif

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps doit être positif

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed doit valoir 0 ou être positif

engine-e-nmea-synth-cli-unexpected-argument = argument { $s } inattendu

engine-nmea-synth-cli-instructor-json = { $prefix }.instructor.json

engine-nmea-synth-cli-instructor-txt = { $prefix }.instructor.txt

engine-nmea-synth-cli-instructor-log = journal de l'instructeur : { $e }

engine-nmea-synth-cli-instructor-log-and = journal de l'instructeur : { $jp } et { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = serveur TCP à l'écoute sur { $s } ; en attente de { $wait_clients } client(s)

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = YYYY-MM-DDTHH:MM:SSZ attendu

engine-e-nmea-synth-clock-date-or-time-out-of = date ou heure hors plage (années 1980 à 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = cette date du calendrier n'existe pas

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } doit être un nombre fini

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc } : { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s doit être compris entre 1 et 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz doit valoir 1, 2, 5 ou 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = la position du navire doit se situer à moins de 89 degrés de l'équateur

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn doit être compris entre 0 et 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = les limites de vitesse de giration et d'accélération du navire doivent être positives

engine-e-nmea-synth-config-give-at-least-one-waypoint = indiquez au moins un [[waypoint]] ou vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = le point de passage { $v1 } est hors plage

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = speed_kn du point de passage { $v1 } doit être compris entre 0 et 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems doit nommer au moins une constellation

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences : { $s } ne fait pas partie de { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s doit être au moins égal à 1

engine-e-nmea-synth-config-event = événement { $v1 } ({ $kind }) : { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s doit se situer à l'intérieur de l'exécution

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s doit être positif ; ramp_s et recovery_s ne doivent pas être négatifs

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s ne doit pas dépasser duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } ne s'applique pas à ce type

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz doit être compris entre 20 et 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db est obligatoire

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db doit être compris entre 0 et 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db doit être compris entre 0 et 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m est obligatoire

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m doit être compris entre 0 et 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = l'entraînement accélérerait la fausse trace jusqu'à { $need } m/s^2, au-dessus de max_accel_mps2 = { $a } ; allongez ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = indiquez exactement l'un de bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s est obligatoire

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s doit être non nul et inférieur à un jour

engine-e-nmea-synth-config-delay-is-required = delay_s est obligatoire

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s doit être compris entre 0 et 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = la ligne d'horizon ne décrit aucune obstruction

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } est terminé

engine-nmea-synth-gen-the-receiver-reports-fix-again =
    { $n_used ->
        [one] le récepteur signale de nouveau une position ({ $n_used } satellite utilisé)
        [many] le récepteur signale de nouveau une position ({ $n_used } de satellites utilisés)
       *[other] le récepteur signale de nouveau une position ({ $n_used } satellites utilisés)
    }


engine-nmea-synth-gen-the-receiver-has-no-fix =
    { $n_used ->
        [one] le récepteur n'a pas de position ({ $n_used } satellite utilisable, quatre nécessaires)
        [many] le récepteur n'a pas de position ({ $n_used } de satellites utilisables, quatre nécessaires)
       *[other] le récepteur n'a pas de position ({ $n_used } satellites utilisables, quatre nécessaires)
    }


## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = de T+{ $start_s } s pendant { $duration_s } s (rampe de début { $ramp_s } s, rampe de récupération { $recovery_s } s)

engine-nmea-synth-log-jamming-received-n0-falls-by = brouillage : le C/N0 reçu chute jusqu'à { $cn0_drop_db } dB (écart par satellite { $spread_db } dB) ; des satellites sont perdus et la position est perdue quand moins de quatre restent utilisables

engine-nmea-synth-log-towards-deg-true = vers { $b } deg vrai

engine-nmea-synth-log-towards-deg-true-deg-relative = vers { $t } deg vrai ({ $r } deg relatif à la route au début, puis maintenu)

engine-nmea-synth-log-natural-degradation-the-sky-closes = dégradation naturelle : le ciel se ferme derrière une ligne d'horizon indiquée ({ $e }) ; les satellites derrière elle restent listés sans SNR et ne sont pas utilisés, le C/N0 des autres est inchangé, et rien n'est contrefait

engine-nmea-synth-log-instructor-log = JOURNAL DE L'INSTRUCTEUR : { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Note du formateur : { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Début { $start_utc }   durée { $duration_s } s   graine { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }PICS  vrai : { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   signalé : { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems : constellation { $other } inconnue (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }La tolérance est inférieure au plancher de bruit de lecture de rang en f64 { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)) : son plancher de valeur propre équivalent rel_tol^2 = { $v1 } se situe sous le bruit d'arrondi de la matrice de Gram, de sorte que les directions supplémentaires sont des résidus arithmétiques, et non de l'observabilité.

engine-observability-gramian-rank-clamped-from-the-singular = rang ramené du nombre de valeurs singulières { $counted } à min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } pour rel_tol { $rel_tol } : une matrice { $n_rows }x{ $n_cols } ne peut pas avoir un rang { $counted }.{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular =
    { $n ->
        [one] GDOP non défini (géométrie de rang déficient / singulière) : rang { $rank } sur { $n } état, défaut de datum { $v3 }, conditionnement { $v4 }
        [many] GDOP non défini (géométrie de rang déficient / singulière) : rang { $rank } sur { $n } d'états, défaut de datum { $v3 }, conditionnement { $v4 }
       *[other] GDOP non défini (géométrie de rang déficient / singulière) : rang { $rank } sur { $n } états, défaut de datum { $v3 }, conditionnement { $v4 }
    }


## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } octets ne sont pas un nombre entier d'enregistrements de 36 octets

engine-e-odf-record-precedes-any-group-header = l'enregistrement { $v1 } précède tout en-tête de groupe

engine-e-odf-no-orbit-data-group = aucun groupe de données d'orbite

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } n'est pas un mot-clé de { $name }

engine-e-odm-without = { $name } sans { $k }

engine-e-odm-needs-exactly-one-of = { $name } nécessite exactement l'un de { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION et MESSAGE_ID sont des mots-clés d'en-tête de la version 3.0 (version { $version })

engine-odm-user-defined = USER_DEFINED_{ $k }

engine-e-odm-unexpected-line = ligne { $b } inattendue

engine-e-odm-unknown-keyword = mot-clé { $k } inconnu

engine-e-odm-block-repeated-or-out-of = bloc { $block } répété ou hors ordre à { $key }

engine-e-odm-repeated = { $key } répété

engine-e-odm-comments-after-the-last-keyword = commentaires après le dernier mot-clé

engine-e-odm-given-twice = { $b } indiqué deux fois

engine-e-odm-opm-without-metadata = OPM sans métadonnées

engine-e-odm-opm-without-state-vector = OPM sans vecteur d'état

engine-e-odm-omm-without-metadata = OMM sans métadonnées

engine-e-odm-omm-without-mean-elements = OMM sans éléments moyens

engine-e-odm-is-not-keyword-of-the = { $k } n'est pas un mot-clé du bloc { $kind }

engine-e-odm-block-without = bloc { $kind } sans { $k }

engine-e-odm-block-with-data-lines = bloc { $kind } avec des lignes de données

engine-e-odm-line-has-values-expected = la ligne { $l } du bloc { $kind } a { $l2 } valeurs, { $n } attendues

engine-e-odm-is-not-an-ocm-metadata = { $k } n'est pas un mot-clé de métadonnées OCM

engine-e-odm-ocm-metadata-without = métadonnées OCM sans { $k }

engine-e-odm-block-repeated = bloc { $kind } répété

engine-e-odm-inside-block = { $t } à l'intérieur d'un bloc

engine-e-odm-unsupported-ocm-block = bloc OCM { $tag } non pris en charge

engine-odm-outside-block = { $t } en dehors d'un bloc

engine-e-odm-closes-block = { $t } ferme un bloc { $want }

engine-e-odm-unexpected-line-2 = ligne { $t } inattendue

engine-e-odm-outside-block = { $k } en dehors d'un bloc

engine-e-odm-unterminated-block = bloc non terminé

## src/oem.rs

engine-oem-ccsds-oem-vers = CCSDS_OEM_VERS = { $version }{ "\u000A" }

engine-oem-creation-date = CREATION_DATE = { $iso8601 }{ "\u000A" }

engine-oem-object-name = OBJECT_NAME = { $object_name }{ "\u000A" }

engine-oem-center-name = CENTER_NAME = { $center_name }{ "\u000A" }

engine-oem-ref-frame = REF_FRAME = { $ref_frame }{ "\u000A" }

engine-oem-start-time = START_TIME = { $iso8601 }{ "\u000A" }

engine-oem-stop-time = STOP_TIME = { $iso8601 }{ "\u000A" }

engine-e-oem-epoch-missing-date-time-separator = séparateur date/heure 'T' manquant dans l'époque : { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = date d'époque OEM '{ $date }' non prise en charge (yyyy-mm-dd attendu)

engine-e-oem-unsupported-oem-epoch-time-expected = heure d'époque OEM '{ $time }' non prise en charge (HH:MM:SS attendu)

engine-e-oem-bad-epoch-year = année d'époque incorrecte : { $d }

engine-e-oem-bad-epoch-month = mois d'époque incorrect : { $d }

engine-e-oem-bad-epoch-day = jour d'époque incorrect : { $d }

engine-e-oem-bad-epoch-hour = heure d'époque incorrecte : { $t }

engine-e-oem-bad-epoch-minute = minute d'époque incorrecte : { $t }

engine-e-oem-bad-epoch-second = seconde d'époque incorrecte : { $t }

engine-e-oem-oem-epoch-field-out-of = champ d'époque OEM hors plage : { $s }

engine-e-oem-unexpected-oem-header-line = ligne d'en-tête OEM inattendue : { $line }

engine-e-oem-expected-meta-start-found = META_START attendu, trouvé : { $line }

engine-e-oem-unexpected-oem-metadata-line = ligne de métadonnées OEM inattendue : { $line }

engine-e-oem-oem-segment-metadata-missing-meta = métadonnées de segment OEM sans META_STOP

engine-e-oem-oem-metadata-missing-object-name = métadonnées OEM sans OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = métadonnées OEM sans OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = métadonnées OEM sans CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = métadonnées OEM sans REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = métadonnées OEM sans TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = métadonnées OEM sans START_TIME

engine-e-oem-oem-metadata-missing-stop-time = métadonnées OEM sans STOP_TIME

engine-e-oem-oem-data-line-needs-position = une ligne de données OEM nécessite des composantes position+vitesse (6) ou +accélération (9), reçu { $n } : { $line }

engine-e-oem-non-numeric-oem-state-value = valeur d'état OEM non numérique '{ $t }' dans : { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = OEM sans en-tête CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = OEM sans en-tête CREATION_DATE

engine-e-oem-oem-missing-originator-header = OEM sans en-tête ORIGINATOR

engine-e-oem-oem-carried-no-segments = l'OEM ne contenait aucun segment

engine-oem-oem-interop-round-tripped-segment =
    { $n_states_total ->
        [one] oem-interop : { $segments } segment(s) en aller-retour, { $n_states_total } état ; erreur d'aller-retour max. { $p } km / { $v } km/s (interop MODELLED)
        [many] oem-interop : { $segments } segment(s) en aller-retour, { $n_states_total } d'états ; erreur d'aller-retour max. { $p } km / { $v } km/s (interop MODELLED)
       *[other] oem-interop : { $segments } segment(s) en aller-retour, { $n_states_total } états ; erreur d'aller-retour max. { $p } km / { $v } km/s (interop MODELLED)
    }


engine-oem-oem-interop-ingested-segment-states =
    { $n_states_total ->
        [one] oem-interop : { $segments } segment(s) ingéré(s), { $n_states_total } état issus d'un OEM externe (émetteur { $originator }) (interop MODELLED)
        [many] oem-interop : { $segments } segment(s) ingéré(s), { $n_states_total } d'états issus d'un OEM externe (émetteur { $originator }) (interop MODELLED)
       *[other] oem-interop : { $segments } segment(s) ingéré(s), { $n_states_total } états issus d'un OEM externe (émetteur { $originator }) (interop MODELLED)
    }


engine-oem-cov-ref-frame = COV_REF_FRAME = { $frame }{ "\u000A" }

engine-e-oem-no-covariance-start-block = aucun bloc COVARIANCE_START

engine-e-oem-no-covariance-stop = aucun COVARIANCE_STOP

engine-e-oem-bad-covariance-value = valeur de covariance '{ $tok }' incorrecte : { $e }

engine-e-oem-expected-21-covariance-values-found = 21 valeurs de covariance attendues, { $vals } trouvée(s)

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = l'export OMM nécessite des TLE complets (ligne 1 + ligne 2) ; ce bloc n'en a aucun

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

engine-e-optical-atmosphere-scenario-must-be-in = { $n } doit être compris dans [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg doit être compris dans [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave doit être "plane" ou "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction doit être "downlink" ou "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = les entrées de availability_targets_pct doivent être comprises dans (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h doit être au plus 8760 (un an)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries : { $steps } pas dépasse les { $MAX_STEPS } qu'un résultat contient ; augmentez step_s ou raccourcissez duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = classe d'horloge "{ $c }" inconnue

engine-e-optical-atmosphere-scenario-every-site-needs-name = chaque site doit avoir un nom

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = site { $name } : latitude/longitude hors plage

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = site { $name } : altitude_m doit être compris dans [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere : { $wavelength_nm } nm à { $elevation_deg } deg d'élévation, marge { $margin0 } dB avant l'atmosphère ; meilleur site { $scn } { $v5 } % ; réseau à { $order } sites { $last } % indépendant / { $last2 } % avec météo corrélée (MODELLED, à titre consultatif)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = le bloc rinex a été analysé mais ne contenait aucune éphéméride prise en charge

engine-e-orbit-user-site-lat-deg-must = user_site : lat_deg doit être compris dans [-90, 90] et chaque champ fini

engine-e-orbit-no-satellites-to-export = aucun satellite à exporter

engine-e-orbit-time-step-must-be-positive = time.step_s doit être positif pour l'export SP3

engine-e-orbit-time-step-must-be-positive-2 = time.step_s doit être positif pour l'export OEM

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } doit être positif ; reçu { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s doit être fini et non négatif

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate doit être fini et non négatif

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = l'élévation minimale du leurreur doit être comprise dans [0, 90) degrés

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns du contrôle croisé doit être fini et non négatif

engine-orbital-timing-the-in-plane-neighbour-degrees = le voisin dans le même plan, { $v1 } degrés en avant, est hors de l'empreinte d'un seul leurreur ({ $v2 } degrés de large)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = le voisin dans le même plan, { $v1 } degrés en avant, peut se trouver dans l'empreinte du même leurreur ({ $v2 } degrés de large), de sorte que les deux horloges peuvent être entraînées ensemble

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = fichier d'entrée manquant

engine-e-osnma-cli-max-time-error-has-no = --max-time-error n'a aucun effet sans --reference-time

engine-e-osnma-cli-not-number = pas un nombre : { $s }

engine-e-osnma-cli-public-key-must-be-id = la clé publique doit être ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = le type de clé publique doit être p256 ou p521

engine-e-osnma-cli-unknown-format = format { $f } inconnu

engine-e-osnma-cli-is-not-text-use-format = { $label } n'est pas du texte ; utilisez --format ubx pour un flux UBX

engine-e-osnma-cli-vector-csv-needs-start-gst = un CSV de vecteurs nécessite --start-gst ou un nom de fichier daté

# legal: native review
engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    erreur : impossible de lire { $input } : { $e }

# legal: native review
engine-osnma-cli-galileo-osnma-verification =
    Vérification OSNMA de Galileo
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = entrée : { $input } ({ $pages } pages)

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx : { $frames } trames ; { $inav_pages } pages I/NAV décodées, { $pages } placées dans le temps ({ $bad_crc } CRC erronés, { $unstamped } non plaçables, { $time_conflicts } conflits de temps)

engine-osnma-cli-overall-nma-status = global : { $status_word }   statut NMA : { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ALERTE : un message d'alerte OSNMA vérifié a été reçu. Cessez d'utiliser les données OSNMA ; rien n'est signalé comme authentifié.

engine-osnma-cli-freshness-not-enforced-no-reference = fraîcheur : NON appliquée. Aucun temps de référence n'a été donné, les temps de sous-trame sont donc repris de l'entrée et un rejeu de données anciennes serait authentifié.

engine-osnma-cli-freshness-sub-frames-within-of = fraîcheur : les sous-trames à moins de { $max_err } s du temps de référence { $v2 } sont utilisées ; { $set_aside } ont été mises de côté. Un temps de référence est un instant unique.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satellite  statut          authentifié  échec  attente  écartés  dernière authentification

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }époque (sous-trame du tag)      tx   data  adkd  ctr  résultat

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = ligne { $v1 } : 3 champs attendus

engine-e-osnma-input-line-bad-svid = ligne { $v1 } : SVID incorrect

engine-e-osnma-input-line-bad-bit-count = ligne { $v1 } : nombre de bits incorrect

engine-e-osnma-input-line-data-is-not-hex = ligne { $v1 } : les données ne sont pas en hexadécimal

engine-e-osnma-input-line-bit-count-does-not = ligne { $v1 } : le nombre de bits ne correspond pas aux données

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = la tolérance de temps doit être inférieure à une sous-trame ({ $SUBFRAME_S } s), reçu { $t } s

## src/palette.rs

engine-palette-root-color-scheme-light-media =
    :root{ "{" }{ $l }color-scheme:light{ "}" }
    @media (prefers-color-scheme:dark){ "{" }:root:not([data-theme="light"]){ "{" }{ $d }color-scheme:dark{ "}" }{ "}" }
    :root[data-theme="dark"]{ "{" }{ $d }color-scheme:dark{ "}" }{ "\u000A" }

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = la réfraction ITU-R P.834 est définie pour des hauteurs de station de 0 à 3 km ; reçu { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s et step_s doivent être positifs

engine-e-passes-station-lat-deg-must-be = station_lat_deg doit être compris dans [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg doit être compris dans [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours doit être fini et positif

engine-e-passes-step-must-be-finite-and = step_s doit être fini et positif

engine-passes-passes-pass-es-of-km = passes : { $passes } passage(s) d'une orbite de { $altitude_km } km / { $inclination_deg }° au-dessus de ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° en { $duration_hours } h ; { $total_access_s } s d'accès au total (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = enregistrement { $record } trop court : { $line }

engine-e-precise-products-bad-number-in = nombre { $s } incorrect dans { $line }

engine-e-precise-products-bad-field-in = champ { $s } incorrect dans { $line }

engine-e-precise-products-bad-antex-epoch = époque ANTEX { $s } incorrecte

engine-e-precise-products-bad-offset = décalage { $body } incorrect

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = le fournisseur d'éphémérides n'a pas de { $name } géocentrique à JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| erreur 3D RMS { $rms } m (max. { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS post-ajustement { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | { $n_satellites_nav } sat nav | { $epochs_solved }/{ $epochs_total } époques résolues | moyenne { $mean_n_used } sats, PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = Positionnement par point unique — erreur 3D par rapport à la coordonnée relevée (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Positionnement par point unique — RMS des résidus post-ajustement ({ $mean_postfit_rms_m } m en moyenne)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = les accesseurs de tableau de RunOutput nécessitent NumPy (pip install numpy) : { $e }

engine-e-python-is-not-numeric-array-list = { $path } n'est pas un tableau numérique (une liste de nombres, ou de listes de nombres de même longueur)

engine-e-python-is-not-non-empty-list = { $path } n'est pas une liste non vide d'enregistrements

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } octets, svg={ $svg } octets, csv={ $value } octets, summary={ $value2 })

engine-e-python-and-must-be-the-same = i et q doivent avoir la même longueur ({ $i } contre { $q })

engine-e-python-not-acquired-statistic-threshold = { $code } : non acquis (statistique { $statistic } < seuil { $threshold })

engine-python-carrier-pll-bw-hz-code =
    { "[" }carrier]
    pll_bw_hz = { $p }
    { "[" }code]
    bw_hz = { $d }
    { "[" }integration]
    spacing_chips = { $s }
    coherent_periods = { $c }{ "\u000A" }

engine-python-pll-dll-sp-coh = pll{ $p }_dll{ $d }_sp{ $s }_coh{ $c }

engine-python-design-prn-channels-at-most = { $designs } canaux (conception, PRN) ; au plus 256 par balayage

engine-python-not-acquired-statistic-threshold = { $code } : non acquis (statistique { $statistic } < seuil { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] nécessite `label`

engine-e-python-runs-needs-result = runs[{ $i }] nécessite `result`

engine-e-python-must-be-between-and-32 = { $name } doit être compris entre 0 et 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | graine { $seed } | v{ $engine_version } | le quantique l'emporte sur { $value }/{ $foms } FoM | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } d'après { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = baseline_clock_class '{ $s }' inconnue (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = candidate_clock_class '{ $other }' inconnue (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = les taus/valeurs d'ADEV doivent être finis et > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | candidat { $candidate_source } | holdover temporel { $timing_holdover_s }s contre { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inertiel { $inertial_holdover_s }s contre { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | résilience en roue libre { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = le fichier d'horloge RINEX déclare le système de temps { $id }, que ce lecteur ne connaît pas (connus : { $known_clock_time_systems }) ; il est refusé plutôt que de lire ses époques comme du temps GPS

engine-e-realdata-clk-rinex-clock-file-has-satellite = le fichier d'horloge RINEX a le système de satellites { $other } et ne déclare aucun TIME SYSTEM ID ; refus de deviner le système de temps de ses époques

engine-e-realdata-clk-rinex-clock-files-declare-different = les fichiers d'horloge RINEX déclarent des systèmes de temps différents ({ $s } et { $ts }) ; refus de les joindre sur un même axe de temps

engine-e-realdata-clk-no-as-or-ar-records = aucun enregistrement AS ou AR pour { $id }

engine-e-realdata-clk-short-circular-row = ligne Circular T trop courte : { $t }

engine-e-realdata-clk-bad-value-in = valeur { $s } incorrecte dans { $t }

engine-e-realdata-clk-no-section-mjd-header-found = aucun en-tête MJD de la Section 1 trouvé

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = balise fermante non terminée

engine-e-realdata-ion-sdr-unbalanced-closing-tag = balise fermante non équilibrée

engine-e-realdata-ion-sdr-unterminated-tag = balise non terminée

engine-e-realdata-ion-sdr-attribute-value-missing = valeur d'attribut manquante

engine-e-realdata-ion-sdr-element-outside-the-document = élément en dehors du document

engine-e-realdata-ion-sdr-text-outside-the-document = texte en dehors du document

engine-e-realdata-ion-sdr-element-left-open = { $stack } élément(s) laissé(s) ouvert(s)

engine-e-realdata-ion-sdr-expected-one-root-element-found = un seul élément racine attendu, { $n } trouvé(s)

engine-e-realdata-ion-sdr-unknown-frequency-format = format de fréquence { $f } inconnu

engine-e-realdata-ion-sdr-unsupported-encoding = encodage { $other } non pris en charge

engine-e-realdata-ion-sdr-streams-only-single-stream-files = { $streams } flux : seuls les fichiers à flux unique sont lus

engine-e-realdata-ion-sdr-block-of-cycles-with-header = un bloc de { $cycles } cycles avec un en-tête ou un pied de page se répète ; seul un bloc unique couvrant le fichier est lu

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = bloc de { $words_per_chunk } mots de { $word_bytes } octets

engine-e-realdata-ion-sdr-unsupported-sample-format = format d'échantillon { $other } non pris en charge

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = quantification { $quantization } sur { $packed_bits } bits compactés par échantillon

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = une fréquence d'échantillonnage de { $sample_rate_hz } Hz n'est pas un multiple entier du facteur de cadence { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = un bloc ne contient aucun lot entier

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = échantillons { $start }..{ $v1 } demandés, le fichier en contient { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = version CRD { $f } illisible

engine-realdata-llr-crd-crd-format-version-is-not = la version { $v } du format CRD n'est pas prise en charge (seules 1 et 2 partagent l'ordre des champs de l'enregistrement 11 sur lequel ce lecteur s'appuie)

engine-realdata-llr-crd-unreadable-station-id = identifiant de station { $f } illisible

engine-realdata-llr-crd-unreadable-time-scale = échelle de temps { $f } illisible

engine-realdata-llr-crd-crd-epoch-time-scale-is = l'échelle de temps d'époque CRD { $time_scale } n'est pas l'une des trois que la spécification du format dit acceptées par les analystes (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)) ; refus de la lire comme UTC

engine-realdata-llr-crd-unreadable-h4-field = champ h4 { $i } illisible : { $f }

engine-realdata-llr-crd-unreadable-field = champ { $i } illisible : { $f }

engine-realdata-llr-crd-unreadable-epoch-event = événement d'époque { $f } illisible

engine-realdata-llr-crd-non-physical-time-of-flight = temps de vol non physique { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = impossible de lire le répertoire de points normaux { $dir } : { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = aucun fichier de points normaux *.npt dans { $dir } — ce scénario lit de vraies mesures archivées et ne s'exécutera pas sans elles

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = nombre '{ $t }' invalide : { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = le DEM a une dimension nulle

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = codage { $encoding } : un lot LuGRE est en complément à deux

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } octets : plus court que l'en-tête IQS

engine-e-realdata-lugre-not-an-iqs-frame = pas une trame IQS : { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = fréquence d'échantillonnage : métadonnées { $sample_rate_hz } Hz, en-tête { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = quantification : métadonnées { $quantization } bits, en-tête { $quant_bits } bits

engine-realdata-lugre-centre-frequency-metadata-hz-header = fréquence centrale : métadonnées { $center_freq_hz } Hz, en-tête { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = fréquence intermédiaire : métadonnées { $translated_freq_hz } Hz, en-tête { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = nombre d'échantillons : la disposition des métadonnées donne { $layout }, l'en-tête { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = en-tête/pied : métadonnées { $header_bytes }/{ $footer_bytes } octets, format { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = la longueur de fichier { $file_len } n'est pas en-tête + { $value } octets d'échantillons + pied

engine-realdata-lugre-field-missing = champ { $key } manquant

engine-e-realdata-lugre-field-unreadable = champ { $key } illisible

engine-realdata-lugre-raw-line = ligne RAW { $v1 } : { $e }

engine-realdata-lugre-acq-line = ligne ACQ { $v1 } : { $e }

engine-realdata-lugre-nav-line = ligne NAV { $v1 } : { $e }

engine-e-realdata-lugre-clk-row-unreadable = ligne CLK { $v1 } : illisible

engine-e-realdata-lugre-clk-row-columns-expected = ligne CLK { $v1 } : { $v } colonnes, 3 attendues

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = analyse JSON : { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = objet JSON attendu au niveau supérieur

engine-e-realdata-yunnan-missing-recordtime-array = tableau recordTime manquant

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = impossible de lire le fichier EOP { $path } : { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s doit être fini et non négatif, reçu : { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = impossible de lire le fichier EOP de millésime ultérieur { $path } : { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = VIDE, et c'est voulu : une ligne prédit-contre-final nécessite une époque d'émission avec, derrière elle, une fenêtre d'ajustement COMPLÈTE de { $window_days } jours et un final du Bulletin B publié à l'époque cible. L'entrée en vigueur ({ $eop_source }) ne fournit aucune époque remplissant les deux conditions. Raccourcissez `operational_window_days`, ou fournissez une série finals2000A réelle plus longue — aucune ligne n'est fabriquée pour remplir la table.

engine-realtime-frame-eop-measured-over-the-real-series = Mesuré sur la série réelle en vigueur ({ $eop_source }). Chaque ligne est une véritable erreur de prédiction : une prévision pour T+h formée à partir des lignes rapides du Bulletin A à T ou avant, notée par rapport au final du Bulletin B PUBLIÉ ULTÉRIEUREMENT à T+h. La persistance est notée sur le même ensemble d'époques par rapport aux mêmes finals, de sorte que les deux colonnes ne diffèrent que par le prédicteur. `improvement_factor` inférieur à 1 signifie que le prédicteur opérationnel est PIRE que la persistance à cet horizon, et il est rapporté comme tel.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Mesuré sur une véritable paire à deux millésimes : le millésime tel qu'émis ({ $eop_source }) porte de vraies prédictions du Bulletin A au-delà de sa propre date limite de données, et le millésime ultérieur archivé ({ $c }) porte les finals du Bulletin B que ces dates ont fini par recevoir. Trois prévisions sont notées par rapport à ce final : la prédiction archivée du Bulletin A elle-même, l'ajustement de style opérationnel de ce crate sur le millésime tel qu'émis, et la persistance à la date limite.

engine-realtime-frame-eop-empty-and-deliberately-so-later = VIDE, et c'est voulu : un millésime ultérieur a été fourni ({ $c }) mais aucune date n'est portée comme PREDICTION du Bulletin A dans le fichier tel qu'émis ({ $eop_source }) et comme FINAL du Bulletin B dans le fichier ultérieur, à un horizon demandé quelconque. Aucune ligne n'est synthétisée.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = VIDE, et c'est voulu. Noter une prédiction ARCHIVÉE AUTHENTIQUE nécessite deux millésimes du même produit finals2000A ; cette exécution n'en a reçu qu'un ({ $eop_source }). Le dépôt ne fournit aucun millésime antérieur archivé, et on n'en fabrique PAS un en perturbant celui qu'il contient — une archive synthétisée ferait de chaque nombre de cette table une mesure de la perturbation. Fournissez un véritable millésime ultérieur archivé via `eop_finals2000a_later` pour la remplir. D'ici là, les véritables erreurs prédit-contre-final que ce rapport contient figurent dans `table5_operational_vs_persistence`, où la prévision est celle de ce crate et la vérité est le final du Bulletin B publié ultérieurement.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Table 1 : post-traitement { $c } m ({ $c2 } ms UT1) ↔ temps réel { $c3 } m ({ $c4 } ms UT1) | Table 2 : plancher final { $floor } ms → { $far } jours { $far2 } ms | budget total { $total_m } m ({ $total_time_ns } ns) | bras de levier L19 + données réelles L18 (vérifié), cov. OD (modélisé)

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

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Mesuré sur une véritable paire à deux millésimes : l'UT1 PRÉDIT par le Bulletin A du fichier tel qu'émis ({ $eop_source }), comparé au FINAL du Bulletin B qui en a résulté dans le millésime ultérieur archivé ({ $c }), à { $predicted_vs_final } horizon(s).

engine-realtime-frame-eop-empty-and-deliberately-so-an = VIDE, et c'est voulu : un millésime ultérieur archivé a été fourni ({ $c }) mais aucune date n'est portée comme PREDICTION du Bulletin A dans le fichier tel qu'émis ({ $eop_source }) et comme FINAL du Bulletin B dans le fichier ultérieur, à un horizon demandé quelconque, de sorte qu'il n'y a aucun résidu prédit-contre-final à rapporter. Aucune ligne n'est synthétisée.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = VIDE, et c'est voulu : un résidu prédit-contre-final nécessite DEUX millésimes du même produit finals2000A. Cette exécution n'en a reçu qu'un ({ $eop_source }). Ses lignes de prédiction du Bulletin A concernent des dates futures qui n'ont pas encore de final du Bulletin B, le résidu n'existe donc pas à mesurer et aucun n'est inventé ici. Fournissez un millésime ultérieur archivé via `eop_finals2000a_later` pour remplir cette table. D'ici là, la croissance sur plusieurs jours rapportée dans `table2_error_vs_horizon` est celle du prédicteur de PERSISTANCE noté sur les vrais finals — une erreur réellement mesurée, mais d'un prédicteur modélisé, et non le résidu de prédiction du Bulletin A de l'IERS.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = une évaluation de navire nécessite [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = l'extrait fait { $excerpt } octets ; la limite est de { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = l'extrait contient plus de { $MAX_EXCERPT_EPOCHS } époques ; raccourcissez-le

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = l'extrait se termine dans la fenêtre de calibration de { $calibration_s } s ({ $epochs } époques) : rien n'a été noté

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors : { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = aucune époque étiquetée UTC dans le journal UBX

engine-e-receiver-trust-calibration-no-scenario-json-under = aucun scenario.json sous { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field } : Pfa de la partie saine mise de côté <= { $B1_MAX_PFA } (calibrée : { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry : { $name } doit être fini et > 0 (reçu : { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry : reported_vs_derived_rel doit être fini et >= 0 (reçu : { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry : min_used doit être au moins égal à 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry : low_elev_deg doit être dans [0, 90] (reçu : { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry : azimuth_gap_deg doit être dans (0, 360] (reçu : { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry : cap_points doit être dans [0, 100] (reçu : { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry : full_ratio doit être fini et > 1 (reçu : { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry : floor doit être dans (0, 100] (reçu : { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry : floor ({ $f }) est inférieur au degraded_min du score ({ $degraded_min }) : la géométrie seule pourrait atteindre la bande non fiable

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    { $n_used ->
        [one] géométrie { $label } : HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satellite{ $v6 }
        [many] géométrie { $label } : HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } de satellites{ $v6 }
       *[other] géométrie { $label } : HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satellites{ $v6 }
    }


engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why } : la déduction de géométrie est classée comme une incohérence

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why } : signalé, non noté (la géométrie n'est pas mauvaise)

engine-receiver-trust-geometry-not-scored-the-score-deducts = non noté (le score ne déduit qu'au-dessus de HDOP { $hdop_max }, de PDOP { $pdop_max } ou en dessous de { $min_used } satellites)

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] dérivé de { $n } satellite journalisé
        [many] dérivé de { $n } de satellites journalisés
       *[other] dérivé de { $n } satellites journalisés
    }


engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] tel que le récepteur le rapporte, { $n } satellite utilisé
        [many] tel que le récepteur le rapporte, { $n } de satellites utilisés
       *[other] tel que le récepteur le rapporte, { $n } satellites utilisés
    }


engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = le HDOP déclaré { $fmt_dop } diffère, au-delà de la tolérance, du HDOP { $fmt_dop2 } dérivé du ciel déclaré

engine-receiver-trust-geometry-satellites-in-view-but-not = satellites en vue mais non suivis ({ $g } sur { $in_view } à { $low_elev_deg } deg ou plus) : environnement du signal, pas géométrie

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } satellite, moins de { $min_used }
        [many] { $n } de satellites, moins de { $min_used }
       *[other] { $n } satellites, moins de { $min_used }
    }


engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } au-dessus de { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } au-dessus de { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = { $m } satellites derrière la ligne d'horizon déclarée

engine-receiver-trust-geometry-every-satellite-in-one-half = tous les satellites dans une moitié du ciel (écart { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = dégradé par la géométrie : { $parts } ({ $from }) ; pas une incohérence

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = le journal ne contient aucune époque : rien n'y était lisible comme { $name } ({ $skipped_records } enregistrements ignorés car corrompus ou inanalysables) ; vérifiez le réglage du format

engine-receiver-trust-ingest-gps-week-tow = semaine GPS { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = semaine GPS { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (date absente du journal)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live : { $name } doit être fini et >= 0 (reçu : { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live : idle_flush_s doit être supérieur à 0

engine-e-receiver-trust-live-invalid-session = session invalide : { $e }

engine-receiver-trust-live-no-score-could-be-produced = aucun score n'a pu être produit : { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = aucun enregistrement synchro ou pvt de GNSS-SDR n'était lisible ({ $skipped } lignes ignorées) ; voir integrations/gnss-sdr/README.md pour le format de ligne

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = le fichier IMU est vide

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv : aucune colonne `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc : aucune colonne `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = le fichier IMU ne contient aucun échantillon lisible

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis doit valoir 0, 1 ou 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean doit être fini

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] le journal compte { $n } échantillon ; au moins { $MIN_SAMPLES } sont nécessaires pour un ajustement d'Allan
        [many] le journal compte { $n } d'échantillons ; au moins { $MIN_SAMPLES } sont nécessaires pour un ajustement d'Allan
       *[other] le journal compte { $n } échantillons ; au moins { $MIN_SAMPLES } sont nécessaires pour un ajustement d'Allan
    }


engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = le temps du journal n'avance pas

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not = l'intervalle d'échantillonnage n'est pas uniforme ({ $uneven } intervalles sur { $n } diffèrent de plus de 25 %) : rééchantillonnez d'abord le journal

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = le journal est trop court pour former une courbe d'Allan

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = la pente initiale de la courbe { $name } est de { $v }, et non d'environ -0.5 : le bruit blanc ne domine pas (le capteur est-il immobile ?), son coefficient de bruit n'est donc pas fiable

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = la courbe { $name } est trop courte pour vérifier sa pente

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

engine-receiver-trust-machines-novatel-gps-week-tow = semaine GPS { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = aucun journal BESTPOS, RANGE ou RXSTATUS n'était lisible ({ $skipped } enregistrements ignorés)

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = aucune trame RTCM 3 valide n'a été trouvée ({ $skipped } candidates ont échoué au CRC)

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime : { $name } doit être fini et > 0 (reçu : { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime : kin_limit_guard doit être dans (0, 1) (reçu : { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime : kin_sog_frac doit être dans [0, 1] (reçu : { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime : { $name } doit être dans (0, 1) (reçu : { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime : cn0_spread_min_sats doit être au moins égal à 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime : kin_window_s doit être au moins égal à 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = configuration des moniteurs : profil « { $other } » inconnu ; profils connus : { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = configuration des moniteurs : { $name } doit être fini et > 0 (reçu : { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = configuration des moniteurs : jam_ind_threshold doit être fini

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = configuration des moniteurs : mask_deg doit être dans [-90, 90) (reçu : { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = configuration des moniteurs : raim_pfa doit être dans (0, 1) (reçu : { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = configuration des moniteurs : cn0_min_sats doit être au moins égal à 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = configuration des moniteurs : sats_lost doit être au moins égal à 1

engine-receiver-trust-monitors-the-receiver-own-set-against = l'ensemble { $self_report_source } propre au récepteur, confronté aux moniteurs de Kshana ; aucun des deux n'est la vérité terrain, un accord n'est pas une vérification

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = la chronologie du récepteur comporte un temps d'époque non fini

engine-e-receiver-trust-monitors-the-log-is-shorter-than = le journal est plus court que la fenêtre de calibration : { $calibration_epochs } époque(s) avant { $cal_s } s (le journal couvre { $span } s) ; au moins 3 sont nécessaires pour former la base

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform : { $name } doit être dans ({ $lo }, { $hi }] (reçu : { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform : { $name } ne s'applique qu'à kind = "vessel" (kind vaut "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = impossible de lire { $path } : la version WebAssembly n'a pas de système de fichiers ; fournissez le fichier en ligne sous forme de `text` ou `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what } : `base64` n'est pas du base64 standard valide

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what } : indiquez l'un de `path`, `text` ou `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what } : indiquez un seul de `path`, `text` ou `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } doit être un nombre positif, reçu : { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = événement { $label } : onset_s doit être un nombre non négatif

engine-e-receiver-trust-scenario-event-end-must-be-after = événement { $label } : end_s doit être postérieur à onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu : heading0_deg et time_offset_s doivent être finis

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = de confiance sur toute la durée : aucun moniteur n'a déclenché d'alarme sur { $after_cal } époques après la calibration

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = première alarme à { $t } s ; non fiable pendant { $untrusted_epochs } et dégradé pendant { $degraded_epochs } des { $after_cal } époques après la calibration

engine-receiver-trust-scenario-of-stated-events-detected-within = { $events_detected } événements déclarés sur { $events_evaluable } détectés dans un délai de { $detect_tol_s } s

engine-receiver-trust-scenario-of-n0-predictions-within-db = { $predictions_agreeing } prédictions de C/N0 sur { $predictions_evaluable } dans une tolérance de { $cn0_tol_db } dB

engine-receiver-trust-scenario-trust-score-lowest-final = score de confiance minimal { $min }, final { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = scénario { $r } | receiver-trust | journal { $format_name }, { $epochs } époques sur { $duration_s } s | moniteurs { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = ceci est un scénario { $k }, pas un scénario receiver-trust

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score : { $name } doit être fini (reçu : { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score : il faut 0 < degraded_min < nominal_min <= 100 (reçu : { $degraded_min } et { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score : evidence_hold_s doit être fini et >= 0 (reçu : { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score : il faut 0 <= onset_ratio < full_ratio (reçu : { $onset_ratio } et { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score : le poids de { $m } doit être dans [0, 100] (reçu : { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s doit être fini et positif

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg doit être dans (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 doit être fini et positif

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m et rho0_kg_m3 doivent être finis et positifs

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m doit être dans [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = rentrée (Allen–Eggers) : V_e { $v } m/s, γ { $flight_path_angle_deg }° -> pic { $v3 } g à { $v4 } km, { $velocity_at_peak_deceleration } m/s ; l'échauffement culmine à { $velocity_at_peak_heating } m/s ; masse ponctuelle (gravité, courbure, US76) pic { $peak_deceleration_g } g (balistique MODELLED, sans aérothermie)

## src/registry.rs

engine-e-registry-unknown-scenario-id = identifiant de scénario inconnu : { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = la bande TRL ({ $lo },{ $hi }) est mal formée (il faut 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = une affirmation modélisée (par simulation seule) ne peut pas être représentative au-delà du TRL { $MODELLED_TRL_CEILING } (bande hi={ $hi }) ; un TRL plus élevé est une lacune, pas un résultat de simulation

engine-representativeness-representativeness-representative-for-trl = Représentativité [{ $status }] — { $claim } (représentatif pour le TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = déclaré({ $arch }) x qualité moyenne des sources

engine-resilience-score-weakest-rpcf-sub-score-bounded = sous-score RPCF le plus faible = { $min_sub } ; dégradation bornée = { $bounded } (plafonné au niveau 2 si non bornée)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = en-tête d'enregistrement de navigation { $head } non pris en charge : une ligne commençant par '>' est un en-tête d'enregistrement RINEX 4, et non un enregistrement de navigation RINEX 3

engine-e-rinex-bad-prn-in = PRN invalide dans { $head }

engine-e-rinex-rinex-navigation-expected-record-header = navigation RINEX 4 : en-tête d'enregistrement '>' attendu, trouvé : { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = l'enregistrement RINEX 4 { $head } compte { $body } lignes, une éphéméride { $msg } en nécessite 8

engine-e-rinex-rinex-record-is-followed-by = l'enregistrement RINEX 4 { $head } est suivi de { $body }, et non de { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = { $what } invalide : { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = le fichier d'observation RINEX n'a pas de END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = le fichier d'observation RINEX ne contenait aucun enregistrement d'époque

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s doit être fini et > 0 (reçu : { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s doit être fini et > 0 (reçu : { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) ne doit pas dépasser time.duration_s ({ $duration_s })

engine-e-scenario-time-grid-too-large-steps =
    { $n ->
        [one] grille temporelle trop grande : { $n } pas dépasse MAX_TIME_STEPS ({ $MAX_TIME_STEPS }) ; utilisez un pas plus grossier ou une durée plus courte
        [many] grille temporelle trop grande : { $n } de pas dépassent MAX_TIME_STEPS ({ $MAX_TIME_STEPS }) ; utilisez un pas plus grossier ou une durée plus courte
       *[other] grille temporelle trop grande : { $n } pas dépassent MAX_TIME_STEPS ({ $MAX_TIME_STEPS }) ; utilisez un pas plus grossier ou une durée plus courte
    }


## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = la fréquence d'échantillonnage est commensurable avec la cadence du code ({ $samples_per_chip } échantillons/chip, { $offset_from_integer_samples } échantillons d'un nombre entier) : la réplique de code à maintien d'ordre zéro ne peut pas résoudre un changement de phase de code inférieur à { $dead_band_chips } chips, de sorte que le discriminateur Early/Late est un escalier avec une bande morte d'un échantillon au lieu d'un triangle et que la DLL se stabilise au mauvais décalage. Décalez la fréquence d'échantillonnage hors du multiple entier (5 MHz fait { $lit_4_8876 } échantillons/chip ; 25 MHz fait { $lit_24_4379 }) ou suréchantillonnez suffisamment pour que la bande morte soit inférieure à la précision de phase de code dont vous avez besoin.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = code d'erreur SGP4 { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = core:datatype SigMF { $other } non pris en charge : ce lecteur gère les types complexes cf32_le, ci16_le et ci8

engine-e-sigmf-sigmf-core-num-channels-only = core:num_channels SigMF = { $ch } : seuls les enregistrements à un seul canal sont lus

engine-e-sigmf-cannot-serialise-sigmf-metadata = impossible de sérialiser les métadonnées SigMF : { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = espace de noms d'extension SigMF { $ns } invalide

engine-e-sigmf-annotation-extension-maps-for-annotations = { $annotations } tables d'extension d'annotation pour { $annotations2 } annotations

engine-e-sigmf-extension-key-is-not-in = la clé d'extension { $k } n'est pas dans l'espace de noms { $ns }

engine-e-sigmf-extension-key-is-already-present = la clé d'extension { $k } est déjà présente

engine-e-sigmf-global-is-not-an-object = global n'est pas un objet

engine-e-sigmf-annotations-is-not-an-array = annotations n'est pas un tableau

engine-e-sigmf-annotation-is-not-an-object = l'annotation n'est pas un objet

engine-e-sigmf-invalid-sigmf-metadata-json = JSON de métadonnées SigMF invalide : { $e }

engine-e-sigmf-the-sigmf-recording-states-no = l'enregistrement SigMF n'indique aucun core:sample_rate positif

engine-e-sigmf-sigmf-capture-starts-at-sample = la capture SigMF commence à l'échantillon { $start }, au-delà des { $data } échantillons des données

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline : { $what } doit être dans [0, 90) degrés, reçu : { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline : { $what } doit être un nombre fini, reçu : { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline : un canyon nécessite width_m

engine-e-skyline-skyline-width-must-be-positive = skyline : width_m doit être positif, reçu : { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline : les hauteurs du canyon et antenna_m doivent être non négatives

engine-e-skyline-skyline-length-must-be-positive = skyline : length_m doit être positif, reçu : { $l }

engine-e-skyline-skyline-table-is-empty = skyline : la table est vide

engine-e-skyline-skyline-table-has-rows-over = skyline : la table compte { $rows } lignes, au-delà du plafond de { $MAX_TABLE_ROWS } lignes

engine-e-skyline-skyline-table-azimuth-is-outside = skyline : l'azimut de table { $az } est hors de [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline : les azimuts de la table doivent être strictement croissants ({ $az } suit { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline : plus de { $MAX_SECTORS } secteurs

engine-e-skyline-skyline-the-sector-az-from = skyline : le secteur az_from = { $az_from } à az_to = { $az_to } est vide (un cercle complet relève d'une table ou du masque)

engine-e-skyline-skyline-more-than-terrain-points = skyline : plus de { $MAX_TABLE_ROWS } points de terrain

engine-e-skyline-skyline-terrain-distance-must-be = skyline : terrain distance_m doit être positif, reçu : { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+overrides

engine-skyline-with-fields-overridden-or-added = { $provenance } ; avec des champs remplacés ou ajoutés par { $user }

engine-skyline-stated-input = Entrée déclarée : { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = préréglage skyline « { $name } » inconnu ; préréglages connus : { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = une fiche technique nécessite au moins deux points d'écart-type d'Allan

engine-e-slot-timing-datasheet-point-must-have-positive = le point de fiche technique ({ $t }, { $s }) doit avoir un temps de moyennage positif et un écart-type d'Allan positif

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s doit être un nombre positif de secondes

engine-e-slot-timing-phase-record-needs-at-least = un enregistrement de phase nécessite au moins 32 échantillons pour ajuster un modèle de bruit ; reçu { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = l'enregistrement de phase contient un échantillon non fini

engine-e-slot-timing-the-phase-record-yields-fewer = l'enregistrement de phase donne moins de trois points d'écart-type d'Allan

engine-e-slot-timing-must-be-finite-and-non = { $name } doit être fini et non négatif ; reçu { $v }

engine-e-slot-timing-the-slot-guard-must-be = la garde du créneau doit être un temps positif

engine-e-slot-timing-sigma-must-be-positive = k_sigma doit être positif

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset doit être fini

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k doit être fini

engine-e-slot-timing-give-exactly-one-of-oscillator = indiquez exactement l'un de oscillator.class, oscillator.preset, oscillator.datasheet ou oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = oscillator.class '{ $id }' inconnue (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = oscillator.preset '{ $id }' inconnu (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = valeur par défaut de la classe { $c } : sigma_y(1 s) tiré de { $c2 } ; plancher de bruit rouge synthétisé deux et quatre décades en dessous (une hypothèse, non une mesure)

engine-slot-timing-fitted-to-the-allan-deviation = ajusté aux maxima de l'écart-type d'Allan de { $document }, mis à l'échelle pour se situer au niveau de chaque point ou au-dessus

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] ajusté à l'écart-type d'Allan chevauchant d'un enregistrement de { $n_samples } échantillon à { $tau0_s } s, dans la base de modulation de fréquence de l'IEEE Std 1139
        [many] ajusté à l'écart-type d'Allan chevauchant d'un enregistrement de { $n_samples } d'échantillons à { $tau0_s } s, dans la base de modulation de fréquence de l'IEEE Std 1139
       *[other] ajusté à l'écart-type d'Allan chevauchant d'un enregistrement de { $n_samples } échantillons à { $tau0_s } s, dans la base de modulation de fréquence de l'IEEE Std 1139
    }


engine-slot-timing-slot-timing-source-guard-ns = slot-timing ({ $n } source) : garde { $c } ns à k={ $k_sigma } dépassée { $fmt_s } après un recalage ({ $fmt_s2 } restant) ; recalage au moins toutes les { $fmt_s3 } ({ $fixes_per_day } par jour) ; terme dominant : { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = l'époque '{ $s }' doit être au format YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = époque '{ $s }' : { $what } '{ $v }' invalide

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb doit être fini

engine-e-solar-system-table-must-be-auto-table1 = table doit être auto, table1 ou table2 ; reçu '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = aucune éphéméride pour la liaison { $name } vers { $name2 } à JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = l'époque JD { $jd } TDB est hors de 3000 av. J.-C. à 3000 ap. J.-C., la plage des tables de Standish

engine-e-solar-system-track-points-must-be-to = track_points doit être compris entre 8 et 2000 ; reçu { $n_track }

engine-e-solar-system-unknown-observer-body = corps observateur '{ $observer_name }' inconnu

engine-e-solar-system-bodies-must-name-at-least = bodies doit nommer au moins un corps

engine-e-solar-system-unknown-body = corps '{ $n }' inconnu

engine-e-solar-system-no-position-for-at-jd = aucune position pour { $name } à JD { $jd } TDB (Pluton n'est couvert que de 1800 ap. J.-C. à 2050 ap. J.-C.)

engine-e-solar-system-no-standish-elements-for = aucun élément de Standish pour { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), état héliocentrique lu par le lecteur propre au moteur

engine-e-solar-system-unknown-link-body = corps de liaison '{ $from }' inconnu

engine-e-solar-system-unknown-link-body-2 = corps de liaison '{ $to }' inconnu

engine-e-solar-system-link-needs-two-different-bodies = une liaison nécessite deux corps différents ; reçu { $name }

engine-solar-system-solar-system-at-jd-tdb =
    Système solaire à { $input } (JD { $jd_tdb } TDB), { $n_bodies } corps, observateur { $observer }
    { "  " }{ $standish_table }{ "\u000A" }

engine-solar-system-light-time = temps de lumière { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lon { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }liaison { $from } -> { $to } : aller simple { $one_way_light_time_s } s, aller-retour { $two_way_light_time_s } s, Shapiro { $l } us, Soleil { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = époque { $input } · { $standish_table } · positions issues des éléments de Standish

## src/sp3.rs

engine-sp3-cp-orbit-igs14-hlm-kshana = #cP{ $year } { $month } { $day } { $hour } { $minute } { $second }  { $num_epochs } ORBIT IGS14 HLM KSHANA{ "\u000A" }

engine-e-sp3-epoch-needs-time-fields-got = l'époque nécessite 6 champs de temps, reçu : { $tokens }

engine-e-sp3-bad-second = seconde invalide : { $tokens }

engine-e-sp3-record-needs-values-missing-column = l'enregistrement nécessite 4 valeurs, colonne { $v1 } manquante

engine-e-sp3-bad-number = nombre invalide : { $field }

engine-e-sp3-empty-sp3-input = entrée SP3 vide

engine-e-sp3-first-line-is-not-an = la première ligne n'est pas un en-tête SP3 : { $first }

engine-e-sp3-unsupported-sp3-version-in = version SP3 non prise en charge dans { $first }

engine-e-sp3-missing-epoch-count-on-header = nombre d'époques manquant sur la ligne d'en-tête 1

engine-e-sp3-record-has-no-satellite-id = l'enregistrement n'a pas d'identifiant de satellite : { $line }

engine-e-sp3-position-record-before-any-epoch = enregistrement de position avant tout en-tête d'époque

engine-e-sp3-sp3-file-contained-no-epoch = le fichier SP3 ne contenait aucun enregistrement d'époque

engine-e-sp3-bad-accuracy-exponent-in = exposant de précision { $f } invalide dans { $line }

engine-e-sp3-bad-header-accuracy = précision d'en-tête { $t } invalide

engine-e-sp3-short-line = ligne %f trop courte { $line }

engine-e-sp3-bad-base-in = base %f invalide dans { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = la version dépasse 3 bits

engine-e-space-packet-apid-exceeds-11-bits-2047 = l'APID dépasse 11 bits (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count dépasse 14 bits (0..=16383)

engine-e-space-packet-data-field-must-be-at = le champ de données doit faire au moins un octet

engine-e-space-packet-data-field-exceeds-65536-octets = le champ de données dépasse 65536 octets

engine-e-space-packet-packet-shorter-than-the-octet = paquet plus court que l'en-tête de 6 octets : { $bytes } octets

engine-e-space-packet-declared-data-length-header-octets = longueur de données déclarée { $data_len } (+6 d'en-tête) = { $total } octets, mais le tampon en compte { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = octets grossiers CUC { $coarse_octets } hors de 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = octets fins CUC { $fine_octets } hors de 0..=3 (le P-field étendu n'est pas pris en charge)

engine-e-space-packet-cuc-field-extended-field-not = P-field CUC { $p } : P-field étendu non pris en charge

engine-e-space-packet-field-time-code-id-is = P-field { $p } : l'identifiant de code temporel { $id } n'est pas CUC

engine-e-space-packet-field-is-not-cds-field = le P-field { $p } n'est pas un P-field CDS

engine-e-space-packet-cds-field-reserved-sub-ms = P-field CDS { $p } : code sub-ms réservé 11

engine-e-space-packet-cuc-coarse-does-not-fit = le CUC grossier { $coarse } ne tient pas sur { $c } octets

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] le CUC fin { $fine } ne tient pas sur { $n } octet
        [many] le CUC fin { $fine } ne tient pas sur { $n } d'octets
       *[other] le CUC fin { $fine } ne tient pas sur { $n } octets
    }


engine-e-space-packet-cds-days-do-not-fit = les jours CDS { $days } ne tiennent pas sur { $f } octets

engine-e-space-packet-cds-ms-of-day-above = ms du jour CDS { $ms_of_day } au-dessus de 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = sous-milliseconde CDS { $submillis } au-dessus de { $max_sub }

engine-e-space-packet-time-code-format-and-value = le format et la valeur du code temporel relèvent de codes différents

engine-e-space-packet-time-code-no-field-octet = code temporel : aucun octet de P-field

engine-e-space-packet-time-code-needs-octets-present = le code temporel nécessite { $end } octets, { $bytes } présents

engine-e-space-packet-time-code-format-differs-from = le format du code temporel diffère du P-field implicite

engine-e-space-packet-the-format-has-time-code = le format comporte un champ de code temporel ; aucun fourni

engine-e-space-packet-the-format-has-no-time = le format n'a pas de champ de code temporel

engine-e-space-packet-ancillary-data-is-octets-the = les données auxiliaires font { $ancillary } octets ; le format en indique { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = un en-tête secondaire doit contenir au moins un octet

engine-e-space-packet-secondary-header-needs-octets-present = l'en-tête secondaire nécessite { $end } octets, { $bytes } présents

engine-e-space-packet-the-format-has-secondary-header = le format comporte un en-tête secondaire ; aucun fourni

engine-e-space-packet-the-format-has-no-secondary = le format n'a pas d'en-tête secondaire

engine-e-space-packet-secondary-header-flag-disagrees-with = l'indicateur d'en-tête secondaire { $v1 } ne concorde pas avec le format

engine-e-space-packet-data-field-shorter-than-the = champ de données plus court que le PEC

engine-e-space-packet-pec-does-not-match-the = le PEC { $v1 } ne correspond pas au CRC { $crc16_ccitt_false } du paquet

engine-e-space-packet-nothing-to-segment-empty-user = rien à segmenter : données utilisateur vides

engine-e-space-packet-max-user-octets-must-be = max_user_octets doit être au moins égal à 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count dépasse 14 bits (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid } alors que { $a } était attendu

engine-space-packet-sequence-count-repeated = compteur de séquence { $sequence_count } répété

engine-space-packet-sequence-count-gap-after-packet = lacune du compteur de séquence : { $sequence_count } après { $last } ({ $v2 } paquet(s) manquant(s))

engine-space-packet-sequence-count-out-of-order = compteur de séquence dans le désordre : { $sequence_count } après { $last }

engine-space-packet-packet-with-no-unit-open = paquet { $f } sans unité ouverte

engine-space-packet-packet-while-unit-is-open = paquet { $f } alors qu'une unité est ouverte

engine-e-space-packet-packet = paquet { $i } : { $e }

engine-e-space-packet-the-sequence-ends-with-unit = la séquence se termine avec une unité encore ouverte (pas de dernier paquet)

engine-e-space-packet-apid-must-be-in-2047 = apid doit être dans 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count doit être >= 1

engine-e-space-packet-data-len-must-be-in = data_len doit être dans 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = erreur interne : discordance de l'aller-retour encodage/décodage

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet : { $packet_count } paquet { $v2 } CCSDS-133.0 encadré APID { $apid }, { $total_bytes } octets au total, aller-retour exact ({ $round_trip_ok })
        [many] space-packet : { $packet_count } de paquets { $v2 } CCSDS-133.0 encadrés APID { $apid }, { $total_bytes } octets au total, aller-retour exact ({ $round_trip_ok })
       *[other] space-packet : { $packet_count } paquets { $v2 } CCSDS-133.0 encadrés APID { $apid }, { $total_bytes } octets au total, aller-retour exact ({ $round_trip_ok })
    }


## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 doit être fini et positif

engine-e-space-weather-f107a-must-be-finite-and = f107a doit être fini et positif

engine-e-space-weather-kp-must-be-in = kp doit être dans [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km ne doit pas être vide

engine-e-space-weather-altitude-km-must-be-finite = l'altitude { $h } km doit être finie et positive

engine-space-weather-space-weather-f10-f10-7a = space-weather : F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K ; densité x{ $density_activity_factor } à { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name } : un brouilleur { $what } nécessite une bandwidth_mhz positive

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name } : un brouilleur chirp nécessite une sweep_period_us positive

engine-e-spectrum-matched-to-names-unknown-band = { $name } : matched_to nomme une bande inconnue { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name } : indiquez soit received_power_dbw, soit eirp_dbw avec une range_m positive (pas les deux)

engine-e-spectrum-off-must-be-later-than = { $name } : off_s doit être postérieur à on_s

engine-e-spectrum-welch-the-sample-rate-must = welch : la fréquence d'échantillonnage doit être positive

engine-e-spectrum-welch-nfft-must-be-power = welch : nfft = { $nfft } doit être une puissance de deux, au moins 8

engine-e-spectrum-welch-samples-is-fewer-than = welch : { $x } échantillons, moins d'un segment de { $nfft } points

engine-e-spectrum-iq-must-be-power-of = iq : n = { $n } doit être une puissance de deux, au moins 16

engine-e-spectrum-cannot-read-recording-meta-path = impossible de lire le meta_path d'enregistrement { $meta_path } : { $e }

engine-spectrum-sigmf-data = { $stem }.sigmf-data

engine-spectrum-sigmf-data-2 = { $meta_path }.sigmf-data

engine-e-spectrum-cannot-read-recording-data = impossible de lire les données d'enregistrement { $data_path } : { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name } : rx_bandwidth_mhz doit être positif

engine-e-spectrum-modulation-is-not-selectable-only = { $n } : la modulation { $m } n'est pas sélectionnable (seul galileo-e1 accepte "mboc" ou "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name } : le signal { $sig } n'est pas dans la bibliothèque de signaux prédéfinis ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name } : un signal prédéfini porte sa propre modulation ; supprimez `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name } : le signal { $sig } ne publie aucune puissance reçue ; indiquez signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name } : une bande personnalisée nécessite `modulation`, par ex. "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name } : une bande personnalisée nécessite signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name } : indiquez soit `signal`, soit `centre_mhz`, pas les deux

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name } : indiquez rx_bandwidth_mhz (aucun lobe principal n'a pu être localisé)

engine-e-spectrum-duration-must-be-at-least = duration_s doit valoir au moins un step_s

engine-e-spectrum-time-rows-is-more-than = { $rows } lignes de temps, c'est plus que les 5000 admises

engine-e-spectrum-at-most-extra-panels = au plus 8 panneaux supplémentaires

engine-e-spectrum-panel-need-max-mhz-min = panneau { $name } : f_max_mhz > f_min_mhz et 2 ≤ n_freq ≤ 4096 sont nécessaires

engine-e-spectrum-grid-need-max-mhz-min = grille : f_max_mhz > f_min_mhz et 2 ≤ n_freq ≤ 4096 sont nécessaires

engine-spectrum-scenario-spectrum-bands-jammers-noise = spectre du scénario | { $bands } bandes | { $jammers } brouilleurs | plancher de bruit { $n0_db } dBW/Hz | pire bande { $name } C/N0 min. { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = spectre du scénario | aucune bande | plancher de bruit { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples doit être compris entre 10 et 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype : utilisez cf32_le ou ci16_le

engine-spectrum-frequency-across-time-down-colour = fréquence en abscisse, temps en ordonnée vers le bas, couleur = densité spectrale de puissance (dBW/Hz) ; plancher de bruit { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = chaque panneau a sa propre plage de fréquences, une seule chronologie vers le bas, une seule échelle de couleurs (dBW/Hz) ; plancher de bruit { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = la trame { $other } n'a pas de code NAIF pris en charge

engine-e-spk-writer-segment-name-longer-than-40 = nom de segment de plus de 40 caractères : { $name }

engine-e-spk-writer-segment-name-has-non-printing = le nom de segment contient des caractères non imprimables : { $name }

engine-e-spk-writer-bad-target-for-centre = cible { $target } incorrecte pour le centre { $centre }

engine-e-spk-writer-degree-outside-27 = degré { $degree } hors de 1..=27

engine-e-spk-writer-type-13-degree-is-not = le degré { $degree } du type 13 n'est pas impair

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] { $states } états pour { $n } époque
        [many] { $states } états pour { $n } d'époques
       *[other] { $states } états pour { $n } époques
    }


engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } état ; le degré { $degree } en nécessite { $value }
        [many] { $n } d'états ; le degré { $degree } en nécessite { $value }
       *[other] { $n } états ; le degré { $degree } en nécessite { $value }
    }


engine-e-spk-writer-descriptor-start-is-not-before = le début du descripteur n'est pas antérieur à sa fin

engine-e-spk-writer-epochs-are-not-strictly-increasing = les époques ne sont pas strictement croissantes

engine-e-spk-writer-the-epochs-do-not-cover = les époques ne couvrent pas l'intervalle du descripteur

engine-e-spk-writer-type-or-13-segment-carries = un segment de type 9 ou 13 porte des états, pas des enregistrements

engine-e-spk-writer-type-segment-needs-at-least = un segment de type 3 nécessite au moins un enregistrement

engine-e-spk-writer-type-degree-outside-27 = degré { $degree } du type 3 hors de 0..=27

engine-e-spk-writer-type-interval-length-is-not = la longueur d'intervalle { $intlen } du type 3 n'est pas positive

engine-e-spk-writer-type-record-has-coefficients-expected = l'enregistrement { $i } du type 3 a { $value } coefficients, { $ncof } attendus

engine-e-spk-writer-descriptor-start-is-after-its = le début du descripteur est postérieur à sa fin

engine-e-spk-writer-descriptor-starts-before-the-first = le descripteur commence avant le premier enregistrement

engine-e-spk-writer-descriptor-ends-after-the-last = le descripteur finit après le dernier enregistrement

engine-e-spk-writer-type-segment-carries-records-not = un segment de type 3 porte des enregistrements, pas des époques ni des états

engine-e-spk-writer-type-21-segment-needs-at = un segment de type 21 nécessite au moins une ligne de différences

engine-e-spk-writer-difference-line-size-is-not = la taille de ligne de différences { $dlsize } n'est pas 4 MAXDIM + 11 avec MAXDIM dans 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = lignes de différences de tailles différentes

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] { $epochs } époques pour { $n } ligne de différences
        [many] { $epochs } époques pour { $n } de lignes de différences
       *[other] { $epochs } époques pour { $n } lignes de différences
    }


engine-e-spk-writer-difference-line-epochs-are-not = les époques des lignes de différences ne sont pas strictement croissantes

engine-e-spk-writer-the-last-difference-line-ends = la dernière ligne de différences se termine avant le descripteur

engine-e-spk-writer-zero-step-size-in-difference = pas nul { $j } dans la ligne de différences { $i }

engine-e-spk-writer-type-21-segment-carries-difference = un segment de type 21 porte des lignes de différences, pas des états

engine-e-spk-writer-an-spk-needs-at-least = un SPK nécessite au moins un segment

engine-e-spk-writer-segment = segment { $i } : { $e }

engine-e-spk-writer-comment-line-has-non-printing = la ligne de commentaire contient des caractères non imprimables : { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = les commentaires nécessitent { $nchars } caractères ; { $v1 } sont réservés (augmentez ncomch)

engine-e-spk-writer-difference-line-orders-out-of = ordres de la ligne de différences { $kqmax1 } { $kq } hors plage

engine-e-spk-writer-zero-step-size-at-index = pas nul à l'indice { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } hors du segment [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = segment de type 3 { $name } trop court

engine-e-spk-writer-type-segment-words-for-rsize = segment de type 3 { $name } : { $nw } mots pour N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = segment de type 21 { $name } trop court

engine-e-spk-writer-type-21-segment-words-for = segment de type 21 { $name } : { $nw } mots pour N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segment { $name } trop court

engine-e-spk-writer-segment-words-for = segment { $name } : { $nw } mots pour N = { $n }

engine-e-spk-writer-segment-is-in-frame = le segment { $name } est dans la trame { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = la chaîne de centres SPK ne se termine pas

engine-e-spk-writer-no-spk-chain-connects-and = aucune chaîne SPK ne relie { $target } et { $observer } à ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = l'époque { $s } n'est pas au format YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = système de temps { $other } non pris en charge (UTC ou TDB)

engine-e-spk-writer-centre-has-no-supported-naif = le centre { $other } n'a pas d'identifiant NAIF pris en charge

engine-e-spk-writer-oem-segment-has-no-data = le segment OEM { $name } n'a aucune ligne de données

engine-e-spk-writer-oem-segment-no = segment OEM { $idx } : aucun { $k }

engine-e-spk-writer-no-export-settings-for-oem = aucun réglage d'export pour le segment OEM { $idx }

engine-e-spk-writer-oem-data-line-has-fields = la ligne de données OEM a { $f } champs : { $line }

engine-e-spk-writer-oem-value = valeur OEM { $f } : { $e }

engine-e-spk-writer-oem-segments-for-export-settings = { $out } segments OEM pour { $exports } réglages d'export

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = LEURRAGE DÉTECTÉ (fusionné) — couches : { $fired }

engine-spoof-detect-single-layer-indication-below-the = indication d'une seule couche ({ $fired }) sous le seuil fusionné — corroboration nécessaire

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg doit être positif, reçu { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = panneau { $i } : la surface doit être >= 0

engine-e-srp-boxwing-panel-outside = panneau { $i } : { $name } = { $c } hors de [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = panneau { $i } : absorption + spéculaire + diffuse = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = panneau { $i } : normale/axe nul

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = la matrice normale ECOM2 est singulière ou mal conditionnée

## src/ssv/check.rs

engine-ssv-check-mod1-min = { $key } MOD1 min

engine-ssv-check-mod4-min = { $key } MOD4 min

engine-ssv-check-mrtp-dbw = MRTP { $name } dBW

engine-e-ssv-check-heo-preset = préréglage heo

engine-e-ssv-check-lunar-preset = préréglage lunar

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = une formation nécessite au moins un satellite adjoint

engine-e-ssv-formation-duration-min-and-step-must = duration_min et step_s doivent être positifs

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = aucun signal pour les constellations et bandes choisies

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = antenne `{ $other }` inconnue

engine-e-ssv-scenario-pattern-csv-is-empty = le CSV de diagramme est vide

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` n'est pas un nombre dans le CSV de diagramme

engine-e-ssv-scenario-pattern-csv-row-has-columns = la ligne `{ $l }` du CSV de diagramme a { $f } colonnes, { $azimuths } attendues

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" nécessite exactement un seul de pattern_csv et pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` n'est pas booklet, parametric ou table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = récepteur : indiquez cn0_min_dbhz ou weak_signal, pas les deux

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = la boucle de porteuse ne peut pas suivre le taux Doppler indiqué, quel que soit le C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` n'est pas acquisition, tracking ou both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz doit être fini

engine-ssv-scenario-at-least-pct = { $root }.at_least_1_pct

engine-ssv-scenario-at-least-pct-2 = { $root }.at_least_4_pct

engine-ssv-scenario-max-outage-min = { $root }.max_outage_1_min

engine-ssv-scenario-max-outage-min-2 = { $root }.max_outage_4_min

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation : indiquez exactement un seul de preset et orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` n'est pas leo, meo, geo, heo ou lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation : indiquez exactement un seul de duration_min et duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } doit être positif

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg nécessite de 1 à 8 décalages finis

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd ne doit pas être négatif

engine-e-ssv-scenario-give-exactly-one-of-shell = indiquez exactement un seul de [shell], [trajectory] et [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] nécessite une table [navigation] pour le satellite chef

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include et constellations.bands ne doivent pas être vides

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km doit être supérieur à 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels supérieur à 5 n'est pas pris en charge

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna doit être hemisphere ou omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = le balayage de shell ne prend en charge que le diagramme d'émission booklet (un diagramme façonné nécessite le balayage de trajectoire)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] s'applique à une [trajectory], pas à un [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory : indiquez exactement un seul de preset et orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` n'est pas leo, meo, geo, heo ou lunar-transfer

engine-e-ssv-scenario-unknown-preset = préréglage inconnu

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv shell { $altitude_km } km : { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv navigation : RMS de position { $p } au total, { $p2 } à l'intérieur des orbites GNSS, { $p3 } au-dessus ; plus longue lacune { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = adjoint à { $offset_deg } deg ({ $baseline_km } km) : RMS relatif { $rel_rms_filter_m } m filtré contre { $rel_rms_from_absolute_m } m à partir de positions absolues

engine-ssv-scenario-combined-max-outage-min = { $band } combiné 1+ { $at_least_1_pct } % 4+ { $at_least_4_pct } % (interruption max. { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv trajectory { $perigee_alt_km } à { $apogee_alt_km } km d'altitude : { $parts }

engine-ssv-scenario-signals-best-cn0-dbhz = ,{ $band }_signals,{ $band }_best_cn0_dbhz

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min et step_min doivent être positifs

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } doit être un nombre positif, reçu { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = aucun paquet de normes nommé `{ $id }` ; les paquets sont : { $ids }

engine-e-standards-pack-pack-manifest = manifeste du paquet : { $e }

engine-e-standards-pack-test-duplicate-id = test { $id } : identifiant en double

engine-e-standards-pack-test-scenario-is-not-in = test { $id } : le scénario `{ $s }` n'est pas dans le paquet

engine-e-standards-pack-test-scored-test-needs-bar = test { $id } : un test noté nécessite un seuil

engine-e-standards-pack-test-test-that-needs-input = test { $id } : un test qui nécessite une entrée n'a aucun seuil

engine-e-standards-pack-test-give-either-scenario-or = test { $id } : indiquez soit `scenario`, soit `needs_input`, pas les deux ni aucun

engine-e-standards-pack-test-supports-unknown-row = test { $id } : supports référence une ligne inconnue `{ $r }`

engine-e-standards-pack-test-unknown-op = test { $id } : op `{ $op }` inconnue

engine-e-standards-pack-test-bar-on-needs-exactly = test { $id } : le seuil sur { $pointer } nécessite exactement un seul de `value` et `against`

engine-e-standards-pack-row-duplicate-id = ligne { $id } : identifiant en double

engine-e-standards-pack-row-asks-must-be-short = ligne { $id } : `asks` doit être une courte paraphrase

engine-e-standards-pack-row-no-test-supports-it = ligne { $id } : aucun test n'apporte d'éléments de preuve en faveur de cette ligne

engine-standards-pack-not-scored-needs-input = non noté : nécessite une entrée ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = l'étude n'a aucun scénario à exécuter

engine-e-study-cannot-read-scenario = impossible de lire le scénario { $path } : { $e }

engine-e-study-scenario-failed = échec du scénario { $path } : { $e }

engine-e-study-scenario-produced-unparseable-json = le scénario { $path } a produit du JSON inanalysable : { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = manifeste de suite invalide : { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = source `{ $o }` inconnue : utilisez `adsb` ou `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } fait { $len } octets, au-delà de la limite de { $limit } octets

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` n'est pas une heure UTC ISO-8601

engine-e-surface-invalid-receiver-trust-session = session receiver-trust invalide : { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` n'est pas une heure UTC ISO-8601

engine-e-surface-dataset-custom-needs-licence-licence = le jeu de données `custom` nécessite licence, licence_url et attribution

engine-e-surface-at-least-one-map-is = au moins une carte est requise

engine-e-surface-epoch = époque : { $e }

engine-e-surface-not-utf = { $suffix } : pas de l'UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = type de scénario `{ $k }` inconnu ; la liste des types nomme chaque type

engine-surface-is-not-bundled-it = `{ $name }` n'est pas intégré : il { $why }

engine-surface-no-bundled-scenario-named-the = aucun scénario intégré nommé `{ $name }` ; la liste d'exemples nomme les { $v1 } qui le sont

engine-e-surface-invalid-toml = TOML invalide : { $e }

engine-e-surface-unknown-export-format-expected-one = format d'export `{ $format }` inconnu ; l'un de czml, kml, geojson, stk ou sigmf est attendu

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps donne { $opts } images et au plus { $MAX_ANIMATION_FRAMES } sont renvoyées ; réduisez fps ou duration_s, ou écrivez une séquence plus longue avec la ligne de commande

engine-e-surface-scenario-run-failed = échec de l'exécution du scénario : { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log désigne un fichier `path` ; fournissez le journal en `text` ou `base64` (cette interface ne lit aucun fichier)

engine-e-surface-max-sp-errors-must-be = max_sp_errors doit être au plus 20

engine-e-surface-frames-must-be-to = frames doit être compris entre 1 et { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 doit être compris entre 0 et 99

engine-e-surface-runs-given-at-most-per = { $runs } exécutions fournies ; au plus { $MAX_COMPLIANCE_RUNS } par rapport

engine-e-surface-the-runs-total-bytes-the = les exécutions totalisent { $total } octets ; la limite pour un rapport est de { $max_bytes }

engine-e-surface-result-files-given-at-most = { $results } fichiers de résultat fournis, au plus 256

engine-e-surface-result-is-not-json = le résultat { $v1 } n'est pas du JSON : { $e }

engine-e-surface-unknown-format-use-prometheus-cef = format `{ $o }` inconnu : utilisez `prometheus`, `cef`, `leef`, `otlp` ou `mqtt`

engine-e-surface-unknown-imu-format-use-csv = format IMU `{ $o }` inconnu : utilisez `csv` ou `euroc`

engine-e-surface-unknown-axis-use-or = axe `{ $o }` inconnu : utilisez `x`, `y` ou `z`

engine-e-surface-id-must-be-to-64 = id doit comporter de 1 à 64 caractères ASCII imprimables sans espaces

engine-surface-fitted-from-stationary-imu-log = ajusté à partir d'un journal IMU stationnaire, sha256 { $sha }, axe { $axis }, estimateur d'Allan

engine-e-surface-unknown-input-kind-use-result = input_kind `{ $o }` inconnu : utilisez `result` ou `jsonl`

engine-e-surface-the-input-holds-no-trust = l'entrée ne contient aucune époque de confiance

engine-e-surface-the-reply-is-over-the = la réponse dépasse la limite de { $max_bytes } octets ; envoyez moins d'époques ou laissez `syslog_all` désactivé

engine-e-surface-otlp-needs-build-with-the = otlp nécessite une compilation avec la fonctionnalité `otlp`

engine-e-surface-the-pack-and-token-total = le paquet et le jeton totalisent { $total } octets ; la limite est de { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = le jeton d'horodatage est vide

engine-e-surface-must-be-64-lower-case = { $what } doit comporter 64 chiffres hexadécimaux en minuscules

engine-e-surface-must-be-32-bytes = { $what } doit faire 32 octets

engine-surface-verified-against-the-public-key = VÉRIFIÉ par rapport à la clé publique que vous avez fournie (empreinte du signataire { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, MAIS LE SIGNATAIRE N'EST PAS ÉPINGLÉ : les condensats et la signature sont cohérents avec la clé { $fp }, que le paquet nomme lui-même. Fournissez la clé publique du signataire, obtenue auprès de lui par une autre voie, pour établir qui l'a signé.

engine-e-surface-files-must-be-json-object = files doit être un objet JSON de nom vers contenu

engine-e-surface-pack-has-at-most-64 = un paquet a au plus 64 fichiers

engine-e-surface-file-name-must-be-plain = le nom de fichier `{ $k }` doit être un nom simple

engine-e-surface-base64-is-not-valid-standard = { $k } : `base64` n'est pas du base64 standard valide

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = paramètre de balayage inconnu : { $other }

engine-e-sweep-unknown-sweep-metric = métrique de balayage inconnue : { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep nécessite au moins un axe

engine-e-sweep-sweep-key-is-malformed = la clé de balayage `{ $key }` est mal formée

engine-e-sweep-sweep-key-follows-an-array = clé de balayage `{ $key }` : `{ $part }` suit un tableau, il doit donc être un indice

engine-e-sweep-unreachable = inatteignable

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] clé de balayage `{ $key }` : l'indice { $i } dépasse l'unique entrée ({ $n }) du tableau
        [many] clé de balayage `{ $key }` : l'indice { $i } dépasse les { $n } d'entrées du tableau
       *[other] clé de balayage `{ $key }` : l'indice { $i } dépasse les { $n } entrées du tableau
    }


engine-e-sweep-sweep-key-parent-is-not = clé de balayage `{ $key }` : le parent de `{ $part }` n'est pas une table

engine-e-sweep-sweep-key-no-field = clé de balayage `{ $key }` : aucun champ `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = clé de balayage `{ $key }` : le parent de `{ $last }` n'est pas une table

engine-e-sweep-sweep-key-no-field-2 = clé de balayage `{ $key }` : aucun champ `{ $last }`

engine-e-sweep-metric-no-field-in-result = métrique `{ $path }` : aucun champ `{ $part }` dans le résultat

engine-e-sweep-metric-value-is-not-number = métrique `{ $path }` : la valeur n'est pas un nombre

engine-e-sweep-sweep-node-serialize = sérialisation du nœud de balayage : { $e }

engine-e-sweep-sweep-node-result-parse = analyse du résultat du nœud de balayage : { $e }

engine-e-sweep-sweep-axis-declared-unit-but = axe de balayage `{ $key }` : unité `{ $d }` déclarée mais le paquet balayé publie `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = le thread de travail du balayage a paniqué

engine-e-sweep-generic-sweep-needs-at-least = un balayage générique nécessite au moins un axe

engine-e-sweep-generic-sweep-needs-at-least-2 = un balayage générique nécessite au moins une métrique

engine-e-sweep-generic-sweep-base-must-carry = la `base` d'un balayage générique doit porter son propre `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = un balayage générique ne peut pas balayer un autre balayage

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = oscillateur { $oscillator } inconnu ; l'un des { $presets } est attendu

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day et temperature_coeff_per_k doivent être finis

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s doit être fini et positif

engine-e-telecom-timing-duration-must-be-finite-and = duration_s doit être fini et couvrir au moins douze échantillons

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s doit être dans [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns doit être fini et >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = les entrées de température et de décalage de fréquence doivent être finies (période > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = l'enregistrement dépasserait 5 000 000 échantillons ; augmentez sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = une série d'erreurs de temps nécessite au moins 13 échantillons, reçu { $pairs }

engine-e-telecom-timing-every-time-and-time-error = chaque time_s et time_error_ns doit être fini

engine-e-telecom-timing-time-must-increase = time_s doit être croissant

engine-e-telecom-timing-the-series-must-be-uniformly = la série doit être échantillonnée uniformément : le pas { $v1 } est de { $d } s, le premier de { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = la ligne CSV { $v1 } n'est pas `time_s,time_error_ns`

engine-telecom-timing-the-mask-is-defined-through = le gabarit est défini par un filtre passe-bas à { $lit_0_1 } Hz, que ce moteur n'applique qu'à des intervalles d'échantillonnage de { $MAX_FILTER_DT_S } s ou moins ; cet enregistrement est échantillonné toutes les { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = indiquez soit [holdover], soit [series], pas les deux

engine-e-telecom-timing-give-either-series-samples-or = indiquez soit series.samples, soit series.csv_path, pas les deux

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days doit être fini et >= 0

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing : max|TE| { $max_abs } ns sur { $v2 } s ; { $masks } (MODELLED)

engine-telecom-timing-mtie-limit-ns = ,{ $id }_mtie_limit_ns

engine-telecom-timing-tdev-limit-ns = ,{ $id }_tdev_limit_ns

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = --format `{ $f }` inconnu (cef ou leef)

engine-e-telemetry-cli-unknown-option = option `{ $x }` inconnue

engine-e-telemetry-cli-input-and-result-are-alternatives = --input et --result s'excluent mutuellement

engine-e-telemetry-cli-listen = --listen { $l } : { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l } : aucune adresse

engine-telemetry-cli-warning-metrics-is-served-without = avertissement : /metrics est servi sans authentification sur { $addr } ; liez-le à localhost ou placez-le derrière votre propre contrôle d'accès

engine-e-telemetry-cli-bind = liaison { $addr } : { $e }

engine-telemetry-cli-serving-http-metrics = mise à disposition de http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host : { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp et --syslog-tcp s'excluent mutuellement

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting s'applique à --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name } : une partie de sujet doit être non vide, sans #, + ni / initial

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp nécessite une compilation avec `--features otlp`

engine-telemetry-cli-warning-input-line = avertissement : ligne d'entrée { $line_no } : { $e }

engine-e-telemetry-cli-cannot-open = impossible d'ouvrir { $p } : { $e }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] avertissement : { $n } message MQTT n'a pas été remis
        [many] avertissement : { $n } de messages MQTT n'ont pas été remis
       *[other] avertissement : { $n } messages MQTT n'ont pas été remis
    }


## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = l'endpoint doit commencer par http://

engine-e-telemetry-otlp-endpoint-has-no-host = l'endpoint n'a pas d'hôte

engine-e-telemetry-otlp-resolve = résolution de { $hostport } : { $e }

engine-telemetry-otlp-no-address-for = aucune adresse pour { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = avertissement : l'export otlp a échoué : { $e }

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

engine-e-telemetry-sample-not-json = pas du JSON : { $e }

engine-e-telemetry-sample-not-json-object = pas un objet JSON

engine-e-telemetry-sample-is-not-number = `{ $k }` n'est pas un nombre

engine-e-telemetry-sample-is-not-finite = `{ $k }` n'est pas fini

engine-e-telemetry-sample-missing = `t_s` manquant

engine-e-telemetry-sample-score-outside-100 = `score` { $s } hors de 0..=100

engine-e-telemetry-sample-missing-state = `state` manquant

engine-e-telemetry-sample-is-not-an-array = `{ $key }` n'est pas un tableau

engine-e-telemetry-sample-entry-has-no-name = une entrée `{ $key }` n'a pas de nom

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` est manquant ou n'est pas un nombre fini

engine-e-telemetry-sample-position-is-not-an-object = `position` n'est ni un objet ni null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` est manquant ou n'est pas une chaîne

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` n'est pas un nombre fini >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` n'est pas une chaîne

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` n'est pas un booléen

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` n'est ni un objet ni null

engine-e-telemetry-sample-result-has-no-epochs = le résultat n'a pas d'`epochs`

engine-e-telemetry-sample-bad-epochs = `epochs` incorrect : { $e }

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

engine-e-telemetry-syslog-host-is-bytes-syslog-host = l'hôte fait { $host } octets ; un nom d'hôte syslog fait au plus 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = l'hôte doit être en ASCII imprimable sans espaces

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path } : { $g } contre { $w } (non représentable en f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k } : présent, attendu absent

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k } : absent, attendu présent

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name } : { $n } doit être fini

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name } : slant_tec_tecu doit être fini et non négatif

engine-e-time-transfer-budget-line-not-mjd-ns = { $p } : ligne { $v1 } : pas MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p } : aucun enregistrement AR pour { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = format de série { $f } inconnu (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } doit être fini

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s doit donner de 16 à 20000 mesures

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget : { $name } - { $name2 } décalage { $ns } ns (Sagnac { $ns2 } ns, ionosphère { $ns3 } ns) ; u combinée { $ns4 } ns (type A { $ns5 } ns à { $averaging_s } s) ; { $series } série(s) réelle(s) (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = caractères non ASCII dans la TLE { $label } : { $line }

engine-e-tle-tle-truncated-reading-columns = TLE tronquée lors de la lecture de { $what } (colonnes { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } trop courte pour une somme de contrôle en colonne 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } sans chiffre de somme de contrôle en colonne 69

engine-e-tle-tle-checksum-mismatch-column-69 = somme de contrôle de la TLE { $label } incorrecte : la colonne 69 indique { $want }, calculé { $got }

engine-e-tle-not-tle-line = pas une ligne 1 de TLE : { $line1 }

engine-e-tle-not-tle-line-2 = pas une ligne 2 de TLE : { $line2 }

engine-e-tle-invalid-in-tle = valeur invalide pour { $what } dans la TLE : { $s }

engine-e-tle-invalid-epoch-year-in-tle = année d'époque invalide dans la TLE : { $col }

engine-e-tle-invalid-catalogue-number-in-tle = numéro de catalogue invalide dans la TLE : { $col }

engine-e-tle-inclination-out-of-range-180 = inclinaison hors de [0, 180] deg : { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = excentricité hors de [0, 1) : { $eccentricity }

engine-e-tle-non-positive-mean-motion = moyen mouvement non positif : { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = mantisse invalide pour { $what } dans la TLE : { $mant }

engine-e-tle-invalid-exponent-in-tle = exposant invalide pour { $what } dans la TLE : { $exp }

engine-tle-satellite-line-only-element-set = satellite { $satnum } : jeu d'éléments à ligne 2 seule analysé comme éléments képlériens analytiques (à deux corps) — les termes de traînée/B* de la ligne 1 et les termes séculaires SGP4 sont absents, donc cette orbite s'écarte d'un véritable ajustement SGP4 loin de l'époque ; fournissez la ligne 1 correspondante pour la précision SGP4

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop : le profil de C/N0 nécessite une époque et une durée positives

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop : le profil de C/N0 nécessiterait plus de { $MAX_DETECTOR_STEPS } pas de détecteur ({ $total } s à { $epoch_s } s par époque) ; raccourcissez ramp_duration_s ou allongez predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop : { $name } doit être fini

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop : { $name } doit être positif (reçu { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop : correlator_spacing_chips doit être inférieur à { $lit_1_9 } chips (reçu { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop : pullin_bandwidth_ratio doit valoir au moins 1 (reçu { $pullin_bandwidth_ratio }) — une boucle qui se réaccroche avec une bande passante PLUS ÉTROITE que celle de suivi inverserait l'hystérésis

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop : ramp_duration_s ne doit pas être négatif

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop : cn0_low_dbhz ({ $cn0_low_dbhz }) ne doit pas dépasser cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop : { $name } ne doit pas être vide

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop : { $name } a { $axis } entrées ; le plafond est { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop : { $name } contient une valeur non finie

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop : les temps de confirmation doivent être d'au moins 1 époque

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = au moins huit échantillons sont nécessaires

engine-e-twstft-budget-samples-must-increase-in-time = les échantillons doivent être croissants dans le temps

engine-e-twstft-budget-samples-must-be-on-regular = les échantillons doivent être sur une grille régulière

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } lignes : { $validated } vérifiées par rapport à une référence externe, { $modelled } calculées à partir d'un modèle, { $partner_owned } relevant d'un partenaire.{ "\u000A" }

engine-verification-src-mod-rs = src/{ $rel }/mod.rs

engine-verification-tests-fixtures = tests/fixtures/{ $base }

engine-verification-the-complete-machine-checked-evidence = Le registre complet des preuves, vérifié par machine : **{ $total } lignes — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Une ligne ne peut être VALIDATED qu'avec une référence externe indépendante (les tests d'invariants de la matrice l'imposent). Les mêmes données, avec des liens cliquables par ligne vers chaque test, module et fixture versionnée, forment le *Registre de vérification* sur https://kshana.dev. Voir [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md) pour savoir pourquoi chaque ligne calculée à partir d'un modèle n'est pas vérifiée par rapport à une référence externe.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }{ $modelled } capacités étiquetées MODELLED.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json n'est pas du JSON : { $e }

engine-wasm-runs-json-is-not-json = runs_json n'est pas du JSON : { $e }

engine-wasm-runs-needs-label = runs[{ $i }] nécessite `label`

engine-wasm-runs-needs-result = runs[{ $i }] nécessite `result`

engine-wasm-results-json-is-not-json = results_json n'est pas un tableau JSON de chaînes : { $e }

engine-wasm-maps-json-must-be-json = maps_json doit être un tableau JSON de chaînes : { $e }

engine-wasm-plans-json-is-not-json = plans_json n'est pas un tableau JSON de chaînes : { $e }

engine-wasm-options-json-is-not-json = options_json n'est pas du JSON : { $e }

engine-wasm-input-is-about-bytes-over = l'entrée fait environ { $b64 } octets, au-delà de la limite de { $v2 } octets

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Navigation séquentielle référencée au terrain (SITAN récursif)

engine-altpnt-sequential-free-inertial-drift-grows = dérive inertielle libre (croissante)

engine-altpnt-sequential-terrain-matched-bounded = recalage sur le terrain (bornée)

engine-altpnt-sequential-waypoint-full-scale = point de passage →    pleine échelle { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Rapport d'exécution Kshana

engine-advanced-report-meta = Type <code>{ $kind }</code> · moteur { $engine } · scénario <code>{ $scenario }</code> (condensat du fichier { $digest }…)

engine-advanced-report-toc-summary = 1 Synthèse

engine-advanced-report-toc-inputs = 2 Entrées

engine-advanced-report-toc-results = 3 Résultats

engine-advanced-report-toc-aggregation = 3a Agrégation

engine-advanced-report-toc-companions = 3b Animation et exports

engine-advanced-report-toc-events = 4 Événements

engine-advanced-report-toc-labels = 5 Étiquettes de vérification

engine-advanced-report-toc-not-modelled = 6 Non modélisé

engine-advanced-report-toc-reproducibility = 7 Reproductibilité

engine-advanced-report-h-summary = 1. Synthèse

engine-advanced-report-honesty-label = <strong>Étiquette de franchise</strong> ({ $source }) : { $label }

engine-advanced-report-capabilities-used = <strong>Capacités utilisées :</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (sur lesquelles on s'appuie, non fournies) ; voir la section 5.

engine-advanced-report-member-runs = <strong>Exécutions membres :</strong> { $n }, agrégées à la section 3a.

engine-advanced-report-h-inputs = 2. Entrées

engine-advanced-report-inputs-note = Chaque champ que définit le fichier de scénario, aplati selon son chemin. Les unités proviennent du bloc <code>units</code> du résultat (le schéma des unités de champ, docs/field-units-schema.json) lorsqu'il décrit le champ, sinon du suffixe du nom de champ ; une unité qu'aucun des deux n'indique est affichée comme non indiquée.

engine-advanced-report-th-parameter = Paramètre

engine-advanced-report-th-value = Valeur

engine-advanced-report-th-unit = Unité

engine-advanced-report-th-unit-source = Source de l'unité

engine-advanced-report-h-results = 3. Résultats

engine-advanced-report-chart-alt = Graphique des résultats

engine-advanced-report-also-written-to = { " " }(également écrit dans { $file })

engine-advanced-report-h-scalars = Résultats scalaires

engine-advanced-report-h-columns = Colonnes numériques

engine-advanced-report-th-result = Résultat

engine-advanced-report-th-column = Colonne

engine-advanced-report-th-count = Nombre

engine-advanced-report-th-min = Min

engine-advanced-report-th-max = Max

engine-advanced-report-th-first = Premier

engine-advanced-report-th-last = Dernier

engine-advanced-report-omitted-inputs = <p class="note">{ $n } autres entrées sont omises de cette page ; report.json liste les mêmes lignes, et le document de résultat contient chaque valeur.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">{ $n } autres résultats scalaires sont omis de cette page ; report.json liste les mêmes lignes, et le document de résultat contient chaque valeur.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">{ $n } autres colonnes numériques sont omises de cette page ; report.json liste les mêmes lignes, et le document de résultat contient chaque valeur.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">{ $n } autres événements sont omis de cette page ; report.json liste les mêmes lignes, et le document de résultat contient chaque valeur.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Agrégation des exécutions membres

engine-advanced-report-mode = <p>Mode <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Mode <strong>{ $mode }</strong> sur le type <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Mode <strong>{ $mode }</strong>, { $n_runs } exécutions membres.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Mode <strong>{ $mode }</strong> sur le type <code>{ $kind }</code>, { $n_runs } exécutions membres.</p>{ "\u000A" }

engine-advanced-report-run-digest = Condensat de l'exécution (SHA-256 des condensats des résultats membres, dans l'ordre de distribution) : <code>{ $digest }</code>

engine-advanced-report-table-empty = Ce tableau n'a aucune ligne : le résultat n'en liste aucune.

engine-advanced-report-distribution-caption = Distribution Monte Carlo de { $metric } ({ $n } échantillons), 20 intervalles de largeur égale ; les lignes en tirets marquent les 5e, 50e et 95e centiles.

engine-advanced-report-distribution-caption-unit = Distribution Monte Carlo de { $metric } ({ $n } échantillons, { $unit }), 20 intervalles de largeur égale ; les lignes en tirets marquent les 5e, 50e et 95e centiles.

engine-advanced-report-h-companions = 3b. Animation et exports

engine-advanced-report-animation-alt = Animation des séries temporelles de l'exécution

engine-advanced-report-animation-caption = Les échantillons propres de l'exécution se tracent derrière un curseur temporel mobile (le tracé animé de <code>--animate svg</code> ; il affiche l'image finale en cas de mouvement réduit et à l'impression).

engine-advanced-report-no-animation = Aucune animation : { $reason }

engine-advanced-report-no-animation-default = le résultat ne contient aucune série temporelle

engine-advanced-report-player-written-by = Le lecteur interactif est écrit par <code>{ $command }</code>.

engine-advanced-report-written-beside = Écrit à côté de ce rapport : { $links }.

engine-advanced-report-th-export = Export

engine-advanced-report-th-applies = S'applique

engine-advanced-report-th-files-or-reason = Fichiers ou raison

engine-advanced-report-written-by = écrit par <code>{ $command }</code>

engine-advanced-report-does-not-apply = ne s'applique pas

engine-advanced-report-yes = oui

engine-advanced-report-no = non

engine-advanced-report-h-events = 4. Chronologie des événements

engine-advanced-report-events-caption = Fenêtres sous forme de barres, événements ponctuels sous forme de points, sur l'axe temporel propre de l'exécution.

engine-advanced-report-th-start = Début (s)

engine-advanced-report-th-end = Fin (s)

engine-advanced-report-th-event = Événement

engine-advanced-report-th-source = Source

engine-advanced-report-point-event = événement ponctuel

engine-advanced-report-events-timeline = Chronologie des événements

engine-advanced-report-point-events = événements ponctuels ({ $n })

engine-advanced-report-distribution-of = Distribution de { $metric }

engine-advanced-report-max-bin = intervalle max. { $n }

engine-advanced-report-h-labels = 5. Étiquettes de vérification

engine-advanced-report-th-capability = Capacité (exigence de la matrice)

engine-advanced-report-th-label = Étiquette

engine-advanced-report-th-used-by = Utilisée par

engine-advanced-report-th-oracle = Source : référence indépendante

engine-advanced-report-th-test-evidence = Preuve par essai

engine-advanced-report-h-figure-tiers = Niveaux par valeur indiqués par le résultat

engine-advanced-report-th-figure = Valeur

engine-advanced-report-th-tier = Niveau

engine-advanced-report-th-matrix-requirement = Exigence de la matrice

engine-advanced-report-th-applicable = Applicable

engine-advanced-report-no-attack = non (aucune attaque configurée)

engine-advanced-report-h-not-modelled = 6. Non modélisé, et hypothèses

engine-advanced-report-not-modelled-note = Chaque élément est cité à l'endroit où il est énoncé : le document de résultat, le catalogue des types, le fichier de scénario, ou la raison pour laquelle une ligne MODELLED de la matrice de vérification reste à l'état de modèle.

engine-advanced-report-th-statement = Énoncé

engine-advanced-report-h-reproducibility = 7. Fiche de reproductibilité

engine-advanced-report-rk-command = Commande pour reproduire

engine-advanced-report-rk-working-directory = Répertoire de travail

engine-advanced-report-rk-engine-version = Version du moteur

engine-advanced-report-rk-source-commit = Commit source

engine-advanced-report-rk-scenario-file = Fichier de scénario

engine-advanced-report-rk-scenario-sha = SHA-256 du fichier de scénario (Secure Hash Algorithm 256 bits)

engine-advanced-report-rk-result-hash = scenario_hash du résultat

engine-advanced-report-rk-result-sha = SHA-256 du document de résultat

engine-advanced-report-rk-seed = Graine

engine-advanced-report-rk-platform = Plateforme

engine-advanced-report-rk-generated = Étude générée (UTC)

engine-advanced-report-rk-determinism = Déterminisme

engine-advanced-report-result-hash-none = le document de résultat n'en indique aucun

engine-advanced-report-print-note = Pour imprimer cette page dans un fichier Portable Document Format (PDF), utilisez la boîte de dialogue d'impression du navigateur et choisissez « Enregistrer au format PDF » ; la feuille de style d'impression s'adapte au papier A4 et US Letter, répète les en-têtes de tableau d'une page à l'autre et commence les sections entrées, résultats, étiquettes et reproductibilité sur une nouvelle page. Le moteur n'écrit lui-même aucun PDF. report.json contient le même contenu que cette page.

engine-advanced-report-footer = Généré par Kshana { $engine }.{ $stamp } Reproductible à partir du scénario + de la graine + de la version du moteur. Libre et open source (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">source &amp; documentation</a>.

engine-advanced-report-empty-inputs = Le scénario ne définit aucun champ en dehors de `kind` : le type a exécuté sa configuration de référence avec ses valeurs par défaut documentées.

engine-advanced-report-empty-scalars = Le document de résultat ne contient aucun scalaire en dehors de ses tableaux ; ses nombres sont résumés par colonne ci-dessous.

engine-advanced-report-empty-series = Le document de résultat ne contient aucun tableau numérique : chaque résultat est un scalaire dans le tableau ci-dessus.

engine-advanced-report-empty-events = Aucun événement horodaté : le scénario ne programme aucune fenêtre ni aucun instant de début et le résultat ne rapporte aucun événement. Le type évalue sa configuration comme un seul cas.

engine-advanced-report-empty-not-modelled = Rien dans le résultat, le catalogue des types, le scénario ou les lignes de matrice utilisées n'énonce de limite de modélisation pour cette exécution.

engine-advanced-report-capabilities-statement = Chaque ligne est une ligne de la matrice de vérification que les types de cette exécution mobilisent, avec l'étiquette et la référence indépendante que lui donne la matrice (src/verification.rs, docs/VERIFICATION-MATRIX.md). Une étiquette qualifie la capacité telle que la matrice la consigne ; elle ne qualifie pas la configuration de ce scénario, et une ligne VALIDATED ne fait pas des entrées de l'exécution des valeurs mesurées. Une ligne PARTNER est une discipline sur laquelle l'exécution s'appuie et que Kshana ne fournit pas.

engine-advanced-report-no-run-label = Le résultat ne porte aucune étiquette de franchise au niveau de l'exécution ; les étiquettes de vérification des capacités utilisées sont listées dans leur propre section, ainsi que les niveaux par valeur lorsque le résultat les indique.

engine-advanced-report-no-seed = Ni le scénario ni le résultat ne contient de graine. Le résultat est déterminé par le seul fichier de scénario et la seule compilation du moteur ; le test de déterminisme réexécute chaque scénario fourni et exige une sortie identique à l'octet près.

engine-advanced-report-working-directory = Lancez la commande depuis le répertoire où l'exécution d'origine a été démarrée : le chemin du scénario, et tout chemin de données relatif à l'intérieur du scénario, sont résolus par rapport à lui. Vérifiez d'abord le fichier de scénario par rapport à scenario_sha256.

engine-advanced-report-determinism-stamped = Les mêmes octets de scénario, la même graine et la même compilation du moteur donnent le même document de résultat, à l'exception de son horodatage meta.generated_utc, que --study-name écrit à partir de l'horloge ; lancez sans --study-name pour une sortie identique à l'octet près. Les résultats en virgule flottante sont figés par plateforme ; un autre système d'exploitation ou une autre architecture peut différer sur les derniers chiffres.

engine-advanced-report-determinism-plain = Les mêmes octets de scénario, la même graine et la même compilation du moteur donnent un document de résultat et un rapport identiques à l'octet près ; ce rapport ne porte aucun horodatage. Les résultats en virgule flottante sont figés par plateforme ; un autre système d'exploitation ou une autre architecture peut différer sur les derniers chiffres.

engine-advanced-report-not-applicable-no-attack = sans objet (aucune attaque configurée)

engine-advanced-report-what-ran-default = Un scénario `{ $kind }`.

engine-advanced-report-nothing-carried = rien n'est porté

engine-advanced-report-tbl-sweep-nodes = Nœuds du balayage

engine-advanced-report-tbl-mc-summary = Synthèse de la distribution Monte Carlo (les centiles sont au rang le plus proche ; l'intervalle de confiance à 95 % sur la moyenne est un bootstrap par centiles à graine fixe)

engine-advanced-report-tbl-chain-phases = Phases de la chaîne

engine-advanced-report-tbl-shared = Conditions partagées

engine-advanced-report-tbl-members = Membres

engine-advanced-report-tbl-combined = Combiné sur les membres

engine-advanced-report-tbl-optimiser-best = Meilleur de l'optimiseur (un optimum local sur les bornes indiquées)

engine-advanced-report-tbl-optimiser-trace = Trace de l'optimiseur

engine-advanced-report-tbl-sweep-grid = Grille de balayage

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Navigation référencée au terrain (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Navigation par recalage sur carte gravimétrique

engine-altpnt-terrain-title-combined = alt-PNT combiné gravité + magnétique + terrain

engine-altpnt-terrain-free-inertial-drift = dérive inertielle libre

engine-altpnt-terrain-terrain-matched = recalage sur le terrain

engine-altpnt-terrain-gravity-matched = recalage gravimétrique

engine-altpnt-terrain-gravity-only = gravité seule

engine-altpnt-terrain-magnetic-only = magnétique seul

engine-altpnt-terrain-terrain-only = terrain seul

engine-altpnt-terrain-combined-fused = combiné (fusionné)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · scénario { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Surface d'attaque de la sécurité des signaux lunaires (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = relais en vue

engine-body-pnt-chart-count = nombre

engine-body-pnt-chart-formal-one-sigma-position = position formelle à un sigma (log10 m) : constellation seule en bleu, avec la distance Terre en ambre

engine-body-pnt-chart-time-since-epoch = temps depuis l'époque, 0 à { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = erreur de temps de l'horloge par rapport à la garde (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 par rapport au plancher de suivi (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = niveau de protection par rapport à la limite d'alerte (m)

engine-campaign-chart-position-error-vs-threshold = erreur de position par rapport au seuil (m)

engine-campaign-chart-satellites-tracking = satellites suivis

engine-campaign-chart-alarm-flags-and-events = indicateurs d'alarme et événements

engine-campaign-chart-mission-time = temps de mission de { $duration } s

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) à { $lead }

engine-campaign-chart-monte-carlo-of = Monte Carlo de `{ $scenario_kind }` : { $n_runs } graines à partir de { $base_seed } (5e, 50e, 95e centile ; barre = intervalle de confiance bootstrap à 95 % sur la moyenne)

engine-campaign-chart-composed-members = membres composés sous conditions partagées : { $shared }

engine-campaign-chart-not-available = n/d

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Récupération de la longueur d'arc cislunaire — un estimateur qui ne partage pas les jacobiennes

engine-cislunar-arc-recovery-chart-subtitle = moindres carrés par lots à différences finies · erreur mesurée de récupération de l'état · ni jacobienne analytique, ni STM variationnelle, ni tolérance de rang SVD

engine-cislunar-arc-recovery-chart-bound = borne { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = Seuil de rang du gramien

engine-cislunar-arc-recovery-chart-monte-carlo-rms = Erreur RMS de récupération de position par Monte Carlo (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = pire rapport de récupération sans bruit (erreur finale / déplacement)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Observabilité cislunaire sur un arc de suivi (P6)

engine-cislunar-observability-chart-subtitle = rang selon l'arc (liaison unique en distance seule) · spectre propre du gramien · CI DRO corrigées par différentiation + recoupement SRIF · conception { $modelled }, rang/STM/fermeture { $validated }

engine-cislunar-observability-chart-observable-rank = rang observable selon la longueur d'arc

engine-cislunar-observability-chart-arc-length = longueur d'arc (unités de temps du référentiel tournant, { $arc_hours } h au total)

engine-cislunar-observability-chart-gramian-eigenvalues = valeurs propres du gramien (log10)

engine-cislunar-observability-chart-condition = conditionnement κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Résilience PNT en couches en situation de conflit (P7)

engine-conflict-resilience-chart-subtitle = perte totale selon l'intensité de la menace (MC contre forme fermée) · rapport de résilience selon la corrélation du déni · a priori { $modelled }, MC->forme fermée / marginales de copule { $validated }

engine-conflict-resilience-chart-total-loss-probability = probabilité de perte totale selon l'intensité

engine-conflict-resilience-chart-threat-intensity = intensité de la menace

engine-conflict-resilience-chart-layered-mc = MC en couches

engine-conflict-resilience-chart-single-layer = couche unique

engine-conflict-resilience-chart-resilience-ratio = rapport de résilience selon la corrélation du déni

engine-conflict-resilience-chart-denial-correlation = corrélation du déni ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = disponibilité ( %)

engine-constellation-chart-mean-pdop = PDOP moyen

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = GNSS terrestre à distance lunaire — C/N0 selon l'angle hors axe

engine-earth-gnss-lunar-chart-track-threshold = suivi { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = limbe terrestre { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = angle hors axe (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = or = suivable · rouge = trop faible · gris = occulté par la Terre · diagramme d'émission { $modelled }

## src/ensemble.rs

engine-ensemble-chart-title = Holdover d'horloge : bande de confiance de l'erreur de synchronisation ({ $n_runs } exécutions)

engine-ensemble-chart-timing-error-ns = erreur de synchronisation (ns)

engine-ensemble-chart-spec-threshold = spéc. { $threshold } ns

engine-ensemble-chart-time-s = temps (s)

engine-ensemble-chart-classical-median-band = classique : { $id } (médiane, bande 5-95 %)

engine-ensemble-chart-quantum-median-band = quantique : { $id } (médiane, bande 5-95 %)

## src/fom_label.rs

engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

## src/frame_eop.rs

engine-frame-eop-chart-title = Budget de prédiction temps réel du référentiel / EOP pour la synchronisation lunaire

engine-frame-eop-chart-ut1-error-ms = erreur UT1 (ms)

engine-frame-eop-chart-position-at-moon-m = position à la Lune (m)

engine-frame-eop-chart-equiv-timing-ns = synchronisation équiv. (ns)

engine-frame-eop-chart-prediction-horizon-days = horizon de prédiction (jours)

engine-frame-eop-chart-iers-final-floor = plancher final de l'IERS { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m à la Lune

engine-frame-eop-chart-growth = ~{ $factor }x, 1 j→{ $far_days } j

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = UKF hybride à 17 états — auto-cohérence du filtre (modélisé)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + blancheur de l'innovation par rapport aux bandes χ² à 95 % ; { $lit_1_0 } = cohérent. Auto-cohérence, pas exactitude.

engine-fusion-hybrid-ukf-chart-target = cible { $lit_1_0 }

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (blancheur)

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = COHÉRENT

engine-fusion-hybrid-ukf-chart-inconsistent = INCOHÉRENT

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Erreur horizontale GNSS/INS à couplage lâche

engine-fusion-pack-chart-horizontal-error-m = erreur horizontale (m)

engine-fusion-pack-chart-spec-threshold = spéc. { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Diagramme du ciel ({ $label })

engine-geometry-chart-north = N

engine-geometry-chart-east = E

engine-geometry-chart-south = S

engine-geometry-chart-west = O

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } él { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } él { $el } (masqué par le profil d'horizon)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } él { $el } (sous le masque)

engine-geometry-chart-no-fix = pas de position

engine-geometry-chart-in-view-hidden = { $n_visible } en vue, { $n_masked } masqués par le profil d'horizon · { $dop } · creux : pas en vue

engine-geometry-chart-satellites-as-given = satellites tels que fournis

engine-geometry-chart-representative-sky = ciel représentatif, non daté

engine-geometry-chart-footer = Kshana v{ $version } · géométrie sous un modèle d'erreur indiqué · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = Niveaux de protection RAIM par rapport aux limites d'alerte

engine-gnss-sim-chart-protection-level-m = niveau de protection (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

## src/main.rs

engine-main-fail = erreur : { $e }

## legal (advisories, disclaimers and notices; the English text is the source, the constant in code is what machine files carry)

# legal: native review
engine-legal-compliance-statement = Une ligne marquée evidenced signifie qu'une exécution de cet ensemble apporte des éléments de preuve en faveur des capacités que nomme la ligne. Ce n'est pas la constatation qu'un cadre de référence est respecté, et cela ne signifie pas qu'un produit a été évalué ou approuvé par quiconque. La colonne d'écart indique ce que les exécutions ne montrent pas.

# legal: native review
engine-legal-bench-surface-notice = Mouvement du véhicule et intervalles d'événements étiquetés uniquement. Rien de ce qui est exporté ici n'est un signal radiofréquence ou en bande de base, ne le modélise ni ne le pilote, et un événement est un intervalle de temps, non une méthode pour produire de l'interférence. Le simulateur de laboratoire et son opérateur fournissent les signaux et sont responsables de ne les exécuter que là où cela est autorisé (en conduit ou blindé, selon les instructions de sécurité propres au simulateur). Kshana ne publie aucun résultat issu de telles exécutions.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED : ROC au niveau des fenêtres de chaque moniteur sur les enregistrements fournis. Chaque fenêtre d'événement indiquée est un positif et chaque fenêtre roc_window_s hors des événements un négatif ; une fenêtre compte à un seuil lorsque la statistique de test du moniteur l'atteint dans la fenêtre. P_fa est par fenêtre négative, non par test.

# legal: native review
engine-legal-lunanet-afs-advisory = À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Il vérifie un flux de symboles par rapport à une édition d'une spécification publiée et ne dit rien d'aucun nœud ou service LunaNet.

# legal: native review
engine-legal-iqfit-statement = MODELLED : chaque nombre ajusté décrit le récepteur ouvert (la conception de boucle nommée et la chaîne de front-end) sur les enregistrements fournis, ajusté aux résultats notés de la campagne. Ce n'est pas une mesure d'un autre récepteur. Les prédictions sont étiquetées PREDICTION, avec l'enregistrement testé le plus proche et la distance hors des conditions testées.

# legal: native review
engine-legal-iqfit-advisory = À titre consultatif : sortie d'analyse, et non un équipement de navigation homologué ; les prédictions sont des sorties de modèle avec une erreur indiquée, non des garanties.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Énoncé de source, non une affirmation : la documentation ICG WG-B Lunar PNT de juin 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, source S3 de l'étude) décrit un laboratoire de référence de temps lunaire à la station avec un objectif de temps de l'ordre de la nanoseconde. Kshana cite cet objectif pour le contexte seulement ; elle ne l'adopte pas, et rien dans ce bloc ne montre qu'une horloge de station réelle l'atteigne.

# legal: native review
engine-legal-standards-pack-notice = Un paquet de normes mesure des scénarios modélisés par rapport à des seuils fixés avant l'exécution. Il apporte des éléments de preuve en faveur des lignes de cadre qu'il nomme ; il n'évalue ni n'approuve aucun produit, et un seuil MET dit seulement que la sortie modélisée du scénario a atteint le seuil indiqué.

# legal: native review
engine-legal-standards-pack-advisory = À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine ; elle ne doit pas être l'unique fondement d'une décision de navigation ou de sécurité.

# legal: native review
engine-legal-geometry-statement = Géométrie sous un modèle d'erreur indiqué (MODELLED) : visibilité en ligne directe par rapport au profil d'horizon indiqué, dilution de précision et ellipse d'erreur gaussienne pour des erreurs de distance gaussiennes indépendantes, égales et de moyenne nulle, de l'erreur équivalente de distance utilisateur indiquée. Ce n'est pas une prédiction de l'erreur réelle d'un récepteur, qui comporte aussi des biais, des trajets multiples et des erreurs hors ligne directe, et ce n'est pas une borne d'intégrité. Les constellations prédéfinies sont une géométrie représentative, non le ciel de cette date à cet endroit.

# legal: native review
engine-legal-resilience-disclaimer = Auto-évaluation issue de la simulation, alignée sur DHS RPCF v2.0. Ce n'est ni une certification ni une accréditation, et elle ne représente l'approbation d'aucune autorité (DHS, IEEE ou autre). Chaque sous-score est MODELLED sauf s'il est explicitement étiqueté VALIDATED, et les scores sont des indicateurs de mérite pour le domaine temporel et la détection, non une exactitude dans le domaine de la position.

# legal: native review
engine-legal-observatory-notice = Une cellule dégradée signifie qu'une forte proportion d'aéronefs y ont signalé une faible exactitude de navigation ce jour-là. Aucune cause n'est attribuée. Une cellule non observée, ou absente, n'a pas été évaluée, ce qui n'est pas la même chose que dégagée. À titre consultatif seulement : ni une approbation, ni une certification, ni une déclaration de conformité.

# legal: native review
engine-legal-receiver-trust-advisory = Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC 61108, IEC 61162) : l'opérateur reste responsable de la navigation du navire.

# legal: native review
engine-legal-evidence-roundtrip-notice = Relie quatre enregistrements par condensat : le scénario, les conditions d'essai indiquées du laboratoire, le journal du récepteur et la note de ce journal par rapport aux événements indiqués. Ce n'est pas un signal, pas une méthode de rejeu et pas une certification. La manière dont le mouvement du scénario est parvenu au récepteur (un fichier joué par un simulateur de laboratoire, en conduit ou blindé) relevait de la responsabilité de l'opérateur et n'est consignée ici que telle qu'indiquée.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Ce paquet est un enregistrement technique de ce que le moteur Kshana a calculé à partir du journal de récepteur indiqué avec la configuration indiquée. Ce n'est pas un avis juridique, pas une constatation de fait sur un événement ou sa cause, et pas une certification.

# legal: native review
engine-legal-bench-notice = À titre consultatif : modélisé ou mesuré par rapport à des références indiquées, et non une approbation, une certification ou une déclaration de conformité. Une note décrit un journal ou un corpus, jamais un produit.

# legal: native review
engine-legal-osnma-advisory = À titre consultatif : il s'agit d'une sortie d'analyse et de surveillance, et non d'un équipement de navigation homologué. L'état d'authentification rapporté ici n'est pas un service d'intégrité de navigation et ne doit pas être l'unique fondement d'une décision de navigation ou de sécurité.

## added by the second pass

engine-holdover-test-chart-title = Test de holdover : erreur de temps par étape

engine-holdover-test-chart-y-title = |erreur de temps| (ns)

engine-holdover-test-chart-panel-caption = erreur de temps absolue ; étape de holdover ombrée ; les lignes pointillées sont les budgets d'erreur de temps

engine-holdover-test-chart-gnss-removed = GNSS retiré

engine-holdover-test-chart-gnss-restored = GNSS rétabli

engine-holdover-test-chart-time-axis = temps sur l'axe de l'enregistrement ({ $min } min)

engine-hybrid-chart-title = Utilisation de la spécification du PNT hybride pendant une panne GNSS ({ $lit_1_0 } = spécification)

engine-hybrid-chart-y-title = utilisation de la spécification

engine-hybrid-chart-spec-line = spécification ({ $lit_1_0 })

engine-hybrid-chart-classical-suite = suite classique

engine-hybrid-chart-quantum-suite = suite quantique

engine-hybrid-integrity-chart-availability = disponibilité

engine-hybrid-integrity-chart-precision = précision

engine-hybrid-integrity-chart-integrity = intégrité

engine-hybrid-integrity-chart-joint-indep = conjoint (indép.)

engine-hybrid-integrity-chart-joint-corr = conjoint (corr.)

engine-hybrid-integrity-chart-title = Facteur de mérite conjoint du PNT hybride optique + RF

engine-hybrid-integrity-chart-subtitle = P(disponible AND de grade précision AND intégrité assurée)

engine-inertial-chart-title = Erreur de position à l'estime pendant une panne GNSS

engine-inertial-chart-y-title = erreur de position (m)

engine-inertial-chart-spec-line = spécification { $m } m

engine-inertial-chart-classical = classique : { $id }

engine-inertial-chart-quantum = quantique : { $id }

engine-iq-campaign-report-roc-aria-label = ROC de détection par moniteur

engine-iq-campaign-report-roc-x-title = P_fa (par fenêtre négative)

engine-iq-campaign-report-curve-aria-label = Dégradation du C/N0 en fonction du J/S indiqué pour { $rec } événement { $ev }

engine-iq-campaign-report-curve-x-title = J/S indiqué (dB)

engine-iq-campaign-report-curve-y-title = dégradation du C/N0 (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label } : référence SSC, Q = { $q }

engine-iq-campaign-report-curve-model-legend = référence { $label } (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } série(s) de plus dans le tableau de synthèse

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d } : J/S { $x } dB, dégradation mesurée { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (mesuré)

engine-jamming-chart-title = Satellites visibles et satellites suivis sous brouillage

engine-jamming-chart-y-title = satellites

engine-jamming-chart-four-sv-fix = solution à 4 SV

engine-jamming-chart-visible = visibles

engine-jamming-chart-tracking = suivis

engine-leo-fusion-ntn-chart-title = Positionnement 5G NTN : borne de Cramér-Rao de la distance selon la largeur de bande

engine-leo-fusion-ntn-chart-caption = écart type de la distance (log10 m) : barre = du masque au C/N0 au zénith ; point = erreur RMS de la solution 3D

engine-leo-fusion-ppp-chart-title = Convergence du PPP avec augmentation LEO

engine-leo-fusion-ppp-chart-caption = erreur horizontale médiane (log10 m) en fonction des minutes

engine-leo-fusion-pvt-kind-chart-doppler-caption = erreur de la solution Doppler 3D (log10 m) en fonction de la longueur de fenêtre

engine-leo-fusion-pvt-kind-chart-doppler-x-label = fenêtre (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = PDOP médian (bleu) et VDOP médian (ambre), log10, en fonction des satellites LEO ajoutés

engine-leo-fusion-pvt-kind-chart-joint-x-label = satellites LEO ajoutés

engine-leo-fusion-pvt-kind-chart-polar-caption = VDOP médian (log10) : gris GNSS, bleu LEO, ambre fusionné

engine-leo-fusion-pvt-kind-chart-polar-x-label = latitude (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = erreur de temps RMS par rapport à l'UTC (log10 ns) en fonction du décalage de C/N0, une ligne par oscillateur

engine-leo-fusion-pvt-kind-chart-timing-x-label = décalage de C/N0 (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label } : { $x0 } à { $x1 }

engine-leo-navmsg-chart-title = Message de navigation LEO : SISRE en fonction de l'intervalle d'ajustement

engine-leo-navmsg-chart-no-trade-encode-decode = Aucun compromis dans cette exécution ; voir result.json pour les tableaux d'encodage/décodage et de budget.

engine-leo-navmsg-chart-no-fit-interval-trade = Aucun compromis d'intervalle d'ajustement dans cette exécution ; voir result.json.

engine-leo-navmsg-chart-caption = SISRE RMS orbite seule (m, échelle logarithmique) en fonction de l'intervalle d'ajustement (s)

engine-leo-pass-chart-title = Passage LEO : C/N0 par bande et Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20 à 80) : bandes LEO en couleur, GNSS en gris

engine-leo-pass-chart-time-axis = temps depuis l'époque, 0 à { $s } s

engine-leo-pnt-chain-chart-subtitle = conception du signal -> C/N0 du passage et gigue du code -> SISRE du message -> solution fusionnée · { $label }

engine-leo-pnt-chain-chart-cn0-caption = C/N0 de la composante suivie sur le passage (dB-Hz, 20 à 80)

engine-leo-pnt-chain-chart-not-available = s. o.

engine-leo-signal-chart-title = Conceptions de signaux LEO-PNT

engine-leo-signal-chart-psd-axis = décalage sur ±{ $lit_0_6 } × la largeur de bande d'émission ; 0 à −50 dB sous chaque pic

engine-leo-signal-chart-jitter-caption = gigue du code (m, échelle logarithmique) en fonction du C/N0 total (dB-Hz)

## added in the 0.40 delta

engine-campaign-sweep-of-over-nodes-each-percentile-band = balayage de `{ $scenario_kind }` sur { $axis_order } ({ $nodes } nœuds, médiane avec bande des 5e-95e centiles sur { $n_runs } graines ; chaque ligne sur sa propre plage)

engine-holdover-test-holdover-not-recovered-within-record = holdover-test : holdover { $hold } s, max|TE| { $max_abs } ns ; { $masks } ; non rétabli dans l'enregistrement (MODELLED, mesuré par rapport au masque)

engine-holdover-test-holdover-recovered-after-gnss-returned = holdover-test : holdover { $hold } s, max|TE| { $max_abs } ns ; { $masks } ; rétabli { $t } s après le retour du GNSS (MODELLED, mesuré par rapport au masque)

engine-iq-cli-scene-written-by-kshana-iq-scene-integer-scale = écrit par kshana iq scene : une scène SIMULÉE, pas un enregistrement ; échelle entière : 1 LSB = { $sc } unités normalisées au bruit (RMS attendu { $v1 } LSB par composante), { $clipped } élément(s) écrêté(s)

engine-iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale = écrit par kshana iq scene ; échelle entière : 1 LSB = { $sc } unités normalisées au bruit (RMS attendu { $v1 } LSB par composante), { $clipped } élément(s) écrêté(s)

engine-iq-cli-scene-wrote-samples-hz-to-truth-integer-scale = { $samples } échantillons ({ $format }, { $fs_hz } Hz) écrits dans { $data_path } ; { $truth_records } enregistrements de vérité terrain dans { $truth_path } ; { $meta_note } ; canal : { $chan_desc } ; échelle entière : 1 LSB = { $sc } unités normalisées au bruit (RMS attendu { $v1 } LSB par composante), { $clipped } élément(s) écrêté(s)

engine-leo-fusion-ppp-chart-n-leo = { $n } LEO

engine-lunar-chart-title = HPL du pôle sud lunaire ({ $availability } % de disponibilité, AL { $al } m, σ_URE { $sigma } m)

engine-lunar-beacon-chart-title = Augmentation par balises de surface — PDOP par configuration

engine-lunar-beacon-chart-pdop = PDOP { $pdop }

engine-lunar-beacon-chart-no-solution = pas de solution

engine-lunar-beacon-chart-footnote = plus bas est meilleur ; sigma_URE par balise { $sigma } m, masque { $mask } deg

engine-lunar-combination-chart-title = OD + horloge conjointes lunaires — erreur de position 3D de la station (la VLBI rétablit l'observabilité)

engine-lunar-combination-chart-subtitle = { $n_sat } sat., { $n_earth } stations terrestres · facteur d'amélioration { $factor }×

engine-lunar-combination-chart-with-vlbi = avec VLBI : { $m } m

engine-lunar-combination-chart-range-only = distances seules : { $m } m

engine-lunar-combination-chart-axis-note = log10 de l'erreur de station (m) ; convergé avec/sans = { $with }/{ $without }

engine-lunar-dpnt-chart-title = PNT différentiel lunaire — { $n_sats } sat. : erreur corrigée en fonction de la ligne de base (réduction × { $factor } à { $km } km)

engine-lunar-dpnt-chart-subtitle = non corrigée { $uncorrected } m | corrigée { $corrected } m | HPL { $hpl } m (σ_resid { $sigma } m) | { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = non corrigée (autonome)

engine-lunar-dpnt-chart-baseline-km = ligne de base (km)

engine-lunar-dpnt-chart-err-m = err (m)

engine-lunar-frame-realise-chart-title = Réalisation du référentiel lunaire — récupération d'une transformation de Helmert à 7 paramètres

engine-lunar-frame-realise-chart-subtitle = { $n_points } points · résidu RMS { $rms } m · convergé { $converged }

engine-lunar-frame-realise-chart-tx = tx (m)

engine-lunar-frame-realise-chart-ty = ty (m)

engine-lunar-frame-realise-chart-tz = tz (m)

engine-lunar-frame-realise-chart-theta-x = θx (µrad)

engine-lunar-frame-realise-chart-theta-y = θy (µrad)

engine-lunar-frame-realise-chart-theta-z = θz (µrad)

engine-lunar-frame-realise-chart-scale = échelle (ppb)

engine-lunar-frame-realise-chart-row = { $label } : injecté { $inj } { $unit } · récupéré { $rec } { $unit } · err { $err }

engine-lunar-interop-chart-title = Export d'interopérabilité lunaire — CCSDS OEM + KIF (aligné LunaNet/IOAG)

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | { $n_states } états | OEM { $oem_lines } lignes

engine-lunar-interop-chart-artifacts = artefacts : { $list }

engine-lunar-interop-chart-pass = PASS

engine-lunar-interop-chart-fail = FAIL

engine-lunar-interop-chart-ok = OK

engine-lunar-interop-chart-conformance = conformité des champs : { $verdict } ({ $present } présents, { $missing } manquants, { $data_lines } lignes de données)

engine-lunar-interop-chart-roundtrip = aller-retour OEM : { $oem } | aller-retour des métadonnées temporelles : { $time_metadata } | KIF { $kif_bytes } octets

engine-lunar-interop-chart-footnote = Aller-retour / conformité des champs par rapport à CCSDS OEM et à la sémantique des champs LunaNet/IOAG publiée. { $label } — pas un test certifié de conformité d'interopérabilité ; aucune caution d'une agence.

engine-lunar-jamming-chart-title = J/S par satellite en fonction de l'élévation, utilisateur en surface lunaire

engine-lunar-jamming-chart-y-title = J/S (dB)

engine-lunar-jamming-chart-x-title = élévation du satellite (deg)

engine-lunar-jamming-chart-locked = LOCKED

engine-lunar-jamming-chart-degraded = DEGRADED

engine-lunar-jamming-chart-lost = LOST

engine-lunar-jamming-chart-n-links = { $n_links } liaisons

engine-lunar-service-chart-title = Volume de service lunaire — { $n_sats } sat., { $n_points } pts × { $n_epochs } époques : { $coverage } % de couverture (PDOP&lt;{ $threshold })

engine-lunar-service-chart-subtitle = sat. { $min_sats }–{ $max_sats } | HPL { $hpl_min }–{ $hpl_max } m | VPL { $vpl_min }–{ $vpl_max } m | disponibilité PL { $pl_avail } % (AL { $al } m, σ_URE { $sigma } m)

engine-lunar-service-chart-pdop-min = PDOP min { $v }

engine-lunar-service-chart-pdop-mean = PDOP moyen { $v }

engine-lunar-service-chart-pdop-max = PDOP max { $v }

engine-lunar-station-chart-title = Station de référence lunaire : erreur 3D corrigée au p{ $percentile } sur la région polaire sud (MODELLED)

engine-lunar-station-chart-zero-east = 0° E

engine-lunar-station-chart-threshold = seuil { $thr } m au p{ $percentile }

engine-lunar-station-chart-availability = disponibilité { $v } %

engine-lunar-station-chart-coverage = couverture { $v } %

engine-lunar-station-chart-corrected-3d = 3D corrigée { $f }

engine-lunar-station-chart-uncorrected-3d = 3D non corrigée { $f }

engine-lunar-station-chart-legend-half = ≤ la moitié du seuil

engine-lunar-station-chart-legend-within = ≤ seuil

engine-lunar-station-chart-legend-twice = ≤ deux fois le seuil

engine-lunar-station-chart-legend-above = au-dessus de deux fois le seuil

engine-lunar-station-chart-station-note = ◆ station · tirets : distance jusqu'à laquelle la couverture tient à 95 %

engine-lunar-station-chart-disclaimer = MODELLED selon des hypothèses énoncées ; ne constitue pas une affirmation sur un système réel ; sans affiliation ni caution d'aucune agence.

engine-lunar-time-chart-title = Temps coordonné lunaire LTC−TT (dérive { $rate } µs/jour, bande { $low }–{ $high })

engine-lunar-time-chart-offset = { $offset } µs à { $days } j

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term-time-lab = lunar-time-budget | horloge { $clock } | x_Σ(τ) à 7 termes sur { $taus } points τ ({ $taus2 }–{ $taus3 } s) | τ de croisement { $crossover_tau_s } s (x { $crossover_x_s } s) | plancher de référentiel { $frame_term_s } s | horloge x(1 d) { $x_1day_ns } ns (MODELLED) | laboratoire de temps : { $lab } { $lab2 } vers LTC, x(1 d) { $lab3 } ns (MODELLED)

engine-lunar-vlbi-chart-title = Délai VLBI lunaire (ligne de base { $baseline } km, distance de la balise { $range } km, champ proche { $near_field } µs)

engine-lunar-vlbi-chart-footnote = délai { $delay } µs à l'époque · { $samples } échantillons sur { $hours } h

engine-mars-pnt-chart-formal-3sigma = 3σ formel (covariance, pas un PL certifié)

engine-nmea-synth-log-position-drag-off-counterfeit-cn0 = entraînement de position : la position rapportée s'éloigne de { $final_offset_m } m { $dir } alors que le récepteur conserve une solution valide (la fausse trajectoire atteint au maximum { $pv } m/s et { $pa } m/s^2) ; chaque satellite suivi affiche { $c } dB-Hz tant que cela dure

engine-nmea-synth-log-position-drag-off-genuine-cn0 = entraînement de position : la position rapportée s'éloigne de { $final_offset_m } m { $dir } alors que le récepteur conserve une solution valide (la fausse trajectoire atteint au maximum { $pv } m/s et { $pa } m/s^2) ; le profil de C/N0 authentique est conservé

engine-nmea-synth-log-time-spoof-counterfeit-cn0 = leurrage temporel : l'UTC rapporté s'écarte de { $offset_s } s du temps vrai ; la position reste vraie ; chaque satellite suivi affiche { $c } dB-Hz tant que cela dure

engine-nmea-synth-log-time-spoof-genuine-cn0 = leurrage temporel : l'UTC rapporté s'écarte de { $offset_s } s du temps vrai ; la position reste vraie ; le profil de C/N0 authentique est conservé

engine-nmea-synth-log-replay-delay-counterfeit-cn0 = retard de rejeu (de type meaconing) : la position{ $v1 } est en retard sur la vérité de { $delay_s } s ; chaque satellite suivi affiche { $c } dB-Hz tant que cela dure

engine-nmea-synth-log-replay-delay-genuine-cn0 = retard de rejeu (de type meaconing) : la position{ $v1 } est en retard sur la vérité de { $delay_s } s ; le profil de C/N0 authentique est conservé

engine-pvt-chart-3d-error-m = erreur 3D (m)

engine-pvt-chart-postfit-rms-m = RMS post-ajustement (m)

engine-quantum-faults-chart-title = AUC de quantum-anomaly-detect (MODELLED)

engine-quantum-faults-chart-quantum = quantique

engine-quantum-faults-chart-classical = classique

engine-quantum-nav-od-chart-title = quantum-gnss-free-nav (MODELLED)

engine-raim-stanford-chart-title = Diagramme de Stanford — intégrité ({ $n_epochs } époques, AL = { $al } m)

engine-raim-chart-title = Niveaux de protection RAIM et disponibilité ({ $availability } % de disponibilité)

engine-raim-chart-hal = HAL { $al } m

engine-raim-chart-val = VAL { $al } m

engine-receiver-trust-chart-track-caption = trajectoire rapportée par le récepteur, nord en haut

engine-receiver-trust-chart-start = début

engine-receiver-trust-chart-end-of-log = fin du journal

engine-receiver-trust-chart-no-positions = aucune position dans le journal

engine-receiver-trust-chart-score-axis = score de confiance, de 0 à 100

engine-receiver-trust-chart-legend-vessel = confiance : vert nominal (score supérieur ou égal à { $nominal }), ambre dégradé (supérieur ou égal à { $degraded }), rouge non fiable, gris en étalonnage

engine-receiver-trust-chart-legend = confiance : vert nominal, ambre dégradé, rouge non fiable, gris en étalonnage

engine-receiver-trust-chart-advisory = Logiciel à titre consultatif, et non un équipement de navigation homologué ; l'opérateur reste responsable.

engine-receiver-trust-chart-cn0-axis = C/N0 moyen, dB-Hz

engine-report-chart-title = Holdover d'horloge : erreur de synchronisation temporelle pendant une panne GNSS

engine-slot-timing-chart-aria = Erreur de temps prédite en fonction du temps écoulé depuis la dernière solution, avec la garde de créneau

engine-slot-timing-chart-time-since-fix = temps depuis la solution, de 0 à { $t }

engine-slot-timing-chart-predicted-error = erreur de temps prédite (ns) ; tirets : garde { $guard } ns

engine-slot-timing-never = jamais

engine-solar-system-chart-title = Système solaire — écliptique J2000, vue de dessus

engine-solar-system-chart-inner = Système interne (jusqu'à Mars)

engine-solar-system-chart-whole = Système entier (jusqu'à Pluton)

engine-solar-system-chart-legend = vert : VALIDATED par rapport à JPL Horizons · ambre : MODELLED · les lunes figurent dans result.json avec des trajectoires centrées sur leur parent

engine-spectrum-chart-title = Cascade spectrale en bande L

engine-spectrum-chart-multi-title = Cascade spectrale multibande

engine-spectrum-chart-frequency-mhz = fréquence (MHz)

engine-spectrum-chart-cn0-caption = C/N0 (dB-Hz) : nominal (gris) / minimum

engine-spectrum-chart-threshold = seuil { $thr }

engine-spoof-chart-title = Détection de leurrage temporel : décalage par rapport aux bornes de détection assistées par l'horloge

engine-spoof-chart-offset-ns = décalage du leurrage (ns)

engine-spoof-chart-spoof-offset = décalage du leurrage

engine-spoof-chart-quantum-bound = borne de détection quantique

engine-spoof-chart-classical-bound = borne de détection classique

engine-sweep-chart-title = { $metric } en fonction de { $parameter } (échelle { $scale })

engine-sweep-nd-chart-title = balayage { $n_dims }D de `{ $kind }` — { $n_nodes } nœuds

engine-sweep-nd-chart-axes = axes : { $axes } (forme { $shape })

engine-sweep-nd-chart-metrics = métriques : { $metrics } — grille complète en JSON

engine-sweep-nd-chart-line-title = balayage de `{ $kind }` sur { $key }

engine-sweep-nd-chart-y-title = métrique

engine-telecom-timing-max-te-ns-budget-never-exceeded = telecom-timing : max|TE| { $max_abs } ns sur { $v2 } s ; { $masks } ; budget de { $max_abs_te_ns } ns jamais dépassé (MODELLED)

engine-telecom-timing-max-te-ns-budget-exceeded-after = telecom-timing : max|TE| { $max_abs } ns sur { $v2 } s ; { $masks } ; budget de { $max_abs_te_ns } ns dépassé après { $t } s (MODELLED)

engine-telecom-timing-chart-title = Synchronisation télécom : erreur de temps, MTIE et TDEV

engine-telecom-timing-chart-y-title = |erreur de temps| (ns)

engine-telecom-timing-chart-te-caption = erreur de temps absolue par rapport aux budgets

engine-telecom-timing-chart-holdover = holdover

engine-telecom-timing-chart-time-record = temps (enregistrement de { $h } h)

engine-telecom-timing-chart-mtie-caption = MTIE (trait plein), TDEV (tirets), premier masque MTIE (gris), ns

engine-timetransfer-chart-title = Erreur de synchronisation du transfert de temps (optique et RF)

engine-timetransfer-chart-y-title = erreur de synchronisation (ps)

engine-timetransfer-chart-spec = spécification { $mm } mm = { $ps } ps

engine-timetransfer-chart-x-title = temps de mesure (s)

engine-timetransfer-chart-rf = RF : { $id }

engine-timetransfer-chart-optical = optique : { $id }

engine-timetransfer-chain-chart-title = quantum-time-transfer (MODELLED)

engine-kind-clock-description = Holdover d'horloge par rapport à la spécification ; ensemble Monte-Carlo facultatif (runs > 1).

engine-kind-inertial-description = Navigation à l'estime inertielle à 1 DOF pendant une panne GNSS.

engine-kind-orbit-description = Disponibilité GNSS + DOP à partir d'une constellation orbitale (Walker / TLE / RINEX).

engine-kind-ephemeris-description = Éphéméride et trace au sol : propage un satellite (TLE→SGP4 ou orbite analytique) et produit son état TEME/GCRS (position + vitesse), sa position ITRF/ECEF, la latitude/longitude/altitude du point sous-satellite WGS-84, ainsi que l'azimut/l'élévation/la distance de la station et la vitesse de variation de distance (Doppler) à chaque pas. Le satellite provient d'un `tle` ou d'une orbite analytique `orbit` avec son `epoch` (un `tle` l'emporte lorsque les deux sont fournis) ; avec un `tle`, un `epoch` remplace l'époque propre du TLE comme t = 0.

engine-kind-integrity-description = RAIM instantané / par séparation de solutions / ARAIM avec HPL/VPL et un diagramme de Stanford.

engine-kind-lunar-integrity-description = Passe de niveaux de protection ARAIM au pôle sud lunaire par rapport à un ensemble de relais LunaNet représentatif. sigma_ure_m expose la précision de mesure de distance du signal dans l'espace (les niveaux de protection lui sont linéairement proportionnels, de sorte que balayer ce paramètre répond à la question de la précision de mesure de distance qu'exige une limite d'alerte). Par défaut, le cas historique du pôle sud de classe LNIS.

engine-kind-lunar-time-offset-description = Dérive relativiste modélisée de l'horloge Terre–Lune (temps coordonné lunaire, LTC/TCL) : la dérive séculaire LTC−TT issue de la différence de potentiel propre et du terme cinétique de la Lune, rapportée avec la bande publiée de 56–59 µs/jour, ainsi que le décalage accumulé sur un horizon.

engine-kind-lunar-vlbi-description = Observable de délai VLBI géodésique lunaire modélisé : une ligne de base terrestre (deux stations au sol, GCRS) observe un signal à sens unique émis par une balise de surface lunaire de classe NovaMoon. Produit le délai de champ proche par différence de deux distances, sa dérive et la correction de champ proche due à la courbure du front d'onde sur une passe — recoupés avec l'observable Δ-DOR à onde plane du même code dans la limite du champ lointain, avec des dérivées partielles vérifiées par différences finies. Le chemin analytique par défaut est MODELLED et comporte les réserves de cohérence du référentiel, de mouvement polaire xp=yp=0 et d'onde plane par rapport au champ proche. Renseigner planetary_kernel_path, earth_orientation_kernel_path et moon_orientation_kernel_path exécute à la place le chemin par noyaux (DE440, MOON_PA_DE440, ITRF93 ; temps de lumière barycentriques convergés ; ajoute les dérivées partielles de la balise et de la station à l'époque), dont le délai newtonien et les dérivées partielles concordent avec les temps de lumière convergés de NAIF SPICE à { $lit_0_06 } ps et 7.4e-9 près. Non validé par rapport à des données VLBI réelles.

engine-kind-lunar-joint-od-clock-description = Estimateur par lots modélisé, conjoint et multi-technique, de détermination d'orbite lunaire + horloge sur un réseau SIMULÉ : un ajustement instantané de Gauss-Newton qui fusionne les délais VLBI géodésiques de ligne de base terrestre, les distances locales lunaires station↔satellite et les distances inter-satellites pour retrouver, ensemble, la position 3D d'une station de surface lunaire, les positions d'une petite constellation et le décalage d'horloge de chaque actif à partir d'une vérité injectée. Le résultat principal, présenté honnêtement — la VLBI rend observable la position 3D complète de la station là où les seules mesures de distance locales lunaires laissent une direction faiblement observée — est rapporté sous la forme du contraste d'erreur de station avec et sans VLBI. Récupération en boucle fermée simulée MODELLED (la vérité partage le modèle d'observation), déterministe (à graine), non validée sur données réelles ; pas de propagation par modèle de forces dans le solveur ; aucun TRL, héritage ni caution d'une agence.

engine-kind-lunar-frame-realisation-description = Réalisation modélisée du référentiel lunaire : un ajustement de datum de Helmert (similitude) à 7 paramètres — 3 translations, 3 rotations de petit angle, 1 échelle — qui rattache un ensemble estimé de coordonnées de points MCMF dérivées de données sélénographiques à un datum par moindres carrés pondérés (crate::batch_ls::gauss_newton), plus un simple lien d'orientation exprimant la petite rotation réalisée autour des axes ICRF par rapport à l'orientation du corps IAU 2015 WGCCRE. Le scénario injecte une petite transformation connue (translation ~quelques dizaines de m, rotation ~µrad, échelle ~1e-7) dans un réseau synthétique de points bien répartis, ajoute un bruit gaussien à graine, retrouve le datum et rapporte la transformation récupérée, l'erreur de récupération par paramètre par rapport à la vérité injectée et le résidu RMS post-ajustement. Auto-cohérence MODELLED — retrouve une transformation de similitude injectée (sans bruit, à la précision machine près), et non une réalisation par rapport à des données réelles de poursuite/VLBI ; déterministe (à graine) ; aucun TRL, héritage ni caution d'une agence.

engine-kind-moonlight-service-volume-description = Analyse modélisée du volume de service de navigation lunaire à partir d'une constellation en orbite lunaire ILLUSTRATIVE, de classe Moonlight/LCNS et de source publique (sans affiliation avec l'ESA) : balaie une grille sélénographique de latitude/longitude sur un horizon temporel et rapporte DOP / couverture / disponibilité (≥4 sat. ET PDOP < seuil) ainsi qu'une enveloppe généralisée de niveaux de protection ARAIM lunaires (HPL/VPL) sur le volume. La géométrie DOP RÉUTILISE le noyau VALIDATED par gnss_lib_py (crate::orbit::dop) ; le niveau de protection RÉUTILISE le mécanisme ARAIM lunaire LunaNet LNIS (crate::lunar, σ_URE≈30 m) et se réduit au niveau de protection existant du pôle sud comme cas particulier. Composition MODELLED : un ensemble de relais képlérien circulaire/elliptique (et non les véritables éphémérides LCNS/NRHO corrigées différentiellement), une Lune à rotation moyenne (sans libration ni pôle en précession). Déterministe (pure géométrie). Aucun TRL, héritage ni caution d'une agence.

engine-kind-lunar-differential-pnt-description = PNT DIFFÉRENTIEL lunaire modélisé (un analogue lunaire du DGNSS/SBAS) : une station de référence de classe NovaMoon, à un emplacement sélénographique CONNU, calcule des corrections différentielles par satellite à partir d'une constellation ILLUSTRATIVE de classe Moonlight/LCNS et de source publique (NovaMoon n'est cité que comme une CLASSE de système, sans affiliation avec l'ESA), et un utilisateur décalé de baseline_km les applique afin que les erreurs d'orbite + d'horloge en MODE COMMUN s'annulent. Le terme d'horloge s'annule EXACTEMENT (une identité algébrique) ; le terme d'orbite ne laisse que la projection de la différence de ligne de visée, qui → 0 lorsque la ligne de base → 0 (le plancher de décorrélation spatiale) et croît ≈ linéairement avec la ligne de base. Rapporte l'erreur de position 3D de l'utilisateur AVEC et SANS corrections, le facteur de réduction, la courbe erreur en fonction de la ligne de base, et un niveau de protection utilisateur qui RÉUTILISE le mécanisme SBAS DO-229E (crate::sbas) avec le résidu différentiel σ. MODELLED — identité d'annulation exacte + modèle de décorrélation au premier ordre ; non validé sur données réelles ; aucun TRL, héritage ni caution d'une agence. Déterministe s'il est à graine.

engine-kind-lunar-station-coverage-description = Couverture modélisée d'une station de référence lunaire : un balayage Monte Carlo du modèle de PNT différentiel lunaire sur une grille d'utilisateurs polaire sud et une journée d'époques. Une station de référence différentielle, sur un site connu du pôle sud, corrige une constellation indiquée (képlérienne illustrative ou éphéméride tabulée) avec une erreur de signal dans l'espace, une erreur de levé, une latence de correction et une quantification de liaison indiquées ; par point et sur la région, elle rapporte le centile de l'erreur de position corrigée et non corrigée (3D, horizontale, verticale), la disponibilité, la couverture par rapport à un seuil indiqué, les niveaux de protection DO-229E, le rayon de couverture par azimut et le bilan de liaison de correction à la station et au pire point. Ne constitue pas une affirmation sur la performance d'un système réel ; sans affiliation ni caution d'aucune agence. MODELLED.

engine-kind-lunar-interop-export-description = Export d'interopérabilité lunaire modélisé : produit le référentiel lunaire, l'échelle de temps lunaire et l'éphéméride lunaire sous des formes d'échange fondées sur CCSDS et alignées sur LunaNet/IOAG, avec aller-retour / conformité des champs. RÉUTILISE l'émetteur+analyseur CCSDS OEM 2.0 du crate (crate::oem), réétiqueté pour le contexte lunaire — l'OEM REF_FRAME porte le référentiel de corps lunaire IAU 2015 WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM l'échelle de temps lunaire (LTC / TCL / UTC), CENTER_NAME = MOON — sur un échantillon d'éphéméride illustrative de classe LCNS (positions issues de crate::lunar_service, vitesse par différence finie). Produit aussi un descripteur de temps lunaire aligné sur LunaNet/IOAG (identifiant d'échelle, dérive séculaire en µs/jour issue de crate::lunar_time, bande publiée, surface de référence) qui fait l'aller-retour via serde_json, et enveloppe les artefacts dans l'enveloppe KIF existante (crate::interchange) avec l'étiquette d'honnêteté MODELLED. Rapporte les artefacts produits, le nombre de lignes OEM, la réussite de la conformité des champs + la liste des champs présents/manquants, l'aller-retour OEM ok, l'aller-retour des métadonnées temporelles ok, et la taille KIF en octets. MODELLED — l'aller-retour déterministe + la conformité des noms de champs par rapport à CCSDS OEM publié + à la sémantique des champs LunaNet/IOAG est la référence ; pas un test certifié de conformité d'interopérabilité ; éphéméride illustrative de source publique, sans affiliation avec l'ESA ; aucun TRL, héritage ni caution d'une agence.

engine-kind-timetransfer-description = Transfert de temps/fréquence bidirectionnel optique et RF.

engine-kind-quantum-anomaly-detect-description = Détection de défauts/anomalies MODELLED pour les systèmes PNT quantiques : un catalogue de défauts étiquetés (saut de fréquence/dérive/perte d'accrochage de l'horloge ; saut de biais/perte de signal du capteur), une AUC de ROC de la statistique de détection (avec un IC bootstrap issu d'eval_stats, validé en externe) et un défaut minimal détectable à un taux de fausses alarmes fixé, le moniteur assisté par horloge quantique (bruit plus faible) détectant des défauts plus petits — sous forme de TradeEvidence honnête + représentativité. Modèle gaussien de la statistique de détection (AUC = Phi(mu/(sigma*sqrt2))) ; modélise la classe, paramètres illustratifs de source publique, aucun TRL, vol ni certification.

engine-kind-quantum-gnss-free-nav-description = Navigation quantique sans GNSS MODELLED : pendant une panne GNSS, un budget inertiel quantique (interféromètre à atomes froids) par rapport à une centrale inertielle classique de qualité navigation — croissance de l'erreur de position pendant l'inertie, holdover jusqu'à un seuil de position, et compromis quantique/classique sous forme de TradeEvidence honnête avec représentativité. Remarque honnête sur l'observabilité : sans solution externe, le biais de l'accéléromètre est inobservable et l'erreur croît ; le capteur quantique ralentit cet écart sans le combler. Paramètres de dispositif illustratifs de source publique ; modélise la classe, aucun TRL, vol ni certification.

engine-kind-quantum-time-transfer-description = Chaîne de synchronisation quantique de confiance MODELLED : un budget de transfert de temps de bout en bout quantique (horloge à réseau optique + liaison à intrication/photon unique) par rapport à un budget classique (CSAC + bidirectionnel RF), un niveau de protection temporel réutilisé + un indicateur de sécurité contre les attaques par retard/rejeu (1-P_md), une probabilité de détection d'anomalie d'horloge + une latence CUSUM, et le compromis quantique/classique sous forme de TradeEvidence honnête avec un enregistrement de représentativité + des écarts à combler pour le vol. Paramètres de dispositif/liaison illustratifs de source publique ; modélise la classe, aucun TRL, vol ni certification revendiqués.

engine-kind-hybrid-description = Pièce maîtresse du PNT hybride : horloge + IMU + aide du transfert de temps.

engine-kind-fusion-description = PNT par fusion de capteurs de Kalman conjointe sur les mêmes entrées hybrides.

engine-kind-hybrid-ukf-description = UKF GNSS/INS hybride quantique+classique à couplage serré à 17 états (MODELLED) : 15 états d'erreur INS + correction de biais d'accéléromètre issue du CAI + une horloge à 2 états (phase+fréquence) issue du moteur d'horloge à paramètres q, pilotée par le modèle d'erreur CAI encadré. Le critère de mérite est l'auto-cohérence du filtre (NEES + blancheur de l'innovation par rapport aux bornes χ²) — une affirmation d'auto-cohérence, et non une garantie d'exactitude en conditions réelles. Simulation seulement ; pas de TRL>3, pas d'héritage de vol, pas de validation externe.

engine-kind-gnss-ins-description = EKF à états d'erreur GNSS/INS à couplage lâche et serré.

engine-kind-gnss-sim-description = Simulation de pseudodistances dans le domaine des mesures (iono Klobuchar, tropo Saastamoinen/Niell) + RAIM.

engine-kind-jamming-description = Brouillage par bilan de liaison : J/S → C/N₀ effectif → perte d'accrochage.

engine-kind-spoof-description = Détecteur stochastique de leurrage temporel (Neyman–Pearson / χ²₁) avec P_fa/P_md Monte-Carlo.

engine-kind-spoof-detect-description = Détecteur de leurrage combiné RF/mesures (cohérence RAIM multi-SV + AGC + SQM, fusionnés) par rapport à une attaque paramétrée (avantage de puissance, alignement de phase de porteuse, poussée en temps/position ; de type TEXBAT).

engine-kind-sweep-description = Balayage d'étude de compromis à 1 dimension sur un paramètre d'un paquet d'horloge.

engine-kind-sweep-nd-description = Balayage générique à N dimensions sur n'importe quel paquet via des clés TOML à points / des chemins de métriques JSON.

engine-kind-gravity-map-description = Navigation par appariement de carte de gravité sans GPS : un gravimètre à atomes froids retrouve une dérive INS constante à partir de la séquence d'anomalies de gravité qu'il traverse.

engine-kind-terrain-nav-description = Navigation par référence au terrain sans GPS (TERCOM/SITAN) : un altimètre radar/baro compare le profil d'élévation du sol à un MNT de type SRTM pour retrouver la dérive INS.

engine-kind-terrain-slam-description = Navigation séquentielle (récursive) par référence au terrain sans GPS : un filtre à particules exécute le modèle de mesure d'appariement au terrain époque par époque (SITAN en filtre continu), de sorte qu'une dérive INS variable dans le temps est suivie le long de la trajectoire, là où le terrain-nav par lots ne retrouve qu'un unique décalage constant.

engine-kind-combined-altpnt-description = Navigateur combiné gravité + magnétisme + terrain sans GPS : trois canaux de champ scalaire fusionnés à chaque point de passage pour une correction de dérive plus nette (CRLB plus bas) que n'importe quel champ seul.

engine-kind-pvt-description = Positionnement ponctuel sur observations réelles : calcule la position d'un récepteur à partir d'un fichier d'observation RINEX 3 et d'un fichier de navigation diffusé (pseudodistances de code, éphémérides diffusées, iono Klobuchar, tropo Saastamoinen/Niell), éventuellement validé par rapport à une coordonnée relevée.

engine-kind-mars-pnt-description = PNT martien en espace lointain : une constellation de relais MARCONI simulée (relais aréostationnaires + inclinés diffusant en sens unique + relayant en bidirectionnel vers une station d'espace lointain) fait naviguer un utilisateur de référence (transfer | lmo | surface) grâce à l'estimateur de fusion radiométrique conjoint sens unique/bidirectionnel. Rapporte la géométrie/visibilité par époque, le RMS obtenu par rapport à la vérité et la covariance formelle (position 1σ / 3σ) — un critère de mérite simulé honnête, et non un niveau de protection certifié.

engine-kind-impairment-eval-description = Banc d'essai d'évaluation de détection de perturbations RF par IA/ML (13494) : génère un corpus SYNTHÉTIQUE étiqueté et fondé sur des paramètres (nominal/brouillage/leurrage-temps/leurrage-position/trajets multiples), note un détecteur (energy|agc|sqm|parity|fused) avec le banc indépendant du détecteur, et rapporte AUC/ROC/matrice de confusion + Pd par classe à une Pfa cible, ainsi que l'écart d'optimisme entre distribution d'apprentissage et hors distribution. Caractéristiques de fonctionnement MODELLED seulement — jamais de données terrain/IQ, aucun verdict bon/mauvais.

engine-kind-quantum-trade-description = Compromis PNT quantique/classique (13503) : bénéfice de holdover de synchronisation + de holdover inertiel d'une horloge candidate (une courbe d'ADEV mesurée — le point d'appui de la défendabilité — ou une classe d'horloge quantique) par rapport à une classe de référence de base classique, avec la réserve sur l'hypothèse de plancher à long tau portée par l'artefact, ainsi qu'une enveloppe de résilience en fonction du temps sans GNSS. MODELLED ; quantifie (sans jamais valider) un dispositif partenaire. L'horloge candidate est une courbe mesurée (`candidate_adev_taus` + `candidate_adev_values`, de même longueur, au moins 2 points ; elle l'emporte lorsque les deux formes sont fournies) ou une `candidate_clock_class`.

engine-kind-space-weather-description = Modèle d'environnement météorologique spatial : indices d'activité solaire (F10.7/F10.7a) et géomagnétique (Kp, avec la table définitionnelle Kp↔ap), la température exosphérique de Jacchia-1971 qu'ils pilotent (validée par rapport aux minimum/moyenne/maximum solaires publiés), et la densité neutre thermosphérique de Jacchia-1971 à la température exosphérique moyenne diurne par rapport au profil statique sans activité à un ensemble d'altitudes — la dépendance de la densité au cycle solaire que l'atmosphère statique omet. MODELLED : la densité concorde avec les densités dérivées d'accéléromètres (TOLEOS CHAMP et GRACE) à un facteur 2 près au maximum solaire mais est trop dense d'environ { $lit_1_7 }x au minimum solaire de 2008.

engine-kind-oem-interop-description = Pont d'interopérabilité CCSDS OEM : importe un message d'éphéméride orbitale produit par un outil externe de dynamique du vol (GMAT/Orekit/STK émettent tous de l'OEM) et rapporte ses segments/objets/référentiels/étendue d'époques ainsi qu'un contrôle de cohérence des vitesses ; sans entrée, il fait l'aller-retour d'une orbite de référence générée et rapporte la fidélité import↔export. Contrôle d'ingestion structurel/physique MODELLED, et non une validation de la précision orbitale de la source.

engine-kind-launch-window-description = Géométrie de lancement et d'ascension à deux corps : azimut(s) de lancement (sin Az = cos i / cos lat), inclinaison minimale atteignable, vitesse circulaire, bonus de rotation terrestre vers l'est, Δv de changement de plan en dogleg lorsque l'inclinaison cible est inférieure à la latitude du site, et nombre d'opportunités de lancement quotidiennes. Géométrie MODELLED à Terre sphérique (sans correction du triangle des vitesses de la Terre en rotation, sans modèle de pertes d'ascension/traînée).

engine-kind-reentry-description = Corridor de rentrée balistique d'Allen-Eggers : décélération maximale (indépendante du coefficient balistique, V_e^2 sin|γ|/(2eH)), vitesse et altitude au pic de g, et vitesse de pic d'échauffement, pour une vitesse d'entrée/un angle de trajectoire/un coefficient balistique à travers une atmosphère exponentielle, ainsi qu'une intégration planaire de masse ponctuelle de la même entrée balistique avec la gravité, la courbure de la Terre et l'US Standard Atmosphere 1976 (décélération maximale, vitesse, altitude et temps au pic). Entrée balistique (sans portance) MODELLED ; la sortie d'échauffement est la VITESSE de pic d'échauffement, et non un flux thermique (pas de modèle aérothermique/TPS).

engine-kind-eo-coverage-description = Empreinte de charge utile d'observation de la Terre et géométrie de couverture (triangle spatial SMAD) : rayon angulaire de la Terre, largeur de fauchée, distance d'échantillonnage au sol au nadir, accès maximal hors nadir, période circulaire, période nodale J2 et espacement des traces au sol équatoriales avec un indicateur de couverture contiguë, pour une altitude d'orbite, une inclinaison (héliosynchrone par défaut) et un FOV/IFOV de capteur. Géométrie MODELLED à Terre sphérique (sans radiométrie/MTF/atmosphère/gigue/reflet spéculaire) ; espacement des nœuds R_e·(ω − Ω̇)·T_nodal avec des dérives séculaires J2 au premier ordre.

engine-kind-space-packet-description = Cadrage CCSDS 133.0-B Space Packet Protocol : encode un flux synthétique de paquets TM/TC (en-tête primaire de 6 octets + champ de données) et rapporte le décodage d'en-tête par paquet, le total d'octets et un aller-retour exact encodage↔décodage. Cadrage déterministe à disposition exacte des bits — la couche d'interopérabilité des formats de paquets des agences ; pas une certification de conformité (pas de logique d'en-tête secondaire/CRC/segmentation au-delà des indicateurs).

engine-kind-attitude-budget-description = Budget d'erreur d'attitude et de pointage à 3 DOF : couple perturbateur de gradient de gravité au pire cas ((3/2)(μ/R³)ΔI) et budget d'erreur de pointage en somme quadratique sur des contributeurs 1σ nommés (bruit de capteur, gigue de roue à réaction, thermique, alignement) avec le terme dominant, pour une altitude d'orbite + une dispersion d'inertie du corps. Budget AOCS scalaire MODELLED — un complément avant matériel à Basilisk/42, et non une simulation de boucle de commande/6-DoF/modes flexibles.

engine-kind-passes-description = Prédiction de passages de station au sol : les passages de visibilité dans le domaine temporel (AOS/TCA/LOS, élévation apparente maximale, durée) d'une orbite circulaire, sous forme d'éléments moyens SGP4 au début de la fenêtre, au-dessus d'une station au-delà d'un masque d'élévation sur une fenêtre, avec le temps d'accès total. Propagation SGP4/SDP4 sur le référentiel terrestre IAU 2006/2000A (UT1 - UTC et mouvement polaire facultatifs), réfraction troposphérique ITU-R P.834-9 et temps de lumière de la liaison descendante (tous deux actifs par défaut), franchissements résolus à 1e-7 s près et culmination par recherche de la section d'or. La géométrie de passage est VALIDATED par rapport à Orekit 13.1.8 pour des stations au niveau de la mer ; l'orbite et la station du scénario sont des entrées illustratives.

engine-kind-link-budget-description = Bilan de liaison à sens unique selon l'équation de liaison CCSDS 401 / DSN 810-005 : affaiblissement en espace libre, C/N₀, Eb/N₀, marge et fermeture pour une PIRE d'émission, un G/T de réception, une distance, un débit et une bande (s|x|ka) par rapport à un Eb/N₀ requis. Un calcul d'ingénierie déterministe à partir des entrées fournies (et non la fiche technique d'un terminal étalonné).

engine-kind-lunar-time-budget-description = Budget d'erreur de temps de bout en bout du Temps lunaire coordonné (LTC) MODELLED : les sept termes d'erreur du LTC assemblés sous forme de courbes d'erreur de temps x_i(τ) sur toute une grille de temps de moyennage, sommés quadratiquement en x_Σ(τ), et le τ de CROISEMENT horloge/référentiel auquel le terme d'horloge croissant dépasse le terme constant de réalisation du référentiel en temps réel (en dessous, le budget est limité par le référentiel ; au-dessus, par l'horloge) — la réponse honnête à l'artefact à τ unique. Les pentes en τ sont en forme close et vérifiables analytiquement (horloge τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+1{ "}" }, planchers τ^0, mesure τ^{ "{" }-1/2{ "}" }) et les lignes d'horloge reproduisent les spécifications d'horloge à un jour publiées (crate::clock_specs) ; les ORDRES DE GRANDEUR des planchers de liaison RF/optique, de réalisation du référentiel, de résidu relativiste et d'éphéméride sont des allocations de budget modélisées (valeurs par défaut documentées, remplaçables par l'appelant), et non des mesures. L'apport est le τ de croisement reproductible, et non un chiffre certifié par terme ; non certifié pour la tenue du temps opérationnelle.

engine-kind-hybrid-optical-rf-description = Critère de mérite conjoint PNT hétérogène optique + RF MODELLED (P5) : compose le bilan de liaison optique bidirectionnel à 1550 nm (CRLB de télémétrie bidirectionnelle limitée par les photons σ_τ/√N et empreinte de diffraction λ/D·distance), un niveau de protection RAIM par séparation de solutions inter-modalités (position ET temps) qui fusionne les solutions RF lâche et optique serrée avec des covariances disparates, la disponibilité optique par ciel dégagé de N stations (union indépendante 1−Π(1−a_i) et variante corrélée spatialement), un transfert d'état/covariance optique↔RF avec une moyenne PROUVÉE continue au bit près (sans saut) et un critère de cohérence NEES χ², ainsi qu'un score conjoint P(disponible ET de précision requise ET intégrité assurée) avec traitement des corrélations. Forme close VALIDATED : le CRLB de télémétrie, l'empreinte de diffraction, le quantile du niveau de protection χ², la combinatoire de l'union, la continuité de la moyenne du transfert + le critère NEES, et le produit indépendant conjoint. MODELLED : les allocations de pertes optiques, les ordres de grandeur de σ RF/optique, les entrées de climatologie nuageuse, les corrélations et le budget P_HMI. Pas un produit de disponibilité/intégrité certifié.

engine-kind-cislunar-observability-description = Observabilité MODELLED d'une constellation cislunaire planaire (P6) : suit une constellation planaire de quatre engins en DRO corrigée différentiellement avec télémétrie inter-satellites et rapporte la part des quatre états [x,y,ẋ,ẏ] d'un engin que l'arc rend observable. Produit (1) la table rang en fonction de la longueur d'arc pour une seule liaison de distance seule — instantanément de rang 1, croissant vers les quatre états complets à mesure que l'arc s'allonge (P6 Table 1) ; (2) le spectre de valeurs propres du gramien d'observabilité + le conditionnement sur l'arc ; (3) la comparaison de rang instantané distance seule contre distance+vitesse de variation de distance (le levier de conception Doppler) ainsi que le rapport de GDOP singulier en distance seule / défini avec distance+vitesse ; et (4) une validation croisée SRIF indépendante dont la covariance a posteriori devient finie / bien conditionnée exactement à l'arc où le rang observable atteint quatre. Noyau VALIDATED : le rang observable est un seuil de valeurs singulières révélateur du rang, recoupé avec le rang propre du gramien ; le spectre de valeurs propres obéit aux invariants spectraux (trace=Σλ, det=Πλ, Frobenius²=Σλ²) ; la STM variationnelle est la STM CR3BP validée par différences finies ; les lignes jacobiennes de distance/vitesse de variation de distance sont des dérivées partielles analytiques validées par différences finies (recoupées avec l'observable de vitesse de variation de distance 3D du crate) ; les quatre conditions initiales sont des DRO planaires corrigées différentiellement qui se referment à un résidu de périodicité serré et sont rétrogrades ; la transition de rang est validée de façon croisée avec le filtre d'information en racine carrée du crate (covariance a posteriori finie exactement à rang plein, cond(P)=cond(OᵀO)) ; un instantané de rang déficient est signalé GDOP indéfini (condition fim=inf), jamais une fausse valeur finie — la même garde de géométrie singulière que pvt::solve_spp applique. MODELLED : la conception de la constellation (amplitudes et phases de périlune des DRO) et la progression de rang précise qu'elle produit. Pas un produit de performance de navigation certifié.

engine-kind-conflict-resilience-description = Résilience en conflit d'un PNT en couches MODELLED (P7) : un utilisateur en environnement contesté dispose de plusieurs couches PNT (GNSS de service ouvert, GNSS large bande, une constellation authentifiée, un relais d'augmentation), chacune avec une disponibilité de base, une exactitude 1σ et une vulnérabilité au déni par vecteur face à la menace partagée de brouillage/leurrage. Un Monte-Carlo À GRAINE balayé en intensité refuse chaque couche avec la probabilité clamp(vulnérabilité·intensité·poids_du_vecteur,0,1), fusionne les survivantes par la règle de forme close à variance inverse σ_fused=(Σ 1/σ_i²)^(−1/2), et rapporte la probabilité de perte totale (toutes les couches refusées), l'erreur fusionnée médiane et les statistiques d'utilisabilité/de déni par couche en fonction de l'intensité. Le rapport de résilience principal (probabilité de perte totale d'une couche seule contre en couches) atteint environ 7x sous l'hypothèse d'INDÉPENDANCE ; un balayage de déni corrélé par copule gaussienne à un facteur montre alors cet environ 7x s'effondrer vers 1 à mesure que la corrélation du déni augmente (la corrélation défait la mise en couches). Un bloc de sensibilité aux a priori fait varier le résultat principal sur les a priori de vulnérabilité DOCUMENTÉS au moyen du tornado mcda + d'une réallocation Dirichlet de l'effort de menace + d'IC par centiles. Noyau VALIDATED : la perte totale Monte-Carlo converge vers le produit indépendant en forme close Π_i p_deny_i (dans l'erreur standard MC à graine fixée et N grand) ; la fusion à variance inverse est une identité en forme close ; à ρ=0 la copule se réduit au modèle indépendant et tout ρ préserve le taux de déni marginal de chaque couche. MODELLED : les ordres de grandeur de vulnérabilité/disponibilité/exactitude par couche sont des entrées documentées mais Modelled (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — voir conflict_threat_params), et l'ordre de grandeur précis d'environ 7x ainsi que la forme de la courbe rapport/corrélation découlent de cette paramétrisation. Une ventilation de survie par vecteur du §4.2 résout ensuite la menace RF partagée en quatre vecteurs nommés (brouillage/leurrage/cinétique/cyber) et rapporte la courbe de dégradation progressive du PNT utilisable de chaque vecteur S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED : le Monte-Carlo par couche à graine converge vers cette forme close ; le brouillage est le vecteur le plus aigu pour la référence de base RF corrélée et la couche inertielle insensible aux RF est la survivante décisive. Pas un produit de disponibilité de navigation certifié.

engine-kind-lunar-attack-surface-description = Surface d'attaque de sécurité des signaux de navigation en surface lunaire (P1) : compose les analyses ouvertes de sécurité des signaux en une seule exécution accessible par binaire. Rapporte (1) la puissance reçue de l'AFS et son SURPLUS de puissance par rapport à une référence GPS terrestre, ainsi que la bande de sensibilité de 12-18 dB sous forme de véritable balayage multi-axe sur les entrées de liaison (niveau de référence x PIRE x distance oblique) avec la réconciliation des facteurs linéaires arrondi 25x / non arrondi 28x. RÉVISÉ (règle R4) : cela rapportait un DÉFICIT de puissance de { $lit_15_6 } dB et un facteur 32x/36x jusqu'à ce que la référence GPS soit corrigée de -125 / -{ $lit_128_5 } (qui sont les valeurs en dBm) à -155 / -{ $lit_158_5 } dBW, les valeurs ICD-GPS-200 que le module de brouillage a toujours portées. Le signe s'inverse : le signal AFS lunaire modélisé est plus fort de { $lit_14_4 } dB que le GPS terrestre L1 C/A, et non plus faible. La puissance reçue elle-même n'a pas bougé d'un bit, et le facteur linéaire est l'ancien divisé par exactement 1000, ce qui est exactement le décalage de 30 dB entre dBm et dBW ; (2) la puissance d'émission requise de l'attaquant pour leurrer (J/S = 3 dB) et pour refuser (J/S = 30 dB) à chaque distance d'éloignement, l'inverse de la liaison J/S ; (3) l'empreinte de capture orbitale sous un vrai diagramme d'antenne à ouverture uniforme (Airy [2 J1(x)/x]^2), une calotte sous-hémisphérique limitée en altitude dont le limbe n'est PAS capturé ; (4) un résultat calculé d'accrochage de leurrage par boucle de poursuite (un leurreur à code apparié, avec un avantage de puissance et un décalage de code donnés, entraîne-t-il réellement la DLL/PLL) plutôt que le seuil de 3 dB affirmé ; (5) la portée d'horizon géométrique d'un émetteur de surface surélevé sur un corps sans atmosphère ; et (6) le budget d'authentification OSNMA/TESLA (surcharge de 20 bit/s = ~40 % d'un message de navigation AFS à 50 bit/s, latence de divulgation de clé, falsification 2^-40). Un corps vide reproduit la référence de base P1 ; chaque entrée a une valeur par défaut et peut être remplacée. Les sous-résultats VALIDATED portent la référence indépendante de leur module source (radiométrie en dB en forme close ; aller-retour de la J/S inverse ; diagramme d'Airy par rapport au Bessel A&S et à la géométrie de la calotte sphérique ; accrochage DLL/PLL par rapport à Kaplan & Hegarty ; identité de l'horizon tangent sphérique par rapport à eo_payload ; dimensionnement des champs de l'ICD SIS OSNMA). MODELLED : les ordres de grandeur représentatifs de géométrie/puissance et les valeurs précises des cellules de la carte de capture. Pas un produit de sécurité certifié.

engine-kind-realtime-frame-eop-description = Budget de prédiction du référentiel lunaire / de l'orientation de la Terre en temps réel : P4 Table 1 (le contrôle de cohérence de l'erreur de référentiel — post-traité ~{ $lit_0_27 } m ↔ ~{ $lit_0_010 } ms et temps réel ~15 m ↔ ~{ $lit_0_5 } ms, chaque position de référentiel exprimée par son erreur UT1 équivalente via le bras de levier L19 Δr = D_EM·ω⊕·ΔUT1) et Table 2 (erreur de prédiction UT1 mesurée en fonction de l'horizon — la courbe L18 lue directement sur la série réelle IERS finals2000A : le plancher final Bulletin A − Bulletin B et l'erreur du prédicteur de persistance sur plusieurs jours, chacun reporté sur une position dans le référentiel de la Lune par L19), ainsi que le budget L21 d'erreur de référentiel en temps réel en somme quadratique (EOP + éphéméride + plancher de réalisation). Forme close VALIDATED (le bras de levier L19, ω⊕ recoupé avec l'angle de rotation de la Terre CIO) et données réelles VALIDATED (la courbe L18 lue sur les lignes réelles de finals2000A) ; sont MODELLED les ordres de grandeur de covariance d'OD du relais lunaire et le plancher de réalisation du référentiel (allocations représentatives) ainsi que le prédicteur de persistance (et non l'algorithme opérationnel du Bulletin A de l'IERS). Pas un produit de référentiel en temps réel certifié.

engine-kind-aperture-duty-cycle-description = Rapport cyclique d'ouverture : le partage du temps entre navigation et communications qu'implique un plan de contacts pour un ensemble d'ouvertures orientables. Prend un plan de contacts (une liste de fenêtres `[[contacts]]` aos_s/los_s, chacune demandant de la navigation ou des communications — le même vocabulaire aos_s/los_s qu'émet le prédicteur `passes`), un nombre d'ouvertures et une POLITIQUE D'ARBITRAGE (priorité navigation par défaut, ou priorité communications, ou premier arrivé premier servi sans préemption), et rapporte le rapport cyclique de navigation, le rapport cyclique de communications, le rapport cyclique d'inactivité et l'interruption par session — le temps de contact qu'une session a demandé et qu'aucune ouverture n'a servi. Un balayage d'intervalles exact sur les bornes des fenêtres, de sorte que des fenêtres contiguës n'entrent jamais en conflit et qu'aucune seconde d'ouverture n'est comptée deux fois ; les secondes d'ouverture de navigation, de communications et d'inactivité sont cumulées indépendamment et se referment sur apertures*horizon_s. Le rapport indique la politique résolue, sa définition complète, ainsi que les définitions du rapport cyclique et de l'interruption, car un rapport cyclique cité sans sa politique d'arbitrage n'est pas reproductible. Arithmétique d'ordonnancement MODELLED : aucun temps de pointage / réaccord / changement n'est imputé lorsqu'une ouverture change de service ou de session, aucun volume de données, état de tampon, budget d'énergie ou fermeture de liaison n'entre dans la décision, et les fenêtres de contact sont des entrées — leur géométrie est celle de ce qui les a produites. Pas un produit d'ordonnancement de segment sol.

engine-kind-lunar-jamming-description = Brouillage RF natif lunaire : rapport brouilleur/signal par satellite, C/N₀ effectif et perte d'accrochage pour un utilisateur de surface sélénographique sous un brouilleur de surface lunaire (ou surélevé), sur la constellation illustrative en orbite lunaire de classe Moonlight/LCNS et de source publique. Compose la physique ouverte de brouillage existante (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) avec la géométrie du ciel lunaire existante (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf) ; aucune géométrie ni radiométrie n'est redérivée. Contrairement au type `jamming` terrestre, la branche du signal n'est PAS une puissance reçue fixe : la puissance isotrope reçue de chaque satellite est son propre bilan de liaison PIRE − FSPL(distance oblique), de sorte que la J/S varie d'un satellite à l'autre avec la distance et l'élévation lunaires. Rapporte UNE LIGNE PAR LIAISON (époque, satellite) VISIBLE — azimut, élévation, distance oblique, les deux puissances reçues dont la J/S est la différence, la J/S, le C/N₀ nominal et effectif et l'état d'accrochage — ainsi que des critères de mérite agrégés à côté de (et jamais à la place de) cette table, et la même table sous forme d'artefact CSV. Chaque champ numérique émis porte une unité et une classe de provenance. Les sous-résultats VALIDATED portent la référence indépendante de leur module source (l'équation anti-brouillage et la liaison J/S de Kaplan & Hegarty §9.4, référencées en externe dans tests/gnss_denied_jamming_resilience_reference.rs ; la géométrie lunaire de lunar_service). La composition elle-même est recoupée avec un chemin indépendant à deux bilans de liaison (linkbudget::received_signal_power_dbw, une expression d'affaiblissement en espace libre différente) à 1e-9 dB près. MODELLED : la constellation illustrative, la PIRE / puissance du brouilleur / gains d'antenne / température de bruit représentatifs, et l'absence d'ombrage du terrain, de trajets multiples, de dynamique de l'AGC et d'annulation adaptative. Pas un produit certifié de déni de service. Lorsqu'un brouilleur est configuré, le rapport porte aussi un CONTOUR DE DÉNI AVEC BANDE D'INCERTITUDE plutôt qu'un contour lu sur un seul scalaire : la distribution complète mesurée du C/N₀ du signal utile sur la table par satellite (n, min, p05, p25, médiane, p75, p95, max, moyenne, écart type d'échantillon, et l'asymétrie propre de l'échantillon), et le contour évalué à chacune de ces statistiques d'ordre selon LES DEUX critères de déni que le moteur reconnaît — celui en place fondé sur le rapport de puissance (J/S = 30 dB, comme dans attack-surface et tracking-loop) et celui de perte d'accrochage (C/N₀ effectif tombant à tracking_threshold_dbhz, le critère qu'utilise la colonne d'état de ce rapport) — sur les deux axes du plan de déni (PIRE de brouilleur requise à la distance d'éloignement du scénario, distance d'éloignement de déni à la PIRE du scénario). Les bords de la bande SONT contour(p05) et contour(p95), la même application en forme close appliquée aux propres quantiles de l'échantillon : ni un sigma ajusté à l'échantillon ni médiane ± k·écart type, l'écart type étant émis par continuité et n'étant utilisé par rien. Un quantile déjà au niveau du seuil de poursuite ou en dessous n'a aucune J/S de déni finie et ses colonnes de perte d'accrochage sont nulles avec une raison comptée, jamais un rayon borné.

engine-kind-ins-trn-coast-description = Modèle d'erreur de dérive INS/TRN : erreur de position en fonction de la durée de dérive, construite à partir des coefficients de l'IMU plutôt que balayée comme un taux de dérive supposé. Cinq contributions de croissance — biais d'accéléromètre, inclinaison due au biais de gyroscope via la gravité, marche aléatoire de vitesse, marche aléatoire d'angle et facteur d'échelle en fonction de la distance parcourue — chacune propagée dans un modèle d'erreur inertielle à neuf états en repère local avec rétroaction de Schuler à une latitude et une hauteur indiquées (les lois d'ordre dominant à dérive courte t², t³, t^1.5, t^2.5 et t¹/t² sont rapportées à côté) et combinées selon une règle INDIQUÉE (somme quadratique par défaut, ou somme linéaire, ou somme déterministe avec somme quadratique stochastique ; les trois sont calculées à chaque exécution afin que le choix soit visible plutôt qu'enfoui). Les durées de dérive atteignant les seuils de position fournis par l'appelant (10 m et 50 m par défaut) sont localisées par la bissection existante du moteur, chacune avec une ventilation par contribution nommant la source dominante, et le franchissement de chaque contribution prise seule est en outre inversé algébriquement afin que les deux concordent. Un mode de navigation par référence au terrain borne la dérive par des corrections de position périodiques et rapporte le plus grand intervalle de correction qui respecte chaque seuil ; une correction de position seule laisse subsister l'erreur de vitesse et l'inclinaison au travers de la correction, de sorte qu'elle ne borne pas toujours la dérive, quelle que soit la cadence de correction, et le rapport le dit plutôt que de renvoyer un zéro. MODELLED : les coefficients de classe de l'IMU sont des valeurs représentatives de bande, et non une fiche technique, et le résidu de correction par le terrain est une entrée. Un seuil non atteint est rapporté comme nul avec un état, jamais comme un zéro. Pas un produit de performance de navigation inertielle certifié.

engine-kind-lunar-vlbi-fim-description = Covariance des coordonnées de station en VLBI lunaire : les dérivées partielles du délai de l'observable lunar-vlbi accumulées sur un PLANNING explicite (lignes de base x époques) dans une matrice d'information de Fisher, inversée, et rapportées comme la covariance des coordonnées de station et le sigma de station par coordonnée — une sortie calculée du moteur plutôt qu'une précision scalaire de délai poussée à travers un facteur d'équipartition isotrope supposé g = 3. L'état porte des coordonnées de station LIÉES À LA TERRE (ITRS), de sorte que le jacobien est la dérivée partielle inertielle tournée par la matrice GCRS->ITRS de chaque époque : c'est la rotation de la Terre qui rend ces coordonnées observables, et le rapport MESURE le balayage de la ligne de visée dans le repère terrestre et la déclinaison de la balise plutôt que de les supposer. Une observation est une paire (ligne de base, époque) avec LES DEUX stations au-dessus du masque d'élévation, pondérée 1/delay_sigma_s^2. Rapporte à chaque exécution le rang, le défaut de datum, le conditionnement, le spectre d'information complet, la matrice de covariance, les sigmas par station, par axe et 3D, ainsi que l'espace nul du réseau libre ; en cas de déficience de rang, le sigma principal est publié comme NULL avec un état, jamais lu dans une inverse quasi singulière. La valeur d'équipartition c*delay_sigma_s*sqrt(g/N) pour le MÊME planning est émise à côté de la valeur calculée avec le rapport, ainsi que la borne de trace isotrope sqrt(p/trace(M)) que l'inégalité AM-HM transforme en plancher strict — de sorte que le rapport est l'anisotropie que l'hypothèse écartait. La fermeture de délai tau_ik = tau_ij + tau_jk ne rend géométriquement indépendantes que n-1 des n(n-1)/2 lignes de base ; le rapport indique les deux nombres. MODELLED : l'éphéméride du centre de la Lune, les horloges de station, la troposphère et les paramètres d'orientation de la Terre sont maintenus FIXES et les observations sont traitées comme indépendantes, de sorte que la covariance est une borne de Cramer-Rao pour un jeu réduit de paramètres, et non un résultat de session prédit ; le sigma de délai, les coordonnées de station et le planning sont des entrées. La dérivée partielle que le jacobien du délai géométrique omet (le terme de Shapiro différencié) est mesurée par différence finie et émise. Pas un produit géodésique.

engine-kind-tracking-loop-description = Perte d'accrochage de boucle de poursuite : C/N0 -> accrochage/décrochage AVEC HYSTÉRÉSIS, temps mis pour perdre l'accrochage, et accrochage du leurrage en fonction de la VITESSE de décalage de code et de porteuse. Les critères existants de déni et de capture du moteur sont des rapports de puissance reçue (un brouilleur refuse à J/S = 30 dB, un leurreur capture à 3 dB) ; la perte d'accrochage réelle n'est pas un rapport de puissance, c'est l'endroit où la gigue d'une boucle plus la contrainte dynamique sortent de son budget de seuil de poursuite. Rapporte (1) la gigue thermique 1-sigma de porteuse (Costas) et de code (précoce/tardif non cohérent) en fonction de C/N0, perte de quadrature incluse, par rapport aux règles indiquées 3*sigma_PLL + theta_e <= 45 deg (la règle des 15 degrés sous forme à trois sigmas) et 3*sigma_DLL + retard de rampe <= d/2 chips ; (2) les seuils de C/N0 de décrochage et de raccrochage avec la boucle contraignante nommée, le seuil de raccrochage DÉDUIT de la bande plus large à laquelle un récepteur se réaccroche plutôt qu'affirmé, de sorte que la largeur d'hystérésis doit se situer entre 5*log10(rapport) et 10*log10(rapport) dB ; (3) le temps déclaré pour perdre l'accrochage d'un détecteur d'accrochage à deux seuils avec des durées de confirmation, piloté sur une rampe de C/N0, rapporté séparément du temps physique d'échappement de phase (le temps moyen de Viterbi entre sauts de cycle, en log10 s car il s'étend sur des centaines de décades) ; (4) les limites d'accrochage du leurrage — la plus grande dérive de code et la plus grande vitesse Doppler de porteuse que peuvent suivre les boucles d'une victime, avec une carte sur les deux axes, car un leurreur qui dérive plus vite que cela ne capture pas la boucle, il la distance ; et (5) le RAYON DE DÉNI qu'impliquent les dynamiques de boucle, rapporté À CÔTÉ du rayon existant fondé sur le rapport de puissance, jamais à sa place, avec leur différence signée comme champ nommé à part (denial_radius_delta_km) et une définition à côté. Chaque champ numérique émis porte une unité et une classe de provenance. Formes closes VALIDATED : les expressions de gigue de porteuse et de code, la réduction du filtre de boucle sqrt(2*B_n*T) et le retard de rampe du premier ordre sont recoupées avec le corrélateur sdr propre au moteur, avancé pas à pas sur une FI synthétique à graine — un autre chemin vers les mêmes nombres — à { $lit_0_6 } %, { $lit_3_7 } % et { $lit_0_17 } % respectivement, et le Bessel modifié I0 sous-jacent au temps de saut de cycle avec les valeurs tabulées standard à 1e-7 près. La limite inférieure de validité est affirmée et pas seulement énoncée : en dessous d'environ 32 dB-Hz à 1 ms, le véritable discriminateur atan sature contre sa plage de +-pi/2 et mesure moins de gigue que n'importe quelle théorie linéaire. MODELLED : les bandes de boucle, le temps d'intégration, l'espacement des corrélateurs, le rapport de bande d'accrochage, les durées de confirmation, la puissance du brouilleur et les gains d'antenne sont des valeurs représentatives de bande, et non une fiche technique. Non modélisés : la gigue d'oscillateur (déviation d'Allan) et de vibration, la limitation de bande de l'étage d'entrée, les trajets multiples, la dynamique de l'AGC, la perte due aux transitions de bits de données, l'aide externe et toute correction d'un demi-cycle à la formule de saut de cycle de Costas. Sous dynamique de boucle, la capture par leurrage n'a aucun rayon — la contrainte déterminante est la vitesse de décalage, et non la puissance — de sorte que ce champ est nul avec une raison plutôt qu'un nombre fabriqué. Pas un produit de performance de récepteur certifié.

engine-kind-araim-reference-check-description = Vecteurs de référence ARAIM publiés : les niveaux de protection horizontal et vertical ARAIM du moteur exécutés sur les PROPRES exemples numériques détaillés du sous-groupe technique ARAIM du WG-C, à la tolérance (TOL_PL = 5e-2 m) que ces documents indiquent eux-mêmes. Deux vecteurs sont enregistrés comme jeux de test, chacun portant son URL de récupération, sa date de récupération, le SHA-256 du fichier source et la page : le Reference Airborne Algorithm Description Document v3.1 (2019) Appendix D — auto-cohérent, et le vecteur d'acceptation — et le Milestone 3 Report (2016) Annex A section A.IX, l'énoncé que citent les bibliographies de recherche. Chaque entrée publiée (la matrice de géométrie à 10 satellites et 2 constellations, les diagonales de variance C_int et C_acc, b_nom, P_sat, P_const et le jeu de constantes LPV-200) et chaque sortie publiée (VPL, HPL, EMT, sigma_v_acc, K_fa_3 et les sigma_3, sigma_ss_3 et b_3 des deux modes de défaut de constellation) est rapportée à côté du nombre propre du moteur et de leur différence absolue. L'équation du niveau de protection n'est PAS résolue de nouveau ici : la liste de modes de la référence est transmise à raim::araim_protection_level / araim_integrity_risk existants du moteur, de sorte que la bissection et l'algèbre de queue gaussienne soumises au test sont celles du moteur ; seuls la géométrie, les sous-solutions, les seuils de détection et la répartition publiée du budget sont construits pour lui. VÉRIFIÉ EN EXTERNE par rapport au vecteur 2019 : VPL { $lit_18_2926 } m contre { $lit_18_3 } m publié, HPL { $lit_13_4063 } m contre { $lit_13_45 } m, EMT { $lit_7_2997 } m contre { $lit_7_2998 } m, sigma_v_acc { $lit_1_3694 } m contre { $lit_1_3694 } m, et les six intermédiaires publiés à moins d'une demi-unité de leur dernière décimale imprimée. Le vecteur 2016 comporte deux défauts internes que le rapport énonce plutôt que de les cacher — une coquille de signe à la ligne 3 de G, et un K_fa_3 évalué à 57 modes de défaut alors que le document indique N_fault_max = 1 (12 modes) — de sorte que ses intermédiaires de géométrie sont reproduits exactement tandis que ses niveaux de protection sont rapportés comme des écarts mesurés et exclus du chiffre d'acceptation ; la tolérance n'est jamais élargie pour les absorber. Chaque champ numérique émis porte une unité et une classe de provenance, et un chiffre transcrit est étiqueté `published` afin qu'on ne puisse jamais le prendre pour un chiffre calculé. PÉRIMÈTRE : seul N_fault_max = 1 (modes de défaut d'un seul satellite et d'une seule constellation) est implémenté, et un cas dont les a priori exigent des sous-ensembles de défauts multi-événements simultanés est REFUSED plutôt que tronqué silencieusement ; la détection de défaut, l'exclusion, le contrôle de cohérence du khi-deux et l'étape de réallocation de double comptage de l'algorithme de référence sont hors périmètre. Ceci reproduit l'exemple détaillé d'un algorithme de référence publié — ce n'est ni une certification, ni un artefact de navigabilité, ni une approbation.

engine-kind-lunar-frame-campaign-description = Datum de référentiel de Helmert (similitude) à sept paramètres piloté par une CAMPAGNE D'OBSERVATION SIMULÉE plutôt que par une transformation injectée. Un réseau de stations terrestres observe un catalogue de balises de surface lunaire selon un planning explicite ; les dérivées partielles du délai VLBI lunaire sont accumulées sur ce planning dans une matrice d'information de Fisher des coordonnées de balise exactement comme le fait lunar-vlbi-fim ; et cette information est propagée à travers le plan de Helmert A = [I3 | [p]_x | p] aux points du catalogue dans la covariance du datum H = A^T M_b A, diagnostiquée par crate::fim::crlb. AUCUNE transformation n'est injectée et rien n'est retrouvé à partir d'une réponse plantée, de sorte que la précision du datum rapportée découle du programme d'observation : diviser par deux le sigma de délai la divise exactement par deux, et allonger l'arc l'améliore parce que la libration que le rapport MESURE (sub_earth_direction_sweep_deg) est ce qui sépare la coordonnée de balise suivant la ligne de visée de celles du plan du ciel. Le rang, le défaut de datum, le conditionnement, le spectre complet, les directions inobservables DANS LA BASE À SEPT PARAMÈTRES, la direction la plus faible même à rang plein et la part de chaque paramètre dans celle-ci sont émis à chaque exécution ; un paramètre que la campagne ne contraint pas est publié comme NULL avec un état, jamais lu dans une inverse quasi singulière. La corrélation des erreurs de balise est mesurée, non supposée : avec les stations maintenues fixes, aucune observation ne touche deux balises, de sorte que la matrice d'information est exactement diagonale par blocs (offblock_fraction 0), et avec les stations estimées, le bloc marginalisé par Schur est couplé, la corrélation induite étant imprimée et toute la propagation relancée en l'écartant, de sorte que le prix d'une hypothèse d'indépendance est un nombre. La même propagation sous un sigma isotrope par coordonnée, et l'erreur de récupération que rapporte le scénario lunar-frame-realisation, sont toutes deux exécutées ici et imprimées à côté de la valeur de la campagne avec leurs rapports. MODELLED : le catalogue de balises est documenté mais la CAMPAGNE est simulée — le réseau de stations et le sigma de délai sont des entrées illustratives, les observations de délai individuelles sont traitées comme indépendantes, et l'éphéméride du centre de la Lune, les horloges de station, la troposphère et les paramètres d'orientation de la Terre sont maintenus FIXES, de sorte que la covariance du datum est une borne de Cramer-Rao pour un jeu réduit de paramètres. Pas un produit géodésique.

engine-kind-lunar-llr-datum-description = Datum de référentiel lunaire de Helmert à sept paramètres piloté par une campagne d'observation RÉELLE et ARCHIVÉE plutôt que simulée. Là où lunar-frame-campaign avait retiré la transformation injectée mais indiquait encore son réseau de stations, son planning et son sigma par observation comme entrées ILLUSTRATIVES, ce type prend les trois à partir de mesures : les époques sont les instants d'émission au sol des points normaux archivés ILRS Consolidated Laser Ranging Data, les observations sont les mesures de distance laser réellement tirées vers les cinq réseaux de rétroréflecteurs sur la Lune, et chaque poids d'observation est la précision archivée propre à ce point normal, bin_rms/sqrt(n_raw), lue dans le fichier. Les coordonnées de station proviennent de la solution SLR IERS ITRF2020 (propagées à l'époque par leurs vitesses publiées) et les coordonnées des réflecteurs de JPL DE430 Table 7 dans le référentiel Terre moyenne/rotation moyenne que réalise le modèle IAU 2015 WGCCRE. Les dérivées partielles de distance sont accumulées dans la matrice d'information de Fisher conjointe des coordonnées de réflecteur et propagées à travers le même plan de Helmert dans la covariance du datum, diagnostiquée par crate::fim::crlb. Le rang, le défaut, le conditionnement, le spectre, les directions inobservables dans la base à sept paramètres, la direction la plus faible à rang plein et la part de chaque paramètre dans celle-ci sont émis à chaque exécution, et un paramètre non contraint est publié comme NULL avec un état. La corrélation entre réseaux est MESURÉE à exactement zéro plutôt que supposée, car une mesure de distance laser ne touche qu'un réseau. Un enregistrement que les catalogues ne peuvent pas placer — une station sans position ITRF publiée — est IGNORÉ ET COMPTÉ, jamais doté d'une coordonnée de substitution. QUELS LIENS SONT MESURÉS ET LESQUELS SONT MODELLED, C'EST LE RAPPORT, PAS UNE NOTE DE BAS DE PAGE : l'éphéméride du centre de la Lune et l'orientation du corps IAU restent modélisées et leur taille combinée est émise comme le résidu de distance aller observé moins calculé sur tous les points utilisés ; la troposphère, les marées de corps solide, l'excentricité de station, le mouvement polaire, UT1-UTC, le retard relativiste et les horloges de station sont absents et compris dans ce résidu. Comme une erreur d'éphéméride n'atteint une covariance que par la direction de chaque ligne de visée, chaque exécution résout aussi de nouveau tout le datum avec toutes les dérivées partielles inclinées de sensitivity_tilt_deg (signe alterné) et émet le rapport, de sorte que l'insensibilité de la covariance à l'éphéméride modélisée est un nombre plutôt qu'un argument. Les chiffres propres de la campagne simulée sont EXÉCUTÉS et imprimés à côté des chiffres mesurés, et non transcrits. MODELLED : les chiffres à sept paramètres sont une borne de Cramer-Rao pour un jeu réduit de paramètres sur un planning réel — pas un datum résolu, pas une analyse LLR et pas un produit géodésique. La tranche de données réelles enregistrée est livrée avec le dépôt mais pas avec le crate publié ; pointez data_dir vers une copie de celle-ci.

engine-kind-lunar-beacon-description = Augmentation d'un service de navigation orbital lunaire par des balises de surface, sous forme de tableau avant/après exécutable. Un utilisateur polaire sud voit un ensemble orbital clairsemé dans une étroite portion du ciel, de sorte que la géométrie de mesure de distance est mal conditionnée ; quelques BALISES DE SURFACE RELEVÉES fournissent les lignes de visée à basse élévation et à grand azimut qu'un ensemble entièrement au zénith n'a pas, et la dilution de précision horizontale s'effondre. Le scénario rapporte trois configurations à une époque — satellites seuls, satellites plus balises visibles, et une constellation plus grande comme autre voie vers la même géométrie — chacune avec ses nombres de sources visibles, son DOP complet et l'exactitude 1-sigma réalisée en MÈTRES, obtenue en multipliant par une erreur de distance équivalente utilisateur par balise assemblée comme somme quadratique des termes de synchronisation d'horloge, de trajets multiples et de levé. La visibilité des balises est l'horizon géométrique à deux hauteurs de la Lune sans atmosphère (pas d'atmosphère, donc la borne est exacte), et l'assemblage du DOP est le même noyau recoupé avec gnss_lib_py dans tests/dop_reference.rs. POURQUOI CE TYPE EXISTE : le module qui le sous-tend est dans le moteur et vérifié par rapport à un chemin DOP indépendant depuis L08/L09, mais il n'était pas accessible depuis une exécution — pas de type, pas de branche de répartition, pas de fichier fourni. Le README annonçait la capacité et la matrice de vérification ne comportait AUCUNE ligne pour elle, de sorte qu'elle était à la fois revendiquée en prose et non revendiquée dans le registre, tout en étant inaccessible dans le moteur. Les valeurs par défaut sont la géométrie qui porte déjà une référence enregistrée (un utilisateur à -80 deg avec une antenne de 2 m, trois balises à -80/0, -79/+60 et -79/-60 à 2 km, un instantané illustratif de six satellites LCNS à t=0, un masque de 5 deg), de sorte qu'une exécution nue reproduit un tableau qu'une référence indépendante couvre déjà plutôt que d'inventer de nouveaux nombres. MODELLED : la conception de la constellation, le placement des balises et chaque ordre de grandeur du budget d'erreur sont des entrées illustratives, et non un levé déployé ni une liaison mesurée ; seuls l'arithmétique du DOP, la forme close de l'horizon et la relation sigma = DOP x sigma_URE sont ancrés en externe. Pas un engagement de performance de service.

engine-kind-earth-gnss-lunar-description = Réception du GNSS terrestre à la distance lunaire, la couche de signal faible que l'article sur la résilience en conflit nomme et pour laquelle le moteur n'avait pas de modèle. Un satellite GNSS pointe son antenne vers la Terre ; un récepteur près de la Lune se trouve à environ quinze fois le rayon orbital, de sorte que trois choses jouent à la fois. La Terre OCCULTE L'AXE DE VISÉE : depuis 26 560 km elle sous-tend un demi-angle de { $lit_13_9 } deg, de sorte que tout rayon à destination de la Lune doit quitter l'émetteur à au moins cet écart du nadir, ce qui supprime le sommet du faisceau avant tout calcul de puissance. Ce qui reste est LE BORD DU LOBE PRINCIPAL ET LES LOBES SECONDAIRES, le régime dans lequel la charge utile LuGRE a effectivement opéré en 2025. Et l'affaiblissement en espace libre est d'environ 208 dB en L1, soit environ 25 dB de plus que ce que paie un utilisateur terrestre. Le rapport émet une ligne par satellite (angle hors axe, occultation par la Terre, distance, affaiblissement de parcours, gain d'émission à cet angle, puissance reçue, rapport porteuse sur densité de bruit) et n'agrège que les liaisons qui franchissent le seuil de poursuite. IL RAPPORTE AUSSI LE CONDITIONNEMENT, car c'est ce qui définit cette couche : chaque satellite visible se trouve dans un cône large de quelques degrés vu de la Lune, de sorte que les lignes de visée sont presque parallèles, la dilution de précision est énorme, et une solution GNSS terrestre à la distance lunaire est une observation de qualité SYNCHRONISATION bien plus que de qualité position. MODELLED, et le diagramme d'émission en est la raison : le gain en fonction de l'angle est celui d'une ouverture circulaire uniforme (Airy), alors qu'une vraie antenne GPS L1 est un réseau hélicoïdal à douze éléments avec un lobe principal façonné et des lobes secondaires non Airy. Des diagrammes mesurés existent et ne sont pas fournis ici, de sorte que les classements et les ordres de grandeur sont significatifs mais pas les dB d'un satellite pris seul. Délibérément ABSENTS, chacun rendant le budget optimiste : pas de perte ionosphérique ni troposphérique sur les rayons rasant le limbe, pas de perte de polarisation, de pointage ou de mise en œuvre, et une Terre sphérique sans extension réfractive. La position de la Lune est une ENTRÉE (distance plus direction inertielle) plutôt qu'une recherche d'éphéméride, car la grandeur testée est la liaison et la géométrie du faisceau. Faire passer cette ligne à validée exige un diagramme d'émission mesuré et des points normaux LuGRE ; aucun des deux n'est dans le dépôt et aucun n'est inventé ici.

engine-kind-lunar-infrastructure-description = Études MODELLED de l'orbite et de la surface de la Lune comme infrastructure de navigation et de géodésie, cinq études derrière un seul type sélectionné par `study` : od-consistency (détermination d'orbite embarquée par GNSS terrestre en NRHO ou ELFO par rapport à une détermination d'orbite radiométrique au sol indépendante, jugées par leurs propres covariances sur un Monte Carlo à graine), carrier-phase (phase de porteuse à doubles différences conjointe surface-orbiteur et résolution d'ambiguïté entière avec LAMBDA), frame-coestimation (une station de surface et des orbiteurs ajoutés à la télémétrie de stations terrestres pour le datum de référentiel lunaire à sept paramètres), space-tie (GNSS, VLBI et télémétrie laser sur un même engin, précision du lien de référentiel par rapport à l'erreur de lien local) et geodesy-sensitivity (information de Fisher des nombres de Love lunaires h2, k2, l2 et de la libration physique à partir de la télémétrie laser, de la poursuite d'orbiteur, d'un gravimètre de surface et d'une horloge de surface). Un modèle à trois corps restreint avec des simplifications indiquées ; la numérique est vérifiée par rapport à des programmes indépendants et rien n'est comparé à une mesure d'une grandeur lunaire.

engine-kind-cislunar-arc-recovery-description = Test d'estimateur indépendant MODELLED du seuil d'observabilité de longueur d'arc cislunaire. Ce seuil est une lecture de RANG sur la matrice d'observabilité assemblée à partir des lignes ANALYTIQUES du jacobien de distance et de la matrice de transition d'état variationnelle ANALYTIQUE, et sa vérification croisée par filtre d'information en racine carrée replie ces mêmes lignes — un contrôle de cohérence entre deux machines numériques, et non une corroboration. Ce type fournit l'arbitre manquant : un estimateur par moindres carrés par lots qui RETROUVE réellement l'état initial du chef à partir de mesures simulées, les dérivées partielles de mesure étant prises comme DIFFÉRENCES FINIES CENTRALES du modèle direct composé. Il n'appelle aucune ligne de jacobien analytique, aucune STM variationnelle, aucune décomposition en valeurs singulières ou propres, aucune tolérance de rang et aucun filtre d'information en racine carrée — une garde sur le texte source dans tests/cislunar_arc_recovery_reference.rs le rend vérifiable — tandis que la dynamique (le même flot CR3BP en RK4), les conditions initiales (la même constellation corrigée différentiellement), l'observable scalaire et la grille d'époques sont partagés délibérément et nommés dans le bloc `independence` émis, car deux analyses d'un même problème physique doivent s'accorder sur la physique pour être comparables. Deux critères, chacun balayé sur cinq décades de sa propre borne : RÉCUPÉRATION SANS BRUIT (l'erreur d'état finale de chaque essai à graine au plus recovery_factor fois son déplacement a priori — l'analogue du rang, sans tolérance de valeur singulière) et ESTIMABILITÉ MONTE-CARLO (l'erreur RMS de position mesurée sur un ensemble de bruit à graine inférieure à une borne indiquée — l'analogue de l'estimabilité, mesurée plutôt que prédite). Prend en charge les quatre états planaires et les six états spatiaux, les familles DRO / halo L2 / NRHO L2, les observables de distance et de vitesse de variation de distance, et une paramétrisation polaire centrée sur la Lune dans laquelle la transformation est appliquée à l'ÉTAT et le modèle direct redifférencié à cet endroit. MESURÉ sur la grille DRO planaire publiée : l'estimateur retrouve les quatre états à partir de { $lit_0_782609 } h contre { $lit_2_086957 } h pour le critère de rang à rel_tol 1e-6 (rapport { $lit_0_375 }) — le seuil de rang n'est PAS corroboré comme frontière de récupérabilité — tandis que la frontière d'estimabilité mesurée tombe dans la même cellule de grille que la frontière formelle, { $lit_5_739130 } h, et la courbe d'erreur mesurée reproduit le 1-sigma formel sur 21 longueurs d'arc à un rapport moyen géométrique de { $lit_0_98 }. MODELLED : la conception de la constellation, la grille d'époques, l'unique liaison suivie, l'ordre de grandeur du déplacement, le sigma de mesure et les deux bornes indiquées. Pas un produit de performance de navigation certifié.

engine-kind-telecom-timing-description = Synchronisation télécom : erreur de temps, erreur maximale d'intervalle de temps (MTIE) et déviation de temps (TDEV) d'un holdover GNSS, contrôlées par rapport aux masques ITU-T avec un PASS ou un FAIL et une marge par masque. L'entrée est soit un HOLDOVER SYNTHÉTIQUE (un préréglage d'oscillateur -- ocxo, rubidium, césium ou csac, chacun portant les chiffres de stabilité, de vieillissement et de température d'une fiche technique publique Microchip nommée -- plus le temps de perte du GNSS, la durée d'enregistrement et l'intervalle d'échantillonnage ; l'horloge libre porte du bruit de fréquence blanc, de scintillation et, lorsque l'ajustement de la fiche technique l'exige, de marche aléatoire, un vieillissement linéaire et un terme de température sinusoïdal) soit une SÉRIE INGÉRÉE de paires [time_s, time_error_ns] fournie en ligne (et, uniquement sur les compilations natives, un fichier CSV). Masques : ITU-T G.8272 (07/2025) PRTC-A et PRTC-B (max|TE| 100 / 40 ns, MTIE Tables 1-2, TDEV Tables 3-4) ; G.8272.1 (2024) Amd. 1 (07/2025) ePRTC accroché (30 ns, Tables 1-2) et ePRTC-A en holdover (l'enveloppe d'erreur de temps de la Table 3 passant de 30 ns à 100 ns sur la période de holdover H fixée par la durée d'accrochage, MTIE Table 4, TDEV Table 5) ; G.8273.2 (2023) Amd. 2 (11/2025) classes T-BC/T-TSC A-C (max|TE|, erreur de temps constante, MTIE et TDEV filtrés passe-bas) et classe D (max|TE_L| 5 ns, le seul chiffre de classe D non laissé à une étude ultérieure) ; G.8271.1 (2022) Amd. 3 (05/2025) point de référence C (max|TE_L| 1100 / 600 / 100 ns avec MTIE Tables 7-1 à 7-3). Toute entrée qu'une Recommendation renvoie à une étude ultérieure est absente plutôt que remplie, et chaque rapport liste ce qui n'est pas implémenté. Rapporte aussi le temps de dépassement de chaque budget d'erreur de temps maximale (par défaut : 100 ns ePRTC max|TE_HO|, 400 ns d'allocation de holdover réseau, 1100 ns point C, { $lit_1_5 } us classe 4), les courbes MTIE/TDEV sous forme de tableau CSV avec chaque limite de masque, et une entrée d'unités et de provenance par champ numérique. VALIDATED : les estimateurs MTIE et TDEV par rapport au paquet allantools sur une série de holdover enregistrée. MODELLED : les tables de masques sont des transcriptions, et un holdover synthétique est un modèle construit à partir de maxima de fiches techniques, et non une mesure d'un quelconque équipement. Pas un test de conformité.

engine-kind-slot-timing-description = Synchronisation de créneau : secondes avant qu'une horloge libre ne quitte la garde d'un créneau d'acheminement ou d'affectation indexé sur le temps (la plus grande erreur de temps absolue que le créneau tolère), la contribution de chaque terme à cet instant avec le terme dominant nommé (incertitude de la solution, bruit de phase blanc, bruit de fréquence blanc, de scintillation, de marche aléatoire et de course aléatoire, décalage de fréquence résiduel, température, vieillissement), le temps restant depuis la dernière solution, et le plus grand intervalle de solution qui maintient l'horloge dans la garde, net de la latence de la solution. L'oscillateur est une valeur par défaut de CLASSE (csac, uso, dsac, tcxo, ocxo ou rafs : une déviation d'Allan citée à une seconde et un plancher de bruit rouge supposé), un PRÉRÉGLAGE DE FICHE TECHNIQUE de telecom-timing ou une FICHE TECHNIQUE en ligne (maxima de déviation d'Allan ajustés comme une enveloppe, plus le vieillissement et un coefficient de température), ou un ENREGISTREMENT DE PHASE MESURÉ en ligne (sa déviation d'Allan chevauchante ajustée par moindres carrés pondérés dans la base de phase blanche et de modulation de fréquence IEEE Std 1139, de sorte que le plancher de bruit rouge est mesuré plutôt que supposé). Un dépassement au-delà du plus long temps de moyennage que la fiche technique ou l'enregistrement prend en charge est signalé comme extrapolé. Une section facultative de leurrage ajoute le niveau de protection temporel pour un récepteur en orbite : vitesse et période orbitales, durée pendant laquelle un unique leurreur au sol peut atteindre le satellite par passage, plancher du moniteur assisté par horloge et latence de détection CUSUM, borne conditionnelle, dérive qu'accumule un leurreur à une vitesse de rampe maximale indiquée avant que le satellite ne quitte sa portée ou qu'un contrôle indépendant ne s'exécute, et si chaque contrôle de contact sol ou de liaison croisée est indépendant de ce leurreur. VALIDATED : l'inversion du holdover à partir d'un enregistrement ajusté, retenue sur une horloge au césium réelle mesurée par rapport à un maser à hydrogène (tests/slot_timing_cs5071a_holdout.rs, conditionné par les données) ; sur un oscillateur à quartz mesuré, la prédiction retenue est prudente mais n'atteint pas le seuil, de sorte que le cas du quartz est MODELLED. MODELLED : les sources de classe et de fiche technique, les termes déterministes et l'évaluation du leurrage.

engine-kind-spectrum-description = Modèle de spectre en bande L et cascade : toute la bande L du GNSS comme une seule densité spectrale de puissance (DSP), fréquence en abscisse, temps vers le bas, sur une chronologie scénarisée de brouilleurs. SIGNAUX : GPS L1 C/A et L2C (BPSK(1)), service ouvert Galileo E1 (MBOC(6,1,1/11), ou BOC(1,1)), GPS L5 et Galileo E5a (BPSK(10)), chacun à sa porteuse avec la puissance reçue minimale de la spécification d'interface (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) sauf remplacement ; GLONASS, BeiDou et Galileo E6 ne sont pas modélisés. BROUILLEURS : tonalité à onde continue, bruit à bande étroite plat, chirp en dents de scie linéaire et bruit à large bande adapté à la modulation propre d'une bande, chacun avec un centre, une largeur de bande, une puissance reçue (directe, ou PIRE et distance via l'affaiblissement en espace libre du type de brouillage) et des instants de marche/arrêt. Chaque brouilleur est évalué par rapport à chaque bande par son coefficient de séparation spectrale kappa sur la largeur de bande du récepteur, et (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1 ; pour un brouilleur, cela équivaut à l'équation anti-brouillage du type de brouillage avec Q = 1/(R_c kappa), et le rapport porte ce recoupement (et le chiffre de Q représentatif du type de brouillage à côté). Le plancher de bruit est k T_sys avec T_sys = T_ant + 290 K (F - 1). La cascade moyenne chaque cellule sur son intervalle et sa ligne (chirps exactement, balayages entiers plus le balayage partiel ; brouilleurs commutant en milieu de ligne selon leur rapport cyclique), de sorte que la chronologie de C/N0 et l'image proviennent des mêmes nombres ; result.json porte la grille moyennée par blocs en puissance, le C/N0 et le J/S par bande pour chaque ligne, et, par brouilleur et par bande, le SSC, Q, J/S, J/S dans la bande et C/N0 stationnaire. En option [iq] : le modèle tracé comme IQ complexe à un instant, écrit dans un enregistrement SigMF et relu depuis celui-ci (cf32_le ou ci16_le), et comparé à une estimation de Welch. En option [recording] (compilations natives) : la DSP de Welch d'un véritable enregistrement SigMF à côté du modèle. VALIDATED : les DSP des signaux par rapport aux largeurs de lobe principal des manuels (BPSK(n) 2n x { $lit_1_023 } MHz de zéro à zéro ; lobes BOC(1,1) centrés à +/-{ $lit_1_023 } MHz) et les coefficients de séparation spectrale par rapport à leurs formes closes de Parseval et au Q = 1 (CW) et { $lit_1_5 } (adapté) de Kaplan & Hegarty. MODELLED : puissances des brouilleurs, chronologie, largeurs de bande de l'étage d'entrée, traitement à spectre continu (sans raies de code) et absence d'AGC, d'effacement et de diagramme d'antenne.

engine-kind-solar-system-description = Tout le système solaire à une époque, pour le PNT (positionnement, navigation et synchronisation temporelle) autour de n'importe quel corps. Pour le Soleil, les huit planètes, Pluton, la Lune, Phobos, Deimos, Io, Europe, Ganymède, Callisto et Titan, il rapporte la position et la vitesse héliocentriques dans l'ICRF (International Celestial Reference Frame, équatorial J2000), la distance héliocentrique et la longitude et la latitude écliptiques J2000, le paramètre gravitationnel, le rayon équatorial et moyen, J2 lorsqu'il est publié et son rayon de référence, la période de rotation sidérale, le pôle IAU et le méridien origine à l'époque, une trace d'orbite échantillonnée sur une révolution (héliocentrique pour les planètes, centrée sur le parent pour les lunes), ainsi que le temps de lumière, la distance aller et aller-retour, le retard de Shapiro solaire et la séparation du Soleil depuis un corps observateur (la Terre par défaut) ; les liaisons from/to supplémentaires reçoivent le même traitement. Positions : les éléments képlériens JPL de Standish et Williams (Table 1 pour 1800 AD à 2050 AD, Tables 2a/2b pour 3000 BC à 3000 AD) avec l'erreur nominale de chaque planète, la série lunaire de Montenbruck & Gill pour la séparation Terre-Lune, les éléments moyens JPL avec la vitesse de rotation synchrone de l'IAU pour les lunes martiennes et galiléennes, et le modèle de rotation de l'IAU pour Titan. Temps de lumière : résolution radiométrique à point fixe, émetteur à sa position retardée ; newtonien, le retard de Shapiro étant rapporté séparément. VALIDATED par rapport à JPL Horizons (DE441) à moins de deux fois l'erreur nominale : de Mercure à Saturne et la Terre d'après la Table 1 (pire cas { $lit_1_87 } fois le nominal) et les huit planètes d'après les Tables 2a/2b (pire cas { $lit_1_71 } fois), ainsi que le temps de lumière de la Terre à Mars et à Jupiter. MODELLED, chaque ligne étant étiquetée : Uranus et Neptune d'après la Table 1 ({ $lit_2_0 } et { $lit_5_2 } fois l'erreur nominale par rapport à DE441), Pluton (la ligne de 1992 ; pas d'erreur indiquée), la Lune et les sept lunes (mesurées par rapport à Horizons, sans borne publiée).

engine-kind-body-pnt-description = Positionnement autour de n'importe quel corps du système solaire : un orbiteur ou un atterrisseur de surface autour d'un corps central choisi par son nom (Mars, la Lune, Europe, Ganymède, Titan et le reste du catalogue du système solaire), naviguant avec des pseudodistances à sens unique issues d'une petite constellation de navigation de Walker autour du corps (orbites à deux corps avec la dérive séculaire J2 propre au corps, une horloge d'utilisateur inconnue) et, en option, une mesure de distance bidirectionnelle d'espace lointain depuis la Terre, sans horloge, dont la direction et la distance proviennent de l'éphéméride analytique du système solaire à chaque époque. Les lignes de visée sont bloquées par la sphère moyenne du corps, et un utilisateur de surface a aussi besoin du masque d'élévation. Par époque : relais en vue, si la Terre est au-dessus du limbe, le GDOP et le PDOP de la constellation seule (dilution de précision géométrique et de position), l'incertitude de position formelle à un sigma avec et sans la ligne de la Terre, et l'erreur d'une solution des moindres carrés de Gauss-Newton à graine dans chaque cas ; sur l'exécution : disponibilité, visibilité de la Terre, PDOP médian, erreur RMS et sigma formel médian, ainsi que le temps de lumière Terre-corps, l'aller-retour, le retard de Shapiro et la séparation du Soleil à l'époque. MODELLED : les orbites des relais, les niveaux de bruit et le modèle de mesure instantané sont des choix de modélisation, non validés par rapport aux données de navigation d'une mission ; les constantes du corps sont les valeurs publiées citées dans body.rs, et la géométrie de la Terre hérite des étiquettes de l'éphéméride du système solaire.

engine-kind-constellation-design-description = Conception de constellation à grande échelle : motifs Walker DELTA et Walker STAR dans la convention i: T/P/F (nœuds répartis sur 360 ou 180 deg, espacement dans le plan 360*P/T, décalage de phase entre plans 360*F/T), listes d'éléments explicites et conceptions multi-couches, plusieurs constellations dans une exécution, autour de la Terre, de la Lune, de Mars ou de toute autre planète, de Pluton ou d'une lune majeure en utilisant les constantes du module body (les mêmes que celles qu'utilisent les types solar-system et body-pnt). PRÉRÉGLAGES à partir d'éléments nominaux publiés : gps-baseline et gps-expandable (les 24 emplacements et les six paires extensibles avant/arrière du GPS Standard Positioning Service Performance Standard, 5e édition 2020, Tables 3.2-1 à 3.2-3), galileo (Walker 24/3/1 à 29 599.801 km et 56 deg, Galileo Open Service Service Definition Document issue 1.1 Tables 1 et 23), beidou et beidou-meo (Walker 24/3/1 à 21 528 km et 55 deg plus trois satellites géostationnaires à 80, { $lit_110_5 } et 140 deg E et trois satellites géosynchrones inclinés à 55 deg, BeiDou Open Service Performance Standard 3.0 section 4.1 ; la phase MEO et le croisement géosynchrone incliné à 118 deg E sont modélisés parce que la norme ne les indique pas) et glonass (24/3/1 à 19 100 km et { $lit_64_8 } deg d'après la formule d'emplacement du GLONASS Interface Control Document edition 5.1 section 5.2). COUVERTURE ET DILUTION DE PRÉCISION : sur une grille de latitude/longitude et une fenêtre échantillonnée avec un masque d'élévation, le nombre de satellites en vue, GDOP, PDOP, HDOP et VDOP par cellule, la disponibilité (une solution avec un PDOP inférieur ou égal à un seuil, 6 par défaut) par cellule, globalement (pondérée par la surface) et au pire site, avec une horloge de récepteur par constellation sauf si clock = "common". Passe à l'échelle de milliers de satellites : la visibilité est un produit scalaire par rapport au demi-angle de couverture de chaque satellite, et les satellites sont regroupés en bandes par latitude du point sous-satellite à chaque époque afin qu'une ligne de grille ne teste que ceux qui peuvent être en vue ; le rapport compte les tests de paires évités. Le JSON porte les cartes de grille et les traces au sol par satellite sous-échantillonnées. VALIDATED : le générateur de Walker par rapport à Galileo OS SDD Table 23 et à la formule d'emplacement de l'ICD GLONASS, le préréglage GPS par rapport à la colonne publiée de croisement de l'équateur de SPS PS Table 3.2-1, et la distribution mondiale du HDOP de la référence de base GPS par rapport à SPS PS Appendix B (médiane { $lit_0_94 }, 95 % { $lit_1_25 }, moyenne { $lit_0_96 }, tolérance { $lit_0_03 }). MODELLED : orbites à deux corps avec J2 séculaire facultatif, corps sphérique, visibilité géométrique seulement (pas de puissance de signal, d'état de santé ni de terrain), et la phase relative entre systèmes différents, qui n'est pas un instantané d'une date réelle.

engine-kind-campaign-description = Campagne : types de scénarios existants composés en une seule exécution, chaque nombre étant lu dans une exécution réelle du type nommé. Quatre sections, en toute combinaison. PHASES : une mission enchaînée sur une chronologie partagée -- chaque phase exécute un ou plusieurs scénarios (par exemple brouillage, puis leurrage, puis une horloge en holdover avec un système de navigation inertielle en dérive à ses côtés, puis une alarme d'intégrité, puis le rétablissement), leurs sorties sont lues dans des canaux nommés (erreur de temps de l'horloge par rapport à sa garde, rapport porteuse sur densité de bruit par rapport au plancher de poursuite, niveau de protection par rapport à la limite d'alerte, erreur de position, satellites suivis, indicateurs d'alarme) par un préréglage par type ou par des chemins de résultats explicites, et rééchantillonnées sur une grille commune par maintien d'ordre zéro, avec les frontières de phase et les événements ; l'état est transmis par carry (un canal continue à partir de la valeur finale de la phase précédente), handoff (un nombre d'une phase précédente écrit dans le scénario de cette phase) et end_at (une phase se termine à un instant qu'une exécution a calculé, comme l'instant de détection d'un moniteur de leurrage). SWEEP : une grille sur une à trois clés de scénario à points de n'importe quel type (un segment entier indexe un tableau de tables, comme dans system.2.sisre_m), avec des métriques lues par chemin de résultat et, avec plus d'une exécution, un ensemble Monte Carlo à graine à chaque nœud. MONTE_CARLO : la réalisation k s'exécute à base_seed + k ; chaque métrique rapporte la moyenne, l'écart type, les 5e/50e/95e centiles au rang le plus proche et un intervalle de confiance bootstrap à 95 % à graine fixe sur la moyenne. COMPOSE : plusieurs scénarios sous des valeurs partagées (la puissance et la position d'un brouilleur écrites dans un récepteur maritime et un récepteur routier), avec un résumé combiné meilleur/pire. Le résultat porte un hachage de campagne, un condensé de tous les résultats membres, et une entrée d'unités pour chaque nombre émis ; les exports d'interopérabilité écrivent chaque scénario membre qui a une géométrie comme son propre jeu de fichiers. Les identités de composition sont testées : une campagne à une phase reproduit l'exécution autonome bit pour bit, un ensemble à graine fixe est stable à l'octet près, et sur une horloge à bruit de fréquence blanc, la moyenne de l'ensemble tombe dans l'intervalle rapporté avec une dispersion correspondant à sqrt(q_wf * tau). MODELLED : le report additif et le maintien d'ordre zéro sont des choix de modélisation, et chaque phase porte l'étiquette du type qui l'a exécutée.

engine-kind-leo-signal-description = Conceptions de signaux LEO-PNT : signaux paramétrés de positionnement, navigation et synchronisation temporelle (PNT) en orbite terrestre basse (LEO) pour tout système, toute bande et toute structure. Un SIGNAL est une bande (fréquence centrale, largeur de bande d'émission, allocation ITU RNSS/RDSS/MSS/EESS/non-RNSS/autre) et des composantes (acquisition, données, pilote ; tout sous-ensemble), chacune avec une modulation (BPSK(n) avec n fractionnaire, BOC(m,n), MBOC(6,1,p) ou une bande plate de type OFDM), une part de puissance, des décalages de sous-porteuses FDMA facultatifs, une longueur de code et un débit de données. Les signaux proviennent de fichiers de préréglages publics intégrés à la compilation (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands ; chacun avec son URL source et chaque valeur non publiée étiquetée REPRESENTATIVE) ou sont écrits en ligne. PAR SIGNAL : la densité spectrale de puissance limitée en bande et la fraction de la puissance de chaque composante que laisse passer la bande d'émission (forme close BPSK à côté de la valeur numérique), la largeur de bande RMS (Gabor), la gigue de bruit thermique de poursuite de code de la boucle à verrouillage de délai en fonction de C/N0 et de l'espacement précoce-tardif d'après la formule précoce-tardif cohérente (ou non cohérente) limitée en bande de Betz & Kolodziejski 2009 avec sa forme de manuel en bande illimitée et sa borne de Gabor à espacement évanescent, la précision de mesure de distance en mètres, l'espace de recherche d'acquisition (cases Doppler issues du Doppler maximal de l'orbite plus les termes d'oscillateur et d'utilisateur, fois les cases de code), la probabilité de détection à loi carrée et le temps d'acquisition moyen série et parallèle en code, le coefficient de séparation spectrale du signal vers GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b et E5 AltBOC et de chacun vers le signal avec la dégradation de C/N0, ainsi que le J/S CW, à large bande et adapté que tolère la composante suivie, à partir du mécanisme SSC propre au type spectrum. Un COMPROMIS DE BANDE : retard ionosphérique au premier ordre ({ $lit_40_3 } TEC/f^2), affaiblissement en espace libre, précision de mesure de distance à C/N0 égal et à PIRE égale, et tolérance au brouilleur. Des CONTRÔLES DE FORME facultatifs confrontent le spectre d'une conception à une mesure décrite (cohérence MODELLED). VALIDATED : la puissance BPSK dans la bande ({ $lit_90_3 } % dans le lobe principal) et les formes closes de la largeur de bande de Gabor, la gigue limitée en bande se réduisant à la forme précoce-tardif cohérente des manuels et à sa borne de Gabor, le coefficient de séparation spectrale BPSK décalé par rapport à sa forme close de Parseval, l'aire unité du spectre AltBOC, et le Doppler LEO maximal par rapport aux chiffres publiés de Xona Pulsar (32-34 kHz) et d'Iridium (36 kHz). MODELLED : chaque conception, répartition de puissance, C/N0 et niveau de brouilleur ; les spectres EFQPSK, CSK et OFDM sont approchés.

engine-kind-leo-pass-description = Passage LEO et bilan de liaison, bande par bande, pour le LEO-PNT (positionnement, navigation et synchronisation temporelle depuis l'orbite terrestre basse), indépendant du système : un utilisateur (au sol, maritime, aérien ou en intérieur, statique ou mobile) et un ou plusieurs satellites LEO à partir d'un PASSAGE CONÇU (une orbite circulaire placée de sorte que l'utilisateur voie un passage d'élévation maximale choisie à un instant choisi, héliosynchrone si demandé), d'ÉLÉMENTS explicites, d'un TLE (jeu d'éléments à deux lignes) via le SGP4 du moteur, ou d'une constellation WALKER construite par le code de conception de constellation (les passages les plus hauts sont rapportés). Les bandes proviennent d'un préréglage nommé (multibande générique UHF/L/S/C, bande C générique, Xona Pulsar X1/X5, Iridium STL, Starlink comme signal d'opportunité à Doppler seul, CentiSpace, et un préréglage facultatif Celeste IOD marqué WORKSHOP) ou sont écrites dans le scénario ; chaque préréglage indique si ses nombres sont PUBLIC (avec URL), REPRESENTATIVE ou WORKSHOP. Par satellite, bande et époque : élévation, azimut, distance, vitesse de variation de distance et accélération de distance ; affaiblissement en espace libre ; PIRE et gain du diagramme du satellite (isoflux, faisceau gaussien ou plat) ; gain de l'antenne utilisateur en fonction de l'élévation (patch, hémisphérique ou isotrope) ; atténuation gazeuse (ITU-R P.676-10 Annex 2), atténuation par la pluie (coefficients ITU-R P.838-3 et procédure P.618-14, à partir d'un taux de pluie et d'une hauteur de pluie), scintillation troposphérique (ITU-R P.618-14 section 2.4.1), perte de pénétration dans un bâtiment pour un utilisateur en intérieur (ITU-R P.2109-2), désadaptation de polarisation, température de bruit du système et C/N0 (rapport porteuse sur densité de bruit) ; Doppler et dérive Doppler en forme close à partir de la vitesse de variation de distance et de l'accélération de distance, chacun vérifié par différences centrales ; le retard ionosphérique au premier ordre { $lit_40_3 } STEC/f^2 à partir d'un TEC oblique de Klobuchar ou de TEC vertical, ramené à la part de l'ionosphère située sous le satellite. Les paires de bandes reçoivent les coefficients sans ionosphère, l'amplification du bruit et le bruit de code au sommet du passage. Les satellites GNSS MEO (préréglages Galileo ou GPS) sont évalués avec le même modèle d'antenne et de bruit à partir des puissances reçues de leurs documents d'interface, de sorte que le passage LEO en cloche et les porteuses GNSS plates partagent un seul graphique. Une section facultative [iot] donne le temps avant la première solution, l'énergie par solution et l'autonomie de la batterie en fonction du rapport cyclique pour un budget de puissance de récepteur indiqué (MODELLED). Chaque paire de bandes donne aussi le TEC oblique que sa combinaison sans géométrie retrouve au sommet et le sigma de bruit de code de cette estimation (sondage de l'ionosphère). Une section facultative [spoofer] contrefait les signaux d'une position revendiquée qui saute ou est poussée depuis la position vraie après un début et exécute deux moniteurs avec des probabilités de fausse alarme et de non-détection indiquées : cohérence du Doppler et de la géométrie de passage (vitesses de variation de distance mesurées par rapport à celles prédites à partir des orbites et d'une position et d'une vitesse a priori indépendantes, un test du khi-deux des moindres carrés généralisés sur une fenêtre, sur les canaux GNSS, LEO et tous) et cohérence inter-bandes (le pas d'une époque à l'autre de la combinaison sans géométrie corrigée du modèle de chaque paire de bandes LEO), rapportant les statistiques par époque et le moment où chaque moniteur détecte (MODELLED). Composants VALIDATED : l'affaiblissement en espace libre, les coefficients P.838-3 par rapport à sa Table 5, les procédures de pluie et de scintillation P.618-14 et la perte de pénétration dans un bâtiment P.2109 par rapport aux exemples de validation de l'ITU-R Study Group 3, le rapport de retard de groupe L1/L2 de l'IS-GPS-200, et le Doppler maximal d'un utilisateur statique sur une orbite circulaire par rapport à arXiv 2509.19551 Table 1. MODELLED : les PIRE, les diagrammes, la fraction de Chapman du TEC sous le satellite et l'ensemble du passage.

engine-kind-leo-navmsg-description = Message de navigation LEO : l'éphéméride et l'horloge diffusées d'un satellite de positionnement, navigation et synchronisation temporelle (PNT) en orbite terrestre basse (LEO), pour toute orbite, porteuse et modèle, avec des préréglages nommés facultatifs (Xona Pulsar, Iridium, Starlink, CentiSpace, un système représentatif en bande C, le modèle à horloge nulle ATOMIC, Celeste IOD). CONTENU : données auxiliaires (SVID, issue of data, bande, état de santé du signal), synchronisation (semaine, temps de la semaine, un polynôme d'horloge du second ordre af0-af2 autour de toc), éphéméride dans l'un de quatre modèles -- le jeu képlérien à 16 paramètres du Galileo OS SIS ICD ; ce jeu plus des polynômes de correction le long de la trace, transverses et radiaux ; le modèle à 22 paramètres de Liu et al. 2025 ; un polynôme ECEF sans termes d'horloge (ATOMIC à horloge nulle) -- et autres services (un jeu diffusé de Klobuchar, NeQuick-G ai0-ai2 avec le niveau d'ionisation effectif, et des paramètres de temps système vers UTC avec la logique de seconde intercalaire de l'ICD). AJUSTEUR : une orbite de vérité intégrée avec la gravité zonale J2-J6 ou EGM2008 au degré choisi et la traînée, et une horloge libre ou pilotée à graine ; ajustement de Levenberg-Marquardt du jeu képlérien sur des éléments non singuliers, puis polynômes de correction par moindres carrés linéaires ; horloge ajustée nette du terme relativiste que l'utilisateur ajoute. ANALYSES : fit-interval-trade (erreur de distance du signal dans l'espace, SISRE, avec des poids moyennés globalement pour l'altitude d'orbite, en fonction de l'intervalle d'ajustement et de la période de mise à jour, orbite seule et avec horloge), model-comparison (quatre modèles, nombre de paramètres, bits encodés, et l'ajustement de Kshana aux altitudes de Liu et al. à côté des chiffres publiés), midpass-update (le passage le plus haut au-dessus d'un utilisateur, le saut de position, d'horloge et de distance utilisateur de chaque changement de message, le saut en pire géométrie, PASS/FAIL par rapport à un seuil de continuité), encode-decode (la trame binaire documentée propre à Kshana avec CRC-24Q, un budget de quantification au demi-pas par champ, un contrôle de trame corrompue, un export et un import d'enregistrement de type RINEX-4 étiqueté extension de Kshana, et un tableau CSV). VALIDATED : les poids SISRE par rapport à la table MEO/GEO publiée (Montenbruck et al. 2018) ; l'algorithme utilisateur Galileo par rapport à RTKLIB sur de véritables éphémérides diffusées Galileo ; CRC-24Q par rapport à sa valeur de contrôle du catalogue et à la trame d'exemple RTCM 1005. MODELLED : chaque chiffre d'ajustement et de SISRE est une erreur de représentation par rapport à une vérité intégrée par Kshana (pas d'erreur de détermination ou de prédiction d'orbite) ; la comparaison avec Liu et al. utilise d'autres orbites ; les formats d'encodage et de texte sont propres à Kshana.

engine-kind-leo-pvt-description = Positionnement, navigation et synchronisation temporelle (PNT) fusionnés en orbite terrestre moyenne (MEO) et basse (LEO) sur N'IMPORTE QUELLES constellations : chaque [[system]] est un préréglage GNSS du type constellation-design, un préréglage LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, le modèle d'éphéméride à horloge nulle atomic, ou un autre fichier de préréglage, chacun dans son propre fichier avec ses sources marquées PUBLIC, WORKSHOP ou DERIVED), des couches Walker ou des jeux d'éléments explicites, avec une porteuse, une cadence de chip, une enveloppe de rapport porteuse sur densité de bruit (C/N0) du masque d'élévation au zénith, une erreur de distance du signal dans l'espace (SISRE), un sigma Doppler et un modèle d'horloge (sa propre horloge de récepteur, de sorte que le biais inter-systèmes est estimé, ou un décalage diffusé connu). Quatre modes. DOPPLER : positionnement par lots de Gauss-Newton à partir de la vitesse de variation de distance avec des dérivées partielles analytiques, des états de dérive d'horloge et de vitesse facultatifs et une contrainte de hauteur facultative, à un ou plusieurs satellites, l'erreur en fonction de la longueur de fenêtre, l'enveloppe de Doppler, de dérive Doppler et de à-coup de chaque système LEO, et la précision le long de la trace et transversale d'un seul passage en fonction du décalage transversal (l'erreur transversale croît sans borne à mesure que le passage approche du zénith ; un seul passage a aussi une solution miroir de l'autre côté de la trace au sol). Un signal d'opportunité à Doppler seul (starlink-sop) s'exécute ici. JOINT : solutions de pseudodistance par moindres carrés pondérés à chaque époque à partir du GNSS seul, du LEO seul et des deux, sigmas par mesure issus d'un modèle de bruit thermique de boucle à verrouillage de délai à C/N0 plus le SISRE (ou un sigma fixe, de sorte qu'un modèle de signal puisse les alimenter), les biais inter-systèmes estimés, et PDOP/HDOP/VDOP en fonction du nombre de satellites LEO ajoutés. POLAR : satellites en vue et DOP en fonction de la latitude pour le GNSS, le LEO et les deux. TIMING : transfert de temps vers le Temps universel coordonné (UTC) depuis des satellites LEO à une position connue avec un filtre d'horloge à deux états dont le bruit de processus provient des classes d'oscillateurs du moteur, en fonction de C/N0 et de l'oscillateur, et l'expression temps système vers UTC de l'IS-GPS-200 ; avec [timing] trace = true, chaque ligne rapporte aussi son erreur de temps et son sigma prédit à chaque époque. VALIDATED : le plus grand Doppler d'un passage du zénith à l'horizon par rapport aux chiffres publiés d'Iridium (jusqu'à 36 kHz) et de Xona Pulsar X1 (32 à 34 kHz). MODELLED : tout le reste ; le DOP est vérifié sur un cas calculé à la main, les solutions par rapport à leur covariance, et le modèle Doppler par rapport à l'identité de l'accélération de distance.

engine-kind-leo-ppp-description = Convergence du positionnement ponctuel précis (PPP) avec le GNSS seul et avec augmentation LEO : un filtre de Kalman étendu flottant sur le code et la phase de porteuse sans ionosphère avec les coordonnées de station statiques, une horloge de récepteur blanche, un biais inter-systèmes par système supplémentaire, un retard humide zénithal en marche aléatoire projeté par 1/sin(élévation) et une ambiguïté flottante par arc de satellite ; l'erreur d'orbite et d'horloge précise est blanche et commune au code et à la phase d'un satellite, de sorte que chaque satellite est une mise à jour corrélée à deux lignes sous forme stabilisée de Joseph. Les mesures sont simulées à partir du même modèle avec un bruit à graine sur plusieurs sites et graines, et chaque cas (GNSS seul d'abord, puis chaque [[case]] de systèmes LEO, toute constellation ou préréglage) rapporte le temps de convergence médian (la première époque après laquelle les erreurs horizontale et verticale restent sous les seuils, 10 cm par défaut), la fraction convergée, les courbes d'erreur médianes et la cohérence du filtre (le NEES de position moyenné sur l'exécution par rapport à la bande du khi-deux bilatérale à 95 %). En option, à côté des chiffres publiés de Li et al. (2019, J. Geod. 93:749, doi 10.1007/s00190-018-1195-2) aux latitudes moyennes : { $lit_9_6 } min pour le multi-GNSS raccourcis à { $lit_7_0 }, { $lit_3_2 }, { $lit_2_1 } et { $lit_1_3 } min avec 60, 96, 192 et 288 satellites LEO. MODELLED : une comparaison de cohérence de la tendance, et non une reproduction des constellations, du bruit ou des stations de cette étude ; pas de résolution d'ambiguïté, de sauts de cycle, d'enroulement de phase, de marées ni d'erreurs de produit corrélées dans le temps.

engine-kind-ntn-positioning-description = Positionnement à partir d'une liaison descendante de réseau non terrestre (NTN) 5G dans la bande S du service mobile par satellite (MSS) (bande 3GPP n256, liaison descendante 2170 à 2200 MHz ; porteuse par défaut { $lit_2172_5 } MHz) : la borne de Cramér-Rao (CRB) sur le temps d'arrivée, c / (2 pi beta sqrt(2 (C/N0) T)) avec beta la largeur de bande quadratique moyenne (Gabor) du spectre OFDM plat (B/sqrt(12)), et sur le Doppler d'une tonalité complexe, sqrt(3 / (2 pi^2 (C/N0) T^3)), pour chaque signal (par défaut un canal New Radio de 5 MHz avec { $lit_4_5 } MHz occupés et un canal à bande étroite de 200 kHz avec 180 kHz occupés) ; puis, sur toute constellation LEO, des solutions de temps d'arrivée en liaison descendante avec une horloge de récepteur inconnue (à graine, avec la borne plus une erreur de synchronisation du réseau comme sigma), leur PDOP et leur sigma 3D formel, et une solution Doppler à un seul satellite sur le plus long passage avec la hauteur maintenue. MODELLED : le passage de la largeur de bande à la borne est la forme close des manuels, vérifiée par intégration numérique des spectres BPSK plat et limité en bande (cohérence interne, aucun chiffre publié détaillé n'est imposé), et la précision de positionnement est une borne sur un canal sans trajets multiples avec une erreur de synchronisation indiquée, et non un résultat obtenu.

engine-kind-leo-pnt-chain-description = Un système LEO-PNT (positionnement, navigation et synchronisation temporelle depuis l'orbite terrestre basse) de bout en bout, pour toute constellation et tout signal : la conception leo-signal nommée par signal_design (un préréglage public ou une conception [signal] en ligne) fixe le centre, la largeur de bande, la cadence de chip et la répartition de PIRE d'une bande [pass], le bilan de liaison leo-pass donne le C/N0 suivi et la gigue de code limitée en bande sur le passage, une droite de C/N0 en sin(élévation) et le SISRE diffusé du message [navmsg] (ajusté à l'altitude du satellite du passage) alimentent chaque système LEO de la solution conjointe leo-pvt de [fusion], et en option les cas leo-ppp de [ppp] ; chaque transmission est listée avec sa valeur et son unité. MODELLED.

engine-kind-contact-schedule-description = Planification des contacts au sol pour plusieurs satellites sur plusieurs stations : fenêtres d'accès apparentes (SGP4, référentiel terrestre IAU 2006/2000A, réfraction ITU-R P.834, temps de lumière), volume de données ACM DVB-S2 de chaque passage (seuils de la Table 13 d'ETSI EN 302 307-1) et un planning sans conflit (un satellite par antenne avec un temps de retournement, une station par satellite, livraison pondérée par priorité plafonnée à chaque arriéré) par un glouton à valeur marginale, une référence de base au premier arrivé et un branch and bound exact sur de petits ensembles, avec l'écart d'optimalité du glouton. MODELLED.

engine-kind-acm-link-description = Un satellite au-dessus d'une station : la distance oblique, l'élévation et l'Es/N0 de chaque passage le long du passage, le MODCOD DVB-S2 choisi à chaque pas (seuils de la Table 13 d'ETSI EN 302 307-1 plus une marge d'implémentation) et le volume de données que déplace l'ACM par rapport à la référence de base à codage constant qui se ferme au masque. MODELLED.

engine-kind-aocs-description = Contrôle d'attitude d'engin spatial : un basculement à pointage inertiel d'un corps rigide avec trois roues à réaction équilibrées ou plus sous rétroaction MRP (L = -K sigma - P omega), couples de roue de norme minimale écrêtés à la limite de chaque moteur, RK4 avec maintien d'ordre zéro ; en option bouclé sur un EKF multiplicatif à partir d'un gyroscope simulé (marche aléatoire d'angle et de vitesse) et d'un suiveur d'étoiles. Rapporte le temps d'établissement, l'erreur de pointage finale et maximale, la vitesse et le couple maximaux des roues, la fraction saturée, la dérive du moment cinétique et, avec l'estimateur, son erreur d'attitude et son NEES. La boucle à état vrai est VALIDATED par rapport à Basilisk 2.9.1 ; l'estimateur est MODELLED.

engine-kind-entry-heating-description = Rentrée atmosphérique de masse ponctuelle à 3 DoF au-dessus d'une Terre ou d'un Mars sphérique en rotation (balistique ou à portance avec inclinaison constante), RK4, à travers US76, une atmosphère exponentielle ou martienne, avec échauffement convectif au point d'arrêt de Sutton-Graves (NASA TR R-376) : décélération, flux thermique et pression dynamique maximaux, charge thermique, portée au sol, un contrôle d'énergie en référentiel tournant et la forme close d'Allen-Eggers à côté. La décélération maximale est vérifiée par rapport au nominal publié de Stardust ; l'échauffement est MODELLED.

engine-kind-eo-radiometry-description = Radiométrie et qualité d'image d'un imageur au nadir : luminance à l'ouverture d'une scène lambertienne, équation de la caméra, signal et bruit de grenaille/d'obscurité/de lecture/de quantification et SNR ; la FTM du système à Nyquist (diffraction x détecteur x traînage x gigue), la réponse relative de bord qui en découle, Q = lambda F/p et le NIIRS GIQE version 4 sans compensation de la FTM. MODELLED.

engine-kind-ascent-losses-description = Ascension plane en virage gravitationnel d'un lanceur multi-étages au-dessus d'une Terre sphérique non tournante à travers l'US Standard Atmosphere 1976 (montée verticale, coup de tangage, poussée suivant la vitesse), intégrant les pertes de gravité, de traînée, de pilotage et de contre-pression et vérifiant le dv idéal moins les pertes par rapport à la vitesse de fin de combustion ; max-Q, accélération maximale et état de fin de combustion. MODELLED.

engine-kind-time-transfer-budget-description = Transfert de temps et de fréquence bidirectionnel par satellite entre deux stations via un relais géostationnaire : l'équation bidirectionnelle résolue pour T_A - T_B avec chaque terme non réciproque (retards des équipements de station, ionosphère en bande Ku, transpondeur, Sagnac), un budget d'incertitude en quadrature dont le terme de type A est la TDEV de la liaison simulée au temps de moyennage, une liaison simulée avec bruit de phase blanc et de scintillation et une non-réciprocité diurne, et la stabilité (pente, RMS résiduel, TDEV, ADEV) de toute série BIPM Circular T Section 1, CSV MJD,ns ou enregistrements d'horloge de station IGS RINEX fournis. MODELLED.

engine-kind-optical-atmosphere-description = PNT optique MODELLED à travers l'atmosphère : pour une liaison optique et un ensemble de sites au sol avec des climats nuageux indiqués, il rapporte la perte par air clair dépendant de la longueur d'onde et de l'élévation (loi de visibilité de Kim plus Rayleigh), l'état de turbulence de Hufnagel-Valley (variance de Rytov, indice de scintillation, paramètres gamma-gamma, moyennage d'ouverture), la disponibilité pilotée par la météo par rapport à la marge de liaison (épaisseur optique des nuages issue d'un climat d'eau liquide log-normal, extinction en optique géométrique, évanouissement de turbulence indépendant), la marge de liaison nécessaire pour des disponibilités cibles, la distribution des durées d'interruption, la croissance de l'erreur de synchronisation et de mesure de distance par interruption via le modèle de holdover d'horloge, la disponibilité par diversité de sites corrélée à la distance, et les gains hypothétiques de techniques d'amélioration (longueur d'onde, ouverture de réception, réduction de scintillation par optique adaptative, marge supplémentaire). VALIDATED comme implémentation des formules indiquées par rapport à une référence indépendante mpmath : variance de Rytov, indice de scintillation, probabilité d'évanouissement gamma-gamma, facteur de moyennage d'ouverture, épaisseur optique des nuages et de l'air clair. MODELLED : chaque entrée de météo, de technique et d'horloge et les hypothèses d'indépendance et de copule ; aucun enregistrement de disponibilité mesurée n'a été comparé. Analyse à titre consultatif, et non un produit de disponibilité ou de navigation certifié.

engine-kind-holdover-test-description = Test de holdover MODELLED d'un système de synchronisation, noté à partir d'un enregistrement d'erreur de temps que l'OPÉRATEUR fournit (un journal linuxptp ptp4l, phc2sys ou ts2phc, un journal de suivi ou de statistiques chrony, un journal d'horloge TICC, TimeLab ou RINEX, ou des paires time_s,time_error_ns). Le test comporte quatre étapes et Kshana n'en réalise aucune : une RÉFÉRENCE DE BASE accrochée, le GNSS RETIRÉ par l'opérateur (le câble d'antenne ou la sortie du simulateur ; Kshana n'émet ni ne pilote rien) à un instant indiqué, le HOLDOVER sur l'oscillateur propre du système, et le RÉTABLISSEMENT après que l'opérateur a rétabli le GNSS à un second instant indiqué. L'enregistrement est scindé à ces deux instants. Référence de base : statistiques d'erreur de temps et masques ITU-T écrits pour une horloge accrochée. Holdover : statistiques, le décalage de fréquence fractionnaire que le système a tenu (une droite des moindres carrés), les masques écrits pour le holdover ou une horloge autonome, l'enveloppe de holdover ePRTC-A à partir de la durée d'accrochage indiquée, et le temps de dépassement de chaque budget d'erreur de temps. Rétablissement : si et quand |TE| est entré dans une bande indiquée et y est resté, le pic et le plus grand saut. Chaque limite est transcrite d'une table publique ITU-T (les masques de telecom-timing) ; les mots sont « mesuré par rapport au masque », et les deux instants sont la déclaration de l'opérateur, non vérifiée. Un enregistrement trop court pour un masque est INCOMPLETE, jamais extrapolé. Voir docs/TIMING-HIL.md.

engine-kind-gnss-ssv-description = Disponibilité du GNSS MODELLED et force des liaisons dans le volume de service spatial et au-delà : pour un utilisateur sur une sphère (la couche globale du livret de l'ICG) ou sur une trajectoire képlérienne (du LEO au transfert lunaire), il compte, par constellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) et pour toutes ensemble, les signaux utilisables au-dessus d'un seuil de C/N0 - disponibilité d'au moins un et de quatre signaux, durée maximale d'interruption, C/N0 reçu, dilution de précision, liaisons de lobe principal par rapport aux lobes secondaires - avec un diagramme d'émission du livret, paramétrique ou fourni par l'utilisateur, des effets facultatifs d'ionosphère, de plasmasphère et d'atmosphère sur rayon rasant le limbe et une conception facultative de récepteur à signal faible ; ainsi qu'un filtre de Kalman étendu GNSS embarqué pour les engins HEO et de transfert lunaire (dynamique orbitale, pression de radiation solaire, corps tiers, horloge) et la navigation relative d'une formation de plusieurs engins par pseudodistances à simple différence. Vérifié par rapport aux tables du livret ICG SSV dans le cadre d'un préenregistrement (xval/gnss-ssv)

engine-bench-site-title-a = Tâche (a) : détection sur des journaux de récepteur

engine-bench-site-title-b = Tâche (b) : détection sur IQ

engine-bench-site-title-c = Tâche (c) : prédiction du holdover de synchronisation temporelle

engine-bench-site-title-d = Tâche (d) : écart d'optimisme hors distribution

engine-bench-site-col-rmse-3600 = RMSE 3600 s (ns)

engine-bench-site-col-rmse-300 = RMSE 300 s (ns)

engine-bench-site-col-rmse-7200 = RMSE 7200 s (ns)

engine-bench-site-col-auc-in = AUC dans la distribution

engine-bench-site-col-auc-out = AUC hors distribution

engine-bench-site-col-optimism-gap = Écart d'optimisme

engine-bench-site-col-flag = Indicateur

engine-bench-site-col-auc = AUC

engine-bench-site-col-pd-at-pfa-cap = P_d au plafond de P_fa (borne supérieure)

engine-bench-site-flag-optimistic = optimiste

engine-bench-site-flag-within-tolerance = dans la tolérance

engine-bench-site-not-available = s. o.

engine-bench-site-none-published = Aucun résultat publié pour l'instant. Une ligne n'apparaît ici que lorsqu'un fichier de résultats est noté et ajouté ; rien sur cette page n'est une estimation.

engine-bench-site-none-for-task = Aucun résultat pour cette tâche pour l'instant.

engine-bench-site-region-label = Résultats { $title } { $split }

engine-bench-site-caption-split = Partition : { $split }

engine-bench-site-th-system = Système

engine-bench-site-th-provenance = Provenance

engine-bench-site-th-truth-sha256 = SHA-256 de la vérité terrain

engine-bench-site-provenance-carried = reprise : { $note }

engine-bench-site-provenance-scored = notée

engine-bench-site-heading = Classement kshana-bench

engine-bench-site-lede = Fichiers de résultats notés selon <code>{ $spec }</code>. Une ligne indique que ce fichier a obtenu ce score sur cette partition. Cela ne signifie pas qu'un produit a été évalué ou approuvé par qui que ce soit, et aucune organisation n'est citée comme parrain.

engine-bench-site-foot = Chaque score est modélisé, sauf si une ligne indique qu'une référence indépendante externe l'a confirmé. Licence de la spécification et des manifestes : CC-BY-4.0 / CC0 proposée, décision du propriétaire en attente. Le jeu réservé de données réelles n'est pas secret : voir la spécification, section 4.

engine-bench-site-meta-description = Scores des fichiers de résultats soumis selon kshana-bench { $spec }. À titre consultatif seulement.

engine-iq-campaign-report-roc-heading = ROC de détection

engine-iq-campaign-report-roc-note = <p class="note">Étiqueté <b>{ $label }</b>. Chaque fenêtre d'événement indiquée est un positif et chaque fenêtre de la longueur configurée en dehors des événements est un négatif. Une fenêtre compte pour un seuil lorsque la statistique de test propre au moniteur l'atteint dans la fenêtre. P<sub>fa</sub> est rapportée à chaque fenêtre négative, et non à chaque test. Les mêmes chiffres figurent dans <code>roc.json</code>.</p>

engine-iq-campaign-report-th-alarm-kind = Type d'alarme

engine-iq-campaign-report-th-positives = Positifs

engine-iq-campaign-report-th-negatives = Négatifs

engine-iq-campaign-report-th-auc = AUC

engine-iq-campaign-report-th-threshold = Seuil

engine-iq-campaign-report-th-pd-at-it = P<sub>d</sub> à ce seuil

engine-iq-campaign-report-th-pfa-at-it = P<sub>fa</sub> à ce seuil

engine-iq-campaign-report-title = Campagne { $name }

engine-iq-campaign-report-heading = Campagne de rejeu en laboratoire : { $name }

engine-iq-campaign-report-meta = Classe de données <b>{ $data_class }</b> · Kshana { $engine } · { $n_recordings } enregistrement(s) × { $n_frontends } frontal(aux) × { $n_designs } conception(s) = { $n_cells } cellules, { $n_done } terminées · empreinte <code>{ $digest }</code>

engine-iq-campaign-report-digest-incomplete = (incomplète : toutes les cellules ne sont pas terminées)

engine-iq-campaign-report-reference-note = <p class="note">Les valeurs mesurées proviennent du suivi des enregistrements. Les lignes en pointillés étiquetées <b>{ $label }</b> sont la référence analytique de séparation spectrale <code>{ $formula }</code> au J/S indiqué par le laboratoire, avec Q déduit du type d'interférence indiqué. Elles constituent un modèle de la condition indiquée, et non une mesure ni une simulation de l'interférence.</p>

engine-iq-campaign-report-summary-heading = Synthèse

engine-iq-campaign-report-th-recording = Enregistrement

engine-iq-campaign-report-th-front-end = Frontal

engine-iq-campaign-report-th-design = Conception

engine-iq-campaign-report-th-satellites = Satellites

engine-iq-campaign-report-th-mean-availability = Disponibilité moyenne

engine-iq-campaign-report-th-events-lost = Événements perdus

engine-iq-campaign-report-th-median-reacq = Réacq. médiane (s)

engine-iq-campaign-report-th-pass = Réussite

engine-iq-campaign-report-th-fail = Échec

engine-iq-campaign-report-degradation-heading = Dégradation du C/N0 en fonction du J/S indiqué

engine-iq-campaign-report-scorecard-heading = Fiche de notation

engine-iq-campaign-report-scorecard-note-nwpr = <p class="meta">Les mêmes lignes que <code>scorecard.csv</code>. La réacquisition est mesurée à partir du décalage de l'événement ; l'interruption est mesurée à partir de la perte d'accrochage. La colonne C/N0 et les courbes de dégradation utilisent l'estimation NWPR (lit bas d'environ 8 dB · Bn·T sous la gigue propre de la boucle, de sorte que ses lectures dépendent de la conception de la boucle) ; les deux estimations figurent dans <code>scorecard.json</code>.</p>

engine-iq-campaign-report-scorecard-note-m2m4 = <p class="meta">Les mêmes lignes que <code>scorecard.csv</code>. La réacquisition est mesurée à partir du décalage de l'événement ; l'interruption est mesurée à partir de la perte d'accrochage. La colonne C/N0 et les courbes de dégradation utilisent l'estimation M2M4 (insensible à la gigue propre de la boucle) ; les deux estimations figurent dans <code>scorecard.json</code>.</p>

engine-iq-campaign-report-th-sat = Sat.

engine-iq-campaign-report-th-scope = Portée

engine-iq-campaign-report-th-event = Événement

engine-iq-campaign-report-th-avail = Disp.

engine-iq-campaign-report-th-loss = Perte (s)

engine-iq-campaign-report-th-js-at-loss = J/S à la perte

engine-iq-campaign-report-th-reacq = Réacq. (s)

engine-iq-campaign-report-th-outage = Interruption (s)

engine-iq-campaign-report-th-cn0 = C/N0

engine-iq-campaign-report-th-pll = PLL σ (°)

engine-iq-campaign-report-th-dll = DLL σ (chip)

engine-iq-campaign-report-th-false-locks = Faux accrochages

engine-iq-campaign-report-th-verdict = Verdict

engine-iq-campaign-report-scope-run = exécution

engine-iq-campaign-report-scope-event = événement

engine-resilience-report-title = Auto-évaluation de la résilience PNT

engine-resilience-report-status-partner = PARTNER

engine-resilience-report-summary = <p>Moteur { $engine }, scénario { $scenario }, graine { $seed }. Répartition des preuves : { $n_validated } { $validated } / { $n_modelled } { $modelled } sous-scores. Niveau RPCF provisoire : { $level } ({ $level_basis }).</p>

engine-resilience-report-h-rpcf = Catégories de techniques DHS RPCF

engine-resilience-report-h-rdrr = Fonctions RethinkPNT

engine-resilience-report-h-yang = Critères de Yang

engine-resilience-report-th-category = Catégorie

engine-resilience-report-th-function = Fonction

engine-resilience-report-th-criterion = Critère

engine-resilience-report-th-subscore = Sous-score

engine-resilience-report-th-status = Statut

engine-resilience-report-th-basis = Base

engine-resilience-report-integrity = <p>Intégrité SHA-256 : <code>{ $integrity }</code></p>

engine-study-summary = étude « { $title } » : { $n_scenarios } scénarios

engine-study-metric-holdover = Holdover (s)

engine-study-metric-timing-rms = RMS de synchronisation temporelle (ns)

engine-study-metric-timing-p95 = p95 de synchronisation temporelle (ns)

engine-study-metric-resilience-slope = Pente de résilience (ns/s)

engine-study-metric-availability = Disponibilité

engine-study-metric-integrity = Intégrité

engine-study-metric-security = Sécurité

engine-study-th-metric = Métrique

engine-study-th-validation = Validation

engine-study-not-applicable-no-attack = s. o. (aucune attaque)

engine-study-page-title = { $title } — Étude Kshana

engine-study-eyebrow = क्षण · l'instant précis

engine-study-h-comparison = Comparaison côte à côte

engine-study-tier-note = Chaque figure de mérite est étiquetée { $validated } (vérifiée par rapport à une référence externe indépendante) ou { $modelled } (à partir des premiers principes, testée en interne), déduite de la matrice de vérification. Les colonnes sont des scénarios indépendants ; les valeurs ne sont pas normalisées d'un scénario à l'autre.

engine-study-footer = Généré par Kshana { $version } comme étude agrégée de { $n_scenarios } scénarios. Chaque scénario est reproductible à partir de son scénario, de sa graine et de la version du moteur. Libre et open source (AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">source &amp; documentation</a>.

engine-telemetry-syslog-cef-gnss-trust = CEF:0|{ $cef_header_escape }|{ $cef_header_escape2 }|{ $cef_header_escape3 }|{ $EVENT_PREFIX }.{ $band }|GNSS trust { $band }|{ $cef_severity }|{ $ext }

engine-compliance-fw-dhs-rpcf-title = US DHS Resilient PNT Conformance Framework

engine-compliance-fw-imo-ships-title = Directives de l'OMI sur les interférences GNSS pour les navires

engine-compliance-fw-easa-aviation-title = Directives de l'EASA sur les interférences GNSS pour l'aviation

engine-compliance-fw-nis2-art21-title = Directive européenne NIS2, article 21 : mesures de gestion des risques

engine-compliance-fw-en-16803-title = EN 16803, positionnement par GNSS pour les STI routiers

engine-compliance-fw-nist-ir-8323r1-title = NIST IR 8323r1, Foundational PNT Profile

engine-compliance-source-dhs-rpcf-1-title = Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework

engine-compliance-source-dhs-rpcf-1-version = Version 2.0, 26 avril 2022 (DHS Science and Technology Directorate, avec la CISA)

engine-compliance-source-dhs-rpcf-1-checked = document lu en entier ; la page d'accueil de la publication n'a pas été consultée

engine-compliance-source-imo-ships-1-title = Deliberate interference with the United States Global Positioning System and other global navigation satellite systems

engine-compliance-source-imo-ships-1-version = OMI MSC.1/Circ.1644, 18 octobre 2021

engine-compliance-source-imo-ships-1-checked = texte lu en entier sur ce miroir tiers de la circulaire, et non sur le site de l'OMI ; consulter la bibliothèque de documents de l'OMI pour la copie faisant autorité

engine-compliance-source-imo-ships-2-title = Worldwide Radionavigation System

engine-compliance-source-imo-ships-2-version = Résolution A.1046(27) de l'Assemblée de l'OMI, adoptée le 30 novembre 2011

engine-compliance-source-imo-ships-2-checked = document lu en entier

engine-compliance-source-imo-ships-3-title = Performance standards for multi-system shipborne radionavigation receivers

engine-compliance-source-imo-ships-3-version = OMI MSC.401(95), adoptée le 8 juin 2015 (modifiée par MSC.432(98), 2017)

engine-compliance-source-imo-ships-3-checked = résolution d'origine lue en entier ; le texte de l'amendement de 2017 n'a pas été lu. Aucune circulaire de l'OMI sur les interférences GNSS postérieure à MSC.1/Circ.1644 n'a été trouvée ; consulter la bibliothèque de documents de l'OMI pour les plus récentes

engine-compliance-source-easa-aviation-1-title = Global Navigation Satellite System Outage and Alterations Leading to Communication / Navigation / Surveillance Degradation

engine-compliance-source-easa-aviation-1-version = EASA Safety Information Bulletin SIB 2022-02R4, publié le 3 juillet 2026, corrigé le 22 juillet 2026 (à titre informatif, non obligatoire)

engine-compliance-source-easa-aviation-1-checked = révision 4 lue en entier ; les sections sont citées par leur intitulé, car le bulletin ne numérote pas ses recommandations. Revérifié le 2026-10-10 : le PDF du bulletin, la page de l'outil AD de l'EASA (qui indique qu'il n'est remplacé par aucun autre) et la page GNSS de l'EASA ne mentionnent aucune révision ultérieure ni aucun bulletin numéroté 2026-07 ; un bandeau mentionnant la révision 2 du SIB 2026-07 n'a pas été trouvé, de sorte que la question reste ouverte et doit être vérifiée sur la page EASA en ligne. Les Conflict Zone Information Bulletins n'ont pas été ouverts

engine-compliance-source-nis2-art21-1-title = Directive (EU) 2022/2555 on measures for a high common level of cybersecurity across the Union (NIS 2 Directive)

engine-compliance-source-nis2-art21-1-version = JO L 333, 27.12.2022, p. 80-152

engine-compliance-source-nis2-art21-1-checked = les lettres des paragraphes de l'article 21 ont été lues à partir d'un résumé de la page EUR-Lex et correspondent au texte publié ; vérifier sur la page avant de citer une lettre dans un dépôt de dossier

engine-compliance-source-en-16803-1-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 1: Definitions and system engineering procedures for the establishment and assessment of performances

engine-compliance-source-en-16803-1-version = EN 16803-1:2020 (catalogue : valide à partir du 2 octobre 2020, remplace l'édition de 2016)

engine-compliance-source-en-16803-1-checked = texte de portée du catalogue seulement ; la norme est payante et n'a pas été lue

engine-compliance-source-en-16803-2-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 2: Assessment of basic performances of GNSS-based positioning terminals

engine-compliance-source-en-16803-2-version = EN 16803-2:2020 (catalogue : valide à partir du 2 octobre 2020)

engine-compliance-source-en-16803-2-checked = texte de portée du catalogue seulement ; la norme est payante et n'a pas été lue

engine-compliance-source-en-16803-3-title = Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 3: Assessment of security performances of GNSS-based positioning terminals

engine-compliance-source-en-16803-3-version = EN 16803-3:2020 (catalogue : valide à partir du 2 octobre 2020)

engine-compliance-source-en-16803-3-checked = texte de portée du catalogue seulement ; la norme est payante et n'a pas été lue. Le texte du catalogue désigne par un numéro la clause 6 (signaux enregistrés par opposition aux signaux simulés) et l'annexe A (une catégorisation de haut niveau des attaques) et rien d'autre ; le catalogue ne donne aucun nom de comité, aucun n'est donc indiqué ici

engine-compliance-source-nist-ir-8323r1-1-title = Foundational PNT Profile: Applying the Cybersecurity Framework for the Responsible Use of Positioning, Navigation, and Timing (PNT) Services

engine-compliance-source-nist-ir-8323r1-1-version = NIST IR 8323r1, janvier 2023 (NIST Internal Report)

engine-compliance-source-nist-ir-8323r1-1-checked = le PDF a été récupéré le 2026-10-18 (SHA-256 enregistré dans tests/fixtures/compliance/headings.json) et ses tableaux 3 à 25 du Profile ont été lus pour les sous-catégories citées ; les autres sections, les annexes et la page d'accueil de la publication n'ont pas été lues. Les identifiants de sous-catégories suivent les tableaux propres au Profile, qui utilisent les identifiants du Cybersecurity Framework 1.1

engine-compliance-cap-receiver-log-trust-name = Évaluation de la confiance du journal de récepteur

engine-compliance-cap-receiver-log-trust-output = état de confiance par époque du journal propre d'un récepteur réel, heures d'alarme et concordance avec les événements indiqués avant l'exécution

engine-compliance-cap-jamming-effects-name = Effets du brouillage sur le bilan de liaison

engine-compliance-cap-jamming-effects-output = densité porteuse sur bruit et état d'accrochage par satellite sous une géométrie de brouilleur indiquée

engine-compliance-cap-spoofing-detection-name = Détection du leurrage et du meaconing

engine-compliance-cap-spoofing-detection-output = décisions du détecteur et discrimination du détecteur sous une attaque de leurrage indiquée

engine-compliance-cap-integrity-monitoring-name = Surveillance de l'intégrité et niveaux de protection

engine-compliance-cap-integrity-monitoring-output = niveaux de protection, disponibilité par rapport aux limites d'alerte et résultats de détection de défauts

engine-compliance-cap-holdover-name = Holdover et fonctionnement en autonomie

engine-compliance-cap-holdover-output = croissance de l'erreur de position ou de temps tant que le GNSS est refusé, par rapport à un seuil indiqué

engine-compliance-cap-source-diversity-name = Sources PNT alternatives et diversifiées

engine-compliance-cap-source-diversity-output = performance de navigation ou de synchronisation temporelle issue de sources indépendantes de la bande GNSS principale

engine-compliance-cap-resilience-scoring-name = Notation de la résilience sur des ensembles de menaces

engine-compliance-cap-resilience-scoring-output = rapports de survie et de résilience par vecteur de menace sur un ensemble indiqué, avec les hypothèses indiquées

engine-compliance-cap-run-provenance-name = Provenance reproductible des exécutions

engine-compliance-cap-run-provenance-output = empreinte du scénario, version du moteur et graine portées dans chaque résultat afin de pouvoir répéter une exécution

engine-compliance-req-dhs-s5-2-reference = Section 5.2 (Prévenir, Répondre, Rétablir)

engine-compliance-req-dhs-s5-2-asks = La résilience est décrite comme trois fonctions : prévenir les dommages, répondre (détecter, signaler, atténuer, contenir) et rétablir. La détection est probabiliste, de sorte que les fausses alarmes et les détections manquées comptent toutes deux.

engine-compliance-req-dhs-s5-2-gap = La prévention est une propriété de conception du produit qu'aucune sortie de simulation ne montre. Les statistiques de détection d'une exécution synthétique ou d'une seule session ne sont pas un taux de fausses alarmes ou de détections manquées mesuré pour un produit déployé.

engine-compliance-req-dhs-l1-r1-reference = Niveau 1, exigence 1

engine-compliance-req-dhs-l1-r1-asks = Vérifier que les données stockées provenant de sources externes correspondent aux formats et aux plages de valeurs des normes concernées.

engine-compliance-req-dhs-l1-r1-gap = Une propriété d'assurance logicielle et de validation des entrées du produit testé. Kshana n'inspecte pas la gestion des entrées d'un produit.

engine-compliance-req-dhs-l1-r2-reference = Niveau 1, exigence 2

engine-compliance-req-dhs-l1-r2-asks = Permettre un rétablissement manuel complet en effaçant ou en réinitialisant la mémoire, ce qui ramène le système à une performance définie une fois la menace disparue.

engine-compliance-req-dhs-l1-r2-gap = Un journal de récepteur montre quand une position est devenue non fiable et quand elle a été rétablie ; il ne montre pas qu'une réinitialisation manuelle efface tous les états mémorisés.

engine-compliance-req-dhs-l1-r3-reference = Niveau 1, exigence 3

engine-compliance-req-dhs-l1-r3-asks = Recharger ou mettre à jour le micrologiciel de façon sécurisée.

engine-compliance-req-dhs-l1-r3-gap = La sécurité des mises à jour de micrologiciel échappe à ce qu'observe toute sortie de Kshana.

engine-compliance-req-dhs-l2-r4-reference = Niveau 2, exigence 4

engine-compliance-req-dhs-l2-r4-asks = Identifier les sources PNT compromises et les empêcher de corrompre la solution.

engine-compliance-req-dhs-l2-r4-gap = Kshana évalue les détecteurs et moniteurs qu'il modélise ou qu'il exécute sur un journal ; savoir si l'exclusion de sources propre à un produit fonctionne exige l'état interne du produit, et pas seulement son journal.

engine-compliance-req-dhs-l2-r5-reference = Niveau 2, exigence 5

engine-compliance-req-dhs-l2-r5-asks = Rétablir automatiquement les sources et le système sans interrompre la sortie ; une solution est toujours fournie pendant la menace, avec une dégradation éventuellement non bornée.

engine-compliance-req-dhs-l2-r5-gap = Les exécutions de holdover bornent une dérive modélisée pour une horloge ou un modèle inertiel indiqué, et non le comportement de rétablissement propre au produit.

engine-compliance-req-dhs-l3-r6-reference = Niveau 3, exigence 6

engine-compliance-req-dhs-l3-r6-asks = Des données corrompues provenant d'une source ne doivent pas contaminer une autre source.

engine-compliance-req-dhs-l3-r6-gap = Kshana exécute les sources côte à côte ; l'isolation des sources à l'intérieur d'un produit exige une revue de conception ou une injection de fautes dans le produit.

engine-compliance-req-dhs-l3-r7-reference = Niveau 3, exigence 7

engine-compliance-req-dhs-l3-r7-asks = Recouper les solutions de toutes les sources et maintenir la dégradation bornée pendant une menace.

engine-compliance-req-dhs-l3-r7-gap = La dégradation bornée est montrée pour les capteurs modélisés ; le recoupement propre au produit n'est pas observé.

engine-compliance-req-dhs-l4-r8-reference = Niveau 4, exigence 8

engine-compliance-req-dhs-l4-r8-asks = Utiliser des sources de technologies différentes contre les menaces de mode commun, sans dégradation pendant la menace.

engine-compliance-req-dhs-l4-r8-gap = Un argument de mode commun exige l'ensemble de sources du produit réel et une menace qui les couvre toutes ; un scénario en indique une, il ne prouve pas que le produit n'a aucune faiblesse partagée.

engine-compliance-req-dhs-s5-5-reference = Section 5.5 (mode commun)

engine-compliance-req-dhs-s5-5-asks = Des mécanismes diversifiés ne doivent pas partager de faiblesse : par exemple, un brouilleur qui couvre deux bandes met en échec la diversité de bandes.

engine-compliance-req-dhs-s5-5-gap = La notation utilise un ensemble de menaces synthétique, indiqué comme tel ; ce ne sont pas des données de terrain.

engine-compliance-req-dhs-s8-1-8-3-reference = Sections 8.1 à 8.3 (évaluation)

engine-compliance-req-dhs-s8-1-8-3-asks = L'évaluation combine l'analyse statique et l'analyse dynamique, où des vecteurs de test remplacent les menaces ; les classes de test sont la défaillance de source, l'interférence et les fautes internes. Les simulateurs sont cités comme méthode de test.

engine-compliance-req-dhs-s8-1-8-3-gap = Le mouvement et les événements exportés peuvent piloter un simulateur de laboratoire (docs/TEST-BENCH.md). Kshana n'écrit aucun signal : le simulateur et son opérateur autorisé fournissent la menace.

engine-compliance-req-dhs-s8-6-reference = Section 8.6 (éléments du plan de test)

engine-compliance-req-dhs-s8-6-asks = Un plan de test indique le niveau, l'exigence, les entrées, les références, l'accès aux données nécessaire, la procédure avec ses critères de réussite ou d'échec, les résultats et les notes.

engine-compliance-req-dhs-s8-6-gap = Les critères de réussite ou d'échec sont choisis par l'évaluateur ; Kshana consigne les entrées, les seuils et les empreintes avec lesquels il a été exécuté.

engine-compliance-req-imo-1644-3-reference = MSC.1/Circ.1644, paragraphe 3

engine-compliance-req-imo-1644-3-asks = Les interférences GNSS délibérées constituent un risque important pour la sécurité de la navigation, des personnes, des biens et de l'environnement.

engine-compliance-req-imo-1644-3-gap = Un énoncé de risque ; Kshana quantifie des effets pour une géométrie indiquée, et non le risque dans une zone maritime.

engine-compliance-req-imo-1644-5-reference = MSC.1/Circ.1644, paragraphe 5

engine-compliance-req-imo-1644-5-asks = Les États membres sont invités à limiter les interférences émanant de leur territoire, à envisager des avertissements aux navigateurs et à envisager des mesures contre les émissions non autorisées.

engine-compliance-req-imo-1644-5-gap = Destiné aux États et aux administrations ; aucune sortie de simulation n'y répond.

engine-compliance-req-imo-a1046-3-reference = Résolution A.1046(27), annexe, paragraphe 3 (entrées de port, approches de port et eaux côtières)

engine-compliance-req-imo-a1046-3-asks = Un système n'est considéré comme disponible que tant qu'il fournit l'intégrité indiquée avec la précision indiquée, mis à jour à une cadence indiquée, avec un avertissement d'intégrité dans un délai indiqué.

engine-compliance-req-imo-a1046-3-gap = Kshana calcule des niveaux de protection et la disponibilité par rapport à une limite d'alerte pour une géométrie modélisée ; les valeurs de précision, de disponibilité et de délai d'avertissement de la résolution ne sont pas affirmées ici.

engine-compliance-req-imo-a1046-2-reference = Résolution A.1046(27), annexe, paragraphe 2 (eaux océaniques)

engine-compliance-req-imo-a1046-2-asks = Exigences de précision, de cadence de mise à jour, de disponibilité et d'avertissement d'intégrité du système de radionavigation pour la phase océanique.

engine-compliance-req-imo-a1046-2-gap = Comme ci-dessus pour la phase océanique.

engine-compliance-req-imo-401-3-1-reference = MSC.401(95), 3.1 à 3.2

engine-compliance-req-imo-401-3-1-asks = Le récepteur utilise des signaux civils d'au moins deux systèmes indépendants et fournit une solution de position, de vitesse et de temps avec la résilience et l'intégrité nécessaires.

engine-compliance-req-imo-401-3-1-gap = L'intégrité multiconstellation est modélisée ; l'utilisation effective de deux systèmes par le récepteur relève d'un test du produit.

engine-compliance-req-imo-401-3-11-reference = MSC.401(95), 3.11 à 3.14

engine-compliance-req-imo-401-3-11-asks = Le récepteur évalue la précision et l'intégrité par phase de navigation, émet une mise en garde lorsqu'il ne peut pas le faire, avertit lorsqu'aucune nouvelle solution n'arrive à temps et affiche la dernière valeur plausible avec un état explicite.

engine-compliance-req-imo-401-3-11-gap = Kshana lit la synchronisation temporelle et la confiance à partir d'un journal ; savoir si les intervalles de mise en garde et d'avertissement affichés correspondent aux besoins de la norme exige l'interface utilisateur du récepteur, qu'un journal ne montre pas.

engine-compliance-req-imo-401-3-16-reference = MSC.401(95), 3.15 à 3.16

engine-compliance-req-imo-401-3-16-asks = Afficher l'état de l'augmentation, ainsi que la position, le cap, la vitesse, l'heure et les sources utilisées.

engine-compliance-req-imo-401-3-16-gap = Exigences d'affichage ; aucune sortie de Kshana n'y répond.

engine-compliance-req-imo-401-4-2-reference = MSC.401(95), 4.2

engine-compliance-req-imo-401-4-2-asks = Fonctionner de façon satisfaisante dans des conditions normales d'interférence, conformément à la résolution A.694(17) (exigences générales applicables aux équipements radioélectriques de bord) et à l'environnement radioélectrique typique à bord et extérieur. Ce n'est pas une exigence de protection contre le brouillage ou le leurrage.

engine-compliance-req-imo-401-4-2-gap = Les essais en interférence normale sont une mesure de laboratoire sur le récepteur ; la résolution A.694(17) elle-même n'a pas été lue.

engine-compliance-req-easa-desc-reference = SIB 2022-02R4, Description

engine-compliance-req-easa-desc-asks = Le leurrage est plus difficile à détecter et plus dangereux que le brouillage ; il n'existe aucune alerte en cabine qui permette de distinguer les deux ; les effets vont de fausses alertes de terrain à des données de surveillance corrompues et peuvent persister après avoir quitté la zone.

engine-compliance-req-easa-desc-gap = Kshana modélise les effets sur le détecteur et sur la liaison ; l'alerte en cabine est une propriété de l'équipement.

engine-compliance-req-easa-mfr-reference = SIB 2022-02R4, Recommandation(s) : constructeurs d'aéronefs et d'équipements, devraient

engine-compliance-req-easa-mfr-asks = Évaluer les effets du brouillage et du leurrage sur le produit, y compris les effets cumulés, et donner aux exploitants des indications pour repérer un leurrage suspecté et sur les limites d'exploitation en cas de perte du GNSS.

engine-compliance-req-easa-mfr-gap = L'évaluation du produit lui-même incombe au constructeur ; Kshana fournit un scénario reproductible et un journal de récepteur noté comme éléments de preuve dans cette évaluation.

engine-compliance-req-easa-ops-spoof-reference = SIB 2022-02R4, Recommandation(s) : exploitants aériens, devraient (leurrage)

engine-compliance-req-easa-ops-spoof-asks = Comparer la position et l'heure GNSS à des sources non GNSS et surveiller la valeur d'incertitude de position et les aides à la navigation pour remarquer un leurrage.

engine-compliance-req-easa-ops-spoof-gap = Les procédures opérationnelles et la formation sont hors du champ des sorties de simulation.

engine-compliance-req-easa-ansp-reference = SIB 2022-02R4, Recommandation(s) : fournisseurs ATM/ANS, devraient ; organisations participant à la conception ou à la production d'équipements ATM/ANS, devraient

engine-compliance-req-easa-ansp-asks = Évaluer l'effet d'une perte de la synchronisation temporelle GNSS sur les systèmes de communication, de navigation et de surveillance, conserver les aides à la navigation au sol et aider à détecter les interférences.

engine-compliance-req-easa-ansp-gap = Les exécutions de holdover de synchronisation temporelle répondent à l'évaluation de la perte de synchronisation ; la conception des systèmes au sol et les procédures ne sont pas couvertes.

engine-compliance-req-easa-report-reference = SIB 2022-02R4, Recommandation(s) : rappels de clôture sur le signalement

engine-compliance-req-easa-report-asks = Signaler les événements affectant la sécurité en vertu du règlement sur le signalement des événements, et signaler au constructeur un leurrage suspecté et un brouillage à risque plus élevé.

engine-compliance-req-easa-report-gap = Une obligation de signalement ; aucune sortie n'y répond.

engine-compliance-req-nis2-21-1-reference = Article 21(1)

engine-compliance-req-nis2-21-1-asks = Prendre des mesures techniques, opérationnelles et organisationnelles proportionnées pour gérer les risques pesant sur les réseaux et les systèmes d'information, compte tenu de l'état de l'art, de l'exposition, de la taille et de la probabilité et de la gravité des incidents.

engine-compliance-req-nis2-21-1-gap = Kshana ne traite que de la dépendance d'un système au positionnement et à la synchronisation temporelle, et non du risque de sécurité de l'information en général.

engine-compliance-req-nis2-21-2-a-reference = Article 21(2)(a)

engine-compliance-req-nis2-21-2-a-asks = Politiques relatives à l'analyse des risques et à la sécurité des systèmes d'information.

engine-compliance-req-nis2-21-2-a-gap = Apporte des éléments de preuve en faveur de la partie PNT d'une analyse des risques ; la politique elle-même est organisationnelle.

engine-compliance-req-nis2-21-2-b-reference = Article 21(2)(b)

engine-compliance-req-nis2-21-2-b-asks = Gestion des incidents.

engine-compliance-req-nis2-21-2-b-gap = Un journal de récepteur noté aide à dater le début et la fin d'un incident d'interférence PNT ; le processus de gestion est organisationnel.

engine-compliance-req-nis2-21-2-c-reference = Article 21(2)(c)

engine-compliance-req-nis2-21-2-c-asks = Continuité des activités, par exemple gestion des sauvegardes, reprise après sinistre et gestion de crise.

engine-compliance-req-nis2-21-2-c-gap = Montre combien de temps un repli modélisé maintient une borne de synchronisation temporelle ou de position ; les plans de continuité sont organisationnels.

engine-compliance-req-nis2-21-2-d-reference = Article 21(2)(d)

engine-compliance-req-nis2-21-2-d-asks = Sécurité de la chaîne d'approvisionnement, y compris les relations avec les fournisseurs directs.

engine-compliance-req-nis2-21-2-d-gap = Kshana n'évalue pas les fournisseurs. Utiliser un bench neutre et reproductible pour la recette d'un récepteur est un élément dont un acheteur peut se servir, et non une évaluation de la chaîne d'approvisionnement.

engine-compliance-req-nis2-21-2-e-reference = Article 21(2)(e)

engine-compliance-req-nis2-21-2-e-asks = Sécurité de l'acquisition, du développement et de la maintenance des systèmes, y compris le traitement et la divulgation des vulnérabilités.

engine-compliance-req-nis2-21-2-e-gap = Des essais de recette répétables du comportement d'un récepteur face aux interférences apportent des éléments de preuve en faveur de la partie acquisition ; le traitement des vulnérabilités est hors du champ.

engine-compliance-req-nis2-21-2-f-reference = Article 21(2)(f)

engine-compliance-req-nis2-21-2-f-asks = Politiques et procédures pour évaluer l'efficacité des mesures de gestion des risques en matière de cybersécurité.

engine-compliance-req-nis2-21-2-f-gap = Des exécutions à empreinte et répétables, et des événements indiqués avant la notation, apportent des éléments de preuve en faveur d'un test d'efficacité ; la politique et son calendrier sont organisationnels.

engine-compliance-req-nis2-21-2-ghij-reference = Article 21(2)(g) à (j)

engine-compliance-req-nis2-21-2-ghij-asks = Hygiène informatique et formation ; cryptographie et chiffrement ; sécurité des ressources humaines, contrôle d'accès et gestion des actifs ; authentification multifacteur et communications sécurisées.

engine-compliance-req-nis2-21-2-ghij-gap = Ne peut pas être traité par les sorties d'exécutions de positionnement et de synchronisation temporelle.

engine-compliance-req-nis2-21-3-reference = Article 21(3)

engine-compliance-req-nis2-21-3-asks = Lors du choix des mesures relatives à la chaîne d'approvisionnement, tenir compte des vulnérabilités propres à chaque fournisseur ainsi que de la qualité et du développement sécurisé de ses produits.

engine-compliance-req-nis2-21-3-gap = Voir l'article 21(2)(d).

engine-compliance-req-en16803-1-reference = EN 16803-1 (définitions et procédures d'ingénierie système)

engine-compliance-req-en16803-1-asks = Définit l'architecture des STI routiers, les caractéristiques et les métriques de performance, ainsi qu'une méthode pour comparer des environnements de test. N'impose aucune exigence.

engine-compliance-req-en16803-1-gap = Les numéros de clauses ne sont pas visibles publiquement. Un titulaire de licence devrait faire correspondre les champs de sortie de Kshana aux définitions des métriques.

engine-compliance-req-en16803-2-reference = EN 16803-2 (performances de base des terminaux GNSS)

engine-compliance-req-en16803-2-asks = Procédures d'essai en laboratoire fondées sur le rejeu pour la disponibilité, la continuité, la précision, l'intégrité et le temps avant la première position de la sortie de position. N'impose aucune valeur minimale.

engine-compliance-req-en16803-2-gap = Le mouvement exporté par Kshana peut piloter un rejeu ; la procédure de la norme, son traitement des signaux enregistrés et son calcul des métriques ne sont pas reproduits ici et exigent le texte sous licence.

engine-compliance-req-en16803-3-6-reference = EN 16803-3, clause 6

engine-compliance-req-en16803-3-6-asks = Distingue les signaux enregistrés des signaux simulés dans les essais de sécurité.

engine-compliance-req-en16803-3-6-gap = Kshana n'enregistre ni ne simule aucun signal. Il exporte le mouvement et les événements et note le journal du récepteur.

engine-compliance-req-en16803-3-a-reference = EN 16803-3, annexe A

engine-compliance-req-en16803-3-a-asks = Une catégorisation de haut niveau des attaques contre le GNSS : interférence, brouillage, meaconing et leurrage.

engine-compliance-req-en16803-3-a-gap = Les scénarios de Kshana nomment les classes d'attaque dans les mêmes grandes catégories ; une table de correspondance au niveau des clauses exige l'annexe sous licence.

engine-compliance-req-nist-id-ra-1-reference = ID.RA-1 (Risk Assessment)

engine-compliance-req-nist-id-ra-1-asks = Identifier, documenter et signaler les vulnérabilités du système PNT et de ce qui distribue les données PNT ; lorsque c'est sûr, tester la sensibilité aux perturbations ou à la manipulation, ce qui peut recourir à la simulation de signaux PNT, dans les limites de la loi et de la continuité des activités.

engine-compliance-req-nist-id-ra-1-gap = Kshana caractérise la sensibilité dans des scénarios modélisés et dans le journal enregistré d'un récepteur. L'inventaire des vulnérabilités du système réel incombe à l'opérateur, et tout essai RF est mené avec l'équipement et l'autorisation de l'opérateur : Kshana n'émet rien.

engine-compliance-req-nist-id-ra-3-reference = ID.RA-3 (Risk Assessment)

engine-compliance-req-nist-id-ra-3-asks = Identifier et documenter les menaces internes et externes pesant sur le PNT, depuis la perturbation naturelle et involontaire jusqu'à l'attaque délibérée comme le brouillage, le leurrage et les attaques par retard.

engine-compliance-req-nist-id-ra-3-gap = Les scénarios indiquent des menaces et leurs effets. Une évaluation documentée des menaces pour le site et le système propres à l'utilisateur lui incombe ; aucun scénario n'est une preuve qu'une menace existe à cet endroit.

engine-compliance-req-nist-id-ra-4-reference = ID.RA-4 (Risk Assessment)

engine-compliance-req-nist-id-ra-4-asks = Identifier les impacts et les probabilités potentiels ; pour chaque menace, indiquer l'étendue de l'impact, la manière dont l'erreur se manifeste (échelon ou rampe), les seuils de détection et ce que l'erreur provoque en aval.

engine-compliance-req-nist-id-ra-4-gap = Les exécutions donnent des chiffres d'impact (croissance de l'erreur, niveaux de protection, effets sur la liaison) pour des capteurs modélisés et une menace indiquée. Les probabilités ne sont pas produites, et un impact modélisé n'est pas un impact mesuré.

engine-compliance-req-nist-id-ra-5-reference = ID.RA-5 (Risk Assessment)

engine-compliance-req-nist-id-ra-5-asks = Utiliser les menaces, les vulnérabilités, les probabilités et les impacts pour évaluer le risque, et le réévaluer périodiquement et lorsque le système ou la menace change.

engine-compliance-req-nist-id-ra-5-gap = La notation utilise un ensemble de menaces synthétique, indiqué comme tel. Des exécutions à empreinte et répétables rendent une réévaluation comparable ; le jugement sur le risque et son calendrier sont organisationnels.

engine-compliance-req-nist-pr-ds-6-reference = PR.DS-6 (Data Security)

engine-compliance-req-nist-pr-ds-6-asks = Vérifier l'intégrité des données PNT lorsque les sources divergent, par exemple en recoupant plusieurs fréquences, constellations ou sources indépendantes.

engine-compliance-req-nist-pr-ds-6-gap = Kshana calcule des niveaux de protection et des résultats inter-sources pour une géométrie et des capteurs modélisés ; les contrôles d'intégrité à l'intérieur d'un produit ne sont pas observés.

engine-compliance-req-nist-pr-ip-10-reference = PR.IP-10 (Information Protection Processes and Procedures)

engine-compliance-req-nist-pr-ip-10-asks = Tester les plans de réponse et de rétablissement ; pour un système doté d'une source de temps de secours, retirer la source principale et confirmer que la précision du temps, les échelons et les rampes restent dans les exigences d'horloge indiquées.

engine-compliance-req-nist-pr-ip-10-gap = Une exécution de holdover modélise le retrait et vérifie l'erreur par rapport à un seuil indiqué ; un journal de récepteur noté montre une perte et un rétablissement réels. Le test sur le serveur de temps propre à l'opérateur, et toute RF utilisée pour cela, incombent à l'opérateur.

engine-compliance-req-nist-pr-pt-5-reference = PR.PT-5 (Protective Technology)

engine-compliance-req-nist-pr-pt-5-asks = Utiliser des mécanismes de résilience en conditions normales et défavorables : rejeter les mauvais signaux et données, et associer le holdover à la détection d'anomalies, à des sources redondantes ou fusionnées et au rétablissement.

engine-compliance-req-nist-pr-pt-5-gap = Les mécanismes modélisés et leurs limites sont montrés ; savoir si un produit les met en œuvre relève d'un test du produit.

engine-compliance-req-nist-de-ae-2-reference = DE.AE-2 (Anomalies and Events)

engine-compliance-req-nist-de-ae-2-asks = Analyser les événements PNT détectés en temps réel et après coup (source, statistiques d'erreur, durée, fréquence, lieu), distinguer les événements nuisibles du fonctionnement normal, et conserver les données brutes et l'analyse.

engine-compliance-req-nist-de-ae-2-gap = Kshana note un journal enregistré après coup et conserve les empreintes de ce qu'il a exécuté. Il ne localise ni n'attribue une source d'interférence et ne surveille pas en temps réel comme un service.

engine-compliance-req-nist-de-ae-3-reference = DE.AE-3 (Anomalies and Events)

engine-compliance-req-nist-de-ae-3-asks = Recueillir et corréler les données d'événements issues de plusieurs sources et capteurs, et recouper les données PNT de plus d'une source pour détecter un comportement anormal.

engine-compliance-req-nist-de-ae-3-gap = Les moniteurs de Kshana recoupent les flux d'un journal de récepteur ou d'un scénario ; la corrélation entre les capteurs et les journaux propres à un opérateur lui incombe.

engine-compliance-req-nist-de-ae-4-reference = DE.AE-4 (Anomalies and Events)

engine-compliance-req-nist-de-ae-4-asks = Déterminer l'impact des événements sur les données PNT et sur les applications qui en dépendent, y compris les événements peu fréquents.

engine-compliance-req-nist-de-ae-4-gap = L'impact est montré sur la sortie PNT d'une exécution ou d'un journal. Les effets sur une application aval précise exigent les exigences propres à cette application.

engine-compliance-req-nist-de-ae-5-reference = DE.AE-5 (Anomalies and Events)

engine-compliance-req-nist-de-ae-5-asks = Définir et documenter les seuils d'alerte d'incident à partir des tolérances d'erreur et d'incertitude dont l'application a besoin, avec le délai de notification.

engine-compliance-req-nist-de-ae-5-gap = Les exécutions sont notées par rapport aux seuils que l'utilisateur indique et les consignent. Le choix des seuils et de la procédure d'alerte incombe à l'utilisateur.

engine-compliance-req-nist-de-cm-1-reference = DE.CM-1 (Security Continuous Monitoring)

engine-compliance-req-nist-de-cm-1-asks = Surveiller les sources et les sorties PNT par rapport à des références de base pour détecter les anomalies, en utilisant des sources diversifiées et la détection et l'exclusion de défauts, et vérifier que la surveillance couvre les modes de défaillance identifiés.

engine-compliance-req-nist-de-cm-1-gap = Kshana exécute et note de tels moniteurs sur des journaux et des scénarios. La surveillance continue d'un système en service, et la couverture de tous les modes de défaillance d'un produit, ne sont pas démontrées par un ensemble d'exécutions.

engine-compliance-req-nist-de-dp-3-reference = DE.DP-3 (Detection Processes)

engine-compliance-req-nist-de-dp-3-asks = Tester que la détection d'événements fonctionne comme prévu, périodiquement et après les mises à niveau, par rapport aux profils de menaces actuels.

engine-compliance-req-nist-de-dp-3-gap = Des scénarios répétables à empreinte et des événements indiqués avant la notation apportent des éléments de preuve en faveur d'un tel test ; l'exécuter sur l'équipement de l'opérateur selon un calendrier incombe à ce dernier.

engine-compliance-req-nist-rs-an-5-reference = RS.AN-5 (Analysis)

engine-compliance-req-nist-rs-an-5-asks = Mettre en place la vérification et la validation pour les modes de défaillance connus et les vulnérabilités nouvellement découvertes, et enregistrer les données PNT nominales et anormales issues d'incidents pour améliorer la détection ultérieure.

engine-compliance-req-nist-rs-an-5-gap = Un journal noté caractérise un incident après coup. Recevoir les vulnérabilités divulguées et agir en conséquence est un processus extérieur à toute exécution.

engine-compliance-req-nist-rs-mi-2-reference = RS.MI-2 (Mitigation)

engine-compliance-req-nist-rs-mi-2-asks = Une fois un incident contenu, l'atténuer avec des sources PNT alternatives ou complémentaires afin que l'exploitation se poursuive, et ramener le système à un état de fonctionnement correct.

engine-compliance-req-nist-rs-mi-2-gap = Les exécutions montrent combien de temps des sources de repli modélisées maintiennent une erreur bornée ; le confinement et le retour en service sont des étapes opérationnelles.

engine-compliance-mapping-header-reference = Référence

engine-compliance-mapping-header-asks = Ce qu'elle exige (paraphrasé)

engine-compliance-mapping-header-capabilities = Sorties de Kshana qui apportent des éléments de preuve en faveur de celle-ci

engine-compliance-mapping-header-gap = Écart

engine-compliance-mapping-none = aucune

engine-compliance-source-line = **{ $title }** : { $version }. <{ $url }>. Consulté { $accessed } : { $checked }.
