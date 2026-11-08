# docs--kind-solar-system: translations (fr)

# text
seg-e27476e37522 = Terre

# text
seg-5b561b4fd201 = Mars

# text
seg-59f1f277012b = Jupiter

# text
seg-e6e209ad07e0 = Europe

# text
seg-6f12259c6ec4 = Saturne

# text
seg-11e8c29ecb45 = Type de scénario du moteur v{ $version }, famille <a1>Constellations, couverture et géométrie</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-dae4184bb004 = <b>VALIDATED</b> Le temps de lumière newtonien à sens unique de n'importe quel corps vers n'importe quel autre, reçu à une époque, résolu par le solveur radiométrique de temps de lumière à point fixe (radiometric::light_time_solution, émetteur à sa position retardée) via solar_system::link_o Tests : <a1>solar_system_light_time_preregistered.rs</a1>.

# text
seg-a4f1e7d2041e = Page de famille : <a1>Constellations, couverture et géométrie</a1>

# text
seg-670191cf797f = Page thématique : <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cef32ee7d521 = Page thématique : <a1>CONSTELLATION-DESIGN.md</a1>

# text
seg-4d208b6c0eb8 = jour

# text
seg-3319b18ac61f = et { "1" } autre dans la matrice.

# text
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
# c1: docs/kinds/by-kind/solar-system.md
seg-028ac545e52e = Source : <c1/>

# text
# c1: solar-system
seg-934e7998420c = <c1/> (type de scénario)

# text
seg-0549bc926a9b = Le système solaire entier à une époque donnée, pour le PNT (positionnement, navigation et synchronisation temporelle) autour de n'importe quel corps. Pour le Soleil, les huit planètes, Pluton, la Lune, Phobos, Deimos, Io, Europe, Ganymède, Callisto et Titan, il fournit la position et la vitesse héliocentriques dans l'ICRF (Référentiel céleste international, équatorial J2000), la distance héliocentrique et la longitude et la latitude écliptiques J2000, le paramètre gravitationnel, le rayon équatorial et moyen, J2 lorsqu'il est publié et son rayon de référence, la période de rotation sidérale, le pôle de l'UAI et le méridien d'origine à l'époque, une trace d'orbite échantillonnée sur une révolution (héliocentrique pour les planètes, centrée sur le parent pour les lunes), ainsi que le temps de lumière, la distance aller simple et aller-retour, le retard de Shapiro solaire et la séparation du Soleil depuis un corps observateur (la Terre par défaut) ; les liens from/to supplémentaires reçoivent le même traitement. Positions : les éléments képlériens du JPL de Standish et Williams (Table { "1" } pour { "1800" } apr. J.-C. à { "2050" } apr. J.-C., Tables 2a/2b pour { "3000" } av. J.-C. à { "3000" } apr. J.-C.) avec l'erreur nominale de chaque planète, la série lunaire de Montenbruck & Gill pour la séparation Terre-Lune, les éléments moyens du JPL avec la vitesse de rotation synchrone de l'UAI pour les lunes martiennes et galiléennes, et le modèle de rotation de l'UAI pour Titan. Temps de lumière : la résolution radiométrique par point fixe, l'émetteur étant à sa position retardée ; newtonien, le retard de Shapiro étant indiqué séparément. VALIDATED par rapport à JPL Horizons (DE441) à moins du double de l'erreur nominale : de Mercure à Saturne et la Terre à partir de la Table { "1" } (pire cas { "1.87" } fois le nominal) et les huit planètes à partir des Tables 2a/2b (pire cas { "1.71" } fois), ainsi que le temps de lumière de la Terre à Mars et à Jupiter. MODELLED, chaque ligne étant étiquetée : Uranus et Neptune à partir de la Table { "1" } ({ "2.0" } et { "5.2" } fois l'erreur nominale par rapport à DE441), Pluton (la ligne de { "1992" } ; pas d'erreur indiquée), la Lune et les sept lunes (mesurées par rapport à Horizons, sans borne publiée).

