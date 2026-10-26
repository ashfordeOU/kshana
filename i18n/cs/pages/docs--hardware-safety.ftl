# docs--hardware-safety: translations (cs)

seg-fdbb9db68f1d = žádné

seg-2015f437e669 = Zdroj: <c1/>

seg-10c7eaab58c5 = Bezpečnost hardwaru: co { -brand } s hardwarem dělá a co nikdy nedělá

seg-fe4873962140 = <b>Stav: čeká se na právní posouzení vlastníkem.</b> Níže uvedené právní poznámky jsou výklad veřejných zdrojů ze strany správců, napsaný tak, aby uživatel věděl, kde jsou meze. Nejsou právní radou, neposoudil je právník a právo se v jednotlivých zemích liší. Berte je jako důvod zeptat se právníka, nikoli jako svolení.

seg-bd2fbb355834 = { -brand } je software pouze poradního charakteru pro výzkum, simulaci a testování. Není to typově schválené zařízení a nehodnotí ani neschvaluje přijímač, hodiny ani laboratoř. Viz poradní prohlášení v README.

seg-f27c286787b1 = Pravidlo

seg-88638e41faab = Příjem je produkt. Vysílání není nikdy v otevřeném enginu.

seg-614d381dd0d0 = { -brand } neobsahuje žádný kód, který by ovládal vysílač. Neexistuje žádná vysílací cesta SDR (žádné vysílací volání UHD, HackRF, bladeRF ani Soapy) a žádný průběh rušení (jamming) ani spoofingu se nezapisuje do souboru určeného k přehrání.

seg-2e370a1c6c4c = Soubory, které { -brand } zapisuje (scény IQ, záznamy SigMF a ION <c1/>, exporty NMEA a bench), popisují <b>simulované, legitimní</b> signály nebo pohyb a metadata, která { -brand } ke scéně zapisuje, uvádějí, že byla zapsána příkazem <c2/> (komentář ION <c3/> uvádí, že jde o simulovanou scénu, nikoli záznam).

seg-8ce652bc1af6 = Kde experiment potřebuje RF na pracovním stole, vytvoří je <b>vlastní zařízení operátora</b> ve vlastním stínění operátora a s vlastním oprávněním operátora. { -brand } zaznamenává, co operátor uvádí, že bylo provedeno, a nikdy to nedovozuje.

seg-c74fc5d82071 = Fáze

seg-01e7633921dc = Každá fáze uvádí, co { -brand } dělá, jaký hardware je zapojen, kdo vysílá RF (pokud vůbec někdo), a podmínku, která musí platit, než { -brand } bude výsledek považovat za důkaz.

seg-324e16b11186 = Fáze

seg-bb269645d988 = Úloha { -brand }

seg-76c0861cbe83 = Hardware

seg-92ab27525ed1 = Vysílání RF

seg-c822f981cfcf = Podmínka

seg-00727bb577f9 = Stav ve verzi { "0.38" }

seg-1c566ec98a03 = Soubory: záznamy přehrávání, IQ, exporty bench, živé NMEA nebo UBX přes stdin, TCP nebo UDP

seg-0435986aa760 = dodáno

seg-56b9a4399108 = Pasivní příjem: přijímače pouze pro čtení; časové záznamy (linuxptp, chrony, TICC); CSV z IMU; <c1/> na rostoucím souboru SigMF

seg-608fc0a99107 = přijímače uživatele, grandmaster, SDR v příjmu

seg-786d9e5ccf93 = jakýkoli zápis konfigurace do přijímače vyžaduje výslovné <c1/>; výchozí stav je pouze čtení

seg-ab8874046283 = částečně dodáno: formáty časových záznamů, <c1/>, <c2/>; vstup ze sériového přijímače je plánován

seg-6b0a194d3f64 = Laboratorní orchestrace bez RF z { -brand }: specifikace zkušebních podmínek, kroky operátora (odpojení antény, spuštění simulátoru) vyzvané a opatřené časovou značkou, oboustranné skórování a důkazy

