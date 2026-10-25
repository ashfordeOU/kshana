# docs--kind-lunar-frame-realisation: translations (sv)

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-49f323360dc3 = <b>VALIDATED</b> Anpassning av Helmert-datum med 7 parametrar + ICRF-orienteringstie från ett nätverk av punkter. Oberoende referens (ExternalDataset): Oberoende lösare i sluten form för likformighetstransformation med viktad Umeyama (Horn) (numpy/scipy SVD-baserad; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — en annan algoritm än kshanas iterativa Gauss–Newton-anpassning, som når samma entydigt definierade viktade minsta kvadrat-optimum på byte-identiska punktnätverk

seg-0225ace73ba8 = Källa: <c1/>

seg-a092c5795651 = <c1/> (scenariotyp)

seg-0c4c119abfca = Modellerad realisering av ett lunart referenssystem: en anpassning av ett Helmert-datum (likformighet) med 7 parametrar — { "3" } translationer, { "3" } små vinkelrotationer, { "1" } skala — som knyter en skattad uppsättning MCMF-punktkoordinater härledda ur selenografiska koordinater till ett datum med viktade minsta kvadrater (crate::batch_ls::gauss_newton), plus en enkel orienteringstie som uttrycker den realiserade lilla rotationen kring ICRF-axlarna relativt kroppsorienteringen enligt IAU { "2015" } WGCCRE. Scenariot injicerar en känd liten transformation (translation ~tiotals m, rotation ~µrad, skala ~{ "1e-7" }) i ett väl spritt syntetiskt punktnätverk, lägger till gaussiskt brus från ett frö, återvinner datumet och redovisar den återvunna transformationen, återvinningsfelet per parameter mot den injicerade referensen och RMS-residualen efter anpassningen. MODELLED självkonsistens — återvinner en injicerad likformighetstransformation (brusfritt till ~maskinprecision), INTE en realisering mot verkliga spårnings-/VLBI-data; deterministisk (frö); inget TRL, inget flygarv och inget stöd från någon myndighet.

seg-32d5e2749e64 = En körning av <c1/> sammanfattas som: lunar-frame-realisation | { "8" } punkter | translationsfel { "3.125e-1" } m, rotationsfel { "3.418e-7" } rad, skalfel -5.891e2 ppb | rms-residual { "0.887" } m | konvergerade inte

seg-e732d2c2ab91 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-29f85024974b = Exemplet <c1/> anger bland annat:

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-f3a6d69d0225 = Diagrammet som motorn skriver för scenarios/lunar-frame-realisation.toml, typ lunar-frame-realisation

seg-f99a78efa965 = MODELLED självkonsistens — återvinner en injicerad likformighetstransformation (brusfritt till ~maskinprecision), INTE en realisering mot verkliga spårnings-/VLBI-data; deterministisk (frö); inget TRL, inget flygarv och inget stöd från någon myndighet. (typkatalog (<c1/>))

seg-238cea087ae0 = Ärlighet: MODELLED självkonsistens. Den oberoende referensen är återvinningen av en injicerad likformighetstransformation med 7 parametrar (brusfritt till ~maskinprecision) plus den algebraiska tur-och-retur-identiteten för apply_helmert. Detta är INTE en realisering av det lunara referenssystemet mot verkliga spårnings-/VLBI-data och gör inga anspråk på någon absolut noggrannhet i referenssystemet. Deterministisk (frö). Inget TRL, inget flygarv och inget myndighetsstöd görs gällande. (kommentar i scenariofilen, rad { "23" } till { "27" })

seg-07550d3d9610 = <s1>Föregående</s1>lunar-frame-campaign

seg-5a3a7120aae2 = <s1>Nästa</s1>lunar-infrastructure
