# docs--partner-data: translations (cs)

seg-2247a2344710 = Význam

seg-6e0cb6acc073 = VALIDATED

seg-a349aa76b0ed = PARTNER

seg-34bdcfd66ded = Ve větvi repozitáře, z níž tyto dokumenty pocházejí; zatím ne na GitHubu

seg-f942b36a11c4 = Zatím ne na GitHubu

seg-7338b6210228 = Řádek

seg-c5ce76c91ff7 = Popisek

seg-3a04afee76ec = Zdroj: <c1/>

seg-e6d8549f24b9 = Data od partnerů: jaká naměřená data by mohla povýšit řádek MODELLED

seg-7b9ff34db2c4 = Kshana označuje každou schopnost ve strojově kontrolovaném registru (<a1>verifikační matice</a1>). Většina řádků o časování a senzorech je <b>MODELLED</b>: opírají se o uvedené modely, zveřejněné datasheety a vnitřní kontroly a žádný naměřený záznam zařízení dané třídy s nimi nebyl porovnán. Držitel takového záznamu to může změnit. Tato stránka říká, kterých řádků se to týká, co poslat, jak se podání kontroluje, jak se hodnotí a jak se připisuje. Je psána pro laboratoř, výrobce nebo univerzitní skupinu; není nabídkou práce a netvrdí žádné schválení od nikoho. Pouze poradní charakter: Kshana je studijní nástroj, nikoli typově schválené navigační ani časovací zařízení.

seg-1cf5536037d4 = Co štítky znamenají

seg-5f43f341fa27 = nezávislé vnější orákulum souhlasí se schopností podle prahu stanoveného před porovnáním. Naměřený záznam od partnera může být tímto orákulem pro dílčí tvrzení, které pokrývá; invarianty matice zakazují štítek bez něj

seg-0d182b8c7430 = vnitřně konzistentní a řečeno otevřeně; žádné vnější orákulum tvrzení nepokrývá. Řádek MODELLED, který je porovnán s naměřenými daty a práh nesplní, zůstává MODELLED a nesplnění se zveřejní

seg-8a45367544a0 = disciplína, na níž se běh spoléhá, za niž odpovídá hardwarový partner a kterou Kshana neposkytuje, například čísla popisující partnerovy vlastní hodiny nebo interferometr. Kshana modeluje, co by takové zařízení udělalo s navigačním nebo časovacím řetězcem; za zařízení neručí

seg-553a1db0e11d = Podání může povýšit řádek na VALIDATED jen pro tvrzení, které data skutečně testují, a jen pokud porovnání splní svůj práh. Nemůže z čísel zařízení udělat čísla, za něž Kshana ručí: ta zůstávají partnerova (PARTNER). Zda se štítek řádku změní, je rozhodnutí vlastníka, zaznamenané v commitu, který jej mění, s textem orákula, který přesně říká, co bylo s čím porovnáno.

seg-bac61cc47097 = Řádky, které by data partnera mohla povýšit

seg-bd4f5d3f9399 = Každý řádek níže je přesný text <c1/> řádku MODELLED v matici (test udržuje tuto stránku a matici v souladu). „Mohlo by změnit“ říká, co by předregistrované porovnání s naměřenými daty podpořilo, pokud je práh splněn; nikdy to není příslib.

seg-fb5ceb1d62f0 = Data, která by to otestovala

seg-812eae6bbea9 = Mohlo by změnit

seg-f46d009d9380 = záznam hodin pojmenované třídy o délce několika dnů, volně běžících po posledním disciplinování, porovnaný s lepší referencí, s intervalem vzorků jedna minuta nebo méně

seg-2a73fc59a03d = prahy červeného šumu pro jednotlivé třídy, které omezují údaje o holdoveru, zůstávají dnes MODELLED; naměřenou stabilitu při dlouhých časech průměrování by bylo možné porovnat s prahem dané třídy, a to jen pro tuto třídu

seg-abe6b657ce1b = naměřená Allanova odchylka, jako tabulka nebo jako fázový záznam, partnerových hodin nebo atomového interferometru

seg-6ba2b7faa909 = srovnávací údaje partnerské zařízení kvantifikují (nikdy neověřují), takže by byly označeny jako údaje partnera (PARTNER); načtení naměřených dat Allanovy odchylky do šumového modelu je již shodné s nezávislým řešičem

