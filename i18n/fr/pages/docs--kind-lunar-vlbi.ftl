# docs--kind-lunar-vlbi: translations (fr)

# text
seg-c1ce24cd6008 = analytique

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-df90e5910fb4 = h

# text
seg-3843825d0733 = us

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Dérivées partielles du retard accumulées sur un calendrier de lignes de base × époques dans une matrice d'information de Fisher, inversée en covariance des coordonnées de station et en sigma de station par coordonnée, remplaçant un lien d'équipartition isotrope supposé à partir d'un

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Un troisième choix de datum, <c1/>, qui maintient fixes toutes les stations terrestres et estime seules les coordonnées de la BALISE fixes dans la Lune — la configuration pour laquelle une incertitude de point de surface lunaire est effectivement citée, puisque les coordonnées des stations terrestres

# text
# c1: docs/kinds/by-kind/lunar-vlbi.md
seg-afeb6e26c5ad = Source : <c1/>

# text
# c1: lunar-vlbi
seg-6d1a32afd780 = <c1/> (type de scénario)

# text
seg-e01f77d493a0 = Observable de retard VLBI géodésique lunaire modélisé : une ligne de base terrestre (deux stations au sol, GCRS) observe un signal aller d'une balise de surface lunaire de classe NovaMoon. Émet le retard en champ proche par différence de deux distances, son taux, et la correction de courbure du front d'onde en champ proche sur un passage — recoupé avec l'observable Δ-DOR à onde plane du même code source dans la limite du champ lointain, avec des dérivées partielles vérifiées par différences finies. Le chemin analytique par défaut est MODELLED et comporte les réserves de cohérence de référentiel, de mouvement du pôle xp=yp={ "0" } et d'onde plane contre champ proche. Définir planetary_kernel_path, earth_orientation_kernel_path et moon_orientation_kernel_path exécute à la place le chemin par noyaux (DE440, MOON_PA_DE440, ITRF93 ; temps de trajet lumineux barycentriques convergés ; ajoute les dérivées partielles de la balise et des stations de l'époque), dont le retard newtonien et les dérivées partielles concordent avec les temps de trajet lumineux convergés de NAIF SPICE à { "0.06" } ps et { "7.4e-9" }. Non vérifié sur de vraies données VLBI.

# text
# c1: scenarios/lunar-vlbi.toml
seg-92227c085867 = Une exécution de <c1/> se résume ainsi : lunar-vlbi | baseline { "10727" } km | beacon range { "402900" } km | delay -10049.126 µs (rate { "1.312e-6" } s/s) | near-field { "58.9" } µs | { "13" } samples over { "6.0" } h

# text
# c1: station1_lat_deg
# c2: station1_lon_deg
# c3: station1_alt_m
# c4: station2_lat_deg
# c5: station2_lon_deg
# c6: station2_alt_m
# c7: beacon_lat_deg
# c8: beacon_lon_deg
# c9: beacon_alt_m
# c10: epoch_year
# c11: epoch_month
# c12: epoch_day
# c13: horizon_hours
# c14: step_min
# c15: planetary_kernel_path
# c16: earth_orientation_kernel_path
# c17: moon_orientation_kernel_path
seg-1a38a07a0d70 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

# text
# c1: scenarios/lunar-vlbi.toml
seg-11450a55fc9d = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-07d97fc1abac = Le graphique que le moteur écrit pour scenarios/lunar-vlbi.toml, type de scénario lunar-vlbi

# text
seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-61f431e422e5 = <b>MODELLED</b> Retard VLBI en champ proche pour une ligne de base terrestre observant une balise lunaire + dérivées partielles

# text
seg-7342b50d34e4 = <b>VALIDATED</b> Retard VLBI en champ proche pour une ligne de base terrestre observant une balise lunaire, avec dérivées partielles de la balise et des stations, sur le chemin par noyaux (lunar_vlbi::KernelGeometry) : Terre et Lune de DE440, axes principaux lunaires de DE440, orientation de la Terre ITRF93 avec UT1 et Tests : <a1>naif_kernel_reader_check.rs</a1>.

# text
seg-5547f1f662d3 = et { "2" } de plus dans la matrice.

# text
seg-1461c84350d8 = <b>MODELLED</b> Retard VLBI en champ proche pour une ligne de base terrestre observant une balise lunaire + dérivées partielles. Référence indépendante (ReferenceImpl) : delta_dor à onde plane (même code source) dans la limite du champ lointain ; dérivées partielles par différences finies. { "0.30" } comparaison externe, un constat (reste MODELLED) : par rapport aux temps de trajet lumineux convergés d'ANISE { "0.10" } via DE440 ({ "75" } retards le 2024-01-01 sur trois lignes de base DSN, générés par xval/anise-lunar-od sans code Kshana), aucun retard n'est dans la tolérance de { "1" } ps. Le plus grand écart est de { "24" } µs, dû au centre de la Lune analytique (environ { "200" } km de DE

# text
# c1: kshana kinds --json
seg-b41c162b015f = Le chemin analytique par défaut est MODELLED et comporte les réserves de cohérence de référentiel, de mouvement du pôle xp=yp={ "0" } et d'onde plane contre champ proche. (catalogue des types de scénario (<c1/>))

# text
seg-0beac99bb095 = Honnêteté : MODELLED, NON vérifié sur de vraies données VLBI. Le mouvement du pôle est omis (xp = yp = { "0" }) de sorte que les positions inertielles des stations portent une erreur de référentiel de quelques mètres ; la balise mélange une série de la Lune à l'équateur moyen de la date avec un décalage ICRF fixe dans le corps (jd_tdb ~ jd_tt), un défaut de cohérence de référentiel inférieur à la fidélité du modèle ; pas d'itération du temps de trajet lumineux, de milieux ni d'aberration au-delà du Shapiro différencié. Aucun TRL, héritage de vol ni aval d'une agence (commentaire du fichier de scénario, lignes { "17" } à { "21" })

# text
seg-58b64e5ff3db = Le VLBI géodésique lunaire est MODELLED, et non vérifié : il est contrôlé par rapport à une implémentation distincte dans ce même code source, indépendante de l'unité testée mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-04089c4d6fbe = <s1>Précédent</s1>lunar-vlbi-fim

# text
seg-6adcdfbaa8be = <s1>Suivant</s1>mars-pnt
