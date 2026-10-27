# docs--mcp-http: translations (fr)

# text
# c1: docs/deploy/mcp-http.md
seg-c8bab9114d57 = Source : <c1/>

# text
seg-4bd138b7d28a = Exécuter kshana-mcp via HTTP (auto-hébergé)

# text
seg-7ca89d6e0201 = Un passage nommant des clients d'IA tiers est omis ici ; il figure dans <a1>docs/deploy/mcp-http.md</a1> sur GitHub.

# text
# c1: kshana
seg-2f5b3bdb7d0b = <b>Kshana n'héberge aucun point d'accès.</b> Il n'existe aucun serveur <c1/> partagé vers lequel diriger un client. Vous l'exécutez sur votre propre machine, conteneur ou projet cloud, et vous en possédez le contrôle d'accès et le coût. Le serveur { $version } est celui de ce dépôt : ses chiffres portent leurs libellés VALIDATED ou MODELLED exactement comme via stdio.

# text
seg-113a79ece785 = Les valeurs par défaut sûres

# text
seg-2bdbe06123c8 = Contrôle

# text
seg-640f28207e8a = Comportement

# text
seg-9bc8fe53a948 = Adresse de liaison

# text
# c1: 127.0.0.1
# c2: ::1
# c3: --http 8080
# c4: 127.0.0.1:8080
seg-82001913f285 = Bouclage local seulement (<c1/>, <c2/>). Un port seul (<c3/>) signifie <c4/>.

# text
# c1: --allow-remote
# c2: KSHANA_MCP_HTTP_TOKEN
seg-f2adda2d3e22 = Exige <c1/> <b>et</b> un jeton porteur dans la variable d'environnement <c2/> ({ "16" } caractères ou plus). Sans les deux, le serveur refuse de démarrer. Avec les deux, il affiche un avertissement indiquant qu'il écoute au-delà de cette machine.

# text
seg-6fbe07565c36 = Authentification

# text
# c1: Authorization: Bearer <token>
# c2: 401
seg-d5cbeb0cd3d6 = <c1/> à chaque requête lorsqu'un jeton est défini (il peut aussi l'être sur le bouclage local). Comparé en temps constant. Absent ou erroné : <c2/>.

# text
seg-1962f434458b = Système de fichiers

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-1a9e048d348d = Aucun. Les outils de fichiers IQ (<c1/>) sont désactivés en mode HTTP quoi que dise <c2/> ; tout autre outil prend son scénario en ligne et refuse un scénario qui nomme un fichier. Aucun argument d'outil ne lit ni n'écrit un chemin.

# text
seg-19261cdd2ef0 = Taille du corps

