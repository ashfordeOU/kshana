# docs--agency-orbit-validation: translations (fr)

# text
seg-31d58f23c0a2 = Exécuter

# text
# c1: docs/AGENCY-ORBIT-VALIDATION.md
seg-fbe4b3eb7310 = Source : <c1/>

# text
seg-87910a33b87b = Validation du modèle de forces par ajustement d'éphéméride — méthodologie et résidus validés

# text
# c1: src/precise_od.rs
seg-09a1b1b673fb = Le moteur à forces complètes de Kshana (<c1/>) ajusté à de <b>vrais produits d'orbite précise d'agences</b>, avec des résidus honnêtes, citables et estampillés du hachage de commit. C'est le dossier de validation du jalon P4 de la feuille de route (« Astrodynamique précise : gravité de haut degré, SRP (pression de radiation solaire), validation par rapport aux jeux de données d'agences »).

# text
seg-90f366667f78 = Ce que signifie ici un résidu validé

# text
# c1: docs/design/2026-06-09-precise-astrodynamics-design.md
seg-3861b68a03e2 = Un résidu n'est rapporté que lorsque toutes les conditions suivantes sont réunies (conception <c1/>) :

# text
# c1: src/tides.rs
# c2: C_R
# c3: src/forces.rs
seg-954f4f934461 = Le <b>modèle de forces</b> inclut chaque perturbation qui compte à la précision visée : géopotentiel de haut degré EGM2008 (Earth Gravitational Model { "2008" }) (tronqué à un degré/ordre déclaré, d/o), <b>marées</b> solides + océaniques + atmosphériques (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } chap. { "6" }), troisième corps Soleil/Lune, SRP à boulet de canon avec ombre conique + <c2/> estimé, traînée (LEO (orbite terrestre basse) seulement), termes de relativité générale (GR) de Schwarzschild + Lense–Thirring (<c3/>).

# text
# c1: 1/σ²
seg-710f89c088cc = L'<b>estimateur</b> est de vrais moindres carrés par lots de Gauss–Newton avec une <b>matrice de transition d'état</b> variationnelle (recoupée avec une différence finie sur l'arc entier à < { "1e-6" }), une pondération des observations en <c1/> et une édition des valeurs aberrantes à n sigma.

# text
# c1: src/eop.rs
# c2: src/cio.rs
# c3: timescales::gps_to_tt
seg-dd5dcc66ed22 = Les <b>référentiels et le temps</b> utilisent de <b>vrais paramètres d'orientation de la Terre (EOP) IERS finals2000A</b> (UT1 (Universal Time { "1" }, temps de rotation de la Terre)−UTC (temps universel coordonné), mouvement du pôle ; <c1/>) via la chaîne CIO (Celestial Intermediate Origin) IAU (Union astronomique internationale) 2006/2000A validée (<c2/>). Temps GPS (Global Positioning System) de SP3 (Standard Product { "3" }, le format d'orbite précise) → TT (Temps terrestre) par le décalage fixe de { "51.184" } s (<c3/>).

# text
seg-665bb53b81fb = Les <b>résidus</b> sont rapportés en <b>RTN</b> (radial/along/cross-track) et en 3D, <b>avec et sans</b> accélérations empiriques, à côté du recouvrement brut (sans ajustement).

# text
seg-fea4515ba842 = Chaque chiffre est <b>reproductible</b> (porte d'intégration continue (CI) sur données ouvertes) et <b>citable</b> (hachage de commit + référence du jeu de données + SHA-256 du jeu d'essai (SHA : Secure Hash Algorithm)).

# text
seg-fa98a174e799 = Méthode, par jeu de données

# text
seg-a98b098e815a = Analyser l'orbite précise SP3 ; pour le satellite choisi, prendre chaque position ITRF (International Terrestrial Reference Frame).

# text
# c1: (UT1, xₚ, yₚ)
seg-a25f69a48b5a = Convertir l'époque GPS de SP3 → TT ; résoudre <c1/> à partir de finals2000A à cette époque.

