# docs--kind-lunar-time-budget: translations (sv)

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-8f8871ac8a0f = Ämnessida: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Ämnessida: <a1>integrations.md</a1>

seg-11f512367036 = Källa: <c1/>

seg-f7cd4fcfc62d = <c1/> (scenariotyp)

seg-cac3a0bcbfc6 = MODELLED heltäckande tidsfelsbudget för Coordinated Lunar Time (LTC): de sju LTC-felkällorna sammanställs som tidsfelskurvor x_i(τ) över ett helt rutnät av medelvärdestider och summeras kvadratiskt till x_Σ(τ), tillsammans med KORSNINGS-τ mellan klocka och referenssystem där den växande klocktermen överträffar den konstanta realtidstermen för realiseringen av referenssystemet (under det är budgeten begränsad av referenssystemet, över det av klockan) — det ärliga svaret på artefakten med ett enda τ. τ-lutningarna är i sluten form och kan kontrolleras analytiskt (klocka τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, golv τ^{ "0" }, mätning τ^{ "{" }-1/2{ "}" }) och klockraderna återger de publicerade klockspecifikationerna för ett dygn (crate::clock_specs); MAGNITUDERNA för golven för RF-/optisk länk, realisering av referenssystemet, relativistisk rest och efemerid är modellerade budgetallokeringar (dokumenterade standardvärden, kan åsidosättas av anroparen), inte mätningar. Bidraget är det reproducerbara korsnings-τ, inte ett certifierat tal per term; inte certifierad för operativ tidshållning.

seg-8a5c9e451d4e = En körning av <c1/> sammanfattas som: lunar-time-budget | clock passive-h-maser | 7-term x_Σ(τ) över { "57" } τ-punkter ({ "1" }–{ "1e7" } s) | crossover τ { "8.689e4" } s (x { "1.001e-9" } s) | frame floor { "1.001e-9" } s | clock x({ "1" } d) { "0.995" } ns (MODELLED)

seg-7cdc521303eb = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-c050033b32c3 = Exemplet <c1/> anger bland annat:

seg-eebd3e40d0b9 = Resultatetikett (motorns egen): MODELLED heltäckande LTC-tidsfelsbudget. τ-lutningarna är i sluten form och kan kontrolleras analytiskt (klocka τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, golv τ^{ "0" }, mätning τ^{ "{" }-1/2{ "}" }) och klockraderna återger de publicerade klockspecifikationerna för ett dygn; golven för RF-/optisk länk, realisering av referenssystemet, relativistisk rest och efemerid

seg-56fe184f2a12 = Diagrammet som motorn skriver för scenarios/lunar-time-budget.toml, typ lunar-time-budget

seg-b03509dfcb1b = <b>MODELLED</b> En körning av lunar-time-budget ger en korsningsrad mellan klocka och referenssystem för varje klockklass mot en enda gemensam term för referenssystemet, så att klockan är den enda variabeln i jämförelsen; varje rad anger korsningen framräknad på två sätt -- bisekterad från den

seg-fd52e493b6c2 = <b>MODELLED</b> Det valfria blocket [time_lab] i scenariot lunar-time-budget modellerar en lunar referensstationsklocka (som standard klassen miniRAFS, eller valfri namngiven klass, eller ett enhetskort anpassat till angivna stabilitetspunkter) som styrs mot Coordinated Lunar Time och Tester: <a1>lunar_station_time_lab.rs</a1>.

seg-d8807d5308d4 = <b>MODELLED</b> En körning av lunar-time-budget ger en korsningsrad mellan klocka och referenssystem för varje klockklass mot en enda gemensam term för referenssystemet, så att klockan är den enda variabeln i jämförelsen. Oberoende referens (InternalConsistency): Två olika beräkningar i kodbasen av samma storhet, inte en och samma omskriven: bisektion på IEEE-1139-potenslagskurvan vet inget om brustyp, medan den slutna formen inverterar den dominerande typen algebraiskt, så en felklassad brustyp eller ett dåligt intervall syns som en inte obetydlig relativ skillnad. De fyra värdena återger också artikelns publicerade tabell inom en halv enhet i dess sista tryckta siffra -- men den tabellen var dess

seg-4c0d7da4f7f6 = <b>MODELLED</b> Scenariot lunar-time-budget publicerar sina vektorvärda utdata som en tabell i långt format (rutnätsindex, medelvärdestid, term) vid sidan av rapporten, så att de sju per. Oberoende referens (InternalConsistency): Endast intern konsistens: den publicerade totalen kontrolleras mot kvadratsumman av termerna i samma fil, och den utsända kurvan återger den publicerade p3_time_budget_curve.csv över alla { "57" } punkter. Båda kontrollerna delar denna motors egna termdefinitioner, så ingen av dem är oberoende. Klocktermen vilar på publicerade klockspecifikationer, men MAGNITUDERNA för golven för länk, referenssystem, relativistik och efemerid är dokumenterade

seg-8abdeb1a36e1 = MODELLED heltäckande LTC-tidsfelsbudget. τ-lutningarna är i sluten form och kan kontrolleras analytiskt (klocka τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, golv τ^{ "0" }, mätning τ^{ "{" }-1/2{ "}" }) och klockraderna återger de publicerade klockspecifikationerna för ett dygn; golven för RF-/optisk länk, realisering av referenssystemet, relativistisk rest och efemerid är modellerade budgetallokeringar (dokumenterade standardvärden, kan åsidosättas av anroparen), inte mätningar. Bidraget (resultat <c1/>)

seg-66a794432751 = MODELLED heltäckande tidsfelsbudget för Coordinated Lunar Time (LTC): de sju LTC-felkällorna sammanställs som tidsfelskurvor x_i(τ) över ett helt rutnät av medelvärdestider och summeras kvadratiskt till x_Σ(τ), tillsammans med KORSNINGS-τ mellan klocka och referenssystem där den växande klocktermen överträffar den konstanta realtidstermen för realiseringen av referenssystemet (under det är budgeten begränsad av referenssystemet, över det av klockan) — det ärliga svaret på artefakten med ett enda τ (typkatalog (<c1/>))

seg-ca1763d4a416 = Ärlighet: MODELLED. Tau-lutningarna är i sluten form och kan kontrolleras analytiskt (klocka tau^{ "{" }+1/2{ "}" } eller tau^{ "{" }+{ "1" }{ "}" }, golv tau^{ "0" }, mätning tau^{ "{" }-1/2{ "}" }) och klockraderna återger de publicerade klockspecifikationerna för ett dygn; men MAGNITUDERNA för golven för RF-/optisk länk, realisering av referenssystemet, relativistisk rest och efemerid är modellerade budgetallokeringar (dokumenterade standardvärden, kan åsidosättas av anroparen), inte mätningar. Bidraget är (kommentar i scenariofilen, rad { "13" } till { "18" })

seg-8f884949bdf1 = Tabellen över lunara korsningar per klockklass är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-5eaed32490ca = Reproducerbarheten hos den lunara tidsfelsbudgeten är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Föregående</s1>lunar-station-coverage

seg-a0992d394960 = <s1>Nästa</s1>lunar-time-offset
