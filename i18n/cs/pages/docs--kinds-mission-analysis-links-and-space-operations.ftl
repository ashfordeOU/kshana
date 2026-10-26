# docs--kinds-mission-analysis-links-and-space-operations: translations (cs)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Druh

seg-cb9447893c7f = Jedna družice nad jednou stanicí: šikmá vzdálenost, elevace a Es/N0 každého přeletu podél přeletu, MODCOD DVB-S2 zvolený v každém kroku (prahy ETSI EN { "302" } 307-1 tabulka { "13" } plus implementační rezerva) a objem dat, který ACM přenese oproti základu s konstantním kódováním, jenž se uzavře na masce. MODELLED.

seg-046f69293874 = Graf, který engine zapisuje pro scenarios/acm-link.toml, druh acm-link

seg-7eff466eb018 = Řízení orientace kosmické lodi: inerciální zaměřovací otočení tuhého tělesa se třemi či více vyváženými reakčními koly při zpětné vazbě MRP (L = -K sigma - P omega), minimálně normové momenty kol omezené limitem každého motoru, RK4 s držením nultého řádu; volitelně uzavřené na multiplikativní EKF ze simulovaného gyroskopu (náhodná procházka úhlu a rychlosti) a hvězdného sledovače. Hlásí dobu ustálení, konečnou a špičkovou chybu zaměření, špičkovou rychlost a moment kol, nasycený podíl, drift momentu hybnosti a s estimátorem jeho chybu orientace a NEES. Smyčka skutečného stavu je VALIDATED proti Basilisk { "2.9.1" }; estimátor je MODELLED.

seg-08c624d5324d = Graf, který engine zapisuje pro scenarios/aocs-slew.toml, druh aocs

seg-953188c11165 = Jednosměrný rozpočet spoje podle rovnice spoje CCSDS { "401" } / DSN 810-005: ztráta volným prostorem, C/N₀, Eb/N₀, rezerva a uzavření spoje pro vysílané EIRP, přijímací G/T, vzdálenost, datovou rychlost a pásmo (s|x|ka) vůči požadovanému Eb/N₀. Deterministický inženýrský výpočet z dodaných vstupů (nejde o kalibrovaný datasheet terminálu).

seg-bd375631bc7e = Graf, který engine zapisuje pro scenarios/link-budget.toml, druh link-budget

seg-0cef33b41040 = Aperture duty cycle: časové rozdělení mezi navigaci a komunikaci, které vyplývá z plánu kontaktů pro skupinu řiditelných apertur. Vstupem je plán kontaktů (seznam oken <c1/> aos_s/los_s, z nichž každé požaduje navigaci nebo komunikaci, tedy stejný slovník aos_s/los_s, jaký vydává prediktor <c2/>), počet apertur a ARBITRÁŽNÍ POLITIKA (ve výchozím nastavení s prioritou navigace, nebo s prioritou komunikace, nebo nepreemptivní podle pořadí příchodu); výstupem je vytížení navigací, vytížení komunikací, nevyužitý čas a výpadek na relaci, tedy doba kontaktu, kterou relace požadovala a žádná apertura ji neobsloužila. Jde o přesný průchod intervaly přes hranice oken, takže se přilehlá okna nikdy nepřetahují a žádná sekunda apertury se nezapočítá dvakrát; sekundy apertur věnované navigaci, komunikaci a nečinnosti se sčítají nezávisle a uzavírají se proti apertures*horizon_s. Zpráva uvádí použitou politiku, její úplnou definici a definice vytížení a výpadku, protože údaj o vytížení uvedený bez arbitrážní politiky není reprodukovatelný. MODELLED plánovací aritmetika: při změně služby nebo relace apertury se neúčtuje žádný čas na přesměrování, přeladění ani přepnutí, do rozhodování nevstupuje žádný objem dat, stav vyrovnávací paměti, energetický rozpočet ani uzavření spoje a okna kontaktů jsou vstupy: jejich geometrie je taková, jakou vytvořil jejich zdroj. Nejde o produkt pro plánování pozemního segmentu.

