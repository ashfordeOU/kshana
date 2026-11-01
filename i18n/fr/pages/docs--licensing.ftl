# docs--licensing: translations (fr)

# text
# c1: LICENSING.md
seg-a1bee28d1dfd = Source : <c1/>

# text
seg-b8dd205e82c4 = Kshana est <b>sous double licence</b>. Vous pouvez utiliser le moteur ouvert <b>soit</b> sous la licence ouverte (AGPL-3.0) <b>soit</b> sous une <b>licence commerciale</b> d'Ashforde OÜ. Choisissez celle qui convient à l'usage que vous prévoyez.

# text
# c1: LICENSE
seg-5faea0aba960 = Ce document explique le modèle en langage courant. C'est un guide, non un avis juridique, et il ne modifie pas les licences elles-mêmes. Les termes qui font foi se trouvent dans <a1><c1/></a1> (la GNU AGPL-3.0) et dans tout accord commercial que vous signez avec Ashforde OÜ. En cas de conflit entre les deux, ces documents prévalent.

# text
seg-89bd60937f0b = Option A — logiciel libre : GNU AGPL-3.0-only

# text
# c1: LICENSE
seg-785200a5419a = L'option par défaut. Le texte intégral se trouve dans <a1><c1/></a1>. En bref, l'AGPL vous permet d'utiliser, d'étudier, de modifier et de redistribuer Kshana gratuitement, <b>à condition</b> que :

# text
seg-5bc05999ee9d = si vous <b>distribuez</b> Kshana ou un dérivé, vous mettiez à disposition le <b>code source correspondant complet</b> sous l'AGPL ; et

