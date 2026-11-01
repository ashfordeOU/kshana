# docs--governance: translations (fr)

# text
# c1: GOVERNANCE.md
seg-26440a254ba8 = Source : <c1/>

# text
seg-5f8e9a4a15be = Gouvernance de Kshana

# text
seg-b20b74b77755 = Ce document énonce comment Kshana est gouverné : qui prend les décisions, comment, et ce que le projet absorbera ou n'absorbera pas. Il est délibérément <b>léger</b> — proportionné à la taille actuelle du projet — et honnête sur la réalité présente d'un seul mainteneur et sur la voie vers une gouvernance plus large à mesure que la communauté grandit.

# text
seg-1e0c276811e2 = Mission et périmètre

# text
# c1: docs/CAPABILITY.md
# c2: docs/VALIDATION.md
seg-5dcc38148cf4 = Kshana est une <b>référence neutre, reproductible et honnêtement validée pour la performance et la résilience du PNT hybride quantique/classique</b>. La mission fixe le niveau d'exigence de chaque décision : exactitude, citations et reproductibilité plutôt qu'étendue. Le périmètre honnête est documenté dans <a1><c1/></a1> et l'état de validation dans <a2><c2/></a2> ; les propositions sont pesées par rapport à ce périmètre, et non au nombre de fonctionnalités.

# text
seg-d331a1cfc60b = Rôles

# text
# c1: contact@ashforde.org
seg-88bb2a831125 = <b>Mainteneur.</b> Kshana est actuellement maintenu par son fondateur, Ashforde OÜ (contact : <c1/>). Le mainteneur est le décideur final pour le périmètre, la conception, les versions et ce qui est fusionné. C'est un modèle de mainteneur bienveillant, énoncé simplement plutôt que déguisé en un comité qui n'existe pas.

# text
# c1: CONTRIBUTING.md
seg-8e1da46f9b0b = <b>Contributeurs.</b> Toute personne qui ouvre un ticket ou une pull request. Les contributions sont jugées selon le niveau d'exigence de <a1><c1/></a1> — une provenance pour chaque paramètre numérique, une validation par rapport à une relation publiée, et de l'honnêteté sur la maturité.

# text
seg-d212e17ac218 = <b>Futurs committers.</b> Lorsqu'une contribution soutenue et de grande qualité le justifiera, des droits de commit seront étendus à des contributeurs de confiance, et ce document sera mis à jour vers un modèle multi-mainteneurs (décisions par consensus tacite, le groupe de mainteneurs tranchant les désaccords). D'ici là, la voie est : contribuer, se construire un historique et être invité.

# text
seg-91e3f1919016 = Comment les décisions sont prises

# text
seg-0d45899c92f4 = <b>Discussion en public.</b> Les changements de fond commencent par un ticket GitHub afin que la justification, les alternatives et les compromis soient consignés.

# text
seg-88916dd2357b = <b>Consensus tacite.</b> Une proposition sans objection soutenue après un délai raisonnable, et qui franchit le seuil technique ci-dessous, avance.

# text
seg-788566515dad = <b>Le mainteneur tranche en cas de désaccord.</b> Lorsqu'aucun consensus n'est atteint, le mainteneur décide et consigne la raison. Le désaccord est résolu par la mission et le seuil technique, non par l'ancienneté ni le volume.

# text
seg-e45e1b565e62 = Le seuil technique (non négociable)

# text
seg-2c397872e2f5 = Ce sont des invariants stricts, appliqués par l'intégration continue et la relecture, qu'aucune décision n'outrepasse :

# text
# c1: (scenario, seed, engine_version)
seg-70cb5a174c2f = <c1/> doit reproduire une exécution bit à bit. Un changement qui la rend non déterministe est un défaut, pas une fonctionnalité.

# text
seg-b8733ea97546 = <b>Provenance.</b> Aucune constante numérique anonyme — chaque paramètre cite une source.

# text
# c1: validated
# c2: modelled
# c3: not modeled
# c4: src/verification.rs
seg-55a09b775418 = <b>Honnêteté de la validation.</b> Chaque capacité est étiquetée <c1/> (par rapport à une référence indépendante) ou <c2/> / <c3/>. Rien n'est affirmé au-delà de ses preuves. Voir la matrice vérifiée par machine dans <c4/>.

# text
# c1: scripts/check-no-attribution.sh
seg-dd339a396698 = <b>Hygiène.</b> Aucune attribution à un outil automatisé nulle part dans les commits, le contenu ou l'historique (appliqué par <c1/>).

# text
seg-45733fea1709 = Un changement qui ne peut pas franchir le seuil est refusé, aussi utile soit-il.

