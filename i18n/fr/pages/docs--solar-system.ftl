# docs--solar-system: translations (fr)

# attr:aria-label, text
seg-31a05429b836 = Corps

# text
seg-1c78d5337e16 = Pluton

# text
seg-6cb7a787ac67 = Références

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-60cd077d82a7 = Modèle

# text
seg-c5ce76c91ff7 = Étiquette

# text
seg-430edd66bda0 = Non modélisé

# text
seg-7670cf4ceda3 = Valeur par défaut

# text
# c1: docs/SOLAR-SYSTEM.md
seg-9fe60d39f2db = Source : <c1/>

# text
seg-c44439432020 = Système solaire et positionnement autour d'autres corps

# text
seg-4d4ee55b5fb4 = Deux types de scénario fonctionnent au-delà du système Terre-Lune :

# text
# c1: solar-system
seg-fa202376da31 = <c1/> rend compte de chaque corps du catalogue à une époque donnée : position et vitesse, constantes physiques, temps de lumière et distance depuis un corps observateur, et une trace d'orbite.

# text
# c1: body-pnt
seg-9859aabbb4f4 = <c1/> place un utilisateur de navigation (un orbiteur ou un atterrisseur en surface) autour de n'importe quel corps du catalogue autre que le Soleil et la Terre, avec une constellation de navigation locale et une mesure de distance en espace lointain facultative depuis la Terre.

# text
# c1: constellation-design
seg-ec582fa8f67f = Le type <c1/> utilise le même catalogue pour construire des constellations autour de n'importe lequel de ces corps (<a1>CONSTELLATION-DESIGN.md</a1>).

# text
# c1: src/body.rs
# c2: src/ephem.rs
# c3: src/ephem_provider.rs
# c4: AnalyticSolarSystem
# c5: src/solar_system.rs
# c6: src/body_pnt.rs
# c7: src/radiometric.rs
# c8: tests/solar_system_horizons_reference.rs
seg-31f150c83173 = Code : <c1/> (le catalogue et ses constantes), <c2/> (les éphémérides analytiques), <c3/> (<c4/>, le fournisseur que lisent les deux types), <c5/> et <c6/> (les types) et <c7/> (temps de lumière, distance aller-retour et retard de Shapiro). Tests : <c8/> et les tests unitaires de chaque module.

# text
seg-3ce9aab4916e = Le catalogue

# text
# c1: src/body.rs
# c2: J2
seg-35cd9ebaf04e = Dix-huit corps : le Soleil, les huit planètes, Pluton, la Lune, Phobos, Déimos, les quatre lunes galiléennes (Io, Europe, Ganymède, Callisto) et Titan. Les noms sont reconnus sans tenir compte de la casse. Pour chacun, <c1/> porte le paramètre gravitationnel GM, les rayons moyens équatorial et volumétrique, le deuxième harmonique zonal <c2/> et son rayon de référence lorsqu'il est publié, ainsi que le modèle de pôle et de méridien origine de l'Union astronomique internationale (UAI) (période de rotation sidérale, négative pour un corps à rotation rétrograde). Chaque valeur cite sa source dans le code.

# text
seg-525b8b29345d = D'où viennent les positions

# text
seg-0fd4c3af55ba = De Mercure à Saturne et la Terre, d'après le tableau { "1" } ({ "1800" } apr. J.-C. à { "2050" } apr. J.-C.)

# text
seg-9d820791a27b = éléments képlériens du Jet Propulsion Laboratory (JPL) de Standish et Williams, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

# text
seg-d8549658ae99 = Les huit planètes d'après les tableaux 2a/2b ({ "3000" } av. J.-C. à { "3000" } apr. J.-C.)

# text
seg-1f0b417c3809 = les éléments sur longue période de la même page

# text
seg-bfe1c209044a = Uranus et Neptune d'après le tableau { "1" }

# text
seg-ba5dfdd2de52 = la ligne du tableau { "1" } de { "1992" } ({ "1800" } apr. J.-C. à { "2050" } apr. J.-C. seulement ; la page actuelle l'a supprimée et n'indique aucune erreur)

