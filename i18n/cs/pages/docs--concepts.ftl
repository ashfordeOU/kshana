# docs--concepts: translations (cs)

seg-501402fc366f = Holdover hodin

seg-9c0eb89a2fbe = Balíček

seg-41b3740e1db9 = Zdroj: <c1/>

seg-8ab3fd09812d = Koncepty — srozumitelný úvod

seg-0f86d0a815d2 = Tato stránka vysvětluje, <em>co Kshana dělá a proč</em>, od nuly až po fyziku. V první části se nepředpokládají žádné předchozí znalosti; pozdější oddíly doplňují přesné vztahy pro odborníky. Definice pojmů jednoho po druhém najdete v <a1>Glosáři</a1>.

seg-34f76bad58cb = { "1" }. Problém v jednom odstavci

seg-45c0199e2224 = Téměř vše, co potřebuje vědět, <em>kde se nachází</em> nebo <em>kolik je hodin</em> — telefony, letadla, lodě, družice, elektrické sítě, finanční systémy — se opírá o signály navigačních družic (GPS (Global Positioning System) a jeho příbuzné systémy, souhrnně <b>GNSS</b> (globální družicový navigační systém)). Tyto signály jsou slabé a snadno se ztrácejí: jsou rušeny, blokovány nebo prostě nejsou ve výhledu, například ve vesmíru. Když k tomu dojde, systém musí <b>pokračovat sám</b> pomocí palubních senzorů — hodin pro udržení času a inerciálních senzorů pro sledování pohybu. Otázka, na kterou Kshana odpovídá, se snadno formuluje a obtížně měří: <b>jak dlouho a jak dobře může pokračovat?</b>

seg-ea1895772e76 = { "2" }. Proč „kvantové“?

seg-dd6871645f37 = Palubní senzory driftují. Hodiny pomalu ztrácejí čas; inerciální senzor pomalu ztrácí přehled o poloze. <b>Kvantové</b> hodiny a inerciální senzory driftují <em>mnohem pomaleji</em> než dnes používané klasické součásti — vozidlo by tak mohlo projet mnohem delším výpadkem GNSS a přitom zůstat v mezích své přesnosti. Tato výhoda je celým příslibem kvantového PNT (určování polohy, navigace a času). „Mnohem pomaleji“ je ale třeba převést na <b>čísla</b>: o kolik minut delší holdover? o kolik metrů menší drift? Tato čísla rozhodují o tom, zda se kvantový užitečný náklad vyplatí z hlediska ceny, hmotnosti a příkonu.

seg-a5d9dc0fb159 = { "3" }. Co Kshana skutečně dělá

seg-cb3a35ba696f = Kshana je <b>simulátor</b>, nikoli hardware ani návrh hardwaru. Provádí toto:

seg-cb7fdaf6738b = Vezme <b>scénář</b> — časovou osu s úsekem výpadku GNSS a zveřejněnými výkonnostními údaji senzoru.

seg-701c8c6d0e55 = Provede touto časovou osou <b>model chyb senzoru</b>: dokud je GNSS dostupné, model je disciplinován podle pravdy; během výpadku běží volně a kumuluje chybu přesně tak, jak to předpovídá fyzika.

seg-bc68e3d54e4c = <b>Vyhodnotí</b> výsledek proti provozním ukazatelům kvality (jak velká chyba naroste, jak dlouho zůstává ve specifikaci, jak důvěryhodný je odhad).

seg-32d31a9beb71 = U balíčků senzorů to provede <b>dvakrát</b> — jednou pro kvantový senzor, jednou pro jeho klasický protějšek — na <em>stejném</em> scénáři, takže srovnání je férové.

seg-07d8c6eb84e9 = Podstatné je, že engine o „kvantovém“ a „klasickém“ nic neví. Obojí jsou jen modely chyb s různými (zveřejněnými, citovanými) parametry. Rozdíl, který ve výstupu vidíte, je rozdílem zveřejněné fyziky — nic není ručně doladěno ve prospěch jedné strany.

seg-e20a7d3f32dc = { "4" }. Čtyři stavební kameny („balíčky“)

seg-638b8d451550 = Senzor

