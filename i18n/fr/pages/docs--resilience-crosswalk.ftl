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
