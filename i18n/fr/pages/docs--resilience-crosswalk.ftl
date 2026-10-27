# docs--resilience-crosswalk: translations (fr)

# text
seg-88372b30ed79 = Limite

# text
seg-aab745a65e76 = Module

# text
seg-ad856ad710eb = État

# text
seg-b03d56f501c3 = Type

# text
seg-4dbf41c0ec3b = Fonction

# text
seg-f472e43c1100 = Ce qu'il montre

# text
seg-fa4468d4cb80 = Disponibilité

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-fe4d868448ef = Source : <c1/>

# text
seg-d745715d5332 = Table de correspondance avec les cadres de résilience PNT

# text
# c1: VALIDATED
# c2: MODELLED
# c3: resilience::diversity
# c4: resilience::stats
seg-aa1c24d63df5 = <b>Aligné sur, non évalué ni approuvé.</b> Ceci met en correspondance les capacités simulées de Kshana avec les cadres publiés de résilience PNT (PNT : positionnement, navigation et synchronisation temporelle). C'est une <em>autoévaluation issue de la simulation, alignée sur</em> le Resilient PNT Conformance Framework (RPCF) v2.0 du DHS/CISA (DHS : Department of Homeland Security ; CISA : Cybersecurity and Infrastructure Security Agency), le modèle Resist-Detect-Respond-Recover (RDRR) de RethinkPNT/Firesmith, et les critères de PNT résilient de Yang Yuanxi. Ce n'est <b>pas</b> une évaluation, une approbation, une accréditation ou une déclaration de compliance, et elle ne porte aucun aval du DHS, de l'IEEE (Institute of Electrical and Electronics Engineers) ni d'aucune autorité. Chaque ligne est étiquetée avec son statut de vérification honnête (<c1/> par rapport à une référence indépendante, ou <c2/> à partir des premiers principes avec des tests) ; la couche de notation de la résilience elle-même est <b>MODELLED</b>. Deux de ses noyaux portent leurs propres lignes VALIDATED dans la matrice de vérification, le noyau de diversité par l'inverse de Simpson (<c3/>) et le noyau de statistiques d'ordre par rangs (<c4/>) ; cela valide l'arithmétique, non les scores qui en découlent.

# text
# c1: src/resilience/
# c2: src/verification.rs
seg-652fcf3ec12d = Le moteur de notation (<c1/>) consomme ces capacités et émet des sous-scores par dimension, jamais un nombre fantôme unique. Voir <c2/> pour les invariants d'état vérifiés par machine.

# text
seg-7a71de89a9fd = DHS RPCF v2.0 : ce que le cadre définit, et les catégories de sous-scores propres à Kshana

# text
seg-1985dbfe351d = Le cadre publié (Resilient PNT Conformance Framework, Version { "2.0" }, { "26" } avril { "2022" }, DHS Science and Technology Directorate avec la CISA) définit trois <b>fonctions essentielles</b> (section { "5.2" } : Prevent, Respond, Recover), des <b>niveaux de résilience { "0" } à { "4" }</b> (section { "5.3" }) et <b>huit exigences minimales numérotées</b> réparties sur les niveaux { "1" } à { "4" } (section { "5.3" }, reprises en { "5.5" }), plus une approche d'évaluation (section { "8" }). Il ne définit <b>pas</b> une liste de sept catégories de techniques. Une version antérieure de cette page, et les commentaires du module de résilience, décrivaient sept « catégories de techniques RPCF » ; les mots Obfuscate et Diversify n'apparaissent pas dans la v2.0. Le texte de ce document a été relu le 2026-10-09 et aucune liste de ce genre n'y a été trouvée.

# text
seg-178d1e119dce = Les sept noms de sous-scores qu'émet le moteur de notation (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover ; « OLVIDMR » est notre mnémonique) sont donc des <b>catégories de notation propres à Kshana</b>, conservées pour la stabilité de la sortie. Ce ne sont pas des termes du DHS et les lignes ci-dessous ne disent pas que le DHS les exige. Lorsqu'une catégorie correspond à une exigence d'un cadre, la dernière colonne l'indique ; sinon, elle indique « aucune ».

