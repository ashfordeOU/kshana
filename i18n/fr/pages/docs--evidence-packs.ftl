# docs--evidence-packs: translations (fr)

# text
seg-2247a2344710 = Signification

# text
seg-ade1d7072512 = voir ci-dessous

# text
seg-245fe1f87b08 = Fichier

# text
# c1: docs/EVIDENCE-PACKS.md
seg-802d8b6f3afd = Source : <c1/>

# text
seg-710e7e630acb = Paquets de preuves : un enregistrement signé d'un événement de confiance GNSS

# text
seg-dbc796deac2a = <b>Un paquet est un enregistrement technique, pas un avis juridique.</b> Il indique ce que le moteur Kshana a calculé à partir d'un journal de récepteur donné sous une configuration donnée, et permet à quiconque de vérifier que rien n'y a été modifié par la suite. Il ne dit ni ce qui a causé un événement, ni qui en était responsable, ni si une obligation a été remplie, ni que le journal montre ce que le récepteur a réellement reçu. Le manifeste et le résumé le disent tous deux.

# text
seg-d99cb540310c = Un paquet de preuves sert pour un rapport d'incident, un assureur ou la question d'un régulateur : « que disait votre système du signal GNSS entre ces deux instants, et peut-on se fier à cet enregistrement ? »

# text
seg-2fa31fe443b4 = Créer un paquet

# text
# c1: --lab-attestation lab.toml
# c2: HARDWARE-SAFETY.md
seg-983924cb2eea = Pour un paquet créé à partir d'une session de laboratoire, <c1/> consigne dans le manifeste signé la déclaration de l'opérateur sur le montage (conduit ou blindé, atténuation ou boîtier, ce qui a émis un éventuel signal RF) ; voir <a1><c2/></a1>. Elle est consignée telle que fournie et n'est jamais vérifiée.

# text
# c1: --from
# c2: --to
# c3: --out
# c4: --created-utc
# c5: 2026-01-02T03:04:05Z
# c6: none
seg-f01e59c876a3 = <c1/> et <c2/> sont des secondes depuis la première époque du journal, ou une heure UTC ISO-8601 lorsque le journal indique sa propre heure de début. <c3/> ne doit pas contenir déjà de fichiers. <c4/> prend une heure UTC réelle telle que <c5/> (toute autre valeur est refusée) ou <c6/>, qui omet l'heure de création et rend le paquet reproductible octet pour octet. L'heure de création est ce que déclare le signataire ; rien ne la compare à une horloge, ce à quoi sert le jeton d'horodatage facultatif.

# text
# c1: keygen
# c2: kshana
# c3: .gitignore
# c4: *.evidence-key
seg-c72ddd97ad0b = Le fichier de clé contient une graine Ed25519 de 32 octets sous forme de { "64" } chiffres hexadécimaux ; fournissez la vôtre (par exemple une graine conservée dans votre système de gestion de clés) ou laissez <c1/> en créer une. <c2/> avertit si le fichier est lisible par d'autres utilisateurs. <c3/> exclut <c4/> ; nommez votre clé ainsi si elle se trouve dans une copie de travail.

# text
seg-077cbd944c5d = Ce que contient un paquet

# attr:alt
seg-7cf2608b2b2f = La structure d'un paquet de preuves. Un journal de récepteur (NMEA, u-blox UBX, RINEX { "3" } ou un journal Android) et une fenêtre temporelle entrent dans kshana receiver-trust evidence, qui écrit sept fichiers : log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig et un timestamp.tsr facultatif. Le manifeste consigne le SHA-256 du journal entier et de chaque fichier, ainsi qu'une chaîne de hachages sur les fichiers ; la signature couvre le manifeste. kshana evidence verify vérifie la signature, le hachage de chaque fichier, la chaîne et l'absence de tout fichier non listé, et retourne { "0" } lorsque la vérification réussit, { "1" } lorsque quelque chose a échoué et { "3" } lorsque le signataire n'était pas épinglé. Un paquet est un enregistrement technique, pas un avis juridique.

# text
seg-e305279d5b11 = Contenu

# text
seg-05107c0bd3c8 = les octets bruts du journal du récepteur pour la fenêtre

