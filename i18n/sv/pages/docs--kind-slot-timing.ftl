# docs--kind-slot-timing: translations (sv)

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Scenariotyp i motor v{ $version }, familj <a1>Klockor, tidssynkronisering och holdover</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-849c08d3ce70 = Familjesida: <a1>Klockor, tidssynkronisering och holdover</a1>

seg-09644e40e2d8 = Källa: <c1/>

seg-ec92d03eaa6c = <c1/> (scenariotyp)

seg-1b61962464c5 = Slottidssynkronisering: sekunder tills en fritt gående klocka lämnar skyddsintervallet för en tidsindexerad routing- eller uppgiftsslot (det största absoluta tidsfel som slotten tål), bidraget från varje term vid den tidpunkten med den dominerande namngiven (osäkerhet i positionsbestämningen, vitt fasbrus, vitt, flicker-, random-walk- och random-run-frekvensbrus, kvarstående frekvensoffset, temperatur, åldring), tiden kvar sedan den senaste positionsbestämningen och det största intervall mellan positionsbestämningar som håller klockan inom, netto efter latensen för positionsbestämningen. Oscillatorn är ett KLASSstandardvärde (csac, uso, dsac, tcxo, ocxo eller rafs: en citerad Allan-avvikelse för en sekund och ett antaget golv av rött brus), en DATABLADSFÖRINSTÄLLNING för telekomtidssynkronisering eller ett inline-DATABLAD (maxvärden för Allan-avvikelse anpassade som ett envelopp, plus åldring och en temperaturkoefficient), eller en inline MEASURED FASREGISTRERING (dess överlappande Allan-avvikelse anpassad med viktad minsta kvadrat-metod i basen för vitt fasbrus och frekvensmodulation enligt IEEE Std { "1139" }, så att golvet av rött brus är uppmätt i stället för antaget). Ett brott bortom den längsta medelvärdestid som databladet eller registreringen stöder markeras som extrapolerat. Ett valfritt avsnitt spoofing lägger till skyddsnivån för tidssynkronisering för en mottagare i omloppsbana: banhastighet och omloppstid, hur länge en enda markspoofer kan nå satelliten per passage, golvet för den klockstödda övervakaren och CUSUM-detektionslatensen, den villkorliga gränsen, det drag som en spoofer vid en angiven maximal rampfrekvens ackumulerar innan satelliten lämnar dess räckvidd eller en oberoende kontroll körs, och huruvida varje markkontakts- eller korslänkskontroll är oberoende av den spoofern. VALIDATED: holdover-inversionen från en anpassad registrering, undanhållen på en verklig cesiumklocka uppmätt mot en vätemaser (tests/slot_timing_cs5071a_holdout.rs, datastyrd); på en uppmätt kristalloscillator är den undanhållna prediktionen konservativ men ligger inte inom tröskeln, så kristallfallet är MODELLED. MODELLED: klass- och databladskällor, de deterministiska termerna och spoofing-bedömningen.

seg-1284cfee51f0 = En körning av <c1/> sammanfattas som: slot-timing (datasheet source): guard { "100.0" } ns at k={ "3" } breaks { "650.8" } s after a fix ({ "50.8" } s left); fix at least every { "645.8" } s ({ "133.80" } per day); dominant term: random-walk frequency noise

seg-97e12e763be3 = Obligatoriska fält: <c1/>, <c2/>

seg-6b75ef50497a = Valfria fält: <c1/>

seg-8c4662736bc0 = Exemplet <c1/> anger bland annat:

seg-8aee75a55007 = ocxo

seg-df4ca2d859ff = 1/s^{ "3" }

seg-1a282dc35742 = datasheet

seg-c13396b4e57b = Resultatetikett (motorns egen): MODELLED — tid tills en fritt gående klocka lämnar skyddsintervallet för en routingslot, och den takt för positionsbestämningar som håller den inom, från en stationär potenslagsmodell för klockan. En databladskälla är ett envelopp av dess maxvärden, inte en mätning av någon enhet; en klasskälla vilar på ett antaget golv av rött brus.

seg-97a91c8a60cd = Diagrammet som motorn skriver för scenarios/slot-timing-ocxo-leo.toml, typ slot-timing

seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-e84e4b49fee0 = <b>VALIDATED</b> Vägen med uppmätt registrering för typen <c1/>: den överlappande Allan-avvikelsen för en fasregistrering anpassad med edf-viktad icke-negativ minsta kvadrat-metod i basen för vitt fasbrus och frekvensmodulation enligt IEEE Std { "1139" } (slot_timing::fit_weighted), Tester: <a1>slot_timing_cs5071a_holdout.rs</a1>.

