# docs--python-api: translations (fr)

# text
seg-5ad814c7ef9e = Notes

# text
seg-2bd2101ce454 = Surface

# text
seg-fffbeccd4266 = Symbole

# text
seg-a129b9e613d0 = Type

# text
# c1: docs/PYTHON_API.md
seg-ce0b6a889a87 = Source : <c1/>

# text
# c1: abi3
# c2: kshana.pyi
# c3: py.typed
# c4: mypy
# c5: pyright
seg-aea4d3625c20 = Kshana livre une interface de programmation d'application (API) Python de premier plan, construite avec <a1>PyO3</a1> et <a2>maturin</a2>. Ses wheels <c1/> sont construits sur l'interface binaire d'application (ABI) stable de Python, de sorte qu'un seul wheel par plateforme fonctionne avec CPython ≥ { "3.9" } ; les wheels couvrent Linux, macOS et Windows, chacun en x86-64 et en ARM 64 bits (voir <a3>WHEEL_TAGS.md</a3>). Un stub de types fourni (<c2/> + <c3/>) donne aux éditeurs et à <c4/>/<c5/> toute l'information de typage.

# text
seg-8b0ad6639bd5 = Démarrage rapide

# text
# c1: scenarios/
# c2: pip install numpy
seg-28e092a5a781 = Exécutez ces extraits depuis la racine d'une copie du dépôt : ils lisent des fichiers de scénario sous <c1/>. La ligne NumPy nécessite <c2/>.

# text
seg-8c83544270b5 = Signature

# text
seg-fa90b5cd182b = Renvoie

