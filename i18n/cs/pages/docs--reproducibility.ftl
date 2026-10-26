# docs--reproducibility: translations (cs)

seg-03cb5fb3dd8f = Ano

seg-a7d5633dbcc0 = Reprodukovatelnost a původ

seg-ab939e90efad = Zdroj: <c1/>

seg-1c48a3edda84 = Kshana je budována tak, aby byla reprodukovatelná: stejné vstupy dávají stejné výsledky a artefakty sestavení lze vysledovat ke zdroji, z něhož vznikly. Tento dokument přesně uvádí, co je zaručeno, co ne a jak se záruky vynucují.

seg-95b0eba44abe = Záruky determinismu

seg-1f637144697d = Engine nemá žádné nástěnné hodiny, žádnou závislost na vláknu provádění a žádnou nenasazovanou (unseeded) náhodnost. Každý stochastický proces je řízen proudem <c1/> zadaným <c2/> scénáře a čerpaným v pevném pořadí. Důsledky:

seg-14df30025491 = Vlastnost

seg-f0badf8cb640 = Zaručeno

seg-9f6678ac42f5 = Vynucuje

seg-cfc934af2c75 = Stejný scénář, stejný počítač → bajt po bajtu shodný <c1/>

seg-917da569fdd7 = <c1/> (spustí referenční scénář dvakrát, porovná SHA-256 (SHA: Secure Hash Algorithm))

seg-27351cbdc2b5 = Stejný scénář → shodné ukazatele kvality pole po poli

seg-bdeaf344acf8 = Ano, pro každou platformu

seg-debbc6540baf = <c1/> fixuje každý ukazatel kvality (FoM) pro čtyři referenční scénáře

seg-f7c5427c88f9 = Otisk vstupu scénáře (<c1/>) je nezávislý na platformě

seg-2bdf4b2d80be = SHA-256 kanonického scénáře adresovaný obsahem, fixovaný v <c1/>

seg-45861afe0994 = Otisk vstupu + <b>tvar</b> výstupu shodné napříč OS (operační systém)

seg-49345663b97c = <c1/> fixuje přesný SHA-256 pro každý scénář (deset scénářů, po jednom souboru <c2/> v <c3/>), kontrolovaný na matici CI (průběžná integrace) se 3 OS

seg-e54b5ff80782 = <b>Hodnoty</b> výstupu souhlasí napříč OS (ubuntu/macOS/Windows)

seg-271bcbff6287 = Ano, na { "1e-6" }

seg-3c25e00debff = úloha CI <c1/> spouští <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) a <c4/> na všech třech OS

seg-3876618cc821 = Rámec navigační zprávy na nízké oběžné dráze Země (LEO) má stejné bajty na každé platformě a v každém profilu sestavení, včetně sestavení WebAssembly (WASM)

seg-8aff3ee31c7e = <c1/> (každá transcendentní funkce a každá normální odchylka druhu <c2/> prochází čistě rustovým crate <c3/>); <c4/> fixuje celý rámec bez omezení platformy

seg-69750a5db756 = Seedované losování indexů (bootstrap resampling, míchání) je stejné na 32bitových i 64bitových cílech

seg-01e0601aa7fc = <c1/> vždy vzorkuje jako <c2/>; fixováno v <c3/>

seg-e42899fd8a4e = Všude stejný toolchain

seg-0bdd9769d5fb = <c1/> fixuje kanál; <c2/> při odchylce shodí sestavení; CI i vydání fixují stejnou verzi

seg-b0a3fd993614 = Stejná sada závislostí

seg-5a3daf9f0468 = <c1/> je zapsán do repozitáře a <c2/> se používá pro SBOM (soupis softwarových komponent)

seg-3ec3fae0dc5e = Každý běh z příkazové řádky také zapíše do své zprávy záznam reprodukovatelnosti (<c1/> a <c2/>): verzi enginu, SHA-256 souboru scénáře a dokumentu výsledku, seed, platformu a přesný příkaz, který <c3/> znovu spustí na bajt po bajtu shodný výsledek. Zpráva je sama čistou funkcí běhu: dva běhy <c4/> zapíší stejný <c5/> bajt po bajtu. Viz <a1>REPORTS.md</a1>.

