# docs--kind-oem-interop: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
# c1: docs/kinds/by-kind/oem-interop.md
seg-4abcbdaddcf8 = Source : <c1/>

# text
# c1: oem-interop
seg-a92dcafd670e = <c1/> (type de scénario)

# text
seg-dbffff25b57f = Passerelle d'interopérabilité CCSDS OEM : importe un message d'éphéméride orbitale produit par un outil externe de dynamique de vol (GMAT/Orekit/STK émettent tous de l'OEM) et rapporte ses segments/objets/référentiels/étendue d'époques ainsi qu'un contrôle de cohérence des vitesses ; sans entrée, elle fait l'aller-retour d'une orbite de référence générée et rapporte la fidélité import↔export. Contrôle d'ingestion structurel/physique MODELLED, et NON une vérification de la précision d'orbite de la source.

# text
# c1: scenarios/oem-interop.toml
seg-21eb1c9d7571 = Une exécution de <c1/> se résume ainsi : oem-interop: round-tripped { "2" } segment(s), { "12" } states; max round-trip error { "4.88e-7" } km / { "4.61e-10" } km/s (MODELLED interop)

# text
# c1: oem_text
seg-54c35d9fbfd9 = Champs facultatifs : <c1/>

# text
# c1: scenarios/oem-interop.toml
seg-d4117f615cd8 = L'exemple <c1/> définit, entre autres :

# text
seg-d7db74d14617 = KSHANA

# text
seg-b16f858574ca = Libellé du résultat (celui du moteur) : MODELLED — passerelle d'interopérabilité d'import/aller-retour CCSDS OEM (GMAT/Orekit/STK émettent de l'OEM) ; un contrôle d'ingestion structurel + physique, et NON une vérification de la précision d'orbite de la source

# attr:alt
seg-5db5a7c812ca = Le graphique que le moteur écrit pour scenarios/oem-interop.toml, type de scénario oem-interop

# text
seg-cd29f08ef235 = <b>VALIDATED</b> Importeur CCSDS { "502.0" } OEM (parse_oem), tolérant aux lignes COMMENT / mots-clés de métadonnées supplémentaires / blocs de covariance et inverse exact de l'écrivain ; aller-retour + ingestion de fichier externe avec contrôle de cohérence des vitesses. Tests : <a1>ccsds_oem_interop_reference.rs</a1>.

# text
# c1: oem
seg-20071a16b316 = <b>VALIDATED</b> Importeur CCSDS { "502.0" } OEM (parse_oem), tolérant aux lignes COMMENT / mots-clés de métadonnées supplémentaires / blocs de covariance et inverse exact de l'écrivain ; aller-retour + . Référence indépendante (ExternalDataset) : analyseur CCSDS-502 tiers indépendant <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — un code source distinct qui décode à l'octet près l'OEM EME2000/UTC émis par kshana ({ "24" } états sur { "2" } jeux de test, Δ pos/vit = { "0" }) et dont le lecteur strict confirme les jetons de métadonnées ; l'analyseur de kshana concorde de même avec lui sur un OEM externe fourni. Deux constats honnêtes d'interopérabilité (la bibliothèque oem rejette le mu par satellite de kshana

# text
# c1: label
seg-7ab6bb7a1b8a = MODELLED — passerelle d'interopérabilité d'import/aller-retour CCSDS OEM (GMAT/Orekit/STK émettent de l'OEM) ; un contrôle d'ingestion structurel + physique, et NON une vérification de la précision d'orbite de la source (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-343a56c07d02 = Contrôle d'ingestion structurel/physique MODELLED, et NON une vérification de la précision d'orbite de la source. (catalogue des types de scénario (<c1/>))

# text
seg-44aba1ad1d37 = PORTÉE HONNÊTE : contrôle d'ingestion structurel + physique MODELLED, et NON une vérification de la précision d'orbite de l'éphéméride source. Exécution : kshana scenarios/oem-interop.toml (commentaire du fichier de scénario, lignes { "11" } à { "13" })

# text
seg-833df8eedc34 = <s1>Précédent</s1>ntn-positioning

# text
seg-28254e1b38d4 = <s1>Suivant</s1>optical-atmosphere