# text
# c1: geometry_model
# c2: [geometry]
seg-b19ce12544a5 = le scénario tel qu'exécuté (chaque seuil de moniteur, événement et règle de comparaison), les moniteurs exécutés, la référence de base d'étalonnage et le hachage du scénario ; pour un navire, également la déclaration à titre consultatif que porte chaque sortie navire (logiciel à titre consultatif, et non un équipement de navigation homologué) ; à partir de { "0.36" }, le <c1/> (la table <c2/> réellement utilisée, le poids du moniteur de géométrie, chaque provenance et les règles de classe). Les noms de répertoires et les charges utiles en ligne sont supprimés.

# text
# c1: geometry
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
seg-e3c2457161bc = chaque époque de la fenêtre avec les statistiques du moteur, les alarmes (les raisons) et l'état de confiance ; à partir de { "0.36" }, également sa <c1/> satellitaire (bonne, dégradée avec raisons, ou inconnue lorsque le journal ne donne aucune géométrie des satellites) et une <c2/> sur chaque déduction (<c3/>, <c4/>, <c5/>)

# text
seg-2e309765271f = un résumé autonome, sans script : identification, hachages, résultats, raisons, une voie de géométrie (époques par statut de géométrie) distincte des classes des déductions ({ "0.36" }), chaque seuil, le tableau par époque et les limites de l'enregistrement

# text
seg-467277f816d2 = version du moteur, fenêtre, heure de création, format et nom du journal, <b>le SHA-256 du journal complet</b>, la plage et le SHA-256 de l'extrait, la clé publique et l'empreinte du signataire, la taille et le SHA-256 de chaque fichier, et une chaîne de hachages sur les fichiers

# text
# c1: manifest.json
seg-7a92ff70ed7f = signature Ed25519 sur les octets exacts de <c1/>

# text
seg-b517814b077d = jeton d'horodatage RFC { "3161" } facultatif

# text
# c1: byte-range
# c2: whole-log
seg-6ad4c5f3afbe = <b>Extrait du journal.</b> Le lecteur indique l'étendue en octets source de chaque époque ; l'extrait est donc la plus petite plage d'octets contenant chaque époque de la fenêtre (<c1/>) : NMEA, u-blox UBX, observations RINEX { "3" } et journaux Android. Il est haché sous forme d'octets bruts, jamais comme du texte décodé. Pour un flux en direct ou du RINEX { "2" }, il n'y a pas d'étendue ; le journal entier est alors inclus et le manifeste indique <c2/> (la fenêtre limite les époques rapportées, pas les octets inclus). Le résumé indique laquelle des deux situations s'applique. Un extrait est un enregistrement des octets de la fenêtre, pas un journal autonome : par exemple, un extrait RINEX n'a pas d'en-tête de fichier.

# text
# c1: link₀ = SHA-256("kshana- evidence-chain/1")
# c2: linkᵢ = SHA-256(linkᵢ₋₁ ‖ SHA-256(file) ‖ len(name) ‖ name)
# c3: chain_head
seg-c4c81cbd4981 = <b>Chaîne de hachages.</b> Le manifeste liste les fichiers dans un ordre fixe. <c1/> ; pour chaque fichier, <c2/> (longueur sur { "4" } octets, gros-boutiste). Le dernier maillon est <c3/>. Réordonner, retirer ou substituer un fichier modifie la chaîne ; la signature couvre la chaîne.

# text
seg-1147c5b0d348 = Vérifier un paquet

# text
seg-e716ddf7bcc9 = Le code de sortie { "0" } signifie vérifié ; { "1" } signifie que quelque chose a échoué ; { "2" } signifie une erreur d'utilisation ; { "3" } signifie que le paquet est intact mais que son signataire n'était pas épinglé (voir ci-dessous). Chaque contrôle indique réussite, échec ou ignoré, et chaque échec est nommé :

# text
seg-f6f2cebd9cb0 = Code d'échec

# text
seg-312a5d784f42 = le manifeste est illisible

# text
# c1: manifest.json
seg-6f1b5d9d6711 = pas de signature, signature qui n'est pas une signature de 64 octets en hexadécimal minuscule, ou qui ne se vérifie pas sur <c1/>

# text
seg-129b78f142f1 = la clé n'est pas valide, ou diffère de celle que vous avez fournie

# text
seg-c86b25543d55 = un fichier listé est absent ou diffère du manifeste ; le fichier est nommé

# text
seg-f98d26abf045 = un fichier est dans le paquet mais pas dans le manifeste

# text
seg-842bac6a9e69 = un maillon n'est pas ce que donnent ses entrées ; le fichier est nommé