seg-a8b38ed8e029 = Graf, který engine zapisuje pro scenarios/aperture-duty-cycle.toml, druh aperture-duty-cycle

seg-34d041d6bd9f = Rovinný výstup gravitačním obratem vícestupňového nosiče nad nerotující kulovou Zemí atmosférou US Standard Atmosphere { "1976" } (svislý stoupavý úsek, náklon, tah ve směru rychlosti) s integrací gravitačních ztrát, ztrát odporem, řízením a protitlakem a kontrolou, že ideální dv snížené o ztráty odpovídá rychlosti při vyhoření; max-Q, špičkové zrychlení a stav při vyhoření. MODELLED.

seg-ccf2185b0b5e = Graf, který engine zapisuje pro scenarios/ascent-losses.toml, druh ascent-losses

seg-62c0dda9fc56 = Rozpočet orientace a chyby zaměřování ve 3 stupních volnosti: nejhorší případ gravitačně-gradientního rušivého momentu ((3/2)(μ/R³)ΔI) a rozpočet chyby zaměřování jako odmocnina součtu čtverců pojmenovaných příspěvků 1σ (šum čidel, chvění reakčních kol, tepelné vlivy, nesouosost) s dominantním členem, pro výšku oběžné dráhy a rozptyl setrvačnosti tělesa. MODELLED skalární rozpočet AOCS: doplněk před hardwarem k Basilisk/42, nikoli simulace regulační smyčky, 6 stupňů volnosti ani pružných módů.

seg-ad0e72e3b688 = Graf, který engine zapisuje pro scenarios/attitude-budget.toml, druh attitude-budget

seg-be4e928a5865 = Plánování pozemních kontaktů pro více družic nad více stanicemi: zdánlivá okna přístupu (SGP4, zemská pevná soustava IAU 2006/2000A, refrakce podle ITU-R P.834, světelný čas), datový objem DVB-S2 ACM každého přeletu (prahy z ETSI EN { "302" } 307-1, Table { "13" }) a bezkonfliktní rozvrh (jedna družice na anténu s přípravnou dobou, jedna stanice na družici, doručení vážené prioritou omezené každým nevyřízeným objemem) pomocí hladového algoritmu s mezní hodnotou, základního postupu podle pořadí příchodu a přesného větvení a mezí na malých množinách, s mezerou optimality hladového algoritmu. MODELLED.

seg-e26b549579e2 = Graf, který engine zapisuje pro scenarios/contact-schedule.toml, druh contact-schedule

seg-b843e2e0a4ee = Vstup do atmosféry jako hmotný bod ve 3 stupních volnosti nad rotující kulovou Zemí nebo Marsem (balistický, nebo nosný při konstantním náklonu), RK4, atmosférou US76, exponenciální atmosférou nebo atmosférou Marsu, s konvektivním ohřevem v bodě zastavení podle Sutton-Graves (NASA TR R-376): špičkové zpomalení, tepelný tok a dynamický tlak, tepelné zatížení, dolet, kontrola energie v rotující soustavě a vedle ní Allen-Eggersův uzavřený tvar. Špičkové zpomalení je zkontrolováno proti zveřejněné nominální hodnotě Stardust; ohřev je MODELLED.

seg-dbb618cd6357 = Graf, který engine zapisuje pro scenarios/entry-heating-stardust.toml, druh entry-heating

seg-47b4aea6ed01 = Geometrie stopy a pokrytí užitečného zatížení pro pozorování Země (kosmický trojúhelník SMAD): úhlový poloměr Země, šířka pásu, rozlišení na zemi v nadiru, maximální přístup mimo nadir, kruhová perioda, uzlová perioda J2 a rozestup pozemních stop na rovníku s příznakem souvislého pokrytí, pro výšku oběžné dráhy, sklon (ve výchozím nastavení slunečně synchronní) a zorné pole FOV/IFOV senzoru. MODELLED geometrie kulové Země (bez radiometrie/MTF/atmosféry/chvění/odlesků); rozestup uzlů R_e·(ω − Ω̇)·T_nodal s prvořadými sekulárními rychlostmi J2.

