# docs--glossary: translations (fr)

# attr:aria-label, text
seg-daf25c6479c1 = Normes

# attr:title, text
seg-c851aa23ea42 = valeurs séparées par des virgules

# text
seg-366c59b03b4f = CSV

# text
seg-cb273d6705c6 = SVG

# text
seg-49a994d77d2f = oscillateur à quartz compensé en température

# text
seg-1bac97ee312a = étalon de fréquence atomique au rubidium

# text
seg-b09ffb8a9095 = Monte Carlo

# text
seg-9939da5da283 = JSON

# text
seg-5907283b71da = Abréviation

# text
seg-900c7c7e99cd = GMAT

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = biais inter-systèmes

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = bruit de projection quantique

# text
seg-430b3c681347 = RTKLIB

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-e464509f3abb = rapport densité de puissance de porteuse sur bruit

# text
seg-68ff97cfdc03 = DOI

# text
seg-fa299d3dcaad = identifiant d'objet numérique

# text
seg-d41af8f18aed = GLONASS

# text
seg-1df73b95ae4d = IAU

# text
seg-e78cf68c3f5e = ICRF

# text
seg-f094d5944111 = International Celestial Reference Frame (référentiel céleste international)

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Station spatiale internationale

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256 bits

# text
seg-8104773e1484 = STK

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = ultra haute fréquence

# text
# c1: docs/GLOSSARY.md
seg-6ce4c2164aee = Source : <c1/>

# text
seg-bee5d056ef03 = Définitions en langage clair des termes utilisés dans Kshana. Chaque entrée commence par une ligne « en clair », puis ajoute le sens précis lorsque cela aide. Les abréviations non définies dans une section figurent dans le tableau de A à Z vers la fin, <a1>Toutes les autres abréviations, de A à Z</a1>.

# text
seg-f8c5433d1026 = Navigation et synchronisation temporelle

# text
seg-2a42d84608ea = <b>PNT — Positioning, Navigation, and Timing (positionnement, navigation et synchronisation temporelle).</b> Savoir <em>où</em> l'on est, <em>dans quelle direction</em> l'on va et <em>quelle heure il est</em> — avec précision. Le PNT moderne provient surtout de signaux satellitaires (GNSS, les systèmes mondiaux de navigation par satellite définis ensuite) ; Kshana étudie ce qui arrive au <em>temps</em> et à la <em>position</em> lorsque ces signaux sont perdus.

