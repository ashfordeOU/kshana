# docs--kind-slot-timing: translations (cs)

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Druh scénáře enginu v{ $version }, rodina <a1>Hodiny, časování a holdover</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-849c08d3ce70 = Stránka rodiny: <a1>Hodiny, časování a holdover</a1>

seg-09644e40e2d8 = Zdroj: <c1/>

seg-ec92d03eaa6c = <c1/> (druh scénáře)

seg-1b61962464c5 = Slot timing: počet sekund, než volně běžící hodiny opustí ochranný interval časově indexovaného směrovacího nebo úkolovacího slotu (největší absolutní časová chyba, kterou slot toleruje), příspěvek každého členu v tom okamžiku s uvedením dominantního (nejistota opravy, bílý fázový šum, bílý, flickerový, náhodné procházky a náhodného běhu frekvenční šum, zbytkový frekvenční posun, teplota, stárnutí), čas zbývající od poslední opravy a největší interval mezi opravami, který hodiny udrží uvnitř, po odečtení latence opravy. Oscilátor je výchozí hodnota TŘÍDY (csac, uso, dsac, tcxo, ocxo nebo rafs: jedna citovaná Allanova odchylka pro jednu sekundu a předpokládaná podlaha červeného šumu), TELEKOMUNIKAČNÍ PŘEDNASTAVENÍ Z KATALOGOVÉHO LISTU nebo vložený KATALOGOVÝ LIST (maxima Allanovy odchylky proložená jako obálka, plus stárnutí a teplotní koeficient) nebo vložený MEASURED ZÁZNAM FÁZE (jeho překrývající se Allanova odchylka proložená váženou metodou nejmenších čtverců v bázi bílé fáze a frekvenční modulace podle IEEE Std { "1139" }, takže podlaha červeného šumu je naměřená, nikoli předpokládaná). Překročení za nejdelší dobou průměrování, kterou katalogový list nebo záznam podporuje, je označeno jako extrapolované. Volitelná sekce spoofingu přidává ochrannou úroveň časování pro přijímač na oběžné dráze: orbitální rychlost a periodu, jak dlouho může jediný pozemní spoofer družici zasáhnout za přelet, práh monitoru podporovaného hodinami a latenci detekce CUSUM, podmíněnou mez, posun, který spoofer při uvedené maximální rychlosti změny nashromáždí, než družice opustí jeho dosah nebo proběhne nezávislá kontrola, a zda je každá kontrola při kontaktu se zemí nebo přes crosslink na tomto spooferu nezávislá. VALIDATED: inverze holdoveru z proloženého záznamu, držená stranou (held out) na skutečných cesiových hodinách měřených proti vodíkovému maseru (tests/slot_timing_cs5071a_holdout.rs, podmíněno daty); u naměřeného krystalového oscilátoru je predikce držená stranou konzervativní, ale nesplňuje práh, takže případ krystalu je MODELLED. MODELLED: zdroje třídy a katalogového listu, deterministické členy a posouzení spoofingu.

seg-1284cfee51f0 = Jeden běh <c1/> se shrnuje takto: slot-timing (zdroj katalogového listu): ochranný interval { "100.0" } ns při k={ "3" } je překročen { "650.8" } s po opravě (zbývá { "50.8" } s); oprava alespoň každých { "645.8" } s ({ "133.80" } za den); dominantní člen: frekvenční šum náhodné procházky

seg-97e12e763be3 = Povinná pole: <c1/>, <c2/>

seg-6b75ef50497a = Volitelná pole: <c1/>

seg-8c4662736bc0 = Příklad <c1/> mimo jiné nastavuje:

seg-8aee75a55007 = ocxo

seg-df4ca2d859ff = 1/s^{ "3" }

seg-1a282dc35742 = katalogový list

seg-c13396b4e57b = Popisek výsledku (z enginu): MODELLED — čas, než volně běžící hodiny opustí ochranný interval směrovacího slotu, a četnost oprav, která je udrží uvnitř, ze stacionárního mocninného modelu hodin. Zdroj z katalogového listu je obálka jeho maxim, nikoli měření žádného kusu; zdroj třídy stojí na předpokládané podlaze červeného šumu.

seg-97a91c8a60cd = Graf, který engine zapisuje pro scenarios/slot-timing-ocxo-leo.toml, druh slot-timing

seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-e84e4b49fee0 = <b>VALIDATED</b> Cesta naměřeného záznamu druhu <c1/>: překrývající se Allanova odchylka fázového záznamu proložená nezápornou metodou nejmenších čtverců vážených edf v bázi bílé fáze a frekvenční modulace podle IEEE Std { "1139" } (slot_timing::fit_weighted), Testy: <a1>slot_timing_cs5071a_holdout.rs</a1>.