# text
# c1: epochs.json
seg-413034467a64 = le manifeste se contredit lui-même ou contredit <c1/>

# text
# c1: --log
seg-ef4bfbedca33 = avec <c1/> : le journal que vous détenez n'est pas celui qui est consigné, ou l'extrait n'est pas cette plage de celui-ci

# text
seg-dcd686ac77f7 = Modifier un seul octet de n'importe quel fichier fait échouer la vérification pour la raison correspondante : un artefact modifié est signalé comme une discordance de hachage de ce fichier et rien d'autre ; un manifeste modifié fait échouer la signature. Recalculer les hachages et la chaîne après avoir modifié un fichier n'aide pas sans la clé de signature ; seule la signature échoue alors.

# text
# c1: --pubkey
# c2: --allow-unpinned
# c3: --pubkey
# c4: .pub
seg-066fe7c07bf6 = <b>Épinglez la clé.</b> Sans <c1/>, un paquet prouve seulement qu'il est intact par rapport à la clé qu'il désigne lui-même, que n'importe qui peut générer. La vérification retourne donc { "3" } et affiche « INTACT, BUT THE SIGNER IS NOT PINNED » plutôt que « VERIFIED » ; <c2/> accepte en connaissance de cause la clé propre du paquet et affiche « VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey) ». Obtenez la clé publique du signataire auprès de lui par une voie de confiance (pas depuis le paquet) et passez-la avec <c3/> : { "64" } chiffres hexadécimaux ou le fichier <c4/>. Passer la clé privée par erreur est reconnu et refusé. L'empreinte (les { "128" } premiers bits du SHA-256 de la clé, soit { "32" } chiffres hexadécimaux) est affichée pour une comparaison à l'œil ; épingler la clé complète est la voie fiable.

# text
seg-a01c7ba606c9 = Format du paquet et procédure de vérification (normatifs)

# text
seg-fa43e16b6aba = Cette section est la spécification à partir de laquelle un vérificateur indépendant est écrit. Les mots en majuscules sont des exigences. Un paquet est un répertoire (ou toute table associant un nom de fichier à des octets) de fichiers nommés exactement comme ci-dessous ; un vérificateur travaille sur les octets de chaque fichier tels que stockés et ne resérialise jamais rien.

# text
# c1: log-slice.bin
# c2: config.json
# c3: epochs.json
# c4: summary.html
# c5: manifest.json
# c6: manifest.sig
# c7: timestamp.tsr
seg-1fbabb3f1092 = <b>Fichiers.</b> Les fichiers d'artefacts, dans cet ordre fixe, sont <c1/>, <c2/>, <c3/>, <c4/>. Un paquet a aussi <c5/> et <c6/>, et PEUT avoir <c7/>. Tout autre nom est un <em>fichier non listé</em>.

# text
# c1: 0-9a-f
seg-3ed6e38ad2ee = <b>Hexadécimal.</b> Toute chaîne hexadécimale est en minuscules <c1/> uniquement, sans espace ; les majuscules ne sont pas acceptées. Les valeurs SHA-256 font { "64" } chiffres, la clé publique fait { "64" } chiffres, la signature fait { "128" } chiffres.

# text
# c1: manifest.sig
# c2: manifest.json
# c3: \n
seg-6609210d003a = <b><c1/>.</b> L'hexadécimal minuscule de 128 chiffres de la signature Ed25519 de 64 octets (RFC { "8032" }, le schéma Ed25519 pur) sur les octets exacts de <c2/>, suivi d'exactement un <c3/> et de rien d'autre. La signature DOIT être vérifiée strictement : une signature dont la valeur S n'est pas inférieure à l'ordre du groupe L est invalide.

# text
# c1: manifest.json
seg-b163e9f5db66 = <b><c1/>.</b> Un objet JSON en UTF-8. Ses membres (un vérificateur DOIT trouver chacun avec le type JSON indiqué ; les membres supplémentaires sont ignorés) :

# text
seg-ace92bcbfd8a = membre

# text
seg-04f69a0edb2f = type

# text
seg-45425f378b61 = signification

# text
seg-6940543aa3c0 = chaîne

# text
# c1: kshana-evidence/1
seg-48d303baac62 = DOIT être égal à <c1/>

# text
seg-6e57561e7f01 = descriptif

# text
seg-abec93a4a488 = chaîne ou null

# text
seg-7d059c0b6372 = heure de création, descriptive

