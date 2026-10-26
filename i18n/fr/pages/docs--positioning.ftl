# docs--positioning: translations (fr)

# attr:aria-label, text
seg-6555ff9a6d8e = Sortie

# text
seg-0be9b5747c00 = Kshana

# text
seg-94058315dfe4 = Entrée

# text
# c1: docs/POSITIONING.md
seg-09721fbcf7fc = Source : <c1/>

# text
seg-5b362d7b0903 = Kshana est un <b>moteur ouvert et reproductible de preuves de résilience PNT (positionnement, navigation et synchronisation temporelle)</b>. Vous décrivez un scénario — les capteurs ou les horloges, une interruption du GNSS (système mondial de navigation par satellite), une attaque par brouillage ou par leurrage, un budget — et il vous dit dans quelle mesure l'heure et la position tiennent, évaluées par rapport à des indicateurs de performance opérationnels (FoM). Chaque capacité derrière ces indicateurs est étiquetée dans une matrice vérifiée par machine comme <b>VALIDATED</b> (vérifiée par rapport à une référence indépendante externe), <b>MODELLED</b> (cohérente en interne, non vérifiée de l'extérieur) ou <b>PARTNER</b> (relevant d'un partenaire matériel). Cette page dit où il excelle, à quoi il sert et ce qu'il n'est pas.

# text
seg-48d576a345e3 = Où il excelle : la synchronisation temporelle et le holdover pour les infrastructures critiques

# text
seg-f41d8a48ff13 = La partie du moteur la mieux validée est la synchronisation temporelle. Les réseaux de télécommunications, les réseaux électriques et les places financières tirent leur heure du GNSS, et chacun doit dimensionner le <b>holdover</b> : la durée pendant laquelle une horloge locale peut dériver librement lors d'une perte du GNSS avant que son erreur de temps ne dépasse le budget.

# text
# c1: allantools
# c2: VERIFICATION-MATRIX.md
seg-70d00c5fe203 = <b>Ce qui est VALIDATED.</b> Les estimateurs de stabilité de fréquence sur lesquels repose une réponse de holdover — déviation d'Allan (ADEV), déviation d'Allan modifiée (MDEV), déviation temporelle (TDEV), erreur maximale d'intervalle de temps (MTIE) et estimateur Theo1 à portée étendue — sont vérifiés par rapport aux déviations de référence de Stable32, à la bibliothèque indépendante <c1/> et à une véritable horloge au césium mesurée. Le calcul de la variance de dérive en holdover et son inversion en une durée de holdover sont vérifiés par rapport à SciPy. Voir <a1><c2/></a1> pour chaque ligne, son test et sa référence indépendante.

# text
seg-9fbedc930565 = <b>Ce qui reste MODELLED.</b> Les planchers de bruit par classe d'horloge (par exemple le plancher à long terme d'une classe d'oscillateur donnée) déterminent la réponse pour une horloge stable, et ce sont des valeurs représentatives, non des mesures de votre dispositif. Fournissez des planchers mesurés pour tout chiffre que vous comptez défendre.

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-700df4898ede = <b>Unités de télécommunications.</b> Le type de scénario <c1/> rapporte la MTIE et la TDEV, les vérifie par rapport aux gabarits du Secteur de la normalisation des télécommunications de l'Union internationale des télécommunications (UIT-T) — G.8272 pour une horloge de référence temporelle primaire (PRTC), G.8272.1 pour une PRTC améliorée (ePRTC), G.8273.2 pour une horloge de limite de télécommunications (T-BC) et G.8271.1 pour les limites du réseau au point de référence C — et rapporte combien de temps un holdover reste à l'intérieur de chaque budget d'erreur de temps. Voir <a1><c2/></a1>.

# text
seg-50421d8247ab = Ce qui le distingue

# text
seg-7ec913b140ed = La physique et les normes ne font pas la différence : la propagation Simplified General Perturbations { "4" } (SGP4), la déviation d'Allan, les référentiels et la dilution de précision existent, gratuits et corrects, dans d'autres bibliothèques, et Kshana se vérifie lui-même par rapport à plusieurs d'entre elles. La différence tient à la discipline de preuve :

# text
seg-f7d466d5215b = <b>Ouvert.</b> Le moteur est sous GNU Affero General Public License (AGPL), si bien que chacun peut le lire et le rejouer. Une licence commerciale existe pour l'intégration fermée.

# text
# c1: scenario + seed + engine version
seg-76ff24c1939b = <b>Reproductible.</b> Un résultat est déterminé, bit à bit, par <c1/>, et une exécution peut être partagée sous forme de lien vers le bac à sable du navigateur.

# text
# c1: PROVENANCE.md
seg-6df34e089b53 = <b>Provenance étiquetée.</b> Chaque paramètre de capteur est rattaché à une source publiée (<a1><c1/></a1>), et chaque capacité porte son niveau VALIDATED / MODELLED / PARTNER. Une garde d'intégration continue (CI) refuse une ligne VALIDATED sans référence indépendante externe, de sorte qu'une autovérification interne ne puisse pas être présentée comme une validation.

# text
seg-8bccfe110f4c = Nous n'avons pas trouvé d'autre outil ouvert qui combine ces éléments pour le holdover, l'intégrité, l'inertie en navigation à l'estime et les capteurs quantiques, mais une recherche qui ne trouve rien ne prouve pas que rien n'existe ; nous ne prétendons pas être les seuls.

# text
seg-e942b2474960 = Quantique : une méthode de compromis neutre, résultats étiquetés MODELLED

# text
# c1: quantum-trade
# c2: QUANTUM.md
# c3: QUANTUM-MODELS.md
seg-655769464447 = Kshana compare des horloges et des capteurs inertiels quantiques et classiques sur le même scénario avec le même code : chaque dispositif est un modèle d'erreur, et le moteur ne sait pas lequel est « quantique ». Considérez-le comme <b>une méthode neutre de compromis quantique-classique dont les résultats sont étiquetés MODELLED</b>. La plupart des entrées sont des coefficients d'Allan ou de budget de bruit publiés ; l'accéléromètre à interféromètre à atomes froids dispose d'une couche de premiers principes qui en déduit le coefficient de bruit. Les données de déviation d'Allan mesurées d'un partenaire peuvent être injectées par le type <c1/>, ce qui est la voie pour promouvoir les chiffres d'un dispositif précis. Voir <a1><c2/></a1> et <a2><c3/></a2>.

# text
seg-eb5d247b42aa = Lunaire, cislunaire et espace lointain : maintenus, sans être l'argument principal

# text
seg-4b9bd68b7fb1 = La suite lunaire / cislunaire (surveillance de l'intégrité lunaire, noyau à trois corps Terre–Lune, échelles de temps lunaires, analyse des volumes de service) et le moteur de navigation radiométrique en espace lointain sont des capacités maintenues. La plupart de leurs lignes sont MODELLED, et des outils dédiés servent déjà la navigation lunaire ; ils sont donc proposés comme des capacités du même moteur, chacune avec son propre niveau, plutôt que comme l'argument principal.

# text
seg-26f242f1bef8 = Le reste du moteur

# text
seg-b9b2e29e51d9 = Le même moteur, avec les mêmes niveaux, couvre aussi :

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-89d1923b3ed9 = <b>PNT en orbite terrestre basse (LEO), de bout en bout.</b> Conception du signal (<c1/>), passage et bilan de liaison par bande (<c2/>), message de navigation diffusé (<c3/>), positionnement fusionné en orbite terrestre moyenne et basse (<c4/>), convergence du positionnement ponctuel précis (PPP) avec augmentation LEO (<c5/>), positionnement à partir d'un réseau 5G non terrestre (<c6/>), et <c7/>, qui transmet la sortie de chaque étape à la suivante pour un seul système.

# text
# c1: spectrum
seg-2e5b57ccd454 = <b>Spectre.</b> Une cascade de densité spectrale de puissance en bande L (et en ultra-haute fréquence (UHF), bandes S et C) sous une chronologie de brouilleur scénarisée, avec le rapport brouilleur-signal par bande et la densité de porteuse sur bruit effective (<c1/>), et l'enregistrement Signal Metadata Format (SigMF) en entrée et en sortie.

# text
# c1: solar-system
# c2: body-pnt
# c3: constellation-design
seg-0e7fd993a838 = <b>Le système solaire et tout corps central.</b> Positions et constantes physiques des planètes et des principales lunes (<c1/>), positionnement autour de n'importe lequel de ces corps (<c2/>), et conception de constellations de Walker et à créneaux publiés, avec cartes de couverture et de dilution de précision autour de chacun d'eux (<c3/>).

# text
# c1: campaign
seg-9d993a356eb0 = <b>Campagnes.</b> Des types existants enchaînés sur une même chronologie partagée, balayés, exécutés en ensembles Monte Carlo à graine fixée, ou exécutés côte à côte dans des conditions partagées (<c1/>).

# text
# c1: --animate
# c2: --export
# c3: spectrum
seg-905a9aa8c47c = <b>Sorties.</b> Chaque exécution écrit un document de résultat, un graphique et un rapport en HTML (HyperText Markup Language) et en JSON (JavaScript Object Notation) ; <c1/> écrit une animation SVG (Scalable Vector Graphics), HTML ou en séquence d'images ; <c2/> écrit des éphémérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON ou STK (Systems Tool Kit) pour les types de scénario qui placent des objets sur la Terre, et SigMF pour <c3/>.

# text
seg-75206591a52a = La plupart de ces lignes sont MODELLED ; la matrice de vérification nomme les quelques-unes qui sont VALIDATED (par exemple les recommandations de l'Union internationale des télécommunications sur la pluie et la scintillation, l'algorithme d'éphéméride diffusée de Galileo, le contrôle de trame CRC-24Q (contrôle de redondance cyclique sur 24 bits) et le solveur de temps de lumière planétaire).

# text
seg-785218a0ea66 = Ce que Kshana n'est pas

# text
# c1: iq
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
seg-fae54ec38477 = <b>Pas un simulateur de signaux radiofréquence (RF) ni un dispositif matériel en boucle (HIL).</b> Kshana ne pilote aucun matériel radio et n'émet rien. L'essentiel fonctionne au niveau des modèles d'erreur et des bilans de liaison, avant que du matériel ou du temps de laboratoire ne soient achetés. Au niveau du signal, il est purement logiciel : la couche IQ GNSS (<c1/>) écrit des fichiers d'échantillons en bande de base en phase/quadrature (IQ) de signaux GNSS légitimes pour des récepteurs logiciels et exécute sur eux son propre récepteur logiciel ; la section <c3/> du type <c2/> (depuis { "0.29.0" }) écrit un instantané SigMF (Signal Metadata Format) de son modèle analytique incluant les brouilleurs configurés (brouilleurs de type bruit intervalle par intervalle, tons et chirps sous forme d'ondes) ; et <c4/> additionne en mémoire un signal authentique et une réplique de leurreur pour tester l'accrochage des boucles, sans l'écrire. Tester un récepteur matériel face à un véritable stimulus RF est le travail d'un simulateur RF.

# text
seg-ca243f3f8e8d = <b>Pas un remplaçant de MATLAB/Simulink, de STK ou d'Orekit.</b> Il se place à côté d'eux. Il lit et écrit les formats d'échange qu'ils utilisent — messages d'éphéméride orbitale (Orbit Ephemeris Messages) du CCSDS (Consultative Committee for Space Data Systems), orbites précises SP3 (Standard Product { "3" }), RINEX (Receiver Independent Exchange Format) — écrit des éphémérides CZML, KML, GeoJSON et STK pour leurs visualiseurs, et son modèle de forces numérique est recoupé avec Orekit plutôt que proposé à sa place.

# text
seg-8fa4e93c3d0e = <b>Pas un moteur de traitement GNSS sur phase de la porteuse ni un service de positionnement</b> (voir ci-dessous).

# text
seg-8ba4b67bc813 = <b>Pas une autorité de certification.</b> Une étiquette VALIDATED signifie qu'une capacité concorde avec une référence indépendante externe ; ce n'est la certification d'aucun produit ni d'aucun opérateur.

# text
seg-362b857140b9 = Ce que Kshana est, et n'est pas, face à un moteur de traitement GNSS

# text
# c1: leo-ppp
# c2: pvt
seg-f50951b2e9c8 = Kshana n'est <b>pas</b> un moteur de <em>traitement</em> GNSS sur phase de la porteuse, et aucun type de scénario n'est un service de positionnement. Il a toutefois un pied dans le domaine de la mesure, sous forme de code de bibliothèque sur lequel s'appuie l'étude de performance et qui est vérifié par rapport à des références indépendantes. Le positionnement cinématique en temps réel (RTK) à courte base avec fixation des entiers par LAMBDA (ajustement de décorrélation des ambiguïtés par moindres carrés) s'exécute sur de véritables observations RINEX bifréquences, tout comme un filtre de positionnement ponctuel précis (PPP) statique à ambiguïtés flottantes avec les orbites et horloges finales de l'IGS, et l'horloge du récepteur que ce filtre estime est une solution de temps par rapport à l'horloge de station finale de l'IGS. Chacun des trois est une ligne VALIDATED de la <a1>matrice de vérification</a1>, par rapport aux données de station de l'IGS qui y sont nommées, et chacun s'exécute sur des fenêtres d'observation statiques et courtes, et non comme un service en flux avec résolution d'ambiguïtés sur de longues bases, lissage par la porteuse ou mobile cinématique. Le type <c1/> exécute un filtre PPP flottant sur le code et la phase de la porteuse, mais sur des mesures qu'il simule lui-même, pour étudier le temps de convergence avec et sans augmentation LEO ; il ne traite pas de fichier d'observation. Le type <c2/> (position, vitesse et temps) résout une position de récepteur à partir de véritables pseudodistances de code RINEX et d'éphémérides diffusées, validée par rapport à une coordonnée relevée de l'International GNSS Service (IGS) (station ABMF, 2018-05-13) à <b>{ "5.7" } m en RMS 3D (moyenne quadratique) / { "1.1" } m en horizontal</b>. Mais le produit est l'étude de performance, non le service de positionnement, et le cadrage ci-dessous vise à épargner à un utilisateur potentiel la déception de s'être trompé d'outil.

# text
seg-169dd778c45f = Un moteur de traitement GNSS (RTKLIB, une bibliothèque ouverte de positionnement cinématique en temps réel ; gLAB, la suite d'outils de laboratoire GNSS du groupe gAGE de l'Université polytechnique de Catalogne)

# text
# c1: pvt
seg-4faa1de0ef70 = un scénario : modèles d'erreur de capteurs, fenêtres d'interruption, géométrie — ou, pour <c1/>, un véritable fichier d'observation RINEX plus la navigation diffusée

# text
seg-ae60d0def8af = de véritables observations GNSS (RINEX), des éphémérides, des corrections

# text
# c1: pvt
seg-5fce99bb803d = des FoM de performance : holdover, erreur de temps/de position, disponibilité, bornes d'intégrité/de sécurité — plus une position par positionnement ponctuel sur code (SPP) issue du type <c1/>

# text
seg-b752bb5c3f64 = une <b>solution</b> de position/vitesse/temps (SPP, PPP, RTK)

# text
seg-dd8a47d4f618 = Question à laquelle il répond

# text
seg-b52fd8e0c856 = « dans quelle mesure cette architecture <em>serait-elle</em> bonne, et où cède-t-elle ? »

# text
seg-09672ca004ac = « compte tenu de ces mesures, où suis-je <em>maintenant</em> ? »

# text
seg-00d5ebd56088 = Capteurs quantiques / optiques

# text
seg-a55f2bd6c1bf = modélisés comme des modèles d'erreur (horloges optiques, unité de mesure inertielle (IMU) à atomes froids, transfert de temps optique), résultats étiquetés MODELLED

# text
seg-7ccfb3395d84 = non modélisés

# text
seg-ec21dbf4b910 = Traitement d'observations réelles

# text
# c1: pvt
seg-324ef9a933d5 = SPP sur code à partir de véritables observations RINEX (<c1/>, précision métrique) ; RTK à courte base avec LAMBDA et PPP flottant statique sur véritable phase de la porteuse, sous forme de code de bibliothèque vérifié par rapport à des stations IGS (VALIDATED, fenêtres statiques et courtes, pas un service en flux) ; plus géométrie / dilution de précision (DOP) / disponibilité

# text
seg-e15db8a33a9a = la compétence centrale, jusqu'au PPP/RTK sur phase de la porteuse

# text
seg-e6df7ccdba96 = zéro — s'exécute dans un onglet de navigateur (WebAssembly)

# text
seg-812c1c70ce63 = compilation native / chaîne d'outils

# text
seg-58df67617e1a = Complémentaires, non concurrents — RTKLIB et gLAB

# text
# c1: pvt
# c2: pvt
seg-29aeb97bd509 = <a1>RTKLIB</a1> et <a2>gLAB</a2> sont des suites de traitement GNSS matures et très utilisées. Elles prennent de véritables mesures et produisent une solution de positionnement (SPP/PPP/RTK ; gLAB est aussi un excellent outil pédagogique, à l'héritage solide à l'Agence spatiale européenne (ESA) et au Service européen de navigation par recouvrement géostationnaire (EGNOS)). Kshana ne les remplace <b>pas</b> et n'essaie pas de le faire. Son chemin d'observation est étroit : le positionnement ponctuel sur code (<c1/>) et, en tant que code de bibliothèque vérifié, le RTK à courte base avec fixation des entiers par LAMBDA et un filtre PPP flottant statique sur de véritables observations bifréquences, chacun VALIDATED par rapport aux données de stations IGS (le filtre PPP l'étant aussi par rapport à une exécution de RTKLIB sur les mêmes entrées). Il n'a ni lissage par la porteuse, ni traitement cinématique ou en flux, ni résolution d'ambiguïtés sur longue base, et <c2/> n'estime ni la troposphère ni l'ionosphère — il applique les modèles de troposphère de Saastamoinen/Niell et la combinaison sans ionosphère L1/L2, il ne les résout pas comme des états.

# text
seg-9c4e70ce8a55 = Le pipeline est complémentaire :

# text
seg-01f43da4858c = <b>RTKLIB / gLAB</b> répondent à <em>« où suis-je, d'après ces signaux ? »</em>

# text
seg-f5370894cdd1 = <b>Kshana</b> répond à <em>« combien de temps conservé-je une bonne réponse quand ces signaux s'arrêtent — et que m'apporte une meilleure horloge ou un meilleur capteur inertiel, classique ou quantique ? »</em>

# text
seg-2403d6b115de = Un flux de travail naturel utilise un moteur de traitement pour le segment où le GNSS est disponible et Kshana pour étudier le comportement en <b>holdover</b> et l'espace de compromis des capteurs qui l'entoure. Si vous avez besoin d'un service de positionnement sur phase de la porteuse — PPP ou RTK cinématique, longues bases, résolution d'ambiguïtés en réseau — utilisez RTKLIB ou gLAB ; si vous avez besoin de preuves reproductibles et étiquetées sur la résilience et le holdover, c'est le travail pour lequel Kshana est conçu.

# text
seg-21631e5c6be3 = Un niveau navigateur sans installation

# text
seg-9b01dd6721ed = La plupart des outils de simulation de ce domaine (RTKLIB, gLAB, le General Mission Analysis Tool (GMAT), Orekit, STK) exigent une installation native ou une licence, et une courbe d'apprentissage avant le premier résultat. Kshana se compile en WebAssembly et s'exécute <b>entièrement dans le navigateur</b> — le <a1>bac à sable</a1> charge un scénario travaillé, exécute le vrai moteur côté client (rien n'est téléversé) et affiche le résultat en quelques secondes. Des curseurs guidés et des scénarios en un clic font que le premier résultat utile ne demande ni TOML (Tom's Obvious Minimal Language, le format de fichier de scénario) ni chaîne d'outils.

# text
seg-b1cb4b8f0ef1 = Ce niveau sans installation est une position délibérée :

# text
seg-33b361bde50d = <b>Accessibilité</b> — un relecteur, un étudiant ou un responsable des achats peut essayer le vrai moteur depuis un lien, sur n'importe quel appareil, sans aucune configuration.

# text
# c1: scenario + seed + engine version
seg-a4a4ebf89cee = <b>Reproductibilité</b> — le moteur livré dans le navigateur est la bibliothèque livrée sur crates.io, le Python Package Index (PyPI) et npm ; un résultat est reproductible à partir de <c1/>, et une exécution peut être partagée sous forme d'URL (adresse web).

# text
seg-3d3d4bda606c = <b>Honnêteté</b> — exécuter soi-même le moteur, au grand jour, est la meilleure réponse à « faites confiance aux chiffres » : le niveau navigateur <em>est</em> la surface d'audit.

# text
seg-6095bcacb725 = Le niveau navigateur ne fait pas de Kshana un remplaçant d'une suite de traitement de bureau — il rend la question de l'étude de compromis de performance abordable à des personnes qui n'en installeraient jamais une.

# text
# c1: CAPABILITY.md
# c2: pvt
seg-938ca8eab04c = <a1><c1/></a1> — la carte du périmètre ligne par ligne (le périmètre complet du solveur <c2/> et ses résidus figurent dans la ligne <b>Traitement GNSS / PNT</b>).

# text
# c1: VALIDATION.md
seg-9e94b1740386 = <a1><c1/></a1> — ce qui est validé, avec les preuves.

# text
# c1: TELECOM-TIMING.md
seg-3a02f39bd90a = <a1><c1/></a1> — le type de scénario de synchronisation télécom et ses gabarits.

# text
# c1: GLOSSARY.md
seg-c5aa08e4ca55 = <a1><c1/></a1> — des définitions en langage clair des termes employés ici.

# text
# c1: web/README.md
seg-85aaaa34ea7c = <a1><c1/></a1> — le bac à sable du navigateur.

# text
seg-54e2deeffc7d = <s1>Précédent</s1>Architecture

# text
seg-b2f93c49d5c6 = <s1>Suivant</s1>Journal des modifications