# text
# c1: .json
# c2: .svg
# c3: .summary
# c4: .csv
# c5: .data()
# c6: .array()
# c7: .columns()
# c8: .series()
# c9: .write_csv()
seg-6f62744a47df = résultat typé (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

# text
seg-67cd4e7f6ad0 = document de résultat sous forme de chaîne JSON (JavaScript Object Notation)

# text
seg-8246b2be7aaf = types de scénario disponibles + métadonnées (analysées)

# text
# c1: scenario_kinds
seg-b5ad97d3ec18 = les mêmes métadonnées sous forme d'UNE chaîne de tableau JSON, et non d'une liste (conservée pour les appelants existants ; utilisez <c1/> pour la liste analysée)

# text
seg-8ce669f8e1d0 = messages d'erreur (vide si valide)

# text
# c1: invalid_input
# c2: non_convergence
# c3: unsupported
# c4: io_error
# c5: None
seg-6017d21f52dd = étiquette de catégorie d'échec (<c1/>, <c2/>, <c3/> ou <c4/>), ou <c5/> en cas de succès

# text
seg-c62c5ab99132 = version du moteur

# text
# c1: receiver-trust
# c2: [platform] kind = "vessel"
seg-fdaaf33250d1 = évaluer un véritable journal de récepteur décrit par un scénario <c1/> : document de résultat, CSV de confiance par époque, graphique et synthèse ; une table <c2/> ajoute les moniteurs maritimes et le score de confiance de 0 à 100 avec ses motifs (à titre consultatif)

# text
seg-0fb76af3d043 = un extrait NMEA borné évalué comme le mode en direct l'évalue : état par époque, score de 0 à 100 et motifs, une synthèse (ni socket ni passerelle ; à titre consultatif)

# text
seg-6ecd9bb3a1cd = un journal NMEA de navire en exécution par lot : le modèle de score et le score de chaque époque avec ses déductions (à titre consultatif)

# text
# c1: events_toml
# c2: events
seg-7cd62f15bc3c = le catalogue et le plan Jammertest publiés sous forme d'événements de vérité planifiée (<c1/>, <c2/>) ; créneaux prévus, et non heures d'émission réellement enregistrées

# text
seg-1e2faf2894e3 = un journal de récepteur évalué par rapport à ce calendrier : latence par essai, manqués, temps de récupération, fausses alarmes (MODELLED ; un paquet signé nécessite la ligne de commande)

# text
# c1: files
# c2: public_key
# c3: seed_hex
seg-f94eaef45f04 = un paquet de preuves signé pour une fenêtre du journal, en mémoire : <c1/>, <c2/>, <c3/> (à garder privé) ; un dossier technique, non un avis juridique

# text
# c1: verdict
# c2: verified
# c3: intact-signer-not-pinned
# c4: failed
seg-ebd10aea2f6f = vérifier un paquet : hachages, chaîne, signature, éventuellement le signataire de confiance, le journal complet et un horodatage ; <c1/> vaut <c2/>, <c3/> (aucune clé publique fournie : intact, signataire non établi) ou <c4/>

# text
# c1: --export-sp3/-omm/-oem
seg-bf13e70f1d5c = les artefacts <c1/> de la CLI sous forme de texte

# text
seg-1e5eb44bec6f = quels formats d'interopérabilité s'appliquent à un scénario, sans l'exécuter

# text
# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
# c6: {format, spec_url, files}
# c7: {suffix, bytes, sha256, encoding, content}
# c8: utf-8
# c9: base64
seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> ou <c5/> en mémoire : <c6/>, chaque fichier <c7/> (texte <c8/> ou <c9/>)

# text
# c1: --import-route
seg-bef8250e8453 = un itinéraire GeoJSON écrit dans un scénario de trajectoire à points de passage (<c1/>)

# text
# c1: {summary, files}
seg-e25bcb6342db = les séries temporelles de l'exécution sous forme de SVG animé, de lecteur HTML ou d'un maximum de { "120" } images SVG : <c1/>

# text
seg-9b24b9cf0510 = les scénarios de référence fournis et leur TOML

# text
# c1: {files, notes}
seg-f62c11fe1e7d = lier un jeton RFC { "3161" } (octets ou base64) à un paquet en mémoire : <c1/> ; le paquet doit toujours se vérifier ; la signature de l'autorité n'est pas contrôlée

# text
# c1: seed_hex
# c2: public_key
# c3: fingerprint
# c4: warning
seg-95fe54b500a7 = une nouvelle clé de signature en mémoire : <c1/> (PRIVÉE), <c2/>, <c3/>, <c4/> ; Python uniquement

# text
# c1: iq sweep
seg-646e6aba13db = rejouer un enregistrement sur plusieurs conceptions de boucle (<c1/>) : par conception et par PRN, gigue en régime permanent, fractions de verrouillage et C/N0 ; une acquisition par PRN, chaque canal sur les mêmes échantillons

# text
# c1: hash
seg-08d46de5e7cd = décrire un enregistrement, ou chaque enregistrement d'un dossier (lit les fichiers ; <c1/> les lit en entier)

# text
# c1: {files: {suffix: text}, notes, notice}
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: notice
seg-7d9cc8394e65 = le mouvement du véhicule et les événements d'un scénario pour un simulateur GNSS de laboratoire, en mémoire : <c1/> ; types de scénario <c2/>, <c3/>, <c4/> ; aucun signal n'est écrit, gardez <c5/> avec les fichiers

# text
# c1: runs
# c2: {label, result, scenario?}
# c3: {report, markdown}
# c4: status
# c5: report["statement"]
seg-e215c7242eb2 = le rapprochement avec les cadres publics rempli à partir de textes de résultats : <c1/> est une liste de dictionnaires <c2/> (texte, au plus { "64" }) ; renvoie <c3/> ; le <c4/> de chaque ligne indique que les exécutions apportent des éléments de preuve en faveur de ses capacités, non qu'un cadre est atteint ; conservez <c5/> avec tout affichage

# text
seg-18d57e4920dd = les tables de rapprochement statiques (ou les documents sources) en Markdown, ouvertes par la déclaration

# text
seg-8284e10dce6a = les paquets de normes (identifiant, titre, cadre, nombre de tests) et un avis ; un paquet mesure des scénarios modélisés par rapport à des seuils énoncés avant l'exécution

# text
# c1: MET
# c2: NOT MET
# c3: NEEDS INPUT
# c4: markdown
# c5: ValueError
seg-ce6b819604a9 = une exécution de paquet : chaque test <c1/>, <c2/> ou <c3/> avec les valeurs mesurées et attendues, plus le rapport en Markdown sous <c4/> ; lève <c5/> pour un identifiant inconnu

# text
seg-0f701bc523c6 = l'implémentation LunaNet AFS vérifiée par rapport aux tables imprimées et aux exemples résolus de LSIS-AFS V1.0 (seuils B1 à B10 ; B4 rapporte un échec consigné)

# text
seg-82aecf261c46 = un flux de symboles AFS (texte de { "0" } et de { "1" }) contrôlé pour le motif de synchronisation, le décodage SB1, le FID, la continuité et l'espacement du TOI ; le LDPC et le CRC-24Q des sous-trames { "2" } à { "4" } ne sont pas vérifiés

# text
seg-f72ab45ae10b = un flux de symboles d'essai avec des sous-trames fictives (pas une forme d'onde)

