# docs--kind-lunar-beacon: translations (fr)

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
# c1: docs/kinds/by-kind/lunar-beacon.md
seg-3c4e3d725bb6 = Source : <c1/>

# text
# c1: lunar-beacon
seg-5e402fc935cb = <c1/> (type de scénario)

# text
seg-142ad48fe422 = Augmentation par balises de surface d'un service de navigation orbital lunaire, sous forme de tableau avant/après exécutable. Un utilisateur au pôle sud voit un ensemble orbital clairsemé dans une étroite portion de ciel, de sorte que la géométrie de mesure de distance est mal conditionnée ; quelques BALISES DE SURFACE RELEVÉES fournissent les lignes de visée à basse élévation et grand azimut qui manquent à un ensemble entièrement au zénith, et la dilution de précision horizontale s'effondre. Le scénario rapporte trois configurations à une même époque — les satellites seuls, les satellites plus les balises visibles, et une constellation plus grande comme autre voie vers la même géométrie — chacune avec ses nombres de sources visibles, son DOP complet, et la précision réalisée à 1 sigma en MÈTRES obtenue en multipliant par une erreur équivalente de mesure de distance par balise, assemblée comme la racine de la somme des carrés des termes de synchronisation d'horloge, de multitrajet et de relevé. La visibilité des balises est l'horizon géométrique à deux hauteurs de la Lune sans atmosphère (pas d'atmosphère, donc la borne est exacte), et l'assemblage du DOP est le même noyau recoupé avec gnss_lib_py dans tests/dop_reference.rs. POURQUOI CE TYPE DE SCÉNARIO EXISTE : le module qui le sous-tend est dans le moteur et contrôlé par rapport à un chemin DOP indépendant depuis L08/L09, mais il n'était pas accessible depuis une exécution — pas de type de scénario, pas de branche de répartition, pas de fichier fourni. Le README annonçait la capacité et la matrice de vérification ne comportait AUCUNE ligne la concernant, de sorte qu'elle était à la fois revendiquée en prose et non revendiquée dans le registre, tout en étant inaccessible dans le moteur. Les valeurs par défaut sont la géométrie qui porte déjà une référence figée validée (un utilisateur à -80 deg avec une antenne de { "2" } m, trois balises à -80/0, -79/+{ "60" } et -79/-60 à { "2" } km, un instantané illustratif de LCNS à six satellites à t={ "0" }, un masque de { "5" } deg), de sorte qu'une exécution nue reproduit un tableau déjà couvert par une référence indépendante plutôt que d'inventer de nouveaux nombres. MODELLED : la conception de la constellation, le placement des balises et chaque ordre de grandeur du budget d'erreur sont des entrées illustratives, et non un relevé en service ni une liaison mesurée ; seuls l'arithmétique du DOP, la forme close de l'horizon et la relation sigma = DOP x sigma_URE sont ancrés à l'extérieur. Pas un engagement de performance de service.

# text
# c1: scenarios/lunar-beacon.toml
seg-22ea11fcf367 = Une exécution de <c1/> se résume ainsi : Lunar surface-beacon augmentation — mask { "5.0" } deg, epoch +{ "0" } s, per-beacon sigma_URE { "1.1576" } m { "6" } satellites, no beacons sats { "5" } beacons { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } realised 1-sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satellites + { "1" } visible beacons sats { "5" } beacons { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } realised 1-sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satellites, no beacons sats { "19" } beacons { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } realised 1-sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m beacons improve PDOP by 2.355x; a larger constellation instead, 4.002x MODELLED: the constellation, the beacon placement and the error budget are illustrative inputs. The DOP kernel underneath is the gnss_lib_py-validated one and the beacon horizon is the L01 closed form.

# text
# c1: user
# c2: beacons
# c3: n_satellites
# c4: comparison_n_satellites
# c5: epoch_s
# c6: elevation_mask_deg
# c7: clock_sync_m
# c8: multipath_m
# c9: survey_m
seg-25522022cf9a = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/lunar-beacon.toml
seg-acfef3f325e4 = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-a53e353706f6 = Le graphique que le moteur écrit pour scenarios/lunar-beacon.toml, type de scénario lunar-beacon

# text
seg-89e2f6bb2540 = <b>MODELLED</b> Dilution de précision augmentée par balises pour un utilisateur en surface lunaire : les lignes de visée des satellites visibles et les lignes de mesure de distance des balises de surface visibles sont concaténées en une seule matrice de conception et évaluées par le noyau DOP partagé, et t Tests : <a1>validate_p2_beacon_before_after_table.rs</a1>.

# text
seg-654a3554b1e3 = <b>MODELLED</b> Dilution de précision augmentée par balises pour un utilisateur en surface lunaire : les lignes de visée des satellites visibles et les lignes de mesure de distance des balises de surface visibles sont concat. Référence indépendante (ReferenceImpl) : l'arithmétique du DOP est le noyau crate::orbit::dop, validé séparément et de façon externe par rapport à gnss_lib_py dans tests/dop_reference.rs ; cette ligne ne reprend pas le statut de cette autre ligne. L'horizon de visibilité des balises est la forme close L01, et sigma = DOP x sigma_URE est la relation GNSS standard (Kaplan et Hegarty, Understanding GPS/GNSS, section { "7" }). Dans cette ligne, l'augmentation elle-même est contrôlée par rapport à un indépendant

# text
# c1: kshana kinds --json
seg-4d1fc06e907b = MODELLED : la conception de la constellation, le placement des balises et chaque ordre de grandeur du budget d'erreur sont des entrées illustratives, et non un relevé en service ni une liaison mesurée ; seuls l'arithmétique du DOP, la forme close de l'horizon et la relation sigma = DOP x sigma_URE sont ancrés à l'extérieur. (catalogue des types de scénario (<c1/>))

# text
seg-aaafed663400 = CE QUI EST ANCRÉ ET CE QUI NE L'EST PAS Ancré : l'assemblage du DOP est le noyau recoupé avec gnss_lib_py dans tests/dop_reference.rs ; la visibilité des balises est la forme close de l'horizon géométrique à deux hauteurs de la Lune sans atmosphère (pas d'atmosphère, donc pas d'extension par réfraction et la borne est exacte) ; et sigma = DOP x sigma_URE est la relation standard (Kaplan & Hegarty, Understanding GPS/GNSS, section { "7" }). NON ancré — MODELL (commentaire du fichier de scénario, lignes { "40" } à { "49" })

# text
seg-2516c4208769 = L'augmentation du DOP par balises de surface lunaires est MODELLED, et non vérifiée : elle est contrôlée par rapport à une implémentation distincte dans ce même code source, indépendante de l'unité testée mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-ebb9724de60a = <s1>Précédent</s1>lunar-attack-surface

# text
seg-ca9b68783354 = <s1>Suivant</s1>lunar-differential-pnt

seg-b81e98467952 = <s1>Suivant</s1>lunar-descent
