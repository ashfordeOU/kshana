# docs--kind-tracking-loop: translations (cs)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-b054c73f22e5 = žádná hodnota

seg-05e8854de548 = čip

seg-59afd80736c5 = <b>PARTNER</b> Neposkytuje se: Kshana modeluje výkon signálu, nikoli nákladový hardware ani antény. Oracle (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-a3697ad561db = Hz

seg-304496607bd7 = Druh scénáře enginu v{ $version }, rodina <a1>Rušení, spoofing a spektrum</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-5d23d7f8f872 = Stránka rodiny: <a1>Rušení, spoofing a spektrum</a1>

seg-edcd55ccc993 = <b>MODELLED</b> Zpráva <c1/> už svůj kontur odepření nestaví na jediném skaláru.

seg-62d230dfccce = Jeden běh <c1/> se shrnuje takto: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> pokles { "25.4744" } dB-Hz (rozhoduje nosná), opětovné zachycení { "27.4413" } dB-Hz, hystereze { "1.9669" } dB | ztráta zachycení vyhlášena { "39.101" } s po začátku rampy | poloměr odepření prahu(J/S { "30" } dB) { "127.413" } km oproti dynamice smyčky { "53.1694" } km, rozdíl -74.2438 km | spoofing pull-in <= { "0.966" } chip/s kódu a { "41.45" } Hz/s nosné (MODELLED smyčka, VALIDATED uzavřené tvary)

seg-7614718317f4 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

seg-41162ed2743b = Příklad <c1/> nastavuje mimo jiné:

seg-773fff0feaf7 = v závorce

seg-23f3aa5c2064 = Označení výsledku (enginu): MIXED — VALIDATED uzavřené tvary smyčky, MODELLED konfigurace smyčky. Výrazy pro tepelný jitter nosné a kódu, redukce smyčkového filtru sqrt({ "2" }<em>B_n</em>T) a zpoždění rampy prvního řádu jsou křížově ověřeny proti vlastnímu korelátoru sdr enginu, krokovanému na seedovaném syntetickém IF (jiná cesta

seg-72182c1aecd9 = Graf, který engine zapisuje pro scenarios/tracking-loop.toml, druh tracking-loop

seg-346594a654f2 = <b>MODELLED</b> Ztráta zachycení vypočtená z dynamiky smyčky místo z poměru výkonů: 1σ tepelný jitter nosné (Costas) a kódu (nekoherentní early/late) vůči C/N₀ se ztrátou kvadrováním, proti uvedeným pravidlům 3σ_PLL + θ_e ≤ { "45" }° a 3σ_DLL + zpoždění rampy

seg-3aa7f9748dc2 = <b>MODELLED</b> Ztráta zachycení vypočtená z dynamiky smyčky místo z poměru výkonů: 1σ tepelný jitter nosné (Costas) a kódu (nekoherentní early/late) vůči C/N₀ se s. Orákulum (ReferenceImpl): Vlastní korelátor sdr enginu (sdr::correlate / synth_if / CaCode) krokovaný na seedovaném syntetickém IF při kalibrovaném C/N₀ — samostatná cesta kódu, která dospívá ke stejným číslům numerickou korelací vzorkovaného IQ, a nikoli algebraickým výrazem pro jitter, takže jde o jinou cestu a ne o zopakování téhož — a dále standardní tabelované hodnoty modifikované Besselovy funkce I₀ pro člen cycle-slip. Teorie smyček podle Kaplana a Hegara

seg-de048f9cf1f6 = MIXED — VALIDATED uzavřené tvary smyčky, MODELLED konfigurace smyčky. Výrazy pro tepelný jitter nosné a kódu, redukce smyčkového filtru sqrt({ "2" }<em>B_n</em>T) a zpoždění rampy prvního řádu jsou křížově ověřeny proti vlastnímu korelátoru sdr enginu, krokovanému na seedovaném syntetickém IF (jiná cesta ke stejným číslům), a modifikovaná Besselova funkce I0 proti standardním tabelovaným hodnotám. MODELLED: šířky pásma smyček, integ (výsledek <c1/>)

seg-0dc70b7607f0 = MODELLED: šířky pásma smyček, doba integrace, rozestup korelátorů, poměr šířky pásma pull-in, potvrzovací prodlevy, výkon rušičky a zisky antén jsou reprezentativní hodnoty pásma, nikoli údaje z datasheetu. (katalog druhů (<c1/>))

seg-a679a9732b2a = NEJSOU modelovány: jitter oscilátoru (Allanova odchylka) a vibrací, omezení šířky pásma vstupní části, vícecestné šíření, dynamika AGC, ztráta při přechodech datových bitů, vnější podpora a jakákoli korekce půlcyklu ve vzorci cycle-slip pro Costasovu smyčku. (katalog druhů (<c1/>))

seg-f8d50cbc6f2c = Každý parametr smyčky níže je MODELLED reprezentativní hodnota pásma, nikoli údaj z datasheetu. (komentář v souboru scénáře, řádek { "22" })

seg-9241a57823cd = --- geometrie smyčky ----------------------------------------------------------------- Costasova smyčka nosné { "10" } Hz a smyčka kódu s podporou nosné { "1" } Hz, koherentní integrace { "1" } ms (jedna perioda kódu C/A, takže se nepředpokládá žádná synchronizace datových bitů), úzký korelátor { "0.5" } chip. (komentář v souboru scénáře, řádky { "25" } až { "28" })

seg-3a677e343081 = Ztráta zachycení smyčky sledování a spoofing pull-in při interferenci jsou MODELLED, nikoli ověřeny proti vnější referenci: ověřeno proti samostatné implementaci ve stejné kódové základně — nezávislé na testované jednotce, ale nikoli vnějšně směrodatné. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e3a8f20108f3 = <s1>Předchozí</s1>timetransfer
