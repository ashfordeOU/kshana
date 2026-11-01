# docs--kind-orbit: translations (nl)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Scenariokind van de engine v{ $version }, familie <a1>Constellaties, dekking en geometrie</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-a4f1e7d2041e = Familiepagina: <a1>Constellaties, dekking en geometrie</a1>

seg-be831b52a339 = en { "4" } meer in de matrix.

seg-a8d92406e428 = Optische strontiumroosterklok, op de ruimte gericht doel sigma_y

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/gemodificeerde/Hadamard-deviatie + machtswetruisidentificatie met χ²-betrouwbaarheidsintervallen. Onafhankelijke referentie (ExternalDataset): NIST SP { "1065" } (Riley) / referentiedeviaties van Stable32 op NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Gesloten-vorm-groei van de driftfout tijdens coasting + holdover-tot-drempel; kwantumklasseklokken. Onafhankelijke referentie (ReferenceImpl): Recursie van de covariantie van clock_state in meerdere stappen (kruiscontrole binnen dezelfde codebase); de onderliggende kernel voor coast-variantie en holdover-inversie is extern getoetst tegen scipy (zie 'Clock-holdover coast-variance & threshold inversion'). De holdovercijfers per klasse met rode-ruisbodem blijven MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-toestanden (fase/frequentie/drift) van-Loan-Kalmanklok, Joseph-gestabiliseerd. Onafhankelijke referentie (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), met F via scipy.linalg.expm en Q via de Van-Loan-blokmatrix van { "1978" } — een onafhankelijke referentie-implementatie die het volledige filtertraject van kshana reproduceert. Consistentie tussen implementaties: de klokfysica en de Allan-kalibratie zijn niet extern getoetst, dus dit blijft MODELLED. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): op IGS final { "30" } s-klokken van { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Klokondersteunde χ², RAIM, AGC, SQM, per tijdstip gefuseerde veiligheidskwaliteitsmaat. Onafhankelijke referentie (ExternalDataset): TEXBAT-scenarioparameters (Humphreys { "2012" }) — karakterisering, geen vastgezette vectoren. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): op JammerTest { "2024" } (Bleik; GPL-3.0-data) gaven de monitors op waarnemingsniveau (klokondersteunde chikwadraat, RAIM, oplossingsfout) geen alarm binnen { "10" } s van een van de { "8" } evalueerbare gepubliceerde spoofingbegintijden (waar het venster vóór het begin schoon was, kwam het eerste alarm { "10.2" } tot { "39" } s na de pu

seg-e12f672ae71d = Klok-holdover bij GNSS-uitval is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Schatting van de toestand van de boordklok is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofingdetectie is MODELLED, niet extern getoetst: een deelclaim wordt extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-d291f20074f0 = <b>VALIDATED</b> Aardrotatie uit een tweedelige UT1-juliaanse datum op het baanpad, zodat de aardvaste positie de microseconde behoudt die een enkele f64-datum verliest (ongeveer { "3e-9" } rad nabij { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, de TEME-conventie, op de twee delen), cio:

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP uit de zichtlijngeometrie via Q=(HᵀH)⁻¹ met een lokale ENU-splitsing. Onafhankelijke referentie (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, een onafhankelijke bibliotheek, overeenkomstig tot { "1e-6" } relatief

seg-53a78e98af12 = Onderwerppagina: <a1>SKYLINE.md</a1>

seg-ae15d15bf151 = Onderwerppagina: <a1>LEO-PASS.md</a1>

seg-99a3c57c7926 = { "7" } meegeleverde scenario's gebruiken deze soort; de overige staan in <a1><c1/></a1>.

seg-0e3518dc3ddb = Bron: <c1/>

seg-1428025a91e1 = <c1/> (scenariosoort)

seg-cb4262b66b8f = GNSS-beschikbaarheid + DOP uit een baanconstellatie (Walker / TLE / RINEX).

seg-97680b4587c8 = Eén run van <c1/> vat samen als: scenario bffc887db977 | 77/361 samples GNSS-nominaal | beste PDOP { "2.53" } pos 2.53m | quantum-holdover 0s p95 6.49e-5ns integriteit { "1.000" } beveiliging n.v.t. (geen aanval) | klassieke holdover 0s p95 25.0ns integriteit { "1.000" } beveiliging n.v.t. (geen aanval)

seg-b3a080b98bd9 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c818cc4f87da = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-364139ff447d = Het voorbeeld <c1/> stelt onder meer in:

seg-d5063dda3971 = Microchip SA.45s / SA65 chipschaal-atoomklok, sigma_y(1s)

seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

seg-3b652c0da6de = De grafiek die de engine schrijft voor scenarios/orbit-rinex.toml, soort orbit

seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP uit de zichtlijngeometrie via Q=(HᵀH)⁻¹ met een lokale ENU-splitsing Tests: <a1>dop_reference.rs</a1>.

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry en check: een Monte Carlo met seed (N = { "20,000" } epochs per geometrie, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) van de eigen iteratieve kleinstekwadratenpositiebepaling van de engine (pvt::solve_spp, eenheidsgewichten, opgelost vanuit de ware positie) op Tests: <a1>uere_dop_monte_carlo.rs</a1>.

seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: het geodetische (WGS-84) azimut en de elevatie van een satelliet vanaf een grondstation, een azimut-/elevatiemaskertabel die lineair in azimut is geïnterpoleerd met wikkeling bij { "360" } graden, de zichtbare set el Tests: <a1>skyline_orekit_oracle.rs</a1>.

seg-d86884be3f98 = <s1>Vorige</s1>optical-atmosphere

seg-da202333ae8d = <s1>Volgende</s1>passes