# text
# c1: scenarios/solar-system-tour.toml
seg-bd2d27e1f91d = Une exécution de <c1/> se résume ainsi : Système solaire au 2026-09-28T00:{ "00" }:{ "00" } (JD { "2461311.50080" } TDB), { "18" } corps, observateur Terre Standish Table { "1" } ({ "1800" } apr. J.-C. à { "2050" } apr. J.-C.) Soleil { "0.0000" } au lon { "0.00" } deg temps de lumière { "500.1" } s [origine] Mercure { "0.4666" } au lon { "259.05" } deg temps de lumière { "605.3" } s [VALIDATED] Vénus { "0.7272" } au lon { "348.72" } deg temps de lumière { "182.1" } s [VALIDATED] Terre { "1.0022" } au lon { "4.52" } deg observateur [VALIDATED] Lune { "1.0046" } au lon { "4.56" } deg temps de lumière { "1.3" } s [MODELLED] Mars { "1.5544" } au lon { "83.81" } deg temps de lumière { "841.1" } s [VALIDATED] Phobos { "1.5545" } au lon { "83.81" } deg temps de lumière { "841.2" } s [MODELLED] Deimos { "1.5545" } au lon { "83.80" } deg temps de lumière { "841.1" } s [MODELLED] Jupiter { "5.3036" } au lon { "130.91" } deg temps de lumière { "2970.6" } s [VALIDATED] Io { "5.3049" } au lon { "130.94" } deg temps de lumière { "2971.5" } s [MODELLED] Europe { "5.2995" } au lon { "130.93" } deg temps de lumière { "2968.7" } s [MODELLED] Ganymède { "5.3005" } au lon { "130.98" } deg temps de lumière { "2969.6" } s [MODELLED] Callisto { "5.3153" } au lon { "130.96" } deg temps de lumière { "2976.7" } s [MODELLED] Saturne { "9.4356" } au lon { "10.77" } deg temps de lumière { "4212.2" } s [VALIDATED] Titan { "9.4401" } au lon { "10.74" } deg temps de lumière { "4214.3" } s [MODELLED] Uranus { "19.4363" } au lon { "62.62" } deg temps de lumière { "9444.1" } s [MODELLED] Neptune { "29.8775" } au lon { "2.62" } deg temps de lumière { "14409.3" } s [MODELLED] Pluton { "35.6122" } au lon { "304.19" } deg temps de lumière { "17529.1" } s [MODELLED] lien Mars -> Jupiter : aller simple { "2193.539" } s, aller-retour { "4386.919" } s, Shapiro { "15.0" } us, Soleil { "15.0" } deg lien Saturne -> Terre : aller simple { "4212.176" } s, aller-retour { "8424.347" } s, Shapiro { "22.1" } us, Soleil { "172.5" } deg lien Europe -> Jupiter : aller simple { "2.218" } s, aller-retour { "4.437" } s, Shapiro { "0.0" } us, Soleil { "22.0" } deg

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-26ecec1af8af = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/solar-system-tour.toml
seg-13de19567146 = L'exemple <c1/> définit, entre autres :

# text
seg-6081077a5c63 = 2026-09-28T00:{ "00" }:{ "00" }

# text
seg-c4b64eb26210 = ICRF (équatorial J2000), héliocentrique ; m

# text
seg-6096a0ab243b = Standish Table { "1" } ({ "1800" } apr. J.-C. à { "2050" } apr. J.-C.)

# text
seg-5c9a8d4716f5 = Libellé du résultat (celui du moteur) : MIXED : chaque corps porte son propre libellé. Les positions des planètes sont VALIDATED par rapport à JPL Horizons à moins du double de l'erreur nominale de Standish (de Mercure à Saturne et la Terre à partir de la Table { "1" } ; les huit planètes à partir des Tables 2a/2b) ; Uranus et Neptune à partir de la Table { "1" }, Pluton, la Lune et les sept lunes sont MODELLED.

