# docs--kind-quantum-gnss-free-nav: translations (cs)

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-7b2721b7588d = Druh scénáře enginu v{ $version }, rodina <a1>Inerciální, fúzní a kvantové senzory</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr s atomovým interferometrem se studenými atomy z prvních principů (k_eff·T², QPN). Oracle (ExternalDataset): Číselné vektory z primárních prací o CAI (Cheinet { "2008" }, přenosová funkce; Peters/Freier, citlivost): k_eff·T² přesně shodné, ASD výstřelového šumu jednostranné dno do ~{ "2" }× od každého zveřejněného přístroje (skutečná zařízení nesou technický šum nad kvantovým dnem). Rozmezí, nikoli shoda. { "0.30" } kolo { "2" } (předregistrováno fcb9ac64), zjištění (zůstává MODELLED): rotační šum jen od QPN proti naměřenému Gauguet et al.

seg-9955b1b1c018 = Výkon kvantových inerciálních senzorů je MODELLED, nikoli ověřen proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Stránka rodiny: <a1>Inerciální, fúzní a kvantové senzory</a1>

seg-496b17a8d3b9 = Tematická stránka: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Tematická stránka: <a1>QUANTUM.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Neposkytuje se — pouze modely výkonu; hardware se studenými atomy a hodinami je záležitostí partnera. Orákulum (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Jeden reprodukovatelný objekt TradeEvidence (pevný rámec: scénář+seed+engine; společné hodnoty kvantový-vs-klasický pro každý ukazatel kvality s polaritně správným přínosem, volitelné { "95" }%. Orákulum (InternalConsistency): Identity uzavřeného tvaru pro přínos/vítěze a věrný obal stávajícího quantum_trade::TradeResult; poctivost svázaná s registrem reprezentativnosti a štítky ověření

seg-eb75c6a4dcec = Důkazy z obchodního srovnání kvantového a klasického přístupu (společný tvar) jsou MODELLED, nikoli ověřené: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-bfbcc7e8f620 = Zdroj: <c1/>

seg-cfa59601df4a = <c1/> (druh scénáře)

seg-790fbfdd80f0 = Kvantová navigace bez GNSS, stav MODELLED: během výpadku GNSS rozpočet kvantové (studený atomový interferometr) inerciální navigace oproti klasickému INS navigační třídy — růst chyby polohy při dobíhání, holdover k prahu polohy a obchodní srovnání kvantového a klasického přístupu jako otevřené TradeEvidence s reprezentativností. Otevřená poznámka k pozorovatelnosti: bez vnější opravy je zkreslení akcelerometru nepozorovatelné, takže chyba roste; kvantové čidlo tuto mezeru zpomaluje, ale neuzavírá. Ilustrativní parametry zařízení z veřejných zdrojů; modeluje třídu, žádné TRL/let/certifikace.

seg-dd74f248373d = Jeden běh <c1/> se shrnuje takto: quantum-gnss-free-nav | výpadek 300s | chyba polohy kvantový { "0.00" } m oproti klasickému { "37.31" } m (8289.5x) | holdover kvantový 44721s oproti klasickému 534s (práh { "100" } m) | obchodní srovnání vítězí kvantový 2/2 | MODELLED

seg-960491d74173 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>

seg-88d9dfe0353a = Příklad <c1/> mimo jiné nastavuje:

seg-1bdbf1a737b2 = Graf, který engine zapisuje pro scenarios/quantum-gnss-free-nav.toml, druh quantum-gnss-free-nav

seg-d196391dcf4f = <b>MODELLED</b> Kvantová (studený atomový interferometr) oproti klasické navigaci INS navigační třídy metodou dead-reckoning při výpadku GNSS: růst chyby polohy, holdover k prahu polohy,. Orákulum (InternalConsistency): Znovu použité inerciální rozpočty křížově zkontrolované proti nezávislé dvojité integraci téhož ODE dead-reckoningu v Octave (jiný runtime, sdílený model → ReferenceImpl) plus publikovaný krátkodobý šum Freier-2016 jako jednostranná kotva; kvantové-vs-klasické složené srovnání zůstává MODELLED

seg-af35cccc4e2c = Kvantová navigace bez GNSS, stav MODELLED: během výpadku GNSS rozpočet kvantové (studený atomový interferometr) inerciální navigace oproti klasickému INS navigační třídy — růst chyby polohy při dobíhání, holdover k prahu polohy a obchodní srovnání kvantového a klasického přístupu jako otevřené TradeEvidence s reprezentativností. (katalog druhů (<c1/>))

seg-9b9ce7600ffc = Kvantová navigace bez GNSS — kvantová (studený atomový interferometr) oproti klasické navigaci INS navigační třídy metodou dead-reckoning při výpadku GNSS. MODELLED; ilustrativní parametry zařízení z veřejných zdrojů; modeluje třídu, žádné tvrzení o TRL ani letu. (komentář v souboru scénáře, řádky { "1" } až { "3" })

seg-9d67411151e3 = Kvantová navigace bez GNSS je MODELLED, nikoli ověřená: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e1d502e1ed6d = <s1>Předchozí</s1>quantum-anomaly-detect

seg-1f3705925b3c = <s1>Další</s1>quantum-time-transfer

seg-a349aa76b0ed = PARTNER