seg-8e2847bce9ac = simulátory ve vlastnictví laboratoře, stíněné boxy

seg-121fe22c92ec = pouze simulátorem <b>laboratoře</b>, vedeno kabelem

seg-0a704c5443c5 = podepsané <c1/> (níže) zaznamenané v balíčku důkazů; { -brand } odmítne skórovat laboratorní běh bez něj

seg-9e94d44cd197 = záznam je implementován v balíčcích důkazů; odmítnutí skórovat bez něj ještě ne (neexistuje příkaz pro laboratorní běh)

seg-ee5333e346ad = Vedené přehrání <b>legitimních</b> scén IQ GNSS: { -brand } zapíše soubor scény a uživatel jej přehraje vlastním nástrojem do kabelu s atenuátory a testovaným zařízením v RF stínění

seg-fa5b0f1b41f7 = SDR uživatele, atenuátory, stínění

seg-9049203a2a6e = pouze vedeně, odpovědnost uživatele

seg-b4392e583cb8 = žádný vysílací kód v otevřeném enginu; průběhy rušení a spoofingu zůstávají mimo rozsah; posouzení exportní kontroly; právník

seg-ced2afbf108f = není v otevřeném enginu; položka komerční edice, která se má řešit s právníkem

seg-0f8a0fce4d20 = Uzavřená smyčka RF hardware-in-the-loop v reálném čase

seg-d109f8e36ce8 = zařízení partnera

seg-fb26b352f56e = partner

seg-38c768d5faa7 = integrujte místo toho přes specifikaci fáze { "2" }

seg-458f37b807ba = neplánováno

seg-2e59d363e31b = „Dodáno“ znamená, že kód je v tomto vydání. Nic v této tabulce netvrdí, že by kterákoli fáze byla použita s jakýmkoli partnerem, laboratoří či úřadem; nebyla.

seg-1524fb5b0aba = Zásady

seg-82b8ed15bbe6 = Příjem je produkt a vysílání není nikdy v otevřeném kódu.

seg-63c000eccfc2 = Každá hardwarová relace vytvoří balíček důkazů s hashi vstupů, podmínek a použitých prahů.

seg-63cc5d9513ff = Vedené nebo stíněné potvrzení se zaznamenává, nikdy nedovozuje.

seg-da1e4f5da956 = Čísla pocházející z hardwaru zůstávají <b>MODELLED</b>, dokud se nezávislé vnější orákulum neshodne (například laboratorní referenční trajektorie nebo referenční hodiny). Předem zaregistrovaný práh se po běhu nezmírňuje.

seg-d8e445427d02 = Antény s řízenými diagramy, inerciální jednotky a čipové atomové hodiny se berou jako zdroje dat (diagramy, záznamy, publikované křivky stability), nikoli jako zařízení, která { -brand } ovládá.

seg-7a22a9591fa3 = Formulace: výsledek je „měřen proti masce“ nebo „podporuje důkazy pro (supports evidence for)“ požadavek. { -brand } netvrdí, že zařízení splňuje normu, a nikdo je neohodnotil ani neschválil.

seg-913509e5d6b2 = Právní poznámky (čeká se na právní posouzení vlastníkem)

seg-c18b68936406 = Příjem signálů GNSS je legální téměř všude. Vysílání v pásmech GNSS není.