seg-273a66a3584d = Výhrada ke shodě napříč platformami (a jak s ní zacházejí golden testy)

seg-9f4ec3dc638d = Numerické výsledky jsou <b>bitově shodné na dané platformě</b>, ale mohou se <b>mezi</b> platformami lišit v posledních několika jednotkách na posledním místě (ULP). Příčinou je matematická knihovna platformy: <c1/>, <c2/>, <c3/> a podobné funkce nemusejí podle IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) být správně zaokrouhlené, takže Linux (glibc, knihovna GNU C), macOS a Windows mohou každý vrátit jiný poslední bit. V dlouhém běhu se tyto rozdíly řádu ~{ "1e-16" } hromadí na možná ~{ "1e-12" } relativně.

seg-9297c2585419 = Dvě věci zvětšují rozdíl na posledním místě oproti jeho počátku a obě jsou změřeny, nikoli předpokládány. <b>Adaptivní integrátor</b> volí svůj příští krok z odhadu chyby pomocí páté odmocniny, takže jedna jednotka na posledním místě změní posloupnost kroků a obě platformy se pak shodnou jen na toleranci integrace. <b>Iterativní estimátor</b> (proložení metodou nejmenších čtverců, filtr určování oběžné dráhy) může ke konvergenci dojít jinou cestou. Druhy postavené na kterémkoli z nich se mohou mezi platformami lišit o více než { "1e-6" } v jednotlivých polích; <c1/> zaznamenává stejný režim pro jednotkové testy.

seg-c6bd20427abc = <b>Profil sestavení</b> záleží stejným způsobem, na jednom stroji. Optimalizované sestavení na macOS sloučí sinus a kosinus jednoho argumentu do jednoho volání systémové kombinované rutiny, jejíž sinus se od samostatného <c1/> liší v posledním bitu u { "379" } z { "200 000" } argumentů; neoptimalizované sestavení provede dvě volání. Změřeno na aarch64 macOS nad { "138" } soubory scénářů: debug a release sestavení jednoho zdroje dávají bajt po bajtu shodné dokumenty výsledků u { "102" }. Zbylých { "36" } se liší v posledních místech: { "28" } do { "1e-6" }, jeden (<c2/>) o { "2.8e-6" } a sedm kampaní jen v otiscích běhů svých členů; žádný se neliší v popisku, počtu ani verdiktu. Výše uvedená záruka bajtové shody platí proto pro jedno sestavení: tentýž binární soubor dvakrát.

seg-ff368c627bd2 = Seedovaná <b>normální losování</b> jsou třetím, mnohem vzácnějším zdrojem: vzorkovač ve svých vzácných větvích volá hostitelskou exponenciálu a logaritmus a asi jedno losování z milionu se v posledním bitu mezi nativním a WASM sestavením liší.

seg-0b7ebca1a5e3 = Kde je výstup <b>diskrétní</b>, rozdíl na posledním místě není přijatelný vůbec a druh se počítá pomocí <c1/> místo hostitelské knihovny. Prvním je druh <c2/>: jeho binární rámec jsou přenášená celá čísla a tentýž scénář byl jednou zakódován do tří různých rámců: v release sestavení, v debug sestavení téhož zdroje a v prohlížeči. Nyní jsou ve všech třech stejné bajty.

seg-1746a0ea22fe = Z tohoto důvodu golden testy <b>nefixují</b> jediný otisk výstupu s plovoucí řádovou čárkou platný napříč platformami — ten by byl křehký a poctivě správná sestavení na jiném OS by neprošla. Místo toho:

seg-9733b0545768 = <b><c1/></b> fixuje každý ukazatel kvality s relativní tolerancí <c2/> — o čtyři řády přísnější než jakákoli skutečná regrese (která posune hodnotu o celá procenta), přesto mnohem volnější než kolísání matematické knihovny (libm) napříč platformami. Pole omezená mřížkou (sekundy holdoveru) a pole přesně nulová se fixují přesně.

seg-a3dfe1c26401 = <b><c1/></b> — otisk obsahu <em>vstupů</em> — je nezávislý na platformě a fixuje se přesně.

