# docs--kind-lunar-frame-realisation: translations (da)

seg-98151954f217 = false

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-619127334cf3 = Ingen matrixrække nævner denne type ved navn; mærkaten på dens resultat er motorens egen, ovenfor.

seg-49f323360dc3 = <b>VALIDATED</b> Tilpasning af Helmert-referencesystem med 7 parametre + ICRF-orienteringsforbindelse ud fra et net af punkter. Uafhængig reference (ExternalDataset): Uafhængig vægtet Umeyama-løser (Horn) for similaritetstransformation i lukket form (numpy/scipy, SVD-baseret; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — en anden algoritme end kshanas iterative Gauss–Newton-tilpasning, der når samme entydigt definerede vægtede LS-optimum på byte-identiske punktnet

seg-0225ace73ba8 = Kilde: <c1/>

seg-a092c5795651 = <c1/> (scenarietype)

seg-0c4c119abfca = Modelleret realisering af lunart referencesystem: en tilpasning af et Helmert-referencesystem (similaritet) med 7 parametre — { "3" } translation, { "3" } rotation med små vinkler, { "1" } skala — der knytter et estimeret sæt af selenografisk afledte MCMF-punktkoordinater til et referencesystem ved vægtet mindste kvadraters metode (crate::batch_ls::gauss_newton), plus en simpel orienteringsforbindelse, der udtrykker den realiserede lille rotation om ICRF-akserne i forhold til IAU { "2015" } WGCCRE-modellen for legemets orientering. Scenariet tilfører en kendt lille transformation (translation ~titusinder m, rotation ~µrad, skala ~{ "1e-7" }) i et veludbredt syntetisk punktnet, tilføjer seedet gaussisk støj, gendanner referencesystemet og rapporterer den gendannede transformation, gendannelsesfejlen pr. parameter i forhold til den tilførte reference og den resterende RMS efter tilpasningen. MODELLED selvkonsistens — gendanner en tilført similaritetstransformation (uden støj til ~maskinpræcision), IKKE en realisering mod reelle sporings-/VLBI-data; deterministisk (seedet); ingen TRL-, heritage- eller myndighedsstøtte.

seg-32d5e2749e64 = Én kørsel af <c1/> opsummeres som: lunar-frame-realisation | { "8" } points | translation err { "3.125e-1" } m, rotation err { "3.418e-7" } rad, scale err -5.891e2 ppb | rms residual { "0.887" } m | converged false

seg-e732d2c2ab91 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-29f85024974b = Eksemplet <c1/> sætter blandt andet:

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-f3a6d69d0225 = Diagrammet, som motoren skriver for scenarios/lunar-frame-realisation.toml, type lunar-frame-realisation

seg-f99a78efa965 = MODELLED selvkonsistens — gendanner en tilført similaritetstransformation (uden støj til ~maskinpræcision), IKKE en realisering mod reelle sporings-/VLBI-data; deterministisk (seedet); ingen TRL-, heritage- eller myndighedsstøtte. (kategori-katalog (<c1/>))

seg-238cea087ae0 = Ærlighed: MODELLED selvkonsistens. Den uafhængige reference er gendannelsen af en tilført similaritetstransformation med 7 parametre (uden støj til ~maskinpræcision) plus den algebraiske rundtursidentitet for apply_helmert. Dette er IKKE en realisering af det lunare referencesystem mod reelle sporings-/VLBI-data og gør ikke krav på nogen absolut nøjagtighed af referencesystemet. Deterministisk (seedet). Der gøres ikke krav på TRL, flyvehistorik eller myndighedsstøtte. (kommentar i scenariefilen, linje { "23" } til { "27" })

seg-07550d3d9610 = <s1>Forrige</s1>lunar-frame-campaign

seg-5a3a7120aae2 = <s1>Næste</s1>lunar-infrastructure
