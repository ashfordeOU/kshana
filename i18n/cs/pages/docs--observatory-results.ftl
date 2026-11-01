# docs--observatory-results: translations (cs)

# c1: docs/observatory/RESULTS.md
seg-69304b8b186b = Zdroj: <c1/>

seg-df5b53307f50 = Výsledky observatoře: 30denní baltský zpětný katalog a studie citlivosti

# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-072bdea11014 = Verze <c1/> nad <c2/> (parametry předregistrované v základní metodě, beze změny). MODELLED: neexistuje externí orákulum, skutečná reference ani přisouzení příčiny. Zhoršená buňka znamená, že vysoký podíl tam vzorkovaných letadel ten den hlásil nízkou navigační přesnost; neříká proč. Buňka, která není pozorována nebo chybí, nebyla vyhodnocena, což není totéž jako v pořádku.

seg-0d1eeedcab3a = Co bylo spuštěno

# c1: v<YYYY>.<MM>.<DD>-planes-readsb-prod-0
# c2: adsblol/globe_history_2026
# c3: scripts/fetch_adsblol_day.sh
# c4: back-catalogue/fetch/<tag>.parts.json
seg-df6ddf801a25 = <b>Zdroj:</b> historie readsb z adsb.lol (ODbL { "1.0" }), vydání GitHub <c1/> v <c2/>, stahované skriptem <c3/> po jedné části (zhruba { "3.4" } GB za den, { "2" } části). Vydavatel neuvádí žádné kontrolní součty, proto je SHA-256 každé části zaznamenán v <c4/>.

