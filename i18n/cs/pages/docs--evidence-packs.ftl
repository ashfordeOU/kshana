# docs--evidence-packs: translations (cs)

seg-2247a2344710 = Význam

seg-ade1d7072512 = viz níže

seg-245fe1f87b08 = Soubor

seg-802d8b6f3afd = Zdroj: <c1/>

seg-710e7e630acb = Balíčky důkazů: podepsaný záznam události důvěry v GNSS

seg-dbc796deac2a = <b>Balíček je technický záznam, nikoli právní stanovisko.</b> Uvádí, co engine Kshana vypočítal z uvedeného záznamu přijímače při uvedené konfiguraci, a umožňuje komukoli ověřit, že se v něm nic dodatečně nezměnilo. Neříká, co událost způsobilo, kdo za ni nesl odpovědnost, zda byla splněna nějaká povinnost, ani že záznam ukazuje to, co přijímač skutečně přijal. Manifest i shrnutí to uvádějí.

seg-d99cb540310c = Balíček důkazů slouží pro zprávu o incidentu, pojišťovnu nebo dotaz regulátora: „co váš systém řekl o signálu GNSS mezi těmito dvěma časy a můžeme tomuto záznamu věřit?“

seg-2fa31fe443b4 = Vytvoření balíčku

seg-983924cb2eea = U balíčku vytvořeného z laboratorní relace <c1/> zaznamenává do podepsaného manifestu prohlášení operátora o uspořádání (vedené nebo stíněné, útlum nebo kryt, co vysílalo jakékoli RF); viz <a1><c2/></a1>. Zaznamenává se tak, jak je uvedeno, a nikdy se neověřuje.

seg-f01e59c876a3 = <c1/> a <c2/> jsou sekundy od první epochy záznamu, nebo čas UTC podle ISO-8601, když záznam uvádí vlastní čas začátku. <c3/> nesmí již obsahovat soubory. <c4/> přijímá skutečný čas UTC, například <c5/> (cokoli jiného se odmítne), nebo <c6/>, což čas vytvoření vynechá a učiní balíček byte po bytu reprodukovatelným. Čas vytvoření je takový, jaký uvede podepisující; nic jej nekontroluje proti hodinám, k čemuž slouží volitelný token časového razítka.

seg-c72ddd97ad0b = Soubor s klíčem obsahuje 32bajtový seed Ed25519 jako { "64" } hexadecimálních číslic; dodejte vlastní (například klíč uchovávaný ve vašem systému správy klíčů) nebo nechte <c1/> vytvořit jeden. <c2/> varuje, pokud je soubor čitelný pro jiné uživatele. <c3/> vylučuje <c4/>; pojmenujte svůj klíč tak, pokud leží v checkoutu.

seg-077cbd944c5d = Co je v balíčku

seg-7cf2608b2b2f = Struktura balíčku důkazů. Záznam přijímače (NMEA, u-blox UBX, RINEX { "3" } nebo záznam z Androidu) a časové okno vstupují do kshana receiver-trust evidence, který zapíše sedm souborů: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig a volitelný timestamp.tsr. Manifest zaznamenává SHA-256 celého záznamu a každého souboru a řetězec hashů přes soubory; podpis pokrývá manifest. kshana evidence verify kontroluje podpis, hash každého souboru, řetězec a že není přítomen žádný nevyjmenovaný soubor, a končí kódem { "0" }, když je vše ověřeno, { "1" }, když něco selhalo, a { "3" }, když podepisující nebyl připnut. Balíček je technický záznam, nikoli právní stanovisko.

seg-e305279d5b11 = Obsah

seg-05107c0bd3c8 = surové bajty záznamu přijímače pro dané okno

seg-b19ce12544a5 = scénář tak, jak byl spuštěn (každý práh monitoru, událost a pravidlo porovnání), monitory, které běžely, kalibrační základ a hash scénáře; u plavidla také poradní prohlášení, které nese každý výstup pro plavidlo (software pouze poradního charakteru, nikoli typově schválené navigační zařízení); od { "0.36" } též <c1/> (tabulka <c2/> skutečně použitá, váha monitoru geometrie, každý původ a pravidla tříd). Názvy adresářů a vložená data jsou odstraněny.

