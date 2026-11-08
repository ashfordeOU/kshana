# docs--kind-lunar-station-coverage: translations (cs)

seg-9feefecdcf67 = rafs

seg-cd04f5662884 = MODELLED. (katalog druhů (<c1/>))

seg-6f4246bd8f6f = <b>MODELLED</b> Diferenciální referenční stanice třídy NovaMoon: zrušení společného módu + reziduál rostoucí se základnou + ochranné úrovně DGNSS. Orákulum (InternalConsistency): Identita diferenciálního zrušení chyb + opětovné použití aparátu PL SBAS DO-229E; jednoduchý rozdíl + řešení WLS je navíc křížově ověřeno proti lsq()/matinv() z RTKLIB (Takasu, BSD-2-Clause, kompilované C) — nezávislý kód řešiče, ale stejná algebra rozdílu LOS prvního řádu, takže stále InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> Tři členy, které diferenciální korekce nabere mezi epochou, ve které je vypočtena, a epochou, ve které je použita, každý dříve ponechaný jako nemodelovaná rezerva:. Orákulum (InternalConsistency): Identity v uzavřeném tvaru a vnitřní konzistence: rozptyl rovnoměrného kvantizéru step²/12, přesné šíření kovariance (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ splývající na σ·PDOP pro stejné σ, přenos { "1" }:{ "1" } členu zaměření jako důsledek û_user ≈ û_ref a kvadraturní uzavření vypínání. Křížová kontrola PDOP proti orbit::dop sdílí normální matici [−û, { "1" }], takže jde o kontrolu konzistence a je tak označena, nikoli jako nezá

seg-7171b2e3f29d = Lunární diferenciální PNT je MODELLED, nikoli ověřené: je kontrolováno proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Lunární diferenciální PNT — rozpočet reziduí korekčního spoje je MODELLED, nikoli ověřený: je kontrolován proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Tematická stránka: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-f3231c08fa26 = Zdroj: <c1/>

seg-1a28838279fe = <c1/> (druh scénáře)

seg-f7ea776e70c9 = Modelované pokrytí lunární referenční stanicí: průchod modelu lunárního diferenciálního PNT metodou Monte Carlo přes uživatelskou mřížku u jižního pólu a den epoch. Diferenciální referenční stanice na známém místě u jižního pólu koriguje uvedenou konstelaci (ilustrativní keplerovskou nebo tabelovanou efemeridu) s uvedenou chybou signálu v prostoru, chybou zaměření, latencí korekce a kvantizací spoje; pro každý bod i pro celou oblast uvádí percentil korigované a nekorigované chyby polohy (3D, horizontální, vertikální), dostupnost, pokrytí vůči uvedenému prahu, ochranné úrovně DO-229E, poloměr pokrytí podle azimutu a rozpočet korekčního spoje na stanici a v nejhorším bodě. Není to tvrzení o výkonnosti žádného skutečného systému; bez spojení s žádnou agenturou ani její podpory. MODELLED.

seg-d18c93c2e136 = Jeden běh <c1/> se shrne takto: lunar-station-coverage | { "346" } bodů x { "144" } epoch x { "200" } pokusů | dostupnost { "92.2" } % | pokrytí { "76.5" } % (p95 <= { "20" } m) | korigované p95 3D { "15.592" } m (nekorigované { "1056.892" } m) | HPL max { "480.385" } m | MODELLED; není to tvrzení o žádném skutečném systému

seg-cb73ac0d57de = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

seg-0c3460704315 = Příklad <c1/> mimo jiné nastavuje:

seg-2d84b341a41f = Popisek výsledku (od enginu): MODELLED

seg-922b8656fcae = Graf, který engine zapisuje pro scenarios/lunar-station-coverage.toml, druh lunar-station-coverage

seg-4f5941f12127 = <b>MODELLED</b> Průchod modelu lunárního diferenciálního PNT metodou Monte Carlo přes uživatelskou mřížku u jižního pólu a den epoch (druh <c1/>): pro diferenciální referenční stanici na známém místě u jižního pólu, pro každý bod i pro celou oblast, Testy: <a1>lunar_station_coverage_reference.rs</a1>.

seg-d547d600ee2d = <b>MODELLED</b> Průchod modelu lunárního diferenciálního PNT metodou Monte Carlo přes uživatelskou mřížku u jižního pólu a den epoch (druh <c1/>): pro diferenciální r. Orákulum (InternalConsistency): Aritmetika přepočtená nezávislým skriptem numpy na exportovaných případech (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; předregistrováno v tests/fixtures/lunar_station/PREREGISTRATION.md, uloženo samostatně v 9caedf97 před prvním během): na { "20" } případech se všemi členy chyb zapnutými jsou viditelné množiny a stav shodné, surové chyby vzdálenosti se shodují na { "1.4e-14" } m, vektory a velikosti chyb polohy na { "1.4e-9" } m proti

seg-626ab55f0424 = MODELLED (výsledek <c1/>)

seg-6f09def22469 = ČESTNOST: MODELLED. Při níže uvedených předpokladech dává model tyto hodnoty. Není to tvrzení o výkonnosti žádného skutečného systému; bez spojení s žádnou agenturou ani její podpory; bez tvrzení o TRL nebo heritage. Vynecháno: stínění terénem a horizontem u pólu (první omezení), vícecestné šíření, hardware přijímače. (komentář v souboru scénáře, řádky { "15" } až { "18" })

seg-db27cc015952 = Mapa pokrytí a přesnosti lunární referenční stanice je MODELLED, nikoli ověřená: je kontrolována proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Předchozí</s1>lunar-llr-datum

seg-625c1973128e = <s1>Další</s1>lunar-time-budget

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-3bc1761c76ab = Tento druh používají { "3" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-bf7d64a925dd = <s1>Předchozí</s1>lunar-orbit-rendezvous

seg-0525bddd21ee = <s1>Další</s1>lunar-surface
