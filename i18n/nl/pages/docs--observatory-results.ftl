# docs--observatory-results: translations (nl)

seg-69304b8b186b = Bron: <c1/>

seg-df5b53307f50 = Resultaten van het observatorium: Oostzee-back-catalogus van 30 dagen en gevoeligheidsstudie

seg-072bdea11014 = Versie <c1/> over <c2/> (parameters vooraf vastgelegd in de basismethode, ongewijzigd). MODELLED: er is geen externe onafhankelijke referentie, geen grondwaarheid en geen toewijzing van een oorzaak. Een verslechterde cel betekent dat een groot aandeel van de daar bemonsterde vliegtuigen die dag een lage navigatienauwkeurigheid meldde; het zegt niet waarom. Een cel die niet is waargenomen, of ontbreekt, is niet beoordeeld, wat niet hetzelfde is als schoon.

seg-0d1eeedcab3a = Wat is uitgevoerd

seg-df6ddf801a25 = <b>Bron:</b> adsb.lol readsb-historie (ODbL { "1.0" }), GitHub-release <c1/> van <c2/>, opgehaald door <c3/> één deel tegelijk (ongeveer { "3.4" } GB per dag, { "2" } delen). De uitgever vermeldt geen checksums, dus de SHA-256 van elk deel is vastgelegd in <c4/>.

