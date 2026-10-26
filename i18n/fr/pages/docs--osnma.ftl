# docs--osnma: translations (fr)

# text
seg-fcd0ebea49bc = Ligne de commande

# attr:aria-label, text
seg-6816f4e1a0a0 = Version

# text
seg-94058315dfe4 = Entrée

# text
# c1: docs/OSNMA.md
seg-23746ba370c2 = Source : <c1/>

# text
seg-1e9c104231db = Vérificateur côté récepteur de Galileo OSNMA

# text
seg-17fd702f5997 = Un vérificateur côté récepteur pour l'authentification des messages de navigation du service ouvert Galileo (OSNMA), en Rust pur. Il lit les pages I/NAV et rapporte, par satellite et par époque, si les données de navigation sont authentifiées cryptographiquement, et pourquoi une vérification a échoué.

# text
seg-ae081f55c4f1 = <b>À titre consultatif.</b> Il s'agit d'une sortie d'analyse et de surveillance, et non d'un équipement de navigation homologué. L'état d'authentification rapporté ici n'est pas un service d'intégrité de navigation et ne doit pas être le seul fondement d'une décision de navigation ou de sécurité.

# text
seg-84d7260098b1 = AVIS : propriété intellectuelle dans l'interface Galileo OSNMA

# text
seg-6d78ccef53d5 = Kshana n'accorde aucun droit sur la propriété intellectuelle de l'Union européenne dans le document de contrôle d'interface du signal dans l'espace Galileo OSNMA (les « ICD IPR »). L'ICD porte sa propre autorisation (son annexe E), qui est non exclusive et sans redevance et a ses propres conditions, sa portée et ses limites. Quiconque utilise, construit ou distribue un logiciel fondé sur ce module s'appuie directement sur cette autorisation et doit lire et accepter lui-même ses conditions. La licence de Kshana (AGPL-3.0-only, ou la licence commerciale) ne couvre que le code propre à Kshana.

# text
seg-c13ad334bf9a = Ce module implémente les algorithmes que décrivent les documents ci-dessous. Le texte de l'ICD n'est pas reproduit ; les valeurs numériques (dispositions de champs, énumérations, table de correspondance MAC) sont réexprimées dans la notation propre à Kshana, avec la source citée dans le code. L'ICD et les Receiver Guidelines sont © Union européenne ; la source est reconnue ici. Kshana n'est ni développé par, ni utilisé par, ni approuvé par, ni soutenu par l'Union européenne, la Commission européenne, l'EUSPA ou tout autre organisme.

# text
seg-860096b04999 = Documents de référence

# text
seg-04c1e1a6278d = Publiés par le European GNSS Service Centre.

# text
seg-278dd0f9df58 = Document

# text
seg-3427e40d7bee = Date

# text
seg-54d15cb428d3 = ICD du signal dans l'espace Galileo OSNMA (« SIS ICD »)

# text
seg-f63fbc1175cf = Édition { "1.1" }

# text
seg-fa85e4db2c93 = octobre { "2023" }

# text
seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

# text
seg-907e4e46056c = Édition { "1.3" }

# text
seg-a9b75bc7f063 = janvier { "2024" }

# text
seg-530ae6421157 = Les numéros de sections et de tableaux cités dans le code et ici renvoient à ces versions.

# text
seg-143726cc3d5f = Ce qui est vérifié

# text
seg-029a9bb7608f = La chaîne de confiance, de la racine jusqu'aux données :

# text
seg-886f1b6556ce = <b>Clé publique (ICD { "3.2.2" }, { "6.2" }).</b> Un DSM-PKR est réassemblé à partir de ses blocs et son chemin de Merkle est parcouru jusqu'à une racine de Merkle de confiance (SHA-256).

# text
seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> Un DSM-KROOT est réassemblé ; sa signature ECDSA (P-256/SHA-256 ou P-521/SHA-512) est vérifiée par rapport à la clé publique qu'il nomme, sur l'en-tête NMA et les paramètres de la chaîne.

# text
seg-acc1f06cf63a = <b>Clés TESLA (ICD { "5.5" }, { "6.4" }).</b> Chaque clé d'un message MACK est remontée jusqu'au KROOT ou jusqu'à une clé vérifiée antérieure, avec la fonction de hachage de la chaîne.

# text
seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> Les champs Tag-Info flexibles sont vérifiés par rapport au MACSEQ avec la clé qui ouvre ce MACK.

