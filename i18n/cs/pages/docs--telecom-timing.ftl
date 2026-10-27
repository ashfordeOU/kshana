# docs--telecom-timing: translations (cs)

seg-04ece0eb7bd2 = Id masky

seg-a13eab564243 = MTIE

seg-f155b7ceef1f = TDEV

seg-42cdb8e987e6 = Rozpočet

seg-88372b30ed79 = Limit

seg-50fffd444946 = { "100" } ns

seg-79e6a31245f2 = { "400" } ns

seg-f63dd3d7aad4 = Zdroj

seg-587beeccaa11 = Předvolba

seg-edb7b16b6c0e = Validace

seg-3c513ef2fd3b = Veličina

seg-62b6e83a9145 = Zdroj: <c1/>

seg-95222c3659cd = Telekomunikační časování: masky, zdroje a předvolby

seg-5a604e063370 = Tato stránka uvádí každý limit, který druh scénáře <c1/> kontroluje, odkud každý pochází a co bylo vynecháno. Kód je <c2/>. Referenční scénář je <c3/>, scénář frekvenční synchronizace je <c4/> a příklad načítání je <c5/>.

seg-f078828b2325 = <b>Zkratky.</b> ITU-T je Sektor telekomunikační standardizace Mezinárodní telekomunikační unie. GNSS je globální družicový navigační systém. TE je časová chyba, rozdíl mezi časem hodin a referenčním časem. max|TE| je největší absolutní časová chyba. MTIE je maximální chyba časového intervalu: největší chyba časového rozkmitu mezi vrcholy v libovolném pozorovacím okně délky τ (tau). TDEV je časová odchylka, míra časového kolísání ve smyslu střední kvadratické hodnoty při průměrovací době τ. cTE je konstantní časová chyba (průměrný offset). dTE je dynamická časová chyba (část, která se pohybuje). TE_L a dTE_L jsou časová chyba po dolnopropustném filtru prvního řádu s šířkou pásma { "0.1" } hertzu (Hz); dTE_H je část nad tímto filtrem. TE_HO je časová chyba v holdoveru. PRTC je primární referenční časové hodiny. ePRTC je rozšířené PRTC. T-BC jsou telekomunikační hraniční hodiny a T-TSC jsou telekomunikační časově podřízené hodiny. PTP je Precision Time Protocol. PPS je pulz za sekundu. OCXO je krystalový oscilátor s termostatem. CSAC jsou atomové hodiny v měřítku čipu. CSV jsou hodnoty oddělené čárkami. ADEV je Allanova odchylka (σ_y), standardní míra frekvenční stability. ns jsou nanosekundy a µs jsou mikrosekundy. ppb jsou díly na miliardu (relativní frekvence { "1e-9" }) a MHz jsou megahertzy. Amd. je dodatek k doporučení a Y.1367 a podobně jsou čísla téhož doporučení v řadě Y ITU-T.

seg-a7746845eb05 = <b>Co to je.</b> Estimátory (MTIE a TDEV) jsou kontrolovány proti balíčku <c1/> třetí strany a jsou pro to VALIDATED. Tabulky masek jsou přepisem níže uvedených doporučení. Syntetický holdover je model sestavený z veřejných údajů datových listů. Druh jako celek je MODELLED. Není to test shody a PASS zde není certifikát.

seg-e4adedc8e36d = Přečtené zdroje

seg-44f6d9a7906c = Všechny texty ITU-T byly staženy z itu.int dne 2026-09-25. Použito bylo nejnovější vydání, které bylo možné přečíst celé.

seg-28d4cebb747f = Doporučení

seg-ef3644f3af9c = Přečtené vydání

seg-82dcf7b71cdb = Stav na itu.int

seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Časové charakteristiky primárních referenčních časových hodin</em>

seg-f65ca7286466 = v platnosti

seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Časové charakteristiky rozšířených primárních referenčních časových hodin</em>

seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), publikace s úplným textem

seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Časové charakteristiky telekomunikačních hraničních hodin a telekomunikačních časově synchronních hodin pro použití s plnou časovou podporou ze sítě</em>

seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), úplný text

seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Síťové limity pro časovou synchronizaci v paketových sítích s plnou časovou podporou ze sítě</em>

seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), úplný text

seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Aspekty časové a fázové synchronizace telekomunikačních sítí</em>

seg-63c64d128cc6 = 03/2020 a jeho Amd. { "1" } (08/2024)

seg-66209db00349 = Existují dva novější dodatky, které se nepodařilo přečíst: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) a G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Oba jsou předpublikované a omezené na členy ITU (účty Telecommunication Information Exchange Service, TIES). Pokud mění některou níže uvedenou hodnotu, tato stránka a kód to zatím neodrážejí.

seg-25d639be3a1b = <b>Jak byla čísla ověřena.</b> Extrakce textu z těchto souborů Portable Document Format (PDF) vypouští řecké písmeno τ a znak mikro µ, takže „{ "0.275" } × { "10" }⁻³τ“ vychází jako „{ "0.275" } × { "10" }⁻³“. Každý řádek tabulek { "1" } až { "4" } G.8272, tabulek { "1" } až { "5" } G.8272.1, tabulky { "1" } G.8271 a tabulky 7-1 G.8271.1 byl proto přečten znovu z vykresleného obrazu stránky. Tabulky 7-1 až 7-5 G.8273.2 a tabulky 7-2 a 7-3 G.8271.1 byly přečteny z extrahovaného textu, v němž τ přežilo. Kde tabulka předpokládá spojitost v bodě zlomu, kontroluje to jednotkový test.

seg-33b5f44c513b = Implementované limity

seg-3ce6da7e3e99 = τ je v sekundách. Interval zapsaný „{ "0.1" } < τ ≤ { "273" }“ je otevřený v { "0.1" } s a uzavřený v { "273" } s, přesně jako v tabulce, a kód drží každý konec stejně.

seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A a PRTC-B, režim zachycení

seg-c54e45baa463 = max|TE|

seg-25887373a479 = { "40" } ns

seg-0e18047889c1 = článek { "6.1" }

seg-4ce06948bf3f = MTIE (článek { "6.2" }):

seg-f1e336517976 = Maska

seg-7c40080fe799 = Interval

seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

seg-a2ae8d8ad68a = Tabulka { "1" }

seg-d1b301281575 = { "0.10" } µs

seg-22afd1138a6a = τ > { "273" }

seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

seg-95049bb8aaa1 = Tabulka { "2" }

seg-f2562bdf8fd5 = { "0.04" } µs

seg-72ef2a66af58 = τ > { "54.5" }

seg-d18148049b1e = TDEV (článek { "6.2" }):

seg-f492a7e39046 = { "3" } ns

seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

seg-7334c58cd44b = Tabulka { "3" }

seg-3bf4d8b009d5 = { "0.03" } τ ns

seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

seg-02bacda97914 = { "30" } ns

seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

seg-1c0341aaa919 = { "1" } ns

seg-70c7899bf805 = Tabulka { "4" }

seg-8ec1f8c65e4f = { "0.01" } τ ns

seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

seg-2851f795541f = { "5" } ns

seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

seg-9b8478f86b44 = Článek { "6.2" } rovněž stanoví, že minimální měřicí doba pro TDEV je dvanáctinásobek integrační doby (T = 12τ). Druh toto pravidlo uplatňuje na každé hlášené TDEV, takže TDEV se udává jen pro τ do jedné dvanáctiny záznamu. G.8272 pro PRTC nestanoví žádný požadavek na holdover.

seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

seg-42c76f7b90ac = Režim zachycení:

seg-160dced77932 = { "4" } ns

seg-88e8948869fc = { "0.1" } < τ ≤ { "1" }