# text
# c1: {from_s, to_s}
seg-507d53a53380 = objet <c1/>

# text
seg-bb2bcbbf404a = nombres, secondes

# text
seg-64572c65426f = entier non négatif

# text
# c1: epochs.json
seg-14d421e391dd = le nombre d'entrées du tableau JSON de <c1/>

# text
seg-f5e7215e6835 = objet

# text
# c1: format
# c2: file_name
# c3: full_sha256
# c4: full_bytes
# c5: start_label
# c6: slice
seg-a4117217030c = <c1/> chaîne, <c2/> chaîne, <c3/> hexadécimal, <c4/> entier non négatif, <c5/> chaîne ou null, et <c6/>

# text
# c1: kind
# c2: byte-range
# c3: whole-log
# c4: start
# c5: end
# c6: sha256
seg-02389e71a339 = <c1/> (exactement <c2/> ou <c3/> ; toute autre valeur rend le manifeste malformé), <c4/> et <c5/> entiers non négatifs (décalages en octets, fin exclue), <c6/> hexadécimal

# text
# c1: algorithm
# c2: ed25519
# c3: public_key
# c4: fingerprint
seg-6c9176965aae = <c1/> chaîne (<c2/>), <c3/> hexadécimal ({ "32" } octets), <c4/> chaîne

# text
seg-dcba59304030 = tableau d'objets

# text
# c1: name
# c2: role
# c3: bytes
# c4: sha256
# c5: link
seg-e42ed5e07430 = un par fichier d'artefact, dans l'ordre fixe : <c1/> chaîne, <c2/> chaîne, <c3/> entier non négatif, <c4/> hexadécimal, <c5/> hexadécimal

# text
seg-b79c9500b744 = hexadécimal

# text
seg-697592bd3757 = le dernier maillon

# text
seg-9da5d92757bd = objet, facultatif

# text
# c1: --lab-attestation
# c2: operator
# c3: organisation
# c4: date
# c5: setup
# c6: conducted
# c7: shielded
# c8: attenuation_db
# c9: enclosure
# c10: emitter
# c11: statement
# c12: signature
seg-2032c208038d = présent uniquement dans un paquet créé à partir d'une session de laboratoire (<c1/>) : la déclaration de l'opérateur <c2/>, <c3/>, <c4/>, <c5/> (<c6/> ou <c7/>), <c8/> ou <c9/>, <c10/>, <c11/> et facultativement <c12/>, consignée telle que fournie. Elle est couverte par la signature du manifeste et n'est jamais vérifiée ; un vérificateur la signale par « attested by the named operator; not verified by Kshana ». Absent sinon, et un paquet sans elle est inchangé

# text
# c1: signer.fingerprint
seg-9411be425a80 = <c1/> correspond aux { "32" } premiers chiffres hexadécimaux du SHA-256 calculé sur les { "32" } octets de la clé publique.

# text
seg-80e55f2d3496 = Chaîne de hachages.

# text
# c1: link0
# c2: kshana-evidence-chain/1
# c3: link = SHA-256( previous_link (32 bytes) ‖ SHA-256(file) (32 bytes) ‖ len(name) as 4 bytes big-endian ‖ name as UTF-8 )
# c4: SHA-256(file)
# c5: sha256
seg-9346fe50efac = <c1/> est le SHA-256 des { "23" } octets ASCII <c2/>. Pour chaque artefact dans l'ordre, <c3/>, où <c4/> est pris dans le <c5/> consigné au manifeste pour cet artefact (la chaîne est donc une propriété du manifeste et se vérifie par rapport à lui, non par rapport aux fichiers).

# text
# c1: code
# c2: name
# c3: pin
seg-9dd985d8cb03 = <b>Procédure.</b> Un vérificateur exécute ces étapes dans l'ordre et recueille chaque échec ; le résultat est l'<em>ensemble</em> des échecs, chacun étant un <c1/> et, lorsque c'est indiqué, le fichier <c2/>. Il NE DOIT PAS s'arrêter au premier échec, sauf là où c'est indiqué. <c3/> est la clé publique à laquelle le vérificateur a reçu l'instruction de se fier, le cas échéant.

# text
# c1: manifest.json
# c2: manifest-missing
seg-abb1d2635143 = Pas de <c1/> : échec <c2/> ; arrêt.