seg-26ccdbd07a46 = <b>MODELLED</b> Druh <c1/>: predikovaná chyba E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertovaná pro překročení, zbývající čas, interval resynchronizace po odečtení latence opravy a počet oprav za den, každý člen uvedený zvlášť s Testy: <a1>slot_timing_igs_holdout.rs</a1>.

seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, dosažitelné jako sekce spoofingu druhu <c1/>: rychlost a perioda kruhové oběžné dráhy, nejdelší doba, po kterou může pozemní spoofer družici zasáhnout za přelet, práh monitoru podporovaného hodinami a latence detekce CUSUM

seg-8dbc28c3398f = <b>MODELLED</b> Druh <c1/>: predikovaná chyba E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertovaná pro překročení, zbývající čas, resynchronizaci. Orákulum (InternalConsistency): Uzavřené tvary pro každý člen zvlášť a nezávislé hledání kořene holdover::holdover_seconds; údaje z katalogových listů jsou pojmenované dokumenty (docs/SLOT-TIMING.md). Výchozí hodnota třídy stojí na předpokládané podlaze červeného šumu a zdroj z katalogového listu je obálka maxim, takže ani jedno není měřením žádného kusu

seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, dosažitelné jako sekce spoofingu druhu <c1/>: rychlost a perioda kruhové oběžné dráhy, nejdelší doba, po kterou může pozemní spoofer. Orákulum (InternalConsistency): Redukce na stávající ochrannou úroveň časování a uzavřené tvary viditelnosti pro kruhovou oběžnou dráhu a kulovou Zemi. Podmíněno detekcí, jeden pozemský spoofer s uvedenou rychlostí změny, přelet přímo nad hlavou na nerotující Zemi; neověřeno na spoofovaném přijímači na oběžné dráze

seg-29af1ec87672 = frekvenční skoky, vlivy záření a relativistické frekvenční posuny (výsledek <c1/>)

seg-89f90cdab1db = tepelný model: teplotní výchylka se aplikuje jako skok při opravě (výsledek <c1/>)

seg-cb3887ccae22 = samotný synchronizační protokol: oprava vynuluje chybu na fix_sigma_ns (výsledek <c1/>)

seg-b96fceda31df = vůči jaké metrice kolísání má být směrovací slot přijímán; viz docs/SLOT-TIMING.md (výsledek <c1/>)

seg-b101457241f2 = MODELLED — čas, než volně běžící hodiny opustí ochranný interval směrovacího slotu, a četnost oprav, která je udrží uvnitř, ze stacionárního mocninného modelu hodin. Zdroj z katalogového listu je obálka jeho maxim, nikoli měření žádného kusu; zdroj třídy stojí na předpokládané podlaze červeného šumu. (výsledek <c1/>)

seg-8e3d910f22ed = Oscilátor je výchozí hodnota TŘÍDY (csac, uso, dsac, tcxo, ocxo nebo rafs: jedna citovaná Allanova odchylka pro jednu sekundu a předpokládaná podlaha červeného šumu), TELEKOMUNIKAČNÍ PŘEDNASTAVENÍ Z KATALOGOVÉHO LISTU nebo vložený KATALOGOVÝ LIST (maxima Allanovy odchylky proložená jako obálka, plus stárnutí a teplotní koeficient) nebo vložený MEASURED ZÁZNAM FÁZE (jeho překrývající se Allanova odchylka proložená váženou metodou nejmenších čtverců v bázi bílé fáze a IEEE S (katalog druhů (<c1/>))

seg-f6a831727890 = VALIDATED: inverze holdoveru z proloženého záznamu, držená stranou (held out) na skutečných cesiových hodinách měřených proti vodíkovému maseru (tests/slot_timing_cs5071a_holdout.rs, podmíněno daty); u naměřeného krystalového oscilátoru je predikce držená stranou konzervativní, ale nesplňuje práh, takže případ krystalu je MODELLED. (katalog druhů (<c1/>))

seg-1cf85cbedffa = MODELLED: zdroje třídy a katalogového listu, deterministické členy a posouzení spoofingu. (katalog druhů (<c1/>))

seg-1a72034c1343 = Tematická stránka: <a1>DECEIVED-TIME.md</a1>

seg-10e6cd8ce00c = <s1>Předchozí</s1>reentry

seg-b8ec9e10ee84 = <s1>Další</s1>solar-system
