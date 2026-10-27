# docs--kind-lunar-beacon: translations (cs)

seg-3c4e3d725bb6 = Zdroj: <c1/>

seg-5e402fc935cb = <c1/> (druh scénáře)

seg-142ad48fe422 = Rozšíření lunární orbitální navigační služby o povrchové majáky jako spustitelná tabulka před/po. Uživatel u jižního pólu vidí řídkou orbitální sestavu v úzké části oblohy, takže geometrie měření vzdálenosti je špatně podmíněná; několik ZAMĚŘENÝCH POVRCHOVÝCH MAJÁKŮ dodá řádky přímé viditelnosti s nízkou elevací a širokým azimutem, které sestava celá nad hlavou postrádá, a horizontální faktor DOP (zhoršení přesnosti) se zhroutí. Scénář uvádí tři konfigurace v jedné epoše — samotné družice, družice plus viditelné majáky a větší konstelaci jako alternativní cestu ke stejné geometrii — každou s počty viditelných zdrojů, úplným DOP a dosaženou přesností 1 sigma v METRECH, získanou vynásobením ekvivalentní chybou měření vzdálenosti uživatele na maják, sestavenou jako odmocnina součtu čtverců členů synchronizace hodin, vícecestného šíření a zaměření. Viditelnost majáků je geometrický horizont dvou výšek na Měsíci bez atmosféry (bez atmosféry, takže mez je přesná) a sestavení DOP je totéž jádro, křížově ověřené proti gnss_lib_py v tests/dop_reference.rs. PROČ TENTO DRUH EXISTUJE: modul za ním je v enginu a od L08/L09 je kontrolován nezávislou cestou DOP, ale nebyl dosažitelný z běhu — žádný druh, žádná větev dispečera, žádný přibalený soubor. README tuto schopnost inzerovalo a verifikační matice pro ni neměla ŽÁDNÝ řádek, takže byla současně tvrzena v textu a netvrzena v registru, a přitom v enginu nedosažitelná. Výchozí hodnoty jsou geometrie, která již nese uložený golden (uživatel na -80 deg s anténou { "2" } m, tři majáky na -80/0, -79/+{ "60" } a -79/-60 ve výšce { "2" } km, ilustrativní šestisatelitní snímek LCNS při t={ "0" }, maska { "5" } deg), takže holý běh reprodukuje tabulku, kterou již orákulum pokrývá, místo aby vymýšlel nová čísla. MODELLED: návrh konstelace, rozmístění majáků a každá velikost rozpočtu chyb jsou ilustrativní vstupy, nikoli nasazené zaměření ani změřený spoj; externě zakotveny jsou jen aritmetika DOP, uzavřený tvar horizontu a vztah sigma = DOP x sigma_URE. Nejde o závazek výkonnosti služby.

seg-22ea11fcf367 = Jeden běh <c1/> se shrne takto: Lunar surface-beacon augmentation — maska { "5.0" } deg, epocha +{ "0" } s, sigma_URE na maják { "1.1576" } m { "6" } družic, bez majáků sats { "5" } beacons { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } dosažená 1 sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } družic + { "1" } viditelných majáků sats { "5" } beacons { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } dosažená 1 sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } družic, bez majáků sats { "19" } beacons { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } dosažená 1 sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m majáky zlepšují PDOP 2.355x; větší konstelace místo toho 4.002x MODELLED: konstelace, rozmístění majáků a rozpočet chyb jsou ilustrativní vstupy. Jádro DOP pod tím je ověřené proti gnss_lib_py a horizont majáků je uzavřený tvar L01.

seg-25522022cf9a = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-acfef3f325e4 = Příklad <c1/> mimo jiné nastavuje:

seg-a53e353706f6 = Graf, který engine zapisuje pro scenarios/lunar-beacon.toml, druh lunar-beacon

seg-89e2f6bb2540 = <b>MODELLED</b> Zhoršení přesnosti zlepšené majáky pro lunárního povrchového uživatele: řádky přímé viditelnosti viditelných družic a řádky měření vzdálenosti viditelných povrchových majáků jsou spojeny do jedné návrhové matice a vyhodnoceny přes sdílené jádro DOP, a t Testy: <a1>validate_p2_beacon_before_after_table.rs</a1>.

seg-654a3554b1e3 = <b>MODELLED</b> Zhoršení přesnosti zlepšené majáky pro lunárního povrchového uživatele: řádky přímé viditelnosti viditelných družic a řádky měření vzdálenosti viditelných povrchových majáků jsou spojeny. Orákulum (ReferenceImpl): Aritmetika DOP je jádro crate::orbit::dop, samostatně externě ověřené proti gnss_lib_py v tests/dop_reference.rs; tento řádek si status onoho řádku znovu nepůjčuje. Horizont viditelnosti majáků je uzavřený tvar L01 a sigma = DOP x sigma_URE je standardní vztah GNSS (Kaplan and Hegarty, Understanding GPS/GNSS, section { "7" }). V rámci tohoto řádku je samotné rozšíření kontrolováno proti nezávislé

seg-4d1fc06e907b = MODELLED: návrh konstelace, rozmístění majáků a každá velikost rozpočtu chyb jsou ilustrativní vstupy, nikoli nasazené zaměření ani změřený spoj; externě zakotveny jsou jen aritmetika DOP, uzavřený tvar horizontu a vztah sigma = DOP x sigma_URE. (katalog druhů (<c1/>))

seg-aaafed663400 = CO JE ZAKOTVENO A CO NENÍ Zakotveno: sestavení DOP je jádro křížově ověřené proti gnss_lib_py v tests/dop_reference.rs; viditelnost majáků je uzavřený tvar geometrického horizontu dvou výšek na Měsíci bez atmosféry (bez atmosféry, takže neexistuje refrakční prodloužení a mez je přesná); a sigma = DOP x sigma_URE je standardní vztah (Kaplan & Hegarty, Understanding GPS/GNSS, section { "7" }). NEZAKOTVENO — MODELL (komentář v souboru scénáře, řádky { "40" } až { "49" })

seg-2516c4208769 = Rozšíření DOP lunárními povrchovými majáky je MODELLED, nikoli ověřené: je kontrolováno proti samostatné implementaci ve stejné kódové základně — nezávislé na testované jednotce, ale není externě autoritativní. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-ebb9724de60a = <s1>Předchozí</s1>lunar-attack-surface

seg-ca9b68783354 = <s1>Další</s1>lunar-differential-pnt

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>
