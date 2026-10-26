# docs--kind-space-weather: translations (cs)

seg-37d29d8303fe = km

seg-8e845ce908ee = Druh scénáře enginu v{ $version }, rodina <a1>Měření GNSS, určování polohy a integrita</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-f6b7ca020692 = Stránka rodiny: <a1>Měření GNSS, určování polohy a integrita</a1>

seg-95f8bd8e0078 = Zdroj: <c1/>

seg-24c21b5b0cc3 = <c1/> (druh scénáře)

seg-5f25c5b71f0c = Model prostředí kosmického počasí: indexy sluneční (F10.7/F10.7a) a geomagnetické (Kp, s definiční tabulkou Kp↔ap) aktivity, jimi řízená exosférická teplota podle Jacchii-1971 (ověřená proti publikovaným hodnotám pro sluneční minimum/průměr/maximum) a termosférická neutrální hustota podle Jacchii-1971 při denně středované exosférické teplotě oproti statickému profilu bez vlivu aktivity ve sadě výšek — závislost hustoty na slunečním cyklu, kterou statická atmosféra vynechává. MODELLED: hustota souhlasí s hustotami odvozenými z akcelerometrů (TOLEOS CHAMP a GRACE) v rozmezí faktoru { "2" } při slunečním maximu, ale je asi 1.7x příliš hustá v slunečním minimu v roce { "2008" }.

seg-f2c2860db799 = Jeden běh <c1/> se shrnuje takto: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; hustota x1.49 ve { "300" } km (MODELLED)

seg-6bb05c41eba2 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>

seg-c367f1aacd0b = Příklad <c1/> mimo jiné nastavuje:

seg-02dc0d42fb21 = sfu

seg-1dd966268e12 = { "2" } nT

seg-d245f215f331 = Popisek výsledku (z enginu): MODELLED — sluneční/geomagnetické indexy, exosférická teplota Jacchia-71 a statická hustota Jacchia-71 při denně středované teplotě

seg-c1c6f2f73fb5 = Graf, který engine zapisuje pro scenarios/space-weather.toml, druh space-weather

seg-15587da59e8e = <b>MODELLED</b> Sluneční/geomagnetické indexy (definiční tabulka Kp↔ap), exosférická teplota Jacchia-1971 a termosférická hustota Jacchia { "1971" } (SAO Special Report { "332" }: statické difuzní profily reprodukující jeho tabulku { "7" }, s denní, geomagne

seg-f8eef6eabfb2 = <b>MODELLED</b> Sluneční/geomagnetické indexy (definiční tabulka Kp↔ap), exosférická teplota Jacchia-1971 a termosférická hustota Jacchia { "1971" } (SAO Special Report { "33" }. Orákulum (ExternalDataset): Definiční tabulka Kp↔ap + exosférická teplota Jacchia-1971 v uzavřeném tvaru (shoda na <{ "1" } K proti publikovaným kotvám, tests/space_weather_reference.rs); hustota je charakterizována proti pymsis NRLMSISE-00 (nezávislý model NRL): kolísání ve výšce { "800" } km v rámci slunečního cyklu je 10.4x oproti 13.6x u NRLMSISE-00. Revize { "0.30" }: kalibrovaný aktivitní faktor prvního řádu byl nahrazen Jacchiou { "1971" } (hustota výchozího scénáře při { "40" }

seg-72979b637644 = MODELLED — sluneční/geomagnetické indexy, exosférická teplota Jacchia-71 a statická hustota Jacchia-71 při denně středované teplotě (výsledek <c1/>)

seg-0306ee022298 = MODELLED: hustota souhlasí s hustotami odvozenými z akcelerometrů (TOLEOS CHAMP a GRACE) v rozmezí faktoru { "2" } při slunečním maximu, ale je asi 1.7x příliš hustá v slunečním minimu v roce { "2008" }. (katalog druhů (<c1/>))

seg-b86a312077b5 = ČESTNÝ ROZSAH: MODELLED. Převod Kp<->ap je definiční tabulka IAGA a exosférická teplota je ověřena proti publikovaným hodnotám pro sluneční minimum/průměr/maximum, ale korekce hustoty je KALIBROVANÁ vazba výškové stupnice PRVNÍHO ŘÁDU — zachycuje správné znaménko, monotónnost a řád velikosti, NIKOLI absolutní přesnost atmosféry ověřené na datech (NRLMSISE-00). Spuštění: kshana scenarios/space-weath (komentář v souboru scénáře, řádky { "10" } až { "15" })

seg-10cf16c12a2a = Prostředí kosmického počasí a termosférická hustota řízená aktivitou jsou MODELLED, nikoli ověřené: dílčí tvrzení je externě zkontrolováno, ale celá schopnost skládá dohromady modelované části, takže schopnost zůstává v kategorii vypočtené z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-3dd29f8fba14 = <s1>Předchozí</s1>space-packet

seg-ff9d9a41692b = <s1>Další</s1>spectrum
