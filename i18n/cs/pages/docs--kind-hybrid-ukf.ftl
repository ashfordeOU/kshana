# docs--kind-hybrid-ukf: translations (cs)

seg-debc2f07db78 = true

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-7b2721b7588d = Druh scénáře enginu v{ $version }, rodina <a1>Inerciální, fúzní a kvantové senzory</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr s atomovým interferometrem se studenými atomy z prvních principů (k_eff·T², QPN). Oracle (ExternalDataset): Číselné vektory z primárních prací o CAI (Cheinet { "2008" }, přenosová funkce; Peters/Freier, citlivost): k_eff·T² přesně shodné, ASD výstřelového šumu jednostranné dno do ~{ "2" }× od každého zveřejněného přístroje (skutečná zařízení nesou technický šum nad kvantovým dnem). Rozmezí, nikoli shoda. { "0.30" } kolo { "2" } (předregistrováno fcb9ac64), zjištění (zůstává MODELLED): rotační šum jen od QPN proti naměřenému Gauguet et al.

seg-9955b1b1c018 = Výkon kvantových inerciálních senzorů je MODELLED, nikoli ověřen proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Stránka rodiny: <a1>Inerciální, fúzní a kvantové senzory</a1>

seg-ea4498cc0324 = <b>VALIDATED</b> 15stavový EKF chybového stavu, volně vázaný (ověřeno proti nezávislé vnější referenci na skutečné jízdě s IMU/GNSS oproti NaveGo); těsně vázaný UKF pseudovzdálenost/Doppler a vázaný clock+pos. Orákulum (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, spouštěné jako nástroj pod GNU Octave, nikdy nelinkované): jeho volně vázaný ins_gnss na vlastní skutečné jízdě pozemního vozidla s Ekinox IMU/GNSS, obě řešení hodnocena proti referenční trajektorii Ekinox. Oba filtry čtou stejný vstup float32 o { "20" } Hz a konfigurace Kshany je mechanicky převedena z publikovaných parametrů datové sady. Horizontální a vertikální RMS polohy Kshany a její

seg-4b84d9846715 = Zdroj: <c1/>

seg-d8da1a3f1798 = <c1/> (druh scénáře)

seg-c6edf89eb8d4 = 17stavový hybridní kvantově-klasický těsně vázaný UKF GNSS/INS (MODELLED): { "15" } chybových stavů INS + korekce biasu akcelerace odvozená z CAI + 2stavové hodiny (fáze + frekvence) z enginu hodin s parametry q, řízené ohraničeným chybovým modelem CAI. Ukazatelem kvality je vlastní konzistence filtru (NEES + bělost inovací proti mezím χ²) – tvrzení o vlastní konzistenci, NIKOLI záruka přesnosti v reálném světě. Pouze simulace; žádné TRL>{ "3" }, žádná letová historie, žádná externí validace.

seg-d43a562eb9c2 = Jeden běh <c1/> se shrnuje takto: scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

seg-be1b25b8551d = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-139800576fb7 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-40773fa1ab5f = Příklad <c1/> mimo jiné nastavuje:

seg-5e9c8b22ed24 = Interferometrický akcelerometr se studenými atomy (Rb-87 D2); ohraniče

seg-4c8e2caeba5b = Třída ultrastabilního/optického palubního oscilátoru, white-FM sigm

seg-2968660fa880 = Graf, který engine zapisuje pro scenarios/hybrid-ukf.toml, druh hybrid-ukf

seg-5719161d0b2a = <b>MODELLED</b> Ohraničený (nejlepší/nominální/konzervativní) výkon interferometru se studenými atomy – nestabilita biasu, náhodná procházka rychlosti/úhlu, stabilita měřítkového faktoru, interrogace. Orákulum (InternalConsistency): Vnitřní konzistence: citované ohraničení VRW zkontrolováno proti fyzice CaiAccelerometer::accel_asd + surový dynamický rozsah vypočtený z meze nejednoznačnosti proužků; čísla jsou ohraničení z přehledu literatury MODELLED (needs_source_confirmation), žádné zařízení není ověřeno proti nezávislé vnější referenci, žádné validační halo

seg-8632967dc5f8 = MODELLED SIMULACE. Vlastní konzistence filtru (NEES + bělost inovací) při ohraničených vstupech šumu CAI a hodin – tvrzení o vlastní konzistenci, NIKOLI záruka přesnosti v reálném světě. Nejde o terénní ani letové výsledky; žádné TRL>{ "3" }, žádná letová historie, žádná externí validace. Hardware CAI vlastní partner. (výsledek <c1/>)

seg-e55c8e2bc619 = 17stavový hybridní kvantově-klasický těsně vázaný UKF GNSS/INS (MODELLED): { "15" } chybových stavů INS + korekce biasu akcelerace odvozená z CAI + 2stavové hodiny (fáze + frekvence) z enginu hodin s parametry q, řízené ohraničeným chybovým modelem CAI. (katalog druhů (<c1/>))

seg-b06538ca3a8c = 17stavový hybridní kvantově-klasický těsně vázaný UKF GNSS/INS (MODELLED). (komentář v souboru scénáře, řádek { "1" })

seg-b5fc96916b4e = UKAZATEL KVALITY — vlastní konzistence filtru (NEES + bělost inovací), jediné, co může simulace o estimátoru poctivě tvrdit. Na souboru Monte Carlo, jehož pravda je generována přesně ze šumu, který filtr předpokládá, se sdružené průměry NIS (bělost) a NEES musí dostat do svých { "95" }% pásem chí-kvadrát. Jde o tvrzení o VLASTNÍ KONZISTENCI, NIKOLI o záruku přesnosti v reálném světě. (komentář v souboru scénáře, řádky { "21" } až { "25" })

seg-91afdc2d3ee2 = ÚPRIMNOST: vše zde je MODELLED / SIMULACE. Vstupy CAI a hodin jsou ohraničené hodnoty reprezentativní podle literatury, nikoli změřený hardware; hardware CAI a jeho klíčová osoba zůstávají ve vlastnictví partnera. Žádné TRL>{ "3" }, žádná letová historie, žádná externí validace. (komentář v souboru scénáře, řádky { "27" } až { "29" })

seg-9b94bd3ce7df = Seedy Monte Carlo, přes které orákulum konzistence sdružuje, a násobiče rozladění filtru. { "24" } seedů dává pásma NEES chí-kvadrát založená na bězích ({ "8" }*{ "24" } DOF), dost těsná na to, aby rozlišila vyladěný filtr od rozladěného, a přitom levný běh. Nastavte q_factor / r_factor mimo { "1.0" }, filtr rozladíte a uvidíte, jak ho brána konzistence odmítne (q_factor škáluje předpokládaný procesní šum, r_factor předpokládaný šum měř (komentář v souboru scénáře, řádky { "44" } až { "48" })

seg-496b17a8d3b9 = Tematická stránka: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Tematická stránka: <a1>QUANTUM.md</a1>

seg-963425965e64 = <s1>Předchozí</s1>hybrid-optical-rf

seg-437eb2e463b3 = <s1>Další</s1>hybrid
