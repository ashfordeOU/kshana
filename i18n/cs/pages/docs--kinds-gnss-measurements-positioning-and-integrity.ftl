# docs--kinds-gnss-measurements-positioning-and-integrity: translations (cs)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Druh

seg-06197409c717 = Zveřejněné referenční vektory ARAIM pro certifikaci: ochranné úrovně ARAIM v horizontálním a vertikálním směru z enginu spuštěné proti VLASTNÍM propočteným číselným příkladům Technické podskupiny ARAIM skupiny WG-C, při toleranci (TOL_PL = { "5e-2" } m), kterou tyto dokumenty samy uvádějí. Jako fixtures jsou uloženy dva vektory, každý s adresou URL, datem stažení, SHA-256 zdrojového souboru a stranou: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), příloha D, vnitřně konzistentní a přejímací vektor, a Milestone { "3" } Report ({ "2016" }), příloha A, oddíl A.IX, tedy zpráva, na kterou odkazují výzkumné bibliografie. Každý zveřejněný vstup (geometrická matice pro 10 družic a 2 konstelace, diagonály rozptylů C_int a C_acc, b_nom, P_sat, P_const a sada konstant LPV-200) i každý zveřejněný výstup (VPL, HPL, EMT, sigma_v_acc, K_fa_3 a sigma_3, sigma_ss_3 a b_3 obou režimů poruchy konstelace) je uveden vedle vlastního čísla enginu a jejich absolutního rozdílu. Rovnice ochranné úrovně se zde NEŘEŠÍ znovu: seznam režimů z reference se předává stávajícím funkcím enginu raim::araim_protection_level / araim_integrity_risk, takže testovaná bisekce a algebra gaussovského chvostu patří enginu; pro něj se sestavuje jen geometrie, dílčí řešení, detekční prahy a zveřejněné rozdělení rozpočtu. EXTERNĚ OVĚŘENO proti vektoru z { "2019" }: VPL { "18.2926" } m oproti zveřejněným { "18.3" } m, HPL { "13.4063" } m oproti { "13.45" } m, EMT { "7.2997" } m oproti { "7.2998" } m, sigma_v_acc { "1.3694" } m oproti { "1.3694" } m a všech šest zveřejněných mezivýsledků s odchylkou do poloviny jednotky na posledním vytištěném desetinném místě. Vektor z { "2016" } obsahuje dvě vnitřní chyby, které zpráva uvádí, a neskrývá je: překlep ve znaménku v řádku { "3" } matice G a K_fa_3 vyhodnocené pro { "57" } režimů poruchy, zatímco dokument uvádí N_fault_max = { "1" } ({ "12" } režimů); jeho geometrické mezivýsledky se proto reprodukují přesně, zatímco jeho ochranné úrovně se uvádějí jako naměřené nesrovnalosti a jsou vyloučeny z přejímacího údaje; tolerance se nikdy nerozšiřuje, aby je pohltila. Každé emitované číselné pole nese jednotku a třídu původu a přepsaná hodnota se označuje <c1/>, aby se nikdy nemohla splést s vypočtenou. ROZSAH: implementováno je jen N_fault_max = { "1" } (režimy poruchy jedné družice a jedné konstelace) a případ, jehož apriorní předpoklady vyžadují souběžné podmnožiny poruch s více událostmi, je REFUSED, místo aby byl mlčky zkrácen; detekce a vyloučení poruch, kontrola konzistence chí-kvadrát a krok přerozdělení při dvojím započtení z referenčního algoritmu jsou mimo rozsah. Tím se reprodukuje propočtený příklad zveřejněného referenčního algoritmu; není to certifikace, letová způsobilost ani schválení.

seg-693c823c85d1 = Graf, který engine zapisuje pro scenarios/araim-reference-check.toml, druh araim-reference-check

seg-2ffccc9c1eff = Simulace pseudovzdáleností v oblasti měření (Klobuchar iono, Saastamoinen/Niell tropo) + RAIM.

seg-47ee40d4eb73 = Graf, který engine zapisuje pro scenarios/gnss-sim-raim.toml, druh gnss-sim

seg-eb7e0c2feb2b = Snímkové RAIM / RAIM s oddělováním řešení / ARAIM s HPL/VPL a Stanfordským diagramem.

seg-ce7f6130ddee = Graf, který engine zapisuje pro scenarios/integrity-raim.toml, druh integrity

seg-4e31c8daf798 = Registr

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-c9cf40c5e609 = Zdroj: <c1/>

seg-569fac649b5d = Měření GNSS, určování polohy a integrita (rodina druhů scénářů)

seg-63c3a7483268 = { "6" } druhů scénářů enginu v{ $version }. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází od enginu nebo z verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se označení získává: část Evidence v README).

seg-33a602147cc2 = Tematické stránky: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Spusťte jednu: <c1/>. Všechny rodiny: <a5>KINDS.md</a5>.

seg-9c60c8803b6b = Přehledový list grafů, které engine zapisuje pro druhy z rodiny Měření GNSS, určování polohy a integrita

seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

seg-6698e12e148b = Určení polohy z reálných pozorování jedním bodem: řešení polohy přijímače ze souboru pozorování RINEX { "3" } a souboru broadcast navigace (kódové pseudovzdálenosti, broadcast efemeridy, Klobuchar iono, Saastamo

seg-da89c260b1a3 = Publikované referenční vektory ARAIM pro certifikaci: horizontální a vertikální ochranné úrovně ARAIM enginu spuštěné proti VLASTNÍM propočteným numerickým příkladům podskupiny ARAIM Technical Subgroup WG-C, při toleranci

seg-7a750a89c9c4 = Model prostředí kosmického počasí: indexy sluneční (F10.7/F10.7a) a geomagnetické (Kp, s definiční tabulkou Kp↔ap) aktivity, jimi řízená exosférická teplota Jacchia-1971 (ověřeno proti publik

seg-d79d4d58275b = Rozpočet predikce lunární soustavy / orientace Země v reálném čase: P4 Tabulka { "1" } (kontrola konzistence chyby soustavy — zpracováno dodatečně ~{ "0.27" } m ↔ ~{ "0.010" } ms a v reálném čase ~{ "15" } m ↔ ~{ "0.5" } ms, každá poloha soustavy vyjádřena

seg-dc783268156c = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Volitelná: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-7b110aacdb27 = <b>Registr:</b> MODELLED { "6" } · VALIDATED { "4" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>integrity</a1>.

seg-d444fb35cae9 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>. Volitelná: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-b651ec58bcba = <b>Registr:</b> VALIDATED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>gnss-sim</a1>.

seg-b9a21187317d = Povinná pole: <c1/>, <c2/>. Volitelná: <c3/>, <c4/>, <c5/>, <c6/>.

seg-143dc4fd1d44 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>pvt</a1>.

seg-9ca1f6783e8e = Povinná pole: žádná. Volitelná: <c1/>.

seg-415f1fa78518 = <b>Registr:</b> VALIDATED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>araim-reference-check</a1>.

seg-6c4655b35c65 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>.

seg-1e5052c0bce7 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>space-weather</a1>.

seg-64c512530ee6 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-1c244958d3c4 = <b>Registr:</b> MODELLED { "1" } · VALIDATED { "2" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>realtime-frame-eop</a1>.

seg-d4adf4283480 = <s1>Předchozí</s1>Konstelace pokrytí a geometrie

seg-2cdfd7f8bfb3 = <s1>Další</s1>Alternativní PNT při nedostupnosti GPS