seg-e3c2457161bc = každá epocha v okně se statistikami enginu, poplachy (důvody) a stavem důvěry; od { "0.36" } také <c1/> družic (dobrá, zhoršená s důvody nebo neznámá, kde záznam neuvádí geometrii družic) a <c2/> u každého závěru (<c3/>, <c4/>, <c5/>)

seg-2e309765271f = samostatné shrnutí bez skriptů: identifikace, hashe, výsledky, důvody, dráha geometrie (epochy podle stavu geometrie) oddělená od tříd závěrů ({ "0.36" }), každý práh, tabulka po epochách a meze záznamu

seg-467277f816d2 = verze enginu, okno, čas vytvoření, formát a název záznamu, <b>SHA-256 úplného záznamu</b>, rozsah a SHA-256 výřezu, veřejný klíč a otisk podepisujícího, velikost a SHA-256 každého souboru a řetězec hashů přes soubory

seg-7a92ff70ed7f = podpis Ed25519 přes přesné bajty <c1/>

seg-b517814b077d = volitelný token časového razítka podle RFC { "3161" }

seg-6ad4c5f3afbe = <b>Výřez záznamu.</b> Čtečka uvádí zdrojový bajtový rozsah každé epochy, takže výřez je nejmenší bajtový rozsah, který obsahuje každou epochu v okně (<c1/>): NMEA, u-blox UBX, pozorování RINEX { "3" } a záznamy z Androidu. Hashuje se jako surové bajty, nikdy jako dekódovaný text. U živého přenosu nebo RINEX { "2" } rozsah neexistuje; pak se přibalí celý záznam a manifest uvádí <c2/> (okno omezuje, které epochy se uvádějí, nikoli které bajty se zahrnou). Shrnutí uvádí, který případ platí. Výřez je záznam bajtů okna, nikoli samostatný záznam: například výřez RINEX nemá hlavičku souboru.

seg-c4c81cbd4981 = <b>Řetězec hashů.</b> Manifest uvádí soubory v pevném pořadí. <c1/>; pro každý soubor <c2/> (délka jako { "4" } bajty, big-endian). Poslední článek je <c3/>. Přeřazení, odstranění nebo nahrazení souboru změní řetězec; podpis pokrývá řetězec.

seg-1147c5b0d348 = Ověření balíčku

seg-e716ddf7bcc9 = Návratový kód { "0" } znamená ověřeno; { "1" } znamená, že něco selhalo; { "2" } znamená chybu použití; { "3" } znamená, že balíček je neporušený, ale jeho podepisující nebyl připnut (viz níže). Každá kontrola hlásí splněno, selhalo nebo přeskočeno a každé selhání je pojmenováno:

seg-f6f2cebd9cb0 = Kód selhání

seg-312a5d784f42 = manifest nelze přečíst

seg-6f1b5d9d6711 = žádný podpis, není to 64bajtový podpis v hexadecimálních malých písmenech, nebo se neověří přes <c1/>

seg-129b78f142f1 = klíč není platný nebo se liší od toho, který jste dodali

seg-c86b25543d55 = uvedený soubor chybí nebo se liší od manifestu; soubor je pojmenován

seg-f98d26abf045 = soubor je v balíčku, ale není v manifestu

seg-842bac6a9e69 = článek neodpovídá tomu, co dávají jeho vstupy; soubor je pojmenován

seg-413034467a64 = manifest si odporuje nebo odporuje <c1/>

seg-ef4bfbedca33 = s <c1/>: záznam, který máte, není ten zaznamenaný, nebo výřez není tímto rozsahem z něj

seg-dcd686ac77f7 = Změna jediného bajtu kteréhokoli souboru způsobí selhání ověření s odpovídajícím důvodem: změněný artefakt se hlásí jako neshoda hashe tohoto souboru a nic jiného; změněný manifest způsobí selhání podpisu. Přepočet hashů a řetězce po úpravě souboru bez podpisového klíče nepomůže; selže pak pouze podpis.

