# docs--kind-lunar-joint-od-clock: translations (nb)

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-593938ee5995 = Kilde: <c1/>

seg-d54a85227f43 = <c1/> (scenariotype)

seg-200e58e189c2 = Modellert felles batch-estimator for banebestemmelse og klokker på månen med flere teknikker, på et SIMULERT nettverk: en Gauss-Newton-tilpasning av et øyeblikksbilde som fusjonerer VLBI-delay for geodetiske jordgrunnlinjer, lokale avstander på månen mellom stasjon og satellitt og avstander mellom satellitter, for å gjenfinne samlet 3D-posisjonen til en overflatestasjon på månen, posisjonene til en liten konstellasjon og hver enhets klokkeavvik fra en injisert referanse. Det avgjørende ærlige resultatet — VLBI gjør stasjonens fulle 3D-posisjon observerbar der lokal avstandsmåling på månen alene etterlater en svakt observert retning — rapporteres som kontrasten i stasjonsfeil med og uten VLBI. MODELLED simulert lukket-sløyfe-gjenfinning (referansen deler observasjonsmodellen), deterministisk (seedet), IKKE validert mot virkelige data; ingen kraftmodellpropagering inne i løseren; ingen TRL/heritage/støtte fra noe byrå.

seg-6419390eeae4 = Én kjøring av <c1/> oppsummeres slik: lunar-joint-od-clock | { "3" } satellitter, { "6" } jordstasjoner | stasjonens 3D-feil med VLBI { "3.54" } m mot bare avstand { "2184.02" } m ({ "617.5" }× skarpere) | sat pos RMS { "2.20" } m | stasjonsklokkefeil { "2.87e-10" } s | obs 40/16 parametere

seg-be3bcad756cc = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-ef164af52468 = Eksempelet <c1/> setter blant annet:

seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

seg-cfa051b87e59 = Diagrammet motoren skriver for scenarios/lunar-joint-od-clock.toml, type lunar-joint-od-clock

seg-4c6914c162d1 = <b>VALIDATED</b> Batch-fusjon av VLBI + lokal avstand på månen + avstand mellom satellitter for å gjenfinne posisjoner og klokker for stasjon og konstellasjon. Uavhengig referanse (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq med LAPACK gelsd, numpy.linalg.inv; BSD-3) beregner hvert Gauss-Newton-steg, den konvergerte vektede minste kvadraters løsningen, de formelle sigmaene og stasjonsfeilen på nytt, på de innsjekkede Jacobi-matrisene og observasjonene for seks simulerte nettverk, forhåndsregistrert (5094bc31) ved relativt max({ "1e-8" }, { "100" } kappa eps). Den første kjøringen mislyktes for nettverket uten VLBI ({ "6.1e-7" } mot { "1e-8" }, en normalligning

seg-5b3f6008f5a7 = <b>VALIDATED</b> Fisher-informasjon M=HᵀWH, Cramér–Rao nedre grense, observerbarhetsrang / nullrom for datumdefekt (Moore–Penrose-pseudoinvers) og D/A/E/T-optimale eksperiment-d. Uavhengig referanse (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-basert) — en uavhengig tredjepartsautoritet som beregner de samme entydig definerte egenverdiene, Cramér–Rao-kovariansen σ²(XᵀX)⁻¹ og GNSS-faktorene for presisjonsfortynning med en annen algoritme (LAPACK divide-and-conquer + LU) enn Kshanas syklisk-Jacobi-sveip og spektrale pseudoinvers; avstemt til { "1e-9" }. Den samme eksterne biblioteksklassen validerer allerede D

seg-af12da412a10 = <b>MODELLED</b> Fisher-informasjonsobserverbarhet for den felles løsningen på månen: uten jordgrunnlinjer ligger det absolutte referansesystemdatumet i nullrommet til HᵀWH (stasjonsposisjonen uno. Uavhengig referanse (InternalConsistency): Analytisk struktur for datumdefekt — den uobserverbare absolutte referansesystemmoden ligger i nullrommet til Fisher-informasjonen (lukket form), rangterskelen stemmer med den publiserte begrunnelsen for utformingen med 3 stasjoner, og estimatoren når den resulterende CRLB i Monte Carlo. Selve månegeometrien er et representativt nettverk (ikke en fløyet efemeride), så raden forblir MODELLED; den underliggende FIM/CRLB-motoren er kontrollert mot

seg-865ba2668582 = MODELLED simulert lukket-sløyfe-gjenfinning (referansen deler observasjonsmodellen), deterministisk (seedet), IKKE validert mot virkelige data; ingen kraftmodellpropagering inne i løseren; ingen TRL/heritage/støtte fra noe byrå. (typekatalog (<c1/>))

seg-a0d4350a1c66 = Ærlighet: MODELLED simulert lukket-sløyfe-gjenfinning. En injisert referanse avbildes til syntetiske observabler gjennom den SAMME geometrimodellen som løseren inverterer, seedet gaussisk støy legges til, og estimatoren gjenfinner den injiserte referansen innenfor støyen. Den uavhengige referansen er intern konsistens (gjenfinning av referansen + NEES-kovarianserealisme), IKKE validering mot virkelige data. Det finnes ingen kraftmodellpropagering inne i løseren — sate (kommentar i scenariofilen, linje { "24" } til { "29" })

seg-1465694e7e4f = Observerbarhet for absolutt stasjon på månen (datumdefekt) er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e6962535ee72 = <s1>Forrige</s1>lunar-jamming

seg-2ef5c8112d1b = <s1>Neste</s1>lunar-llr-datum
