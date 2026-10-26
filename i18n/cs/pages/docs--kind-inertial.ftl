# docs--kind-inertial: translations (cs)

seg-51362910dcb7 = Tento druh používají { "2" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-b054c73f22e5 = žádná hodnota

seg-98151954f217 = false

seg-be831b52a339 = a { "4" } další v matici.

seg-7b2721b7588d = Druh scénáře enginu v{ $version }, rodina <a1>Inerciální, fúzní a kvantové senzory</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr s atomovým interferometrem se studenými atomy z prvních principů (k_eff·T², QPN). Oracle (ExternalDataset): Číselné vektory z primárních prací o CAI (Cheinet { "2008" }, přenosová funkce; Peters/Freier, citlivost): k_eff·T² přesně shodné, ASD výstřelového šumu jednostranné dno do ~{ "2" }× od každého zveřejněného přístroje (skutečná zařízení nesou technický šum nad kvantovým dnem). Rozmezí, nikoli shoda. { "0.30" } kolo { "2" } (předregistrováno fcb9ac64), zjištění (zůstává MODELLED): rotační šum jen od QPN proti naměřenému Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Složený rozpočet polohy z biasu + faktoru měřítka + VRW + poklesu stability během holdoveru. Oracle (ReferenceImpl): Nezávislá integrace SDE metodou Monte Carlo v numpy dvojitě integrovaného šumu bílého zrychlení (ověřuje analytický rozptyl VRW skutečně nezávislým algoritmem) + zveřejněná hodnota z Groves { "2013" } jako kotva pro členy biasu a faktoru měřítka; čísla zařízení CAI vyčíslují hardware partnera a zůstávají MODELLED

seg-9955b1b1c018 = Výkon kvantových inerciálních senzorů je MODELLED, nikoli ověřen proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Odolnost kvantové inerciální dead-reckoning navigace je MODELLED, nikoli ověřena proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Stránka rodiny: <a1>Inerciální, fúzní a kvantové senzory</a1>

seg-ca448daf5ec7 = nominal

seg-496b17a8d3b9 = Tematická stránka: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Tematická stránka: <a1>QUANTUM.md</a1>

seg-7bebd09c614b = Křemenný akcelerometr navigační třídy (Honeywell QA-2000 / G

seg-cead54058894 = Zdroj: <c1/>

seg-783be547f01e = <c1/> (druh scénáře)

seg-bdedf28adc48 = Inerciální dead-reckoning s 1 stupněm volnosti během výpadku GNSS.

seg-55b5599ef867 = Jeden běh <c1/> se shrnuje takto: scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

seg-b05c3cb45c0d = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-94fd9afe6f30 = Volitelná pole: <c1/>

seg-bd021b5dff80 = Příklad <c1/> mimo jiné nastavuje:

seg-8a9e52e38b05 = Hybridní kvantový akcelerometr Exail, trojice: stabilita biasu 6e-

seg-873c402bb724 = Graf, který engine zapisuje pro scenarios/imu-deadreckoning.toml, druh inertial

seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-41f3a20fadfb = <b>VALIDATED</b> Kvaternionová, WGS-84 NED strapdown inerciální mechanizace (s kompenzací coning/sculling) šířící navigační stav z přírůstků (Δθ, Δv). Testy: <a1>classical_strapdown_ins_reference.rs</a1>.

seg-102d2e51460e = <b>MODELLED</b> Akcelerometr s interferometrem se studenými atomy z prvních principů (k_eff·T², QPN). Testy: <a1>quantum_inertial_sensor_reference.rs</a1>.

seg-83fa50d4859a = <b>MODELLED</b> Dynamický rozsah Mach–Zehnderovy nejednoznačnosti proužků: 2π-periodický odečet proužku určuje maximální jednoznačnou specifickou sílu a_max=π/(k_eff·T²) a jednoznačný rozsah v rozlišovacích buňkách a_max/σ_a=π/σ_Φ je nezávislý na optickém měřítkovém fakt

seg-89ec2e65cf4f = <b>MODELLED</b> Složený rozpočet polohy z biasu + měřítkového faktoru + VRW + poklesu stability během holdoveru. Testy: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

seg-bb07c8ee153f = <b>PARTNER</b> Neposkytuje se — pouze modely výkonu; hardware se studenými atomy a hodinami je záležitostí partnera. Orákulum (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-fab4c926e628 = <s1>Předchozí</s1>impairment-eval

seg-aa783749183d = <s1>Další</s1>ins-trn-coast