seg-c89d5cf52ad3 = { "0.11114" } τ + { "3.89" } ns

seg-fad294d3be39 = { "1" } < τ ≤ { "100" }

seg-e18d635df164 = { "0.0375" } × { "10" }⁻³ τ + { "15" } ns

seg-273d60d5cd4a = { "100" } < τ ≤ { "400 000" }

seg-4d971fea7954 = τ > { "400 000" }

seg-4e9052bb688f = { "0.1" } < τ ≤ { "30 000" }

seg-2401257610c6 = { "3.33333" } × { "10" }⁻⁵ τ ns

seg-560ef6f53bf7 = { "30 000" } < τ ≤ { "300 000" }

seg-727399dbf061 = { "10" } ns

seg-3f5b5d8a1ea9 = { "300 000" } < τ < { "1 000 000" }

seg-ca9cb946c8f4 = Holdover ePRTC-A, časová chyba (článek { "8.2.1" }, tabulka { "3" }). L je doba, po kterou byl ePRTC před ztrátou zachycen, ve dnech, a t je doba od začátku holdoveru v sekundách. Limit lineárně roste z { "30" } ns na { "100" } ns po dobu holdoveru H.

seg-fa700160348e = Doba zachycení L

seg-61f9dec111cb = Doba holdoveru H

seg-f6a6df18839c = Limit pro |Δx(t)|

seg-9229068d7534 = L < { "6" } dní

seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } dne)

seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

seg-1af75c2d666f = { "6" } dní ≤ L ≤ { "40" } dní

seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

seg-71a6238f1e29 = L > { "40" } dní

seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } dní)

seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

seg-3262966b5eab = Holdover ePRTC-A, kolísání (článek { "8.2.2" }):

seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

seg-a4a813c38ef6 = Tabulka { "5" }

seg-5d56fb7889b2 = Článek { "8.3.1" } stanoví výchozí maximální časovou chybu v holdoveru, max|TE_HO|, na { "100" } ns. Druh ji používá jako výchozí rozpočet doby do překročení.

seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC a T-TSC

seg-96b5072f792f = Třída A

seg-7737bc0444b1 = Třída B

seg-cd92242017a8 = Třída C

seg-0689443dfc12 = Třída D

seg-54163aca5d46 = max|TE| (nefiltrováno)

seg-b36412e1acfb = { "70" } ns

seg-ed79e6cdac25 = k dalšímu studiu

seg-5c2985d408e3 = Tabulka 7-1

seg-067c7c90c1e1 = max|TE_L| (dolní propust { "0.1" } Hz)

seg-1c5ac746d16b = Tabulka 7-2

seg-9802166ed2e2 = rozsah cTE

seg-b94484db77ab = ±{ "50" } ns

seg-17d4f5817950 = ±{ "20" } ns

seg-1399281b7ce6 = ±{ "10" } ns

seg-a694039549c8 = Tabulka 7-3

seg-d8799ba27fc3 = dTE_L MTIE, konstantní teplota

seg-c332ee79beaf = Tabulka 7-4, m ≤ τ ≤ { "1 000" }

seg-2bd284168318 = dTE_L TDEV, konstantní teplota

seg-8358cf8c4e50 = { "2" } ns

seg-6a1cc65603b3 = Tabulka 7-5

seg-de739a499521 = V tabulce 7-5 jsou třídy A a B zapsány jako m < τ ≤ { "1 000" } a třída C jako m ≤ τ ≤ { "1 000" }. m je 1/16 s pro proud PTP o { "16" } paketech za sekundu a { "1" } s pro výstup { "1" } PPS. Druh bere vstup jako chybu časového intervalu { "1" } PPS, takže m = { "1" } s. Poznámka { "1" } k tabulce 7-3 říká, že cTE se odhaduje průměrováním časové chyby po dobu { "1 000" } s. Druh hlásí nejhorší absolutní průměr po sobě jdoucích bloků o délce { "1 000" } s.

seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): síťové limity v referenčním bodě C

seg-8c2b01661011 = Všechny tři jsou případ nasazení { "1" } a platí po dolnopropustném filtru prvního řádu { "0.1" } Hz.

seg-b3f93a59a8eb = Článek

seg-23e44eab6e8b = max|TE_L|

seg-cb1a66f62f8e = Limit MTIE

seg-4aa99615d914 = { "7.3.1" } (aplikace třídy { "4" })

seg-eacfcd0a9ea5 = { "1 100" } ns

seg-dc2351580120 = { "100" } + { "75" } τ ns

seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

seg-884708f2736f = { "580" } ns

seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

seg-17c12885b0d1 = { "7.3.2" } (rozšířená síť)

seg-fcd7cb03855f = { "600" } ns

seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

seg-f7fda527feed = { "200" } ns

seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

seg-1f0b651381ea = { "7.3.3" } (PRTC v přístupové síti)

seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

seg-3aacef0066a0 = { "1" } < τ < { "400" }

seg-f34cbd5ce7e4 = { "44" } ns

seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

seg-b0987b4e2e07 = Tabulka 7-3 nechává samotné τ = { "400" } s bez limitu (jeden řádek končí „< { "400" }“, další začíná „{ "400" } <“). Druh tam žádný limit nehlásí, místo aby nějaký zvolil. Referenční bod A (článek { "7.1" }) přebírá své limity z G.8272, takže jej pokrývají výše uvedené masky PRTC.

seg-915182a7500e = Frekvenční synchronizace: generování kolísání podle G.811, G.812, G.8262 a G.8262.1 ({ "0.36" })

seg-fb1342b76953 = Sedm masek, z nichž každá je limit generování kolísání MTIE a TDEV při konstantní teplotě (v rozmezí ±{ "1" } K), definovaný přes ekvivalentní měřicí dolnopropustný filtr prvního řádu { "10" } Hz, který články uvádějí. Tento filtr působí před vzorkováním, takže druh bere záznam jako již přes něj změřený a nic neuplatňuje. Maska PRC je pro autonomní hodiny (nezávislá konfigurace hodin G.810, obrázek 2a); ostatní jsou limity režimu zachycení pro hodiny synchronizované k referenci bez kolísání. Referenční scénář je <c1/>: volně běžící OCXO proti třem maskám EEC, což nadhodnocuje příspěvek oscilátoru při pozorovacích intervalech dlouhých vůči časové konstantě kterékoli smyčky.

seg-3faf039b0ed9 = MTIE (ns)

seg-ca33cbe4fd07 = TDEV (ns)

seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

seg-cb38d6327e5c = G.811 (09/1997) článek { "6.1" }

seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

seg-5e048893f25e = G.812 (06/2004) tabulky { "3" } a { "6" }

seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

seg-ae92888ca436 = G.812 (06/2004) tabulky { "4" } a { "7" }

seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

seg-8e825000b58e = G.8262 (10/2024) tabulky { "1" } a { "3" }

seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

seg-9ef5ff04e1d4 = jako G.812 tabulka { "7" }, uzavřeno v { "10 000" } s

seg-3ecb8d9128d0 = G.8262 (10/2024) tabulky { "4" } a { "5" }

seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

seg-47d0f50aa906 = G.8262.1 (11/2025) tabulky { "1" } a { "3" }

