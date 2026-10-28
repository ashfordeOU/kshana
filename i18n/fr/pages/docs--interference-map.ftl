# docs--interference-map: translations (fr)

# attr:aria-label, text
seg-6555ff9a6d8e = Sortie

# text
seg-2247a2344710 = Signification

# text
seg-c3c260b7063e = Tests

# text
seg-d4a762001549 = Licence

# text
# c1: docs/INTERFERENCE-MAP.md
seg-e7b6d071246e = Source : <c1/>

# text
# c1: kshana interference-map
# c2: kshana route-exposure
seg-143c73287d6c = <c1/> construit, jour par jour, une image des endroits où des aéronefs et des navires ont signalé des données de navigation dégradées, à partir de fichiers de suivi sous licence ouverte que vous fournissez. <c2/> indique ensuite quelle part d'un itinéraire prévu se trouvait dans les cellules touchées chaque jour.

# text
seg-158f33f95ec3 = Ce que c'est : une description de l'aspect qu'avaient les comptes rendus de position publiés lors de jours passés. Ce que ce n'est pas : une mesure d'un récepteur quelconque, une prévision, ni la preuve d'une interférence. Une cellule dégradée ou anormale a plusieurs causes possibles (énumérées ci-dessous), et une cellule sans entrée n'a tout simplement pas été observée.

# text
seg-64d3ee269407 = Tout s'exécute sur des fichiers locaux. Les commandes par défaut n'ouvrent jamais de connexion réseau ; l'unique assistant de téléchargement facultatif exige un indicateur explicite.

# attr:alt
seg-e251b385ff46 = Deux jours synthétiques de carte d'interférence, tirés des échantillons versionnés dans examples/interference-map/output, chacun avec son propre itinéraire synthétique et les parts d'exposition d'itinéraire que le moteur rapporte. À gauche, un jour ADS-B : { "1" } cellule dégradée, { "6" } non dégradées, { "4" } non évaluées (hachurées) et des cellules sans entrée, dessinées vides, qui n'ont pas été observées. L'itinéraire fait { "525" } km : { "11.5" } % de sa longueur dans des cellules dégradées, { "38.3" } % non dégradées, { "9.1" } % non évaluées et { "41.1" } % non observées. À droite, un jour AIS : cellules signalées par les détecteurs de cercle et de terre, cellules non anormales et cellules vides ; l'itinéraire fait { "454" } km avec { "10.5" } % dans des cellules anormales, { "21.2" } % non anormales, { "0.0" } % non évaluées et { "68.3" } % non observées. L'ADS-B et l'AIS sont des couches distinctes, jamais combinées. Une cellule signalée n'est pas un constat d'interférence, et une cellule sans couleur n'a pas été observée, ce qui n'est pas la même chose que dégagée. Toutes les données sont inventées, en plein milieu de l'Atlantique, et ne sont pas une mesure.

# text
# c1: examples/interference-map/output/
# c2: examples/interference-map/input/
# c3: kshana route-exposure
seg-765f43228dc6 = Les deux jours sont les échantillons synthétiques de <c1/>, chacun avec un itinéraire synthétique dans <c2/> ; les parts d'exposition d'itinéraire sont ce que <c3/> affiche pour eux. Rien dans ces données n'est un lieu, un aéronef ou un navire réel.

# text
seg-228f39c0305b = Données et licences

# text
# c1: data/INTERFERENCE-DATA-SOURCES.md
# c2: --dataset
seg-d3336cc18ff7 = Seules les sources examinées dans <a1><c1/></a1> sont intégrées, sélectionnées avec <c2/> :

# text
seg-b03d56f501c3 = Type

# text
seg-2328672e782f = Champ de licence de sortie

# text
seg-2319c7a6f6e2 = ODbL { "1.0" }

# text
seg-7464d3c830f3 = AIS

