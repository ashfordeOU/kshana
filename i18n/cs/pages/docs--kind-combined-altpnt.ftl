# docs--kind-combined-altpnt: translations (cs)

seg-a83b25413fd8 = Zdroj: <c1/>

seg-92b24377c9be = <c1/> (druh scénáře)

seg-216efc4e6fba = Druh scénáře enginu v{ $version }, rodina <a1>Alternativní PNT bez GPS</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-f496b7f4c63a = Kombinovaný gravitační + magnetický + terénní navigátor bez GPS: tři skalární polní kanály sloučené v každém bodu trasy pro ostřejší (s nižší mezí CRLB) určení driftu než kterékoli jednotlivé pole.

seg-670730bd221e = Jeden běh <c1/> se shrnuje takto: combined-altpnt | drift volné inerciální navigace { "70659" } m | gravitace { "464" } m magnetismus { "782" } m terén { "368" } m | SLOUČENO { "365" } m

seg-cf6981466329 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-078f09d100fa = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-557db767b9c3 = Příklad <c1/> mimo jiné nastavuje:

seg-df8d5e07e737 = mGal

seg-498b1aea3770 = Graf, který engine zapisuje pro scenarios/combined-altpnt.toml, druh combined-altpnt

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-0df60ac6343f = <b>MODELLED</b> Porovnávání s gravitační mapou, navigace podle terénu (TERCOM/SITAN), magnetická anomálie. Oracle (InternalConsistency): koeficienty IGRF-14; CRLB signálově přizpůsobeného filtru z prvních principů. Pole v gravitačním benchmarku se skutečným polem je zkontrolováno externě (řádek 'Gravity-anomaly synthesis from a spherical-harmonic model'), ale jeho navigační výsledek nemá žádné vnější orákulum

seg-d776abd5691c = Alternativní / doplňkové PNT je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Stránka rodiny: <a1>Alternativní PNT bez GPS</a1>

seg-49efcd2ced81 = <s1>Předchozí</s1>clock

seg-f2ccea3bb03e = <s1>Další</s1>conflict-resilience
