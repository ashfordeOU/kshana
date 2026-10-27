# docs--claims-vs-reality: translations (fr)

# text
seg-a47934361f43 = Flux NMEA de formation d'équipage

# text
seg-ee2e250497f9 = Export pour banc d'essai

# text
seg-2bd2101ce454 = Surface

# text
seg-ad856ad710eb = État

# text
seg-98d0bc6b40ce = Cartographie de compliance avec des cadres publics

# text
seg-80f3f0aae42c = Carte des interférences

# text
# c1: docs/CLAIMS-VS-REALITY.md
seg-28b1885c4ca7 = Source : <c1/>

# text
seg-bf5c2811ce29 = Affirmations et réalité : registre des surdéclarations

# text
# c1: OC-0
# c2: OC-13
seg-592e007bc3cf = Un audit indépendant d'une version antérieure de Kshana a recensé quatorze <b>surdéclarations</b> (<c1/>…<c2/>) : des endroits où une surface publique (README, bac à sable, étiquettes de FoM (figure de mérite), paquets de scénarios) décrivait une capacité plus fortement que ne la livrait le code. Cette page est le registre de clôture : chaque ligne indique la surdéclaration d'origine, la manière dont elle a été résolue et les preuves. Deux types de résolution apparaissent :

# text
seg-39250970dbbf = <b>Retirée de l'affirmation</b> : la formulation a été corrigée pour correspondre au code (reformulation honnête, aucun changement de capacité). « Zéro code = zéro affirmation. »

# text
seg-fb7da0f79ead = <b>Supplantée</b> : la capacité réelle a ensuite été construite et testée, de sorte que l'affirmation forte est devenue <em>exacte</em>.

