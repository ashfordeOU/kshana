# docs--kind-oem-interop: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-4abcbdaddcf8 = Zdroj: <c1/>

seg-a92dcafd670e = <c1/> (druh scénáře)

seg-dbffff25b57f = Most pro interoperabilitu CCSDS OEM: import zprávy Orbit Ephemeris Message vytvořené externím nástrojem letové dynamiky (GMAT/Orekit/STK všechny OEM vydávají) a výpis jejích segmentů/objektů/soustav/časového rozpětí epoch spolu s kontrolou konzistence rychlosti; bez vstupu provede round-trip vygenerované referenční oběžné dráhy a vypíše věrnost importu↔exportu. Strukturní/fyzikální kontrola importu stavu MODELLED, NENÍ ověřením přesnosti oběžné dráhy zdroje.

seg-21eb1c9d7571 = Jeden běh <c1/> se shrnuje takto: oem-interop: round-trip { "2" } segmentů, { "12" } stavů; max. chyba round-tripu { "4.88e-7" } km / { "4.61e-10" } km/s (interop MODELLED)

seg-54c35d9fbfd9 = Volitelná pole: <c1/>

seg-d4117f615cd8 = Příklad <c1/> mimo jiné nastavuje:

seg-d7db74d14617 = KSHANA

seg-b16f858574ca = Popisek výsledku (z enginu): MODELLED — most interoperability pro import/round-trip CCSDS OEM (GMAT/Orekit/STK vydávají OEM); strukturní a fyzikální kontrola importu, NENÍ ověřením přesnosti oběžné dráhy zdroje

seg-5db5a7c812ca = Graf, který engine zapisuje pro scenarios/oem-interop.toml, druh oem-interop

seg-cd29f08ef235 = <b>VALIDATED</b> Importér CCSDS { "502.0" } OEM (parse_oem), tolerantní k řádkům COMMENT / dalším metadatovým klíčovým slovům / blokům kovariance a přesná inverze zapisovače; round-trip + import externího souboru s kontrolou konzistence rychlosti. Testy: <a1>ccsds_oem_interop_reference.rs</a1>.

seg-20071a16b316 = <b>VALIDATED</b> Importér CCSDS { "502.0" } OEM (parse_oem), tolerantní k řádkům COMMENT / dalším metadatovým klíčovým slovům / blokům kovariance a přesná inverze zapisovače; round-trip + . Orákulum (ExternalDataset): Nezávislý parser CCSDS-502 třetí strany <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — samostatná kódová báze, která dekóduje OEM EME2000/UTC vydávané systémem kshana bajt po bajtu shodně ({ "24" } stavů ve { "2" } fixturách, pos/vel Δ = { "0" }) a jejíž přísný čtecí modul potvrzuje metadatové tokeny; parser systému kshana s ní rovněž souhlasí na přibaleném externím OEM. Dvě otevřená zjištění o interoperabilitě (knihovna oem odmítá kshana per-satellite mu

seg-7ab6bb7a1b8a = MODELLED — most interoperability pro import/round-trip CCSDS OEM (GMAT/Orekit/STK vydávají OEM); strukturní a fyzikální kontrola importu, NENÍ ověřením přesnosti oběžné dráhy zdroje (výsledek <c1/>)

seg-343a56c07d02 = Strukturní/fyzikální kontrola importu stavu MODELLED, NENÍ ověřením přesnosti oběžné dráhy zdroje. (katalog druhů (<c1/>))

seg-44aba1ad1d37 = ČESTNÝ ROZSAH: strukturní a fyzikální kontrola importu stavu MODELLED, NENÍ ověřením přesnosti oběžné dráhy zdrojových efemerid. Spuštění: kshana scenarios/oem-interop.toml (komentář v souboru scénáře, řádky { "11" } až { "13" })

seg-833df8eedc34 = <s1>Předchozí</s1>ntn-positioning

seg-28254e1b38d4 = <s1>Další</s1>optical-atmosphere