# attr:alt
seg-537aa8010e50 = Le graphique que le moteur écrit pour scenarios/solar-system-tour.toml, type solar-system

# text
# c1: solar-system
seg-7432155d5fec = <b>VALIDATED</b> Le type <c1/> avec planetary_kernel_path : chaque corps rapporté dont le SPK détient le propre code NAIF prend sa position et sa vitesse héliocentriques J2000 dans le noyau, par le lecteur propre du moteur (libellé KERNEL), un lien dont les deux extrémités

# text
seg-84ce0dd8daef = <b>VALIDATED</b> Positions héliocentriques de Mercure, Vénus, du barycentre Terre-Lune, de la Terre, de Mars, de Jupiter et de Saturne à partir de la Table { "1" } de Standish ({ "1800" } apr. J.-C. à { "2050" } apr. J.-C.), et des huit planètes à partir des Tables 2a/2b ({ "3000" } av. J.-C. à { "3000" } apr. J.-C., avec les anomalies moyennes b, c, s, f Tests : <a1>solar_system_standish_earth_icrf_preregistered.rs</a1>.

# text
seg-cc5bd76ec542 = <b>MODELLED</b> Positions d'Uranus et de Neptune à partir de la Table { "1" } de Standish (la valeur par défaut entre { "1800" } apr. J.-C. et { "2050" } apr. J.-C.), de Pluton à partir de la ligne de { "1992" } de la Table { "1" } que la page actuelle du JPL ne liste plus, et vitesse héliocentrique de chaque planète : la dérivée à deux corps avec Tests : <a1>solar_system_horizons_reference.rs</a1>.

# text
# c1: solar-system
seg-ad3da7fe8e46 = <b>VALIDATED</b> Le type <c1/> avec planetary_kernel_path : chaque corps rapporté dont le SPK détient le propre code NAIF prend sa position et sa vitesse héliocentriques J2000 dans. Référence indépendante (ExternalDataset) : NAIF SPICE Toolkit (CSPICE N0067 à travers spiceypy { "8.3.0" }) états héliocentriques spkezr sur le de440s.bsp complet, un programme distinct qui n'appelle aucun code de Kshana (tests/fixtures/solar_system_kernel/, NOTICE.md) ; le moteur lit des extraits de de440s à l'identique au bit près. Préenregistré f8e946ea. Une vérification de bibliothèque du câblage : DE440 lui-même et les corps analytiques ne sont pas validés ici. Résultats : docs/design/evidence/cap31-solar-system-kernel/RE

# text
seg-735fb0bc1705 = <b>VALIDATED</b> Positions héliocentriques de Mercure, Vénus, du barycentre Terre-Lune, de la Terre, de Mars, de Jupiter et de Saturne à partir de la Table { "1" } de Standish ({ "1800" } apr. J.-C. à { "2050" } apr. J.-C.), et de tous . Référence indépendante (ExternalDataset) : vecteurs héliocentriques géométriques JPL Horizons DE441 (écliptique et ICRF), récupérés après les commits de préenregistrement { "80451866" }, 8d38a28b et 558cc807. Seuil : par planète et par composante, RMS d'au plus 1.0x les erreurs approximatives de l'Explanatory Supplement 3e éd. Table { "8.10.1" } (la ligne EMB pour la Terre) ; la séparation Terre-EMB est vérifiée directement par rapport à DE441 { "399" } moins { "3" }, d'au plus { "0.3" } deg et { "8.1" } km à chaque époque 1950-2050 (th

# text
seg-ab1192de28f5 = <b>VALIDATED</b> Le temps de lumière newtonien aller simple d'un corps quelconque à un autre, reçu à une époque donnée, résolu par le solveur radiométrique de temps de lumière à point fixe (radiometric::light_t. Référence indépendante (ExternalDataset) : temps de lumière newtonien LT de la branche descendante aller simple de JPL Horizons DE441 (VEC_CORR=LT, observateur au centre de la Terre), préenregistré (480037d3, l'amendement 54d5c86f ne changeant que l'espacement des nœuds d'interpolation après que la première récupération a échoué à sa précondition de précision d'interpolation de { "10" } m, avant qu'aucun temps de lumière ait été comparé) avec un seuil de { "1e-6" } s par temps de lumière, le solveur étant alimenté par les positions barycentriques de DE441 de sorte que l'itération de l'émetteur retardé est visib

