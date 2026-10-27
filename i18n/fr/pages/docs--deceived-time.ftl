# docs--deceived-time: translations (fr)

# text
# c1: docs/DECEIVED-TIME.md
seg-d46702617926 = Source : <c1/>

# text
seg-f44d01df7b1c = Une commande signée appliquée à un instant trompé achemine quand même de travers

# text
seg-6497012e401e = Une note technique pour les exploitants de réseaux indexés sur le temps : des constellations qui acheminent, assignent des tâches ou transfèrent selon un planning, où chaque nœud agit lorsque sa propre horloge atteint un instant planifié.

# text
seg-714bce435435 = Abréviations : GNSS, Global Navigation Satellite System ; TPL, niveau de protection de synchronisation temporelle ; PNT, positionnement, navigation et synchronisation temporelle.

# text
seg-a7208323de1c = L'affirmation

# text
# c1: δ
# c2: T
# c3: T + δ
# c4: |δ|
seg-246715a1c559 = Authentifier les messages de commande, y compris avec des signatures post-quantiques, prouve qui a envoyé un message et qu'il n'a pas été altéré. Cela ne prouve pas <b>quand le récepteur agit dessus</b>. Un nœud exécute une commande indexée sur le temps par rapport à sa propre horloge. Si cette horloge a été tirée de <c1/>, une commande valable pour l'instant <c2/> s'exécute au temps réel <c3/>, avec toutes les signatures intactes. Dès que <c4/> dépasse la garde de créneau, le trafic tombe dans le mauvais créneau, une liaison commute alors que l'autre extrémité pointe encore ailleurs, ou un transfert se produit trop tôt. Le réseau achemine de travers, et chaque contrôle d'intégrité du chemin de commande signale un succès.

# text
seg-8683f0749042 = Pourquoi l'horloge est la cible facile

# text
seg-1af5aea2ef5b = <b>Le temps GNSS est la référence habituelle, et il est leurrable.</b> Un nœud qui asservit son horloge au GNSS hérite de n'importe quel temps que sert le récepteur. Un leurreur qui maintient au vert les propres indicateurs de qualité du récepteur peut tirer lentement ce temps.

# text
# c1: T + w
seg-354a4c706264 = <b>Les contrôles de fraîcheur utilisent la même horloge.</b> Une fenêtre de validité (« accepter cette commande jusqu'à <c1/> ») ou un compteur anti-rejeu lié au temps est jugé par rapport à l'horloge locale ; une horloge tirée peut donc aussi élargir la fenêtre pendant laquelle une commande signée capturée est acceptée.

# text
seg-a4b8a5db0975 = <b>L'attaque n'a besoin d'aucune clé.</b> Rien dans le canal signé n'est touché. Une cryptographie plus forte relève le coût de falsification d'une commande et laisse ce coût-ci inchangé.

# text
seg-e514b03fbae3 = Cela se place à côté des travaux post-quantiques, et non contre eux : les deux ferment des brèches différentes. Les signatures arrêtent une commande falsifiée. L'intégrité du temps empêche qu'une commande authentique soit exécutée au mauvais moment.

# text
seg-09f493386dbc = Ce qui la borne

# text
# c1: slot-timing
# c2: SLOT-TIMING.md
seg-750bd90b0ee1 = Quatre mesures, chacune quantifiée par le type de scénario <c1/> (<a1><c2/></a1>) :

# text
seg-77cf39b434b5 = <b>Un moniteur assisté par l'horloge.</b> Comparer le temps GNSS à l'horloge propre du nœud en marche à l'inertie sur une fenêtre, et déclencher une alarme lorsque la différence est trop grande pour être du bruit d'horloge. Le TPL conditionnel borne l'erreur qui peut passer inaperçue avant l'alarme.

# text
seg-e58f7fb94ac5 = <b>Des contrôles indépendants, planifiés.</b> Un transfert de temps bidirectionnel avec une station au sol ou une comparaison par liaison croisée avec un voisin hors de portée du leurreur plafonne la durée pendant laquelle une dérive lente peut se poursuivre. Leur intervalle de revisite est un paramètre de sécurité, et pas seulement d'exploitation.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-69590f56817c = <b>Géométrie.</b> Un leurreur au sol n'atteint un satellite en orbite terrestre basse que tant que celui-ci est au-dessus de l'horizon du leurreur, de sorte que la dérive est plafonnée par la vitesse de rampe du leurreur multipliée par cette fenêtre. En arithmétique : une rampe de { "10" } ns/s tenue pendant { "600" } s fait { "6" } µs. L'exemple fourni (<c1/> : orbite de { "550" } km, rampe maximale de { "10" } ns/s) indique une exposition au leurreur de { "732" } s et une dérive limitée par la rampe de { "7 321" } ns.

# text
seg-e8e52ce05943 = <b>Une garde dimensionnée à partir de la borne, et une action sûre en cas d'alarme.</b> La garde de créneau devrait couvrir la plus grande erreur non détectée que le moniteur et les contrôles admettent, et pas seulement le bruit de l'horloge en marche libre. En cas d'alarme, un nœud devrait conserver son dernier bon planning sur son horloge en marche à l'inertie plutôt que de suivre le GNSS.

# text
seg-c11b66f214ac = Ce que cette note n'affirme pas

# text
seg-8b0ed39ead25 = Elle n'affirme pas qu'un satellite leurré a été observé en train d'acheminer de travers ; elle n'estime l'exposition d'aucun exploitant ; et les bornes vers lesquelles elle renvoie sont MODELLED, conditionnelles à la détection et aux hypothèses de menace énoncées. Elle défend une composition : une signature valide et un temps d'exécution correct sont des propriétés distinctes, et un réseau indexé sur le temps a besoin des deux.

# text
seg-c1bf6467e3c9 = <s1>Précédent</s1>Synchronisation temporelle des télécoms

# text
seg-d4e9bfd42982 = <s1>Suivant</s1>Test de holdover et matériel de synchronisation temporelle dans la boucle
