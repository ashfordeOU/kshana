# docs--animation: translations (fr)

# text
# c1: docs/ANIMATION.md
seg-8428c41646b0 = Source : <c1/>

# text
# c1: --animate
seg-a61d094894fd = <c1/> transforme la série temporelle d'une exécution en quelque chose qui bouge : un fichier Scalable Vector Graphics (SVG) animé, un unique lecteur HyperText Markup Language (HTML) autonome, ou une séquence numérotée d'images SVG pour un encodeur vidéo. Une campagne est jouée par phases (brouillage, leurrage, holdover, alarme d'intégrité) avec ses alarmes marquées ; une exécution de spectre joue sa cascade ligne par ligne ; un passage en orbite terrestre basse (LEO) joue sa liaison par bande et, avec un leurre, les statistiques du moniteur époque par époque.

# text
# c1: src/animation.rs
# c2: tests/animation.rs
seg-39d69331035d = Code : <c1/>. Tests : <c2/>.

# text
seg-0b708f65d8d3 = Ce que c'est, et ce que ce n'est pas

# text
seg-ad8c12a3b510 = L'exportateur lit le document de résultats que l'exécution a déjà écrit. Il ne relance pas la physique, il ne rééchantillonne, ne lisse ni n'interpole entre les échantillons (hormis le segment de droite qui termine une trace au curseur), et il n'ajoute aucun chiffre qui lui soit propre. Une animation vaut donc exactement ce que vaut l'exécution qui la fonde. Son niveau est <b>MODELLED, cohérence interne</b> : c'est un rendu, jamais une preuve, et elle ne porte aucune ligne de matrice de vérification qui lui soit propre.

# text
seg-f37311ad7ef0 = Sorties

# text
# c1: result.json
# c2: chart.svg
# c3: report.html
seg-0c21f772932e = Chaque format est écrit à côté du scénario, près des habituels <c1/>, <c2/> et <c3/> :

# text
seg-f2ce7fc60cdf = Format

# text
seg-51a8df15f356 = Écrit comme

# text
seg-3ea93ae372ca = Ce qu'il contient

# text
seg-3603593b9799 = Un SVG animé par des images clés Cascading Style Sheets (CSS) et sans script : les tracés se dessinent derrière un curseur temporel mobile, les événements apparaissent à leur instant, les lignes de la cascade se révèlent dans l'ordre du temps. Il boucle, avec une pause de { "1.5" } s sur l'image terminée.

# text
seg-6c91078b434e = Un fichier avec script et style en ligne et sans ressource externe : lecture et pause, un curseur de défilement, la vitesse (0.25x à 4x), chaque panneau sur un seul curseur synchronisé, une valeur en direct par tracé, la bande des phases, et une liste d'événements qui se positionne au clic. La barre d'espace lance ou met en pause, les touches fléchées avancent pas à pas, Début et Fin sautent.

# text
# c1: frame_0000.svg
# c2: frame_0001.svg
# c3: manifest.json
seg-df02d37cd729 = <c1/>, <c2/>, … et <c3/>.

# text
# c1: --animate
# c2: --animate svg,html
# c3: all
# c4: --animate-fps
# c5: --animate-duration
seg-2e5ebd60cad0 = <c1/> est répétable et accepte une liste séparée par des virgules (<c2/>) ou <c3/>. <c4/> ({ "1" } à { "60" }, { "12" } par défaut) et <c5/> ({ "0.5" } s à { "600" } s, { "8" } s par défaut) règlent la lecture ; la séquence d'images est plafonnée à { "7,200" } images.

# text
# c1: --export
# c2: report.html
# c3: --animate
seg-7e012ab53f45 = Lorsque <c1/> s'exécute dans la même commande, le lecteur HTML liste les fichiers d'export écrits à côté de lui (CZML, KML, GeoJSON, STK, SigMF) sous forme de liens relatifs vers ces fichiers voisins ; un lien n'est écrit que pour un nom de fichier simple, de sorte qu'aucun ne peut sortir du dossier ni atteindre le réseau. Le rapport avancé (<c2/>) intègre le dessin animé chaque fois que le résultat a une série temporelle, que <c3/> ait été exécuté ou non.

# text
# c1: --animate
# c2: result.json
# c3: animation
# c4: sources
# c5: omitted
# c6: --animate
seg-9c1d2204edab = Lorsque <c1/> s'exécute, <c2/> gagne un bloc <c3/> : les formats, les images par seconde (fps), la durée, le nombre d'images, l'intervalle de temps, les titres des panneaux, les chemins JSON d'où chaque tracé a été lu (<c4/>) et toute série trouvée mais non dessinée (<c5/>). Sans <c6/>, le résultat est identique à l'octet près à celui d'une exécution simple.

# text
seg-fa8388ae976e = La séquence d'images

# text
# c1: round(duration × fps)
# c2: t_start + (t_end − t_start) × i / (n − 1)
# c3: manifest.json
# c4: fps
# c5: duration_s
# c6: frame_count
# c7: frame_pattern
# c8: frame_%04d.svg
# c9: t_start
# c10: t_end
# c11: frame_times
# c12: frame_NNNN.svg
seg-db4b53abe7d6 = La séquence compte exactement <c1/> images. L'image <em>i</em> montre la chronologie jusqu'à <c2/>, de sorte que la première image est le début et la dernière l'image terminée. <c3/> consigne <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), la taille en pixels, <c9/>, <c10/>, l'heure de mission de chaque image (<c11/>), les phases, les événements et les sources. Un nouvel export dans le même répertoire supprime d'abord tous les <c12/> déjà présents (et rien d'autre), de sorte qu'une séquence plus courte ne laisse jamais derrière elle des images d'une séquence plus longue que l'encodeur pourrait lire.

