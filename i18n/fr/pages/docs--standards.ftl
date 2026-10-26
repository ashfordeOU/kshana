# docs--standards: translations (fr)

# text
seg-4a2ce9f33ab2 = écriture

# text
seg-9120d3e96e5e = lecture

# text
seg-5ad814c7ef9e = Notes

# text
seg-aab745a65e76 = Module

# text
seg-bf09433a7342 = GeoJSON

# text
seg-906440b861cd = Trame

# text
seg-32b620b3574e = Utilisation

# text
seg-8ba331635865 = Normes et interopérabilité

# text
# c1: docs/STANDARDS.md
seg-96a449a63d11 = Source : <c1/>

# text
seg-3ed65a16e7d0 = Kshana parle les formats d'échange standard des communautés du GNSS (système mondial de navigation par satellite), de la dynamique du vol et de la synchronisation temporelle, afin de pouvoir cohabiter avec RTKLIB (une bibliothèque libre de positionnement cinématique en temps réel), gLAB, Ginan, GMAT (General Mission Analysis Tool), Orekit et les outils des centres d'analyse de l'IGS (International GNSS Service), plutôt que de rester sur une île privée. Cette page associe les <b>formats d'échange</b> que le moteur lit ou émet au module qui implémente chacun d'eux et à la spécification faisant autorité.

# text
# c1: VERIFICATION-MATRIX.md
seg-d1aa512ad4ee = Elle se limite aux formats — des choses qui ont un sens de lecture ou d'écriture. Les normes de signal et d'algorithme que le moteur <em>implémente</em> plutôt qu'il ne les lit (IS-GPS-200 (IS : Interface Specification ; GPS : Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (anciennement Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF : International Geomagnetic Reference Field), la référence ARAIM (surveillance autonome avancée de l'intégrité par le récepteur) WG-C (WG : groupe de travail), CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN : Deep Space Network)) sont étayées ligne par ligne dans <a1><c1/></a1>.

# text
seg-656920618fb7 = Formats que parle le moteur

# text
seg-4fe4920a3fa1 = Norme

# text
seg-d08f1943c53b = Sens

# text
seg-968a1d48364c = Spécification / autorité

# text
seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

# text
seg-68d762928f76 = lecture <b>et</b> écriture

# text
seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, forme KVN (notation clé-valeur)

# text
# c1: parse_oem
# c2: tests/ccsds_reference.rs
# c3: COVARIANCE_START … COVARIANCE_STOP
# c4: COV_REF_FRAME
# c5: covariance_block_kvn
# c6: parse_covariance_block
# c7: src/oem.rs
seg-be700901c03e = Éphéméride tabulée de vecteurs d'état ingérée par GMAT, Orekit, STK (Systems Tool Kit). <c1/> la relit ; <b>validé en retrouvant l'exemple textuel de la figure G-11 du Blue Book CCSDS 502.0-B-3</b> (<a1><c2/></a1>). Le <b>bloc de covariance</b> position/vitesse { "6" }×{ "6" } facultatif (<c3/>, la sérialisation KVN du triangle inférieur à 21 éléments avec un <c4/> facultatif) est à la fois écrit (<c5/>) et lu (<c6/>), symétrique en aller-retour (tests <a2><c7/></a2>).

# text
seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

# text
seg-8e9f975d443b = CCSDS 502.0-B-2, forme KVN

# text
# c1: orbit
# c2: --export-omm <out.omm>
# c3: export_omm = true
# c4: tests/sp3_export_roundtrip.rs
seg-fb5218415d68 = Publication de la voie de normalisation pour les éléments moyens SGP4/TLE (SGP4 : Simplified General Perturbations { "4" } ; TLE : jeu d'éléments à deux lignes) (moyen mouvement, e, i, Ω, ω, M, BSTAR (le terme de traînée du propagateur d'orbite)). Accessible en CLI (CLI : interface en ligne de commande) sur un scénario <c1/> via <c2/> ou <c3/> (un OMM par satellite défini par TLE, avec son véritable identifiant NORAD (North American Aerospace Defense Command), son désignateur COSPAR (Committee on Space Research) et son époque ; <a1><c4/></a1>). La forme XML (Extensible Markup Language) et un lecteur sont des suites à venir.

