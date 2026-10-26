# docs--marine-integrations: translations (fr)

# text
seg-2e34ace70d11 = Module d'extension Signal K

# text
seg-0857a94a948e = Limites

# text
seg-2247a2344710 = Signification

# text
seg-c3c260b7063e = Tests

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-ab1af8b3d968 = voir ci-dessus

# text
seg-c353e7bec219 = Clé

# text
seg-df52127d74b6 = Où

# text
seg-7670cf4ceda3 = Valeur par défaut

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7e304f816037 = Source : <c1/>

# text
seg-fb2b0841a172 = Intégrations maritimes : le score de confiance à la passerelle

# text
# c1: MARITIME-TRUST.md
seg-a88b3968c706 = Le score de confiance maritime de Kshana (<a1><c1/></a1>) est accessible depuis des logiciels que les plaisanciers utilisent déjà : un module d'extension de serveur <b>Signal K</b> et <b>OpenCPN</b> via du NMEA en mode barrière sur TCP. Une construction de référence l'installe sur un petit ordinateur à côté du récepteur.

# text
seg-eb8043b9e269 = <b>Logiciel à titre consultatif.</b> Kshana n'est pas un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) et n'a été évalué par rapport à aucune norme de performance. Tout ce qui figure sur cette page est une aide au jugement du navigateur. L'opérateur reste responsable de la sécurité de la navigation du navire et de toute décision de s'appuyer, ou de cesser de s'appuyer, sur un point de position. Rien ici n'émet, et rien ici ne rend un point de position plus précis.

# text
seg-dab66f260e56 = Élément

# text
seg-40fd2019e974 = État dans { "0.35" }

# text
seg-7bcecf49199c = livré, testé unitairement sur une sortie synthétique enregistrée ; non publié sur npm

# text
seg-d5278e683d37 = OpenCPN via du NMEA en mode barrière sur TCP

# text
seg-a876f5d43e39 = livré et testé (rejeu côté consommateur) ; l'interface utilisateur d'OpenCPN elle-même n'est pilotée par aucun test

# text
seg-4a6d2f45b403 = Module d'extension natif OpenCPN à panneau de score

# text
# c1: integrations/opencpn/evidence/
seg-b0d4d32612e9 = construit, logique testée unitairement, et exécuté dans OpenCPN { "5.8.4" } sous un affichage virtuel (preuves dans <c1/>) ; non empaqueté pour le gestionnaire de modules d'extension ; ne sera livré qu'après relecture

# text
seg-2e0058b5e057 = Construction de référence

# text
seg-959d93e3a56d = pièces, étapes du système d'exploitation, unités systemd (vérifiées à blanc), une option conteneur ; non testé sur un navire

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: MARITIME-TRUST.md
# c4: integrations/signalk/lib/adapter.js
seg-8524cb32f0a3 = Tout cela lit une seule chose : la sortie de <c1/> (lignes JSON, la phrase <c2/>, la barrière). Les formats de transmission sont décrits dans <a1><c3/></a1>. Le module d'extension Signal K conserve ce qu'il en sait dans un seul fichier, <c4/> ; un changement de format est une modification d'un seul fichier.

# text
# c1: signalk-server
# c2: integrations/signalk/
# c3: node_modules
# c4: ~/.signalk/node_modules/signalk-kshana-trust
seg-e5b08ab63d78 = Aucune dépendance npm. Le module d'extension lui-même fonctionne sous Node { "18" } ou plus récent ; les versions actuelles de <c1/> exigent Node { "22" } ou plus récent, de sorte qu'en pratique il faut utiliser { "22" }. Copiez ou liez <c2/> dans le <c3/> du serveur (par exemple <c4/>), redémarrez le serveur et activez <b>Kshana GNSS trust</b> sous Server, Plugin Config.

# text
# c1: source
seg-fd80525d7dd1 = D'où viennent les époques (<c1/>)

# text
seg-013478c9a701 = Ce que fait le module d'extension

