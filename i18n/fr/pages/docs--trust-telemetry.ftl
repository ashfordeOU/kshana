# docs--trust-telemetry: translations (fr)

# text
seg-2247a2344710 = Signification

# text
seg-d4e48c972084 = Libellés

# text
seg-ca448daf5ec7 = nominal

# text
seg-a129b9e613d0 = Type

# text
seg-2672b7f55371 = dégradées

# attr:alt
seg-c711c7fecbfc = Un résultat de confiance dans trois formats d'exportation, d'après des exécutions réelles du moteur v{ $version } (`kshana trust-telemetry`) sur examples/maritime-trust : exposition texte Prometheus (le dernier score de confiance est { "5.9" } et la bande non fiable est celle qui est activée), et les derniers messages CEF et LEEF. La commande ne publie rien si on ne lui donne pas de destination, ne détient aucun identifiant et n'émet aucun signal radio. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire.

# text
# c1: docs/TRUST-TELEMETRY.md
seg-15fcf05d16c5 = Source : <c1/>

# text
seg-05919ac6cf31 = La confiance GNSS comme télémétrie de sécurité

# text
# c1: kshana trust-telemetry
seg-8978c6508ebd = <c1/> transforme le flux de confiance GNSS par époque (score de 0 à 100, bande, raisons) en signaux qu'un centre d'exploitation ou de sécurité ingère déjà : métriques Prometheus, événements syslog au format CEF ou LEEF pour un SIEM, et éventuellement OpenTelemetry. Il lit le flux ; il ne modifie jamais l'évaluation de confiance et ne transmet rien d'autre que de la télémétrie.

# text
# c1: docs/MARITIME-TRUST.md
# c2: t_s
# c3: state
# c4: calibrating|nominal|degraded|untrusted
# c5: score
# c6: time
# c7: gate
# c8: off|passed|withheld
# c9: position
# c10: lat_deg
# c11: lon_deg
# c12: height_m
# c13: deductions
# c14: alarms
# c15: geometry
# c16: status
# c17: hdop
# c18: pdop
# c19: n_used
# c20: class
# c21: kshana_trust_input_errors_total
# c22: src/telemetry/sample.rs
seg-14ad6b7911d6 = L'entrée est le schéma JSON-lines en direct v1.1 documenté dans <c1/>. Lus : <c2/> ; <c3/> (<c4/>, la bande) ; <c5/> (0 à 100 ou null) ; <c6/> (l'heure de l'époque telle qu'indiquée) ; <c7/> (<c8/>) ; <c9/> (<c10/>, <c11/>, <c12/>, ou null) ; les raisons sont les moniteurs de <c13/>, puis les éventuels autres de <c14/> ; à partir du schéma { "1.3" }, <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) et le <c20/> de chaque déduction. Les autres clés sont ignorées, puisque le schéma ne croît que par ajout de clés. Une ligne qui ne s'analyse pas est comptée dans <c21/> et ignorée ; les scores hors de 0 à 100 sont rejetés, non ramenés aux bornes, de sorte qu'un changement de format soit remarqué. Le seul code qui connaît ce format est <c22/>.

# text
# c1: /metrics
# c2: 127.0.0.1:9464
seg-2c94f3717f82 = <c1/> est servi sans authentification et utilise par défaut <c2/>. Une liaison ailleurs affiche un avertissement ; placez-le derrière votre propre contrôle d'accès. Le point d'accès traite une connexion à la fois avec une limite de lecture de { "2" } s, de sorte qu'un client inactif peut retarder une collecte jusqu'à cette durée ; il est prévu pour un seul collecteur, pas pour le réseau ouvert.

# text
seg-7e66e43f15a8 = Home Assistant et appliances NTP (MQTT)

