# docs--kinds-mission-analysis-links-and-space-operations: translations (fr)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Type

# text
seg-cb9447893c7f = Un satellite au-dessus d'une station : la distance oblique, l'élévation et le Es/N0 de chaque passage le long du passage, le MODCOD DVB-S2 choisi à chaque pas (seuils du Tableau { "13" } de l'ETSI EN { "302" } 307-1 plus une marge d'implémentation) et le volume de données que l'ACM transfère par rapport à la référence de base à codage constant qui boucle au masque. MODELLED.

# attr:alt
seg-046f69293874 = Le graphique que le moteur écrit pour scenarios/acm-link.toml, type de scénario acm-link

# text
seg-7eff466eb018 = Contrôle d'attitude d'un engin spatial : une manœuvre de pointage inertiel d'un corps rigide avec trois roues de réaction équilibrées ou plus sous rétroaction MRP (L = -K sigma - P omega), couples de roue de norme minimale écrêtés à la limite de chaque moteur, RK4 avec maintien d'ordre zéro ; éventuellement bouclé sur un EKF multiplicatif à partir d'un gyroscope simulé (marche aléatoire d'angle et de vitesse) et d'un viseur d'étoiles. Rapporte le temps d'établissement, l'erreur de pointage finale et de crête, la vitesse et le couple de roue de crête, la fraction saturée, la dérive du moment cinétique et, avec l'estimateur, son erreur d'attitude et son NEES. La boucle d'état vrai est VALIDATED par rapport à Basilisk { "2.9.1" } ; l'estimateur est MODELLED.

# attr:alt
seg-08c624d5324d = Le graphique que le moteur écrit pour scenarios/aocs-slew.toml, type de scénario aocs

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Rapport cyclique d'ouverture : le partage du temps entre navigation et communications qu'implique un plan de contacts pour un ensemble d'ouvertures orientables. Prend un plan de contacts (une liste de fenêtres <c1/> aos_s/los_s, chacune demandant la navigation ou les communications — le même vocabulaire aos_s/los_s qu'émet le prédicteur <c2/>), un nombre d'ouvertures, et une POLITIQUE D'ARBITRAGE (priorité à la navigation par défaut, ou priorité aux communications, ou premier arrivé premier servi sans préemption), et rapporte le rapport cyclique de navigation, le rapport cyclique de communications, le rapport cyclique d'inactivité, et l'indisponibilité par session — le temps de contact qu'une session a demandé et qu'aucune ouverture n'a servi. Un balayage d'intervalles exact sur les bornes des fenêtres, de sorte que des fenêtres contiguës n'entrent jamais en conflit et qu'aucune seconde d'ouverture n'est comptée deux fois ; les secondes d'ouverture de navigation, de communications et d'inactivité sont cumulées indépendamment et se referment sur apertures*horizon_s. Le rapport énonce la politique résolue, sa définition complète, et les définitions du rapport cyclique et de l'indisponibilité, car un rapport cyclique cité sans sa politique d'arbitrage n'est pas reproductible. Arithmétique d'ordonnancement MODELLED : aucun temps d'orientation / de réaccord / de changement n'est imputé lorsqu'une ouverture change de service ou de session, aucun volume de données, état de tampon, budget énergétique ni fermeture de liaison n'entre dans la décision, et les fenêtres de contact sont des entrées — leur géométrie est ce qui les a produites. Ce n'est pas un produit d'ordonnancement de segment sol.

# attr:alt
seg-a8b38ed8e029 = Le graphique que le moteur écrit pour scenarios/aperture-duty-cycle.toml, type de scénario aperture-duty-cycle

# text
seg-34d041d6bd9f = Ascension plane en virage gravitationnel d'un véhicule à plusieurs étages au-dessus d'une Terre sphérique sans rotation, à travers l'US Standard Atmosphere { "1976" } (montée verticale, coup de tangage, poussée selon la vitesse), intégrant les pertes de gravité, de traînée, de pilotage et de contre-pression et vérifiant le dv idéal moins les pertes par rapport à la vitesse de fin de combustion ; max-Q, accélération de crête et état de fin de combustion. MODELLED.

