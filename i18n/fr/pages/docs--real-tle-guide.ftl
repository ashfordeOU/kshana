# docs--real-tle-guide: translations (fr)

# text
seg-a6da23b43f90 = <s1>Suivant</s1>Campagnes

# text
# c1: docs/REAL_TLE_GUIDE.md
seg-bc9ae2eda129 = Source : <c1/>

# text
seg-68b27f011ced = Utiliser de véritables TLE de constellations

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: tests/fixtures/celestrak/gps-ops_2021-07-28.txt
# c5: scripts/fetch_tles.sh
seg-109e8a920fc2 = Le fichier fourni <c1/> porte déjà de <b>véritables TLE</b> (jeux d'éléments à deux lignes) : l'instantané <c2/> de Celestrak de la constellation GPS (Global Positioning System) opérationnelle cataloguée le 2021-07-28, { "30" } satellites, avec <c3/>. Chaque satellite est propagé avec SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), validé par rapport aux vecteurs officiels d'AIAA (American Institute of Aeronautics and Astronautics) 2006-6753. Le même instantané est versionné sous <c4/>, et <c5/> en récupère un nouveau. Lisez la section { "3" } avant de citer un chiffre de géométrie qui en provient : ce scénario propage chaque satellite à partir de sa propre époque.

# text
# c1: scenarios/orbit-real-tle.toml
# c2: orbit
# c3: tle
seg-faed28835cb2 = Pour un exemple synthétique et autonome, <c1/> donne six satellites de type GPS sous forme de simples enregistrements de ligne 2, propagés comme éléments képlériens analytiques, et tout scénario <c2/> sans bloc <c3/> construit une constellation de Walker.

# text
seg-1c9b96a07f5b = Pour étudier la constellation GPS <b>actuelle</b> (ou toute autre), déposez un instantané récent.

# text
seg-95bb71044de0 = { "1" }. Télécharger un instantané récent

# text
seg-ab93ab55ddd9 = <a1>Celestrak</a1> redistribue les jeux d'éléments du catalogue du NORAD (North American Aerospace Defense Command), actualisés au moins une fois par jour. Pour le GPS :

# text
# c1: galileo
# c2: glo-ops
# c3: beidou
# c4: stations
seg-da7b4b89848b = Autres groupes utiles : <c1/>, <c2/> (GLONASS, le Global Navigation Satellite System russe), <c3/>, <c4/> (l'ISS, Station spatiale internationale, et d'autres stations habitées).

# text
seg-d7fe0dccbc36 = Le fichier est une suite d'enregistrements de trois lignes (nom, ligne { "1" }, ligne { "2" }). L'analyseur de Kshana ignore les lignes de nom, de sorte que vous pouvez coller le fichier tel quel.

# text
seg-c2d6ca2089a1 = { "2" }. L'intégrer à un scénario

# text
# c1: tle
seg-6e221c5b640a = Dans tout scénario d'orbite, réglez le bloc <c1/> de la constellation sur le contenu de l'instantané :