# text
# c1: docs/spec/TEST-CONDITIONS.md
# c2: evidence_create
seg-1da34527bb64 = le paquet signé d'aller-retour de laboratoire reliant par hachage le scénario, les conditions d'essai (<c1/>), le journal du récepteur et le score ; sous la forme <c2/>

# text
seg-dd3726fec672 = un fichier de résultat kshana-bench (texte JSON) à partir d'un fichier de vérité et d'un fichier de prédictions ; MODELLED

# text
seg-b82a110c324c = des fichiers de résultat kshana-bench rendus sous forme de page de classement statique (HTML)

# text
# c1: kshana osnma verify --json
# c2: advisory
seg-58b8aa919eaf = authentification OSNMA de Galileo de pages I/NAV ou d'un flux UBX en mémoire : le dictionnaire que <c1/> affiche, avec la mention à titre consultatif dans son champ <c2/> ; à titre consultatif seulement, pas un service d'intégrité de la navigation

# text
# c1: visible
# c2: masked
# c3: request
# c4: site
# c5: time_s
# c6: systems
# c7: tle
# c8: satellites
# c9: mask_deg
# c10: skyline
# c11: clock
# c12: sigma_uere_m
# c13: confidence
# c14: sky_source
# c15: sky_statement
seg-15e4601cd88c = les satellites qu'un site voit sous un horizon dépendant de l'azimut : par satellite <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, le cofacteur et la covariance est-nord-haut et les ellipses d'erreur horizontale ; <c3/> est un texte JSON ou TOML ou un dictionnaire (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>) ; la décision de visibilité et l'ellipse sont vérifiées par rapport à des bibliothèques indépendantes, le reste est MODELLED, et le résultat porte la mention à titre consultatif (<c14/>, <c15/> disent si le ciel est représentatif ou issu de jeux d'éléments)

# text
# c1: n
# c2: request
seg-51ac7cd68154 = <c1/> ({ "1" } à { "5000" }) erreurs de moindres carrés à graine fixée sur l'ensemble visible de <c2/>, avec leur covariance empirique, leur RMS et la fraction à l'intérieur de l'ellipse à { "95" } %

# text
# c1: city-street
# c2: harbour-approach
# c3: fjord
# c4: container-terminal
seg-8bba3099379a = les préréglages d'horizon (<c1/>, <c2/>, <c3/>, <c4/>) avec leur étiquette REPRESENTATIVE, leur provenance et la coupure à chaque degré d'azimut ; des géométries représentatives, non des relevés

# text
seg-f900de61f6e9 = une section d'horizon (table, canyon urbain, secteurs, terrain) ramenée à la table normalisée de 360 entrées qu'utilise le moteur

# text
# c1: request
seg-824f3c5951fa = le diagramme du ciel de <c1/> sous forme de texte SVG statique

# text
# c1: jsonl
# c2: receiver-trust
# c3: kshana trust-telemetry
seg-0ffb65c8f5f3 = un flux de confiance (<c1/>) ou un résultat <c2/> sous forme de texte Prometheus, de lignes syslog CEF ou LEEF ou de charge utile JSON OTLP, avec les encodeurs <c3/> ; rien n'est envoyé et aucune horloge n'est lue (les lignes syslog ne portent pas d'horodatage)

# text
# c1: kshana-interference-map/v1
seg-c1ab3dbbe2f2 = une carte d'interférences GNSS à partir de texte CSV ADS-B ou AIS : un dictionnaire par jour UTC avec du GeoJSON <c1/> (agrégat uniquement ; une cellule dégradée ne désigne pas l'interférence comme cause)

# text
seg-ff4bc7fdbce7 = part d'un itinéraire traversant des cellules dégradées de ces cartes, en texte JSON (pas une prévision ; des cellules non observées ne prouvent pas qu'un itinéraire est dégagé)

