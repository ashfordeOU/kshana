# docs--kind-lunar-interop-export: translations (cs)

seg-debc2f07db78 = true

seg-d36e6d7d8a10 = Zdroj: <c1/>

seg-fdf560e675f4 = <c1/> (druh scénáře)

seg-5a4dcb93a643 = Modelovaný export lunární interoperability: vydává lunární referenční rámec, lunární časovou škálu a lunární efemeridy ve výměnných formách zarovnaných s LunaNet/IOAG a založených na CCSDS, s konformitou zpětné cesty / polí. POUŽÍVÁ ZNOVU emitor+parser CCSDS OEM { "2.0" } z balíku (crate::oem) přeznačený pro lunární kontext — REF_FRAME v OEM nese lunární rámec tělesa IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM lunární časovou škálu (LTC / TCL / UTC), CENTER_NAME = MOON — přes ukázkové ilustrativní efemeridy třídy LCNS (polohy z crate::lunar_service, rychlost konečnou diferencí). Vydává také lunární popisovač času zarovnaný s LunaNet/IOAG (id škály, sekulární rychlost µs/den z crate::lunar_time, publikované pásmo, referenční povrch), který projde zpětnou cestou přes serde_json, a artefakty zabalí do existující obálky KIF (crate::interchange) se štítkem čestnosti MODELLED. Uvádí vydané artefakty, počet řádků OEM, konformitu polí (splněno) + seznam přítomných/chybějících polí, zpětnou cestu OEM ok, zpětnou cestu metadat času ok a velikost KIF v bajtech. MODELLED — orákulem je deterministická zpětná cesta + konformita názvů polí vůči publikovanému CCSDS OEM + sémantice polí LunaNet/IOAG; NENÍ to certifikovaný test konformity interoperability; ilustrativní efemeridy z veřejných zdrojů, bez spojení s ESA; bez TRL/heritage/podpory agentury.

seg-1726861e444f = Jeden běh <c1/> se shrne takto: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } stavů, OEM { "23" } řádků | konformita PASS ({ "9" } přítomných / { "0" } chybějících) | zpětná cesta OEM ok | zpětná cesta metadat času ok | KIF { "1640" } bajtů | MODELLED

seg-f8353e15aabd = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-169f9446e90d = Příklad <c1/> mimo jiné nastavuje:

seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

seg-3f36bd2ec5ea = LTC

seg-2ac27c1e55c0 = oktet

seg-0e86ff364c17 = Graf, který engine zapisuje pro scenarios/lunar-interop-export.toml, druh lunar-interop-export

seg-98acb538942f = <b>MODELLED</b> Export lunárního rámce + času + efemerid zarovnaný s LunaNet/IOAG (CCSDS OEM + KIF) s konformitou zpětné cesty. Orákulum (InternalConsistency): lunární export OEM z kshana znovu rozebraný nezávislou knihovnou třetí strany <c1/> (R. J. Anderson): tokeny rámce/času a stav v každé epoše se shodují na přesnost zápisu ({ "1" } mm / { "1e-9" } km/s) a export s vypuštěným TIME_SYSTEM je odmítnut — strukturální zpětná cesta výměny; fyzikální sémantika lunárního rámce/času je ověřena jejich vlastními řádky, takže toto zůstává MODELLED. { "0.30" } externí srovnání, zjištění (zůstává MODELLED): se

seg-c9a1d76625d6 = MODELLED (výsledek <c1/>)

seg-633bcd62ce93 = Vydává také lunární popisovač času zarovnaný s LunaNet/IOAG (id škály, sekulární rychlost µs/den z crate::lunar_time, publikované pásmo, referenční povrch), který projde zpětnou cestou přes serde_json, a artefakty zabalí do existující obálky KIF (crate::interchange) se štítkem čestnosti MODELLED. (katalog druhů (<c1/>))

seg-0e91697e3036 = MODELLED — orákulem je deterministická zpětná cesta + konformita názvů polí vůči publikovanému CCSDS OEM + sémantice polí LunaNet/IOAG; NENÍ to certifikovaný test konformity interoperability; ilustrativní efemeridy z veřejných zdrojů, bez spojení s ESA; bez TRL/heritage/podpory agentury. (katalog druhů (<c1/>))

seg-11d0ccba5ee7 = CO DĚLÁ src/lunar_interop.rs: * export_lunar_oem — POUŽÍVÁ ZNOVU emitor CCSDS OEM { "2.0" } z balíku (crate::oem), přeznačený pro lunární kontext: REF_FRAME = lunární rámec tělesa IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM = lunární časová škála (LTC / TCL / UTC), CENTER_NAME = MOON, přes ukázkové ILUSTRATIVNÍ efemeridy třídy LCNS (polohy z crate::lunar_service, rychlost centrální konečnou diferencí). * export_ (komentář v souboru scénáře, řádky { "6" } až { "19" })

seg-f730e8f789cf = ČESTNOST: MODELLED. NÁZVY polí a jednotky jsou zarovnány s VEŘEJNÝMI standardy (CCSDS 502.0-B OEM, lunární rámce IAU WGCCRE { "2015" }, specifikace interoperability LunaNet / lunární architektura IOAG). Orákulem je deterministická zpětná cesta a konformita názvů polí. NENÍ to certifikovaný test konformity interoperability. Efemeridy jsou ilustrativní, z veřejných zdrojů, BEZ spojení s ESA a neimplikují žádné TRL (komentář v souboru scénáře, řádky { "21" } až { "26" })

seg-254d48fe58a5 = Export lunární interoperability je MODELLED, nikoli ověřený: je kontrolován proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-07d6cc44724f = <s1>Předchozí</s1>lunar-integrity

seg-9669cd9b1d04 = <s1>Další</s1>lunar-jamming

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-834408a40783 = min