seg-c2a8332f2ee2 = Graf, který engine zapisuje pro scenarios/eo-coverage.toml, druh eo-coverage

seg-816bd5a5808a = Radiometrie a kvalita obrazu snímače v nadiru: zářivost scény s Lambertovým odrazem na apertuře, rovnice kamery, signál a šum výstřelový/temný/čtecí/kvantizační a SNR; MTF systému na Nyquistově frekvenci (difrakce x detektor x rozmazání x chvění), z ní odvozená relativní odezva na hranu, Q = lambda F/p a NIIRS podle GIQE verze { "4" } bez kompenzace MTF. MODELLED.

seg-bf7b52f7a01e = Graf, který engine zapisuje pro scenarios/eo-radiometry.toml, druh eo-radiometry

seg-7a4e6215a488 = Geometrie startu a výstupu ve dvoutělesové úloze: azimut(y) startu (sin Az = cos i / cos lat), minimální dosažitelný sklon dráhy, kruhová rychlost, východní bonus z rotace Země, Δv dogleg změny roviny, když je cílový sklon dráhy menší než šířka místa startu, a počet denních startovních příležitostí. MODELLED geometrie kulové Země (bez korekce rychlostního trojúhelníku rotující Země, bez modelu ztrát při výstupu a odporu).

seg-9696283a95ae = Graf, který engine zapisuje pro scenarios/launch-window.toml, druh launch-window

seg-4e31c8daf798 = Registr

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-69ee217ed8e0 = Zdroj: <c1/>

seg-f5091cbeecbf = Analýza misí, spoje a vesmírné operace (rodina druhů scénářů)

seg-d0eea6d9d1ad = { "14" } druhů scénářů enginu v{ $version }. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází od enginu nebo z verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se označení získává: část Evidence v README).

seg-6481dabc9458 = Tematické stránky: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Spusťte jednu: <c1/>. Všechny rodiny: <a4>KINDS.md</a4>.

seg-d6c5a581ffaf = Přehledový list grafů, které engine zapisuje pro druhy z rodiny Analýza misí, spoje a vesmírné operace

seg-8d65a4a1948d = Geometrie startu a výstupu ve dvoutělesové úloze: azimut(y) startu (sin Az = cos i / cos lat), minimální dosažitelná inklinace, kruhová rychlost, východní bonus z rotace Země, Δv pro změnu roviny dogleg, když cíl

seg-dd47e755d262 = Rovinný výstup vícestupňového nosiče gravitačním obratem nad nerotující kulovou Zemí přes standardní atmosféru USA { "1976" } (svislé stoupání, náklon, tah ve směru rychlosti), integrace grav