# text
seg-c13f76567536 = Domaine public américain (CC0 { "1.0" } selon l'éditeur)

# text
seg-636c2bb6f29d = domaine public

# text
seg-f6f4e431d36d = NLOD { "2.0" }

# text
seg-5621e3a3908f = l'un ou l'autre

# text
seg-6b3a1f8ca649 = ce que vous indiquez

# text
# c1: --licence
# c2: --licence-url
# c3: --attribution
seg-be349e2c455f = <c1/>, <c2/>, <c3/> requis

# text
seg-590344d1eae5 = Chaque fichier de sortie intègre la licence, l'URL de la licence, l'attribution requise et les limites de couverture de la source. Il n'existe aucune entrée intégrée pour les sources dont les conditions interdisent l'usage commercial ou la redistribution des cartes dérivées.

# text
# c1: licence
seg-2d8eaefab0f8 = <b>ODbL et éditions de Kshana.</b> Un fichier ADS-B par cellule produit à partir des données d'adsb.lol est une Derived Database et est diffusé sous ODbL { "1.0" } ; son champ <c1/> l'indique. Le code propre de Kshana reste sous AGPL-3.0. Les éditions commerciales de Kshana qui écrivent de tels fichiers portent la même mention, et quiconque republie le fichier doit la conserver. Les résultats ADS-B et AIS ne sont jamais combinés dans un même fichier, de sorte que l'ODbL ne s'applique pas à la couche AIS.

# text
seg-bb4932d5d15c = <b>Biais de couverture.</b> Les cartes héritent de la couverture de leur source. adsb.lol s'appuie sur des récepteurs bénévoles, de sorte que la haute mer et les régions peu couvertes sont clairsemées. Les données ouvertes de Kystverket omettent les navires de pêche de moins de { "15" } m et les embarcations de plaisance de moins de { "45" } m, de sorte que sa carte reflète les grands navires. MarineCadastre ne couvre que les eaux américaines.

# text
seg-713babc3963b = <b>Identifiants.</b> Les lignes d'entrée portent un identifiant d'aéronef ou de navire. Il est haché en mémoire avec un sel aléatoire propre à chaque exécution, utilisé uniquement pour compter les aéronefs ou navires distincts, et jamais écrit, journalisé ni affiché. Les sorties sont agrégées : aucun identifiant n'y figure nulle part.

# text
# c1: 5
# c2: null
seg-fa3c70a8997a = <b>Suppression.</b> Une cellule comptant moins de <c1/> aéronefs ou navires distincts observés ce jour-là n'est pas publiée du tout, et pour l'AIS un nombre de signalements de un ou deux dans une cellule publiée est rapporté comme <c2/>. Aucune valeur publiée ne peut désigner un aéronef ou un navire en particulier.

# text
seg-02dbfcb9c808 = Formats d'entrée

# text
# c1: YYYY-MM-DDTHH:MM:SS[.fff]Z
seg-2f291f986a87 = CSV simple avec une ligne d'en-tête, séparé par des virgules, sans guillemets, heures en UTC. L'ordre des colonnes est libre ; les colonnes inconnues sont ignorées. Un horodatage est en secondes Unix ou <c1/>. Les lignes qui ne peuvent pas être analysées sont comptées dans les métadonnées de sortie, et non écartées silencieusement.

# text
# c1: kshana interference-map adsb
seg-571365be20a5 = ADS-B (<c1/>) :

# text
seg-aaeff8f42699 = Colonne

# text
seg-b10a51ed96c0 = Requis

# text
seg-357c2320b43a = oui

# text
seg-14ac5d0f109b = heure du compte rendu

# text
seg-6dbe5595d0be = identifiant opaque (haché, jamais stocké)

# text
seg-c5fb6b91dc68 = degrés

# text
# c1: ground
seg-e283838c85aa = altitude en pieds ; <c1/> ou vide exclut la ligne

# text
seg-9ab90c35bd7d = au moins un

# text
seg-868e5b9c00ab = entiers de { "0" } à { "11" } ; vide signifie non rapporté

# text
seg-db907db790b1 = non

# text
# c1: adsb
seg-5c2ce9f61700 = si présente, seules les valeurs commençant par <c1/> sont utilisées (MLAT, TIS-B et similaires sont exclues)

# text
# c1: tar -xf -
# c2: trace_full_*.json
seg-412f40b8eeb1 = <b>Historique readsb d'adsb.lol, lu directement.</b> Les archives quotidiennes sont un tar découpé de fichiers de trace readsb. Extrayez-en une comme le décrit l'éditeur (concaténer les parties, <c1/>), puis donnez à Kshana le répertoire extrait, un seul fichier <c2/>, ou un CSV :

# text
# c1: trace_full_*
# c2: trace_recent_*
# c3: .json
# c4: ground
# c5: nic
# c6: nac_p
# c7: trace_files_unreadable
seg-6e7d378bd89b = Un répertoire est parcouru récursivement à la recherche de fichiers <c1/> (les autres fichiers, tels que <c2/>, sont ignorés et les liens symboliques ne sont pas suivis). Chaque fichier est compressé en gzip ou en JSON brut, détecté par ses premiers octets, car readsb écrit du gzip sous un nom <c3/> ; la décompression est plafonnée à { "512" } MiB par fichier. Dans chaque entrée de trace, Kshana lit le décalage temporel, la latitude, la longitude, l'altitude (le marqueur <c4/> exclut l'entrée), les champs <c5/> et <c6/> de l'objet de détails de l'aéronef, et la chaîne de source de position (les entrées provenant d'autre chose que l'ADS-B sont exclues). Une entrée sans objet de détails n'a pas de champs de précision et est comptée comme exclue. Un fichier qui ne peut pas être lu est compté dans <c7/> dans les métadonnées de sortie et ignoré.

# text
# c1: kshana interference-map ais
seg-b1502f7f4c98 = AIS (<c1/>) :

# text
seg-91395984ddac = degrés ; les valeurs AIS « non disponible » et ({ "0" }, { "0" }) sont écartées

# text
seg-34ae94eb1797 = vitesse sur le fond en nœuds ; { "102.3" } (non disponible) est traitée comme manquante

# text
# c1: --land
# c2: --land
seg-a1e60af5adaa = Le détecteur de position à terre a besoin d'un fichier de polygones de terres (<c1/>) : GeoJSON Polygon ou MultiPolygon. La couche de terres Natural Earth au { "1" }:{ "10" } million (domaine public) est le fichier prévu. Sans <c2/>, le détecteur est désactivé et la sortie le dit. Pour le télécharger (le seul accès réseau de cette fonctionnalité) :

