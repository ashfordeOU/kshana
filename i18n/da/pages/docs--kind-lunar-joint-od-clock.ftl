# docs--kind-lunar-joint-od-clock: translations (da)

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-593938ee5995 = Kilde: <c1/>

seg-d54a85227f43 = <c1/> (scenarietype)

seg-200e58e189c2 = Modelleret fælles lunar estimator i flere teknikker til banebestemmelse + ur i batch på et SIMULERET net: en Gauss-Newton-tilpasning af et øjebliksbillede, der fusionerer geodætiske VLBI-delays på jordbaselines, lunar-lokale afstande mellem station og satellit og afstande mellem satellitter for sammen at gendanne en lunar overfladestations 3D-position, en lille konstellations positioner og hvert aktivs urforskydning ud fra en tilført reference. Det centrale ærlige resultat — VLBI gør stationens fulde 3D-position observerbar, hvor lunar-lokal afstandsmåling alene efterlader en svagt observeret retning — rapporteres som kontrasten i stationsfejl med og uden VLBI. MODELLED simuleret lukket-sløjfe-gendannelse (referencen deler observationsmodellen), deterministisk (seedet), IKKE valideret med reelle data; ingen kraftmodelpropagering inde i solveren; ingen TRL-, heritage- eller myndighedsstøtte.

seg-6419390eeae4 = Én kørsel af <c1/> opsummeres som: lunar-joint-od-clock | { "3" } sats, { "6" } Earth stations | station 3-D err with VLBI { "3.54" } m vs range-only { "2184.02" } m ({ "617.5" }× sharper) | sat pos RMS { "2.20" } m | station clk err { "2.87e-10" } s | obs 40/16 params

seg-be3bcad756cc = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-ef164af52468 = Eksemplet <c1/> sætter blandt andet:

seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

seg-cfa051b87e59 = Diagrammet, som motoren skriver for scenarios/lunar-joint-od-clock.toml, type lunar-joint-od-clock

seg-4c6914c162d1 = <b>VALIDATED</b> Batchfusion af VLBI + lunar-lokal afstand + afstand mellem satellitter til gendannelse af positioner og ure for station og konstellation. Uafhængig reference (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq med LAPACK gelsd, numpy.linalg.inv; BSD-3) genberegner hvert Gauss-Newton-trin, den konvergerede vægtede mindste kvadraters løsning, de formelle sigmaer og stationsfejlen på de committede Jacobi-matricer og observationer for seks simulerede net, præregistreret (5094bc31) ved max({ "1e-8" }, { "100" } kappa eps) relativt. Første kørsel mislykkedes for nettet uden VLBI ({ "6.1e-7" } mod { "1e-8" }, en normalligning

seg-5b3f6008f5a7 = <b>VALIDATED</b> Fisher-information M=HᵀWH, Cramér–Rao-nedre grænse, observerbarhedsrang / nulrum for datumdefekt (Moore–Penrose-pseudoinvers) og D/A/E/T-optimal eksperimentud. Uafhængig reference (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-baseret) — en uafhængig tredjepartsautoritet, der beregner de samme entydigt definerede egenværdier, σ²(XᵀX)⁻¹ Cramér–Rao-kovariansen og GNSS-faktorerne for præcisionsfortynding med en anden algoritme (LAPACK divide-and-conquer + LU) end Kshanas cykliske Jacobi-sweep og spektrale pseudoinvers; stemmer til { "1e-9" }. Den samme klasse af eksterne biblioteker validerer allerede D

seg-af12da412a10 = <b>MODELLED</b> Fisher-information om observerbarheden i den fælles lunare løsning: uden jordbaselines ligger det absolutte referencesystems datum i nulrummet for HᵀWH (stationens position uno. Uafhængig reference (InternalConsistency): Analytisk struktur for datumdefekten — den uobserverbare tilstand i det absolutte referencesystem ligger i nulrummet for Fisher-informationen (lukket form), rangtærsklen svarer til den offentliggjorte begrundelse for et design med 3 stationer, og estimatoren når den resulterende CRLB i Monte Carlo. Selve den lunare geometri er et repræsentativt net (ikke en fløjet efemeride), så rækken forbliver MODELLED; den underliggende FIM/CRLB-motor er kontrolleret mod

seg-865ba2668582 = MODELLED simuleret lukket-sløjfe-gendannelse (referencen deler observationsmodellen), deterministisk (seedet), IKKE valideret med reelle data; ingen kraftmodelpropagering inde i solveren; ingen TRL-, heritage- eller myndighedsstøtte. (kategori-katalog (<c1/>))

seg-a0d4350a1c66 = Ærlighed: MODELLED simuleret lukket-sløjfe-gendannelse. En tilført reference afbildes på syntetiske observabler gennem SAMME geometrimodel, som solveren inverterer, seedet gaussisk støj tilføjes, og estimatoren gendanner den tilførte reference inden for støjen. Den uafhængige reference er intern konsistens (gendannelse af referencen + realisme i NEES-kovariansen), IKKE validering med reelle data. Der er ingen kraftmodelpropagering inde i solveren — sate (kommentar i scenariefilen, linje { "24" } til { "29" })

seg-1465694e7e4f = Lunar observerbarhed af absolut station (datumdefekt) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e6962535ee72 = <s1>Forrige</s1>lunar-jamming

seg-2ef5c8112d1b = <s1>Næste</s1>lunar-llr-datum
