# docs--spectrum: translations (cs)

seg-6cb7a787ac67 = Reference

seg-cbf0f9bcd2d8 = Orákulum

seg-6e0cb6acc073 = VALIDATED

seg-33f4c7af9c53 = Nosná

seg-c5ce76c91ff7 = Popisek

seg-a86ce24d81de = Pásmo

seg-ea152d84aabc = { "465" } MHz

seg-278d0b375f6f = { "20.46" } MHz

seg-39e207bee75b = { "2492.028" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-72f051e2d7e1 = Signál

seg-47408d30d095 = Nominální C/N₀

seg-995748f9c74c = { "49.41" } dB-Hz

seg-5393b075ff7f = { "43.48" } dB-Hz

seg-4321ccaeeca5 = { "46.73" } dB-Hz

seg-59fd1427d61b = { "54.51" } dB-Hz

seg-0f47178201ca = { "49.23" } dB-Hz

seg-f8e6beeceedd = { "47.41" } dB-Hz

seg-53a7343c076e = Tvrzení

seg-430edd66bda0 = Nemodelováno

seg-64509c048541 = Co je modelováno

seg-f07519ff8071 = Zdroj: <c1/>

seg-901c3e032de7 = Model spektra a waterfall

seg-eac92092dd34 = Druh scénáře <c1/> vytváří pásmo L globálního družicového navigačního systému (GNSS) a jakékoli další pásmo, které navržený signál zabírá (velmi vysoké frekvence (UHF), pásmo S, pásmo C), jako jedinou spektrální hustotu výkonu (PSD), nechává ji měnit se podle skriptované časové osy rušiček a redukuje ji na to, co zajímá sledovací smyčku: poměr rušení k signálu (J/S) a efektivní poměr nosné k hustotě šumu (C/N₀) každého pásma. Výsledek vykresluje jako waterfall (frekvence napříč, čas dolů, barva pro výkon) vedle sloupců C/N₀ pro jednotlivá pásma a čte a zapisuje záznamy ve formátu Signal Metadata Format (SigMF), takže skutečný záznam lze odhadnout a vykreslit vedle modelu.

seg-0007b6ba97ca = Přibalený příklad zapište do souboru a spusťte:

seg-5e205b189b26 = V checkoutu spustí <c1/> tentýž soubor.

seg-261deb22b4fa = Kód: <c1/> (model, druh, Welchův odhadovač), <c2/> (kodek záznamů), <c3/> (spektra signálů o jednotkové ploše a koeficient spektrální separace) a <c4/> (předvolby návrhu signálu, které pásmo může pojmenovat).

seg-bb1153873209 = Modulace

seg-9758b36b554c = Výchozí přijímaný výkon

seg-a1a68286b809 = Výchozí šířka pásma přijímače

seg-27a2cdc8183f = { "1575.42" } MHz

seg-66a103496266 = binární fázové klíčování, BPSK({ "1" })

seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

seg-50112ba8867d = { "2.046" } MHz

seg-b7755cb9a384 = multiplexovaná binární offsetová nosná, MBOC(6,1,1/11), nebo binární offsetová nosná BOC({ "1,1" })

seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-6dc5e3668a78 = { "14.322" } MHz

seg-f03380403a2a = { "1227.60" } MHz

seg-06c245582533 = BPSK({ "1" }) (kódy CM a CL časově multiplexované)

seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

seg-1982a811e1ef = { "1176.45" } MHz

seg-dd074e33242e = BPSK({ "10" })

seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A je kód hrubého určení/akvizice; L2C je civilní signál L2; IS-GPS-200 a IS-GPS-705 jsou rozhraní specifikace GPS; Galileo OS SIS ICD je Galileo Open Service Signal-in-Space Interface Control Document. Přijímané výkony jsou minima specifikace; šířky pásma jsou modelovací volby. Obojí lze přepsat pro každé pásmo. Bez tabulky <c1/> běh používá těchto pět. GLONASS G1/G2, BeiDou B1/B2 a Galileo E6 mezi pojmenovanými pásmy <b>nejsou</b>.

seg-79cc2ed8195b = Záznam <c1/> má jednu ze tří forem:

seg-67d0591c69d8 = název z tabulky výše, s nepovinnými <c1/>, <c2/> a pro <c3/> též <c4/>;

seg-8596194c81f2 = <c1/>: návrh signálu na nízké oběžné dráze Země (LEO) nebo reprezentativní z knihovny předvoleb druhu <c2/> (<a1>LEO-SIGNAL.md</a1>), v libovolném pásmu, vykreslený se všemi složkami (akvizice, data, pilot, subnosné s frekvenčním dělením) a omezený na pásmo vysílání; C/N₀ a J/S se vztahují ke sledované složce a <c3/> ji pouze označuje. Předvolby jsou <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> a <c15/>;

seg-2ca46a7f2949 = vlastní pásmo: libovolné <c1/> s <c2/>, <c3/> (<c4/>, <c5/> nebo <c6/>) a <c7/>.

seg-fcb0f9fcffbf = Rušičky (<c1/>) berou <c2/>:

seg-457e5e95c677 = <c1/> — tón nepřerušované vlny (CW) na <c2/>;

seg-3120ac4f6710 = <c1/> — plochý šum přes <c2/>;

seg-7d975838a2e6 = <c1/> — plochý šum přes široké <c2/> (zahlcovací rušička): táž hustota jako <c3/>, pojmenovaná zvlášť, protože druh <c4/> ji hodnotí jako širokopásmovou;

seg-d13b177946d2 = <c1/> — lineární pilovité přeladění o <c2/> každých <c3/>;

seg-675fb74a89e4 = <c1/> — širokopásmový šum, jehož spektrum je vlastní modulací pásma <c2/>.

seg-64d7a14a198e = Každá udává buď <c1/>, nebo efektivní izotropně vyzářený výkon <c2/> s <c3/> (a volitelně <c4/>), který prochází útlumem volným prostorem druhu <c5/>. <c6/> a <c7/> skriptují časovou osu.

seg-8e718c09f7d8 = Přijímač (<c1/>) určuje šumovou podlahu, <c2/> s <c3/> pro teplotu antény <c4/> a šumové číslo <c5/>, a práh sledování.

seg-9b8078bd0df3 = Hlavní waterfall pokrývá <c1/> (výchozí { "1160" } až { "1590" } MHz ve { "430" } binech). Každý záznam <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, výchozí { "200" } binů) přidává další waterfall nad vlastním frekvenčním rozsahem na téže časové ose, pro spektrum, které zasahuje několik pásem.