# text
seg-e5338b713d88 = Faire pivoter chaque position ITRF vers le GCRS (Geocentric Celestial Reference System) via la chaîne CIO avec ces EOP — ce sont les observations de position inertielle. La dynamique utilise les <em>mêmes</em> EOP pour la rotation terrestre fixe du géopotentiel, de sorte que les observations et les forces partagent un seul référentiel.

# text
# c1: [r, v, C_R]
seg-ce987e4dda40 = Initialiser l'état à l'époque (position = première position ; vitesse = différence finie du 2e ordre) et ajuster par lots <c1/> (niveau { "1" }), puis en plus les { "9" } accélérations empiriques RTN à cycle par révolution (CPR) (niveau { "2" }, contraintes a priori).

# text
seg-22f839d05292 = Rapporter les RMS (root mean square) RTN et 3D après ajustement pour les deux niveaux et le recouvrement brut.

# text
seg-64e2c3662a27 = Galileo, orbite terrestre moyenne — <b>GREEN</b> (seuil < { "5" } m)

# text
# c1: ESA0MGNFIN
seg-e77e8e35ba80 = <b>Jeu de données :</b> orbite multi-GNSS (GNSS : système mondial de navigation par satellite) finale ESA/ESOC (ESA : Agence spatiale européenne ; ESOC : Centre européen d'opérations spatiales) <c1/>, ITRF, échantillonnage à 5 min, satellite <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), MEO (orbite terrestre moyenne) nominale), 2022-01-01.

# text
# c1: navigation-office.esa.int/products/gnss-products/2190/
# c2: datacenter.iers.org/data/9/finals2000A.all
seg-f90d848e7a46 = <b>Source ouverte (sans connexion) :</b> miroir de l'ESA Navigation Office, <c1/>. EOP : IERS <c2/>.

# text
seg-ec7195b80bad = Commit de validation :

# text
# c1: e7297f4c…d3a24a3
# c2: 6b781d36…cb2ed00f
# c3: tests/fixtures/agency/NOTICE.md
seg-c2ad9f9cc050 = <b>Jeux d'essai (SHA-256) :</b> SP3 <c1/> ; EOP <c2/> (<c3/>).

# text
seg-de3df1639939 = Arc

# text
seg-7db37f753fc1 = RMS 3D

# text
seg-d39e59df38c0 = RTN (R, T, N)

# text
seg-5ad814c7ef9e = Notes

# text
# c1: C_R
seg-bced8a114852 = Jeu d'essai CI, niveau { "1" } (forces + <c1/>)

# text
seg-f040df9ee966 = { "8" } h

# text
seg-459900054e0e = { "0.133" } m

# text
seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

# text
seg-d15ea658058b = recouvrement brut { "78.7" } km

# text
seg-1ce1bc363541 = Jeu d'essai CI, niveau { "2" } (+ CPR empirique)

# text
seg-461105b5c2f3 = { "0.070" } m

# text
seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

# text
seg-224a7fc75354 = divise le résidu par deux

# text
seg-1b422bc76914 = Exécution déclenchée sur arc complet, niveau { "1" } (avant correctif†)

# text
seg-f57ee3b36d92 = { "24" } h

# text
seg-5fee750a5e30 = { "0.611" } m

# text
seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

# text
# c1: xval/s2-air-tide-fix/
# c2: workflow_dispatch
seg-95879df86618 = Les chiffres du jeu d'essai CI ci-dessus ont été réenregistrés en { "0.36" } après le correctif S2 des marées atmosphériques (<c1/>) : le niveau { "1" } de Galileo est passé de { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), les composantes N de Swarm-A de { "1" }–{ "2" } mm ; les chiffres de l'exécution déclenchée sur arc complet n'ont pas été relancés. † <b>Avant correctif :</b> le chiffre de l'exécution déclenchée sur arc complet a été enregistré avant le correctif { "0.36" } S2 des marées atmosphériques et n'a pas été relancé sur le code corrigé (les produits de journée complète sont récupérés par le workflow déclenché, non disponibles dans la session qui a fait le correctif). Sur les jeux d'essai CI, le correctif a déplacé le RMS 3D de Galileo de moins de { "1" } mm et les composantes de Swarm-A de { "1" }–{ "2" } mm ; une variation du même ordre est donc attendue, et la prochaine exécution de <c2/> la réenregistrera.

# text
seg-5141c1811e35 = Le champ MEO a convergé en gravité au degré { "8" } (le résultat de niveau 1 sur { "8" } h est identique au millimètre à d/o { "8" }, { "10" } et { "12" }), de sorte que la troncature d/o-12 du jeu d'essai CI est négligeable ; la tâche déclenchée exécute le d/o-70 complet. L'ajustement sur { "8" } h atteint <b>{ "13" } cm</b> en force pure et <b>{ "7" } cm</b> avec le niveau empirique ; l'arc complet de { "24" } h (davantage de contrainte SRP/éclipse, durée dynamique plus longue) est à <b>{ "61" } cm</b> — très en deçà du seuil de { "5" } m.

# text
seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (seuil < { "5" } m)

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: RDOD_AR
# c3: L47
seg-cba2e4a9b9b1 = <b>Jeu de données :</b> orbite scientifique précise à dynamique réduite de niveau 2 d'ESA Swarm <c1/> (<c2/>, dérivée du GPS, ITRF / IGb14, ~{ "2" } cm, traitement de l'Université de technologie de Delft), satellite <b>Swarm-A</b> (identifiant SP3 <c3/>, LEO à ~{ "430" } km), 2022-01-01.

