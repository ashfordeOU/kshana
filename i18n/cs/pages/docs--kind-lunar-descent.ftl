# docs--kind-lunar-descent: translations (cs)

seg-f942b36a11c4 = Zatím ne na GitHubu

seg-51362910dcb7 = { "2" } přibalené scénáře používají tento druh; ostatní jsou v <a1><c1/></a1>.

seg-98151954f217 = nepravda

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-6a26b9ab59fe = Stránka tématu: <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = diferenční

seg-2d84b341a41f = Štítek výsledku (enginu): MODELLED

seg-626ab55f0424 = MODELLED (výsledek <c1/>)

seg-e66e2ca31e54 = Stránka tématu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Zdroj: <c1/>

seg-d4df5aa9b7b0 = <c1/> (druh scénáře)

seg-2cd0d5385530 = MODELLED rozpočet rozptylu přistání pro motorický sestup na místo u jižního pólu (třída Artemis). Pro každou horizontální osu je pětistavový model inerciální chyby (poloha, rychlost, bias akcelerometru, náklon polohy, bias gyroskopu) řízen měrnou silou sestupu; sekvenční filtr přijímá polohové určení z povolených pomůcek: určení AFS z viditelných relé ILLUSTRATIVE konstelace třídy LCNS (samostatně, nebo diferenciálně s využitím rezidua korekčního spoje z lunar-differential-pnt, s podporou hodin, jsou-li viditelná jen tři relé) a určení podle terénu (porovnávač TERCOM/SITAN v crate na syntetickém reliéfu, nebo Cramérova–Raova mez porovnávání výškového okna skutečného jihopolárního DEM z LOLA). Lunární čas vstupuje přes hodiny vozidla při určeních (posun LTC-TT z lunar-time-offset nebo nejistota jeho zveřejněného pásma) a jako chyba časové značky podél dráhy. Uvádí 3sigma elipsu přistání, R95, inerciální zdroje v uzavřeném tvaru, příspěvek každé pomůcky, ablaci každé kombinace pomůcek, kalibraci elipsy metodou Monte Carlo a předávanou kovarianci. MODELLED: ilustrativní třída IMU, sada relé, profil sestupu a naváděcí člen; navigace podle terénu používá syntetický reliéf v měřítku metrů na Zemi; dostupnost AFS je jedna epocha na plochém prahu. Bez podpory agentury; software pouze poradního charakteru, nikoli certifikované navigační zařízení.

seg-c6c1a8f184ed = Jeden běh <c1/> se shrne takto: lunar-descent | -89.50 deg | pouze inerciálně 517/517 m (E/N) | s pomůckami 7.6/4.8 m | rozptyl R95 { "51" } m | 3sigma elipsa { "64" } x { "62" } m | { "99.1" }% uvnitř (očekáváno { "98.9" }%) (MODELLED)

seg-dfdb7de68515 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = Příklad <c1/> mimo jiné nastavuje:

seg-8073ece4c900 = Graf, který engine zapisuje pro scenarios/lunar-descent.toml, druh lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> Druh a fáze <c1/>: pětistavový model inerciální chyby pro každou osu (poloha, rychlost, bias akcelerometru, náklon, bias gyroskopu) při motorickém sestupu, podporovaný určeními AFS (samostatně nebo diferenciálně, s podporou hodin při třech relé

seg-bfe4c0a04288 = <b>MODELLED</b> Druh a fáze <c1/>: pětistavový model inerciální chyby pro každou osu (poloha, rychlost, bias akcelerometru, náklon, bias gyroskopu) při motorickém sestupu,. Orákulum (InternalConsistency): Inerciální drift v uzavřeném tvaru, vlastní výsledky znovu použitých druhů a kalibrace 3sigma elipsy (podíl uvnitř odpovídá očekávání) v testech. Neporovnává se žádné uskutečněné ani zkoušené přistání

seg-ed286f215c96 = MODELLED rozpočet rozptylu přistání pro motorický sestup na místo u jižního pólu (třída Artemis). (katalog druhů (<c1/>))

seg-c1bd92ba429b = MODELLED: ilustrativní třída IMU, sada relé, profil sestupu a naváděcí člen; navigace podle terénu používá syntetický reliéf v měřítku metrů na Zemi; dostupnost AFS je jedna epocha na plochém prahu. (katalog druhů (<c1/>))

seg-85714bc3cf2a = ČESTNOST: MODELLED. Třída IMU, profil sestupu, sada relé, chyba signálu v prostoru a naváděcí člen jsou ILLUSTRATIVE vstupy, nikoli měření. Režim navigace podle terénu používá samostatný syntetický reliéf a měřítko metrů na Zemi, takže člen terénu je zde chování porovnávače na zástupném reliéfu, nikoli tvrzení o jihopolárním reliéfu: varianta lola-crlb (lunar-descent-lola.toml) používá skutečný (komentář v souboru scénáře, řádky { "14" } až { "20" })

seg-3eb1b3b03600 = Rozpočet rozptylu přistání na lunárním polárním místě (<c1/>) je MODELLED, nikoli ověřen: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Předchozí</s1>lunar-beacon

seg-ca9b68783354 = <s1>Další</s1>lunar-differential-pnt
