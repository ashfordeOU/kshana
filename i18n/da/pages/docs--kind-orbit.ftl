# docs--kind-orbit: translations (da)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Scenarietype i motoren v{ $version }, familie <a1>Konstellationer, dækning og geometri</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-a4f1e7d2041e = Familieside: <a1>Konstellationer, dækning og geometri</a1>

seg-be831b52a339 = og { "4" } flere i matrixen.

seg-d291f20074f0 = <b>VALIDATED</b> Jordens rotation ud fra en todelt juliansk UT1-dato på banestien, så den jordfaste position bevarer det mikrosekund, som en enkelt f64-dato mister (omkring { "3e-9" } rad ved { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventionen, på de to dele), cio:

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP ud fra sigtelinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-opdeling. Uafhængig reference (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, uafhængigt bibliotek, stemmer til { "1e-6" } relativt

seg-53a78e98af12 = Emneside: <a1>SKYLINE.md</a1>

seg-0e3518dc3ddb = Kilde: <c1/>

seg-1428025a91e1 = <c1/> (scenarietype)

seg-cb4262b66b8f = GNSS-tilgængelighed + DOP fra en konstellation i kredsløb (Walker / TLE / RINEX).

seg-97680b4587c8 = Én kørsel af <c1/> opsummeres som: scenarie bffc887db977 | 77/361 prøver GNSS-nominelle | bedste PDOP { "2.53" } pos 2.53m | kvante-holdover 0s p95 6.49e-5ns integritet { "1.000" } sikkerhed n/a (intet angreb) | klassisk holdover 0s p95 25.0ns integritet { "1.000" } sikkerhed n/a (intet angreb)

seg-b3a080b98bd9 = Påkrævede felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c818cc4f87da = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-364139ff447d = Eksemplet <c1/> angiver blandt andet:

seg-d5063dda3971 = Microchip SA.45s / SA65 atomur i chipskala, sigma_y(1s)

seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

seg-3b652c0da6de = Diagrammet, som motoren skriver for scenarios/orbit-rinex.toml, type orbit

seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP ud fra geometrien af sigtelinjerne via Q=(HᵀH)⁻¹ med en lokal ENU-opdeling Tests: <a1>dop_reference.rs</a1>.

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry og check: en seedet Monte Carlo (N = { "20,000" } epoker pr. geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) af motorens egen iterede mindste kvadraters positionsbestemmelse (pvt::solve_spp, enhedsvægte, løst ud fra den sande position) på Tests: <a1>uere_dop_monte_carlo.rs</a1>.

seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: den geodætiske (WGS-84) azimut og elevation af en satellit fra en jordstation, en azimut-/elevationsmaskeringstabel lineært interpoleret i azimut med omslag ved { "360" } grader, den synlige mængde el Tests: <a1>skyline_orekit_oracle.rs</a1>.

seg-d86884be3f98 = <s1>Forrige</s1>optical-atmosphere

seg-da202333ae8d = <s1>Næste</s1>passes
