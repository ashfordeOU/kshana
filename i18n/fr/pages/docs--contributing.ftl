# docs--contributing: translations (fr)

# text
seg-c3c260b7063e = Tests

# text
# c1: CONTRIBUTING.md
seg-5dce5694e6ec = Source : <c1/>

# text
seg-3fa173b79e8f = Contribuer à Kshana

# text
seg-c3a47c614836 = Merci de votre intérêt. Kshana vise à être une référence <b>neutre, reproductible et honnêtement validée</b> pour le PNT hybride quantique/classique. Les contributions sont soumises à cette exigence : l'exactitude, les citations et la reproductibilité passent avant l'étendue.

# text
# c1: GOVERNANCE.md
seg-5a82a55f7fb2 = La manière dont le projet est gouverné (qui décide, l'exigence technique, et la frontière entre ouvert et fermé) est documentée dans <a1><c1/></a1>.

# text
seg-cc8491af7a6f = Développement

# text
seg-0163ccdfaa2b = Les liaisons de langage facultatives sont conditionnées par des fonctionnalités et désactivées par défaut (de sorte que la construction ci-dessus et la porte d'audit des dépendances ne les touchent jamais). Pour travailler dessus :

# text
seg-edc8bbab6e92 = Avant chaque commit : la boucle rapide

# text
# c1: ci.yml
# c2: check
seg-6a7eda7d82b7 = Elles prennent quelques secondes. Elles forment un sous-ensemble du job <c2/> de <c1/>, dans le même ordre, de sorte qu'un échec ici est un échec là-bas :

# text
# c1: (scenario, seed, version)
seg-d62c1fe22fc4 = <b>La reproductibilité est un invariant strict.</b> Un changement qui rend <c1/> non déterministe est un bogue. L'aléa doit passer par le générateur aléatoire avec graine ; les exécutions quantiques et classiques utilisent des graines indépendantes, dérivées de façon déterministe.

# text
seg-66ea0748c10f = <b>Hygiène du dépôt.</b> Les commits et le contenu ne doivent comporter aucune mention d'attribution à un outil automatisé en fin de message ou en pied de page, et ne doivent nommer un assistant d'IA comme auteur nulle part dans le contenu, les noms de fichiers ou l'historique. Le garde-fou l'impose.

# text
seg-fbf423f6fb31 = Avant de pousser : la porte complète

# text
# c1: scripts/gate.sh
# c2: cargo test --all
# c3: scripts/check-repeatability.sh
# c4: .gate-receipt.json
seg-a9176352d3b4 = <c1/> est la porte canonique : il exécute <c2/> en intégralité, puis <c3/> pour relancer la suite de la bibliothèque quelques fois de plus, car une condition de concurrence d'entrelacement de threads est invisible lors d'une seule exécution. Ce n'est qu'en cas de succès qu'il écrit <c4/> (non suivi par git : un état machine propre à une exécution, pas du contenu).

# text
# c1: scripts/gate.sh
seg-29815bd89ce2 = Elle est lente exprès, de 62 à 79 minutes à l'état stable sain, selon l'en-tête de <c1/>, qui porte la valeur actuelle, et il n'y a pas de délai d'expiration, parce qu'un délai assez court pour être utile interromprait une exécution saine. Une exécution partielle revenue au vert n'est pas une porte : les deux défauts pour lesquels ce mécanisme existe l'ont franchie de cette façon.

# text
# c1: gate.sh
seg-408da9a8b8bb = Les contributeurs qui travaillent depuis un fork n'ont pas besoin du crochet de reçu : c'est une porte locale de mainteneur, et <b>c'est la CI qui conditionne réellement une pull request</b>. Exécuter <c1/> avant d'en ouvrir une signifie simplement que la CI ne vous apprend rien que vous ne sachiez déjà.

# text
seg-9394727b21c3 = Ajouter ou modifier un modèle de capteur

# text
# c1: provenance
seg-d9c891ca6827 = <b>Chaque paramètre numérique exige une provenance.</b> Mettez la citation dans la chaîne <c1/> du modèle et dans le fichier de scénario. Aucune constante anonyme.

# text
seg-d30cb836d4c4 = <b>Validez par rapport à la relation standard,</b> et pas seulement par cohérence interne : par exemple l'écart-type d'Allan pour les horloges, la croissance d'erreur d'estime de Groves pour l'inertiel, la conversion synchronisation temporelle→télémétrie pour le transfert de temps. Ajoutez un test montrant que la sortie simulée reproduit la valeur publiée/de la relation dans une tolérance indiquée.

# text
# c1: src/verification.rs::verification_matrix()
# c2: Modelled
# c3: cargo run --bin gen_validation_artifacts
# c4: docs/VERIFICATION-MATRIX.md
# c5: docs/MODELLED-RATIONALE.md
# c6: web/data/verification-matrix.json
# c7: docs/VALIDATION.md
seg-b52dd0dd550e = <b>Soyez honnête sur la maturité.</b> Le registre d'état est <c1/> : ajoutez ou modifiez la ligne là-bas, nommez sa référence externe indépendante (ou dites clairement qu'il n'y en a pas, ce qui la rend <c2/>), puis régénérez les artefacts publiés avec <c3/>. <c4/>, <c5/> et <c6/> sont tous générés à partir de cette fonction et disent « ne pas modifier à la main » pour une raison. Mettez aussi à jour le récit de <c7/> lorsque le texte l'exige, et étiquetez comme tels les chiffres qui sont des cibles ou des résultats de démonstrateur au sol.

# text
seg-34b9c8b6f70c = Piloté par les tests : écrivez d'abord le test qui échoue, avec la valeur attendue <b>dérivée à la main</b> de la physique/de la relation avant d'implémenter.

# text
seg-5322d5b2188c = Les tests déterministes vérifient des valeurs exactes (dérivées à la main) ; les tests statistiques vérifient une tolérance indiquée et, idéalement, moyennent sur les graines pour maîtriser la dispersion.

# text
seg-7f76a26c4d5f = Commits et gestion des versions

# text
# c1: feat:
# c2: fix:
# c3: docs:
# c4: test:
# c5: chore:
seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

# text
seg-1a13616ca0ac = <b>Semantic Versioning.</b> Avant la 1.0, le schéma des scénarios/résultats peut changer ; signalez les changements incompatibles.

# text
# c1: vX.Y.Z
# c2: main
# c3: cargo publish
# c4: docs/RELEASING.md
seg-0e3036c27aa8 = <b>Les versions sont produites par une étiquette <c1/>, et la publication est automatique mais ordonnée.</b> Le workflow Auto-tag pousse l'étiquette une fois la CI au vert sur <c2/> lors d'un changement de version. Le workflow Release exécute la vérification complète sur le commit étiqueté, et ce n'est que lorsqu'elle réussit qu'il publie sur crates.io, le Python Package Index (PyPI), npm, ghcr.io, le registre du Model Context Protocol (MCP) et la JetBrains Marketplace ; il vérifie ensuite que chaque canal sert la version et reconstruit kshana.dev à partir de l'étiquette. Personne n'exécute <c3/> à la main. Les étapes, et la façon de relancer une publication échouée, figurent dans <a1><c4/></a1>.

# text
seg-18ca89a2c573 = Tenue du journal des modifications (obligatoire)

# text
# c1: CHANGELOG.md
seg-1f7e1d73c2ef = Chaque changement visible par l'utilisateur met à jour <a1><c1/></a1> :

# text
# c1: [Unreleased]
# c2: Added
# c3: Changed
# c4: Fixed
# c5: Removed
# c6: Documented
# c7: Planned
seg-1448e96afbbc = Ajoutez une entrée dans la section <b><c1/></b>, dans le bon groupe (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

# text
# c1: [Unreleased]
# c2: [x.y.z] - YYYY-MM-DD
# c3: [Unreleased]
# c4: version
# c5: Cargo.toml
# c6: engine_version
# c7: vx.y.z
seg-76ddc53c752e = Lors d'une version, renommez <c1/> en le nouveau <c2/>, démarrez un nouveau <c3/>, incrémentez la <c4/> dans <c5/> (afin que <c6/> dans le JSON des résultats corresponde), mettez à jour les liens de comparaison en bas, et étiquetez <c7/>.

# text
seg-ed680e59377c = Gardez les entrées concises et orientées utilisateur ; liez les tickets/PR lorsque c'est utile.

# text
seg-fe83216ebeed = Une pull request qui change le comportement sans entrée dans le journal des modifications est incomplète.

# text
seg-776cd2ef0b0c = Contrôle des exportations

# text
seg-d0f1db9798a6 = La résilience PNT et la détection quantique peuvent relever des contrôles d'exportation des biens à double usage. Cantonnez le dépôt public à des modèles et méthodes génériques et publiés. Tout ce qui ressemble à une profondeur de résilience/anti-leurrage sensible à l'exportation relève de la couche privée, pas d'ici. En cas de doute, demandez avant de le contribuer.

# text
seg-506a29aafc12 = Licence

# text
# c1: LICENSING.md
seg-c0409a1226ca = Kshana est sous double licence (AGPL-3.0 <b>ou</b> une licence commerciale d'Ashforde OÜ ; voir <a1><c1/></a1>). Pour que cela continue de fonctionner, les contributions doivent être utilisables sous <b>les deux</b> licences. Ainsi, en contribuant, vous acceptez que :

# text
seg-da7b02ac890c = votre contribution soit licenciée en entrée sous l'<b>AGPL-3.0-only</b> ; et

# text
seg-8d6ed0d3a17f = vous <b>accordiez aussi à Ashforde OÜ</b> une licence perpétuelle, mondiale, libre de redevances et irrévocable d'utiliser, de modifier et de <b>relicencier votre contribution au sein de l'édition de Kshana sous licence commerciale</b> (c'est-à-dire de la distribuer aussi sous des conditions commerciales non AGPL). Vous conservez le droit d'auteur sur votre contribution.

# text
seg-3b1a0dd6b5aa = Cette cession de double licence allégée, et non une cession de droit d'auteur, est ce qui permet au projet de rester ouvert <em>et</em> de proposer une édition commerciale. Si vous ne pouvez pas accorder ({ "2" }) (par exemple pour du code appartenant à un employeur), dites-le dans votre pull request avant de contribuer.

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
seg-6630d0ac4ad5 = <b>Exception : <c1/>.</b> Ce répertoire est sous licence <b>GPL-3.0-or-later</b> (voir son <c2/>) et est en dehors de la licence commerciale. Les contributions qui y sont apportées sont licenciées en entrée sous GPL-3.0-or-later <b>seulement</b> ; l'octroi ({ "2" }) ne s'y applique pas.

# text
# c1: git commit -s
# c2: Signed-off-by
seg-0a78a12b1188 = Signez chaque commit pour attester le <a1>Developer Certificate of Origin</a1> : <c1/> (ajoute une ligne <c2/>).

# text
seg-9f86d8f58b17 = <s1>Précédent</s1>Sécurité

# text
seg-fc760238e9a5 = <s1>Suivant</s1>Gouvernance
