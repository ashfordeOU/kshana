# docs--kind-leo-pass: translations (fr)

# text
seg-ad20a7bebf23 = STL

# text
seg-37d16b499bc5 = dB

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
seg-49964654d5f4 = Type de scénario du moteur v{ $version }, famille <a1>Navigation en orbite basse</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-c5478f572d21 = Page de famille : <a1>Navigation en orbite basse</a1>

# text
# c1: docs/kinds/by-kind/leo-pass.md
seg-fad0b45fd9c2 = Source : <c1/>

# text
# c1: leo-pass
seg-f0433f09f033 = <c1/> (type de scénario)

# text
seg-c3861f7d717c = Passage LEO et bilan de liaison, bande par bande, pour le LEO-PNT (positionnement, navigation et synchronisation temporelle depuis l'orbite terrestre basse), indépendant du système : un utilisateur (au sol, maritime, aérien ou en intérieur, statique ou mobile) et un ou plusieurs satellites LEO à partir d'un PASS CONÇU (une orbite circulaire placée de sorte que l'utilisateur voie un passage d'une élévation maximale choisie à un instant choisi, héliosynchrone si demandé), d'ÉLÉMENTS explicites, d'un TLE (jeu d'éléments à deux lignes) via le SGP4 du moteur, ou d'une constellation WALKER construite par le code constellation-design (les passages les plus hauts rapportés). Les bandes proviennent d'un préréglage nommé (UHF/L/S/C multibande générique, bande C générique, Xona Pulsar X1/X5, Iridium STL, Starlink comme signal d'opportunité à Doppler seul, CentiSpace, et un préréglage Celeste IOD facultatif marqué WORKSHOP) ou sont écrites dans le scénario ; chaque préréglage indique si ses chiffres sont PUBLIC (avec URL), REPRESENTATIVE ou WORKSHOP. Par satellite, bande et époque : élévation, azimut, distance, taux de variation de distance et accélération de distance ; affaiblissement en espace libre ; PIRE et gain du diagramme du satellite (isoflux, faisceau gaussien ou plat) ; gain de l'antenne de l'utilisateur en fonction de l'élévation (patch, hémisphérique ou isotrope) ; atténuation gazeuse (ITU-R P.676-10 annexe { "2" }), atténuation par la pluie (coefficients ITU-R P.838-3 et procédure P.618-14, à partir d'un taux de pluie et d'une hauteur de pluie), scintillation troposphérique (ITU-R P.618-14 section { "2.4.1" }), perte de pénétration dans les bâtiments pour un utilisateur en intérieur (ITU-R P.2109-2), désadaptation de polarisation, température de bruit du système et C/N0 (densité porteuse/bruit) ; Doppler et taux de Doppler en forme fermée à partir du taux de variation de distance et de l'accélération de distance, chacun vérifié par différences centrales ; le retard ionosphérique au premier ordre { "40.3" } STEC/f^{ "2" } à partir d'un TEC oblique de Klobuchar ou de TEC vertical mis à l'échelle de la partie de l'ionosphère située sous le satellite. Les paires de bandes reçoivent les coefficients sans ionosphère, l'amplification du bruit et le bruit de code au pic du passage. Les satellites GNSS en MEO (préréglages Galileo ou GPS) sont évalués avec le même modèle d'antenne et de bruit à partir des puissances reçues de leurs documents d'interface, de sorte que le passage LEO en cloche et les porteuses GNSS plates partagent un même graphique. Une section [iot] facultative donne le temps jusqu'au premier point fixe, l'énergie par point fixe et l'autonomie de la batterie en fonction du cycle de service pour un budget de puissance de récepteur indiqué (MODELLED). Chaque paire de bandes donne aussi le TEC oblique que sa combinaison sans géométrie retrouve au pic et l'écart-type de bruit de code de cette estimation (sondage de l'ionosphère). Une section [spoofer] facultative contrefait les signaux d'une position annoncée qui saute ou est écartée de la position réelle après un début, et exécute deux moniteurs avec des probabilités de fausse alarme et de détection manquée indiquées : cohérence du Doppler et de la géométrie de passage (taux de variation de distance mesurés par rapport à ceux prédits à partir des orbites et d'une position et vitesse a priori indépendantes, un test du khi-deux par moindres carrés généralisés sur une fenêtre, sur les canaux GNSS, LEO et tous) et cohérence inter-bandes (le pas d'époque à époque de la combinaison sans géométrie corrigée du modèle de chaque paire de bandes LEO), rapportant les statistiques par époque et le moment où chaque moniteur détecte (MODELLED). Composants VALIDATED : l'affaiblissement en espace libre, les coefficients P.838-3 par rapport à son tableau { "5" }, les procédures de pluie et de scintillation P.618-14 et la perte de pénétration dans les bâtiments P.2109 par rapport aux exemples de validation du groupe d'études { "3" } de l'ITU-R, le rapport de retard de groupe L1/L2 de l'IS-GPS-200, et le Doppler maximal d'un utilisateur statique sur une orbite circulaire par rapport au tableau { "1" } de arXiv { "2509.19551" }. MODELLED : les PIRE, les diagrammes, la fraction de Chapman du TEC sous le satellite et l'ensemble du passage.

# text
# c1: scenarios/leo-pass-iridium.toml
seg-04509d8245b7 = Une exécution de <c1/> se résume ainsi : LEO pass link budget, air user at { "50.00" }, -30.00; { "1" } LEO satellite(s), { "900" } s window Iridium-pass [iridium-stl PUBLIC]: { "781" } km, max elevation { "65.0" } deg at { "444" } s, { "750" } s above the mask STL { "1621.000" } MHz: C/N0 peak { "80.5" } dB-Hz median { "71.3" } dB-Hz; |Doppler| max { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } in view, C/N0 { "38.2" } dB-Hz to { "51.1" } dB-Hz (median { "46.2" } dB-Hz) LEO STL peak { "80.5" } dB-Hz is { "34.3" } dB above the GNSS median; above the strongest GNSS carrier for { "750" } s

# text
# c1: epoch
# c2: duration_s
# c3: step_s
# c4: user
# c5: atmosphere
# c6: ionosphere
# c7: satellite
# c8: leo_constellation
# c9: gnss
# c10: iono_free_pairs
# c11: iot
# c12: spoofer
# c13: name
# c14: description
# c15: skyline
seg-e6f4e5c502d7 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pass-iridium.toml
seg-e12426a79a2f = L'exemple <c1/> définit, entre autres :

# text
seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

# text
seg-7cd17bf1ac74 = Iridium STL depuis un aéronef

# text
seg-f4d857403ae0 = descending

# text
# c1: scenarios/
seg-08bc462d676c = { "8" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-ee6d9e6d9556 = Étiquette du résultat (celle du moteur) : MODELLED : géométrie de passage LEO et bilan de liaison par bande à partir de PIRE indiquées et de diagrammes d'antenne idéalisés avec des termes de propagation ITU-R ; les modèles de composants portent leurs propres étiquettes dans la matrice de vérification. Ce n'est pas une mesure d'un satellite quelconque.

# attr:alt
seg-02ae51cfada6 = Le graphique que le moteur écrit pour scenarios/leo-pass-iridium.toml, type de scénario leo-pass

# text
seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-69ed19957592 = <b>VALIDATED</b> Équations ({ "1" }) à ({ "5" }) de l'ITU-R (Union internationale des télécommunications, Secteur des radiocommunications) P.838-3 : k_H, alpha_H, k_V, alpha_V à partir des ajustements de courbe des tableaux { "1" } à { "4" }, le (k, alpha) dépendant du trajet et de la polarisation et l'atténuation linéique Tests : <a1>leo_link_reference.rs</a1>.

# text
seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 section { "2.2.1.1" } étapes { "2" } à { "10" } (trajet oblique et horizontal sous la hauteur de pluie, facteurs de réduction horizontale et d'ajustement vertical, A0.01 et sa mise à l'échelle de { "0.001" } % à { "5" } % d'une année moyenne), avec la hauteur de pluie (P.839) a Tests : <a1>leo_link_reference.rs</a1>.

# text
seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 section { "2.4.1" } étapes { "3" } à { "9" } (sigma de référence à partir de N_wet, longueur de trajet effective, facteur de moyennage de l'antenne, profondeur d'évanouissement pour { "0.01" } % à { "50" } % du temps), avec N_wet en entrée ou calculé à partir de la température, de l'humidité et de la pression par t Tests : <a1>leo_link_reference.rs</a1>.

# text
seg-7e52290d354c = <b>VALIDATED</b> Équations ({ "1" }) à ({ "10" }) de l'ITU-R P.2109-2 annexe { "1" } avec le tableau { "1" } : la perte non dépassée avec la probabilité P pour des bâtiments traditionnels et à efficacité thermique, à l'élévation du trajet à la façade, de { "80" } MHz à { "100" } GHz ; appliquée par bande et par époque Tests : <a1>leo_link_reference.rs</a1>.

# text
seg-ac1927b760d5 = et { "8" } autres dans la matrice.

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 section { "2.4.1" } étapes { "3" } à { "9" } (sigma de référence à partir de N_wet, longueur de trajet effective, facteur de moyennage de l'antenne, profondeur d'évanouissement pour { "0.01" } % à { "50" } % du tem. Référence indépendante (ExternalDataset) : exemples de validation du groupe d'études { "3" } de l'ITU-R (CG-3M3J-13-ValEx-Rev8.3.0) pour la scintillation P.618-14, avec le N_wet P.453-14 de chaque site tiré des mêmes exemples ; versionnés dans tests/fixtures/leo_link/p618_14_scintillation.csv avec les URL et la date de récupération. L'expression de la réfractivité humide à partir de la température et de l'humidité n'est pas couverte par cette ligne

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Retard de groupe { "40.3" } STEC/f^{ "2" } par bande ; les coefficients sans ionosphère f1^2/(f1^{ "2" } - f2^{ "2" }) et -f2^2/(f1^{ "2" } - f2^{ "2" }) et l'amplification du bruit sqrt(a1^{ "2" } s1^{ "2" } + a2^. Référence indépendante (ExternalDataset) : IS-GPS-200 section { "20.3.3.3.3.2" }, qui énonce le rapport de retard de groupe L1/L2 gamma = (77/60)^{ "2" } découlant de la mise à l'échelle en 1/f^{ "2" } au premier ordre, et la formule de transmission de Friis (Proc. IRE, { "1946" }). Valide les lois d'échelle, et non un TEC oblique

# text
seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate : une recherche sur chaque position d'orbite et chaque utilisateur à l'horizon du satellite d'une orbite circulaire, avec la Terre. Référence indépendante (ExternalDataset) : Leclere, Marathe et Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, tableau { "1" } (récepteur statique sur une sphère de { "6371" } km, la rotation de la Terre étant le seul autre effet) : { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz en L1. Couvre les orbites circulaires à deux corps

# text
# c1: leo-pass
seg-b952b2928bbe = <b>MODELLED</b> Le type de scénario <c1/> : satellites à partir d'un passage conçu, d'éléments, d'un TLE via SGP4 ou d'une constellation Walker issue de constellation-design ; par bande et par époque le l. Référence indépendante (InternalConsistency) : formes fermées et autocohérence : les identités de taux de variation de distance et d'accélération de distance par rapport aux dérivées numériques, le gain isoflux annulant la croissance de la distance, les limites classiques de perte de polarisation, l'observation qualitative LEO par rapport au GNSS (un passage en cloche de quelques minutes culminant plusieurs dB au-dessus de porteuses GNSS plates de 44-51 dB-Hz). Les PIRE et les diagrammes sont des puissances reçues publiées converties en PIRE ou en représentat

# text
# c1: label
seg-65a0444ca451 = MODELLED : géométrie de passage LEO et bilan de liaison par bande à partir de PIRE indiquées et de diagrammes d'antenne idéalisés avec des termes de propagation ITU-R ; les modèles de composants portent leurs propres étiquettes dans la matrice de vérification. Ce n'est pas une mesure d'un satellite quelconque. (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-8b3ffb30c23c = Une section [iot] facultative donne le temps jusqu'au premier point fixe, l'énergie par point fixe et l'autonomie de la batterie en fonction du cycle de service pour un budget de puissance de récepteur indiqué (MODELLED). (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-597be3a6eb96 = Une section [spoofer] facultative contrefait les signaux d'une position annoncée qui saute ou est écartée de la position réelle après un début, et exécute deux moniteurs avec des probabilités de fausse alarme et de détection manquée indiquées : cohérence du Doppler et de la géométrie de passage (taux de variation de distance mesurés par rapport à ceux prédits à partir des orbites et d'une position et vitesse a priori indépendantes, un test du khi-deux par moindres carrés généralisés sur une fenêtre (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-dbcc7b9c9b9b = MODELLED : les PIRE, les diagrammes, la fraction de Chapman du TEC sous le satellite et l'ensemble du passage. (catalogue des types de scénario (<c1/>))

# text
seg-e675c999f303 = MODELLED. Les faisceaux ponctuels, le calendrier des rafales et la forme d'onde STL ne sont pas modélisés. (commentaire du fichier de scénario, ligne { "14" })

# text
seg-c3665ac09bf6 = Un passage LEO-PNT et son bilan de liaison par bande face aux satellites GNSS en MEO en vue sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique / en forme fermée — ils détectent les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-ab0fc0d88556 = Les préréglages nommés de systèmes LEO-PNT avec sources indiquées, et un moteur indépendant du système, sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique / en forme fermée — ils détectent les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-ae15d15bf151 = Page thématique : <a1>LEO-PASS.md</a1>

# text
seg-3ddcc0ea097f = <s1>Précédent</s1>leo-navmsg

# text
seg-7c0d4c0f536d = <s1>Suivant</s1>leo-pnt-chain