seg-cc88f37328a3 = Balistický koridor návratu Allena a Eggerse: maximální zpomalení (nezávislé na balistickém koeficientu, V_e^{ "2" } sin/γ//(2eH)), rychlost a výška při maximálním g a rychlost maximálního ohřevu pro vstupní rychlost

seg-8ad7c34d8c25 = Vstup do atmosféry hmotného bodu o 3 stupních volnosti nad rotující kulovou Zemí nebo Marsem (balistický nebo se vztlakem při konstantním náklonu), RK4, přes US76, exponenciální nebo marťanskou atmosféru, se stagnačním Sutton-Graves

seg-efe896d3f43b = Geometrie stopy a pokrytí užitečného zatížení pro pozorování Země (prostorový trojúhelník SMAD): úhlový poloměr Země, šířka záběru, vzdálenost vzorků na zemi v nadiru, maximální přístup mimo nadir, kruhová perioda, uzlová perioda J2

seg-d3d9652fd8a0 = Radiometrie a kvalita obrazu nadirového zobrazovače: radiance Lambertovské scény v apertuře, rovnice kamery, signál a šum výstřelový/temný/čtecí/kvantizační a SNR; MTF systému na Nyquistově frekvenci (difrakce

seg-1940d5c75a98 = Chybový rozpočet orientace a zamíření se 3 stupni volnosti: nejhorší případ rušivého momentu gravitačního gradientu ((3/2)(μ/R³)ΔI) a rozpočet chyby zamíření jako odmocnina součtu čtverců přes pojmenované 1σ příspěvky (šum senzoru, reakční

seg-e00d18fbb52b = Řízení orientace kosmické sondy: inerciální přesměrování tuhého tělesa se třemi nebo více vyváženými reakčními koly pod zpětnou vazbou MRP (L = -K sigma - P omega), momenty kol s minimální normou omezené na každé

seg-496fa280de7b = Rozpočet jednosměrného spoje podle rovnice spoje CCSDS { "401" } / DSN 810-005: ztráta šířením ve volném prostoru, C/N₀, Eb/N₀, rezerva a uzavření pro vysílací EIRP, přijímací G/T, vzdálenost, datovou rychlost a pásmo (s/x/ka) proti

seg-f0aca7ea1ffa = Jedna družice nad jednou stanicí: šikmá vzdálenost, elevace a Es/N0 každého přeletu podél přeletu, MODCOD DVB-S2 zvolený v každém kroku (ETSI EN { "302" } 307-1, prahy z tabulky { "13" } plus implementační rezerva)

seg-44c4890ba07e = Plánování pozemních kontaktů pro několik družic nad několika stanicemi: zdánlivá přístupová okna (SGP4, pozemní soustava IAU 2006/2000A, refrakce ITU-R P.834, světelný čas), objem dat DVB-S2 ACM

seg-19ab136e9f9b = Vytížení apertur: rozdělení času mezi navigaci a komunikaci, které plán kontaktů předpokládá pro soubor řiditelných apertur.

seg-ee0c649ca8b2 = Rámování protokolu Space Packet Protocol CCSDS 133.0-B: zakódování syntetického proudu paketů TM/TC (primární hlavička o 6 oktetech + datové pole) a hlášení dekódování hlavičky každého paketu, celkového počtu oktetů a přesné shody kódování↔dekódování

seg-e561f3a749db = Most interoperability CCSDS OEM: import zprávy Orbit Ephemeris Message vytvořené externím nástrojem letové dynamiky (GMAT/Orekit/STK všechny vydávají OEM) a hlášení jejích segmentů/objektů/soustav/rozsahu epoch plus

seg-1f074d7beccc = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-8f65824c39c5 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>launch-window</a1>.

seg-2926bde689d3 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-66f6489411d0 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>ascent-losses</a1>.

seg-481ce1d98bc7 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-fff98550eb48 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>reentry</a1>.

seg-9cf8d4b6064f = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-84e1bddcbc95 = <b>Registr:</b> MODELLED { "1" } · VALIDATED { "1" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>entry-heating</a1>.

seg-eab43348803e = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-9c6ce756a89a = <b>Registr:</b> VALIDATED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>eo-coverage</a1>.

seg-cd84a7bdbe57 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-320d724ac797 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>eo-radiometry</a1>.

seg-905487bf50f1 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>.

seg-14511e367361 = <b>Registr:</b> VALIDATED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>attitude-budget</a1>.

seg-540fa1932dad = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Volitelná: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

seg-6d2e9b9ce87f = <b>Registr:</b> MODELLED { "1" } · VALIDATED { "1" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>aocs</a1>.

seg-3345731b5729 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-f8b896b81014 = <b>Registr:</b> MODELLED { "1" } · VALIDATED { "1" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>link-budget</a1>.

seg-e38e356f4b71 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-eed876ed5aab = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>acm-link</a1>.

seg-5fddd2460fb0 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-58d00faa1eda = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>contact-schedule</a1>.

seg-5d4f6861f301 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1e06e06d4325 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>aperture-duty-cycle</a1>.

seg-9bb424e01c84 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>.

seg-688071019c9e = <b>Registr:</b> VALIDATED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>space-packet</a1>.

seg-03c06f9fdc85 = Povinná pole: žádná. Volitelná: <c1/>.

seg-568c484ce9a0 = <b>Registr:</b> VALIDATED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>oem-interop</a1>.

seg-41996765fcf1 = <s1>Předchozí</s1>Lunární a cislunární

seg-1951c46fe429 = <s1>Další</s1>Optické PNT