seg-45e4ed8fa6ea = Každý řádek byl zkontrolován proti textu staženému z itu.int dne 2026-10-13: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) a G.811 (09/1997). G.812 (06/2004) je uvedeno jako nahrazené předpublikovaným vydáním 08/2026 a G.811 má Amd. { "1" } (04/2016); ani jedno nebylo možné stáhnout, takže pokud mění některou výše uvedenou hodnotu, tato stránka a kód to neodrážejí. Kde vytištěné koeficienty činí bod zlomu nespojitým (například { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns oproti plató { "100" } ns v G.812 tabulce { "4" }), tabulky se ponechávají tak, jak jsou vytištěny, a jednotkové testy omezují skok. Neimplementováno: povolené odchylky při proměnné teplotě (G.812 tabulka { "5" }, G.8262 tabulka { "2" }, G.8262.1 tabulka { "2" }), požadavky na holdover a přechodové děje, jitter a frekvenční přesnost G.811 podle článku { "5" }.

seg-4f6666854cf7 = Rozpočty (doba do překročení)

seg-1f3322a94bbb = Výchozí max|TE_HO| ePRTC

seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) článek { "8.3.1" }

seg-0d5433d85c88 = Přidělení holdoveru v síti, krátké přerušení GNSS

seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) tabulka V.1, scénář selhání (b), „přeskupení a holdover v síti“. Příklad přidělení, nikoli požadavek.

seg-afe6c9903ada = Síťový limit v referenčním bodě C

seg-0c261b05c3cf = G.8271.1 článek { "7.3.1" }. Je to filtrovaná veličina; jako rozpočet se porovnává nefiltrovaná.

seg-4b5a9718d008 = Koncová aplikace, třída přesnosti { "4" }

seg-2a38e45e7008 = { "1.5" } µs

seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) tabulka { "1" }, třída { "4" }

seg-ded846b5a4bc = <b>Klasický údaj „{ "1.5" } µs od konce ke konci“.</b> Je to požadavek na časovou chybu třídy { "4" } z tabulky { "1" } G.8271, stanovený vůči společné referenci u koncové aplikace. Tabulka V.1 G.8271.1 ukazuje, jak jej může síť přidělit za běžného provozu: { "100" } ns pro PRTC/telekomunikační grandmaster, { "200" } ns pro dynamickou časovou chybu řetězce, konstantní časová chyba pro hodiny a spoje, celkem { "1 100" } ns v referenčním bodě C, poté { "250" } ns pro přeskupení a krátký holdover v koncové aplikaci a { "150" } ns pro vlastní šum koncové aplikace, { "1 500" } ns v referenčním bodě E. Scénář selhání (c) téže tabulky, „dlouhé doby holdoveru, např. { "1" } den“, dává { "3 350" } ns v C a { "3 500" } ns v E (její poznámka { "5" } říká, že překročení { "1 500" } ns může zhoršit službu). Žádné z obou doporučení tedy nestanoví požadavek „{ "1.5" } µs po { "24" } hodin holdoveru“ a druh jej neimplementuje.

seg-76cab595673a = Nepotvrzeno nebo neimplementováno

seg-175c282ddce2 = Nic z následujícího není implementováno jako maska. Nic z toho nebylo doplněno odhadem.

seg-3c74e4ba9579 = <b>V doporučeních označeno „k dalšímu studiu“:</b> max|TE| třídy D podle G.8273.2, cTE, dTE_L MTIE a TDEV, dTE_H a holdover; holdover ePRTC-B (G.8272.1 článek { "8.2.1" }); MTIE a TDEV holdoveru ePRTC-A nad { "10 000" } s (tabulka { "4" } poznámka { "1" }, tabulka { "5" } poznámka { "2" }); fázová nespojitost ePRTC (článek { "7" }); fázový/časový holdover T-BC/T-TSC při ztrátě vstupů PTP i fyzické vrstvy (G.8273.2 článek { "7.4.2.1" }); síťový limit TDEV v referenčním bodě C (G.8271.1 články { "7.3.1" } až { "7.3.3" }); síťové limity pro případ nasazení { "2" } v bodě C.

