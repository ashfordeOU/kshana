# docs--kind-terrain-nav: translations (cs)

seg-216efc4e6fba = Druh scénáře enginu v{ $version }, rodina <a1>Alternativní PNT bez GPS</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-0df60ac6343f = <b>MODELLED</b> Porovnávání s gravitační mapou, navigace podle terénu (TERCOM/SITAN), magnetická anomálie. Oracle (InternalConsistency): koeficienty IGRF-14; CRLB signálově přizpůsobeného filtru z prvních principů. Pole v gravitačním benchmarku se skutečným polem je zkontrolováno externě (řádek 'Gravity-anomaly synthesis from a spherical-harmonic model'), ale jeho navigační výsledek nemá žádné vnější orákulum

seg-d776abd5691c = Alternativní / doplňkové PNT je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Stránka rodiny: <a1>Alternativní PNT bez GPS</a1>

seg-1d36a7dc3fd0 = Zdroj: <c1/>

seg-7bfd6d049799 = <c1/> (druh scénáře)

seg-0d7bf5a4f07e = Navigace podle terénu bez GPS (TERCOM/SITAN): radarový/barometrický výškoměr porovnává profil výšky terénu s DEM ve stylu SRTM, aby odstranil drift INS.

seg-54690375328b = Jeden běh <c1/> se shrnuje takto: terrain-nav | drift volné inerciální navigace { "70659" } m | podle terénu { "53" } m (1342násobné snížení) | sigma shody { "17.0" } m

seg-db286a072e43 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-efc57f43bd6f = Volitelná pole: <c1/>, <c2/>, <c3/>

seg-96e3607379e0 = Příklad <c1/> mimo jiné nastavuje:

seg-c5e33c7122e2 = Graf, který engine zapisuje pro scenarios/terrain-nav.toml, druh terrain-nav

seg-0fcad0016c78 = <s1>Předchozí</s1>telecom-timing

seg-fa50992f818f = <s1>Další</s1>terrain-slam

seg-e66e2ca31e54 = Stránka tématu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-d5da9ee3c152 = <b>MODELLED</b> Druh a fáze <c1/>: pětistavový model inerciální chyby pro každou osu (poloha, rychlost, bias akcelerometru, náklon, bias gyroskopu) při motorickém sestupu, podporovaný určeními AFS (samostatně nebo diferenciálně, s podporou hodin při třech relé
