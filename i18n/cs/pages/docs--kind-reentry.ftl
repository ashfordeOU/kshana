# docs--kind-reentry: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-3a3ee499961e = <b>MODELLED</b> Rovinný výstup gravitačním obratem vícestupňového nosiče nad nerotující kulovou Zemí atmosférou US Standard Atmosphere { "1976" } (hustota a tlak), s náklonem, tahem sníženým o protitlak trysky, vyhořením stupňů v přesných s

seg-8e62cc4af6ea = Tematická stránka: <a1>ENTRY-EO-ASCENT.md</a1>

seg-05ce408c2dbb = kg/m^{ "2" }

seg-195347c63a8a = m/s^{ "2" }

seg-c95aec0d2943 = Zdroj: <c1/>

seg-91424dc65b3e = <c1/> (druh scénáře)

seg-039f77066d97 = Balistický koridor návratu do atmosféry podle Allena–Eggerse: špičkové zpomalení (nezávislé na balistickém součiniteli, V_e^{ "2" } sin|γ|/(2eH)), rychlost a výška při špičkovém g a rychlost špičkového ohřevu pro vstupní rychlost/úhel dráhy letu/balistický součinitel exponenciální atmosférou, plus rovinná integrace hmotného bodu téhož balistického vstupu s gravitací, zakřivením Země a americkou standardní atmosférou { "1976" } (špičkové zpomalení, rychlost, výška a čas ve špičce). Balistický (bez vztlaku) vstup MODELLED; výstup ohřevu je RYCHLOST špičkového ohřevu, nikoli tepelný tok (bez aerotermálního modelu/modelu TPS).

seg-9908d06c50eb = Jeden běh <c1/> se shrnuje takto: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> špička { "16.6" } g ve { "49" } km, { "4731" } m/s; ohřev vrcholí při { "6603" } m/s; hmotný bod (gravitace, zakřivení, US76) špička { "16.4" } g (MODELLED balistický, bez aerotermálního modelu)

seg-f057c2a160e7 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-576245fd5b70 = Příklad <c1/> mimo jiné nastavuje:

seg-0b7769c97ff3 = Popisek výsledku (z enginu): MODELLED — balistický (bez vztlaku) vstup podle Allena–Eggerse, exponenciální izotermická atmosféra, konstantní úhel dráhy letu; špičkové g je nezávislé na balistickém součiniteli; ohřev je RYCHLOST špičkového ohřevu, NIKOLI tepelný tok (bez aerotermálního modelu/modelu TPS)

seg-b0109481e8ff = Graf, který engine zapisuje pro scenarios/reentry.toml, druh reentry

seg-c860b8679b47 = <b>MODELLED</b> Špičkové zpomalení (nezávislé na balistickém součiniteli), rychlost + výška při špičkovém g a rychlost špičkového ohřevu pro balistický vstup exponenciální atmosférou. Testy: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

seg-84abc0b9f859 = <b>MODELLED</b> Špičkové zpomalení (nezávislé na balistickém součiniteli), rychlost + výška při špičkovém g a rychlost špičkového ohřevu pro balistický vstup exponenciální atmosférou. R. Orákulum (InternalConsistency): Analytický vstup podle Allena–Eggerse v uzavřeném tvaru, navíc křížově zkontrolovaný proti numerické integraci scipy { "1.18" } solve_ivp (DOP853) STEJNÉHO ODE vstupu s pouhým odporem (tests/ballistic_re_entry_corridor_reference.rs, { "36" } případů, nejhorší rel. a_max { "2.9e-9" }) — kontrola numerického integrálu proti vlastnímu analytickému tvaru, takže stále InternalConsistency, NIKOLI externí ověření. Balistický (bez vztlaku) MODELLED, bez aerotermálního modelu/modelu TPS — výstup ohřevu je ve

seg-8b9d3db5d563 = MODELLED — balistický (bez vztlaku) vstup podle Allena–Eggerse, exponenciální izotermická atmosféra, konstantní úhel dráhy letu; špičkové g je nezávislé na balistickém součiniteli; ohřev je RYCHLOST špičkového ohřevu, NIKOLI tepelný tok (bez aerotermálního modelu/modelu TPS) (výsledek <c1/>)

seg-82de2275c919 = Balistický (bez vztlaku) vstup MODELLED; výstup ohřevu je RYCHLOST špičkového ohřevu, nikoli tepelný tok (bez aerotermálního modelu/modelu TPS). (katalog druhů (<c1/>))

seg-080b28422342 = ČESTNÝ ROZSAH: balistický (bez vztlaku) vstup MODELLED, exponenciální izotermická atmosféra, konstantní úhel dráhy letu. Žádný aerotermální model/model TPS -- výstup ohřevu je RYCHLOST špičkového ohřevu, nikoli tepelný tok. Nejde o trajektorii se 3/6 stupni volnosti. Spuštění: kshana scenarios/reentry.toml (komentář v souboru scénáře, řádky { "8" } až { "11" })

seg-cfc345f0dc0d = Balistický koridor návratu do atmosféry (Allen–Eggers) je MODELLED, nikoli ověřený: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-a4b7c16e3fea = <s1>Předchozí</s1>realtime-frame-eop

seg-6166a1c21525 = <s1>Další</s1>slot-timing
