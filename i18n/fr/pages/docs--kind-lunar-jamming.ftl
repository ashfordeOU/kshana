# docs--kind-lunar-jamming: translations (fr)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Non fourni — Kshana modélise la performance du signal, et non le matériel de charge utile ou d'antenne. Référence indépendante (NoneKind) : aucune : une discipline propre au partenaire, sans module ni test par conception

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
seg-f85a85f0c7e4 = MHz

# text
seg-7154243aabbe = broadband

# text
seg-cec5c06d38af = <b>MODELLED</b> Rapport brouilleur/signal propre à la Lune, C/N₀ effectif et perte d'accrochage pour un utilisateur à la surface sélénographique sous un brouilleur à la surface lunaire (ou surélevé), sur la constellation illustrative de classe Moonlight/LCNS issue de sources publiques.

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> Le rapport <c1/> ne repose plus sur un seul scalaire pour son contour de refus.

# text
# c1: docs/kinds/by-kind/lunar-jamming.md
seg-bcb02ffed4d0 = Source : <c1/>

# text
# c1: lunar-jamming
seg-612388918e36 = <c1/> (type de scénario)

# text
# c1: jamming
seg-a91a9ad5d8d1 = Brouillage RF propre à la Lune : rapport brouilleur/signal par satellite, C/N₀ effectif et perte d'accrochage pour un utilisateur de surface sélénographique sous un brouilleur de surface lunaire (ou surélevé), sur la constellation illustrative de classe Moonlight/LCNS en orbite lunaire, à sources publiques. Compose la physique ouverte existante du brouillage (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) avec la géométrie existante du ciel lunaire (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf) ; aucune géométrie ni radiométrie n'est redérivée. Contrairement au type de scénario terrestre <c1/>, la branche du signal n'est PAS une puissance reçue fixe : la puissance reçue isotrope de chaque satellite est son propre bilan de liaison PIRE − FSPL(distance oblique), de sorte que le J/S varie d'un satellite à l'autre avec la distance et l'élévation lunaires. Rapporte UNE LIGNE PAR LIAISON (époque, satellite) VISIBLE — azimut, élévation, distance oblique, les deux puissances reçues dont le J/S est la différence, le J/S, le C/N₀ nominal et effectif et l'état d'accrochage — plus des chiffres de mérite agrégés à côté de ce tableau (jamais à sa place), et le même tableau sous forme d'artefact CSV. Chaque champ numérique émis porte une unité et une classe de provenance. Les sous-résultats VALIDATED portent la référence indépendante de leur module source (l'équation anti-brouillage et la liaison J/S de Kaplan & Hegarty §{ "9.4" }, référencées de façon externe dans tests/gnss_denied_jamming_resilience_reference.rs ; la géométrie lunaire de lunar_service). La composition elle-même est recoupée avec un chemin indépendant à deux bilans de liaison (linkbudget::received_signal_power_dbw, une expression différente de l'affaiblissement en espace libre) à { "1e-9" } dB près. MODELLED : la constellation illustrative, la PIRE / puissance du brouilleur / gains d'antenne / température de bruit représentatifs, et l'absence d'ombrage par le terrain, de multitrajet, de dynamique de CAG et d'annulation adaptative. Pas un produit certifié de déni de service. Lorsqu'un brouilleur est configuré, le rapport porte aussi un CONTOUR DE DÉNI AVEC UNE BANDE D'INCERTITUDE plutôt qu'un contour lu à partir d'un seul scalaire : la distribution mesurée complète du C/N₀ du signal utile sur le tableau par satellite (n, min, p05, p25, médiane, p75, p95, max, moyenne, écart-type de l'échantillon, et l'asymétrie propre de l'échantillon), et le contour évalué à chacune de ces statistiques d'ordre selon les DEUX critères de déni que le moteur reconnaît — celui en vigueur par rapport de puissance (J/S = { "30" } dB, comme dans attack-surface et tracking-loop) et celui de perte d'accrochage (C/N₀ effectif tombant à tracking_threshold_dbhz, le critère qu'utilise la propre colonne d'état de ce rapport) — sur les deux axes du plan de déni (PIRE de brouilleur requise à la distance de sécurité du scénario, distance de sécurité de déni à la PIRE du scénario). Les bords de la bande SONT contour(p05) et contour(p95), la même application en forme close appliquée aux propres quantiles de l'échantillon : non un sigma ajusté à l'échantillon et non médiane ± k·écart-type, l'écart-type étant émis par continuité et n'étant utilisé par rien. Un quantile déjà égal ou inférieur au seuil de suivi n'a pas de J/S de déni fini et ses colonnes de perte d'accrochage sont nulles avec une raison comptée, jamais un rayon borné.