# text
# c1: nmea
# c2: log_json
# c3: log_text
seg-d70bccba0e03 = NMEA de passerelle synthétiques pour la formation des équipages plus le journal de l'instructeur (<c1/>, <c2/>, <c3/>) ; texte seulement, jamais pour les systèmes de navigation réels d'un navire

# text
# c1: iq_scene
# c2: iq_acquire
# c3: iq_track
# c4: gps-l1ca
# c5: galileo-e1b
# c6: glonass-l1of
seg-3fe13851ac82 = les noms de signaux IQ GNSS qu'acceptent <c1/>, <c2/> et <c3/> (<c4/>, <c5/>, <c6/>, ...)

# text
# c1: samples_i
# c2: samples_q
# c3: truth
seg-50bf4ad4e23a = une scène IQ GNSS multi-satellites en mémoire : <c1/> / <c2/> et <c3/> par époque

# text
seg-b3199839a37c = la même, avec chaque satellite GPS selon sa géométrie d'éphéméride diffusée tirée d'un message de navigation RINEX (Receiver Independent Exchange Format)

# text
seg-8f0f9efea46b = acquisition par FFT (transformée de Fourier rapide) de chaque PRN (code pseudo-aléatoire) : Doppler, phase de code, statistique, seuil

# text
# c1: kshana.acq-surface/1
# c2: rows[doppler][lag]
# c3: parabolic
# c4: fine_search
seg-3bf994f3f1bf = toute la surface d'acquisition d'un PRN (<c1/>) : puissance de corrélation <c2/>, le pic et deux affinements fins du Doppler (<c3/>, <c4/>)

# text
seg-393572e31421 = acquérir, puis suivre chaque PRN : Doppler par époque, phase de code, indicateurs de verrouillage, C/N0, corrélateur ponctuel

# text
seg-bc39efdb015a = la chaîne frontale du récepteur (passe-bande, réjecteur, blanking, excision, AGC (commande automatique de gain), quantificateur) sur des échantillons complexes

# text
# c1: iq-labfit
seg-ead1b81c712f = ajuster le modèle de perte de verrouillage de la boucle de poursuite à une chronologie de confiance du récepteur (un scénario <c1/>)

# text
# c1: kshana.loop-design/1
# c2: name
# c3: hash
# c4: ValueError
seg-0ab8531d0465 = analyser un fichier <c1/> (un chemin ou du texte TOML) en ses conceptions résolues, chacune avec son <c2/> et son <c3/> ; <c4/> sur un fichier invalide

# text
# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: header
# c4: records
seg-9c3467d4451e = lire un fichier binaire d'époques de poursuite (<c1/>, tel que l'écrit <c2/>) : le <c3/> et un dictionnaire par époque dans <c4/>

# text
# c1: iq monitor
# c2: series
# c3: events
# c4: spectra
# c5: notes
seg-469303e33d2a = les moniteurs de détection IQ sur un enregistrement en un seul passage en flux (<c1/>) : <c2/>, <c3/>, <c4/> et <c5/> ; lit un fichier

# text
# c1: kshana.test-conditions/1
# c2: hash
seg-bb5c5008f1a8 = valider un fichier de conditions d'essai de laboratoire (<c1/>, TOML ou JSON, un chemin ou du texte) et le renvoyer résolu, avec son <c2/>

# text
# c1: kshana.campaign/1
# c2: out_dir
# c3: kshana iq campaign
# c4: digest
seg-d2441bf762b4 = exécuter une campagne de rejeu de laboratoire (<c1/>) dans <c2/> comme le fait <c3/> ; les cellules terminées sont ignorées ; renvoie le nombre de cellules, les échecs et le <c4/> une fois toutes les cellules terminées

# text
# c1: digest
seg-7b6d264d9c7f = reconstruire les fiches de score, le rapport HTML et le condensé d'une campagne à partir de ses cellules : le nombre de cellules et de lignes, les lignes qui échouent à un seuil et le <c1/>

# text
seg-e3956268cf1c = Signatures de l'IQ GNSS et de la confiance du récepteur

