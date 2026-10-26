# docs--kind-eo-radiometry: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catalogue des types de scénario (<c1/>))

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-8e62cc4af6ea = Page thématique : <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/eo-radiometry.md
seg-841259b04897 = Source : <c1/>

# text
# c1: eo-radiometry
seg-1b0ba13fcef1 = <c1/> (type de scénario)

# text
seg-816bd5a5808a = Radiométrie et qualité d'image d'un imageur au nadir : luminance à l'ouverture d'une scène lambertienne, équation de la caméra, signal et bruit de grenaille/d'obscurité/de lecture/de quantification et SNR ; la FTM du système à Nyquist (diffraction x détecteur x filé x gigue), la réponse relative de bord qui en découle, Q = lambda F/p et le NIIRS GIQE version { "4" } sans compensation de FTM. MODELLED.

# text
# c1: scenarios/eo-radiometry.toml
seg-7d786a7bfb86 = Une exécution de <c1/> se résume ainsi : eo-radiometry: GSD { "0.76" } m, Q { "1.06" }, SNR { "39" } (well { "6" } %), MTF@Nyquist { "0.212" }, RER { "0.573" }, GIQE4 NIIRS { "4.27" } (MODELLED)

# text
# c1: altitude_m
# c2: focal_length_m
# c3: aperture_m
# c4: pixel_pitch_um
# c5: wavelength_um
# c6: bandwidth_um
# c7: fill_factor
# c8: smear_px
# c9: jitter_px_rms
# c10: reflectance
# c11: solar_irradiance_w_m2_um
# c12: sun_zenith_deg
# c13: atmospheric_transmittance
# c14: path_radiance_w_m2_sr_um
# c15: optics_transmittance
# c16: integration_s
# c17: quantum_efficiency
# c18: dark_current_e_s
# c19: read_noise_e
# c20: full_well_e
# c21: adc_bits
seg-3378b7b0716f = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/eo-radiometry.toml
seg-d613181f3fe3 = L'exemple <c1/> définit, entre autres :

# text
seg-ffb002276b21 = um

# text
seg-1c15591babed = px

# text
seg-e94f9ad9e6c4 = Étiquette du résultat (celle du moteur) : MODELLED — radiométrie d'un imageur au nadir (scène lambertienne, équation de la caméra, bruit de grenaille/d'obscurité/de lecture/de quantification), FTM du système à Nyquist (diffraction x détecteur x filé x gigue), réponse relative de bord, Q = lambda F/p et NIIRS GIQE { "4" } sans compensation de FTM ; le NIIRS est une régression empirique sur des entrées modélisées

# attr:alt
seg-bf7b52f7a01e = Le graphique que le moteur écrit pour scenarios/eo-radiometry.toml, type de scénario eo-radiometry

# text
seg-562a7cf2859c = <b>MODELLED</b> Bilan signal sur bruit d'un imageur au nadir (luminance d'une scène lambertienne, équation de la caméra, bruit de grenaille, d'obscurité, de lecture et de quantification), la FTM du système à Nyquist comme produit de la diffraction d'une ouverture non obstruée, de l'ouverture du détecteur, du filé linéaire et de Gaus

# text
seg-dadea618d757 = <b>MODELLED</b> Bilan signal sur bruit d'un imageur au nadir (luminance d'une scène lambertienne, équation de la caméra, bruit de grenaille, d'obscurité, de lecture et de quantification), la FTM du système à Nyquist comme produit. Référence indépendante (InternalConsistency) : formes fermées : la FTM de diffraction à la demi-coupure, le bord en rampe d'un pixel d'une ouverture de détecteur pure (RER { "1" }), le bord en fonction de répartition normale d'un flou gaussien (RER = erf(0.5/(sigma sqrt { "2" }))), la loi d'échelle du bruit de grenaille, et les coefficients GIQE { "4" } tels que publiés (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). CE QUI NE L'EST PAS : aucun imageur externe, aucune FTM mesurée ni aucune image cotée n'a été comparé ; le GIQE est une régression empirique avec son

# text
# c1: label
seg-5182b4b0f8d6 = MODELLED — radiométrie d'un imageur au nadir (scène lambertienne, équation de la caméra, bruit de grenaille/d'obscurité/de lecture/de quantification), FTM du système à Nyquist (diffraction x détecteur x filé x gigue), réponse relative de bord, Q = lambda F/p et NIIRS GIQE { "4" } sans compensation de FTM ; le NIIRS est une régression empirique sur des entrées modélisées, et non une image cotée (résultat <c1/>)

# text
seg-aaf9ed3b0899 = La radiométrie des imageurs électro-optiques, la FTM, la réponse relative de bord et le NIIRS GIQE { "4" } sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique / en forme fermée — ils détectent les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-d6c92dc655ab = <s1>Précédent</s1>eo-coverage

# text
seg-a0daef9a496e = <s1>Suivant</s1>ephemeris

# text
seg-b2f1e6466c2c = Radiométrie et qualité d'image d'un imageur au nadir pour une petite caméra d'observation de la Terre ILLUSTRATIVE (la conception d'aucun opérateur) : ouverture de { "0.40" } m, focale de { "3.6" } m (F/9), pixels de { "5.5" } um, depuis { "500" } km. L'exécution donne le bilan signal sur bruit d'une scène de réflectance de { "15" } %, la FTM du système à Nyquist, la réponse relative de bord et le NIIRS GIQE version { "4" }. MODELLED : le NIIRS est une régression empirique évaluée sur des entrées modélisées, n (commentaire du fichier de scénario, lignes { "1" } à { "5" })