seg-93c60d44788e = <b>Přepsáno, ale v této verzi neimplementováno:</b> G.8273.2 tabulka 7-6 (MTIE s proměnnou teplotou: { "40" } / { "40" } / { "10" } ns do { "10 000" } s), tabulka 7-7 (dTE_H mezi vrcholy: { "70" } / { "70" } / { "30" } ns, což vyžaduje horní propust { "0.1" } Hz), tabulka 7-10 (MTIE holdoveru s frekvenční asistencí fyzické vrstvy), relativní časová chyba (tabulky 7-8 a 7-9) a limity dTE_H z G.8271.1 článků { "7.3.2" } ({ "50" } ns) a { "7.3.3" } ({ "70" } ns).

seg-f5fcd3b0f8a5 = <b>Neuplatněno:</b> klouzavý průměrovací filtr o nejméně { "100" } vzorcích, který G.8272 a G.8272.1 stanoví pro rozhraní PTP. Vstup se bere jako chyba časového intervalu { "1" } PPS, kterou tato doporučení měří bez filtru.

seg-74fe057a4392 = <b>Nečitelné:</b> dva omezené dodatky z { "2026" } uvedené v části „Přečtené zdroje“.

seg-bd4ec59cc872 = <b>Redakční zvláštnost:</b> v G.8272.1 Amd. { "1" } nese záhlaví tabulky { "3" } vložený řádek „TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }“ ve značkování dodatku, nad sloupci časové chyby. Nebere se jako součást obálky časové chyby. Totéž TDEV { "1" } ns je v tabulce { "5" } a je implementováno tam.

seg-511db1219de1 = Měřicí filtr

seg-5fc683308b31 = G.8273.2 a G.8271.1 definují své filtrované limity přes dolnopropustný filtr prvního řádu s šířkou pásma { "0.1" } Hz. Druh uplatňuje diskrétní vyhlazovač y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), spuštěný na prvním vzorku. Je to aproximace testovacího vybavení, nikoli kopie nějakého přístroje. Uplatňuje se jen tehdy, když je vzorkovací interval Δt { "1" } s nebo méně. Hrubší záznam se proti filtrované masce hlásí jako NOT-EVALUATED, místo aby byl špatně filtrován.

seg-218e5ad620af = Předvolby oscilátorů (MODELLED)

seg-28bb7b8ad89f = Každá hodnota je z vlastního datového listu, přečteno dne 2026-09-25.

seg-b4207b682560 = Zařízení a dokument

seg-13f9ba96c063 = Použitá maxima ADEV (τ: σ_y)

seg-d719167df981 = Stárnutí

seg-f30740907f6a = Teplota

seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; datový list Rev 12-1-2021

seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

seg-85f8b8fbbae6 = ±{ "0.15" } ppb/den po { "72" } h (f ≤ { "10" } MHz)

seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C až +{ "70" } °C, vztaženo k +{ "25" } °C

seg-53ac4dcaf8b1 = Rubidiový frekvenční normál Microchip 8040C, standardní výkon; DS00003047A (2/20)

seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

seg-ae0f630aba4b = <5e-11/měsíc po { "30" } dnech

seg-dbb2a780ceb9 = teplotní koeficient <{ "3E-10" }, { "0" } °C až { "50" } °C

seg-79d5b7a3a453 = Microchip 5071A, vysoce výkonná trubice; DS00002980D (5/25)

seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } dnů: { "1.0e-14" }; { "30" } dnů: { "1.0e-14" }

seg-1fbdd6edc376 = žádná rychlost není uvedena; změna za životnost ≤{ "5.0e-14" }

seg-bb485faf403a = ±{ "8.0e-14" } oproti prostředí ({ "0" } °C až { "50" } °C, vlhkost, magnetické pole, otřesy)

seg-889f4dc6cafc = Microchip SA.45s CSAC, varianty { "001" } a { "003" }; DS00002985D (5/23)

seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

seg-c90e2f590297 = <9e-10/měsíc po { "30" } dnech

seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C až { "70" } °C

seg-63ba00e95bbc = Odkazy na dokumenty: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

