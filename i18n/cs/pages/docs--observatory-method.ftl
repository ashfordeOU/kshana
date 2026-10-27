# docs--observatory-method: translations (cs)

seg-0857a94a948e = Omezení

seg-2247a2344710 = Význam

seg-b652b86e6b8e = Stav

# c1: docs/observatory/METHOD.md
seg-7ca62fa39e10 = Zdroj: <c1/>

seg-48e063b567d0 = Observatoř interference: popis metody

# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-d0e1d6cadc10 = Verze <c1/>, postavená na <c2/>. Pouze poradní charakter: jde o popis toho, jak vypadala zveřejněná hlášení polohy v minulých dnech, nikoli o měření jakéhokoli přijímače, předpověď, potvrzení interference ani určení její příčiny.

seg-c5eab49b8d6f = Co observatoř zveřejňuje

seg-165ae7646608 = Jeden produkt na den UTC a oblast, z jednoho otevřeného archivu poloh letadel. Každá buňka pevné mřížky zeměpisné šířky a délky o rozteči 0.5 stupně je v jednom ze <b>tří stavů</b>:

seg-cc07647eb12e = Vysoký podíl letadel vzorkovaných v buňce hlásil ten den nízkou navigační přesnost, jasně nad pozadím onoho dne.

seg-3e1dd7caaee6 = Bylo vzorkováno dost letadel a podíl pravidlo nesplnil.

# c1: insufficient_sample
# c2: no_day_background
# c3: day_wide_effect
seg-8f0d9ad60d62 = Data nedovolila rozhodnutí. To <b>neznamená</b> „v pořádku". Každá taková zveřejněná buňka nese datový důvod: <c1/>, <c2/> nebo <c3/>. Buňka bez jakéhokoli záznamu byla viděna méně než { "5" } různými letadly a je zadržena.

seg-e49e05b47061 = Nic dalšího se nezveřejňuje: žádná příčina, žádný původce, žádný záznam za jednotlivé letadlo. Důvody popisují, zda data onoho dne stačila, nikdy ne proč byla přesnost nízká.

# c1: kshana interference-map daily
seg-7b251c7860e0 = Tři soubory na den (<c1/>):

# c1: observatory-adsb-<dataset>-<day>.geojson
# c2: schema
# c3: kshana-observatory-day/1
seg-2008b0ba6ac7 = <c1/>: buňky, s <c2/> <c3/>, metoda a její předregistrované parametry, licence a uvedení zdroje, pravidlo zveřejnění a upozornění.

# c1: observatory-adsb-<dataset>-<day>.png
seg-7d5b16eac4a3 = <c1/>: tytéž buňky jako obrázek (zhoršené, nezhoršené, nepozorované šrafované; prázdné buňky nebyly pozorovány). Textové bloky v souboru opakují upozornění a licenci.

# c1: observatory-adsb-<dataset>-<day>.incidents.json
# c2: schema
# c3: kshana-incident-report/1
# c4: cause
# c5: not attributed
seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Sousedící zhoršené buňky (včetně úhlopříček) tvoří jeden incident s ohraničujícím obdélníkem a svými buňkami. <c4/> je pevný text <c5/>. Soubor je vstupem do cyklu hlášení, potvrzení a oznámení (letecký cyklus hlášení, který končí zprávou NOTAM); není potvrzením ani zprávou NOTAM.

# c1: .manifest.json
seg-49b7bdae0d6e = a <c1/> s počtem bajtů a SHA-256 těchto tří souborů, identifikátorem metody, počitadly vstupů (přečtené a vyloučené řádky) a blokem datové sady, aby bylo možné produkt zkontrolovat a reprodukovat.

seg-d7bb390fb986 = Pravidla zveřejnění (vynucuje příkaz)