seg-a550e89c2907 = Řetězec interference

seg-12a2c08191c0 = Pro signál s jednotkovým spektrem plochy <c1/> a rušičku s jednotkovým spektrem výkonu <c2/> je koeficient spektrální separace (SSC) přes pásmo přijímače <c3/> roven <c4/> a efektivní poměr nosné k hustotě šumu při několika rušičkách je

seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. vyd., §{ "9.4" }). Pro jednu rušičku je to přesně rovnice protirušení druhu <c1/> s <c2/>; blok <c3/> ve zprávě spouští vlastní funkce druhu <c4/> nad týmiž vstupy spoje a vypisuje rozdíl, který je při zaokrouhlení nulový.

seg-c11d0cb8e670 = Zpráva také vypisuje C/N₀, které dává druh <c1/> se svou tabulkou Q. Tabulka obsahuje učebnicové hodnoty, v testech zafixované na uzavřené tvary:

seg-5c21df11e35b = <b>CW a úzkopásmový: <c1/>.</b> Tón CW na nosné C/A má <c2/>, takže <c3/>, a tabulka a spektra se shodují. V přibaleném příkladu tón dává z obou { "17.98" } dB-Hz (tabulka dávala { "19.74" }, když obsahovala { "1.5" }).

seg-647e209b1efc = <b>Širokopásmový a přelaďovaný: <c1/>, od { "0.36" }.</b> To je bílý šum přes hlavní lalok s výkonem signálu v pásmu normalizovaným na jedničku, <c2/>. Tabulka do { "0.36" } obsahovala { "1" }, asi o { "3" } dB pesimističtěji (<c3/>).

seg-cd03b9c900e1 = Model spektra odvozuje své vlastní hodnoty ze spekter:

seg-b1327e66260b = <c1/> pro šum přizpůsobený C/A (<c2/>);

