# docs--schema: translations (cs)

seg-2247a2344710 = Význam

seg-f42465f7d066 = ns

seg-f63dd3d7aad4 = Zdroj

seg-6940543aa3c0 = řetězec

seg-f5e7215e6835 = objekt

seg-9da5d92757bd = objekt, volitelný

seg-c353e7bec219 = Klíč

seg-a129b9e613d0 = Typ

seg-1448f90f0086 = Souhrn geometrie balíčku oběžných drah: <c1/>, <c2/>, <c3/> (m, modelovaný rozpočet chyby vzdálenosti na jednu družici), <c4/> / <c5/> (bezrozměrné) a <c6/> / <c7/> (m, PDOP (faktor zhoršení přesnosti v poloze) × <c8/>). <b>Pouze balíček oběžných drah.</b>

seg-ae4f8eed06ac = pole <c1/> v km, nepovinné

seg-d13d827f54b0 = Propagovaná dráha uživatelské kosmické lodi v zemském setrvačném souřadnicovém systému, jeden záznam na každý vzorkovaný čas. <b>Pouze balíček oběžných drah</b>; jinak se vynechává. Pouze výstup — nehashuje se.

seg-8f511d5de657 = objekt (<c1/>), nepovinný

seg-ea152e097d6f = Doplňková metadata zprávy (název studie, časové razítko vytvoření, autor, prohlášení). Při nepřítomnosti se vynechávají, takže běh bez metadat je bajtově shodný se starším výstupem. Pouze výstup — nehashuje se.

seg-1041873fba1b = <c1/> (každý z <c2/> / <c3/>)

seg-3fa81140c10d = Identifikátor senzoru (např. <c1/>).

seg-80765d202558 = Druh modelu (např. <c1/>).

seg-6bf458d964fe = Citace/zdroj parametrů senzoru.

seg-9145f04a557f = Použité surové parametry modelu.

seg-697940342a28 = pole <c1/>

seg-b5f4216b55a2 = Časová řada po jednotlivých krocích: <c1/> sekundy, <c2/> časová chyba v <b>nanosekundách</b>, <c3/> jedna z hodnot <c4/>/<c5/>/<c6/>.

seg-7fba0b91b75e = objekt (<c1/>)

seg-5c4b60012f0e = Vyhodnocené ukazatele kvality (viz níže).

seg-1308a29c6a5b = pole <c1/>

seg-bbd42065492c = Překrývající se Allanova odchylka: <c1/> střední doba (s), <c2/> bezrozměrná stabilita relativní frekvence σ_y(τ), <c3/> počet překrytí, na nichž ten bod stojí, <c4/> typ mocninného šumu určený ze sklonu MDEV (modifikované Allanovy odchylky) (např. <c5/>), <c6/> efektivní počet stupňů volnosti specifický pro daný typ šumu a <c7/>/<c8/> pás spolehlivosti { "95" } % založený na χ² pro <c9/> při daném τ. Počítáno v <c10/>.

seg-1e61fd18257f = Posouzení konzistence Kalmanova filtru (NIS/NEES (NIS: normalizovaný čtverec inovace; NEES: normalizovaná chyba odhadu na druhou) vůči jejich pásmům χ²), počítané v <c1/>; u běhů, které je neposuzují, se vynechává.

seg-9333864652b0 = <c1/> (objekt <c2/>)

seg-ce9caeaefd87 = Upozornění

seg-b24de276d788 = Efektivní hodnota (RMS) chyby fáze hodin (časování) během výpadku.

seg-53e5018ae276 = metrika <b>časování</b>, nikoli polohy

seg-8cdec6da2072 = 95. percentil časové chyby během výpadku.

seg-95f058adb809 = Nejhorší (nejkratší) setrvání ve specifikaci napříč úseky výpadku.

seg-48babfd3bd95 = <b>omezeno mřížkou</b> — dolní mez při rozlišení časového kroku

seg-41c08973baa1 = Růstová rychlost |chyby| během výpadku získaná metodou nejmenších čtverců.

seg-707ee74c5c06 = zlomek [{ "0,1" }]

seg-32e5fe6415f8 = Podíl celého běhu s řešením ve specifikaci.

seg-361b3b923a45 = zlomek [{ "0,1" }] nebo null

