# docs--telecom-timing: translations (fr)

# text
seg-04ece0eb7bd2 = Identifiant de gabarit

# attr:aria-label, text
seg-a13eab564243 = MTIE

# attr:aria-label, text
seg-f155b7ceef1f = TDEV

# text
seg-42cdb8e987e6 = Budget

# text
seg-88372b30ed79 = Limite

# text
seg-50fffd444946 = { "100" } ns

# text
seg-79e6a31245f2 = { "400" } ns

# text
seg-f63dd3d7aad4 = Source

# text
seg-587beeccaa11 = Préréglage

# text
seg-edb7b16b6c0e = Validation

# text
seg-3c513ef2fd3b = Grandeur

# text
# c1: docs/TELECOM-TIMING.md
seg-62b6e83a9145 = Source : <c1/>

# text
seg-95222c3659cd = Synchronisation temporelle des télécoms : gabarits, sources et préréglages

# text
# c1: telecom-timing
# c2: src/telecom_timing.rs
# c3: scenarios/telecom-prtc-holdover-24h.toml
# c4: scenarios/telecom-synce-eec.toml
# c5: scenarios/telecom-tie-ingest.toml
seg-5a604e063370 = Cette page liste chaque limite que contrôle le type de scénario <c1/>, d'où chacune provient, et ce qui a été laissé de côté. Le code est <c2/>. Le scénario de référence est <c3/>, celui de synchronisation de fréquence est <c4/>, et l'exemple d'ingestion est <c5/>.

# text
seg-f078828b2325 = <b>Abréviations.</b> ITU-T désigne le Secteur de la normalisation des télécommunications de l'Union internationale des télécommunications. GNSS désigne le système mondial de navigation par satellite. TE est l'erreur de temps, la différence entre le temps d'une horloge et le temps de référence. max|TE| est la plus grande erreur de temps absolue. MTIE est l'erreur maximale d'intervalle de temps : la plus grande erreur de temps crête à crête à l'intérieur de toute fenêtre d'observation de longueur τ (tau). TDEV est l'écart de temps, une mesure en valeur quadratique moyenne de la dérive du temps pour un temps de moyennage τ. cTE est l'erreur de temps constante (le décalage moyen). dTE est l'erreur de temps dynamique (la part qui varie). TE_L et dTE_L sont l'erreur de temps après un filtre passe-bas du premier ordre de bande passante { "0.1" } hertz (Hz) ; dTE_H est la part au-dessus de ce filtre. TE_HO est l'erreur de temps en holdover. PRTC est l'horloge de temps de référence primaire. ePRTC est un PRTC amélioré. T-BC est l'horloge limite des télécoms et T-TSC est l'horloge esclave de temps des télécoms. PTP est le Precision Time Protocol. PPS est l'impulsion par seconde. OCXO est l'oscillateur à quartz thermostaté. CSAC est l'horloge atomique à l'échelle d'une puce. CSV désigne les valeurs séparées par des virgules. ADEV est l'écart-type d'Allan (σ_y), la mesure standard de la stabilité de fréquence. ns désigne les nanosecondes et µs les microsecondes. ppb désigne les parties par milliard (une fréquence fractionnaire de { "1e-9" }), et MHz le mégahertz. Amd. est un amendement à une Recommandation, et Y.1367 et les références semblables sont le numéro de la même Recommandation dans la série Y de l'ITU-T.

# text
# c1: allantools
seg-a7746845eb05 = <b>Ce que c'est.</b> Les estimateurs (MTIE et TDEV) sont vérifiés par rapport au paquet tiers <c1/> et sont VALIDATED à ce titre. Les tables de gabarits sont des transcriptions des Recommandations ci-dessous. Un holdover synthétique est un modèle construit à partir de chiffres de fiches techniques publiques. Le type de scénario est MODELLED dans son ensemble. Ce n'est pas un essai de respect de la norme, et un PASS ici n'est pas un certificat.

