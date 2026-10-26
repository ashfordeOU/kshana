# docs--provenance: translations (fr)

# text
seg-9a2a5f0a8a02 = Système solaire

# attr:aria-label, text
seg-d01db1c2710a = Référence

# text
seg-28e87f407a10 = Domaine

# text
seg-ad856ad710eb = État

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Source

# text
seg-638b8d451550 = Capteur

# text
seg-d4a762001549 = Licence

# text
seg-60cd077d82a7 = Modèle

# text
seg-2afa300864a9 = Paramètres

# text
seg-32b620b3574e = Utilisation

# text
# c1: docs/PROVENANCE.md
seg-f3de25879362 = Source : <c1/>

# text
seg-257526f1f93f = Provenance — chaque paramètre est rattaché à une source publiée

# text
seg-8c12958898a8 = La discipline d'honnêteté centrale de Kshana est que <b>chaque paramètre de capteur, chaque modèle physique et chaque jeu de données de validation est rattaché à une source publiée</b> — une fiche technique, un article évalué par des pairs, un ICD (document de contrôle d'interface) de signal dans l'espace, ou une norme. Ce document rassemble ces chaînes de provenance dans un unique tableau de référence citable.

# text
# c1: [clock_quantum]
# c2: [clock_classical]
# c3: provenance
# c4: ModelSpec
# c5: src/types.rs
# c6: with_provenance
# c7: src/inertial/imu_errors.rs
# c8: quantum.spec.provenance
# c9: classical.spec.provenance
# c10: units
# c11: input
# c12: computed
# c13: closed-form
# c14: internal-consistency
seg-279914171c2e = La provenance n'est pas qu'une documentation : chaque table de capteur d'un scénario (par exemple <c1/> et <c2/>) porte une chaîne <c3/> (<c4/> dans <c5/> ; <c6/> dans <c7/> pour le modèle d'erreur de l'unité de mesure inertielle (IMU)) qui <b>se retrouve dans le JSON du résultat</b> (JavaScript Object Notation) sous <c8/> et <c9/>, de sorte que chaque exécution porte ses propres citations de paramètres. Le bloc <c10/> du résultat étiquette aussi chaque champ numérique avec une classe de provenance (<c11/>, <c12/>, <c13/>, <c14/>, …). Les tableaux ci-dessous sont l'index consolidé et lisible de ces chaînes, plus la provenance algorithmique et de validation tirée des commentaires du code source.