# text
seg-001ca2ad22e1 = La Lune

# text
seg-6ff6068aeacf = la série lunaire de Montenbruck et Gill, avec séparation du barycentre Terre-Lune

# text
seg-f906cffa45a2 = Phobos, Déimos, les lunes galiléennes, Titan

# text
seg-6ba84144ad88 = éléments moyens du JPL avec le modèle de rotation de l'UAI

# text
# c1: table = "auto"
# c2: table1
# c3: table2
# c4: epoch_jd_tdb
seg-d5640ad2cd08 = <c1/> (la valeur par défaut) prend le tableau { "1" } entre { "1800" } apr. J.-C. et { "2050" } apr. J.-C. et les tableaux 2a/2b en dehors ; <c2/> et <c3/> en imposent un. Pluton hors de son tableau est une erreur, non une extrapolation. L'époque est une date et heure ISO { "8601" } en temps universel coordonné (UTC), converties par le temps terrestre (TT) avec les secondes intercalaires en temps dynamique barycentrique (TDB), ou une date julienne TDB donnée directement avec <c4/>.

# text
# c1: tests/fixtures/solar_system/
# c2: cargo test --test solar_system_horizons_reference -- --nocapture
seg-912a2223e495 = La référence indépendante est JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, éphéméride de développement DE441), avec les vecteurs interrogés versionnés sous <c1/>. Une ligne de planète est VALIDATED lorsqu'elle reste à moins de deux fois l'erreur nominale propre à la page de Standish. Mesuré par <c2/> :

# text
seg-d8bbd5e4f483 = Tableau { "1" }, de Mercure à Saturne et barycentre Terre-Lune, { "12" } époques de { "1800" } à { "2049" } : au pire { "1.87" } fois l'erreur nominale (distance de Saturne).

# text
seg-18568cec6c91 = Tableaux 2a/2b, les huit planètes, { "15" } époques d'environ { "1000" } av. J.-C. à { "2500" } apr. J.-C. : au pire { "1.71" } fois (distance de Mars).

# text
seg-7f3aa4a24e8f = Uranus et Neptune d'après le tableau { "1" } dépassent les valeurs de la page face à DE441 : { "2.04" } et { "5.16" } fois l'erreur nominale de longitude. Ils sont épinglés sous six fois et restent MODELLED.

# text
seg-41d2f404224b = Pluton : à moins de { "39.2" } secondes d'arc en longitude et { "1.14e9" } m en distance.

# text
seg-11c31908ba69 = Lunes, pire angle vu depuis la planète de { "2000" } à { "2040" } : Phobos { "5.65" } deg, Déimos { "0.38" }, Io { "0.40" }, Europe { "1.63" }, Ganymède { "0.22" }, Callisto { "0.27" }, Titan { "3.31" }. La Lune géocentrique : { "0.046" } deg.

# text
seg-24d36a3ce8d4 = Vitesses des planètes : pire erreur relative de { "3.72e-3" } de la vitesse (MODELLED).

# text
seg-0bae9b8d09ea = La Lune et les sept lunes sont mesurées avec des seuils épinglés, mais il n'existe aucune borne publiée par rapport à laquelle les valider ; elles sont donc MODELLED.

# text
# c1: xval/
# c2: EphemerisProvider
seg-2cf791a940ea = Les éphémérides analytiques n'ont besoin d'aucun fichier de noyau. Un noyau d'éphéméride de développement du JPL (positions de qualité DE) n'est lu que par les crates de validation croisée distincts sous <c1/>, par le même trait <c2/> ; le crate principal n'en dépend pas.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: [[links]]
seg-5bff2c54125b = Entrées : <c1/> (par défaut 2026-01-01T00:{ "00" }:{ "00" }) ou <c2/> ; <c3/> (par défaut les dix-huit) ; <c4/> (par défaut la Terre) ; <c5/> par orbite ({ "8" } à { "2000" }, par défaut { "120" }) ; <c6/> ; et un nombre quelconque de <c7/>, chacun reçu à l'époque.

