# docs--observatory-method: translations (fr)

# text
seg-0857a94a948e = Limites

# text
seg-2247a2344710 = Signification

# text
seg-b652b86e6b8e = État

# text
# c1: docs/observatory/METHOD.md
seg-7ca62fa39e10 = Source : <c1/>

# text
seg-48e063b567d0 = Observatoire des interférences : note de méthode

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-d0e1d6cadc10 = Version <c1/>, construite sur <c2/>. À titre consultatif seulement : il s'agit d'une description de l'aspect qu'avaient les rapports de position publiés lors de jours passés, et non d'une mesure d'un récepteur quelconque, d'une prévision, d'une confirmation d'interférence ni de l'attribution de sa cause.

# text
seg-c5eab49b8d6f = Ce que publie l'observatoire

# text
seg-165ae7646608 = Un produit par jour UTC et par région, à partir d'une archive ouverte de positions d'aéronefs. Chaque cellule d'une grille fixe de latitude-longitude de 0.5 degré est dans l'un de <b>trois états</b> :

# text
seg-cc07647eb12e = Une part élevée des aéronefs échantillonnés dans la cellule a rapporté une faible précision de navigation ce jour-là, nettement au-dessus du bruit de fond de ce jour.

# text
seg-3e1dd7caaee6 = Assez d'aéronefs ont été échantillonnés et la part n'a pas satisfait à la règle.

# text
# c1: insufficient_sample
# c2: no_day_background
# c3: day_wide_effect
seg-8f0d9ad60d62 = Les données n'ont pas permis de trancher. Ce n'est <b>pas</b> « dégagé ». Chaque cellule publiée de ce type porte un motif de données : <c1/>, <c2/> ou <c3/>. Une cellule sans aucune entrée a été vue par moins de { "5" } aéronefs distincts et est retenue.

# text
seg-e49e05b47061 = Rien d'autre n'est publié : ni cause, ni acteur, ni enregistrement par aéronef. Les motifs décrivent si les données du jour étaient suffisantes, jamais pourquoi la précision était faible.

# text
# c1: kshana interference-map daily
seg-7b251c7860e0 = Trois fichiers par jour (<c1/>) :

# text
# c1: observatory-adsb-<dataset>-<day>.geojson
# c2: schema
# c3: kshana-observatory-day/1
seg-2008b0ba6ac7 = <c1/> : les cellules, avec <c2/> <c3/>, la méthode et ses paramètres préenregistrés, la licence et l'attribution, la règle de publication et un avis.

# text
# c1: observatory-adsb-<dataset>-<day>.png
seg-7d5b16eac4a3 = <c1/> : les mêmes cellules sous forme d'image (dégradée, non dégradée, non observée hachurée ; les cellules vides n'ont pas été observées). Des blocs de texte dans le fichier répètent l'avis et la licence.

# text
# c1: observatory-adsb-<dataset>-<day>.incidents.json
# c2: schema
# c3: kshana-incident-report/1
# c4: cause
# c5: not attributed
seg-b76d2e071b16 = <c1/> : <c2/> <c3/>. Les cellules dégradées contiguës (diagonales comprises) forment un incident avec un cadre englobant et ses cellules. <c4/> est le texte fixe <c5/>. Le fichier est une entrée d'un cycle signaler, confirmer et notifier (le cycle de signalement aéronautique qui se termine par un NOTAM) ; ce n'est ni une confirmation ni un NOTAM.

# text
# c1: .manifest.json
seg-49b7bdae0d6e = et un <c1/> avec le nombre d'octets et le SHA-256 des trois fichiers, l'identifiant de méthode, les compteurs d'entrée (lignes lues et exclues) et le bloc du jeu de données, de sorte qu'un produit puisse être vérifié et reproduit.

# text
seg-d7bb390fb986 = Règles de publication (appliquées par la commande)

# text
# c1: --delay-hours
seg-87147317f8da = <b>Au moins { "24" } h de délai.</b> Le produit d'un jour est publié au plus tôt à la fin de ce jour UTC plus <c1/> ({ "24" } ou plus ; une valeur plus petite est refusée). La commande refuse un jour qui n'est pas encore publiable et indique l'heure au plus tôt. Il n'existe aucun interrupteur pour le raccourcir.

