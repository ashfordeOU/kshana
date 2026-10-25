# docs--kind-conflict-resilience: translations (de)

# text
seg-216efc4e6fba = Szenariotyp der Engine v{ $version }, Familie <a1>GPS-gesperrtes alternatives PNT</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-98133e74f88a = Familienseite: <a1>GPS-gesperrtes alternatives PNT</a1>

# text
# c1: docs/kinds/by-kind/conflict-resilience.md
seg-34f14aa2ee0b = Quelle: <c1/>

# text
# c1: conflict-resilience
seg-a80556cfe1a9 = <c1/> (Szenariotyp)

# text
seg-c8f93431680a = MODELLED Konfliktresilienz geschichteten PNT (P7): Ein Nutzer in umkämpfter Umgebung setzt mehrere PNT-Schichten ein (Open-Service-GNSS, Breitband-GNSS, eine authentifizierte Konstellation, ein Augmentations-Relais), jede mit einer Basisverfügbarkeit, einer 1σ-Genauigkeit und einer Verwundbarkeit je Vektor gegenüber der gemeinsamen Jamming-/Spoofing-Bedrohung. Ein nach Intensität variiertes Monte-Carlo mit SEED sperrt jede Schicht mit der Wahrscheinlichkeit clamp(Verwundbarkeit·Intensität·Vektorgewicht,{ "0,1" }), fusioniert die überlebenden Schichten nach der geschlossenen Inverse-Varianz-Regel σ_fused=(Σ 1/σ_i²)^(−1/2) und meldet die Gesamtausfallwahrscheinlichkeit (alle Schichten gesperrt), den mittleren fusionierten Fehler sowie Statistiken zu Nutzbarkeit und Sperrung je Schicht über der Intensität. Das Kern-Resilienzverhältnis (Gesamtausfallwahrscheinlichkeit einer einzelnen Schicht gegenüber der geschichteten) liegt unter der UNABHÄNGIGKEITS-Annahme bei ~7x; ein anschließender Sweep mit korrelierter Sperrung über eine Ein-Faktor-Gauß-Kopula zeigt dann, dass dieses ~7x gegen { "1" } zusammenbricht, wenn die Sperrkorrelation steigt (Korrelation hebelt die Schichtung aus). Ein Block zur Prior-Sensitivität variiert den Kernwert über die QUELLENBASIERTEN Verwundbarkeits-Priors per mcda-Tornado + Dirichlet-Neuverteilung des Bedrohungsaufwands + Perzentil-Konfidenzintervallen. VALIDATED-Kern: Der Monte-Carlo-Gesamtausfall konvergiert gegen das geschlossene unabhängige Produkt Π_i p_deny_i (innerhalb des Monte-Carlo-Standardfehlers bei festem Seed und großem N); die Inverse-Varianz-Fusion ist eine geschlossene Identität; bei ρ={ "0" } reduziert sich die Kopula auf das unabhängige Modell, und jedes ρ erhält die Rand-Sperrrate jeder Schicht. MODELLED: Die Größenordnungen von Verwundbarkeit/Verfügbarkeit/Genauigkeit je Schicht sind quellenbasierte, aber modellierte Eingaben (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG – siehe conflict_threat_params), und die konkrete ~7x-Größenordnung sowie der Kurvenverlauf Verhältnis gegen Korrelation folgen aus dieser Parametrisierung. Eine Aufschlüsselung des Überlebens je Vektor nach §{ "4.2" } löst dann die gemeinsame HF-Bedrohung in die vier benannten Vektoren (Jamming/Spoofing/kinetisch/Cyber) auf und meldet die Kurve des allmählichen Leistungsabfalls nutzbaren PNT je Vektor S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) – VALIDATED: Das Monte-Carlo je Schicht mit Seed konvergiert gegen diese geschlossene Form; Jamming ist der schärfste Vektor für die korrelierte HF-Basislinie, und die HF-immune Inertialschicht ist der entscheidende Überlebende. Kein zertifiziertes Produkt zur Navigationsverfügbarkeit.

# text
# c1: scenarios/conflict-resilience.toml
seg-dd10a00edc2f = Ein Lauf von <c1/> ergibt zusammengefasst: conflict-resilience | { "4" } Schichten ({ "0" } Basislinie) | Referenzintensität { "1.00" } | Resilienzverhältnis geschlossen 6.73x MC 6.19x (geschichtet gegenüber einzelner Schicht) | Korrelation hebelt Schichtung aus: Verhältnis 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | Prior-KI [5.51-8.48]x | Überleben je Vektor @ Ref. Jam { "26" }% Spoof { "80" }% kinetisch { "100" }% Cyber { "99" }% (schärfstes Jamming) | ~7x Kernwert MODELLED, VALIDATED MC->geschlossene Form / Fusionsidentität / Kopula-Ränder / Überleben je Vektor

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-674bafccbaf7 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/conflict-resilience.toml
seg-71fcff68edaf = Das Beispiel <c1/> setzt unter anderem:

# text
seg-4e3b5bb5a5e7 = GNSS L1 C/A (Open Service)

