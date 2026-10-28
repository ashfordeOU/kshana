# docs--lunar-infrastructure: translations (cs)

seg-cae10fb9bff8 = Scénář

seg-61817375c8ea = Měsíční oběžná dráha a povrch jako navigační a geodetická infrastruktura

seg-9872e31ebd72 = Zdroje

seg-922905241a6b = Zdroj: <c1/>

seg-bfb9c5efbe57 = Druh scénáře <c1/>, pět studií vybíraných pomocí <c2/>. <b>MODELLED</b>: omezený model tří těles s uvedenými zjednodušeními a ILLUSTRATIVE vstupy. Numerika je kontrolována nezávislými programy v numpy/scipy; nic se nesrovnává s měřením žádné lunární veličiny a nic zde není tvrzením o žádné misi ani systému. Bez vazby na žádnou agenturu a bez jejího schválení. Software pouze poradního charakteru, nikoli typově schválené zařízení. { -brand } nic nevysílá a neovládá žádný hardware.

seg-7908583855a2 = Návrhy, vstupy a prahy byly stanoveny v <c1/> (zapsáno před vyhodnocením jakékoli studie) a ve dvou zveřejněných dodatcích (<c2/>). Verdikt každého prahu je v <c3/>.

seg-d9d9d0864ae0 = Studie

seg-3b01a756c305 = Co počítá

seg-a4ef7c81b35f = Palubní určování oběžné dráhy z GNSS Země na NRHO (nebo <c1/>) proti nezávislému pozemnímu určování oběžné dráhy z dálky a rychlosti změny dálky ze tří stanic DSN; formální kovariance každého odhadu; Monte Carlo se seedem, zda obě kovariance vysvětlují svůj rozdíl (q, chí-kvadrát se { "6" } stupni volnosti); vložené nemodelované zrychlení

seg-849c67471e69 = <c1/> (rychlý), <c2/> (hodnocený, asi osm minut)

seg-b9c6eb8d778c = Společná dvojitě diferencovaná fáze nosné povrchové stanice a orbiteru; kovariance neceločíselných nejednoznačností; LAMBDA; úspěšnost z bootstrapu a Monte Carlo; sigma polohy s neceločíselnými a fixovanými nejednoznačnostmi

seg-74c347e0bc69 = Fisherova informace o 7parametrovém lunárním datu z měření vzdálenosti ze stanic na Zemi, s měřením vzdálenosti orbiter–povrchová stanice a bez něj; náhodné sady stanic se seedem

seg-4ed875c39781 = GNSS, VLBI a laserové měření vzdálenosti na jedné kosmické lodi: Cramér–Raova preciznost mezitechnických posunů proti chybě místního spojení

seg-de25104c09a2 = Informace o h2, k2, l2 a fyzické librace z laserového měření vzdálenosti, sledování orbiteru, gravimetru a povrchových hodin (konstanty sdílené s moduly lunárního času)