# text
seg-5787ece2c791 = Pour chaque corps, le résultat donne sa classe et son parent, l'identifiant de la NASA Navigation and Ancillary Information Facility (NAIF), la position et la vitesse héliocentriques dans le référentiel céleste international (ICRF, équatorial J2000) en mètres et mètres par seconde, la longitude, la latitude et la distance écliptiques, la position relative à son parent, la période orbitale, les constantes ci-dessus, le pôle et le méridien origine à l'époque, l'erreur nominale de Standish lorsqu'elle existe, son étiquette et sa chaîne de méthode, et une trace d'orbite sur une révolution (héliocentrique pour une planète, centrée sur le parent pour une lune ; un seul point pour le Soleil). La liaison depuis l'observateur, et chaque liaison supplémentaire, donne :

# text
seg-36bad4b7b4ba = le temps de lumière newtonien aller simple, résolu par le solveur radiométrique de temps de lumière à point fixe avec l'émetteur à sa position retardée, et la distance aller simple correspondante ;

# text
seg-c5602eb76a05 = le temps de lumière et la distance aller-retour ;

# text
seg-dab8e2db61d3 = le retard de Shapiro du Soleil, indiqué séparément et non ajouté ;

# text
seg-90d00587a59f = l'angle de séparation du Soleil.

# text
seg-4c172f9f7cf6 = Le temps de lumière est VALIDATED par rapport au temps de lumière aller simple que rapporte Horizons : Mars et Jupiter vers le centre de la Terre à quatre époques de { "2000" } à { "2040" }, pire erreur { "0.070" } s pour Mars face à un seuil de { "0.207" } s et { "1.31" } s pour Jupiter face à { "4.04" } s. Le seuil vaut deux fois la somme des erreurs de distance de Standish de la cible et du barycentre Terre-Lune, divisée par la vitesse de la lumière : le temps de lumière ne peut pas être meilleur que les positions. C'est le temps de lumière géométrique newtonien, non une observable relativiste ou corrigée du plasma.

# text
# c1: scenarios/solar-system-tour.toml
seg-4f8cd6aef754 = Le fichier <c1/> fourni rend compte des dix-huit corps à 2026-09-28T00:{ "00" }:{ "00" } avec des traces de 180 points, et ajoute les liaisons Mars-Jupiter (aller simple { "2193.539" } s), Saturne-Terre ({ "4212.176" } s) et Europe-Jupiter ({ "2.218" } s).

# text
seg-d22cc535f04b = Un utilisateur navigue autour d'un corps choisi par son nom (tout corps du catalogue sauf le Soleil et la Terre, que le type refuse) avec deux sortes de mesures :

# text
# c1: planes
# c2: sats_per_plane
# c3: phasing_f
# c4: J2
seg-9eeb7f77aec7 = des pseudo-distances aller simple issues d'une constellation de navigation Walker delta autour du corps (<c1/> par <c2/>, phasage inter-plans <c3/>), parcourue en orbites à deux corps avec la dérive séculaire due au <c4/> propre au corps ; l'horloge de l'utilisateur est inconnue, ces lignes portent donc une colonne de biais d'horloge ;

# text
# c1: [earth_link]
seg-56ac318f6f27 = facultativement une distance aller-retour depuis le centre de la Terre (<c1/>), qui n'a pas besoin d'horloge utilisateur et est rapportée comme une distance aller simple avec son propre bruit. La direction et la distance de la Terre proviennent de l'éphéméride analytique à chaque époque.

# text
# c1: mars-pnt
seg-551d44492aae = Une ligne de visée est bloquée lorsqu'elle passe à l'intérieur du rayon moyen du corps (le test de corde du type <c1/>), et un utilisateur en surface a aussi besoin du masque d'élévation. À chaque époque, l'exécution forme la dilution de précision géométrique et de position (GDOP, PDOP) de la constellation seule, l'incertitude formelle de position à un sigma avec et sans la ligne de la Terre, et un point de calage par moindres carrés de Gauss-Newton avec graine de chaque façon, de sorte que le rapport montre ce qu'ajoute la liaison en espace lointain.