seg-5d55682f9349 = <b>Vlastní konzistence filtru</b>: podíl vzorků výpadku, jejichž skutečná chyba zůstává uvnitř Kalmanovy meze k-σ.

seg-636106cb4a40 = <b>NENÍ</b> integrita HPL/VPL/RAIM (HPL: horizontální ochranná úroveň; VPL: vertikální ochranná úroveň; RAIM: autonomní monitorování integrity přijímačem) — viz <a1><c1/></a1>

seg-f686ade3da21 = <b>Analytická mez detekovatelnosti spoofingu</b> odvozená ze stability hodin.

seg-f8783db25141 = smysl má jen při nakonfigurovaném útoku, takže balíčky hodin a oběžných drah (které žádný nekonfigurují) ji v <c2/> označují <c1/> a v souhrnu ji vypisují jako <c3/>; <b>není</b> to vícedružicový detektor RAIM

seg-90e2980430b9 = Jak vypadá „dobrý“ výsledek

seg-c1afc6f3c545 = <b>Klidnější hodiny</b> (nižší <c1/>) dávají delší <c2/> a vyšší mez detekovatelnosti <c3/> — to je kontrast mezi kvantovými a klasickými hodinami.

seg-0fa38207813a = <c1/> blízko { "1.0" } znamená, že systém zůstal ve specifikaci téměř po celý běh; při dlouhém výpadku u hodin s větším šumem klesá.

seg-4dcba241d5a6 = <c1/> blízko { "1.0" } znamená, že vlastní mez nejistoty filtru byla k jeho chybě poctivá — jde o výrok o <em>vlastní konzistenci</em>, nikoli o záruku bezpečnosti života.

seg-3099d75a04a5 = Další druhy scénářů

seg-43cd9f67f384 = Každý další druh vydává vlastní tvar výsledku. Několik běžných:

seg-6b59ef9dfe85 = <b>inertial</b>: ukazatele kvality v polohové oblasti v <b>metrech</b> (<c1/>, <c2/>) — jedna osa (1-DOF (DOF: stupeň volnosti)), jeden seed (viz <a1><c3/></a1>).

seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> a <c2/> na nejvyšší úrovni a pro každou stranu časovací a polohové hodnoty jedné sady senzorů (<c3/>, <c4/> a <c5/>, doba, než je překročena jedna ze specifikací), s blokem <c6/> podobným tomu v balíčku hodin, v němž jsou polohové hodnoty uvedeny jako <c7/>.

seg-e38e8a8adec8 = <b>spoof</b>: posun spoofingu v každém kroku oproti mezi detekce hodin a také to, zda spoofing dosáhl specifikace před detekcí (<c1/>).

seg-dfd972d160e1 = <b>skyline</b> (<c1/> a <c2/> s <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; přítomno jen tehdy, má-li scénář sekci <c8/>, takže scénář bez ní zůstává beze změny): objekt <c9/> na nejvyšší úrovni s <c10/> (řetězec: <c11/>, <c12/> nebo <c13/>), <c14/> (zlomek [{ "0,1" }] prostorového úhlu horní polosféry nad <c15/>) a <c16/> (řetězec); pro každý vzorek <c17/> (počet družic nad maskou, ale za skyline: <c18/> v <c19/> a <c20/>, <c21/> v <c22/>, <c23/> v <c24/>); a pro <c25/> <c26/> (počet epoch). Jejich jednotky a třídy původu jsou v bloku <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

seg-d113122b7454 = Přesný soubor polí kteréhokoli druhu najdete v jeho záznamu v <a1><c1/></a1> (níže), v sekci daného druhu v <a2><c2/></a2> nebo v odpovídající struktuře <c3/> v <c4/>.

seg-e0c63207c019 = Další soubory, které běh zapisuje

seg-cc97989ca06b = Vedle <c1/> zapisuje CLI (rozhraní příkazové řádky) soubor <c2/>, tisknutelný <c3/> a stejnou zprávu jako <c4/>, jejíž blok <c5/> zaznamenává verzi enginu, SHA-256 souboru scénáře, seed, platformu a přesný příkaz (viz <a1><c6/></a1> a <a2><c7/></a2>). Druhy, které publikují tabulku reprodukovatelnosti, zapisují také <c8/> (CSV: hodnoty oddělené čárkami). <c9/> zapisuje výměnné soubory (viz <a3><c10/></a3>) a <c11/> animaci (viz <a4><c12/></a4>).

