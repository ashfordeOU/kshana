# docs--lunanet-afs: translations (cs)

seg-33f4c7af9c53 = Nosná

seg-53a7343c076e = Tvrzení

seg-da9970bcbab7 = Zdroj: <c1/>

seg-4013a17a3517 = LunaNet Augmented Forward Signal: kódy, formát zprávy a <c1/>

seg-c1a27b995345 = { -brand } implementuje rozprostírací kódy a vrstvu zpráv signálu LunaNet <b>Augmented Forward Signal (AFS)</b> tak, jak je definuje jedno vydání specifikace, a ověřuje se proti tištěným tabulkám tohoto vydání.

seg-e9bd99bbddb5 = <b>Připnutí.</b> LunaNet Interoperability Specification (LNIS) <b>Version { "5" }</b>, Applicable Document { "1" } Volume A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>Version { "1.0" }, { "29" } January { "2025" }</b> (NASA). Staženo 2026-10-18; SHA-256 souboru PDF <c1/> (<a1>původ</a1>). Pozdější vydání je jiné připnutí a může kódy změnit: dokument označuje své tabulky kódů { "{" }LSIS-TBC{ "}" } a uvádí, že jsou „included to facilitate test and integration efforts only“. Každá zpráva uvádí toto vydání.

seg-6845e671bf24 = Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.

seg-69a98d01f489 = Generátor kódů LunaNet AFS ověřený proti tištěným sloupcům specifikace, ze skutečného běhu enginu v{ $version } (`kshana lunanet-afs-check spec`, připnuto k LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, { "29" } January { "2025" }; dokument označuje své tabulky kódů { "{" }LSIS-TBC{ "}" }). { "9" } z { "10" } kontrol je splněno; B4 je NOT MET ({ "420" } z { "421" } shodných). Kontroluje tok symbolů proti jednomu vydání zveřejněné specifikace a nic nevypovídá o žádném uzlu ani službě LunaNet. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Kontroluje tok symbolů proti jednomu vydání zveřejněné specifikace a nic nevypovídá o žádném uzlu ani službě LunaNet.

seg-4c3f77d97294 = Co je implementováno

seg-a0b684e44fb0 = Vrstva

seg-5d987fca539c = Co

seg-df52127d74b6 = Kde

seg-637035a0b1c1 = AFS-I (data)

seg-dbee58df4c92 = Goldův kód { "2047" } zkrácený na { "2046" } chipů, G2 zpožděný o počet chipů závislý na PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } symbolů/s, PRN { "1" } až { "210" }

seg-d4480ead20d1 = <c1/>, název signálu <c2/>

seg-6d84dce7f6d0 = AFS-Q (pilot)

seg-2ebf619c9cb6 = Weilův kód { "10230" } (konstrukce z GPS L1C) vrstvený se 4chipovým sekundárním kódem (S0 až S3) a 1500chipovým terciárním Weilovým kódem ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), bez dat. <c1/> a název signálu <c2/> jsou replika přijímače, primární x sekundární ({ "8" } ms): terciární synchronizační překryv rámce o délce { "12" } s je z ní vynechán, protože akvizice a sledování nekorelují proti replice o délce { "12" } s. <c3/> je úplný kód o délce { "12" } s

seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

seg-906440b861cd = Rámec

seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } prokládaných symbolů = { "6000" } symbolů = { "12" } s při { "500" } symbolech/s

seg-a242d95d701f = { "9" } bitů (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), generátor { "763" } osmičkově, s korelačním dekodérem dokumentu o 256 hypotézách

seg-df8894e1304f = CRC

seg-a04ccd611398 = CRC-24Q, generátor ({ "1" }+X)P(X) (Appendix H)

seg-e225f10d7848 = Prokladač

seg-cb075da6f8cf = { "60" } řádků x { "98" } sloupců, zapisováno po řádcích a čteno po sloupcích

seg-d544025254af = Obě složky přijímají příkazy <c1/>, <c2/>, <c3/> a <c4/> jako kterýkoli jiný signál, takže v záznamu lze vyhledat AFS-I nebo AFS-Q (<c5/>) a lze vytvořit syntetickou scénu pro testy softwarového přijímače. Syntetická scéna je, stejně jako u každého jiného signálu, soubor pro softwarový přijímač; nic z toho neovládá žádný rádiový hardware.

seg-6d7a9d17946d = Co <b>není</b> implementováno

seg-95731dbf3333 = <b>Kódování LDPC s rychlostí 1/2 podrámců { "2" } až { "4" }.</b> Jeho kontrolní matice jsou v Annex { "1" }, samostatném souboru, který není v PDF a není součástí repozitáře. Podrámce { "2" } až { "4" } se přenášejí a kontrolují jako neprůhledné bloky symbolů předepsané délky a slova CRC-24Q v nich se neověřují. U toku, který projde příkazem <c1/>, se neprokázalo, že obsahuje platná kódová slova.

seg-67bb5d1038c7 = <b>Obsah zpráv</b> (MSG-G1, MSG-G2, MSG-G4, ...): dokument ponechává několik definic k dopsání (TBW).

