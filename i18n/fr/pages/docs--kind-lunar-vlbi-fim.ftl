# docs--kind-lunar-vlbi-fim: translations (fr)

# text
seg-b054c73f22e5 = aucune valeur

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-3319b18ac61f = et { "1" } autre dans la matrice.

# text
seg-2595bd629ffb = <b>MODELLED</b> Le datum de Helmert à sept paramètres propagé à partir d'une CAMPAGNE D'OBSERVATION SIMULÉE au lieu d'être retrouvé à partir d'une transformation injectée.

# text
# c1: docs/kinds/by-kind/lunar-vlbi-fim.md
seg-7ecec8d27f50 = Source : <c1/>

# text
# c1: lunar-vlbi-fim
seg-d54e29b7bc80 = <c1/> (type de scénario)

# text
seg-1bc37634ba9f = Covariance des coordonnées de station en VLBI lunaire : les dérivées partielles du retard de l'observable lunar-vlbi accumulées sur un CALENDRIER explicite (lignes de base x époques) dans une matrice d'information de Fisher, inversée, et rapportée comme covariance des coordonnées de station et sigma de station par coordonnée — une sortie calculée du moteur plutôt qu'une précision de retard scalaire passée à travers un facteur d'équipartition isotrope supposé g = { "3" }. L'état porte des coordonnées de station FIXES dans la Terre (ITRS), de sorte que le jacobien est la dérivée partielle inertielle tournée par la matrice GCRS->ITRS de chaque époque : la rotation de la Terre est ce qui rend ces coordonnées observables, et le rapport MESURE le balayage de la ligne de visée fixe dans la Terre et la déclinaison de la balise plutôt que de les supposer. Une observation est une paire (ligne de base, époque) avec LES DEUX stations au-dessus du masque d'élévation, pondérée par 1/delay_sigma_s^{ "2" }. Rapporte à chaque exécution le rang, le défaut de datum, le conditionnement, le spectre d'information complet, la matrice de covariance, les sigmas par station et par axe ainsi que 3D, et l'espace nul du réseau libre ; en cas de déficience de rang, le sigma principal est publié comme NULL avec un statut, jamais lu dans une inverse quasi singulière. La valeur d'équipartition c<em>delay_sigma_s</em>sqrt(g/N) pour le MÊME calendrier est émise à côté de la valeur calculée avec le rapport, ainsi que la borne isotrope de trace sqrt(p/trace(M)) qu'AM-HM rend plancher strict — de sorte que le rapport est l'anisotropie que l'hypothèse avait écartée. La fermeture de retard tau_ik = tau_ij + tau_jk ne rend géométriquement indépendantes que n-1 des n(n-1)/2 lignes de base ; le rapport énonce les deux nombres. MODELLED : l'éphéméride du centre de la Lune, les horloges des stations, la troposphère et les paramètres d'orientation de la Terre sont maintenus FIXES et les observations sont traitées comme indépendantes, de sorte que la covariance est une borne de Cramer-Rao pour un jeu de paramètres réduit, et non un résultat de session prédit ; le sigma de retard, les coordonnées des stations et le calendrier sont des entrées. La dérivée partielle que le jacobien du retard géométrique omet (le terme de Shapiro différencié) est mesurée par différence finie et émise. Pas un produit géodésique.

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-4df72c1b921e = Une exécution de <c1/> se résume ainsi : lunar-vlbi-fim | { "3" } stations / { "3" } baselines x { "49" } epochs = { "16" } obs (mask { "10.0" } deg) | datum anchor-first-station | rank 6/6 cond { "2.209e4" } | station sigma { "0.0926" } m vs equipartition g={ "3" } { "0.0013" } m (ratio { "71.360" })