seg-ad537759d084 = fázový záznam oscilátoru jednoho ze čtyř přednastavených modelů, nejméně po dobu jednoho dne

seg-44a55f6ebef6 = zda šumový model předvolby odvozený z datasheetu reprodukuje stabilitu naměřeného kusu při vlastních časech průměrování datasheetu

seg-3da5a93abde6 = fázový záznam třídy hodin, která dosud nemá kartu (OCXO, rubidium, cesium, maser, optické hodiny)

seg-72f248aa4438 = karta nafitovaná na první třetině a předpovídající Allanovu odchylku zbytku v rámci předregistrovaného faktoru, jak se již provedlo u družicových hodin GNSS a jednoho přijímače

seg-54971e473811 = log ze skutečné instalace (libovolná verze démona) s vlastními souhrnnými řádky démona

seg-bccf188b7636 = čtečky byly vytvořeny z veřejných rozložení řádků a z testovacích dat; skutečný log porovnaný s nezávislou čtečkou by byl první vnější kontrolou

seg-e83b73ab2d5d = export ze skutečného čítače nebo analytického softwaru

seg-80b69f559ea5 = totéž pro tyto formáty

seg-0c279732d132 = skutečný test holdoveru: záznam, časy, kdy operátor odpojil a znovu připojil referenci, a vlastní verdikty laboratoře pro MTIE, TDEV a masku z jejího analytického softwaru

seg-cfad71161af0 = nezávislý výpočet týchž veličin k porovnání s výpočtem enginu

seg-97c65b646eae = klidový log inerciální jednotky, jejíž šumové parametry zveřejnil nebo naměřil někdo jiný

seg-77f9d22ec624 = fit se vrátil v rámci uvedeného faktoru nezávislých parametrů

seg-c9544eadc55d = statický log nebo šumové parametry partnerova studenoatomového inerciálního senzoru

seg-062dd193ab20 = čísla zařízení jsou partnerova (PARTNER); rozpočet chyby polohy, který je skládá, zůstává modelem Kshana

seg-078be7f5769f = Začněte prvními dvěma: rozhodují o tom, zda prahy holdoveru pro jednotlivé třídy a srovnání kvantového a klasického řešení stojí na nějakých vlastních naměřených datech.

seg-c325655738e0 = Co poslat

seg-ca24fa511ffe = Podání tvoří dva soubory v jedné složce: data a jejich stručný popis, soubor TOML (<c1/>; vymyšlený příklad je <c2/>).

seg-a3e30cf27adb = <b>Data hodin.</b> Jeden z formátů, které Kshana čte (viz <a1>formáty logů hodin</a1>): logy TAPR TICC, ASCII fáze nebo frekvence ve stylu TimeLab, RINEX clock, logy linuxptp <c1/>, <c2/> a <c3/>, logy sledování a statistik chrony. Fáze je výhodnější než frekvence; uveďte jednotky a interval vzorků. Dodejte nejdelší nepřerušený záznam, jaký máte: stabilita při dlouhých časech průměrování vyžaduje dny a záznam kratší než den se přijme, ale s varováním.

seg-a14b0c961637 = <b>Inerciální data.</b> CSV s pojmenovanými sloupci (<c1/>, rad/s a m/s^{ "2" }) nebo rozložení EuRoC, z nehybného zařízení, dostatečně dlouhé pro fit (alespoň { "2000" } vzorků; hodiny jsou lepší).

seg-a1f2cd79bcc0 = <b>Popis</b> uvádí následující a kontrola to ověřuje, kde může:

seg-cfeee5da56d7 = typ organizace (typ, například „národní časová laboratoř“, nikoli název; název je volitelný a slouží jen k připsání);

seg-4bd30d68101c = zařízení (druh, třída a model pro třídu <c1/>);

seg-e8222178a0ee = jak byla data pořízena: s čím byla porovnávána, čas zahájení (UTC), prostředí a zda jsou surová, nebo zpracovaná (a co se s nimi udělalo);

seg-7ac28bd566f2 = SHA-256 datového souboru, aby hodnocený soubor byl souborem popsaným;

seg-0eba30c3a5b8 = řádky MODELLED, pro které je podání nabízeno, přesným textem požadavku uvedeným výše;