# text
seg-6f1161567330 = niveau supérieur

# text
seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, une opposition de Mars

# text
seg-0b688042ed44 = { "86 400" } s, { "600" } s

# text
# c1: orbiter
# c2: surface
seg-c7b3aaecd6e2 = <c1/> (ou <c2/>)

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: u0_deg
# c5: eccentricity
seg-c452a6f7a9d4 = orbiteur : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
seg-67f7b23bf604 = { "400" } km, { "75" } deg, { "0" }, { "0" }, { "0" }

# text
# c1: lat_deg
# c2: lon_deg
# c3: height_m
seg-b412b65733d8 = surface : <c1/>, <c2/>, <c3/>

# text
seg-7639d2583131 = trois rayons moyens

# text
seg-fe4a8d9da406 = { "60" } deg

# text
seg-7ac449fb9569 = { "1" } m

# text
# c1: mask_deg
seg-128c4a5edd9b = <c1/> (utilisateur en surface)

# text
seg-3d4b760f6ed6 = { "10" } deg

# text
seg-498493929023 = vrai, { "1" } m

# text
# c1: raan_deg
# c2: u0_deg
seg-18e477dc7f02 = <c1/> est l'ascension droite du nœud ascendant dans le référentiel équatorial du corps et <c2/> l'argument de latitude à l'époque.

# text
seg-a743b0b5e668 = Les deux scénarios fournis, tels qu'ils s'exécutent avec kshana { "0.36" } (mathématiques portables, identiques sur toutes les plateformes) :

# text
seg-b24010bdb302 = Utilisateur

# text
seg-cb9cd741ba85 = orbiteur, { "300" } km, { "93" } deg

# text
seg-fa11e61f0d1d = surface, { "20" } deg N, { "60" } deg E

# text
seg-e17a9ae6905c = Relais

# text
seg-359db3c9ad19 = { "12" } à { "10 000" } km, { "60" } deg

# text
seg-1bb041045be4 = { "12" } à { "4500" } km, { "55" } deg, masque de { "10" } deg

# text
seg-604aefd62668 = Durée

# text
seg-825603e2fbed = un sol, { "296" } époques

# text
seg-372159825c11 = { "306 822" } s, { "171" } époques

# text
seg-132e3bbcc94c = Temps de lumière vers la Terre, aller simple / aller-retour

# text
seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

# text
seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

# text
seg-d0f05f440103 = Terre en vue

# text
seg-d7ad84776ec6 = { "0.811" } des époques

# text
seg-44bf83b16660 = Disponibilité, relais seuls / avec la distance de la Terre

# text
seg-07e0a8499670 = PDOP médian

# text
seg-e802f5920237 = Erreur RMS du point de calage, relais seuls / avec la distance de la Terre

# text
seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

# text
seg-873187e2b016 = { "112.742" } m / { "86.499" } m

# text
seg-bcba58871d0b = Sigma formel médian, relais seuls / avec la distance de la Terre

# text
seg-536757d9f141 = { "1.375" } m / { "1.304" } m

# text
seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

# text
# c1: docs/revisions/STUDIO15-portable-math-rebaseline.md
seg-67d3d30060ad = (RMS : racine de la moyenne des carrés.) Une époque d'Europe (t = { "16 200" } s) se trouve à la limite de disponibilité, où le dernier bit d'un rayon calculé décide si son point de calage avec la distance de la Terre est obtenu. Avant { "0.36" }, c'était la bibliothèque mathématique de l'hôte qui en décidait, de sorte que le même scénario affichait { "0.719" } et { "86.147" } m sous Linux x86-64 et { "0.725" } et { "85.800" } m sous macOS arm64 pour les deux valeurs « avec la distance de la Terre ». Depuis { "0.36" }, chaque fonction transcendante est calculée par la bibliothèque mathématique portable, l'époque se résout d'une seule façon sur toutes les plateformes (le natif et WebAssembly donnent les mêmes octets), et les valeurs sont { "0.713" } et { "86.499" } m (<a1><c1/></a1>). Autour d'Europe, la distance de la Terre fait passer la disponibilité de { "0.480" } à { "0.713" } des époques. Là où la Terre ne dépasse jamais le limbe, la liaison n'apporte rien : un atterrisseur à { "89.5" } deg S sur la Lune, sous une couche de relais de 12 satellites à { "5000" } km, a la Terre en vue à { "0" } époque sur { "145" }, et ses erreurs sont les mêmes avec et sans la liaison.