# text
# c1: stations
# c2: beacon_lat_deg
# c3: beacon_lon_deg
# c4: beacon_alt_m
# c5: epoch_year
# c6: epoch_month
# c7: epoch_day
# c8: arc_hours
# c9: step_min
# c10: delay_sigma_s
# c11: elevation_mask_deg
# c12: datum
# c13: estimate_beacon
# c14: rel_tol
# c15: equipartition_g
# c16: planetary_kernel_path
seg-f0dabe1b061b = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-fabf305ae1de = L'exemple <c1/> définit, entre autres :

# text
seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

# text
seg-8b098bf1df6b = Libellé du résultat (celui du moteur) : covariance des coordonnées de station en VLBI lunaire MODELLED. La covariance est accumulée à partir des propres dérivées partielles analytiques du retard du moteur sur un calendrier explicite de lignes de base et d'époques, puis inversée ; elle n'est PAS convertie à partir d'une précision de retard scalaire par un facteur de géométrie supposé. Le sigma de retard par observation

# attr:alt
seg-19c383444296 = Le graphique que le moteur écrit pour scenarios/lunar-vlbi-fim.toml, type de scénario lunar-vlbi-fim

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Dérivées partielles du retard accumulées sur un calendrier de lignes de base × époques dans une matrice d'information de Fisher, inversée en covariance des coordonnées de station et en sigma de station par coordonnée, remplaçant un lien d'équipartition isotrope supposé à partir d'un

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Un troisième choix de datum, <c1/>, qui maintient fixes toutes les stations terrestres et estime seules les coordonnées de la BALISE fixes dans la Lune — la configuration pour laquelle une incertitude de point de surface lunaire est effectivement citée, puisque les coordonnées des stations terrestres

# text
seg-811a412b40b6 = <b>VALIDATED</b> La covariance de balise à stations toutes fixes du scénario lunar-vlbi-fim (chaque station terrestre maintenue, les coordonnées de la balise fixes dans la Lune estimées seules) avec la balise placée sur la Lune de JPL DE440 lue par le propre lecteur de noyau du moteur

# text
seg-a731b913bdf0 = <b>VALIDATED</b> Dérivées partielles du retard accumulées sur un calendrier de lignes de base × époques dans une matrice d'information de Fisher, inversée en covariance des coordonnées de station et en sigma de station par coo. Référence indépendante (ExternalDataset) : un chemin indépendant dans le dépôt. Chaque ligne du jacobien est redérivée par différence finie centrée de lunar_vlbi::vlbi_delay_s évalué à partir des propres coordonnées fixes dans la Terre et fixes dans la Lune de l'état, tournées vers l'avant par la chaîne de référentiels — un chemin qui ne calcule aucune dérivée et ne partage aucune expression avec les dérivées partielles analytiques — et les matrices d'information que construisent les deux chemins concordent à moins de { "1e-6" } du plus grand terme diagonal. Les

# text
# c1: all-stations-fixed
seg-2300ffd9fc4e = <b>MODELLED</b> Un troisième choix de datum, <c1/>, qui maintient fixes toutes les stations terrestres et estime seules les coordonnées de la BALISE fixes dans la Lune — la configuration pour laquelle une. Référence indépendante (ReferenceImpl) : identités en forme close, sans référence externe revendiquée ni disponible. Le bras de levier est contrôlé par rapport à ρ/B et les deux formes d'équipartition entre elles à { "1e-15" } — des identités algébriques, qui ne détectent donc qu'une erreur de câblage et rien d'autre, et sont étiquetées comme telles. Le résultat de fond est MESURÉ plutôt qu'affirmé : un retard issu d'une ligne de base fixe contraint la DIRECTION de la balise, de sorte que la composante de ligne de visée rea