seg-066fe7c07bf6 = <b>Připněte klíč.</b> Bez <c1/> balíček dokazuje jen to, že je neporušený vůči klíči, který sám uvádí a který může vygenerovat kdokoli. Ověření tedy končí kódem { "3" } a hlásí „INTACT, BUT THE SIGNER IS NOT PINNED“ místo „VERIFIED“; <c2/> přijme vlastní klíč balíčku vědomě a vypíše „VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)“. Veřejný klíč podepisujícího získejte od podepisujícího cestou, které věříte (nikoli z balíčku), a předejte jej pomocí <c3/>: { "64" } hexadecimálních číslic nebo soubor <c4/>. Omylem předaný soukromý klíč se rozpozná a odmítne. Otisk (prvních { "128" } bitů SHA-256 klíče, { "32" } hexadecimálních číslic) se vypisuje k porovnání pohledem; spolehlivou cestou je připnutí celého klíče.

seg-a01c7ba606c9 = Formát balíčku a postup ověření (normativní)

seg-fa43e16b6aba = Tento oddíl je specifikace, podle níž se píše nezávislý ověřovač. Slova psaná velkými písmeny jsou požadavky. Balíček je adresář (nebo libovolné zobrazení názvu souboru na bajty) souborů pojmenovaných přesně jako níže; ověřovač pracuje s bajty každého souboru tak, jak je uložen, a nikdy nic znovu neserializuje.

seg-1fbabb3f1092 = <b>Soubory.</b> Soubory artefaktů jsou v tomto pevném pořadí <c1/>, <c2/>, <c3/>, <c4/>. Balíček má také <c5/> a <c6/> a MŮŽE mít <c7/>. Jakýkoli jiný název je <em>nevyjmenovaný soubor</em>.

seg-3ed6e38ad2ee = <b>Hex.</b> Každý hexadecimální řetězec je pouze malými písmeny <c1/>, bez bílých znaků; velká písmena se nepřijímají. Hodnoty SHA-256 mají { "64" } číslic, veřejný klíč má { "64" } číslic, podpis má { "128" } číslic.

seg-6609210d003a = <b><c1/>.</b> Hexadecimální zápis malými písmeny o 128 číslicích 64bajtového podpisu Ed25519 (RFC { "8032" }, čisté schéma Ed25519) přes přesné bajty <c2/>, následovaný právě jedním <c3/> a ničím jiným. Podpis MUSÍ být kontrolován striktně: podpis, jehož hodnota S není menší než řád grupy L, je neplatný.

seg-b163e9f5db66 = <b><c1/>.</b> Objekt JSON v UTF-8. Jeho členové (ověřovač MUSÍ najít každého s uvedeným typem JSON; další členové se ignorují):

seg-ace92bcbfd8a = člen

seg-04f69a0edb2f = typ

seg-45425f378b61 = význam

seg-6940543aa3c0 = řetězec

seg-48d303baac62 = MUSÍ se rovnat <c1/>

seg-6e57561e7f01 = popisný

seg-abec93a4a488 = řetězec nebo null

seg-7d059c0b6372 = čas vytvoření, popisný

seg-507d53a53380 = objekt <c1/>

seg-bb2bcbbf404a = čísla, sekundy

seg-64572c65426f = nezáporné celé číslo

seg-14d421e391dd = počet položek pole JSON v <c1/>

seg-f5e7215e6835 = objekt

seg-a4117217030c = <c1/> řetězec, <c2/> řetězec, <c3/> hex, <c4/> nezáporné celé číslo, <c5/> řetězec nebo null a <c6/>

seg-02389e71a339 = <c1/> (přesně <c2/> nebo <c3/>; jakákoli jiná hodnota činí manifest chybně utvořeným), <c4/> a <c5/> nezáporná celá čísla (bajtové posuny, konec je vyloučen), <c6/> hex