# c1: scripts/observatory_backcatalogue.sh
seg-9fa2d2319ed3 = <b>Oblast a dny:</b> obdélník { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (jih, západ, sever, východ: Baltské moře a jeho pobřeží), { "30" } dnů UTC od 2026-09-15 do 2026-10-14, buňky po { "0.5" } stupně, pomocí <c1/> (po jednom dni, surové soubory smazány po každém dni).

# c1: method.scope
seg-8b65d148bbd8 = <b>Pravidla zveřejnění:</b> nejnovější den (2026-10-14) byl při vytvoření více než { "24" } h po svém konci; jinak příkaz odmítne. Regionální běhy počítají základ zařízení a pozadí onoho dne jen z hlášení obdélníku (<c1/>).

# c1: back-catalogue/MANIFEST.json
seg-64581554e84a = <b>Soubory:</b> { "120" } souborů produktu (GeoJSON, PNG, JSON incidentů, manifest za každý den) <b>není v gitu</b>. Hash každého souboru je v <c1/> a den lze znovu sestavit z jeho archivu a porovnat.

# c1: manifest.json
seg-c89b88dc3d3b = Příklad toho, co den obsahuje: dne 2026-09-15 archiv obsahoval { "110,619,797" } řádků poloh v { "79,826" } souborech stop; { "103.0" } milionu bylo mimo obdélník, { "5.6" } milionu nebylo ADS-B, { "1.2" } milionu bylo na zemi nebo pod { "5,000" } ft, { "0.6" } milionu nenášelo pole přesnosti a { "212,426" } bylo agregováno (počitadla vstupů v <c1/>).

seg-cc590aa74075 = Tři dny (2026-09-18, 2026-09-26, 2026-10-03) byly znovu staženy z archivu a spuštěny podruhé: GeoJSON, PNG i soubor incidentů jsou <b>bajtově shodné</b> s prvním během (SHA-256 stejné), takže je produkt deterministický, i když je sůl hashe identifikátoru při každém běhu náhodná.

seg-3532be519183 = Souhrn zpětného katalogu

seg-56aae646318e = den UTC

seg-42784010b115 = zveřejněné buňky

seg-2672b7f55371 = zhoršené

seg-378ee89e4bd3 = nezhoršené

seg-14783d89f2fe = nepozorované (zveřejněné)

seg-711d143678ae = incidenty

# c1: not_observed
seg-0f1ffe21d381 = { "30" } dnů: celkem { "96" } zhoršených buněk, { "28" } z { "30" } dnů s alespoň jednou, { "70" } incidentů (shluků sousedících zhoršených buněk), žádný den s celodenním účinkem. Medián podílu zasažených letadel v buňce (pozadí onoho dne) je { "0" } ve { "29" } dnech a { "0.006" } v jednom, takže pojistka pozadí (buňka musí pozadí převýšit o { "0.15" }) v této oblasti nikdy neovlivnila rozhodnutí. Počet zhoršených buněk za den se pohybuje od { "0" } do { "8" } (průměr { "3.2" }). Zhruba třetina zveřejněných buněk každý den je <c1/> (vzorkováno příliš málo letadel): limitem tohoto produktu je pokrytí, nikoli obloha.

seg-606aed861c95 = Co tím není řečeno: dny s více zhoršenými buňkami nejsou v žádném fyzikálním smyslu „horší", trvalá zasažená oblast by byla podhodnocena (letadla, která celý den létají jen uvnitř ní, nemají mimo ni žádný základ a nepočítají se) a nic zde neříká, kdo nebo co způsobilo nízkou přesnost.

seg-ef37626a4c47 = Studie citlivosti (tři dny)

# c1: kshana interference-map sensitivity
# c2: sensitivity/<day>.json
seg-aacbb761ee19 = <c1/> přehraje zaznamenaná hlášení jednoho dne při změnách registrovaných parametrů po jednom (po dvou hodnotách, plus mřížka { "1.0" } stupně). Dny: 2026-09-18 (nejvíce zhoršených buněk, { "8" }), 2026-09-26 ({ "1" } zhoršená buňka) a 2026-10-03 ({ "0" }). Úplné zprávy: <c2/> (po { "23" } variantách; přehráno { "2.2" }, { "1.7" } a { "1.7" } milionu řádků). Zhoršené buňky při každé variantě (registrovaná hodnota v závorce; registrovaný výsledek je { "8" }, { "1" } a { "0" } zhoršených buněk):

seg-dfced7e594d2 = parametr (registrovaný)

seg-2ac3e771679d = hodnota

seg-0953dbfd76db = mřížka { "0.5" } stupně

seg-bf5746d1a110 = { "2" } (hrubší buňky)

seg-e4016df2fcd3 = Čtení bez vyhlášení vítěze:

seg-81cfcbf0de89 = Rozhodnutí jsou citlivá na prahy kódů přesnosti a na pravidla vzorkování a malé počty se silně mění.

# c1: low_nic_max
# c2: degraded_share
# c3: min_reports_per_aircraft_in_cell
# c4: low_nic_max
# c5: degraded_share
seg-097ed1aa1504 = <c1/>, <c2/> a <c3/> každý změní počet zhoršených buněk každý den dvojnásobně nebo více; uvolnění <c4/> na { "6" } změní { "1" } zhoršenou buňku na { "12" } dne 09-26 (Jaccard s registrovanou množinou { "0.08" }). Dne 09-18 zvýšení <c5/> na { "0.4" } ponechá { "1" } z { "8" } (Jaccard { "0.125" }). Rozhodnutí o buňce blízko prahů je stejně tak výpovědí o prazích jako o datech.

# c1: min_aircraft_sampled
seg-0d0c96099d30 = <b><c1/> většinou přesouvá buňky mezi nezhoršenými a nepozorovanými</b>: dne 09-18 ponechává počet zhoršených na { "8" }, zatímco { "21" } až { "56" } buněk mění stav.

# c1: background_margin
# c2: min_baseline_good_reports
# c3: day_confound_background
seg-04cc05318a5d = <b>Tři pojistky jsou zde neaktivní</b>: <c1/>, <c2/> a <c3/> neovlivní nic v žádném ze tří dnů (podíl pozadí je { "0" }), takže tato oblast a období neříkají nic o tom, jak dobře fungují. Záleželo by na nich tam, kde regionální účinek zvyšuje pozadí.

seg-7ba403b84fbd = <b>Hrubší mřížka ({ "1.0" } stupně) mění obraz</b> ({ "2" }, { "3" } a { "1" } zhoršených buněk; zveřejněné buňky klesnou zhruba na třetinu, { "226" } proti { "694" } dne 09-18, protože každá buňka je čtyřikrát větší): velikost buňky je volba metody a observatoř ji stanoví na { "0.5" } stupně.

# c1: low_nic_max
seg-4db2f5313410 = Den bez registrované zhoršené buňky (10-03) má zhoršené buňky při { "9" } z { "22" } variant mimo mřížku (až { "8" } s <c1/> { "6" }): „žádná zhoršená buňka" je rovněž výpověď závislá na prahu.

seg-a818be844f3a = Žádná varianta není ověřenou alternativou a registrované pravidlo se touto studií nemění. Studie neříká, které hodnoty parametrů jsou správné.

seg-98c799bfbc25 = <s1>Předchozí</s1>Observatoř interference: metoda

seg-5d0c003e73dc = <s1>Další</s1>kshana-bench