# text
# c1: label
seg-2cbf700a234e = Covariance des coordonnées de station en VLBI lunaire MODELLED. La covariance est accumulée à partir des propres dérivées partielles analytiques du retard du moteur sur un calendrier explicite de lignes de base et d'époques, puis inversée ; elle n'est PAS convertie à partir d'une précision de retard scalaire par un facteur de géométrie supposé. Le sigma de retard par observation, les coordonnées des stations, le site de la balise et le calendrier sont des entrées. L'éphéméride du centre de la Lune, les horloges des stations (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-8f63c3e774e2 = Covariance des coordonnées de station en VLBI lunaire : les dérivées partielles du retard de l'observable lunar-vlbi accumulées sur un CALENDRIER explicite (lignes de base x époques) dans une matrice d'information de Fisher, inversée, et rapportée comme covariance des coordonnées de station et sigma de station par coordonnée — une sortie calculée du moteur plutôt qu'une précision de retard scalaire passée à travers un facteur d'équipartition isotrope supposé g = { "3" }. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-d09b166842d5 = L'état porte des coordonnées de station FIXES dans la Terre (ITRS), de sorte que le jacobien est la dérivée partielle inertielle tournée par la matrice GCRS->ITRS de chaque époque : la rotation de la Terre est ce qui rend ces coordonnées observables, et le rapport MESURE le balayage de la ligne de visée fixe dans la Terre et la déclinaison de la balise plutôt que de les supposer. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-bb7ff1e5d99f = La valeur d'équipartition c<em>delay_sigma_s</em>sqrt(g/N) pour le MÊME calendrier est émise à côté de la valeur calculée avec le rapport, ainsi que la borne isotrope de trace sqrt(p/trace(M)) qu'AM-HM rend plancher strict — de sorte que le rapport est l'anisotropie que l'hypothèse avait écartée. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-0ed4495d4488 = MODELLED : l'éphéméride du centre de la Lune, les horloges des stations, la troposphère et les paramètres d'orientation de la Terre sont maintenus FIXES et les observations sont traitées comme indépendantes, de sorte que la covariance est une borne de Cramer-Rao pour un jeu de paramètres réduit, et non un résultat de session prédit ; le sigma de retard, les coordonnées des stations et le calendrier sont des entrées. (catalogue des types de scénario (<c1/>))

# text
seg-4df6e3981cc4 = La chaîne publiée de D3 passe d'une précision de retard par observation à une incertitude de coordonnées de station par un facteur d'équipartition ISOTROPE supposé g = { "3" }. Cette étape est celle que le résumé de l'article lui-même qualifie de modélisée plutôt que mesurée. Ce scénario la supprime : les dérivées partielles du retard VLBI lunaire sont accumulées sur un vrai calendrier de paires (ligne de base x époque) dans une matrice d'information de Fisher, inversée, et rapportée comme (commentaire du fichier de scénario, lignes { "3" } à { "8" })

# text
seg-489b93ca0f7f = L'état porte des coordonnées FIXES dans la Terre (ITRS), de sorte que le jacobien est la dérivée partielle inertielle tournée par la matrice GCRS->ITRS de chaque époque : la rotation de la Terre est ce qui rend ces coordonnées observables, et le rapport MESURE le balayage de la ligne de visée fixe dans la Terre et la déclinaison de la balise plutôt que de les supposer. Une observation est une paire (ligne de base, époque) avec LES DEUX stations au-dessus du masque d'élévation, pondérée par 1/delay (commentaire du fichier de scénario, lignes { "10" } à { "14" })

# text
seg-efb5719364af = Ce qu'il faut lire dans le rapport * les sigmas par station et par axe ainsi que 3D — la réponse calculée ; * la valeur d'équipartition c<em>delay_sigma_s</em>sqrt(g/N) pour le MÊME calendrier, imprimée à côté avec le rapport. Ce rapport EST l'anisotropie que l'hypothèse avait écartée, et la borne isotrope de trace sqrt(p/trace(M)) fait d'AM-HM un plancher strict, de sorte que l'hypothèse ne peut jamais que sous-estimer ; * le rang, le défaut de datum, le conditionnement, le sp (commentaire du fichier de scénario, lignes { "16" } à { "26" })

# text
seg-96c1a129aeae = <s1>Précédent</s1>lunar-time-offset

# text
seg-199d98630271 = <s1>Suivant</s1>lunar-vlbi
