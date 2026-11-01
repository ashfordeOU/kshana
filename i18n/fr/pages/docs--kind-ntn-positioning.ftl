# docs--kind-ntn-positioning: translations (fr)

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
seg-a3697ad561db = Hz

# text
seg-a849735fcc6e = Page thématique : <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Type de scénario du moteur v{ $version }, famille <a1>Navigation en orbite basse</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-c5478f572d21 = Page de famille : <a1>Navigation en orbite basse</a1>

# text
# c1: docs/kinds/by-kind/ntn-positioning.md
seg-8dcdfc5da900 = Source : <c1/>

# text
# c1: ntn-positioning
seg-d865fd8ceef6 = <c1/> (type de scénario)

# text
seg-4f0edb786a35 = Positionnement à partir d'une liaison descendante de réseau non terrestre (NTN) 5G dans la bande S du service mobile par satellite (MSS) (bande 3GPP n256, liaison descendante de { "2170" } à { "2200" } MHz ; porteuse par défaut { "2172.5" } MHz) : la borne de Cramér-Rao (CRB) sur le temps d'arrivée, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)) avec beta la largeur de bande efficace (de Gabor) du spectre OFDM plat (B/sqrt({ "12" })), et sur le Doppler d'un ton complexe, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), pour chaque signal (par défaut un canal New Radio de { "5" } MHz avec { "4.5" } MHz occupés et un canal à bande étroite de { "200" } kHz avec { "180" } kHz occupés) ; puis, sur toute constellation LEO, des positions calculées par temps d'arrivée en liaison descendante avec une horloge de récepteur inconnue (initialisées par une graine, avec la borne plus une erreur de synchronisation du réseau comme sigma), leur PDOP et leur sigma 3D formel, et une position calculée par Doppler à un seul satellite sur le passage le plus long avec la hauteur maintenue. MODELLED : le passage de la largeur de bande à la borne est la forme close de manuel, contrôlée par rapport à l'intégration numérique des spectres BPSK plat et limité en bande (cohérence interne, aucune valeur publiée de calcul détaillé n'est figée), et la précision de positionnement est une borne sur un canal sans multitrajet avec une erreur de synchronisation donnée, et non un résultat atteint.

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-fea5da29df00 = Une exécution de <c1/> se résume ainsi : 5G NTN positioning at { "2172.5" } MHz, C/N0 { "38" } to { "50" } dB-Hz, { "324" } satellites ({ "10.0" } in view) NR { "5" } MHz: { "4500" } kHz, CRB range { "0.26" } to { "1.03" } m; median formal 3D { "2.09" } m, RMS error { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB range { "6.49" } to { "25.85" } m; median formal 3D { "25.94" } m, RMS error { "26.73" } m one-satellite Doppler pass: { "53" } samples over { "520" } s, horizontal error { "1.9" } m

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-145582d62c8c = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-7ff965e77d23 = L'exemple <c1/> définit, entre autres :

# text
seg-409755afa2dd = NR { "5" } MHz

# text
seg-a99a71f7178a = NB { "200" } kHz

# text
seg-d04c7f65307d = index

# text
seg-3a0cde9988c3 = Libellé du résultat (celui du moteur) : positionnement MODELLED à partir de bornes de Cramér-Rao : le passage de la largeur de bande à la borne est une forme close de manuel (contrôlée par rapport à l'intégration numérique, et non à une valeur publiée de calcul détaillé) ; la précision est une borne sur un canal sans multitrajet avec une erreur de synchronisation donnée, et non un résultat atteint

# attr:alt
seg-c200240dd65e = Le graphique que le moteur écrit pour scenarios/ntn-5g-positioning.toml, type de scénario ntn-positioning

# text
seg-056b5f3c8201 = <b>VALIDATED</b> La borne de Cramér-Rao sur le temps d'arrivée à partir de la largeur de bande efficace (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), pour un spectre OFDM plat (beta = B/sqrt({ "12" })), un spectre BPSK limité en bande (numérateur en forme close) ou tout spectre par quadr Tests : <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-c188cecaf468 = <b>VALIDATED</b> La borne de Cramér-Rao sur le temps d'arrivée à partir de la largeur de bande efficace (de Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), pour un spectre OFDM plat (beta = B/sqrt({ "12" }). Référence indépendante (ExternalDataset) : valeurs publiées détaillées (P1) : Bachl, Lei et Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), bornes d'un seul SSB du NR NTN reproduites à partir de la carte SSB de la 3GPP TS { "38.211" } par les propres fonctions numériques de Kshana (W_rms { "1.9616" } contre { "1.96" } MHz, sigma_t { "38.755" } contre { "39" } us, sigma_f 100.79/87.28 contre 101/87 Hz, sigma_rho 0.5970/0.5831 contre 0.60/0.58 m, chacune à moins d'une demi-unité du dernier chiffre imprimé) ; largeurs de bande efficaces BPSK-R de Betz { "2001" } Table { "1" } (1.128/3.477 contre

# text
# c1: label
seg-baa462153341 = Positionnement MODELLED à partir de bornes de Cramér-Rao : le passage de la largeur de bande à la borne est une forme close de manuel (contrôlée par rapport à l'intégration numérique, et non à une valeur publiée de calcul détaillé) ; la précision est une borne sur un canal sans multitrajet avec une erreur de synchronisation donnée, et non un résultat atteint (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-c4a9693d1191 = MODELLED : le passage de la largeur de bande à la borne est la forme close de manuel, contrôlée par rapport à l'intégration numérique des spectres BPSK plat et limité en bande (cohérence interne, aucune valeur publiée de calcul détaillé n'est figée), et la précision de positionnement est une borne sur un canal sans multitrajet avec une erreur de synchronisation donnée, et non un résultat atteint. (catalogue des types de scénario (<c1/>))

# text
seg-e23e35aa1203 = Le passage de la largeur de bande à la borne est une forme close de manuel ; la précision de positionnement est MODELLED (une borne sur un canal sans multitrajet, et non un résultat atteint). (commentaire du fichier de scénario, lignes { "12" } à { "13" })

# text
seg-ccb921bf73b5 = <s1>Précédent</s1>moonlight-service-volume

# text
seg-467bd80c37f8 = <s1>Suivant</s1>oem-interop