# text
# c1: manifest.json
# c2: artifacts
# c3: log.slice
# c4: manifest-malformed
# c5: format
# c6: unsupported-format
seg-73a4aeb463e8 = Si <c1/> n'est pas un objet JSON dont chaque membre ci-dessus a le type indiqué (y compris des entrées <c2/> avec chaque membre, et <c3/>) : échec <c4/>. Sinon, si <c5/> n'est pas la valeur ci-dessus : <c6/>.

# text
# c1: signer.public_key
# c2: public-key-malformed
# c3: signer.fingerprint
# c4: public-key-malformed
# c5: pin
# c6: public-key-mismatch
# c7: pin
# c8: pin
# c9: manifest.sig
# c10: signature-missing
# c11: \n
# c12: signature-malformed
# c13: public-key-malformed
# c14: manifest.json
# c15: signature-invalid
seg-36c9df2abf34 = Phase de signature. Cette phase est exécutée que le manifeste ait été lisible ou non. Si le manifeste était lisible, la <em>clé nommée</em> est <c1/> ; si ce n'est pas { "64" } chiffres hexadécimaux minuscules, échec <c2/> (pas de clé nommée) ; sinon, si <c3/> n'en est pas l'empreinte, échec <c4/> (la clé reste utilisable). Si un <c5/> et une clé nommée existent et diffèrent : échec <c6/>. La <em>clé de contrôle</em> est <c7/> s'il en a été fourni un, sinon la clé nommée s'il y en a une ; avec aucun des deux, il n'y a pas de clé de contrôle (cela inclut tous les cas où le manifeste n'était pas lisible et où aucun <c8/> n'a été fourni). S'il n'y a pas de <c9/> : <c10/>. Sinon, si le fichier n'est pas exactement { "128" } chiffres hexadécimaux minuscules plus un <c11/> : <c12/>. Sinon, s'il y a une clé de contrôle qui n'est pas un encodage valide de clé publique Ed25519 : <c13/>. Sinon, s'il y a une clé de contrôle et que la signature ne se vérifie pas strictement sur les octets de <c14/> (quels qu'ils soient) : <c15/>. (Sans clé de contrôle, la signature n'est pas vérifiée et aucun échec n'est levé à ce titre.)

# text
# c1: manifest-malformed
seg-3dbe07af8fa8 = Si le manifeste n'était pas lisible (l'étape { "2" } a donné <c1/>) : arrêt ici.

# text
# c1: artifacts
# c2: artifact-list-malformed
# c3: file-missing
# c4: bytes
# c5: file-size-mismatch
# c6: sha256
# c7: file-hash-mismatch
seg-b7e03ef2dea5 = Artefacts. Si les noms de <c1/> ne sont pas exactement les quatre ci-dessus dans l'ordre : <c2/>. Puis, pour chaque entrée du manifeste, dans l'ordre : si le paquet n'a aucun fichier de ce nom, <c3/> (nom) ; sinon, si sa longueur diffère de <c4/>, <c5/> (nom) ; et, indépendamment, si le SHA-256 du fichier diffère de <c6/>, <c7/> (nom).

# text
# c1: manifest.json
# c2: manifest.sig
# c3: timestamp.tsr
# c4: artifacts
# c5: unlisted-file
seg-24cda5a1d9d8 = Fichiers non listés : pour chaque fichier du paquet autre que <c1/>, <c2/>, <c3/> et les noms de <c4/> du manifeste : <c5/> (nom).

# text
# c1: artifacts
# c2: link0
# c3: sha256
# c4: manifest-malformed
# c5: link
# c6: chain-mismatch
# c7: chain_head
# c8: chain-head-mismatch
seg-d103ade9a7c7 = Chaîne. Parcourir les <c1/> du manifeste dans l'ordre à partir de <c2/>. Si le <c3/> d'une entrée n'est pas { "64" } chiffres hexadécimaux minuscules : <c4/> et la chaîne est abandonnée (pas de contrôle de tête). Sinon, calculer le maillon ; s'il diffère du <c5/> de l'entrée : <c6/> (nom). Après le parcours, si la chaîne n'a pas été abandonnée et que le dernier maillon diffère de <c7/> : <c8/>.