seg-bff5304c6187 = <b>Přiřazení kódů jednotlivým uzlům LunaNet</b> (Table F-1 je TBD). PRN { "1" } až { "12" } mají prozatímní testovací přiřazení (Table { "11" }). <c1/> používá primární kód PRN <em>n</em> se sekundárním kódem S((n-1) mod { "4" }); za PRN { "12" } je to vzor této implementace, nikoli dokumentu. <c2/> a <c3/> přijímají libovolnou kombinaci, s terciárním kódem libovolného PRN.

seg-6588307842fe = Rozpočet spoje, chyba signálu v prostoru, požadavky na výkon a koherenci (LSIS-100 a další).

seg-e0f2ddce6dff = <c1/> spouští implementaci proti tištěným tabulkám a vypracovaným příkladům dokumentu (prahy B1 až B10 z <a1>předregistrace</a1>) a vypisuje každý s jeho počtem a stavem. <c2/> skončí s kódem { "1" }, pokud není splněn každý práh.

seg-dafa47406a38 = <c1/> čte tok symbolů s tvrdým rozhodnutím (text ze znaků <c2/> a <c3/>; mezery se ignorují) a kontroluje synchronizační vzor, dekódování SB1, FID (definována je pouze { "0" }), kontinuitu TOI (postup o jedničku modulo { "100" }) a odstup rámců ({ "6000" } symbolů). Při jakémkoli problému skončí s kódem { "1" }.

seg-f12425044025 = <c1/> zapíše testovací tok: synchronizační vzor dokumentu, délky SB1 a rámců, s <b>zástupnými</b> podrámci { "2" } až { "4" } (střídavá výplň z LSIS-300, bez kódování LDPC, bez zprávy). Jsou to symboly pro testování kontrolního nástroje nebo dekodéru, nikoli průběh signálu; { -brand } žádný signál nezapisuje.

seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: stejné názvy. MCP: <c4/> (<c5/> spec, symbols nebo generate). Plugin: <c6/>. Studio a JetBrains: N/A (<a1>SURFACES.md</a1>).

seg-2133870991ca = Prahy stanovené v <c1/> dříve, než generátor existoval; testy v <c2/>.

seg-b74d5800a039 = Práh

seg-e75915599d5e = prvních a posledních { "24" } chipů AFS-I, { "210" } PRN

seg-f654db18922f = <b>MET</b>, { "420" } z { "420" }

seg-55d0d7168ceb = tištěný počáteční stav G2 je stav po tištěném zpoždění

seg-41590da4d1ac = <b>NOT MET</b>, { "0" } z { "210" }: tvrzení mělo opačný směr. Dodatečně (B1c, není předregistrováno): tištěný stav je stav po { "2047" } minus zpoždění, { "210" } z { "210" }

seg-b94947c99f9a = Legendre({ "10223" }) se rovná Table D-1

seg-75c8da01c0f1 = MET

seg-e3402e2420bd = prvních a posledních { "24" } chipů primárního kódu AFS-Q, { "210" } PRN

seg-678604d6e463 = Legendre({ "1499" }) se rovná Table E-1 a prvních a posledních { "24" } chipů terciárního kódu, { "210" } PRN

seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } z { "421" }: Legendreova posloupnost souhlasí a { "419" } z { "420" } sloupců kódů souhlasí. Posledních { "24" } chipů uvedených pro PRN { "147" } (<c1/>) je táž hodnota, jaká je uvedena pro PRN { "151" }, jehož kód generátor reprodukuje; dva různé Weilovy indexy ({ "607" } a { "612" }) nedávají stejných posledních { "24" } chipů, takže záznam pro PRN { "147" } je nejspíš překlep v dokumentu. Bez samostatného souboru kódů Annex { "3" } to nelze rozhodnout. Připnuto testem

seg-aea9620e7bf1 = sekundární kódy S0 až S3 se rovnají Table { "10" }

seg-2996e986d247 = <b>MET</b> (vlastní konstanty dokumentu)

seg-23c9277f62e6 = vypracovaný příklad SB1 z Figure { "8" }

seg-fb70493dcdcf = <b>MET</b>: 0x045 se zakóduje na 0x229F61DBB84A0 a dekóduje na FID { "0" }, TOI { "69" } (jeden příklad)

seg-acce07c33dec = kontrolní hodnota CRC-24Q pro <c1/>

seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (hodnota z katalogu, mimo specifikaci)

seg-789b31d53873 = aritmetika rámců

seg-5b5da00ad1c8 = prokládání a zpětné prokládání

seg-80f9cd313ec4 = <b>MET</b> (vlastnost, MODELLED)

seg-92a7addfdb8c = synchronizační vzor

seg-215913f74706 = <b>MET</b> ({ "68" } symbolů; kontrola přepisu)

seg-3b51bd143c19 = B1 až B4 jsou VALIDATED proti tištěným tabulkám citovaného vydání, které dokument označuje { "{" }LSIS-TBC{ "}" }. Zpáteční cesta scéna–akvizice–sledování obou složek splňuje stejné prahy jako ostatní signály (<c1/>).

seg-9edb6e5771ca = <s1>Předchozí</s1>Ověřování Galileo OSNMA

seg-d0043d0f578a = <s1>Další</s1>Jammertest jako rozhodčí

seg-52946c9ff62a = Co není implementováno

seg-339c9eeb510b = kshana lunanet-afs-check
