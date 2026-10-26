# docs--kind-moonlight-service-volume: translations (cs)

seg-8f8871ac8a0f = Tematická stránka: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Tematická stránka: <a1>integrations.md</a1>

seg-eb9f9a422d38 = Zdroj: <c1/>

seg-f8988314faf2 = <c1/> (druh scénáře)

seg-28c6a5644152 = Modelovaná analýza objemu služby lunární navigace z ILUSTRATIVNÍ konstelace třídy Moonlight/LCNS na lunární oběžné dráze z veřejných zdrojů (bez spojení s ESA): prochází mřížku selenografické šířky/délky přes časový horizont a uvádí DOP / pokrytí / dostupnost (≥{ "4" } družic A PDOP < práh) plus obálku zobecněné lunární ochranné úrovně ARAIM (HPL/VPL) přes objem. Geometrie DOP POUŽÍVÁ ZNOVU jádro (crate::orbit::dop) s úrovní VALIDATED vůči gnss_lib_py; ochranná úroveň POUŽÍVÁ ZNOVU aparát lunárního ARAIM LunaNet LNIS (crate::lunar, σ_URE≈{ "30" } m) a jako zvláštní případ se redukuje na existující PL u jižního pólu. MODELLED kompozice: sada relé s kruhovými/eliptickými keplerovskými drahami (nikoli skutečná diferenciálně korigovaná efemerida LCNS/NRHO), Měsíc se střední rotací (bez librace / precesujícího pólu). Deterministické (čistá geometrie). Bez TRL/heritage/podpory agentury.

seg-8516d1ded5dd = Jeden běh <c1/> se shrne takto: moonlight-service-volume | { "8" } družic (ilustrativní třídy LCNS, bez spojení) | { "24" } bodů × { "12" } epoch | pokrytí { "37.8" }% (PDOP<{ "6.0" }) | družic { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | dostupnost PL { "0.0" }% | MODELLED

seg-b59e8773bcb9 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

seg-0d935e7c43da = Příklad <c1/> mimo jiné nastavuje:

seg-edb738273a3a = Graf, který engine zapisuje pro scenarios/moonlight-service-volume.toml, druh moonlight-service-volume

seg-1974d1d64c9c = <b>VALIDATED</b> Lunární DOP / pokrytí / dostupnost třídy Moonlight + zobecněné lunární ochranné úrovně ARAIM přes objem služby. Orákulum (ExternalDataset): Nezávislá autorita třetí strany, keplerovský propagátor ANISE { "0.10.2" } astro::Orbit (Nyx Space, MPL-2.0) — ekvinokciální dvoutělesová cesta kódu odlišná od Newtonovy–Raphsonovy Keplerovy rovnice v kshana; poloha MCI každé družice se shoduje na <{ "1e-3" } m a odvozený počet/množina viditelných družic se přesně shoduje v každém bodě mřížky. Jádro DOP je ověřeno proti gnss_lib_py; integrita používá publikované parametry LunaNet/LCNS

seg-47f496c1d603 = <b>VALIDATED</b> Topocentrické úhly pohledu jednotlivých družic (azimut ve směru hodinových ručiček od severu, elevace) a šikmá vzdálenost na pojmenovaném selenografickém místě, při dané družici v rámci místa. Orákulum (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, spuštěné jako nástroj z xval/anise-service-geometry, binárka lunar-look-angles-xval, která nevolá žádný kód Kshana): vlastní rutina ANISE pro azimut, elevaci a vzdálenost (azimuth_elevation_range_sez) z míst vytvořených jejím konstruktorem šířka-délka-výška na Měsíci pck00011 (koule { "1737.4" } km), s družicemi otočenými do MOON_PA_DE440 přes moon_pa_de440_200625.bpc. { "768" } vzorků o

seg-1f12671176ad = MODELLED kompozice: sada relé s kruhovými/eliptickými keplerovskými drahami (nikoli skutečná diferenciálně korigovaná efemerida LCNS/NRHO), Měsíc se střední rotací (bez librace / precesujícího pólu). (katalog druhů (<c1/>))

seg-2ff91fe31123 = ČESTNOST: MODELLED kompozice. Geometrie DOP je ověřena TÍM, ŽE ZNOVU POUŽÍVÁ ověřené jádro; kompozice pokrytí / dostupnosti / integrity je MODELLED — sada relé s kruhovými/eliptickými keplerovskými drahami (nikoli diferenciálně korigovaná efemerida LCNS / NRHO { "9" }:{ "2" }), Měsíc se střední rotací (bez fyzické librace / precesujícího pólu) a publikované parametry integrity LunaNet LNIS. Toto předvádí lunární objem služby M (komentář v souboru scénáře, řádky { "27" } až { "32" })

seg-f3279128de3b = <s1>Předchozí</s1>mars-pnt

seg-92cd937a3fb7 = <s1>Další</s1>ntn-positioning