# text
# c1: tests/no_overclaims.rs
# c2: README.md
# c3: docs/CAPABILITY.md
# c4: docs/GLOSSARY.md
# c5: web/capabilities.json
# c6: web/index.html
# c7: web/README.md
# c8: README.crates.md
# c9: README.pypi.md
# c10: README.npm.md
seg-5292f7162e2b = Un garde-fou de régression (<c1/>) analyse les surfaces publiques en production (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, et les pages d'accueil de crates.io, PyPI (Python Package Index) et npm <c8/>, <c9/>, <c10/>) à chaque exécution de la CI (intégration continue) et échoue si l'une des formulations de surdéclaration abandonnées réapparaît sans réserve, de sorte qu'une ligne ne puisse pas régresser silencieusement depuis GREEN.

# text
seg-dafc6f322f34 = Les quatorze lignes sont <b>GREEN</b>.

# text
seg-5cf7bf2d1889 = OC (surdéclaration)

# text
seg-0e01d4053d7f = Surdéclaration d'origine

# text
seg-36bf87638923 = Résolution

# text
seg-70a952c4150b = « estimateur de fusion de Kalman conjoint » laissait entendre un filtre unique à covariance croisée ; le code exécutait deux estimateurs indépendants

# text
seg-d5682a7fdb11 = <b>Supplantée</b> : un véritable filtre de Kalman couplé horloge+position à covariance croisée a été construit

# text
# c1: src/fusion/coupled.rs
seg-1008020cd9e4 = <c1/> ({ "7" } tests, dont un ensemble de 100 essais couplé contre découplé qui exige que le RMS (moyenne quadratique) de position du filtre couplé soit inférieur à { "0.6" } fois celui du filtre découplé et que le filtre couplé l'emporte dans au moins { "90" } des { "100" } essais) ; CAPABILITY « Fusion de capteurs » → complète

# text
seg-334fc345d501 = « RAIM (surveillance autonome de l'intégrité par le récepteur) de détection de leurrage assistée par l'horloge » laissait entendre un détecteur RAIM multi-satellites

# text
seg-cf0795c2ee02 = <b>Retirée de l'affirmation → Supplantée</b> : reformulée comme une borne de détectabilité du leurrage fondée sur la stabilité de l'horloge ; le véritable RAIM/ARAIM (HPL/VPL (HPL : niveau de protection horizontal ; VPL : niveau de protection vertical)) est ensuite arrivé

# text
# c1: src/raim.rs
# c2: docs/INTEGRITY.md
seg-f46432acbfa0 = <c1/> ({ "30" } tests : instantané + ARAIM à séparation de solutions, HPL/VPL, FDE (détection et exclusion de pannes), diagrammes de Stanford) ; <c2/>

# text
seg-8b47f69dbb76 = « démonstrateur de brouillage » sans aucun code de brouillage derrière

# text
seg-bfff34d5a250 = <b>Supplantée</b> : un modèle de brouillage par bilan de liaison J/S → C/N₀ effectif → perte d'accrochage a été construit

# text
# c1: src/jamming.rs
seg-5f75628b8201 = <c1/> ({ "10" } tests) ; ligne « Résilience » du README

# text
seg-bae512770cd6 = « Modèle de bruit à variance d'Allan complet d'une IMU (centrale inertielle) sur un trièdre d'IMU » : le modèle était à axe unique

# text
seg-50c0b5855cb9 = <b>Retirée de l'affirmation → Supplantée</b> : reformulée comme un budget d'erreur à 1 DOF (degré de liberté) ; un INS (système de navigation inertielle) strapdown à trois axes a ensuite été livré

# text
# c1: src/inertial
seg-501bf7d8fff0 = <c1/> strapdown à trois axes (attitude par quaternion, mécanisation NED (nord-est-bas), coning/sculling) ; ROADMAP « Inertiel »

# text
seg-ad250a99b05f = « Intégration PNT (positionnement, navigation et synchronisation temporelle) hybride » laissait entendre un filtre GNSS/INS (GNSS : système mondial de navigation par satellite) couplé ; c'était un budget d'erreur d'estime

# text
seg-85fb58d37a5d = <b>Retirée de l'affirmation → Supplantée</b> : reformulée comme de l'estime avec un réaccrochage configurable ; une véritable fusion GNSS/INS à couplage serré a ensuite été livrée

# text
# c1: src/fusion/tightly_coupled17.rs
seg-9e6b092d5656 = <c1/> (UKF (filtre de Kalman sans parfum) à 17 états avec estime quantique par CAI (CAI : interféromètre à atomes froids)) ; CAPABILITY « Fusion de capteurs » → complète

# text
seg-46a637f8e967 = « validé à ~{ "2" } % » laissait entendre un seuil serré et imposé

# text
# c1: VALIDATION.md
seg-5e98d7664558 = <b>Retirée de l'affirmation</b> : <c1/> indique le seuil <em>imposé</em> ({ "20" }–{ "25" } % en moyenne sur les graines) ; « ~{ "2" } % » désignait une observation typique, et non le seuil

# text
# c1: docs/VALIDATION.md
seg-84f4fcdc7e50 = <c1/> en-tête « Sur les tolérances »

# text
seg-85ec2fe9c7f7 = « déterministe entre plateformes » sans preuve versionnée

# text
seg-6e516f04db89 = <b>Retirée de l'affirmation</b> : chaîne d'outils épinglée à une version exacte ; hachages de référence (golden) par scénario versionnés avec une porte de reproductibilité. (L'identité bit à bit <em>entre</em> OS/architectures (OS : système d'exploitation) reste un point ouvert, énoncé honnêtement.)

# text
# c1: rust-toolchain.toml
# c2: 1.93.0
# c3: tests/golden.rs
# c4: tests/cross_platform_golden.rs
# c5: scripts/check-reproducible.sh
seg-9db327be56c3 = <c1/> (canal <c2/>) ; <c3/> (valeurs numériques à { "1e-6" } près) ; <c4/> (hachage de l'empreinte d'entrée et de la forme de chaque résultat, exécuté sur la matrice de CI Linux, macOS et Windows) ; <c5/>

# text
seg-2708139388ed = « simulateur PNT hybride quantique-classique » laissait entendre une physique quantique de premiers principes

# text
seg-717167714e83 = <b>Retirée de l'affirmation → Supplantée</b> : reformulé comme un simulateur de résilience PNT utilisant des modèles de performance de capteurs quantiques ; la physique CAI de Mach–Zehnder de premiers principes est ensuite arrivée

# text
# c1: src/inertial/quantum_imu.rs
# c2: 1/√(N·C²·T²)
# c3: docs/QUANTUM.md
seg-c67fb22add4b = <c1/> ({ "26" } tests : phase de Mach–Zehnder, bruit de projection <c2/>, fonction de transfert des vibrations, effets systématiques de Coriolis + AC-Stark (AC : courant alternatif)) ; <c3/>

# text
seg-5c6b7d4f2029 = La FoM « Performance d'intégrité » laissait entendre une intégrité aéronautique HPL/VPL/RAIM

# text
seg-ee5487da890c = <b>Retirée de l'affirmation + Supplantée (en couches)</b> : la FoM de scénario par exécution est honnêtement étiquetée <em>auto-cohérence du filtre</em> (<b>et non</b> intégrité aéronautique) ; le véritable ARAIM HPL/VPL est présenté <em>séparément</em>, de sorte que les deux ne soient jamais confondus

# text
# c1: src/fom.rs:80
# c2: integrity
# c3: src/raim.rs
# c4: docs/INTEGRITY.md
seg-31aacdf17b02 = <c1/> (<c2/> : auto-cohérence, avec réserve) ; <c3/> + <c4/> (véritable ARAIM)

# text
seg-0686fa147c96 = FoM de sécurité présentée comme toujours significative, même sans attaque

# text
# c1: 1 − P_md
seg-d6d9296422fc = <b>Retirée de l'affirmation</b> : la FoM de sécurité (<c1/>) est cadrée dans le contexte du détecteur de leurrage et n'est significative que lorsqu'un scénario d'attaque est configuré

# text
seg-8f7b211b5a0c = Ligne « Résilience » du README ; la FoM de sécurité est définie au point de spécification opérationnellement nuisible

# text
seg-d66421174e94 = La FoM « Performance de positionnement » laissait entendre une précision complète dans le domaine des positions

# text
# c1: pos_rms_m
seg-9eeb13a16350 = <b>Retirée de l'affirmation</b> : étiquetée <c1/> à 1 DOF pour les paquets inertiel/hybride, explicitement <b>et non</b> une précision CEP/2DRMS 2-D (CEP : erreur circulaire probable) ni pondérée par le DOP (DOP : dilution de précision)

# text
seg-e8115df73c10 = Tableau des figures de mérite du README (ligne « Performance de positionnement »)

# text
seg-5c73759a2454 = des chiffres de FoM inertielle lus comme des statistiques d'ensemble alors qu'ils venaient de graines uniques

# text
# c1: monte_carlo: false
# c2: runs = N
seg-3db3a41ce848 = <b>Retirée de l'affirmation</b> : une exécution unique est signalée par <c1/> ; <c2/> fournit la moyenne/la dispersion/l'IC bootstrap à { "95" } %

# text
seg-bf737455e6f2 = Tableau de FoM du README ; tests d'enveloppe de couverture des scénarios

# text
seg-aa362992b5da = le scénario de la « constellation GPS (Global Positioning System) SGP4 (Simplified General Perturbations { "4" }) » utilisait des TLE (jeux d'éléments à deux lignes) synthétiques de substitution

# text
# c1: gps-ops
seg-ebae20813a52 = <b>Supplantée</b> : le scénario intègre désormais un véritable instantané Celestrak <c1/> daté, avec des sommes de contrôle strictes

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum
# c4: tests/scenario_coverage.rs
seg-2d49f6101571 = <c1/> (<c2/> réel, <c3/>) ; <c4/>

# text
# c1: Cargo.toml
seg-cdefa4ee436a = La chaîne de version du README s'écartait de <c1/>

# text
# c1: Cargo.toml
seg-8e66b9485565 = <b>Retirée de l'affirmation</b> : un garde-fou de CI vérifie que le badge d'état du README correspond à <c1/>

# text
seg-347fd8c1f334 = { "0.35" } : des affirmations maintenues étroites, et une correction

# text
# c1: tests/no_overclaims.rs
# c2: tests/compliance_report.rs
seg-946ff389cec5 = Les fonctionnalités de { "0.35" } ont été rédigées avec leurs limites énoncées à côté de l'affirmation, et les mêmes garde-fous (<c1/>, et le garde-fou de formulation dans <c2/>) analysent les pages qui les décrivent. Ce tableau ne fait pas partie du registre à quatorze lignes ci-dessus ; il consigne, pour les nouvelles surfaces, ce qui est affirmé et ce qui ne l'est pas.

# text
seg-6ac3f9b26aad = Ce qui est affirmé

# text
seg-6f558815da86 = Ce qui ne l'est pas

# text
# c1: receiver_trust
# c2: $PKSHT
seg-d0964d2f9bbc = Score de confiance du navire (<c1/>, <c2/>, passerelle, Signal K, OpenCPN)

# text
seg-ee4d75006bfc = un score de 0 à 100 et des motifs tirés des propres NMEA d'un récepteur, MODELLED

# text
seg-59ff27c84fe4 = à titre consultatif, et non un équipement de navigation homologué ; le score d'un journal n'est pas un énoncé sur d'autres récepteurs ; il ne rend pas une position plus précise

# text
seg-8869e6a5c10b = NMEA synthétique de passerelle avec événements scénarisés et un journal d'instructeur

# text
seg-bc4ba77bc569 = texte seulement, aucune sortie radiofréquence ; jamais pour les systèmes de navigation en service d'un navire ; à titre consultatif, et non un équipement de navigation homologué

# text
seg-9482ecbb2748 = un enregistrement technique signé, vérifiable hors ligne

# text
seg-20ae6dd2b780 = pas un avis juridique ; n'indique pas ce qui a causé un événement, qui en était responsable, ni que le journal montre ce que le récepteur a réellement reçu

# text
seg-4132fc36f1d3 = cellules agrégées de navigation dégradée issues de rapports sous licence ouverte

# text
seg-c64960abf9fb = pas une prévision ; l'exposition d'un itinéraire est une part de cellules, et non un risque

# text
seg-ed6d268e0291 = le mouvement du véhicule et les événements d'un scénario dans des fichiers qu'un simulateur de laboratoire peut lire

# text
seg-85c8ad22ef03 = aucun signal n'est écrit ; aucune performance de simulateur ou de récepteur n'est revendiquée

# text
seg-1bba9a883650 = les lignes en faveur desquelles un ensemble d'exécutions apporte des éléments de preuve, avec une lacune sur chaque ligne

# text
seg-f2a836780831 = jamais qu'un cadre est satisfait ni qu'un produit est approuvé ; une étiquette de type de scénario seule n'est pas une preuve

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-31c7009c9914 = <b>Correction consignée dans { "0.35" }.</b> Une version antérieure de <c1/> et des commentaires du module de résilience décrivait sept « catégories de techniques » du DHS Resilient PNT Conformance Framework. La version { "2.0" } de ce cadre définit des fonctions de base (Prevent, Respond, Recover), des niveaux de { "0" } à { "4" } et huit exigences numérotées, et aucune liste de sept catégories. Les noms des sept sous-scores émis par le moteur de notation sont propres à Kshana, et la table de correspondance le dit désormais.

# text
seg-f70787ecb194 = Comment une ligne reste GREEN

# text
# c1: tests/no_overclaims.rs
seg-f2c599e8882a = Les affirmations fortes (OC-0/2/7/8 et les moitiés supplantées de OC-1/3/4/12) sont GREEN parce que la capacité est <b>livrée et testée</b>, et non parce que la formulation a été adoucie. Les lignes retirées de l'affirmation sont GREEN parce que la formulation en production correspond au code. Le test de garde-fou rend la seconde catégorie applicable : si une formulation de surdéclaration abandonnée revient sur une surface publique, la CI passe au rouge. Voir <c1/>.

# text
seg-39e475441b60 = <s1>Précédent</s1>Pourquoi les lignes restent modélisées

# text
seg-07ef8e1e862e = <s1>Suivant</s1>Provenance
