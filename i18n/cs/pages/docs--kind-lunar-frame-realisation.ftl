# docs--kind-lunar-frame-realisation: translations (cs)

seg-49f323360dc3 = <b>VALIDATED</b> Fit 7parametrového Helmertova datumu + vazba orientace ICRF ze sítě bodů. Orákulum (ExternalDataset): Nezávislý řešič podobnostní transformace váženou metodou Umeyama (Horn) v uzavřeném tvaru (založený na SVD v numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — jiný algoritmus než iterativní Gaussův–Newtonův fit v kshana, který dosahuje téhož jednoznačně definovaného optima vážených nejmenších čtverců na bajtově shodných sítích bodů

seg-0225ace73ba8 = Zdroj: <c1/>

seg-a092c5795651 = <c1/> (druh scénáře)

seg-0c4c119abfca = Modelovaná realizace lunárního referenčního rámce: fit 7parametrového Helmertova (podobnostního) datumu — { "3" } translace, { "3" } rotace malého úhlu, { "1" } měřítko — který váženými nejmenšími čtverci (crate::batch_ls::gauss_newton) váže odhadovanou množinu souřadnic bodů MCMF odvozených ze selenografických na datum, plus jednoduchou vazbu orientace vyjadřující realizovanou malou rotaci kolem os ICRF vzhledem k orientaci tělesa IAU { "2015" } WGCCRE. Scénář vloží známou malou transformaci (translace ~desítky m, rotace ~µrad, měřítko ~{ "1e-7" }) do dobře rozprostřené syntetické sítě bodů, přidá seedovaný gaussovský šum, obnoví datum a uvádí obnovenou transformaci, chybu obnovy každého parametru vůči vložené pravdě a zbytkové RMS po fitu. MODELLED vnitřní konzistence — obnovuje vloženou podobnostní transformaci (bez šumu přibližně na strojovou přesnost), NENÍ to realizace vůči reálným datům sledování/VLBI; deterministické (seedované); bez TRL/heritage/podpory agentury.

seg-32d5e2749e64 = Jeden běh <c1/> se shrne takto: lunar-frame-realisation | { "8" } bodů | chyba translace { "3.125e-1" } m, chyba rotace { "3.418e-7" } rad, chyba měřítka -5.891e2 ppb | rms reziduum { "0.887" } m | converged false

seg-e732d2c2ab91 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-29f85024974b = Příklad <c1/> mimo jiné nastavuje:

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-f3a6d69d0225 = Graf, který engine zapisuje pro scenarios/lunar-frame-realisation.toml, druh lunar-frame-realisation

seg-f99a78efa965 = MODELLED vnitřní konzistence — obnovuje vloženou podobnostní transformaci (bez šumu přibližně na strojovou přesnost), NENÍ to realizace vůči reálným datům sledování/VLBI; deterministické (seedované); bez TRL/heritage/podpory agentury. (katalog druhů (<c1/>))

seg-238cea087ae0 = Čestnost: MODELLED vnitřní konzistence. Orákulum je obnova vložené 7parametrové podobnostní transformace (bez šumu přibližně na strojovou přesnost) plus algebraická identita zpětné cesty apply_helmert. NENÍ to realizace lunárního referenčního rámce vůči reálným datům sledování / VLBI a netvrdí žádnou absolutní přesnost rámce. Deterministické (seedované). Netvrdí se žádné TRL, letové heritage ani podpora agentury. (komentář v souboru scénáře, řádky { "23" } až { "27" })

seg-07550d3d9610 = <s1>Předchozí</s1>lunar-frame-campaign

seg-5a3a7120aae2 = <s1>Další</s1>lunar-infrastructure

seg-98151954f217 = false

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.