seg-f891ee876b96 = Na co odpovídá

seg-d1b122c389d4 = atomové hodiny

seg-768230c2eb02 = Jak dlouho zůstává <em>čas</em> přesný bez GNSS?

seg-029de6b99be0 = Inerciální výpočet polohy z pohybu

seg-f66f2d7b1d6d = akcelerometr (+ gyroskop)

seg-e067a035f656 = Jak rychle driftuje <em>poloha</em> bez GNSS?

seg-9ef8f99ca6e4 = Přenos času

seg-1267f82791f9 = optický / rádiový (RF, radio-frequency) spoj

seg-6f240700790d = Jak přesně si mohou dvě plavidla sdílet čas?

seg-90be2a6a29b1 = Hybridní fúze

seg-780cf1f1127e = vše výše uvedené

seg-6080a05ace19 = Drží <em>kombinované</em> řešení PNT?

seg-3f74a708a746 = Hybridní balíček je pointa: navigační řešení potřebuje <em>jak</em> dobrý čas, <em>tak</em> dobrou polohu. Ukazuje, že optický časový spoj dokáže udržet v synchronizaci i skromné hodiny — což znamená, že nejslabším článkem se stává <b>inerciální</b> senzor, a právě tam se kvantový akcelerometr vyplatí.

seg-5f55bb0fd7c5 = Nad rámec čtyř balíčků

seg-60191a2cd150 = Stejný engine spouští mnohem více <em>druhů</em> scénářů; <c1/> je vypíše všechny. Sahají za senzory k signálům a geometrii, na nichž senzory závisejí:

seg-995ed414d83d = <b>Kde jsou družice</b> — propagace oběžných drah, návrh konstelace kolem Země, Měsíce nebo jiného tělesa a polohy těles sluneční soustavy.

seg-bc8abce2a748 = <b>Co přijímač vidí</b> — azimutově závislá obzorová silueta (ulice, nábřeží, fjord) nad elevační maskou a geometrie oblohy, kterou zbývá: družice ve výhledu, jejich faktor DOP (zhoršení přesnosti) a chybová elipsa.

seg-b7a2c252c41c = <b>Co přijímač slyší</b> — spektrum v pásmu L pod rušičem, rušení a spoofing a ztráta uzamčení sledovacích smyček.

seg-f354743045c4 = <b>Zda lze odpovědi důvěřovat</b> — monitorování integrity (RAIM, autonomní monitorování integrity přijímačem, a jeho pokročilá podoba ARAIM) s ochrannými úrovněmi.

seg-69aa01a29a49 = <b>Alternativy ke GNSS</b> — porovnávání s mapami gravitace a terénu a určování polohy, navigace a času z družic na nízké oběžné dráze Země (LEO), od návrhu signálu přes rozpočet spoje a navigační zprávu až po určení polohy.

seg-297c98214b5b = <b>Časování pro sítě</b> — telekomunikační holdover kontrolovaný proti mezinárodním maskám a časování slotů pro časově indexované rozvrhy.

seg-7eba216a9bf2 = <b>Za hranicemi Země</b> — lunární čas a referenční soustavy, lunární oblasti služby a navigace přes reléové družice u Marsu.

seg-b796f49570ed = <b>Mnoho běhů najednou</b> — kampaně řetězí druhy na jedné časové ose, procházejí parametr nebo spouštějí soubor Monte Carlo.

seg-ef7f4e025018 = { "5" }. Poctivost už v konstrukci

seg-65fb8703baf9 = Simulátor je užitečný, jen když mu můžete důvěřovat. Kshana je postavena tak, abyste mohli:

seg-de8fd160db6d = <b>Každý parametr je citován.</b> Každý údaj senzoru nese řetězec <c1/>, který uvádí datový list nebo článek, z něhož pochází. Žádné anonymní konstanty.

