# docs--slot-timing: translations (cs)

seg-f917e7fcac09 = Co to je

seg-adc34608c46b = Třída

seg-3a0e724a8a2b = Úroveň

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Význam

seg-582fd72f1a1a = Verdikt

seg-f63dd3d7aad4 = Zdroj

seg-1ff32b87e030 = Družice

seg-430edd66bda0 = Nemodelováno

seg-f23c8bd5f203 = Zdroj: <c1/>

seg-1f2727dc4ca4 = Druh scénáře <c1/> odpovídá na tři otázky pro hodiny, které mezi synchronizacemi běží volně a musí udržet provoz uvnitř <b>časově indexovaného slotu</b>: směrovacího, úkolovacího nebo kontaktního slotu, jehož <b>guard</b> je největší absolutní časová chyba, na kteroukoli stranu, při níž slot ještě funguje.

seg-6b39d8afeb5d = <b>Kdy guard selže?</b> Sekundy od poslední korekce do okamžiku, kdy predikovaná časová chyba dosáhne guardu, s rozepsaným každým přispívajícím členem a pojmenovaným dominantním.

seg-60476d723e1a = <b>Kolik času zbývá nyní?</b> Tatáž hodnota minus čas, který již od korekce uplynul.

seg-84010982db35 = <b>Jak často musí hodiny provést korekci?</b> Největší interval mezi korekcemi, který drží chybu uvnitř guardu, po odečtení latence, než se korekce projeví.

seg-3388d46925f1 = Nepovinná sekce <c1/> přidává ochrannou úroveň časování (TPL) pro přijímač na oběžné dráze; viz <a1>Spoofing přijímače na oběžné dráze</a1>.

seg-2eb266d992b0 = Přibalený příklad spusťte pomocí <c1/>.

seg-624e7a70c4f6 = Zkratky: GNSS, globální družicový navigační systém; TCXO, teplotně kompenzovaný krystalový oscilátor; OCXO, termostatovaný krystalový oscilátor; RAFS, rubidiový atomový frekvenční etalon; CSAC, čipové atomové hodiny; USO, ultra stabilní oscilátor; DSAC, atomové hodiny pro hluboký vesmír; ADEV, Allanova odchylka; FM, frekvenční modulace (zde šum na frekvenci hodin); PM, fázová modulace (šum na jejich fázi); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, sektor telekomunikační standardizace Mezinárodní telekomunikační unie; TIE, chyba časového intervalu; MTIE, maximální chyba časového intervalu; TDEV, časová odchylka; max|TE|, maximální absolutní časová chyba; CUSUM, detektor změny na bázi kumulativního součtu; TPL, ochranná úroveň časování; LEO, nízká oběžná dráha Země; NIST SP, zvláštní publikace Národního institutu standardů a technologie; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (časopis IEEE Transactions); IGS, International GNSS Service; GPS, Global Positioning System; Block IIF, družice GPS Block II Follow-on; SHA-256, 256bitový Secure Hash Algorithm; PPS, impuls za sekundu.

seg-f2a0c73ef648 = Model chyby

seg-6bc3f9e78346 = Predikovaná časová chyba po setrvání <c1/> sekund od korekce je

seg-3fbb186c716a = koeficient pokrytí ({ "3" } odpovídá asi { "99.7" } % gaussovské chyby)

seg-883965151598 = jednosigmová časová chyba korekce

seg-b63c0447865f = jednosigmová chyba frekvence známé při korekci; frekvence odhadnutá v okně <c1/> nese asi <c2/>

seg-ab28fc69d3ac = rozptyl bílého fázového šumu: chvění časové chyby, konstantní podlaha

seg-8792541a7b6d = hustoty bílého FM, FM náhodné procházky a FM náhodného běhu (členy van Loana z <c1/>)

seg-5d36b32c4de8 = podlaha flicker FM Allanova rozptylu

seg-65da5a90685f = zbytkový relativní frekvenční posun zbylý po korekci

seg-816e427d51f9 = frekvenční posun ze změny teploty <c1/> prostřednictvím teplotního koeficientu <c2/>