seg-26ccdbd07a46 = <b>MODELLED</b> Typen <c1/>: det predicerade felet E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inverterat för brottet, tiden kvar, resynkroniseringsintervallet netto efter latensen för positionsbestämningen och positionsbestämningar per dygn, varje term specificerad med Tester: <a1>slot_timing_igs_holdout.rs</a1>.

seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, nåbar som avsnittet spoofing i typen <c1/>: cirkulär banhastighet och omloppstid, den längsta tid en markspoofer kan nå satelliten per passage, golvet för den klockstödda övervakaren och CUSUM-detektions-l

seg-8dbc28c3398f = <b>MODELLED</b> Typen <c1/>: det predicerade felet E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inverterat för brottet, tiden kvar, resynkroniseringen. Oberoende referens (InternalConsistency): Slutna former för varje term för sig och den oberoende rotfinnaren holdover::holdover_seconds; databladssiffrorna är de namngivna dokumenten (docs/SLOT-TIMING.md). Ett klassstandardvärde vilar på ett antaget golv av rött brus och en databladskälla är ett envelopp av maxvärden, så ingen av dem är en mätning av någon enhet

seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, nåbar som avsnittet spoofing i typen <c1/>: cirkulär banhastighet och omloppstid, den längsta tid en markspoofer kan nå satelliten per passage, golvet för den klockstödda övervakaren och CUSUM-detektions-l. Oberoende referens (InternalConsistency): Reduktion till den befintliga skyddsnivån för tidssynkronisering och de slutna formerna för sikt i cirkulär bana och sfärisk jord. Villkorad av detektion, en jordbunden spoofer vid en angiven rampfrekvens, en passage rakt ovanför på en icke-roterande jord; inte validerad på en spoofad mottagare i omloppsbana

seg-29af1ec87672 = frekvenshopp, strålningseffekter och relativistiska frekvensoffsets (resultat <c1/>)

seg-89f90cdab1db = en termisk modell: temperaturavvikelsen tillämpas som ett steg vid positionsbestämningen (resultat <c1/>)

seg-cb3887ccae22 = själva synkroniseringsprotokollet: en positionsbestämning återställer felet till fix_sigma_ns (resultat <c1/>)

seg-b96fceda31df = mot vilket vandringsmått en routingslot bör godtas; se docs/SLOT-TIMING.md (resultat <c1/>)

seg-b101457241f2 = MODELLED — tid tills en fritt gående klocka lämnar skyddsintervallet för en routingslot, och den takt för positionsbestämningar som håller den inom, från en stationär potenslagsmodell för klockan. En databladskälla är ett envelopp av dess maxvärden, inte en mätning av någon enhet; en klasskälla vilar på ett antaget golv av rött brus. (resultat <c1/>)

seg-8e3d910f22ed = Oscillatorn är ett KLASSstandardvärde (csac, uso, dsac, tcxo, ocxo eller rafs: en citerad Allan-avvikelse för en sekund och ett antaget golv av rött brus), en DATABLADSFÖRINSTÄLLNING för telekomtidssynkronisering eller ett inline-DATABLAD (maxvärden för Allan-avvikelse anpassade som ett envelopp, plus åldring och en temperaturkoefficient), eller en inline MEASURED FASREGISTRERING (dess överlappande Allan-avvikelse anpassad med viktad minsta kvadrat-metod i basen för vitt fasbrus och IEEE S (typkatalog (<c1/>))

seg-f6a831727890 = VALIDATED: holdover-inversionen från en anpassad registrering, undanhållen på en verklig cesiumklocka uppmätt mot en vätemaser (tests/slot_timing_cs5071a_holdout.rs, datastyrd); på en uppmätt kristalloscillator är den undanhållna prediktionen konservativ men ligger inte inom tröskeln, så kristallfallet är MODELLED. (typkatalog (<c1/>))

seg-1cf85cbedffa = MODELLED: klass- och databladskällor, de deterministiska termerna och spoofing-bedömningen. (typkatalog (<c1/>))

seg-1a72034c1343 = Ämnessida: <a1>DECEIVED-TIME.md</a1>

seg-10e6cd8ce00c = <s1>Föregående</s1>reentry

seg-b8ec9e10ee84 = <s1>Nästa</s1>solar-system
