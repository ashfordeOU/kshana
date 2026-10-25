# docs--kind-cislunar-observability: translations (de)

# attr:alt
seg-f15bbf30b0dd = Das Diagramm, das die Engine für scenarios/cislunar-observability.toml schreibt, Typ cislunar-observability

# text
seg-4564ad90378b = <b>MODELLED</b> Die cislunare Bogenlängen-Beobachtbarkeitsschwelle im RÄUMLICHEN Sechs-Zustands-CR3BP statt im ebenen Vier-Zustands-Modell, über DRO-, L2-Halo- und L2-Near-Rectilinear-Halo-Familien, wobei das Messrauschen in die Gramsche Matrix eingeht und ZWEI Kriterien melden

# text
seg-9f857ff85800 = <b>MODELLED</b> Die cislunare Bogenlängen-Beobachtbarkeitsschwelle im RÄUMLICHEN Sechs-Zustands-CR3BP statt im ebenen Vier-Zustands-Modell, über DRO-, L2-Halo- und L2-Near-Rectilinear-Halo-Fam. Unabhängige Referenz (InternalConsistency): Ein unabhängiger Zeilenstufen-Rang per Gauß-Elimination mit partieller Pivotisierung bestätigt jedes Sechs-Zustands-Rangurteil – ein anderer Algorithmus, der keinen Code mit dem zu prüfenden Eigenwert-/SVD-Weg teilt. Die { "6" }×{ "6" }-Zustandsübergangsmatrix des CR3BP, aus der dies zusammengesetzt ist, trägt ihre eigene ReferenceImpl-Referenz gegen die variationelle Integration mit SciPy, und die Halo-/NRHO-Anfangsbedingungen stammen aus einem Korrektor, der die veröffentlichte südliche L2

# text
# c1: kshana kinds --json
seg-f6a217f57bec = MODELLED ebene cislunare Konstellations-Beobachtbarkeit (P6): verfolgt eine Konstellation aus vier Raumfahrzeugen auf differenziell korrigierten ebenen DRO mit Inter-Satelliten-Entfernungsmessung und meldet, wie viel vom Vier-Zustand [x,y,ẋ,ẏ] eines Raumfahrzeugs der Bogen beobachtbar macht. (Typkatalog (<c1/>))

# text
# c1: kshana kinds --json
seg-e5182743fd40 = MODELLED: der Konstellationsentwurf (DRO-Perilun-Amplituden und -Phasen) und die konkrete Rangfolge, die er ergibt. (Typkatalog (<c1/>))

# text
seg-c68bc1df8975 = Räumliche, verrauschte cislunare Bogenlängen-Beobachtbarkeit über mehrere Familien ist MODELLED, nicht validiert: gegen ihre eigene geschlossene bzw. analytische Identität geprüft – erkennt Übertragungs- und Koeffizientenfehler, ist aber keine externe Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-ba3c2a8f0e28 = <s1>Zurück</s1>cislunar-arc-recovery

# text
seg-3adfb78b1f34 = <s1>Weiter</s1>clock

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-6d584e86deba = Verhältnis (dimensionslos)

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
# c1: docs/kinds/by-kind/cislunar-observability.md
seg-258f128cea60 = Quelle: <c1/>

# text
# c1: cislunar-observability
seg-f0c7758e472f = <c1/> (Szenarioart)