seg-e23d0ac960aa = lineární rychlost stárnutí

seg-43e5f75b369c = Každý člen FM se rovná <c1/> pro svůj vlastní typ šumu, s <c2/> (Zucca a Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Pro bílý FM, FM náhodné procházky a FM náhodného běhu je tento vztah přesný. Pro flicker FM jde o konvenční odhad chyby predikce času (Riley, NIST SP { "1065" }): flicker FM nemá bez nízkofrekvenčního omezení uzavřený tvar. Frekvenční posuny se sčítají v absolutní hodnotě, protože jejich znaménka nejsou známa, takže deterministická část je nejhorší případ. Každý člen je nezáporný a v <c3/> neklesající, takže <c4/> má jediný kořen, nalezený uzavřením do intervalu a půlením.

seg-f9038fba23e2 = Odkud se hodiny berou

seg-5c44b2f8d015 = Klíč scénáře

seg-cb92ae98c231 = Výchozí hodnota třídy

seg-7594664253f2 = jedna citovaná jednosekundová ADEV a syntetizovaná podlaha červeného šumu o dvě a čtyři dekády níže

seg-794e4932b470 = MODELLED: odpověď pro stabilní hodiny určuje předpokládaná podlaha

seg-5ea820aaa69f = Předvolba z datasheetu

seg-c943490619f3 = předvolby telekomunikačního časování (<c1/>, <c2/>, <c3/>, <c4/>), každá pojmenovaný datasheet firmy Microchip

seg-a20353d50011 = MODELLED: obálka maxim z datasheetu

seg-b543f3dcd11a = Vložený datasheet

seg-4983ec096617 = vlastní tabulka ADEV zákazníka, stárnutí a teplotní koeficient

seg-b079bca8a611 = MODELLED: obálka uvedených maxim

seg-119d94700cab = Změřený záznam

seg-ae6835f0c3c5 = fázový záznam; jeho překrývající se ADEV se proloží váženou metodou nejmenších čtverců

seg-6e1c4702186d = inverze je VALIDATED na zadrženém skutečném záznamu (níže)

seg-f4cc2be238b7 = Tři třídy přidané ve verzi { "0.28.0" } citují každá jeden veřejný datasheet:

seg-47f6ddc3bd02 = Jednosekundová ADEV

seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, sloupec základního TCXO

seg-becbff195fff = Datasheet Microchip OX-208, Rev 12-1-2021

seg-19d8d32203f6 = Datasheet rubidiového frekvenčního etalonu Microchip 8040C, DS00003047A

seg-48babc170b93 = Řádky EndRun s dlouhými středovacími dobami se napříč touto tabulkou sbíhají ({ "4e-13" } u každého oscilátoru kromě TCXO, { "8e-13" }, při { "10 000" } s a { "6e-14" } u všech při { "100 000" } s), což naznačuje, že popisují disciplinovaný produkt, nikoli volně běžící oscilátor, a proto se nepoužívají.

seg-85c7211bb49b = <b>Proložení záznamu je vážené.</b> Odhad Allanova rozptylu s <c1/> ekvivalentními stupni volnosti má rozptyl asi <c2/>, takže každý bod vstupuje s rezidui <c3/>. Neváženým proložením rozhodovaly krátké středovací doby o členech pro dlouhé středovací doby: na testovacím záznamu s bílým FM vzniklo falešné flicker minimum, které zkrátilo { "2 000" } s dlouhé překročení o { "30" } %. Datasheet nebo záznam podporuje středovací doby pouze do svého nejdelšího bodu; překročení za touto hranicí se označuje <c4/>.

seg-5b61a42c76c2 = Validace: inverze na zadržených skutečných hodinách

seg-2220a1490923 = <c1/> používá záznam o { "556" } 990 vzorcích cesiového etalonu 5071A měřeného proti vodíkovému maseru (A. Wallin, distribuováno s <c2/>; tentýž záznam používá odhadové orákulum <c3/>). S maserem jako referencí jde o 6,4denní volný běh.

seg-9bae4571f67c = Model šumu se proloží pouze na <b>první třetině</b> záznamu.

seg-15b2cb621db7 = Z tohoto modelu se předpoví doba setrvání, při níž jednosigmová časová chyba dosáhne { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } a { "2.5" } ns.

seg-1bd9ac435bfa = Na <b>zbývajících dvou třetinách</b> se vždy po { "997" } s od synchronizačního bodu setrvává s frekvencí odhadnutou z předchozí třetiny a měří se, kde efektivní hodnota chyby setrvání dosáhne každého prahu.

seg-d7640a2ec444 = Práh splnění, stanovený před prvním spuštěním testu, je každé predikované překročení v rozmezí faktoru { "1.5" } od naměřeného. Kontrola, jednosekundová ADEV čtená jako bílý FM, tento práh musí nesplnit, aby práh dokázal rozlišit dobrý model od špatného. Test vypisuje svou tabulku; mutace, která sníží úroveň bílého FM na polovinu, jej nesplní. Surový záznam jsou data třetí strany ignorovaná gitem: stahuje je <c1/> a workflow <c2/> spouští test s <c3/>, takže chybějící soubor tam selže, místo aby se přeskočil.

seg-3d11f7c6d4ab = Co to ověřuje: cestu proložení a inverze, na atomovém etalonu s dominantním bílým FM, při setrvání do asi { "50 000" } s. Co ne: zdroje datasheetů a tříd, deterministické členy a krystalový oscilátor (další oddíl).

seg-bfcc5555ed50 = Totéž předpovídání na skutečném krystalovém oscilátoru: konzervativní, nevalidované

seg-b77b3f503ca2 = <c1/> používá změřený OCXO: { "19 982" } jednosekundových odečtů frekvence oscilátoru { "10" } MHz v impedančním analyzátoru HP, proti vodíkovému maseru (A. Wallin, { "2015" }, distribuováno s <c2/>; <c3/>). Model šumu a lineární drift se prokládají na první třetině; každé setrvání na zbývajících dvou třetinách začíná od frekvence odhadnuté z předchozích { "100" } s a model nese nejistotu tohoto odhadu (<c4/>, vlastní Allanova odchylka modelu při { "100" } s).

seg-e05821406c28 = Proloženo na

seg-c70aadbd47d4 = Predikované ÷ změřené překročení, { "0.2" } až { "10" } ns

seg-d71582148b20 = Výklad

seg-dcc3fd23bede = první třetina (zadržená)

seg-f9bb286f5868 = { "0.59" } až { "0.70" }

seg-612784f70090 = konzervativní: nikdy později než změřeno, většinou mimo práh { "1.5" }

seg-121fa832c30f = samotný hodnocený úsek (diagnostika)

seg-b4be9afa69ac = { "0.98" } až { "1.17" }

seg-75e1515b970a = inverze je správná; mezera u zadržených dat je změna oscilátoru

seg-c91da69e9c09 = Šumová podlaha oscilátoru se během záznamu snížila na polovinu: Allanova odchylka první třetiny se plochí poblíž { "7.5e-12" }, zbytek poblíž { "3.5e-12" }. Model proložený brzy šum nadhodnocuje, což je bezpečný směr. <b>Případ krystalu proto není validován a zůstává MODELLED.</b> U krystalu proložte ustálený záznam a znovu proložte, jak součástka stárne.

seg-6230fed0e164 = <b>Jak byl protokol zvolen, uvedeno proto, že to nebylo naslepo.</b> První průzkumný běh převzal protokol pro cesium (frekvence z předchozí třetiny, žádný frekvenční člen) a předpověděl překročení { "1.4" } až { "2.5" }krát později, než se naměřilo: optimisticky, v nebezpečném směru. Frekvence krystalu putuje, takže frekvence odhadnutá hodiny před korekcí je zastaralá a model neměl člen pro to, jak dobře je frekvence při korekci známa. Člen <c1/> byl přidán z tohoto důvodu a tento protokol byl stanoven před napsáním testu; práh splnění nebyl posunut. Test také kontroluje, že bez tohoto členu je predikce na vzorku optimistická při každém prahu, takže člen je nosný.

seg-88e01cac525a = Totéž předpovídání na atomových hodinách na oběžné dráze: { "8" } z { "10" }, nevalidované

seg-17962966b6d6 = <c1/> používá finální kombinované hodiny IGS po { "30" } s po dobu { "14" } dnů ({ "17" } až { "30" } srpna { "2025" }; <c2/>, každý soubor zafixován pomocí SHA-256): hodiny každé družice GPS Block IIF proti časové škále IGS. Protokol (sada družic, pravidlo mezer, okno proložení, synchronizace každých { "3 570" } s s frekvencí z předchozí hodiny, prahy { "1" } až { "20" } ns, práh { "1.5" } a pravidlo, že třída projde jen tehdy, když projde každá družice) byl sepsán dříve, než byla stažena jakákoli data.

seg-1b5832633c87 = Predikované ÷ změřené překročení

seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

seg-9a6fac366156 = { "0.76" } až { "1.46" }

seg-c14941cb5537 = v rámci prahu

seg-dbaaf875f1fb = { "1.51" } až { "1.99" }

seg-3601e13c39b6 = optimistické

seg-ea41cf6dbec2 = { "1.20" } až { "1.61" }

seg-099fb000bf57 = nehodnoceno

seg-a7699b256ee1 = vyloučeno pravidlem mezer (chybějící den)

seg-eb71202e0b91 = Osm z deseti je užitečný důkaz, ale u dvou družic se předpovídá, že vydrží déle, než vydržely, což je nebezpečný směr, a protokol vyžaduje, aby prošla každá družice. <b>Orbitální případ proto zůstává MODELLED.</b> Družice Block IIF nesou rubidiové i cesiové etalony a soubory IGS neříkají, který je aktivní, takže výsledek je uveden pro družice, nikoli pro jeden typ hodin. Proč se G25 a G30 liší, nebylo zkoumáno.

seg-a9be8a92b6b9 = Běh na testovacím zařízení pro součástku reprezentativní pro let (vymezeno, neprovedeno)

seg-43597df55508 = Veřejný záznam OCXO je dlouhý { "5.5" } hodiny, z jednoho laboratorního přístroje, s oscilátorem, který se ještě ustaloval. Případ krystalu by ověřil delší změřený volný běh OCXO nebo CSAC reprezentativního pro let proti referenci:

seg-e2698f00a84a = čítač časových intervalů porovnávající { "1" } PPS oscilátoru s referencí disciplinovanou GNSS nebo maserem, nejméně { "10" } dnů při jednom vzorku za sekundu, se zaznamenávanou teplotou;

seg-c4c902ac028e = tentýž protokol se zadržením dat: proložit na první třetině, předpovědět překročení, měřit na zbytku, se stejným prahem a kontrolou;

seg-0faaa6279195 = záznam a jeho hash zveřejněné vedle testu, aby byl řádek reprodukovatelný.

seg-9b2255563582 = Závisí na přístupu k referenčnímu hardwaru a neslibuje se.

seg-6cb2dc94d1bf = Vůči které metrice kolísání má být slot přijímán?

seg-f6d24245dca6 = Časovací normy nabízejí tři rodiny metrik. Pro časově indexovaný slot z nich jen jedna měří to, co slot ničí.

seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) je největší rozkmit TIE od vrcholu k vrcholu uvnitř libovolného okna dané délky. Konstantní posun nevidí: hodiny, které jsou o { "1" } µs vedle, ale dokonale stálé, mají MTIE blízko nule a míjejí každý slot. Měří, o kolik se chyba <em>mění</em>, nikoli kde <em>je</em>.

seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) je sestavena z druhých diferencí středované fáze. Odstraňuje konstantní posun a konstantní chybu frekvence, což jsou právě členy, které při setrvání dominují. Charakterizuje typ šumu; není to metrika přijetí pro absolutní časování.

seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; rozpočtová metrika G.8271) je největší absolutní časová chyba vůči referenční časové škále. Lze ji přímo porovnat s guardem.

seg-7eefc395a118 = <b>Závěr.</b> Slot přijímejte podle max|TE| vzhledem k referenční časové škále sítě, vyhodnocené jako predikovaná obálka od poslední korekce při uvedeném koeficientu pokrytí. To je to, čím <c1/> je: protože každý člen roste s <c2/>, maximum přes setrvání o délce <c3/> je <c4/>. MTIE a TDEV zůstávají užitečné jako diagnostika: TDEV k určení, na který šumový člen zaútočit, MTIE(L) k omezení, o kolik se chyba pohne během slotu o délce <c5/>.

seg-51d4ee8484d7 = Dvě upřesnění, která volba metriky přináší:

seg-a52524111ed7 = <b>Guard platí pro relativní chybu mezi dvěma uzly.</b> Pokud vysílač i přijímač setrvávají nezávisle, jejich stochastické chyby se sčítají kvadraticky a deterministické v absolutní hodnotě. Když dominuje stochastická část, lze každému uzlu dát <c1/>; když dominuje stárnutí nebo teplota, <c2/>.