# text
seg-f2b0e78ef568 = (PRN est le numéro de code de bruit pseudo-aléatoire qu'émet un satellite GPS.)

# text
seg-976bcb48df94 = Une paire ligne { "1" } + ligne { "2" } est propagée avec <b>SGP4/SDP4</b> (termes de traînée et d'espace lointain) ; une simple ligne { "2" } est traitée comme des éléments moyens képlériens analytiques. Les deux peuvent être mêlés.

# text
# c1: strict_checksum = true
# c2: false
seg-fa1d59fc7817 = <c1/> rejette toute ligne dont la somme de contrôle modulo 10 de la colonne 69 est erronée — un bon contrôle d'intégrité sur un fichier fraîchement téléchargé. Il vaut par défaut <c2/> parce que les scénarios pédagogiques synthétiques utilisent des sommes de contrôle fictives.

# text
seg-90d3872ebf87 = { "3" }. Remarques sur les époques — à lire avant de citer un chiffre de géométrie

# text
# c1: parse_propagators
# c2: src/tle.rs
# c3: t
# c4: tsince = t
seg-5e9056a30d53 = SGP4 propage chaque satellite à partir de <b>sa propre époque TLE</b>, et <c1/> (dans <c2/>) ne renvoie que des propagateurs, de sorte que le temps de scénario <c3/> est appliqué comme <c4/> à chaque satellite indépendamment. Ce n'est la bonne convention que si tous les jeux d'éléments du fichier partagent une même époque.

# text
seg-3d04797ae50e = <b>Un fichier de groupe Celestrak ne vous donne pas cela.</b> Le fichier est <em>téléchargé</em> à un instant donné, mais le jeu d'éléments de chaque satellite est actualisé à son propre rythme, de sorte que les époques qu'il contient s'étalent sur plusieurs jours. Mesuré sur les jeux versionnés dans ce dépôt (ligne { "1" }, colonnes { "19" }–{ "32" }) :

# text
seg-5f67557dd207 = jeu de test

# text
seg-ce4855643f31 = jeux

# text
seg-49a5b4798be4 = étalement des époques

# text
seg-b758a9b7ee02 = { "70.6" } h

# text
seg-79e6ea88957c = { "76.4" } h

# text
seg-e1e30f69fa4f = { "335.7" } h

# text
# c1: orbit
# c2: integrity
seg-9d38cc073c94 = { "70.6" } h correspondent à { "5.9" } révolutions GPS. Propagé tel quel, le phasage dans le plan est brouillé : les satellites sont aux bonnes altitudes et inclinaisons, mais pas là où ils se trouvaient un jour donné, de sorte que l'ensemble visible, le DOP (dilution de précision) et toute disponibilité calculée à partir d'eux décrivent une constellation qui n'a jamais existé. Rien dans l'analyseur ne mesure cet étalement à votre place, et les types de scénario <c1/> et <c2/> n'alignent pas les époques : un bloc TLE dans un scénario est toujours propagé à l'époque propre de chaque satellite.

# text
# c1: tsince
# c2: Tle::epoch_days_1950
# c3: tests/igs_real_data.rs
# c4: real_gps_tle_snapshot
seg-fa82a18e4418 = <b>Faites plutôt ainsi.</b> Conservez l'époque à côté du propagateur, choisissez un instant de référence unique et décalez le <c1/> de chaque satellite vers lui. <c2/> est public, de sorte que la boucle d'analyse est courte ; <c3/> (<c4/>) est l'exemple résolu de cette arborescence :

# text
# c1: tests/igs_real_data.rs
# c2: teme_to_ecef
seg-78092818695e = TEME est le référentiel à équateur vrai et équinoxe moyen dans lequel SGP4 travaille ; <c1/> le fait passer en coordonnées terrestres avec <c2/>.

# text
seg-78f483dfc3fa = Si vous n'alignez pas, dites-le quand vous rapportez le chiffre : il décrit des <em>couches</em> orbitales, non un ciel réel.

# text
# c1: tests/araim_dual_real_data.rs
seg-34fddbd3d57f = L'importance de cela est mesurée dans <c1/>, qui applique les mêmes décalages (instant de référence : la dernière époque des jeux de test combinés GPS + Galileo, 2026-06-07T07:{ "21" }:{ "04" } UTC (temps universel coordonné)) à travers une exécution de disponibilité ARAIM (surveillance autonome avancée de l'intégrité par le récepteur) à double constellation sur { "24" } h. Sous une VAL (limite d'alerte verticale) de { "12" } m, le ciel aligné donne { "0.993" } pour le GPS seul, { "1.000" } pour GPS+Galileo mis en commun et { "0.990" } pour le double robuste aux pannes de constellation ; la convention non alignée à l'époque propre de chaque satellite donne { "0.208" }, { "0.671" } et { "0.031" } pour les mêmes entrées — une conclusion différente, non une petite erreur.

# text
# c1: README.md
seg-49f6c8f71d99 = <a1><c1/></a1> — les scénarios d'orbite.

# text
# c1: SCENARIOS.md
# c2: orbit
# c3: integrity
# c4: gnss-sim
# c5: jamming
# c6: constellation-design
# c7: constellation
# c8: ephemeris
# c9: tle
seg-c842884cb3e7 = <a1><c1/></a1> — les champs du type de scénario <c2/> ; les types de scénario <c3/>, <c4/>, <c5/> et <c6/> prennent la même table <c7/>, et <a2><c8/></a2> prend un seul <c9/>.

# text
# c1: INTEGRITY.md
seg-a2c5db6dcf42 = <a1><c1/></a1> — le moteur ARAIM que pilote l'essai sur ciel réel.

# text
# c1: src/tle.rs
# c2: parse_propagators
# c3: ParseOpts { strict_checksum }
seg-106047488885 = <c1/> — l'analyseur (<c2/>, <c3/>).

# text
seg-c9068c1bc579 = <s1>Précédent</s1>Schéma de résultat