# text
seg-7ccd0a3babb8 = MODELLED Beobachtbarkeit einer ebenen cislunaren Konstellation (P6): verfolgt eine differenzialkorrigierte ebene DRO-Konstellation aus vier Raumfahrzeugen mit Entfernungsmessung zwischen den Satelliten und meldet, wie viel vom Vierzustand [x,y,ẋ,ẏ] eines Raumfahrzeugs der Bogen beobachtbar macht. Gibt aus ({ "1" }) die Tabelle Rang gegen Bogenlänge für eine einzelne reine Entfernungsverbindung — momentan Rang 1, wachsend zum vollen Vierzustand, wenn sich der Bogen verlängert (P6 Tabelle { "1" }); ({ "2" }) das Eigenspektrum der Beobachtbarkeits-Gram-Matrix + Konditionszahl über den Bogen; ({ "3" }) den Vergleich des momentanen Rangs von reiner Entfernung gegenüber Entfernung + Entfernungsrate (der Doppler-Entwurfshebel) plus die Meldung von GDOP bei reiner Entfernung singulär / bei Entfernung + Rate definiert; und ({ "4" }) eine unabhängige SRIF-Gegenprüfung, deren Posteriori-Kovarianz genau an dem Bogen endlich bzw. gut konditioniert wird, an dem der beobachtbare Rang vier erreicht. VALIDATED Kern: Der beobachtbare Rang ist eine rangaufdeckende Singulärwertschwelle, gegengeprüft mit dem Eigenrang der Gram-Matrix; das Eigenspektrum gehorcht den spektralen Invarianten (Spur=Σλ, Det=Πλ, Frobenius²=Σλ²); die variationale STM ist die durch finite Differenzen validierte CR3BP-STM; die Jacobi-Zeilen für Entfernung/Entfernungsrate sind durch finite Differenzen validierte analytische Partialableitungen (gegengeprüft mit der 3-D-Entfernungsraten-Observablen des Crates); die vier Anfangsbedingungen sind differenzialkorrigierte ebene DROs, die sich bis auf ein enges Periodizitätsresiduum schließen und retrograd sind; der Rangübergang ist gegen den Square-Root-Information-Filter des Crates gegengeprüft (Posteriori-Kovarianz genau bei vollem Rang endlich, cond(P)=cond(OᵀO)); ein rangdefizienter Schnappschuss wird als GDOP-undefiniert markiert (fim condition=inf), nie als ein falscher endlicher Wert — derselbe Schutz vor singulärer Geometrie, den pvt::solve_spp anwendet. MODELLED: der Konstellationsentwurf (Perilunamplituden und -phasen der DRO) und die konkrete Rangfolge, die er erzeugt. Kein zertifiziertes Navigationsleistungsprodukt.

# text
# c1: scenarios/cislunar-observability.toml
seg-a59f2fa9efb9 = Ein Lauf von <c1/> fasst sich so zusammen: cislunar-observability | { "4" } s/c ({ "3" } refs) | { "6.0" } h arc, { "24" } epochs | rank { "1" } → { "4" } of { "4" } over arc | Gramian λ [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | instantaneous rank range-only { "2" } → range+rate { "4" } ({ "3" } links) | GDOP range-only undefined range+rate { "6.353" } | DRO ICs (max periodicity residual { "4.7e-9" }) | SRIF posterior finite at rank-4 epoch { "8" } (Validated rank/STM/DRO-closure/SRIF, Modelled design)

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: rel_tol
# c6: spatial
# c7: sigma_range_m
# c8: family
# c9: n_spacecraft
# c10: sigma_pos_threshold_km
seg-fb1601eda130 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/cislunar-observability.toml
seg-f3b5cc590c78 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-0cc8ab10786b = Zeiteinheiten im rotierenden Bezugssystem

# text
seg-84781b6fff48 = GDOP undefiniert (rangdefizient / singulä

# text
seg-856eb311f24b = „undefined“ (Text, wie das Dokument ihn angibt

# text
seg-1767b216650d = definiert

# text
seg-fc5d34345fdd = Ergebnisbezeichnung (die der Engine): MODELLED Beobachtbarkeit einer ebenen cislunaren Konstellation (P6). VALIDATED Kern: Der beobachtbare RANG ist eine rangaufdeckende Singulärwertschwelle, gegengeprüft mit dem Eigenrang der Gram-Matrix; das Eigenspektrum der Gram-Matrix gehorcht den spektralen Invarianten (Spur = Summe eig, Det = Produkt eig, Frobenius^{ "2" } = Summe eig^{ "2" }

# text
# c1: label
seg-53c183035bde = MODELLED ebene cislunare Konstellations-Beobachtbarkeit (P6). Kern VALIDATED: Der beobachtbare RANG ist eine rangaufdeckende Singulärwert-Schwelle, gegengeprüft mit dem Eigenrang der Gramschen Matrix; das Eigenwertspektrum der Gramschen Matrix gehorcht den spektralen Invarianten (Spur = Summe eig, det = Produkt eig, Frobenius^{ "2" } = Summe eig^{ "2" }); die variationelle STM ist die mit finiten Differenzen validierte CR3BP-STM (crate::cr3bp); die Jacobi-Zeilen für Entfernung / Entfernungsrate (Ergebnis <c1/>)

# text
seg-5d3a370f1295 = Ehrlichkeit: MODELLED. Kern VALIDATED -- der beobachtbare RANG ist eine rangaufdeckende Singulärwert-Schwelle, gegengeprüft mit dem Eigenrang der Gramschen Matrix; das Eigenwertspektrum gehorcht den spektralen Invarianten (Spur = Summe eig, det = Produkt eig, Frobenius^{ "2" } = Summe eig^{ "2" }); die variationelle STM ist die mit finiten Differenzen validierte CR3BP-STM; die Jacobi-Zeilen für Entfernung / Entfernungsrate sind mit finiten Differenzen validierte analytische Partielle (gegengeprü (Kommentar der Szenariodatei, Zeilen { "16" } bis { "25" })