seg-073fe7cd8e63 = Koeficient pokrytí je návrhová volba, nikoli vlastnost hodin.

seg-eb1cbf9fda2d = <c1/> pokrývá asi { "99.7" } % gaussovských chyb v jednom okamžiku, nikoli přes každý slot za den; plán směrování s mnoha sloty za den potřebuje riziko na slot, které snese.

seg-04734b8a115b = Spoofing přijímače na oběžné dráze

seg-9e734bbda345 = Sekce <c1/> vyhodnocuje <c2/> pro tytéž hodiny:

seg-a2f21a643389 = <b>Geometrie.</b> Pozemní spoofer dosáhne na družici LEO jen tehdy, je-li družice nad jeho horizontem: ve výšce { "550" } km nejvýše asi dvanáct minut na jeden přelet nad hlavou. Spoofer s nárůstem rychlostí <c1/> tak může hodiny odtáhnout nejvýše o <c2/> násobek tohoto okna nebo násobek mezery do další nezávislé kontroly, je-li kratší (<c3/>).

seg-ff59489b08b8 = <b>Dynamika.</b> Souhlasný časový posun posune všechny pseudovzdálenosti stejně a je pohlcen do odchylky hodin, nikoli do polohy, takže kontrola polohy orbitálním propagátorem se za křížovou kontrolu časování nepočítá.