# text
# c1: VALIDATION.md
# c2: validated
# c3: modelled
# c4: not modeled
# c5: QUANTUM-MODELS.md
seg-683fd369407a = La maturité est étiquetée honnêtement partout : <b>qualifié pour le vol</b> (a volé), <b>laboratoire au sol / fusée-sonde</b> (démontré, n'a pas volé), ou <b>objectif spatial sur matériel au sol</b> (un chiffre prospectif pour un matériel qui n'a pas volé — notamment chaque chiffre d'horloge à réseau optique de strontium). Voir <a1><c1/></a1> pour les étiquettes <c2/> / <c3/> / <c4/> de chaque chiffre et <a2><c5/></a2> pour la discussion sur la maturité laboratoire au sol contre vol.

# text
seg-80834864bfdd = { "1" }. Paramètres des horloges et des références de fréquence

# text
seg-305f560d4b08 = Chiffre clé

# text
seg-c35a20fa2529 = Maturité

# text
seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (horloge atomique à l'échelle d'une puce)

# text
seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

# text
seg-222707a1bde3 = Fiche technique du fabricant

# text
seg-97709a803dea = <b>qualifié pour le vol</b> (composant commercial déployé)

# text
seg-75db01df1aea = Horloge à réseau optique de strontium (objectif spatial)

# text
seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

# text
seg-1996a1d92bb1 = Origlia, Schiller, Bongs et al., <a1>arXiv:{ "1503.08457" }</a1>

# text
seg-b8c64caf79f3 = <b>objectif spatial sur matériel au sol</b> — aucune horloge optique Sr n'a volé

# text
seg-b5a006507475 = Horloge à réseau optique de strontium (record de laboratoire)

# text
seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

# text
seg-b21bb1b6bf40 = Oelker et al., <em>Nature Photonics</em> ({ "2019" })

# text
seg-95fb87b3a118 = laboratoire au sol uniquement

# text
seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite ; référence de l'ISS (Station spatiale internationale))

# text
seg-9d6acc3191a5 = de l'ordre de { "1" }×{ "10" }⁻¹⁶ après plusieurs jours d'intégration

# text
seg-1cddc44025d7 = ACES/PHARAO de l'ESA (Agence spatiale européenne), opérationnel sur l'ISS depuis avril { "2025" } (citer les résultats publiés de l'ESA)

# text
seg-75b7bb5ca4c8 = <b>qualifié pour le vol</b> (micro-ondes/maser, non optique)

# text
# c1: q_wf = σ_y(1 s)²
# c2: flicker_floor
# c3: VALIDATION.md
seg-aeb8f189db37 = Le coefficient d'Allan de bruit blanc de fréquence utilisé par le modèle de holdover est <c1/> ; la modulation de fréquence à bruit de scintillation (flicker FM) et le vieillissement ne sont modélisés que lorsqu'un <c2/> est fixé explicitement (voir <a1><c3/></a1>), sinon ils ne sont pas modélisés.

# text
seg-bfe4524b6664 = { "2" }. Paramètres des capteurs inertiels

# text
seg-5cd1984ba399 = Chiffres clés

# text
seg-53ad9ba8cecb = Triade d'accéléromètres quantiques hybrides d'Exail

# text
seg-b40c95a6bea5 = stabilité de biais { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h) ; bruit { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

# text
seg-fdb8f1d648ba = Templier et al., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

# text
seg-570f41ff76c9 = Accéléromètre à quartz Honeywell QA-2000 de classe navigation

# text
seg-a7dbc9a9705e = stabilité de biais ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s² ; bruit ~{ "20" } µg/√Hz ; instabilité de biais ~{ "1" } µg

# text
seg-3ad7ce01c6e2 = Fabricant / Groves, <em>Tutoriel AESS (Aerospace and Electronic Systems Society)</em>

# text
seg-37c841945d3e = Modèle d'erreur de l'IMU (facteur d'échelle, désalignement, sensibilité à g, quantification, rampe de vitesse)

# text
seg-b7547264e608 = cinq catégories systématiques

# text
seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2 ; Groves { "2013" } §{ "4.3" }, Tableau { "4.1" }

# text
seg-c24b9890cf3b = modèle

# text
seg-67a38b3fe143 = Mécanisation à composantes liées (NED, nord-est-bas ; effets de cône et de godille)

# text
seg-832b3645b515 = attitude par quaternions §{ "2.2" }, §{ "5.5" } ; mécanisation NED §{ "5.4" } ; pesanteur §{ "2.4" }

# text
seg-58c85c15b0aa = Groves, <em>Principles of GNSS (système mondial de navigation par satellite), Inertial, and Multisensor Integrated Navigation Systems</em>, 2e éd.

# text
seg-ac7ef2be17e0 = { "3" }. Paramètres de transfert de temps et de fréquence

# text
seg-7634c6f4b32c = Liaison

# text
seg-dddf65bbb231 = Bidirectionnelle optique en espace libre (inter-satellites)

# text
seg-e3a8990e650a = plancher de laboratoire ~{ "1" } fs ; objectif crédible en orbite : { "1" } ps

# text
seg-1adf3425eda9 = Giorgetta et al. ({ "2013" }, <em>Nature Photonics</em>) ; Deschênes et al. ({ "2016" }, <em>Physical Review X</em>)

# text
seg-9ab60d7ed2a9 = TWSTFT (transfert bidirectionnel de temps et de fréquence par satellite, bande Ku)

# text
seg-543939310789 = session unique ~{ "0.5" } ns

# text
seg-7f6127bdb4d9 = BIPM (Bureau international des poids et mesures) / PTB (Physikalisch-Technische Bundesanstalt, l'institut national allemand de métrologie) / NIST (National Institute of Standards and Technology)

# text
seg-d1f0ed9c0323 = { "4" }. Modèles d'orbite, de systèmes de temps et de référentiels

# text
seg-2ad53ecbee02 = Équation / norme

# text
seg-7ed15b9389e0 = Référence (commentaire de la source)

# text
seg-4d6989c7153e = Propagation SGP4/SDP4 (SGP4 : Simplified General Perturbations { "4" } ; SDP4 : Simplified Deep-space Perturbations { "4" })

# text
seg-0d46975247cc = le modèle SGP4 en WGS-72 (WGS : World Geodetic System)

# text
seg-6dcfe89aeb8f = Vallado et al., <em>« Revisiting Spacetrack Report #3 »</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

# text
seg-e46bf46a4d35 = Seconde intercalaire / systèmes de temps (UTC/TAI/TT/UT1 (UTC : temps universel coordonné ; TAI : temps atomique international ; TT : temps terrestre ; UT1 : temps universel { "1" }, temps de rotation de la Terre))

# text
seg-7505e93b9bf8 = régime de secondes intercalaires entières depuis 1972-01-01

# text
seg-0ea35809be61 = IERS (Service international de la rotation terrestre et des systèmes de référence) Conventions ({ "2010" }) ; historique des secondes intercalaires d'après l'IERS Bulletin C

# text
seg-d25f68665f8e = Angle de rotation de la Terre

# text
seg-a3a803bdc8a0 = IAU (Union astronomique internationale) { "2000" }, résolution B1.8

# text
seg-049ad81ff5e8 = Position/horloge d'un SV (véhicule spatial, c'est-à-dire un satellite) d'après les éphémérides diffusées

# text
# c1: F·e·√A·sin Eₖ
# c2: TGD
seg-a1a595008b2a = algorithme utilisateur, <c1/> relativiste, <c2/>

# text
seg-8e2e3089e2e6 = IS-GPS-200 (IS : Interface Specification ; GPS : Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

# text
seg-8e14a54b1f09 = Constantes d'éphémérides de Galileo / QZSS (système japonais Quasi-Zenith Satellite System) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

# text
seg-93b03e3b3e43 = ICD de SIS par système (documents de contrôle d'interface)

# text
seg-c7c6759c0373 = ICD SIS de Galileo OS (Open Service) ; ICD SIS de BeiDou OS (CGCS2000, China Geodetic Coordinate System { "2000" }) ; ICD de GLONASS (Global Navigation Satellite System russe) (PZ-90 (PZ : Parametry Zemli, le système géodésique russe))

# text
seg-7d59b9c3dabc = { "5" }. Modèles GNSS du domaine des mesures et de la résilience

# text
seg-dd7e88cfd703 = Ionosphère monofréquence de Klobuchar

# text
seg-9920eb06b90c = algorithme en demi-cercles

# text
seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

# text
seg-0358759614c5 = Troposphère zénithale de Saastamoinen

# text
seg-b4b7f91f6112 = retard zénithal hydrostatique + humide

# text
seg-ba06204996b7 = Davis et al. ({ "1985" }) ; Groves §{ "9.4" }

# text
seg-9fc988ebf2aa = Fonctions de projection de Niell

# text
seg-8eb79ff7faaa = hydrostatique et humide, projection en élévation

# text
seg-ca4642e37561 = Niell ({ "1996" })

# text
seg-7876aa9fc732 = Bilan de liaison anti-brouillage

# text
# c1: [1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹
seg-75e1c40bdc0f = <c1/> (C/N₀ le rapport de densité porteuse sur bruit, J/S le rapport brouilleur sur signal, Q le facteur de séparation spectrale, Rc le débit de chips) → C/N₀ effectif → perte de verrouillage

# text
seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3e éd., §{ "9.4" }

# text
seg-c6e2f2ee16cb = Détection de leurrage / d'énergie

# text
seg-15390c9b849c = Test d'énergie de Neyman–Pearson / χ²₁ bilatéral ; Φ⁻¹ par Acklam ; erf par Abramowitz & Stegun { "7.1.26" }

# text
seg-1c30c0b6a81f = théorie classique de la détection

# text
seg-023867611249 = Stabilité de la famille d'Allan (ADEV/MDEV/TDEV/HDEV (ADEV : déviation d'Allan ; MDEV : déviation d'Allan modifiée ; TDEV : déviation temporelle ; HDEV : déviation d'Hadamard))

# text
seg-478bb58f8a7f = avec intervalles de confiance

# text
seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley) ; Kasdin, <em>Proc. IEEE</em> ({ "1995" })

# text
seg-a958238e3d1c = RAIM (surveillance autonome de l'intégrité par le récepteur) / intégrité (HPL/VPL (HPL : niveau de protection horizontal ; VPL : niveau de protection vertical), ARAIM (surveillance autonome avancée de l'intégrité par le récepteur) à séparation de solutions)

# text
seg-41b219635fbe = instantané et séparation de solutions

# text
# c1: INTEGRITY.md
seg-b971eeb2bf2b = voir <a1><c1/></a1>

# text
seg-926261321371 = { "6" }. Jeux de données de validation

# text
# c1: scripts/fetch_*.sh
# c2: realdata-cache/
seg-04863ce407e7 = <b>Politique d'inclusion.</b> Nous versionnons une copie fidèle de chaque jeu de données de validation dont la licence permet la redistribution <em>et</em> dont la taille tient confortablement dans git, de sorte qu'un clone puisse reproduire la validation hors ligne, sans réseau et sans lien rompu. Un jeu de données est <b>soumis à téléchargement</b> (téléchargé par un assistant <c1/> dans <c2/>, ignoré par git, avec seules les petites valeurs de référence <em>dérivées</em> versionnées) uniquement lorsque sa licence ne permet pas clairement la redistribution, ou lorsqu'il est trop volumineux pour git. Chaque jeu de données soumis à téléchargement indique ci-dessous sa raison précise ; rien n'est soumis à téléchargement par commodité.

# text
seg-b966dd26caa6 = Jeu de données

# text
seg-e0351f9b83fc = État dans le dépôt

# text
seg-ea1ad9965f74 = Vecteurs de test SGP4 d'AIAA 2006-6753 (les { "666" })

# text
seg-cb7efe21070c = Validation numérique de SGP4 — pire cas { "4.12" } mm

# text
seg-a624c6877c48 = Vecteurs de référence publiés (Vallado, AIAA)

# text
seg-d90675af2816 = Inclus dans le dépôt

# text
seg-c1cee31c42df = ADEV σ_y(τ) d'horloge optique ⁸⁸Sr (Norcia et al., Science { "366" } :{ "93" }, { "2019" })

# text
seg-232e54a0e396 = validation de l'ajustement de stabilité mesurée d'horloge optique

# text
seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" } ; Zenodo 10.5281/zenodo.3382347)

# text
seg-2bb00a0c58ef = Tuile d'élévation SRTM (Shuttle Radar Topography Mission) v3 de la NASA/USGS (NASA : National Aeronautics and Space Administration ; USGS : United States Geological Survey) N36W117 (Vallée de la Mort, décimée à 6 secondes d'arc, { "722" } Ko)

# text
# c1: .hgt
seg-088a57c3a5b1 = validation du lecteur <c1/> de MNT de terrain (MNT : modèle numérique de terrain) sur un relief réel (bassin de Badwater ≈ −{ "86" } m)

# text
# c1: elevation-tiles-prod
seg-ed90325543c8 = <b>Domaine public</b> (SRTM v3 de la NASA/USGS ; via AWS (Amazon Web Services) Open Data <c1/>)

# text
seg-9607b2318cf5 = Exemples OEM/TDM du Blue Book CCSDS 502.0/503.0 (OEM : Orbit Ephemeris Message ; TDM : Tracking Data Message)

# text
seg-b53475918422 = Validation de l'aller-retour de l'analyseur CCSDS

# text
seg-25d9f396b539 = Exemples de normes publiées (CCSDS)

# text
seg-35dfb14360e3 = Échantillons d'orbite précise SP3 (Standard Product { "3" }, le format d'orbite précise) de l'IGS (International GNSS Service) + de navigation RINEX (Receiver Independent Exchange Format)