# attr:alt
seg-ccf2185b0b5e = Le graphique que le moteur écrit pour scenarios/ascent-losses.toml, type de scénario ascent-losses

# text
seg-62c0dda9fc56 = Bilan d'erreur d'attitude et de pointage à 3 DOF : le couple perturbateur de gradient de gravité au pire cas ((3/2)(μ/R³)ΔI) et un bilan d'erreur de pointage en somme quadratique sur des contributeurs nommés à 1σ (bruit de capteur, gigue des roues de réaction, thermique, alignement) avec le terme dominant, pour une altitude d'orbite + un écart d'inertie du corps. Bilan AOCS scalaire MODELLED — un complément avant matériel à Basilisk/42, et non une simulation de boucle de commande / à 6 DoF / de modes flexibles.

# attr:alt
seg-ad0e72e3b688 = Le graphique que le moteur écrit pour scenarios/attitude-budget.toml, type de scénario attitude-budget

# text
seg-be4e928a5865 = Planification des contacts sol pour plusieurs satellites au-dessus de plusieurs stations : fenêtres d'accès apparentes (SGP4, référentiel terrestre IAU 2006/2000A, réfraction ITU-R P.834, temps de lumière), volume de données ACM DVB-S2 de chaque passage (seuils du tableau { "13" } de ETSI EN { "302" } 307-1) et un planning sans conflit (un satellite par antenne avec un temps de retournement, une station par satellite, livraison pondérée par priorité plafonnée à chaque arriéré) obtenu par un algorithme glouton à valeur marginale, une référence de base du premier arrivé et un branch and bound exact sur de petits ensembles, avec l'écart d'optimalité du glouton. MODELLED.

# attr:alt
seg-e26b549579e2 = Le graphique que le moteur écrit pour scenarios/contact-schedule.toml, type de scénario contact-schedule

# text
seg-b843e2e0a4ee = Entrée atmosphérique à masse ponctuelle et 3 degrés de liberté au-dessus d'une Terre ou d'un Mars sphérique en rotation (balistique ou portante à inclinaison constante), RK4, à travers US76, une atmosphère exponentielle ou l'atmosphère martienne, avec un échauffement convectif au point d'arrêt de Sutton-Graves (NASA TR R-376) : décélération, flux thermique et pression dynamique de pointe, charge thermique, portée au sol, un contrôle d'énergie en référentiel tournant et la forme fermée d'Allen-Eggers à côté. La décélération de pointe est vérifiée par rapport au nominal publié de Stardust ; l'échauffement est MODELLED.

# attr:alt
seg-dbb618cd6357 = Le graphique que le moteur écrit pour scenarios/entry-heating-stardust.toml, type de scénario entry-heating

# text
seg-47b4aea6ed01 = Géométrie d'empreinte et de couverture d'une charge utile d'observation de la Terre (triangle spatial SMAD) : rayon angulaire de la Terre, largeur de fauchée, distance d'échantillonnage au sol au nadir, accès maximal hors nadir, période circulaire, période nodale J2 et espacement des traces au sol à l'équateur avec un indicateur de couverture contiguë, pour une altitude d'orbite, une inclinaison (héliosynchrone par défaut) et un FOV/IFOV de capteur. Géométrie MODELLED à Terre sphérique (sans radiométrie/FTM/atmosphère/gigue/réflexion spéculaire) ; espacement des nœuds R_e·(ω − Ω̇)·T_nodal avec des taux séculaires J2 au premier ordre.

# attr:alt
seg-c2a8332f2ee2 = Le graphique que le moteur écrit pour scenarios/eo-coverage.toml, type de scénario eo-coverage

# text
seg-816bd5a5808a = Radiométrie et qualité d'image d'un imageur au nadir : luminance à l'ouverture d'une scène lambertienne, équation de la caméra, signal et bruit de grenaille/d'obscurité/de lecture/de quantification et SNR ; la FTM du système à Nyquist (diffraction x détecteur x filé x gigue), la réponse relative de bord qui en découle, Q = lambda F/p et le NIIRS GIQE version { "4" } sans compensation de FTM. MODELLED.