# c1: --delay-hours
seg-87147317f8da = <b>Zpoždění nejméně { "24" } h.</b> Produkt za jeden den se zveřejní nejdříve na konci onoho dne UTC plus <c1/> ({ "24" } nebo více; menší hodnota se odmítne). Příkaz odmítne den, který ještě nelze zveřejnit, a uvede nejbližší čas. Neexistuje přepínač, který by to zkrátil.

seg-43960c3f9b6c = Hrubé buňky.

# c1: --cell-deg
seg-1a5ff10e5240 = <c1/> pod { "0.5" } se odmítne.

# c1: null
seg-e70d8d7f9980 = <b>Potlačení.</b> Buňka viděná méně než { "5" } různými letadly se nezveřejní; počet pod { "5" } je <c1/> (včetně nuly), jako v základní metodě.

seg-ab75582c5032 = <b>Žádné přisuzování.</b> Slovník stavů a důvodů neobsahuje žádnou příčinu; ověřuje to test.

seg-0e7d76d7efd0 = <b>Zdroje.</b> Pouze adsb.lol (ODbL { "1.0" }), nebo datová sada uživatele s vlastní licencí. <b>Data OpenSky Network se odmítají</b> (její licence nepovoluje komerční použití ani redistribuci odvozených map). ADS-B a AIS se nikdy nekombinují.

seg-dc28848046ac = <b>Licence produktu.</b> Soubor ADS-B po buňkách vytvořený z adsb.lol je odvozená databáze (Derived Database) a nese v souboru ODbL { "1.0" } a uvedení zdroje adsb.lol. Kód Kshana zůstává pod AGPL-3.0.

seg-9eeba6648fec = Pozorovatelná veličina a základní metoda

# c1: kshana-interference-map/adsb/v2
# c2: docs/INTERFERENCE-MAP.md
seg-7334dc45eb2f = Letadlo s ADS-B hlásí, jak přesnou si myslí, že je jeho vlastní poloha GNSS: <b>NACp</b> (Navigation Accuracy Category for Position, { "95" }% vodorovná mez od { "10" } NM po méně než { "3" } m) a <b>NIC</b> (Navigation Integrity Category, poloměr ohraničení). Základní metoda (<c1/>, <c2/>) počítá pro každou buňku a den podíl <b>různých letadel</b>, jejichž hlášení v buňce měla většinou nízkou přesnost, s pojistkami: pouze výška nad { "5,000" } ft; letadlo se počítá jen tehdy, když ten den hlásilo jinde dobrou přesnost (základ zařízení); podíl v buňce musí převýšit medián podílů v buňkách onoho dne o určitou rezervu; den, jehož medián je sám vysoký, se označí jako zkreslený a žádná buňka se neprohlásí za zhoršenou. Parametry byly stanoveny z definic polí a z pravidla ochrany soukromí dříve, než byla zkoumána jakákoli data, a jsou zapsány do každého výstupního souboru. Observatoř přidává třístavový slovník, pravidla zveřejnění a výše uvedené soubory a žádný parametr nemění.

# c1: --bbox
# c2: method.scope
seg-96cf298985c6 = <b>Regionální běhy.</b> S <c1/> se čtou pouze hlášení uvnitř obdélníku. Základ zařízení a pozadí onoho dne se pak počítají jen z hlášení tohoto obdélníku, což soubor uvádí (<c2/>). Regionální produkt je tedy produktem dat dané oblasti, nikoli ořezem globálního.

seg-2e7007b56a44 = Vztah k metodě NACp oproti almanachovému HDOP

seg-4892485e534b = Pleninger, Topkova a Steiner, „GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data", The Aeronautical Journal { "129" } ({ "1331" }), { "206" } až { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, porovnávají chybu polohy odpovídající NACp letadla s HDOP (horizontální faktor zhoršení přesnosti) konstelace GPS z dat almanachu a označí letadlo za zasažené, když se obojí liší; článek hodnotí metodu na záměrných experimentech s rušením GPS.