# text
# c1: --max-body-bytes
# c2: 413
seg-c4db8c1454f4 = <c1/>, par défaut { "5" } Mio (le plafond d'un scénario est de { "4" } Mio). Au-delà : <c2/>, que la longueur soit déclarée ou que le corps soit fragmenté.

# text
seg-da9103d627dd = Délai de réponse

# text
# c1: --request-timeout-secs
# c2: 408
# c3: 408
seg-3f013a632773 = <c1/>, par défaut { "120" }. Au-delà : <c2/>. <b>Cela borne la durée pendant laquelle un appelant attend, non le travail</b> : une exécution déjà en cours ne peut pas être arrêtée, elle se poursuit donc après le <c3/> et se termine en arrière-plan.

# text
seg-a588b12596b7 = Concurrence

# text
# c1: --max-concurrent
# c2: 503
# c3: Retry-After
seg-aa2214db3bdc = <c1/>, par défaut { "8" }. Au-delà, une requête reçoit aussitôt <c2/> avec <c3/> ; aucune n'est mise en file.

# text
seg-87576ded5272 = Réserve de travail

# text
# c1: --max-concurrent
seg-7f9c63e3e5e6 = Chaque appel d'outil s'exécute sur un fil bloquant dans une réserve de <c1/> emplacements, jamais sur les travailleurs asynchrones, de sorte qu'une longue exécution ne peut pas empêcher le serveur de répondre. Un emplacement n'est libéré que lorsque l'exécution elle-même se termine, non lorsque l'appelant abandonne : les exécutions abandonnées ne peuvent donc pas s'accumuler au-delà de la taille de la réserve, et un appel qui trouve la réserve pleine est refusé comme occupé.

# text
seg-4a97b035483c = Budget de travail

# text
# c1: runs
# c2: kshana
seg-91c788b33b25 = Un scénario qui demande bien plus que les exemples fournis est refusé avant son exécution : plus de { "1000" } réalisations Monte Carlo (<c1/>), une grille de paramètres de plus de { "1000" } nœuds, plus de { "5000" } exécutions membres (nœuds de grille multipliés par réalisations), ou une grille temporelle de plus de { "2" } millions d'époques. L'erreur nomme le champ à diminuer. Le même budget s'applique via stdio ; la ligne de commande <c2/> n'en a aucun.

# text
seg-79c6b146637c = CORS

# text
# c1: Access-Control-*
# c2: Origin
# c3: 403
# c4: --allow-origin <scheme://host[:port]>
# c5: *
seg-68fa7d9f1321 = Aucun en-tête <c1/> n'est jamais envoyé. Une requête portant un en-tête <c2/> est refusée (<c3/>) à moins d'être nommée avec <c4/> ; <c5/> n'est pas accepté.

# text
seg-d7f157fdf003 = En-tête Host

# text
# c1: --allowed-host
# c2: --allowed-host your.domain
# c3: 403
seg-d7966e93ef1a = Vérifié par rapport aux noms de bouclage, ou à l'adresse de liaison plus chaque <c1/>. Derrière un proxy ou sur une URL de plateforme, passez <c2/>. Tout le reste : <c3/>.

# text
seg-12d5cf72f363 = Sessions

# text
seg-58dfe5665877 = Aucune. Chaque POST reçoit une réponse JSON ; aucune table de sessions et aucun flux d'événements envoyés par le serveur n'est gardé ouvert.

# text
# c1: kshana-mcp
seg-adbc92ebc196 = Le TLS n'est pas terminé par <c1/>. Lorsqu'il est joignable au-delà d'une seule machine, placez HTTPS devant (le TLS de votre plateforme, ou un proxy inverse) et gardez le jeton secret ; un jeton porteur sur HTTP en clair peut être lu sur le réseau.

# text
seg-1b21740b9c63 = Local

# text
seg-a6194f5a52f8 = Configuration du client (un client par URL ; n'ajoutez l'en-tête que si un jeton est défini) :

# text
seg-a683980168f7 = Docker

# text
# c1: 0.0.0.0
# c2: --allow-remote
# c3: 127.0.0.1:8080:8080
# c4: 127.0.0.1:
# c5: docker compose
# c6: mcp-http/
seg-81df4f5cd02e = À l'intérieur du conteneur, le serveur doit écouter sur <c1/>, il lui faut donc <c2/> et le jeton. Publier le port sous la forme <c3/> le garde sur votre machine ; ne retirez le <c4/> que si vous voulez l'exposer, et terminez alors le TLS devant. Des modèles pour <c5/>, Fly.io et Cloud Run se trouvent dans <a1><c6/></a1>.

# text
seg-8b8bef7174e8 = Modèles (vous les déployez ; Kshana n'en exécute aucun)

# text
# c1: mcp-http/fly.toml
# c2: fly secrets set KSHANA_MCP_HTTP_TOKEN=...
seg-198bea1e0595 = <a1><c1/></a1> : définissez le jeton avec <c2/>

# text
# c1: mcp-http/cloudrun.service.yaml
seg-c33701cb9ca2 = <a1><c1/></a1> : prenez le jeton dans Secret Manager

# text
# c1: --allowed-host
seg-b86ddb72b916 = Chacun exécute l'image publiée, règle <c1/> sur le nom d'hôte de la plateforme que vous remplacez dans le fichier, et s'appuie sur la plateforme pour HTTPS.

# text
seg-ce3a5326cb95 = Fixez une limite de CPU et de mémoire sur la plateforme

# text
# c1: cpus
# c2: mem_limit
# c3: [[vm]]
# c4: resources.limits
# c5: --max-concurrent
seg-e1fc13672597 = Le délai, la réserve et le budget bornent la quantité de travail admise, mais un appel admis peut encore occuper un cœur pendant longtemps et un gros résultat peut utiliser des centaines de mégaoctets. Mettez aussi une limite stricte sur le conteneur : les modèles demandent { "2" } CPU et { "1" } Gio (<c1/> et <c2/> dans Compose, <c3/> dans Fly, <c4/> dans Cloud Run). Gardez <c5/> à la valeur du nombre de CPU ou en dessous.

# text
seg-058781b052c4 = Ce que ce n'est pas

# text
seg-90edc7ff2a55 = Pas un service multilocataire. Quiconque détient le jeton exécute des simulations sur votre matériel ; il n'y a pas de quotas par utilisateur au-delà des limites ci-dessus.

# text
seg-5b3b9c610f31 = À titre consultatif, et non un équipement de navigation homologué : l'opérateur reste responsable de la navigation. Les sorties du simulateur sont des chiffres modélisés ou validés destinés à l'analyse, comme partout ailleurs dans Kshana.

# text
seg-c33947d44b06 = <s1>Précédent</s1>Serveur MCP : tous les canaux d'installation

# text
seg-a9d67efe493a = <s1>Suivant</s1>Utiliser Kshana depuis un agent
