# docs--kind-moonlight-service-volume: translations (fr)

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-8f8871ac8a0f = Page de sujet : <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Page de sujet : <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/moonlight-service-volume.md
seg-eb9f9a422d38 = Source : <c1/>

# text
# c1: moonlight-service-volume
seg-f8988314faf2 = <c1/> (type de scénario)

# text
seg-28c6a5644152 = Analyse modélisée du volume de service de navigation lunaire à partir d'une constellation ILLUSTRATIVE de classe Moonlight/LCNS en orbite lunaire, à sources publiques (sans affiliation à l'ESA) : balaie une grille sélénographique de latitude/longitude sur un horizon temporel et rapporte le DOP / la couverture / la disponibilité (≥{ "4" } sats ET PDOP < seuil) ainsi qu'une enveloppe généralisée de niveaux de protection ARAIM lunaires (HPL/VPL) sur le volume. La géométrie du DOP RÉUTILISE le noyau VALIDATED par gnss_lib_py (crate::orbit::dop) ; le niveau de protection RÉUTILISE le mécanisme ARAIM lunaire LunaNet LNIS (crate::lunar, σ_URE≈{ "30" } m) et se réduit au niveau de protection existant du pôle sud comme cas particulier. Composition MODELLED : un ensemble de relais képlériens circulaires/elliptiques (et non l'éphéméride réelle LCNS/NRHO à correction différentielle), une Lune à rotation moyenne (sans libration ni pôle en précession). Déterministe (géométrie pure). Aucun TRL, héritage ni aval d'une agence.

# text
# c1: scenarios/moonlight-service-volume.toml
seg-8516d1ded5dd = Une exécution de <c1/> se résume ainsi : moonlight-service-volume | { "8" } sats (illustrative LCNS-class, not affiliated) | { "24" } pts × { "12" } epochs | coverage { "37.8" }% (PDOP<{ "6.0" }) | sats { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL avail { "0.0" }% | MODELLED

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: lat_min_deg
# c7: lat_max_deg
# c8: lat_step_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: lon_step_deg
# c12: horizon_hours
# c13: step_min
# c14: elev_mask_deg
# c15: pdop_threshold
# c16: alert_limit_m
# c17: p_hmi
# c18: perturbed
# c19: sigma_ure_m
# c20: export_site_lat_deg
# c21: export_site_lon_deg
# c22: export_antenna
# c23: ephemeris_path
# c24: planetary_kernel_path
# c25: epoch_utc
# c26: terrain
seg-b59e8773bcb9 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

# text
# c1: scenarios/moonlight-service-volume.toml
seg-0d935e7c43da = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-edb738273a3a = Le graphique que le moteur écrit pour scenarios/moonlight-service-volume.toml, type de scénario moonlight-service-volume

# text
seg-1974d1d64c9c = <b>VALIDATED</b> DOP / couverture / disponibilité lunaires de classe Moonlight + niveaux de protection ARAIM lunaires généralisés sur un volume de service. Référence indépendante (ExternalDataset) : autorité tierce indépendante, propagateur képlérien astro::Orbit d'ANISE { "0.10.2" } (Nyx Space, MPL-2.0) — un chemin de code à deux corps équinoxial distinct du Kepler de Newton-Raphson de kshana ; la position MCI par satellite concorde à <{ "1e-3" } m et le nombre/ensemble de satellites visibles dérivé concorde exactement en chaque point de la grille. Le noyau DOP est validé par gnss_lib_py ; l'intégrité utilise les paramètres publiés de LunaNet/LCNS

# text
seg-47f496c1d603 = <b>VALIDATED</b> Angles de visée topocentriques par satellite (azimut dans le sens horaire à partir du nord, élévation) et distance oblique en un site sélénographique nommé, étant donné le satellite dans le référentiel du site. Référence indépendante (ExternalDataset) : ANISE { "0.10.2" } (Nyx Space, MPL-2.0, exécuté comme outil depuis xval/anise-service-geometry, binaire lunar-look-angles-xval, qui n'appelle aucun code Kshana) : la propre routine d'azimut, d'élévation et de distance d'ANISE (azimuth_elevation_range_sez) à partir de sites construits par son constructeur de latitude-longitude-altitude sur la Lune pck00011 (sphère de { "1737.4" } km), les satellites étant tournés dans MOON_PA_DE440 par moon_pa_de440_200625.bpc. { "768" } échantillons o

# text
# c1: kshana kinds --json
seg-1f12671176ad = Composition MODELLED : un ensemble de relais képlériens circulaires/elliptiques (et non l'éphéméride réelle LCNS/NRHO à correction différentielle), une Lune à rotation moyenne (sans libration ni pôle en précession). (catalogue des types de scénario (<c1/>))

# text
seg-2ff91fe31123 = HONNÊTETÉ : composition MODELLED. La géométrie du DOP est validée PAR RÉUTILISATION du noyau validé ; la composition couverture / disponibilité / intégrité est MODELLED — un ensemble de relais képlériens circulaires/elliptiques (et non une éphéméride LCNS / NRHO { "9" }:{ "2" } à correction différentielle), une Lune à rotation moyenne (sans libration physique ni pôle en précession), et les paramètres d'intégrité LunaNet LNIS publiés. Cela démontre le M du volume de service lunaire (commentaire du fichier de scénario, lignes { "27" } à { "32" })

# text
seg-f3279128de3b = <s1>Précédent</s1>mars-pnt

# text
seg-92cd937a3fb7 = <s1>Suivant</s1>ntn-positioning

seg-e66e2ca31e54 = Page thématique : <a1>MISSION-THREAD-LUNAR.md</a1>

seg-25040e105bf7 = <b>MODELLED</b> Le type et la phase <c1/> : disponibilité des relais et PDOP, visibilité de la Terre et du Soleil et horloge de surface asservie pour chaque site et chaque saison, avec la ligne d'horizon du terrain de <c2/> ; une exécution à site unique égale celle de ce type

seg-6730fa1b9820 = <s1>Précédent</s1>mission-thread
