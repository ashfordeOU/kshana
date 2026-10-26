# docs--kind-terrain-slam: translations (cs)

seg-216efc4e6fba = Druh scénáře enginu v{ $version }, rodina <a1>Alternativní PNT bez GPS</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-0df60ac6343f = <b>MODELLED</b> Porovnávání s gravitační mapou, navigace podle terénu (TERCOM/SITAN), magnetická anomálie. Oracle (InternalConsistency): koeficienty IGRF-14; CRLB signálově přizpůsobeného filtru z prvních principů. Pole v gravitačním benchmarku se skutečným polem je zkontrolováno externě (řádek 'Gravity-anomaly synthesis from a spherical-harmonic model'), ale jeho navigační výsledek nemá žádné vnější orákulum

seg-d776abd5691c = Alternativní / doplňkové PNT je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Stránka rodiny: <a1>Alternativní PNT bez GPS</a1>

seg-bb7c9c4d4b5d = Zdroj: <c1/>

seg-562e59d703e3 = <c1/> (druh scénáře)

seg-6bdc150ab25b = Sekvenční (rekurzivní) navigace podle terénu bez GPS: částicový filtr spouští měřicí model shody s terénem epochu po epoše (SITAN jako běžící filtr), takže se podél trasy sleduje časově proměnný drift INS, zatímco dávkový terrain-nav obnoví pouze jediný konstantní posun.

seg-1e4350c2c5f0 = Jeden běh <c1/> se shrnuje takto: terrain-slam | { "60" } bodů trasy | RMS volné inerciální navigace { "2947" } m (konečná { "5082" } m) | RMS podle terénu { "1241" } m (konečná { "69" } m, 2násobné snížení) | průměrné ESS 2599/4000 | sigma shody { "17.0" } m

seg-939d877137f6 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5ceb5b8597ac = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-48e022b0945e = Příklad <c1/> mimo jiné nastavuje:

seg-4aca87f022dc = Graf, který engine zapisuje pro scenarios/terrain-slam.toml, druh terrain-slam

seg-832919783819 = <s1>Předchozí</s1>terrain-nav

seg-1693abd546fe = <s1>Další</s1>time-transfer-budget