# text
seg-e4adedc8e36d = Sources lues

# text
seg-44f6d9a7906c = Tous les textes de l'ITU-T ont été téléchargés depuis itu.int le 2026-09-25. L'édition la plus récente lisible en entier a été utilisée.

# text
seg-28d4cebb747f = Recommandation

# text
seg-ef3644f3af9c = Édition lue

# text
seg-82dcf7b71cdb = Statut sur itu.int

# text
seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

# text
seg-f65ca7286466 = en vigueur

# text
seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

# text
seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), une publication en texte intégral

# text
seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

# text
seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), texte intégral

# text
seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

# text
seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), texte intégral

# text
seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

# text
seg-63c64d128cc6 = 03/2020 et son Amd. { "1" } (08/2024)

# text
seg-66209db00349 = Deux amendements plus récents existent mais n'ont pas pu être lus : G.8272 ({ "2025" }) Amd. { "1" } (08/2026) et G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Tous deux sont prépubliés et réservés aux membres de l'UIT (comptes du Telecommunication Information Exchange Service, TIES). S'ils modifient un chiffre ci-dessous, cette page et le code ne le reflètent pas encore.

# text
seg-25d639be3a1b = <b>Comment les nombres ont été vérifiés.</b> L'extraction de texte de ces fichiers Portable Document Format (PDF) perd la lettre grecque τ et le signe micro µ, de sorte que « { "0.275" } × { "10" }⁻³τ » devient « { "0.275" } × { "10" }⁻³ ». Chaque ligne des tables { "1" } à { "4" } de G.8272, des tables { "1" } à { "5" } de G.8272.1, de la table { "1" } de G.8271 et de la table 7-1 de G.8271.1 a donc été relue à partir de l'image de la page rendue. Les tables 7-1 à 7-5 de G.8273.2 et les tables 7-2 et 7-3 de G.8271.1 ont été lues dans du texte extrait où τ avait survécu. Lorsqu'une table implique une continuité en un point de rupture, un test unitaire la vérifie.

# text
seg-33b5f44c513b = Limites implémentées

# text
seg-3ce6da7e3e99 = τ est en secondes. Un intervalle écrit « { "0.1" } < τ ≤ { "273" } » est ouvert à { "0.1" } s et fermé à { "273" } s, exactement comme dans la table, et le code conserve chaque extrémité de la même façon.

# text
seg-1efb6779348a = ITU-T G.8272 (07/2025) : PRTC-A et PRTC-B, mode verrouillé

# text
seg-c54e45baa463 = max|TE|

# text
seg-25887373a479 = { "40" } ns

# text
seg-0e18047889c1 = clause { "6.1" }

# text
seg-4ce06948bf3f = MTIE (clause { "6.2" }) :

# text
seg-f1e336517976 = Gabarit

# text
seg-7c40080fe799 = Intervalle

# text
seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

# text
seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

# text
seg-a2ae8d8ad68a = Table { "1" }

# text
seg-d1b301281575 = { "0.10" } µs

# text
seg-22afd1138a6a = τ > { "273" }

# text
seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

# text
seg-95049bb8aaa1 = Table { "2" }

# text
seg-f2562bdf8fd5 = { "0.04" } µs

# text
seg-72ef2a66af58 = τ > { "54.5" }

# text
seg-d18148049b1e = TDEV (clause { "6.2" }) :

# text
seg-f492a7e39046 = { "3" } ns

# text
seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

# text
seg-7334c58cd44b = Table { "3" }

# text
seg-3bf4d8b009d5 = { "0.03" } τ ns

# text
seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

# text
seg-02bacda97914 = { "30" } ns

# text
seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

# text
seg-1c0341aaa919 = { "1" } ns

# text
seg-70c7899bf805 = Table { "4" }

# text
seg-8ec1f8c65e4f = { "0.01" } τ ns

# text
seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

# text
seg-2851f795541f = { "5" } ns