seg-489953601f3b = Jednotky a původ pro každé pole u každého druhu

seg-61b33dbb44dd = Tato stránka je psána ručně a pokrývá balíčky hodin a oběžných drah. Strojově čitelný protějšek pokrývá <b>každý</b> vestavěný druh:

seg-1e20fcda7f0b = <b>Přímo ve výsledku.</b> Dokument výsledku každého scénáře nese objekt <c1/> na nejvyšší úrovni, který mapuje cestu vydávaného pole na <c2/>. Gramatika cest (pole přispívá jedním segmentem s příponou <c3/>, sdíleným všemi jeho řádky; <c4/> je jednosegmentový zástupný znak pro objekty s datovými klíči) a uzavřený slovník původu jsou definovány v <a1><c5/></a1>.

seg-b8256437c0b7 = Jako jeden soubor.

seg-ae7136e34306 = <a1><c1/></a1> je sesbíraná sjednocená množina: pro každý druh každé číselné pole, které vydává z uvedeného zdroje, s jeho jednotkou, třídou původu, úrovní důkazů a definicí — a se jmenovitým uvedením (nikoli vynecháním) každého pole, které je zatím nemá. Jeho blok <c2/> nese počty.

seg-66af6dc065f7 = Obojí vynucuje <c1/>, který spouští každý registrovaný druh a selže, pokud vydávanému číselnému poli chybí jednotka a třída původu. Druhy, které zatím nejsou pokryty, jsou jmenovitě uvedeny v <c2/> tohoto souboru s důvodem, proč je každý otevřený, a jejich počet je zafixován, takže seznam se může jen zkracovat.

seg-ca49a577a07b = Po každé změně tvaru zprávy nebo bloku <c1/> JSON znovu vygenerujte:

seg-ce4351cf7673 = <s1>Předchozí</s1>Reference scénářů

seg-b988dcc329a4 = <s1>Další</s1>Použití skutečných TLE

seg-6585c8a3643d = ClockRun (každý z quantum / classical)

seg-299f8a9643f1 = FoMScores (objekt fom)

seg-e28387d70be0 = Zdroj: <c1/>

seg-49d2afecf5f1 = Schéma výsledku — čtení souboru Kshana <c1/>

seg-c128455c353c = Každý běh zapíše vedle scénáře verzovaný, sebepopisný artefakt JSON (JavaScript Object Notation). Tato stránka je ručně psaný průvodce čtenáře výměnnou obálkou a tvary výsledků pro <b>hodiny a oběžnou dráhu</b>: <b>jednotka</b> každého pole, kde se ve zdroji počítá a jak je číst. Kanonický typ je <c1/> v <a1><c2/></a1>; ukazatele kvality jsou <c3/> v <a2><c4/></a2>.

seg-092ea1e33a05 = <b>Není</b> to úplná reference polí. Engine rozděluje přes mnohem více druhů než tyto dva a každý vydává vlastní balíček. Úplná reference — jednotka, třída původu a definice každého číselného pole každého vestavěného druhu — je generovaná, nikoli ručně psaná: viz níže <a1>Jednotky a původ, pro každé pole každého druhu</a1>.

seg-e4c4b66a2f46 = Výměnná obálka (KIF, Kshana Interchange Format) — rozpoznání a kontrola verze artefaktu

seg-9b83bb817814 = Artefakty Kshana lze zabalit do neutrální, sebepopisné <b>výměnné obálky</b>, aby nástroj třetí strany mohl soubor rozpoznat a rozhodnout, zda jej umí číst, <em>dříve</em>, než se zaváže ke schématu nákladu. Kanonický typ je <c1/> v <a1><c2/></a1>.

seg-e4fd08930644 = Vždy <c1/> (<c2/>) — jak cizí nástroj rozpozná artefakt Kshana.

seg-abd853f2ce49 = Verze schématu <c1/> (<c2/>, jediný zdroj pravdy pro celý crate).

seg-ee9f238072f1 = Druh artefaktu, např. <c1/>, <c2/>, <c3/> — umožňuje konzumentovi směrovat bez zpracování těla.

seg-29ad4bedd64f = Verze crate (<c1/>), který vytvořil náklad.

seg-52f3e962c049 = Zabalený artefakt jako kanonický JSON (<c1/>, <c2/>, …).

