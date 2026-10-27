# docs--deployment-targets: translations (fr)

# text
seg-9c1e7fd8f838 = Comment

# text
seg-5ad814c7ef9e = Notes

# attr:aria-label, text
seg-9d3ee6a5613e = Exécutions

# text
# c1: docs/DEPLOYMENT-TARGETS.md
seg-e8eefc84e748 = Source : <c1/>

# text
seg-3e1eb98b38df = Où Kshana s'exécute, et où il ne s'exécute pas

# text
seg-1a203c4736f1 = Une limite de périmètre, consignée afin que personne ne la découvre sous la forme d'un engagement lors d'une réunion.

# text
seg-d6c92d17a3dd = Abréviations : CPU, unité centrale de traitement ; GPU, unité de traitement graphique ; NPU, unité de traitement neuronal ; FPGA, réseau de portes programmable sur site ; MCU, microcontrôleur ; RTOS, système d'exploitation temps réel ; OPS-SAT, le satellite laboratoire de logiciels en orbite de l'Agence spatiale européenne ; PyPI, le Python Package Index ; MCP, le Model Context Protocol ; AI, intelligence artificielle ; JSON, JavaScript Object Notation.

# text
seg-9376bb5b192e = Cible

# text
seg-95e7da118089 = Postes de travail et serveurs Linux, macOS et Windows, x86-64 et ARM 64 bits

# text
# c1: kshana
seg-b6ef382a73ef = le binaire <c1/>, ou la crate Rust

# text
# c1: cargo install kshana
seg-b8af20715cea = binaires de la version publiée pour Linux x86-64, macOS (Apple silicon et Intel) et Windows x86-64 ; sur les autres cibles, <c1/> le construit

# text
seg-3dc7d08f5729 = Python { "3.9" } ou version ultérieure

# text
# c1: kshana
# c2: --features python
seg-b1f1009faa44 = le paquet wheel <c1/> sur PyPI (<c2/>)

# text
seg-45b4e1bd8b18 = wheels pour Linux, macOS et Windows, x86-64 et ARM 64 bits

# text
seg-79f04380d254 = Clients MCP (agents d'IA)

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
seg-4163955ed77a = le serveur <c1/> : <c2/>, ou l'image de conteneur

# text
seg-c5a32580b7bc = image pour linux/amd64 et linux/arm64

# text
seg-ec575e06d439 = Navigateurs et environnements d'exécution JavaScript

# text
# c1: --features wasm
seg-a8238abc55bd = le paquet WebAssembly sur npm (<c1/>)

# text
seg-c7789c7f4429 = le même moteur, compilé en WebAssembly

# text
seg-488c2b62d246 = Un petit ordinateur à bord d'un bateau, à côté du récepteur

# text
# c1: deploy/reference-build/
# c2: kshana receiver-trust live
seg-69a58e13b706 = la version de référence dans <c1/> : <c2/> avec la porte, qui publie vers Signal K et, sur option, vers OpenCPN

# text
# c1: MARINE-INTEGRATIONS.md
seg-df530583c13c = à titre consultatif, et non un équipement de navigation homologué ; non testé sur un navire par le projet ; voir <a1><c1/></a1>

# text
seg-cf83dbb55f99 = Serveurs Signal K

# text
# c1: integrations/signalk/
seg-88ddbefb95dd = le module d'extension dans <c1/>

# text
seg-5f436c952149 = livré et testé unitairement sur une sortie synthétique enregistrée ; non publié sur npm

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-026115eafe9b = NMEA { "0183" } en mode porte sur TCP depuis le moniteur

# text
# c1: MARINE-INTEGRATIONS.md
seg-8e101a661cbc = sur option ; voir <a1><c1/></a1>

# text
seg-cea294c412f0 = Ordinateurs de charge utile de classe Linux

# text
seg-bf74da1c1262 = la crate Rust ou le binaire, compilé en croisé

# text
seg-868f121e5909 = Ordinateurs de charge utile de classe OPS-SAT et similaires

# text
seg-53c8be810679 = Nœuds en périphérie avec un GPU, un NPU ou un FPGA à côté d'un CPU Linux

# text
seg-70b2c22bf453 = sur le CPU Linux

# text
seg-977842cb0f86 = Kshana n'utilise aucun des accélérateurs ; il s'exécute à côté d'eux

# text
seg-3e15446b6efb = Ne s'exécute pas

# text
# c1: std
# c2: no_std
seg-205144220741 = <b>Un MCU de vol à nu (bare-metal) ou un petit RTOS sans la bibliothèque standard de Rust.</b> Kshana est une crate <c1/> de bout en bout : elle alloue sur le tas, lit des fichiers, met en forme du JSON et utilise les fonctions en virgule flottante de la bibliothèque standard. Il n'existe aucune version <c2/> ni aucune fonctionnalité qui en produise une.

# text
# c1: no_std
seg-46ccad7b96e8 = <b>Décision : nous ne proposons pas de noyau de vol <c1/>.</b> En construire un serait un produit distinct, avec sa propre charge de vérification, et cela placerait Kshana dans le logiciel de vol, où la qualification est un programme à part entière pour lequel nous n'avons aucune voie d'accès.

# text
seg-63bc696bc66a = Que faire à la place

# text
# c1: slot-timing
seg-07fff123aed3 = <b>Exécutez Kshana au sol ou sur un ordinateur de charge utile, et téléversez ses résultats.</b> Le type de scénario <c1/> produit exactement les chiffres dont un calculateur de vol a besoin : une cadence de positionnement, un instant de dépassement, une garde. Un tableau de ces valeurs fait quelques octets.

# text
# c1: SLOT-TIMING.md
seg-c2752c281cd3 = <b>Portez une forme analytique, si c'est tout ce qu'il faut.</b> L'inversion du holdover est une courte recherche de racine monotone sur une variance polynomiale, documentée avec ses équations dans <a1><c1/></a1>. La réimplémenter dans du code de vol est simple ; le code dérivé de Kshana reste sous la licence de Kshana.

# text
seg-b484e9426ab0 = Également hors périmètre

# text
seg-7bcd90c9ef31 = Les garanties temps réel strict (Kshana alloue de la mémoire et n'avance aucune affirmation sur le temps d'exécution dans le pire cas) ; la qualification en vol de quoi que ce soit ; et un protocole de synchronisation, un contrôleur ou une pile de routage. Kshana fournit les éléments de preuve de synchronisation temporelle à partir desquels ces systèmes sont conçus. Il n'est pas l'un d'eux.

# text
seg-542e51fbb35a = <s1>Précédent</s1>Module d'extension JetBrains

# text
seg-52a455f4c409 = <s1>Suivant</s1>Architecture