seg-9fa2d2319ed3 = <b>Regio en dagen:</b> de rechthoek { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (zuid, west, noord, oost: de Oostzee en haar kusten), { "30" } UTC-dagen van 2026-09-15 tot 2026-10-14, cellen van { "0.5" } graad, door <c1/> (één dag per keer, ruwe bestanden na elke dag verwijderd).

seg-8b65d148bbd8 = <b>Vrijgaveregels:</b> de nieuwste dag (2026-10-14) was bij het produceren meer dan { "24" } uur na zijn einde; de opdracht weigert anders. Regionale runs berekenen de basislijn voor de apparatuur en de achtergrond van de dag uitsluitend uit de meldingen van de rechthoek (<c1/>).

seg-64581554e84a = <b>Bestanden:</b> de { "120" } productbestanden (GeoJSON, PNG, incident-JSON, manifest per dag) staan <b>niet in git</b>. De hash van elk bestand staat in <c1/>, en een dag kan uit zijn archief worden herbouwd en vergeleken.

seg-c89b88dc3d3b = Voorbeeld van wat een dag leest: op 2026-09-15 bevatte het archief { "110,619,797" } positierijen in { "79,826" } tracebestanden; { "103.0" } miljoen lagen buiten de rechthoek, { "5.6" } miljoen waren geen ADS-B, { "1.2" } miljoen waren op de grond of onder { "5,000" } ft, { "0.6" } miljoen hadden geen nauwkeurigheidsveld, en { "212,426" } werden geaggregeerd (invoertellers van <c1/>).

seg-cc590aa74075 = Drie dagen (2026-09-18, 2026-09-26, 2026-10-03) zijn opnieuw uit het archief opgehaald en een tweede keer uitgevoerd: de GeoJSON, de PNG en het incidentbestand zijn <b>byte-identiek</b> aan de eerste run (SHA-256 gelijk), dus het product is deterministisch ook al is de hash-salt van de identificator willekeurig per run.

seg-3532be519183 = Samenvatting van de back-catalogus

seg-56aae646318e = UTC-dag

seg-42784010b115 = gepubliceerde cellen

seg-2672b7f55371 = verslechterd

seg-378ee89e4bd3 = niet verslechterd

seg-14783d89f2fe = niet waargenomen (gepubliceerd)

seg-711d143678ae = incidenten

seg-0f1ffe21d381 = { "30" } dagen: in totaal { "96" } verslechterde cellen, { "28" } van de { "30" } dagen met er minstens één, { "70" } incidenten (clusters van aaneengrenzende verslechterde cellen), geen dag met een dagbreed effect. Het mediane celaandeel van getroffen vliegtuigen (de achtergrond van de dag) is { "0" } op { "29" } dagen en { "0.006" } op één, dus de achtergrondwaarborg (een cel moet de achtergrond met { "0.15" } overschrijden) heeft in deze regio nooit een oordeel gewijzigd. Het aantal verslechterde cellen per dag loopt van { "0" } tot { "8" } (gemiddeld { "3.2" }). Ongeveer een derde van de per dag gepubliceerde cellen is <c1/> (te weinig vliegtuigen bemonsterd): dekking is de grens van dit product, niet de hemel.

seg-606aed861c95 = Wat dit niet zegt: de dagen met meer verslechterde cellen zijn niet "slechter" in enige fysieke zin, een aanhoudend getroffen gebied zou worden onderschat (vliegtuigen die de hele dag alleen daarbinnen vliegen hebben daarbuiten geen basislijn en worden niet meegeteld), en niets hier zegt wie of wat de lage nauwkeurigheid veroorzaakte.

seg-ef37626a4c47 = Gevoeligheidsstudie (drie dagen)

seg-aacbb761ee19 = <c1/> speelt de vastgelegde meldingen van één dag opnieuw af onder wijzigingen van de vastgelegde parameters, één per keer (telkens twee waarden, plus een raster van { "1.0" } graad). Dagen: 2026-09-18 (de meeste verslechterde cellen, { "8" }), 2026-09-26 ({ "1" } verslechterde cel) en 2026-10-03 ({ "0" }). Volledige rapporten: <c2/> (telkens { "23" } varianten; { "2.2" }, { "1.7" } en { "1.7" } miljoen rijen opnieuw afgespeeld). Verslechterde cellen onder elke variant (vastgelegde waarde tussen haakjes; het vastgelegde resultaat is { "8" }, { "1" } en { "0" } verslechterde cellen):

seg-dfced7e594d2 = parameter (vastgelegd)

seg-2ac3e771679d = waarde

seg-0953dbfd76db = raster { "0.5" } graad

seg-bf5746d1a110 = { "2" } (grovere cellen)

seg-e4016df2fcd3 = Het lezen ervan, zonder een winnaar te kiezen:

seg-81cfcbf0de89 = De oordelen zijn gevoelig voor de drempels van de nauwkeurigheidscodes en de steekproefregels, en de kleine aantallen verschuiven sterk.

seg-097ed1aa1504 = <c1/>, <c2/> en <c3/> wijzigen elk het aantal verslechterde cellen met een factor twee of meer op elke dag; het versoepelen van <c4/> naar { "6" } maakt van { "1" } verslechterde cel { "12" } op 09-26 (Jaccard met de vastgelegde verzameling { "0.08" }). Op 09-18 houdt het verhogen van <c5/> naar { "0.4" } { "1" } van de { "8" } over (Jaccard { "0.125" }). Een celoordeel nabij de drempels is evenzeer een uitspraak over de drempels als over de data.

seg-0d0c96099d30 = <b><c1/> verplaatst vooral cellen tussen niet verslechterd en niet waargenomen</b>: op 09-18 laat het het aantal verslechterde cellen op { "8" } terwijl { "21" } tot { "56" } cellen van toestand veranderen.

seg-04cc05318a5d = <b>Drie waarborgen zijn hier inactief</b>: <c1/>, <c2/> en <c3/> veranderen niets op enige van de drie dagen (het achtergrondaandeel is { "0" }), dus deze regio en periode zeggen niets over hoe goed ze werken. Ze zouden ertoe doen waar een regionaal effect de achtergrond verhoogt.

seg-7ba403b84fbd = <b>Een grover raster ({ "1.0" } graad) verandert het beeld</b> ({ "2" }, { "3" } en { "1" } verslechterde cellen; de gepubliceerde cellen dalen tot ongeveer een derde, { "226" } tegenover { "694" } op 09-18, omdat elke cel viermaal zo groot is): celgrootte is een methodekeuze, en het observatorium legt die vast op { "0.5" } graad.

seg-4db2f5313410 = Een dag zonder vastgelegde verslechterde cel (10-03) heeft verslechterde cellen onder { "9" } van de { "22" } niet-rastervarianten (tot { "8" } met <c1/> { "6" }): "geen verslechterde cel" is ook een van drempels afhankelijke uitspraak.

seg-a818be844f3a = Geen enkele variant is een getoetst alternatief, en de vastgelegde regel blijft door deze studie ongewijzigd. De studie zegt niet welke parameterwaarden juist zijn.

seg-98c799bfbc25 = <s1>Vorige</s1>Interferentieobservatorium: methode

seg-5d0c003e73dc = <s1>Volgende</s1>kshana-bench