seg-6fe0d7cd4165 = <b>Smlouva o kompatibilitě.</b> Verze jsou <c1/>. Nová pole se přidávají s <c2/> (<em>aditivní disciplína</em>), takže čtenář může zpracovat jakýkoli artefakt <b>téže hlavní verze a stejné či starší vedlejší verze</b> (<c3/>). Přísně <b>novější vedlejší verze</b> (<c4/>) může nést pole, která tento čtenář nedokáže respektovat, a <b>jiná hlavní verze</b> (<c5/>) je strukturální zlom — obojí odmítá <c6/>, který na hranici ověřuje značku formátu a verzi, místo aby cizí vstup mlčky chybně zpracoval.

seg-f7ae91002e56 = <b>Determinismus.</b> Obálka nenese <b>žádné časové razítko</b> — vyžaduje to slib reprodukovatelnosti Kshana (<c1/> reprodukuje běh). Původ je v <c2/> a ve vlastním <c3/> nákladu.

seg-bb0b742d2df8 = Typované zpětné čtení (<c1/>) funguje pro jakýkoli náklad, který implementuje <c2/> (např. <c3/>). Artefakty výsledků jsou záměrně jen serializovatelné a čtou se jako surová hodnota JSON <c4/>.

seg-87be7aa00b17 = Nejvyšší úroveň (balíčky hodin a oběžné dráhy)

seg-cc22d9206eb4 = Typ / jednotka

seg-3a821855c582 = Verze schématu výsledku (nezávislá na verzi enginu).

seg-cc6dded799f9 = Verze crate (<c1/>), který soubor vytvořil.

seg-5a69a99b9a87 = hexadecimální řetězec

seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) nad kanonickým JSON scénáře — běh je reprodukovatelný z <c1/>.

seg-ba73ba76873e = Seed RNG (generátor náhodných čísel) pro kvantový běh (klasický používá <c1/>).

seg-a688dd98c588 = nanosekundy

seg-24e0f04033fa = Specifikace časování: chyba v rozmezí ±<c1/> je „in spec“.

seg-f52388753a1a = scénář

seg-15b4082a6455 = objekt (<c1/>)

seg-7d3b92769bf5 = Běh kvantového senzoru (viz níže).

seg-aa665b955931 = Běh klasického senzoru, pro srovnání.

seg-152ae43896b3 = Mapa jednotek/původu pro každé pole tohoto dokumentu, klíčovaná cestou pole. Viz §Jednotky a původ níže.

seg-119bac9b3e6f = Verifikační úroveň každého uváděného ukazatele kvality, a vždy poslední klíč dokumentu. <c1/> uvádí jednu položku pro každý přítomný ukazatel: <c2/> (např. <c3/>), <c4/> (<c5/> = ověřeno proti nezávislému vnějšímu orákulu, <c6/> = z prvních principů, vnitřně testováno), <c7/> (řádek verifikační matice, z něhož se úroveň čte) a <c8/>. <c9/> je <c10/>, s <c11/>, pro <c12/> v každém scénáři bez nastaveného útoku: mez zůstává v <c13/>, ale neodpovídá na otázku, kterou scénář klade. <c14/> uvádí každý ukazatel, který nevlastní žádný řádek matice (polohové ukazatele <c15/> a <c16/>), místo aby mu přiděloval úroveň. Vydávají jej druhy <c17/> (jeden běh a soubor Monte Carlo), <c18/>, <c19/> a <c20/>, které jej sestavují uvnitř svého běhu, a ({ "0.36" }, RM-04) každý jiný druh pro své hlavní ukazatele, připojené po běhu z tabulky jednotlivých druhů <c21/>; <c22/> jej odstraní zpět na dokument bez úrovní bajt po bajtu. Nevydává jej <c23/>, jehož výsledek je zmrazená předregistrovaná předpověď (<c24/>): tento druh nemá <c25/>, dokud ji nenahradí nová datovaná předpověď. Nevydávají jej ani <c26/>, <c27/>, <c28/> ({ "0.37" }; pole pro jednotlivá stanoviště), <c29/> a <c30/>, které nemají skalární hlavní ukazatel, ani <c31/>, jehož dokument je kompaktní JSON (<c32/> uvádí každý důvod), ani vložené dokumenty členů kampaně. Nenese žádná čísla.