# text
seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

# text
seg-9b8478f86b44 = La clause { "6.2" } indique aussi que la période de mesure minimale pour le TDEV est de douze fois la période d'intégration (T = 12τ). Le type de scénario applique cette règle à chaque TDEV qu'il rapporte ; le TDEV n'est donc donné que pour τ jusqu'à un douzième de l'enregistrement. G.8272 n'énonce aucune exigence de holdover pour un PRTC.

# text
seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) : ePRTC

# text
seg-42c76f7b90ac = Mode verrouillé :

# text
seg-160dced77932 = { "4" } ns

# text
seg-88e8948869fc = { "0.1" } < τ ≤ { "1" }

# text
seg-c89d5cf52ad3 = { "0.11114" } τ + { "3.89" } ns

# text
seg-fad294d3be39 = { "1" } < τ ≤ { "100" }

# text
seg-e18d635df164 = { "0.0375" } × { "10" }⁻³ τ + { "15" } ns

# text
seg-273d60d5cd4a = { "100" } < τ ≤ { "400 000" }

# text
seg-4d971fea7954 = τ > { "400 000" }

# text
seg-4e9052bb688f = { "0.1" } < τ ≤ { "30 000" }

# text
seg-2401257610c6 = { "3.33333" } × { "10" }⁻⁵ τ ns

# text
seg-560ef6f53bf7 = { "30 000" } < τ ≤ { "300 000" }

# text
seg-727399dbf061 = { "10" } ns

# text
seg-3f5b5d8a1ea9 = { "300 000" } < τ < { "1 000 000" }

# text
seg-ca9cb946c8f4 = Holdover de l'ePRTC-A, erreur de temps (clause { "8.2.1" }, table { "3" }). L est la durée pendant laquelle l'ePRTC était verrouillé avant la perte, en jours, et t est le temps écoulé depuis le début du holdover, en secondes. La limite augmente linéairement de { "30" } ns à { "100" } ns sur la période de holdover H.

# text
seg-fa700160348e = Durée de verrouillage L

# text
seg-61f9dec111cb = Période de holdover H

# text
seg-f6a6df18839c = Limite sur |Δx(t)|

# text
seg-9229068d7534 = L < { "6" } jours

# text
seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } jour)

# text
seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

# text
seg-1af75c2d666f = { "6" } jours ≤ L ≤ { "40" } jours

# text
seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

# text
seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

# text
seg-71a6238f1e29 = L > { "40" } jours

# text
seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } jours)

# text
seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

# text
seg-3262966b5eab = Holdover de l'ePRTC-A, dérive (clause { "8.2.2" }) :

# text
seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

# text
seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

# text
seg-a4a813c38ef6 = Table { "5" }

# text
seg-5d56fb7889b2 = La clause { "8.3.1" } fixe l'erreur de temps maximale par défaut en holdover, max|TE_HO|, à { "100" } ns. Le type de scénario l'utilise comme budget par défaut de temps avant dépassement.

# text
seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) : T-BC et T-TSC

# text
seg-96b5072f792f = Classe A

# text
seg-7737bc0444b1 = Classe B

# text
seg-cd92242017a8 = Classe C

# text
seg-0689443dfc12 = Classe D

# text
seg-54163aca5d46 = max|TE| (non filtré)

# text
seg-b36412e1acfb = { "70" } ns

# text
seg-ed79e6cdac25 = à l'étude

# text
seg-5c2985d408e3 = Table 7-1

# text
seg-067c7c90c1e1 = max|TE_L| (passe-bas à { "0.1" } Hz)

# text
seg-1c5ac746d16b = Table 7-2

# text
seg-9802166ed2e2 = plage de cTE

# text
seg-b94484db77ab = ±{ "50" } ns

# text
seg-17d4f5817950 = ±{ "20" } ns

# text
seg-1399281b7ce6 = ±{ "10" } ns

# text
seg-a694039549c8 = Table 7-3