# text
seg-3eb0831d99a2 = La frontière ouvert / fermé

# text
# c1: LICENSING.md
seg-ca7730a3d518 = Kshana est <b>open-core</b>. Ce dépôt est, et reste, le moteur AGPL-3.0 ouvert complet — la référence neutre, sous double licence commerciale par Ashforde OÜ (voir <a1><c1/></a1>). Le projet n'acceptera <b>pas</b> dans le dépôt ouvert :

# text
# c1: CONTRIBUTING.md
seg-8c2a89a3a4e2 = <b>Profondeur soumise au contrôle des exportations ou à double usage</b> — de véritables bibliothèques de menaces, des formes d'onde adverses, ou des paramètres de performance anti-brouillage/anti-leurrage. Le dépôt public s'en tient à des modèles et méthodes génériques et publiés (voir <c1/> → Contrôle des exportations). En cas de doute, demandez <em>avant</em> de contribuer.

# text
seg-6df31d37cfe4 = Des données ou un étalonnage confidentiels d'un client ou d'un partenaire.

# text
# c1: deny.toml
seg-b3b4a5384199 = <b>Des <em>dépendances</em> à copyleft (GPL/AGPL/LGPL/MPL)</b> — non pas parce qu'elles entrent en conflit avec la propre licence AGPL du moteur (ce n'est pas le cas), mais parce qu'elles ne peuvent pas être relicenciées dans l'édition <b>commerciale</b> : nous ne pouvons vendre une licence commerciale que sur du code que nous possédons ou qui est permissif. Une dépendance à copyleft contaminerait l'édition commerciale et briserait la double licence. Les dépendances restent donc permissives (Apache/MIT/BSD/ISC), ce qu'applique <a1><c1/></a1>.

# text
seg-ce264f3e43fe = À l'inverse, le projet ne videra <b>pas</b> le noyau ouvert pour pousser de la valeur propriétaire : le moteur validé, les ancrages de validation publics, le registre d'honnêteté, le format d'échange/standard et les canaux de distribution restent ouverts. Affamer le noyau ouvert est la seule erreur fatale de l'open-core, et elle est exclue.

# text
seg-947b3e9b1b2d = Versions

# text
# c1: src/interchange.rs::SCHEMA_VERSION
seg-73e2bca0310d = <b>Gestion sémantique de version.</b> Avant la 1.0, le schéma de scénario/résultat peut changer ; les changements incompatibles sont signalés, et la version du schéma d'échange (<c1/>) est la source unique de vérité pour la compatibilité des artefacts.

# text
# c1: cargo publish
# c2: CONTRIBUTING.md
seg-71cace8b6144 = <b>Autorité de publication.</b> La publication (par ex. <c1/>) est une étape manuelle du mainteneur exigeant un jeton de registre. L'intégration continue et le workflow de publication déclenché par étiquette ne publient <b>jamais</b> automatiquement vers des registres externes — ils se contentent de ré-exécuter tous les contrôles et de joindre un artefact de construction. Voir <c2/> → Commits et gestion de version.

# text
seg-59c37ffa54f0 = Code de conduite et sécurité

# text
# c1: CODE_OF_CONDUCT.md
seg-2dc8c12568bc = La conduite est régie par <a1><c1/></a1>.

# text
# c1: SECURITY.md
seg-8574b73edbbc = Les problèmes de sécurité suivent le processus de divulgation privée de <a1><c1/></a1> — n'ouvrez pas de ticket public pour une vulnérabilité.

# text
seg-d86d4e609713 = Marque

# text
seg-cb1314b67b2f = Le nom et le logo Kshana sont des marques d'Ashforde OÜ. La licence (AGPL-3.0, ou une licence commerciale) couvre le <b>code</b>, et non les marques : un fork peut utiliser le code sous la licence, mais pas le nom Kshana ni l'identité de distribution canonique. Cela maintient Ashforde comme source de vérité citée et fait partie de la manière dont le noyau ouvert reste une référence neutre.

# text
seg-a678f6ed1af8 = Modifier ce document

# text
seg-db90122245fa = Les changements de gouvernance sont eux-mêmes proposés sous forme de pull request et décidés selon le processus ci-dessus. À mesure que l'échelle du projet change, attendez-vous à ce que ce document se dote d'un modèle de décision multi-mainteneurs ; il ne réduira pas le seuil technique.

# text
seg-0a0712cca2e7 = Léger par conception. Honnête sur aujourd'hui, avec une voie énoncée pour demain.

# text
seg-4bfa7cf23a41 = <s1>Précédent</s1>Contribuer

# text
seg-f67113e34738 = <s1>Suivant</s1>Code de conduite
