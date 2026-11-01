# docs--jammertest: translations (fr)

# text
seg-f8cf777c0caa = Surfaces

# text
seg-45425f378b61 = signification

# text
# c1: docs/JAMMERTEST.md
seg-9367b8736d36 = Source : <c1/>

# text
seg-c2a40cd73d0e = Notation Jammertest : le plan publié comme vérité planifiée

# text
# c1: kshana jammertest import
# c2: [[events]]
# c3: kshana jammertest score
seg-a560942cbd27 = <c1/> lit le catalogue d'essais et le plan de transmission de Jammertest et transforme les créneaux d'une zone d'essai en <c2/> de confiance du récepteur. <c3/> fait passer un journal de récepteur dans les moniteurs de confiance et le note par rapport à ce calendrier, essai par essai. Chaque résultat est <b>MODELLED</b> : le calendrier dit quand un essai était <em>planifié</em>, et non quand un émetteur était en marche.

# text
seg-bc4e7285c38a = Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire. Rien ici n'est avalisé par l'Administration norvégienne des routes publiques, Nkom ou les organisateurs de l'événement ; aucun accord avec eux n'est revendiqué.

# attr:alt
seg-af0edceb1503 = Notation d'un journal de récepteur synthétique par rapport à un calendrier de trois essais, issue d'une véritable exécution du moteur v{ $version } (`kshana jammertest score`). Le journal est inventé : { "1800" } s de NMEA avec une baisse de C/N0 de { "20" } dB sur deux intervalles. Le calendrier liste trois créneaux ; le créneau du milieu n'a aucun brouilleur dans le journal. La notation marque { "2" } essais détectés sur { "3" } (latence médiane { "0" } s) et { "1" } manqué, avec { "0" } exécution de fausse alarme sur { "0.25" } h de temps sans brouillage. Rien ici ne dit quoi que ce soit d'un récepteur réel. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire.

# text
seg-ceaa46bdcb7e = Le plan et le catalogue

# text
# c1: NPRA/jammertest-plan
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-73a5899de383 = Source : le dépôt <c1/> de l'Administration norvégienne des routes publiques (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>licence MIT</b> (copyright { "2024" } Administration norvégienne des routes publiques ; le texte de la licence est enregistré dans <c2/>). Les fichiers sont récupérés, jamais intégrés au dépôt :

# text
# c1: 75c0b2ceea10e470c3799d14a8ef18842d8375a7
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-2a4967d30c3a = Il télécharge les catalogues et les fichiers du plan { "2025" } au commit figé <c1/> et refuse tout fichier dont le SHA-256 diffère de celui de <c2/>.

# text
# c1: type.group.test
# c2: 1.2.5
# c3: --local-offset-h
seg-7826929c89f6 = Un essai du catalogue a un identifiant pointé, <c1/> (par exemple <c2/> : type { "1" } brouillage, groupe { "2" }, essai { "5" }). Le plan liste, par zone d'essai et par créneau, quel identifiant est planifié. Les types { "1" } (brouillage), { "2" } (leurrage) et { "3" } (meaconing) émettent ; le type { "0" } (briefings, période de grâce, créneaux de réservation et ponctuels) n'émet pas et est ignoré. Les heures du plan sont l'heure locale murale ; <c3/> (par défaut { "2" }, CEST) dit de combien elles s'écartent de l'UTC. Les fichiers du plan comportent un champ de contact d'essai avec le nom d'une personne : il n'est jamais lu, et rien qui en dérive n'est écrit.

# text
seg-3eab33a0c38f = Importation

# text
# c1: --log-start <UTC time>
# c2: --log
# c3: --format
# c4: [[events]]
# c5: scheduled truth:
# c6: --attack-log <scenario.json>
# c7: attack_log
# c8: --time-shift-h
# c9: Z
seg-91fddde78691 = <c1/> remplace <c2/>/<c3/> lorsque le journal n'indique pas son début. La sortie est du TOML <c4/> à ajouter à un scénario de confiance du récepteur ; chaque étiquette commence par <c5/> et porte l'année de l'édition, l'identifiant du catalogue et la zone, et l'en-tête enregistre le SHA-256 de chaque fichier source. <c6/> lit à la place la vérité d'événements d'un dossier du jeu de données JammerTest { "2024" } (son <c7/>, horodatages décalés de <c8/>, par défaut -2 : ils disent <c9/> mais sont en heure locale).

# text
seg-6ed6415a6f52 = Notation

# text
# c1: session.toml
# c2: [log] format/path
# c3: [monitors]
# c4: [compare]
# c5: [[events]]
seg-1e72a977f7ad = <c1/> est un scénario de confiance du récepteur (<c2/>, <c3/> et <c4/> facultatifs). Ses propres <c5/> sont remplacés par le calendrier importé. Par essai planifié :

# text
seg-99427ab75a03 = champ

