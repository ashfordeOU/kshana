# docs--kind-pvt: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-8e845ce908ee = Type de scénario du moteur v{ $version }, famille <a1>Mesures GNSS, positionnement et intégrité</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-f6b7ca020692 = Page de famille : <a1>Mesures GNSS, positionnement et intégrité</a1>

# text
seg-f4cf8b629797 = Page thématique : <a1>INTEGRITY.md</a1>

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry et check : une simulation de Monte-Carlo initialisée par une graine (N = { "20,000" } époques par géométrie, sigma = { "1.5" } m, graine ChaCha8 { "36" } + i) de la propre position calculée par moindres carrés itérés du moteur (pvt::solve_spp, poids unitaires, résolue à partir de la vraie position) sur Tests : <a1>uere_dop_monte_carlo.rs</a1>.

# text
# c1: docs/kinds/by-kind/pvt.md
seg-aab2f85048b7 = Source : <c1/>

# text
# c1: pvt
seg-56f864d32367 = <c1/> (type de scénario)

# text
seg-b7b67e03f125 = Positionnement ponctuel sur observations réelles : résoudre la position d'un récepteur à partir d'un fichier d'observation RINEX { "3" } et d'un fichier de navigation diffusée (pseudodistances de code, éphéméride diffusée, ionosphère de Klobuchar, troposphère de Saastamoinen/Niell), éventuellement vérifié par rapport à une coordonnée relevée.

# text
# c1: scenarios/pvt-abmf.toml
seg-79d2a463393d = Une exécution de <c1/> se résume ainsi : pvt 55bdd18628e1 | { "11" } sat nav | 2/3 epochs solved | mean { "9.0" } sats, PDOP { "1.8" } | 3D error RMS { "5.74" } m (max { "7.12" } m)

# text
# c1: obs_rinex
# c2: nav_rinex
seg-fd22bc5c2b67 = Champs obligatoires : <c1/>, <c2/>

# text
# c1: truth_ecef
# c2: apriori_ecef
# c3: mask_deg
# c4: dual_frequency
seg-4b39ee73d65d = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/pvt-abmf.toml
seg-4f02bdcbc7c7 = L'exemple <c1/> définit, entre autres :

# text
seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

# text
seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

# text
seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

# attr:alt
seg-d76d59644d84 = Le graphique que le moteur écrit pour scenarios/pvt-abmf.toml, type de scénario pvt

# text
seg-e6f678eeb384 = <b>MODELLED</b> Filtre de Hatch sans divergence (code sans ionosphère porté par la porteuse sans ionosphère, fenêtre de N époques, redémarrage sur perte d'accrochage, saut sans géométrie ou trou) dans l'assemblage de positionnement ponctuel précis

# text
seg-5a42823318a8 = <b>VALIDATED</b> Position satellite ECEF képlérienne issue de l'éphéméride diffusée IS-GPS-200 / Galileo-OS / BeiDou-OS à partir d'un enregistrement de navigation RINEX-3 analysé. Référence indépendante (ExternalDataset) : eph2pos() de RTKLIB v2.4.2-p13 compilé à partir du source C (T. Takasu, BSD-2-Clause) — une implémentation indépendante de l'IS-GPS-200/SIS-ICD, alimentée par les mêmes enregistrements de navigation RINEX-3 ; position ECEF du satellite concordante à ~{ "62" } nm. (L'interpolation de l'éphéméride précise SP3 est vérifiée séparément — voir « Interpolation de l'éphéméride précise SP3 »)

# text
seg-51cac2f918e0 = Page de sujet : <a1>POSITIONING.md</a1>

# text
seg-8ea056f1d7e0 = <s1>Précédent</s1>passes

# text
seg-d1dc82bbfb73 = <s1>Suivant</s1>quantum-anomaly-detect