# text
seg-41ba810d7c8d = <b>Étiquettes (ICD { "4.2" }, { "6.7" }).</b> Chaque étiquette est recalculée (HMAC-SHA-256 ou CMAC-AES, tronquée à la longueur d'étiquette de la chaîne) sur les identités des satellites, l'heure de la sous-trame, la position de l'étiquette, l'état NMA et les données de navigation qu'elle couvre, puis comparée. Les ADKD { "0" } (éphéméride, horloge et état), ADKD { "4" } (paramètres de synchronisation temporelle) et ADKD { "12" } (MAC lent, clé publiée dix sous-trames plus tard) sont gérés, avec l'authentification croisée des satellites qui ne portent pas eux-mêmes OSNMA, et les étiquettes factices (COP { "0" }).

# text
# c1: discarded
seg-1be16a4ca722 = Une étiquette qui désigne une valeur réservée, ou dont l'ADKD ne correspond pas à l'emplacement de la table de consultation MAC, est mise de côté (les Receiver Guidelines demandent de l'écarter) et signalée comme <c1/>, et non comme un échec.

# text
# c1: bad_crc
seg-eb993b3a0d17 = Les pages sont vérifiées par rapport à leur CRC (le CRC-24Q de Galileo) avant toute autre chose ; une page qui échoue est abandonnée et signalée (<c1/>).

# text
seg-c414a30d0840 = Valeurs d'état

# text
# c1: authenticated
# c2: failed
# c3: tag_mismatch
# c4: macseq_mismatch
# c5: key_chain_mismatch
# c6: key_conflict
# c7: pending
# c8: no_chain
# c9: awaiting_key
# c10: no_nav_data
# c11: unknown_maclt
# c12: unsupported_function
# c13: service_not_usable
# c14: chain_mismatch
# c15: discarded
# c16: authenticated
seg-268f61b565b9 = Par étiquette : <c1/>, <c2/> avec un motif (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> avec un motif (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>), ou <c15/>. Une étiquette factice (COP { "0" }) apparaît comme <c16/> au niveau de l'étiquette, puisqu'elle prouve la clé, mais elle ne couvre aucune donnée de navigation et ne compte jamais pour un satellite.

# text
seg-331a6ab821f3 = Par satellite, sous la forme que consomme le moniteur receiver-trust :

# text
# c1: Authenticated
seg-9912068c5b34 = <c1/> seulement tant que les données d'éphéméride et d'horloge vérifiées les plus récentes (ADKD { "0" } ou

# text
# c1: Unavailable
seg-38e7f56293e7 = de ce satellite sont récentes (à moins de { "600" } s de l'heure du vérificateur par défaut) et sont toujours les données utilisées. La vérification porte sur les données, non sur l'IODnav : le vérificateur conserve le SHA-256 de la chaîne de bits authentifiée (les Word Types { "1" } à { "5" }, comme les couvre l'ADKD { "0" }) et de la plus récente de ces chaînes émise par le satellite, et elles doivent être égales. Un IODnav copié sur d'autres mots, ou des bits du Word Type { "5" } modifiés (qui ne portent pas d'IODnav), donne <c1/> jusqu'à ce que les nouvelles données soient authentifiées. Une sous-trame qui porte des mots d'éphéméride mais pas un jeu complet de Word Types { "1" } à { "5" } sous un même IODnav retire l'état de la même manière (toute sous-trame E1-B authentique porte les cinq) ; une sous-trame sans aucun mot d'éphéméride ne dit rien. Les étiquettes d'un autre satellite (authentification croisée) comptent pour le satellite dont elles couvrent les données.

# text
# c1: Failed
seg-233109ef4428 = <c1/> lorsqu'une vérification sur les données du satellite a échoué dans la mémoire des échecs ({ "600" } s par défaut de l'heure du vérificateur), même si des données ultérieures sont vérifiées. Une discordance est imputée au satellite dont l'étiquette couvre les données et au satellite qui a émis l'étiquette, puisque l'un ou l'autre peut être en cause ; une discordance MACSEQ est imputée au satellite émetteur.

# text
# c1: Unavailable
seg-8ba1d89bcf91 = <c1/> dans les autres cas, et pour chaque satellite après un message d'alerte vérifié, avec l'état NMA « ne pas utiliser » ou un état réservé, et jusqu'à ce que la première clé ait été vérifiée.

# text
# c1: Failed
# c2: Authenticated
# c3: Unavailable
# c4: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c5: kshana::osnma::pksos_sentence
seg-7fceea6e23f8 = La valeur globale est <c1/> si un satellite a échoué, <c2/> si au moins un est authentifié et qu'aucun n'a échoué, et <c3/> sinon. <c4/> est la phrase correspondante ; <c5/> la construit.

# text
seg-446a3218ccbb = Heure

# text
# c1: set_reference_time
# c2: --reference-time
seg-18e91e6aa160 = La chaîne de clés montre qu'une clé appartient à une sous-trame donnée, non que cette sous-trame est la sous-trame présente. Le vérificateur ne prend donc jamais « maintenant » d'une page non vérifiée. Son heure est la plus tardive de l'heure de référence fournie avec <c1/> (<c2/>) et de la sous-trame de la dernière clé TESLA vérifiée (une clé ne peut pas être connue avant son créneau, elle prouve donc que l'heure n'est pas antérieure). La mémoire des échecs, la fenêtre de validité d'une authentification et l'éviction des anciennes données s'appuient sur cette heure. Une sous-trame datée de plus de trois sous-trames après la dernière clé vérifiée est mise de côté, sauf si sa propre clé prouve son heure ; les messages de clé et d'alerte qu'elle contient sont tout de même traités, puisqu'ils portent leur propre preuve (une signature ou la racine de Merkle).

# text
# c1: set_reference_time
# c2: poll_clock
# c3: KeyStall
seg-318323322a3a = L'horloge s'arrête lorsque OSNMA s'arrête, puisque seules les clés la font avancer. Un appelant en direct doit appeler <c1/> avec l'heure de l'hôte à chaque sous-trame ; l'authentification expire alors d'elle-même, et <c2/> (également exécuté à chaque sous-trame) renvoie un événement <c3/> dès qu'aucune clé n'a été vérifiée pendant plus longtemps que la fenêtre d'authentification.

# text
# c1: freshness: NOT enforced
seg-5338d8f5de77 = Ce que cela ne donne pas, c'est la fraîcheur. Sans heure de référence provenant d'une source qu'un attaquant ne peut pas déplacer, un rejeu de données authentiques anciennes sous d'anciens horodatages s'authentifie, et les horodatages des pages ne valent que ce que vaut leur source : la CLI le dit (<c1/>) chaque fois qu'aucune heure de référence n'est fournie. Avec une heure de référence, la tolérance est inférieure à une sous-trame (par défaut { "29" } s ; les valeurs plus grandes sont refusées). Une heure de référence est un instant unique : les sous-trames plus éloignées que la tolérance sont mises de côté et comptées, ce qui convient à des données en direct ou tout juste enregistrées, non à un long enregistrement. Pour un enregistrement, omettez l'heure de référence et lisez le résultat comme « authentique, pas nécessairement récent ». Les Receiver Guidelines donnent l'exigence formelle.

# text
seg-aa37ce329914 = Les horodatages de pages d'un flux u-blox proviennent des données non authentifiées elles-mêmes (voir Entrée) ; ils n'offrent donc pas non plus de protection de fraîcheur.

# text
seg-a33d72076025 = Chaînes, clés et alertes

# text
# c1: chain_mismatch
seg-be2d9588df65 = Les chaînes vérifiées sont conservées par identifiant de chaîne (CID) ; les étiquettes sont vérifiées avec la chaîne que nomme l'en-tête NMA, et un en-tête qui nomme une chaîne non vérifiée laisse les étiquettes de la sous-trame sans vérification (<c1/>). Un second KROOT d'une chaîne en vigueur ajoute un point d'ancrage ; un KROOT d'une autre chaîne est conservé à côté, de sorte qu'annoncer de nouveau l'ancienne chaîne après un renouvellement n'annule pas la nouvelle.

# text
# c1: stale
seg-bbb6574fa258 = L'en-tête NMA n'est pas authentifié ; ce qu'il annonce ne compte donc que s'il est confirmé : lorsque plus d'un satellite envoie le même en-tête dans une sous-trame, ou lorsque le message signé d'un KROOT vérifié le porte (l'en-tête fait partie de ce message). Les deux ne sont pas équivalents. L'accord de plus d'un satellite protège contre une anomalie d'un seul satellite, non contre un leurreur : un seul leurreur peut falsifier deux identifiants de satellite. Ce que cela lui rapporte, c'est un déni de service, et rien de plus, puisqu'un « ne pas utiliser » confirmé efface les données authentifiées de chaque satellite : le lever, falsifié ou authentique, ne rétablit rien tant que de nouvelles étiquettes ne sont pas vérifiées sous de véritables sous-trames opérationnelles. (Avant cet effacement, une levée falsifiée pouvait ramener, pendant au plus la fenêtre d'authentification, des données déjà authentifiées.) La vraie confirmation est l'en-tête signé par le KROOT, qui lève aussi de nouveau un « ne pas utiliser » lorsqu'il porte un état opérationnel. L'en-tête d'un seul satellite ne change rien d'autre que la vérification des étiquettes de sa propre sous-trame. Un KROOT dont l'heure d'applicabilité n'est pas postérieure à celle de la chaîne détenue pour le même identifiant (un rejeu d'un plus ancien) est refusé (<c1/>) ; un KROOT de la même chaîne ajoute un point d'ancrage.

# text
seg-5c08dbaa8d43 = L'état de l'en-tête confirmé et la valeur CPKS pilotent la révocation. Avec l'état NMA « ne pas utiliser », CPKS « chaîne révoquée » abandonne la chaîne que nomme l'en-tête et refuse son KROOT dès lors ; CPKS « clé publique révoquée » abandonne la clé publique qui a signé cette chaîne, et toutes les chaînes signées avec elle. Si la chaîne de remplacement pour cet identifiant a été adoptée avant que l'en-tête soit confirmé, quel que soit le délai, la clé révoquée est celle de la chaîne précédente, non celle de la nouvelle ; ce souvenir est conservé jusqu'à ce que la révocation soit exécutée ou que l'en-tête d'une autre procédure soit confirmé, et un en-tête de révocation répété à chaque sous-trame n'est exécuté qu'une fois. Les mêmes valeurs CPKS avec l'état opérationnel marquent la transition vers le remplacement et ne révoquent rien. L'en-tête n'est pas lui-même authentifié ; une révocation falsifiée ne peut donc que retirer l'authentification, et elle est définitive jusqu'au redémarrage du vérificateur. Cette irréversibilité vaut aussi pour la clé en service : une révocation falsifiée de clé publique réinitialise la mémoire de la clé remplacée et révoque la clé en usage, et seul un redémarrage l'annule.

# text
# c1: Unavailable
seg-e7d43eb18c24 = Un DSM-PKR avec NPKT { "4" } est le message d'alerte ; il est vérifié par l'arbre de Merkle comme une clé, son champ NPK aléatoire faisant partie de la feuille. Une alerte vérifiée efface toutes les chaînes et clés publiques, refuse tout KROOT et toute clé publique ultérieurs, et rend chaque satellite <c1/>, comme le prescrivent les Receiver Guidelines, jusqu'au redémarrage du vérificateur.

# text
seg-4068e9bda7c1 = Le champ de remplissage d'un DSM-KROOT est un condensat du message signé et de la signature. Il est vérifié avant la signature, et il indique aussi avec quel en-tête NMA le message signé a été construit lorsque l'en-tête a changé pendant l'assemblage du message.

# text
seg-8ea31bf25ef0 = Ce qui n'est pas vérifié, ou pas exercé

# text
seg-3d0808cab632 = <b>Fraîcheur.</b> Voir Heure ci-dessus : elle exige une heure de référence extérieure.

# text
seg-b3d63950baa4 = <b>Renouvellement et révocation.</b> Les chaînes et les clés sont suivies telles que les exercent les flux des vecteurs publiés (renouvellement, fin de chaîne, révocation de chaîne et de clé, nouvelle clé publique, nouvel arbre de Merkle, alerte), et non tous les cas que permet l'ICD. Une révocation annoncée par l'en-tête non authentifié est crue sur parole et est définitive pour la session. Un nouvel arbre de Merkle n'est pris en compte que par la racine de Merkle fournie au vérificateur.

# text
seg-f01d90a44585 = <b>Condensat de l'arbre de Merkle.</b> Les messages DSM-PKR sont vérifiés avec un arbre SHA-256. Un arbre SHA3-256, que l'ICD autorise à l'avenir, n'est pas pris en charge. La fonction de hachage de la chaîne peut être SHA-256 ou SHA3-256.

# text
seg-d9ca4e69ffc9 = <b>Listes d'état des clés.</b> La révocation est suivie par l'en-tête NMA et les messages du flux ; les listes de révocation de certificats ne sont pas lues.

# text
seg-73e0b16d03c7 = <b>Couverture des données authentifiées.</b> L'ADKD { "4" } avec COP { "1" } envoyé dans une sous-trame impaire ne peut pas authentifier (le Word Type { "10" } peut être envoyé une ou deux sous-trames plus tôt) ; cela ne coûte que de la disponibilité, jamais de l'exactitude.

# text
seg-acc28dcced83 = <b>Fonctionnement en temps constant.</b> Non fourni et non nécessaire : le vérificateur ne détient aucun secret (uniquement des clés publiques, des clés de chaîne publiées et des données reçues).

# text
seg-b2f8ec90ae39 = <b>Qualité du signal et des données.</b> Les pages sont vérifiées par CRC et les pages d'alerte abandonnées, mais on ne sait rien du signal sur lequel elles sont arrivées. La récupération Reed-Solomon des mots I/NAV { "1" } à { "4" } n'est pas utilisée : les données doivent être reçues directement.

# text
seg-97313ba2bf88 = <b>Pas un service d'intégrité de position.</b> L'authentification dit que les données proviennent du système. Elle ne dit rien du signal sur lequel elles sont arrivées ni de la qualité de la position calculée.

# text
# c1: <svid> <gst_seconds> <60 hex digits>
# c2: #
# c3: gst_seconds
# c4: week * 604800 + time of week
seg-d696f298c4a2 = <b>Format de page brut.</b> Une paire de pages par ligne : <c1/>, commentaires <c2/> autorisés. <c3/> est le GST en secondes (<c4/>) au début de la page ; l'hexadécimal représente les { "240" } bits des moitiés paire et impaire (queues comprises), bit de poids fort en premier.

# text
# c1: SVID,NumNavBits,NavBitsHEX
# c2: --start-gst
seg-e436d96b12cf = <b>CSV de vecteurs de test.</b> La disposition des vecteurs publiés (<c1/>). L'heure de début provient de <c2/> ou d'un nom de fichier daté.

# text
# c1: --format ubx
# c2: src/osnma/ubx.rs
# c3: src/realdata/ubx.rs
seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Un flux d'octets UBX brut (<c1/>, détecté automatiquement). Les messages Galileo E1-B I/NAV sont reconstitués en paires de pages (<c2/>) ; les autres systèmes, E5b, les pages d'alerte et les trames dont la somme de contrôle est erronée sont ignorés. SFRBX ne porte pas d'heure ; chaque page est donc datée à partir de l'heure contenue dans ses propres données (types de mot { "5" } et { "0" }) et n'est acceptée que si des pages consécutives portant une heure concordent avec le nombre de pages reçues entre elles ; les pages qui ne peuvent pas être placées sont abandonnées, jamais devinées. Cette heure provient des données elles-mêmes et n'offre aucune protection de fraîcheur (voir Heure ci-dessus). L'identifiant de signal { "0" } (E1-C) ne porte pas de données, de sorte que l'accepter en même temps que E1-B est sans conséquence. Une paire de synchronisation isolée avec une longueur absurde ne retient pas le lecteur. Le code de trame est une troisième copie du découpage UBX de l'arborescence (<c3/>, l'ingestion receiver-trust) ; il est tenu à part afin que le comportement de receiver-trust reste inchangé, et les trois pourraient plus tard partager un seul lecteur. La disposition des mots d'un message SFRBX est tirée de descriptions publiques et vérifiée sur des trames synthétiques seulement, non sur un récepteur réel.

# text
# c1: --epochs
# c2: --json
seg-47118a577876 = La sortie texte donne l'état par satellite et, avec <c1/>, par étiquette et par époque ; <c2/> donne la même chose avec la liste des étiquettes. Le code de sortie { "3" } signifie qu'une vérification sur les données d'un satellite a échoué, { "2" } une erreur d'utilisation ou d'entrée. L'avertissement indicatif ci-dessus est imprimé en premier sur tous les chemins, erreurs et usage compris.

# text
seg-e2af23b756f5 = Depuis Python et WebAssembly

# text
# c1: kshana.osnma_verify(data, format="", start_gst=None, merkle_root_hex="", public_keys=None, reference_time=None, max_time_error=None)
# c2: osnma_verify(input_base64, format, start_gst, merkle_root_hex, public_keys, reference_time, max_time_error)
# c3: kshana osnma verify --json
seg-4edf83a818d1 = <c1/> (Python) et <c2/> (WebAssembly) exécutent le même vérificateur sur des octets en mémoire et renvoient le JSON qu'imprime <c3/>, avertissement indicatif compris. Le serveur MCP ne le porte pas : l'entrée est un long flux brut de récepteur mieux servi par la ligne de commande et Python, et un outil d'agent ajouterait une grande surface d'entrée sans bénéfice. Le même avertissement indicatif et les mêmes limites s'appliquent ; l'état n'est pas un service d'intégrité de la navigation.

# text
seg-0987c3b00a14 = Tests et données de test

# text
# c1: tests/osnma_synthetic.rs
seg-2acc9fa7212b = Les données de test sont synthétiques et générées par le propre code et les propres tests de Kshana. Aucun vecteur de l'ICD ou des Guidelines, aucun exemple travaillé ni aucun matériel de clé n'est stocké dans ce dépôt. Les tests par défaut (<c1/> et les tests unitaires) construisent une chaîne, des pages et des étiquettes à partir des équations et vérifient la cohérence et que la corruption délibérée est détectée : un bit de navigation inversé, un bit de clé inversé, des étiquettes rejouées, de mauvais horodatages, une heure hors de la référence, des données manquantes, et les attaques trouvées par la revue (une sous-trame leurrée du futur lointain qui ne doit pas effacer un échec, une authentification qui doit expirer et suivre l'IODnav, une alerte, l'état NMA « ne pas utiliser », des étiquettes factices, une discordance MACSEQ, des clés en conflit, la révocation et le renouvellement de chaîne, un remplissage ou une signature erronés), avec CMAC-AES, une chaîne SHA3-256 et une signature P-521 portées à travers le vérificateur. Comme ces données proviennent de notre propre lecture de l'ICD, elles montrent l'autocohérence, non la conformité.

# text
seg-4906b14a33a3 = Les primitives sont vérifiées par rapport à des tests à réponse connue publiés, dont aucun n'est tiré de l'ICD : RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) et RFC { "6979" } (ECDSA P-256). Les signatures P-521 sont vérifiées pour l'encodage et le choix du hachage avec une clé jetable créée dans le test ; l'arithmétique de la courbe est celle de la bibliothèque.

# text
# c1: tests/osnma_official_vectors.rs
# c2: KSHANA_OSNMA_VECTORS
seg-82ee90adf7ed = L'accord avec les vecteurs officiels est vérifié par <c1/>, qui est facultatif : il lit une copie de l'archive officielle de vecteurs de test que vous téléchargez vous-même, depuis le répertoire désigné par <c2/>, et ne fait rien lorsque la variable n'est pas définie. Il ne stocke ni ne redistribue rien, et les exécutions de test par défaut n'utilisent aucun réseau. Il ne donne au vérificateur qu'une racine de Merkle et les clés publiques d'un seul arbre, comme en aurait un récepteur, de sorte que les chaînes sont établies à partir du DSM-KROOT signé dans le flux et que tout le chemin s'exécute : Merkle, signature, chaîne de clés, MACSEQ et étiquettes. Il affirme, par jeu de vecteurs, un plancher sur les étiquettes authentifiées, qu'aucune n'a échoué, quelles chaînes et clés le flux annonce, des étiquettes authentifiées d'ADKD { "0" }, { "4" } et { "12" }, que l'authentification reprend après la fin de chaîne, la révocation de chaîne, la révocation de clé et une nouvelle clé publique, que le message d'alerte est vérifié et ne laisse rien d'authentifié, et que chaque vecteur n'utilise que HMAC-SHA-256, une chaîne SHA-256, des clés de 128 bits, des étiquettes de 40 bits et les entrées de consultation { "33" } et { "34" }. Les autres choix d'algorithme et de paramètres de l'ICD ne sont donc couverts que par les tests à réponse connue et synthétiques ci-dessus.

# text
seg-70bb026ce655 = Dépendances

# text
# c1: hmac
# c2: cmac
# c3: aes
# c4: sha3
# c5: p256
# c6: p521
# c7: ecdsa
# c8: sha2
# c9: wasm32-unknown-unknown
# c10: cargo deny
seg-00a3dd901039 = Crates RustCrypto, en Rust pur, MIT OR Apache-2.0, compilées sans fonctionnalités par défaut : <c1/>, <c2/>, <c3/>, <c4/>, <c5/> et <c6/> (la fonctionnalité <c7/>, utilisée pour la vérification seulement), à côté de <c8/> déjà présent dans l'arborescence. Elles se compilent pour <c9/> et passent <c10/>.

# text
seg-7ab62b91d469 = <s1>Précédent</s1>La confiance comme télémétrie de sécurité

# text
seg-5dc48294fbb2 = <s1>Suivant</s1>Signal direct augmenté LunaNet
