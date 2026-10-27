# docs--kind-lunar-frame-realisation: translations (nb)

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-49f323360dc3 = <b>VALIDATED</b> Helmert-datumtilpasning med 7 parametere + ICRF-orienteringsbinding fra et nettverk av punkter. Uavhengig referanse (ExternalDataset): Uavhengig lukket vektet Umeyama-løser (Horn) for likhetstransformasjon (numpy/scipy, SVD-basert; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A): en annen algoritme enn kshanas iterative Gauss–Newton-tilpasning, som når samme entydig definerte vektede minste kvadraters optimum på byte-identiske punktnettverk

seg-0225ace73ba8 = Kilde: <c1/>

seg-a092c5795651 = <c1/> (scenariotype)

seg-0c4c119abfca = Modellert realisering av referansesystemet på månen: en Helmert-datumtilpasning (likhetstransformasjon) med 7 parametere — { "3" } translasjon, { "3" } rotasjon med liten vinkel, { "1" } skala — som binder et estimert sett av selenografisk avledede MCMF-punktkoordinater til et datum med vektet minste kvadraters metode (crate::batch_ls::gauss_newton), pluss en enkel orienteringsbinding som uttrykker den realiserte lille rotasjonen om ICRF-aksene i forhold til IAU { "2015" } WGCCRE-modellen for legemets orientering. Scenarioet injiserer en kjent liten transformasjon (translasjon ~titalls m, rotasjon ~µrad, skala ~{ "1e-7" }) i et godt spredt syntetisk punktnettverk, legger til seedet gaussisk støy, gjenfinner datumet og rapporterer den gjenfunne transformasjonen, gjenfinningsfeilen per parameter mot den injiserte referansen og RMS-residualen etter tilpasningen. MODELLED selvkonsistens — gjenfinner en injisert likhetstransformasjon (uten støy til ~maskinpresisjon), IKKE en realisering mot virkelige sporings-/VLBI-data; deterministisk (seedet); ingen TRL/heritage/støtte fra noe byrå.

seg-32d5e2749e64 = Én kjøring av <c1/> oppsummeres slik: lunar-frame-realisation | { "8" } punkter | translasjonsfeil { "3.125e-1" } m, rotasjonsfeil { "3.418e-7" } rad, skalafeil -5.891e2 ppb | rms-residual { "0.887" } m | converged false

seg-e732d2c2ab91 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-29f85024974b = Eksempelet <c1/> setter blant annet:

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-f3a6d69d0225 = Diagrammet motoren skriver for scenarios/lunar-frame-realisation.toml, type lunar-frame-realisation

seg-f99a78efa965 = MODELLED selvkonsistens — gjenfinner en injisert likhetstransformasjon (uten støy til ~maskinpresisjon), IKKE en realisering mot virkelige sporings-/VLBI-data; deterministisk (seedet); ingen TRL/heritage/støtte fra noe byrå. (typekatalog (<c1/>))

seg-238cea087ae0 = Ærlighet: MODELLED selvkonsistens. Den uavhengige referansen er gjenfinningen av en injisert likhetstransformasjon med 7 parametere (uten støy til ~maskinpresisjon) pluss den algebraiske rundturidentiteten til apply_helmert. Dette er IKKE en realisering av referansesystemet på månen mot virkelige sporings-/VLBI-data og hevder ingen absolutt nøyaktighet for systemet. Deterministisk (seedet). Ingen TRL, flyarv eller støtte fra noe byrå hevdes. (kommentar i scenariofilen, linje { "23" } til { "27" })

seg-07550d3d9610 = <s1>Forrige</s1>lunar-frame-campaign

seg-5a3a7120aae2 = <s1>Neste</s1>lunar-infrastructure