# text
seg-d8799ba27fc3 = MTIE de dTE_L, température constante

# text
seg-c332ee79beaf = Table 7-4, m ≤ τ ≤ { "1 000" }

# text
seg-2bd284168318 = TDEV de dTE_L, température constante

# text
seg-8358cf8c4e50 = { "2" } ns

# text
seg-6a1cc65603b3 = Table 7-5

# text
seg-de739a499521 = Dans la table 7-5, les classes A et B sont écrites m < τ ≤ { "1 000" } et la classe C est écrite m ≤ τ ≤ { "1 000" }. m vaut 1/16 s pour un flux PTP de { "16" } paquets par seconde et { "1" } s pour une sortie { "1" } PPS. Le type de scénario traite l'entrée comme une erreur d'intervalle de temps à { "1" } PPS, donc m = { "1" } s. La note { "1" } de la table 7-3 dit que cTE est estimée en moyennant l'erreur de temps sur { "1 000" } s. Le type de scénario rapporte la pire moyenne absolue de blocs consécutifs de { "1 000" } s.

# text
seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) : limites du réseau au point de référence C

# text
seg-8c2b01661011 = Les trois relèvent du cas de déploiement { "1" } et s'appliquent après un filtre passe-bas du premier ordre à { "0.1" } Hz.

# text
seg-b3f93a59a8eb = Clause

# text
seg-23e44eab6e8b = max|TE_L|

# text
seg-cb1a66f62f8e = Limite de MTIE

# text
seg-4aa99615d914 = { "7.3.1" } (applications de classe { "4" })

# text
seg-eacfcd0a9ea5 = { "1 100" } ns

# text
seg-dc2351580120 = { "100" } + { "75" } τ ns

# text
seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

# text
seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

# text
seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

# text
seg-884708f2736f = { "580" } ns

# text
seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

# text
seg-17c12885b0d1 = { "7.3.2" } (réseau amélioré)

# text
seg-fcd7cb03855f = { "600" } ns

# text
seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

# text
seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

# text
seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

# text
seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

# text
seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

# text
seg-f7fda527feed = { "200" } ns

# text
seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

# text
seg-1f0b651381ea = { "7.3.3" } (PRTC dans le réseau d'accès)

# text
seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

# text
seg-3aacef0066a0 = { "1" } < τ < { "400" }

# text
seg-f34cbd5ce7e4 = { "44" } ns

# text
seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

# text
seg-b0987b4e2e07 = La table 7-3 laisse τ = { "400" } s lui-même sans limite (une ligne se termine par « < { "400" } », la suivante commence par « { "400" } < »). Le type de scénario ne rapporte aucune limite à cet endroit plutôt que d'en choisir une. Le point de référence A (clause { "7.1" }) tire ses limites de G.8272 ; les gabarits PRTC ci-dessus le couvrent donc.

# text
seg-915182a7500e = Synchronisation de fréquence : génération de dérive selon G.811, G.812, G.8262 et G.8262.1 ({ "0.36" })

# text
# c1: scenarios/telecom-synce-eec.toml
seg-fb1342b76953 = Sept gabarits, chacun étant la limite de génération de dérive MTIE et TDEV à température constante (à ±{ "1" } K près), définie par le filtre de mesure passe-bas du premier ordre équivalent à { "10" } Hz que les clauses énoncent. Ce filtre agit avant l'échantillonnage ; le type de scénario prend donc l'enregistrement comme déjà mesuré à travers lui et n'applique rien. Le gabarit PRC vaut pour une horloge autonome (G.810 figure 2a, configuration d'horloge indépendante) ; les autres sont des limites en mode verrouillé pour une horloge synchronisée sur une référence sans dérive. Le scénario de référence est <c1/> : un OCXO en marche libre face aux trois gabarits EEC, ce qui surestime la contribution de l'oscillateur à des intervalles d'observation longs par rapport à la constante de temps de toute boucle.

