# docs--kind-slot-timing: translations (da)

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-09644e40e2d8 = Kilde: <c1/>

seg-ec92d03eaa6c = <c1/> (scenarietype)

seg-1b61962464c5 = Slottidssynkronisering: sekunder, indtil et frit løbende ur forlader beskyttelsesintervallet for en tidsindekseret routing- eller opgaveslot (den største absolutte tidsfejl, slotten tåler), bidraget fra hvert led på det tidspunkt med det dominerende led nævnt (usikkerhed i tidsfixet, hvid fasestøj, hvid, flicker, random walk og random run i frekvensstøj, resterende frekvensforskydning, temperatur, aldring), den tid, der er tilbage siden det sidste tidsfix, og det største interval mellem tidsfix, der holder uret inden for, netto af latens for tidsfixet. Oscillatoren er en KLASSESTANDARD (csac, uso, dsac, tcxo, ocxo eller rafs: én citeret Allan-deviation ved ét sekund og et antaget gulv med rød støj), en FORUDINDSTILLING FRA ET DATABLAD for telekommunikationstidssynkronisering eller et indlejret DATABLAD (maksima for Allan-deviation tilpasset som en envelope, plus aldring og en temperaturkoefficient) eller en indlejret MÅLT FASEREGISTRERING (dens overlappende Allan-deviation tilpasset ved vægtede mindste kvadrater i basen af hvid fase og IEEE Std { "1139" }-frekvensmodulation, så gulvet med rød støj er målt og ikke antaget). Et brud ud over den længste middelværdiperiode, som databladet eller registreringen understøtter, markeres som ekstrapoleret. Et valgfrit afsnit om spoofing tilføjer beskyttelsesniveauet for tidssynkronisering for en modtager i kredsløb: banehastighed og omløbstid, hvor længe en enkelt spoofer på jorden kan nå satellitten pr. overflyv, gulvet for den urstøttede monitor og CUSUM-detektionslatens, den betingede grænse, det træk, en spoofer ved en angivet maksimal rampehastighed samler, før satellitten forlader dens rækkevidde, eller en uafhængig kontrol kører, og om hver kontrol ved jordkontakt eller krydsforbindelse er uafhængig af den spoofer. VALIDATED: inversionen af holdover ud fra en tilpasset registrering, holdt ude (held out) på et reelt cæsiumur målt mod en brintmaser (tests/slot_timing_cs5071a_holdout.rs, datastyret); på en målt krystaloscillator er den tilbageholdte forudsigelse konservativ, men ikke inden for tærsklen, så krystaltilfældet er MODELLED. MODELLED: klasse- og databladskilder, de deterministiske led og vurderingen af spoofing.

seg-1284cfee51f0 = Én kørsel af <c1/> opsummeres som: slot-timing (databladkilde): beskyttelsesinterval { "100.0" } ns ved k={ "3" } brydes { "650.8" } s efter et tidsfix ({ "50.8" } s tilbage); tidsfix mindst hvert { "645.8" } s ({ "133.80" } pr. dag); dominerende led: frekvensstøj af typen random walk

seg-97e12e763be3 = Påkrævede felter: <c1/>, <c2/>

seg-6b75ef50497a = Valgfrie felter: <c1/>

seg-8c4662736bc0 = Eksemplet <c1/> angiver blandt andet:

seg-8aee75a55007 = ocxo

seg-df4ca2d859ff = 1/s^{ "3" }

seg-1a282dc35742 = datasheet

seg-c13396b4e57b = Resultatetiket (motorens egen): MODELLED — tid, indtil et frit løbende ur forlader beskyttelsesintervallet for en routing-slot, og den kadence for tidsfix, der holder det inden for, ud fra en stationær potenslovsmodel for uret. En databladkilde er en envelope af dens maksima, ikke en måling af nogen enhed; en klassekilde hviler på et antaget gulv med rød støj.

seg-97a91c8a60cd = Diagrammet, som motoren skriver for scenarios/slot-timing-ocxo-leo.toml, type slot-timing

seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-e84e4b49fee0 = <b>VALIDATED</b> Stien for målt registrering i typen <c1/>: den overlappende Allan-deviation af en faseregistrering tilpasset ved edf-vægtede ikke-negative mindste kvadrater i basen af hvid fase og IEEE Std { "1139" }-frekvensmodulation (slot_timing::fit_weighted), Tests: <a1>slot_timing_cs5071a_holdout.rs</a1>.

