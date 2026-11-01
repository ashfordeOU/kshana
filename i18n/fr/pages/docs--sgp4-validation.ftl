# docs--sgp4-validation: translations (fr)

# text
seg-3c513ef2fd3b = Grandeur

# text
# c1: docs/SGP4-VALIDATION.md
seg-09da3685124b = Source : <c1/>

# text
seg-dd68e234a5cd = Validation de SGP4/SDP4 par rapport à la référence de la communauté

# text
# c1: SGP4-VER.TLE
# c2: tcppver.out
seg-d7567fa218fe = Le propagateur d'orbite de Kshana est validé par rapport à la <b>référence canonique de la communauté</b> pour SGP4/SDP4 (SGP4 : Simplified General Perturbations { "4" } ; SDP4 : Simplified Deep-space Perturbations { "4" }) : les vecteurs de vérification publiés avec Vallado et al., <em>« Revisiting Spacetrack Report #3 »</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753), distribués sous la forme de <c1/> (les TLE (jeux d'éléments à deux lignes) de test) et de <c2/> (l'état TEME (vrai équateur, équinoxe moyen) attendu à chaque instant). C'est la même référence que celle par rapport à laquelle les implémentations publiques en C++/Python/MATLAB se valident ; l'accord obtenu ici est donc un accord avec la norme de fait.

# text
seg-b99fb640886c = États de référence comparés

# text
# c1: tcppver.out
seg-b16a220a41b7 = (toutes les lignes de <c1/>, figées dans le test)

# text
seg-e7d45e243571 = Pire erreur de position

# text
# c1: 2e-5
seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satellite { "23333" } ; < <c1/> km de tolérance)

# text
seg-01da72026e56 = Pire erreur de vitesse

# text
# c1: 1e-6
seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satellite { "23333" } ; < <c1/> km/s de tolérance)

# text
seg-041cbc679ed7 = Cas couverts

# text
seg-283f3c571a7c = SGP4 pour orbite proche de la Terre, SDP4 pour l'espace lointain (lunisolaire + résonance { "12" } h/24 h) et les cas délibérés de codes d'erreur

# text
seg-75c2bd004348 = Les cas d'espace lointain et de résonance comptent particulièrement pour ce projet : les satellites GNSS (système mondial de navigation par satellite) se trouvent sur des orbites d'environ { "12" } h qui sont en espace lointain et en résonance, ce qu'un modèle à deux corps + J2 séculaire ne peut pas reproduire — SGP4/SDP4 le peut.

# text
seg-613697670501 = Méthode

# text
# c1: src/sgp4.rs
# c2: improved
# c3: afspc
seg-d753e2f76b4a = L'implémentation (<c1/>) est un portage en Rust, sans dépendance, de l'algorithme de Vallado, qui est dans le domaine public ; la gestion des époques se fait en jours depuis 1950, le mode <c2/> (et non <c3/>) est utilisé, et les constantes gravitationnelles WGS-72 (WGS : World Geodetic System) sont appliquées comme le précise la référence.

# text
# c1: tests/sgp4_verification.rs
# c2: SGP4-VER.TLE
# c3: tcppver.out
# c4: tests/fixtures/sgp4/
# c5: 666
seg-ebc18c4cb8ad = Le test (<c1/>) analyse les fixtures <c2/> et <c3/> embarquées (<c4/>), propage chaque satellite de test à chaque instant de référence, et vérifie que la position et la vitesse TEME concordent dans les tolérances ci-dessus. Le nombre de lignes comparées est figé à exactement <c5/> afin qu'une régression d'une fixture ou du comportement d'omission ne puisse pas réduire discrètement la couverture.

# attr:aria-label, text
seg-d0566d4db829 = Le reproduire

# text
seg-ba3ed7f0aba7 = Le test affiche le nombre de lignes comparées ainsi que les pires erreurs de position et de vitesse. Les fixtures sont versionnées dans le dépôt : la vérification est donc entièrement hors ligne et déterministe.