seg-45b2cf032a11 = <c1/> pro plochý šum od nuly k nule bez normalizace (<c2/>).

seg-6c2187f0e32b = U těchto rušiček se tedy dvě vypsané hodnoty C/N₀ stále liší, záměrně.

seg-73dfbeabcac2 = Každá buňka waterfallu je PSD zprůměrovaná přes svůj frekvenční bin a svůj řádek. Chirp se průměruje přesně přes řádek, celé přeladění plus částečné; rušička zapínající či vypínající se uprostřed řádku je vážena svým pracovním cyklem. Časová osa C/N₀ používá tytéž průměry, takže obraz a čísla souhlasí. Pro každé pásmo časová osa uvádí J/S v pásmu (výkon rušičky uvnitř šířky pásma přijímače ku výkonu signálu). Pro každou rušičku a pásmo zpráva uvádí SSC, <c1/>, celkové J/S, J/S v pásmu a ustálené C/N₀.

seg-2c214a0a30be = Přibalený příklad

seg-4adc00a3ca10 = <c1/>: časová osa { "60" } s, jeden řádek za sekundu, anténa { "290" } K a šumové číslo { "2" } dB (podlaha −{ "201.98" } dBW/Hz).

seg-94d1cebc134d = { "10" } s až { "40" } s: chirp { "16" } MHz kolem L1, přeladění po { "9" } µs, { "50" } mW na { "100" } m.

seg-b85319af4f85 = Od { "30" } s: tón CW na nosné L1, { "10" } mW na { "1" } km.

seg-21e2b4e76832 = Od { "45" } s: plochý šum { "2" } MHz na L2 přijímaný při −{ "135" } dBW.

seg-45dd378c692c = Co běh počítá:

seg-eecd7d7530bf = Minimální C/N₀

seg-1ead35e1aad5 = První ztráta

seg-bfb55a322ece = Sledované řádky

seg-863ea3f1fbe9 = { "3.23" } dB-Hz

seg-9aa0239a3a0c = { "10" } s

seg-9979940d2359 = { "44.73" } dB-Hz

seg-25364ef39455 = { "4.44" } dB-Hz

seg-c8d0bc71cccd = { "41.98" } dB-Hz

seg-c945914c444c = { "36.86" } dB-Hz

seg-9ff066fb53a6 = nikdy

seg-63d4f00f622d = { "44.08" } dB-Hz

seg-58b097691919 = Tón CW je důvod, proč se dva signály L1 v { "40" } s rozcházejí. Dopadá na vrchol spektra C/A a drží C/A na { "17.98" } dB-Hz, pod prahem { "25" } dB-Hz. Dopadá do nuly spektra MBOC, takže Galileo E1 se po skončení chirpu vrací na nominální C/N₀.

seg-064579d5fbac = Samotné signály leží asi { "20" } dB pod šumovou podlahou, takže waterfall ukazuje podlahu a rušičky; sloupce C/N₀ ukazují, co zpětné rozprostření obnoví.

seg-023a7f163106 = Tytéž rušičky řídí řetězenou misi v <c1/> (viz <a1>CAMPAIGNS.md</a1>): hodiny drží čas (holdover), dokud chirp běží, a přijímač se pod tónem CW vrací k Galileo E1.

seg-6b0edbfca134 = Mimo pásmo L

seg-63d1fd8043ed = <c1/> umísťuje signály určování polohy, navigace a času (PNT) na LEO ve čtyřech pásmech vedle GPS L1 C/A a Galileo E5a, každé pásmo s vlastní rušičkou, na časové ose { "60" } s. Waterfall <c2/> je pásmo L; tři <c3/> přidávají UHF ({ "455" } až { "475" } MHz), S ({ "2482" } až { "2502" } MHz) a C ({ "5005" } až { "5035" } MHz).

seg-6818247b5863 = { "10" } s: tón CW na nosné UHF, přijímaný při −{ "120" } dBW.

seg-02de8390de31 = { "20" } s: chirp z příkladu pásma L ({ "16" } MHz kolem L1, přeladění po { "9" } µs, { "50" } mW na { "100" } m).

