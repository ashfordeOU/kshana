# docs--kind-lunar-time-offset: translations (fr)

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-4d208b6c0eb8 = jour

# text
# c1: docs/kinds/by-kind/lunar-time-offset.md
seg-64813e3da228 = Source : <c1/>

# text
# c1: lunar-time-offset
seg-000bb13909f1 = <c1/> (type de scénario)

# text
seg-7f3e13712f10 = Taux d'horloge relativiste Terre–Lune modélisé (Temps lunaire coordonné, LTC/TCL) : le taux séculaire LTC−TT issu de la différence de potentiel propre et du terme cinétique de la Lune, rapporté avec la bande publiée de { "56" }–{ "59" } µs/jour, plus le décalage accumulé sur un horizon.

# text
# c1: scenarios/lunar-time-offset.toml
seg-9efcf3e1be04 = Une exécution de <c1/> se résume ainsi : lunar-time-offset | secular LTC−TT rate { "57.04" } µs/day (band { "56" }–{ "59" }) | self-pot { "57.50" } kinetic -0.46 | offset @ { "1.00" } d = { "57.04" } µs

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-9367773c4889 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/lunar-time-offset.toml
seg-4731141e6aac = L'exemple <c1/> définit, entre autres :

# text
seg-3843825d0733 = us

# attr:alt
seg-e9deb6ed41c1 = Le graphique que le moteur écrit pour scenarios/lunar-time-offset.toml, type de scénario lunar-time-offset

# text
seg-982426693747 = <b>VALIDATED</b> Taux d'horloge relativiste Terre-Lune (LTC/TCL) + chaînage TT/TAI/UTC + ensemble. Référence indépendante (ExternalDataset) : Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST ; base du LTC LunaNet de l'UAI/IAG) : potentiel propre de la surface de la Lune L_m = { "3.13881e-11" } et total séculaire { "56.02" } µs/jour concordant avec les valeurs numériques publiées ; vitesse géocentrique de la Lune recoupée avec JPL DE440 (de440s.bsp via SPICE)

# text
seg-96b65f604cc2 = Honnêteté : MODELLED, non certifié. Le chiffre principal en us/jour dépend de la référence (géoïde terrestre W0 par rapport à un sélénoïde lunaire, fenêtre de moyennage temporel, corrections centrifuge/J2 inférieures à l'us/jour négligées) -> une bande, et non un nombre unique, est la sortie honnête. Rien ici n'est vérifié à une exactitude absolue inférieure à la nanoseconde ni certifié pour la tenue du temps en exploitation. Le rapport donne aussi le décalage LTC-TT accumulé sur l'hori (commentaire du fichier de scénario, lignes { "11" } à { "16" })

# text
seg-e4552368a6a7 = <s1>Précédent</s1>lunar-time-budget

# text
seg-777dc23bac6a = <s1>Suivant</s1>lunar-vlbi-fim

seg-e66e2ca31e54 = Page thématique : <a1>MISSION-THREAD-LUNAR.md</a1>
