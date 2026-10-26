# docs--kind-passes: translations (cs)

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 downlinku podél každého přeletu jedné družice nad jednou stanicí (EIRP, ztráta ve volném prostoru, atmosférická ztráta podle kosekantového zákona, ostatní ztráty, G/T, Boltzmannova konstanta, symbolová rychlost), nejúčinnější MODCOD DVB-S2, který splňuje svůj ETSI EN { "302" } 307-

seg-72fd0321e4af = Stránka tématu: <a1>CONTACT-SCHEDULING.md</a1>

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-df90e5910fb4 = hod

seg-4636d450ef60 = <b>MODELLED</b> Jeden běh převezme plán kontaktů (seznam oken aos_s/los_s, z nichž každé požaduje po apertuře navigaci nebo komunikaci, tedy stejný slovník oken, jaký vydává <c1/>, převedený funkcí <c2/>), počet apert

seg-11e8c29ecb45 = Druh scénáře enginu v{ $version }, rodina <a1>Konstelace, pokrytí a geometrie</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-a4f1e7d2041e = Stránka rodiny: <a1>Konstelace, pokrytí a geometrie</a1>

seg-2544da673115 = Zdroj: <c1/>

seg-0db3f4e2402e = <c1/> (druh scénáře)

seg-a4bdfc291fce = Predikce přeletů nad pozemní stanicí: časová oblast viditelnostních přeletů (AOS/TCA/LOS, maximální zdánlivá elevace, trvání) kruhové oběžné dráhy, jako střední prvky SGP4 na začátku okna, nad stanicí nad maskou elevace v rámci okna, s celkovým časem přístupu. Propagace SGP4/SDP4 v zemské soustavě IAU 2006/2000A (volitelně UT1 − UTC a pohyb pólu), troposférická refrakce ITU-R P.834-9 a světelný čas při sestupném spoji (obojí ve výchozím stavu zapnuto), průsečíky řešené na { "1e-7" } s a kulminace metodou zlatého řezu. Geometrie přeletů je VALIDATED vůči Orekitu { "13.1.8" } na stanicích v úrovni moře; oběžná dráha a stanice ve scénáři jsou ilustrativní vstupy.

seg-3050cc7fdc79 = Jeden běh <c1/> se shrnuje takto: passes: { "5" } přelet(ů) oběžné dráhy { "550" } km / { "97.6" }° nad ({ "52.2" }°, { "4.4" }°) > { "10" }° za { "24" } h; celkový přístup { "1659" } s (MODELLED)

seg-699b650604d4 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-9d2941ba37e2 = Příklad <c1/> mimo jiné nastavuje:

seg-6f849331e33c = Popisek výsledku (z enginu): MODELLED — predikce přeletů nad pozemní stanicí v časové oblasti; propagace SGP4/SDP4, zemská soustava IAU 2006/2000A (UT1 = UTC, bez pohybu pólu, pokud nejsou zadány parametry orientace Země), zdánlivá elevace s refrakcí ITU-R P.834-9 a světelným časem, je-li zapnut, průsečíky a kulminace zpřesněné pod úroveň kroku

seg-a09be8c586e3 = Graf, který engine zapisuje pro scenarios/passes.toml, druh passes

seg-db35e4ebd275 = <b>VALIDATED</b> Viditelnostní přelety v časové oblasti (AOS/TCA/LOS, max. elevace, trvání) propagátoru enginu nad stanicí nad maskou elevace, s interpolovanými průsečíky vzestupu/západu a celkovým přístupem: passes::predict_passes, geometrický plánovač (bez Testy: <a1>ground_station_pass_prediction_reference.rs</a1>.

seg-6799a54acee6 = <b>VALIDATED</b> Viditelnostní přelety (AOS, TCA, LOS, maximální zdánlivá elevace, trvání) sady prvků SGP4 nad stanicí WGS-84 na ověřené dráze pro oběžné dráhy kolem Země (IAU 2006/2000A, volitelné parametry orientace Země), s troposférickou ITU-R P.834-9 Testy: <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

seg-42d4290ed718 = <b>VALIDATED</b> Viditelnostní přelety v časové oblasti (AOS/TCA/LOS, max. elevace, trvání) propagátoru enginu nad stanicí nad maskou elevace, s interpolovanými vzestupy/západy . Orákulum (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — nezávislá knihovna letové dynamiky: ElevationDetector (hledač kořenů Brent) + EventsLogger nad efemeridou ITRF, stanice jako TopocentricFrame WGS-84. AOS/LOS/max. elevace/počet přeletů/celkový přístup se shodovaly při shodné dráze+stanici+masce+okně (potvrzená fixtura; ovladač xval/orekit-passes)

seg-eb79c117f1df = MODELLED — predikce přeletů nad pozemní stanicí v časové oblasti; propagace SGP4/SDP4, zemská soustava IAU 2006/2000A (UT1 = UTC, bez pohybu pólu, pokud nejsou zadány parametry orientace Země), zdánlivá elevace s refrakcí ITU-R P.834-9 a světelným časem, je-li zapnut, průsečíky a kulminace zpřesněné pod úroveň kroku (výsledek <c1/>)

seg-a7ddc8eeaf1e = <s1>Předchozí</s1>orbit

seg-3079cfb8decc = <s1>Další</s1>pvt
