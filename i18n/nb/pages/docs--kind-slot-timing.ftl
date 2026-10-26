# docs--kind-slot-timing: translations (nb)

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Scenariotype i motoren v{ $version }, familie <a1>Klokker, tidssynkronisering og holdover</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-849c08d3ce70 = Familieside: <a1>Klokker, tidssynkronisering og holdover</a1>

seg-09644e40e2d8 = Kilde: <c1/>

seg-ec92d03eaa6c = <c1/> (scenariotype)

seg-1b61962464c5 = Slot-tidssynkronisering: sekunder til en frittløpende klokke forlater guardintervallet til en tidsindeksert rutings- eller oppgaveslot (den største absolutte tidsfeilen slotten tåler), bidraget fra hvert ledd i det øyeblikket med det dominerende leddet navngitt (usikkerhet i posisjonsbestemmelsen, hvit fasestøy, hvit, flicker, random-walk og random-run frekvensstøy, restfrekvensavvik, temperatur, aldring), tiden som er igjen siden siste posisjonsbestemmelse, og det største intervallet mellom posisjonsbestemmelser som holder klokken innenfor, fratrukket latensen for posisjonsbestemmelsen. Oscillatoren er en KLASSESTANDARD (csac, uso, dsac, tcxo, ocxo eller rafs: ett sitert Allan-avvik for ett sekund og et antatt rødstøygulv), en FORHÅNDSINNSTILLING FRA DATABLAD for tidssynkronisering i telekom eller et innebygd DATABLAD (maksimalverdier for Allan-avvik tilpasset som en omhylling, pluss aldring og en temperaturkoeffisient), eller en innebygd MÅLT FASEREGISTRERING (dens overlappende Allan-avvik tilpasset med vektede minste kvadrater i basisen for hvit fase og frekvensmodulasjon etter IEEE Std { "1139" }, slik at rødstøygulvet er målt og ikke antatt). Et brudd utover den lengste midlingstiden databladet eller registreringen støtter, merkes som ekstrapolert. En valgfri seksjon for spoofing legger til beskyttelsesnivået for tidssynkronisering for en mottaker i bane: banehastighet og omløpstid, hvor lenge en enkelt bakkespoofer kan nå satellitten per passering, gulvet for den klokkestøttede monitoren og CUSUM-latensen for deteksjon, den betingede grensen, trekket en spoofer ved en oppgitt maksimal rampehastighet samler opp før satellitten forlater rekkevidden eller en uavhengig kontroll kjøres, og om hver kontroll mot bakkekontakt eller krysslenke er uavhengig av den spooferen. VALIDATED: inversjonen av holdover fra en tilpasset registrering, holdt tilbake på en virkelig cesiumklokke målt mot en hydrogenmaser (tests/slot_timing_cs5071a_holdout.rs, datastyrt); på en målt krystalloscillator er den tilbakeholdte prediksjonen konservativ, men ikke innenfor terskelen, så krystalltilfellet er MODELLED. MODELLED: klasse- og databladkilder, de deterministiske leddene og vurderingen av spoofing.

seg-1284cfee51f0 = En kjøring av <c1/> oppsummeres slik: slot-timing (datasheet source): guard { "100.0" } ns at k={ "3" } breaks { "650.8" } s after a fix ({ "50.8" } s left); fix at least every { "645.8" } s ({ "133.80" } per day); dominant term: random-walk frequency noise

seg-97e12e763be3 = Obligatoriske felt: <c1/>, <c2/>

seg-6b75ef50497a = Valgfrie felt: <c1/>

seg-8c4662736bc0 = Eksempelet <c1/> angir blant annet:

seg-8aee75a55007 = ocxo

seg-df4ca2d859ff = 1/s^{ "3" }

seg-1a282dc35742 = datasheet

seg-c13396b4e57b = Resultatetikett (motorens): MODELLED — tiden til en frittløpende klokke forlater guardintervallet til en rutingslot, og kadensen for posisjonsbestemmelser som holder den innenfor, fra en stasjonær klokkemodell med potenslov. En databladkilde er en omhylling av maksimalverdiene, ikke en måling av noen enhet; en klassekilde hviler på et antatt rødstøygulv.

seg-97a91c8a60cd = Diagrammet motoren skriver for scenarios/slot-timing-ocxo-leo.toml, type slot-timing

seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-e84e4b49fee0 = <b>VALIDATED</b> Banen for målt registrering i typen <c1/>: det overlappende Allan-avviket til en faseregistrering tilpasset med edf-vektede ikke-negative minste kvadrater i basisen for hvit fase og frekvensmodulasjon etter IEEE Std { "1139" } (slot_timing::fit_weighted), Tester: <a1>slot_timing_cs5071a_holdout.rs</a1>.

