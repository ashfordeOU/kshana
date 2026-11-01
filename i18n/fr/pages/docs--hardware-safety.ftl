# docs--hardware-safety: translations (fr)

# text
seg-fdbb9db68f1d = aucun

# text
# c1: docs/HARDWARE-SAFETY.md
seg-2015f437e669 = Source : <c1/>

# text
seg-10c7eaab58c5 = Sécurité matérielle : ce que Kshana fait avec le matériel, et ce qu'il ne fait jamais

# text
seg-fe4873962140 = <b>État : relecture juridique par le propriétaire en attente.</b> Les notes juridiques ci-dessous sont la lecture que les mainteneurs font de sources publiques, écrites pour qu'un utilisateur sache où sont les limites. Ce ne sont pas des conseils juridiques, elles n'ont pas été relues par un conseil, et le droit diffère selon les pays. Lisez-les comme une raison de consulter un juriste, et non comme une autorisation.

# text
seg-bd2fbb355834 = Logiciel à titre consultatif pour la recherche, la simulation et l'essai. Ce n'est pas un équipement homologué et il n'évalue ni n'approuve un récepteur, une horloge ou un laboratoire. Voir la déclaration à titre consultatif dans le README.

# text
seg-f27c286787b1 = La règle

# text
seg-88638e41faab = La réception est le produit. L'émission n'est jamais dans le moteur ouvert.