# attr:alt
seg-bf7b52f7a01e = Le graphique que le moteur écrit pour scenarios/eo-radiometry.toml, type de scénario eo-radiometry

# text
seg-7a4e6215a488 = Géométrie de lancement et d'ascension à deux corps : azimut(s) de lancement (sin Az = cos i / cos lat), inclinaison minimale atteignable, vitesse circulaire, gain de la rotation de la Terre vers l'est, Δv de changement de plan en dogleg lorsque l'inclinaison cible est inférieure à la latitude du site, et nombre d'opportunités de lancement quotidiennes. Géométrie MODELLED à Terre sphérique (sans correction du triangle des vitesses de Terre en rotation, sans modèle de pertes d'ascension/de traînée).

# attr:alt
seg-9696283a95ae = Le graphique que le moteur écrit pour scenarios/launch-window.toml, type de scénario launch-window

# text
seg-953188c11165 = Bilan de liaison unidirectionnel selon l'équation de liaison CCSDS { "401" } / DSN 810-005 : affaiblissement en espace libre, C/N₀, Eb/N₀, marge et fermeture pour une PIRE d'émission, un G/T de réception, une distance, un débit de données et une bande (s|x|ka), par rapport à un Eb/N₀ requis. Un calcul d'ingénierie déterministe à partir des entrées fournies (et non la fiche technique d'un terminal étalonné).

# attr:alt
seg-bd375631bc7e = Le graphique que le moteur écrit pour scenarios/link-budget.toml, type de scénario link-budget