seg-09d5cd11b127 = <b>Každý model se kontroluje proti učebnicovému vztahu,</b> nejen sám proti sobě — např. Allanova odchylka simulovaných hodin se musí shodovat se zveřejněnou hodnotou stability a inerciální drift se musí shodovat se standardním zákonem růstu chyby. Schopnost se označuje za <em>ověřenou proti nezávislé vnější referenci</em> jen tam, kde nezávislé vnější orákulum (skutečná datová sada, nezávislá implementace nebo zveřejněné referenční vektory) souhlasí; zbytek je <em>vypočteno z modelu</em> a <a1>verifikační matice</a1> říká, co je co.

seg-ccb5b2fe93c4 = Zralost je označena.

seg-5a0ac98febed = <a1>VALIDATION.md</a1> označuje každý efekt jako <c1/>, <c2/> nebo <c3/> a otevřeně uvádí, že údaje o optických hodinách jsou čísla <em>laboratorní / z cílů pro vesmír</em> — žádné optické hodiny se stronciem dosud nelétaly.

seg-de463596fcdb = <b>Výsledky jsou reprodukovatelné do posledního bitu:</b> stejný scénář, seed a verze vždy dají na téže platformě totožnou odpověď; napříč operačními systémy se hodnoty shodují na { "1e-6" } relativně (viz <a1>REPRODUCIBILITY.md</a1>).

seg-f87dad1ffc98 = { "6" }. Fyzika pro odborníky

seg-8fc6db9faf83 = Vztahy, které Kshana implementuje a testuje (podrobnosti a tolerance v <a1>VALIDATION.md</a1>):

seg-ea61f869c266 = <b>Holdover hodin.</b> Dvoustavový model fáze a frekvence s bílou frekvenční modulací (bílá FM, spektrální hustota výkonu <c1/>), FM s náhodnou procházkou (<c2/>), flicker FM (součet logaritmicky rozmístěných Ornsteinových–Uhlenbeckových procesů kalibrovaných na plochý Allanův práh) a deterministické stárnutí. Ověřeno pomocí překrývající se Allanovy odchylky proti zveřejněné hodnotě <c3/> (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

seg-4f46754c399f = <b>Inerciální výpočet polohy z pohybu.</b> Zbytkový bias akcelerometru → <c1/>; náhodná procházka rychlosti → <c2/>; volitelný bias gyroskopu a náhodná procházka úhlu vytvářejí chybu náklonu, která přenáší gravitaci (<c3/>) do horizontálního zrychlení (Groves).

seg-d59595d00f0a = <b>Přenos času.</b> Bílý časový jitter → přesnost synchronizace → jednosměrné měření vzdálenosti (<c1/>, { "1" } ps ≈ { "0.3" } mm); výběrový průměr se průměruje jako <c2/>.

seg-0eb7a53fb4a6 = <b>Fúze a integrita.</b> Dvoustavový Kalmanův filtr, jehož procesní šum odpovídá pravdivému modelu; při setrvačném dojezdu roste rozptyl jeho fázové chyby přesně na <c1/> — analytický vztah pro holdover — a jeho mez 1-σ vstupuje do ukazatele kvality Integrita.

seg-80daa7cb8641 = <b>Geometrie.</b> Keplerova propagace dvou těles (volitelně se sekulárním J2) nebo SGP4 (Simplified General Perturbations { "4" }) ze skutečných množin dvouřádkových elementů, konstelace Walker a viditelnost přímou viditelností (zákryt Zemí + elevační maska) odvozují dostupnost GNSS z orbitální geometrie, nikoli z ručně zadaných oken.

seg-4ce4c6b79b93 = { "7" }. Kam dál

seg-7c8344a26230 = Projděte si to: <a1>tutoriály</a1> — tři vypracované příklady + odstupňovaná cvičení.

seg-277f1b435cf6 = Spusťte to: viz rychlý start v <a1>README</a1>.

seg-c349981bd4f1 = Pochopte strukturu: <a1>ARCHITECTURE.md</a1>.

seg-f7acbf857c57 = Zjistěte, co je a co není ověřeno proti nezávislé vnější referenci: <a1>VALIDATION.md</a1>.

seg-04a86ea674a5 = Vyhledejte pojem: <a1>GLOSSARY.md</a1>.

seg-4a73b906888b = <s1>Předchozí</s1>Přehled

seg-2f14e84bfc99 = <s1>Další</s1>Glosář