# text
# c1: kshana.pyi
# c2: samples_i
# c3: samples_q
# c4: i
# c5: q
# c6: numpy.asarray(...)
seg-817bd0898d46 = Les signatures complètes, telles que <c1/> les énonce (chaque mot-clé après les arguments obligatoires a une valeur par défaut ; les docstrings du stub donnent le sens de chacun). Encapsulez les listes <c2/> / <c3/> et les entrées <c4/> / <c5/> avec <c6/> pour obtenir des tableaux.

# text
# c1: iq_read_epochs
# c2: kshana iq track --epochs
seg-2dd9323829ce = Une campagne de rejeu de laboratoire depuis Python, puis son rapport (le fichier de campagne et ses enregistrements sont les vôtres ; une cellule terminée est ignorée à l'appel suivant ; <c1/> lit un fichier d'époques de poursuite écrit par une exécution de <c2/>) :

# text
# c1: iq_track
# c2: acq_coherent
# c3: None
# c4: acq_coherent=1
seg-5f48b88438df = Le <c2/> de <c1/> fixe le nombre de périodes de code que l'acquisition de transfert intègre de façon cohérente. À partir de { "0.33.0" }, il vaut par défaut <c3/>, ce qui signifie automatique : environ { "4" } ms ({ "4" } périodes pour un code de { "1" } ms comme le GPS L1 C/A, { "1" } pour un code de { "4" } ms ou plus), de sorte que le canal démarre assez près pour que la boucle de fréquence s'accroche ; <c4/> conserve la recherche à une période de { "0.32" }.

# text
seg-012a83181bd3 = Types

# text
# c1: kshana.pyi
# c2: ScenarioKind
# c3: Literal
# c4: ErrorKind
# c5: error_kind
# c6: ProvenanceClass
# c7: TypedDict
# c8: KindMeta
# c9: scenario_kinds()
# c10: FieldUnit
# c11: units
# c12: _FieldUnitBase
# c13: tests/typed_api_sync.rs
seg-0b4f4c6c6014 = <c1/> type les vocabulaires fermés pour les vérificateurs (mypy, pyright) : <c2/> (chaque nom de type de scénario, un <c3/>), <c4/> (les quatre étiquettes que renvoie <c5/>), <c6/>, et les <c7/> <c8/> (dont <c9/> renvoie une liste) et <c10/> (une entrée du bloc <c11/> d'un résultat, qui étend la base de clés obligatoires <c12/>). Ils n'existent que pour les vérificateurs de types et ne sont pas importables à l'exécution ; <c13/> les maintient égaux aux listes du moteur.

# text
seg-b5ad0d8e1456 = Membre

# text
seg-2698ab8436e6 = document de résultat complet (JSON)

# text
seg-7eccc8361120 = SVG (Scalable Vector Graphics) autonome du graphique

# text
seg-38c8d20ca07a = résumé lisible d'une ligne

# text
seg-e21e82ad3fe8 = la table de reproductibilité, pour les types de scénario qui en émettent une (voir ci-dessous)

# text
seg-aadcc1cc4c79 = le résultat analysé en dictionnaire Python (voir la note sur la forme ci-dessous)

# text
# c1: path
# c2: "points.0.coords"
# c3: "/points/0/coords"
seg-409504363c4c = la liste numérique à <c1/> (pointée, <c2/>, ou pointeur JSON, <c3/>) : 1D pour des nombres, 2D pour des listes numériques de même longueur

# text
# c1: path
seg-b6d5d7e5271a = la liste d'enregistrements à <c1/> (une série temporelle), un tableau par champ qui est un nombre dans chaque enregistrement

# text
# c1: .columns
seg-adb2d15f9f74 = chaque liste d'enregistrements avec un champ numérique, indexée par chemin pointé, chacune sous la forme <c1/>

# text
# c1: path
seg-7f053ad96880 = écrire cette table dans <c1/> ; renvoie le nombre d'octets écrits, ou { "0" } (et n'écrit rien) lorsque le type de scénario n'émet aucune table

# text
seg-276104139e73 = La table de reproductibilité

# text
# c1: realtime-frame-eop
# c2: lunar-time-budget
# c3: lunar-jamming
# c4: telecom-timing
# c5: leo-navmsg
# c6: moonlight-service-volume
# c7: export_site_lat_deg
# c8: export_site_lon_deg
# c9: csv = None
# c10: <scenario>.table.csv
seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> et <c5/> publient toujours une table ; <c6/> en publie une lorsqu'un site d'export (<c7/> + <c8/>) est configuré. Tout autre type de scénario renvoie <c9/>. Le texte est constitué des mêmes octets que ceux que la CLI (interface en ligne de commande) écrit sous <c10/>, de sorte qu'un relecteur qui reproduit une table publiée à partir du wheel n'a jamais à passer à la ligne de commande :