# text
# c1: ffmpeg
# c2: librsvg
# c3: fps
seg-13b57b6d3c14 = Les images sont en SVG, et non en Portable Network Graphics (PNG). Un <c1/> compilé avec la bibliothèque <c2/> les lit directement, à la cadence avec laquelle la séquence a été écrite ({ "24" } dans l'exemple ci-dessus ; le <c3/> du manifeste) :

# text
# c1: ffmpeg
# c2: librsvg
# c3: rsvg-convert
seg-b20beeb45fac = Un <c1/> sans <c2/> s'arrête avec « no decoder found for: svg ». Rastérisez d'abord les images, par exemple avec <c3/>, et encodez les PNG :

# text
seg-fc61f546f605 = Accessibilité et thème

# text
# c1: prefers-color-scheme
seg-7015f7ed77dc = <b>Schéma de couleurs.</b> Le lecteur suit <c1/> et se redessine lorsqu'il change ; le SVG animé porte une variante claire de sa palette sous la même requête média. Les images utilisent la palette sombre des graphiques statiques, car une vidéo n'a pas de schéma.

# text
# c1: prefers-reduced-motion: reduce
seg-c3b1f19f191b = <b>Mouvement réduit.</b> Sous <c1/>, le SVG animé désactive chaque animation et montre l'image terminée (ses styles de base sont l'état final, de sorte que rien n'est masqué), et le lecteur s'ouvre en pause sur l'image terminée au lieu de jouer ; l'utilisateur peut toujours faire défiler ou appuyer sur Lecture.

# text
# c1: <title>
# c2: <desc>
seg-f8dd26194eec = Le SVG a un <c1/> et un <c2/> ; les commandes du lecteur sont des boutons étiquetés, une entrée de plage avec une valeur de temps énoncée à voix haute, et une liste de sélection.

# text
seg-f5356cbf3675 = Ce qui compte comme série temporelle

# text
seg-ba43cf36ac20 = Les documents de résultats diffèrent d'un type à l'autre, de sorte que l'exportateur reconnaît les formes que le moteur émet plutôt qu'une liste de types :

# text
# c1: t
# c2: t_s
# c3: t_hours
# c4: t_min
# c5: t_days
# c6: k
# c7: epochs
# c8: quantum.series[].error_ns
# c9: classical.series[].error_ns
seg-952d09156712 = <b>Un tableau d'enregistrements avec un champ de temps</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, ou <c6/> sur un tableau <c7/>) qui croît strictement le long du tableau. Chaque autre champ numérique devient un tracé ; le même champ sous deux racines (<c8/> et <c9/>) partage un panneau.

# text
# c1: t_s
# c2: t
# c3: times_s
# c4: channels
# c5: {unit, values}
# c6: campaign
# c7: spectrum
# c8: *_hz
# c9: spectrum
seg-2c3abce3f70a = <b>Un objet avec un tableau de temps strictement croissant</b> (<c1/>, <c2/>, <c3/>, …) à côté de tableaux de même longueur : des tableaux numériques voisins, une table <c4/> d'enregistrements <c5/> (la chronologie <c6/>), un tableau d'enregistrements contenant de tels tableaux (les bandes <c7/>, les traces de satellites d'une constellation), et un tableau à deux dimensions dont les lignes correspondent à l'axe du temps avec un axe de fréquence voisin <c8/> (la cascade <c9/>).

# text
# c1: phases
# c2: name
# c3: t0_s
# c4: t1_s
# c5: events
# c6: t_s
# c7: label
# c8: alarm
# c9: *_t_s
seg-0edf8c38f9eb = À côté de ce tableau de temps, <c1/> (<c2/>, <c3/>, <c4/>) deviennent la bande des phases et <c5/> (<c6/>, <c7/>, <c8/>) deviennent les repères. Les scalaires <c9/> d'une bande (sa première perte d'accrochage, son rapport porteuse sur densité de bruit le plus bas) sont aussi marqués.

# text
# c1: omitted
seg-608c4fed9e98 = Les tracés avec une unité partagent un panneau lorsque leurs grandeurs sont dans un rapport d'au plus { "100" }, de sorte qu'une garde de { "50" } ns n'aplatit pas une erreur de { "2" } ns. Au plus { "6" } panneaux de { "6" } tracés sont dessinés ; le reste est listé sous <c1/>. Les tracés de plus de { "2,400" } échantillons sont éclaircis par un pas régulier qui conserve le dernier échantillon, et une cascade de plus de { "96" } × { "120" } cellules est moyennée à la baisse (en puissance, pour les cellules en décibels, afin qu'un brouilleur étroit ne soit pas dilué).