# text
# c1: detected
# c2: compare.detect_tol_s
# c3: late
# c4: missed
# c5: not-evaluable
seg-d2681be37798 = <c1/> (une alarme dans les <c2/>, par défaut { "10" } s, du début planifié), <c3/> (plus tard, à l'intérieur du créneau), <c4/> (aucune), <c5/>

# text
seg-01a977f18700 = première alarme moins début planifié

# text
# c1: --recover-hold-s
seg-b83d1f0a1fb7 = de la fin du créneau au début de la première période d'au moins <c1/> ({ "10" } s) sans alarme, avant l'essai suivant

# text
# c1: calibration_s + guard_s
# c2: baseline_contaminated
# c3: --guard-s
# c4: --key
# c5: --out
# c6: docs/EVIDENCE-PACKS.md
# c7: config.json
seg-84a34f13e93b = Un essai n'est notable que s'il commence au moins <c1/> après le début du journal ; un journal comportant un essai plus précoce est marqué <c2/> (la référence de base peut avoir été formée sous interférence). Les <b>fausses alarmes</b> sont des époques en alarme après calibration, en dehors de chaque créneau étendu de <c3/> ({ "60" } s) avant et après (ou après le point de récupération), comptées en époques et en exécutions, avec des exécutions par heure de temps sans brouillage. Avec <c4/> et <c5/>, l'exécution est écrite sous forme de paquet de preuves signé (<c6/>) : la fiche de notation et le calendrier importé se trouvent dans <c7/>, donc à l'intérieur de la chaîne de hachage et de la signature. Un paquet est un enregistrement technique, et non un avis juridique.

# text
seg-382613112d5d = Ce qu'un résultat ne dit pas

# text
seg-f1cb12a89001 = Un créneau planifié n'est pas un enregistrement d'émission. Un émetteur peut avoir démarré tard, s'être arrêté tôt ou n'avoir jamais fonctionné ; un essai « manqué » peut être un essai qui n'a pas émis, et une latence se mesure depuis le début planifié.

# text
seg-32baa4a4b9f0 = Une époque « propre » est « en dehors des créneaux planifiés », et non « prouvée exempte d'interférence ».

# text
seg-95cc22bbacc5 = La détection par des moniteurs du domaine de la mesure ne dit rien de la détection d'un leurreur cohérent de faible puissance.

# text
seg-2e91813cf9d7 = Aucune référence indépendante externe n'indique les heures réelles d'émission, donc rien ici n'est VALIDATED.

# text
seg-cfdf09e38e6e = L'exécution sur le jeu de données { "2024" } (préenregistrée)

# text
# c1: xval/jammertest-score/PREREGISTRATION.md
# c2: xval/jammertest-score/RESULTS.md
# c3: .ubx
# c4: PREREGISTRATION-v2.md
# c5: RESULTS-v2.md
# c6: 7
# c7: xval/oracles/setup.sh
# c8: tests/jammertest_score_2024.rs
# c9: KSHANA_JAMMERTEST_DIR
seg-473ed6ca71e5 = <c1/> a fixé la population, les définitions et les seuils avant la première exécution notée ; <c2/> consigne cette exécution. Résultat : <b>la règle enregistrée de minimum de données a échoué</b> ({ "4" } fenêtres de brouillage notables provenant de { "4" } des { "12" } dossiers <c3/> : { "5" } dossiers ont été écartés par la règle de référence de base et { "3" } journaux UBX n'indiquent leur début qu'en temps GPS de la semaine), de sorte qu'<b>aucun seuil n'est évaluable</b>. Rien n'a été assoupli ni ré-exécuté. La <b>v2</b> (<c4/>, validée seule avant son exécution ; traitement des données uniquement, mêmes seuils et même règle de minimum de données) a placé les journaux en temps GPS seul à partir de la date du dossier, noté les { "12" } dossiers CSV seul et utilisé une session de plateforme mobile pour les mobiles en déplacement. Résultat (<c5/>) : { "14" } dossiers sur { "24" } conservés mais seulement <c6/> fenêtres de brouillage notables, de sorte que la règle de minimum de données a de nouveau échoué et qu'<b>aucun seuil n'est évaluable</b>. Le résultat de la v1 est inchangé. À titre descriptif seulement : { "3" } fenêtres de brouillage sur { "7" } ont déclenché une alarme dans les { "10" } s, { "4" } plus tard, aucune manquée ; latence médiane { "18" } s ; taux d'alarme en l'absence de brouillage { "0.089" }. La limite contraignante est désormais la règle de référence de base, qui supprime { "10" } dossiers ; un nouvel enregistrement exigerait une règle différente pour les fenêtres précoces. Le jeu de données (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) est récupéré par <c7/> et jamais intégré au dépôt ; le test <c8/> fige l'exécution enregistrée lorsque <c9/> pointe vers le jeu de données extrait.

# text
seg-cd75b60bd0db = Le jeu de données NMEA SimulaMet { "2025" }

# text
seg-87bc2544154b = Le jeu de données SimulaMet Jammertest { "2025" } dérivé de NMEA (IEEE DataPort, DOI 10.21227/a7v4-xw11) <b>n'est pas</b> adapté dans { "0.38" }. Sa page n'indique aucune licence et dit « This dataset requires an IEEE DataPort Subscription to access » : les conditions n'autorisent pas clairement la redistribution ni une récupération automatisée, aucun adaptateur ni script de récupération n'a donc été écrit. Son usage exige la décision du propriétaire et, idéalement, l'accord écrit des auteurs.

# text
# c1: kshana::jammertest
# c2: jammertest_import
# c3: jammertest_score
# c4: /kshana-jammertest
# c5: jammertest
# c6: docs/SURFACES.md
seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (les mêmes noms), outils MCP aux mêmes noms, et la commande <c4/> et la compétence <c5/>. Le paquet signé n'existe qu'en ligne de commande (il a besoin d'une clé de signature). Voir <c6/>.

# text
seg-82aab597103a = <s1>Précédent</s1>Signal avant augmenté LunaNet

# text
seg-fb9e48a04566 = <s1>Suivant</s1>Entrées machine et capteur