# text
seg-3faf039b0ed9 = MTIE (ns)

# text
seg-ca33cbe4fd07 = TDEV (ns)

# text
seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }) ; { "0.01" } τ + { "290" } (τ > { "1 000" })

# text
seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }) ; { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }) ; { "30" } ({ "1 000" } < τ < { "10 000" })

# text
seg-cb38d6327e5c = G.811 (09/1997) clause { "6.1" }

# text
seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }) ; { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }) ; { "160" } ({ "400" } < τ ≤ { "10 000" })

# text
seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }) ; { "0.12" } τ ({ "25" } < τ ≤ { "100" }) ; { "12" } ({ "100" } < τ ≤ { "10 000" })

# text
seg-5e048893f25e = G.812 (06/2004) tables { "3" } et { "6" }

# text
seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }) ; { "2" } ({ "2.5" } < τ ≤ { "40" }) ; { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }) ; { "10" } (τ > { "1 000" })

# text
seg-ae92888ca436 = G.812 (06/2004) tables { "4" } et { "7" }

# text
seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }) ; { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }) ; { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }) ; { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }) ; { "6.4" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-8e825000b58e = G.8262 (10/2024) tables { "1" } et { "3" }

# text
seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }) ; { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }) ; { "60" } ({ "10" } < τ ≤ { "1 000" })

# text
seg-9ef5ff04e1d4 = comme la table { "7" } de G.812, fermé à { "10 000" } s

# text
seg-3ecb8d9128d0 = G.8262 (10/2024) tables { "4" } et { "5" }

# text
seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }) ; { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }) ; { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }) ; { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }) ; { "1.28" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-47d0f50aa906 = G.8262.1 (11/2025) tables { "1" } et { "3" }

# text
seg-45e4ed8fa6ea = Chaque ligne a été vérifiée par rapport au texte téléchargé depuis itu.int le 2026-10-13 : G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) et G.811 (09/1997). G.812 (06/2004) est indiquée comme remplacée par une édition 08/2026 prépubliée, et G.811 a un Amd. { "1" } (04/2016) ; ni l'un ni l'autre n'a pu être téléchargé, de sorte que, s'ils modifient un chiffre ci-dessus, cette page et le code ne le reflètent pas. Lorsque des coefficients imprimés rendent un point de rupture discontinu (par exemple { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns contre le palier de { "100" } ns de la table { "4" } de G.812), les tables sont conservées telles qu'imprimées et les tests unitaires bornent le saut. Non implémentés : les tolérances à température variable (G.812 table { "5" }, G.8262 table { "2" }, G.8262.1 table { "2" }), les exigences de holdover et de transitoires, la gigue, et la précision de fréquence G.811 de la clause { "5" }.

# text
seg-4f6666854cf7 = Budgets (temps avant dépassement)

# text
seg-1f3322a94bbb = max|TE_HO| par défaut de l'ePRTC

# text
seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) clause { "8.3.1" }

# text
seg-0d5433d85c88 = Allocation de holdover du réseau, courte interruption du GNSS

# text
seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) table V.1, scénario de défaillance (b), « re-arrangements and holdover in the network ». Un exemple d'allocation, et non une exigence.

# text
seg-afe6c9903ada = Limite du réseau au point de référence C

# text
seg-0c261b05c3cf = G.8271.1 clause { "7.3.1" }. C'est une grandeur filtrée ; comme budget, elle est comparée sans filtrage.

# text
seg-4b5a9718d008 = Application finale, classe de précision { "4" }

# text
seg-2a38e45e7008 = { "1.5" } µs

# text
seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) table { "1" }, classe { "4" }

