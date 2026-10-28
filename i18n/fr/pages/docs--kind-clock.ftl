# docs--kind-clock: translations (fr)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/clock.md
seg-33555d61ddc6 = Source : <c1/>

# text
# c1: clock
seg-618393657d01 = <c1/> (type de scénario)

# text
seg-c61e88721556 = Type de scénario du moteur v{ $version }, famille <a1>Horloges, synchronisation temporelle et holdover</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-78cba87823f7 = Holdover d'horloge par rapport à la spécification ; ensemble Monte-Carlo facultatif (runs > { "1" }).

# text
# c1: scenarios/clock-ensemble.toml
seg-dd2ad570a6c9 = Une exécution de <c1/> se résume ainsi : scenario 91d2b6d10d14 | { "200" } runs | quantum holdover 6600s [6600-6600] p95 8.78e-4ns security n/a (no attack) | classical holdover 844s [220-2130] p95 167.0ns security n/a (no attack)

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
seg-51820163de28 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
# c2: integrity
seg-80fe14eb5e79 = Champs facultatifs : <c1/>, <c2/>

# text
# c1: scenarios/clock-ensemble.toml
seg-807e7c5a2565 = L'exemple <c1/> définit, entre autres :

# text
seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)={ "3e-10" }; q_

# text
seg-a8d92406e428 = Strontium optical lattice clock, space-oriented goal sigma_y

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# attr:alt
seg-cb0b7da83f5c = Le graphique que le moteur écrit pour scenarios/clock-ensemble.toml, type de scénario clock

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> La section facultative [integrity] du type de scénario clock (clock_integrity::run) : à partir d'un site indiqué et de préréglages de constellation (geometry::sky_geometry), à chaque époque d'intégrité tant que la chronologie GNSS n'est pas refusée, RAIM instantané (raim::snapshot_ Tests : <a1>clock_integrity.rs</a1>.

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input : une couche d'analyse unique qui transforme un fichier d'horloge RINEX (enregistrements AS/AR d'une horloge nommée, versions { "2" } et { "3.00" } à { "3.04" }), un journal ASCII de phase ou de fréquence de type TimeLab, ou un journal d'horodatages ou d'intervalles TAPR TICC en un fichier uniforme de pha Tests : <a1>clock_log_allantools.rs</a1>.

# text
seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input avec les formats ptp4l, phc2sys, ts2phc, chrony-tracking et chrony-statistics : le décalage consigné d'une ligne d'asservissement linuxptp (ns, l'horodatage entre crochets propre à la ligne, les mesures antérieures au premier rapport de l'asservissement s2 écartées a

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Écart-type d'Allan / modifié / d'Hadamard + identification du bruit en loi de puissance avec intervalles de confiance en χ². Référence indépendante (ExternalDataset) : NIST SP { "1065" } (Riley) / écarts-types de référence de Stable32 sur NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Croissance de l'erreur de dérive en forme fermée + holdover jusqu'au seuil ; classes d'horloges quantiques. Référence indépendante (ReferenceImpl) : récurrence de covariance multi-pas de clock_state (recoupement au sein de la même base de code) ; le noyau sous-jacent de variance de dérive et d'inversion du holdover est validé en externe par rapport à scipy (voir « Clock-holdover coast-variance & threshold inversion »). Les chiffres de holdover par classe au plancher de bruit rouge restent MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Horloge de Kalman de van Loan à 3 états (phase/fréquence/dérive), stabilisée de Joseph. Référence indépendante (ReferenceImpl) : filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), avec F via scipy.linalg.expm et Q via la matrice par blocs de Van Loan { "1978" } — une implémentation de référence indépendante qui reproduit toute la trajectoire du filtre de kshana. Cohérence entre implémentations : la physique de l'horloge et l'étalonnage d'Allan ne sont pas validés en externe, ce qui laisse cela MODELLED. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur les horloges IGS finales de { "30" } s de { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> χ² assisté par l'horloge, RAIM, AGC, SQM fusionnés en un indice de mérite de sécurité par époque. Référence indépendante (ExternalDataset) : paramètres de scénario TEXBAT (Humphreys { "2012" }) — caractérisation, et non vecteurs figés. { "0.30" } comparaison externe, un constat (reste MODELLED) : sur JammerTest { "2024" } (Bleik ; données GPL-3.0) les moniteurs de niveau observable (khi-deux assisté par l'horloge, RAIM, échec de résolution) n'ont déclenché aucune alarme dans les { "10" } s suivant l'un des { "8" } débuts de leurrage publiés évaluables (là où la fenêtre précédant le début était propre, la première alarme est venue { "10.2" } à { "39" } s après le pu

# text
seg-e12f672ae71d = Le holdover d'horloge sans GNSS est MODELLED, et non validé : vérifié par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = L'estimation de l'état de l'horloge embarquée est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = La détection du leurrage est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-849c08d3ce70 = Page de famille : <a1>Horloges, synchronisation temporelle et holdover</a1>

# text
seg-ee7dd15019d0 = Page thématique : <a1>CAMPAIGNS.md</a1>

# text
seg-46ed0b786244 = Page thématique : <a1>RECEIVER-TRUST.md</a1>

# text
seg-e06f9a5a0291 = <s1>Précédent</s1>cislunar-observability

# text
seg-aba9395185fa = <s1>Suivant</s1>combined-altpnt

seg-d1beb62cf742 = { "6" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

seg-936e96edf423 = <b>MODELLED</b> Le type <c1/> : un document de phases, chacune d'un des huit types enregistrés, exécutées dans l'ordre avec la covariance 6x6, l'horloge et le référentiel transmis selon une règle déclarée (<c2/> ; <c3/>, bruit d'accélération blanc sur un intervalle déclaré Tests : <a1>field_units_global.rs</a1>.

seg-3319b18ac61f = et { "1" } autre dans la matrice.