seg-18fc4ba766df = Konzistence palubního určování oběžné dráhy z GNSS Země na téměř přímočaré halo dráze s nezávislým pozemním určováním oběžné dráhy, ze skutečných běhů enginu v{ $version } na scénáři scenarios/lunar-infrastructure-od-consistency.toml a jeho variantě s chybou modelu (vždy { "400" } pokusů). Střední normalizovaný rozdíl q je { "5.81" } bez chyby modelu a { "5.95" } s vloženou chybou zrychlení { "3e-10" } m/s2, při očekávané hodnotě { "6" }: obě řešení oběžné dráhy jsou konzistentní (práh C1 MET). Podíl pokusů nad bodem { "95" } % je { "0.040" } a { "0.052" }; práh pro detekci vložené chyby byl alespoň { "0.5" }, takže je NOT MET (C3): palubní řešení je známo asi na { "352" } m oproti { "23" } m u pozemního, takže se desetimetrový posun ukryje v jeho kovarianci. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-4c08262e2556 = Fixace celočíselných nejednoznačností fáze nosné mezi lunárními povrchovými stanicemi a orbiterem, z uloženého výsledku hodnoceného běhu enginu v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } délky oblouků, vždy Monte Carlo o { "400" } losováních, zapsáno scénářem scenarios/carrier-phase-scored.toml). { "1" } den: úspěšnost { "1.0" } % (standardní chyba { "0.5" } %), { "134" } nejednoznačností, sigma polohy orbiteru { "45.6" } m bez fixace a { "18.5" } m s fixací; { "2" } dny: úspěšnost { "0.5" } % (standardní chyba { "0.4" } %), { "259" } nejednoznačností, sigma polohy orbiteru { "21.5" } m bez fixace a { "8.7" } m s fixací; { "3" } dny: úspěšnost { "2.8" } % (standardní chyba { "0.8" } %), { "375" } nejednoznačností, sigma polohy orbiteru { "6.3" } m bez fixace a { "2.1" } m s fixací. Celočíselné fixace není dosaženo: úspěšnost zůstává mezi { "1" } % a { "3" } % při { "25" } dBi a při předregistrovaných { "12" } dBi nelze úlohu sestavit. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-7e5b10641b20 = Preciznost sedmiparametrového lunárního data (tři posuny, měřítko a tři rotace) z měření vzdálenosti ze stanic na Zemi, s měřením vzdálenosti orbiter–povrchová stanice a bez něj, ze skutečného běhu enginu v{ $version } na scénáři scenarios/lunar-infrastructure-frame-coestimation.toml. Cramér–Raovo sigma posunů a rotací s odkazy orbiteru klesá (například t_z z { "0.98" } m na { "0.046" } m); nejmenší vlastní číslo informace roste 111násobně a stopa CRLB klesá na { "1.0" } % (práh F3 MET). Předpokládá se, že oběžná dráha je známa v lunárních osách a její chyba je zahrnuta do sigma vzdálenosti orbiteru { "1" } m. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-377d29dcc6e8 = Preciznost posunů mezi laserovým měřením vzdálenosti, VLBI a polohami z GNSS jedné kosmické lodi proti chybě pozemního místního spojení, ze skutečného běhu enginu v{ $version } na scénáři scenarios/lunar-infrastructure-space-tie.toml (jeden oblouk o délce 6,56 dne, sigma technik GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Při místním spojení od { "1" } mm do { "1" } m zůstává sigma posunu laser minus GNSS blízko { "1.04" } m, dokud spojení nedosáhne { "1" } m: je omezeno měřicím šumem technik, nikoli místním spojením. Dolní mez daná samotným spojením je odmocnina ze dvou krát jeho sigma. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-9d507a371319 = Která rodina pozorovatelných veličin je citlivá na lunární Loveova čísla h2, k2 a l2, ze skutečného běhu enginu v{ $version } na scénáři scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Každá buňka je efektivní hodnota (RMS) parciální derivace pozorování dané rodiny podle parametru, ve vlastních jednotkách té rodiny (buňky se tedy porovnávají napříč řádkem, nikoli ve sloupci); pomlčka znamená, že rodina nemá žádnou citlivost. Laserové měření vzdálenosti: h2 { "7.6" }, k2 žádná, l2 { "9.8" }. Sledování orbiteru: h2 žádná, k2 { "0.00086" }, l2 žádná. Povrchový gravimetr: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 žádná. Povrchové hodiny: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 žádná. Se všemi čtyřmi rodinami je Cramér–Raovo sigma { "0.36" } % nominální hodnoty h2, { "0.52" } % hodnoty k2 a { "1.16" } % hodnoty l2. Přidání rodiny nikdy nesnížilo nejmenší vlastní číslo ({ "28" } z { "28" } přidání), ale stopa pseudoinverze nebyla větší jen v { "16" } z { "28" }: tato polovina prahu G3 je NOT MET. Rodina orbiteru vidí integrál zrychlení k2 podél přímky pohledu, což je údaj z horního konce. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-570b9276834b = Uvedená zjednodušení

seg-ab053aadb65d = Země a Měsíc jako hmotné body na kruhové dráze, bez Slunce, bez lunárních gravitačních harmonik; rotační osa Země je normála dráhy; setrvačná soustava se v čase t = { "0" } rovná rotující soustavě; kulový Měsíc; synchronní lunární soustava (bez librace) kromě <c1/>; oběžná dráha se v <c2/> považuje za známou v lunárních osách (její chyba je zahrnuta do sigma vzdálenosti orbiteru); rodina orbiteru v <c3/> vidí integrál zrychlení k2 podél přímky pohledu po odstranění konstanty a lineárního trendu, což je údaj z horního konce.

seg-fd644b1f33ec = Tvar zprávy

seg-03efc65cbb0e = Každá zpráva obsahuje <c1/>, <c2/>, <c3/>, <c4/>, pole studie a blok <c5/> (jednotku a třídu původu pro každé číselné pole). Žádné časové řady se nevypisují. Seznamy polí: blok <c6/> každé zprávy a <c7/>.

seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), použito jako nominální hodnota. h2 a l2 jsou linearizační body, nikoli ověřené hodnoty. Souřadnice stanic DSN jsou hodnoty ITRF93 z komentářů jádra NAIF <c1/>; pásma přesnosti DSN byla převzata pouze ze shrnutí vyhledávání. Koncept vesmírného spojení vychází z veřejných popisů GRASP a ESA Genesis. Úplná tabulka s uvedením, jak byla jednotlivá hodnota převzata, je v předregistraci.

seg-6cd670ae6eea = Výsledky stručně (viz RESULTS.md)

seg-6334f82991d3 = Nesplněno a připnuto testy, které tvrdí nezdar: C3 (metrika vložené chyby se při { "3e-10" } m/s2 nespustí), polovina Q3 s bootstrapovanou mírou při { "1e-9" } a polovina G3 se stopou CRLB. Celočíselné fixace nejednoznačností není dosaženo při předregistrovaných vstupech. Nic není VALIDATED.

seg-1d3bffc2fd02 = <s1>Předchozí</s1>Navigace uživatelů ve vesmíru (gnss-ssv)

seg-90932eed0074 = <s1>Další</s1>Určování polohy, navigace a času na LEO

seg-c3b27dfb7bca = <s1>Další</s1>Vlákno mise: od startu po vstup do atmosféry