# text
seg-41507568efb8 = <b>MODELLED.</b> Les orbites des relais ignorent les corps tiers (l'attraction de Jupiter sur les relais autour d'Europe n'est pas modélisée), le bruit est gaussien aux niveaux indiqués et le modèle de mesure est instantané, non retardé par le temps de lumière. Ce qui est vérifié : la période des relais par rapport à la troisième loi de Kepler pour le corps, un orbiteur conservant son rayon et un atterrisseur sur la surface, la distance de la Terre n'aggravant jamais l'incertitude formelle, les erreurs de point de calage avec graine concordant avec le sigma formel (racine de la moyenne des carrés de l'erreur sur sigma dans [{ "0.6" }, { "1.5" }]), et une exécution déterministe. Rien de cela n'est une donnée de navigation d'une mission.

# text
# c1: ephemeris
seg-b78c9e331a43 = Le type <c1/>

# text
# c1: ephemeris
# c2: eop_finals2000a
# c3: finals2000A
# c4: src/ephemeris.rs
seg-b9f40c641a49 = Malgré son nom, <c1/> est un type de scénario pour satellite terrestre : un satellite, à partir d'un jeu d'éléments à deux lignes (TLE) par le propagateur Simplified General Perturbations { "4" } (SGP4) ou à partir d'une orbite analytique, sur une grille de temps. À chaque pas, il produit l'état inertiel (position et vitesse) dans le référentiel true equator, mean equinox (TEME) et dans le Geocentric Celestial Reference System (GCRS), la position fixe par rapport à la Terre, le point sous-satellite du World Geodetic System { "1984" } (WGS { "84" }) et, pour une station au sol facultative, l'azimut, l'élévation, la distance et la vitesse radiale. <c2/> prend le texte d'un fichier <c3/> de l'International Earth Rotation and Reference Systems Service (IERS) pour UT1−UTC et le mouvement du pôle à chaque époque. Code : <c4/>.

# text
seg-1babcba7b4ba = Les termes relativistes de temps de lumière au-delà du retard de Shapiro rapporté séparément, et le retard dû au plasma solaire.

# text
seg-0c49dfc777ca = Des positions meilleures que la précision de Standish et des éléments moyens indiquée ci-dessus ; il n'y a pas de lecteur de noyau dans le crate principal.

# text
# c1: body-pnt
# c2: constellation-design
seg-18d925e53ce0 = Les perturbations par des corps tiers sur les relais de <c1/> et sur les orbites de <c2/>.

# text
seg-3968ed54e3fe = Le relief sur n'importe quel corps : un corps est sa sphère moyenne.

# text
# c1: solar-system
# c2: body-pnt
seg-4650526c532e = Exports d'interopérabilité : CZML, KML et GeoJSON décrivent des positions autour de la Terre, de sorte que les scénarios <c1/> et <c2/> n'en exportent aucun (<a1>INTEROP.md</a1>).

# text
seg-cb7e3d4bf5aa = E. M. Standish et J. G. Williams, "Keplerian Elements for Approximate Positions of the Major Planets", JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

# text
seg-aaf6a1f91c1a = O. Montenbruck et E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

# text
seg-8b7aa3bb95f0 = B. A. Archinal et al., "Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }", <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

# text
seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

# text
seg-e95a41f0ded7 = <s1>Précédent</s1>Validation des modèles de forces

# text
seg-a801b99f7040 = <s1>Suivant</s1>Station de référence lunaire

# text
seg-e0aba02258f4 = Le type ephemeris

# text
seg-e0eb14018b2c = comme ci-dessus

# text
seg-3dbc7ff9f5ab = Table
