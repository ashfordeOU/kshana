# docs--kind-lunar-infrastructure: translations (cs)

seg-e821670a8b55 = Zdroj: <c1/>

seg-56953faa67ae = <c1/> (druh scénáře)

seg-d0fb90f506c9 = MODELLED studie oběžné dráhy a povrchu Měsíce jako navigační a geodetické infrastruktury, pět studií za jedním druhem vybíraným pomocí <c1/>: od-consistency (palubní určování oběžné dráhy z Earth-GNSS na NRHO nebo ELFO proti nezávislému pozemnímu radiometrickému určování oběžné dráhy, posuzované podle jejich vlastních kovariancí přes seedovaný Monte Carlo), carrier-phase (společná dvojitě diferencovaná fáze nosné povrchu a orbiteru a řešení celočíselných nejednoznačností pomocí LAMBDA), frame-coestimation (povrchová stanice a orbitery přidané k měření vzdálenosti z pozemních stanic pro sedmiparametrové datum lunárního rámce), space-tie (GNSS, VLBI a laserové měření vzdálenosti na jedné kosmické lodi, preciznost vazby rámce vůči chybě lokální vazby) a geodesy-sensitivity (Fisherova informace Loveových čísel Měsíce h2, k2, l2 a fyzické librace z laserového měření vzdálenosti, sledování orbiteru, povrchového gravimetru a povrchových hodin). Omezený model tří těles s uvedenými zjednodušeními; numerika je kontrolována nezávislými programy a nic se neporovnává s měřením lunární veličiny.

seg-5753b7552559 = Jeden běh <c1/> se shrne takto: lunar-infrastructure space-tie: { "4" } bodů průchodu na { "1" } obloucích; laser-vs-GNSS x sigma translace { "1.0363" } m při registrované lokální vazbě

seg-f2594b18e718 = Povinná pole: <c1/>

seg-4875c29c517c = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-7b33bdb70a30 = Příklad <c1/> mimo jiné nastavuje:

seg-5fad84cbb2be = nrho

seg-def582a1f2ca = Popisek výsledku (od enginu): MODELLED — omezený model tří těles (hmotné body Země a Měsíce, bez Slunce, bez harmonických lunárního gravitačního pole) s uvedenými zjednodušeními a ILUSTRATIVNÍMI vstupy označenými jejich veřejnými zdroji. Numerika je kontrolována nezávislými programy; nic se neporovnává s měřením lunár

seg-f3b4a80a739b = bez grafu: příklad nezapisuje žádný graf

seg-35a4a7a25561 = <b>MODELLED</b> Určování oběžné dráhy na téměř přímkové halo dráze (nebo eliptické zmrazené dráze) ze dvou nezávislých typů dat: pseudovzdáleností Earth-GNSS přijímaných na palubě. Orákulum (ReferenceImpl): Nezávislý program scipy/numpy integruje stejné variační rovnice (práh O1). Nic se neporovnává s měřením lunární oběžné dráhy. Orákulum kontroluje numeriku uvedených vzorců, nikoli fyziku, takže řádek zůstává MODELLED. Omezený model tří těles: bez Slunce, bez lunárních harmonických, osa rotace Země podél normály dráhy, ILUSTRATIVNÍ vstupy přijímače a stanice.

seg-32455bf5f804 = <b>MODELLED</b> Jednoduše diferencovaná fáze nosné a kód Earth-GNSS mezi přijímači na lunární povrchové stanici a orbiteru, s rozdílem hodin v každé epoše vyprofilovaným. Orákulum (ReferenceImpl): Nezávislé řešení týchž normálních rovnic v numpy z exportovaných řádků (Q3) a hrubým výčtem celých čísel (Q4). S ničím se neporovnává žádné měření fáze nosné GNSS ani lunární. MODELLED.

