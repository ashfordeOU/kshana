# docs--kind-hybrid-optical-rf: translations (cs)

seg-debc2f07db78 = true

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-0482fec5b0f6 = Zdroj: <c1/>

seg-830c574e871b = <c1/> (druh scénáře)

seg-72ad48275ebe = Druh scénáře enginu v{ $version }, rodina <a1>Optická PNT</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-e6839b50b560 = MODELLED heterogenní společný ukazatel kvality optické + RF PNT (P5): skládá obousměrný optický rozpočet spoje na { "1550" } nm (fotonově omezená dolní mez CRLB obousměrného měření vzdálenosti σ_τ/√N a difrakční stopa λ/D·vzdálenost), ochrannou úroveň RAIM s oddělováním řešení napříč modalitami (poloha I čas), která slučuje volné řešení RF a těsné optické řešení s rozdílnými kovariancemi, optickou dostupnost při jasné obloze pro N stanic (nezávislé sjednocení { "1" }−Π({ "1" }−a_i) a prostorově korelovaná varianta), optické↔RF předání stavu/kovariance s DOKÁZANOU bitově spojitou (bez skoku) střední hodnotou a bránou konzistence NEES χ², a společné skóre P(dostupné A ZÁROVEŇ přesné na požadované úrovni A ZÁROVEŇ se zajištěnou integritou) s ošetřením korelací. VALIDATED uzavřený tvar: dolní mez CRLB měření vzdálenosti, difrakční stopa, kvantil ochranné úrovně χ², kombinatorika sjednocení, spojitost střední hodnoty předání + brána NEES a společný nezávislý součin. MODELLED: přidělení optických ztrát, velikosti σ RF/optiky, vstupy z klimatologie oblačnosti, korelace a rozpočet P_HMI. Nejde o certifikovaný produkt dostupnosti ani integrity.

seg-30904e2367fc = Jeden běh <c1/> se shrnuje takto: hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | Ověřeno: CRLB/χ²-PL/union/handoff, vypočteno z modelu: σ/klimatologie

seg-73e5cf56c92c = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

seg-27338c8b2e5f = Příklad <c1/> mimo jiné nastavuje:

seg-7b9ce4689508 = Štítek výsledku (enginu): Heterogenní společný ukazatel kvality dostupnosti / přesnosti / integrity optické + RF PNT (P5). VALIDATED uzavřený tvar: fotonově omezená dolní mez CRLB měření vzdálenosti (σ_τ/√N) a difrakční stopa (λ/D·vzdálenost), kvantil ochranné úrovně χ² napříč modalitami, nezávislé sjednocení dostupnosti N stanic ({ "1" } − Π(

seg-5cea5229815e = Graf, který engine zapisuje pro scenarios/hybrid-optical-rf.toml, druh hybrid-optical-rf

seg-a8923a682728 = <b>MODELLED</b> Zpráva hybrid-optical-rf uvádí konfiguraci spoje, se kterou skutečně běžela (vlnová délka nosné, vysílací a přijímací apertura, vzdálenost, šířka pulzu, integrac. Orákulum (InternalConsistency): Žádné externí orákulum a žádné není možné: jde o popis sebe sama, nikoli o měření. Je zaznamenán, protože jeho absence byla chybou – P5 musel vlastní vlnovou délku nosné a vysílací aperturu přebírat z výchozích hodnot ve zdrojovém kódu a z kontroly vnitřní konzistence usuzovat, že holé <c1/> bylo ve čtverečních metrech. Usuzování bylo správné, a právě proto na tom záleželo: nic by nezachytilo, že je chybné

seg-28abb5a84eaa = <b>MODELLED</b> Zpráva hybrid-optical-rf uvádí dostupnost spoje RF, složenou z veličin, které engine už počítá, nikoli z importované klimatologie, a . Orákulum (InternalConsistency): Žádné externí orákulum a ExternalDataset je odmítnut. Dva vstupy jsou rezerva Eb/N0 a překročení prahu C/N0, obojí funkce MODELLED EIRP, ukazatele kvality a souhrnného přidělení ztrát; neexistuje žádný změřený záznam dostupnosti pro hybridní optickou/RF službu Země–Měsíc, proti kterému by se složený údaj dal zkontrolovat. Existující kontroly jsou vnitřní a jsou tak i uvedeny: složení se znovu přepočítá z

seg-888004543d37 = <b>MODELLED</b> Zpráva hybrid-optical-rf uvádí poměr přesnosti optického a RF měření vzdálenosti s JEDNOU konfigurací, při které byly obě větve vyhodnoceny, neseno ve stejném objektu: stejn. Orákulum (InternalConsistency): Žádné externí orákulum pro POMĚR a ExternalDataset je záměrně odmítnut. Podkladový řetězec RF ho však má -- tests/validate_p5_rf_ranging_precision.rs kontroluje linkbudget::link_budget a navsignal::dll_code_jitter_chips proti nezávislému fixture v Pythonu/NumPy a proti pevně zapsané řešené hodnotě Kaplana a Hegartyho ({ "2.814e-3" } chip / { "0.825" } m při { "45" } dB-Hz) -- a optická mez CRLB má vlastní uzavřený tvar, řádek

seg-db5ff373b50f = <b>MODELLED</b> Zpráva hybrid-optical-rf uvádí, co monitor chí-kvadrát napříč modalitami skutečně dokáže ZACHYTIT, nejen že projde bezporuchovým případem: minimální zachytitelné. Orákulum (InternalConsistency): Dvě vnitřní orákula, žádná externí datová sada. ({ "1" }) Zpětný průchod v uzavřeném tvaru: minimální zachytitelný bias vzniká inverzí chvostu necentrálního chí-kvadrátu na necentralitě (raim::pbias) a ověřuje se tím, že se výsledná necentralita pošle zpět přes raim::noncentral_chi2_cdf při vlastním prahu monitoru, což musí vrátit P_md. ({ "2" }) Injekce proti analýze: bias se zapíše do odhadu RF jedné osy

seg-24f31f6b353f = Heterogenní společný ukazatel kvality dostupnosti / přesnosti / integrity optické + RF PNT (P5). VALIDATED uzavřený tvar: fotonově omezená dolní mez CRLB měření vzdálenosti (σ_τ/√N) a difrakční stopa (λ/D·vzdálenost), kvantil ochranné úrovně χ² napříč modalitami, nezávislé sjednocení dostupnosti N stanic ({ "1" } − Π({ "1" }−a_i)), invariant spojitosti střední hodnoty předání optika↔RF (bitově přesně bez skoku) a brána NEES χ² a společný ukazatel kvality nezáv (výsledek <c1/>)

seg-bec90783ad8b = MODELLED heterogenní společný ukazatel kvality optické + RF PNT (P5): skládá obousměrný optický rozpočet spoje na { "1550" } nm (fotonově omezená dolní mez CRLB obousměrného měření vzdálenosti σ_τ/√N a difrakční stopa λ/D·vzdálenost), ochrannou úroveň RAIM s oddělováním řešení napříč modalitami (poloha I čas), která slučuje volné řešení RF a těsné optické řešení s rozdílnými kovariancemi, optickou dostupnost při jasné obloze pro N stanic (nezávislé sjednocení (katalog druhů (<c1/>))

seg-15abc895e477 = MODELLED: přidělení optických ztrát, velikosti σ RF/optiky, vstupy z klimatologie oblačnosti, korelace a rozpočet P_HMI. (katalog druhů (<c1/>))

seg-9fafa5ffb521 = MODELLED. Ověřené uzavřené tvary (proti nezávislé vnější referenci): dolní mez CRLB měření vzdálenosti (sigma_tau/sqrt(N)), difrakční stopa (lambda/D * range), kvantil ochranné úrovně chí-kvadrát, kombinatorika sjednocení, spojitost střední hodnoty předání + brána NEES a společný nezávislý součin. Přidělení ztrát, velikosti sigma, vstupy z klimatologie oblačnosti, korelace a rozpočet P_HMI jsou reprezentativní vstupy vypočtené z modelu. Každé pole níže je volitelné a zobrazeno s jeho (komentář v souboru scénáře, řádky { "10" } až { "14" })

seg-e5f964e5d422 = --- G15 injekce biasu / rampové poruchy proti monitoru napříč modalitami --- Minimální zachytitelný bias a křivka výkonu detekce jsou ANALYTICKÉ (inverze necentrálního chí-kvadrátu), takže nepotřebují žádné vlastní vstupy. Tyto dva pouze nastavují rychlost rampy, jejímž převodem je hlášená doba do detekce. Obojí MODELLED. (komentář v souboru scénáře, řádky { "56" } až { "59" })

seg-70f50a62aa12 = --- G17 setrvání po předání: procesní šum a překročení mezní hodnoty výstrahy --- Náhodná procházka na stávajícím 4stavovém filtru předání (východ, sever, nahoru, hodiny). Mezní hodnoty výstrahy jsou ty, které jsou již deklarovány výše; nové jsou pouze procesní šum a koeficient pokrytí. Obě PSD jsou reprezentativní vstupy MODELLED a doby překročení se s nimi přímo mění. (komentář v souboru scénáře, řádky { "63" } až { "67" })

seg-9fb4240fb0ef = Sebepopis zprávy hybridního optického/RF druhu je MODELLED, nikoli ověřen proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-a97755cb13eb = Stránka rodiny: <a1>Optická PNT</a1>

seg-1586d90cdf1b = <s1>Předchozí</s1>holdover-test

seg-211275a00df0 = <s1>Další</s1>hybrid-ukf