# text
seg-3ad2987110ee = Forme du résultat

# text
seg-57c7066d3522 = Les indicateurs de performance et les séries temporelles se trouvent <b>par côté d'exécution</b>, et non au niveau supérieur. Pour une exécution d'horloge, le document est :

# text
# c1: data["quantum"]["fom"]
# c2: data["figures_of_merit"]
# c3: field-units-schema.json
# c4: SCHEMA.md
seg-cb19f961de2b = de sorte que les indicateurs de performance sont <c1/>, jamais <c2/>. D'autres types de scénario émettent leurs propres paquets ; la référence complète champ par champ, avec unités et pointeur vers la source, est <a1><c3/></a1> et le guide du lecteur est <a2><c4/></a2>.

# text
# c1: validate_toml
# c2: error_kind
seg-bfd984e0407b = <c1/> et <c2/> <b>exécutent</b> le scénario, de sorte qu'ils font remonter les erreurs d'analyse, de configuration <em>et</em> d'exécution. Ils ne lèvent jamais d'exception.

# text
# c1: run
# c2: run_typed
# c3: ValueError
seg-0ca0a1da8356 = <c1/> / <c2/> lèvent <c3/> sur un scénario invalide.

# text
# c1: seed
# c2: scenario_hash
# c3: REPRODUCIBILITY.md
seg-901c2ede0cd0 = Les résultats sont reproductibles : un scénario porte sa <c1/> et le moteur enregistre un <c2/>, de sorte que la même entrée donne une sortie identique octet pour octet sur la même plateforme (voir <a1><c3/></a1>).

# text
# c1: .array
# c2: .columns
# c3: .series
# c4: numpy.asarray(...)
# c5: .data()
# c6: tests/python/test_numpy_runoutput.py
# c7: ImportError
# c8: KeyError
# c9: ValueError
# c10: notebooks/
seg-8c0c32fcba2b = <c1/>, <c2/> et <c3/> renvoient exactement <c4/> des mêmes valeurs que donne <c5/> (même dtype, identiques au bit près ; <c6/>). Ils importent NumPy lorsqu'on les appelle et lèvent <c7/> sans lui ; NumPy reste en dehors des dépendances d'exécution du paquet. <c8/> signifie que le chemin est absent, <c9/> que la valeur qui s'y trouve n'est pas un tableau numérique (ou pas une liste d'enregistrements). Des notebooks exécutables se trouvent dans <a1><c10/></a1>.

# text
seg-00a3cf088cde = Pas en Python : les processus de longue durée

# text
# c1: kshana receiver-trust live
# c2: --listen
# c3: docs/TRUST-TELEMETRY.md
# c4: kshana nmea-scenario --tcp/--udp
# c5: receiver_trust
# c6: receiver_trust_replay
# c7: nmea_training
seg-3780dd4973f0 = <c1/> (un processus de flux avec une passerelle et un serveur TCP <c2/> facultatif) et les exportateurs de télémétrie (Prometheus, OTLP, syslog ; <c3/>) et le flux <c4/> relèvent uniquement de la ligne de commande : une liaison rend la main quand l'appel se termine et ne garde pas de socket ouvert. Python couvre la forme par lot de chacun : <c5/> pour un journal, <c6/> pour un extrait de flux (scores et états ; la passerelle n'est pas appliquée), <c7/> pour le texte généré.

# text
seg-82379c29d438 = <s1>Précédent</s1>Interféromètre à atomes froids

# text
seg-4a457afc63fb = <s1>Suivant</s1>npm et WebAssembly

# text
seg-dbbce10a12d2 = RunOutput

seg-a4c68601516f = régions d'émetteurs estimées à partir de texte CSV ADS-B ou AIS : <c1/>, chacune étiquetée MODELLED ; des régions à un niveau de confiance déclaré avec un centroïde et une ellipse d'incertitude, jamais un simple point ; agrégat seulement, et une région n'est la position de personne ni un constat de la cause