seg-571aea9b8115 = <b><c1/></b> fixuje přesný SHA-256, zapsaný pro každý scénář v <c2/>, nad projekcí, která napříč platformami shodná <em>je</em>: otisk vstupu plus <b>tvar</b> výstupu (názvy polí, vnoření, typy listů, délky polí — dané deterministickou mřížkovou aritmetikou, nikdy hodnoty s plovoucí řádovou čárkou). Tím se přesně zachytí strukturální regrese, zatímco výše uvedené tolerance zachytí regrese hodnot.

seg-8543165b0d7d = <b><c1/></b> vynucuje bajt po bajtu shodný výstup ve dvou během <em>na témže počítači</em> (záruka determinismu).

seg-8b8b4ba5de30 = <b>Úloha CI <c1/></b> spouští čtyři výše uvedené testy (<c2/>, <c3/>, <c4/>, <c5/>) na <b>ubuntu-latest, macos-latest a windows-latest</b>, takže se reprodukovatelnost napříč platformami potvrzuje při každém pushi — golden testy tvaru a vstupu přesně, numerika na { "1e-6" } a stavy SGP4 (Simplified General Perturbations { "4" }) na { "2e-5" } km — místo spoléhání na jediný OS.

seg-2b9915611f03 = Pokud potřebujete zafixovaná čísla přegenerovat (například po záměrné změně modelu), spusťte každý referenční scénář a vypsané hodnoty FoM zkopírujte do <c1/>, pak změnu poznamenejte v <c2/>.

seg-9310a7af7ff8 = Soupis softwarových komponent (SBOM)

seg-717baa65bbb2 = <c1/> vydává SBOM CycloneDX { "1.5" } uvádějící každý crate, který je součástí artefaktu kshana, s jeho přesnou verzí, zdrojem a licencí. Je to generátor bez závislostí postavený na <c2/> (takže funguje jen s toolchainem) a prochází graf rozlišení od balíčku kshana jen přes běžné závislosti a závislosti sestavení. Vývojové závislosti (crate jen pro testy, například <c3/>) jsou vyloučeny, protože je žádný artefakt neobsahuje.

seg-a7886c557267 = Graf je sjednocením sad funkcí, s nimiž se dodávané artefakty sestavují: výchozí sestavení (knihovna a CLI (rozhraní příkazové řádky)), <c1/> (kolečko PyPI (Python Package Index), jehož řetěz <c2/> je jeho hranicí cizích funkcí) a <c3/> (balíček npm, který nese tentýž SBOM ve svém tarballu). Zahrnuty jsou závislosti podmíněné platformou pro každý cíl, protože kolečka se dodávají pro několik operačních systémů a balíček npm cílí na WebAssembly. Jeden dokument pokrývá všechny tři artefakty, takže pro kterýkoli z nich je nadmnožinou. V současnosti uvádí { "107" } komponent; počet je fixován v <c4/>. Samostatný server <c5/> má vlastní manifest a tento SBOM jej nepopisuje.

seg-4c8948e9ee7d = Výstup je deterministický — stejná sada závislostí dává bajt po bajtu shodný dokument, včetně sériového čísla odvozeného ze seřazeného seznamu balíčků místo časového razítka.

seg-60742bbdc583 = Pracovní postup vydání generuje SBOM (<c1/>) a přikládá jej ke každému označenému vydání; pracovní postup publikace jej dodává také vedle koleček PyPI a uvnitř balíčku npm.

seg-928c3c0108a1 = Původ sestavení

seg-42752467bfaa = Pracovní postup vydání vytváří atestaci původu sestavení SLSA (Supply-chain Levels for Software Artifacts) (<c1/>), která pokrývá každý soubor, který přikládá k vydání na GitHubu: binární soubory příkazové řádky pro každou platformu, binární soubor serveru <c2/>, SBOM, souhrn validace a <c3/>. Konzument může pomocí <c4/> ověřit, že artefakty byly sestaveny pracovním postupem vydání tohoto repozitáře z tohoto zdroje — a tím zaplnit mezeru mezi „tady je binární soubor“ a „tady je binární soubor, který mohu vysledovat ke zdroji“. Například pro SBOM verze { "v0.28.0" }:

seg-06515d230d33 = <s1>Předchozí</s1>Původ

seg-c6dba4e40c76 = <s1>Další</s1>Mapa schopností
