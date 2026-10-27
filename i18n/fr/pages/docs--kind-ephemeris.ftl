# docs--kind-ephemeris: translations (fr)

# text
seg-37d29d8303fe = km

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-c33e3cbba749 = arcsec

# text
seg-11e8c29ecb45 = Type de scénario du moteur v{ $version }, famille <a1>Constellations, couverture et géométrie</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-a4f1e7d2041e = Page de famille : <a1>Constellations, couverture et géométrie</a1>

# text
seg-670191cf797f = Page thématique : <a1>SOLAR-SYSTEM.md</a1>

# text
seg-a3697ad561db = Hz

# text
# c1: docs/kinds/by-kind/ephemeris.md
seg-e388fdc74ffa = Source : <c1/>

# text
# c1: ephemeris
seg-9860cb88c021 = <c1/> (type de scénario)

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Éphéméride et trace au sol : propager un satellite (TLE→SGP4 ou orbite analytique) et émettre son état TEME/GCRS (position + vitesse), sa position ITRF/ECEF, la latitude/longitude/altitude sous-satellite WGS-84, et, à chaque pas, l'azimut/l'élévation/la distance de la station et le taux de variation de distance (Doppler). Le satellite provient d'un <c1/> ou d'une <c2/> analytique avec son <c3/> (un <c4/> l'emporte lorsque les deux sont donnés) ; avec un <c5/>, un <c6/> remplace l'époque propre du TLE comme t = { "0" }.

# text
# c1: scenarios/ephemeris.toml
seg-02f2745e0550 = Une exécution de <c1/> se résume ainsi : scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } samples | alt { "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | speed { "7653" }–{ "7661" } m/s | max el { "25.7" }° peak Doppler { "34.3" } kHz

# text
# c1: tle|orbit+epoch
seg-2ce1ab71e2cc = Champs obligatoires : <c1/>

# text
# c1: step_s
# c2: duration_s
# c3: station
# c4: dut1_s
# c5: xp_arcsec
# c6: yp_arcsec
# c7: carrier_hz
# c8: eop_finals2000a
seg-21dc45b3de59 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/ephemeris.toml
seg-cda81cdb3607 = L'exemple <c1/> définit, entre autres :

# text
seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

# text
seg-4d208b6c0eb8 = jour

# text
seg-cc723fa4fafa = sgp4 (TLE)

# attr:alt
seg-0fd3c58fde09 = Le graphique que le moteur écrit pour scenarios/ephemeris.toml, type de scénario ephemeris

# text
seg-d291f20074f0 = <b>VALIDATED</b> Rotation de la Terre à partir d'une date julienne UT1 en deux parties sur le chemin orbital, de sorte que la position dans le référentiel terrestre conserve la microseconde qu'une date en f64 simple perd (environ { "3e-9" } rad vers { "2020" }) : jd2::gmst82 (GMST de l'IAU { "1982" }, la convention TEME, sur les deux parties), cio:

# text
seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell à 6 degrés de liberté + perturbations, DO par lots/séquentielle. Référence indépendante (ExternalDataset) : vecteurs de vérification SGP4 de AIAA 2006-6753

# text
seg-7cf505668c3c = <b>VALIDATED</b> Précession-nutation IAU 2006/2000A, GCRS↔ITRS par CIO, échelles de temps avec secondes intercalaires. Référence indépendante (ExternalDataset) : vecteurs de référence IAU SOFA / ERFA ; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-f19ce44dc0c0 = Page thématique : <a1>AGENCY-ORBIT-VALIDATION.md</a1>

# text
seg-a8ea4ba6e244 = <s1>Précédent</s1>eo-radiometry

# text
seg-971864553611 = <s1>Suivant</s1>fusion
