# docs--kinds-constellations-coverage-and-geometry: translations (fr)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Type

# text
seg-e7dad1a1ecba = Positionnement autour de n'importe quel corps du système solaire : un orbiteur ou un atterrisseur de surface autour d'un corps central choisi par son nom (Mars, la Lune, Europe, Ganymède, Titan et le reste du catalogue du système solaire), naviguant avec des pseudodistances à sens unique issues d'une petite constellation de navigation de Walker autour du corps (orbites à deux corps avec la dérive séculaire J2 propre au corps, une horloge utilisateur inconnue) et, facultativement, une mesure de distance aller-retour en espace lointain depuis la Terre, sans horloge, dont la direction et la distance proviennent de l'éphéméride analytique du système solaire à chaque époque. Les lignes de visée sont bloquées par la sphère moyenne du corps, et un utilisateur en surface a aussi besoin du masque d'élévation. Par époque : relais en vue, si la Terre est au-dessus du limbe, le GDOP et le PDOP de la constellation seule (dilution de précision géométrique et de position), l'incertitude formelle de position à un sigma avec et sans la ligne de la Terre, et l'erreur d'une solution des moindres carrés de Gauss-Newton initialisée, dans chaque cas ; sur l'exécution : disponibilité, visibilité de la Terre, PDOP médian, erreur efficace et sigma formel médian, ainsi que le temps de lumière Terre-corps, l'aller-retour, le retard de Shapiro et la séparation par rapport au Soleil à l'époque. MODELLED : les orbites des relais, les niveaux de bruit et le modèle de mesure instantané sont des choix de modélisation, non validés par rapport aux données de navigation d'une mission ; les constantes du corps sont les valeurs publiées citées dans body.rs, et la géométrie de la Terre hérite des étiquettes de l'éphéméride du système solaire.

# attr:alt
seg-6f341acbe994 = Le graphique que le moteur écrit pour scenarios/mars-orbit-pnt.toml, type de scénario body-pnt

# text
seg-de173c9f4034 = Conception de constellations à grande échelle : motifs Walker DELTA et Walker STAR dans la convention i: T/P/F (nœuds répartis sur { "360" } ou { "180" } deg, espacement dans le plan { "360" }<em>P/T, décalage de phase entre plans { "360" }</em>F/T), listes d'éléments explicites et conceptions à plusieurs coquilles, plusieurs constellations dans une même exécution, autour de la Terre, de la Lune, de Mars ou de toute autre planète, de Pluton ou d'une lune majeure, à l'aide des constantes du module body (les mêmes que celles utilisées par les types de scénario solar-system et body-pnt). PRÉRÉGLAGES issus d'éléments nominaux publiés : gps-baseline et gps-expandable (les { "24" } emplacements et les six paires extensibles avant/arrière du GPS Standard Positioning Service Performance Standard, 5e édition { "2020" }, tableaux 3.2-1 à 3.2-3), galileo (Walker 24/3/1 à { "29 599.801" } km et { "56" } deg, Galileo Open Service Service Definition Document édition { "1.1" } tableaux { "1" } et { "23" }), beidou et beidou-meo (Walker 24/3/1 à { "21 528" } km et { "55" } deg plus trois satellites géostationnaires à { "80" }, { "110.5" } et { "140" } deg E et trois satellites géosynchrones inclinés à { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } section { "4.1" } ; la phase MEO et le croisement géosynchrone incliné à { "118" } deg E sont modélisés parce que la norme ne les indique pas) et glonass (24/3/1 à { "19 100" } km et { "64.8" } deg d'après la formule d'emplacement du GLONASS Interface Control Document édition { "5.1" } section { "5.2" }). COUVERTURE ET DILUTION DE PRÉCISION : sur une grille de latitude/longitude et une fenêtre échantillonnée avec un masque d'élévation, le nombre de satellites en vue, GDOP, PDOP, HDOP et VDOP par cellule, la disponibilité (un point fixe dont le PDOP est inférieur ou égal à un seuil, { "6" } par défaut) par cellule, globalement (pondérée par la surface) et au pire site, avec une horloge de récepteur par constellation sauf si clock = "common". Cela passe à l'échelle de milliers de satellites : la visibilité est un produit scalaire par rapport au demi-angle de couverture de chaque satellite, et les satellites sont répartis en bandes par latitude du point sous-satellite à chaque époque, de sorte qu'une ligne de la grille ne teste que ceux qui peuvent être en vue ; le rapport compte les tests de paires économisés. Le JSON contient les cartes de la grille et des traces au sol sous-échantillonnées par satellite. VALIDATED : le générateur Walker par rapport au tableau { "23" } du SDD Galileo OS et à la formule d'emplacement de l'ICD GLONASS, le préréglage GPS par rapport à la colonne publiée des passages à l'équateur du tableau 3.2-1 du SPS PS, et la distribution mondiale du HDOP de la référence de base GPS par rapport à l'annexe B du SPS PS (médiane { "0.94" }, { "95" } % { "1.25" }, moyenne { "0.96" }, tolérance { "0.03" }). MODELLED : orbites à deux corps avec J2 séculaire facultatif, un corps sphérique, visibilité géométrique seulement (ni puissance de signal, ni état de santé, ni relief), et la phase relative entre différents systèmes, qui n'est l'instantané d'aucune date réelle.

