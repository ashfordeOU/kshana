# docs--kind-eo-coverage: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-98151954f217 = false

seg-8e62cc4af6ea = Tematická stránka: <a1>ENTRY-EO-ASCENT.md</a1>

seg-fc32bcd32dec = Zdroj: <c1/>

seg-d72c017ca1fa = <c1/> (druh scénáře)

seg-47b4aea6ed01 = Geometrie stopy a pokrytí užitečného zatížení pro pozorování Země (kosmický trojúhelník SMAD): úhlový poloměr Země, šířka pásu, rozlišení na zemi v nadiru, maximální přístup mimo nadir, kruhová perioda, uzlová perioda J2 a rozestup pozemních stop na rovníku s příznakem souvislého pokrytí, pro výšku oběžné dráhy, sklon (ve výchozím nastavení slunečně synchronní) a zorné pole FOV/IFOV senzoru. MODELLED geometrie kulové Země (bez radiometrie/MTF/atmosféry/chvění/odlesků); rozestup uzlů R_e·(ω − Ω̇)·T_nodal s prvořadými sekulárními rychlostmi J2.

seg-105bb8a3c33f = Jeden běh <c1/> se shrnuje takto: eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> pás { "184" } km, { "9.8" } m GSD v nadiru, přístup do { "745" } km mimo nadir; rozestup uzlů { "2752" } km (s mezerami) (MODELLED)

seg-609c5b7bc6f1 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-14f19837e422 = Příklad <c1/> mimo jiné nastavuje:

seg-834408a40783 = min

seg-ade2ba71a96c = Označení výsledku (z enginu): MODELLED — geometrie kosmického trojúhelníku pro kulovou Zemi; pás/GSD/přístup jsou geometrické (bez radiometrie/MTF/atmosféry/chvění/odlesků), rozestup pozemních stop je R_e·(ω − Ω̇)·T_nodal s prvořadými sekulárními rychlostmi J2

seg-c2a8332f2ee2 = Graf, který engine zapisuje pro scenarios/eo-coverage.toml, druh eo-coverage

seg-d86d43628cf3 = <b>VALIDATED</b> Geometrie kosmického trojúhelníku SMAD: úhlový poloměr Země, šířka pásu, GSD v nadiru, maximální přístup mimo nadir a kruhová perioda, plus prvořadá uzlová perioda J2 (eo_payload::j2_nodal_period) a rozestup pozemních stop na rovníku R_e (omega_ Testy: <a1>eo_payload_coverage_reference.rs</a1>.

seg-9938f1de9eb8 = <b>VALIDATED</b> Geometrie kosmického trojúhelníku SMAD: úhlový poloměr Země, šířka pásu, GSD v nadiru, maximální přístup mimo nadir a kruhová perioda, plus prvořadá uzlová perioda J2 (. Oracle (ExternalDataset): Orekit { "12.2" } (Apache-2.0) a GeographicLib { "2.1" } (MIT), obojí spuštěné jako samostatné programy, předregistrované (766823f3) před změnou enginu a jakýmkoli během orákula: veličiny pro kouli do { "1e-9" } relativně (nejhorší: úhlový poloměr { "5.4e-16" }, pás { "7.0e-13" }, přístup { "1.9e-14" }), perioda { "1e-12" } ({ "1.6e-16" }), GSD v nadiru { "1e-7" } ({ "2.9e-10" }), uzlová perioda J2 a rozestup uzlů do { "0.1" } % číselné propagace J2 v Orekitu s detektorem uzlů ({ "1" }

seg-45625167e59f = MODELLED — geometrie kosmického trojúhelníku pro kulovou Zemi; pás/GSD/přístup jsou geometrické (bez radiometrie/MTF/atmosféry/chvění/odlesků), rozestup pozemních stop je R_e·(ω − Ω̇)·T_nodal s prvořadými sekulárními rychlostmi J2 (výsledek <c1/>)

seg-cf22f13c78d3 = MODELLED geometrie kulové Země (bez radiometrie/MTF/atmosféry/chvění/odlesků); rozestup uzlů R_e·(ω − Ω̇)·T_nodal s prvořadými sekulárními rychlostmi J2. (katalog druhů (<c1/>))

seg-153325fb00d3 = ČESTNÝ ROZSAH: MODELLED pouze geometrie kulové Země -- žádný model radiometrie / MTF / atmosféry / chvění zaměření / slunečních odlesků. Rozestup pozemních stop je R_e*(omega - dOmega/dt)*T_nodal s prvořadými sekulárními rychlostmi J2; sklon je ve výchozím nastavení slunečně synchronní pro danou výšku. Spuštění: kshana scenarios/eo-coverage.toml (komentář v souboru scénáře, řádky { "7" } až { "11" })

seg-5dc02c3d10f7 = <s1>Předchozí</s1>entry-heating

seg-33f408d48d13 = <s1>Další</s1>eo-radiometry