seg-47e55dfd4e0d = { "30" } s: širokopásmový šum, { "40" } MHz kolem { "1185" } MHz, −{ "118" } dBW.

seg-dfa416032770 = { "40" } s: úzkopásmový šum, { "2" } MHz na nosné S, −{ "128" } dBW.

seg-1d119727a749 = { "50" } s: šum přizpůsobený vlastnímu spektru signálu pásma C, −{ "124" } dBW.

seg-abacb60b16a3 = Co běh počítá (C/N₀ navržených signálů je C/N₀ sledované složky, takže nominální hodnota leží pod celkovým přijímaným výkonem o sledovaný podíl):

seg-1c921b6299e4 = reprezentativní, BPSK({ "5" }), −{ "150" } dBW

seg-5331cde832fb = { "34.38" } dB-Hz

seg-35588b19fd72 = minimum specifikace

seg-7d3639369444 = { "3.38" } dB-Hz

seg-9eef1ec7858f = { "38.51" } dB-Hz

seg-c6743d980e6b = publikovaný návrh, −{ "144.9" } dBW

seg-245bf7d080b3 = { "1190.51625" } MHz

seg-f2aed7e062bf = { "46.29" } dB-Hz

seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

seg-a6f2bb955ca2 = reprezentativní, BPSK({ "10" }), −{ "152" } dBW

seg-b9312cc881d2 = { "40.35" } dB-Hz

seg-03bb124d45d2 = Jen chirp odebírá signál (GPS L1 C/A, od { "20" } s). Každá další rušička zhoršuje jen pásmo, kam až její spektrum sahá: šum přizpůsobený pásmu C má například SSC −{ "71.87" } dB/Hz se signálem pásma C a pod −{ "133" } dB/Hz s každým jiným pásmem.

seg-a8bea652a85d = Tentýž mechanismus pohání scénáře odolnosti LEO-PNT (<a1>LEO-PNT.md</a1>):

seg-cf7bc2f52cad = <c1/> zvyšuje jednu zahlcovací rušičku { "40" } MHz na { "1185" } MHz po { "5" } dB každých { "10" } s od −{ "125" } dBW. GPS L5 je ztracen na kroku −{ "105" } dBW, Galileo E5a při −{ "100" } dBW a Xona X5 při −{ "95" } dBW, zatímco reprezentativní signál LEO v pásmu L přijímaný při −{ "135" } dBW stále sleduje při −{ "90" } dBW: přijímaný výkon kupuje rezervu J/S dB za dB.

seg-94b65c0e6087 = <c1/> je kampaňový průchod během <c2/> přes výkon zahlcení v pásmu L5 (<a1>CAMPAIGNS.md</a1>).

seg-67279a0780e4 = <c1/> je řetězená kampaň, jejíž fáze čtou C/N₀ GNSS a LEO z běhů <c2/>, s panely pásem S a C.

seg-42b00ae14ffe = IQ, SigMF a Welch

seg-3418c31c4318 = <c1/> vykreslí model v jednom okamžiku jako komplexní vzorky v fázi a kvadratuře (IQ), zapíše je jako záznam SigMF (<c2/> nebo <c3/>), záznam načte zpět a odhadne jeho PSD Welchovou metodou (okno Hann, překryv { "50" } %, zprůměrované periodogramy, škálované na hustotu). Tepelný šum, signály a rušičky podobné šumu se kreslí po binech z vlastní hustoty modelu; tón a chirp se kreslí jako skutečné průběhy. Pouze s rušičkami podobnými šumu leží odhad Welch do { "0.1" } dB od modelu (medián). Periodický chirp je čárové spektrum na své rychlosti přeladění, s zvlněním a ocasy za okraji pásma, které hladký model vynechává: v přibaleném příkladu se celkový výkon shoduje do { "0.02" } % a mediánový bin se liší o { "0.5" } dB. Snímek je soubor zapsaný pro analýzu; nic se nevysílá a neovládá se žádný rádiový hardware.

seg-a3b0a61b5efe = <c1/> (pouze nativní sestavení) čte skutečný záznam SigMF z <c2/> (datový soubor je ve výchozím stavu stejný název s <c3/>), odhaduje jeho PSD a vypisuje je vedle modelu na frekvencích záznamu. Soubor SigMF nemá absolutní kalibraci výkonu, takže zpráva uvádí mediánový posun a tvar, nikoli úroveň.

