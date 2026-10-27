# docs--kind-timetransfer: translations (cs)

seg-37a77f49f048 = ps

seg-c61e88721556 = Druh scénáře enginu v{ $version }, rodina <a1>Hodiny, časování a holdover</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-849c08d3ce70 = Stránka rodiny: <a1>Hodiny, časování a holdover</a1>

seg-5a70fcb097dc = Volitelná pole: žádná

seg-a1810bbca337 = <b>MODELLED</b> Obousměrný přenos/TWSTFT (Sagnac), společný pohled GNSS, PPP; jitter spoje→vzdálenost. Orákulum (ExternalDataset): Velikost Sagnacova jevu zkontrolována proti autoritativní PUBLIKOVANÉ HODNOTĚ — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), rov. { "1.29" }: obeplutí rovníku východním směrem nahromadí { "207.4" } ns (2ωA_E/c²); kshana reprodukuje { "207.386" } ns. Nezávisle potvrzeno RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), který nese stejnou geometrii 2Aω/c². Složený BIPM TWSTFT transponder/společný pohled/

seg-a8beb8dfc757 = Rozpočet chyb přenosu času je MODELLED, nikoli ověřen proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady modelované části, takže schopnost zůstává na úrovni vypočtené z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-2ccebbc74d9f = Zdroj: <c1/>

seg-289a9f8dc990 = <c1/> (druh scénáře)

seg-ccb244e60d60 = Optický oproti RF obousměrný přenos času/frekvence.

seg-59347fda6c66 = Jeden běh <c1/> se shrnuje takto: scénář 8f9c2e0e31a5 | optický sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

seg-890040dd3d96 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-7b887ea27a86 = Příklad <c1/> mimo jiné nastavuje:

seg-2485eaa6dbf4 = Obousměrný družicový přenos času a frekvence (TWSTFT, pásmo Ku

seg-fa54f1a81b57 = Optický mezidružicový spoj, synchronizace na úrovni pikosekund

seg-a30fe2b87ee2 = mm

seg-bd76bd68eab3 = Graf, který engine zapisuje pro scenarios/timetransfer.toml, druh timetransfer

seg-3c9d28692f9f = <b>MODELLED</b> Obousměrný přenos/TWSTFT (Sagnac), společný pohled GNSS, PPP; jitter spoje→vzdálenost Testy: <a1>time_transfer_error_budgeting_reference.rs</a1>.

seg-84fcf20588fb = <s1>Předchozí</s1>time-transfer-budget

seg-149ad280a1f9 = <s1>Další</s1>tracking-loop