seg-31ad29d092ee = Záměrně vynecháno: řádek { "10" } s u 8040C, který datový list tiskne jako „<{ "1.0" } x { "10" }^{ "11" }“ (chybně vytištěný exponent), a řádky 5071A pod { "1" } s. OX-049 byl pro OCXO zvažován a nepoužit, protože jeho řádek stárnutí nelze z posunuté tabulky jednoznačně přečíst.

seg-8d4a915bc7fc = <b>Jak se z hodnot stává model.</b> Jsou to volby tohoto enginu a každá z nich je uvedena ve výstupu běhu:

seg-f1e6ea28601c = <b>Fit šumu.</b> Úrovně bílého, flicker a náhodné procházky frekvenčního šumu jsou nezáporný fit nejmenších čtverců na maxima ADEV, poté zvýšené, dokud model není na úrovni každého bodu nebo nad ní. Hodnoty z datového listu jsou maxima, takže je model obaluje.

seg-0e5ab055094a = <b>Flicker floor.</b> Práh šumu není nikdy pod ADEV při nejdelším uvedeném τ. Datový list přestává uvádět tam, kde výrobce přestává slibovat zlepšení, takže model nedovolí, aby se hodiny zlepšily nad něj. To může holdover jedině zhoršit.

seg-ebefbd6f119b = <b>Stárnutí.</b> Měsíční hodnota se převádí při { "30" } dnech na měsíc a uplatňuje se jako lineární frekvenční drift od okamžiku ztráty. Předvolba cesia nemá žádné stárnutí.

seg-bb08c7b5baf5 = <b>Teplota.</b> Uvedená mez se čte lineárně přes polovinu provozního rozsahu (například ±{ "5e-10" } přes −{ "10" } °C až { "70" } °C dává { "1.25e-11" } na kelvin), poté se řídí sinusovým teplotním profilem, jehož amplituda a perioda jsou vstupy scénáře. Nic na datovém listu netvrdí, že závislost je lineární; je to čtení nejhoršího případu.

seg-47a256757cfc = <b>Před ztrátou</b> jsou hodiny disciplinované a jejich časová chyba je bílý fázový šum se stanovenou hodnotou 1 sigma.

seg-3ef60b128bb7 = <b>Co ukazuje referenční scénář.</b> Při zapsaných vstupech (rubidium, denní teplotní kolísání ±{ "2" } K, holdover { "24" } h po { "1" } h zachycení) záznam dosáhne největší absolutní časové chyby { "603.2" } ns. Rozpočet ePRTC { "100" } ns překročí { "8 206" } s po ztrátě a přidělení { "400" } ns po { "25 713" } s a po celý den zůstává v mezích { "1 100" } ns a { "1.5" } µs. Obálku holdoveru ePRTC-A nesplní { "3 627" } s po ztrátě, což se očekává: tento požadavek předpokládá referenci třídy cesia. Samotný teplotní člen může dosáhnout { "660" } ns, takže při těchto vstupech znamená víc než stárnutí ({ "72" } ns na konci dne).

seg-ba87d450423c = <c1/> kontroluje MTIE a TDEV tohoto druhu proti <c2/> { "2024.06" } na <c3/>, což je série holdoveru CSAC o { "2" } 048 vzorcích se stárnutím, flickerem a teplotou. Při { "17" } průměrovacích faktorech MTIE a { "12" } faktorech TDEV se MTIE shoduje přesně a TDEV se shoduje na { "1.1e-15" } relativně. Tytéž křivky se čtou zpět z plného běhu, který CSV načítá. Tím se ověřují estimátory na tomto záznamu. Neověřuje se syntetický holdover, masky ani předvolby, což jsou řádky MODELLED v <c4/>.

seg-6fdc3cc32a2f = <s1>Předchozí</s1>Časování slotů

seg-1108b114de88 = <s1>Další</s1>Podvedený čas
