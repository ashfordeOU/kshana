# docs--kind-araim-reference-check: translations (fr)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/araim-reference-check.md
seg-c53da0bf140d = Source : <c1/>

# text
# c1: araim-reference-check
seg-82884391dd77 = <c1/> (type de scénario)

# text
seg-8e845ce908ee = Type de scénario du moteur v{ $version }, famille <a1>Mesures GNSS, positionnement et intégrité</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
# c1: published
seg-06197409c717 = Vecteurs de référence de certification ARAIM publiés : les niveaux de protection horizontal et vertical ARAIM du moteur exécutés sur les exemples numériques traités PROPRES au sous-groupe technique ARAIM du WG-C, à la tolérance (TOL_PL = { "5e-2" } m) que ces documents indiquent eux-mêmes. Deux vecteurs sont enregistrés comme jeux de test, chacun portant son URL de récupération, sa date de récupération, le SHA-256 du fichier source et la page : le Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) annexe D — autocohérent, et le vecteur d'acceptation — et le rapport du jalon { "3" } ({ "2016" }) annexe A section A.IX, la déclaration que citent les bibliographies de recherche. Chaque entrée publiée (la matrice de géométrie à 10 satellites et 2 constellations, les diagonales de variance C_int et C_acc, b_nom, P_sat, P_const et le jeu de constantes LPV-200) et chaque sortie publiée (VPL, HPL, EMT, sigma_v_acc, K_fa_3 et les sigma_3, sigma_ss_3 et b_3 des deux modes de défaut de constellation) est rapportée à côté du nombre propre du moteur et de leur différence absolue. L'équation du niveau de protection n'est PAS résolue de nouveau ici : la liste de modes de la référence est remise au raim::araim_protection_level / araim_integrity_risk existant du moteur, de sorte que la bissection et l'algèbre de la queue gaussienne éprouvées sont celles du moteur ; seuls la géométrie, les sous-solutions, les seuils de détection et la répartition publiée du budget sont construits pour lui. EXTERNALLY CHECKED par rapport au vecteur { "2019" } : VPL { "18.2926" } m contre { "18.3" } m publié, HPL { "13.4063" } m contre { "13.45" } m, EMT { "7.2997" } m contre { "7.2998" } m, sigma_v_acc { "1.3694" } m contre { "1.3694" } m, et les six intermédiaires publiés à moins d'une demi-unité de leur dernière décimale imprimée. Le vecteur { "2016" } comporte deux défauts internes que le rapport énonce au lieu de les cacher — une coquille de signe à la ligne { "3" } de G, et un K_fa_3 évalué à { "57" } modes de défaut alors que le document indique N_fault_max = { "1" } ({ "12" } modes) — de sorte que ses intermédiaires de géométrie se reproduisent exactement tandis que ses niveaux de protection sont rapportés comme des écarts mesurés et exclus du chiffre d'acceptation ; la tolérance n'est jamais élargie pour les absorber. Chaque champ numérique émis porte une unité et une classe de provenance, et un chiffre transcrit est étiqueté <c1/> afin de ne jamais pouvoir être pris pour un chiffre calculé. PORTÉE : seul N_fault_max = { "1" } (modes de défaut d'un seul satellite et d'une seule constellation) est mis en œuvre, et un cas dont les a priori exigent des sous-ensembles de défauts multi-événements simultanés est REFUSED au lieu d'être tronqué silencieusement ; la détection de défaut, l'exclusion, le contrôle de cohérence du khi-deux et l'étape de réallocation de double comptage de l'algorithme de référence sont hors périmètre. Cela reproduit l'exemple traité d'un algorithme de référence publié — ce n'est ni une certification, ni un artefact de navigabilité, ni une approbation.

# text
# c1: scenarios/araim-reference-check.toml
seg-c16de81ec8da = Une exécution de <c1/> se résume ainsi : araim-reference-check: { "2" } published WG-C reference vector(s); worst VPL/HPL agreement { "0.0437" } m against the reference's own TOL_PL = { "0.05" } m over { "1" } acceptance vector(s)

# text
# c1: vector
seg-b1be6b5632c1 = Champs facultatifs : <c1/>

# text
# c1: scenarios/araim-reference-check.toml
seg-3f181d41edb5 = L'exemple <c1/> définit, entre autres :

# text
seg-9de6e1b3352d = Étiquette du résultat (celle du moteur) : EXTERNALLY CHECKED — les niveaux de protection ARAIM du moteur exécutés sur les exemples numériques traités publiés de l'algorithme aéroporté de référence du sous-groupe technique ARAIM du Working Group C UE–États-Unis, à la tolérance (TOL_PL) que ces documents indiquent eux-mêmes. Chaque chiffre publié porte son UR

# attr:alt
seg-693c823c85d1 = Le graphique que le moteur écrit pour scenarios/araim-reference-check.toml, type de scénario araim-reference-check

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-c5c966ec3c6a = <b>VALIDATED</b> L'équation du niveau de protection par séparation de solutions à hypothèses multiples elle-même : moindres carrés pondérés tous satellites en vue et par mode de défaut sur une géométrie Est/Nord/Haut avec un état d'horloge par constellation, les sigma des sous-solutions, la séparation de solutions Tests : <a1>araim_reference_vectors.rs</a1>.

# text
seg-a99b9cf4c6e8 = <b>VALIDATED</b> L'équation du niveau de protection par séparation de solutions à hypothèses multiples elle-même : moindres carrés pondérés tous satellites en vue et par mode de défaut sur une géométrie Est/Nord/Haut. Référence indépendante (ExternalDataset) : sous-groupe technique ARAIM du Working Group C UE–États-Unis, Reference Airborne Algorithm Description Document v3.1 ({ "20" } juin { "2019" }), exemple numérique traité de l'annexe D — ENTRÉES publiées (matrice de géométrie à 10 satellites et 2 constellations, diagonales C_int/C_acc, b_nom, P_sat, P_const, constantes LPV-200) et SORTIES publiées (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" }, et six intermédiaires de défaut de constellation

# text
seg-f6b7ca020692 = Page de famille : <a1>Mesures GNSS, positionnement et intégrité</a1>

# text
seg-f4cf8b629797 = Page thématique : <a1>INTEGRITY.md</a1>

# text
seg-e6b1f9a47b5d = Page thématique : <a1>ARAIM_REFERENCE.md</a1>

# text
seg-7cf434223fa5 = <s1>Précédent</s1>aperture-duty-cycle

# text
seg-ed2003ecf41b = <s1>Suivant</s1>ascent-losses