# text
seg-dbffff25b57f = Passerelle d'interopérabilité CCSDS OEM : importe un message d'éphéméride orbitale produit par un outil externe de dynamique de vol (GMAT/Orekit/STK émettent tous de l'OEM) et rapporte ses segments/objets/référentiels/étendue d'époques ainsi qu'un contrôle de cohérence des vitesses ; sans entrée, elle fait l'aller-retour d'une orbite de référence générée et rapporte la fidélité import↔export. Contrôle d'ingestion structurel/physique MODELLED, et NON une vérification de la précision d'orbite de la source.

# attr:alt
seg-5db5a7c812ca = Le graphique que le moteur écrit pour scenarios/oem-interop.toml, type de scénario oem-interop

# text
seg-039f77066d97 = Corridor de rentrée balistique d'Allen-Eggers : décélération maximale (indépendante du coefficient balistique, V_e^{ "2" } sin|γ|/(2eH)), vitesse et altitude au pic de g, et vitesse au pic d'échauffement, pour une vitesse d'entrée, un angle de trajectoire et un coefficient balistique donnés dans une atmosphère exponentielle, plus une intégration planaire en masse ponctuelle de la même entrée balistique avec la gravité, la courbure de la Terre et l'atmosphère standard américaine { "1976" } (décélération maximale, vitesse, altitude et instant du pic). Entrée balistique (sans portance) MODELLED ; la sortie d'échauffement est la VITESSE au pic d'échauffement, et non un flux thermique (pas de modèle aérothermique ni de protection thermique).

# attr:alt
seg-b0109481e8ff = Le graphique que le moteur écrit pour scenarios/reentry.toml, type reentry

# text
seg-de2448d74c2b = Encapsulation du protocole CCSDS 133.0-B Space Packet : encoder un flux synthétique de paquets TM/TC (en-tête primaire de 6 octets + champ de données) et rapporter le décodage d'en-tête de chaque paquet, le total d'octets et un aller-retour encodage↔décodage exact. Encapsulation à disposition de bits exacte et déterministe — la couche d'interopérabilité des formats de paquets d'agence ; PAS une attestation de respect de la norme (pas de logique d'en-tête secondaire, de CRC ou de segmentation au-delà des indicateurs).

# attr:alt
seg-af1cf9aa9938 = Le graphique que le moteur écrit pour scenarios/space-packet.toml, type space-packet

# text
seg-4e31c8daf798 = Registre

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
# c1: docs/kinds/mission-analysis-links-and-space-operations.md
seg-69ee217ed8e0 = Source : <c1/>

# text
seg-f5091cbeecbf = Analyse de mission, liaisons et opérations spatiales (famille de types de scénario)

# text
seg-d0eea6d9d1ad = { "14" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
# c1: kshana scenarios/launch-window.toml
seg-6481dabc9458 = Pages thématiques : <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. En exécuter une : <c1/>. Toutes les familles : <a4>KINDS.md</a4>.

# attr:alt
seg-d6c5a581ffaf = Planche-contact des graphiques que le moteur écrit pour les types de la famille Analyse de mission, liaisons et opérations spatiales

# text
seg-8d65a4a1948d = Géométrie de lancement et de montée à deux corps : azimut(s) de lancement (sin Az = cos i / cos lat), inclinaison minimale atteignable, vitesse circulaire, gain vers l'est dû à la rotation de la Terre, Δv de changement de plan en dogleg lorsque la ta

# text
seg-dd47e755d262 = Montée plane en virage gravitationnel d'un lanceur multi-étages au-dessus d'une Terre sphérique non tournante à travers l'atmosphère standard américaine { "1976" } (montée verticale, coup de tangage, poussée suivant la vitesse), intégrant la gra

# text
seg-cc88f37328a3 = Corridor de rentrée balistique d'Allen-Eggers : décélération maximale (indépendante du coefficient balistique, V_e^{ "2" } sin/γ//(2eH)), vitesse et altitude au pic de g, et vitesse au pic d'échauffement, pour une vitesse d'entrée

# text
seg-8ad7c34d8c25 = Entrée atmosphérique en masse ponctuelle à 3 degrés de liberté au-dessus d'une Terre ou d'un Mars sphérique en rotation (balistique ou portante à inclinaison constante), RK4, à travers US76, une atmosphère exponentielle ou l'atmosphère martienne, avec Sutton-Graves stagnat

# text
seg-efe896d3f43b = Empreinte de charge utile d'observation de la Terre et géométrie de couverture (triangle spatial SMAD) : rayon angulaire de la Terre, largeur de fauchée, distance d'échantillonnage au sol au nadir, accès maximal hors nadir, période circulaire, période nodale J2

# text
seg-d3d9652fd8a0 = Radiométrie et qualité d'image d'un imageur au nadir : luminance à l'ouverture d'une scène lambertienne, équation de la caméra, signal et bruit de grenaille/d'obscurité/de lecture/de quantification et SNR ; la FTM du système à Nyquist (diffraction

# text
seg-1940d5c75a98 = Bilan d'erreur d'attitude et de pointage à 3 degrés de liberté : le couple perturbateur de gradient de gravité le plus défavorable ((3/2)(μ/R³)ΔI) et un bilan d'erreur de pointage en somme quadratique sur des contributeurs nommés à 1σ (bruit de capteur, roues

# text
seg-e00d18fbb52b = Contrôle d'attitude d'un engin spatial : un basculement de pointage inertiel d'un corps rigide avec trois roues à réaction équilibrées ou plus sous rétroaction MRP (L = -K sigma - P omega), couples de roue de norme minimale écrêtés à chaque

# text
seg-496fa280de7b = Bilan de liaison à sens unique selon l'équation de liaison CCSDS { "401" } / DSN 810-005 : affaiblissement en espace libre, C/N₀, Eb/N₀, marge et fermeture pour une PIRE d'émission, un G/T de réception, une distance, un débit de données et une bande (s/x/ka) par rapport à un

# text
seg-f0aca7ea1ffa = Un satellite au-dessus d'une station : distance oblique, élévation et Es/N0 de chaque passage le long du passage, le MODCOD DVB-S2 choisi à chaque pas (seuils de la Table { "13" } de l'ETSI EN { "302" } 307-1 plus une marge d'implémentation)

# text
seg-44c4890ba07e = Planification des contacts au sol pour plusieurs satellites au-dessus de plusieurs stations : fenêtres d'accès apparentes (SGP4, référentiel terrestre IAU 2006/2000A, réfraction ITU-R P.834, temps de lumière), le volume de données ACM DVB-S2 o

# text
seg-19ab136e9f9b = Rapport cyclique d'ouverture : le partage du temps entre navigation et communications qu'implique un plan de contacts pour un ensemble d'ouvertures orientables.

# text
seg-ee0c649ca8b2 = Encapsulation du protocole CCSDS 133.0-B Space Packet : encoder un flux synthétique de paquets TM/TC (en-tête primaire de 6 octets + champ de données) et rapporter le décodage d'en-tête de chaque paquet, le total d'octets et un aller-retour encodage↔déco

# text
seg-e561f3a749db = Passerelle d'interopérabilité CCSDS OEM : importer un Orbit Ephemeris Message produit par un outil externe de dynamique du vol (GMAT/Orekit/STK émettent tous de l'OEM) et rapporter ses segments/objets/référentiels/intervalle d'époques ainsi que

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-1f074d7beccc = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-8f65824c39c5 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>launch-window</a1>.

# text
# c1: stages
# c2: payload_kg
# c3: drag_coefficient
# c4: reference_area_m2
# c5: kick_altitude_m
# c6: kick_angle_deg
# c7: kick_duration_s
# c8: step_s
seg-2926bde689d3 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-66f6489411d0 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>ascent-losses</a1>.

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-481ce1d98bc7 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-fff98550eb48 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>reentry</a1>.

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-9cf8d4b6064f = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-84e1bddcbc95 = <b>Registre :</b> MODELLED { "1" } · VALIDATED { "1" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>entry-heating</a1>.

# text
# c1: altitude_km
# c2: half_fov_deg
# c3: ifov_microrad
# c4: max_off_nadir_deg
# c5: inclination_deg
seg-eab43348803e = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-9c6ce756a89a = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>eo-coverage</a1>.

# text
# c1: altitude_m
# c2: focal_length_m
# c3: aperture_m
# c4: pixel_pitch_um
# c5: wavelength_um
# c6: bandwidth_um
# c7: fill_factor
# c8: smear_px
# c9: jitter_px_rms
# c10: reflectance
# c11: solar_irradiance_w_m2_um
# c12: sun_zenith_deg
# c13: atmospheric_transmittance
# c14: path_radiance_w_m2_sr_um
# c15: optics_transmittance
# c16: integration_s
# c17: quantum_efficiency
# c18: dark_current_e_s
# c19: read_noise_e
# c20: full_well_e
# c21: adc_bits
seg-cd84a7bdbe57 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-320d724ac797 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>eo-radiometry</a1>.

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-905487bf50f1 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-14511e367361 = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>attitude-budget</a1>.

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
# c6: duration_s
# c7: dt_s
# c8: sample_s
# c9: omega0_rad_s
# c10: pointing_threshold_deg
# c11: estimator
seg-540fa1932dad = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Facultatifs : <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-6d2e9b9ce87f = <b>Registre :</b> MODELLED { "1" } · VALIDATED { "1" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>aocs</a1>.

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-3345731b5729 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-f8b896b81014 = <b>Registre :</b> MODELLED { "1" } · VALIDATED { "1" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>link-budget</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellite
# c8: station
seg-e38e356f4b71 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-eed876ed5aab = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>acm-link</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-5fddd2460fb0 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-58d00faa1eda = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>contact-schedule</a1>.

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-5d4f6861f301 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1e06e06d4325 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>aperture-duty-cycle</a1>.

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-9bb424e01c84 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-688071019c9e = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>space-packet</a1>.

# text
# c1: oem_text
seg-03c06f9fdc85 = Champs obligatoires : aucun. Facultatif : <c1/>.

# text
seg-568c484ce9a0 = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>oem-interop</a1>.

# text
seg-41996765fcf1 = <s1>Précédent</s1>Lunaire et cislunaire

# text
seg-1951c46fe429 = <s1>Suivant</s1>PNT optique
