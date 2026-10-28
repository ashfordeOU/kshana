# docs--kind-quantum-trade: translations (da)

seg-debc2f07db78 = true

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-7b2721b7588d = Scenarietype i motoren v{ $version }, familie <a1>Inertial-, fusions- og kvantesensorer</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-f7f12029e0ec = Familieside: <a1>Inertial-, fusions- og kvantesensorer</a1>

seg-496b17a8d3b9 = Emneside: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Ikke leveret: kun ydelsesmodeller; koldatom-/urhardware er en partners. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test i designet

seg-51cac2f918e0 = Emneside: <a1>POSITIONING.md</a1>

seg-3a8c76a2396f = Kilde: <c1/>

seg-f9af2813532e = <c1/> (scenarietype)

seg-eb55d253dd11 = Afvejning mellem kvante og klassisk PNT ({ "13503" }): fordelen ved holdover for tidssynkronisering + holdover for inerti for et kandidat-ur (en målt ADEV-kurve — forsvarlighedens omdrejningspunkt — eller en kvanteurklasse) mod en klassisk baseline-klasse, hvor forbeholdet om antagelsen for gulvet ved lang tau følger med artefaktet, plus en envelope for modstandsdygtighed mod tid ved GNSS-nægtelse. MODELLED; kvantificerer (validerer aldrig) en partners enhed. Kandidatens ur er en målt kurve (<c1/> + <c2/>, lige lange, mindst { "2" } punkter; den vinder, når begge former er angivet) eller en <c3/>.

seg-4f470bc1d82c = Én kørsel af <c1/> opsummeres som: quantum-trade | kandidat målt ADEV | holdover for tidssynkronisering 2621947s mod 203s (12943.62x) | inerti 14108s mod 378s (37.34x) | coast for modstandsdygtighed 14108s | MODELLED [forbehold: antaget gulv]

seg-2639560aeff2 = Påkrævede felter: <c1/>, <c2/>, <c3/>, <c4/>

seg-d66f1ef84201 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>

seg-f2cc0830b53f = Eksemplet <c1/> angiver blandt andet:

seg-ee5bcbbe0167 = csac

seg-f5fa445702c6 = Resultatetiket (motorens egen): MODELLED — kvantificerer (validerer aldrig) et partnerur eller en partnersensor; ikke demonstreret i flyvning

seg-c74c63ffd859 = Diagrammet, som motoren skriver for scenarios/quantum-trade.toml, type quantum-trade

seg-93310aaa6ead = <b>VALIDATED</b> NNLS-genfinding af potenslov (hvid FM + gulv med rød støj) ud fra en offentliggjort målt Allan-deviation for overgangen i et optisk ⁸⁸Sr-ur — gengiver σ_y(τ) og den centrale skalering 4.7e-16/√τ ved kort τ med et ægte målt gulv ved lang τ, i stedet for Tests: <a1>optical_clock_adev_reference.rs</a1>.

seg-fc46e95688ba = <b>VALIDATED</b> NNLS-tilpasning af målt ADEV, NEES/NIS-bånd for χ²-konsistens og urets diskrete kovarians af processtøj efter van Loan (holdover-coast) — afvejningsmotorens beregningsmæssige rygrad Tests: <a1>scipy_reference.rs</a1>.

seg-6e2b62136cef = <b>MODELLED</b> Indlæsning af målt ADEV (NNLS), afvejningstabel (holdover for tidssynkronisering/inerti + fordel), envelope for modstandsdygtighed mod tid; forbehold om gulvet følger med artefaktet.

seg-b577b8464cf7 = <b>VALIDATED</b> NNLS-tilpasning af målt ADEV, NEES/NIS-bånd for χ²-konsistens og urets diskrete kovarians af processtøj efter van Loan (holdover-coast) — afvejningsmotorens beregnin. Uafhængig reference (ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q nøjagtigt, χ² <{ "5e-4" } ved driftsfrihedsgrader. Kun kerner — tal for enhedens ydeevne forbliver modelleret (næste række)

seg-6b8aa8cd6d3e = <b>MODELLED</b> Indlæsning af målt ADEV (NNLS), afvejningstabel (holdover for tidssynkronisering/inerti + fordel), envelope for modstandsdygtighed mod tid; forbehold om gulvet følger med artefaktet. Kan køres fra. Uafhængig reference (ExternalDataset): kernen til tilpasning af målt ADEV→PSD (NNLS) er afstemt mod scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — en uafhængig ekstern kerne; men TALLENE i afvejningen kvantificerer (validerer aldrig) et partnerur eller en partner-CAI, så afvejningen selv forbliver MODELLED, ingen validerings-glorie

seg-3d678f64e41c = MODELLED — kvantificerer (validerer aldrig) et partnerur eller en partnersensor; ikke demonstreret i flyvning (resultat <c1/>)

seg-20ba66ae9518 = Afvejning mellem kvante og klassisk PNT ({ "13503" }): fordelen ved holdover for tidssynkronisering + holdover for inerti for et kandidat-ur (en målt ADEV-kurve — forsvarlighedens omdrejningspunkt — eller en kvanteurklasse) mod en klassisk baseline-klasse, hvor forbeholdet om antagelsen for gulvet ved lang tau følger med artefaktet, plus en envelope for modstandsdygtighed mod tid ved GNSS-nægtelse. (typekatalog (<c1/>))

seg-45a1d84eef18 = MODELLED; kvantificerer (validerer aldrig) en partners enhed. (typekatalog (<c1/>))

seg-15275d27252a = Beregner fordelen ved holdover for tidssynkronisering og holdover for inerti for et KANDIDAT-ur i forhold til en KLASSISK baseline, plus en envelope for modstandsdygtighed mod tid ved GNSS-nægtelse. Kandidatens gulv drives af et partnerurs MEASURED overlappende ADEV-kurve (forsvarlighedens omdrejningspunkt), tilpasset ved ikke-negative mindste kvadrater — så budgettet for holdover hviler på reelle data, ikke på et antaget gulv ved lang tau. (kommentar i scenariefilen, linje { "3" } til { "7" })

seg-ecbdbc9b163e = ÆRLIG AFGRÆNSNING: MODELLED — den KVANTIFICERER fordelen ved et partners kvanteur; den validerer IKKE enheden og låner aldrig øerne af validering for SGP4/Allan/IGS. Når gulvet i en række er en antaget klassestandard, vises et forbehold om gulvet på artefaktet. Kør: kshana scenarios/quantum-trade.toml (kommentar i scenariefilen, linje { "9" } til { "12" })

seg-4b59ac409819 = Afvejning mellem kvante og klassisk PNT og GNSS-nægtet modstandsdygtighed ({ "13503" }) er MODELLED, ikke valideret: et delkrav er kontrolleret eksternt, men hele funktionen sammensætter modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e6498fae3ba7 = <s1>Forrige</s1>quantum-time-transfer

seg-50d4bbb7486b = <s1>Næste</s1>realtime-frame-eop