# text
seg-ded846b5a4bc = <b>Le chiffre classique de « { "1.5" } µs de bout en bout ».</b> C'est l'exigence d'erreur de temps de classe { "4" } de la table { "1" } de G.8271, énoncée par rapport à une référence commune à l'application finale. La table V.1 de G.8271.1 montre comment un réseau peut l'allouer en fonctionnement normal : { "100" } ns pour le PRTC/grandmaster des télécoms, { "200" } ns pour l'erreur de temps dynamique de la chaîne, une erreur de temps constante pour les horloges et les liaisons, { "1 100" } ns au total au point de référence C, puis { "250" } ns pour les ré-arrangements et un court holdover dans l'application finale et { "150" } ns pour le bruit propre de l'application finale, { "1 500" } ns au point de référence E. Le scénario de défaillance (c) de la même table, « long holdover periods, e.g., { "1" } day », donne { "3 350" } ns en C et { "3 500" } ns en E (sa note { "5" } dit que dépasser { "1 500" } ns peut dégrader le service). Aucune des deux Recommandations n'énonce donc d'exigence de « { "1.5" } µs sur { "24" } heures de holdover », et le type de scénario n'en implémente aucune.

# text
seg-76cab595673a = Non confirmé ou non implémenté

# text
seg-175c282ddce2 = Rien de ce qui suit n'est implémenté comme gabarit. Rien n'a été complété par estimation.