# text
seg-5a2e745828ea = <b>MODELLED</b> Positions d'Uranus et de Neptune à partir de la Table { "1" } de Standish (la valeur par défaut entre { "1800" } apr. J.-C. et { "2050" } apr. J.-C.), de Pluton à partir de la ligne de { "1992" } de la Table { "1" } que la page actuelle du JPL ne li. Référence indépendante (ExternalDataset) : mesuré par rapport à JPL Horizons DE441 (les mêmes fixtures versionnées dans le dépôt), mais non validé : les valeurs indiquées par la Table { "1" } pour Uranus et Neptune sont dépassées jusqu'à { "2.0" } et { "5.2" } fois par rapport aux positions héliocentriques de DE441 (Neptune les respecte par rapport aux positions barycentriques, ce qui suggère que l'ajustement n'était pas héliocentrique), la page n'indique aucune erreur pour Pluton, et aucune borne publiée n'existe pour les vitesses. Les Tables 2a/2b respectent leurs propres

# text
# c1: label
seg-0131b082906b = MIXED : chaque corps porte son propre libellé. Les positions des planètes sont VALIDATED par rapport à JPL Horizons à moins du double de l'erreur nominale de Standish (de Mercure à Saturne et la Terre à partir de la Table { "1" } ; les huit planètes à partir des Tables 2a/2b) ; Uranus et Neptune à partir de la Table { "1" }, Pluton, la Lune et les sept lunes sont MODELLED. Les temps de lumière sont newtoniens, à partir des mêmes positions. (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-3e24f0bf9ccd = MODELLED, chaque ligne étant étiquetée : Uranus et Neptune à partir de la Table { "1" } ({ "2.0" } et { "5.2" } fois l'erreur nominale par rapport à DE441), Pluton (la ligne de { "1992" } ; pas d'erreur indiquée), la Lune et les sept lunes (mesurées par rapport à Horizons, sans borne publiée). (catalogue des types (<c1/>))

# text
seg-62b2e925233a = CE QUI EST VALIDATED, ET CE QUI NE L'EST PAS Chaque corps porte son propre libellé. De Mercure à Saturne et la Terre sont VALIDATED par rapport à JPL Horizons (Development Ephemeris DE441) à moins du double de l'erreur nominale de la page de Standish. Uranus et Neptune à partir de la Table { "1" } dépassent les valeurs de la page par rapport à DE441 (de { "2.0" } et { "5.2" } fois) et sont MODELLED ; de même pour Pluton, la Lune et les sept lunes, qui ont été mesurées par rapport à Horizons mais n'ont aucune borne publi (commentaire du fichier de scénario, lignes { "20" } à { "25" })

# text
seg-2b36ac40e457 = Uranus et Neptune à partir de la Table { "1" } de Standish, Pluton et les vitesses planétaires sont MODELLED, non validés : une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-c19e6d035b7e = Les positions de la Lune et de sept lunes majeures (Phobos, Deimos, les lunes galiléennes, Titan) sont MODELLED, non validées : une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-ce15aaa5453c = Les constantes physiques de chaque corps du système solaire et le rapport du système entier sont MODELLED, non validés : vérifiés par rapport à leur propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-ceadf891b1e2 = <s1>Précédent</s1>slot-timing

# text
seg-0493962a6937 = <s1>Suivant</s1>space-packet