seg-26ccdbd07a46 = <b>MODELLED</b> Typen <c1/>: den forudsagte fejl E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inverteret for bruddet, den resterende tid, intervallet for resynkronisering netto af latens for tidsfixet og tidsfix pr. dag, hvert led specificeret med th Tests: <a1>slot_timing_igs_holdout.rs</a1>.

seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, tilgængelig som afsnittet om spoofing i typen <c1/>: hastighed og omløbstid i cirkulær bane, den længste tid en spoofer på jorden kan nå satellitten pr. overflyv, gulvet for den urstøttede monitor og CUSUM-detektionsl

seg-8dbc28c3398f = <b>MODELLED</b> Typen <c1/>: den forudsagte fejl E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inverteret for bruddet, den resterende tid, resynkronisering. Uafhængig reference (InternalConsistency): lukkede former for hvert led alene og den uafhængige rodsøgning holdover::holdover_seconds; databladets tal er de navngivne dokumenter (docs/SLOT-TIMING.md). En klassestandard hviler på et antaget gulv med rød støj, og en databladkilde er en envelope af maksima, så ingen af dem er en måling af nogen enhed

seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, tilgængelig som afsnittet om spoofing i typen <c1/>: hastighed og omløbstid i cirkulær bane, den længste tid en spoofer på jorden kan n. Uafhængig reference (InternalConsistency): reduktion til det eksisterende beskyttelsesniveau for tidssynkronisering og de lukkede former for synlighed i cirkulær bane og med kugleformet jord. Betinget af detektion, én terrestrisk spoofer ved en angivet rampehastighed, et overflyv lige over hovedet på en ikke-roterende jord; ikke valideret på en spoofet modtager i kredsløb

seg-29af1ec87672 = frekvensspring, strålingseffekter og relativistiske frekvensforskydninger (resultat <c1/>)

seg-89f90cdab1db = en termisk model: temperaturudsvinget anvendes som et trin ved tidsfixet (resultat <c1/>)

seg-cb3887ccae22 = selve synkroniseringsprotokollen: et tidsfix nulstiller fejlen til fix_sigma_ns (resultat <c1/>)

seg-b96fceda31df = hvilken metrik for wander en routing-slot bør accepteres mod; se docs/SLOT-TIMING.md (resultat <c1/>)

seg-b101457241f2 = MODELLED — tid, indtil et frit løbende ur forlader beskyttelsesintervallet for en routing-slot, og den kadence for tidsfix, der holder det inden for, ud fra en stationær potenslovsmodel for uret. En databladkilde er en envelope af dens maksima, ikke en måling af nogen enhed; en klassekilde hviler på et antaget gulv med rød støj. (resultat <c1/>)

seg-8e3d910f22ed = Oscillatoren er en KLASSESTANDARD (csac, uso, dsac, tcxo, ocxo eller rafs: én citeret Allan-deviation ved ét sekund og et antaget gulv med rød støj), en FORUDINDSTILLING FRA ET DATABLAD for telekommunikationstidssynkronisering eller et indlejret DATABLAD (maksima for Allan-deviation tilpasset som en envelope, plus aldring og en temperaturkoefficient) eller en indlejret MÅLT FASEREGISTRERING (dens overlappende Allan-deviation tilpasset ved vægtede mindste kvadrater i basen af hvid fase og IEEE S (typekatalog (<c1/>))

seg-f6a831727890 = VALIDATED: inversionen af holdover ud fra en tilpasset registrering, holdt ude (held out) på et reelt cæsiumur målt mod en brintmaser (tests/slot_timing_cs5071a_holdout.rs, datastyret); på en målt krystaloscillator er den tilbageholdte forudsigelse konservativ, men ikke inden for tærsklen, så krystaltilfældet er MODELLED. (typekatalog (<c1/>))

seg-1cf85cbedffa = MODELLED: klasse- og databladskilder, de deterministiske led og vurderingen af spoofing. (typekatalog (<c1/>))

seg-1a72034c1343 = Emneside: <a1>DECEIVED-TIME.md</a1>

seg-10e6cd8ce00c = <s1>Forrige</s1>reentry

seg-b8ec9e10ee84 = <s1>Næste</s1>solar-system
