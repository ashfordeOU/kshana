# docs--timing-hil: translations (cs)

seg-f8cf777c0caa = Povrchy

seg-f2ce7fc60cdf = Formát

seg-d00b65801e9b = Krok

seg-0d580ea8043d = Test holdoveru bodovaný ze záznamu časové chyby, ze skutečného běhu enginu v{ $version } na scenarios/holdover-test-example.toml ({ "601" } vzorků každých { "5" } s). GNSS je operátorem odebráno v { "600" } s a obnoveno v { "2400" } s; časová chyba na konci holdoveru dosahuje { "299" } ns, po { "675" } s překračuje rozpočet { "100" } ns a { "70" } s po obnovení se vrací do pásma { "100" } ns. Verdikty: základní masky PASS, masky holdoveru FAIL, obálka holdoveru FAIL, obnova RECOVERED. Měřeno proti masce, nejde o schválení. Časy jsou tvrzením operátora, Kshana je neověřila. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-7a1246297c82 = Zdroj: <c1/>

seg-6ea3dec83080 = Časování hardware-in-the-loop: odpojte anténu, ohodnoťte holdover

seg-5901f0b26939 = Telekomunikační a energetičtí operátoři zkoušejí časovací systém tak, že mu odeberou GNSS a sledují, co hodiny dělají. Kshana to za ně nedělá a jejich zařízení se nedotýká. Čte záznam časové chyby, který vytvořily vlastní přístroje operátora, rozdělí jej ve dvou časech, které operátor uvede, a <b>každý krok změří proti veřejným maskám ITU-T</b>. Druh scénáře je <a1><c1/></a1>; ukázkové scénáře jsou <c2/> a <c3/>.

seg-daf4b071bad0 = Toto je <b>stupeň { "1" }</b> hardwarové bezpečnosti: pasivní, pouze příjem, žádné RF od Kshana (<a1><c1/></a1>). Software pouze poradního charakteru, nikoli typově schválené zařízení. Tento postup nikdo nehodnotil, neschválil ani nezkontroloval a neříká nic o tom, zda systém splňuje doporučení.

seg-da0c48bbe011 = Postup

seg-e753ca7a1c99 = Operátor provádí čtyři kroky. Kshana neprovádí žádný z nich.

seg-0c338b956741 = Co dělá operátor

seg-ebd95b343349 = Co záznam ukazuje

seg-03999de98059 = { "1" }. Základ

seg-730f2037d22a = Nechá systém běžet zachycený na GNSS tak dlouho, jak test potřebuje (a poznamená si, kolik dní byl před tím zachycen).

seg-f45aae4139bd = Časová chyba při disciplinaci.

seg-0f050dcede80 = { "2" }. GNSS odebráno

seg-50c0df832eda = Odebere GNSS testovanému systému, například kabel antény u přijímače nebo výstup vlastního simulátoru laboratoře, a <b>zapíše si čas</b>. Nejprve zkontrolujte příručku výrobce přijímače: některé přijímače napájejí anténu a některé potřebují na otevřeném portu zakončovač.

seg-e371e7e357e3 = Okamžik, kdy časová chyba začne kolísat.

seg-f05dc0acb396 = { "3" }. Holdover

seg-a98186503e0f = Nechá systém na vlastním oscilátoru po plánovanou dobu.

seg-1da66cdca856 = Holdover systému.

seg-61197c9bad91 = { "4" }. Zotavení

seg-75af1f4fec83 = Obnoví GNSS a <b>zapíše si čas</b>.

seg-1259d36fc78c = Návrat časové chyby (nebo jeho absence).

seg-c09b1ea8f1a4 = Dvě věci musí udělat operátor, protože je Kshana udělat nedokáže:

seg-31f6c357864b = Uvést dva časy.

seg-59f9eb10035a = <c1/> a <c2/> jsou prohlášením operátora. Kshana neodhaluje odebrání ze záznamu a časy neověřuje. Chybný čas posune hranice kroků, a tím i výsledek.

seg-6d0d3186fbe3 = <b>Pro záznam i pro časy použijte tytéž hodiny.</b> U logu hodin časová osa začíná prvním odečtem, takže oba časy jsou sekundy od prvního řádku logu.

seg-bd181a831803 = Co zaznamenat

seg-52758c10be0a = Cokoli z následujícího, přes stávající čtečky <c1/> (<a1><c2/></a1>):

seg-fef0034cb88b = Přístroj

seg-ad6f33d70f3f = Jak se záznam pořizuje

seg-ef7f547609ad = linuxptp <c1/> (servo podřízených nebo hraničních hodin)

seg-f548a2ae96e5 = spusťte s <c1/> a ponechte řádky <c2/>

seg-9a3b58be1b0b = linuxptp <c1/>

seg-77255f8f5fef = řádky <c1/>

seg-2cf9256bd790 = linuxptp <c1/>

seg-c667a97b92a8 = řádky <c1/>

seg-ed305bcea4f8 = chrony <c1/>

seg-021b760aae59 = <c1/> v <c2/>

seg-a7f2d72a5cb7 = chrony <c1/>

seg-a70952a099d5 = <c1/> v <c2/>

seg-6ad29120ffe7 = čítač TAPR TICC

seg-32f703bfcab7 = režim časových razítek proti referenci

seg-6862a9ac9a68 = export ASCII z TimeLab

seg-b5e7e3a272d6 = fáze ve stanovené jednotce

seg-8af4aac4426f = soubor hodin RINEX

seg-21d5c43719f2 = jedny hodiny

seg-3a82b5295ab1 = cokoli jiného

seg-6bebda4a3c6c = <c1/> nebo <c2/>

seg-9a443cc0c444 = dvojice <c1/>, rovnoměrně vzorkované