seg-070d8a8d5494 = <b>Spojené státy.</b> Úmyslné rušení rádiové komunikace zakazuje { "47" } U.S.C. §{ "333" } a FCC proti rušičkám zasahuje (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Vysílání z pracovního stolu může dosáhnout i mimo něj.

seg-336b48c6f5f2 = <b>Jinde.</b> Správci právo jiných zemí neposuzovali. Komunita kolem gps-sdr-sim uvádí, že vysílání jeho výstupu je ve většině zemí zakázáno zákonem; berte to jako pracovní předpoklad všude tam, kde právník neřekl jinak.

seg-8d31cbd38718 = <b>Stíněné nebo vedené uspořádání je pojistka, nikoli oprávnění.</b> Níže uvedené potvrzení zaznamenává pojistku, o které operátor uvádí, že byla na místě. Vysílání tím nepřestává být protiprávní.

seg-7373bfd21035 = <b>Nahrávání.</b> Nahrávání rádiových signálů může na některých místech vyvolat otázky soukromí a zákonnosti. <c1/> i jakýkoli postup záznamu jsou pouze pro příjem a operátor odpovídá za to, kde a co nahrává.

seg-2edf9b14e62c = <b>Exportní kontrola.</b> Software hardware-in-the-loop, který ovládá generátory signálu, může podléhat pravidlům exportní kontroly. Proto je fáze { "3" } mimo otevřený engine.

seg-bcd59f201022 = <b>Nic z toho není doporučení ani dohoda.</b> O tomto dokumentu nebyl konzultován žádný regulátor, zkušební polygon, laboratoř ani dodavatel a nikdo z nich s ničím v něm nesouhlasil.

seg-81091020e648 = Pole <c1/>

seg-64918fd6895d = Pro fázi { "2" } a výše nese běh, na kterém se podílelo laboratorní vybavení, objekt <c1/>, zaznamenaný v balíčku důkazů vedle hashů vstupů. Je to prohlášení jmenovaného operátora, nikoli měření, a { -brand } je neověřuje.

seg-3bf153c63fa3 = Co je implementováno ve verzi { "0.38" }:

seg-bf212e141046 = <c1/> ověří soubor a zaznamená potvrzení do <c2/> balíčku. Manifest je kryt podpisem Ed25519 balíčku, takže záznam nelze upravit bez porušení ověření. Totéž je k dispozici jako argument <c3/> v Pythonu <c4/> a argument <c5/> nástroje MCP <c6/> (build pro prohlížeč balíčky nevytváří).

seg-431036f13a37 = Balíček vytvořený bez potvrzení je bajt po bajtu stejný jako dříve.

seg-4360b8fbdafb = <c1/> uvede potvrzení a konstatuje, že je „potvrzeno jmenovaným operátorem; neověřeno systémem { -brand }“.

seg-438bbe788314 = Potvrzení, které je neúplné nebo jehož <c1/> není ani <c2/>, ani <c3/> (uspořádání vysílané vzduchem se jako laboratorní běh nepřijímá), se odmítne a žádný balíček se nevytvoří.

seg-c8c40ed88dde = Co zatím <b>není</b> implementováno: pravidlo fáze { "2" }, že { -brand } odmítne <em>skórovat</em> laboratorní běh bez potvrzení. Ve verzi { "0.38" } nepřijímá žádný příkaz příznak laboratorního běhu, takže není co odmítat; pravidlo přijde spolu s příkazy laboratorní orchestrace. Potvrzení zaznamenává prohlášení operátora o pojistce. Nečiní žádné vysílání legálním a nemění označení výsledku: skórovaný laboratorní běh je MODELLED, dokud se nezávislé vnější orákulum neshodne.

seg-b0db377bce58 = Co to znamená pro přispěvatele

seg-c2e215edd86c = Nepřidávejte do otevřeného enginu vysílací cestu, vysílací závislost ani vysílací příklad.

seg-452b44a9ca8a = Nepřidávejte generátor průběhů, jehož výstupem je signál rušení (jamming) nebo spoofingu určený k přehrání.

seg-4df4d15a5f1c = Nové hardwarové vstupy jsou ve výchozím stavu pouze pro čtení; zápis vyžaduje výslovný příznak a řádek v tomto souboru.

seg-ee5f1fa9b822 = Nový příkaz, který se dotýká hardwaru, jde na každý povrch nebo je v <a1><c1/></a1> označen N/A s důvodem, a uvede zde svou fázi.

seg-7d65c3565acd = <s1>Předchozí</s1>Formáty záznamů hodin

seg-82eb53d4efbd = <s1>Další</s1>Integrita a bezpečnost

seg-8a78e520fc9e = Pole lab-attestation
