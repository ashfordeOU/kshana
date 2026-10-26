# docs--bench: translations (nl)

seg-5aa5efd6b7da = AUC

seg-5fcf52aba837 = Bron: <c1/>

seg-d3c3517e3bb2 = Een open set taken, splitsingen en metrieken voor het detecteren van GNSS-interferentie en voor holdover van de tijdsynchronisatie. De specificatie is <a1><c1/></a1> (versie { "2.0.0" }; licentie van de tekst en de manifesten: CC-BY-4.0 / CC0 voorgesteld, besluit van de eigenaar nog in afwachting). De licentiebeoordeling van de datasets is <a2><c2/></a2>. De drempels van de basislijnen zijn vastgelegd vóór de eerste gescoorde run in <a3><c3/></a3> en, voor { "2.0.0" }, <a4><c4/></a4>, en hun resultaten staan in <a5><c5/></a5>.

seg-6c455061baac = Uitspraken zoals daar vastgelegd: de drempels van de scorer, C1 tot en met C3 en D2 zijn gehaald; <b>A2 is NOT MET</b> (<c1/> AUC { "0.766" } tegenover minimaal { "0.80" } op de testsplitsing), <b>D1 is NOT MET</b> (grootste verschil { "0.0301" }) en <b>taak (b) R1 is NOT MET</b> (overgenomen, niet opnieuw gedraaid). Geen enkele drempel is versoepeld.

seg-ebe1c987bc7c = Wat het is: een manier om methoden te vergelijken op dezelfde gegevens met dezelfde metriekcode. Wat het niet is: een ranglijst van producten, een goedkeuring of bewijs dat een methode in het veld werkt. Elke score is MODELLED, en een score beschrijft een log of een corpus, nooit een product. { -brand }-resultaten zijn adviserend.

seg-874effe5ee80 = De ingebouwde basislijnen van kshana-bench taak D (het optimisme-verschil) op de testsplitsing, uit een echte run van engine v{ $version } (`kshana bench baseline`). Elk staafpaar is de oppervlakte onder de ROC-curve voor de in-distributiegevallen en voor de verschoven gevallen; het verschil daartussen is het optimisme-verschil, tegenover een tolerantie van { "0.05" }. fused-max-z: { "0.998" } en { "0.983" } (verschil { "0.015" }); sqm-imbalance: { "0.882" } en { "0.882" } (verschil { "0.001" }); agc-excess: { "0.848" } en { "0.819" } (verschil { "0.030" }); raim-parity: { "0.682" } en { "0.672" } (verschil { "0.010" }); energy-cn0-drop: { "0.595" } en { "0.565" } (verschil { "0.030" }). De labels zijn labels van een generatief model van een synthetisch corpus, nooit veldgegevens: MODELLED. Adviserend: berekend uit een model of gemeten aan de hand van vermelde referenties, geen goedkeuring, geen certificering en geen verklaring van conformiteit. Een score beschrijft een log of corpus, nooit een product.

seg-6ce7bd4525d6 = Taken

seg-09907c94f04d = Taak

seg-1c6199627b90 = Gegevens

seg-9cdfe78e3b22 = Primaire metriek

seg-5093217f24a1 = (a) detectie op ontvangerlogs

seg-809068c95ddf = één epoch van een JammerTest { "2024" }-log

seg-f87dda92fbd2 = opgehaald door <c1/> (GPL-3.0+, nooit meegeleverd)

seg-9493bfc5bd64 = (b) detectie op IQ

seg-8d012e25aa62 = één gescoord venster van een scène

seg-69f020ed20da = synthetisch scènerecept van { -brand }; TEXBAT alleen als referentie

seg-499ae444224e = AUC per alarmsoort

seg-73028caefeb0 = (c) voorspelling van holdover van de tijdsynchronisatie

seg-0d0b071690cf = (satelliet, herkomst)

seg-6cf42152f523 = IGS-klokken bij { "300" } s (vastgelegd uittreksel, vastgezette hash)

seg-74bd23dfebf5 = RMSE bij { "3600" } s

seg-3cc3545250e5 = (d) optimisme-verschil buiten de distributie

seg-ab343a29b019 = één synthetisch geval

seg-b25d781ff536 = <c1/>-corpus, binnen en buiten de distributie

seg-e32f49d34f7b = AUC eruit, en het verschil

seg-1ad563733f12 = Opdrachten

seg-c9d00ff2e1d0 = Een inzending is een bestand (<c1/>): <c2/> (één getal per geval-id; hoger betekent waarschijnlijker verstoord) voor de taken a, b en d, of <c3/> (de fasewijziging in ns bij elke horizon) voor taak c. Een resultaatbestand (<c4/>) noemt de specificatieversie, de splitsing, de SHA-256 van de referentie en van de voorspellingen, en de metrieken. Resultaten van verschillende hoofdversies van de specificatie komen nooit in één tabel.

seg-bdc715c52ab5 = Eerlijke beperkingen

seg-f26f0e79f2ed = De achtergehouden sets met echte gegevens (a en c) zijn openbaar, omdat iedereen de gegevens kan downloaden. Ze beschermen ertegen dat een splitsing wordt gekozen nadat de scores bekend zijn, niet tegen afstemmen op die mappen. De verzegelde achtergehouden set van taak (d) werkt met vastleggen en onthullen: de eigenaar legt alleen de hash vast in <c1/> en houdt de seed bij zich (er is nog niets verzegeld).

seg-81c3f961230b = De referentie van taak (a) bestaat uit de geplande aanvalsslots van de gebeurtenislogs met een resolutie van één minuut, dus een detectiekans is een ondergrens; de metrieken op gebeurtenisniveau (latentie, gemiste alarmen, valse alarmen) komen met de Jammertest-scorer van <c1/>.

seg-47df52b5c5e6 = De IQ-basislijn van taak (b) is overgenomen uit <c1/> en voor v1 niet opnieuw gedraaid.

seg-d54342791763 = Het corpus van taak (d) is een controle op scheidbaarheid en pijplijn; een AUC erop is een AUC over labels die uit een model zijn afgeleid.

seg-3d8bfdeead6c = <s1>Vorige</s1>Interferentie-observatorium: resultaten

seg-07f5b51844d1 = <s1>Volgende</s1>Een ontvanger tegen een scenario laten draaien
