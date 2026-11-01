# docs--kind-lunar-interop-export: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/lunar-interop-export.md
seg-d36e6d7d8a10 = Source : <c1/>

# text
# c1: lunar-interop-export
seg-fdf560e675f4 = <c1/> (type de scénario)

# text
seg-5a4dcb93a643 = Export d'interopérabilité lunaire modélisé : émet le référentiel lunaire, l'échelle de temps lunaire et l'éphéméride lunaire sous des formes d'échange alignées sur LunaNet/IOAG et fondées sur le CCSDS, avec vérification d'aller-retour et de correspondance des champs. RÉUTILISE l'émetteur+analyseur CCSDS OEM { "2.0" } du crate (crate::oem) rebaptisé pour le contexte lunaire — le REF_FRAME de l'OEM porte le référentiel de corps lunaire WGCCRE de l'UAI { "2015" } (MOON_ME / MOON_PA), TIME_SYSTEM l'échelle de temps lunaire (LTC / TCL / UTC), CENTER_NAME = MOON — sur un échantillon d'éphéméride illustratif de classe LCNS (positions issues de crate::lunar_service, vitesse par différence finie). Émet aussi un descripteur de temps lunaire aligné sur LunaNet/IOAG (identifiant d'échelle, taux séculaire µs/jour issu de crate::lunar_time, bande publiée, surface de référence) qui fait l'aller-retour via serde_json, et enveloppe les artefacts dans l'enveloppe KIF existante (crate::interchange) avec l'étiquette d'honnêteté MODELLED. Rapporte les artefacts émis, le nombre de lignes OEM, la réussite du contrôle de correspondance des champs + la liste des champs présents/manquants, l'aller-retour OEM réussi, l'aller-retour des métadonnées de temps réussi, et la taille en octets du KIF. MODELLED — l'aller-retour déterministe + la correspondance des noms de champs par rapport au CCSDS OEM publié + la sémantique des champs de LunaNet/IOAG sont la référence indépendante ; PAS un test de respect de la norme d'interopérabilité certifié ; éphéméride illustrative à sources publiques, sans affiliation à l'ESA ; aucun TRL, héritage ni aval d'une agence.

# text
# c1: scenarios/lunar-interop-export.toml
seg-1726861e444f = Une exécution de <c1/> se résume ainsi : lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } states, OEM { "23" } lines | conformance PASS ({ "9" } present / { "0" } missing) | OEM round-trip ok | time-meta round-trip ok | KIF { "1640" } bytes | MODELLED

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-f8353e15aabd = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/lunar-interop-export.toml
seg-169f9446e90d = L'exemple <c1/> définit, entre autres :

# text
seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

# text
seg-3f36bd2ec5ea = LTC

# text
seg-2ac27c1e55c0 = octet

# attr:alt
seg-0e86ff364c17 = Le graphique que le moteur écrit pour scenarios/lunar-interop-export.toml, type de scénario lunar-interop-export

# text
# c1: oem
seg-98acb538942f = <b>MODELLED</b> Export de référentiel lunaire + temps + éphéméride aligné sur LunaNet/IOAG (CCSDS OEM + KIF) avec vérification d'aller-retour. Référence indépendante (InternalConsistency) : l'export OEM lunaire de kshana relu par la bibliothèque tierce indépendante <c1/> (R. J. Anderson) : les jetons de référentiel/temps et l'état par époque concordent à la précision d'écriture ({ "1" } mm / { "1e-9" } km/s) et un export dont le TIME_SYSTEM est omis est rejeté — un aller-retour structurel d'échange ; la sémantique physique du référentiel et du temps lunaires est vérifiée par ses propres lignes, de sorte que celle-ci reste MODELLED. { "0.30" } comparaison externe, un constat (reste MODELLED) : un se

# text
# c1: honesty
seg-c9a1d76625d6 = MODELLED (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-633bcd62ce93 = Émet aussi un descripteur de temps lunaire aligné sur LunaNet/IOAG (identifiant d'échelle, taux séculaire µs/jour issu de crate::lunar_time, bande publiée, surface de référence) qui fait l'aller-retour via serde_json, et enveloppe les artefacts dans l'enveloppe KIF existante (crate::interchange) avec l'étiquette d'honnêteté MODELLED. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-0e91697e3036 = MODELLED — l'aller-retour déterministe + la correspondance des noms de champs par rapport au CCSDS OEM publié + la sémantique des champs de LunaNet/IOAG sont la référence indépendante ; PAS un test de respect de la norme d'interopérabilité certifié ; éphéméride illustrative à sources publiques, sans affiliation à l'ESA ; aucun TRL, héritage ni aval d'une agence. (catalogue des types de scénario (<c1/>))

# text
seg-254d48fe58a5 = L'export d'interopérabilité lunaire est MODELLED, et non vérifié : il est contrôlé par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-07d6cc44724f = <s1>Précédent</s1>lunar-integrity

# text
seg-9669cd9b1d04 = <s1>Suivant</s1>lunar-jamming

# text
seg-11d0ccba5ee7 = CE QUE FAIT src/lunar_interop.rs : * export_lunar_oem — RÉUTILISE l'émetteur CCSDS OEM { "2.0" } du crate (crate::oem), rebaptisé pour le contexte lunaire : REF_FRAME = le référentiel de corps lunaire WGCCRE de l'UAI { "2015" } (MOON_ME / MOON_PA), TIME_SYSTEM = l'échelle de temps lunaire (LTC / TCL / UTC), CENTER_NAME = MOON, sur un échantillon d'éphéméride ILLUSTRATIVE de classe LCNS (positions issues de crate::lunar_service, vitesse par différence finie centrée). * export_ (commentaire du fichier de scénario, lignes { "6" } à { "19" })

# text
seg-f730e8f789cf = HONNÊTETÉ : MODELLED. Les NOMS de champs et les unités sont alignés sur des normes PUBLIC (CCSDS 502.0-B OEM, référentiels lunaires WGCCRE de l'UAI { "2015" }, spécification d'interopérabilité LunaNet / architecture lunaire de l'IOAG). L'aller-retour déterministe et la correspondance des noms de champs sont la référence indépendante. Ce n'est PAS un test de respect de la norme d'interopérabilité certifié. L'éphéméride est illustrative, à sources publiques, SANS affiliation à l'ESA, et n'implique aucun TRL (commentaire du fichier de scénario, lignes { "21" } à { "26" })