# text
# c1: https://swarm-diss.eo.esa.int/
# c2: Level2daily/Latest_baselines/POD/RD/Sat_A/
# c3: finals2000A
seg-f66ad1515550 = <b>Source ouverte (sans connexion) :</b> serveur de diffusion ESA Swarm <c1/> → <c2/> (ouvert selon la politique de données de l'ESA). EOP : la même série IERS <c3/> 2022-001.

# text
# c1: 6cd84b78…acb733e
# c2: tests/fixtures/agency/NOTICE.md
seg-4de8b64c0bf0 = <b>Jeu d'essai (SHA-256) :</b> SP3 <c1/> (<c2/>).

# text
# c1: C_R
seg-b46c7e1d476d = Un arc LEO ajoute la <b>traînée atmosphérique</b> au modèle de forces. Comme le modèle de densité est une exponentielle par morceaux <em>statique</em>, l'orbite est ajustée en deux niveaux : un niveau <b>dynamique</b> (estimer seulement l'état à l'époque ; <c1/> maintenu à { "1" }, car en LEO la traînée domine et la SRP se sépare mal sur un arc court), et un niveau <b>à dynamique réduite</b> qui ajoute les accélérations empiriques à cycle par révolution portant la traînée non modélisée — l'orbite LEO utile en exploitation.

# text
# c1: C_R
seg-dac35ad223dd = Jeu d'essai CI, dynamique (<c1/>={ "1" })

# text
seg-0652aa62d459 = { "3" } h

# text
seg-cc0a14ba2b40 = { "2.687" } m

# text
seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

# text
seg-555712268929 = résidu ≈ purement le long de la trace (traînée)

# text
seg-4f8e7956aa78 = Jeu d'essai CI, dynamique réduite (+empirique)

# text
seg-aa5f651bcfab = { "0.098" } m

# text
seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

# text
seg-82a3e25da2bf = l'empirique absorbe la traînée

# text
# c1: swarm_full_arc_dispatch
# c2: KSHANA_SWARM_SP3
seg-ff834d33ae70 = L'ajustement dynamique passe sous le seuil de { "5" } m, le résidu étant presque entièrement le long de la trace — la signature classique de la traînée à ~{ "430" } km. Le niveau empirique absorbe cette erreur le long de la trace ({ "2.52" } → { "0.09" } m), donnant un ajustement à dynamique réduite de <b>~{ "10" } cm</b> par rapport à l'orbite propre de l'ESA, à ~{ "2" } cm. L'exécution sur journée complète et à degré complet est le <c1/> ignoré (le serveur de diffusion sert le produit via sa session d'explorateur de fichiers, de sorte que le fondateur télécharge le SP3 du jour et y pointe <c2/>). NRLMSISE-00 (NRLMSISE : modèle d'atmosphère étendu du Naval Research Laboratory avec spectromètre de masse et radar à diffusion incohérente) avec des facteurs météorologiques spatiaux est l'amélioration notée qui resserrerait encore le niveau <em>dynamique</em>.

# text
seg-e8f5c385de62 = LRO lunaire — validé, <b>au-dessus</b> du seuil de { "5" } m (honnêtement) (P4 W4b)

# text
seg-8a22ef5d3765 = <b>Jeu de données :</b> la trajectoire reconstruite réelle du <b>Lunar Reconnaissance Orbiter</b> (LRO ; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) de la NASA/JPL (NASA : National Aeronautics and Space Administration ; JPL : Jet Propulsion Laboratory) issue de JPL Horizons, vecteurs d'état géométriques centrés sur la Lune dans l'ICRF (International Celestial Reference Frame), 2022-01-01, altitude d'environ { "98" } km, échantillonnage à 1 minute ({ "241" } époques, { "4" } h, ~{ "2" } révolutions). L'utilisation des vecteurs texte d'Horizons ne nécessite <b>aucun lecteur SPK/SPICE (SPK : noyau d'éphéméride planétaire ; SPICE : Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

# text
seg-2bcf078de340 = <b>Gravité :</b> le champ <b>GRGM660PRIM</b> de GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, degré { "660" }), tronqué à d/o { "150" } et ajusté à d/o { "100" }, évalué dans le référentiel lunaire fixe aux <b>axes principaux</b>.