# text
seg-5e321b8b5287 = ajustement d'orbite + validation de l'intégrité

# text
seg-ec0b6ff10fc5 = Données ouvertes de l'IGS (libres pour tout usage, avec attribution)

# text
# c1: gps-ops
# c2: galileo
seg-00db9583ce55 = Instantanés TLE (jeu d'éléments à deux lignes) de Celestrak (<c1/>, <c2/>)

# text
seg-4dabd0f62f90 = scénarios de constellations réelles

# text
seg-6e7c8deb24b6 = Conditions de Celestrak (attribution ; TLE (jeux d'éléments à deux lignes) d'origine gouvernementale américaine)

# text
# c1: tests/fixtures/celestrak/
# c2: scripts/fetch_tles.sh
seg-2827577f7008 = <c1/> + <c2/> en direct

# text
seg-c0945969860a = Sorties de référence de scipy / scikit-learn / filterpy

# text
seg-61546d769e23 = validation des noyaux numériques + des estimateurs

# text
seg-b74e03fddbca = Générées localement à partir de bibliothèques BSD/MIT (BSD : licence Berkeley Software Distribution)

# text
# c1: tests/fixtures/scipy/
seg-9d818fc79012 = <c1/> (+ scripts générateurs)

# text
seg-4d6c3069b01f = Déviations de référence de Stable32 (échelles décennales d'ADEV/HDEV)

# text
seg-0a7b677330a6 = parité des estimateurs d'Allan

# text
seg-3c91f9ae6473 = Valeurs de synthèse dérivées (petites)

# text
seg-14aecb331164 = Série de phase <b>brute</b> du césium 5071A ({ "556 990" } points, { "12" } Mo)

# text
seg-9d43f399613b = ADEV/HDEV à recouvrement sur une vraie horloge au Cs

# text
# c1: allantools
seg-87b53409bedb = <b>Incertain</b> — <c1/> est sous LGPL-3.0 (GNU Lesser General Public License, une licence logicielle) sans <em>aucune autorisation explicite de redistribution des données</em> ; le fichier est exclu de la distribution PyPI (Python Package Index)

# text
# c1: scripts/fetch_cs5071a.sh
seg-b741be74c8ad = <c1/> ; échelles dérivées versionnées

# text
seg-5e07eabcfe78 = PHASE.DAT <b>brut</b> (série de régression de 1000 points)

# text
seg-d9f61f4b985c = Série de parité des estimateurs de Stable32

# text
seg-df8e0a135895 = <b>Incertain</b> — distribué avec le Stable32 commercial (Hamilton Technical Services) ; NIST SP { "1065" } est dans le domaine public mais n'imprime pas les valeurs

# text
# c1: scripts/fetch_phasedat.sh
seg-332b36d2b91f = <c1/> ; échelles dérivées versionnées

# text
seg-dd2ee7a9f1fa = Capture de brouillage/leurrage GNSS JammerTest { "2024" } ({ "1.4" } Go)

# text
seg-20065daf2305 = étalonnage de scénarios de résilience/d'anomalie

# text
seg-a4410133d410 = GPL-3.0-or-later (GNU General Public License ; Zenodo 10.5281/zenodo.15910563) — redistribution permise, mais <b>la taille dépasse la limite de { "100" } Mo par fichier de GitHub</b> et le copyleft de la GPL entre en conflit avec l'arborescence sous AGPL (Affero General Public License)

# text
seg-d4c7d2f9ea0d = <b>Soumis à téléchargement</b> ; citer le DOI (identifiant d'objet numérique)

# text
seg-c0e39f83efcd = Le statut de licence de chaque jeu de données soumis à téléchargement a été vérifié auprès de l'autorité d'origine ; les deux jeux de données d'horloge « incertains » restent soumis à téléchargement dans l'attente d'une autorisation explicite de redistribution (nous versionnons déjà les valeurs que nous <em>sommes</em> autorisés à publier), et le jeu JammerTest est soumis à téléchargement pour des raisons de taille et de copyleft malgré sa licence ouverte.

# text
seg-e104e19931d4 = { "7" }. Domaines plus récents — d'où viennent leurs paramètres

# text
# c1: VERIFICATION-MATRIX.md
seg-c11f7c73d10b = Les types de scénario ajoutés depuis les tableaux ci-dessus suivent la même règle. Chaque ligne nomme la source et le statut dans la matrice de vérification de la capacité qui s'y appuie (<a1><c1/></a1> donne la ligne complète).

# text
# c1: telecom-timing
seg-5d2c25dd2ff3 = Synchronisation télécom (<c1/>)

# text
seg-c2ae6b1fe666 = gabarits de synchronisation

# text
# c1: TELECOM-TIMING.md
seg-e247606fe749 = Recommandations de l'UIT-T (Secteur de la normalisation des télécommunications de l'Union internationale des télécommunications), chaque limite avec son tableau ou son article, listées dans <a1><c1/></a1>

# text
seg-1150ab344107 = MODELLED (transcription)

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-01d31590ca44 = préréglages d'oscillateur <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: TELECOM-TIMING.md
seg-9a4c0c214c54 = quatre fiches techniques de Microchip, numéros de document dans <a1><c1/></a1>

# text
seg-a03ea8950ab0 = estimateurs de MTIE (erreur maximale d'intervalle de temps) et de TDEV (déviation temporelle)

# text
# c1: tests/fixtures/telecom_timing/
seg-389e18e1a900 = allantools { "2024.06" } sur <c1/>

# text
# c1: solar-system
# c2: body-pnt
seg-29edfc0f6a6d = Système solaire (<c1/>, <c2/>)

# text
seg-df22756e5209 = positions des planètes d'après les éléments képlériens de Standish du JPL (Jet Propulsion Laboratory)

# text
# c1: tests/fixtures/solar_system/
seg-194e3a13d51a = vérifiées par rapport aux vecteurs d'état JPL Horizons DE441 (Development Ephemeris { "441" }) dans <c1/>

# text
seg-6d23934b3cb7 = VALIDATED ; Uranus, Neptune, Pluton et les lunes MODELLED

# text
seg-a2624ce2e89a = paramètres gravitationnels, rayons et rotation de chaque corps

# text
seg-4d501821b508 = fiches de corps de JPL Horizons et table des paramètres physiques des satellites du JPL

# text
# c1: constellation-design
seg-f2715a76f0ec = Conception de constellations (<c1/>)

# text
seg-784e471cdada = créneaux nominaux de GPS, Galileo et GLONASS

# text
seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" } ; GPS Standard Positioning Service Performance Standard, 5e édition

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
seg-b5e3dc8605b1 = PNT en orbite terrestre basse (LEO) (<c1/>, <c2/>, <c3/>)

# text
seg-0a535468ad51 = préréglages de systèmes nommés

# text
seg-aae7fe16f69a = les chiffres publics cités, chaque préréglage avec sa source

# text
# c1: leo-navmsg
seg-a72c37136e3a = Message de navigation LEO (<c1/>)

# text
seg-ac50550a250f = pondérations d'erreur de distance du signal dans l'espace

# text
seg-5dae296d5484 = Montenbruck, Steigenberger et Hauschild ({ "2018" }), <em>Advances in Space Research</em>

# text
seg-9148986e8610 = modèle d'éphéméride à 22 paramètres

# text
seg-5b82ad0bd2c9 = Liu et al. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }) :{ "2894" }

# text
seg-2080b4fc31a8 = Pied de page de provenance des graphiques

# text
# c1: *.chart.svg
# c2: *.report.html
seg-22d0b06d5df4 = Chaque graphique que Kshana produit — dans le bac à sable du navigateur, dans l'export <c1/> de la CLI (interface en ligne de commande) et dans le graphique du rapport imprimable <c2/> (HTML, HyperText Markup Language) — est estampillé, en bas à droite, de :

# text
# c1: scenario <hash>
# c2: scenario_hash
# c3: scenario_hash
seg-d8b4de856202 = Le <c1/> correspond aux { "12" } premiers caractères hexadécimaux du <b>hachage du scénario</b> de l'exécution : un SHA-256 (SHA : Secure Hash Algorithm) calculé sur la définition <em>canonique</em> du scénario (graine, seuils, paramètres de modèle, fenêtres GNSS, etc.). C'est la même empreinte que celle qui apparaît dans le résumé d'exécution d'une ligne et dans le champ <c2/> du JSON de résultat. (Les types de scénario dont le document de résultat ne comporte pas de <c3/>, tels que les rapports d'intégrité et lunaires, se rabattent sur un SHA-256 du TOML source du scénario (Tom's Obvious, Minimal Language), de sorte que chaque graphique ait quand même une empreinte stable.)

# text
seg-8d218131da01 = Comme le hachage est déterministe et sensible aux entrées, une image de graphique enregistrée ou collée s'identifie d'elle-même : elle consigne la version du moteur, le scénario exact qui l'a produite (pour une reproduction bit à bit) et la source — et tout paramètre modifié donne un hachage différent, de sorte qu'un graphique mal étiqueté est détectable.

# text
seg-89c9b001868f = Comment citer et reproduire

# text
# c1: scenario + seed + engine version
# c2: CITATION.cff
# c3: provenance
seg-6eca19b7978c = Chaque résultat est reproductible à partir de <c1/>. Citez le moteur via <a1><c2/></a1> / le DOI de concept Zenodo <a2>10.5281/zenodo.20528627</a2>, et citez les sources des <em>paramètres</em> ci-dessus pour les chiffres dont dépend une exécution donnée — elles voyagent dans les champs <c3/> du JSON de résultat, de sorte qu'un résultat publié se documente lui-même.

# text
seg-c5c58ef3771c = Lorsqu'un chiffre est un objectif spatial sur matériel au sol (tout chiffre d'horloge optique au strontium) ou une démonstration de laboratoire au sol (accéléromètre à atomes froids), ce document et la provenance du résultat le disent explicitement. Kshana ne présente pas des chiffres de laboratoire ou d'objectif comme des performances en vol.

# text
seg-925d456df88c = <s1>Précédent</s1>Affirmations et réalité

# text
seg-19e8fefd1ceb = <s1>Suivant</s1>Reproductibilité