# text
seg-614d381dd0d0 = Kshana ne contient aucun code qui pilote un émetteur. Il n'y a aucun chemin d'émission SDR (aucun appel d'émission UHD, HackRF, bladeRF ou Soapy), et aucune forme d'onde de brouillage ou de leurrage n'est écrite dans un fichier destiné à être rejoué.

# text
# c1: .sdrx
# c2: kshana iq scene
# c3: .sdrx
seg-2e370a1c6c4c = Les fichiers que Kshana écrit (scènes IQ, enregistrements SigMF et ION <c1/>, exports NMEA et bench) décrivent des signaux ou des mouvements <b>simulés et légitimes</b>, et les métadonnées que Kshana écrit pour une scène indiquent qu'elle a été écrite par <c2/> (le commentaire ION <c3/> indique qu'il s'agit d'une scène simulée, et non d'un enregistrement).

# text
seg-8ce652bc1af6 = Lorsqu'une expérience a besoin de RF sur un banc, c'est le <b>propre équipement de l'opérateur</b> qui la produit, dans son propre blindage, sous sa propre autorisation. Kshana consigne ce que l'opérateur dit avoir fait, et ne le déduit jamais.

# text
seg-c74fc5d82071 = Étapes

# text
seg-01e7633921dc = Chaque étape indique ce que fait Kshana, quel matériel est impliqué, qui émet de la RF (le cas échéant), et la porte qui doit tenir avant que Kshana traite le résultat comme une preuve.

# text
seg-324e16b11186 = Étape

# text
seg-bb269645d988 = Rôle de Kshana

# text
seg-76c0861cbe83 = Matériel

# text
seg-92ab27525ed1 = Émission RF

# text
seg-c822f981cfcf = Porte

# text
seg-00727bb577f9 = État dans { "0.38" }

# text
seg-1c566ec98a03 = Fichiers : journaux de rejeu, IQ, exports bench, NMEA ou UBX en direct via stdin, TCP ou UDP

# text
seg-0435986aa760 = livré

# text
# c1: iq monitor --follow
seg-56b9a4399108 = Réception passive : récepteurs en lecture seule ; journaux de synchronisation temporelle (linuxptp, chrony, TICC) ; CSV d'IMU ; <c1/> sur un fichier SigMF en croissance

# text
seg-608fc0a99107 = les récepteurs de l'utilisateur, le grandmaster, la SDR en réception

# text
# c1: --configure
seg-786d9e5ccf93 = toute écriture de configuration vers un récepteur exige un <c1/> explicite ; la valeur par défaut est la lecture seule

# text
# c1: holdover-test
# c2: iq monitor --follow
seg-ab8874046283 = livré en partie : formats de journaux de synchronisation temporelle, <c1/>, <c2/> ; l'entrée de récepteur série est prévue

# text
seg-6b0a194d3f64 = Orchestration de laboratoire sans RF de la part de Kshana : une spécification des conditions d'essai, des étapes de l'opérateur (retrait de l'antenne, démarrage du simulateur) sollicitées et horodatées, notation aller-retour et preuve

# text
seg-8e2847bce9ac = simulateurs du laboratoire, boîtiers blindés

# text
seg-121fe22c92ec = par le simulateur <b>du laboratoire</b> seulement, en mode conduit

# text
# c1: lab-attestation
seg-0a704c5443c5 = une <c1/> signée (ci-dessous) consignée dans le paquet de preuves ; Kshana refuse de noter une exécution de laboratoire sans elle

# text
seg-9e94d44cd197 = l'enregistrement est implémenté dans les paquets de preuves ; le refus de noter sans lui ne l'est pas encore (aucune commande d'exécution de laboratoire n'existe)

# text
seg-ee5333e346ad = Rejeu conduit de scènes IQ GNSS <b>légitimes</b> : Kshana écrit le fichier de scène, et l'utilisateur le rejoue avec son propre outil dans un câble avec atténuateurs et un dispositif sous test dans une enceinte RF

# text
seg-fa5b0f1b41f7 = la SDR de l'utilisateur, ses atténuateurs, son enceinte

# text
seg-9049203a2a6e = en mode conduit seulement, sous la responsabilité de l'utilisateur

# text
seg-b4392e583cb8 = aucun code d'émission dans le moteur ouvert ; les formes d'onde d'interférence et de leurrage restent hors périmètre ; revue du contrôle des exportations ; conseil juridique

# text
seg-ced2afbf108f = pas dans le moteur ouvert ; un élément de l'édition commerciale à traiter avec un conseil juridique

# text
seg-0f8a0fce4d20 = Matériel RF en boucle fermée en temps réel (hardware-in-the-loop)

# text
seg-d109f8e36ce8 = équipement partenaire

# text
seg-fb26b352f56e = partenaire

# text
seg-38c768d5faa7 = intégrer plutôt par la spécification de l'étape { "2" }

# text
seg-458f37b807ba = non prévu

# text
seg-2e59d363e31b = « Livré » signifie que le code figure dans cette version. Rien dans ce tableau ne dit qu'une étape a été utilisée avec un partenaire, un laboratoire ou une autorité ; aucune ne l'a été.

# text
seg-1524fb5b0aba = Principes

# text
seg-82b8ed15bbe6 = La réception est le produit, et l'émission n'est jamais dans le code ouvert.

# text
seg-63c000eccfc2 = Chaque session matérielle produit un paquet de preuves avec les hachages des entrées, des conditions et des seuils utilisés.

# text
seg-63cc5d9513ff = Une attestation de mode conduit ou blindé est consignée, jamais déduite.

# text
seg-da1e4f5da956 = Les nombres qui viennent du matériel restent <b>MODELLED</b> tant qu'une référence externe indépendante ne concorde pas (par exemple une trajectoire de vérité de laboratoire ou une horloge de référence). Un seuil fixé à l'avance n'est pas assoupli après une exécution.

# text
seg-d8e445427d02 = Les antennes à diagramme contrôlé, les centrales inertielles et les horloges atomiques à l'échelle d'une puce sont traitées comme des sources de données (diagrammes, journaux, courbes de stabilité publiées), et non comme des dispositifs que Kshana pilote.

# text
seg-7a22a9591fa3 = Formulation : un résultat est « mesuré par rapport au gabarit » ou, pour une exigence, « apporte des éléments de preuve en faveur de » celle-ci. Kshana ne dit pas qu'un dispositif respecte une norme, et personne ne l'a évalué ni approuvé.

# text
seg-913509e5d6b2 = Notes juridiques (relecture juridique par le propriétaire en attente)

# text
seg-c18b68936406 = Recevoir des signaux GNSS est légal presque partout. Émettre dans les bandes GNSS ne l'est pas.

# text
seg-070d8a8d5494 = <b>États-Unis.</b> Le brouillage délibéré des radiocommunications est interdit par { "47" } U.S.C. §{ "333" }, et la FCC sévit contre les brouilleurs (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Une émission depuis un banc peut porter au-delà du banc.

# text
seg-336b48c6f5f2 = <b>Ailleurs.</b> Les mainteneurs n'ont pas examiné le droit des autres pays. La communauté autour de gps-sdr-sim déclare que l'émission de sa sortie est interdite par la loi dans la plupart des pays ; considérez cela comme l'hypothèse de travail partout où un conseil juridique n'a pas dit le contraire.

# text
seg-8d31cbd38718 = <b>Un montage blindé ou conduit est une protection, pas un permis.</b> L'attestation ci-dessous consigne la protection que l'opérateur dit avoir été en place. Elle ne rend pas une émission licite.

# text
# c1: iq monitor --follow
seg-7373bfd21035 = <b>Enregistrement.</b> L'enregistrement de signaux radio peut soulever des questions de vie privée et de légalité à certains endroits. <c1/> et toute recette de capture sont en réception seule, et l'opérateur est responsable de l'endroit et de ce qu'il enregistre.

# text
seg-2edf9b14e62c = <b>Contrôle des exportations.</b> Un logiciel de matériel en boucle qui pilote des générateurs de signaux peut relever de règles de contrôle des exportations. C'est pourquoi l'étape { "3" } est hors du moteur ouvert.

# text
seg-bcd59f201022 = <b>Rien ici n'est une approbation ni un accord.</b> Aucun régulateur, aucun polygone d'essai, aucun laboratoire ni aucun fournisseur n'a été consulté sur ce document ni n'a convenu de quoi que ce soit dans celui-ci.

# text
# c1: lab-attestation
seg-81091020e648 = Le champ <c1/>

# text
# c1: lab-attestation
seg-64918fd6895d = À partir de l'étape { "2" }, une exécution ayant impliqué du matériel de laboratoire porte un objet <c1/>, consigné dans le paquet de preuves à côté des hachages des entrées. C'est une déclaration d'un opérateur nommé, et non une mesure, et Kshana ne la vérifie pas.

# text
seg-3bf153c63fa3 = Ce qui est implémenté dans { "0.38" } :

# text
# c1: kshana receiver-trust evidence ... --lab-attestation <file.toml>
# c2: manifest.json
# c3: lab_attestation
# c4: evidence_create
# c5: lab_attestation_toml
# c6: create_evidence_pack
seg-bf212e141046 = <c1/> valide le fichier et consigne l'attestation dans le <c2/> du paquet. Le manifeste est couvert par la signature Ed25519 du paquet, de sorte que l'enregistrement ne peut pas être modifié sans rompre la vérification. La même chose est disponible comme argument <c3/> de <c4/> en Python et comme argument <c5/> de l'outil MCP <c6/> (la version pour navigateur ne crée pas de paquets).

# text
seg-431036f13a37 = Un paquet créé sans attestation est, octet pour octet, ce qu'il était auparavant.

# text
# c1: kshana evidence verify
seg-4360b8fbdafb = <c1/> signale l'attestation et indique qu'elle est « attested by the named operator; not verified by Kshana ».

# text
# c1: setup
# c2: conducted
# c3: shielded
seg-438bbe788314 = Une attestation incomplète, ou dont le <c1/> n'est ni <c2/> ni <c3/> (un montage en rayonnement n'est pas accepté comme exécution de laboratoire), est refusée et aucun paquet n'est créé.

# text
seg-c8c40ed88dde = Ce qui n'est <b>pas</b> encore implémenté : la règle de l'étape { "2" } selon laquelle Kshana refuse de <em>noter</em> une exécution de laboratoire sans attestation. Aucune commande ne prend d'option d'exécution de laboratoire dans { "0.38" }, il n'y a donc rien à refuser ; la règle arrivera avec les commandes d'orchestration de laboratoire. Une attestation consigne la déclaration de l'opérateur sur une protection. Elle ne rend aucune émission licite et ne change pas l'étiquette d'un résultat : une exécution de laboratoire notée est MODELLED sauf si une référence externe concorde.

# text
seg-b0db377bce58 = Ce que cela signifie pour un contributeur

# text
seg-c2e215edd86c = N'ajoutez pas de chemin d'émission, de dépendance d'émission ni d'exemple d'émission au moteur ouvert.

# text
seg-452b44a9ca8a = N'ajoutez pas de générateur de forme d'onde dont la sortie est un signal de brouillage ou de leurrage destiné à être rejoué.

# text
seg-4df4d15a5f1c = Les nouvelles entrées matérielles sont en lecture seule par défaut ; une écriture exige une option explicite et une ligne dans ce fichier.

# text
# c1: SURFACES.md
seg-ee5f1fa9b822 = Une nouvelle commande qui touche au matériel figure sur chaque surface ou est marquée N/A avec une raison dans <a1><c1/></a1>, et indique ici son étape.

# text
seg-7d65c3565acd = <s1>Précédent</s1>Formats de journaux d'horloge

# text
seg-82eb53d4efbd = <s1>Suivant</s1>Intégrité et sécurité

# text
seg-8a78e520fc9e = Le champ lab-attestation
