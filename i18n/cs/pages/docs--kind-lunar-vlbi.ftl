# docs--kind-lunar-vlbi: translations (cs)

seg-c1ce24cd6008 = analytické

seg-37d29d8303fe = km

seg-df90e5910fb4 = hod

seg-3843825d0733 = us

seg-d1a6a5086102 = <b>VALIDATED</b> Parciální derivace zpoždění akumulované přes plán základen × epoch do Fisherovy informační matice, invertované na kovarianci souřadnic stanic a sigma stanice pro každou souřadnici, čímž se nahrazuje předpokládaná izotropní vazba ekvipartice z

seg-55ce02ad5dd5 = <b>MODELLED</b> Třetí volba datumu, <c1/>, která drží každou pozemní stanici a odhaduje samotné souřadnice MAJÁKU vázané na těleso Měsíce — konfigurace, pro kterou se nejistota lunárního povrchového bodu skutečně uvádí, protože souřadnice pozemních stanic

seg-afeb6e26c5ad = Zdroj: <c1/>

seg-6d1a32afd780 = <c1/> (druh scénáře)

seg-e01f77d493a0 = Modelovaná geodetická pozorovatelná zpoždění lunárního VLBI: zemská základna (dvě pozemní stanice, GCRS) pozoruje jednosměrný signál z majáku třídy NovaMoon na lunárním povrchu. Vydává zpoždění jako rozdíl dvou vzdáleností v blízkém poli, jeho rychlost a korekci zakřivení vlnoplochy v blízkém poli přes přelet — křížově ověřeno proti pozorovatelné Δ-DOR s rovinnou vlnou ve stejné kódové základně v limitě dalekého pole, s parciálními derivacemi ověřenými konečnou diferencí. Výchozí analytická cesta je MODELLED a nese výhrady ke konzistenci rámců, k pohybu pólu xp=yp={ "0" } a k rovinné vlně oproti blízkému poli. Nastavení planetary_kernel_path, earth_orientation_kernel_path a moon_orientation_kernel_path spustí místo toho cestu přes jádra (DE440, MOON_PA_DE440, ITRF93; konvergované barycentrické doby letu světla; přidává parciální derivace majáku a stanice v dané epoše), jejíž newtonovské zpoždění a parciální derivace se shodují s konvergovanými dobami letu světla NAIF SPICE na { "0.06" } ps a { "7.4e-9" }. Neověřeno proti skutečným datům VLBI.

seg-92227c085867 = Jeden běh <c1/> se shrne takto: lunar-vlbi | základna { "10727" } km | vzdálenost majáku { "402900" } km | zpoždění -10049.126 µs (rychlost { "1.312e-6" } s/s) | blízké pole { "58.9" } µs | { "13" } vzorků za { "6.0" } h

seg-1a38a07a0d70 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

seg-11450a55fc9d = Příklad <c1/> mimo jiné nastavuje:

seg-07d97fc1abac = Graf, který engine zapisuje pro scenarios/lunar-vlbi.toml, druh lunar-vlbi

seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-61f431e422e5 = <b>MODELLED</b> Zpoždění VLBI v blízkém poli pro zemskou základnu pozorující lunární maják + parciální derivace

seg-7342b50d34e4 = <b>VALIDATED</b> Zpoždění VLBI v blízkém poli pro zemskou základnu pozorující lunární maják, s parciálními derivacemi majáku a stanice, na cestě přes jádra (lunar_vlbi::KernelGeometry): DE440 Země a Měsíc, hlavní osy Měsíce DE440, orientace Země ITRF93 s UT1 a Testy: <a1>naif_kernel_reader_check.rs</a1>.

seg-5547f1f662d3 = a { "2" } další v matici.

seg-1461c84350d8 = <b>MODELLED</b> Zpoždění VLBI v blízkém poli pro zemskou základnu pozorující lunární maják + parciální derivace. Orákulum (ReferenceImpl): Rovinná vlna delta_dor (ve stejné kódové základně) v limitě dalekého pole; parciální derivace konečnou diferencí. { "0.30" } externí srovnání, zjištění (zůstává MODELLED): proti konvergovaným dobám letu světla ANISE { "0.10" } přes DE440 ({ "75" } zpoždění dne 2024-01-01 přes tři základny DSN, vygenerovaných pomocí xval/anise-lunar-od bez kódu Kshana) není žádné zpoždění v rámci tolerance { "1" } ps. Největší rozdíl je { "24" } µs, z analytického středu Měsíce (asi { "200" } km od DE

seg-b41c162b015f = Výchozí analytická cesta je MODELLED a nese výhrady ke konzistenci rámců, k pohybu pólu xp=yp={ "0" } a k rovinné vlně oproti blízkému poli. (katalog druhů (<c1/>))

seg-0beac99bb095 = Čestnost: MODELLED, NEOVĚŘENO proti skutečným datům VLBI. Pohyb pólu je vypuštěn (xp = yp = { "0" }), takže inerciální polohy stanic nesou chybu rámce několika metrů; maják míchá řadu Měsíce střední rovník data s posunem vázaným na těleso v ICRF (jd_tdb ~ jd_tt), nesoulad konzistence rámců pod věrností modelu; žádná iterace doby letu světla, média ani aberace nad rámec diferencovaného Shapira. Žádné TRL, letové heritage ani podpora agentury (komentář v souboru scénáře, řádky { "17" } až { "21" })

seg-58b64e5ff3db = Lunární geodetické VLBI je MODELLED, nikoli ověřené: je kontrolováno proti samostatné implementaci ve stejné kódové základně — nezávislé na testované jednotce, ale není externě autoritativní. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-04089c4d6fbe = <s1>Předchozí</s1>lunar-vlbi-fim

seg-6adcdfbaa8be = <s1>Další</s1>mars-pnt