seg-26ccdbd07a46 = <b>MODELLED</b> Typen <c1/>: den predikerte feilen E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertert for bruddet, gjenværende tid, resynkroniseringsintervallet fratrukket latensen for posisjonsbestemmelsen og antall posisjonsbestemmelser per dag, hvert ledd spesifisert med th Tester: <a1>slot_timing_igs_holdout.rs</a1>.

seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, tilgjengelig som seksjonen for spoofing i typen <c1/>: banehastighet og omløpstid for sirkulær bane, den lengste tiden en bakkespoofer kan nå satellitten per passering, gulvet for den klokkestøttede monitoren og CUSUM-latensen for deteksjon l

seg-8dbc28c3398f = <b>MODELLED</b> Typen <c1/>: den predikerte feilen E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertert for bruddet, gjenværende tid, resynkroniserin. Uavhengig referanse (InternalConsistency): lukkede former for hvert ledd alene og den uavhengige rotfinningen holdover::holdover_seconds; databladtallene er de navngitte dokumentene (docs/SLOT-TIMING.md). En klassestandard hviler på et antatt rødstøygulv og en databladkilde er en omhylling av maksimalverdier, så ingen av dem er en måling av noen enhet

seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, tilgjengelig som seksjonen for spoofing i typen <c1/>: banehastighet og omløpstid for sirkulær bane, den lengste tiden en bakkespoofer kan nå satellitten per passering, gulvet for den klokkestøttede monitoren og CUSUM-latensen for deteksjon. Uavhengig referanse (InternalConsistency): reduksjon til det eksisterende beskyttelsesnivået for tidssynkronisering og de lukkede formene for synlighet med sirkulær bane og kuleformet jord. Betinget av deteksjon, én terrestrisk spoofer med oppgitt rampehastighet, en passering rett over på en jord uten rotasjon; ikke validert på en spoofet mottaker i bane

seg-29af1ec87672 = frekvenssprang, strålingseffekter og relativistiske frekvensavvik (resultat <c1/>)

seg-89f90cdab1db = en termisk modell: temperaturutslaget anvendes som et sprang ved posisjonsbestemmelsen (resultat <c1/>)

seg-cb3887ccae22 = selve synkroniseringsprotokollen: en posisjonsbestemmelse nullstiller feilen til fix_sigma_ns (resultat <c1/>)

seg-b96fceda31df = hvilken svingningsmetrikk en rutingslot bør godtas mot; se docs/SLOT-TIMING.md (resultat <c1/>)

seg-b101457241f2 = MODELLED — tiden til en frittløpende klokke forlater guardintervallet til en rutingslot, og kadensen for posisjonsbestemmelser som holder den innenfor, fra en stasjonær klokkemodell med potenslov. En databladkilde er en omhylling av maksimalverdiene, ikke en måling av noen enhet; en klassekilde hviler på et antatt rødstøygulv. (resultat <c1/>)

seg-8e3d910f22ed = Oscillatoren er en KLASSESTANDARD (csac, uso, dsac, tcxo, ocxo eller rafs: ett sitert Allan-avvik for ett sekund og et antatt rødstøygulv), en FORHÅNDSINNSTILLING FRA DATABLAD for tidssynkronisering i telekom eller et innebygd DATABLAD (maksimalverdier for Allan-avvik tilpasset som en omhylling, pluss aldring og en temperaturkoeffisient), eller en innebygd MÅLT FASEREGISTRERING (dens overlappende Allan-avvik tilpasset med vektede minste kvadrater i basisen for hvit fase og IEEE S (typekatalog (<c1/>))

seg-f6a831727890 = VALIDATED: inversjonen av holdover fra en tilpasset registrering, holdt tilbake på en virkelig cesiumklokke målt mot en hydrogenmaser (tests/slot_timing_cs5071a_holdout.rs, datastyrt); på en målt krystalloscillator er den tilbakeholdte prediksjonen konservativ, men ikke innenfor terskelen, så krystalltilfellet er MODELLED. (typekatalog (<c1/>))

seg-1cf85cbedffa = MODELLED: klasse- og databladkilder, de deterministiske leddene og vurderingen av spoofing. (typekatalog (<c1/>))

seg-1a72034c1343 = Temaside: <a1>DECEIVED-TIME.md</a1>

seg-10e6cd8ce00c = <s1>Forrige</s1>reentry

seg-b8ec9e10ee84 = <s1>Neste</s1>solar-system