# text
# c1: slice-record-inconsistent
# c2: start > end
# c3: end > full_bytes
# c4: log-slice.bin
# c5: sha256
# c6: slice.sha256
# c7: bytes
# c8: end - start
# c9: kind
# c10: whole-log
# c11: start != 0
# c12: end != full_bytes
# c13: slice.sha256 != full_sha256
# c14: epochs.json
# c15: epochs_in_window
# c16: epoch-count-mismatch
seg-be9fade3f879 = Extrait et époques. Lever <c1/> (au plus une fois par raison, et un vérificateur signale le code une seule fois quel que soit le nombre de raisons applicables) si l'un quelconque des cas suivants se produit : <c2/> ; <c3/> ; le <c5/> de l'entrée <c4/> diffère de <c6/> ; le <c7/> de cette entrée diffère de <c8/> ; ou <c9/> est <c10/> et l'un quelconque de <c11/>, <c12/>, <c13/>. Si <c14/> existe et s'analyse comme un tableau JSON dont la longueur diffère de <c15/> : <c16/>.

# text
# c1: log.full_sha256
# c2: full-log-hash-mismatch
# c3: start..end
# c4: log-slice.bin
# c5: slice-not-from-full-log
seg-0dc49ed14c1f = Journal complet. Seulement si le vérificateur a reçu les octets du journal d'origine : si leur SHA-256 diffère de <c1/>, <c2/> ; sinon, si la plage <c3/> n'est pas à l'intérieur du journal ou si les octets du journal à cet endroit diffèrent de <c4/>, <c5/>.

# text
# c1: timestamp.tsr
# c2: timestamp-missing
# c3: timestamp-malformed
# c4: manifest.json
# c5: timestamp-imprint-mismatch
seg-a7f787d6e6df = Horodatage. Sans <c1/> : si le vérificateur a reçu l'instruction d'en exiger un, <c2/> ; sinon, rien. Avec un fichier : s'il ne peut pas être lu comme un jeton ou une réponse RFC { "3161" } (voir ci-dessous), <c3/> ; sinon, si son empreinte de message n'est pas le hachage, dans l'algorithme propre à l'empreinte (SHA-256, SHA-384 ou SHA-512), des octets de <c4/> : <c5/>.

# text
seg-f7d908c6bf38 = Le paquet est vérifié exactement lorsque l'ensemble des échecs est vide. Le fait que le signataire ait été épinglé est signalé séparément et ne modifie pas l'ensemble des échecs.

# text
# c1: ContentInfo
# c2: id-ct-TSTInfo
# c3: TimeStampResp
# c4: PKIStatusInfo
# c5: TSTInfo
# c6: genTime
# c7: --tsa-ca
seg-b0d74519122d = <b>Jeton d'horodatage.</b> Un jeton est un <c1/> DER dont le type de contenu est CMS SignedData ({ "1.2.840.113549.1.7.2" }) et dont le type de contenu encapsulé est <c2/> ({ "1.2.840.113549.1.9.16.1.4" }) ; une réponse est un <c3/> DER (un <c4/> suivi du jeton) dont le statut est { "0" } ou { "1" }. L'algorithme d'empreinte de message du <c5/> doit être SHA-256, SHA-384 ou SHA-512 avec un condensat de la longueur de cet algorithme, et son <c6/> une heure calendaire UTC réelle. Le BER à longueur indéfinie n'est pas accepté. La signature de l'autorité et la chaîne de certificats ne sont vérifiées que lorsque des ancres de confiance sont fournies (<c7/>, ci-dessous).

# text
seg-2156bf4dabb3 = Horodatage RFC { "3161" } (facultatif)

# text
# c1: manifest.json
# c2: create_bundle
seg-27a71ea73d7d = Un jeton d'horodatage délivré par une autorité d'horodatage montre que le manifeste existait à un instant que l'autorité atteste. Le jeton porte sur <c1/> ; il est donc demandé après la création du paquet (il n'y a aucun moyen d'en fournir un lors de la création du paquet, et <c2/> refuse un jeton qui ne porte pas sur ce manifeste exact) :

# text
# c1: kshana evidence verify
# c2: manifest.json
# c3: authority_signature_verified: false
# c4: openssl ts -verify
seg-7ae6e0326b65 = <c1/> lit le jeton (un jeton seul ou une réponse complète), vérifie qu'il a été accordé et que son empreinte de message est égale au hachage de <c2/>, et affiche l'heure qu'il indique. Sans ancres de confiance, il ajoute « timestamp authority signature not verified by Kshana » et signale <c3/> ; exécutez la ligne <c4/> ci-dessus pour cette partie. Un jeton dont l'empreinte diffère, ou qui ne s'analyse pas, est un échec. Les types de contenu, la longueur de l'empreinte et l'heure de génération du jeton sont contrôlés pour leur cohérence.