seg-b20c412516b6 = <b>MODELLED</b> Fisherova informace sedmiparametrového datumu lunárního rámce z laserového měření vzdálenosti z pozemních stanic k pěti odražečům samotnému i s měřením vzdálenosti z orbiteru k povrchové stanici. Orákulum (ReferenceImpl): Nezávislá konečná diference dopředného modelu v numpy (F2). Nic se neporovnává se skutečnými řešeními lunárního rámce. Faktor je podmíněn předpokládanou známou dráhou a sigma vzdálenosti { "1" } m. MODELLED.

seg-151c96b1f882 = <b>MODELLED</b> Cramerova–Raova preciznost mezitechnikových posunů translace, měřítka a rotace mezi rámci GNSS, VLBI a laserového měření vzdálenosti, když jedna kosmická loď nese všechny. Orákulum (ReferenceImpl): Nezávislý skládaný systém v numpy s neznámými polohami vyloučenými explicitními Schurovými doplňky (T3). S daty GRASP, Genesis ani jiné mise se neporovnává. MODELLED.

seg-743d78806f6a = MODELLED — omezený model tří těles (hmotné body Země a Měsíce, bez Slunce, bez harmonických lunárního gravitačního pole) s uvedenými zjednodušeními a ILUSTRATIVNÍMI vstupy označenými jejich veřejnými zdroji. Numerika je kontrolována nezávislými programy; nic se neporovnává s měřením lunární veličiny a nic zde není tvrzením o žádné misi ani systému. Bez spojení s žádnou agenturou ani její podpory. Porad (výsledek <c1/>)

seg-da35c5298311 = MODELLED studie oběžné dráhy a povrchu Měsíce jako navigační a geodetické infrastruktury, pět studií za jedním druhem vybíraným pomocí <c1/>: od-consistency (palubní určování oběžné dráhy z Earth-GNSS na NRHO nebo ELFO proti nezávislému pozemnímu radiometrickému určování oběžné dráhy, posuzované podle jejich vlastních kovariancí přes seedovaný Monte Carlo), carrier-phase (společná dvojitě diferencovaná fáze nosné povrchu a orbiteru a celočíselná nejednoznačnost (katalog druhů (<c2/>))

seg-4658f67623b5 = Scénář lunar-infrastructure v Kshana: space-tie. MODELLED; návrh, vstupy a prahy jsou zafixovány v xval/lunar-infra/PREREGISTRATION.md (zapsáno před jakýmkoli během). ILUSTRATIVNÍ vstupy jsou tam označeny svými veřejnými zdroji. (komentář v souboru scénáře, řádky { "1" } až { "3" })

seg-f7257c25f137 = Určování lunární oběžné dráhy: Earth-GNSS proti pozemnímu radiometrickému je MODELLED, nikoli ověřené: je kontrolováno proti samostatné implementaci ve stejné kódové základně — nezávislé na testované jednotce, ale není externě autoritativní. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-a3988ca0b8ea = Řešení nejednoznačností fáze nosné na Měsíci: povrch a orbiter je MODELLED, nikoli ověřené: je kontrolováno proti samostatné implementaci ve stejné kódové základně — nezávislé na testované jednotce, ale není externě autoritativní. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-b2e4ab7b6e60 = Společný odhad lunárního rámce: povrchové stanice a orbitery je MODELLED, nikoli ověřený: je kontrolován proti samostatné implementaci ve stejné kódové základně — nezávislé na testované jednotce, ale není externě autoritativní. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-6eedb30a58c5 = Preciznost vazby rámce space-tie: společně umístěné GNSS, VLBI a laserové měření vzdálenosti je MODELLED, nikoli ověřená: je kontrolována proti samostatné implementaci ve stejné kódové základně — nezávislé na testované jednotce, ale není externě autoritativní. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-cd5f729c9622 = Tematická stránka: <a1>LUNAR-INFRASTRUCTURE.md</a1>

seg-4df4c0059362 = <s1>Předchozí</s1>lunar-frame-realisation

seg-c88eef4a7214 = <s1>Další</s1>lunar-integrity