# text
# c1: spawn-signalk-nmea
seg-abbd00e9cacf = <c1/> (par défaut)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: nmea0183
# c3: spawn-args
# c4: --tcp
# c5: tcp-pksht
seg-8ca5f95ed09d = Exécute <c1/> et écrit sur son entrée standard chaque phrase NMEA { "0183" } brute que le serveur reçoit (l'événement <c2/> du serveur). Le relance, avec temporisation croissante, s'il se termine | <b>Ne l'utilisez que sur un serveur à source NMEA unique</b> : il transmet chaque phrase de chaque fournisseur, entrelacées, de sorte qu'un second récepteur GNSS ou l'AIS apparaît comme un récepteur dont la position saute et peut être noté comme leurrage. Avec plus d'une source, utilisez <c3/> avec le flux <c4/> propre à ce récepteur, ou <c5/> depuis une barrière.

# text
# c1: kshana receiver-trust live <sessionFile> <inputArgs...>
# c2: ["--tcp","192.0.2.10:10110"]
# c3: ["--udp","10110"]
seg-3b3eadcffb90 = Exécute <c1/>, par exemple <c2/> ou <c3/>

# text
# c1: kshana
# c2: integrations/opencpn/
seg-d69b5ebe1042 = Se connecte à un flux des lignes JSON que <c1/> écrit (par exemple depuis le relais de <c2/>)

# text
# c1: $PKSHT
seg-cd5a419844cc = Se connecte à un flux NMEA (tel que la sortie de la barrière du service ou du conteneur de la construction de référence, port { "10110" }) et ne lit que ses phrases <c1/>

# text
# c1: calibration_s
seg-f17c9b7d7abc = Un flux déjà leurré au moment où le moniteur s'y connecte pour la première fois n'a pas de référence de base saine (les <c1/> premières secondes ne sont jamais notées). Démarrez-le avant la traversée.

# text
seg-33fc47100aa6 = Chemins publiés

# text
# c1: kshana-trust
seg-f032afe8b331 = Chaque époque met à jour (source <c1/>) :

# text
seg-b809eaf502ad = Chemin

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> ou <c4/>

# text
# c1: null
seg-d4d4d5d5ec1f = { "0" } à { "100" }, ou <c1/> pendant l'étalonnage

# text
# c1: [{monitor, points}]
seg-5280497b5d9f = <c1/>, le plus important en premier : quels contrôles ont réduit le score

# text
seg-6089a3166c91 = les moniteurs actuellement au-delà de leur seuil

# text
# c1: off
# c2: passed
# c3: withheld
# c4: null
# c5: $PKSHT
seg-55280b62eb19 = <c1/>, <c2/> ou <c3/> (lorsqu'une barrière fonctionne ailleurs ; <c4/> d'après <c5/> en son absence)

# text
# c1: {latitude, longitude, altitude}
# c2: $PKSHT
# c3: kshana
# c4: navigation.position
seg-963da9c0d2a3 = <c1/> : la position que le récepteur sous test a rapportée à cette époque (schéma JSON { "1.1" } ou ultérieur ; non publiée lorsque le flux n'en porte aucune, par exemple depuis <c2/> ou un <c3/> plus ancien). <b>Contexte de confiance uniquement</b> : le module d'extension n'écrit jamais <c4/>, de sorte que le chemin de position propre au navire reste intact

# text
# c1: {state, method, message}
seg-50599cef740d = émise lorsque l'état change : <c1/>

# text
# c1: score
# c2: reasons[].points
seg-ad58b4599f78 = Le module d'extension envoie aussi une fois au démarrage les métadonnées Signal K de ces chemins. <c1/> est le score de confiance de Kshana, de { "0" } à { "100" }, un score et non un rapport ni une probabilité, de sorte qu'il ne porte aucune unité SI ; ses métadonnées donnent la plage, une description et des zones qui suivent les seuils ci-dessous. <c2/> sont des points de score retirés de ce score de { "0" } à { "100" }.

# text
# c1: normal
# c2: alert
# c3: warn
# c4: alarm
# c5: normal
# c6: null
# c7: null
# c8: normal
# c9: warn
# c10: alarm
# c11: method: ["visual","sound"]
# c12: clearAfterEpochs
# c13: staleAfterS
# c14: $PKSHT
# c15: alarms
seg-bf0c90f5c02a = La notification est <c1/>, <c2/>, <c3/> ou <c4/>. Elle est effacée en publiant l'état <c5/>, et non <c6/> : un consommateur qui ne traite que <c7/> comme effacé devrait traiter <c8/> comme effacé aussi. Par défaut, la bande <b>degraded</b> donne <c9/> et la bande <b>untrusted</b> donne <c10/>, avec <c11/>. Elle est abaissée après <c12/> époques à un meilleur état. Si aucune époque n'arrive pendant <c13/> secondes, elle avertit que le score n'est pas mis à jour. L'étalonnage ne déclenche jamais de notification. La source <c14/> ne porte aucune liste <c15/> (la phrase ne contient que la bande, le score et les deux principales raisons).

# text
seg-89cdf02b58e3 = Configuration (chaque seuil)

# text
seg-d7bdd78470ec = l'exécutable (modes spawn). <b>Il exécute n'importe quel exécutable avec l'identité de l'utilisateur du serveur</b> : seul un administrateur du serveur Signal K devrait pouvoir modifier la configuration du module d'extension

# text
seg-73091c431bcf = les limites du navire, les seuils et les pondérations du score (modes spawn)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: spawn-args
# c3: --replay
# c4: spawn-signalk-nmea
# c5: --gate
# c6: --listen
# c7: --json
# c8: --pksht
# c9: kshana
# c10: spawn-signalk-nmea
# c11: --stdin
# c12: --file
# c13: --tcp
# c14: --udp
# c15: --follow
# c16: --from-end
seg-f5f08c50abc7 = arguments ajoutés à <c1/> dans les deux modes spawn : l'entrée pour <c2/>, des options supplémentaires telles que <c3/> (un journal stocké alimenté plus vite que le temps réel) pour <c4/>. Le module d'extension refuse <c5/>, <c6/>, <c7/> et <c8/> (il lit le JSON de <c9/> sur la sortie standard), et pour <c10/> aussi les options d'entrée (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

# text
# c1: tcp-pksht
seg-01caf7ed213f = Modes TCP (la barrière sert sur { "10110" } : réglez le port pour <c1/>)

# text
# c1: band
# c2: score
seg-72b911dea6bd = <c1/> : la bande que Kshana rapporte, avec les bornes dans le fichier de session. <c2/> : les deux scores ci-dessous

# text
# c1: score
# c2: degradedState
seg-76ca56821979 = mode <c1/> : en dessous de cette valeur, l'état est <c2/> (borne par défaut de Kshana pour nominal)

# text
# c1: score
# c2: alarm
seg-429d8fc4570f = mode <c1/> : en dessous de cette valeur, l'état est <c2/> (borne par défaut de Kshana pour degraded)

# text
# c1: normal
# c2: alert
# c3: warn
seg-6d5c9e402211 = état pour la bande degraded : <c1/>, <c2/> ou <c3/>

# text
seg-e88a2979ef07 = époques consécutives à un état plus mauvais avant que la notification ne soit émise

# text
seg-0eec67224385 = époques consécutives à un meilleur état avant qu'elle ne soit abaissée

# text
# c1: 0
seg-76b52e312539 = avertir lorsqu'aucune époque n'arrive pendant cette durée ; <c1/> le désactive

# text
seg-87d3fcf7fec9 = méthodes de notification

# text
seg-9a455cf4a2f9 = Le module d'extension ne fait pas barrière : il n'altère jamais un point de position. Marquer un point comme invalide pour un système de cartographie, c'est la barrière, ci-dessous.

# text
# c1: node:test
# c2: 127.0.0.1
# c3: $PKSHT
# c4: kshana receiver-trust live
seg-30f48b177c1c = <c1/>, aucune dépendance, aucun réseau au-delà de <c2/>. Les tests analysent et rejouent un extrait de 66 époques des lignes JSON et des phrases <c3/> que <c4/> a écrites pour la démonstration synthétique de la Baltique (données inventées, texte seulement), vérifient la concordance entre les deux formats, le comportement de maintien et d'effacement, le mode score, l'obsolescence et les trois chemins d'entrée par rapport à un flux local et à un processus enfant de substitution. Ces tests ne démarrent pas de véritable serveur Signal K ; une exécution scriptée distincte le fait, voir ci-dessous.

# text
seg-024928983177 = Exécution dans un véritable serveur Signal K

# text
# c1: integrations/signalk/evidence/
# c2: signalk-server
# c3: kshana
# c4: reportedPosition
# c5: navigation.position
seg-80b5a217d13c = <c1/> contient un script qui charge le module d'extension dans le paquet <c2/> { "2.33.0" } épinglé (dans un espace de noms réseau privé, limité au bouclage) et enregistre ce que montrent les propres API REST et WebSocket du serveur. Les chemins de confiance apparaissent, la notification passe de warn à alarm, à normal (après le maintien) et de nouveau à warn quand les données cessent ; et avec le véritable <c3/> alimenté par l'entrée NMEA propre au serveur, il a aussi publié <c4/>, jamais <c5/>. Une seule version du serveur, une seule exécution, aucun navire réel ; limites et reproduction dans le README des preuves.

# text
# c1: kshana receiver-trust live --gate
seg-fea2e7d140c3 = OpenCPN lit le NMEA depuis le réseau, et <c1/> peut lui-même servir le flux filtré par la barrière sur un port TCP.

# text
seg-92981e13bc6f = Recommandé : la connexion directe.

# text
# c1: some-nmea-source
# c2: stty
# c3: cat
# c4: --tcp
# c5: --udp
# c6: kshana
# c7: kshana-gate.service
# c8: --listen tcp:<port>
seg-e6caa4d53b9a = (<c1/> est le port série du récepteur lu avec <c2/> et <c3/>, un multiplexeur, ou les entrées <c4/>/<c5/> de <c6/> lui-même ; le <c7/> de la construction de référence fait cela sous systemd.) <c8/> se lie à l'adresse de bouclage ; un nombre quelconque de clients en lecture seule peuvent s'y connecter, et celui qui ne suit pas est abandonné sans retarder les autres.

# text
seg-311e4379acf1 = Alternative : le relais.

# text
# c1: integrations/opencpn/nmea-tcp-relay.mjs
# c2: kshana
# c3: --listen
seg-11b4c4791f55 = <c1/> est une diffusion Node sans dépendance qui fait la même chose pour un <c2/> sans <c3/>, ou qui sert tout autre flux de lignes (l'option conteneur l'utilise pour les époques JSON) :

# text
seg-93cb82966313 = Il transmet les octets sans les modifier, par lignes entières seulement, et abandonne un client qui ne lit pas. Préférez la connexion directe : un processus de moins dans la chaîne.

# text
# c1: 127.0.0.1
# c2: 10110
# c3: $PKSHT
# c4: 0
# c5: V
# c6: $PKSHT
seg-4226afc6175c = Dans OpenCPN : Options, Connections, Add Connection, <b>Network</b>, protocole <b>TCP</b>, adresse <c1/>, port <c2/>, direction <b>Input</b>. Tant que la confiance n'est pas effondrée, le flux est celui du récepteur lui-même, plus une phrase <c3/> par cycle. Tant qu'elle est effondrée, la GGA transmise a la qualité <c4/>, la RMC l'état <c5/>, et les indicateurs de mode disent pas de point de position, avec les sommes de contrôle recalculées : l'équipement voit le récepteur lui-même déclarer le point invalide et déclenche sa propre alarme. Les phrases <c6/> sont visibles dans la fenêtre de débogage NMEA d'OpenCPN (Options, Connections, « NMEA debug window »). Les champs de position sont laissés tels que reçus.

# text
# c1: MARITIME-TRUST.md
seg-8549d49f1b2c = Lisez « Gate mode » dans <a1><c1/></a1> avant de vous y fier : il est facultatif, ajoute de la latence (un cycle est retenu jusqu'à ce que son époque soit notée), constitue un point unique dans la chaîne, et peut retenir un bon point de position aussi bien que laisser passer un point contrefait.

# text
# c1: test/relay.test.mjs
# c2: kshana receiver-trust live --gate
# c3: $PKSHT
# c4: W
seg-533a911141d6 = <c1/> rejoue un extrait enregistré du flux synthétique filtré par la barrière ({ "186" } phrases autour du moment où la confiance s'effondre, écrites par <c2/>) à travers le relais sur un véritable socket TCP et vérifie ce que reçoit un consommateur : le flux octet pour octet quel que soit le découpage ; des sommes de contrôle valides sur chaque phrase, y compris celles réécrites ; GGA et RMC concordantes, valides puis invalides sans scintillement ; une <c3/> par cycle avec son champ de barrière <c4/> exactement là où le point est invalide ; deux consommateurs identiques ; une ligne partielle jamais transmise. Cela vérifie le flux fourni à OpenCPN, non l'écran d'OpenCPN lui-même.

# text
# c1: kshana
seg-12fc91a3f69b = Une vérification de bout en bout avec le véritable binaire, ne faisant pas partie des tests par défaut (elle exige un <c1/> compilé) :

# text
# c1: $PKSHT
seg-fea419a50c52 = Les deux exécutent la démonstration synthétique d'une heure et vérifient que le point passe de valide à invalide, avec une <c1/> par époque.

# text
seg-e76c11d8f003 = Module d'extension natif

# text
# c1: integrations/opencpn/plugin/
# c2: $PKSHT
# c3: ctest
# c4: $PKSHT
# c5: integrations/opencpn/evidence/
# c6: README.md
# c7: LICENSING.md
seg-7a5ac2d2f229 = <c1/> est un panneau de score pour OpenCPN (score, bande, barrière, principales raisons, une alerte lorsque la confiance devient untrusted) qui lit <c2/> dans le propre flux NMEA d'OpenCPN, de sorte qu'il n'a besoin d'aucune connexion au-delà de celle ci-dessus. Il est construit avec CMake par rapport à l'en-tête de l'API de modules d'extension d'OpenCPN (embarqué, avec son commit source) et wxWidgets ; <c3/> exécute les tests de logique sans wx et vérifie que la bibliothèque exporte les points d'entrée qu'OpenCPN recherche. Il a été exécuté dans OpenCPN { "5.8.4" } sous un affichage virtuel sur le flux synthétique filtré par la barrière (OpenCPN a remis <c4/> au module d'extension, le panneau est devenu rouge, et la position propre d'OpenCPN s'est figée lorsque la barrière s'est enclenchée ; captures d'écran, journal et script dans <c5/>), mais pas sur un véritable poste de travail, ni avec d'autres versions ou plateformes, et il n'est pas empaqueté pour le gestionnaire de modules d'extension d'OpenCPN. Voir le <a1><c6/></a1> du module d'extension. Il est placé sous licence GPL-3.0-or-later, contrairement au reste du dépôt (<a2><c7/></a2>).

# text
# c1: integrations/opencpn/evidence/
# c2: README.md
seg-a2adfa7ff5fb = Captures d'écran de cette exécution, dans <c1/> (une seule exécution, OpenCPN { "5.8.4" } sous un affichage virtuel, données synthétiques ; <a1><c2/></a1> donne les limites) :

# attr:alt
seg-ee5e8bb5a734 = La fenêtre de carte d'OpenCPN exécutant le module d'extension à panneau de score Kshana sur le flux synthétique filtré par la barrière, avant l'effondrement de la confiance : aucun panneau n'est ouvert (il s'ouvre de lui-même sur l'alarme), la position du navire dans la barre d'état indique { "54" } { "32.4659" } N { "018" } { "46.1670" } E avec une vitesse de { "16.48" } kn et un cap de { "088" }, et l'indicateur de point de position en haut à droite montre trois barres.

# attr:alt
seg-1189d82affbb = La même fenêtre OpenCPN après l'effondrement : le panneau Kshana est ouvert en rouge avec le score { "47" } et le mot UNTRUSTED, les lignes gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 et un âge de { "2" } s, et la déclaration précisant qu'il s'agit d'un logiciel à titre consultatif, et non d'un équipement de navigation homologué, et que l'opérateur reste responsable. La barre d'état indique toujours { "54" } { "32.4672" } N { "018" } { "46.2227" } E, et l'indicateur de point de position est tombé à deux barres.

# attr:alt
seg-90c7cdee8892 = OpenCPN alimenté directement par kshana receiver-trust live --gate --listen : le panneau Kshana est ouvert en rouge avec le score { "44" } et UNTRUSTED, les lignes gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 et un âge de { "1" } s, et la déclaration à titre consultatif. Cette exécution n'étaye pas l'observation du gel de la position : OpenCPN était encore en train de traiter la rafale initiale d'époques.

# text
seg-dce06383cde1 = Ces captures montrent la tuyauterie et le point de position filtré par la barrière parvenant à OpenCPN, et non qu'une alarme soit opportune ou correcte pour un navire réel. Logiciel à titre consultatif, et non un équipement homologué.

# text
# c1: deploy/reference-build/
# c2: deploy/reference-build/check-units.sh
# c3: systemd-analyze verify
seg-f9f39d089438 = <a1><c1/></a1> : une liste de pièces générique, la configuration du système d'exploitation, deux unités systemd (le moniteur consultatif et la barrière facultative), une option conteneur et le câblage Signal K. <c2/> exécute <c3/> sur les unités sans rien démarrer.

# text
# c1: MARITIME-TRUST.md
seg-5e2a2e8af941 = Le score ne vaut que ce que valent les contrôles qui le sous-tendent, lesquels portent sur la physique d'un navire et sur ses autres capteurs ; une contrefaçon cohérente en elle-même, avec une horloge concordante, n'est pas vue par des moniteurs NMEA seuls (<a1><c1/></a1>). L'absence d'alarme n'est pas une preuve d'un bon point de position.

# text
seg-be1ed291f7c3 = Aucun chiffre de cette page n'est un taux de détection ou de fausse alarme mesuré. Les tests ci-dessus vérifient la tuyauterie sur du texte synthétique ; ils ne disent rien de la façon dont un moniteur se comporte face à de véritables interférences.

# text
seg-97d775b504c6 = Non homologué ; l'opérateur reste responsable.

# text
seg-69222f7d5068 = <s1>Précédent</s1>Carte des interférences : sources de données et licences

# text
seg-8eba9835d7df = <s1>Suivant</s1>Géométrie du ciel et lignes d'horizon

# text
seg-2093a1d8a24e = D'où viennent les époques (source)
