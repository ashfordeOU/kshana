# docs--compliance-dhs-rpcf: translations (sv)

seg-d01db1c2710a = Referens

seg-fdbb9db68f1d = ingen

seg-dbec6a166e56 = Källa: <c1/>

seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: vad Kshana ger belägg för

seg-cef4181edf29 = Ramverket beskriver resiliensnivåer från { "0" } till { "4" } uppbyggda av åtta numrerade krav, och ett utvärderingssätt som kombinerar statisk analys med dynamisk analys där testvektorer ersätter hot. Det har inget eget system för kravidentifierare, så hänvisningarna nedan är dess nivå- och kravnummer samt dess avsnittsnummer. Det är resultatbaserat och katalogiserar inte hot.

seg-ff0e00610721 = Varje rad anger vilka av Kshanas utdata som <b>ger belägg för</b> kravet och vad som återstår. Ingenting här säger att ett ramverk är uppfyllt eller att någon produkt har bedömts eller godkänts av någon. Kör <c1/> på dina egna resultatfiler för att se vilka rader dina körningar faktiskt ger belägg för; se <a1>README.md</a1>.

seg-30c8cabb6e90 = Källdokument

seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: Version { "2.0" }, { "26" } april { "2022" } (DHS Science and Technology Directorate, tillsammans med CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Läst 2026-10-09: dokumentet lästes i sin helhet; publikationens målsida hämtades inte.

seg-955191e0baab = Kartläggning

seg-6ba8f74126ee = Vad det kräver (omskrivet)

seg-0438151025da = Kshana-utdata som ger belägg för det

seg-3f265e18f56c = Lucka

seg-4263435e702a = Avsnitt { "5.2" } (Prevent, Respond, Recover)

seg-e7b721f6e216 = Resiliens beskrivs som tre funktioner: att förhindra skada, att reagera (upptäcka, rapportera, begränsa, avgränsa) och att återhämta sig. Detektering är sannolikhetsbaserad, så både falsklarm och missade detekteringar spelar roll.

seg-3447d3b53fe8 = Bedömning av förtroende i mottagarloggar; Detektering av spoofing och meaconing; Holdover och fortsatt färd utan GNSS

seg-ab055a50e16e = Förebyggande är en egenskap hos produktens utformning som inga simuleringsutdata visar. Detekteringsstatistik från en syntetisk körning eller en körning i en enda session är inte en uppmätt falsklarms- eller missfrekvens för en produkt i drift.

seg-501badd6a436 = Nivå { "1" }, krav { "1" }

seg-e8cfbe121084 = Kontrollera att lagrade data som kommer från externa källor överensstämmer med formaten och värdeområdena i de relevanta standarderna.

seg-7d7196aefa05 = En egenskap hos programvarusäkring och indatavalidering i den produkt som testas. Kshana granskar inte en produkts hantering av indata.

seg-6085030de980 = Nivå { "1" }, krav { "2" }

seg-e8cd6fb732ad = Tillåt fullständig manuell återhämtning genom att rensa eller återställa minnet, så att systemet återgår till definierad prestanda när hotet är över.

seg-8d216d42c776 = Bedömning av förtroende i mottagarloggar

seg-e3ca721d9d2e = En mottagarlogg visar när en positionsbestämning blev ej betrodd och när den återhämtade sig; den visar inte att en manuell återställning rensar varje lagrat tillstånd.

seg-2c78c15cea96 = Nivå { "1" }, krav { "3" }

seg-ab9458f8b8fc = Ladda om eller uppdatera firmware på ett säkert sätt.

seg-3a50eceb47f5 = Säkerheten vid firmwareuppdatering ligger utanför vad någon Kshana-utdata observerar.

seg-752a194674f6 = Nivå { "2" }, krav { "4" }

seg-a5f263a083c7 = Identifiera komprometterade PNT-källor och hindra dem från att förvanska lösningen.

seg-4e7034acccc0 = Detektering av spoofing och meaconing; Bedömning av förtroende i mottagarloggar; Integritetsövervakning och skyddsnivåer

seg-d5fdef2a78f2 = Kshana poängsätter detektorer och övervakare som den modellerar eller kör över en logg; om en produkts egen källuteslutning fungerar krävs produktens interna tillstånd, inte bara dess logg.

seg-e3ea1208fac9 = Nivå { "2" }, krav { "5" }

seg-c0219254fe8e = Återställ källor och system automatiskt utan att avbryta utdata; en lösning tillhandahålls fortfarande under hotet, med möjligen obegränsad försämring.

seg-3dd48cb65cb4 = Holdover och fortsatt färd utan GNSS; Bedömning av förtroende i mottagarloggar

seg-0c36c4a3eb4e = Holdover-körningar begränsar modellerad drift för en angiven klock- eller tröghetsmodell, inte produktens eget återhämtningsbeteende.

seg-befbf4b94876 = Nivå { "3" }, krav { "6" }

seg-45410d1675be = Skadade data från en källa får inte förorena en annan källa.

seg-ff808ce8ec48 = Alternativa och diversifierade PNT-källor

seg-ccf628643110 = Kshana kör källor sida vid sida; källisolering inuti en produkt kräver designgranskning eller felinjektion i produkten.

seg-a1d5a3125697 = Nivå { "3" }, krav { "7" }

seg-db149ea618dd = Korskontrollera lösningarna från alla källor och håll försämringen under ett hot begränsad.

seg-4afa05ef42fa = Integritetsövervakning och skyddsnivåer; Holdover och fortsatt färd utan GNSS; Alternativa och diversifierade PNT-källor

seg-8b1f938c0175 = Begränsad försämring visas för de modellerade sensorerna; produktens egen korskontroll observeras inte.

seg-772244881e5b = Nivå { "4" }, krav { "8" }

seg-aff5161e6363 = Använd källor med olika teknik mot hot med gemensam orsak, utan försämring under hotet.

seg-587889f9881c = Alternativa och diversifierade PNT-källor; Effekter av jamming på länkbudgeten

seg-65b96caf8d6b = Ett resonemang om gemensam orsak kräver den verkliga produktens källuppsättning och ett hot som omfattar dem; ett scenario anger ett sådant, det bevisar inte att produkten saknar en delad svaghet.

seg-3c4cc0793454 = Avsnitt { "5.5" } (gemensam orsak)

seg-a87c9808dd99 = Diversifierade mekanismer får inte dela en svaghet: till exempel slår en jammer som täcker två band ut bandmångfalden.

seg-c10ba3bb01be = Effekter av jamming på länkbudgeten; Resiliensbedömning över hotuppsättningar; Alternativa och diversifierade PNT-källor

seg-843fe2fc9e33 = Poängsättningen använder en syntetisk hotuppsättning, angiven som sådan; det är inte fältdata.

seg-3158e7efd1a5 = Avsnitt { "8.1" } till { "8.3" } (utvärdering)

seg-3942d9cdc64b = Utvärderingen kombinerar statisk analys med dynamisk analys, där testvektorer ersätter hot; testklasserna är källbortfall, störning och interna fel. Simulatorer nämns som testmetod.

seg-9d5c297c1ab9 = Bedömning av förtroende i mottagarloggar; Effekter av jamming på länkbudgeten; Detektering av spoofing och meaconing

seg-bb02568e8f8f = Exporterad rörelse och exporterade händelser kan styra en laboratoriesimulator (docs/TEST-BENCH.md). Kshana skriver ingen signal, så simulatorn och dess behöriga operatör levererar hotet.

seg-b81625e9e071 = Avsnitt { "8.6" } (delar i en testplan)

seg-27d645a79672 = En testplan anger nivå, krav, indata, referenser, nödvändig dataåtkomst, procedur med PASS- eller FAIL-kriterier, resultat och anteckningar.

seg-1f2898855ccc = Reproducerbart ursprung för körningar; Bedömning av förtroende i mottagarloggar

seg-d8b08da48cb2 = PASS- eller FAIL-kriterierna väljs av bedömaren; Kshana registrerar de indata, trösklar och hashvärden som den körde med.

seg-ccfdf53a1e54 = <s1>Föregående</s1>Compliance-kartläggning

seg-260ba950eb89 = <s1>Nästa</s1>IMO-vägledning för fartyg