seg-6c9176965aae = <c1/> řetězec (<c2/>), <c3/> hex ({ "32" } bajtů), <c4/> řetězec

seg-dcba59304030 = pole objektů

seg-e42ed5e07430 = jeden pro každý soubor artefaktu, v pevném pořadí: <c1/> řetězec, <c2/> řetězec, <c3/> nezáporné celé číslo, <c4/> hex, <c5/> hex

seg-b79c9500b744 = hex

seg-697592bd3757 = poslední článek

seg-9da5d92757bd = objekt, volitelný

seg-2032c208038d = přítomen pouze v balíčku vytvořeném z laboratorní relace (<c1/>): prohlášení operátora <c2/>, <c3/>, <c4/>, <c5/> (<c6/> nebo <c7/>), <c8/> nebo <c9/>, <c10/>, <c11/> a volitelně <c12/>, zaznamenané tak, jak jsou uvedeny. Je pokryto podpisem manifestu a nikdy se neověřuje; ověřovač je hlásí jako „attested by the named operator; not verified by Kshana“ (potvrzeno jmenovaným operátorem; Kshana neověřuje). Jinak chybí a balíček bez něj se nemění

seg-9411be425a80 = <c1/> je prvních { "32" } hexadecimálních číslic SHA-256 přes { "32" } bajtů veřejného klíče.

seg-80e55f2d3496 = Řetězec hashů.

seg-9346fe50efac = <c1/> je SHA-256 z { "23" } bajtů ASCII <c2/>. Pro každý artefakt v pořadí <c3/>, kde <c4/> se bere ze zaznamenaného <c5/> manifestu pro daný artefakt (takže řetězec je vlastností manifestu a kontroluje se proti němu, nikoli proti souborům).

seg-9dd985d8cb03 = <b>Postup.</b> Ověřovač provádí tyto kroky v pořadí a shromažďuje každé selhání; výsledkem je <em>množina</em> selhání, každé je <c1/> a tam, kde je to uvedeno, soubor <c2/>. NESMÍ se zastavit u prvního selhání, kromě uvedených případů. <c3/> je veřejný klíč, kterému má ověřovač důvěřovat, pokud nějaký byl zadán.

seg-abb1d2635143 = Žádný <c1/>: selhání <c2/>; zastavit.

seg-73a4aeb463e8 = Pokud <c1/> není objekt JSON se všemi výše uvedenými členy v uvedených typech (včetně položek <c2/> se všemi členy a <c3/>): selhání <c4/>. Jinak, pokud <c5/> není výše uvedenou hodnotou: <c6/>.

seg-36c9df2abf34 = Fáze podpisu. Tato fáze se provádí bez ohledu na to, zda byl manifest čitelný. Pokud byl manifest čitelný, <em>uvedeným klíčem</em> je <c1/>; pokud to není { "64" } hexadecimálních číslic malými písmeny, selhání <c2/> (žádný uvedený klíč); jinak, pokud <c3/> není jeho otiskem, selhání <c4/> (klíč zůstává použitelný). Pokud existuje <c5/> i uvedený klíč a liší se: selhání <c6/>. <em>Kontrolním klíčem</em> je <c7/>, pokud byl zadán, jinak uvedený klíč, pokud existuje; pokud není ani jeden, kontrolní klíč neexistuje (to zahrnuje každý případ, kdy manifest nebyl čitelný a nebyl zadán žádný <c8/>). Pokud neexistuje <c9/>: <c10/>. Jinak, pokud soubor není přesně { "128" } hexadecimálních číslic malými písmeny plus jedno <c11/>: <c12/>. Jinak, pokud existuje kontrolní klíč, který není platným kódováním veřejného klíče Ed25519: <c13/>. Jinak, pokud existuje kontrolní klíč a podpis se striktně neověří přes bajty <c14/> (ať jsou jakékoli): <c15/>. (Bez kontrolního klíče se podpis nekontroluje a pro to se nevyvolává žádné selhání.)

seg-3dbe07af8fa8 = Pokud manifest nebyl čitelný (krok { "2" } dal <c1/>): zde se zastavit.

