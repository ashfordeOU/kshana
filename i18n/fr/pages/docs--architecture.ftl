# docs--architecture: translations (fr)

# text
# c1: docs/ARCHITECTURE.md
seg-e366c6dd500e = Source : <c1/>

# text
seg-1f25b7fa1187 = Kshana — Architecture

# text
seg-b0136a82669c = Kshana est <b>un seul moteur</b> organisé en couches au-dessus d'un noyau partagé : les <b>paquets de capteurs</b> (horloge, inertiel, transfert de temps, hybride) ; une couche d'<b>astrodynamique / numérique</b> (SGP4/SDP4 analytique (SGP4 : Simplified General Perturbations { "4" } ; SDP4 : Simplified Deep-space Perturbations { "4" }), un propagateur numérique de Cowell avec son modèle de forces à sept perturbations, la conception de manœuvres, la détermination d'orbite à partir de distances de stations au sol, et l'ajustement du modèle de forces aux éphémérides précises d'agences) ; une couche de <b>temps et de référentiels</b> (échelles de temps IERS (International Earth Rotation and Reference Systems Service), précession–nutation IAU (Union astronomique internationale) 2006/2000A, et réduction CIO (Celestial Intermediate Origin) GCRS↔ITRS (GCRS : Geocentric Celestial Reference System ; ITRS : International Terrestrial Reference System)) ; une couche de <b>fusion</b> (les estimateurs GNSS/INS (GNSS : système mondial de navigation par satellite ; INS : système de navigation inertielle)) ; et les couches d'<b>intégrité, de résilience, de PNT alternatif (PNT : positionnement, navigation et synchronisation temporelle) et lunaire</b> (RAIM/ARAIM/SBAS (RAIM : surveillance autonome de l'intégrité par le récepteur ; ARAIM : surveillance autonome avancée de l'intégrité par le récepteur ; SBAS : système d'augmentation satellitaire), brouillage et détection de leurrage multicouche, recalage sur cartes de gravité/terrain/magnétisme, et PNT cislunaire) ; ainsi que les couches plus récentes <b>LEO-PNT</b> (PNT en orbite terrestre basse), <b>spectre</b>, <b>système solaire et conception de constellations</b>, <b>synchronisation de réseau</b> et <b>campagne</b>, avec les rédacteurs de rapport, d'animation et d'interopérabilité que toute exécution peut utiliser (§1d). Dans toutes ces couches, le moteur ne sait rien du « quantique » face au « classique » : il pilote des <em>modèles d'erreur</em> de capteurs à travers un scénario de coupure GNSS, exécute un estimateur et note le résultat. Un dispositif quantique et un dispositif classique sont donc comparés sur le même scénario, ne différant que par leurs paramètres d'erreur (publiés, cités) et leurs graines de bruit indépendantes.

# text
seg-02110864419e = Ce document rassemble les diagrammes structurels et comportementaux. Le §{ "1" } est le noyau des paquets de capteurs ; le §1a cartographie les couches d'astrodynamique, de fusion et de PNT alternatif ajoutées depuis ; les §1b–§1d les couches d'étude, de domaine et de sortie. Pour l'usage, voir le <a1>README</a1> ; pour ce qui est et n'est pas validé, voir <a2>VALIDATION</a2> ; pour le tableau de maturité par capacité, voir <a3>CAPABILITY</a3>.

# text
seg-7bcc7b5cd049 = Abréviations utilisées dans les diagrammes et non développées là où elles apparaissent : ADEV, déviation d'Allan ; BW, largeur de bande ; CAI, interféromètre à atomes froids ; CZML, le Cesium Language ; Δ-DOR, mesure de distance différentielle unidirectionnelle delta ; DO-229E, la norme de récepteur SBAS de la RTCA (Radio Technical Commission for Aeronautics) ; EKF, filtre de Kalman étendu ; FM, modulation de fréquence ; GSE, équipement de soutien au sol ; HPL/VPL, niveau de protection horizontal/vertical ; IMU, centrale inertielle ; IOAG, Interagency Operations Advisory Group ; IQ, échantillons en phase/quadrature ; ISL, liaison inter-satellites ; ITU-T, le secteur de la normalisation des télécommunications de l'Union internationale des télécommunications ; J2–J6, les harmoniques zonales du champ de gravité terrestre de degré { "2" } à { "6" } ; KIF, le Kshana Interchange Format ; KML, Keyhole Markup Language ; KPI, indicateur clé de performance ; L1/L5, bandes porteuses GNSS (le L2 des orbites en halo du CR3BP est en revanche le point de Lagrange Terre–Lune { "2" }) ; LEO, orbite terrestre basse ; LOO, leave-one-out (en omettant un à la fois) ; LTC, temps universel coordonné lunaire ; MEO, orbite terrestre moyenne ; MTIE, erreur maximale d'intervalle de temps ; N2, le nombre de diversité de Hill d'ordre 2 ; NED, nord-est-bas ; NTN, réseau non terrestre ; OD, détermination d'orbite ; OPS-SAT, le satellite-laboratoire logiciel en orbite de l'Agence spatiale européenne ; PPP, positionnement précis par point ; PSD, densité spectrale de puissance ; PVT, position, vitesse et temps ; RINEX, Receiver Independent Exchange Format ; RK4 / RK5({ "4" }), intégrateurs de Runge–Kutta d'ordre quatre et d'ordre cinq(quatre) emboîté ; SH, harmonique sphérique ; SigMF, Signal Metadata Format ; SIR, rééchantillonnage par importance ; SRIF, filtre d'information en racine carrée ; SRP, pression de radiation solaire ; SSC, coefficient de séparation spectrale ; STK, Systems Tool Kit ; SVG, Scalable Vector Graphics ; TDEV, déviation de temps ; TDM, le Tracking Data Message du CCSDS (Consultative Committee for Space Data Systems) ; TLE, jeu d'éléments à deux lignes ; TPL, Timing Protection Level ; UBX, le protocole binaire de u-blox ; UHF, ultra haute fréquence ; VLBI, interférométrie à très longue base ; VRW / ARW, marche aléatoire de vitesse / d'angle ; WASM, WebAssembly.

# text
seg-a87f668a8f97 = { "1" }. Structure des modules

# text
# c1: api::run_toml
# c2: types
# c3: scenario
# c4: allan
# c5: hybrid
# c6: orbit
# c7: navsignal
# c8: κ
# c9: jamming
# c10: Q = 1/(R_c·κ)
seg-0388999448a6 = La CLI (interface en ligne de commande) et les deux liaisons passent par un seul point d'entrée <c1/>, de sorte qu'elles ne divergent jamais. Les paquets réutilisent le noyau partagé (<c2/>, <c3/>, <c4/>) ; le paquet { "4" } (<c5/>) compose les modèles et estimateurs des paquets { "1" }–{ "3" } au lieu de les réimplémenter ; <c6/> dérive une chronologie GNSS à partir de la géométrie, qui alimente ensuite l'exécution du paquet { "1" }. Le module <c7/> se situe au niveau du signal, entre le bilan de liaison et le domaine des mesures : il dérive le coefficient de séparation spectrale <c8/> à partir des spectres de puissance réels du signal et du brouilleur, à partir duquel <c9/> calcule désormais son <c10/> antibrouillage au lieu de prendre une constante représentative (recoupé en CI (intégration continue)) ; il porte aussi l'arbitrage de conception des codes de télémétrie (séquence m/Gold).

# text
# c1: holdover
# c2: clock_state
# c3: inertial::quantum_imu
# c4: QuantumNavBudget
# c5: AccelModel
# c6: verification
seg-cee4eb61a8e9 = Trois autres modules forment l'ossature de <b>résilience en l'absence de GNSS</b>. <c1/> répond directement à la question opérationnelle — <em>combien de temps cette horloge peut-elle dériver librement avant que son erreur de synchronisation temporelle ne dépasse le budget ?</em> — en exposant la forme close de l'erreur de dérive de van Loan comme une inversion holdover-vers-seuil, recoupée avec la récurrence de covariance <c2/> en plusieurs pas. Son jumeau inertiel vit dans <c3/> (<c4/>), qui compose la dérive de bruit blanc de l'interféromètre à atomes froids avec l'erreur de biais et de facteur d'échelle en un budget de dérive de position sur le holdover (le terme de biais étant recoupé avec l'intégrateur indépendant <c5/>). <c6/> produit toute la matrice exigence → module → test → référence indépendante → état du moteur, avec des invariants testés unitairement qui interdisent une étiquette <em>validé</em> sans référence indépendante externe — de sorte que l'affirmation d'assurance ne peut pas diverger du code.

# text
seg-c7bee352c04d = 1a. Couches d'astrodynamique, de fusion et de PNT alternatif

# text
# c1: orbit
# c2: kind
seg-99c44e3a86d5 = Au-delà du noyau des paquets de capteurs, trois sous-systèmes partagent le même noyau partagé et alimentent <c1/> (ou en sont alimentés). La couche d'<b>astrodynamique / numérique</b> ajoute un propagateur de Cowell non analytique à côté du chemin analytique SGP4/SDP4 ; la couche de <b>fusion</b> porte les estimateurs GNSS/INS ; et la couche de <b>PNT alternatif</b> est le recalage sur cartes de gravité en l'absence de GPS (GPS : Global Positioning System). Ce sont des capacités de bibliothèque/scénario (voir <a1>CAPABILITY</a1> pour savoir lesquelles sont câblées à un <c2/> de scénario et lesquelles sont accessibles comme API (interface de programmation d'application) Rust).

# text
# c1: forces
# c2: integrator
seg-69f93294d2c8 = Les termes de force du propagateur numérique sont désactivés par défaut, de sorte que les activer ne perturbe jamais les références publiées. L'UKF (filtre de Kalman sans parfum) à 17 états, étroitement couplé, traverse une coupure GNSS sur la marche aléatoire de vitesse dérivée de l'accéléromètre quantique à atomes froids ; la détermination d'orbite réutilise les mêmes <c1/>/<c2/> pour propager un état candidat sur l'arc de poursuite.

# text
# c1: timescales
# c2: jd2
# c3: precession
# c4: nutation
# c5: cio
# c6: frames
# c7: eop
# c8: ephemeris
# c9: raim
# c10: sbas
# c11: jamming
# c12: spoof
# c13: spoof_detect
# c14: spoof_monitors
# c15: detection
# c16: navsignal
# c17: κ
# c18: jamming
# c19: Q
# c20: lunar
# c21: lunar_frame
# c22: lunar_od
# c23: cr3bp
# c24: cr3bp_jacobian
# c25: propagate_state_stm
# c26: differential_correct_halo
# c27: precise_od
# c28: lunar_od
# c29: tides
# c30: gravity_sh
# c31: igrf
# c32: altpnt/terrain
# c33: gravimeter
seg-bd87e20c284b = Le même noyau partagé porte aussi quatre autres sous-systèmes non dessinés plus haut (leurs paquets apparaissent dans la répartition du §{ "4" }) : une couche de <b>temps et de référentiels</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>) réduisant TEME↔GCRS↔ITRS (TEME : true equator, mean equinox) et alimentant le paquet <c8/>/trace au sol ; une couche d'<b>intégrité</b> (<c9/>, <c10/>) pour RAIM/ARAIM/SBAS ; une couche de <b>résilience</b> (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) pour le brouillage et la détection de leurrage multicouche, avec une couche de <b>signal de navigation</b> (<c16/>) au niveau du signal — densités spectrales de puissance BPSK-R (BPSK : modulation par déplacement de phase binaire) / sine-BOC (BOC : porteuse à décalage binaire), coefficient de séparation spectrale <c17/> qui dérive désormais le <c19/> antibrouillage de <c18/>, largeur de bande de télémétrie RMS (Gabor), gigue de poursuite de code DLL (boucle à verrouillage de délai) cohérente early–late, et enveloppe d'erreur de trajets multiples (analyse de performance du signal, <b>pas</b> conception de charge utile RF (RF : radiofréquence) / de matériel d'antenne — rôle d'un partenaire de charge utile) ; et une couche <b>lunaire / cislunaire</b> (<c20/>, <c21/>, <c22/>, <c23/>) pour la dynamique CR3BP (problème restreint circulaire à trois corps) — y compris la matrice de transition d'état { "6" }×{ "6" } et un correcteur différentiel à tir simple (<c24/>, <c25/>, <c26/>) qui produit des orbites en halo/NRHO (NRHO : near-rectilinear halo orbit) véritablement périodiques, reproduisant la NRHO australe L2 { "9" }:{ "2" } publiée (l'orbite Gateway) avec une période ≈ { "6.57" } j / un périlune ≈ { "3,250" } km (publié ≈ { "6.56" } j / ≈ { "3,370" } km) ; la transformation sélénocentrique MCI/MCMF (MCI : inertiel centré sur la Lune ; MCMF : centré sur la Lune et fixe par rapport à elle) d'une orbite corrigée et la continuation de famille restent des suites à donner, et la NRHO est une solution CR3BP (circulaire, sans Soleil), non validée par rapport à une véritable éphéméride LANS/Gateway (LANS : Lunar Augmented Navigation Service) — et l'intégrité LunaNet. L'ajustement du modèle de forces aux éphémérides d'agences (<c27/>, <c28/>, <c29/>, <c30/>) et l'ensemble complet des champs de PNT alternatif (<c31/>, <c32/>, <c33/>) complètent la liste des modules ; voir <a1>CAPABILITY</a1> pour la maturité par module.

# text
seg-05f8c8c84d15 = 1b. Études de résilience, évaluation par apprentissage automatique et artefacts reproductibles

# text
# c1: kind
# c2: cargo run --example
# c3: --bin
seg-7350971daf4e = Cinq autres groupes de modules forment la couche d'<b>études ouvertes et reproductibles</b> derrière les articles de recherche du projet. Contrairement aux <c1/> de scénario, on y accède par des générateurs <c2/> / <c3/> qui écrivent des artefacts <b>déterministes à l'octet près</b> (graines fixes, version du moteur et empreinte de configuration consignées). Tous sont <b>MODELLED</b> (étalonnage synthétique ou sur jeu de données public) et portent des étiquettes de validation honnêtes — aucun n'est une certification.

# text
# c1: tpl
seg-86b177166f0e = <b><c1/></b> — le Timing Protection Level conditionnel : une borne limitée par le holdover sur l'erreur de temps <em>non détectée</em> sous leurrage, composant un plancher de moniteur à k sigma, la variance de dérive de van Loan sur la latence de détection, et un temps jusqu'à l'alarme CUSUM (somme cumulée) ; étalonné sur un vrai leurrage enregistré (JammerTest { "2024" }). Il n'existe aucune borne <em>inconditionnelle</em> finie — le TPL est conditionnel à ce qu'un contrôle croisé indépendant détecte l'attaque.

# text
# c1: resilience/
seg-8c9d1d90dc8e = <b><c1/></b> — un moteur de notation de la résilience PNT aligné sur des cadres (catégories RPCF (Resilient PNT Conformance Framework) du DHS (Department of Homeland Security)) plus une étude d'instabilité de décision : un simplexe de pondération de Dirichlet, l'instabilité de rang de Kendall-τ, le taux de basculement du vainqueur top-1, et l'<b>effondrement de la diversité</b> en mode commun (Hill-N2), avec un rapport d'assurance à empreinte d'intégrité et { "35" } tests de référence dérivés à la main. Voir <a1>RESILIENCE-CROSSWALK</a1>. Architectures synthétiques alignées sur RPCF v2.0 — une auto-évaluation, et non une certification.

# text
# c1: impairment_eval
# c2: impairment_study
# c3: impairment_ml
# c4: eval_stats
seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — l'étude de l'écart d'optimisme des dégradations RF : un corpus synthétique étiqueté et un banc ROC/AUC (ROC : caractéristique de fonctionnement du récepteur ; AUC : aire sous la courbe) indépendant du détecteur, un panel de 13 détecteurs (énergie/AGC/SQM/parité (AGC : commande automatique de gain ; SQM : surveillance de la qualité du signal) plus des détecteurs à régression logistique et à MLP (MLP : perceptron multicouche) à une couche cachée, avec graine), des lois d'échelle dans la distribution et hors distribution avec une hypothèse nulle par permutation, et un prédicteur leave-one-out de la dégradation hors distribution. Les métriques d'évaluation sont validées bit pour bit par rapport à scikit-learn.

# text
# c1: sdr
# c2: realdata
seg-36206681024f = <b><c1/> / <c2/></b> — un frontal de récepteur défini par logiciel (IQ/IF brut (IQ : en phase/quadrature ; IF : fréquence intermédiaire) → prises early/prompt/late du corrélateur → SQM) et des adaptateurs d'ingestion (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) qui permettent de faire tourner les mêmes détecteurs sur des enregistrements fournis localement ; aucun jeu de données n'est versionné dans le dépôt.

# text
# c1: crossover
# c2: quantum_trade
seg-fefd78868fc2 = <b><c1/> / <c2/></b> — la carte de croisement de résilience quantique contre classique sous incertitude des paramètres, et l'arbitrage du bénéfice de holdover sur ADEV mesurée ; les noyaux numériques de l'arbitrage sont validés par rapport à scipy.

# text
seg-5749f1300772 = 1c. Couches d'intégrité, de GNSS, d'espace lointain, lunaires et de mission

# text
# c1: api
# c2: verification
seg-f44755d6d921 = Les domaines restants se branchent sur la même répartition <c1/> et réutilisent le noyau partagé, les référentiels et la géométrie. Tout ce qui figure ici est <b>MODELLED</b>, sauf si une ligne de la matrice <c2/> cite une référence indépendante externe (noyau RAIM par rapport à SciPy, SBAS par rapport au fork RTKLIB (une bibliothèque libre de positionnement cinématique en temps réel), noyau DOP (dilution de précision) de gnss_lib_py, l'évaluation OPS-SAT, le noyau de niveau de protection ARAIM lunaire, la cohérence d'éphéméride lunaire entre fournisseurs) — le reste de la suite lunaire et le démonstrateur quantique sont modélisés, illustratifs, de source publique, et ne portent aucune affirmation de TRL (niveau de maturité technologique) / d'héritage / d'aval d'une agence.

# text
seg-044940c8d052 = 1d. PNT LEO, spectre, système solaire, synchronisation de réseau, campagnes et sorties

# text
# c1: kind
# c2: api
seg-253a26d9cc5d = Les couches les plus récentes suivent le même schéma : chacune est un ou plusieurs <c1/> de scénario répartis depuis <c2/>, bâtis sur le noyau partagé, et MODELLED sauf si une ligne de la matrice nomme une référence indépendante externe.

# text
seg-e47cccd54da3 = Le détail par type figure dans <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> et <a13>INTEROP</a13>.

# text
seg-d04b21c7cb6c = 1e. Couches de confiance du récepteur, de preuves, de télémétrie, de formation et de compliance ({ "0.35" })

# text
# c1: api
# c2: receiver-trust
seg-84ee122959b4 = Ces couches lisent le journal propre d'un récepteur ou écrivent des fichiers pour d'autres outils ; aucune ne synthétise ni n'émet de signal radiofréquence. Elles se situent à côté de <c1/> plutôt que sous les types de scénario, hormis <c2/> lui-même, qui est un type de scénario. Tout est MODELLED sauf si une ligne de la matrice nomme une référence indépendante externe, et les sorties maritimes sont à titre consultatif, pas un équipement de navigation homologué.

# text
seg-aab745a65e76 = Module

# text
seg-9d17ad3e87c8 = Documenté dans

# text
seg-920b6b14c0e2 = note un journal de récepteur époque par époque avec les moniteurs de confiance ; une plateforme navire ajoute les moniteurs maritimes et le score de 0 à 100 avec les motifs

# text
seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

# text
# c1: $PKSHT
# c2: LiveEngine
seg-c311dfc2a161 = la même notation sur un flux au fur et à mesure de son arrivée (stdin, un fichier en cours d'ajout, TCP ou UDP), la phrase <c1/> et la passerelle facultative ; <c2/> en est la totalité, sans entrée ni sortie

# text
seg-07b2d6edf7b9 = un paquet signé, à chaîne d'empreintes, d'une fenêtre de journal, de sa configuration et du résultat du moteur, vérifiable hors ligne ; jeton d'horodatage RFC { "3161" } facultatif

# text
# c1: otlp
seg-32d08730b9c0 = le flux de confiance sous forme de métriques Prometheus, d'événements syslog (CEF ou LEEF) et, en option, d'OpenTelemetry (fonctionnalité <c1/>, désactivée par défaut)

# text
seg-53311b8c3b93 = NMEA { "0183" } synthétique pour un pont, avec des événements scénarisés de brouillage, de décrochage progressif (drag-off), de leurrage temporel et de rejeu, et un journal d'instructeur, pour la formation des équipages (texte seul)

# text
seg-f7cc3cfbdfc6 = cartes agrégées de navigation dégradée issues de rapports d'aéronefs et de navires sous licence ouverte, et exposition d'un itinéraire à ces dégradations ; fichiers locaux uniquement

# text
# c1: osnma::cli::verify_report
seg-83fe3c87e2d5 = un vérificateur côté récepteur pour Galileo OSNMA : il lit les pages I/NAV (pages brutes, CSV vectoriel, flux UBX), contrôle la clé signée, la chaîne TESLA et les MAC, et indique pour chaque satellite si les données de navigation sont authentifiées ; <c1/> est le chemin unique que partagent la ligne de commande, Python et WebAssembly ; état d'authentification uniquement, pas un service d'intégrité

# text
seg-bf8cd5a45deb = OSNMA

# text
# c1: run_from_text
# c2: assess_texts
seg-843a83b82283 = associe les sorties de Kshana à des cadres publics de résilience et renseigne cette correspondance à partir de documents de résultats ; <c1/> et <c2/> prennent des textes, pas des chemins

# text
seg-e16c483479ce = le mouvement du véhicule et les événements d'un scénario sous forme de CSV de mouvement, de NMEA, de texte de points de passage et de fichiers d'événements pour un simulateur GNSS de laboratoire ; aucun signal n'est écrit

# text
seg-044c58c98397 = Les intégrations pour bateaux (le plugin Signal K, le mode passerelle d'OpenCPN et la version de référence) appellent l'outil en ligne de commande ; voir <a1>MARINE-INTEGRATIONS</a1>.

# text
seg-cb8d8ff847eb = { "2" }. Chaîne de traitement du moteur (par exécution)

# text
seg-53e9e596ca44 = Chaque exécution fait avancer un modèle de capteur unique sur la grille temporelle : il est asservi tant que le GNSS est nominal et laissé en marche libre (holdover / navigation à l'estime) pendant la coupure.

# text
# c1: classical_seed = seed + 0x9e3779b97f4a7c15
seg-257407f3c375 = Un scénario exécute cette chaîne deux fois, une fois pour le capteur quantique et une fois pour le capteur classique, avec des <b>graines indépendantes</b> (<c1/>) afin que les deux réalisations du bruit ne soient pas corrélées.

# text
seg-4659e89ba5f5 = { "3" }. L'interface du modèle d'erreur (le point d'extension)

# text
# c1: step()
seg-7b70e8b1b98a = Chaque capteur met en œuvre la même idée : un objet à état dont <c1/> fait avancer l'erreur stochastique interne et dont l'état cumulé est lu à chaque pas. Les horloges exposent la phase cumulée ; les accéléromètres exposent la position doublement intégrée ; les liaisons exposent la gigue par mesure.

# text
# c1: ModelSpec { id, kind, provenance, params }
# c2: provenance
seg-79ab76c6dbc0 = <c1/> est transmis dans le résultat afin que chaque valeur de la sortie soit traçable jusqu'à la source publiée nommée dans <c2/>.

# text
# c1: HoldoverEstimator
# c2: KalmanClock
# c3: q_wf·T + q_rw·T³/3
seg-514c49659947 = En plus de l'estimateur analytique <c1/>, le paquet d'horloge exécute un filtre de Kalman à deux états (phase, fréquence) (<c2/>) dont le bruit de processus correspond au modèle de vérité. En roue libre pendant une coupure, la variance de son erreur de phase croît exactement jusqu'à <c3/>, la relation analytique du holdover, et sa borne à 1 σ en ligne sert à renseigner la mesure de mérite d'<b>intégrité</b> (fraction des échantillons de la coupure dont l'erreur reste dans la borne à k σ).

# text
seg-7404589deb40 = { "4" }. Répartition (CLI et liaisons)

# text
# c1: api::run_toml(src)
# c2: kind
# c3: { json, svg, summary, csv }
# c4: csv
# c5: report.html
# c6: report.json
# c7: --export
# c8: --animate
seg-6138513a43f7 = <c1/> est le point d'entrée unique : il examine le <c2/> de premier niveau, désérialise le scénario correspondant, exécute le paquet et renvoie <c3/> (<c4/> n'est présent que pour les types qui publient un tableau de reproductibilité). La CLI les écrit dans des fichiers, ainsi que le rapport (<c5/>, <c6/>) et toute sortie <c7/> / <c8/> ; les liaisons Python et WebAssembly les renvoient à l'hôte. Une seule répartition, aucune dérive.

# text
# c1: ScenarioKind
# c2: kind
# c3: clock
# c4: serde
# c5: kind
# c6: kind
# c7: KshanaError::InvalidInput
seg-524f749be364 = La répartition se fait sur une énumération typée <c1/>, appariée de façon exhaustive (voir la sous-section suivante) ; ajouter un paquet est donc une modification vérifiée à la compilation. Un <c2/> absent retombe sur le paquet <c3/>, de sorte que les scénarios existants à type unique se désérialisent sans changement (<c4/> ignore le champ <c5/> de chaque structure de scénario). Un <c6/> non reconnu est refusé avec <c7/>, qui nomme le type intégré le plus proche lorsque le nom ressemble à une faute de frappe.

# text
seg-eedaeae2a7e7 = Répartition typée et API structurée

# text
# c1: ScenarioKind
# c2: ScenarioKind::classify(src)
# c3: kind
# c4: run_toml
seg-ca47f566eaee = La répartition se fait sur une énumération typée <c1/>, et non sur une correspondance de chaîne brute : <c2/> résout le champ <c3/> en une variante, et le répartiteur l'apparie de façon exhaustive ; ajouter un paquet est une modification vérifiée à la compilation, et non une faute de frappe dans une chaîne. Deux surfaces typées existent à côté de <c4/>, qui renvoie une chaîne (conservée pour la CLI et les liaisons existantes) :

# text
# c1: run_scenario(src) -> Result<RunOutput, KshanaError>
# c2: InvalidInput
# c3: NonConvergence
# c4: Unsupported
# c5: IoError
# c6: kind_tag()
# c7: error_kind(toml)
seg-167c47049329 = <b><c1/></b> : l'entrée typée, avec une taxonomie d'erreurs structurée (<c2/>, <c3/>, <c4/>, <c5/>). Chaque erreur porte un <c6/> stable, afin qu'un appelant puisse se brancher sur la catégorie de l'échec au lieu d'analyser le message. Les liaisons l'exposent sous le nom <c7/>.

# text
# c1: list_scenario_kinds() -> Vec<ScenarioMeta>
# c2: list_scenario_kinds_json()
# c3: list_kinds()
seg-1943051b3b20 = <b><c1/></b> (et <c2/>, exposé dans les liaisons sous le nom <c3/>) : introspection programmatique, avec pour chaque type son nom, sa description et ses champs obligatoires ou facultatifs, pour l'interface utilisateur et l'autocomplétion des notebooks.

# text
seg-630243592256 = Étendre Kshana avec un paquet externe

# text
# c1: api
seg-d1adedd2c08b = Un paquet tiers met en œuvre deux petits traits stables au sens de semver issus de <c1/> :

# text
# c1: ExternalPack
# c2: register_into(&mut PackRegistry)
# c3: src/registry.rs
# c4: jamming
# c5: Scenario
# c6: ErrorModel
seg-d01471b13324 = <c1/> possède aussi une méthode <c2/> par défaut, sans effet sauf si un paquet choisit le point d'accès de répartition par registre dans <c3/>. Le paquet intégré <c4/> est branché via <c5/> comme exemple détaillé ; les paquets hors arborescence suivent le même contrat sans dupliquer le cœur (à l'image du point d'extension <c6/> du §{ "3" }, qu'utilise la surcouche privée de résilience).

# text
# c1: ErrorModel
# c2: Scenario
# c3: ExternalPack
seg-5b0449d96bc3 = Kshana possède donc <b>deux points d'extension stables</b> : ajouter un <em>capteur</em> en implémentant <c1/> (§{ "3" }), ou ajouter un <em>type de scénario</em> entier en implémentant <c2/> + <c3/>, tous deux stables au sens de semver, aucun n'exigeant de dupliquer le cœur :

# text
seg-3928a007756b = { "5" }. La pièce maîtresse hybride

# text
# c1: pnt_holdover
seg-7f38e825519a = Le paquet hybride exécute une <em>suite</em> (une horloge et un capteur inertiel) et exige que la synchronisation temporelle <b>et</b> la position restent dans la spécification ; <c1/> est la durée jusqu'à ce que l'une des deux soit dépassée. Facultativement, une liaison optique inter-satellite resynchronise l'<b>horloge</b> pendant la coupure : aide temporelle uniquement ; la position n'est pas resynchronisée, car un transfert de temps donne le temps, pas la position. C'est ce qui isole le capteur inertiel comme facteur limitant.

# text
seg-17a8683f0982 = { "6" }. Disponibilité GNSS dérivée de la géométrie

# text
# c1: orbit.rs
# c2: Propagator
# c3: Orbit
# c4: Sgp4
# c5: build_timeline
seg-afdb141ac367 = <c1/> est une couche de géométrie déterministe et sans dépendance. Un <c2/> est soit l'<c3/> képlérien analytique (à deux corps, avec J2 séculaire en option), soit un propagateur <c4/> complet construit à partir d'un jeu complet d'éléments à deux lignes ; un générateur Walker-delta produit des constellations synthétiques, et la visibilité en ligne directe = occultation par la Terre + masque d'élévation. Le nombre de satellites visibles correspond à un état GNSS (≥{ "4" } = nominal, { "1" }–{ "3" } = dégradé, { "0" } = refusé), et <c5/> le transforme en la chronologie de disponibilité qui pilote l'exécution standard de holdover d'horloge. La disponibilité est donc <em>dérivée de la géométrie</em> plutôt que rédigée à la main, alors que l'exécution, l'estimateur et la notation restent inchangés.

# text
# c1: sgp4.rs
seg-da82c97ac5c8 = Une constellation fournie sous forme de TLE complets est propagée avec le modèle SGP4/SDP4 de <c1/> (vérifié par rapport aux vecteurs AIAA (American Institute of Aeronautics and Astronautics) 2006-6753) ; les éléments à seule ligne 2 conservent le chemin analytique à deux corps. Les deux peuvent être mélangés dans un même bloc de constellation.

# text
seg-a47031620b54 = { "7" }. Liaisons

# text
# c1: python.rs
# c2: wasm.rs
# c3: --features python
# c4: --features wasm
# c5: cargo deny --all-features
# c6: api::run_toml
# c7: web/
# c8: run
# c9: run_all
# c10: chart_svg
# c11: summary
# c12: table_csv
# c13: list_kinds
# c14: error_kind
# c15: version
# c16: encode_permalink
# c17: decode_permalink
# c18: export_sp3
# c19: export_omm
# c20: export_oem
# c21: api
# c22: mcp/kshana-mcp
# c23: rmcp
# c24: run_scenario
# c25: list_scenario_kinds
# c26: validate_scenario
# c27: list_example_scenarios
# c28: get_example_scenario
# c29: report_scenario
# c30: animate_scenario
# c31: list_export_formats
# c32: export_interop
# c33: import_route
# c34: export_sp3
# c35: export_omm
# c36: export_oem
# c37: export_table_csv
# c38: assess_receiver_log
# c39: bundled-scenarios
# c40: ide/jetbrains
# c41: kshana
seg-57fb29fdd9d9 = Le cœur se compile sans changement vers le natif, vers une extension Python et vers WebAssembly. Les modules Python (<c1/>, PyO3 abi3) et WebAssembly (<c2/>, wasm-bindgen) sont des dépendances facultatives, activées par fonctionnalité (<c3/> / <c4/>) : la compilation par défaut et la suite de tests ne les compilent jamais, tandis que la porte d'audit des dépendances (<c5/>) inspecte bien leurs arbres de dépendances, car ces crates sont livrés dans la roue et dans le paquet npm. Les deux appellent <c6/>, de sorte que toutes les surfaces renvoient des résultats identiques. Le module WebAssembly alimente le bac à sable du navigateur dans <c7/> et exporte treize fonctions : <c8/>, <c9/> (une exécution du moteur qui renvoie ensemble le résultat, le graphique, le résumé et le tableau), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, le codec d'URL (URL : adresse web) partageable <c16/> / <c17/>, et les trois exporteurs <c18/> / <c19/> / <c20/> qui alimentent le menu d'export du bac à sable. Deux autres portes d'entrée atteignent la même <c21/> : le <b>serveur MCP (Model Context Protocol)</b> (<c22/>, un crate <c23/> exclu de l'espace de travail qui expose quinze outils : <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/> ; les deux outils d'exemples lisent les scénarios intégrés par la fonctionnalité <c39/> de la bibliothèque, désactivée par défaut, que seul ce serveur active) et le <b>plugin d'IDE (environnement de développement intégré) JetBrains</b> (<c40/>, un projet Kotlin qui appelle la CLI <c41/> par un shell au lieu de lier la bibliothèque).

# text
# c1: --features python
# c2: --features wasm
# c3: --features bundled-scenarios
# c4: xval/*
seg-a6620e0d6eef = Activation par fonctionnalité : Python et WASM sont <c1/> / <c2/> ; la table de scénarios intégrés est <c3/> (le seul usage qu'en fait le serveur MCP) ; le serveur MCP et les contrôles croisés <c4/> sont des crates EXCLUS de l'espace de travail ; le plugin d'IDE ne lie rien : il exécute la CLI.

# text
seg-7bc5df56e4e5 = { "8" }. Déterminisme et reproductibilité

# text
# c1: ChaCha8Rng
# c2: (scenario, seed, engine version) → identical bits
seg-fb95c37c7bb9 = Tout l'aléa passe par un unique <c1/> initialisé par graine à chaque exécution ; l'ordre des pas est fixe, de sorte que <c2/>.

# text
# c1: scenario_hash
# c2: scripts/check-reproducible.sh
seg-e026c87beb26 = Le résultat porte un <c1/> SHA-256 (SHA : Secure Hash Algorithm) ; <c2/> exécute deux fois un scénario de référence et vérifie que les sorties sont identiques octet pour octet.

# text
# c1: wasm32-unknown-unknown
seg-42a3bdcbd99f = Le même moteur se compile vers le natif, vers une extension Python et vers <c1/> pour des exécutions dans le navigateur qui produisent les mêmes nombres.

# text
seg-12e00717c2d4 = { "9" }. Structure différée / future

# text
seg-8a8e1b93b704 = Les couches d'astrodynamique, de fusion et d'alt-PNT du §1a (le propagateur SGP4/SDP4 complet, le propagateur numérique de Cowell avec son modèle de forces à sept perturbations et ses deux intégrateurs adaptatifs, la conception de manœuvres et de trajectoires, la détermination d'orbite, les estimateurs GNSS/INS à 15, 8 et 17 états, le filtre couplé horloge + position et l'appariement de cartes de gravité) ont toutes été livrées, de même que la mesure de mérite de sécurité avec un démonstrateur de leurrage actif, la géométrie réelle TLE / multi-constellation, les bandes Monte-Carlo, les balayages d'études de compromis, le rapport HTML (HyperText Markup Language) imprimable avec son jumeau lisible par machine, et les workflows de publication, de roues et de pages.

# text
# c1: hybrid-ukf
seg-318ad50d3826 = Plusieurs capacités autrefois listées ici comme travaux futurs ont depuis été <b>livrées</b> et sont traitées plus haut ou dans <a1>VALIDATION</a1> : la nutation complète IAU 2000A et la réduction GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) fondée sur le CIO, sans équinoxe (vérifiée bit à bit par rapport à SOFA/ERFA (SOFA : Standards of Fundamental Astronomy ; ERFA : Essential Routines for Fundamental Astronomy)), le géopotentiel EGM2008 (Earth Gravitational Model { "2008" }) jusqu'au degré/ordre { "70" }, le terme d'entraînement des référentiels de <b>Lense–Thirring</b>, les marées solides, océaniques et atmosphériques, une validation croisée d'éphéméride de niveau DE (DE440/ANISE (DE440 : Development Ephemeris { "440" } ; ANISE : Attitude, Navigation, Instrument, Spacecraft, Ephemeris, une boîte à outils de géométrie planétaire en Rust pur)), la validation croisée externe avec Orekit { "12.2" } du propagateur numérique de Cowell ({ "0.08" } m sur { "24" } h) et de la détermination d'orbite par lots et séquentielle, et le navigateur à 17 états à couplage serré présenté comme le type de scénario <c1/>.

# text
# c1: [Unreleased]
# c2: .gfc
# c3: xval/high-degree-gravity/
# c4: space-weather
seg-068119b15b27 = Les suites restantes sont suivies dans <a1>CHANGELOG</a1> <c1/> et la feuille de route par capacité dans <a2>CAPABILITY</a2> : une valeur de référence indépendante externe pour l'évaluateur EGM (Earth Gravitational Model) de haut degré exactement sur l'axe polaire et une comparaison proche du pôle propre à pyshtools (l'évaluateur jusqu'au degré { "2190" } et son chargeur <c2/> à l'exécution sont livrés, MODELLED ; voir <c3/>), un pilote météorologique spatial variable dans le temps pour le niveau de densité de traînée NRLMSISE-00 (NRLMSISE : Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) en option (la densité de traînée par défaut est le modèle exponentiel statique, et la densité Jacchia-71 du type <c4/> est caractérisée par rapport à NRLMSISE-00 mais n'est pas remplacée par elle), un contrôle externe de l'ombre à assombrissement centre-bord solaire en option, le couplage serré GNSS/INS sur la phase de la porteuse, et une carte de gravité EGM2008/EIGEN (EIGEN : European Improved Gravity model of the Earth by New techniques) réelle pour l'appariement alt-PNT.

# text
# c1: ErrorModel
# c2: ExternalPack
seg-b48f69ea54b3 = Un dépôt de surcouche privé contient la profondeur de résilience soumise à restriction d'export ; il se branche via la même interface <c1/> (et le contrat <c2/> du §{ "4" }) sans modifier le moteur public.

# text
seg-2f88ab8f67e8 = <s1>Précédent</s1>Où Kshana s'exécute

# text
seg-02b0e0fdcdbe = <s1>Suivant</s1>Où se situe Kshana
