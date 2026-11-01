# docs--contributing: translations (cs)

seg-c3c260b7063e = Testy

seg-5dce5694e6ec = Zdroj: <c1/>

seg-3fa173b79e8f = Přispívání do Kshana

seg-c3a47c614836 = Děkujeme za váš zájem. Kshana chce být <b>neutrální, reprodukovatelnou, poctivě ověřovanou</b> referencí pro hybridní kvantové a klasické PNT. Příspěvky se posuzují podle této laťky: správnost, citace a reprodukovatelnost mají přednost před šíří záběru.

seg-5a82a55f7fb2 = Jak je projekt řízen — kdo rozhoduje, technická laťka a hranice mezi otevřeným a uzavřeným — je zdokumentováno v <a1><c1/></a1>.

seg-cc8491af7a6f = Vývoj

seg-0163ccdfaa2b = Volitelné jazykové vazby jsou řízeny příznaky funkcí a ve výchozím stavu vypnuté (takže výše uvedený build a brána auditu závislostí se jich nikdy nedotknou). Chcete-li na nich pracovat:

seg-edc8bbab6e92 = Před každým commitem — rychlá smyčka

seg-6a7eda7d82b7 = Tyto kroky trvají sekundy. Jsou podmnožinou úlohy <c2/> v <c1/>, ve stejném pořadí, takže selhání zde je selháním tam:

seg-d62c1fe22fc4 = <b>Reprodukovatelnost je pevná invariantní podmínka.</b> Změna, která učiní <c1/> nedeterministickým, je chyba. Náhodnost musí procházet seedovaným generátorem náhodných čísel; kvantové a klasické běhy používají nezávislé, deterministicky odvozené seedy.

seg-66ea0748c10f = <b>Hygiena repozitáře.</b> Commity a obsah nesmějí nést žádné atribuční patičky ani zápatí automatizovaných nástrojů a nesmějí jako autora uvádět AI asistenta nikde v obsahu, názvech souborů ani historii. Toto vynucuje hlídač.

seg-fbf423f6fb31 = Před pushem — úplná brána

seg-a9176352d3b4 = <c1/> je kanonická brána: spouští <c2/> bez zkracování a poté <c3/>, aby ještě několikrát znovu spustila sadu knihovny, protože souběh při prokládání vláken je při jediném běhu neviditelný. Teprve po úspěchu zapíše <c4/> (nesledovaný — stav stroje o jednom běhu, nikoli obsah).

seg-29815bd89ce2 = Je záměrně pomalá — 62–79 minut ve zdravém ustáleném stavu, podle hlavičky <c1/>, která nese aktuální údaj — a nemá žádný časový limit, protože limit dostatečně krátký, aby byl užitečný, by zdravý běh zabil. Běh podmnožiny, který skončil zeleně, není brána: obě vady, kvůli nimž tento mechanismus existuje, jím prošly.

seg-408da9a8b8bb = Přispěvatelé pracující z forku háček pro potvrzenku (receipt) nepotřebují — je to lokální brána správce a <b>pull request ve skutečnosti hlídá CI</b>. Spuštění <c1/> před jeho otevřením jen znamená, že vám CI neřekne nic, co byste už nevěděli.

seg-9394727b21c3 = Přidání nebo změna modelu senzoru

seg-d9c891ca6827 = <b>Každý číselný parametr potřebuje původ.</b> Uveďte citaci v řetězci <c1/> modelu i v souboru scénáře. Žádné anonymní konstanty.

seg-d30cb836d4c4 = <b>Ověřujte proti standardnímu vztahu,</b> nejen proti vnitřní konzistenci — např. Allanova odchylka u hodin, Grovesův růst chyby inerciálního výpočtu polohy u inerciálních senzorů, převod čas→vzdálenost u přenosu času. Přidejte test, že simulovaný výstup reprodukuje zveřejněnou hodnotu nebo hodnotu daného vztahu v rámci uvedené tolerance.

seg-b52dd0dd550e = <b>Buďte poctiví ohledně zralosti.</b> Registr stavů je <c1/> — přidejte nebo upravte tam řádek, uveďte jeho externí orákulum (nebo otevřeně napište, že žádné není, čímž se stává <c2/>) a poté znovu vygenerujte publikované artefakty příkazem <c3/>. <c4/>, <c5/> a <c6/> se všechny generují z této funkce a z dobrého důvodu uvádějí „neupravujte ručně“. Aktualizujte také vyprávění v <c7/>, když to text vyžaduje, a označte hodnoty, které jsou cíle nebo výsledky pozemního demonstrátoru, jako takové.

