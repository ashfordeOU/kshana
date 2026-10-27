# docs--kind-aperture-duty-cycle: translations (de)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
# c1: docs/kinds/by-kind/aperture-duty-cycle.md
seg-4b695c0dfc9f = Quelle: <c1/>

# text
# c1: aperture-duty-cycle
seg-632c0a545845 = <c1/> (Szenarioart)

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Aperture-Duty-Cycle: die Aufteilung der Zeit zwischen Navigation und Kommunikation, die ein Kontaktplan für einen Pool lenkbarer Aperturen impliziert. Nimmt einen Kontaktplan (eine Liste von Fenstern <c1/> aos_s/los_s, die jeweils Navigation oder Kommunikation anfordern — dasselbe aos_s/los_s-Vokabular, das der Prädiktor <c2/> ausgibt), eine Aperturanzahl und eine ARBITRIERUNGSREGEL (standardmäßig Navigationspriorität, oder Kommunikationspriorität, oder nicht verdrängendes First-come-first-served) und meldet die Navigationsauslastung, die Kommunikationsauslastung, die Leerlaufauslastung und den Ausfall je Sitzung — die Kontaktzeit, die eine Sitzung angefordert hat und die keine Apertur bedient hat. Ein exakter Intervall-Sweep über die Fenstergrenzen, sodass sich berührende Fenster nie konkurrieren und keine Aperturssekunde doppelt gezählt wird; Navigations-, Kommunikations- und Leerlauf-Aperturssekunden werden unabhängig akkumuliert und schließen gegen apertures*horizon_s. Der Bericht nennt die aufgelöste Regel, ihre vollständige Definition und die Definitionen von Auslastung und Ausfall, weil eine Auslastungszahl ohne ihre Arbitrierungsregel nicht reproduzierbar ist. MODELLED Planungsarithmetik: Es wird keine Schwenk-, Umstimm- oder Wechselzeit berechnet, wenn eine Apertur Dienst oder Sitzung wechselt, und weder Datenvolumen, Pufferzustand, Energiebudget noch Linkschluss gehen in die Entscheidung ein, und die Kontaktfenster sind Eingaben — ihre Geometrie ist, was sie erzeugt hat. Kein Planungsprodukt für das Bodensegment.

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-a8d79b8a96bc = Ein Lauf von <c1/> fasst sich so zusammen: aperture-duty-cycle: { "6" } session(s) on { "2" } aperture(s) under navigation-priority -> navigation duty { "0.1167" }, communications duty { "0.2667" }, idle { "0.6167" }; { "0" } s of { "6900" } s requested lost to contention (MODELLED)

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-67c665d5c8c0 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-60f25ccdab6e = Das Beispiel <c1/> setzt unter anderem:

# text
seg-bf51947657c0 = navigation

# text
seg-b4ff1d640bdf = communications

# text
seg-2e78730d0737 = aperture*s

# text
seg-330cbcd04718 = Anteil (dimensionslos)

# text
seg-0ef5875db338 = Ergebnisbezeichnung (die der Engine): MODELLED — Aperturplanungsarithmetik über einem gelieferten Kontaktplan: ein exakter Intervall-Sweep der Zeitaufteilung zwischen Navigation und Kommunikation und des Konfliktverlusts je Sitzung unter einer benannten Arbitrierungsregel. Es wird keine Schwenk-, Umstimm- oder Wechselzeit berechnet, wenn eine Apertur Dienst oder Sitzung wechselt,

# attr:alt
seg-a8b38ed8e029 = Das Diagramm, das die Engine für scenarios/aperture-duty-cycle.toml schreibt, Art aperture-duty-cycle

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Ein Lauf nimmt einen Kontaktplan (eine Liste von aos_s/los_s-Fenstern, die jeweils von der Apertur Navigation oder Kommunikation anfordern — dasselbe Fenstervokabular, das <c1/> ausgibt, umgewandelt von <c2/>), eine Apert

# text
seg-7a5aa78533d3 = <b>MODELLED</b> Ein Lauf nimmt einen Kontaktplan (eine Liste von aos_s/los_s-Fenstern, die jeweils von der Apertur Navigation oder Kommunikation anfordern — dasselbe Fenstervokabular, das `passes::pre. Unabhängige Referenz (InternalConsistency): Interne Konsistenz, aus drei Größen, die in demselben Sweep durch verschiedene Ausdrücke berechnet und dann zum Schließen verlangt werden. Navigations-Aperturssekunden, Kommunikations-Aperturssekunden und Leerlauf-Aperturssekunden werden getrennt akkumuliert — Leerlauf aus (apertures − |served|) je Elementarintervall, nie als Rest — und ihre Summe wird gegen apertures × horizon_s geprüft, was eine falsch geklammerte Grenze, ein doppelt gezähltes

# text
# c1: label
seg-a388c24fec99 = MODELLED — Aperturplanungsarithmetik über einem gelieferten Kontaktplan: ein exakter Intervall-Sweep der Zeitaufteilung zwischen Navigation und Kommunikation und des Konfliktverlusts je Sitzung unter einer benannten Arbitrierungsregel. Es wird keine Schwenk-, Umstimm- oder Wechselzeit berechnet, wenn eine Apertur Dienst oder Sitzung wechselt, weder Datenvolumen, Pufferzustand, Energiebudget noch Linkschluss gehen in die Entscheidung ein, und die Kontaktfenster sind Eingaben — ihre (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-e689f30b268a = MODELLED Planungsarithmetik: Es wird keine Schwenk-, Umstimm- oder Wechselzeit berechnet, wenn eine Apertur Dienst oder Sitzung wechselt, und weder Datenvolumen, Pufferzustand, Energiebudget noch Linkschluss gehen in die Entscheidung ein, und die Kontaktfenster sind Eingaben — ihre Geometrie ist, was sie erzeugt hat. (Artenkatalog (<c1/>))

# text
# c1: passes
seg-4aa40af30bd2 = EHRLICHER GELTUNGSBEREICH: MODELLED Planungsarithmetik über den gelieferten Fenstern. Es wird keine Schwenk-, Umstimm- oder Wechselzeit berechnet, wenn eine Apertur Dienst oder Sitzung wechselt; weder Datenvolumen, Pufferzustand, Energiebudget noch Linkschluss gehen in die Entscheidung ein; und die Kontaktfenster sind Eingaben -- ihre Geometrie ist, was sie erzeugt hat (das Szenario <c1/> gibt dasselbe aos_s-/los_s-Vokabular aus). Kein Planungs (Kommentar der Szenariodatei, Zeilen { "18" } bis { "24" })

# text
seg-0b7f8d86e5d5 = Der Navigations-gegenüber-Kommunikations-Duty-Cycle einer Apertur ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-dbbefaba93dc = <s1>Zurück</s1>aocs

# text
seg-5b4fd889fdff = <s1>Weiter</s1>araim-reference-check