seg-b8d1d45df70b = <b>Záleží na tom, co záznam měří.</b> Log serva (linuxptp, chrony) zaznamenává offset, který démon změřil a koriguje: je to časová chyba zbylá pod řízením serva, nikoli nezávislé měření hodin proti UTC. Během kroku holdoveru testu, který referenci skutečně odebírá, log serva stále ukazuje, čemu démon věřil, což se může lišit od skutečné chyby. Čítač TICC nebo jiný čítač proti nezávislé referenci je silnější záznam; při hlášení výsledku uveďte, který jste použili.

seg-6d4e25914d1c = Scénář

seg-ca1244db2387 = Volitelné klíče: <c1/> (název, <c2/>, zdroj; výchozí hodnoty telecom-timing, pokud chybí) a <c3/> uvnitř <c4/> pro výběr jednoho zdroje z logu, který jich obsahuje několik.

seg-38eb634b7f8f = Co zpráva obsahuje

seg-6a64755e11d6 = <b><c1/></b>: pro základ, holdover a zotavení začátek a konec, počet vzorků a střední, rms, největší a koncovou hodnotu časové chyby.

seg-cd11d0838c44 = <b><c1/></b>: každá maska, kterou jste uvedli, změřená na kroku, který její podmínka jmenuje. Maska napsaná pro zachycené hodiny se měří na základu; maska napsaná pro holdover nebo autonomní hodiny na holdoveru. Každá kontrola má svůj limit, naměřenou hodnotu, rezervu a tabulku, ze které je přepsána. Maska, která potřebuje delší záznam, než krok poskytl, je <b>INCOMPLETE</b>, nikdy se neextrapoluje; maska, kterou engine nedokáže pro vzorkovací interval záznamu vyhodnotit, je <b>NOT-EVALUATED</b> s uvedením důvodu.

seg-cb54e67ca4eb = <b><c1/></b>: relativní frekvenční offset, který systém držel (sklon přímky metodou nejmenších čtverců přes časovou chybu holdoveru, v ns/s, což jsou díly na miliardu), reziduum kolem této přímky, největší absolutní časová chyba a kdy nastala, a skok v okamžiku odebrání.

seg-daa40ac07396 = <b><c1/></b>: obálka holdoveru ePRTC-A podle tabulky { "3" } ITU-T G.8272.1, z <c2/>, s časem, kdy je poprvé překročena.

seg-cd480a1bf901 = <b><c1/></b>: čas po odebrání, kdy je každý rozpočet časové chyby poprvé překročen.

seg-007a0393cb39 = <b><c1/></b>: zda <c2/> vstoupila do pásma a zůstala v něm po dobu setrvání, jak dlouho po návratu GNSS to začalo, špička po obnovení a největší skok mezi po sobě jdoucími vzorky během zotavování.

seg-199497dfcc09 = <b><c1/></b>: MTIE a TDEV kroků základu a holdoveru.

seg-ce00a41a322f = <b><c1/></b>: jednoslovné shrnutí na krok.

seg-c09fc305ead1 = Každé číslo nese svou jednotku a to, odkud pochází, v bloku <c1/> zprávy.

seg-5d87a772c132 = Slova a limity

seg-0810b24c6f3e = Výsledek je <b>změřen proti masce</b>. Masky jsou přepsány z volně ke stažení dostupných doporučení ITU-T (tytéž tabulky jako druh <c1/>, uvedené v <a1><c2/></a1>) a každá položka, kterou doporučení nechávají „k dalšímu studiu“, chybí, není doplněna. Kshana netvrdí, že hodiny nebo systém splňují doporučení nebo jsou podle něj schváleny, a zpráva to netvrdí také.

seg-527189cf37c6 = <b>MODELLED.</b> Logika kroků, proložení přímky a pravidlo zotavení jsou kontrolovány na záznamech sestavených ze vzorců, jejichž výsledky jsou známy před během; žádný laboratorní holdover nebyl ohodnocen proti vnějšímu orákulu a žádný partner ani laboratoř se na ničem nedohodli. Než by bylo možné povýšit jakýkoli údaj pro třídu hodin, byla by zapotřebí časovací laboratoř.

seg-ad8160fbed46 = <b>Co se nepokrývá</b>, uvedeno v každé zprávě: zda bylo GNSS skutečně odebráno a obnoveno ve stanovených časech; každý krok, který operátor nezaznamenal; masky definované přes filtr { "0.1" } Hz pro záznam vzorkovaný pomaleji než jednou za sekundu; vlastní nejistota měření přístroje; a každý postup doporučení nad rámec záznamu časové chyby (teplotní profily, zátěž paketové sítě).

seg-cf681db42f05 = <b>Pásmo zotavení je vlastní volba testu.</b> Výchozí hodnota { "100" } ns je maximální absolutní časová chyba PRTC-A (ITU-T G.8272); je to pohodlná čára, nikoli požadavek kteréhokoli doporučení na zotavení.

seg-4ce2f2052df4 = <b>Žádná vysílací cesta.</b> Kshana čte soubory. Nevytváří signál a odebrání GNSS v laboratoři se provádí vlastním vybavením laboratoře a na její vlastní odpovědnost.

seg-0cff831a8444 = <c1/> je druh scénáře, takže běží všude, kde běží druhy: <c2/>, Rust API (<c3/>), vazba Pythonu (<c4/>), sestavení WebAssembly a npm (vložené <c5/> nebo <c6/>; klíče souborů tam nejsou dostupné), server MCP (<c7/>, pouze vložený obsah) a spouštěč scénářů Kshana Studio. Oba soubory scénářů jsou přibaleny (<c8/>).

seg-432c07a8e6f5 = <s1>Předchozí</s1>Podvedený čas

seg-8499ae539222 = <s1>Další</s1>Formáty logů hodin
