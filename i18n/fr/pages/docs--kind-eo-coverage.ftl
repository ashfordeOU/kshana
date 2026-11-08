# docs--kind-eo-coverage: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-98151954f217 = false

# text
seg-8e62cc4af6ea = Page thématique : <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/eo-coverage.md
seg-fc32bcd32dec = Source : <c1/>

# text
# c1: eo-coverage
seg-d72c017ca1fa = <c1/> (type de scénario)

# text
seg-47b4aea6ed01 = Géométrie d'empreinte et de couverture d'une charge utile d'observation de la Terre (triangle spatial SMAD) : rayon angulaire de la Terre, largeur de fauchée, distance d'échantillonnage au sol au nadir, accès maximal hors nadir, période circulaire, période nodale J2 et espacement des traces au sol à l'équateur avec un indicateur de couverture contiguë, pour une altitude d'orbite, une inclinaison (héliosynchrone par défaut) et un FOV/IFOV de capteur. Géométrie MODELLED à Terre sphérique (sans radiométrie/FTM/atmosphère/gigue/réflexion spéculaire) ; espacement des nœuds R_e·(ω − Ω̇)·T_nodal avec des taux séculaires J2 au premier ordre.

# text
# c1: scenarios/eo-coverage.toml
seg-105bb8a3c33f = Une exécution de <c1/> se résume ainsi : eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> { "184" } km swath, { "9.8" } m nadir GSD, access to { "745" } km off-nadir; node spacing { "2752" } km (gapped) (MODELLED)

# text
# c1: altitude_km
# c2: half_fov_deg
# c3: ifov_microrad
# c4: max_off_nadir_deg
# c5: inclination_deg
seg-609c5b7bc6f1 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/eo-coverage.toml
seg-14f19837e422 = L'exemple <c1/> définit, entre autres :

# text
seg-834408a40783 = min

# text
seg-ade2ba71a96c = Étiquette du résultat (celle du moteur) : MODELLED — géométrie de triangle spatial à Terre sphérique ; fauchée/GSD/accès sont géométriques (sans radiométrie/FTM/atmosphère/gigue/réflexion spéculaire), l'espacement des traces au sol est R_e·(ω − Ω̇)·T_nodal avec des taux séculaires J2 au premier ordre

# attr:alt
seg-c2a8332f2ee2 = Le graphique que le moteur écrit pour scenarios/eo-coverage.toml, type de scénario eo-coverage

# text
seg-d86d43628cf3 = <b>VALIDATED</b> Géométrie du triangle spatial SMAD : rayon angulaire de la Terre, largeur de fauchée, GSD au nadir, accès maximal hors nadir et période circulaire, plus la période nodale J2 au premier ordre (eo_payload::j2_nodal_period) et l'espacement des traces au sol à l'équateur R_e (omega_ Tests : <a1>eo_payload_coverage_reference.rs</a1>.

# text
seg-9938f1de9eb8 = <b>VALIDATED</b> Géométrie du triangle spatial SMAD : rayon angulaire de la Terre, largeur de fauchée, GSD au nadir, accès maximal hors nadir et période circulaire, plus la période nodale J2 au premier ordre (. Référence indépendante (ExternalDataset) : Orekit { "12.2" } (Apache-2.0) et GeographicLib { "2.1" } (MIT), tous deux exécutés comme programmes séparés, préenregistrés (766823f3) avant la modification du moteur et toute exécution de la référence : grandeurs de la sphère à { "1e-9" } près en relatif (pire cas : rayon angulaire { "5.4e-16" }, fauchée { "7.0e-13" }, accès { "1.9e-14" }), période { "1e-12" } ({ "1.6e-16" }), GSD au nadir { "1e-7" } ({ "2.9e-10" }), la période nodale J2 et l'espacement des nœuds à { "0.1" } % près d'une propagation J2 numérique d'Orekit avec un détecteur de nœud ({ "1" }

# text
# c1: label
seg-45625167e59f = MODELLED — géométrie de triangle spatial à Terre sphérique ; fauchée/GSD/accès sont géométriques (sans radiométrie/FTM/atmosphère/gigue/réflexion spéculaire), l'espacement des traces au sol est R_e·(ω − Ω̇)·T_nodal avec des taux séculaires J2 au premier ordre (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-cf22f13c78d3 = Géométrie MODELLED à Terre sphérique (sans radiométrie/FTM/atmosphère/gigue/réflexion spéculaire) ; espacement des nœuds R_e·(ω − Ω̇)·T_nodal avec des taux séculaires J2 au premier ordre. (catalogue des types de scénario (<c1/>))

# text
seg-153325fb00d3 = PÉRIMÈTRE HONNÊTE : géométrie MODELLED à Terre sphérique seulement -- aucun modèle de radiométrie / FTM / atmosphère / gigue de pointage / réflexion spéculaire du soleil. L'espacement des traces au sol est R_e*(omega - dOmega/dt)*T_nodal avec des taux séculaires J2 au premier ordre ; l'inclinaison est par défaut l'inclinaison héliosynchrone pour l'altitude. Exécution : kshana scenarios/eo-coverage.toml (commentaire du fichier de scénario, lignes { "7" } à { "11" })

# text
seg-5dc02c3d10f7 = <s1>Précédent</s1>entry-heating

# text
seg-33f408d48d13 = <s1>Suivant</s1>eo-radiometry