# text
seg-3c74e4ba9579 = <b>Marqué « for further study » (à l'étude) dans les Recommandations :</b> G.8273.2 classe D max|TE|, cTE, MTIE et TDEV de dTE_L, dTE_H et holdover ; holdover de l'ePRTC-B (G.8272.1 clause { "8.2.1" }) ; MTIE et TDEV du holdover de l'ePRTC-A au-delà de { "10 000" } s (table { "4" } note { "1" }, table { "5" } note { "2" }) ; discontinuité de phase de l'ePRTC (clause { "7" }) ; holdover de phase/temps du T-BC/T-TSC avec perte à la fois des entrées PTP et de couche physique (G.8273.2 clause { "7.4.2.1" }) ; la limite de TDEV du réseau au point de référence C (G.8271.1 clauses { "7.3.1" } à { "7.3.3" }) ; limites du réseau pour le cas de déploiement { "2" } au point C.

# text
seg-93c60d44788e = <b>Transcrit mais non implémenté dans cette version :</b> G.8273.2 table 7-6 (MTIE à température variable : { "40" } / { "40" } / { "10" } ns jusqu'à { "10 000" } s), table 7-7 (dTE_H crête à crête : { "70" } / { "70" } / { "30" } ns, qui exige un filtre passe-haut à { "0.1" } Hz), table 7-10 (MTIE en holdover avec assistance de fréquence par la couche physique), erreur de temps relative (tables 7-8 et 7-9), et les limites de dTE_H de G.8271.1 clauses { "7.3.2" } ({ "50" } ns) et { "7.3.3" } ({ "70" } ns).

# text
seg-f5fcd3b0f8a5 = <b>Non appliqué :</b> le filtre à moyenne mobile d'au moins { "100" } échantillons que G.8272 et G.8272.1 énoncent pour les interfaces PTP. L'entrée est traitée comme une erreur d'intervalle de temps à { "1" } PPS, que ces Recommandations mesurent sans filtre.

# text
seg-74fe057a4392 = <b>Illisible :</b> les deux amendements restreints de { "2026" } nommés sous « Sources lues ».

# text
seg-bd4ec59cc872 = <b>Bizarrerie rédactionnelle :</b> dans G.8272.1 Amd. { "1" }, l'en-tête de la table { "3" } porte une ligne insérée « TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" } » en balisage d'amendement, au-dessus des colonnes d'erreur de temps. Elle n'est pas traitée comme faisant partie de l'enveloppe d'erreur de temps. Le même TDEV de { "1" } ns figure dans la table { "5" } et y est implémenté.

# text
seg-511db1219de1 = Le filtre de mesure

# text
seg-5fc683308b31 = G.8273.2 et G.8271.1 définissent leurs limites filtrées par un filtre passe-bas du premier ordre de bande passante { "0.1" } Hz. Le type de scénario applique le lisseur discret y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), initialisé au premier échantillon. C'est une approximation d'un équipement d'essai, et non la copie d'un instrument quelconque. Il n'est appliqué que lorsque l'intervalle d'échantillonnage Δt vaut { "1" } s ou moins. Un enregistrement plus grossier est rapporté NOT-EVALUATED par rapport à un gabarit filtré au lieu d'être mal filtré.

# text
seg-218e5ad620af = Préréglages d'oscillateurs (MODELLED)

# text
seg-28bb7b8ad89f = Chaque chiffre est celui de la fiche technique elle-même, lue le 2026-09-25.

# text
seg-b4207b682560 = Dispositif et document

# text
seg-13f9ba96c063 = Maxima d'ADEV utilisés (τ : σ_y)

# text
seg-d719167df981 = Vieillissement

# text
seg-f30740907f6a = Température

# text
seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz ; fiche technique Rev 12-1-2021

# text
seg-cefcf7025826 = { "1" } s : { "5e-12" } ; { "10" } s : { "8e-12" } ; { "100" } s : { "1e-11" } ; { "1 000" } s : { "5e-11" }

# text
seg-85f8b8fbbae6 = ±{ "0.15" } ppb/jour après { "72" } h (f ≤ { "10" } MHz)

# text
seg-0c6d3ae4e409 = ±{ "0.4" } ppb, de { "0" } °C à +{ "70" } °C, référencé à +{ "25" } °C

# text
seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, performances standard ; DS00003047A (2/20)

# text
seg-ccb8b3a41af4 = { "1" } s : { "3.0e-11" } ; { "100" } s : { "3.0e-12" }

# text
seg-ae0f630aba4b = <5e-11/mois après { "30" } jours

# text
seg-dbb2a780ceb9 = coefficient de température <{ "3E-10" }, de { "0" } °C à { "50" } °C

# text
seg-79d5b7a3a453 = Microchip 5071A, tube haute performance ; DS00002980D (5/25)

# text
seg-62572a695878 = { "1" } s : { "5.0e-12" } ; { "10" } s : { "3.5e-12" } ; { "100" } s : { "8.5e-13" } ; { "1 000" } s : { "2.7e-13" } ; 10⁴ s : { "8.5e-14" } ; 10⁵ s : { "2.7e-14" } ; { "5" } jours : { "1.0e-14" } ; { "30" } jours : { "1.0e-14" }

# text
seg-1fbdd6edc376 = aucun taux publié ; variation sur la durée de vie ≤{ "5.0e-14" }

# text
seg-bb485faf403a = ±{ "8.0e-14" } selon l'environnement (de { "0" } °C à { "50" } °C, humidité, champ magnétique, chocs)

# text
seg-889f4dc6cafc = Microchip SA.45s CSAC, options { "001" } et { "003" } ; DS00002985D (5/23)

# text
seg-ecee1cb2a670 = { "1" } s : { "3e-10" } ; { "10" } s : { "1e-10" } ; { "100" } s : { "3e-11" } ; { "1 000" } s : { "1e-11" }

# text
seg-c90e2f590297 = <9e-10/mois après { "30" } jours

# text
seg-5b1bd12aea0f = ±{ "5e-10" }, de −{ "10" } °C à { "70" } °C

# text
seg-63ba00e95bbc = Liens vers les documents : <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

# text
seg-31ad29d092ee = Laissés de côté volontairement : la ligne à { "10" } s du 8040C, que la fiche technique imprime « <{ "1.0" } x { "10" }^{ "11" } » (un exposant mal imprimé), et les lignes du 5071A en dessous de { "1" } s. L'OX-049 a été envisagé pour l'OCXO et n'a pas été retenu, parce que sa ligne de vieillissement ne peut pas être lue sans ambiguïté dans son tableau mal aligné.

# text
seg-8d4a915bc7fc = <b>Comment les chiffres deviennent un modèle.</b> Ce sont des choix de ce moteur, et chacun est consigné dans la sortie de l'exécution :

# text
seg-f1e6ea28601c = <b>Ajustement du bruit.</b> Les niveaux de bruit de fréquence blanc, de scintillation et de marche aléatoire résultent d'un ajustement par moindres carrés non négatifs aux maxima d'ADEV, puis sont majorés jusqu'à ce que le modèle soit au niveau ou au-dessus de chaque point. Les chiffres de la fiche technique sont des maxima ; le modèle les enveloppe donc.

# text
seg-0e5ab055094a = <b>Plancher de scintillation.</b> Le plancher n'est jamais inférieur à l'ADEV pour le plus long τ listé. Une fiche technique cesse de lister là où son fabricant cesse de promettre une amélioration ; le modèle ne laisse donc pas l'horloge s'améliorer au-delà. Cela ne peut qu'aggraver un holdover.

# text
seg-ebefbd6f119b = <b>Vieillissement.</b> Un chiffre mensuel est converti à { "30" } jours par mois et appliqué comme une dérive de fréquence linéaire à partir de l'instant de la perte. Le préréglage au césium n'a pas de vieillissement.

# text
seg-bb08c7b5baf5 = <b>Température.</b> La borne indiquée est lue linéairement sur la moitié de la plage de fonctionnement (par exemple ±{ "5e-10" } sur −{ "10" } °C à { "70" } °C donne { "1.25e-11" } par kelvin), puis pilotée par un profil de température sinusoïdal dont l'amplitude et la période sont des entrées du scénario. Rien dans une fiche technique ne dit que la dépendance est linéaire ; c'est une lecture du pire cas.

# text
seg-47a256757cfc = <b>Avant la perte</b>, l'horloge est asservie et son erreur de temps est un bruit de phase blanc de valeur à 1 sigma déclarée.

# text
seg-3ef60b128bb7 = <b>Ce que montre le scénario de référence.</b> Avec les entrées versionnées (rubidium, variation quotidienne de température de ±{ "2" } K, holdover de { "24" } h après { "1" } h de verrouillage), l'enregistrement atteint une plus grande erreur de temps absolue de { "603.2" } ns. Il franchit le budget ePRTC de { "100" } ns { "8 206" } s après la perte et l'allocation de { "400" } ns après { "25 713" } s, et reste à l'intérieur de { "1 100" } ns et de { "1.5" } µs pendant toute la journée. Il échoue à l'enveloppe de holdover de l'ePRTC-A { "3 627" } s après la perte, ce qui est attendu : cette exigence suppose une référence de classe césium. Le terme de température seul peut atteindre { "660" } ns ; avec ces entrées, il compte donc plus que le vieillissement ({ "72" } ns à la fin de la journée).

# text
# c1: tests/telecom_timing_reference.rs
# c2: allantools
# c3: tests/fixtures/telecom_timing/holdover_te_series.csv
# c4: docs/VERIFICATION-MATRIX.md
seg-ba87d450423c = <c1/> vérifie le MTIE et le TDEV du type de scénario par rapport à <c2/> { "2024.06" } sur <c3/>, une série de holdover de CSAC de { "2" } 048 échantillons avec vieillissement, scintillation et température. Sur { "17" } facteurs de moyennage pour le MTIE et { "12" } pour le TDEV, le MTIE concorde exactement et le TDEV concorde à { "1.1e-15" } en relatif. Les mêmes courbes sont relues à partir d'une exécution complète qui ingère le CSV. Cela valide les estimateurs sur cet enregistrement. Cela ne valide ni le holdover synthétique, ni les gabarits, ni les préréglages, qui sont des lignes MODELLED dans <c4/>.

# text
seg-6fdc3cc32a2f = <s1>Précédent</s1>Synchronisation temporelle par créneaux

# text
seg-1108b114de88 = <s1>Suivant</s1>Temps trompé