# text
seg-5a9eb11bb965 = Catégorie de sous-score de Kshana

# text
seg-e117e6f71845 = Capacité de Kshana utilisée comme moteur

# text
seg-7677dafa7016 = Référence RPCF v2.0 la plus proche

# text
seg-27e0f6b39605 = Obfuscate

# text
seg-7327b9cbc106 = Technique déclarée × qualité de la source (aucun moteur comportemental direct)

# text
seg-b63e61fa5fa2 = aucune (une technique de prévention ; section { "5.2" }, Prevent)

# text
seg-7ed4f2e21189 = Technique déclarée × qualité de la source

# text
seg-8579207ae2e5 = Verify

# text
seg-30b8cb030965 = AUC (aire sous la courbe) du détecteur de perturbations sous le scénario (moniteurs de leurrage/brouillage/meaconing)

# text
seg-3d358c029f50 = Niveau { "2" } exigence { "4" } ; Niveau { "3" } exigence { "7" }

# text
seg-fcb8cb7d4c97 = Isolate

# text
seg-b3cd355743da = Niveau { "3" } exigence { "6" }

# text
seg-ffa87d149a20 = Diversify

# text
seg-1282685a888b = Nombre de groupes indépendants → diversité effective par l'inverse de Simpson

# text
seg-f0dd4c4ef1c5 = Niveau { "4" } exigence { "8" } ; section { "5.5" } (mode commun)

# text
seg-2d91b12a9e56 = Mitigate

# text
seg-d183b552df76 = Disponibilité sous déni

# text
seg-c337df73e231 = section { "5.2" }, Respond

# text
seg-2da4df22d35d = Recover

# text
seg-85d7e3292549 = Dérive en holdover × barrière de dégradation bornée

# text
seg-3aec9f076902 = Niveau { "2" } exigence { "5" } ; section { "5.2" }, Recover

# text
seg-36958650abc0 = Le rapprochement exigence par exigence avec le cadre réel, avec ce pour quoi les sorties de Kshana apportent des éléments de preuve en faveur de et ce qui reste, se trouve dans <a1>compliance/dhs-rpcf.md</a1>.

# text
seg-a085dd81c769 = Fonctions RDRR de RethinkPNT / Firesmith

# text
seg-1b972717180b = Moteur

# text
seg-6eaf161f8871 = Resist

# text
seg-6046a8914dc7 = Moyenne des sous-scores Obfuscate/Limit/Isolate/Diversify

# text
seg-242e2c01ebc2 = Detect

# text
seg-45c8da13581f = Sous-score Verify (AUC du détecteur)

# text
seg-d29232baaaa6 = Respond

# text
seg-36ab7ce187e6 = Sous-score Mitigate (disponibilité)

# text
seg-f98dc190541c = Holdover × barrière bornée ; indicateurs clés de performance (KPI : détection/réaction/récupération/perte) de la chronologie de résilience

