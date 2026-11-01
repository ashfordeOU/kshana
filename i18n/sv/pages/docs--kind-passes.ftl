# docs--kind-passes: translations (sv)

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-0f4c2ab525ac = <b>MODELLED</b> Nedlänkens Es/N0 längs varje överflygning av en satellit över en station (EIRP, fri-rymdsdämpning, atmosfärsdämpning enligt cosekantlagen, övriga förluster, G/T, Boltzmanns konstant, symbolhastighet), den effektivaste DVB-S2 MODCOD som klarar sin ETSI EN { "302" } 307-

seg-72fd0321e4af = Ämnessida: <a1>CONTACT-SCHEDULING.md</a1>

seg-4636d450ef60 = <b>MODELLED</b> En körning tar en kontaktplan (en lista med aos_s/los_s-fönster, vart och ett med begäran till aperturen om navigering eller kommunikation — samma fönstervokabulär som <c1/> ger, omvandlad av <c2/>), ett antal aperturer

seg-11e8c29ecb45 = Scenariotyp i motor v{ $version }, familj <a1>Konstellationer, täckning och geometri</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-a4f1e7d2041e = Familjesida: <a1>Konstellationer, täckning och geometri</a1>

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-df90e5910fb4 = hr

seg-2544da673115 = Källa: <c1/>

seg-0db3f4e2402e = <c1/> (scenariotyp)

seg-a4bdfc291fce = Prediktion av passager över en markstation: passagerna med sikt i tidsdomänen (AOS/TCA/LOS, maximal skenbar elevation, varaktighet) för en cirkulär bana, som SGP4-medelelement vid fönstrets start, över en station ovanför en elevationsmask under ett fönster, med total åtkomsttid. SGP4/SDP4-propagering i det jordfasta systemet IAU 2006/2000A (valfritt UT1 - UTC och polrörelse), troposfärisk refraktion enligt ITU-R P.834-9 och nedlänkens ljustid (båda på som standard), korsningar lösta till { "1e-7" } s och kulminationen med gyllene snittet-sökning. Passagegeometrin är VALIDATED mot Orekit { "13.1.8" } vid stationer på havsnivå; scenariots bana och station är illustrativa indata.

seg-3050cc7fdc79 = En körning av <c1/> sammanfattas som: passes: { "5" } pass(es) of a { "550" } km / { "97.6" }° orbit over ({ "52.2" }°, { "4.4" }°) > { "10" }° in { "24" } h; { "1659" } s total access (MODELLED)

seg-699b650604d4 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-9d2941ba37e2 = Exemplet <c1/> anger bland annat:

seg-6f849331e33c = Resultatetikett (motorns egen): MODELLED — prediktion av passager över en markstation i tidsdomänen; SGP4/SDP4-propagering, jordfast system IAU 2006/2000A (UT1 = UTC, ingen polrörelse om inte jordorienteringsparametrar anges), skenbar elevation med refraktion enligt ITU-R P.834-9 och ljustid när de slås på, korsningar och kulmination förfinade under steget

seg-a09be8c586e3 = Diagrammet som motorn skriver för scenarios/passes.toml, typ passes

seg-db35e4ebd275 = <b>VALIDATED</b> Passager med sikt i tidsdomänen (AOS/TCA/LOS, maximal elevation, varaktighet) för en motorpropagator över en station ovanför en elevationsmask, med interpolerade uppgångs-/nedgångskorsningar och total åtkomst: passes::predict_passes, den geometriska schemaläggaren (ingen Tester: <a1>ground_station_pass_prediction_reference.rs</a1>.

seg-6799a54acee6 = <b>VALIDATED</b> Passager med sikt (AOS, TCA, LOS, maximal skenbar elevation, varaktighet) för en SGP4-elementmängd över en WGS-84-station på den validerade vägen för jordbanor (IAU 2006/2000A, valfria jordorienteringsparametrar), med troposfärisk ITU-R P.834-9 Tester: <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

seg-42d4290ed718 = <b>VALIDATED</b> Passager med sikt i tidsdomänen (AOS/TCA/LOS, maximal elevation, varaktighet) för en motorpropagator över en station ovanför en elevationsmask, med interpolerade uppgångs-/nedgångs. Oberoende referens (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — ett oberoende flygdynamikbibliotek: ElevationDetector (Brent-rotfinnare) + EventsLogger över en ITRF-efemerid, station som en WGS-84 TopocentricFrame. AOS/LOS/maximal elevation/antal passager/total åtkomst stämde för identisk bana+station+mask+fönster (incheckad fixtur; drivrutin xval/orekit-passes)

seg-eb79c117f1df = MODELLED — prediktion av passager över en markstation i tidsdomänen; SGP4/SDP4-propagering, jordfast system IAU 2006/2000A (UT1 = UTC, ingen polrörelse om inte jordorienteringsparametrar anges), skenbar elevation med refraktion enligt ITU-R P.834-9 och ljustid när de slås på, korsningar och kulmination förfinade under steget (resultat <c1/>)

seg-a7ddc8eeaf1e = <s1>Föregående</s1>orbit

seg-3079cfb8decc = <s1>Nästa</s1>pvt
