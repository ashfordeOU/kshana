# docs--kind-lunar-attack-surface: translations (cs)

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-c14d2343d802 = Zdroj: <c1/>

seg-9c0b5e933472 = <c1/> (druh scénáře)

seg-004c56ded47f = Útokový povrch pro zabezpečení signálu při navigaci na povrchu Měsíce (P1): skládá otevřené analýzy zabezpečení signálu do jednoho běhu dosažitelného z binárky. Uvádí ({ "1" }) přijatý výkon AFS a jeho PŘEBYTEK výkonu oproti pozemní referenci GPS, dále pásmo citlivosti 12-18 dB jako skutečný vícerozměrný průchod vstupy spoje (referenční úroveň x EIRP x šikmá vzdálenost) se srovnáním lineárních faktorů 25x zaokrouhleno / 28x nezaokrouhleno. REVIDOVÁNO (pravidlo R4): dříve uvádělo { "15.6" } dB NEDOSTATEK výkonu a faktor 32x/36x, dokud nebyla reference GPS opravena z -125 / -128.5 (což jsou hodnoty v dBm) na -155 / -158.5 dBW, hodnoty ICD-GPS-200, které modul rušení vždy používal. Znaménko se obrací: modelovaný lunární signál AFS je o { "14.4" } dB SILNĚJŠÍ než pozemní GPS L1 C/A, nikoli slabší. Samotný přijatý výkon se nezměnil ani o bit a lineární faktor je původní podělený přesně { "1000" }, což je přesně posun { "30" } dB mezi dBm a dBW; ({ "2" }) požadovaný vysílací výkon útočníka pro spoofing (J/S = { "3" } dB) a pro znemožnění (J/S = { "30" } dB) při každém odstupu, inverzi spoje J/S; ({ "3" }) orbitální záchytnou stopu při skutečném diagramu antény s rovnoměrnou aperturou (Airy [{ "2" } J1(x)/x]^{ "2" }), výškově omezenou podhemisférickou čepici, jejíž okraj NENÍ zachycen; ({ "4" }) vypočtený výsledek strhnutí smyčky sledování při záchytu spoofingu (zda spoofer s odpovídajícím kódem při dané výkonové výhodě a posunu kódu skutečně strhne DLL/PLL), nikoli předpokládaný práh { "3" } dB; ({ "5" }) geometrický dosah horizontu zvýšeného povrchového vysílače na tělese bez atmosféry; a ({ "6" }) rozpočet autentizace OSNMA/TESLA ({ "20" } bit/s režie = ~{ "40" } % zprávy AFS o { "50" } bit/s, latence zveřejnění klíče, padělek { "2" }^-40). Prázdné tělo reprodukuje základ P1; každý vstup má výchozí hodnotu a lze jej přepsat. Dílčí výsledky VALIDATED nesou orákulum svého zdrojového modulu (radiometrie v dB v uzavřeném tvaru; zpětná cesta inverzního J/S; diagram Airy proti Besselovým funkcím z A&S a geometrie kulové úseče; strhnutí DLL/PLL proti Kaplan & Hegarty; identita kulového tečného horizontu proti eo_payload; velikosti polí OSNMA SIS-ICD). MODELLED: reprezentativní velikosti geometrie a výkonu a konkrétní hodnoty buněk mapy záchytu. Nejde o produkt zabezpečení s certifikací.

seg-e5edd5b9ef27 = Jeden běh <c1/> se shrne takto: lunar-attack-surface | AFS -140.6 dBW, přebytek { "14.4" } dB (pásmo -17.9–-12.0, přebytek { "25" }×/28×) | spoof@{ "1000" } m { "0.000" } W | stopa { "3" }% čepice, okraj false | spoof-capture true (zachycení { "0.00" } s) | dosah stožáru { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% z { "50" } bit/s), latence { "30" } s | průchod stopou 7x5 (alt 20-500 km x HPBW 1.83-29.20 deg), záchyt 0.6-42.9% | okraj NEDOSAŽEN v této mřížce (nejlépe -0.8 dB, { "3.8" } dB chybí; potřeba { "19.8" } dBW oproti { "16.0" } dBW)

seg-781a7094b955 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

seg-87e0c97de011 = Příklad <c1/> mimo jiné nastavuje:

seg-6ea8f1132b57 = lineární

seg-8b701f465117 = logaritmická

seg-de295af20c55 = Graf, který engine zapisuje pro scenarios/lunar-attack-surface.toml, druh lunar-attack-surface

seg-c853e3e832c0 = <b>MODELLED</b> Dvouosý průchod výškově omezenou povrchovou záchytnou stopou vážené diagramem přes výšku vysílače a průměr paraboly, vydávaný po jednom řádku na provozní bod. Orákulum (InternalConsistency): Inkluze množin: poměr rušení k signálu vstupuje jako rovnoměrný posun v decibelech, takže zachycená množina při vyšším vysílacím výkonu obsahuje množinu při nižším a podíl může jen růst -- vlastnost, kterou diagram Airy NEDÁVÁ v šířce svazku ani ve výšce, kde se zachycená oblast rozpadá na prstence a podíl je skutečně nemonotónní. Žádná publikovaná tabulka neuvádí zachycený podíl disku lunárního orbitálního vys

seg-d11486381332 = MODELLED: reprezentativní velikosti geometrie a výkonu a konkrétní hodnoty buněk mapy záchytu. (katalog druhů (<c1/>))

seg-95be70748647 = Záchytná stopa v závislosti na výšce a šířce svazku je MODELLED, nikoli ověřená: je kontrolována proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-1a1799e01ac4 = <s1>Předchozí</s1>link-budget

seg-4b0efe4b9b85 = <s1>Další</s1>lunar-beacon

seg-98151954f217 = false

seg-cc2ad9e12064 = <b>MODELLED</b> Rozpočet spoje J/S z geometrie, C/N₀ odolné proti rušení, ztráta zachycení signálu na jednotlivé družice. Oracle (InternalConsistency): Rovnice rozpočtu spoje pro C/N₀ odolné proti rušení je křížově zkontrolována nezávislým odvozením v numpy (sdílí stejný uzavřený tvar → InternalConsistency) a charakterizací zhoršení C/N₀ z reálného JammerTest-2024. { "0.30" } kolo { "2" }, zablokováno (zůstává MODELLED): naměřený pokles C/N0 v JammerTest { "2024" } proti predikci rozpočtu spoje (předregistrováno 6a66994b, do { "3" } dB) nebyl proveden, protože poloha a zaměření antény F8.1 při

seg-143f3f1cc521 = Odolnost proti rušení při odepření GNSS je MODELLED, nikoli ověřena proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-ca1c7e92b98e = <s1>Předchozí</s1>lunar-ascent