# text
# c1: sgp4
seg-4f539e17926e = Recoupement indépendant avec la crate <c1/>

# text
# c1: tests/sgp4_crate_comparison.rs
# c2: sgp4
# c3: from_elements
seg-0c2d2752179f = La concordance avec la référence publiée prouve l'exactitude par rapport à une <em>table</em>. Pour la prouver aussi par rapport à une <em>implémentation indépendante</em>, <c1/> exécute une bibliothèque SGP4 en Rust indépendante et largement utilisée, la crate <a1><c2/></a1> (neuromorphicsystems/sgp4, version { "2.4" }), sur les mêmes { "666" } vecteurs de l'AIAA, et compare les deux bases de code face à face. Les deux sont pilotées avec le modèle de gravité <b>WGS72</b> (World Geodetic System { "1972" }) dans lequel les vecteurs sont définis (le <c3/> par défaut de la crate utilise WGS84 (World Geodetic System { "1984" }), qui diffère de la référence WGS72 d'environ un km — un choix de modélisation, signalé en toute honnêteté, et non une erreur).

# text
seg-da0e4e6c9e96 = Régime

# text
seg-a6eefd68c27c = kshana ↔ référence

# text
seg-e725899898a3 = crate ↔ référence

# text
seg-427820fec0e7 = kshana ↔ crate

# text
seg-6305527acfa4 = proche de la Terre (LEO/MEO (LEO : orbite terrestre basse ; MEO : orbite terrestre moyenne))

# text
seg-081e28a39101 = { "7.3e-9" } km

# text
seg-e68c97a6528a = { "4.4e-10" } km

# text
seg-4c34e8e2f4c4 = espace lointain (non résonant)

# text
seg-12e758e04df0 = { "4.1e-6" } km

# text
seg-db82b835dec9 = { "2.1e-7" } km

# text
seg-d7d4f47417bc = résonance d'espace lointain (½ jour)

# text
seg-17007f8aada3 = { "8.1e-9" } km

# text
seg-895ba7518ab3 = { "7.7e-9" } km

# text
seg-be5a634658e5 = { "2.2e-9" } km

# text
seg-6cf60f32cbcd = résonance d'espace lointain (1 jour)

# text
seg-7698aecab6b4 = { "8.2e-9" } km

# text
seg-60520079d492 = { "7.8e-9" } km

# text
# c1: tests/fixtures/sgp4_comparison.md
# c2: KSHANA_REGEN_FIXTURES=1 cargo test --test sgp4_crate_comparison
seg-c22876d62c29 = Deux implémentations indépendantes concordent à mieux que le <b>micron</b> pour les orbites proches de la Terre et résonantes, et à <b>{ "4.12" } mm au pire</b> sur tous les régimes — ce sont les mêmes { "4.12" } mm qui constituent l'écart propre de Kshana par rapport à la référence ; autrement dit, le désaccord <em>est</em> ce seul cas d'espace lointain, la crate se situant entre Kshana et la table. La table complète (avec le nombre de lignes par régime et les quatre cas pathologiques que la crate rejette à la construction) est versionnée dans <a1><c1/></a1> et régénérée via <c2/>.

# text
seg-3aae516df868 = Statut de la « publication » de ce résultat

# text
seg-2dd4b77c49d1 = La validation croisée elle-même est terminée et se trouve dans l'arborescence. Soumettre le résultat à des lieux externes (un catalogue communautaire, une courte note, une notice archivée avec DOI (DOI : identifiant d'objet numérique)) est une action de mainteneur suivie séparément dans la feuille de route ; ce document est le compte rendu, dans le dépôt, vers lequel ces soumissions renverraient.

# text
seg-b36bbcc0a0c8 = <s1>Précédent</s1>EN { "16803" }

# text
seg-4d5234d85d9f = <s1>Suivant</s1>Validation du modèle de forces

# text
seg-6539dbb48bca = Recoupement indépendant avec la crate sgp4