seg-04b08e06811d = V sestavení WebAssembly není čtení souborů dostupné; <c1/> a <c2/> pracují s bajty, které dodá stránka.

seg-69b384afe05d = PSD signálů a SSC

seg-a65b87c51f05 = Hlavní lalok BPSK(n) 2n × { "1.023" } MHz od nuly k nule; laloky BOC({ "1,1" }) se středy v ±{ "1.023" } MHz (Betz { "2001" }); SSC −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz pro C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) z jejich uzavřených tvarů podle Parsevala, hodnoty za publikovanými −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) a { "1.5" } (přizpůsobený) (Kaplan & Hegarty §{ "9.4" }); položky tabulky druhu <c1/> se rovnají uzavřeným tvarům: CW a úzkopásmový Q = { "1" }, širokopásmový a přelaďovaný Q = { "2" } (bílý šum přes hlavní lalok, výkon v pásmu normalizován; { "1" } do { "0.36" })

seg-d2afc6e05969 = Waterfall, J/S a časová osa C/N₀

seg-c44413d5a060 = Přesně se redukuje na řetězec druhu <c1/>; výkony rušiček, časová osa a šířky pásma jsou vstupy

seg-304f4aeaf4cb = Kodek SigMF a odhad Welch

seg-7a642dd02e5c = Zpáteční převody, přímá diskrétní Fourierova transformace, identity bílého šumu a Parsevalova; v repozitáři není žádný záznam třetí strany

seg-1138c9e62a21 = Vícepásmový waterfall s navrženými signály a rušičkami pro jednotlivá pásma

seg-ac38681004e9 = Redukuje se na řetězec pásma L (jednosložkové pásmo dává stejná čísla jako před rozšířením) a na validovaná spektra signálů; navržené signály, rušičky a šířky pásma jsou vstupy

seg-0c0c625a8ff5 = Jedna oprava obvyklé zkratky: laloky spektra BOC({ "1,1" }) jsou <em>vycentrovány</em> v ±{ "1.023" } MHz (mezi nulou nosné a nulou při { "2.046" } MHz), ale maximum PSD je v ±{ "0.759" } MHz, kde <c1/> s <c2/>. Testy zafixují obojí.

seg-6ab6e241f7e5 = Čárová struktura rozprostíracího kódu (čáry { "1" } kHz u C/A): tón se hodnotí proti hladké obálce, nikoli proti nejbližší čáře kódu.

seg-4be08100a707 = Automatické řízení zisku, kvantování, potlačení pulzů a notch filtrace.

seg-0f195ea4126e = Směrová charakteristika přijímací antény směrem k rušičce nad rámec jednoho údaje o zisku.

seg-d3d03da9c962 = Interference vícenásobného přístupu mezi družicemi jednoho pásma.

seg-db5c7566f49e = Emise navrženého signálu mimo jeho vysílací pásmo: jeho spektrum je tam ořezáno, takže žádná emise mimo pásmo nedosáhne sousedního pásma.

seg-9cbea7151036 = Vliv chirpu na smyčku při rychlostech přeladění srovnatelných se šířkou pásma smyčky: jeho C/N₀ používá spektrum průměrované po řádcích.

seg-d19ed16f451c = J. W. Betz, „Binary Offset Carrier Modulations for Radionavigation“, <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

seg-e2225151c10b = E. D. Kaplan a C. J. Hegarty (eds.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3. vyd., Artech House, { "2017" }, §{ "9.4" }.

seg-85b2d251a221 = G. W. Hein a kol., „MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C“, <em>Inside GNSS</em>, květen/červen { "2006" }.

seg-b091f7c36ab9 = P. D. Welch, „The Use of Fast Fourier Transform for the Estimation of Power Spectra“, <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

seg-d28b74d8c755 = Specifikace SigMF, <a1>https://sigmf.org/</a1> (zdroj: <a2>https://github.com/sigmf/SigMF</a2>).

seg-a9b968473b2a = <s1>Předchozí</s1>Integrita a bezpečnost

seg-d5264da8bf65 = <s1>Další</s1>Reference ARAIM
