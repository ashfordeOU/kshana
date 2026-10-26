# docs--kind-space-packet: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-98151954f217 = false

# text
seg-2ac27c1e55c0 = octet

# text
# c1: docs/kinds/by-kind/space-packet.md
seg-785f906eb194 = Source : <c1/>

# text
# c1: space-packet
seg-525499bc01cd = <c1/> (type de scénario)

# text
seg-de2448d74c2b = Encapsulation du protocole CCSDS 133.0-B Space Packet : encoder un flux synthétique de paquets TM/TC (en-tête primaire de 6 octets + champ de données) et rapporter le décodage d'en-tête de chaque paquet, le total d'octets et un aller-retour encodage↔décodage exact. Encapsulation à disposition de bits exacte et déterministe — la couche d'interopérabilité des formats de paquets d'agence ; PAS une attestation de respect de la norme (pas de logique d'en-tête secondaire, de CRC ou de segmentation au-delà des indicateurs).

# text
# c1: scenarios/space-packet.toml
seg-757dec59102b = Une exécution de <c1/> se résume ainsi : space-packet : { "4" } paquet(s) TM CCSDS-133.0 encapsulé(s) APID { "100" }, { "152" } octets au total, aller-retour exact (true)

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-fd46ce63e6fc = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-packet.toml
seg-e3235e4d3760 = L'exemple <c1/> définit, entre autres :

# text
seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

# text
seg-5b3bc9761db4 = Premier

# text
seg-52036320db9b = TM

# text
seg-f336ba92871f = Libellé du résultat (celui du moteur) : encapsulation de l'en-tête primaire CCSDS 133.0-B Space Packet — disposition de bits exacte et déterministe, aller-retour encodage↔décodage vérifié ; PAS une attestation de respect de la norme (pas de logique d'en-tête secondaire, de CRC ou de segmentation au-delà des indicateurs)

# attr:alt
seg-af1cf9aa9938 = Le graphique que le moteur écrit pour scenarios/space-packet.toml, type space-packet

# text
seg-ff1f36904d38 = <b>VALIDATED</b> Encodage et décodage de l'en-tête primaire CCSDS 133.0-B Space Packet (version/type/sec-hdr/APID/seq-flags/count/data-length) + un scénario d'encapsulation. Tests : <a1>ccsds_space_packet_reference.rs</a1>.

# text
seg-82c617034322 = <b>VALIDATED</b> Extensions CCSDS 133.0-B-2 Space Packet à côté de l'en-tête primaire : un en-tête secondaire portant un code temporel CCSDS 301.0-B (CUC ou CDS, champ P explicite ou implicite) et des données auxiliaires, le champ de contrôle d'erreur de paquet CRC-16, la segmentation d'un Tests : <a1>space_packet_ext_oracle.rs</a1>.

# text
seg-94f3381476ee = <b>VALIDATED</b> Encodage et décodage de l'en-tête primaire CCSDS 133.0-B Space Packet (version/type/sec-hdr/APID/seq-flags/count/data-length) + un scénario d'encapsulation. Exécutable depuis la CLI ou le bind. Référence indépendante (ExternalDataset) : spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — une implémentation tierce indépendante de CCSDS 133.0-B-2 ; l'encode_packet/decode_packet de Kshana concordaient octet pour octet (l'en-tête primaire de 6 octets pour { "33" } cas + le paquet encodé complet pour { "12" })

# text
seg-bca17769398b = <s1>Précédent</s1>solar-system

# text
seg-6ef772483f30 = <s1>Suivant</s1>space-weather
