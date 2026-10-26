# docs--kind-quantum-trade: translations (cs)

seg-debc2f07db78 = true

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-7b2721b7588d = Druh scénáře enginu v{ $version }, rodina <a1>Inerciální, fúzní a kvantové senzory</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-f7f12029e0ec = Stránka rodiny: <a1>Inerciální, fúzní a kvantové senzory</a1>

seg-496b17a8d3b9 = Tematická stránka: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Neposkytuje se — pouze modely výkonu; hardware se studenými atomy a hodinami je záležitostí partnera. Orákulum (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-51cac2f918e0 = Tematická stránka: <a1>POSITIONING.md</a1>

seg-3a8c76a2396f = Zdroj: <c1/>

seg-f9af2813532e = <c1/> (druh scénáře)

seg-eb55d253dd11 = Obchodní srovnání kvantového a klasického PNT ({ "13503" }): přínos kandidátských hodin v holdoveru času a inerciálním holdoveru (křivka naměřené ADEV — opěrný bod obhajitelnosti — nebo třída kvantových hodin) oproti třídě klasického základu, s výhradou o předpokladu dlouhé podlahy tau uvedenou na výstupu, plus obálka odolnosti vůči času při odepření GNSS. MODELLED; kvantifikuje (nikdy neověřuje) zařízení partnera. Kandidátské hodiny jsou naměřená křivka (<c1/> + <c2/>, stejné délky, alespoň { "2" } body; vítězí, jsou-li zadány obě formy) nebo <c3/>.

seg-4f470bc1d82c = Jeden běh <c1/> se shrnuje takto: quantum-trade | kandidát naměřená ADEV | holdover času 2621947s oproti 203s (12943.62x) | inerciální 14108s oproti 378s (37.34x) | dobíhání odolnosti 14108s | MODELLED [s výhradou o předpokládané podlaze]

seg-2639560aeff2 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>

seg-d66f1ef84201 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>

seg-f2cc0830b53f = Příklad <c1/> mimo jiné nastavuje:

seg-ee5bcbbe0167 = csac

seg-a6551a61cf69 = klasický základ

seg-f5fa445702c6 = Popisek výsledku (z enginu): MODELLED — kvantifikuje (nikdy neověřuje) hodiny/čidlo partnera; nebylo prokázáno za letu

seg-c74c63ffd859 = Graf, který engine zapisuje pro scenarios/quantum-trade.toml, druh quantum-trade

seg-93310aaa6ead = <b>VALIDATED</b> Obnova mocninného zákona (bílý FM + podlaha červeného šumu) metodou NNLS z publikované naměřené Allanovy odchylky přechodu optických hodin ⁸⁸Sr — reprodukuje σ_y(τ) a hlavní škálování 4.7e-16/√τ pro krátké τ se skutečnou naměřenou podlahou dlouhého τ, nikoli Testy: <a1>optical_clock_adev_reference.rs</a1>.

seg-fc46e95688ba = <b>VALIDATED</b> Fit NNLS naměřené ADEV, pásma konzistence χ² NEES/NIS a diskrétní kovarianční matice procesního šumu hodin podle van Loana (dobíhání v holdoveru) — výpočetní páteř obchodního enginu Testy: <a1>scipy_reference.rs</a1>.

seg-6e2b62136cef = <b>MODELLED</b> Příjem naměřené ADEV (NNLS), obchodní tabulka (holdover času/inerciální + přínos), obálka odolnosti vůči času; výhrada o podlaze uvedená na výstupu.

seg-b577b8464cf7 = <b>VALIDATED</b> Fit NNLS naměřené ADEV, pásma konzistence χ² NEES/NIS a diskrétní kovarianční matice procesního šumu hodin podle van Loana (dobíhání v holdoveru) — výpočetní páteř obchodního. Orákulum (ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q přesně, χ² <{ "5e-4" } při provozních stupních volnosti. Pouze jádra — údaje o výkonu zařízení zůstávají vypočtené z modelu (další řádek)

seg-6b8aa8cd6d3e = <b>MODELLED</b> Příjem naměřené ADEV (NNLS), obchodní tabulka (holdover času/inerciální + přínos), obálka odolnosti vůči času; výhrada o podlaze uvedená na výstupu. Spustitelné z. Orákulum (ExternalDataset): Jádro fitu naměřené ADEV→PSD (NNLS) se shoduje se scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — nezávislé externí jádro; ale ČÍSLA obchodního srovnání kvantifikují (nikdy neověřují) hodiny/CAI partnera, takže samo srovnání zůstává MODELLED, bez glorioly ověření

seg-3d678f64e41c = MODELLED — kvantifikuje (nikdy neověřuje) hodiny/čidlo partnera; nebylo prokázáno za letu (výsledek <c1/>)

seg-20ba66ae9518 = Obchodní srovnání kvantového a klasického PNT ({ "13503" }): přínos kandidátských hodin v holdoveru času a inerciálním holdoveru (křivka naměřené ADEV — opěrný bod obhajitelnosti — nebo třída kvantových hodin) oproti třídě klasického základu, s výhradou o předpokladu dlouhé podlahy tau uvedenou na výstupu, plus obálka odolnosti vůči času při odepření GNSS. (katalog druhů (<c1/>))

seg-45a1d84eef18 = MODELLED; kvantifikuje (nikdy neověřuje) zařízení partnera. (katalog druhů (<c1/>))

seg-15275d27252a = Počítá přínos KANDIDÁTSKÝCH hodin oproti KLASICKÉMU základu v holdoveru času a v inerciálním holdoveru, plus obálku odolnosti vůči času při odepření GNSS. Podlaha kandidáta je určena MEASURED křivkou překrývající se ADEV hodin partnera (opěrný bod obhajitelnosti) proloženou nezáporným metodou nejmenších čtverců — rozpočet holdoveru tedy stojí na skutečných datech, nikoli na předpokládané podlaze dlouhého tau. (komentář v souboru scénáře, řádky { "3" } až { "7" })

seg-ecbdbc9b163e = ČESTNÝ ROZSAH: MODELLED — KVANTIFIKUJE přínos kvantových hodin partnera; zařízení NEOVĚŘUJE a nikdy si nepůjčuje ověřovací ostrovy SGP4/Allan/IGS. Je-li podlaha kteréhokoli řádku předpokládanou výchozí hodnotou třídy, zobrazí se na výstupu výhrada o podlaze. Spuštění: kshana scenarios/quantum-trade.toml (komentář v souboru scénáře, řádky { "9" } až { "12" })

seg-4b59ac409819 = Obchodní srovnání kvantového a klasického PNT a odolnost při odepření GNSS ({ "13503" }) je MODELLED, nikoli ověřené: dílčí tvrzení je externě zkontrolováno, ale celá schopnost skládá dohromady modelované části, takže schopnost zůstává v kategorii vypočtené z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e6498fae3ba7 = <s1>Předchozí</s1>quantum-time-transfer

seg-50d4bbb7486b = <s1>Další</s1>realtime-frame-eop
