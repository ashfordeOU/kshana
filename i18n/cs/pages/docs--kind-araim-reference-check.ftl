# docs--kind-araim-reference-check: translations (cs)

seg-debc2f07db78 = true

seg-c53da0bf140d = Zdroj: <c1/>

seg-82884391dd77 = <c1/> (druh scénáře)

seg-8e845ce908ee = Druh scénáře enginu v{ $version }, rodina <a1>Měření GNSS, určování polohy a integrita</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-06197409c717 = Zveřejněné referenční vektory ARAIM pro certifikaci: ochranné úrovně ARAIM v horizontálním a vertikálním směru z enginu spuštěné proti VLASTNÍM propočteným číselným příkladům Technické podskupiny ARAIM skupiny WG-C, při toleranci (TOL_PL = { "5e-2" } m), kterou tyto dokumenty samy uvádějí. Jako fixtures jsou uloženy dva vektory, každý s adresou URL, datem stažení, SHA-256 zdrojového souboru a stranou: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), příloha D, vnitřně konzistentní a přejímací vektor, a Milestone { "3" } Report ({ "2016" }), příloha A, oddíl A.IX, tedy zpráva, na kterou odkazují výzkumné bibliografie. Každý zveřejněný vstup (geometrická matice pro 10 družic a 2 konstelace, diagonály rozptylů C_int a C_acc, b_nom, P_sat, P_const a sada konstant LPV-200) i každý zveřejněný výstup (VPL, HPL, EMT, sigma_v_acc, K_fa_3 a sigma_3, sigma_ss_3 a b_3 obou režimů poruchy konstelace) je uveden vedle vlastního čísla enginu a jejich absolutního rozdílu. Rovnice ochranné úrovně se zde NEŘEŠÍ znovu: seznam režimů z reference se předává stávajícím funkcím enginu raim::araim_protection_level / araim_integrity_risk, takže testovaná bisekce a algebra gaussovského chvostu patří enginu; pro něj se sestavuje jen geometrie, dílčí řešení, detekční prahy a zveřejněné rozdělení rozpočtu. EXTERNĚ OVĚŘENO proti vektoru z { "2019" }: VPL { "18.2926" } m oproti zveřejněným { "18.3" } m, HPL { "13.4063" } m oproti { "13.45" } m, EMT { "7.2997" } m oproti { "7.2998" } m, sigma_v_acc { "1.3694" } m oproti { "1.3694" } m a všech šest zveřejněných mezivýsledků s odchylkou do poloviny jednotky na posledním vytištěném desetinném místě. Vektor z { "2016" } obsahuje dvě vnitřní chyby, které zpráva uvádí, a neskrývá je: překlep ve znaménku v řádku { "3" } matice G a K_fa_3 vyhodnocené pro { "57" } režimů poruchy, zatímco dokument uvádí N_fault_max = { "1" } ({ "12" } režimů); jeho geometrické mezivýsledky se proto reprodukují přesně, zatímco jeho ochranné úrovně se uvádějí jako naměřené nesrovnalosti a jsou vyloučeny z přejímacího údaje; tolerance se nikdy nerozšiřuje, aby je pohltila. Každé emitované číselné pole nese jednotku a třídu původu a přepsaná hodnota se označuje <c1/>, aby se nikdy nemohla splést s vypočtenou. ROZSAH: implementováno je jen N_fault_max = { "1" } (režimy poruchy jedné družice a jedné konstelace) a případ, jehož apriorní předpoklady vyžadují souběžné podmnožiny poruch s více událostmi, je REFUSED, místo aby byl mlčky zkrácen; detekce a vyloučení poruch, kontrola konzistence chí-kvadrát a krok přerozdělení při dvojím započtení z referenčního algoritmu jsou mimo rozsah. Tím se reprodukuje propočtený příklad zveřejněného referenčního algoritmu; není to certifikace, letová způsobilost ani schválení.

seg-c16de81ec8da = Jeden běh <c1/> se shrnuje takto: araim-reference-check: { "2" } zveřejněné referenční vektory WG-C; nejhorší shoda VPL/HPL { "0.0437" } m proti vlastní toleranci reference TOL_PL = { "0.05" } m přes { "1" } přejímací vektor

seg-b1be6b5632c1 = Volitelná pole: <c1/>

seg-3f181d41edb5 = Příklad <c1/> mimo jiné nastavuje:

seg-9de6e1b3352d = Označení výsledku (z enginu): EXTERNĚ OVĚŘENO: ochranné úrovně ARAIM z enginu spuštěné proti zveřejněným propočteným číselným příkladům referenčního palubního algoritmu Technické podskupiny ARAIM pracovní skupiny C EU a USA, při toleranci (TOL_PL), kterou tyto dokumenty samy uvádějí. Každé zveřejněné číslo nese svou adresu UR

seg-693c823c85d1 = Graf, který engine zapisuje pro scenarios/araim-reference-check.toml, druh araim-reference-check

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-c5c966ec3c6a = <b>VALIDATED</b> Samotná rovnice ochranné úrovně pro separaci řešení při více hypotézách: vážené nejmenší čtverce pro všechny viditelné družice i pro jednotlivé režimy poruchy v geometrii East/North/Up s jedním stavem hodin na konstelaci, sigma dílčích řešení, separace řešení Testy: <a1>araim_reference_vectors.rs</a1>.

seg-a99b9cf4c6e8 = <b>VALIDATED</b> Samotná rovnice ochranné úrovně pro separaci řešení při více hypotézách: vážené nejmenší čtverce pro všechny viditelné družice i pro jednotlivé režimy poruchy v geometrii East/North/Up. Oracle (ExternalDataset): Technická podskupina ARAIM pracovní skupiny C EU a USA, Reference Airborne Algorithm Description Document v3.1 ({ "20" } červen { "2019" }), propočtený číselný příklad v příloze D: zveřejněné VSTUPY (geometrická matice pro 10 družic a 2 konstelace, diagonály C_int/C_acc, b_nom, P_sat, P_const, konstanty LPV-200) a zveřejněné VÝSTUPY (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } a šest mezivýsledků poruch konstelace

seg-f6b7ca020692 = Stránka rodiny: <a1>Měření GNSS, určování polohy a integrita</a1>

seg-f4cf8b629797 = Tematická stránka: <a1>INTEGRITY.md</a1>

seg-e6b1f9a47b5d = Tematická stránka: <a1>ARAIM_REFERENCE.md</a1>

seg-7cf434223fa5 = <s1>Předchozí</s1>aperture-duty-cycle

seg-ed2003ecf41b = <s1>Další</s1>ascent-losses