seg-b7e03ef2dea5 = Artefakty. Pokud názvy <c1/> nejsou přesně čtyři výše uvedené v pořadí: <c2/>. Poté pro každou položku manifestu v pořadí: pokud balíček nemá soubor tohoto názvu, <c3/> (název); jinak, pokud se jeho délka liší od <c4/>, <c5/> (název); a nezávisle, pokud se SHA-256 souboru liší od <c6/>, <c7/> (název).

seg-24cda5a1d9d8 = Nevyjmenované soubory: pro každý soubor v balíčku jiný než <c1/>, <c2/>, <c3/> a názvy v <c4/> manifestu: <c5/> (název).

seg-d103ade9a7c7 = Řetězec. Projděte <c1/> manifestu v pořadí od <c2/>. Pokud <c3/> položky není { "64" } hexadecimálních číslic malými písmeny: <c4/> a řetězec se opustí (žádná kontrola hlavy). Jinak vypočtěte článek; pokud se liší od <c5/> položky: <c6/> (název). Po průchodu, pokud řetězec nebyl opuštěn a poslední článek se liší od <c7/>: <c8/>.

seg-be9fade3f879 = Výřez a epochy. Vyvolejte <c1/> (nejvýše jednou za důvod a ověřovač uvádí kód jednou, bez ohledu na to, kolik důvodů platí), pokud platí cokoli z: <c2/>; <c3/>; <c5/> položky <c4/> se liší od <c6/>; <c7/> této položky se liší od <c8/>; nebo <c9/> je <c10/> a platí cokoli z <c11/>, <c12/>, <c13/>. Pokud <c14/> existuje a je zpracováno jako pole JSON, jehož délka se liší od <c15/>: <c16/>.

seg-0dc49ed14c1f = Úplný záznam. Pouze pokud ověřovač dostal původní bajty záznamu: pokud se jejich SHA-256 liší od <c1/>, <c2/>; jinak, pokud rozsah <c3/> není uvnitř záznamu nebo se bajty záznamu tam liší od <c4/>, <c5/>.

seg-a7f787d6e6df = Časové razítko. Bez <c1/>: pokud byl ověřovač instruován, aby je vyžadoval, <c2/>; jinak nic. S ním: pokud jej nelze přečíst jako token nebo odpověď podle RFC { "3161" } (viz níže), <c3/>; jinak, pokud jeho otisk zprávy není hashem, v algoritmu vlastním tomuto otisku (SHA-256, SHA-384 nebo SHA-512), bajtů <c4/>: <c5/>.

seg-f7d908c6bf38 = Balíček je ověřen právě tehdy, když je množina selhání prázdná. Zda byl podepisující připnut, se hlásí zvlášť a množinu selhání to nemění.

seg-b0d74519122d = <b>Token časového razítka.</b> Token je DER <c1/>, jehož typ obsahu je CMS SignedData ({ "1.2.840.113549.1.7.2" }) a jehož zapouzdřený typ obsahu je <c2/> ({ "1.2.840.113549.1.9.16.1.4" }); odpověď je DER <c3/> (<c4/> následovaná tokenem), jejíž stav je { "0" } nebo { "1" }. Algoritmus otisku zprávy v <c5/> musí být SHA-256, SHA-384 nebo SHA-512 s otiskem délky odpovídající tomuto algoritmu a jeho <c6/> skutečný kalendářní čas UTC. BER s neurčenou délkou se nepřijímá. Podpis autority a řetězec certifikátů se kontrolují, pouze když jsou zadány důvěryhodné kotvy (<c7/>, níže).

seg-2156bf4dabb3 = Časové razítko podle RFC { "3161" } (volitelné)

seg-27a71ea73d7d = Token časového razítka od autority časových razítek ukazuje, že manifest existoval v čase, který autorita potvrzuje. Token je přes <c1/>, takže se žádá až po vytvoření balíčku (neexistuje způsob, jak jej dodat při vytvoření balíčku, a <c2/> odmítne token, který není přesně přes tento manifest):