# text
seg-43960c3f9b6c = Cellules grossières.

# text
# c1: --cell-deg
seg-1a5ff10e5240 = <c1/> en dessous de { "0.5" } est refusé.

# text
# c1: null
seg-e70d8d7f9980 = <b>Suppression.</b> Une cellule vue par moins de { "5" } aéronefs distincts n'est pas publiée ; un compte inférieur à { "5" } est <c1/> (zéro compris), comme dans la méthode de base.

# text
seg-ab75582c5032 = <b>Aucune attribution.</b> Le vocabulaire des états et des motifs ne comporte aucune cause ; un test l'affirme.

# text
seg-0e7d76d7efd0 = <b>Sources.</b> adsb.lol (ODbL { "1.0" }) uniquement, ou un jeu de données d'utilisateur avec sa propre licence. <b>Les données d'OpenSky Network sont refusées</b> (sa licence n'autorise ni l'usage commercial ni la redistribution de cartes dérivées). ADS-B et AIS ne sont jamais combinés.

# text
seg-dc28848046ac = <b>Licence du produit.</b> Un fichier ADS-B par cellule produit à partir d'adsb.lol est une base de données dérivée et porte ODbL { "1.0" } et l'attribution adsb.lol dans le fichier. Le code de Kshana reste sous AGPL-3.0.

# text
seg-9eeba6648fec = L'observable et la méthode de base