# text
# c1: scenarios/lunar-jamming.toml
seg-6693c3ebcb07 = Une exécution de <c1/> se résume ainsi : lunar-jamming | { "4" } sats, { "12" } epochs, { "38" } links from (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (mean { "35.622" }) | { "0" } LOST | availability { "0.167" } of { "0.167" } nominal

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-6e01b6354e40 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/lunar-jamming.toml
seg-c61fb6515ed9 = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-6fe8b3c6c584 = Le graphique que le moteur écrit pour scenarios/lunar-jamming.toml, type de scénario lunar-jamming

# text
seg-d4ae2f589112 = <b>MODELLED</b> Rapport brouilleur/signal propre à la Lune, C/N₀ effectif et perte d'accrochage pour un utilisateur de surface sélénographique sous un brouilleur de surface lunaire (ou surélevé), sur l'illustr. Référence indépendante (ReferenceImpl) : recoupement de la composition avec un chemin de code indépendant dans le dépôt : chaque J/S par liaison est redérivé comme la différence de deux bilans de liaison calculés avec linkbudget::received_signal_power_dbw, dont l'affaiblissement en espace libre est l'unique expression { "20" }·log10(4πRf/c) plutôt que la somme à trois termes qu'utilise jamming::free_space_path_loss_db — les deux concordent à moins de { "1e-9" } dB sur chaque ligne (pire cas mesuré { "7.11e-14" } dB, c'est-à-dire des arrondis en virgule flottante)

# text
# c1: lunar-jamming
seg-dbe54e7cc800 = <b>MODELLED</b> Le rapport <c1/> ne repose plus son contour de déni sur un seul scalaire. Il émet la distribution mesurée complète du C/N₀ du signal utile sur le tableau par satellite. Référence indépendante (InternalConsistency) : cohérence interne par rapport aux propres fonctions directes du moteur, ce qui est tout ce que cette capacité peut honnêtement revendiquer. Chaque point du contour est une inversion en forme close, et chaque inversion est contrôlée en renvoyant sa réponse dans la fonction DIRECTE avec laquelle les propres lignes du rapport ont été évaluées : la colonne J/S par jamming::effective_cn0_dbhz (qui doit retourner tracking_threshold_dbhz à moins de { "1e-9" } dB-Hz), la colonne de distance de sécurité

# text
# c1: kshana kinds --json
seg-d48926e62856 = MODELLED : la constellation illustrative, la PIRE / puissance du brouilleur / gains d'antenne / température de bruit représentatifs, et l'absence d'ombrage par le terrain, de multitrajet, de dynamique de CAG et d'annulation adaptative. (catalogue des types de scénario (<c1/>))

# text
seg-c455dbcb9f8c = MODELLED. La constellation est la géométrie illustrative de classe Moonlight/LCNS à sources publiques (pas l'éphéméride réelle ; aucune affiliation ni aval n'est sous-entendu), et le modèle d'interférence est un bilan de liaison : pas d'ombrage du brouilleur par le terrain (un effet du premier ordre en terrain polaire sud), pas de multitrajet, pas de dynamique proche/lointain de la CAG, pas d'annulation adaptative, pas d'hystérésis acquisition-suivi. (commentaire du fichier de scénario, lignes { "26" } à { "30" })

# text
seg-da57cc7f1aa4 = Le brouillage RF de la navigation en surface lunaire (J/S par satellite) est MODELLED, et non vérifié : il est contrôlé par rapport à une implémentation distincte dans ce même code source, indépendante de l'unité testée mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-dba1589d3c1e = Le contour de déni lunaire avec bande d'incertitude issue de la dispersion mesurée du C/N₀ est MODELLED, et non vérifié : il est contrôlé par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-a2889fb2b42a = Page de sujet : <a1>integrations.md</a1>

# text
seg-03b50b21e5a8 = <s1>Précédent</s1>lunar-interop-export

# text
seg-02568469f628 = <s1>Suivant</s1>lunar-joint-od-clock
