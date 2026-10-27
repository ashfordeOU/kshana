# docs--kind-launch-window: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-b054c73f22e5 = žádná hodnota

seg-8e62cc4af6ea = Tematická stránka: <a1>ENTRY-EO-ASCENT.md</a1>

seg-1c385961d594 = Zdroj: <c1/>

seg-e0990c5f14da = <c1/> (druh scénáře)

seg-7a4e6215a488 = Geometrie startu a výstupu ve dvoutělesové úloze: azimut(y) startu (sin Az = cos i / cos lat), minimální dosažitelný sklon dráhy, kruhová rychlost, východní bonus z rotace Země, Δv dogleg změny roviny, když je cílový sklon dráhy menší než šířka místa startu, a počet denních startovních příležitostí. MODELLED geometrie kulové Země (bez korekce rychlostního trojúhelníku rotující Země, bez modelu ztrát při výstupu a odporu).

seg-e24b0ae723c7 = Jeden běh <c1/> se shrnuje takto: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Earth-rotation bonus, { "2" } opportunities/day (MODELLED)

seg-6f955816b5c6 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-aaadee0743ee = Příklad <c1/> mimo jiné nastavuje:

seg-58d26f083b8f = Štítek výsledku (enginu): MODELLED — dvoutělesová geometrie startu z kulové Země; azimut je geometrický vztah sin(Az)=cos(i)/cos(lat) (bez korekce rychlostního trojúhelníku rotující Země, bez modelu ztrát při výstupu a odporu)

seg-9696283a95ae = Graf, který engine zapisuje pro scenarios/launch-window.toml, druh launch-window

seg-38175030f689 = <b>MODELLED</b> Azimut(y) startu ve dvoutělesové úloze (sin Az = cos i / cos lat), minimální dosažitelný sklon dráhy, kruhová rychlost, východní bonus z rotace Země, Δv dogleg změny roviny a denní příležitosti a, při zadané epoše a řádcích IERS finals2000A, místo

seg-53bc589c7ed6 = <b>MODELLED</b> Azimut(y) startu ve dvoutělesové úloze (sin Az = cos i / cos lat), minimální dosažitelný sklon dráhy, kruhová rychlost, východní bonus z rotace Země, Δv dogleg změny roviny a. Orákulum (InternalConsistency): Geometrie startu v uzavřeném tvaru ze sférické trigonometrie oproti kotvám z publikovaných řešených příkladů (Vallado, Fundamentals of Astrodynamics 4th ed., Algorithm { "37" } launch-azimuth + Ch.6 plane-change; tests/launch_window_ascent_geometry_reference.rs). Ty znovu používají tentýž uzavřený tvar, který kshana implementuje (kontrola shody s publikovanou hodnotou / kontrola přepisu, InternalConsistency); MODELLED dvoutělesová úloha, bez rychlostního trojúhelníku rotující Země / výstupu / odpo

seg-12396619d3e5 = MODELLED — dvoutělesová geometrie startu z kulové Země; azimut je geometrický vztah sin(Az)=cos(i)/cos(lat) (bez korekce rychlostního trojúhelníku rotující Země, bez modelu ztrát při výstupu a odporu) (výsledek <c1/>)

seg-715f1856bd37 = MODELLED geometrie kulové Země (bez korekce rychlostního trojúhelníku rotující Země, bez modelu ztrát při výstupu a odporu). (katalog druhů (<c1/>))

seg-4e9a215e3918 = ÚPRIMNÝ ROZSAH: MODELLED. Pouze geometrický azimut -- bez korekce rychlostního trojúhelníku rotující Země (bonus se hlásí zvlášť, aby se dal zahrnout), bez trajektorie výstupu / ztrát odporem / modelu řízení. Geometrie před fází A. Spuštění: kshana scenarios/launch-window.toml (komentář v souboru scénáře, řádky { "8" } až { "11" })

seg-12332d181de4 = Geometrie startovního okna a výstupu (analýza mise) je MODELLED, nikoli ověřena proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-1a3841380d88 = <s1>Předchozí</s1>jamming

seg-78411b85f301 = <s1>Další</s1>leo-navmsg