# text
# c1: --tsa-ca authority-ca.pem
# c2: verify
# c3: openssl ts -verify
# c4: genTime
# c5: timestamp-authority-invalid
# c6: authority_signature_verified
# c7: tests/fixtures/evidence_tsa/PREREGISTRATION.md
seg-88359c107bf1 = Avec <c1/> (un ou plusieurs certificats PEM, tous de confiance), <c2/> contrôle aussi l'autorité, hors ligne, à la manière de <c3/> : le condensat de message des attributs signés, la signature (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 ou P-384), la liaison du certificat de signature ESS, l'usage étendu de clé critique timeStamping du signataire, et la chaîne jusqu'à une ancre auto-émise, chaque certificat étant valide au <c4/> du jeton. Un échec est signalé comme <c5/> avec le premier contrôle qui a échoué, et <c6/> n'est vrai que lorsque tout a réussi. La révocation (CRL ou OCSP) n'est pas vérifiée. Ce vérificateur concorde avec OpenSSL { "3.0.13" } sur { "27" } cas autogénérés (<c7/>).

# text
# c1: verify
# c2: --require-timestamp
# c3: timestamp-missing
# c4: attach-timestamp
# c5: --replace
seg-f534ae37f10c = <b>Le jeton se trouve à côté du manifeste signé, pas à l'intérieur.</b> Rien dans la signature ni dans la chaîne ne le couvre ; un jeton peut donc être retiré, ou un autre jeton valide substitué, sans que la signature échoue. <c1/> note donc lorsqu'un paquet n'en a pas, et <c2/> fait d'un jeton manquant un échec (<c3/>) ; un jeton substitué n'est détecté que s'il ne correspond pas au manifeste. <c4/> refuse d'écraser un jeton existant sauf si vous passez <c5/>. Si un horodatage compte pour vous, conservez le jeton et le résultat de la vérification dans vos propres archives, et exigez-le.

# text
seg-b993ef559bd0 = Depuis le code

# text
# c1: kshana::evidence::build_receiver_trust_pack
# c2: create_bundle
# c3: verify_bundle
# c4: EvidenceInput
# c5: BTreeMap<String, Vec<u8>>
# c6: Files
# c7: VerifyReport
# c8: wasm32
seg-de24fd02c7c2 = <c1/> est l'unique point d'entrée que la ligne de commande et toutes les autres surfaces appellent pour créer un paquet : un scénario, les octets du journal (et ceux du fichier de navigation, pour RINEX), la fenêtre sous forme de texte, un titre et une heure de création facultative, plus la graine de signature, en entrée ; les fichiers, le nombre d'époques, l'extrait, le hachage du manifeste et l'empreinte du signataire en sortie. Il ne lit ni fichier ni horloge, de sorte que les mêmes entrées donnent les mêmes octets. En dessous, <c2/> et <c3/> sont des fonctions pures : des octets en entrée (<c4/>, une graine de 32 octets, un <c5/> de fichiers), des résultats sérialisables en sortie (<c6/>, <c7/>). Elles n'utilisent ni fichier, ni horloge, ni état de processus, et se compilent pour <c8/>, de sorte que les surfaces Python, WebAssembly et serveur les appellent telles quelles. La ligne de commande n'en est qu'une fine enveloppe.

# text
seg-292a5bc48548 = Ce qu'un paquet ne fait pas

# text
# c1: config.json
# c2: kshana receiver-trust
# c3: epochs.json
seg-852aca7fc407 = Il ne ré-exécute pas l'évaluation. Quiconque dispose du journal complet et de <c1/> peut ré-exécuter <c2/> et comparer avec <c3/> ; le paquet prouve ce qui a été enregistré, pas que le moteur avait raison.

# text
seg-91639deac47d = Il ne prouve pas que le journal est authentique ou complet. Le hachage du journal complet lie l'enregistrement à un seul fichier ; il appartient à l'opérateur d'établir d'où provient ce fichier.

# text
seg-0f721c314fa1 = Il ne porte aucune affirmation de performance sur la détection ou le rejet de l'interférence.

# text
seg-9c361736bf27 = C'est un enregistrement technique, et non un avis juridique ni une certification.

# text
seg-68bcf43b4e27 = <s1>Précédent</s1>Couverture de lignes

# text
seg-09c0b5fa6e52 = <s1>Suivant</s1>Liaisons optiques à travers l'atmosphère
