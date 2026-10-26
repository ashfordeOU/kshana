# docs--timing-hil: translations (fr)

# text
seg-f8cf777c0caa = Surfaces

# text
seg-f2ce7fc60cdf = Format

# text
seg-d00b65801e9b = Pas

# attr:alt
seg-0d580ea8043d = Un test de holdover noté à partir d'un relevé d'erreur de temps, d'après une exécution réelle du moteur v{ $version } sur scenarios/holdover-test-example.toml ({ "601" } échantillons toutes les { "5" } s). Le GNSS est retiré par l'opérateur à { "600" } s et rétabli à { "2400" } s ; l'erreur de temps dérive jusqu'à { "299" } ns à la fin du holdover, dépasse le budget de { "100" } ns après { "675" } s, et revient dans la bande de { "100" } ns { "70" } s après le rétablissement. Verdicts : masques de référence PASS, masques de holdover FAIL, enveloppe de holdover FAIL, récupération RECOVERED. Mesuré par rapport au masque, non une approbation. Les heures sont la déclaration de l'opérateur, non vérifiées par Kshana. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine.

# text
seg-6d4e25914d1c = Le scénario

# text
# c1: budgets
# c2: max_abs_te_ns
# c3: clock = "..."
# c4: [series.clock_log]
seg-ca1244db2387 = Clés facultatives : <c1/> (nom, <c2/>, source ; les valeurs par défaut de la synchronisation temporelle des télécoms en leur absence) et <c3/> dans <c4/> pour choisir une source parmi un journal qui en contient plusieurs.

# text
seg-38eb634b7f8f = Ce que contient le rapport

# text
# c1: steps
seg-6a64755e11d6 = <b><c1/></b> : pour la référence de base, le holdover et le retour, le début et la fin, le nombre d'échantillons et les valeurs moyenne, efficace, maximale et finale de l'erreur de temps.

# text
# c1: masks
seg-cd11d0838c44 = <b><c1/></b> : chaque gabarit que vous avez nommé, mesuré sur l'étape que sa condition désigne. Un gabarit écrit pour une horloge asservie est mesuré sur la référence de base ; un gabarit écrit pour le holdover ou pour une horloge autonome l'est sur le holdover. Chaque contrôle indique sa limite, la valeur mesurée, la marge et le tableau dont il est transcrit. Un gabarit qui exige un enregistrement plus long que celui fourni par l'étape est <b>INCOMPLETE</b>, jamais extrapolé ; un gabarit que le moteur ne peut pas évaluer pour l'intervalle d'échantillonnage de l'enregistrement est <b>NOT-EVALUATED</b>, avec la raison.

# text
# c1: holdover
seg-cb54e67ca4eb = <b><c1/></b> : l'écart relatif de fréquence que le système a tenu (la pente d'une droite des moindres carrés passant par l'erreur de temps du holdover, en ns/s, soit des parties par milliard), le résidu autour de cette droite, la plus grande erreur de temps absolue et le moment où elle est survenue, ainsi que l'échelon au moment du retrait.

# text
# c1: holdover_envelope
# c2: locked_duration_days
seg-daa40ac07396 = <b><c1/></b> : l'enveloppe de holdover ePRTC-A de l'UIT-T G.8272.1, tableau { "3" }, à partir de <c2/>, avec l'instant où elle est dépassée pour la première fois.

# text
# c1: budgets
seg-cd480a1bf901 = <b><c1/></b> : le temps écoulé après le retrait au bout duquel chaque budget d'erreur de temps est dépassé pour la première fois.

# text
# c1: recovery
# c2: |TE|
seg-007a0393cb39 = <b><c1/></b> : si <c2/> est entré dans la bande et y est resté pendant la durée de maintien, combien de temps après le retour du GNSS cela a commencé, le pic après le rétablissement et le plus grand écart entre deux échantillons consécutifs pendant le retour.

# text
# c1: curves
seg-199497dfcc09 = <b><c1/></b> : MTIE et TDEV des étapes de référence de base et de holdover.

# text
# c1: verdicts
seg-ce00a41a322f = <b><c1/></b> : un résumé en un mot par étape.

# text
# c1: units
seg-c09fc305ead1 = Chaque nombre porte son unité et son origine dans le bloc <c1/> du rapport.

# text
seg-5d87a772c132 = Les mots, et les limites

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-0810b24c6f3e = Le résultat est <b>mesuré par rapport au gabarit</b>. Les gabarits sont transcrits de Recommandations de l'UIT-T librement téléchargeables (les mêmes tableaux que ceux du type de scénario <c1/>, listés dans <a1><c2/></a1>), et toute entrée que les Recommandations laissent « à l'étude » est absente, non complétée. Kshana n'affirme pas qu'une horloge ou un système satisfait à une Recommandation ou est approuvé au regard de celle-ci, et le rapport ne l'affirme pas non plus.

# text
seg-527189cf37c6 = <b>MODELLED.</b> La logique des étapes, l'ajustement de droite et la règle de retour sont vérifiés sur des enregistrements construits à partir de formules dont les réponses sont connues avant l'exécution ; aucun holdover de laboratoire n'a été évalué par rapport à une référence indépendante externe, et aucun partenaire ni laboratoire n'a donné son accord à quoi que ce soit. Un laboratoire de métrologie du temps serait nécessaire avant qu'un chiffre par classe d'horloge puisse être promu.

# text
seg-ad8160fbed46 = <b>Ce qui n'est pas couvert</b>, indiqué dans chaque rapport : si le GNSS a réellement été retiré et rétabli aux instants indiqués ; toute étape que l'opérateur n'a pas consignée ; les gabarits définis au moyen d'un filtre de { "0.1" } Hz pour un enregistrement échantillonné plus lentement qu'une fois par seconde ; l'incertitude de mesure propre à l'instrument ; et toute procédure d'une Recommandation allant au-delà d'un enregistrement d'erreur de temps (profils de température, charge du réseau à paquets).

# text
seg-cf681db42f05 = <b>La bande de retour est un choix propre au test.</b> La valeur par défaut de { "100" } ns est l'erreur de temps absolue maximale d'un PRTC-A (UIT-T G.8272) ; c'est une ligne commode, et non une exigence d'une Recommandation pour le retour.

# text
seg-4ce2f2052df4 = <b>Aucun chemin d'émission.</b> Kshana lit des fichiers. Il ne génère aucun signal, et retirer le GNSS en laboratoire se fait avec le propre équipement du laboratoire et sous sa propre autorisation.

# text
# c1: holdover-test
# c2: kshana <scenario.toml>
# c3: kshana::api::run_toml
# c4: kshana.run
# c5: samples
# c6: clock_log.text
# c7: run_scenario
# c8: kshana example holdover-test-example
seg-0cff831a8444 = <c1/> est un type de scénario, il s'exécute donc partout où les types de scénario s'exécutent : <c2/>, l'API Rust (<c3/>), la liaison Python (<c4/>), la version WebAssembly et npm (<c5/> ou <c6/> en ligne ; les clés de fichier n'y sont pas disponibles), le serveur MCP (<c7/>, contenu en ligne uniquement) et l'exécuteur de scénarios de Kshana Studio. Les deux fichiers de scénario sont fournis avec le logiciel (<c8/>).

# text
seg-432c07a8e6f5 = <s1>Précédent</s1>Temps trompé

# text
seg-8499ae539222 = <s1>Suivant</s1>Formats de journal d'horloge