# text
# c1: ssd.jpl.nasa.gov/api/horizons.api
# c2: icgem.gfz-potsdam.de
seg-1454f78e9ca4 = <b>Source ouverte (sans connexion) :</b> API (interface de programmation d'application) Horizons <c1/> ; gravité via ICGEM (International Centre for Global Earth Models) <c2/>.

# text
# c1: 574e3518…d100f0
# c2: 0ff04184…f029977ae
# c3: tests/fixtures/agency/NOTICE.md
seg-306ffeb843a9 = <b>Jeux d'essai (SHA-256) :</b> LRO <c1/> ; GRGM <c2/> (<c3/>).

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: precise_od::ForceModel
seg-65ff0c37dd74 = Il s'agit d'une dynamique <b>centrée sur la Lune</b> — un modèle de forces distinct (<c1/>) : le champ GRGM dans le référentiel lunaire fixe (l'orientation terrestre moyenne <c2/> de l'IAU { "2015" } composée avec le décalage fixe DE421 (Development Ephemeris { "421" }) Terre moyenne → axes principaux (ME→PA)), plus les troisièmes corps Terre (la perturbation dominante d'une orbite lunaire) et Soleil, ajustés par le <em>même</em> estimateur générique de Gauss–Newton précis que celui des jeux de données terrestres (le trait <c3/>).

# text
seg-68f1894a1fa5 = Jeu d'essai CI, dynamique (état seulement)

# text
seg-0f055118d77a = { "4" } h

# text
seg-c94fc5bf792b = { "12.05" } m

# text
seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

# text
seg-af395226ca52 = recouvrement brut { "39.9" } m

# text
seg-2923b4d58878 = Jeu d'essai CI, dynamique réduite (empirique { "1" }+2/rév)

# text
seg-19167d54b4ad = { "6.67" } m

# text
seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

# text
seg-706a4d52f6c5 = l'empirique à 1 et 2 par révolution absorbe l'erreur le long de la trace

# text
# c1: pxform('MOON_ME','MOON_PA')
# c2: tests/lunar_me_pa_offset_spice_oracle.rs
# c3: docs/design/evidence/fut05b-me-pa-offset-sign/
seg-3f33d99fd643 = Correction { "0.36" } : jusqu'en { "0.36" }, le décalage ME→PA de DE421 était appliqué dans le mauvais sens (et avec le mauvais ordre d'Euler), ce qui plaçait le référentiel PA analytique à environ { "208" }″ du PA au lieu de sur lui. Il est désormais transcrit tel que SPICE le définit (vérifié par rapport à <c1/> à { "2.6e-16" } rad, <c2/> ; <c3/>). Les chiffres ci-dessus sont ceux après le correctif ; avant lui, ils étaient de { "53.8" } m bruts, <b>{ "12.6" } m</b> en dynamique ({ "3.07" }, { "10.19" }, { "6.81" } m) et <b>{ "6.65" } m</b> en dynamique réduite ({ "3.49" }, { "4.56" }, { "3.35" } m).

# text
seg-925d1445fccb = Ces résidus sont <b>au-dessus</b> du seuil de { "5" } m que Galileo ({ "0.13" } m) et Swarm-A ({ "0.10" } m) franchissent, et sont rapportés honnêtement.

# text
seg-c414e14eaaea = Ce qui fixe réellement le plancher — une validation croisée de niveau DE (et une correction)

# text
# c1: MOON_PA
# c2: xval/anise-lunar-od
# c3: moon_pa_de440_200625.bpc
# c4: de440s.bsp
# c5: ae96a29
# c6: c1c7fee…
# c7: 60cd55a…
seg-72b06bac7f6b = Nous avions émis l'hypothèse que le facteur limitant était la fidélité de l'<b>orientation et de l'éphéméride lunaires analytiques</b> (la série de libration de l'IAU, précise à quelques dizaines de secondes d'arc, par rapport à <c1/> de JPL DE (Development Ephemeris) intégré numériquement, et l'éphéméride Terre/Soleil de Montenbruck–Gill, à ~{ "0.3" }° d'un noyau DE/SPICE). Pour tester cela directement, la crate de validation croisée <c2/>, exclue de l'espace de travail, remplace <b>seulement</b> ces deux entrées par des entrées <b>de niveau DE</b> — l'orientation lunaire aux axes principaux DE440 (Development Ephemeris { "440" }) (<c3/>) et l'éphéméride DE440 (<c4/>), lues via ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — un lecteur de noyaux SPICE en Rust pur) — et relance le <em>même</em> estimateur (commit <c5/>, SHA-256 des noyaux <c6/> / <c7/>) :