# text
# c1: --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: homeassistant/...
# c4: untrusted
# c5: <prefix>/state
# c6: kshana/trust/state
# c7: state
# c8: score
# c9: untrusted
# c10: t_s
# c11: time
# c12: reasons
# c13: gate
# c14: --mqtt-prefix
# c15: --mqtt-node
# c16: --mqtt-discovery
seg-fbe56ff7f1ed = <c1/> affiche, et <c2/> publie, un document d'état JSON et des messages de découverte MQTT de Home Assistant. La découverte (conservée, sous <c3/>) crée trois entités : score de confiance, bande de confiance (avec les raisons comme attributs) et un capteur de problème <c4/>. Le document d'état va vers <c5/> (par défaut <c6/>, conservé) : <c7/>, <c8/> (null tant qu'il n'y en a pas), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> et la mention à titre consultatif ; la position n'est jamais incluse. Options : <c14/>, <c15/>, <c16/>.

# text
# c1: format = "mqtt"
# c2: topic<TAB>payload
seg-252025356c0e = Le publieur parle MQTT { "3.1.1" } en QoS { "0" } et ne lit que le CONNACK du courtier. Il n'a ni identifiants ni TLS ; utilisez donc un courtier sur le réseau local (ou un relais local qui les ajoute). La remise s'exécute sur son propre fil derrière une file de { "1024" } : un courtier mort fait perdre des messages, comptés et signalés à la fin, et ne bloque jamais le flux. Une appliance NTP ou tout autre consommateur qui veut du JSON brut peut lire la même ligne d'état. Rien n'est écrit vers un récepteur ou une horloge. Python, WebAssembly et MCP acceptent <c1/> et renvoient les mêmes lignes <c2/> (rien n'y est publié).

# text
seg-ed95ebb0ba1b = Depuis Python, WebAssembly et MCP

# text
# c1: kshana.trust_telemetry(input, format, host="", input_kind="jsonl", expose_position=False, syslog_all=False, unix_nano=0)
# c2: trust_telemetry(input, format, host, input_kind, options_json)
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: format
# c6: prometheus
# c7: cef
# c8: leef
# c9: otlp
# c10: input_kind
# c11: jsonl
# c12: result
# c13: --print-metrics
# c14: --print-syslog
# c15: host
# c16: syslog_all
seg-93be007cdfda = Les encodeurs sont aussi disponibles sous forme d'appels texte en entrée, texte en sortie, sans processus, socket ni horloge : <c1/> en Python, l'export WebAssembly <c2/> et l'outil MCP <c3/> (commande de plugin <c4/>). <c5/> vaut <c6/>, <c7/>, <c8/> ou <c9/> ; <c10/> vaut <c11/> (le flux) ou <c12/> (un résultat de lot). Ils renvoient le même texte que celui affiché par la ligne de commande (<c13/>, <c14/>), avec les mêmes limites : les lignes syslog ne portent pas d'horodatage, <c15/> comporte au plus { "255" } caractères ASCII imprimables sans espaces (refusé sinon, ici comme en ligne de commande), et une réponse plus grande que la limite de l'interface ({ "4" } MiB sur MCP) est refusée, car CEF et LEEF avec <c16/> écrivent un événement par époque. Rien n'est envoyé, servi ni écrit ; les exportateurs en fonctionnement restent un processus de la ligne de commande.

# text
seg-f8c367611a9e = La remise ne bloque jamais l'évaluation

# text
# c1: /metrics
seg-3853bb63c7ad = La remise syslog et OpenTelemetry s'exécute sur ses propres fils. La boucle d'ingestion ne fait que leur transmettre un message ou un instantané sans jamais attendre ; un collecteur mort, lent ou qui ne lit pas ne peut donc ni exercer de contre-pression sur le flux en direct ni geler <c1/> :

# text
seg-589d02c31dfe = chaque connexion et chaque écriture a une limite de { "2" } s ; une connexion échouée est abandonnée puis rétablie à la demande, avec un recul exponentiel de { "1" } s jusqu'à { "60" } s ;

# text
# c1: kshana_trust_syslog_send_failures_total
seg-3c272ded25a3 = un message qui ne peut pas être remis (collecteur arrêté, écriture expirée, file de { "1024" } pleine) est abandonné et compté dans <c1/> ; alertez sur son taux ;

# text
seg-4a7cd2065731 = l'exportateur OpenTelemetry reçoit une copie du registre, de sorte qu'aucun verrou n'est tenu pendant les E/S réseau ; si un export est encore en cours, le nouvel instantané est ignoré (le suivant porte les mêmes totaux cumulés).

# text
seg-57c3bbe405c8 = En fin d'entrée, les fils d'envoi disposent du temps limite qui leur reste pour terminer.

# text
seg-14c13ed8c509 = Métriques Prometheus

# text
seg-d060b2163513 = Métrique

# text
seg-45c41bf74eb8 = jauge

# text
seg-e43a6814d13c = constante { "1" }

# text
seg-3662d2b8a789 = dernier score de 0 à 100 ; absent si la source n'en donne pas

# text
seg-1c50874472fc = { "1" } pour la bande actuelle, { "0" } pour les autres

# text
# c1: off
# c2: passed
# c3: withheld
# c4: unknown
seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/> : { "1" } pour l'état actuel, { "0" } pour les autres ; absent sans barrière

# text
# c1: --expose-position
seg-3e01cab63c59 = position rapportée par le récepteur ; <b>uniquement avec <c1/></b> (le point d'accès n'est pas authentifié et une position peut permettre d'identifier un site ou un navire)

# text
seg-280a5ca2e5d9 = { "1" } si présent à la dernière époque

# text
seg-22ded4fe7f29 = compteur

# text
seg-800b23c30e2f = époques reçues

# text
seg-be11849d8a9b = époques dans lesquelles la raison était présente

# text
seg-0475fe7b26ba = lignes d'entrée non analysables

# text
# c1: reason="other"
seg-65f1db183cbc = occurrences de raisons regroupées dans <c1/> (voir ci-dessous)

# text
seg-e756633e7d5c = événements syslog non remis

# text
seg-2de3258f83ee = décalage de la dernière époque par rapport au début du flux

# text
seg-c02fe207663e = heure de réception en temps réel ; alertez sur son âge

# text
# c1: good
# c2: degraded
# c3: unknown
seg-67d5bbbde75a = géométrie des satellites à la dernière époque, <c1/>, <c2/>, <c3/> : { "1" } pour la valeur actuelle <em>(entrées de schéma { "1.3" })</em>

# text
seg-4878afc243e3 = { "1" } dégradée, { "0" } bonne ; absent lorsque la géométrie est inconnue

# text
# c1: geometry_degraded
seg-c21f54522128 = { "1" } lorsque des satellites en vue ne sont pas suivis alors que leur géométrie est bonne (c'est le signal qui a été perdu, pas le ciel ; <c1/> vaut toujours { "1" }), sinon { "0" } ; absent lorsque la géométrie est inconnue ou que l'entrée ne le précise pas

# text
seg-db29584bb51c = HDOP, PDOP et satellites utilisés à la dernière époque ; chacun absent s'il n'y en a pas

# text
seg-c60ca4530e92 = époques par état de géométrie

# text
# c1: good
# c2: fair
# c3: poor
# c4: unknown
# c5: poor
seg-fd6bf7764eca = étiquette de géométrie à la dernière époque, <c1/>, <c2/>, <c3/>, <c4/> : { "1" } pour l'étiquette actuelle ; jamais notée (le score ne déduit rien sauf pour <c5/>) ; pour les entrées qui portent l'étiquette ({ "0.36" })

# text
seg-d6f04ef7adfb = VDOP à la dernière époque ; absent s'il n'y en a pas

# text
# c1: kshana_trust_geometry_label
# c2: kshana.geometry.label
# c3: cs6
# c4: geoLabel
# c5: poor
# c6: degraded
# c7: sky-blocked
# c8: kshana_trust_geometry_degraded
seg-cb8feee01192 = <b>L'étiquette de géométrie est l'indicateur principal.</b> Tracez-la et alertez sur <c1/> (OTLP <c2/>, CEF le troisième champ <c3/>, LEEF <c4/>) : <c5/> est la seule étiquette pour laquelle le score déduit quelque chose. L'état de la géométrie est descriptif : <c6/> inclut le cas informatif <c7/>, qui peut s'accompagner d'un DOP bon ou moyen ; ne déclenchez donc pas d'appel d'astreinte sur <c8/> seul.

# text
# c1: kshana_trust_reason_active
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
# c6: geometry
# c7: unknown
# c8: kshana_trust_reason_active{class="inconsistency"}
# c9: geometry
# c10: docs/RECEIVER-TRUST.md
seg-70343708da03 = Pour les entrées de schéma { "1.3" }, <c1/> porte aussi une étiquette <c2/> (<c3/>, <c4/>, <c5/>) sur chaque raison qui en avait une : la classe de la déduction à la dernière époque. Les séries de géométrie viennent après toutes les autres et seulement une fois qu'une époque d'entrée porte <c6/> (schéma en direct { "1.3" }, résultat d'un moteur { "0.36" } ou ultérieur), de sorte qu'un flux ou un résultat { "0.35" } est rendu octet pour octet comme auparavant. Les valeurs d'étiquette sont des ensembles fixes (un état inconnu se lit <c7/> ; une classe inconnue est écartée). Alertez sur <c8/> plutôt que sur la bande seule, afin qu'un ciel médiocre ne déclenche pas d'appel comme une attaque ; une classe <c9/> est un énoncé sur le ciel, et non la constatation qu'aucune attaque n'a eu lieu (voir <c10/>).

# text
# c1: class
# c2: loss-of-lock
# c3: environment
# c4: geometry
# c5: geometry
# c6: inconsistency
# c7: reason
# c8: max by (reason)
# c9: class
seg-3f45b21003d5 = L'étiquette <c1/> fait partie de l'identité d'une série : lorsque la classe d'une raison change entre deux époques (<c2/> de <c3/> à <c4/> lorsque les satellites perdus étaient bas, ou de <c5/> à <c6/> lorsque le HDOP indiqué est en désaccord avec le ciel indiqué), l'ancienne série n'est plus exportée et une nouvelle commence. Interrogez par <c7/> avec <c8/> lorsque la classe n'importe pas, et attendez-vous à ce qu'un tel basculement ressemble à une série qui se termine et à une autre qui commence. Les séries du schéma { "1.3" }, l'étiquette <c9/> et les champs de géométrie CEF/LEEF sont vérifiés par les propres tests du moteur et par les références indépendantes CEF (pycef, Logstash) ; les références indépendantes externes Prometheus et OTLP n'ont pas encore de flux { "1.3" }.

# text
# c1: reason="other"
# c2: kshana_trust_reason_overflow_total
seg-17ca55cea260 = Les noms de raison sont tronqués à { "128" } caractères, et au plus { "64" } raisons distinctes obtiennent leur propre série ; les suivantes sont comptées sous <c1/> et dans <c2/>, de sorte qu'une entrée hostile ou boguée ne puisse pas créer une cardinalité d'étiquettes illimitée.

# text
# c1: band
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: unknown
# c7: kinematic
# c8: heading-course
# c9: cn0-drop
# c10: agc
# c11: raim
seg-35f3faf39d1c = <c1/> est l'une de <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Les noms de raison sont les noms des moniteurs du flux (<c7/>, <c8/>, ... ; pour le résultat de lot, <c9/>, <c10/>, <c11/>).

# text
# c1: deploy/grafana/kshana-gnss-trust.json
seg-a726fc8d28c2 = Un tableau de bord d'exemple se trouve dans <c1/> (importez-le et choisissez votre source de données Prometheus).

# text
seg-208f33eda580 = Syslog : CEF et LEEF

# text
# c1: kshana
# c2: GNSSTRUST
# c3: --syslog-octet-counting
# c4: <length> <message>
# c5: --syslog-all
# c6: Ashforde OU
seg-0d53db66a990 = Les événements sont envoyés dans une enveloppe RFC { "5424" } (facility local0, application <c1/>, identifiant de message <c2/>) par UDP (un datagramme chacun ; IPv4 ou IPv6) ou TCP, terminés par un saut de ligne par défaut ou, avec <c3/>, encadrés en <c4/> comme dans la RFC { "6587" }. Par défaut, un événement est envoyé par changement de bande ; <c5/> en envoie un par époque. Le fournisseur est écrit <c6/> (ASCII) afin qu'aucun SIEM ne le décode de travers.

# text
seg-9cb6e1b9fec0 = Concept

# text
seg-9e4ce52ac5d9 = Gravité syslog

# text
seg-084d2e726d3f = Gravité CEF

# text
# c1: sev
seg-60fa1c602748 = LEEF <c1/>

# text
seg-7948fbcf87cb = calibrating

# text
seg-453691777f9d = { "6" } info

# text
seg-2ac57280bf6a = { "4" } warning

# text
seg-f757a767bd4a = untrusted

# text
seg-8e4e2d9142f9 = { "2" } critical

# text
seg-4c5b832482cb = unknown

# text
seg-5e4f3b0222cd = { "5" } notice

# text
# c1: gnss-trust.<band>
seg-b07ec4ccabf7 = Correspondance des champs (l'identifiant d'événement est <c1/>) :

# text
seg-bfad2619553e = CEF

# text
# c1: ^
seg-62108c4b1d75 = LEEF { "2.0" } (délimiteur <c1/>)

# text
seg-18a4ca402cd9 = catégorie

# text
seg-d3bc36a445cb = hôte émetteur

# text
seg-521cea5013c8 = bande

# text
# c1: cs1
# c2: band
seg-2b9153eb068d = <c1/> (étiquette <c2/>)

# text
seg-f1be6ef87011 = raisons, séparées par des virgules

# text
seg-e77a9847bc7b = bande précédente

# text
seg-87b7f1652b0c = score

# text
# c1: cfp1
# c2: trustScore
seg-470a89a86d79 = <c1/> (<c2/>), omis s'il n'y en a pas

# text
seg-fc2aebb988bf = décalage d'époque, s

# text
seg-9f9d0d551742 = étiquette d'heure du journal

# text
seg-57ed10b00272 = état de la barrière

# text
# c1: ;
# c2: degraded;environment,geometry
# c3: ;
# c4: degraded;;poor
# c5: good;;fair
seg-7159f151c079 = état de la géométrie, puis <c1/> et les classes des déductions de l'époque, séparées par des virgules (par exemple <c2/>) <em>(entrées { "1.3" })</em> ; pour les entrées qui portent l'étiquette ({ "0.36" }), un troisième champ, <c3/> et l'étiquette, le champ des classes étant alors toujours présent (par exemple <c4/>, <c5/>)

# text
# c1: geoStatus
# c2: geoClass
# c3: geoLabel
seg-973339622a60 = <c1/> (état seul), <c2/> (classes) et <c3/> (étiquette)

# text
seg-ae3a1d06bddf = HDOP

# text
seg-c431625778a6 = PDOP

# text
seg-e10eccec5f94 = ({ "0.36" }, avec l'étiquette)

# text
seg-e0a712018ced = VDOP <em>({ "0.36" }, avec l'étiquette)</em>

# text
seg-42273c09a591 = non porté : les quatre champs personnalisés en virgule flottante sont pris

# text
seg-292efe9557d6 = satellites utilisés <em>({ "0.36" }, avec l'étiquette)</em>

# text
# c1: cn1
# c2: geometryUsedSatellites
seg-179b75fd8f06 = <c1/> (<c2/>), un entier

# text
seg-f69551c20173 = perte de signal : satellites en vue non suivis alors que leur géométrie est bonne

# text
# c1: degraded
# c2: environment
# c3: cs6
seg-bb927aab7541 = non porté comme champ (aucune clé du dictionnaire CEF n'est libre pour cela) : l'état se lit <c1/> et la classe de la déduction de géométrie <c2/> dans <c3/>

# text
# c1: geoSignalLoss=1
seg-6a80d53b2163 = <c1/>, uniquement tant qu'elle est vraie

# text
# c1: cs6
# c2: flexString1
# c3: flexString
# c4: tests/cef_reference.rs
seg-1f099d4ef4b6 = En CEF, la géométrie n'utilise que des champs personnalisés du dictionnaire (aucune clé inventée) ; l'étiquette passe dans <c1/> plutôt que dans <c2/> parce que le codec CEF de Logstash ne met pas en correspondance les champs <c3/>. Les événements de géométrie { "1.3" }, y compris les cas d'étiquette, font partie de la ligne CEF VALIDATED : les deux analyseurs de référence indépendante les relisent tels qu'écrits (<c4/>, amendements { "4" } et { "5" }, chacun enregistré avant que l'un ou l'autre analyseur ait été exécuté sur ses cas). Les champs d'étiquette, de VDOP et de nombre de satellites sont ajoutés après tous les champs et séries précédents, et seulement pour les entrées qui portent l'étiquette, de sorte qu'une entrée sans étiquette est rendue exactement comme avant.

# text
# c1: cs2=
# c2: \
# c3: |
# c4: \
# c5: =
# c6: ^
seg-b295bf5bac3e = Les champs vides sont omis (pas de <c1/> sans raisons). Le nom d'hôte est tronqué à { "255" } caractères. Les valeurs d'en-tête CEF échappent <c2/> et <c3/> ; les valeurs d'extension échappent <c4/>, <c5/> et les sauts de ligne. Dans les valeurs LEEF, <c6/> et les sauts de ligne sont remplacés par des espaces.

# text
seg-a3b77e9593eb = OpenTelemetry (désactivé par défaut)

# text
# c1: --features otlp
# c2: --otlp http://host:4318/v1/metrics
# c3: kshana.trust.score
# c4: kshana.trust.band
# c5: kshana.trust.epochs
# c6: kshana.trust.reason.epochs
# c7: kshana.geometry.status
# c8: kshana.geometry.degraded
# c9: kshana.geometry.signal_loss
# c10: kshana.geometry.hdop
# c11: kshana.geometry.pdop
# c12: kshana.geometry.used_satellites
# c13: kshana.geometry.label
# c14: label
# c15: kshana.geometry.vdop
# c16: startTimeUnixNano
# c17: --otlp-every
# c18: https://
seg-396c34d29783 = Compilez avec <c1/> et passez <c2/>. L'exportateur envoie en POST du JSON OTLP/HTTP (<c3/>, <c4/>, <c5/>, <c6/>, et pour les entrées de schéma { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> et, pour les entrées qui portent l'étiquette ({ "0.36" }), <c13/> (attribut <c14/>) et <c15/> ; les sommes cumulées portent <c16/>) toutes les <c17/> époques (par défaut { "10" }) et en fin d'entrée. Il n'ajoute aucune dépendance et n'a pas de TLS : envoyez vers un collecteur sur la même machine ou sur un segment de confiance, qui retransmet ensuite en TLS. Les points d'accès <c18/> sont refusés.

# text
seg-c3111d73a8b0 = <s1>Précédent</s1>Géométrie du ciel et lignes d'horizon

# text
seg-4c539b667a05 = <s1>Suivant</s1>Vérification Galileo OSNMA