# text
seg-6227db2c94e1 = <b>GNSS — Global Navigation Satellite System (système mondial de navigation par satellite).</b> Les constellations de satellites qui fournissent le PNT : GPS (le Global Positioning System, États-Unis d'Amérique), Galileo (UE), GLONASS (le Global Navigation Satellite System de la Russie), BeiDou (Chine). Un récepteur qui voit ≥ { "4" } satellites peut calculer une position 3D complète et un point de temps.

# text
seg-f8eda357e640 = <b>Interruption / refus / dégradation / brouillage du GNSS.</b> Lorsque les signaux des satellites ne sont pas disponibles (bloqués, brouillés ou hors de vue). Pendant une interruption, le système doit « naviguer à l'estime » avec ses propres capteurs embarqués. Tout l'objet de Kshana est de mesurer à quel point cette navigation se passe bien.

# text
seg-a3ade199f465 = <b>Holdover.</b> En clair : <em>combien de temps l'horloge peut garder l'heure correcte par elle-même après avoir perdu le GNSS.</em> Une meilleure horloge tient plus longtemps avant que son erreur ne franchisse la limite admise.

# text
seg-83b33c15312f = <b>Navigation à l'estime.</b> En clair : <em>estimer où l'on est en additionnant son mouvement mesuré, sans aucune référence extérieure.</em> Les erreurs s'accumulent ; un meilleur capteur inertiel dérive donc plus lentement.

# text
seg-da9bcc994b9c = <b>Spécification / seuil.</b> L'erreur maximale admise avant que la solution soit jugée « hors spécification » — par exemple « la synchronisation temporelle doit rester dans { "20" } ns » ou « la position dans { "100" } m ».

# text
seg-6f37a60a30c7 = Les capteurs que Kshana compare

# text
seg-308b59d89586 = <b>Horloge (horloge atomique).</b> Un dispositif qui garde le temps en comptant l'oscillation naturelle d'un atome. Deux exemples ici :

# text
seg-3389d08be6bc = <b>CSAC — Chip-Scale Atomic Clock (horloge atomique à l'échelle d'une puce).</b> Une petite horloge commerciale déployée (la référence « classique »). Bonne, mais elle dérive sensiblement lors d'une longue interruption.

# text
seg-3e121d8e6400 = <b>Horloge à réseau optique (par exemple au strontium).</b> Une horloge « quantique » bien plus stable ; l'état de l'art en laboratoire, pas encore envoyée dans l'espace.

# text
seg-4daa6cdf8ae2 = <b>Accéléromètre.</b> Mesure l'accélération (changement de mouvement). Intégrée deux fois, elle donne la position — de sorte que toute erreur croît rapidement. <b>Accéléromètre à atomes froids</b> est la version quantique, à bien meilleure stabilité à long terme ; <b>de classe navigation</b> est la version classique.

# text
seg-91793676c57c = <b>Gyroscope.</b> Mesure la rotation. Une petite erreur de rotation incline la plateforme, ce qui fait fuir la gravité dans la direction horizontale et corrompt l'estimation de position.

# text
seg-2d36110effc3 = <b>IMU — Inertial Measurement Unit (centrale inertielle).</b> L'ensemble accéléromètres et gyroscopes lui-même : trois axes de chacun, qui fournit la force spécifique et la vitesse angulaire. Elle mesure le mouvement ; seule, elle ne sait pas où elle est.

# text
seg-e3b6b40e0cd0 = <b>INS — Inertial Navigation System (système de navigation inertielle).</b> Une IMU plus la « mécanisation » qui intègre sa sortie en attitude, vitesse et position. L'INS est ce qui navigue à l'estime pendant une interruption du GNSS, et sa précision est fixée par les processus d'erreur de l'IMU listés ci-dessous.

# text
seg-a618ff7ee429 = <b>Transfert de temps.</b> Envoyer un signal horaire précis entre deux endroits (par exemple de satellite à satellite). Les liaisons <b>optiques</b> sont bien plus précises que les liaisons <b>RF</b> (radiofréquence).

# text
seg-847fbbeecfae = Comment les erreurs sont modélisées (bruit d'horloge)

# text
seg-5cf197bdbbad = L'erreur d'horloge est construite à partir de « types de bruit » standard, chacun avec une signature connue :

# text
# c1: q_wf
seg-3806d1b1cb50 = <b>FM blanche (modulation de fréquence blanche).</b> En clair : <em>une gigue rapide et aléatoire de la fréquence de l'horloge.</em> La moyenner l'améliore avec le temps. Paramètre <c1/>.

# text
# c1: q_rw
seg-0793fdd3abab = <b>FM à marche aléatoire.</b> En clair : <em>la fréquence de l'horloge dérive lentement.</em> C'est ce qui domine les longues interruptions. Paramètre <c1/>.

# text
# c1: flicker_floor
seg-42b74c8b88ff = <b>FM de scintillement (bruit en 1/f).</b> En clair : <em>un plancher de bruit tenace sous lequel l'horloge ne peut jamais descendre en moyennant.</em> Il est plat sur tous les temps de moyennage. Paramètre <c1/>.

# text
# c1: drift
seg-b3bd841a5a2d = <b>Vieillissement / dérive.</b> Un changement lent et <em>prévisible</em> de la fréquence au cours du temps ; comme il est prévisible, l'estimateur de Kshana le supprime. Paramètre <c1/>.

# text
# c1: q_va
seg-d929960492e4 = <b>VRW — Velocity Random Walk (marche aléatoire de vitesse).</b> L'équivalent du bruit blanc pour l'accéléromètre : des à-coups aléatoires sur la vitesse qui s'accumulent en erreur de position. Paramètre <c1/>.

# text
# c1: q_arw
seg-4a97f8d14174 = <b>ARW — Angular Random Walk (marche aléatoire angulaire).</b> L'équivalent pour le gyroscope : des à-coups aléatoires sur l'orientation. Paramètre <c1/>.

# text
seg-dcd03b326110 = Comment la stabilité est mesurée

# text
# c1: σ_y(τ)
# c2: τ
# c3: σ_y(1 s) = 3×10⁻¹⁰
seg-2181832c6253 = <b>Déviation d'Allan (<c1/>).</b> En clair : <em>la manière standard d'indiquer la stabilité d'une horloge sur un temps de moyennage donné <c2/>.</em> La fiche technique d'une horloge indique, par exemple, <c3/>. Kshana valide son modèle d'horloge en calculant la déviation d'Allan de sa propre sortie et en vérifiant qu'elle correspond au chiffre publié. (Référence : Riley, NIST SP { "1065" } — National Institute of Standards and Technology Special Publication { "1065" }.)

# text
seg-11cbe561e633 = <b>PSD — Power Spectral Density (densité spectrale de puissance).</b> La façon dont la puissance d'un bruit est répartie selon les fréquences ; la manière formelle de spécifier un bruit blanc / à marche aléatoire / de scintillement.

# text
seg-0737d620eb5f = Les chiffres de mérite (comment une exécution est notée)

# text
seg-20b66e0d4809 = Les six chiffres de mérite PNT opérationnels que Kshana rapporte (voir le tableau « Output » du README) :

# text
seg-b17d08246e49 = <b>FoM — Figure of Merit (chiffre de mérite).</b> Un nombre qui note un aspect d'une exécution, rapporté avec son unité et indiquant s'il est vérifié ou modélisé. Les six ci-dessous sont les FoM opérationnels de Kshana.

# text
seg-b229a69fb4ac = <b>Performance de positionnement / de synchronisation temporelle</b> — la taille de l'erreur, en RMS (racine de la moyenne quadratique) et en 95ᵉ centile.

# text
seg-ba3ed5a28518 = <b>Autonomie</b> — la durée de holdover (combien de temps elle reste dans la spécification sans GNSS).

# text
seg-13ecdd037098 = <b>Résilience</b> — la vitesse de croissance de l'erreur une fois le GNSS perdu.

# text
seg-be0168f24d6e = <b>Disponibilité</b> — la fraction de l'exécution qui dispose d'une solution dans la spécification.

# text
seg-44ef500b371d = <b>Intégrité</b> — <em>peut-on se fier à l'estimation que le système fait de sa propre erreur ?</em> Kshana rapporte la fraction des échantillons d'interruption dont l'erreur réelle reste à l'intérieur de la borne de protection du filtre.

# text
seg-d1cc3819cde9 = <b>Sécurité</b> — robustesse au leurrage : un score de détectabilité du leurrage fondé sur la stabilité de l'horloge (depuis { "v0.3.0" }), significatif seulement lorsqu'un scénario d'attaque par leurrage est configuré. Ce n'est <em>pas</em> une intégrité de niveau aéronautique : il ne calcule aucun niveau de protection horizontal ou vertical (HPL/VPL) et n'exécute aucune surveillance autonome d'intégrité par le récepteur (RAIM), avancée ou non. Ceux-ci proviennent des types de scénario distincts d'intégrité et d'ARAIM (RAIM avancée) et sont définis sous « Intégrité et augmentation » ci-dessous. Sensible à l'exportation.

# text
seg-5cae59204d9e = Termes utilisés avec les chiffres de mérite :

# text
seg-7adc0e49a981 = <b>Leurrage.</b> En clair : <em>un faux signal satellitaire qui ment sur la position ou l'heure.</em> Un leurre donne au récepteur une réponse plausible mais fausse, ce qui est pire que le brouillage car le récepteur peut ne pas s'en apercevoir.

# text
seg-2d2e6cbeade6 = <b>1-DOF — un degré de liberté.</b> Un seul axe. L'erreur de position du paquet de scénarios de Kshana est sur un seul axe ; une réponse 3D complète exige le modèle à trois axes.

# text
seg-14a32d281c4b = <b>Ensemble Monte Carlo.</b> Exécuter le même scénario de nombreuses fois avec des graines aléatoires différentes et rapporter la dispersion des résultats plutôt qu'une seule exécution.

# text
seg-fcbea49a3592 = <b>CI — intervalle de confiance.</b> La plage dans laquelle une statistique est censée tomber avec une probabilité donnée (par exemple { "95" } %). Dans les tableaux et badges du README, « CI » signifie plus souvent <b>intégration continue</b> — l'exécution automatisée de construction et de test à chaque modification ; le contexte dit laquelle.

# text
seg-310abfd6a64c = <b>Borne k-sigma.</b> Une borne fixée à <em>k</em> écarts types de l'incertitude propre du filtre ; le chiffre de mérite d'intégrité compte à quelle fréquence l'erreur réelle reste à l'intérieur.

# text
# c1: src/fom.rs
seg-ad26afbaa7b4 = <b>CEP / 2DRMS — circular error probable / twice the distance root mean square (erreur circulaire probable / deux fois la racine de la distance quadratique moyenne).</b> Deux manières standard d'énoncer la précision horizontale 2D : le CEP est le rayon contenant { "50" } % des positions ; le 2DRMS est le double de l'erreur horizontale quadratique moyenne. La bibliothèque peut calculer les deux à partir d'une covariance de position (<c1/>), mais aucun type de scénario ne les rapporte encore.

# text
seg-fd93c1effba8 = Lire un résultat : les termes de la sortie

# text
seg-3432498093cf = Ce sont les noms que vous rencontrez dans un fichier de résultat ou dans le résumé du playground, d'abord en clair.

# text
# c1: holdover_s
seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> En clair : <em>combien de secondes le système est resté dans sa limite d'erreur après la perte du GNSS.</em> Kshana rapporte la plus courte de ces navigations à l'estime parmi toutes les interruptions de l'exécution, mesurée sur la grille de temps de l'exécution ; c'est donc une borne inférieure à la résolution du pas de temps. Un holdover égal à la durée de l'interruption signifie que la limite n'a jamais été franchie.

# text
# c1: timing_p95_ns
# c2: 0.0
seg-e68708a219f1 = <b>p95 (<c1/>).</b> En clair : <em>{ "95" } % du temps, l'erreur de synchronisation temporelle était aussi petite que cela ou plus petite.</em> C'est le 95ᵉ centile de l'erreur sur l'interruption. Une très petite valeur peut s'afficher <c2/> dans un résumé court ; le fichier JSON (JavaScript Object Notation) de résultat contient le nombre en pleine précision.

# text
# c1: integrity
# c2: INTEGRITY.md
seg-4dfaee63262d = <b>Intégrité (<c1/>).</b> En clair : <em>à quelle fréquence l'estimation d'erreur du système était honnête.</em> C'est la fraction des échantillons d'interruption dont l'erreur réelle est restée à l'intérieur de la borne k-sigma du filtre (définie ci-dessous). Une valeur proche de { "1" } signifie que l'estimateur n'a pas sous-estimé son erreur. Ce n'est pas un niveau de protection aéronautique ; voir « Intégrité et augmentation » ci-dessous et <a1><c2/></a1>.

# text
# c1: security
# c2: P_md
# c3: security n/a (no attack)
# c4: applicable: false
# c5: figure_tiers
seg-5af09f5129e0 = <b>Score de sécurité (<c1/>).</b> En clair : <em>avec quelle probabilité une attaque par leurrage est détectée.</em> C'est la probabilité que l'attaque configurée soit détectée — un moins la probabilité de non-détection <c2/> — déduite de la stabilité de l'horloge. Elle n'a de sens que lorsque le scénario configure une attaque par leurrage. Sans attaque configurée, le résumé d'une ligne affiche <c3/> et le résultat marque le chiffre <c4/> dans son bloc <c5/> ; la valeur reste dans le document et signifie « non applicable », et non « sécurité nulle ».

# text
# c1: pdop_min
seg-70113d509997 = <b>PDOP — position dilution of precision (dilution de précision de position ; clés telles que <c1/>).</b> En clair : <em>à quel point la géométrie des satellites amplifie l'erreur de mesure de distance en erreur de position.</em> L'erreur de position vaut à peu près le PDOP fois l'erreur de mesure de distance ; plus bas est donc meilleur. Voir <b>DOP</b> sous « Estimation et géométrie ».

# text
# c1: σ_y(τ)
# c2: τ
# c3: sigma_y(1 s) = 3e-10
seg-a445bf9a3c5f = <b>sigma_y (<c1/>, la déviation d'Allan).</b> En clair : <em>à quel point la fréquence d'une horloge oscille lorsqu'elle est moyennée sur un temps <c2/>.</em> Une ligne de fiche technique telle que <c3/> signifie que la fréquence, moyennée sur une seconde, varie d'environ { "3" } parties sur 10¹⁰. Plus petit signifie une horloge plus stable. Voir « Comment la stabilité est mesurée » ci-dessus.

# text
# c1: σ_y²(τ) = q_wf / τ
# c2: q_wf = sigma_y(1 s)²
# c3: q_rw
# c4: drift
seg-03b4bb05148d = <b>q_wf — intensité du bruit de fréquence blanc.</b> En clair : <em>la force de la gigue rapide et aléatoire de la fréquence d'une horloge.</em> C'est le coefficient dans <c1/> pour le bruit de fréquence blanc ; un scénario fixe donc <c2/> à partir de la déviation d'Allan à une seconde de la fiche technique. Ses compagnons sont <c3/> (bruit de fréquence à marche aléatoire) et <c4/> (vieillissement) ; voir « Comment les erreurs sont modélisées » ci-dessus.

# text
seg-074a1337ed99 = Termes de synchronisation temporelle des télécoms

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-9f61398628e4 = Les réseaux de télécommunications distribuent le temps sur des réseaux à commutation de paquets (Precision Time Protocol) à partir d'une horloge de référence alimentée par le GNSS, et le secteur de la normalisation des télécommunications de l'Union internationale des télécommunications (UIT-T) fixe des limites à l'erreur de temps que chaque horloge peut ajouter. Ces termes apparaissent dans le type de scénario <c1/> ; voir <a1><c2/></a1>.

# text
seg-f48712300b30 = <b>TE — time error (erreur de temps).</b> En clair : <em>l'écart entre l'heure d'une horloge et l'heure de référence, à un instant donné.</em> Positif ou négatif, généralement en nanosecondes.

# text
seg-ceda70656c6a = <b>max|TE| — erreur de temps absolue maximale.</b> En clair : <em>la pire erreur de temps observée sur la mesure, sans tenir compte de son signe.</em> C'est la limite principale que fixent la plupart des gabarits.

# text
seg-38d2922cd91d = <b>cTE — constant time error (erreur de temps constante).</b> En clair : <em>la part de décalage stable de l'erreur de temps</em> — l'erreur moyenne qui ne change pas au cours de la mesure.

# text
seg-a4a61df332cd = <b>dTE — dynamic time error (erreur de temps dynamique).</b> En clair : <em>la part oscillante de l'erreur de temps</em> — ce qui reste une fois le décalage constant retiré. Elle est jugée avec le MTIE et le TDEV.

# text
seg-31c0a85788b1 = <b>MTIE — maximum time interval error (erreur maximale d'intervalle de temps).</b> En clair : <em>la plus grande excursion de l'erreur de temps observée dans une fenêtre quelconque d'une longueur donnée.</em> Pour chaque longueur de fenêtre, il fait glisser une fenêtre le long de l'enregistrement et retient la plus grande variation crête à crête ; un gabarit donne la plus grande valeur admise pour chaque longueur de fenêtre.

# text
seg-53fa12cab0c6 = <b>TDEV — time deviation (déviation de temps).</b> En clair : <em>la dérive typique (quadratique moyenne) de l'erreur de temps pour un temps de moyennage donné,</em> une fois la gigue à court terme moyennée. C'est un cousin, dans le domaine temporel, de la déviation d'Allan et, comme le MTIE, il est comparé à un gabarit.

# text
seg-62b5eea14f6c = <b>PRTC — primary reference time clock (horloge de temps de référence primaire).</b> L'horloge en tête d'une chaîne de synchronisation temporelle télécom, normalement asservie au GNSS. Ses limites de performance figurent dans la Recommandation UIT-T G.8272.

# text
seg-8d6d4538981b = <b>ePRTC — enhanced primary reference time clock (horloge de temps de référence primaire améliorée).</b> Une PRTC avec une limite d'erreur de temps plus serrée, appuyée sur une horloge atomique locale très stable pour pouvoir tenir le temps lors d'une longue perte du GNSS. Recommandation UIT-T G.8272.1.

# text
seg-93fa4ac7c6fa = <b>T-BC — telecom boundary clock (horloge de frontière télécom).</b> Une horloge de réseau qui reçoit le temps de l'amont et le transmet en aval, en ajoutant une petite erreur de temps qui lui est propre. Recommandation UIT-T G.8273.2.

# text
seg-52d32a5db6b8 = <b>T-TSC — telecom time slave clock (horloge esclave de temps télécom).</b> L'horloge en bout de chaîne qui reçoit le temps et le fournit à l'équipement qui en a besoin (par exemple une station de base radio). Également couverte par la Recommandation UIT-T G.8273.2.

# text
seg-04d8ed12ca88 = <b>OCXO — oven-controlled crystal oscillator (oscillateur à quartz thermostaté).</b> Un oscillateur à quartz maintenu à température constante dans un petit four, ce qui le rend bien plus stable qu'un oscillateur à quartz ordinaire. Une horloge de holdover courante dans les équipements réseau ; elle vieillit (dérive) sensiblement sur plusieurs jours.

# text
seg-6742f7ba35ac = <b>CSAC — chip-scale atomic clock (horloge atomique à l'échelle d'une puce).</b> Une très petite horloge atomique (voir « Les capteurs que Kshana compare » ci-dessus). Plus stable que l'OCXO sur de longs holdovers, pour un coût et une consommation plus élevés.

# text
seg-c0e0c18bd867 = Niveaux de preuve : VALIDATED, MODELLED, PARTNER

# text
# c1: VERIFICATION-MATRIX.md
seg-61c0aa107fd9 = Chaque capacité de la matrice de vérification vérifiée par machine (<a1><c1/></a1>) porte l'un de trois niveaux.

# text
seg-13fb20435df3 = <b>VALIDATED.</b> En clair : <em>vérifié par rapport à la réponse de quelqu'un d'autre.</em> La sortie de la capacité a été comparée à une référence indépendante externe — des données mesurées réelles, une bibliothèque indépendante écrite par quelqu'un d'autre, ou des valeurs de référence publiées — et concorde dans une tolérance indiquée. Un contrôle d'intégration continue refuse une ligne VALIDATED qui ne nomme aucune référence externe.

# text
# c1: MODELLED-RATIONALE.md
seg-a5dfb48e4dcb = <b>MODELLED.</b> En clair : <em>construit à partir d'une physique solide et vérifié pour sa cohérence interne, mais pas encore comparé à une réponse extérieure.</em> Les chiffres sont significatifs pour la comparaison et les compromis de conception ; ils ne prouvent pas qu'un dispositif réel se comportera ainsi. <a1><c1/></a1> explique pourquoi chacune de ces lignes est modélisée.

# text
seg-0512b2d2145a = <b>PARTNER.</b> En clair : <em>cette part relève d'un partenaire matériel ou d'assurance produit, et Kshana n'affirme rien à son sujet.</em> La ligne existe pour que l'écart soit visible plutôt que silencieux.

# text
seg-278dee6d3d4c = Termes de spectre et d'interférence

# text
# c1: spectrum
# c2: SPECTRUM.md
seg-285a240c9958 = Ces termes apparaissent dans le type de scénario <c1/> ; voir <a1><c2/></a1>.

# text
seg-db4fdef1c562 = <b>BPSK(n) — binary phase-shift keying (modulation par déplacement de phase binaire) à n × { "1.023" } Mchip/s.</b> La modulation à éléments rectangulaires du GPS L1 grossier/acquisition (C/A) et du L2 civil (L2C) (n = { "1" }) et du GPS L5 et Galileo E5a (n = { "10" }). Son spectre est un sinc² avec des nuls tous les n × { "1.023" } MHz.

# text
seg-cdd0f4194f42 = <b>BOC(m, n) — binary offset carrier (porteuse à décalage binaire).</b> Un code d'étalement à n × { "1.023" } Mchip/s multiplié par une sous-porteuse carrée à m × { "1.023" } MHz, ce qui scinde le spectre en deux lobes de part et d'autre de la porteuse.

# text
seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — multiplexed binary offset carrier (porteuse à décalage binaire multiplexée).</b> La densité spectrale de puissance 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), convenue pour le service ouvert Galileo E1 et le GPS L1C ; Galileo la transmet sous forme de BOC composite (CBOC).

# text
seg-7423f94e3018 = <b>CW — continuous wave (onde continue).</b> Une porteuse non modulée : une seule tonalité.

# text
seg-55d03dd4af03 = <b>J/S — jammer-to-signal ratio (rapport brouilleur sur signal).</b> La puissance reçue du brouilleur sur la puissance reçue du signal, en décibels.

# text
seg-b0f2974647d4 = <b>SSC — spectral separation coefficient (coefficient de séparation spectrale).</b> κ = ∫ G_s(f) G_j(f) df sur la bande du récepteur : quelle part du spectre d'un brouilleur de puissance unitaire tombe là où tombe celui du signal. La densité porteuse sur bruit effective est [1/(C/N₀) + (J/S)·κ]⁻¹.

# text
seg-c5affeee5269 = <b>Facteur de bruit.</b> Ce qu'un récepteur ajoute au bruit thermique, sous forme d'un rapport F en décibels ; la température de bruit du système est T_ant + { "290" } K × (F − { "1" }).

# text
seg-5307c38d3036 = <b>Cascade (waterfall).</b> Une image temps-fréquence d'un spectre : la fréquence en travers, le temps vers le bas, la couleur pour la puissance.

# text
seg-3b1ac094fdc5 = <b>Estimation de Welch.</b> Une densité spectrale de puissance estimée en moyennant des périodogrammes fenêtrés et se chevauchant (Welch { "1967" }).

# text
# c1: .sigmf-meta
# c2: .sigmf-data
# c3: cf32_le
# c4: ci16_le
# c5: ci8
seg-9901d64fb895 = <b>SigMF — Signal Metadata Format.</b> Un format d'enregistrement ouvert : un fichier JSON <c1/> décrivant un fichier brut <c2/> d'échantillons (ici complexes <c3/>, <c4/> ou <c5/>).

# text
seg-83041671f422 = <b>IQ — in-phase and quadrature (en phase et en quadrature).</b> Les deux composantes d'un échantillon complexe en bande de base.

# text
seg-39e6ea8506b3 = Termes de signal LEO-PNT

# text
# c1: leo-signal
# c2: spectrum
# c3: LEO-SIGNAL.md
seg-36452ee3f5cc = Ces termes apparaissent dans le type de scénario <c1/> et dans les scénarios multibandes <c2/> ; voir <a1><c3/></a1>.

# text
seg-8363a15f3c5a = <b>LEO-PNT — positionnement, navigation et synchronisation temporelle en orbite terrestre basse.</b> Signaux de navigation diffusés par des satellites situés de quelques centaines à environ { "1200" } km d'altitude : plus puissants et plus rapides que le GNSS de l'orbite terrestre moyenne.

# text
seg-523469643156 = <b>RNSS, RDSS, MSS, EESS — Radio Navigation Satellite Service, Radio Determination Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service (services de radionavigation par satellite, de radiorepérage par satellite, mobile par satellite, et d'exploration de la Terre par satellite).</b> Attributions de services de l'UIT (Union internationale des télécommunications) dans lesquelles une bande peut se situer.

# text
seg-d1e494623341 = <b>Composantes pilote, données et acquisition.</b> Les parties d'un même signal : un pilote sans données pour la mesure de distance, une composante de données qui porte le message de navigation, et une courte composante d'acquisition à faible débit, facile à repérer.

# text
seg-cce232b7cd6a = <b>FDMA — frequency-division multiple access (accès multiple par répartition en fréquence).</b> Composantes ou satellites séparés par la fréquence porteuse plutôt que par le code.

# text
seg-9d9476ee62b1 = <b>Largeur de bande de Gabor (RMS).</b> β = √(∫ f² G df / ∫ G df) sur la bande du récepteur : l'étalement de la puissance d'un signal en fréquence, qui fixe la finesse avec laquelle il permet de mesurer la distance.

# text
seg-6febe9c2e506 = <b>DLL — delay lock loop (boucle à verrouillage de retard).</b> La boucle de poursuite du code ; l'espacement de ses corrélateurs avance-retard et sa largeur de bande de bruit fixent la gigue de mesure de distance due au bruit thermique.

# text
seg-5a55da97daf9 = <b>EFQPSK — enhanced Feher quadrature phase-shift keying (modulation de Feher en quadrature de phase améliorée).</b> Une modulation à enveloppe constante (Xona Pulsar) ; approchée ici par un spectre à éléments rectangulaires.

# text
seg-6dcbf1de9904 = <b>OFDM — orthogonal frequency-division multiplexing (multiplexage par répartition orthogonale en fréquence).</b> Une forme d'onde multiporteuse (la liaison descendante de Starlink) ; représentée ici comme une bande plate.

# text
seg-548b285c7c8e = <b>TEC — total electron content (contenu électronique total).</b> Électrons par mètre carré le long du trajet ; { "1" } TECU = 10¹⁶ él/m². Le retard ionosphérique au premier ordre est de { "40.3" }·TEC/f² mètres.

# text
seg-dd7e0743f364 = <b>EIRP — effective isotropic radiated power (puissance isotrope rayonnée équivalente, PIRE).</b> La puissance d'émission multipliée par le gain d'antenne vers le récepteur.

# text
seg-aba3b3eaba85 = Intégrité et augmentation

# text
seg-eab1b2c6728e = L'intégrité est la question de la <em>confiance</em> : non pas « quelle est la taille de mon erreur ? » mais « puis-je la borner, et me dira-t-on quand la borne est rompue ? » Ce sont les termes aéronautiques pour cela.

# text
# c1: src/raim.rs
seg-696a73449c49 = <b>RAIM — Receiver Autonomous Integrity Monitoring (surveillance autonome d'intégrité par le récepteur).</b> En clair : <em>le récepteur contrôle les satellites les uns par rapport aux autres.</em> Avec plus de satellites que les quatre dont un point a besoin, les restes (les résidus) devraient être petits ; un grand résidu signifie qu'un satellite ment, et le récepteur peut le dire sans aide du sol. Implémenté dans <a1><c1/></a1>.

# text
# c1: ARAIM_REFERENCE.md
seg-89237433f01a = <b>ARAIM — Advanced Receiver Autonomous Integrity Monitoring (surveillance autonome d'intégrité avancée par le récepteur).</b> La forme moderne de la RAIM, bifréquence et multiconstellation. Elle reçoit un message de support d'intégrité indiquant l'erreur supposée et la probabilité de défaut de chaque satellite, et retourne des niveaux de protection plutôt qu'un indicateur de réussite ou d'échec. Traitement complet, avec chaque hypothèse, dans <a1><c1/></a1>.

# text
# c1: leo-navmsg
seg-4cc13de05193 = <b>SISRE — Signal-in-Space Range Error (erreur de distance du signal dans l'espace).</b> En clair : <em>de combien l'orbite et l'horloge diffusées par un satellite faussent la distance qu'un utilisateur typique mesure.</em> L'erreur d'orbite est scindée en composantes radiale, le long de la trace et transversale, pondérées par la part de chacune qui apparaît le long d'une ligne de visée moyenne, puis combinées avec l'erreur d'horloge (Montenbruck et al. { "2018" }). Pour un satellite en orbite terrestre basse, les composantes le long de la trace et transversale pèsent bien plus que pour le GPS, car les utilisateurs le voient très loin du nadir. Utilisé par le type de scénario <c1/>.

# text
# c1: leo-navmsg
# c2: kepler-rac
seg-847e40a033e1 = <b>RAC — Radial, Along-track, Cross-track (radial, le long de la trace, transversal).</b> Les trois directions selon lesquelles une erreur d'orbite est décomposée : vers l'extérieur depuis le centre de la Terre, le long de la direction du vol, et perpendiculairement au plan orbital. Le modèle <c2/> du type de scénario <c1/> ajoute un polynôme de correction dans chacune.

# text
seg-b725d23c839e = <b>SVID — Space-Vehicle Identifier (identifiant de véhicule spatial).</b> Le numéro qu'un message de navigation utilise pour désigner le satellite qui l'a émis.

# text
seg-b0f850eb04b1 = <b>IOD — Issue of Data (numéro d'émission des données).</b> Un compteur qui change chaque fois que le contenu du message de navigation d'un satellite change, afin qu'un récepteur puisse distinguer un nouveau message d'une répétition. (À ne pas confondre avec une démonstration en orbite, également abrégée IOD, comme dans l'IOD Celeste de l'ESA.)

# text
seg-985a5e9c9ce9 = <b>TOW — Time of Week (temps de la semaine).</b> Secondes écoulées depuis le début de la semaine GNSS en cours (dimanche { "00" }:{ "00" }).

# text
# c1: 0x1864CFB
seg-1fc62dca46d6 = <b>CRC-24Q — contrôle de redondance cyclique sur 24 bits (polynôme Qualcomm).</b> Le contrôle de détection d'erreur que portent les messages RTCM { "10403" } et Galileo : un reste sur 24 bits des bits du message divisés par le polynôme <c1/>. Un récepteur le recalcule et écarte un message qui ne correspond pas.

# text
# c1: sigma_ure_m
# c2: src/raim.rs
seg-abb4679dab23 = <b>URE — User Range Error (erreur de distance utilisateur).</b> En clair : <em>de combien l'orbite et l'horloge diffusées par un satellite faussent chaque distance vers lui.</em> Aussi appelée erreur du signal dans l'espace (SISE) ; c'est le budget d'erreur par satellite dont sont alimentées l'ARAIM et la RAIM (<c1/> dans <a1><c2/></a1>).

# text
seg-158c210fd3fe = <b>MHSS — Multiple Hypothesis Solution Separation (séparation de solutions à hypothèses multiples).</b> La méthode qu'utilise l'ARAIM. Pour chaque manière dont la constellation pourrait être en défaut, elle forme une solution qui exclut les satellites suspects et borne l'écart que cette sous-solution peut avoir par rapport à la solution avec tous les satellites en vue.

# text
seg-671711003a6f = <b>HPL / VPL — Horizontal / Vertical Protection Level (niveau de protection horizontal / vertical).</b> En clair : <em>le rayon à l'intérieur duquel le système promet que se trouve l'erreur réelle, pour un risque d'intégrité donné.</em> C'est une borne que l'algorithme calcule, et non une erreur mesurée. Une exécution est disponible lorsque le niveau de protection reste sous la limite d'alerte que l'opération admet (VAL, la limite d'alerte verticale ; HAL, l'horizontale).

# text
# c1: src/sbas.rs
seg-5bbd2d664862 = <b>SBAS — Satellite-Based Augmentation System (système d'augmentation par satellites).</b> Un réseau au sol qui surveille le GNSS, calcule des corrections et des bornes d'intégrité, et les diffuse depuis des satellites géostationnaires. <b>WAAS — Wide Area Augmentation System</b> est le système des États-Unis ; EGNOS (le European Geostationary Navigation Overlay Service) est l'équivalent européen. Kshana calcule les niveaux de protection sous la forme des moindres carrés pondérés de la DO-229E (la DO-229E est la norme de performance opérationnelle minimale de la RTCA pour les récepteurs SBAS ; la RTCA s'appelait autrefois Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

# text
seg-ba8b448582af = Estimation et géométrie

# text
seg-2eb6e72496b8 = <b>Estimateur.</b> L'algorithme qui prédit la position/l'heure réelle pendant une interruption à partir du modèle de capteur. Kshana dispose d'un prédicteur analytique de holdover et d'un <b>filtre de Kalman</b>.

# text
seg-9b4aa612c5a9 = <b>Filtre de Kalman.</b> En clair : <em>un algorithme qui suit une grandeur et suit aussi son incertitude.</em> Kshana utilise sa borne d'incertitude pour calculer l'intégrité.

# text
seg-8fda81dfccc9 = <b>EKF — Extended Kalman Filter (filtre de Kalman étendu).</b> Un filtre de Kalman pour un problème non linéaire : il linéarise le modèle autour de l'estimation courante à chaque pas. Le choix standard pour coupler le GNSS à un INS.

# text
seg-9bc2c6f74b29 = <b>UKF — Unscented Kalman Filter (filtre de Kalman sans parfum).</b> Le même travail sans linéariser : il fait passer un petit ensemble de points d'échantillonnage choisis de façon déterministe dans le vrai modèle non linéaire et reconstruit la moyenne et la covariance à partir de leur point d'arrivée. Mieux comporté lorsque la non-linéarité est forte, ce qui explique que la détermination d'orbite l'utilise.

# text
seg-a1e52820e3a0 = <b>DOP — Dilution Of Precision (dilution de précision).</b> En clair : <em>à quel point la géométrie des satellites amplifie l'erreur de mesure de distance en erreur de position ou de temps.</em> Erreur de position ≈ PDOP × erreur de mesure de distance ; un nombre bas correspond donc à une bonne géométrie. La famille : <b>GDOP</b> (géométrique — position et temps ensemble), <b>PDOP</b> (position), <b>HDOP</b> (horizontale), <b>VDOP</b> (verticale), <b>TDOP</b> (temps).

# text
seg-e769a91a3e4b = <b>Constellation de Walker.</b> Une manière standard de décrire une constellation de satellites par son nombre de plans orbitaux et de satellites par plan (le GPS est à peu près une coque de Walker 24/6).

# text
seg-b557933a4e4d = <b>Masque d'élévation.</b> L'angle minimal au-dessus de l'horizon local à partir duquel un satellite est jugé utilisable ; les signaux trop bas sont exclus.

# text
seg-3ac8e11c3e33 = <b>Occultation.</b> Lorsque la Terre bloque physiquement la ligne de visée vers un satellite.

# text
# c1: max(elevation mask, skyline)
# c2: SKYLINE.md
seg-249bf472cb00 = <b>Skyline (masque de ligne d'horizon).</b> En clair : <em>le contour des bâtiments, des grues ou des collines se détachant sur le ciel, sous forme d'une élévation pour chaque azimut.</em> Un satellite compte comme en vue seulement au-dessus de <c1/> à son azimut, et un satellite au-dessus du masque mais derrière la skyline est « masqué par la skyline ». Kshana en construit une à partir d'un tableau, d'un canyon urbain, de secteurs et de relief (leur maximum point par point) ou d'un préréglage REPRESENTATIVE ; ligne de visée seulement, sans réflexion ni diffraction (<a1><c2/></a1>).

# text
# c1: SKYLINE.md
seg-620a88820a2d = <b>Géométrie du ciel.</b> Quels satellites un site voit sous une skyline et ce que cela fait à la solution : les facteurs DOP, la covariance est-nord-haut du point par moindres carrés et son <b>ellipse d'erreur</b>, la région horizontale qui contient la part indiquée des points ({ "95" } % par défaut) pour des erreurs de distance gaussiennes indépendantes et égales. Géométrie MODELLED sous un modèle d'erreur donné, et non l'erreur réelle d'un récepteur (<a1><c1/></a1>).

# text
# c1: src/integrity/mod.rs
seg-f0e610122425 = <b>CTI — Composed Timing Integrity (intégrité de synchronisation temporelle composée).</b> Niveaux de protection pour le <em>temps</em> plutôt que pour la position, calculés à travers un passage de relais entre différentes sources de temps — par exemple d'une horloge contrôlée par satellite (RAIM disponible) à une horloge libre en holdover — de sorte que la borne reste valide pendant la transition (<a1><c1/></a1>).

# text
# c1: src/benchmark/mod.rs
seg-56642f614c3f = <b>TIB — Timing Integrity Benchmark (étalon d'évaluation de l'intégrité de synchronisation temporelle).</b> Un étalon pour les moniteurs de synchronisation temporelle <em>d'autres personnes</em> : il injecte un menu de défauts et vérifie si le niveau de protection annoncé du moniteur a réellement borné son erreur. Il n'avance aucune affirmation de précision qui lui soit propre, de sorte qu'il ne peut pas en exagérer une (<a1><c1/></a1>).

# text
seg-8b89f8b913b9 = Orbites et cislunaire

# text
# c1: src/cr3bp.rs
seg-ba6b669eb8ba = <b>CR3BP — Circular Restricted Three-Body Problem (problème restreint circulaire à trois corps).</b> Le système Terre–Lune traité comme deux corps sur des orbites circulaires autour de leur centre de masse commun, plus un engin spatial trop léger pour exercer une attraction en retour. Près de la Lune, une ellipse de Kepler à deux corps n'a tout simplement pas la bonne forme ; le CR3BP est la dynamique la moins coûteuse qui soit juste (<a1><c1/></a1>).

# text
seg-2726a22bf14c = <b>NRHO — Near-Rectilinear Halo Orbit (orbite en halo quasi rectiligne).</b> Une orbite périodique du CR3BP qui passe tout près d'un pôle lunaire et très loin au-dessus de l'autre, de sorte qu'elle est presque une ligne droite vue de bout — d'où « quasi rectiligne ». C'est l'orbite choisie pour la Gateway lunaire, et elle conserve une ligne de visée quasi continue vers la Terre.

# text
seg-2b2e6d04376c = <b>DRO — Distant Retrograde Orbit (orbite rétrograde distante).</b> Une autre famille du CR3BP : une grande orbite stable qui tourne autour de la Lune à rebours, vue dans le référentiel tournant.

# text
# c1: finals2000A
# c2: --eop
seg-6bb9229aee5c = <b>EOP — Earth Orientation Parameters (paramètres d'orientation de la Terre).</b> L'oscillation et la rotation mesurées, légèrement irrégulières, de la Terre (mouvement du pôle, UT1 (Universal Time { "1" }, temps de rotation de la Terre)−UTC — temps de rotation de la Terre moins temps universel coordonné — et durée du jour) nécessaires pour transformer une position fixe dans le référentiel terrestre en position inertielle à mieux que quelques mètres. L'IERS (International Earth Rotation and Reference Systems Service) les publie ; Kshana lit son fichier <c1/> via <c2/>.

# text
seg-7f1e7e523e5b = Normes, formats et organisations

# text
seg-5d8d6144c13a = Les abréviations que le README et les pages de paquets emploient pour les normes, les formats de fichier, les échelles de temps, les référentiels et les organismes qui les portent. Chacune est aussi développée à sa première utilisation dans ces pages.

# text
seg-800d42de0777 = Orbites, référentiels et temps

# text
seg-320a1594dcf1 = <b>SGP4 / SDP4 — Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> Les propagateurs analytiques standard pour les orbites de satellites publiées.

# text
seg-87a098568846 = <b>TLE — two-line element set (jeu d'éléments à deux lignes).</b> Le format public d'orbite que lit SGP4.

# text
seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — orbite terrestre basse / orbite terrestre moyenne / orbite de transfert géostationnaire / orbite géosynchrone inclinée.</b> Régimes d'orbite ; la plupart des satellites GNSS volent en MEO.

# text
seg-1ec323dbd7a6 = LMO — orbite basse de Mars.

# text
seg-d0be640282af = <b>ECI / ECEF — Earth-centred inertial / Earth-centred, Earth-fixed (inertiel centré sur la Terre / centré sur la Terre et fixe par rapport à elle).</b> Un référentiel qui ne tourne pas avec la Terre, et un qui tourne avec elle.

# text
seg-09a937adc1db = <b>TEME — true equator, mean equinox (équateur vrai, équinoxe moyen).</b> Le référentiel dans lequel SGP4 produit sa sortie.

# text
seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — Geocentric Celestial Reference System / International Terrestrial Reference System / sa réalisation, l'International Terrestrial Reference Frame.</b> Les référentiels modernes, inertiel et fixe par rapport à la Terre.

# text
seg-56b24c3734be = <b>CIO — Celestial Intermediate Origin (origine intermédiaire céleste).</b> Le point de référence de la chaîne moderne de rotation de la Terre sans équinoxe.

# text
seg-a23b05c85a63 = <b>LVLH — local vertical, local horizontal (verticale locale, horizontale locale).</b> Un référentiel qui se déplace avec l'engin spatial.

# text
seg-ac37217cda0d = <b>WGS-84 — World Geodetic System { "1984" }.</b> L'ellipsoïde terrestre qu'utilise le GPS.

# text
seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — temps universel coordonné / temps atomique international / temps terrestre / temps universel { "1" } (temps de rotation de la Terre) / temps dynamique barycentrique.

# text
seg-ea7eb1f34cae = <b>LTC / TCL — Lunar Coordinate Time (Temps-Coordonnée Lunaire).</b> L'échelle de temps proposée pour la Lune.

# text
seg-c6e5976d9dff = <b>OD — détermination d'orbite.</b> Retrouver une orbite à partir de mesures de poursuite.

# text
seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> et <b>DRO</b> sont définis sous « Orbites et cislunaire » ci-dessus.

# text
seg-2e6ba9069396 = Formats de fichier et messages

# text
seg-ed5ea0a21e3f = <b>SP3 — Standard Product { "3" }.</b> Le format de fichier d'orbite précise de l'International GNSS Service (IGS), dans ses versions c et d.

# text
seg-1bfa0d083935 = <b>RINEX — Receiver Independent Exchange Format (format d'échange indépendant du récepteur).</b> Le format de fichier standard pour les observations GNSS et les éphémérides diffusées.

# text
seg-39ce08a9ae66 = IONEX — IONosphere map EXchange format (format d'échange de cartes de l'ionosphère).

# text
seg-c23ea3515008 = <b>OEM / OMM / TDM — Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Messages standard pour les orbites et les données de poursuite du Consultative Committee for Space Data Systems (CCSDS).

# text
seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language.</b> Le format en texte brut des scénarios Kshana.

# text
seg-2795dff8d607 = <b>KIF — Kshana Interchange Format (format d'échange Kshana).</b> L'enveloppe de résultat versionnée et autodescriptive de Kshana.

# text
seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> Normes de performance opérationnelle minimale de la RTCA pour les récepteurs SBAS et pour l'équipement GPS embarqué avec augmentation à bord de l'aéronef.

# text
seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> Les spécifications d'interface du GPS (la seconde couvre le signal L5).

# text
seg-2230000aa30b = <b>NIST SP { "1065" }.</b> Le <em>Handbook of Frequency Stability Analysis</em> du National Institute of Standards and Technology.

# text
seg-8b89719c1859 = <b>TRL — technology readiness level (niveau de maturité technologique).</b> Une échelle de 1 à 9 de la maturité du matériel.

# text
seg-16c972f4ea0a = Organisations

# text
seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — l'Agence spatiale européenne, son Centre européen d'opérations spatiales et son réseau européen de poursuite spatiale.

# text
seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — l'agence spatiale américaine (National Aeronautics and Space Administration), son Jet Propulsion Laboratory, son Navigation and Ancillary Information Facility (qui publie la boîte à outils SPICE — Spacecraft, Planet, Instrument, C-matrix, Events) et son Deep Space Network.

# text
seg-eaa5a2a51169 = <b>IGS</b> — l'International GNSS Service. <b>IERS</b> — l'International Earth Rotation and Reference Systems Service. <b>IAU</b> — l'Union astronomique internationale (dont la bibliothèque SOFA, Standards of Fundamental Astronomy, et son portage ouvert ERFA, Essential Routines for Fundamental Astronomy, sont les références de référentiels de Kshana).

# text
seg-81af4c0f4c48 = <b>CCSDS</b> — le Consultative Committee for Space Data Systems. <b>AIAA</b> — l'American Institute of Aeronautics and Astronautics. <b>RTCA</b> — autrefois la Radio Technical Commission for Aeronautics.

# text
seg-aa0b395df17f = Logiciel et chaîne d'approvisionnement

# text
seg-b42188d3a6f4 = CLI — interface en ligne de commande.

# text
seg-198c591514ab = <b>MCP — Model Context Protocol</b>, le protocole que parle le serveur d'agents de Kshana. <b>IDE — environnement de développement intégré.</b>

# text
seg-287bf61a1a16 = SBOM — nomenclature logicielle (software bill of materials).

# text
seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>, le cadre de provenance de construction sous lequel les versions de Kshana sont attestées.

# text
seg-7487c6f9ed18 = Toutes les autres abréviations, de A à Z

# text
# c1: docs/
seg-56f6039bb38a = Toutes les abréviations employées dans la documentation du dépôt (<c1/> et les quatre README) qu'aucune section ci-dessus ne définit, plus quelques-unes qu'une section définit, répétées pour la consultation. Chaque page développe aussi ses abréviations à la première utilisation ; ce tableau est l'unique endroit où toutes les retrouver. Quelques entrées sont des identifiants ou des noms plutôt que des abréviations, et le disent.

# text
seg-c0dfa446e523 = Signifie

# text
seg-f272d28225ae = Où on la rencontre

# text
seg-ffb0596f134b = Third Generation Partnership Project (projet de partenariat de troisième génération)

# text
seg-77c1b4478387 = l'organisme qui rédige les normes 5G, y compris les réseaux non terrestres

# text
seg-eaf19768b977 = réseau mobile de cinquième génération

# text
seg-692ddc163c55 = y compris son positionnement par réseau non terrestre (NTN)

# text
seg-9524be916f07 = ABI

# text
seg-0e8332db764b = interface binaire d'application

# text
seg-762ea76708dc = balises de wheels Python

# text
seg-d419d06ed622 = ABMF

# text
seg-b294c714487d = la station IGS du Moule, en Guadeloupe

# text
seg-586a8ea87638 = un identifiant de station de quatre caractères

# text
seg-4cc9a09495e6 = AC

# text
seg-620e2dc5e4ca = courant alternatif

# text
seg-9cfb5dc4b4bc = comme dans l'effet Stark AC (déplacement lumineux)

# text
seg-90308009c536 = ADD

# text
seg-49d97c65662d = Algorithm Description Document (document de description de l'algorithme)

# text
seg-493b5ceaa0fb = l'algorithme aéroporté de référence ARAIM du WG-C

# text
seg-3fe5d7f41dcd = ADEV / OADEV

# text
seg-089ac7d5ac94 = déviation d'Allan / déviation d'Allan à recouvrement

# text
seg-23c38ecbc543 = voir déviation d'Allan ci-dessus

# text
seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

# text
seg-4b642742f2d4 = références de capteurs inertiels (Analog Devices ; Safran Sensonor ; MicroStrain)

# text
seg-c4c0a93477a8 = des identifiants, pas des abréviations

# text
seg-36743c7fe98e = AEM

# text
seg-142ca108a070 = Attitude Ephemeris Message (message d'éphéméride d'attitude)

# text
seg-c34185a83d8e = un message CCSDS

# text
seg-dd89e1deb663 = AESS

# text
seg-898b29aaef84 = Aerospace and Electronic Systems Society (société des systèmes aérospatiaux et électroniques)

# text
seg-78692bf5addf = de l'IEEE

# text
seg-f429be16014e = AF

# text
seg-afa04bc28b42 = facteur de moyennage

# text
seg-b3db60632b92 = le multiple entier de l'intervalle d'échantillonnage dans un estimateur de type Allan

# text
seg-6097c4709542 = AFS

# text
seg-7043ab3fe32b = Augmented Forward Signal (signal aller augmenté)

# text
seg-20380d29d286 = le signal de navigation lunaire LunaNet

# text
seg-b33d60fa5832 = AGC

# text
seg-98c9c2809bd6 = commande automatique de gain

# text
seg-750b8717220b = un indicateur de brouillage dans un étage d'entrée de récepteur

# text
seg-31b864b910d5 = AHP

# text
seg-f956cbe86552 = Analytic Hierarchy Process (processus d'analyse hiérarchique)

# text
seg-c2b63847e2dc = une méthode de pondération multicritère (Saaty)

# text
seg-0e00edd7e222 = AI / ML

# text
seg-6d804a116a08 = intelligence artificielle / apprentissage automatique

# text
seg-079020f86d22 = AL / HAL / VAL

# text
seg-1981b764715b = limite d'alerte / limite d'alerte horizontale / limite d'alerte verticale

# text
seg-1e52f04eb047 = l'erreur qu'un moniteur d'intégrité doit borner

# text
seg-c7ce4d3299b8 = AltBOC

# text
seg-f630bcd1d523 = porteuse à décalage binaire alternative

# text
seg-e3acb231cf4d = la modulation Galileo E5

# text
seg-79b130764f97 = moyenne arithmétique–moyenne harmonique (inégalité)

# text
seg-190b782b70ce = AOCS

# text
seg-6459d9bce282 = système de contrôle d'attitude et d'orbite

# text
seg-14ec3e19c990 = AOS / TCA / LOS

# text
seg-7cdb4a7e6df4 = acquisition du signal / instant de plus courte distance / perte du signal

# text
seg-8b73e2c51498 = les événements d'un passage au-dessus d'une station sol (LOS signifie aussi ligne de visée ; le contexte dit laquelle)

# text
seg-27ceb7163571 = API

# text
seg-7903f5ff4027 = interface de programmation d'application

# text
seg-d6bea5dea0dc = APID

# text
seg-d468b4555dbf = identifiant de processus d'application

# text
seg-55730824c8cf = le champ d'en-tête de paquet spatial CCSDS

# text
seg-611cd7a0d378 = APS

# text
seg-55842a648c47 = American Physical Society (société américaine de physique)

# text
seg-07dcfba8a3c9 = APV

# text
seg-1a7fbb0deef2 = approche avec guidage vertical

# text
seg-69a6cc8a532a = APV-I : limites d'alerte de { "40" } m à l'horizontale, { "50" } m à la verticale

# text
seg-f357a0a03c60 = ARL

# text
seg-b4ce3803afa6 = longueur moyenne de séquence

# text
seg-08a5d53f813c = le temps moyen qu'un détecteur de changement met à donner l'alarme

# text
seg-519e65f68c85 = ARM / ARM64

# text
seg-1db3bdee5f76 = l'architecture de processeur Arm / sa forme 64 bits

# text
seg-33f6dff869b2 = ASD

# text
seg-dd98c69872e0 = densité spectrale d'amplitude

# text
seg-9fb629e35a25 = la racine carrée d'une densité spectrale de puissance

# text
seg-a020de5e94e5 = AU

# text
seg-2342680bc7a6 = unité astronomique

# text
seg-894bf4353ce3 = { "149 597 870.7" } km

# text
seg-611aec9d1dce = AUC / ROC

# text
seg-a11aa1d8f433 = aire sous la courbe / caractéristique de fonctionnement du récepteur

# text
seg-4d65dbf47a5c = évaluation de détecteur

# text
seg-25dc893d746a = AWS

# text
seg-20979dc817ba = Amazon Web Services

# text
seg-569160c6e52d = héberge un miroir ouvert des tuiles d'élévation SRTM

# text
seg-298c6a00085d = BEL

# text
seg-c7ce8fa2c544 = affaiblissement de pénétration dans les bâtiments

# text
seg-b714453f9b2c = ITU-R P.2109

# text
seg-b9aec1857aa9 = BI

# text
seg-40ea7b7e321e = instabilité de biais

# text
seg-ff2ba8692cbc = le minimum plat de la déviation d'Allan d'un capteur inertiel

# text
seg-e7c1cfecd45e = BIPM

# text
seg-dc138478d882 = Bureau International des Poids et Mesures

# text
seg-6ec98084ac58 = publie la Circular T

# text
seg-4ff08facda60 = BKG

# text
seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (agence fédérale allemande de cartographie et de géodésie)

# text
seg-ac4765a77015 = exploite un miroir de données de l'IGS

# text
seg-a85954d9176e = BSD

# text
seg-eb42c5807e5a = Berkeley Software Distribution

# text
seg-a332a259125a = comme dans les licences BSD

# text
seg-97764c651815 = BSP

# text
seg-8f85848ee08a = SPK binaire

# text
seg-6e01dca47581 = un fichier noyau d'éphéméride SPICE binaire

# text
seg-0157bbd7a064 = BSTAR

# text
seg-23772d56a24c = le terme de traînée d'un jeu d'éléments à deux lignes

# text
seg-628e6c686508 = CAI

# text
seg-a2418a88886c = interféromètre à atomes froids

# text
seg-273a3b8d5385 = voir QUANTUM.md

# text
seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

# text
seg-fa257dda6d45 = CC / CC BY

# text
seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

# text
seg-a1f55ee72524 = une licence de données ou de texte

# text
seg-1b8df20680a0 = CDDIS

# text
seg-0a158229f571 = Crustal Dynamics Data Information System

# text
seg-5b3f50bed1f6 = l'archive de géodésie spatiale de la NASA

# text
seg-ee2ac06a3023 = CDF

# text
seg-0a54599e470d = fonction de répartition

# text
seg-6100157bdc02 = CFAR

# text
seg-43ef1f6cd71d = taux de fausses alarmes constant

# text
seg-b38b56b63da6 = une règle de seuil de détecteur d'acquisition

# text
seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

# text
seg-4dab086e5c3d = le datum de BeiDou

# text
seg-8f7751d39781 = CIP

# text
seg-e34a194da574 = Celestial Intermediate Pole (pôle intermédiaire céleste)

# text
seg-c9b37d94f70b = CIRS

# text
seg-29e69d7f32aa = Celestial Intermediate Reference System (système de référence intermédiaire céleste)

# text
seg-a543c4d02ace = CISA

# text
seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency (agence de cybersécurité et de sécurité des infrastructures)

# text
seg-59c481cb5741 = du DHS américain

# text
seg-4f7ba1fd1f4c = CM / CL

# text
seg-4fb8507eb747 = civil modéré / civil long

# text
seg-cc0c8f1524f8 = les deux codes GPS L2C multiplexés dans le temps

# text
seg-2ea49f6a1ae9 = CMPL

# text
seg-68b147628ea1 = niveau de protection en mode commun

# text
seg-d469cd44d9d4 = la borne des erreurs qu'un test de résidus ne peut pas voir

# text
seg-4e25d07b13c9 = CN

# text
seg-e775ec496f2b = newtonien convergé

# text
seg-5d679a981a34 = la correction d'aberration de temps de lumière de SPICE

# text
seg-3da9a2841b6c = C/N0 (C/N₀)

# text
seg-cf60da0631b4 = en dB-Hz

# text
seg-f4488db8194d = COPRAS

# text
seg-6379891c1750 = COmplex PRoportional ASsessment (évaluation proportionnelle complexe)

# text
seg-b99fe66bd09c = une méthode de classement multicritère

# text
seg-a562dbafa35f = COSPAR

# text
seg-c09ea7bc49b0 = Committee on Space Research (comité de la recherche spatiale)

# text
seg-235850ad0d1f = attribue les désignations internationales de satellites

# text
seg-dbc3e7c90fe0 = CPR

# text
seg-1fd5b461cc3d = cycle par révolution

# text
seg-a1d4080ce019 = une accélération orbitale empirique à la fréquence orbitale

# text
seg-96cd47b07b44 = CPU / GPU / NPU

# text
seg-10ad2f10bec0 = unité de traitement centrale / graphique / neuronale

# text
seg-93621c1a1e37 = CRB / CRLB

# text
seg-70b6a0b19705 = borne de Cramér–Rao / borne inférieure de Cramér–Rao

# text
seg-6eb684e34f56 = la plus petite variance qu'un estimateur sans biais puisse atteindre

# text
seg-93c4fe0f2990 = CRD

# text
seg-6efd9a1fdbcc = Consolidated laser Ranging Data format (format consolidé de données de télémétrie laser)

# text
seg-eb95135f849c = fichiers de points normaux de l'ILRS

# text
seg-f23ff835b9b0 = CRPA

# text
seg-b5c26297e11b = antenne à diagramme de réception contrôlé

# text
seg-7111b9c4d382 = un réseau d'antennes anti-brouillage

# text
seg-404133a74afc = CR / RI

# text
seg-d35896b2bb24 = rapport de cohérence / indice aléatoire

# text
seg-cfa91dc02138 = le contrôle de cohérence AHP (accepter CR < { "0.10" })

# text
seg-8572a3faf46a = CS GROUP

# text
seg-5e00428ed929 = l'entreprise française qui maintient Orekit

# text
seg-58d5f143ff3b = un nom d'entreprise, pas une abréviation à développer

# text
seg-be388831a3e1 = CSK

# text
seg-9cf6cad11f64 = modulation par déplacement de code

# text
seg-a3bd162146d6 = CSS

# text
seg-75ddcc97f9e2 = Cascading Style Sheets (feuilles de style en cascade)

# text
seg-0d5c127b2ee5 = CUSUM

# text
seg-d40da5f47035 = somme cumulée

# text
seg-66f752e15abc = un détecteur séquentiel de changement

# text
seg-92ac0357d01e = CV

# text
seg-28f75c073917 = (vue commune dans le transfert de temps ; le contexte dit laquelle)

# text
seg-507b8c235614 = CZML

# text
seg-0b76641dee1a = Cesium Language

# text
seg-fd0a7af2ebeb = le format de scène JSON de CesiumJS

# text
seg-1aefbc0b799d = dB / dBW / dB-Hz

# text
seg-8a0d954bd13b = décibel / décibel-watt / décibel-hertz

# text
seg-c485de5bcd85 = rapport de puissances, puissance absolue et unité de C/N0

# text
seg-6c0cbce59df5 = DC

# text
seg-ddd7d412fce7 = courant continu

# text
seg-0ea7fccee332 = la limite à fréquence nulle

# text
seg-521e2abbe12d = DCM

# text
seg-3db4487dc2a4 = matrice des cosinus directeurs

# text
seg-9d3d9ca79a9d = une matrice de rotation

# text
seg-364a2fcec10b = DCO

# text
seg-110b1eb4f532 = Developer Certificate of Origin

# text
seg-1545bd59f5ef = DCT

# text
seg-8b6866288bea = tableau de contrôle de conception

# text
seg-80d95f099e9a = un tableau de bilan de liaison (l'exemple Galileo en bande X du JPL DESCANSO)

# text
seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

# text
seg-ed8d5c361e79 = JPL Development Ephemeris (versions { "421" }, { "430" }, { "440" }, { "441" })

# text
seg-748af19e3f0b = éphémérides planétaires et lunaires ; « de qualité DE » désigne une exactitude de cette classe

# text
seg-6f880928ce0c = DEM

# text
seg-eed6ad669d4c = modèle numérique d'élévation

# text
seg-920f5ff86fa2 = DESCANSO

# text
seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

# text
seg-2e11a1976171 = série de monographies du JPL

# text
seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (institut allemand de recherche géodésique de l'Université technique de Munich)

# text
seg-e7cedd55549e = héberge l'EUROLAS Data Center

# text
seg-4389ecd5c81a = DGNSS

# text
seg-fb8c5992354b = GNSS différentiel

# text
seg-3fed847ae9ec = DHS

# text
seg-2845322fad33 = Department of Homeland Security (département de la Sécurité intérieure)

# text
seg-6b487421c547 = États-Unis

# text
seg-9e06c8655623 = DoD

# text
seg-7a7ea4a3f0d5 = Department of Defense (département de la Défense)

# text
seg-1f6c4757bee5 = DOF / DoF

# text
seg-e1daefad0696 = degré de liberté

# text
seg-bf5bc69cb873 = voir 1-DOF ci-dessus

# text
seg-3b5c7c9b324d = DOR / Δ-DOR

# text
seg-3e0b6392f4d9 = mesure de distance différentielle à sens unique / mesure de distance différentielle à sens unique delta

# text
seg-6ba2d3b5b724 = poursuite angulaire en espace lointain

# text
seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

# text
seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

# text
seg-00ecc6de9912 = intégrateurs numériques

# text
seg-16c4bf2faef3 = DRMS

# text
seg-8128cc0c1482 = racine de la distance quadratique moyenne

# text
seg-a8ed04890ded = voir 2DRMS

# text
seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

# text
seg-371644e70b75 = numéros de documents de fiches techniques Microchip

# text
seg-f25e5c4de1e5 = DSAC

# text
seg-aa0d8d4b3a3b = Deep Space Atomic Clock

# text
seg-e80350ed521f = l'horloge à ions mercure piégés de la NASA

# text
seg-52e838301c0b = UT1 moins UTC

# text
seg-fbce3b3b7b80 = la correction de rotation de la Terre

# text
seg-8aa996f34920 = énergie par bit sur densité de bruit

# text
seg-463b21c0b791 = le référentiel inertiel aligné sur le référentiel terrestre au début d'une exécution

# text
seg-4dc987bd9dbf = utilisé par les exports d'interopérabilité leo-pass

# text
seg-61f975df5e21 = ECMAScript / ES

# text
seg-c66e728cd2fa = la norme qui sous-tend JavaScript / un module ES

# text
seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

# text
seg-2967e958f353 = un modèle de pression solaire pour le GNSS (CODE : Center for Orbit Determination in Europe)

# text
seg-244af4062ccc = ECSS

# text
seg-b74029376aba = European Cooperation for Space Standardization (coopération européenne pour la normalisation spatiale)

# text
seg-d452e23d503a = ECSS-E-ST-10-02 est sa norme de vérification

# text
seg-becb6685ff13 = ED

# text
seg-b6448e14a567 = document EUROCAE

# text
seg-ee4ada9c4c6e = comme dans ED-259A

# text
seg-8a57ce8403b1 = EDL

# text
seg-0f065f2290f3 = entrée, descente et atterrissage

# text
seg-69f37001de44 = EEE

# text
seg-18a1b66286ee = (composants) électriques, électroniques et électromécaniques

# text
seg-f814c1301059 = assurance produit spatial

# text
seg-08e455b17435 = EGM / EGM2008

# text
seg-1ed72a253035 = Earth Gravitational Model (la version { "2008" })

# text
seg-074e3ceb394e = NGA

# text
seg-69ba7307ea4c = EIGEN

# text
seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

# text
seg-a49ce7809382 = ELECTRE

# text
seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (élimination et choix traduisant la réalité)

# text
seg-efb2f919955a = une méthode multicritère de surclassement

# text
seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, la version MPP02 (Chapront)

# text
seg-b1d699d70339 = une théorie lunaire analytique

# text
seg-aee5eeb23064 = équateur moyen et équinoxe moyen de la Terre à J2000

# text
seg-16d9b8eac95d = un référentiel inertiel

# text
seg-e676d5eec6e3 = EML

# text
seg-f4bba0abbda7 = un discriminateur de code

# text
seg-0e4110d33849 = EMT

# text
seg-103c6de62575 = seuil de moniteur effectif

# text
seg-4b2101113387 = une sortie d'ARAIM

# text
seg-0e2817aec74a = ENU / NED

# text
seg-56d5cf1544d9 = est-nord-haut / nord-est-bas

# text
seg-aae7610833a7 = référentiels de niveau local

# text
seg-c7d5c5d5c5b2 = EO

# text
seg-24907930c730 = observation de la Terre

# text
seg-38f9c209c4ac = EPM / EPM2021

# text
seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (la version { "2021" })

# text
seg-bd2a27a17f6d = éphéméride de l'IAA RAS

# text
seg-01a8e43fb6c7 = ERA

# text
seg-eb78ffaf7e1d = angle de rotation de la Terre

# text
seg-966ed500f705 = ESKF

# text
seg-e79112a3132a = filtre de Kalman à état d'erreur

# text
seg-25c6b6b19d75 = ESS

# text
seg-fe2b7be913f0 = taille d'échantillon effective

# text
seg-57ce1c1b617b = d'un filtre particulaire

# text
seg-f529300f944b = ESSR

# text
seg-869be8388d26 = European Space Software Repository (dépôt européen de logiciels spatiaux)

# text
seg-536d66d208e4 = ESA

# text
seg-27be9c1d7090 = ET

# text
seg-7cc2ef5b0748 = temps des éphémérides

# text
seg-e0c49639649e = le nom que SPICE donne au TDB

# text
seg-80de6914a5ec = EUROCAE

# text
seg-76897dd8c3be = Organisation européenne pour l'équipement de l'aviation civile

# text
seg-b4f12b7813dd = EUROLAS

# text
seg-857527c69d6e = European Laser Network (réseau laser européen)

# text
seg-fa7025d88c88 = télémétrie laser sur satellites et sur la Lune

# text
seg-13fc009b947c = FAQ

# text
seg-f5581b33ae89 = foire aux questions

# text
seg-67d10fd4a4e0 = FCC

# text
seg-0a558c281968 = Federal Communications Commission (commission fédérale des communications)

# text
seg-f6ade8c24d27 = FCNN

# text
seg-6098513947b8 = réseau de neurones entièrement connecté

# text
seg-1de7b4410369 = FD

# text
seg-4e73ff36d37f = différence finie

# text
seg-e43312a5fbbe = FDE

# text
seg-d6c9fb239b59 = détection et exclusion de défauts

# text
seg-8f9d11564223 = FES / FES2004

# text
seg-1a1cf1501056 = Finite Element Solution (la version { "2004" })

# text
seg-878b4a645ae9 = un modèle de marée océanique

# text
seg-55c14f474a10 = FIM

# text
seg-b68c86e68570 = matrice d'information de Fisher

# text
seg-d39671724dfc = hachage Fowler–Noll–Vo, variante 1a

# text
seg-3354ad42f7dd = utilisé pour figer les sorties de référence

# text
seg-efca4decfec0 = FOC / IOV

# text
seg-793d96ab9856 = capacité opérationnelle complète / validation en orbite

# text
seg-ce13cca7f222 = générations de satellites (Galileo, Xona Pulsar)

# text
seg-58df7305e218 = FOV / IFOV

# text
seg-cafe1f8733ec = champ de vue / champ de vue instantané

# text
seg-4f7168e895d2 = FPGA / MCU / RTOS

# text
seg-abde801ec70b = réseau de portes programmable sur site / microcontrôleur / système d'exploitation temps réel

# text
seg-a082e4570309 = FSL / FSPL

# text
seg-3a8ee2932a46 = affaiblissement en espace libre / affaiblissement de propagation en espace libre

# text
seg-4535dadf79df = ITU-R P.525

# text
seg-c0209066dc76 = GB / KB / MB

# text
seg-184bb3d8b345 = gigaoctet / kilooctet / mégaoctet

# text
seg-8094e61fdd76 = GCRF

# text
seg-6c6337c7a855 = Geocentric Celestial Reference Frame (référentiel céleste géocentrique)

# text
seg-f050f2b8dee1 = GDAL

# text
seg-98b12fcceb01 = Geospatial Data Abstraction Library

# text
seg-1cef8718c772 = GEO

# text
seg-6131e4ea7858 = orbite géostationnaire

# text
seg-bf09433a7342 = GeoJSON

# text
seg-f8654e88af67 = Geographic JavaScript Object Notation

# text
seg-70dc52cd5059 = IETF RFC { "7946" }

# text
seg-bb8fbd2ebc28 = GG

# text
seg-b93ed4ab2b79 = gradient de gravité

# text
seg-d8ef4d361e86 = comme dans le couple de gradient de gravité

# text
seg-12fd4eb15c4d = GHz / kHz

# text
seg-0769cc8be024 = gigahertz / kilohertz

# text
seg-3946b69535e4 = GIM

# text
seg-ef5fc608b0e5 = carte globale de l'ionosphère

# text
seg-8cbbff1bc1d1 = GINS / KF-GINS

# text
seg-fbe37a571772 = intégration GNSS/INS / le jeu de données et le code de filtre de Kalman GNSS/INS de l'Université de Wuhan

# text
seg-deca3cbe41ac = GIS

# text
seg-36275ece527d = système d'information géographique

# text
seg-ebe8194d12b3 = GIVE

# text
seg-6a99c12984b5 = erreur verticale ionosphérique de grille

# text
seg-20a40777d78a = un terme de message SBAS

# text
seg-6fbfc5108833 = gLAB

# text
seg-1be22ebbedc3 = GNSS-Lab Tool

# text
seg-93b2c5b68af0 = une suite de traitement de données GNSS distribuée par l'ESA

# text
seg-2aa0f3147ad5 = GLIBC

# text
seg-096e00cb9d9b = la bibliothèque C de GNU

# text
seg-2630ae5f0bc5 = le Global Navigation Satellite System de la Russie (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

# text
seg-361f1f18d454 = GLS

# text
seg-397d58b727ee = moindres carrés généralisés

# text
seg-9bb2492e5d5d = GM

# text
seg-6bd8e46e9131 = paramètre gravitationnel

# text
seg-e3a296392ac0 = la constante gravitationnelle multipliée par la masse d'un corps

# text
seg-45a8f50bce06 = General Mission Analysis Tool

# text
seg-60d33e61b446 = NASA

# text
seg-1edd65c52f46 = Goddard Mars Model { "3" }

# text
seg-45abee95253b = un champ de gravité de Mars

# text
seg-558ea1e07042 = GMST

# text
seg-d3c4914f0d13 = temps sidéral moyen de Greenwich

# text
seg-d853b1084a52 = GNC

# text
seg-34a9ddce3d5f = guidage, navigation et contrôle

# text
seg-d33e343f6635 = GPOD

# text
seg-2ef6bb5a52fc = Grid Processing On Demand

# text
seg-14782f821cde = GR

# text
seg-762f364a05f3 = relativité générale

# text
seg-3e3f45ad1178 = GRGM / GRGM660PRIM

# text
seg-948167f5f1c3 = les modèles de gravité lunaire GRAIL du NASA Goddard (GRAIL : Gravity Recovery and Interior Laboratory)

# text
seg-220fae5cfc61 = Geodetic Reference System { "1980" }

# text
seg-bb3c2a337ae8 = GSD

# text
seg-691791646eb3 = distance d'échantillonnage au sol

# text
seg-448d7036fefe = GSE

# text
seg-d05b88e7d5c5 = équipement de soutien au sol

# text
seg-95d29f8138f9 = GSFC

# text
seg-2e1460089fed = Goddard Space Flight Center

# text
seg-7680e0663a5b = HDEV / OHDEV

# text
seg-1fd1e3322c86 = déviation de Hadamard / déviation de Hadamard à recouvrement

# text
seg-bb846135ceb4 = une mesure de stabilité insensible à la dérive

# text
seg-0edc4eed2775 = HIL

# text
seg-956a26e1ff6d = matériel dans la boucle

# text
seg-48523cdbbbf5 = HMI / MI

# text
seg-d77e079194df = information dangereusement trompeuse / information trompeuse

# text
seg-1cbf9d6f135d = régions du diagramme de Stanford

# text
seg-b320746fafa5 = HP

# text
seg-465a952272f3 = HTML

# text
seg-45a46390d3ba = HyperText Markup Language

# text
seg-25206f1161f0 = IAA RAS

# text
seg-1a4f063e3583 = Institut d'astronomie appliquée de l'Académie des sciences de Russie

# text
seg-9f434fdc21f2 = IAG

# text
seg-08fb84d2e01a = Association internationale de géodésie

# text
seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

# text
seg-01880debd7e0 = Association internationale de géomagnétisme et d'aéronomie / son groupe de travail V-MOD (modélisation du champ géomagnétique)

# text
seg-28805f15bae8 = maintient l'IGRF

# text
seg-d4ce72152bf2 = IC

# text
seg-fa95c4e7fdc2 = condition initiale

# text
seg-e4c4373d0c76 = ICAO

# text
seg-2fccffbaf4dc = Organisation de l'aviation civile internationale

# text
seg-c2d2d459177d = ICD

# text
seg-a018300615e2 = document de contrôle d'interface

# text
seg-433b45040abd = comme dans l'ICD SIS du Galileo OS

# text
seg-5e1e49c5000e = ICGEM

# text
seg-c17be0db9e83 = International Centre for Global Earth Models

# text
seg-e9650a618b38 = ID

# text
seg-e40875ab1090 = identifiant (ou identification, comme dans l'ID du type de bruit)

# text
seg-c643488ba1ea = IEEE

# text
seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

# text
seg-91966e2931d4 = IETF / RFC

# text
seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

# text
seg-ce9375732735 = IF

# text
seg-746eae5ce367 = fréquence intermédiaire

# text
seg-ed568f55aa8f = échantillons du récepteur

# text
seg-cb4aaa2581bb = la réalisation de l'ITRF2014 par l'IGS

# text
seg-bfa8e6d5d0d1 = IGRF / IGRF14

# text
seg-55fed0afea05 = International Geomagnetic Reference Field (champ géomagnétique de référence international)

# text
seg-669611e731d0 = IGRF-14 (fichier IGRF14.shc) est la 14ᵉ génération

# text
seg-f7cf8ff44256 = IGSO

# text
seg-4833bd1e9c03 = orbite géosynchrone inclinée

# text
seg-2080ff6f98fd = IIF

# text
seg-cf7a31e569cd = GPS Block II Follow-on

# text
seg-8a19be8033a9 = une génération de satellites GPS

# text
seg-68cc1c937ce9 = ILRS

# text
seg-53cc8d1f6824 = International Laser Ranging Service

# text
seg-fb5255ba4bc1 = ILS

# text
seg-b8af4d02e031 = moindres carrés entiers

# text
seg-a214c483b8a8 = résolution d'ambiguïté

# text
seg-4740fb9ef0b9 = IMCCE

# text
seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

# text
seg-22048a770612 = Observatoire de Paris ; publie INPOP

# text
seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, version 21a

# text
seg-577acd29f11b = une éphéméride planétaire

# text
seg-cdb9ea77f5a6 = IOAG

# text
seg-87f308314cd4 = Interagency Operations Advisory Group

# text
seg-690414990ad8 = ION / ITM

# text
seg-b2fbe0c3507a = Institute of Navigation / sa réunion technique internationale

# text
seg-53abad80634c = IoT

# text
seg-9b766d557bd1 = Internet des objets

# text
seg-1b41d114662e = IR

# text
seg-ff2d89b32d07 = risque d'intégrité

# text
seg-2dc9fcadccd6 = la probabilité d'une information dangereusement trompeuse

# text
seg-02aeac5e2435 = IRE

# text
seg-9c9c0011de8c = Institute of Radio Engineers

# text
seg-3fbae7e11fca = un prédécesseur de l'IEEE

# text
seg-9e3d84279d56 = le décalage d'horloge entre deux GNSS

# text
seg-2ffee4396fbd = ISL

# text
seg-505dee046f7a = liaison inter-satellites

# text
seg-010ea5a76e2e = ISM

# text
seg-330b25f923db = message de support d'intégrité

# text
seg-1f5a14efd417 = ARAIM

# text
seg-0ee7fcdaf5a9 = ISO

# text
seg-8c1341375f17 = Organisation internationale de normalisation

# text
seg-8291ac1ccba6 = ISO { "8601" } est son format de date et d'heure

# text
seg-5b4dee02dccc = ITRF93 / ITRF2020

# text
seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

# text
seg-14dc2a58e2c3 = Secteur des radiocommunications de l'Union internationale des télécommunications

# text
seg-0e8094e4d45c = ses Recommandations de la série P modélisent la propagation

# text
seg-3e325d97365e = IVS

# text
seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

# text
seg-2dd00d470e14 = JD / MJD

# text
seg-107e6683f70d = date julienne / date julienne modifiée

# text
seg-996d4952554f = JMLR

# text
seg-a1ef35b98931 = Journal of Machine Learning Research

# text
seg-d370f89393c7 = JOSA

# text
seg-12c154fcd073 = Journal of the Optical Society of America

# text
seg-58fb16c8a046 = JRC / JRC122785

# text
seg-82f85268028f = Centre commun de recherche de la Commission européenne / l'un de ses numéros de rapport

# text
seg-23f5be8ff49e = JS

# text
seg-516ee91e60c5 = JavaScript

# text
seg-02d421e784cd = JavaScript Object Notation

# text
seg-4da0210abab0 = JSTSP

# text
seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

# text
seg-919a951f3d02 = KF

# text
seg-436a208697f1 = filtre de Kalman

# text
seg-9c92e0bc42aa = KML

# text
seg-caf09d501881 = Keyhole Markup Language

# text
seg-ffe25881cef6 = une norme de l'OGC lue par Google Earth

# text
seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

# text
seg-e1552da90a21 = étiquettes de type d'enregistrement du format texte de message de navigation LEO propre à Kshana

# text
seg-3269a4e6b3e3 = une extension de Kshana, pas une norme

# text
seg-b7f0168b6037 = KPI

# text
seg-a5ff89f0923d = indicateur clé de performance

# text
seg-1c4a7ccef434 = KSC

# text
seg-73a4bf4da46f = Kennedy Space Center

# text
seg-e401e5d923f0 = KVN

# text
seg-09f93b4d4d0b = Keyword = Value Notation

# text
seg-7379ade4ee0e = la forme texte des messages CCSDS

# text
seg-a24cf86216d0 = LANS

# text
seg-2ee81a2bc69b = Lunar Augmented Navigation Service

# text
seg-849e3161b64b = LAPACK

# text
seg-3b4f3c08a5ba = Linear Algebra PACKage

# text
seg-69cd99d2f937 = LCG

# text
seg-bcddea3df96d = générateur congruentiel linéaire

# text
seg-8927ca404e64 = le générateur de la série de tests NIST SP { "1065" }

# text
seg-0b9b908055cf = LCNS

# text
seg-f9200a1b7246 = Lunar Communications and Navigation Services

# text
seg-5253cae4b05b = le service Moonlight de l'ESA

# text
seg-2361aef1e2e3 = LCRNS

# text
seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

# text
seg-8fc87d3026e5 = LFSR

# text
seg-bfecf2f88f17 = registre à décalage à rétroaction linéaire

# text
seg-5b09c8e3f127 = génération de code d'étalement

# text
seg-944b45f65820 = LGPL

# text
seg-1e1bf7d7dc79 = GNU Lesser General Public License

# text
seg-0d4d5316b1d8 = LIL

# text
seg-6d040101c6fa = loi du logarithme itéré

# text
seg-e48d4b1feeaf = LLI / SSI

# text
seg-81ace10136b6 = indicateur de perte de verrouillage / indicateur de puissance du signal

# text
seg-7d95179a5a1f = drapeaux d'observation RINEX

# text
seg-2ac0ebb389e7 = LLR

# text
seg-29bcbb78931b = télémétrie laser sur la Lune

# text
seg-20deda97c876 = LLVM

# text
seg-5a84a3219546 = l'infrastructure de compilation LLVM (à l'origine Low Level Virtual Machine)

# text
seg-277ed5c4cbcc = LNAV

# text
seg-d2fa9c420999 = message de navigation hérité

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-6379745571a9 = LNCSS

# text
seg-b8c48f2bfaf0 = système de satellites lunaires de navigation et de communication

# text
seg-4ce3c0ea7a31 = les études de cas de constellations dans NAVIGATION { "70" }({ "4" }), navi.613

# text
seg-b13c5776e35b = LNIS

# text
seg-7c67c5753d20 = LunaNet Interoperability Specification

# text
seg-881578d31056 = LNSS

# text
seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

# text
seg-97ff1706b4bd = une constellation lunaire proposée

# text
seg-ec733de1adc5 = LPV / LPV-200

# text
seg-40d72ae4bc9a = performance du radioalignement de piste avec guidage vertical / sa catégorie de hauteur de décision de { "200" } ft

# text
seg-090ba62634a8 = approche aéronautique

# text
seg-b4921e83ddc9 = LRO

# text
seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

# text
seg-8f782bde5659 = LS

# text
seg-c5bc49526464 = secondes intercalaires

# text
seg-54ea05b82cb4 = comme dans Δt_LS

# text
seg-15111a93c6d7 = LT

# text
seg-35231d8b9b39 = temps de lumière

# text
seg-4729314afd46 = LTE

# text
seg-1a7e158f020f = Long-Term Evolution

# text
seg-3c1b3acc46d9 = la norme cellulaire 4G

# text
seg-3530cdaca137 = LU

# text
seg-58ad64b9d450 = (décomposition) inférieure–supérieure

# text
seg-ef1a45eba6aa = LuGRE

# text
seg-72ec36312101 = Lunar GNSS Receiver Experiment

# text
seg-84874825a5d1 = a volé vers la Lune en { "2025" }

# text
seg-e6719690faa2 = LuPNT

# text
seg-be19fb902b36 = la bibliothèque PNT lunaire de Stanford

# text
seg-893ba320da76 = un nom

# text
seg-fc68b2fb9529 = MAAST

# text
seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

# text
seg-a24b3840d248 = Stanford

# text
seg-71063143c8be = MAIT

# text
seg-2d7aa60c26ba = fabrication, assemblage, intégration et essais

# text
seg-0397322eae11 = MAR099 / JUP365 / SAT441

# text
seg-bd57191f860b = solutions d'éphémérides de satellites du JPL pour les lunes de Mars, de Jupiter et de Saturne

# text
seg-9b0688bfc31e = identifiants

# text
seg-a8748c38de15 = MASPS

# text
seg-e25a3738b952 = normes de performance minimale de système aéronautique

# text
seg-16a3c8f74c1c = MATLAB

# text
seg-bebc110fded7 = MATrix LABoratory

# text
seg-e722ea781fdf = un produit de calcul numérique

# text
seg-7c03fb6e56f6 = MAUT

# text
seg-e409f72ac9ab = théorie de l'utilité multi-attributs

# text
seg-4a29ddd9b24e = MC

# text
seg-19a7ad528cf3 = MCD

# text
seg-202b82bfefcf = Mars Climate Database

# text
seg-371da1e857e8 = MCDA

# text
seg-17d89019fd4a = analyse de décision multicritère

# text
seg-b522fc3d6c82 = MCI / MCMF

# text
seg-f5544acf642a = inertiel centré sur la Lune / centré sur la Lune et fixe par rapport à elle

# text
seg-f7b59f61da60 = MDB

# text
seg-0c674a59d087 = biais minimal détectable

# text
seg-c769430226c3 = MDEV

# text
seg-33a4628c6e67 = déviation d'Allan modifiée

# text
seg-bde3f0e5dfa7 = MEMS

# text
seg-8b08f307de8a = systèmes micro-électromécaniques

# text
seg-c960c0e048b7 = MeO / MLRO

# text
seg-48623f76be86 = MéO (Métrologie Optique), la station laser de Grasse / Matera Laser Ranging Observatory

# text
seg-a8fcbefbbf4c = stations de télémétrie laser sur la Lune

# text
seg-8b597c678c3f = ME / PA

# text
seg-cb56efe2fb70 = Terre moyenne / axes principaux

# text
seg-f30f1a2778cf = les deux référentiels lunaires liés au corps (MOON_ME, MOON_PA)

# text
seg-308d4c93a8a3 = MGEX

# text
seg-b2b632cd52d2 = Multi-GNSS Experiment

# text
seg-86fd2d84ed21 = IGS

# text
seg-79f8412f30f2 = MIT

# text
seg-70012b81c998 = Massachusetts Institute of Technology

# text
seg-e9d7062835a9 = comme dans la licence MIT

# text
seg-a0b70e8c4c38 = MLP

# text
seg-77abd5634603 = perceptron multicouche

# text
seg-6975432180f6 = un petit réseau de neurones

# text
seg-a4be7b1d83e3 = MOD / TOD

# text
seg-421b9611e897 = moyen de la date / vrai de la date

# text
seg-1af66f9b771d = référentiels équateur-équinoxe

# text
seg-b5db821f8008 = MOORA

# text
seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis (optimisation multi-objectif fondée sur l'analyse de rapports)

# text
seg-d26a24b5d9f0 = MOPS

# text
seg-e8707522cf5f = normes de performance opérationnelle minimale

# text
seg-cd0720a78dbb = MPL

# text
seg-bcdaf8567381 = Mozilla Public License

# text
seg-0f45b55420be = MRO110 / MRO110B2

# text
seg-61415a003e40 = modèles de gravité de Mars Reconnaissance Orbiter { "110" } et 110B2

# text
seg-8404f70361e7 = MSRV

# text
seg-26a6a79755f9 = version minimale de Rust prise en charge

# text
seg-959fe8ad53df = MTF

# text
seg-70d61ab4eb42 = fonction de transfert de modulation

# text
seg-7f60d1ac40ad = imagerie optique

# text
seg-8598e499c145 = MVDR

# text
seg-c767dc9ae21a = réponse sans distorsion à variance minimale

# text
seg-83f57219e5b7 = formation de faisceau adaptative

# text
seg-e1ee50b3ea0a = MWL

# text
seg-12d9510328d2 = liaison micro-ondes

# text
seg-639266912f59 = la liaison de transfert de temps d'ACES

# text
seg-5ac07401e4f8 = NaN

# text
seg-722d679807ee = pas un nombre

# text
seg-0e4abc653325 = NavIC

# text
seg-355821380384 = Navigation with Indian Constellation

# text
seg-fc13b86a8365 = NAVISP

# text
seg-2eb6cc573946 = Navigation Innovation and Support Programme

# text
seg-b518d44847fa = NAV / OBS

# text
seg-c6965d4d7202 = navigation (message) / observation

# text
seg-1729ddf0eafa = les deux types de fichier RINEX ; le Stanford NAV Lab est le Navigation and Autonomous Vehicles Laboratory

# text
seg-f239334e4928 = NBS / NBS14

# text
seg-c8e5edff04d7 = l'ancien National Bureau of Standards américain / le jeu de données de référence de stabilité de fréquence NBS14

# text
seg-3d1ac5146fea = utilisé pour vérifier les estimateurs d'Allan

# text
seg-37879f5ad9e0 = NEES / NIS

# text
seg-9610f0449fb2 = erreur d'estimation normalisée au carré / innovation normalisée au carré

# text
seg-af167a77a1dc = tests de cohérence de filtre

# text
seg-beb7a86721ec = National Geospatial-Intelligence Agency

# text
seg-7aa223cbfe13 = NGS / NOAA

# text
seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

# text
seg-4a1040c5f2fa = NIMA / TR8350

# text
seg-4cf62b739fc6 = National Imagery and Mapping Agency / son rapport technique TR8350.2 (la définition du WGS { "84" })

# text
seg-ffa6025b5a70 = NIMA est l'ancien nom de la NGA

# text
seg-af4be907e56c = NLOS

# text
seg-22ab7d58324b = un signal uniquement réfléchi

# text
seg-9887902c13a1 = NNLS

# text
seg-b4cb6d6bfce4 = moindres carrés non négatifs

# text
seg-af8ca8550600 = NORAD

# text
seg-07428e7224cf = North American Aerospace Defense Command

# text
seg-4edb033e3432 = tient le catalogue public de satellites

# text
seg-dd984e16dbcd = NP

# text
seg-f92816d7c936 = Neyman–Pearson

# text
seg-fc214695fa83 = théorie de la détection

# text
seg-3ef8006482bb = NPA

# text
seg-81a072ee0520 = approche de non-précision

# text
seg-b9fd2cf6a2b9 = aéronautique

# text
seg-e6cb557ee6d1 = NPB

# text
seg-18510a95b308 = nutation–précession–biais

# text
seg-b4562efbafdf = la matrice IAU 2006/2000A

# text
seg-c5d8932f6956 = NRL / NRLMSISE-00

# text
seg-9c9f5eac83b2 = Naval Research Laboratory / son modèle d'atmosphère étendu à spectromètre de masse et radar à diffusion incohérente, { "2000" }

# text
seg-bf373b9cd0c6 = NTN

# text
seg-0ae939342934 = réseau non terrestre

# text
seg-1ae0305d8455 = la 5G depuis des satellites

# text
seg-20b98c32226f = NTRS

# text
seg-1470d2af037a = NASA Technical Reports Server

# text
seg-243d375db224 = OC-0 … OC-13

# text
seg-d36b43dd505c = identifiants d'affirmations excessives (overclaim)

# text
seg-47ba87f3730b = lignes de CLAIMS-VS-REALITY.md

# text
seg-e0689f1fc932 = OCI

# text
seg-1a3377171d89 = Open Container Initiative

# text
seg-b5bf07ed6c8c = format d'image de conteneur

# text
seg-7b56c21cca93 = ODE / SDE

# text
seg-722bdf2ca73a = équation différentielle ordinaire / stochastique

# text
seg-a4da10cb1150 = ODM

# text
seg-b1c25bfe0612 = messages de données d'orbite

# text
seg-35fe6a2f3de3 = la famille CCSDS qui inclut OEM et OMM

# text
seg-c06d6aa8ba3a = OGC

# text
seg-eb1feb23de1c = Open Geospatial Consortium

# text
seg-9737495b035c = OLS / WLS

# text
seg-63bf35c31a6a = moindres carrés ordinaires / pondérés

# text
seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

# text
seg-4be3f4155fc8 = le satellite-laboratoire logiciel en orbite de l'ESA / son jeu de données de détection d'anomalies

# text
seg-14b642ea59e1 = OSIP

# text
seg-4871060090a0 = Open Space Innovation Platform

# text
seg-251b3ff3eb9b = OSNMA / TESLA

# text
seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

# text
seg-95b6b14facf1 = authentification des signaux Galileo

# text
seg-501a89e8b32b = OS / OSes

# text
seg-5a526cda4166 = Open Service (Galileo, BeiDou), ou système(s) d'exploitation

# text
seg-6db10af375e3 = le contexte dit lequel

# text
seg-584a7e7d4f5e = OU

# text
seg-937187abcdf6 = Ornstein–Uhlenbeck

# text
seg-9be9042ec983 = un processus de bruit à retour à la moyenne

# text
seg-08c583f40405 = PA

# text
seg-9a24d9f45aa4 = assurance produit (aussi approche de précision, comme dans K_H,PA)

# text
seg-65ad442b3faa = PCK

# text
seg-c788fe80678e = noyau de constantes planétaires

# text
seg-46a00fdc9d5b = SPICE

# text
seg-417a52c9c154 = PDF

# text
seg-c462c83b47df = Portable Document Format

# text
seg-98aa544ec4de = Pd / Pfa

# text
seg-0c89f304435e = probabilité de détection / probabilité de fausse alarme

# text
seg-5bde4fd55ead = PEF

# text
seg-eb11dcb816ff = le référentiel entre TEME et ITRF

# text
seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

# text
seg-47cc346307a6 = identifiants de satellites : une étiquette de satellite GPS SP3, un numéro de bruit pseudo-aléatoire SBAS, un nom de satellite Galileo

# text
seg-6ad2383f8545 = PHARAO

# text
seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

# text
seg-302c8cb738ac = l'horloge au césium d'ACES

# text
seg-2e823cd9d9a6 = PL

# text
seg-099bd07ef3cf = niveau de protection

# text
seg-7d7eaa5eb223 = PLL

# text
seg-9272ad22c094 = boucle à verrouillage de phase

# text
seg-80e051b734dd = PMC / PMC10301026

# text
seg-1f2a21c5e09f = PubMed Central / l'un de ses identifiants d'article

# text
seg-3e4617444a63 = PM / FM

# text
seg-c79b1246fb61 = modulation de phase / modulation de fréquence

# text
seg-279251adb2eb = bruit sur la phase d'une horloge ou sur sa fréquence

# text
seg-685fc49957e2 = PN

# text
seg-209dacf76ff3 = comme dans la mesure de distance PN

# text
seg-f9cfe4e70f9a = PNG

# text
seg-bde68df8ee7e = Portable Network Graphics

# text
seg-06998de7b6be = POD

# text
seg-178f55858efb = détermination d'orbite précise

# text
seg-b7919977bf20 = PPN

# text
seg-ed81960f1282 = post-newtonien paramétré

# text
seg-9683f98bec2d = PPP / RTK / SPP

# text
seg-73d777100ecd = positionnement ponctuel précis / cinématique en temps réel / positionnement par point unique

# text
seg-edb97cd7ef8b = PPS

# text
seg-197b06571b4d = impulsion par seconde

# text
seg-2619e854281a = PR

# text
seg-66c53cdfc3d9 = pull request

# text
seg-e4dd8a3101cb = PRN

# text
seg-6fb1378e889a = bruit pseudo-aléatoire (numéro de code)

# text
seg-6f384580af80 = la façon dont les satellites GNSS sont nommés dans les signaux

# text
seg-e8ca48eb958b = PROMETHEE

# text
seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

# text
seg-d92234e26d53 = PRX

# text
seg-c5774fede0a9 = Physical Review X

# text
seg-8687e6badb6b = une revue

# text
seg-78a947083d45 = PSD

# text
seg-6eb799bd1582 = densité spectrale de puissance

# text
seg-ab1af8b3d968 = voir ci-dessus

# text
seg-f7c4f1cff2a4 = PS / SPS

# text
seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

# text
seg-2800b3a8cd2e = le PS du SPS du GPS

# text
seg-c8aa5ca0a4ea = PTB

# text
seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

# text
seg-611e7e4a34f4 = l'institut national de métrologie de l'Allemagne

# text
seg-2d4bc9f59158 = PTP

# text
seg-6291d09d3a93 = Precision Time Protocol

# text
seg-44a14eeae3dd = IEEE { "1588" }

# text
seg-bc4ad791804e = PVT

# text
seg-1939c4e19702 = position, vitesse et temps

# text
seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

# text
seg-95cead42b0d0 = la bibliothèque de liaison Rust–Python / Python Packaging Authority / Python Package Index

# text
seg-96b2c707a6b8 = Parametry Zemli { "1990" }

# text
seg-3d5012a62544 = le datum géodésique de GLONASS

# text
seg-9d14fb150c09 = QA

# text
seg-582cb8ea13ac = assurance qualité

# text
seg-7025be647972 = QEMU

# text
seg-d2209c7eea42 = Quick Emulator

# text
seg-d23b9bd48594 = QPSK

# text
seg-45db179e8e49 = modulation par déplacement de phase en quadrature

# text
seg-b6d487bd53ed = QZSS

# text
seg-c0484340bc52 = Quasi-Zenith Satellite System

# text
seg-531943b17837 = Japon

# text
seg-697c55525b36 = RAAN

# text
seg-85cd6997e07e = ascension droite du nœud ascendant

# text
seg-79e641db1aae = RAFS

# text
seg-9fa6a6b0e193 = RDRR

# text
seg-19b00c5b9270 = Resist–Detect–Respond–Recover (résister–détecter–répondre–rétablir)

# text
seg-76da7c5bf39a = le modèle de résilience RethinkPNT/Firesmith

# text
seg-7bb5ed20c788 = RF

# text
seg-35b036272c8e = radiofréquence

# text
seg-404104795160 = RHEL

# text
seg-dd1bb2300eb5 = Red Hat Enterprise Linux

# text
seg-34b1e77b1ff0 = RHS

# text
seg-0b4bdbcd1476 = membre de droite

# text
seg-f801cff658be = RMS / RSS

# text
seg-6b758beecbfc = racine de la moyenne quadratique / racine de la somme des carrés

# text
seg-8b2bd83256f1 = RNG

# text
seg-b90957003307 = générateur de nombres aléatoires

# text
seg-354b42e3a5d0 = RNTF

# text
seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

# text
seg-43d17f884c69 = ROI

# text
seg-597432415e53 = retour sur investissement

# text
seg-7abb945359d0 = RPCF

# text
seg-8c71df162ddd = Resilient PNT Conformance Framework

# text
seg-2f030c1d70c1 = DHS des États-Unis

# text
seg-82b81c1e28d6 = RTCM

# text
seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

# text
seg-4a7703f1b605 = sa norme de messages porte le CRC-24Q

# text
seg-520c91fa0ef0 = une bibliothèque libre de positionnement GNSS (bibliothèque cinématique en temps réel)

# text
seg-a8b2e577e381 = RTN

# text
seg-6ddf35119d08 = radial, transversal, normal

# text
seg-b1b635ff08e4 = un référentiel lié à l'orbite

# text
seg-04f4b26e9283 = RW

# text
seg-b8b1a31739aa = marche aléatoire

# text
seg-8b593d7d5dbd = comme dans la marche aléatoire de biais

# text
seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

# text
seg-928fe3abcd5b = modulation de fréquence à marche aléatoire, blanche et de scintillement / modulation de phase blanche et de scintillement

# text
seg-7fced178bcc5 = les types de bruit d'horloge en loi de puissance

# text
seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

# text
seg-0c397d845610 = noms de produits Microchip (deux horloges atomiques à l'échelle d'une puce, un oscillateur à quartz thermostaté)

# text
seg-8a1ae00c4a52 = des noms, pas des abréviations

# text
seg-a58426a850fd = SD

# text
seg-d46cb77d53f6 = écart type

# text
seg-e29dd726165f = SDD

# text
seg-0ebb68e4b6fd = Service Definition Document

# text
seg-9415da7a79ab = comme dans le SDD du Galileo OS

# text
seg-1022626b788c = SDK

# text
seg-2076da4dd4dd = kit de développement logiciel

# text
seg-9fb492bced01 = SDR

# text
seg-1a1082059103 = radio logicielle

# text
seg-0a647acd4355 = SDS

# text
seg-d0f6ae60b687 = Space Defense Squadron

# text
seg-c3f6fc1456ed = le 18ᵉ SDS tient le catalogue de satellites américain

# text
seg-cf28e3e14401 = SEP

# text
seg-a67fb04e0911 = angle Soleil–Terre–sonde (aussi erreur sphérique probable)

# text
seg-0c7631f367e8 = SGD

# text
seg-d58ce1e25c08 = descente de gradient stochastique

# text
seg-2f25205204e4 = SHM

# text
seg-f2e2253a31b3 = mouvement harmonique simple

# text
seg-b0973ab206ed = SI

# text
seg-35624e5e4630 = Système international d'unités

# text
seg-02aa435dc884 = SIB

# text
seg-262a811c8b69 = Safety Information Bulletin (bulletin d'information de sécurité)

# text
seg-b9ee445609f5 = EASA ; l'EASA est l'Agence de l'Union européenne pour la sécurité aérienne

# text
seg-8d6d4fe3d155 = SINEX

# text
seg-e5c071685532 = Solution INdependent EXchange format

# text
seg-3466519e4c62 = solutions géodésiques

# text
seg-b21a3d7fb59d = SIR

# text
seg-303809c700e2 = rééchantillonnage par importance

# text
seg-7a2e0e9cac08 = un filtre particulaire

# text
seg-6da637028ef8 = SIS / SISA

# text
seg-9779a20e50d2 = signal dans l'espace / exactitude du signal dans l'espace

# text
seg-c0e9f44b333d = SITAN

# text
seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

# text
seg-ceee87dd4b5e = SLR

# text
seg-c8e722f1609c = télémétrie laser sur satellites

# text
seg-76d80b0d2deb = SMAD

# text
seg-7fbda47e3858 = Space Mission Analysis and Design

# text
seg-dfc105c0178b = le manuel de référence

# text
seg-5278559437c5 = SNR

# text
seg-b97c29ce3b37 = rapport signal sur bruit

# text
seg-ff2faf259a15 = SOS / SSE

# text
seg-5a2e327af384 = somme des carrés / somme des carrés des résidus

# text
seg-453c4506fd59 = SOTA

# text
seg-7eaa0caa6916 = état de l'art

# text
seg-127e73a3610b = NIST Special Publication { "1065" }

# text
seg-bedc9a3d8d9f = le même document que NIST SP { "1065" }

# text
seg-cf2491c1a488 = SPD / PD

# text
seg-eade81634bf5 = symétrique définie positive / définie positive

# text
seg-5fedf0f7b5c0 = SPDX

# text
seg-3aba3c5a5c19 = Software Package Data Exchange

# text
seg-c10b1f20f37e = les identifiants de licence dans les en-têtes de fichier

# text
seg-b377a91a047f = SPK

# text
seg-5603642c612d = noyau SPICE pour les éphémérides d'engins spatiaux et de planètes

# text
seg-cf18ba9c86d8 = SPOF

# text
seg-cfab8d8a2cdf = point unique de défaillance

# text
seg-c06f64211c40 = SQM

# text
seg-7e58d6a4a92c = surveillance de la qualité du signal

# text
seg-a4e75468e6f9 = contrôles de leurrage par forme de corrélateur

# text
seg-0bb7a4875914 = SRIF

# text
seg-82da1a1f1be4 = filtre d'information en racine carrée

# text
seg-970edb8ec42f = SRP

# text
seg-ae097fbdabf9 = pression de rayonnement solaire

# text
seg-edc814ba451b = SRTM / SRTMHGT

# text
seg-b756bc93d2ea = Shuttle Radar Topography Mission / son format de fichier de hauteurs

# text
seg-4692354a98de = les tuiles sont nommées d'après leur coin sud-ouest, par exemple N36W117

# text
seg-00f36f1678d6 = SSD

# text
seg-532285d8e6ce = Solar System Dynamics

# text
seg-1d8167212f57 = le groupe du JPL

# text
seg-d21315ea8c52 = STEC

# text
seg-84689b829867 = contenu électronique total oblique

# text
seg-eabee4bfb30e = Systems Tool Kit

# text
seg-a7ff60ab0bd9 = un produit d'analyse de mission

# text
seg-17d792c12885 = le service de positionnement et de synchronisation temporelle d'Iridium

# text
seg-3efaadad9c96 = STM

# text
seg-da395fa674ec = matrice de transition d'état

# text
seg-d116578b987b = SV

# text
seg-caa37a1e7d12 = véhicule spatial (un satellite)

# text
seg-845e6f3a37ec = SVD

# text
seg-e775c436db4b = décomposition en valeurs singulières

# text
seg-3e5561868a7f = Scalable Vector Graphics

# text
seg-4c48f567e37c = TAES

# text
seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

# text
seg-39b93d9b401a = TC / TM

# text
seg-b0df03cff98a = télécommande / télémesure

# text
seg-fafb84a9796a = TDD

# text
seg-ec3b92ad43c3 = développement piloté par les tests

# text
seg-40defa915d0d = TDOA / FDOA

# text
seg-e7db8768b023 = différence de temps / de fréquence d'arrivée

# text
seg-aecac9c9d2d0 = localisation passive d'émetteurs

# text
seg-01861b3d63bf = TERCOM

# text
seg-9ef3f9cbbe77 = mise en correspondance de contours de terrain

# text
seg-5da9ae904ae0 = TEXBAT

# text
seg-e90183a6fc69 = Texas Spoofing Test Battery

# text
seg-941eccec7400 = données enregistrées de leurrage du GNSS (OAKBAT est un jeu de données de même classe)

# text
seg-e71c15afe44e = TIE

# text
seg-19bfea0d5c88 = erreur d'intervalle de temps

# text
seg-eb12660210bd = TIES

# text
seg-9335f08b6381 = Telecommunication Information Exchange Service

# text
seg-12f4af2b48c1 = comptes de membres de l'UIT

# text
seg-c05ba396ac1e = ToA

# text
seg-78a41e672189 = temps d'arrivée

# text
seg-7d821e75fdf7 = TOL

# text
seg-4c7600f40479 = tolérance

# text
seg-1f8b3be77dcc = TOPSIS

# text
seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

# text
seg-c9a6058c9715 = TOTDEV / TOTVAR

# text
seg-53a19d838c2d = déviation totale / variance totale

# text
seg-7350da5c5c30 = estimateurs de stabilité à portée étendue

# text
seg-91d2f49dc7c0 = TPAMI

# text
seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

# text
seg-85692b01a12d = TPL

# text
seg-123ed92776a3 = niveau de protection de synchronisation temporelle

# text
seg-10c9563602b7 = voir SLOT-TIMING.md

# text
seg-d1e3f93bc0aa = TPS

# text
seg-579b1467ca5f = système de protection thermique

# text
seg-3b7fe44cc552 = TRN

# text
seg-5239a432b919 = navigation par référence au terrain

# text
seg-1df3bcf7eb97 = TR / TN

# text
seg-ef0ff09dc412 = rapport technique / note technique

# text
seg-643fa447bcee = TU Delft

# text
seg-5c5492ecd86f = Université de technologie de Delft

# text
seg-f3f22590bc57 = TWSTFT / TWTFT

# text
seg-28c80c27a136 = transfert bidirectionnel de temps et de fréquence par satellite / transfert bidirectionnel de temps et de fréquence

# text
seg-e1a149ff6c43 = UBX

# text
seg-fa0e9838530e = le protocole binaire de récepteur u-blox

# text
seg-9555546fed38 = UDRE

# text
seg-5fd7aec5beda = erreur de distance différentielle utilisateur

# text
seg-a3f5dda611b0 = SBAS

# text
seg-b6f0baa6e478 = UERE

# text
seg-4d1cb1c3ade9 = erreur de distance équivalente utilisateur

# text
seg-7d87e82154ed = UFFC

# text
seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

# text
seg-f4da31f92a79 = une revue IEEE Transactions

# text
seg-573db7b5995b = { "300" } MHz à { "3" } GHz

# text
seg-3688c8d84cdc = UI / UX

# text
seg-42162760360f = interface utilisateur / expérience utilisateur

# text
seg-7a56f7e38c5a = ULA

# text
seg-4f4d9da7855c = réseau linéaire uniforme

# text
seg-db65f4a7586d = ULP

# text
seg-ae7458813685 = unité de la dernière place

# text
seg-d7f4df5a9d13 = précision en virgule flottante

# text
seg-81dc0f4f1b2c = URA / URE

# text
seg-c92cbc3e3954 = exactitude de distance utilisateur / erreur de distance utilisateur

# text
seg-17e8fb142c6c = l'URA borne l'intégrité, l'URE est l'exactitude RMS

# text
seg-1e02dfc0a52b = URL

# text
seg-f726bcd9d4ad = localisateur uniforme de ressource

# text
seg-088e05d67af1 = USGS

# text
seg-ffed8eca324d = United States Geological Survey

# text
seg-1ded2eb40061 = USNO

# text
seg-2b5f7bbe22e9 = United States Naval Observatory

# text
seg-39ed84639c60 = USO

# text
seg-f9f684640e53 = oscillateur ultra-stable

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-ba97a4005ee8 = VIKOR

# text
seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (optimisation multicritère et solution de compromis)

# text
seg-7fe170288e4e = interférométrie à très longue base

# text
seg-2e95d53160df = WAAS / EGNOS

# text
seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

# text
seg-1746693259e0 = SBAS ; voir ci-dessus

# text
seg-98f4f946a7ac = WASM

# text
seg-257c477dc510 = WebAssembly

# text
seg-eaf260aa0e21 = WASPAS

# text
seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

# text
seg-c9710476b8b5 = Groupe de travail C de la coopération Union européenne–États-Unis sur la navigation par satellite

# text
seg-79f0e87410bf = publie les documents de référence de l'ARAIM

# text
seg-199e55106e0f = WGCCRE

# text
seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

# text
seg-d1939d914701 = WGN

# text
seg-6bbc3adc6a53 = bruit gaussien blanc

# text
seg-1e422c9001d4 = WGS72 / WGS84

# text
seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

# text
seg-5964aa61f847 = SGP4 utilise les constantes WGS72

# text
seg-f4ea25131d04 = WHU

# text
seg-7d30c759d92f = Université de Wuhan

# text
seg-5d028f5e2120 = WSM / WPM

# text
seg-ce407535733f = modèle de somme pondérée / modèle de produit pondéré

# text
seg-cc68c85bb2b9 = agrégation multicritère (WPM signifie aussi modulation de phase blanche ; le contexte dit laquelle)

# text
seg-9041c866d202 = XML

# text
seg-0e55c3adc568 = Extensible Markup Language

# text
seg-93e0e8702167 = XOR

# text
seg-cfa3197f8c1d = ou exclusif

# text
seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

# text
seg-195082605699 = les composantes du champ géomagnétique : nord, est, bas, intensité totale ; déclinaison, inclinaison

# text
seg-94835748fcbb = YAGNI

# text
seg-76430d755d74 = you aren't gonna need it (vous n'en aurez pas besoin)

# text
seg-e4e177088376 = un principe de conception

# text
seg-565c1908393c = ZHD

# text
seg-77a0948bc15d = retard hydrostatique zénithal

# text
seg-749be52554c5 = Reproductibilité et licences

# text
# c1: scenario + seed + version → identical result
seg-d78d9bbb905c = <b>Reproductible (déterministe).</b> La même entrée donne toujours une sortie identique bit à bit — <c1/>. Aucun aléa caché.

# text
seg-1412347e2298 = <b>Graine.</b> Le nombre qui initialise le générateur aléatoire (déterministe), afin que les exécutions soient répétables.

# text
seg-3a35740e04a8 = <b>Open core.</b> Le modèle économique : le moteur est libre et open source (AGPL-3.0, la GNU Affero General Public License définie ci-dessous ; double licence commerciale) ; l'activité qui le soutient est l'assistance, l'intégration, les licences commerciales et les extensions propriétaires — pas des frais par poste sur le moteur ouvert.

# text
seg-8ea21ebded3c = <b>AGPL-3.0.</b> La GNU Affero General Public License v3 — une licence open source à copyleft fort, approuvée par l'OSI (Open Source Initiative). Comme la GPL (GNU General Public License), mais avec une clause supplémentaire (§{ "13" }) couvrant les logiciels proposés à des utilisateurs <b>via un réseau</b> : une version modifiée accessible via un réseau doit offrir à ces utilisateurs son code source correspondant. La licence ouverte de Kshana.

# text
# c1: LICENSING.md
seg-f87860d8197d = <b>Double licence.</b> Proposer le même code sous deux licences pour que les utilisateurs choisissent : ici, l'AGPL-3.0 (ouverte, copyleft) <b>ou</b> une licence commerciale d'Ashforde OÜ (une société estonienne à responsabilité limitée ; OÜ = osaühing) pour un usage propriétaire/fermé auquel l'AGPL ne convient pas. Voir <c1/>.

# text
seg-dd5f4a1bbbf5 = Également utilisé sur kshana.dev

# text
seg-9d0c42560a90 = Abréviations que le site web utilise et qui ne figurent pas dans le glossaire du dépôt ci-dessus.

# text
seg-67a54ce8c89e = Global Positioning System

# text
seg-814b0d29bbb2 = densité porteuse sur bruit, en dB-Hz

# text
seg-f22a269bc575 = la bande radio de { "1" } à { "2" } GHz qu'utilise le GNSS

# text
seg-1f4360a0405c = code grossier/d'acquisition du GPS L1

# text
seg-6f7910207534 = signal aller augmenté (lunaire)

# text
seg-74f02864ce32 = systèmes micro-électromécaniques

# text
seg-0f931242ecc0 = UAS

# text
seg-dddfd223a3b1 = système d'aéronef sans équipage

# text
seg-7091aabf8b6d = PL · AL

# text
seg-12d88ab45197 = niveau de protection · limite d'alerte

# text
seg-78134bcc48da = approche avec guidage vertical, niveau I

# text
seg-27328b36b476 = LEO · GEO

# text
seg-b1ae7014a663 = orbite terrestre basse · orbite géostationnaire

# text
seg-c1d933dd3965 = OEM · OMM · TDM

# text
seg-5d0ebe2bc51c = messages CCSDS d'éphéméride d'orbite, d'éléments moyens d'orbite et de données de poursuite

# text
seg-fa9240660ec4 = IGRF

# text
seg-c19fd59fdca0 = DSN

# text
seg-7979317c75d2 = Deep Space Network

# text
seg-c194401c2039 = TCXO · OCXO

# text
seg-5c9d0b4c561d = oscillateur à quartz compensé en température · thermostaté

# text
seg-f3a7cc221b63 = PHM

# text
seg-08d5cfc5b460 = maser à hydrogène passif

# text
seg-5ed928b1c6d0 = USO · DSAC

# text
seg-b77f2ea4a521 = oscillateur ultra-stable · horloge atomique en espace lointain

# text
seg-553814463110 = MTIE · TDEV

# text
seg-2d9b8af50414 = erreur maximale d'intervalle de temps · déviation de temps

# text
seg-5b155b60152f = PRTC · ePRTC

# text
seg-93d590e6408d = horloge de temps de référence primaire · PRTC améliorée

# text
seg-8541a73eef89 = ADEV · σy(τ)

# text
seg-a2ae4a40f486 = déviation d'Allan au temps de moyennage τ

# text
seg-96fae3b4fb8e = Secteur de la normalisation des télécommunications de l'Union internationale des télécommunications

# text
seg-24cab92c0fd3 = NIS · NEES

# text
seg-7e82e2927d59 = innovation normalisée au carré · erreur d'estimation normalisée au carré

# text
seg-7175ab55e707 = JSON · CSV · SVG

# text
seg-a9a2906d15de = JavaScript Object Notation · valeurs séparées par des virgules · Scalable Vector Graphics

# text
seg-d3a9009a35c0 = CLI · API · IDE

# text
seg-c6418e1f785d = interface en ligne de commande · interface de programmation d'application · environnement de développement intégré

# text
seg-8df86177107a = SBOM · SLSA

# text
seg-e54326c78ab0 = nomenclature logicielle · Supply-chain Levels for Software Artifacts

# text
seg-347b23148b8f = NDA

# text
seg-969d2489de28 = accord de non-divulgation

# text
seg-564cfa0d3084 = Digital Object Identifier

# text
seg-5cbd99859d90 = Cascade C/N₀ (waterfall)

# text
seg-ed4a9e041a83 = un graphique de la densité porteuse sur bruit par satellite au cours du temps

# text
seg-1cb49c7e6c7f = HPL · VPL

# text
seg-ccdc7d672c8f = niveau de protection horizontal · vertical

# text
seg-c7a40ebac7e1 = LROC

# text
seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

# text
seg-c5da9d350518 = <s1>Précédent</s1>Introduction aux concepts

# text
seg-670504be0531 = <s1>Suivant</s1>Guide du Studio