# text
seg-3a0e724a8a2b = Niveau

# text
seg-c1ce24cd6008 = analytique

# text
seg-7d04fb530a3a = recouvrement brut

# text
seg-d9ce88edb49e = { "53.8" } m

# text
seg-55dc7c7d84f0 = { "41.5" } m

# text
seg-7def7880e134 = dynamique

# text
seg-83e37e5e9b3e = { "12.6" } m

# text
seg-c421a0a20278 = { "12.0" } m

# text
seg-f70309824f25 = dynamique réduite ({ "1" }+2/rév)

# text
seg-b8ada0c5fab3 = { "6.65" } m

# text
seg-b6d3daff2f23 = <b>Note { "0.36" } : l'essentiel du gain du niveau dynamique ci-dessous venait de l'erreur de décalage, et non des entrées de niveau DE.</b> Avec le décalage ME→PA corrigé, la pile analytique donne { "39.9" } m bruts, { "12.05" } m en dynamique et { "6.67" } m en dynamique réduite, contre { "41.5" }, { "12.0" } et { "6.67" } m pour le niveau DE : les ajustements analytique et de niveau DE concordent désormais à chaque niveau. La lecture { "0.30" } du tableau ci-dessous en découle, conservée telle qu'elle a été écrite.

# text
# c1: atol
seg-691df96321d8 = <b>L'hypothèse n'est qu'à moitié juste, et l'affirmation principale devait être corrigée.</b> L'orientation et l'éphéméride de niveau DE <em>améliorent</em> bien le recouvrement brut ({ "53.8" } → { "41.5" } m) et l'ajustement <b>dynamique</b> ({ "12.6" } → { "12.0" } m) — l'erreur d'orientation/d'éphéméride analytique est donc réelle et limite bien ces niveaux. Mais elles laissent le résidu <b>à dynamique réduite</b> essentiellement <b>inchangé</b> ({ "6.65" } → { "6.67" } m) : le niveau empirique à { "1" }+2 par révolution absorbait <em>déjà</em> l'erreur d'orientation/d'éphéméride, de sorte que le plancher opérationnel de ~{ "6.6" } m est fixé par autre chose — un résidu que la base à cycle par révolution ne peut absorber et que les référentiels de niveau DE n'éliminent pas. L'explication la plus cohérente est une <b>dynamique non gravitationnelle de LRO non modélisée</b> (réémission thermique, dégazage) sur l'arc court de { "4" } h ; le degré du champ est exclu (identique à d/o { "100" } et { "150" }) et la tolérance de l'intégrateur est exclue (identique à <c1/> { "1e-6" } contre { "1e-9" }). Le corollaire constructif : <b>la pile lunaire analytique légère et sans noyau de Kshana atteint déjà la fidélité de niveau DE pour l'orbite lunaire à dynamique réduite (opérationnelle)</b> — le défaut à coefficients purs n'y laisse rien sur la table. Franchir { "5" } m exigerait de modéliser les forces non gravitationnelles de LRO (un modèle boîte-ailes/thermique propre au vaisseau et un ajustement plus long sur plusieurs arcs), et non de meilleurs référentiels.