# text
# c1: no time series to animate
# c2: cargo test --test animation -- --nocapture
seg-b68ce4aa301f = Un type dont le résultat ne porte aucune de ces formes (un bilan de liaison, une géométrie à époque unique, un résumé Monte Carlo purement statistique, ou le holdover de télécommunication, dont le résultat publie l'empreinte de l'enregistrement mais non l'enregistrement) est refusé avec <c1/>, et rien n'est écrit. Avec kshana { $version }, { "89" } des { "182" } fichiers de scénario exécutables (tous les fichiers sauf une suite d'études) s'animent et { "93" } sont refusés. <c2/> affiche le recensement.

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: leo-ppp
# c4: leo-pvt
# c5: trace = true
# c6: leo-navmsg
# c7: leo-signal
# c8: ntn-positioning
seg-c386389e4f1d = Parmi les types LEO, chaque scénario <c1/>, <c2/> et <c3/> fourni s'anime. <c4/> s'anime dans ses modes Doppler, positionnement conjoint et synchronisation temporelle (une exécution de synchronisation temporelle nécessite <c5/>, ce qui fait rapporter à chaque ligne son erreur de temps et son sigma prédit à chaque époque) et est refusé dans son mode de couverture polaire. <c6/> anime sa mise à jour en milieu de passage et est refusé pour les analyses d'encodage, d'intervalle d'ajustement et de comparaison de modèles. Les résultats <c7/> et <c8/> ne portent aucun axe temporel et sont refusés.

# text
seg-eb31ec7a07b7 = Déterminisme

# text
seg-82bcf8a5b042 = La sortie est une fonction pure du document de résultats et des options : aucune horloge, aucun nombre aléatoire, aucune itération de table de hachage, aucun accès fichier ou réseau dans la bibliothèque, et aucun horodatage nulle part, de sorte que le même scénario, la même graine et les mêmes options donnent des fichiers identiques à l'octet près. Le module se compile pour WebAssembly sans changement ; seule l'interface en ligne de commande écrit des fichiers.

# text
seg-77e1f459f3d3 = Utilisation en bibliothèque

# text
# c1: kshana::animation::animate_result
# c2: extract_timeline
seg-b3fa41e48ea5 = <c1/> anime un document de résultats que vous avez déjà, et <c2/> renvoie ce qui serait dessiné sans le rendre.

# text
seg-0857a94a948e = Limites

# text
# c1: animate_scenario
seg-02f0f03af2fb = Le wheel Python et le module WebAssembly n'exposent pas encore l'exportateur ; il est accessible depuis la ligne de commande, la bibliothèque Rust et l'outil <c1/> du serveur Model Context Protocol (MCP) (qui renvoie au plus { "120" } images dans une réponse).

# text
seg-cd3ec7b403ba = Les axes sont linéaires. Une série couvrant plusieurs décades (la croissance de l'erreur d'une horloge de { "0.1" } ns à une microseconde) paraît plate jusqu'à tard dans l'exécution.

# text
seg-ed21d370a73c = Le SVG animé repose sur l'animation CSS d'un rectangle de découpe ; les moteurs actuels de Chromium, Firefox et Safari le jouent, alors qu'un visualiseur sans animation CSS montre l'image terminée.

# text
seg-9dfb9596ecf3 = Les campagnes de balayage, Monte Carlo et de composition ne portent aucun axe temporel et sont refusées ; les statistiques de synthèse d'un balayage ou d'un ensemble ne sont pas une série temporelle. Une campagne enchaînée s'anime.

# text
seg-be1f1afe7424 = <s1>Précédent</s1>Rapports d'exécution

# text
seg-6817433f69f6 = <s1>Suivant</s1>Exports et imports d'interopérabilité