seg-dd694deec626 = licence (identifikátor SPDX nebo slovy) a jak lze data v repozitáři používat: <c1/> (zapsáno s uvedením autora), <c2/> (zveřejní se jen jeho hash a skóre) nebo <c3/> (skóre se sdílí pouze s podatelem);

seg-7cea4b7c1df8 = tři prohlášení: jde o měření, nikoli o simulaci, podatel může data pro toto použití licencovat a soubory neobsahují žádné osobní údaje.

seg-caa6696f3f5f = <b>Neposílat.</b> Cokoli osobního nebo s kontaktními údaji (kontrola odmítne e-mailovou adresu nebo telefonní číslo v popisu), cokoli podléhajícího kontrole vývozu nebo omezenému dohodou a jakákoli simulovaná data vydávaná za naměřená.

seg-a2f0067b6da5 = Jak se podání kontroluje

seg-f1d4c097691e = Formát a metadata, vámi nebo námi, než se cokoli spustí.

seg-c3cd90222eaa = Potvrzuje schéma, povinná pole, hash, pravidla licence a uvedení autora, že cílové řádky existují a jsou MODELLED, že se data dají přečíst čtečkou samotného enginu, a hlásí, co přečetla (vzorky, interval, rozsah, mezery) a varuje před záznamy, které jsou krátké. Stavový kód { "0" } znamená úplné a čitelné; { "1" } vypíše, co opravit. <b>Data nehodnotí, žádný řádek neověřuje a neslibuje, že budou použita.</b>

seg-7dd95552a6fb = <b>Předregistrace před jakýmkoli hodnoceným během.</b> Pro každý řádek dokument v <c1/> stanoví a ještě před během dat se zapíše: řádek, SHA-256 datového souboru, která část dat je zadržena (nic nafitovaného ji nesmí vidět), metriku a práh. Pro karty hodin je stávající šablonou zadržená předpověď použitá pro záznamy IGS a přijímačů: fit na první třetině záznamu, předpověď Allanovy odchylky zbytku a požadavek, aby poměr předpovězené k naměřené hodnotě ležel v uvedeném faktoru při každém nafitovaném čase průměrování. Práh se po běhu nikdy nezmírňuje.

seg-10dc9f8cf394 = <b>Jeden hodnocený běh.</b> Výsledek, každé číslo i každé nesplnění, se zveřejní s příkazem a commitem a pinuje jej test. Nesplnění je zjištění, nikoli selhání, které by se skrývalo: řádek zůstává MODELLED a stránka to říká.

seg-e5704c43a6b8 = <b>Rozhodnutí o registru je věcí vlastníka</b>, písemně, v commitu, který řádek mění. Text orákula povýšeného řádku uvádí soubor dat, jeho licenci a uvedení autora, co bylo porovnáno a co ne.

seg-6d467ffb4199 = Uvedení autora a práva

seg-e82f31e7d9cc = Data zůstávají vaše podle licence, kterou uvedete. <c1/> a <c2/> drží soubor mimo repozitář.

seg-156499ebc142 = Podání <c1/> se připisuje řádkem uvedení autora, který zadáte, v textu orákula řádku a ve výsledném souboru.

seg-a5c01115d23a = Nic se nezveřejní pod vaším jménem bez vašeho písemného souhlasu; organizace uvedená jako zdroj se cituje jako zdroj, nikdy jako ta, která by za něco ručila. Partner ani o něm nikdo netvrdí žádné schválení ani podporu.

seg-6c9ed423e51d = Podání můžete před zveřejněním výsledku stáhnout. Poté výsledek zůstává, jak byl zaznamenán; pokud odvoláte licenci k datům, soubor se z repozitáře odstraní a hash i skóre zůstanou.

seg-2cc3c091ba0f = Kshana nic nevysílá a neovládá žádný hardware. Podání jsou soubory na vstupu, zpráva na výstupu.

seg-01b0ee9973dc = Oslovení

seg-b5cb4dc0493f = Jednostránková zpráva pro laboratoř je pro vlastníka připravena jako koncept v <s1><c1/></s1>. Je to koncept: nic se neodesílá a nikdo není kontaktován, dokud se vlastník nerozhodne.

seg-83b30e1ca261 = <s1>Předchozí</s1>Balíčky důkazů

seg-09c0b5fa6e52 = <s1>Další</s1>Optické spoje atmosférou