seg-4302cc49b91f = <b>Křížové kontroly.</b> Družice má málokdy druhý nezávislý časovací přijímač. Má setrvání vlastních hodin (monitor z <c1/>), obousměrný přenos času s pozemní stanicí během kontaktů a porovnání času přes mezidružicové spoje. Křížový spoj je nezávislý na jednom pozemním spooferu jen tehdy, je-li soused ve stejném okamžiku mimo dosah tohoto spooferu, což zpráva kontroluje z počtu družic na rovinu.

seg-16c15664a51c = <b>Podmíněná mez.</b> Podlaha monitoru plus setrvání hodin během latence detekce CUSUM, která se přesně redukuje na <c1/>, když hodiny nemají žádný člen flicker, bílé fáze ani náhodného běhu. Jako ta mez platí jen za předpokladu detekce.

seg-f7678693be22 = Vše je MODELLED: sférická, nerotující Země, přelet nad hlavou, jeden pozemní spoofer s uvedenou maximální rychlostí nárůstu. Směr příchodu signálů na anténě mířící do zenitu je skutečná křížová kontrola, která potřebuje směrovou charakteristiku antény a není modelována. <a1><c1/></a1> vysvětluje, proč podepsaná řídicí zpráva tuto hrozbu neodstraní.

seg-070a4e72b5ea = Skoky frekvence, radiační vlivy a relativistické frekvenční posuny; tepelný model (změna teploty je skok při korekci); samotný synchronizační protokol (korekce nastaví chybu na <c1/>).

seg-a2766c0f19d0 = <s1>Předchozí</s1>Optické spoje atmosférou

seg-85ad3eb72a80 = <s1>Další</s1>Telekomunikační časování
