# docs--kind-leo-pvt: translations (fr)

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-b054c73f22e5 = aucune valeur

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Page thématique : <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Type de scénario du moteur v{ $version }, famille <a1>Navigation en orbite basse</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-c5478f572d21 = Page de famille : <a1>Navigation en orbite basse</a1>

# text
seg-be21370c2446 = joint

# text
# c1: docs/kinds/by-kind/leo-pvt.md
seg-dfe64e82e4e9 = Source : <c1/>

# text
# c1: leo-pvt
seg-fdba999dab11 = <c1/> (type de scénario)

# text
seg-093aac4b5ff1 = Positionnement, navigation et synchronisation temporelle (PNT) fusionnés en orbite terrestre moyenne (MEO) et basse (LEO) sur N'IMPORTE QUELLES constellations : chaque [[system]] est un préréglage GNSS du type de scénario constellation-design, un préréglage LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, le modèle d'éphéméride atomic-zero-clock, ou un autre fichier de préréglage, chacun dans son propre fichier avec ses sources marquées PUBLIC, WORKSHOP ou DERIVED), des coquilles de Walker ou des jeux d'éléments explicites, avec une porteuse, une cadence de chip, une enveloppe de densité porteuse/bruit (C/N0) du masque d'élévation au zénith, une erreur de distance du signal dans l'espace (SISRE), un sigma Doppler et un modèle d'horloge (sa propre horloge de récepteur, de sorte que le biais inter-systèmes est estimé, ou un décalage diffusé connu). Quatre modes. DOPPLER : positionnement par lots de Gauss-Newton à partir du taux de variation de distance avec dérivées partielles analytiques, états de dérive d'horloge et de vitesse facultatifs et contrainte de hauteur facultative, à un ou plusieurs satellites, l'erreur en fonction de la longueur de la fenêtre, l'enveloppe de Doppler, de taux de Doppler et de saccade de chaque système LEO, et la précision le long de la trace et transversale d'un passage unique en fonction du décalage transversal (l'erreur transversale croît sans borne à mesure que le passage survole l'utilisateur ; un passage unique a aussi une solution miroir de l'autre côté de la trace au sol). Un signal d'opportunité à Doppler seul (starlink-sop) s'exécute ici. JOINT : points fixes de pseudodistance par moindres carrés pondérés à chaque époque à partir du GNSS seul, du LEO seul et des deux, écarts-types par mesure issus d'un modèle de bruit thermique de boucle à verrouillage de retard au C/N0 plus le SISRE (ou un sigma fixe, de sorte qu'un modèle de signal puisse les alimenter), les biais inter-systèmes estimés, et PDOP/HDOP/VDOP en fonction du nombre de satellites LEO ajoutés. POLAR : satellites en vue et DOP en fonction de la latitude pour le GNSS, le LEO et les deux. TIMING : transfert de temps vers le Temps universel coordonné (UTC) à partir de satellites LEO à position connue avec un filtre d'horloge à deux états dont le bruit de processus provient des classes d'oscillateurs du moteur, en fonction du C/N0 et de l'oscillateur, et l'expression temps système vers UTC de l'IS-GPS-200 ; avec [timing] trace = true chaque ligne rapporte aussi son erreur de temps et son sigma prédit à chaque époque. VALIDATED : le plus grand Doppler d'un passage de l'aplomb à l'horizon par rapport aux chiffres publiés d'Iridium (jusqu'à { "36" } kHz) et de Xona Pulsar X1 ({ "32" } à { "34" } kHz). MODELLED : tout le reste ; le DOP est vérifié par rapport à un cas dérivé à la main, les points fixes par rapport à leur covariance, et le modèle Doppler par rapport à l'identité d'accélération de distance.

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f34d4bbcac4d = Une exécution de <c1/> se résume ainsi : LEO PVT (joint) at { "61.10" }, { "6.60" } over { "1800" } s GPS gnss { "24" } sats at { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sats at { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sats at { "1080" } km, { "1190.52" } MHz LEO ranging satellite in view on { "100.0" }% of epochs GNSS only availability { "1.000" }, median PDOP { "1.48" }, RMS 3D error { "1.29" } m LEO only availability { "1.000" }, median PDOP { "2.33" }, RMS 3D error { "0.69" } m fused availability { "1.000" }, median PDOP { "1.14" }, RMS 3D error { "0.63" } m

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-e271a69236bf = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f850cba7d96e = L'exemple <c1/> définit, entre autres :

# text
seg-bb3b3e8be839 = fjord

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-b43a7ee40372 = Étiquette du résultat (celle du moteur) : positionnement conjoint MODELLED par pseudodistances aux moindres carrés pondérés avec une horloge par système ou un décalage connu ; bruit issu du modèle de boucle à verrouillage de retard à l'enveloppe de C/N0 plus l'erreur de distance du signal dans l'espace

# attr:alt
seg-90361a6f4e3c = Le graphique que le moteur écrit pour scenarios/leo-pvt-fjord-skyline.toml, type de scénario leo-pvt

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-68aa305e05a4 = <b>VALIDATED</b> Taux de variation de distance exact d'un satellite dont la position et la vitesse dans le référentiel terrestre proviennent d'une orbite à deux corps avec la dérive séculaire J2 et la rotation de la Terre (leo_fusion::geom::EarthOrbit::state, la vitesse étant la dérivée temporelle exacte de la position), Tests : <a1>leo_doppler_reference.rs</a1>.

# text
seg-c3ef3e0163f2 = <b>MODELLED</b> Positionnement par lots de Gauss-Newton à partir du taux de variation de distance avec dérivées partielles analytiques (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), une vitesse d'utilisateur constante en option, une pseudo-mesure de hauteur pour un utilisateur en surface, s amorti Tests : <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-a4e0166269ea = <b>MODELLED</b> Points fixes de Gauss-Newton aux moindres carrés pondérés sur un mélange quelconque de systèmes, une horloge de récepteur par système (le biais inter-systèmes estimé avec la position) ou un décalage diffusé connu sur l'échelle de temps de référence ; écarts-types par mesure fournis par Tests : <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-5c9f826efbc8 = <b>MODELLED</b> Mesures d'horloge de chaque satellite LEO en vue à une position connue, combinées par variance inverse à partir du modèle de bruit de pseudodistance, filtrées par un filtre de Kalman à deux états (phase, fréquence) dont le bruit de processus est celui de la classe d'oscillateur w Tests : <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-3319b18ac61f = et { "1" } autre dans la matrice.

# text
seg-f6bd93155e41 = <b>MODELLED</b> Points fixes de Gauss-Newton aux moindres carrés pondérés sur un mélange quelconque de systèmes, une horloge de récepteur par système (le biais inter-systèmes estimé avec la position) ou un. Référence indépendante (InternalConsistency) : un DOP à quatre satellites dérivé à la main (un satellite au zénith et trois à l'horizon espacés de { "120" } deg, dont la matrice normale s'inverse à la main), l'identité structurelle selon laquelle un système avec sa propre horloge et un satellite n'ajoute aucune géométrie, une récupération sans bruit de la position, de l'horloge et du biais, et des erreurs à graine fixe par rapport à la covariance. Contrôles internes seulement ; non comparé à la sortie d'un récepteur. { "0.30" } comparaison externe, un constat

# text
seg-4056b0470099 = <b>MODELLED</b> Entrées indépendantes du système : chaque système est des coquilles de Walker, des éléments explicites ou un préréglage GNSS, un signal (porteuse, cadence de chip, largeur de bande, puissance reçue ou plage de C/N0. Référence indépendante (InternalConsistency) : transcription des valeurs publiques citées, vérifiée sur la structure (chaque source publique a une URL, les motifs de Walker se divisent exactement, le C/N0 issu de la puissance reçue sur kT à { "290" } K), et non par rapport à une référence indépendante externe. Les valeurs représentatives sont nommées dans chaque préréglage et sont illustrati

# text
# c1: label
seg-df745ccdaceb = Positionnement MODELLED conjoint par moindres carrés pondérés sur pseudodistances, avec une horloge par système ou un décalage connu ; bruit issu du modèle de boucle à verrouillage de retard à l'enveloppe de C/N0, plus l'erreur de distance du signal dans l'espace (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-c988291eb41d = MODELLED : tout le reste ; le DOP est vérifié sur un cas calculé à la main, les positions calculées par rapport à leur covariance, et le modèle Doppler par rapport à l'identité de l'accélération en distance. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana skyline --preset fjord
seg-be908356ad19 = Le préréglage de profil d'horizon est REPRESENTATIVE (provenance dans docs/SKYLINE.md et <c1/>) : l'ordre de grandeur de la largeur et du relief des fjords profonds de l'ouest de la Norvège, et non un relevé d'un fjord particulier. Ligne de visée seulement : ni diffraction, ni réflexion, ni réception hors ligne de visée. Retirez la section [skyline] pour comparer avec un ciel dégagé. MODELLED. (commentaire du fichier de scénario, lignes { "15" } à { "18" })

# text
seg-1d0ab26930e1 = Le positionnement conjoint par pseudodistances GNSS et LEO, avec biais inter-systèmes et modèles d'erreur par signal, est MODELLED, et non vérifié : il est contrôlé par rapport à sa propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-35916a8ac93e = Les systèmes LEO PNT nommés, fournis comme préréglages de données facultatifs avec leur source, sont MODELLED, et non vérifiés : ils sont contrôlés par rapport à leur propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-6ac7dcc57b2a = <s1>Précédent</s1>leo-ppp

# text
seg-458b3eda3250 = <s1>Suivant</s1>leo-signal
