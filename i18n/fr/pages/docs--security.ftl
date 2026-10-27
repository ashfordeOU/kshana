# docs--security: translations (fr)

# text
seg-4609cf7fb790 = Politique de sécurité

# text
# c1: SECURITY.md
seg-ff991a587e4b = Source : <c1/>

# text
seg-7315b27c34f8 = Signaler une vulnérabilité

# text
seg-2f06a8b277b7 = Signalez-la en privé, par l'une ou l'autre de ces voies :

# text
seg-31999fe1b838 = <b>Signalement privé de vulnérabilité de GitHub</b> — le bouton <em>Report a vulnerability</em> de l'<a1>onglet Security</a1> du dépôt. Le signalement n'est visible que des mainteneurs, et un correctif peut être préparé dans un fork privé puis publié sous forme d'avis de sécurité GitHub (GitHub Security Advisory).

# text
seg-7bdcc2ffe39e = <b>E-mail</b> — <b><a1>contact@ashforde.org</a1></b>, avec les détails et les étapes de reproduction.

# text
seg-fbc3db22c061 = Merci de ne pas ouvrir de ticket public pour les signalements sensibles du point de vue de la sécurité. Nous visons un accusé de réception sous quelques jours ouvrés.

# text
seg-4c11dabdd8f6 = Versions prises en charge

# text
seg-19c99cf3a67e = Avant la 1.0 : seule la dernière version publiée (étiquetée) est prise en charge.

# text
seg-1379eab9a8e3 = Sûreté mémoire

# text
# c1: #![forbid(unsafe_code)]
# c2: src/lib.rs
# c3: unsafe
# c4: cfg
# c5: --features python
# c6: --features wasm
seg-cf966fa35408 = La crate de bibliothèque déclare <c1/> à sa racine (<c2/>) ; ainsi, tout bloc <c3/>, fn, impl ou extern n'importe où dans la bibliothèque est une erreur de compilation, et non quelque chose qu'un relecteur doit repérer. L'attribut n'est pas placé derrière un <c4/> : il s'applique donc à toutes les configurations dans lesquelles la bibliothèque est livrée, et les trois compilent sans erreur sous son régime : la compilation Rust par défaut, le module d'extension Python (<c5/>) et le module WebAssembly (<c6/>).

# text
# c1: forbid
seg-3f9e707e7d0b = Portée, énoncée précisément, car <c1/> s'applique par crate :

# text
# c1: src/main.rs
# c2: src/bin/
# c3: kshana-mcp
# c4: xval/
# c5: unsafe
seg-e7e22e711c53 = Il ne régit que la crate de bibliothèque. Le binaire CLI (<c1/>), les binaires auxiliaires sous <c2/>, la crate <c3/> publiée séparément et les crates de validation croisée <c4/> exclues de l'espace de travail sont des racines de crate distinctes et ne sont pas couverts. Aucun d'eux ne contient <c5/> aujourd'hui, mais c'est une discipline, et non une propriété imposée par le compilateur.

# text
# c1: cargo deny check advisories licenses bans sources
seg-b8f1e374d873 = Il ne dit rien des dépendances. Celles-ci sont contrôlées séparément par <c1/> dans l'intégration continue — pour la crate racine et, dans une tâche à part, pour la crate du serveur MCP exclue de l'espace de travail — et surveillées par les alertes et les mises à jour de sécurité de Dependabot sur le dépôt.

# text
seg-df3008a05522 = Note sur le contrôle des exportations et le double usage

# text
seg-0782e60d11fa = La résilience PNT et la détection quantique peuvent relever des contrôles d'exportation des biens à double usage. Ce dépôt public se limite à des modèles et des méthodes génériques et publiés. N'y apportez pas de détail sensible du point de vue des exportations sur la résilience ou l'anti-leurrage ; il relève d'une surcouche privée. En cas de doute, écrivez d'abord par e-mail.

# text
seg-f6bb0582f6f2 = <s1>Précédent</s1>Licences

# text
seg-834cbd4e96d3 = <s1>Suivant</s1>Contribuer