# text
seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

# text
seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, forme KVN

# text
# c1: tests/ccsds_reference.rs
seg-cd96db42ab43 = Enregistrements de suivi en distance / Doppler / angle qu'une passe DSN/ESTRACK (ESTRACK : réseau européen de suivi spatial) livre à un système de DO (détermination d'orbite). <b>Validé en retrouvant l'exemple textuel de la figure E-9 du Blue Book CCSDS 503.0-B-2</b> (<a1><c1/></a1>).

# text
seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

# text
seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

# text
# c1: spacepackets-py
# c2: src/space_packet.rs
seg-ed9c8bdddd6d = Le cadrage d'en-tête primaire de 6 octets TM/TC (TM : télémesure ; TC : télécommande) qu'échangent les systèmes au sol. <b>L'encodeur reproduit les vecteurs de test au niveau de l'octet publiés par la bibliothèque indépendante <c1/></b> (tests <a1><c2/></a1>).

# text
seg-aa942198bb2e = <b>SP3-c (SP3 : Standard Product { "3" }, le format d'orbite précise) / SP3-d</b> (éphéméride précise)

# text
seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

# text
# c1: gps-ops
# c2: tests/sp3_export_roundtrip.rs
seg-8d1089fbd59d = Série temporelle de position dans le repère terrestre (ECEF) + temps d'horloge. Validée en aller-retour à moins de { "0.5" } m sur un instantané réel de <c1/> (<a1><c2/></a1>).

# text
seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (navigation diffusée)

# text
seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, ICD (document de contrôle d'interface) Galileo, ICD BeiDou, ICD GLONASS (système russe de navigation par satellite))

# text
# c1: Propagator
seg-1b7710db3abf = Ingestion NAV multi-GNSS (GPS LNAV (message de navigation historique), Galileo F/NAV, QZSS (système japonais Quasi-Zenith Satellite System), BeiDou MEO/IGSO (MEO : orbite terrestre moyenne ; IGSO : orbite géosynchrone inclinée), vecteur d'état GLONASS) ; utilisable comme source <c1/> de premier rang.

# text
seg-44991b52d1ff = <b>TLE / 3LE</b> (éléments à deux / trois lignes)

# text
seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

# text
seg-8d4dd42edc89 = Propagé par le noyau SGP4/SDP4 validé (SDP4 : Simplified Deep-space Perturbations { "4" }) ({ "4.12" } mm par rapport aux { "666" } vecteurs officiels de l'AIAA).

# text
seg-498aac915067 = <b>RINEX 3.0x</b> (observation)

# text
seg-437d07b5aa4f = RINEX 3.0x OBS ({ "4.00" } censé être analysé, jamais éprouvé sur un fichier { "4.00" })

# text
# c1: parse_obs
# c2: pvt
# c3: tests/pvt_abmf.rs
seg-ac97f77f142c = L'autre moitié de RINEX : les enregistrements de code / porteuse / Doppler / SNR (SNR : rapport signal sur bruit) propres au récepteur (<c1/>). C'est l'entrée que consomme le solveur de positionnement ponctuel <c2/>, avec le fichier de navigation diffusée (<a1><c3/></a1>, vraie station IGS ABMF).

# text
seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format ; cartes de TEC (contenu électronique total) globales)

# text
seg-bf1bb42f04c4 = IONEX { "1" }.x (produit ionosphérique de l'IGS)

# text
# c1: parse_ionex
seg-af9efa0df270 = <c1/> lit les grilles globales de contenu électronique total de l'IGS — l'alternative <em>mesurée</em> à la correction de Klobuchar diffusée — avec interpolation spatiale et temporelle bilinéaire et fonction d'obliquité pour le retard oblique.

# text
# c1: finals2000A
seg-6f0da4b59d7c = <b>IERS (International Earth Rotation and Reference Systems Service) <c1/> / Bulletin B</b> (orientation de la Terre)

# text
# c1: finals2000A.all
seg-197dfa18ca19 = Conventions de l'IERS ; IERS EOP (paramètres d'orientation de la Terre) { "14" } C04 / <c1/>

# text
# c1: tests/operational_eop_predictor_reference.rs
seg-0d102d904cfe = UT1 (Universal Time { "1" }, temps de rotation de la Terre)−UTC (temps universel coordonné) et mouvement du pôle issus du produit officiel, y compris les lignes <b>prédites</b>, de sorte que la réduction de référentiel peut être exécutée en temps réel et la croissance de son erreur de prédiction budgétée (<a1><c1/></a1>).

# text
seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

# text
# c1: SCHEMA.md
seg-193b33461507 = ce dépôt — voir <a1><c1/></a1>

# text
# c1: format
# c2: schema_version
# c3: kind
# c4: engine_version
# c5: payload
seg-33ef8d792a90 = L'enveloppe neutre et versionnée dans laquelle tout artefact peut être encapsulé : <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, avec un verdict explicite de compatibilité majeure-mineure pour un consommateur. Ce n'est pas une norme externe ; elle est documentée ici parce qu'un outil étranger doit pouvoir la reconnaître.

# text
seg-a492f437efd0 = Échange lunaire LunaNet / IOAG (Interagency Operations Advisory Group)

# text
seg-b19cf72da934 = écriture (métadonnées de temps aussi lues)

# text
seg-d641c72a6449 = Spécification d'interopérabilité LunaNet / architecture de communications lunaires de l'IOAG, au-dessus de CCSDS { "502.0" }

# text
# c1: export_lunar_oem
# c2: export_kif_lunar
# c3: export_lunar_time_metadata
# c4: tests/lunar_interoperability_export_reference.rs
seg-cc796afe7a72 = Le référentiel lunaire, l'échelle de temps lunaire et l'éphéméride lunaire émis sous des formes CCSDS alignées sur LunaNet/IOAG (<c1/>, <c2/>, <c3/>), avec un contrôle de champs sur l'OEM émis (<a1><c4/></a1>).

# text
seg-5abc05382382 = <b>CZML</b> (Cesium Language)

# text
seg-da7e20d3786b = Format de paquets CZML de CesiumJS

# text
# c1: INERTIAL
# c2: --export czml
seg-8d3a73646be3 = Un flux JSON (JavaScript Object Notation) de paquets horodatés pour le globe CesiumJS ; les objets mobiles sont écrits en GCRS (<c1/>). <c2/> sur tout type de scénario qui place des objets sur la Terre.

# text
seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

# text
seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

# text
# c1: --export kml
seg-57468e6d97f2 = Longitude, latitude et hauteur dans le repère terrestre pour Google Earth et les outils SIG (système d'information géographique). <c1/>.

# text
seg-46d977015b07 = écriture <b>et</b> lecture (itinéraire)

# text
seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

# text
# c1: --export geojson
# c2: LineString
# c3: --import-route <route.geojson>
seg-425a83b44545 = Géométrie dans le repère terrestre pour les cartes web et les outils SIG (<c1/>) ; un <c2/> est relu comme entrée de trajectoire rectiligne des types de scénario qui en font voler une (<c3/>).

# text
# c1: .e
# c2: EphemerisTimePosVel
seg-d9b137e11514 = <b>Éphéméride STK</b> (<c1/>, <c2/>)

# text
seg-347ee6f6c1df = Format de fichier d'éphéméride Ansys STK

# text
# c1: ICRF
# c2: --export stk
seg-45576578d357 = Position et vitesse inertielles (<c1/>) pour STK et les outils qui lisent son format d'éphéméride. <c2/>.

# text
seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

# text
seg-42272f73f456 = Spécification SigMF

# text
# c1: spectrum
# c2: --export sigmf
# c3: [recording]
seg-202b559c30a6 = Enregistrements complexes en bande de base plus métadonnées JSON : le type de scénario <c1/> écrit ses échantillons en phase/quadrature (IQ) synthétisés (<c2/>) et lit un enregistrement par son bloc <c3/>.

# text
seg-60e7c8505cb5 = <b>Texte de message de navigation LEO</b> (de style RINEX-4 et CSV (valeurs séparées par des virgules))

# text
seg-f22442e0e8ea = Disposition de navigation RINEX { "4" }, adaptée

# text
# c1: leo-navmsg
seg-8338e445b3a5 = L'éphéméride diffusée et l'horloge du type de scénario <c1/> pour un satellite en orbite terrestre basse (LEO), exportées et réimportées ; une adaptation documentée, et non un type de message RINEX enregistré (MODELLED dans la matrice de vérification).

# text
seg-1b89ab4e93f7 = Référentiels et temps

# text
# c1: src/cio.rs
# c2: src/frames.rs
# c3: src/nutation.rs
# c4: VALIDATION.md
seg-dbbd023631b6 = Le référentiel que le moteur émet est explicite, et non implicite. La réduction IAU (International Astronomical Union) 2006/2000A fondée sur le CIO (CIO : Celestial Intermediate Origin) (<a1><c1/></a1>) et la réduction TEME (équateur vrai, équinoxe moyen) par équinoxe/GMST (GMST : temps sidéral moyen de Greenwich) (<a2><c2/></a2>, <a3><c3/></a3>) sont validées bit à bit par rapport aux vecteurs de référence SOFA/ERFA (SOFA : Standards of Fundamental Astronomy ; ERFA : Essential Routines for Fundamental Astronomy) (voir <a4><c4/></a4>).

# text
seg-819d28bd9361 = Réalisation

# text
seg-69aca96b7e42 = TEME

# text
seg-ec81608934a6 = natif de SGP4

# text
seg-7631c594fd1a = Équateur vrai, équinoxe moyen — le référentiel de sortie de SGP4/SDP4.

# text
seg-eeb28cc286b3 = GCRS (Geocentric Celestial Reference System) / J2000

# text
seg-745285e29202 = Précession IAU { "2006" } + nutation IAU 2000A/2000B

# text
# c1: teme_to_gcrs
seg-3747add299d5 = <c1/> (chaîne par équinoxe).

# text
seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

# text
seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

# text
seg-8891621dc302 = ITRS (International Terrestrial Reference System) / ECEF

# text
seg-a28e26cd2481 = ERA (angle de rotation de la Terre) + mouvement du pôle de l'IERS (CIO) ou GMST + mouvement du pôle (équinoxe)

# text
# c1: gcrs_to_itrs_matrix
# c2: eraC2tcio
# c3: teme_to_itrf
seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (équinoxe).

# text
seg-74a4801fd685 = Géodésique WGS-84 (WGS : World Geodetic System)

# text
seg-b58a44eaaa39 = exact + inverse itératif

# text
seg-4d9472dd73d3 = Échelle de temps

# text
seg-cbe7a7ce7317 = <b>TT</b> (Terrestrial Time)

# text
# c1: jd_tt
seg-25191c1a4135 = Évaluation des arguments de précession/nutation/CIO (<c1/>).

# text
# c1: jd_ut1
seg-8c478d6b4786 = Angle de rotation de la Terre / GMST (<c1/>).

# text
seg-f7033ca0c13f = <b>JD en deux parties</b> (jour julien)

# text
# c1: Jd2
seg-64a5adeacd5b = <c1/> pour une résolution d'époque inférieure à la µs.

# text
seg-210f40885a8e = Correspondance champ de sortie → norme (CCSDS { "502.0" })

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: --export-oem
# c3: --export-omm
seg-e9dbc25a3ee9 = Ce que les deux écrivains de messages d'orbite placent dans chaque champ CCSDS ODM (Orbit Data Messages, { "502.0" }), lu à partir d'une exécution de <c1/> avec <c2/> et <c3/> :

# text
seg-d2b91c300b82 = Sortie de Kshana

# text
seg-119884b009cc = Champ CCSDS ODM

# text
seg-8b0593f67c7f = Valeur / unité

# text
seg-d33eb162d179 = Métadonnées de segment OEM

# text
# c1: EARTH
# c2: TEME
# c3: GPS
seg-4b338284e56a = <c1/> / <c2/> / <c3/> — le référentiel dans lequel les propagateurs intègrent et l'échelle de temps de la grille d'époques, sans changement d'étiquette

# text
seg-e0a44af9aaf8 = Époque d'état OEM

# text
seg-b0623bab9fcc = première colonne de chaque ligne de données

# text
seg-410bd5a9ba14 = temps calendaire ISO-8601 (ISO : Organisation internationale de normalisation), échelle de temps GPS

# text
seg-a7c95802e01a = Position et vitesse OEM

# text
# c1: X Y Z X_DOT Y_DOT Z_DOT
seg-0539cafabf60 = colonnes de données <c1/>

# text
seg-8add7e800e0e = km, km/s

# text
seg-8b386548c03c = Métadonnées OMM

# text
seg-e2c63414d7c2 = Époque OMM

# text
seg-5109e5948d2a = forme ISO-8601 en jour de l'année (l'époque du TLE)

# text
seg-b74289a29c24 = Éléments moyens OMM

# text
seg-f3492fa95178 = tr/jour, –, deg, 1/rayons terrestres

# text
# c1: ephemeris
# c2: jd_utc
# c3: teme_r_m
# c4: teme_v_m_s
# c5: gcrs_r_m
# c6: gcrs_v_m_s
# c7: ecef_r_m
# c8: lat_deg
# c9: lon_deg
# c10: alt_km
seg-fc82185abe10 = Le JSON (JavaScript Object Notation) de résultats du type de scénario <c1/> porte le même état en unités SI (Système international d'unités) pour chaque échantillon : <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), plus <c8/>, <c9/>, <c10/>.

# text
seg-014d1392018e = Portée réelle

# text
# c1: INTEROP.md
seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF et le texte de message de navigation LEO se <b>lisent et s'écrivent</b> ; OMM, CZML, KML et l'éphéméride STK sont des <b>écrivains</b> (un lecteur OMM et la sérialisation XML sont des suites à venir) ; GeoJSON est écrit et relu comme itinéraire ; RINEX NAV, RINEX OBS, IONEX, les produits EOP de l'IERS et TLE sont des <b>lecteurs</b> ; l'export lunaire LunaNet/IOAG est un écrivain dont les métadonnées de temps font l'aller-retour. <a1><c1/></a1> indique quel export s'applique à chaque scénario fourni.

# text
seg-68b4f5116419 = La correspondance de champs CCSDS/IGS ci-dessus est de la documentation, et non l'affirmation qu'une norme quelconque est satisfaite ; l'évaluation formelle par rapport à ces normes (et l'enregistrement dans le catalogue ouvert ESSR (European Space Software Repository) de l'ESA (Agence spatiale européenne) / de la NASA (National Aeronautics and Space Administration)) est suivie séparément et est en attente de relecture.

# text
# c1: xval/anise-frames/
# c2: gcrs_to_itrs_matrix
# c3: VALIDATION.md
seg-e461587ad2cf = Le recoupement numérique indépendant SPICE/ANISE (SPICE : Spacecraft, Planet, Instrument, C-matrix, Events ; ANISE : Attitude, Navigation, Instrument, Spacecraft, Ephemeris — une boîte à outils de géométrie planétaire en Rust pur) de la réduction de référentiel est fourni dans la crate autonome <c1/>, exclue de l'espace de travail : <c2/> par rapport à la rotation GCRF (Geocentric Celestial Reference Frame) → ITRF93 (International Terrestrial Reference Frame { "1993" }) d'ANISE, sur huit époques { "2020" }–{ "2023" }, concorde à ≤ { "0.86" } m au sol et à ≤ { "3.6" } m à l'orbite GNSS (voir <a1><c3/></a1>). Il a besoin de noyaux SPICE ; ce n'est donc pas une barrière par défaut de l'intégration continue (CI).

# text
seg-f6d67027d669 = <s1>Précédent</s1>Carte des capacités

# text
seg-01b6270b6c6a = <s1>Suivant</s1>Couverture de lignes
