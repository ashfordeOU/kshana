# docs--kind-quantum-gnss-free-nav: translations (da)

seg-619127334cf3 = Ingen matrixrække nævner denne type ved navn; mærkaten på dens resultat er motorens egen, ovenfor.

seg-7b2721b7588d = Scenarietype i motoren v{ $version }, familie <a1>Inertial-, fusions- og kvantesensorer</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Koldatom-interferometer-accelerometer ud fra grundprincipper (k_eff·T², QPN). Uafhængig reference (ExternalDataset): Offentliggjorte numeriske vektorer fra CAI-primærartikler (Cheinet { "2008" }, overføringsfunktion; Peters/Freier, følsomhed): k_eff·T² stemte præcist, skudstøjens ASD et ensidet gulv inden for ca. { "2" }× af hvert offentliggjort instrument (rigtige enheder har teknisk støj over kvantegulvet). Et interval, ikke paritet. { "0.30" } runde { "2" } (præregistreret fcb9ac64), et fund (forbliver MODELLED): rotationsstøjen med kun QPN mod den målte Gauguet et al.

seg-9955b1b1c018 = Kvanteinertial sensorydelse er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Inertial-, fusions- og kvantesensorer</a1>

seg-496b17a8d3b9 = Emneside: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Emneside: <a1>QUANTUM.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Ikke leveret: kun ydelsesmodeller; koldatom-/urhardware er en partners. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test i designet

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Ét reproducerbart TradeEvidence-objekt (fast ramme: scenarie+seed+motor; fælles værdier for kvante mod klassisk pr. kvalitetsmål med polaritetskorrekt fordel, valgfri { "95" }%. Uafhængig reference (InternalConsistency): identiteter i lukket form for fordel og vinder + tro indpakning af det eksisterende quantum_trade::TradeResult; ærligheden er knyttet til registeret over repræsentativitet og verifikationsmærkaterne

seg-eb75c6a4dcec = Afvejning mellem kvante og klassisk (fælles form) er MODELLED, ikke valideret: kontrolleret mod dens egen identitet i lukket/analytisk form — det fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-bfbcc7e8f620 = Kilde: <c1/>

seg-cfa59601df4a = <c1/> (scenarietype)

seg-790fbfdd80f0 = MODELLED GNSS-fri kvantenavigation: under et GNSS-udfald et inertibudget for kvante (kold-atom-interferometer) mod et klassisk INS af navigationskvalitet — vækst af positionsfejl over coast-perioden, holdover til en tærskel for position og afvejningen mellem kvante og klassisk som ærlig TradeEvidence med repræsentativitet. Ærlig note om observerbarhed: uden en ekstern positionsbestemmelse er accelerometerets bias uobserverbar, så fejlen vokser; kvantesensoren bremser, men lukker ikke dette hul. Illustrative enhedsparametre fra offentlige kilder; modellerer klassen, ingen TRL/flyvning/certificering.

seg-dd74f248373d = Én kørsel af <c1/> opsummeres som: quantum-gnss-free-nav | udfald 300s | positionsfejl kvante { "0.00" } m mod klassisk { "37.31" } m (8289.5x) | holdover kvante 44721s mod klassisk 534s (tærskel { "100" } m) | afvejning: kvante vinder 2/2 | MODELLED

seg-960491d74173 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>

seg-88d9dfe0353a = Eksemplet <c1/> angiver blandt andet:

seg-1bdbf1a737b2 = Diagrammet, som motoren skriver for scenarios/quantum-gnss-free-nav.toml, type quantum-gnss-free-nav

seg-d196391dcf4f = <b>MODELLED</b> Kvante (kold-atom-interferometer) mod klassisk dødregning med INS af navigationskvalitet over et GNSS-udfald: vækst af positionsfejl, holdover til en tærskel for position,. Uafhængig reference (InternalConsistency): genbrugte inertibudgetter krydskontrolleret mod en uafhængig dobbeltintegration i Octave af den samme ODE for dødregning (anden køretid, delt model → ReferenceImpl) plus Freier-2016's offentliggjorte kortidsstøj som et ensidigt ankerpunkt; sammensætningen af kvante mod klassisk forbliver MODELLED

seg-af35cccc4e2c = MODELLED GNSS-fri kvantenavigation: under et GNSS-udfald et inertibudget for kvante (kold-atom-interferometer) mod et klassisk INS af navigationskvalitet — vækst af positionsfejl over coast-perioden, holdover til en tærskel for position og afvejningen mellem kvante og klassisk som ærlig TradeEvidence med repræsentativitet. (typekatalog (<c1/>))

seg-9b9ce7600ffc = GNSS-fri kvantenavigation — dødregning med kvante (kold-atom-interferometer) mod klassisk INS af navigationskvalitet over et GNSS-udfald. MODELLED; illustrative enhedsparametre fra offentlige kilder; modellerer klassen, ingen påstand om TRL eller flyvning. (kommentar i scenariefilen, linje { "1" } til { "3" })

seg-9d67411151e3 = GNSS-fri kvantenavigation er MODELLED, ikke valideret: kontrolleret mod dens egen identitet i lukket/analytisk form — det fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e1d502e1ed6d = <s1>Forrige</s1>quantum-anomaly-detect

seg-1f3705925b3c = <s1>Næste</s1>quantum-time-transfer