seg-7ae6e0326b65 = <c1/> přečte token (holý token nebo úplnou odpověď), zkontroluje, že byl udělen a že jeho otisk zprávy se rovná hashi <c2/>, a vypíše čas, který uvádí. Bez důvěryhodných kotev přidá „timestamp authority signature not verified by Kshana“ (podpis autority časových razítek Kshana neověřila) a hlásí <c3/>; pro tuto část spusťte výše uvedený řádek <c4/>. Token, jehož otisk se liší, nebo který nelze zpracovat, je selhání. Typy obsahu tokenu, délka otisku a čas vytvoření se kontrolují z hlediska smyslu.

seg-88359c107bf1 = S <c1/> (jeden nebo více certifikátů PEM, všechny důvěryhodné) <c2/> kontroluje také autoritu, offline, tak jako <c3/>: otisk zprávy v podepsaných atributech, podpis (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 nebo P-384), vazbu na podpisový certifikát ESS, kritické rozšířené použití klíče timeStamping u podepisujícího a řetězec k samovydané kotvě, přičemž každý certifikát platí v <c4/> tokenu. Selhání se hlásí jako <c5/> s první kontrolou, která selhala, a <c6/> je pravda pouze tehdy, když prošlo vše. Odvolání (CRL nebo OCSP) se nekontroluje. Tento ověřovač se shoduje s OpenSSL { "3.0.13" } na { "27" } vlastních vygenerovaných případech (<c7/>).

seg-f534ae37f10c = <b>Token leží vedle podepsaného manifestu, nikoli uvnitř něj.</b> Nic v podpisu ani řetězci jej nepokrývá, takže token lze odstranit nebo nahradit jiným platným tokenem, aniž by podpis selhal. <c1/> proto upozorní, když jej balíček nemá, a <c2/> činí chybějící token selháním (<c3/>); nahrazený token se zachytí jen tehdy, když neodpovídá manifestu. <c4/> odmítne přepsat existující token, pokud nepředáte <c5/>. Pokud na časovém razítku záleží, uchovejte token a výsledek ověření ve vlastních záznamech a vyžadujte jej.

seg-b993ef559bd0 = Z kódu

seg-de24fd02c7c2 = <c1/> je jediný vstupní bod, který příkazový řádek i každý další povrch volá k vytvoření balíčku: dovnitř jde scénář, bajty záznamu (a navigačního souboru, u RINEX), okno jako text, název a volitelný čas vytvoření plus podpisový seed; ven jdou soubory, počet epoch, výřez, hash manifestu a otisk podepisujícího. Nečte žádné soubory ani hodiny, takže stejné vstupy dávají stejné bajty. Pod ním jsou <c2/> a <c3/> čisté funkce: bajty dovnitř (<c4/>, 32bajtový seed, <c5/> souborů), serializovatelné výsledky ven (<c6/>, <c7/>). Nepoužívají soubory, hodiny ani stav procesu a sestavují se pro <c8/>, takže je povrchy Python, WebAssembly a serveru volají beze změny. Příkazový řádek je jejich tenký obal.

seg-292a5bc48548 = Co balíček nedělá

seg-852aca7fc407 = Neprovádí znovu vyhodnocení. Kdokoli s úplným záznamem a <c1/> může znovu spustit <c2/> a porovnat s <c3/>; balíček dokazuje, co bylo zaznamenáno, nikoli že engine měl pravdu.

seg-91639deac47d = Nedokazuje, že záznam je pravý nebo úplný. Hash úplného záznamu váže záznam k jednomu souboru; odkud tento soubor pochází, musí prokázat operátor.

seg-0f721c314fa1 = Nenese žádné tvrzení o výkonu při detekci nebo odmítnutí interference.

seg-9c361736bf27 = Je to technický záznam, nikoli právní stanovisko ani certifikace.

seg-68bcf43b4e27 = <s1>Předchozí</s1>Pokrytí řádků

seg-09c0b5fa6e52 = <s1>Další</s1>Optické spoje atmosférou
