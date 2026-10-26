# docs--kind-gnss-ins: translations (cs)

seg-b054c73f22e5 = žádná hodnota

seg-ee7dd15019d0 = Tematická stránka: <a1>CAMPAIGNS.md</a1>

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-7b2721b7588d = Druh scénáře enginu v{ $version }, rodina <a1>Inerciální, fúzní a kvantové senzory</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr s atomovým interferometrem se studenými atomy z prvních principů (k_eff·T², QPN). Oracle (ExternalDataset): Číselné vektory z primárních prací o CAI (Cheinet { "2008" }, přenosová funkce; Peters/Freier, citlivost): k_eff·T² přesně shodné, ASD výstřelového šumu jednostranné dno do ~{ "2" }× od každého zveřejněného přístroje (skutečná zařízení nesou technický šum nad kvantovým dnem). Rozmezí, nikoli shoda. { "0.30" } kolo { "2" } (předregistrováno fcb9ac64), zjištění (zůstává MODELLED): rotační šum jen od QPN proti naměřenému Gauguet et al.

seg-9955b1b1c018 = Výkon kvantových inerciálních senzorů je MODELLED, nikoli ověřen proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Stránka rodiny: <a1>Inerciální, fúzní a kvantové senzory</a1>

seg-fd8fad481c81 = Zdroj: <c1/>

seg-e726a6d74d81 = <c1/> (druh scénáře)

seg-38df285a3f25 = Volně a těsně vázaný EKF stavu chyb GNSS/INS.

seg-e1e235215947 = Jeden běh <c1/> se shrnuje takto: scénář c55a6246bd6f | gnss-ins | kvantový RMS při výpadku sloučený 1.9m oproti volnému 130.7m (holdover 60s, dostupnost { "1.00" }) | klasický sloučený 3.1m oproti volnému 314.3m (holdover 60s, dostupnost { "1.00" })

seg-e3112eac77af = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-6c128eb60a91 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-79c75d3e461d = Příklad <c1/> mimo jiné nastavuje:

seg-ca448daf5ec7 = nominal

seg-49f2fa051719 = denied

seg-327a2c4885bd = Inerciální jednotka MEMS/křemen taktické třídy: větší zbytkový bi

seg-d1beb62cf742 = { "6" } přibalených scénářů používá tento druh; ostatní jsou v <a1><c1/></a1>.

seg-7d993b676006 = Graf, který engine zapisuje pro scenarios/gnss-ins.toml, druh gnss-ins

seg-ea4498cc0324 = <b>VALIDATED</b> 15stavový EKF chybového stavu, volně vázaný (ověřeno proti nezávislé vnější referenci na skutečné jízdě s IMU/GNSS oproti NaveGo); těsně vázaný UKF pseudovzdálenost/Doppler a vázaný clock+pos. Orákulum (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, spouštěné jako nástroj pod GNU Octave, nikdy nelinkované): jeho volně vázaný ins_gnss na vlastní skutečné jízdě pozemního vozidla s Ekinox IMU/GNSS, obě řešení hodnocena proti referenční trajektorii Ekinox. Oba filtry čtou stejný vstup float32 o { "20" } Hz a konfigurace Kshany je mechanicky převedena z publikovaných parametrů datové sady. Horizontální a vertikální RMS polohy Kshany a její

seg-742a29ca1fb7 = Tematická stránka: <a1>TEST-BENCH.md</a1>

seg-f3cc3d82aba8 = <s1>Předchozí</s1>fusion

seg-af503aa1d900 = <s1>Další</s1>gnss-sim