seg-34b9c8b6f70c = Nejprve test: napište nejprve selhávající test s očekávanou hodnotou <b>odvozenou ručně</b> z fyziky nebo vztahu, ještě před implementací.

seg-5322d5b2188c = Deterministické testy tvrdí přesné (ručně odvozené) hodnoty; statistické testy tvrdí uvedenou toleranci a ideálně průměrují přes seedy, aby se omezil rozptyl.

seg-7f76a26c4d5f = Commity a verzování

seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

seg-1a13616ca0ac = <b>Sémantické verzování.</b> Před verzí 1.0 se schéma scénářů a výsledků může měnit; upozorněte na zásadní změny.

seg-0e3036c27aa8 = <b>Vydání se vytvářejí značkou <c1/> a publikování je automatické, ale uspořádané.</b> Pracovní postup Auto-tag odešle značku, jakmile je CI na <c2/> zelené při zvýšení verze. Pracovní postup Release spustí úplné ověření na označeném commitu a teprve když projde, publikuje do crates.io, Python Package Index (PyPI), npm, ghcr.io, registru Model Context Protocol (MCP) a JetBrains Marketplace; poté zkontroluje, že každý kanál servíruje danou verzi, a znovu sestaví kshana.dev ze značky. Nikdo nespouští <c3/> ručně. Postup a způsob opakování neúspěšného publikování jsou v <a1><c4/></a1>.

seg-18ca89a2c573 = Údržba changelogu (povinná)

seg-1f7e1d73c2ef = Každá změna viditelná uživateli aktualizuje <a1><c1/></a1>:

seg-1448e96afbbc = Přidejte záznam do oddílu <b><c1/></b>, ve správné skupině (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

seg-76ddc53c752e = Při vydání přejmenujte <c1/> na novou <c2/>, začněte novou <c3/>, zvyšte <c4/> v <c5/> (aby <c6/> ve výsledném JSON odpovídalo), aktualizujte odkazy na porovnání dole a označte značkou <c7/>.

seg-ed680e59377c = Záznamy pište stručně a z pohledu uživatele; kde je to užitečné, odkazujte na issues/PR.

seg-fe83216ebeed = Pull request, který mění chování bez záznamu v changelogu, je neúplný.

seg-776cd2ef0b0c = Exportní kontrola

seg-d0f1db9798a6 = Odolnost PNT a kvantové snímání se mohou dotýkat kontrol vývozu zboží dvojího užití. Veřejný repozitář držte u obecných, zveřejněných modelů a metod. Cokoli, co se podobá hloubce odolnosti a ochrany proti spoofingu citlivé z hlediska vývozu, patří do soukromé nadstavby, ne sem. Pokud si nejste jisti, zeptejte se dříve, než to přispějete.

seg-506a29aafc12 = Licence

seg-c0409a1226ca = Kshana je licencována duálně (AGPL-3.0 <b>nebo</b> komerční licence od Ashforde OÜ — viz <a1><c1/></a1>). Aby to nadále fungovalo, musí být příspěvky použitelné pod <b>oběma</b> licencemi. Přispíváním tedy souhlasíte s tím, že:

seg-da7b02ac890c = váš příspěvek je licencován příchozí licencí <b>AGPL-3.0-only</b>; a

seg-8d6ed0d3a17f = <b>také udělujete Ashforde OÜ</b> trvalou, celosvětovou, bezúplatnou, neodvolatelnou licenci k užití, úpravě a <b>podlicencování vašeho příspěvku jako součásti komerčně licencované edice Kshana</b> (tj. k šíření i za jinými než AGPL komerčními podmínkami). Autorská práva k příspěvku si ponecháváte.

seg-3b1a0dd6b5aa = Toto lehké duální licenční udělení — nikoli převod autorských práv — umožňuje, aby projekt zůstal otevřený <em>a zároveň</em> nabízel komerční edici. Pokud nemůžete udělit ({ "2" }) (například u kódu vlastněného zaměstnavatelem), uveďte to ve svém pull requestu před přispěním.

seg-6630d0ac4ad5 = <b>Výjimka: <c1/>.</b> Tento adresář je licencován <b>GPL-3.0-or-later</b> (viz jeho <c2/>) a je mimo komerční licenci. Příspěvky do něj jsou licencovány příchozí licencí GPL-3.0-or-later <b>pouze</b>; udělení ({ "2" }) se na ně nevztahuje.

seg-0a78a12b1188 = Každý commit podepište, abyste potvrdili <a1>Developer Certificate of Origin</a1>: <c1/> (přidá řádek <c2/>).

seg-9f86d8f58b17 = <s1>Předchozí</s1>Bezpečnost

seg-fc760238e9a5 = <s1>Další</s1>Správa projektu