# text
seg-e7190928bed6 = Critères de Yang Yuanxi (le sous-ensemble auquel s'adressent les indicateurs de performance de synchronisation temporelle et de détection)

# text
seg-52836e247425 = Critère

# text
seg-cbbe4c0baf3f = Fiabilité

# text
seg-32d64f865b21 = Fraction d'intégrité du filtre

# text
seg-214372f29bd1 = Continuité

# text
seg-ad5e76a596b8 = Holdover × barrière bornée

# text
seg-d92fb15e6dfa = Précision

# text
# c1: fom::positioning_performance
seg-0de1f9119e0f = Indicateur de synchronisation temporelle/de qualité — <b>la précision dans le domaine de la position ne fait pas partie du score</b>. <c1/> transforme une covariance de position fournie et un HPL (niveau de protection horizontal) en CEP/SEP/2DRMS (erreur circulaire probable, erreur sphérique probable, deux fois la racine de la moyenne quadratique des distances), mais aucun scénario ne l'injecte dans le score de résilience

# text
seg-0aa925a09499 = MODELLED (domaine de la synchronisation temporelle seulement)

# text
seg-6b661e6e4399 = Ce que ce rapprochement n'affirme pas

# text
seg-51a48d0c718d = Aucun niveau RPCF conféré. Le niveau attribué est une lecture <em>provisoire, issue de la simulation</em>, avec une barrière de dégradation bornée explicite, non une maturité conférée.

# text
# c1: pvt
# c2: gnss-ins
# c3: leo-pvt
# c4: integrity
seg-df73b7c76ae5 = Aucune précision dans le domaine de la position dans le score. Les sous-scores de résilience sont construits à partir de métriques de synchronisation temporelle et de détection. Le moteur calcule bien des positions ailleurs (les types de scénario <c1/>, <c2/> et <c3/>) et des niveaux de protection (le type de scénario <c4/>), mais la couche de notation ne les consomme pas.

# text
# c1: resilience::panel
seg-30a1b1a4dfea = Aucune validation sur le terrain. Le panel de référence et l'ensemble de menaces sont des réductions synthétiques, fondées sur des paramètres (<c1/>), énoncées comme une limite de premier rang.

# text
# c1: resilience::study
seg-83c465cd78b0 = L'étude associée (<c1/>) existe précisément pour montrer que réduire ces dimensions à un score composite unique ou à un seul niveau produit une évaluation dont le classement des architectures est instable selon des choix défendables de pondération et de menace — ce rapprochement est donc une couche de mesure à lire dimension par dimension, non une note unique par rapport à laquelle évaluer un produit.

# text
seg-32bd45dc031d = Scénarios de résilience et scénarios verticaux qui exercent ces couches

# text
seg-4e36adba1c55 = Les scénarios fournis ci-dessous exécutent la mécanique de menace et de récupération vers laquelle pointent les lignes du rapprochement. Chacun est une exécution réelle du type de scénario nommé ; chacun est <b>MODELLED</b> (aucune donnée de terrain).

# text
# c1: scenarios/
seg-44664e49d449 = Scénario (<c1/>)

# text
seg-44b8d7435bfd = PNT en couches sous une menace commune de brouillage/leurrage : un Monte Carlo à graine fixée du déni de couches, la fusion à variance inverse des survivantes, le rapport de perte totale couche unique contre couches multiples, et la manière dont un déni corrélé effondre ce rapport. Ses identités Monte Carlo–forme close et de fusion sont vérifiées par des tests internes au crate ; le type de scénario n'a pas de ligne dans la matrice de vérification, il est donc classé MODELLED ici.

# text
seg-1734506ad287 = GNSS (système mondial de navigation par satellite) brouillé, une couche PNT en orbite terrestre basse (LEO) porte l'utilisateur, intégrité maintenue (trois phases sur une même chronologie).

# text
seg-ff8cc090bdce = Un brouilleur contre un récepteur à quatre bandes ; quel moniteur de leurrage voit quel leurreur.

# text
seg-0a93502a4a19 = La marge brouilleur sur signal (J/S) à partir de la puissance reçue.

# text
seg-f2230253bdff = Détection de leurrage par la cohérence du Doppler et de la géométrie de passage.

# text
seg-d8ca900a8c14 = Synchronisation temporelle de stations de base et d'infrastructures critiques en holdover, avec l'heure LEO.

# text
seg-2a61d07bf177 = Utilisateurs routiers, ferroviaires, maritimes, polaires et de l'Internet des objets (IoT) avec une couche LEO.

# text
seg-8723073167ad = Navigation à l'estime GNSS/INS (système de navigation inertielle) à travers un canyon urbain et à travers un brouillage sur un petit aéronef sans équipage.

# text
seg-6ee1ef707b20 = Combien de temps une INS maintient un navire ou un train dans sa limite lorsque le GNSS est refusé.

# text
seg-7ca913e1729b = Un brouilleur maritime ; détecter un leurreur qui entraîne la position rapportée d'un navire.

# text
seg-c49548e8393b = <s1>Précédent</s1>Carte DO-316 / DO-229E

# text
seg-dedf3b53d31f = <s1>Suivant</s1>Confiance du récepteur
