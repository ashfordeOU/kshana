# docs--kind-launch-window: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-b054c73f22e5 = aucune valeur

# text
seg-8e62cc4af6ea = Page thématique : <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/launch-window.md
seg-1c385961d594 = Source : <c1/>

# text
# c1: launch-window
seg-e0990c5f14da = <c1/> (type de scénario)

# text
seg-7a4e6215a488 = Géométrie de lancement et d'ascension à deux corps : azimut(s) de lancement (sin Az = cos i / cos lat), inclinaison minimale atteignable, vitesse circulaire, gain de la rotation de la Terre vers l'est, Δv de changement de plan en dogleg lorsque l'inclinaison cible est inférieure à la latitude du site, et nombre d'opportunités de lancement quotidiennes. Géométrie MODELLED à Terre sphérique (sans correction du triangle des vitesses de Terre en rotation, sans modèle de pertes d'ascension/de traînée).

# text
# c1: scenarios/launch-window.toml
seg-e24b0ae723c7 = Une exécution de <c1/> se résume ainsi : launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Earth-rotation bonus, { "2" } opportunities/day (MODELLED)

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-6f955816b5c6 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/launch-window.toml
seg-aaadee0743ee = L'exemple <c1/> définit, entre autres :

# text
seg-58d26f083b8f = Étiquette du résultat (celle du moteur) : MODELLED — géométrie de lancement à deux corps et Terre sphérique ; l'azimut est la relation géométrique sin(Az)=cos(i)/cos(lat) (sans correction du triangle des vitesses de Terre en rotation, sans modèle de pertes d'ascension/de traînée)

# attr:alt
seg-9696283a95ae = Le graphique que le moteur écrit pour scenarios/launch-window.toml, type de scénario launch-window

# text
seg-38175030f689 = <b>MODELLED</b> Azimut(s) de lancement à deux corps (sin Az = cos i / cos lat), inclinaison minimale atteignable, vitesse circulaire, gain de la rotation de la Terre vers l'est, Δv de changement de plan en dogleg et opportunités quotidiennes, et, à partir d'une époque et de lignes IERS finals2000A, le site

# text
seg-53bc589c7ed6 = <b>MODELLED</b> Azimut(s) de lancement à deux corps (sin Az = cos i / cos lat), inclinaison minimale atteignable, vitesse circulaire, gain de la rotation de la Terre vers l'est, Δv de changement de plan en dogleg a. Référence indépendante (InternalConsistency) : géométrie de lancement en trigonométrie sphérique en forme fermée par rapport à des ancrages d'exemples travaillés publiés (Vallado, Fundamentals of Astrodynamics 4e éd., algorithme { "37" } azimut de lancement + chap. 6 changement de plan ; tests/launch_window_ascent_geometry_reference.rs). Ils réutilisent la même forme fermée que celle qu'implémente kshana (un contrôle de parité de valeur publiée / de transcription, InternalConsistency) ; MODELLED à deux corps, sans triangle des vitesses de Terre en rotation / ascension / traî

# text
# c1: label
seg-12396619d3e5 = MODELLED — géométrie de lancement à deux corps et Terre sphérique ; l'azimut est la relation géométrique sin(Az)=cos(i)/cos(lat) (sans correction du triangle des vitesses de Terre en rotation, sans modèle de pertes d'ascension/de traînée) (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-715f1856bd37 = Géométrie MODELLED à Terre sphérique (sans correction du triangle des vitesses de Terre en rotation, sans modèle de pertes d'ascension/de traînée). (catalogue des types de scénario (<c1/>))

# text
seg-4e9a215e3918 = PÉRIMÈTRE HONNÊTE : MODELLED. Azimut géométrique seulement -- aucune correction du triangle des vitesses de Terre en rotation (le gain est rapporté séparément pour être intégré), aucun modèle de trajectoire d'ascension / de pertes de traînée / de pilotage. Géométrie de pré-phase A. Exécution : kshana scenarios/launch-window.toml (commentaire du fichier de scénario, lignes { "8" } à { "11" })

# text
seg-12332d181de4 = La géométrie de fenêtre de lancement et d'ascension (analyse de mission) est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-1a3841380d88 = <s1>Précédent</s1>jamming

# text
seg-78411b85f301 = <s1>Suivant</s1>leo-navmsg