# text
seg-5c9136766fdf = si vous laissez des utilisateurs interagir avec un Kshana <b>modifié</b> <b>par un réseau</b> (la clause distinctive de l'AGPL, §{ "13" }), vous offriez à <b>ces utilisateurs</b> le code source correspondant de votre version modifiée sous l'AGPL.

# text
seg-234be920d38f = L'AGPL est une <a1>licence libre approuvée par l'OSI</a1> et un copyleft fort. C'est le bon choix pour les travaux universitaires, les projets libres, l'évaluation et la recherche internes, et toute personne qui accepte de garder ouvert son propre dérivé.

# text
seg-16c9cc91e4eb = Option B — licence commerciale (d'Ashforde OÜ)

# text
seg-197bfc5a5166 = Si l'AGPL ne vous convient pas, Ashforde OÜ concédera le même moteur sous licence à des conditions commerciales. C'est le bon choix lorsque vous voulez :

# text
seg-6de2b04016e5 = <b>intégrer Kshana dans un produit propriétaire / à code source fermé</b> sans publier votre propre code source ;

# text
seg-e31db28c1e09 = <b>proposer un service en réseau</b> fondé sur un Kshana modifié <b>sans</b> l'obligation de divulgation du code source du §{ "13" } ;

# text
seg-9d3578395a59 = intégrer Kshana dans un système plus vaste dont les autres composants ne peuvent pas être sous AGPL (par exemple la chaîne d'outils propriétaire d'un maître d'œuvre) ; ou

# text
seg-99d049c650a3 = obtenir une garantie, une indemnisation ou des conditions de support que l'AGPL exclut expressément.

# text
seg-f68b536b93c0 = Une licence commerciale supprime les obligations de copyleft pour votre usage, aux conditions convenues. <b>Contact : <a1>contact@ashforde.org</a1>.</b>

# text
seg-55f1a2f687d9 = Pourquoi cette double licence

# text
seg-42c1ce05ca5c = L'objectif est d'être <b>vérifiable publiquement</b> (afin que tout relecteur puisse exécuter et auditer le moteur) <b>sans</b> laisser un concurrent bien doté dupliquer le moteur validé, le fermer et livrer un concurrent propriétaire qui ne rend rien. Le copyleft réseau de l'AGPL y parvient : un dérivé fermé ou hébergé doit revenir dans le libre — ou prendre une licence commerciale auprès de nous. La crédibilité publique et un noyau défendu, en même temps.

# text
seg-32b1d38914fe = Ce que cette double licence <b>ne couvre pas</b>

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
# c3: integrations/
seg-27636d757dba = <b>Le module d'extension natif d'OpenCPN</b> (<c1/>) est sous licence <b>GPL-3.0-or-later</b> (voir le fichier <c2/> de ce répertoire), et non AGPL-3.0, et n'est <b>pas</b> proposé sous la licence commerciale. Il est chargé dans OpenCPN et construit avec l'en-tête de son API de modules d'extension sous GPL-2.0-or-later, ce qui est la base habituelle des modules d'extension d'OpenCPN. Le reste de <c3/> (le module d'extension Signal K et le relais TCP d'OpenCPN) reste sous AGPL-3.0-only.

# text
seg-f90c983e0ee3 = <b>Kshana Pro</b> et les autres surcouches propriétaires sont des produits <b>distincts, à code source fermé</b>, sous leurs propres conditions commerciales. Ils ne font pas partie de ce dépôt et ne sont pas proposés sous l'AGPL.

# text
# c1: deny.toml
seg-e340445b7f17 = <b>Les dépendances</b> gardent leurs propres licences (permissives). Nous gardons délibérément l'arbre des dépendances permissif (Apache-2.0 / MIT / BSD / ISC / …) précisément pour que l'édition commerciale puisse être proposée proprement — une dépendance sous copyleft la contaminerait. Voir <a1><c1/></a1>.

# text
# c1: C7_E1B.txt
# c2: C8_E1C.txt
# c3: scripts/fetch_galileo_e1_codes.sh
# c4: KSHANA_GALILEO_E1B
# c5: KSHANA_GALILEO_E1C
# c6: src/iq/signals/galileo.rs
# c7: data/galileo-os-sis-icd/PROVENANCE.md
seg-810191f19d4d = <b>Codes de mémoire primaires de Galileo E1</b> (<c1/>, <c2/> ; <b>non fournis depuis { "0.36" }</b> : chaque utilisateur fournit sa propre copie, <c3/> ou <c4/> / <c5/>, lue par <c6/>). Ce sont les codes primaires E1-B et E1-C des annexes C.7 et C.8 du Galileo Open Service Signal-In-Space Interface Control Document (OS SIS ICD), édition { "2.0" }, janvier { "2021" }, © European Union { "2021" }, extraits sans modification des pièces jointes du PDF (l'URL source, le SHA-256 et un recoupement avec l'édition { "1.3" } se trouvent dans <a1><c7/></a1>). Ils ne sont <b>pas</b> couverts par l'AGPL-3.0 ni par la licence commerciale, et aucune des deux licences n'accorde quoi que ce soit à leur égard. Ce que dit l'ICD lui-même, cité d'après l'édition { "2.0" } :

# text
seg-daef032cbe43 = Conditions d'utilisation §{ "3" } : « Les informations contenues dans l'OS SIS ICD, y compris ses annexes, sont soumises à des droits de propriété intellectuelle ». « L'OS SIS ICD ne peut être reproduit et/ou transmis à un tiers, en tout ou en partie, que conformément à l'utilisation autorisée décrite ici et aux conditions suivantes : les présentes “Conditions d'utilisation et avis de non-responsabilité”, ainsi que les termes de l'annexe G, sont acceptés, reproduits et transmis intégralement et sans modification avec les informations reproduites et/ou transmises ; la mention de droit d'auteur “© European Union { "2021" }” n'est retirée d'aucune page. » Et : « L'utilisation des informations contenues dans l'OS SIS ICD, y compris les codes d'étalement soumis aux DPI, est autorisée aux conditions énoncées dans l'annexe G. »

# text
seg-0fb25fafd9a2 = L'annexe G (édition { "2.0" } ; annexe H dans l'édition { "2.1" }, même texte) définit les « données techniques de l'OS SIS ICD » comme comprenant les « codes de mémoire E1 et E5 », et accorde un engagement de non-revendication « non exclusif et libre de redevances » et « non transférable et non concédable en sous-licence ». Sa liste du §G.3, qu'elle qualifie d'exhaustive, couvre : « a) l'utilisation des données techniques de l'OS SIS ICD, y compris leur intégration et leur incorporation dans tout produit » ; « b) le stockage des données techniques de l'OS SIS ICD, à condition que la source soit mentionnée » ; « c) la reproduction de l'OS SIS ICD, en tout ou en partie, sa distribution et sa publication à des fins et à une échelle non commerciales et à but non lucratif, sans modifier le document ni y ajouter aucun élément » ; et « d) la fourniture de liens vers le site web de l'UE où le document est publié ». Les « produits » désignent les logiciels, dispositifs et services à valeur ajoutée « faisant usage du signal OS ». Elle dit aussi : « La personne autorisée ne doit pas déclarer ou laisser entendre, dans aucun matériel promotionnel ou ailleurs, que les produits ont été développés par l'UE, sont utilisés par elle ou pour elle, ou ont été approuvés ou soutenus par elle ».

# text
seg-8531368368ba = <b>Décision ({ "0.36" }) : non redistribué.</b> Aucune licence libre explicite n'est indiquée. L'utilisation à l'intérieur d'un produit logiciel (G.3 a) et le stockage avec mention de la source (G.3 b) sont couverts par les termes propres de l'ICD, mais la redistribution (G.3 c) seulement à des fins non commerciales et à but non lucratif, et avec les conditions d'utilisation et l'annexe G reproduites sans modification à ses côtés. Comme Kshana est aussi proposé sous licence commerciale, les fichiers ont été retirés du dépôt et de ses paquets ; le moteur lit la copie de l'utilisateur à l'exécution, et sans elle les signaux Galileo E1 renvoient une erreur qui indique comment la fournir. Chaque utilisateur s'appuie directement sur l'autorisation de l'UE ; Kshana ne peut pas la transmettre. Kshana n'est ni développé par l'Union européenne, ni utilisé par elle, ni approuvé ni soutenu par elle.

# text
# c1: NOTICE
seg-e18986aeab7f = <b>Marques.</b> « Kshana » et ses marques sont des marques d'Ashforde OÜ. Aucune des deux licences n'accorde de droits sur le nom ou les marques ; les forks et les distributions dérivées doivent utiliser un autre nom. Voir <a1><c1/></a1>.

# text
seg-f6b7345c2c60 = Contributions

# text
# c1: CONTRIBUTING.md
seg-1709eb19c2c5 = Les contributions sont acceptées selon les conditions d'entrée des contributeurs du projet, qui concèdent votre contribution sous licence AGPL <b>et</b> accordent à Ashforde OÜ le droit de l'inclure dans l'édition sous licence commerciale (afin que la double licence continue de fonctionner). Voir <a1><c1/></a1>.

# text
seg-940c8cce5137 = Questions

# text
seg-e678f2ecc571 = Questions de licence, devis commerciaux et « quelle option s'applique à nous ? » → <b><a1>contact@ashforde.org</a1></b>.

# text
seg-05d34a27a0ba = <s1>Précédent</s1>Journal des modifications

# text
seg-4f7f660eea0a = <s1>Suivant</s1>Sécurité

# text
seg-2d2b32369c30 = Ce que cette double licence ne couvre pas