seg-74ec1aca8a22 = <b>Co jsme použili.</b> Pouze zveřejněný abstrakt a bibliografický záznam. Plný text nám nebyl k dispozici (za paywallem), takže neznáme ani jeho převod z NACp na odhad chyby, ani jeho výpočet HDOP, ani jeho prahy, a netvrdíme, že je reprodukujeme.

seg-4f8471649a07 = <b>Co místo toho dělá observatoř.</b> Otázka, na kterou odpovídá porovnání s almanachem, zní: „mohla by tuto nízkou přesnost vysvětlit samotná geometrie konstelace?" Základní metoda odpovídá na příbuznou otázku bez almanachu: nízký podíl se musí vymykat pozadí téhož dne v celé oblasti a vlastním dobrým hlášením letadel jinde. To je jiná a slabší náhrada: nemůže říci, že hodina s klidnou geometrií byla zhoršená tam, kde je pozadí onoho dne také nízké. Bodovací nástroj HDOP podle almanachu <b>není implementován</b>. Je to otevřená položka, která se má vytvořit z plného textu článku a veřejného almanachu GPS a předregistrovat před spuštěním; do té doby je citován, nikoli tvrzen.

seg-e9b9902633af = Reprodukce produktu

seg-95e48f0286d9 = Postup je deterministický ve všem, co zveřejňuje (sůl identifikátoru pro každý běh mění jen vnitřní hashe, které se nikdy nezapisují). Hodnoty SHA-256 v manifestu umožňují porovnat druhý běh bajt po bajtu.

seg-65236a42e316 = Studie citlivosti

# c1: kshana interference-map sensitivity <input> --dataset adsb-lol --day <day> --out report.json
# c2: docs/observatory/RESULTS.md
seg-0c843e799b8f = <c1/> přehraje hlášení jednoho dne při změnách každého předregistrovaného parametru po jednom (po dvou hodnotách, plus mřížka { "1.0" } stupně) a pro každou variantu uvede počet zhoršených, nezhoršených a nepozorovaných buněk, Jaccardův index zhoršené množiny s registrovanou, buňky, jejichž stav se změnil, a zhoršenou plochu. Na registrovaném pravidle nic nemění: varianta není ověřenou alternativou a velká změna při některém parametru říká, jak moc rozhodnutí na tomto parametru závisí, nikoli která hodnota je správná. Výsledky pro zpětný katalog jsou v <c2/>.

# c1: not_observed
seg-cc57d45c4b0a = <b>Pokrytí.</b> adsb.lol vychází z přijímačů dobrovolníků; otevřené moře a řídce pokrytý vzdušný prostor jsou řídké a <c1/> je tam časté. Mapa ukazuje pokrytí svého zdroje.

seg-e3921e1eb177 = <b>Co znamená nízká přesnost.</b> NACp a NIC klesají i z jiných důvodů než interference: výpadky družic nebo systémů rozšíření, kosmické počasí, závady přijímače nebo transpondéru a geometrie. Žádný stav neimplikuje příčinu.

seg-e5ad0dc456c0 = <b>Letadla, která zůstávají v zasažené oblasti celý den,</b> nemají mimo ni žádný základ a nepočítají se, takže metoda podhodnocuje trvalý regionální účinek. Studie citlivosti ukazuje účinek pojistky základu.

seg-a2d41becc19b = <b>Hranice dnů</b> jsou v UTC; událost, která přechází přes půlnoc, se rozdělí mezi dva dny.

seg-436af9f16feb = <b>Žádná skutečná reference.</b> Observatoř nemá externí orákulum: každý údaj je MODELLED a nespočívá na ní žádný řádek verifikační matice.

seg-5c4966f0166d = <b>Citlivost tématu.</b> Mapy tohoto druhu jsou politické. Observatoř uvádí metodu, zpoždění a slovník a nic víc; nejmenuje státy ani původce a nezveřejňuje v reálném čase.

seg-874f46a80c8b = <s1>Předchozí</s1>Čtené protokoly přijímačů

seg-3137b7595e59 = <s1>Další</s1>Observatoř interference: výsledky