# text
seg-bd3832c8215d = Ergebnisbezeichnung (die der Engine): MODELLED Konfliktresilienz geschichteten PNT (P7). VALIDATED-Kern: Die Monte-Carlo-Gesamtausfallwahrscheinlichkeit konvergiert gegen das geschlossene unabhängige Produkt Pi_i p_deny_i (innerhalb des Monte-Carlo-Standardfehlers bei festem Seed und großem N geprüft); die Inverse-Varianz-Positionsfusion sigma_fused = (Summe_i 1/sig

# attr:alt
seg-4dd2bcc206db = Das Diagramm, das die Engine für scenarios/conflict-resilience.toml schreibt, Typ conflict-resilience

# text
seg-c0e69524f05d = <b>MODELLED</b> Teilbewertungen je Dimension über Kshanas eigene sieben Resilienzkategorien (keine DHS-Begriffe), RethinkPNT-RDRR-Funktionen und Yang-Kriterien, jeweils als Modelled gekennzeichnet mit i. Unabhängige Referenz (InternalConsistency): Von Hand hergeleitete Formeln je Metrik: inverser Simpson-Diversitätsindex, gewichteter Mittelwert als Gesamtwert, begrenzte/unbegrenzte Zeitleistendauern, Schwächstes-Glied-Stufenleiter

# text
# c1: label
seg-2ca37a78e899 = MODELLED Konfliktresilienz geschichteten PNT (P7). VALIDATED-Kern: Die Monte-Carlo-Gesamtausfallwahrscheinlichkeit konvergiert gegen das geschlossene unabhängige Produkt Pi_i p_deny_i (innerhalb des Monte-Carlo-Standardfehlers bei festem Seed und großem N geprüft); die Inverse-Varianz-Positionsfusion sigma_fused = (Summe_i 1/sigma_i^{ "2" })^(-1/2) ist eine geschlossene Identität; bei Korrelation rho={ "0" } reduziert sich die Gauß-Kopula exakt auf das unabhängige Mo (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-d0d834e377ee = MODELLED Konfliktresilienz geschichteten PNT (P7): Ein Nutzer in umkämpfter Umgebung setzt mehrere PNT-Schichten ein (Open-Service-GNSS, Breitband-GNSS, eine authentifizierte Konstellation, ein Augmentations-Relais), jede mit einer Basisverfügbarkeit, einer 1σ-Genauigkeit und einer Verwundbarkeit je Vektor gegenüber der gemeinsamen Jamming-/Spoofing-Bedrohung. (Typkatalog (<c1/>))

# text
# c1: kshana kinds --json
seg-3ca12700b54c = Das Kern-Resilienzverhältnis (Gesamtausfallwahrscheinlichkeit einer einzelnen Schicht gegenüber der geschichteten) liegt unter der UNABHÄNGIGKEITS-Annahme bei ~7x; ein anschließender Sweep mit korrelierter Sperrung über eine Ein-Faktor-Gauß-Kopula zeigt dann, dass dieses ~7x gegen { "1" } zusammenbricht, wenn die Sperrkorrelation steigt (Korrelation hebelt die Schichtung aus). (Typkatalog (<c1/>))

# text
# c1: kshana kinds --json
seg-70e4fdff099f = MODELLED: Die Größenordnungen von Verwundbarkeit/Verfügbarkeit/Genauigkeit je Schicht sind quellenbasierte, aber modellierte Eingaben (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG – siehe conflict_threat_params), und die konkrete ~7x-Größenordnung sowie der Kurvenverlauf Verhältnis gegen Korrelation folgen aus dieser Parametrisierung. (Typkatalog (<c1/>))

# text
seg-33541cca61b6 = Ein Nutzer in umkämpfter Umgebung setzt vier HF-PNT-Schichten ein, die alle im selben Band liegen und daher den Sperrvektor Jamming/Spoofing teilen – der fragile, korrelierte Fall. Das Szenario meldet: * die Gesamtausfallwahrscheinlichkeit über der Bedrohungsintensität (Monte-Carlo gegenüber dem geschlossenen unabhängigen Produkt, gegen das es konvergiert), * das ~7x-Resilienzverhältnis geschichtet gegenüber einzelner Schicht unter der Unabhängigkeits-Annahme, * wie dieses ~7x zusammenbricht auf (Kommentar der Szenariodatei, Zeilen { "3" } bis { "15" })

# text
# c1: layers
seg-83badfe4784d = Jede Größenordnung je Schicht ist eine MODELLED-Eingabe mit Herkunftsnachweis; siehe src/conflict_threat_params.rs für die quellenbasierten Priors [min, nominal, max] und die Anfälligkeitsprofile je Vektor (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Wird <c1/> weggelassen, läuft dieselbe quellenbasierte Vier-Schichten-Basislinie; hier ist sie aus Transparenzgründen ausgeschrieben – einschließlich des vector_profile jeder Schicht. (Kommentar der Szenariodatei, Zeilen { "17" } bis { "22" })

# text
seg-bb182ed41520 = Die am PNT-Resilienz-Rahmenwerk ausgerichtete Bewertung ist MODELLED, nicht validiert: gegen ihre eigene geschlossene bzw. analytische Identität geprüft – erkennt Übertragungs- und Koeffizientenfehler, ist aber keine externe Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-6a42653a8a0f = <s1>Zurück</s1>combined-altpnt

# text
seg-2bd3e9d1505c = <s1>Weiter</s1>constellation-design