# attr:alt
seg-899e728ad9bd = Le graphique que le moteur écrit pour scenarios/leo-pnt-mega-shell.toml, type de scénario constellation-design

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Éphéméride et trace au sol : propager un satellite (TLE→SGP4 ou orbite analytique) et émettre son état TEME/GCRS (position + vitesse), sa position ITRF/ECEF, la latitude/longitude/altitude sous-satellite WGS-84, et, à chaque pas, l'azimut/l'élévation/la distance de la station et le taux de variation de distance (Doppler). Le satellite provient d'un <c1/> ou d'une <c2/> analytique avec son <c3/> (un <c4/> l'emporte lorsque les deux sont donnés) ; avec un <c5/>, un <c6/> remplace l'époque propre du TLE comme t = { "0" }.

# attr:alt
seg-0fd3c58fde09 = Le graphique que le moteur écrit pour scenarios/ephemeris.toml, type de scénario ephemeris

# text
seg-3f749aef8d89 = PNT martien en espace lointain : une constellation simulée de relais MARCONI (relais aréostationnaires + inclinés diffusant à sens unique + relayant en aller-retour vers une station en espace lointain) navigue pour un utilisateur de référence (transfert | lmo | surface) grâce à l'estimateur conjoint de fusion radiométrique à sens unique/aller-retour. Rapporte par époque la géométrie/visibilité, le RMS atteint par rapport à la vérité, et la covariance formelle (position à 1σ / 3σ) — une figure de mérite simulée honnête, PAS un niveau de protection certifié.

# attr:alt
seg-c564dca90854 = Le graphique que le moteur écrit pour scenarios/mars-pnt-lmo.toml, type de scénario mars-pnt

# text
seg-cb4262b66b8f = Disponibilité GNSS + DOP à partir d'une constellation orbitale (Walker / TLE / RINEX).

# attr:alt
seg-3b652c0da6de = Le graphique que le moteur écrit pour scenarios/orbit-rinex.toml, type de scénario orbit

# text
seg-a4bdfc291fce = Prévision des passages de stations au sol : les passages de visibilité dans le domaine temporel (AOS/TCA/LOS, élévation apparente maximale, durée) d'une orbite circulaire, sous forme d'éléments moyens SGP4 au début de la fenêtre, au-dessus d'une station située au-dessus d'un masque d'élévation sur une fenêtre, avec le temps d'accès total. Propagation SGP4/SDP4 sur le référentiel terrestre IAU 2006/2000A (UT1 - UTC et mouvement du pôle facultatifs), réfraction troposphérique UIT-R P.834-9 et temps de trajet lumineux de la liaison descendante (tous deux activés par défaut), franchissements résolus à { "1e-7" } s et culmination par recherche par section dorée. La géométrie des passages est VALIDATED par rapport à Orekit { "13.1.8" } à des stations au niveau de la mer ; l'orbite et la station du scénario sont des entrées illustratives.

# attr:alt
seg-a09be8c586e3 = Le graphique que le moteur écrit pour scenarios/passes.toml, type de scénario passes

# text
seg-0549bc926a9b = Le système solaire entier à une époque donnée, pour le PNT (positionnement, navigation et synchronisation temporelle) autour de n'importe quel corps. Pour le Soleil, les huit planètes, Pluton, la Lune, Phobos, Deimos, Io, Europe, Ganymède, Callisto et Titan, il fournit la position et la vitesse héliocentriques dans l'ICRF (Référentiel céleste international, équatorial J2000), la distance héliocentrique et la longitude et la latitude écliptiques J2000, le paramètre gravitationnel, le rayon équatorial et moyen, J2 lorsqu'il est publié et son rayon de référence, la période de rotation sidérale, le pôle de l'UAI et le méridien d'origine à l'époque, une trace d'orbite échantillonnée sur une révolution (héliocentrique pour les planètes, centrée sur le parent pour les lunes), ainsi que le temps de lumière, la distance aller simple et aller-retour, le retard de Shapiro solaire et la séparation du Soleil depuis un corps observateur (la Terre par défaut) ; les liens from/to supplémentaires reçoivent le même traitement. Positions : les éléments képlériens du JPL de Standish et Williams (Table { "1" } pour { "1800" } apr. J.-C. à { "2050" } apr. J.-C., Tables 2a/2b pour { "3000" } av. J.-C. à { "3000" } apr. J.-C.) avec l'erreur nominale de chaque planète, la série lunaire de Montenbruck & Gill pour la séparation Terre-Lune, les éléments moyens du JPL avec la vitesse de rotation synchrone de l'UAI pour les lunes martiennes et galiléennes, et le modèle de rotation de l'UAI pour Titan. Temps de lumière : la résolution radiométrique par point fixe, l'émetteur étant à sa position retardée ; newtonien, le retard de Shapiro étant indiqué séparément. VALIDATED par rapport à JPL Horizons (DE441) à moins du double de l'erreur nominale : de Mercure à Saturne et la Terre à partir de la Table { "1" } (pire cas { "1.87" } fois le nominal) et les huit planètes à partir des Tables 2a/2b (pire cas { "1.71" } fois), ainsi que le temps de lumière de la Terre à Mars et à Jupiter. MODELLED, chaque ligne étant étiquetée : Uranus et Neptune à partir de la Table { "1" } ({ "2.0" } et { "5.2" } fois l'erreur nominale par rapport à DE441), Pluton (la ligne de { "1992" } ; pas d'erreur indiquée), la Lune et les sept lunes (mesurées par rapport à Horizons, sans borne publiée).

# attr:alt
seg-537aa8010e50 = Le graphique que le moteur écrit pour scenarios/solar-system-tour.toml, type solar-system

# text
seg-4e31c8daf798 = Registre

# text
# c1: docs/kinds/constellations-coverage-and-geometry.md
seg-44bbec836934 = Source : <c1/>

# text
seg-34a6079984a7 = Constellations, couverture et géométrie (famille de types de scénario)

# text
seg-6800289a282d = { "7" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
# c1: kshana scenarios/orbit-gnss-challenged.toml
seg-d95cc2c1e798 = Pages thématiques : <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. En exécuter une : <c1/>. Toutes les familles : <a5>KINDS.md</a5>.

# attr:alt
seg-f044822c2fab = Planche-contact des graphiques que le moteur écrit pour les types de la famille Constellations, couverture et géométrie

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-e2450f89bcc6 = Éphéméride et trace au sol : propager un satellite (TLE→SGP4 ou orbite analytique) et émettre son état TEME/GCRS (position + vitesse), sa position ITRF/ECEF, sa latitude/longitude/altitude sous-satellite WGS-84, et par pas st

# text
seg-d021c1b23dbc = Conception de constellation à grande échelle : motifs Walker DELTA et Walker STAR dans la convention i: T/P/F (nœuds répartis sur { "360" } ou { "180" } deg, espacement dans le plan { "360" }<em>P/T, décalage de phase inter-plans { "360" }</em>F/T), explicit

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-f6914ea43dba = Le système solaire entier à une époque donnée, pour le PNT (positionnement, navigation et synchronisation temporelle) autour de n'importe quel corps.

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-d71a07d8a59e = Positionnement autour de n'importe quel corps du système solaire : un orbiteur ou un atterrisseur de surface autour d'un corps central choisi par son nom (Mars, la Lune, Europe, Ganymède, Titan et le reste du catalogue du système solaire), navi

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
seg-f6b22521b4a4 = PNT de l'espace lointain sur Mars : une constellation de relais MARCONI simulée (relais aréostationnaires + inclinés émettant en sens unique + relayant en bidirectionnel vers une station d'espace lointain) fait naviguer un utilisateur de référence (transfert / l

# text
seg-cc85d9962c25 = Prédiction de passages sur station au sol : les passages de visibilité dans le domaine temporel (AOS/TCA/LOS, élévation apparente maximale, durée) d'une orbite circulaire, sous forme d'éléments moyens SGP4 au début de la fenêtre, au-dessus d'une station

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
# c9: sigma_uere_m
# c10: constellations
# c11: epoch
# c12: export_sp3
# c13: export_omm
# c14: export_oem
# c15: skyline
seg-a7bd3325080c = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Facultatifs : <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-5e8a5e611ba9 = <b>Registre :</b> MODELLED { "4" } · VALIDATED { "4" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>orbit</a1>.

# text
# c1: tle|orbit+epoch
# c2: step_s
# c3: duration_s
# c4: station
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: carrier_hz
# c9: eop_finals2000a
seg-968c1512151e = Champs obligatoires : <c1/>. Facultatifs : <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-8c5e41cef6fd = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>ephemeris</a1>.

# text
# c1: body
# c2: duration_s
# c3: step_s
# c4: mask_deg
# c5: pdop_threshold
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: clock
# c12: j2
# c13: track_points
# c14: max_tracks
# c15: constellation
seg-47aaf1afd6ec = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-bacf2a133146 = <b>Registre :</b> MODELLED { "1" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>constellation-design</a1>.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-e99c2a83034e = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-d91ded1df3a2 = <b>Registre :</b> MODELLED { "2" } · VALIDATED { "3" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>solar-system</a1>.

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-fe02605b130e = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-12bc4b4b4631 = <b>Registre :</b> MODELLED { "1" } · VALIDATED { "1" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>body-pnt</a1>.

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-bee590b4c9e7 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-c0394ad71cfe = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>mars-pnt</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-352823f8c5ac = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-bb4fa18e50a6 = <b>Registre :</b> MODELLED { "2" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>passes</a1>.

# text
seg-490ec99e2a38 = <s1>Précédent</s1>Horloges, synchronisation temporelle et holdover

# text
seg-90ff7426b999 = <s1>Suivant</s1>Mesures GNSS, positionnement et intégrité