# text
seg-4211fbd25380 = Contrat d'honnêteté

# text
seg-f3b0a26ff5b3 = Le seuil « vert » de < { "5" } m est atteint pour <b>Galileo MEO</b> ({ "0.13" } m en dynamique) et <b>Swarm-A LEO</b> ({ "2.69" } m en dynamique / { "0.10" } m en dynamique réduite). <b>LRO lunaire est publié tel quel à { "12.05" } m en dynamique / { "6.67" } m en dynamique réduite (empirique à { "1" }+2 par révolution) — au-dessus du seuil</b> ({ "0.36" }, après le correctif du décalage ME→PA ; { "12.6" } / { "6.65" } m avant lui). Une validation croisée de niveau DE (ci-dessus) a <b>testé et corrigé</b> l'affirmation sur le facteur limitant : le plancher à dynamique réduite n'est <b>pas</b> l'orientation/éphéméride analytique (les noyaux DE440 le laissent inchangé à { "6.67" } m), de sorte qu'il ne se referme pas par de meilleurs référentiels mais par la modélisation de la dynamique non gravitationnelle de LRO — la voie honnête et mise à jour vers le niveau du mètre.

# text
seg-559a269152ae = Pour la LEO, les niveaux <b>dynamique</b> (état seulement, densité statique) et <b>à dynamique réduite</b> (avec accélérations empiriques) sont toujours rapportés <b>séparément</b>, afin que le lecteur voie ce qu'absorbent les termes empiriques ; le niveau à dynamique réduite est l'orbite opérationnelle. La même séparation vaut pour les niveaux MEO empirique/force pure.

# text
seg-d20c7ef90250 = Chaque résidu porte ci-dessus son hachage de commit, sa référence de jeu de données et la somme de contrôle de son jeu d'essai.

# text
seg-733d96129fca = <b>Jeux de données validés par rapport à une vérité réelle d'agence : { "3" } sur { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO lunaire). <b>Respectant le seuil de < { "5" } m : { "2" } sur { "3" }</b> (Galileo ✓, Swarm-A ✓ ; LRO à { "6.67" } m, honnêtement au-dessus).

# text
seg-d7c77076c9c6 = <s1>Précédent</s1>Validation de SGP4

# text
seg-d661003da754 = <s1>Suivant</s1>Système solaire et autres corps

# text
seg-36a3b8105d4b = Galileo, orbite terrestre moyenne — GREEN (seuil < { "5" } m)

# text
seg-b6f96cf0d55a = Swarm-A LEO — GREEN (seuil < { "5" } m)

# text
seg-9e739bda7f20 = LRO lunaire — validé, au-dessus du seuil de { "5" } m (honnêtement) (P4 W4b)