# text
# c1: curl
# c2: curl
seg-cd55a09894c5 = Cela exécute le <c1/> du système (comme liste d'arguments, et non via un interpréteur de commandes) en HTTPS, une seule fois, pour un seul fichier à une adresse fixe qui désigne un unique commit du dépôt amont. Le téléchargement n'est conservé que si son SHA-256 est égal à la valeur figée dans le code ; en cas de différence, il est supprimé et la commande échoue. Si <c2/> n'est pas installé, la commande le dit et donne l'adresse et la somme de contrôle afin que le fichier puisse être récupéré à la main. Rien n'est livré avec le dépôt.

# text
# c1: --out
# c2: <source>-<dataset>-<YYYY-MM-DD>.geojson
# c3: <source>
# c4: adsb
# c5: ais
# c6: <dataset>
# c7: --dataset
# c8: adsb-lol
# c9: noaa-marinecadastre
# c10: kystverket
# c11: custom
# c12: adsb-adsb-lol-2026-03-01.geojson
# c13: ais-kystverket-2026-03-01.geojson
# c14: ^(adsb|ais)-(.+)-(\d{4}-\d{2}-\d{2})\.geojson$
# c15: source_kind
# c16: data.dataset
# c17: date
# c18: examples/interference-map/output/
# c19: kshana_interference_map
# c20: cell_i
# c21: cell_j
# c22: status
# c23: degraded
seg-95eeaa0033b3 = Un fichier GeoJSON par source et par jour UTC, dans le répertoire <c1/>, nommé <c2/>, où <c3/> est <c4/> ou <c5/>, <c6/> est la clé <c7/> (<c8/>, <c9/>, <c10/> ou <c11/>) et la date est le jour UTC des comptes rendus : <c12/>, <c13/>. Le jeu de données figure dans le nom pour que deux jeux de données d'un même type ne puissent pas partager un fichier, et <b>Kshana n'écrase jamais un fichier</b> : si une cible existe, la commande échoue avant d'écrire quoi que ce soit. La CLI affiche une ligne par fichier écrit. Un lecteur peut retrouver les trois parties avec <c14/> ; la même information figure dans le fichier (<c15/>, <c16/>, <c17/>). Des fichiers d'exemple synthétiques, un par source, se trouvent dans <c18/>, avec la commande qui les régénère, pour construire et tester un visualiseur. Un membre de premier niveau <c19/> contient le nom du schéma, la date, la grille, l'identifiant de méthode et chaque paramètre, les chiffres au niveau du jour, la licence des données et l'attribution, et un avis. Chaque entité est un polygone de cellule avec <c20/>, <c21/>, <c22/>, <c23/> et les comptes agrégés.

# text
# c1: --cell-deg
# c2: --cell-deg
# c3: grid.preregistered_cell_deg
# c4: grid.is_preregistered
seg-1ee702004726 = La grille est fixe : des cellules carrées de <c1/> degrés (par défaut { "0.5" }) en latitude et en longitude, indexées à partir de (-90, -180). La largeur est-ouest diminue avec la latitude : environ { "55" } km à l'équateur et environ { "28" } km à { "60" } degrés pour la valeur par défaut. La latitude { "90" } appartient à la dernière rangée et la longitude { "180" } est le même méridien que -180. <b>Les méthodes préenregistrées sont définies sur la grille de { "0.5" } degré.</b> Un autre <c2/> s'exécute, mais n'est pas la méthode préenregistrée : la CLI le dit, et le fichier enregistre <c3/> et <c4/> (faux) afin qu'un visualiseur puisse le dire aussi.

# text
# c1: null
# c2: null
# c3: status
# c4: degraded
# c5: aircraft_observed
# c6: aircraft_sampled
# c7: aircraft_affected
# c8: null
# c9: affected_share
# c10: null
# c11: vessels_flagged
# c12: null
seg-6e1e8f2a9082 = <b>Comptes retenus.</b> Tout compte par cellule inférieur au minimum de publication ({ "5" }) est <c1/>, zéro compris, de sorte que <c2/> ne signifie jamais « aucun » et qu'aucun nombre publié ne peut désigner un aéronef ou un navire en particulier. Les champs <c3/> et <c4/> sont tout de même fournis. Dans les fichiers ADS-B, <c5/> est toujours d'au moins { "5" } pour une cellule publiée ; <c6/> et <c7/> valent <c8/> en dessous de { "5" }, et <c9/> vaut <c10/> sauf si les deux sont d'au moins { "5" } (une part révélerait un compte retenu). Dans les fichiers AIS, chaque entrée de <c11/> vaut <c12/> en dessous de { "5" }.

# text
seg-fd929d6ee90b = Version du format et champs

# text
# c1: schema: "kshana-interference-map/v1"
# c2: format_version: 1
# c3: null
seg-ff443e9cbd20 = Le format est arrêté comme <c1/>, <c2/>. Une modification qui supprime ou renomme un champ, ou change son sens, fait monter la version ; l'ajout d'un champ ne le fait pas, de sorte qu'un lecteur doit ignorer les champs qu'il ne connaît pas. Un compte qui vaut <c3/> est retenu, et non nul.

# text
# c1: status
# c2: degraded
# c3: not_degraded
# c4: insufficient_sample
# c5: withheld_day_confounded
# c6: withheld_no_background
# c7: anomalous
# c8: not_anomalous
# c9: degraded
# c10: degraded
# c11: anomalous
# c12: kshana-route-exposure/v1
seg-60818bfc3f90 = Valeurs de <c1/> : ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/> ; AIS <c7/>, <c8/>. <c9/> est vrai pour <c10/> et <c11/> uniquement. Le rapport d'exposition d'itinéraire a son propre schéma <c12/>.

# text
seg-ea526ebdd260 = Observatoire : le produit quotidien

# text
# c1: kshana interference-map daily
# c2: kshana interference-map sensitivity
# c3: --delay-hours
# c4: degraded
# c5: not_degraded
# c6: not_observed
# c7: observatory/METHOD.md
# c8: --bbox south,west,north,east
seg-e33f63fe5c0a = <c1/> transforme un jour UTC de comptes rendus ADS-B en les trois fichiers de l'observatoire (GeoJSON, PNG et un JSON de rapport d'incident) et un manifeste de hachages, et <c2/> rejoue ce jour avec des modifications, une à la fois, des paramètres préenregistrés. La commande applique les règles de publication : au moins { "24" } h après la fin du jour (<c3/> ne peut qu'être augmenté), des cellules de { "0.5" } degré ou plus grossières, trois états seulement (<c4/>, <c5/>, <c6/>), aucune cause attribuée, et aucune donnée OpenSky. La note de méthode, les formats de fichier et les limites se trouvent dans <a1><c7/></a1>. Une exécution régionale (<c8/>) ne lit que les comptes rendus de la zone et le dit dans le fichier.

# text
seg-31ce42fc05dc = Spécification de la page de carte du Studio

# text
seg-a9aca2e2d390 = Pour la page de carte du Studio, qui charge un fichier GeoJSON fourni par l'utilisateur (la page est construite dans les sources du Studio, et non dans ce dépôt). Rien n'est téléversé : le fichier est lu dans le navigateur, et la page n'envoie aucune requête vers une source de données.

# text
# c1: kshana_interference_map.schema
# c2: kshana-interference-map/
# c3: format_version
seg-064ec5d4c91a = <b>Lecture d'un fichier.</b> N'accepter un fichier que si <c1/> commence par <c2/> et que <c3/> est un nombre pris en charge par la page ; sinon, indiquer que le fichier n'est pas une carte d'interférence Kshana prise en charge. Lire les champs énumérés ci-dessus ; ignorer les champs inconnus. Un fichier contient une source et un jour. Plusieurs fichiers peuvent être chargés.

# text
# c1: status
seg-5be32f8cff46 = <b>Cellules.</b> Dessiner le polygone de chaque entité. Colorer selon <c1/>, et toujours indiquer dans une légende ce que signifie chaque couleur. Quatre états, dont aucun ne doit être masqué ni fusionné :

# text
seg-b652b86e6b8e = État

# text
seg-4a511b6a03e3 = D'où il vient

# text
seg-f92da2236260 = Dégradée (ou anormale pour l'AIS)

# text
seg-591ebe8007cb = une part élevée d'aéronefs a signalé une faible précision, ou des navires ont présenté des anomalies, ce jour-là

# text
# c1: degraded
seg-bd993c64b6e8 = <c1/> est vrai

# text
seg-88d43eb1c14a = Dégagée

# text
seg-af5f7989fd09 = observée avec assez d'aéronefs ou de navires et non signalée

# text
# c1: status
# c2: not_degraded
# c3: not_anomalous
seg-2bc810e02210 = <c1/> vaut <c2/> ou <c3/>

# text
seg-d894eaa21369 = Non évaluée

# text
seg-38c88ed94111 = observée mais avec trop peu d'aéronefs échantillonnés, le jour était confondu, ou le fond du jour n'a pas pu être estimé

# text
# c1: status
# c2: insufficient_sample
# c3: withheld_day_confounded
# c4: withheld_no_background
seg-e358a8c7903f = <c1/> vaut <c2/>, <c3/> ou <c4/>

# text
seg-013b7c903426 = Non observée

# text
seg-81bcffa57ec2 = trop peu d'aéronefs ou de navires, la cellule n'a donc pas été publiée

# text
seg-6828d71822bd = aucune entité pour cette cellule

# text
# c1: properties
# c2: null
# c3: grid.is_preregistered
seg-753192a770ac = « Non observée » est l'absence d'une entité : la dessiner de façon neutre (sans remplissage, ou avec des hachures), jamais de la couleur de « dégagée ». Utiliser un schéma de couleurs qui ne repose pas sur le seul contraste rouge-vert. Les détails d'une cellule au survol ou à la sélection affichent les comptes de <c1/> tels que donnés, et chaque compte <c2/> comme « retenu (moins de { "5" }) », jamais comme zéro. Un visualiseur devrait aussi indiquer, lorsque <c3/> est faux, que le fichier utilise une taille de cellule hors de la méthode préenregistrée.

# text
seg-e90fedf7ad89 = <b>Couches.</b> L'ADS-B et l'AIS sont des couches distinctes avec leurs propres commutateurs, légendes et lignes de licence. Ne jamais les fusionner en un seul champ de couleur ni en un seul compte, ne jamais les dessiner comme une cellule combinée, et ne jamais additionner leurs cellules. Des jours différents sont des fichiers différents : afficher un jour à la fois, avec un sélecteur de jour, plutôt que de superposer des jours.

# text
# c1: data.attribution
# c2: data.licence
# c3: data.licence_url
# c4: data.coverage_notes
seg-6d500d3c0baa = <b>Licence et attribution.</b> Pour chaque couche visible, afficher, sur la carte et dans tout export ou capture d'écran, le texte de <c1/> à l'identique, <c2/> avec un lien vers <c3/>, et <c4/>. Si une couche ADS-B est affichée, sa licence ODbL ne s'applique qu'à cette couche. Ne pas proposer d'exporter un fichier combiné.

# text
# c1: method.id
# c2: method.parameters
# c3: day
# c4: day_confounded
# c5: input_stats
seg-6f786153ef8e = <b>Méthode.</b> Proposer l'identifiant de méthode et les paramètres (<c1/>, <c2/>) et les chiffres de <c3/> dans un panneau de détails, y compris <c4/> (dire clairement qu'aucune cellule n'a été déclarée dégradée en raison du fond du jour) et <c5/>.

# text
# c1: method.caveats
# c2: notice
seg-905348837439 = <b>Réserves à conserver</b> (afficher les <c1/> et <c2/> propres au fichier, et garder cette formulation ou son équivalent visible avec la carte) :

# text
seg-1f70e308010a = Une cellule dégradée ou anormale n'est pas un constat d'interférence. D'autres causes existent.

# text
seg-7cde0ddadb73 = Une cellule sans couleur n'a pas été observée. Ce n'est pas la preuve que la zone était dégagée.

# text
seg-1135dfeadb8f = Il s'agit d'une description de comptes rendus de position passés, et non d'une prévision ni d'une mesure d'un récepteur quelconque.

# text
seg-3ad1216bf3ed = La couverture suit la source de données ; lisez les notes de couverture.

# text
seg-046f6af48349 = La page ne doit nommer ni montrer aucun aéronef ou navire individuel, et les fichiers n'en contiennent aucun.

# text
# c1: kshana-route-exposure/v1
# c2: caveats
# c3: map_licence
# c4: map_attribution
seg-ae79b67c3b98 = <b>Exposition d'itinéraire.</b> Si la page charge aussi un rapport <c1/>, afficher ses lignes par jour et par source avec les quatre parts (dégradée, dégagée, non évaluée, non observée) ensemble, jamais la seule part dégradée, ainsi que les <c2/> du rapport, et les <c3/> et <c4/> de chaque ligne.

# text
# c1: kshana-interference-map/adsb/v2
seg-98131acf49d8 = Méthode ADS-B (<c1/>)

# text
seg-83b660b0bfa6 = Chaque compte rendu ADS-B en vol porte deux champs de qualité de navigation auto-évalués : le NIC (le rayon de confinement de la position) et le NACp (la borne de précision à { "95" } %, EPU). Lorsque le récepteur de bord perd ou ne croit plus sa position par satellite, les deux chutent, ce qui explique qu'ils portent une signature d'interférence. Ils chutent aussi pour d'autres raisons.

# text
seg-4b9020a68db6 = <b>Paramètres préenregistrés</b> (constantes dans le code, écrites dans chaque fichier ; un changement signifie une nouvelle version de la méthode) :

# text
seg-e73ea9921fcf = Paramètre

# text
seg-8650fa804f14 = Plancher d'altitude

# text
seg-25056ee5a36c = altitude barométrique d'au moins { "5000" } ft

# text
seg-17322eff480a = Compte rendu de faible précision

# text
seg-48ab6ed5eedd = NACp d'au plus { "6" } (la borne d'EPU rapportée est de { "556" } m, { "0.3" } NM, ou plus, ou inconnue) ou NIC d'au plus { "5" } (la borne de rayon de confinement rapportée est de { "1852" } m, { "1" } NM, ou plus, ou inconnue)

# text
seg-84beb488319d = Bon compte rendu

# text
seg-2595055d9593 = NACp d'au moins { "8" } et NIC d'au moins { "7" } ; jugé sur les champs que contient l'entrée (les deux lorsque les deux sont présents, celui qui est présent sinon)

# text
seg-b4bbce695b2d = Référence de base d'équipement

# text
seg-4986ed51f600 = un aéronef ne compte dans une cellule que s'il a au moins { "5" } bons comptes rendus en dehors de cette cellule le même jour

# text
seg-42859d1d785b = Aéronefs échantillonnés dans une cellule

# text
seg-1ae26d6d99a9 = au moins { "3" } comptes rendus dans la cellule

# text
seg-48bba15e2e0e = Aéronefs touchés dans une cellule

# text
seg-1fe9c3ab930c = au moins { "50" } % de ses comptes rendus dans la cellule sont de faible précision

# text
seg-b147473d133c = Échantillon minimal

# text
seg-33060cda8536 = au moins { "10" } aéronefs échantillonnés

# text
seg-009ca23b9cd6 = Dégradée

# text
seg-afef85ae2a25 = au moins { "5" } aéronefs touchés, une part d'aéronefs touchés parmi les aéronefs échantillonnés d'au moins { "0.30" }, et au moins { "0.15" } au-dessus de la part médiane des cellules du jour

# text
seg-890dcc56fa5c = Jour confondu

# text
seg-b27768e64d62 = part médiane des cellules (sur au moins { "5" } cellules à échantillon complet) d'au moins { "0.15" } : aucune cellule n'est déclarée dégradée

# text
seg-18fbf3c348c9 = Pas de fond

# text
# c1: withheld_no_background
seg-534111e0c6ad = moins de { "5" } cellules à échantillon complet, la médiane ne peut donc pas être estimée : une cellule qui atteint les seuils est <c1/>, et non dégradée

# text
seg-b571f127c595 = Minimum de publication

# text
seg-60621ffc5bcf = au moins { "5" } aéronefs distincts observés

# text
# c1: degraded
# c2: not_degraded
# c3: insufficient_sample
# c4: withheld_day_confounded
# c5: withheld_no_background
seg-f36389caf81b = Ces valeurs ont été fixées à partir des définitions des codes NIC et NACp et de la règle de confidentialité avant que la moindre donnée soit examinée. Elles n'ont pas été ajustées sur des données réelles, et les tests n'utilisent que des données synthétiques. Statuts des cellules : <c1/>, <c2/>, <c3/> (publiée mais avec moins de { "10" } aéronefs échantillonnés), <c4/> et <c5/>.

# text
# c1: withheld_no_background
seg-c89afc07989b = <b>Version { "2" }.</b> La version { "1" } déclarait une cellule dégradée dès { "3" } aéronefs touchés, soit moins que le minimum de publication de 5 aéronefs, et sautait sans le dire la vérification du fond du jour lorsque moins de { "5" } cellules étaient entièrement échantillonnées. La version { "2" } exige au moins { "5" } aéronefs touchés et retient le verdict (<c1/>) lorsque le fond ne peut pas être estimé. Les deux modifications resserrent la méthode (rien de ce qui n'était pas dégradé en version { "1" } n'est dégradé en version { "2" }) ; la raison est qu'un verdict publié ne doit jamais reposer sur moins d'aéronefs que le nombre en dessous duquel les comptes sont retenus. Les fichiers de la version { "1" } n'ont pas été publiés.

# text
seg-ffd0e5175548 = Pourquoi les champs de précision chutent pour d'autres raisons que l'interférence, et la parade pour chacune :

# text
seg-12b613a77f64 = Cause

# text
seg-e30479c3e5d8 = Parade

# text
seg-ecac3d226210 = Des transpondeurs anciens qui ne rapportent jamais le NIC ou le NACp, ou les rapportent à une valeur basse fixe

# text
seg-8b504b60fcc0 = la référence de base d'équipement : un aéronef sans bon compte rendu ailleurs ce jour-là n'est pas compté

# text
seg-1df45f128708 = Basse altitude et opérations en surface (masquage par le relief, formats de position différents)

# text
# c1: ground
seg-cc5f23f0da05 = plancher d'altitude ; lignes marquées <c1/> exclues

# text
seg-ddf6aeb47dbe = Positions MLAT ou autres positions non GNSS

# text
# c1: source_type
seg-51162a1835d1 = filtre <c1/> lorsque la colonne est présente

# text
seg-08196503a657 = Un aéronef qui envoie de nombreux comptes rendus

# text
seg-bf13dfa85dbe = ce sont les aéronefs distincts qui sont comptés, et non les comptes rendus

# text
seg-bbcb809624bc = Une panne de constellation ou d'augmentation, ou un événement de météorologie spatiale, qui abaisse la précision sur une vaste zone

# text
seg-5f428bb7ad4a = la cellule doit dépasser d'une marge la part médiane des cellules du jour, et un jour dont la médiane est elle-même élevée est marqué confondu et ne déclare aucune cellule

# text
seg-30290253a95d = Une défaillance de l'équipement d'un seul aéronef

# text
seg-b673195405ff = exige une part de nombreux aéronefs distincts, avec un échantillon minimal

# text
seg-aeebeded71be = Peu d'aéronefs dans la cellule

# text
seg-c33c60b49b17 = échantillon minimal ; en dessous de { "5" } observés, la cellule n'est pas publiée

# text
seg-dc8abb9b411f = Ce qui reste : la méthode ne peut pas distinguer l'interférence d'une cause régionale qui est locale plutôt qu'étendue (un effet local de géométrie des satellites ou une panne d'augmentation au sol aurait le même aspect), et elle est prudente dans un seul sens : un aéronef qui ne vole qu'à l'intérieur d'une région touchée toute la journée n'a pas de référence de base et n'est pas compté, de sorte que les zones persistantes étendues sont sous-déclarées.

