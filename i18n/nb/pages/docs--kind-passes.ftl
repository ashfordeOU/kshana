# docs--kind-passes: translations (nb)

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 i nedlinken langs hvert pass av én satellitt over én stasjon (EIRP, frirom-tap, atmosfærisk tap etter kosekantloven, andre tap, G/T, Boltzmanns konstant, symbolrate), den mest effektive DVB-S2-MODCOD-en som klarer ETSI EN { "302" } 307-

seg-72fd0321e4af = Temaside: <a1>CONTACT-SCHEDULING.md</a1>

seg-4636d450ef60 = <b>MODELLED</b> Én kjøring tar en kontaktplan (en liste med aos_s/los_s-vinduer, der hvert ber aperturen om navigasjon eller kommunikasjon — det samme vindusvokabularet som <c1/> sender ut, konvertert av <c2/>), et apert

seg-11e8c29ecb45 = Scenariotype i motoren v{ $version }, familie <a1>Konstellasjoner, dekning og geometri</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-a4f1e7d2041e = Familieside: <a1>Konstellasjoner, dekning og geometri</a1>

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-df90e5910fb4 = hr

seg-2544da673115 = Kilde: <c1/>

seg-0db3f4e2402e = <c1/> (scenariotype)

seg-a4bdfc291fce = Prediksjon av passeringer over en bakkestasjon: synlighetspasseringene i tidsdomenet (AOS/TCA/LOS, maksimal tilsynelatende elevasjon, varighet) for en sirkulær bane, som SGP4-middelelementer ved vinduets start, over en stasjon over en elevasjonsmaske i et vindu, med samlet tilgangstid. SGP4/SDP4-propagering i det jordfaste referansesystemet IAU 2006/2000A (valgfri UT1 - UTC og polbevegelse), troposfærisk refraksjon etter ITU-R P.834-9 og lystiden for nedlenken (begge på som standard), kryssinger løst til { "1e-7" } s og kulminasjonen med gyllent snitt-søk. Passeringsgeometrien er VALIDATED mot Orekit { "13.1.8" } ved stasjoner på havnivå; scenarioets bane og stasjon er illustrative inndata.

seg-3050cc7fdc79 = En kjøring av <c1/> oppsummeres slik: passes: { "5" } pass(es) of a { "550" } km / { "97.6" }° orbit over ({ "52.2" }°, { "4.4" }°) > { "10" }° in { "24" } h; { "1659" } s total access (MODELLED)

seg-699b650604d4 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-9d2941ba37e2 = Eksempelet <c1/> angir blant annet:

seg-6f849331e33c = Resultatetikett (motorens): MODELLED — prediksjon av passeringer over en bakkestasjon i tidsdomenet; SGP4/SDP4-propagering, jordfast referansesystem IAU 2006/2000A (UT1 = UTC, ingen polbevegelse med mindre parametere for jordorientering er oppgitt), tilsynelatende elevasjon med ITU-R P.834-9-refraksjon og lystid når de er slått på, kryssinger og kulminasjon forfinet under steget

seg-a09be8c586e3 = Diagrammet motoren skriver for scenarios/passes.toml, type passes

seg-db35e4ebd275 = <b>VALIDATED</b> Synlighetspasseringer i tidsdomenet (AOS/TCA/LOS, maks elevasjon, varighet) for en motorpropagator over en stasjon over en elevasjonsmaske, med interpolerte kryssinger for stigning og nedgang og samlet tilgang: passes::predict_passes, den geometriske planleggeren (ingen Tester: <a1>ground_station_pass_prediction_reference.rs</a1>.

seg-6799a54acee6 = <b>VALIDATED</b> Synlighetspasseringer (AOS, TCA, LOS, maksimal tilsynelatende elevasjon, varighet) for et SGP4-elementsett over en WGS-84-stasjon på den validerte banen for jordbaner (IAU 2006/2000A, valgfrie parametere for jordorientering), med troposfærisk ITU-R P.834-9 Tester: <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

seg-42d4290ed718 = <b>VALIDATED</b> Synlighetspasseringer i tidsdomenet (AOS/TCA/LOS, maks elevasjon, varighet) for en motorpropagator over en stasjon over en elevasjonsmaske, med interpolert stigning/nedgang . Uavhengig referanse (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" }, et uavhengig bibliotek for flydynamikk: ElevationDetector (Brent-rotfinner) + EventsLogger over en ITRF-efemeride, stasjon som en WGS-84 TopocentricFrame. AOS/LOS/maks elevasjon/antall passeringer/samlet tilgang stemte på identisk bane + stasjon + maske + vindu (innsjekket testdatasett; driver xval/orekit-passes)

seg-eb79c117f1df = MODELLED — prediksjon av passeringer over en bakkestasjon i tidsdomenet; SGP4/SDP4-propagering, jordfast referansesystem IAU 2006/2000A (UT1 = UTC, ingen polbevegelse med mindre parametere for jordorientering er oppgitt), tilsynelatende elevasjon med ITU-R P.834-9-refraksjon og lystid når de er slått på, kryssinger og kulminasjon forfinet under steget (resultat <c1/>)

seg-a7ddc8eeaf1e = <s1>Forrige</s1>orbit

seg-3079cfb8decc = <s1>Neste</s1>pvt