# text
# c1: kshana-interference-map/adsb/v2
# c2: docs/INTERFERENCE-MAP.md
seg-7334dc45eb2f = Un aéronef ADS-B rapporte la précision qu'il estime à sa propre position GNSS : <b>NACp</b> (Navigation Accuracy Category for Position, une borne horizontale à { "95" } % allant de { "10" } NM jusqu'à moins de { "3" } m) et <b>NIC</b> (Navigation Integrity Category, un rayon de confinement). La méthode de base (<c1/>, <c2/>) compte, par cellule et par jour, la part d'<b>aéronefs distincts</b> dont les rapports dans la cellule étaient en majorité de faible précision, avec des garde-fous : altitude supérieure à { "5,000" } ft seulement ; un aéronef ne compte que s'il a rapporté une bonne précision ailleurs le même jour (une référence d'équipement) ; la part de la cellule doit dépasser la part médiane des cellules du jour d'une marge ; un jour dont la médiane est elle-même élevée est marqué comme confondu et aucune cellule n'est déclarée dégradée. Les paramètres ont été fixés à partir des définitions des champs et de la règle de confidentialité avant d'examiner la moindre donnée, et sont écrits dans chaque fichier de sortie. L'observatoire ajoute le vocabulaire à trois états, les règles de publication et les fichiers ci-dessus, et ne change aucun paramètre.

# text
# c1: --bbox
# c2: method.scope
seg-96cf298985c6 = <b>Exécutions régionales.</b> Avec <c1/>, seuls les rapports situés dans le cadre sont lus. La référence d'équipement et le bruit de fond du jour sont alors calculés à partir des seuls rapports du cadre, et le fichier l'indique (<c2/>). Un produit régional est donc un produit des données de cette région, et non un extrait d'un produit mondial.

# text
seg-2e7007b56a44 = Relation avec la méthode NACp contre HDOP d'almanach

# text
seg-4892485e534b = Pleninger, Topkova et Steiner, « GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data », The Aeronautical Journal { "129" } ({ "1331" }), { "206" } à { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, comparent l'erreur de position qu'implique le NACp d'un aéronef avec le HDOP (dilution horizontale de précision) de la constellation GPS issu des données d'almanach, et signalent un aéronef comme affecté lorsque les deux divergent ; l'article évalue la méthode sur des expériences de brouillage GPS délibéré.

# text
seg-74ec1aca8a22 = <b>Ce que nous avons utilisé.</b> Seulement le résumé publié et la notice bibliographique. Le texte intégral n'était pas disponible pour nous (accès payant) ; nous ne connaissons donc ni sa correspondance entre le NACp et une estimation d'erreur, ni son calcul du HDOP, ni ses seuils, et nous ne prétendons pas les reproduire.

# text
seg-4f8471649a07 = <b>Ce que fait l'observatoire à la place.</b> La question à laquelle répond la comparaison d'almanach est « la seule géométrie de la constellation pourrait-elle expliquer cette faible précision ? ». La méthode de base répond à une question voisine sans almanach : une faible part doit se distinguer du bruit de fond du même jour sur la région et des bons rapports du même aéronef ailleurs. C'est un substitut différent et plus faible : elle ne peut pas dire qu'une heure de géométrie calme était dégradée là où le bruit de fond du jour est lui aussi faible. Un évaluateur HDOP d'almanach <b>n'est pas implémenté</b>. C'est un point ouvert, à construire à partir du texte intégral de l'article et de l'almanach GPS public et à préenregistrer avant son exécution ; d'ici là, il est cité, et non revendiqué.

# text
seg-e9b9902633af = Reproduire un produit

# text
seg-95e48f0286d9 = Le pipeline est déterministe pour tout ce qu'il publie (le sel d'identifiant propre à chaque exécution ne change que des empreintes internes qui ne sont jamais écrites). Les valeurs SHA-256 du manifeste permettent de comparer une seconde exécution octet pour octet.

# text
seg-65236a42e316 = Étude de sensibilité

# text
# c1: kshana interference-map sensitivity <input> --dataset adsb-lol --day <day> --out report.json
# c2: docs/observatory/RESULTS.md
seg-0c843e799b8f = <c1/> rejoue les rapports d'un jour sous des changements, un à la fois, de chaque paramètre préenregistré (deux valeurs chacun, plus une grille de { "1.0" } degré) et rapporte, par variante, le nombre de cellules dégradées, non dégradées et non observées, l'indice de Jaccard de l'ensemble dégradé avec l'ensemble enregistré, les cellules dont l'état a changé, et la surface dégradée. Elle ne change rien à la règle enregistrée : une variante n'est pas une alternative validée, et un grand changement sous un paramètre dit à quel point le constat dépend de ce paramètre, et non quelle valeur est la bonne. Les résultats du catalogue rétrospectif se trouvent dans <c2/>.

# text
# c1: not_observed
seg-cc57d45c4b0a = <b>Couverture.</b> adsb.lol suit des récepteurs bénévoles ; la haute mer et l'espace aérien faiblement couvert sont clairsemés, et <c1/> y est fréquent. Une carte montre la couverture de sa source.

# text
seg-e3921e1eb177 = <b>Ce que signifie une faible précision.</b> Le NACp et le NIC baissent pour des raisons autres que l'interférence : pannes de satellites ou d'augmentation, météorologie spatiale, défauts de récepteur ou de transpondeur, et géométrie. Aucun état n'implique une cause.

# text
seg-e5ad0dc456c0 = <b>Les aéronefs qui restent toute la journée dans une région affectée</b> n'ont pas de référence en dehors d'elle et ne sont pas comptés, de sorte que la méthode sous-estime un effet régional persistant. L'étude de sensibilité montre l'effet du garde-fou de référence.

# text
seg-a2d41becc19b = <b>Les limites de jour</b> sont en UTC ; un événement qui franchit minuit est réparti entre deux jours.

# text
seg-436af9f16feb = <b>Aucune vérité terrain.</b> L'observatoire n'a pas de référence externe indépendante : chaque valeur est MODELLED, et aucune ligne de la matrice de vérification ne repose sur lui.

# text
seg-5c4966f0166d = <b>Sensibilité du sujet.</b> Les cartes de ce genre sont politiques. L'observatoire énonce une méthode, un délai et un vocabulaire, et rien d'autre ; il ne nomme ni États ni acteurs, et il ne publie pas en temps réel.

# text
seg-874f46a80c8b = <s1>Précédent</s1>Protocoles de récepteur lus

# text
seg-3137b7595e59 = <s1>Suivant</s1>Observatoire des interférences : résultats