# text
# c1: kshana-interference-map/ais/v2
seg-41d725eeaba9 = Méthode AIS (<c1/>)

# text
# c1: anomalous
seg-7fd53079dccf = Par navire et par jour, cinq détecteurs. Un détecteur <b>est qualifiant</b> dans une cellule lorsqu'il signale au moins { "5" } navires distincts représentant au moins { "20" } % des navires observés à cet endroit ; la cellule est <c1/> si un détecteur est qualifiant.

# text
seg-6d599353e8e1 = Détecteur

# text
seg-551f38a9061c = Règle (préenregistrée)

# text
seg-295e8a28a5b9 = au moins { "3" } comptes rendus dans la cellule à plus de { "2000" } m à l'intérieur des terres par rapport au littoral fourni

# text
seg-fd21160e6685 = une fenêtre de { "20" } comptes rendus consécutifs (pas { "10" }, intervalles d'au plus { "30" } min) dont le rayon moyen par rapport au centroïde est de { "500" } m à { "20" } km, coefficient de variation du rayon d'au plus { "0.15" }, un seul sens de déplacement avec un enroulement total d'au moins { "270" } degrés (pas d'au plus { "90" } degrés, net d'au moins { "80" } % du total), et vitesse moyenne d'au moins { "2" } kn

# text
seg-1aa30db06794 = au moins { "2" } sauts arrivant dans la cellule : des comptes rendus consécutifs distants d'au moins { "1000" } m, espacés d'au plus { "1" } h, impliquant plus de { "70" } kn (la vitesse impliquée utilise au moins { "1" } s entre les comptes rendus, de sorte que deux comptes rendus de même horodatage et de positions distantes de { "1" } km ou plus comptent comme un saut)

# text
seg-7f9b22254009 = au moins { "3" } vitesses rapportées supérieures à { "70" } kn dans la cellule

# text
seg-e0d0968e8751 = au moins { "5" } navires distincts rapportant la même position (arrondie à { "1e-4" } degré, soit environ { "11" } m) dans la même fenêtre de 10 minutes

# text
# c1: null
seg-1bf4c460672c = Les cellules comptant moins de { "5" } navires distincts ne sont pas publiées ; tout compte de signalements inférieur à { "5" }, zéro compris, est rapporté comme <c1/>.

# text
# c1: anomalous
seg-b2ea2ec6bad1 = <b>Version { "2" }.</b> La version { "1" } qualifiait un détecteur dès { "3" } navires signalés et publiait des comptes de { "3" } et { "4" }. La version { "2" } relève le minimum de navires signalés à { "5" }, le minimum de publication, de sorte qu'un verdict <c1/> ne repose jamais sur moins de navires que le nombre en dessous duquel les comptes sont retenus. Cela resserre la méthode et aucun fichier de la version { "1" } n'a été publié.

# text
seg-25593339aeb0 = <b>Causes connues de faux positifs</b>, que la règle de part et les seuils réduisent mais n'éliminent pas : les navires dans des fleuves, canaux et ports proches d'un littoral grossier (la zone tampon de { "2" } km à l'intérieur des terres existe pour cela) ; deux navires partageant un même identifiant, ce qui ressemble à des sauts ; des transpondeurs à position erronée ou des équipements d'essai ; et les navires qui louvoient, tels que bateaux-pilotes et navires de recherche, qui peuvent ressembler à des cercles. Un fichier de littoral au { "1" }:{ "10" } million est précis à environ un kilomètre.

# text
seg-ac661440a29a = Les détecteurs de sauts et de vitesse comparent des comptes rendus au sein d'un même fichier d'entrée ; une trace répartie sur plusieurs fichiers ou jours n'est pas raccordée.

# text
seg-05f789b26904 = <b>Mémoire.</b> L'entrée est lue ligne par ligne et n'est jamais conservée en entier. L'ADS-B ne conserve que des compteurs par aéronef et par cellule. L'AIS conserve chaque compte rendu accepté dans un enregistrement compact (environ { "40" } octets) jusqu'à l'évaluation de son jour, de sorte que la mémoire croît avec le nombre de comptes rendus AIS de l'entrée ; découpez par jour une entrée AIS très volumineuse.

# text
seg-206c78a69ded = Exposition d'itinéraire

# text
# c1: --route
# c2: lat,lon
# c3: --map
seg-0d8832796ab7 = <c1/> est une LineString GeoJSON (seule, dans une Feature, ou dans une FeatureCollection) ou un CSV de lignes <c2/>. <c3/> accepte des fichiers de carte ou des répertoires de ceux-ci, et peut être répété. Les points de passage sont reliés par des droites en latitude et en longitude ; densifiez donc les longs tronçons ; un tronçon prend le chemin le plus court en longitude, de sorte que celui qui franchit l'antiméridien ({ "179.5" } E à { "179.5" } W) le franchit. L'itinéraire est découpé en morceaux d'environ { "250" } m. Chaque morceau est mesuré entre ses deux extrémités sur une sphère de rayon { "6371.0088" } km (le même chemin qui décide dans quelle cellule il se trouve) et affecté à la cellule qui contient son milieu.

# text
# c1: share_degraded
# c2: share_not_degraded
# c3: share_unassessed
# c4: share_not_observed
seg-cc5e2553700b = Par jour et par source, le rapport donne la longueur de l'itinéraire et quatre parts dont la somme vaut { "1" } : <c1/>, <c2/>, <c3/> (cellule présente mais sans verdict) et <c4/> (cellule absente de la carte). Lisez les deux dernières avec la première : un itinéraire à faible part dégradée et à forte part non observée n'a pas été montré comme dégagé. Les lignes ADS-B et AIS sont rapportées séparément et jamais combinées. Chaque ligne porte la licence et l'attribution de la carte.

# text
seg-3a087d90e317 = Fonctions de bibliothèque

# text
# c1: kshana::interference_map::api
seg-67ea1ff00bb8 = Pour les appelants qui détiennent des données en mémoire (liaisons, serveur MCP, version navigateur), le module <c1/> expose les mêmes méthodes avec du texte ou des octets en entrée et du JSON en sortie, sans toucher à aucun fichier ni au réseau :

# text
seg-4dbf41c0ec3b = Fonction

# text
seg-95f87a38a522 = Entrée

# text
seg-0fe8ff25f4a1 = Sortie

# text
seg-9e99af2c1f84 = texte CSV ADS-B

# text
seg-e144f449c5b4 = une tranche d'octets par fichier de trace readsb (gzip ou brut)

# text
seg-7effd7110c4c = texte CSV AIS, texte GeoJSON de terres facultatif

# text
# c1: YYYY-MM-DD
seg-10c5e0c0a9c8 = texte d'itinéraire, textes GeoJSON de carte, bornes <c1/> facultatives

# text
# c1: kshana-route-exposure/v1
seg-be00d23d96e9 = JSON <c1/>

# text
# c1: DayMap
# c2: file_name
# c3: <source>-<dataset>-<date>.geojson
# c4: date
# c5: geojson
# c6: DatasetSpec
# c7: Preset("adsb-lol" | "noaa-marinecadastre" | "kystverket")
# c8: Custom { licence, licence_url, attribution }
# c9: DEFAULT_CELL_DEG
# c10: MapError
seg-20a842d675c2 = Un <c1/> comporte <c2/> (<c3/>), <c4/> et <c5/> (le document v1). <c6/> est <c7/> ou <c8/> ; <c9/> vaut { "0.5" }. Les erreurs sont des <c10/>. Les règles des jeux de données (préréglages approuvés, texte de licence requis, le type doit correspondre) s'appliquent exactement comme en ligne de commande.

# text
seg-1195686de09b = Validation externe

# text
# c1: tests/interference_map_reference.rs
# c2: tests/fixtures/interference_map_ref/PREREGISTRATION.md
# c3: scripts/gen_interference_map_ref.py
seg-0de37085f544 = <c1/> compare Kshana à des implémentations indépendantes sur des entrées synthétiques, avec des tolérances préenregistrées dans <c2/> : les significations des codes NIC et NACp par rapport au décodage pyModeS de trames ADS-B synthétiques, les valeurs « non disponible » de l'AIS par rapport au décodage pyais de phrases AIVDM synthétiques, l'affectation aux cellules de la grille par rapport à shapely, la longueur d'itinéraire par état de cellule par rapport à shapely et GeographicLib, et le masquage des terres par rapport à shapely et pyproj. Les jeux de test sont produits par <c3/> ; la CI n'a pas besoin de Python. Cela valide la façon dont les codes et les valeurs de champ sont lus, ainsi que la géométrie. Cela ne valide pas qu'une cellule signalée soit une interférence.

# text
# c1: src/interference_map/
# c2: tests/interference_map_cli.rs
seg-56a3e955cbcc = Tous les tests utilisent des données synthétiques générées et aucun réseau : des tests unitaires dans <c1/>, et <c2/> pour les commandes de bout en bout, y compris le fait qu'aucun identifiant n'atteint une sortie et que les refus ne laissent aucun fichier.

# text
seg-212c43d1a41c = <s1>Précédent</s1>Flux d'entraînement NMEA

# text
seg-7f13ee5d254e = <s1>Suivant</s1>Carte d'interférence : sources de données et licences

# text
seg-1fc1794d9388 = Méthode ADS-B (kshana-interference-map/adsb/v2)

# text
seg-a3a97ab49ed1 = Méthode AIS (kshana-interference-map/ais/v2)

seg-e3949a1e6082 = Région de l'émetteur (<c1/>)

seg-34bdcfd66ded = Dans la branche du dépôt d'où viennent ces documents ; pas encore sur GitHub

seg-4fc5a1dcc963 = <c1/> estime <b>où peut se trouver une source d'interférence</b> à partir des mêmes rapports ADS-B ou AIS ouverts : une région à des niveaux de confiance déclarés, un centroïde avec une ellipse d'incertitude, et les sessions dans le temps. Il ne renvoie jamais un simple point. <b>MODELLED</b> (ligne du registre <c2/>) : la physique est la ligne de visée radio des manuels, la crédibilité des régions est conditionnelle au modèle, et la seule vérification externe est la comparaison de Jammertest préenregistrée dans <s1><c3/></s1>. La publication des régions d'émetteurs dans l'observatoire public est une décision distincte du propriétaire et est <b>désactivée</b> : l'observatoire ne lit pas ce module, et un test le garantit.

seg-194d573cb817 = Options : <c1/>, <c2/>, <c3/>, <c4/>, <c5/> (AIS), <c6/> (fusionner une position TDOA ; ci-dessous). Toute option qui diffère de la valeur préenregistrée est annoncée comme « not the pre-registered method ». Les fichiers ne sont jamais écrasés.

seg-5767c749117a = <b>Modèle.</b> Les rapports sont regroupés en <em>unités</em> (un aéronef ou un navire dans un intervalle de 2 minutes), chacune <em>touchée</em> (ADS-B : au moins la moitié de ses rapports ont un NIC ou un NACp faible selon la règle propre à la carte ; AIS : une vitesse ou un saut invraisemblable, ou une position à l'intérieur des terres par rapport au littoral) ou non. Un aéronef ou un navire ne compte qu'avec au moins { "5" } bons rapports dans l'entrée (la même garde de référence d'équipement que la carte). Les unités touchées sont regroupées en <em>sessions</em> : un écart de plus de { "30" } minutes sépare dans le temps, et au sein d'un groupe temporel deux unités vont ensemble lorsqu'un même émetteur pourrait être à portée des deux. Pour une session, chaque position candidate sur une grille reçoit une vraisemblance :

seg-0e3abeb21526 = <b>Ligne de visée.</b> Un aéronef à la hauteur <c1/> et une antenne d'émetteur à <c2/> se voient jusqu'à <c3/> km sur un rayon terrestre de 4/3. <c4/> est marginalisée sur { "2" } à { "100" } m ({ "8" } valeurs à espacement logarithmique).

seg-75f5afea310e = <b>Puissance.</b> La puissance de l'émetteur est inconnue, de sorte qu'une portée effective de { "12" } km à { "426" } km (par pas de { "1.25" }) ou « ligne de visée seulement » plafonne la portée, marginalisée à poids égal. Le bord de la portée est doux : une unité compte comme à portée avec un poids qui décroît linéairement sur { "15" } % de la portée de chaque côté (au moins les trois quarts d'une cellule de grille), car le relief, le diagramme d'antenne et le trajet ne sont pas connus avec plus de précision.

seg-ff9cf5fc9fbe = <b>Touché et non touché.</b> Un aéronef ou un navire est <em>sensible</em> avec la probabilité { "0.6" } (l'équipement du récepteur, l'antenne et le trajet du signal diffèrent), une unité d'un aéronef sensible à portée est touchée avec la probabilité { "0.9" }, et toute autre unité est touchée avec la probabilité de fond { "0.03" } (autres causes). La sensibilité est une propriété latente de l'aéronef, sommée par aéronef, tout comme un défaut d'équipement persistant (probabilité { "0.03" } : toutes les unités de cet aéronef sont touchées où qu'il soit), ce qui évite qu'un transpondeur défectueux n'entraîne la région. Ainsi, un aéronef <b>touché</b> tire la postérieure vers les positions qui l'atteignent, et un <b>aéronef non touché en ligne de visée</b> repousse les positions qui l'auraient atteint d'au plus le poids d'un aéronef, quel que soit le nombre de rapports envoyés, tandis qu'un aéronef non touché sans ligne de visée ne dit rien.

seg-51e09cf3944c = <b>Sans relief.</b> Le relief, les conduits de propagation et la diffraction ne sont pas modélisés (le relief ne peut que supprimer la ligne de visée).

seg-b966c198786a = <b>Atténuation.</b> Le log de vraisemblance est multiplié par { "0.3" } (une postérieure à puissance). Les observations du modèle sont plus dépendantes entre elles et ses bords moins nets que l'indépendance que suppose la vraisemblance, et sur des données synthétiques présentant ces défauts, les régions non atténuées contenaient la vraie source bien en dessous de leur taux déclaré ; { "0.3" } a été choisi sur des données synthétiques seulement (la dérivation se trouve dans <c1/>, section { "8" }).

seg-4488bddfd8da = La postérieure donne des <b>régions de plus haute densité</b> aux niveaux déclarés (emboîtées ; des polygones avec trous au besoin), le <b>centroïde</b> pondéré par la postérieure et son <b>ellipse de moments</b> (mise à l'échelle de { "95" } % sous une loi gaussienne ; ce sont les polygones, et non l'ellipse, qui sont les niveaux étalonnés). La grille est grossière (environ { "5" } à { "10" } km) sur tout le domaine et chaque cellule grossière contenant de la masse est divisée { "4" } par { "4" }. Le <b>biais de couverture</b> est traité en conditionnant sur les endroits où des rapports existent : une région est large là où peu d'aéronefs étaient présents, et une session dont la région à { "95" } % remplit plus de { "80" } % de son domaine de recherche est rapportée <c1/> sans centroïde.

seg-2ee93e45c01e = <b>Sessions et profil.</b> Chaque session publiée a un début, une fin, une durée, la surface des cellules de 0,5 degré qui contiennent une unité touchée et au moins { "5" } aéronefs ou navires distincts, les nombres distincts de touchés et d'observés, et la preuve contraire (non touchés distincts en ligne de visée du centroïde ; retenue en dessous de { "5" }). Une session avec moins de <c1/> aéronefs ou navires touchés distincts est retenue et comptée. Le profil donne, par heure UTC du jour, les aéronefs touchés distincts (<c2/> en dessous de { "5" }) et les minutes de temps de session, ainsi que les heures de temps de session par jour UTC.

seg-857aad210cde = Fusion TDOA facultative.

seg-fcfc554b4f3d = <c1/> prend <c2/> (au moins trois récepteurs ; <c3/> est le récepteur <c4/> moins le récepteur { "0" }). La position est résolue à la surface de la Terre par Gauss-Newton sur <c5/>, sa covariance est <c6/>, et la gaussienne est multipliée dans la postérieure. La borne de Cramer-Rao est une borne inférieure sur un modèle, et non une précision mesurée.

seg-55c1c9c80601 = <b>Sorties</b> (<c1/>) : <c2/> (région MultiPolygon par niveau et par session, le polygone de l'ellipse, le point centroïde portant son ellipse), <c3/>, <c4/>, <c5/>. Chacune intègre la licence du jeu de données, l'URL de la licence et l'attribution, l'identifiant de méthode <c6/>, chaque paramètre, les hypothèses et les limites, et porte son <b>étiquette de preuve</b> (niveau MODELLED, identifiants de lignes du registre ; le bandeau sous la figure, les lignes <c7/> dans le tableau, un membre <c8/> dans le JSON). Les fichiers machine sont en anglais quelle que soit la langue ; le texte de la figure et les lignes de la ligne de commande sont localisés. Un exemple synthétique se trouve dans <c9/> (<c10/>).

seg-7f93e7987855 = <b>Confidentialité et formulation.</b> Aucun identifiant d'aéronef ou de navire n'apparaît dans une sortie ; aucune position de rapport n'est tracée ; une session exige au moins { "5" } aéronefs ou navires distincts ; les nombres inférieurs à { "5" } sont <c1/>. La formulation est neutre : « région d'émetteur estimée », « région de la source d'interférence ». Une région n'est la position de personne, n'est pas un constat de la cause et ne dit rien de qui ou de ce qui est derrière une source ; le test de formulation étendu vérifie que les sorties ne contiennent aucun mot d'acteurs, d'intention ou de conflit.

seg-5298b30a7857 = <b>Limites.</b> La crédibilité est conditionnelle au modèle. Sur des données synthétiques (un générateur qui partage le modèle, avec des bords de portée incertains à { "15" } % par aéronef, des défauts d'équipement persistants, une puissance inconnue et une hauteur d'antenne inconnue), la région à { "95" } % contenait la vraie source dans { "0.99" } (géométrie d'aéronefs) et { "1.00" } (géométrie de navires) des sessions et la région à { "50" } % dans environ { "0.77" } : les niveaux sont prudents, par l'exposant de vraisemblance de { "0.3" }, et l'erreur de centroïde d'une session a une médiane de { "23" } km (aéronefs) et { "12" } km (navires). L'étalonnage n'est vérifié que sur des données synthétiques ; la comparaison de Jammertest a été préenregistrée (<c1/>) et exécutée une fois : NON ÉVALUABLE pour les deux sources (<c2/>). Une seule source par session ; plusieurs sources proches ressemblent à une seule. Une cause régionale (une panne de constellation, la météo spatiale) donne une région qui n'est pas une source. L'ADS-B donne peu de rapports hors des espaces aériens chargés, et seulement environ un quart des points de trace de readsb portent le NIC et le NACp, de sorte que les zones peu denses donnent des régions larges ou aucune ({ "31" } % des sessions en géométrie de navires étaient <c3/>).

seg-d8eb178ef226 = Région de l'émetteur (interference-map locate)
