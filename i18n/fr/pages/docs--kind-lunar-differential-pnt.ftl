# docs--kind-lunar-differential-pnt: translations (fr)

# text
seg-9feefecdcf67 = rafs

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-549a6103e711 = bit

# text
# c1: docs/kinds/by-kind/lunar-differential-pnt.md
seg-d0c9bec248b4 = Source : <c1/>

# text
# c1: lunar-differential-pnt
seg-d226df2bb634 = <c1/> (type de scénario)

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-4b7355b174a3 = Une exécution de <c1/> se résume ainsi : lunar-differential-pnt | { "8" } sats (illustrative LCNS-class, not affiliated) | baseline { "50" } km | user error { "24.46" } m → { "0.0077" } m ({ "3186" }× reduction) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-1115464be513 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-3f32e0fea066 = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-8e67df89448a = Le graphique que le moteur écrit pour scenarios/lunar-differential-pnt.toml, type de scénario lunar-differential-pnt

# text
seg-6f4246bd8f6f = <b>MODELLED</b> Station de référence différentielle de classe NovaMoon : annulation du mode commun + résiduel croissant avec la ligne de base + niveaux de protection DGNSS. Référence indépendante (InternalConsistency) : identité d'annulation d'erreur différentielle + réutilisation du mécanisme de niveau de protection SBAS de la DO-229E ; la simple différence + la résolution WLS sont en outre recoupées avec lsq()/matinv() de RTKLIB (Takasu, BSD-2-Clause, C compilé) — code de résolution indépendant, mais la même algèbre au premier ordre de la différence de ligne de visée, donc toujours InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Les trois termes qu'une correction différentielle accumule entre l'époque où elle est calculée et l'époque où elle est utilisée, chacun auparavant laissé comme marge non modélisée :. Référence indépendante (InternalConsistency) : identités en forme close et autocohérence : la variance du quantificateur uniforme pas²/12, la propagation exacte de covariance (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ qui se réduit à σ·PDOP pour des σ égaux, le transfert { "1" }:{ "1" } du terme de relevé comme conséquence de û_user ≈ û_ref, et la fermeture en quadrature de la désactivation. Le recoupement du PDOP avec orbit::dop partage la matrice normale [−û, { "1" }], c'est donc un contrôle de cohérence, et il est étiqueté comme tel plutôt que comme un indépendant

# text
# c1: kshana kinds --json
seg-f1e7283d2e15 = MODELLED — identité d'annulation exacte + modèle de décorrélation au premier ordre ; non vérifié sur des données réelles ; aucun TRL, héritage ni aval d'une agence. (catalogue des types de scénario (<c1/>))

# text
seg-9d54d8c07ca3 = HONNÊTETÉ : MODELLED. L'annulation du mode commun est une identité algébrique EXACTE ; le résiduel de décorrélation spatiale est un modèle géométrique du PREMIER ORDRE (la projection de la différence de ligne de visée d'une erreur d'orbite injectée), et non un modèle de décorrélation ajusté sur un suivi lunaire réel. Le niveau de protection de l'utilisateur RÉUTILISE le mécanisme de niveau de protection SBAS de la DO-229E (crate::sbas) avec le sigma résiduel différentiel comme erreur par satellite (commentaire du fichier de scénario, lignes { "23" } à { "28" })

# text
# c1: correction_link
seg-4156a7515574 = ── LA LIAISON DE CORRECTION ────────────────────────────────────────────────────────────── L'identité ci-dessus suppose une correction PARFAITE : calculée par une station qui sait exactement où elle se trouve, délivrée instantanément, à résolution infinie. Aucune des trois conditions n'est vérifiée, et les trois entrées ci-dessous modélisent ce que chacune coûte. Elles n'alimentent QUE le bloc <c1/> du document de résultat -- avec les trois aux valeurs écrites h (commentaire du fichier de scénario, lignes { "57" } à { "62" })

# text
seg-e7f016777e09 = ERREUR DE RELEVÉ. La station forme sa correction par rapport à la coordonnée qu'elle CROIT être la sienne. Une erreur à cet endroit pèse sur chaque correction qu'elle diffuse et atteint l'utilisateur sous la forme -delta . u_ref -- qui ne contient aucune géométrie de l'utilisateur, de sorte que, contrairement au terme d'orbite, elle ne s'annule pas à ligne de base nulle ni ne croît avec la ligne de base, et se transfère à peu près un pour un dans la position de l'utilisateur. La valeur par défaut de { "0.30" } m est la propre référence lunaire du crate (commentaire du fichier de scénario, lignes { "64" } à { "70" })

# text
seg-e0648d9b52b4 = VIEILLISSEMENT DE LA CORRECTION. Une correction calculée à t et appliquée à t+tau est périmée de deux façons. Orbite : le satellite s'est DÉPLACÉ, de sorte que le vecteur d'erreur d'orbite figé se projette maintenant sur une ligne de visée tournée ; la rotation vient du propagateur propre à ce crate, donc aucun taux d'erreur d'orbite n'est supposé nulle part. Horloge : l'horloge du satellite a dérivé de c*sigma_y(tau)*tau selon la loi de puissance du RAFS complet de crate::clock_specs, étalonnée le (commentaire du fichier de scénario, lignes { "73" } à { "79" })

# text
seg-7171b2e3f29d = Le PNT différentiel lunaire est MODELLED, et non vérifié : il est contrôlé par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = Le PNT différentiel lunaire — budget résiduel de la liaison de correction est MODELLED, et non vérifié : il est contrôlé par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Page de sujet : <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-2b8455001710 = <s1>Précédent</s1>lunar-beacon

# text
seg-dca7482d9d75 = <s1>Suivant</s1>lunar-frame-campaign

# text
seg-8ac5ac006ae7 = PNT DIFFÉRENTIEL lunaire modélisé (un analogue lunaire du DGNSS/SBAS) : une station de référence de classe NovaMoon, en un lieu sélénographique CONNU, calcule des corrections différentielles par satellite à partir d'une constellation ILLUSTRATIVE de classe Moonlight/LCNS à sources publiques (NovaMoon n'est cité que comme CLASSE de système, sans affiliation à l'ESA), et un utilisateur décalé de baseline_km les applique de sorte que les erreurs d'orbite et d'horloge de MODE COMMUN s'annulent. Le terme d'horloge s'annule EXACTEMENT (une identité algébrique) ; le terme d'orbite ne laisse que la projection de la différence de ligne de visée, qui → { "0" } quand la ligne de base → { "0" } (le plancher de décorrélation spatiale) et croît ≈ linéairement avec la ligne de base. Rapporte l'erreur de position 3D de l'utilisateur AVEC et SANS corrections, le facteur de réduction, la courbe d'erreur en fonction de la ligne de base, et un niveau de protection de l'utilisateur qui RÉUTILISE le mécanisme SBAS de la DO-229E (crate::sbas) avec le résiduel différentiel σ. MODELLED — identité d'annulation exacte + modèle de décorrélation au premier ordre ; non vérifié sur des données réelles ; aucun TRL, héritage ni aval d'une agence. Déterministe si initialisé par une graine.
