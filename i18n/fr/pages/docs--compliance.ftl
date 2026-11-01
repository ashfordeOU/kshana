# docs--compliance: translations (fr)

# text
seg-f65b1f2b4182 = Mode

# text
# c1: docs/COMPLIANCE.md
seg-e19db3d5273b = Source : <c1/>

# text
seg-045b24defdbb = Carte de compliance d'intégrité DO-316 / DO-229E

# text
seg-9100800daa1c = Ce document met en correspondance les exigences de niveaux de protection et de surveillance de l'intégrité de la <b>DO-229E</b> (SBAS (système d'augmentation par satellites) MOPS (normes de performance opérationnelle minimale)) et de la <b>DO-316</b> (équipements embarqués GPS/SBAS (GPS : Global Positioning System)) de la RTCA (anciennement Radio Technical Commission for Aeronautics) avec les fonctions de Kshana qui les mettent en œuvre. C'est une <b>aide de traçabilité d'ingénierie</b>, et non une déclaration selon laquelle une exigence quelconque est satisfaite : Kshana met en œuvre les algorithmes publiés ; ce n'est pas de l'avionique homologuée.

# text
# c1: sbas::do316_compliance_map
# c2: docs/ARAIM_REFERENCE.md
seg-0e6ec5617eb5 = La forme lisible par machine est <a1><c1/></a1> ; ce texte en est le complément (en miroir de <a2><c2/></a2>).

# text
seg-d5d7a2ec9c73 = Niveaux de protection par moindres carrés pondérés (DO-229E annexe J)

# text
# c1: Elᵢ
# c2: Azᵢ
seg-0dc19f403f5e = Pour chaque satellite <em>i</em> d'élévation <c1/> et d'azimut <c2/> chez l'utilisateur, la ligne d'observation en repère local (ENU (est-nord-haut) + horloge) est

# text
# c1: wᵢ = 1/σᵢ²
# c2: σᵢ² = σ_flt² + σ_uire² + σ_air² + σ_tropo²
# c3: D = (GᵀWG)⁻¹
seg-6415f7f28e7e = avec le poids <c1/>, <c2/> (le budget UDRE (erreur différentielle de distance de l'utilisateur) / GIVE (erreur verticale ionosphérique de grille) / aéroporté / troposphère). La covariance de position est <c3/> ; son bloc ENU donne les niveaux de protection horizontal et vertical (HPL, VPL) :

# text
# c1: D
# c2: orbit::invert4
# c3: D[2][2]
# c4: Σᵢ S_{U,i}²·σᵢ²
# c5: inv(GᵀG)
seg-ea574448bda4 = Kshana calcule <c1/> en inversant la matrice normale { "4" }×{ "4" } avec la même routine que celle qu'utilise la pile RAIM (surveillance autonome de l'intégrité par le récepteur) (<c2/>), et valide le résultat de deux façons (la voie de la covariance <c3/> et la voie de la projection <c4/> doivent concorder), ainsi que par rapport à une géométrie de référence indépendante numpy <c5/>.

# text
seg-f63dd3d7aad4 = Source

# text
seg-268ae5b25684 = En route → NPA (approche de non-précision ; horizontale seulement)

# text
# c1: √(−2·ln 5e-9)
seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

# text
seg-dbae96c75a06 = Approche de précision

# text
seg-1bfafdcf6ab0 = MOPS DO-229E

# text
# c1: 6.0
# c2: Φ⁻¹(1 − 1e-9/2)
# c3: 6.109
# c4: K_V = Φ⁻¹(1 − 1e-7/2) = 5.327
# c5: raim::normal_quantile
seg-1922c53b8340 = Note d'honnêteté : les MOPS utilisent la constante horizontale arrondie <c1/> ; le quantile normal bilatéral exact <c2/> vaut <c3/>. Kshana utilise dans le code le { "6.0" } publié et dérive <c4/> du même <c5/> que celui qu'utilise la pile RAIM, un recoupement non circulaire (la valeur s'arrondit au { "5.33" } des MOPS).

# text
seg-ef191c1d3db1 = Combinaison sans ionosphère bifréquence L1/L5 (IS-GPS-705)

# text
# c1: f₁ = 1575.42 MHz
# c2: f₅ = 1176.45 MHz
# c3: γ₁₅ = (f₁/f₅)² = 1.79327
seg-b69825ef05d3 = Avec <c1/>, <c2/>, <c3/> :

# text
# c1: 40.3·10¹⁶·TEC/f²
# c2: timetransfer_adv::iono_delay_m
# c3: √(c₁² + c₅²) = 2.588
seg-ce81c6b71738 = Le retard ionosphérique du premier ordre (<c1/>) s'annule exactement, ce qui est vérifié par rapport à la physique indépendante <c2/> du moteur pour une plage de TEC (contenu électronique total). L'amplification du bruit pour des entrées de variance égale est <c3/>.

# text
# c1: γ₁₅
# c2: inv(GᵀG)
# c3: sbas::tests::wls_pl_matches_numpy_on_five_satellite_geometry
seg-e111fb05a7c6 = <b>Dans le dépôt, automatisé</b> (à chaque commit) : les facteurs K par rapport à leurs définitions distributionnelles, <c1/> et les coefficients sans ionosphère (IF) par rapport aux fréquences de l'IS-GPS-705 (IS : Interface Specification), l'annulation ionosphérique du premier ordre par rapport à la physique de retard indépendante, et les niveaux de protection par moindres carrés pondérés (WLS) par rapport à une géométrie de référence numpy <c2/> (<c3/>).

# text
# c1: tests/sbas_reference.rs
# c2: sbas_protection_level
# c3: waasprotlevels()
# c4: zsiki/rtklib_ws
# c5: d_U
# c6: core/filter.c
seg-f30d84abe275 = <b>Référence indépendante externe, automatisée</b> (<c1/>) : à partir de l'élévation, de l'azimut et du 1-σ total de chaque satellite, <c2/> reproduit le HPL d'une implémentation indépendante, <c3/> dans le fork de niveaux de protection SBAS de RTKLIB (une bibliothèque libre de positionnement cinématique en temps réel) <c4/> (Siki & Takács { "2017" }), sur six époques que cet outil a calculées à partir de messages de diffusion <b>réels d'EGNOS (European Geostationary Navigation Overlay Service)</b> (PRN (numéro de code pseudo-aléatoire) géostationnaire { "120" }) et d'observations RINEX (Receiver Independent Exchange Format) réelles de la station BUTE à Budapest (2017-02-19), à <b>< { "2e-3" } m</b> près. La référence arrondit K_V à { "5.33" }, de sorte que la composante verticale est comparée sans facteur K, sous la forme <c5/> par rapport à son VPL / { "5.33" }. gLAB { "v6.0.0" } de l'ESA (Agence spatiale européenne) (<c6/>) utilise la même formule.

# text
seg-389e8a57e3e8 = <b>Non fait</b> : le σ par satellite est celui de la référence elle-même ; la modélisation de σ à partir des messages UDRE/GIVE bruts est hors périmètre, et aucun produit officiel publié de niveaux de protection WAAS (Wide Area Augmentation System) ou EGNOS n'a été reproduit de bout en bout. La DO-229E et la DO-316 elles-mêmes sont derrière le paywall de la RTCA ; la source ouverte de dérivation est constituée des pages SBAS OACI/EGNOS (OACI : Organisation de l'aviation civile internationale) de l'ESA Navipedia.

# text
seg-7686fb3d3e0c = <s1>Précédent</s1>Référence ARAIM

# text
seg-0457ef382fb0 = <s1>Suivant</s1>Table de correspondance de résilience
