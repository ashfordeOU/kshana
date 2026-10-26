# docs--kind-realtime-frame-eop: translations (cs)

seg-a2889fb2b42a = Tematická stránka: <a1>integrations.md</a1>

seg-8e845ce908ee = Druh scénáře enginu v{ $version }, rodina <a1>Měření GNSS, určování polohy a integrita</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-f6b7ca020692 = Stránka rodiny: <a1>Měření GNSS, určování polohy a integrita</a1>

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-1ad013ffb9d1 = Zdroj: <c1/>

seg-54620502f0dd = <c1/> (druh scénáře)

seg-edfcb546d9de = Rozpočet predikce lunární soustavy / orientace Země v reálném čase: tabulka { "1" } z P4 (kontrola konzistence chyby soustavy — po zpracování ~{ "0.27" } m ↔ ~{ "0.010" } ms a v reálném čase ~{ "15" } m ↔ ~{ "0.5" } ms, každá poloha v soustavě vyjádřená jako ekvivalentní chyba UT1 přes rameno páky L19 Δr = D_EM·ω⊕·ΔUT1) a tabulka { "2" } (naměřená chyba predikce UT1 v závislosti na horizontu — křivka L18 odečtená přímo z reálné řady IERS finals2000A: konečná podlaha Bulletin A − Bulletin B a chyba vícedenního prediktoru persistence, každá převedená na polohu v soustavě Měsíce přes L19), plus kvadratický součtový (root-sum-square) rozpočet chyby soustavy v reálném čase L21 (EOP + efemeridy + podlaha realizace). VALIDATED uzavřený tvar (rameno páky L19, ω⊕ křížově zkontrolováno proti úhlu rotace Země CIO) a VALIDATED reálná data (křivka L18 z reálných řádků finals2000A); MODELLED jsou velikosti kovariance OD lunárního relé a podlaha realizace soustavy (reprezentativní přídělové hodnoty) a prediktor persistence (nikoli provozní algoritmus Bulletin A od IERS). Nejde o certifikovaný produkt soustavy v reálném čase.

seg-488039e4240f = Jeden běh <c1/> se shrnuje takto: realtime-frame-eop | tabulka { "1" }: po zpracování { "0.27" } m ({ "0.0096" } ms UT1) ↔ v reálném čase { "14.4" } m ({ "0.514" } ms UT1) | tabulka { "2" }: konečná podlaha { "0.0171" } ms → 3 dny { "1.6644" } ms | celkový rozpočet { "20.1" } m ({ "67.0" } ns) | rameno páky L19 + reálná data L18 (ověřeno), kovariance OD (vypočteno z modelu)

seg-66264ec78a4c = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-45a4ed476311 = Příklad <c1/> mimo jiné nastavuje:

seg-c39a26aa1f1e = přibalená fixtura finals2000A_20260930

seg-9ef8a2b4c144 = Popisek výsledku (z enginu): Rozpočet predikce lunární soustavy / orientace Země v reálném čase. VALIDATED uzavřený tvar: rameno páky L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ křížově zkontrolováno proti úhlu rotace Země CIO. VALIDATED reálná data: křivky chyby predikce UT1 a pohybu pólu L18 odečtené přímo z reálné IERS finals200

seg-2721ed7727bb = Graf, který engine zapisuje pro scenarios/realtime-frame-eop.toml, druh realtime-frame-eop

seg-72a1fc2f5c90 = <b>VALIDATED</b> Jedna tabulka uvádí chybu predikce UT1, chybu pólu při pohybu pólu a jejich kvadraturní kombinaci na Měsíci přes IDENTICKOU množinu epoch pro každý horizont a vypisuje epochy, ve kterých byla každá složka změřena. Testy: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

seg-b1d90bf98ac3 = <b>VALIDATED</b> Výchozí hodnota za běhu <c1/> je vlastní vestavěná kopie doslovného výňatku z IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } po sobě jdoucích denních řádků, MJD 61224-61397, vyříznutých z finals2000A.all ze dne 2026-09-30) nesou Testy: <a1>operational_eop_predictor_reference.rs</a1>.

seg-0298bd40d72f = <b>MODELLED</b> Proložení zkreslení a rychlosti metodou nejmenších čtverců v koncovém okně plus hlavní periodické členy — roční, půlroční a dva hlavní zonální slapy pro UT1; Chandlerův, roční a půlroční pro pól — extrapolované s posledním v okně Testy: <a1>operational_eop_predictor_reference.rs</a1>.

seg-12efcd20ca62 = <b>VALIDATED</b> Jedna tabulka uvádí chybu predikce UT1, chybu pólu při pohybu pólu a jejich kvadraturní kombinaci na Měsíci přes IDENTICKOU množinu epoch pro každý horizont, vy. Orákulum (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) čtoucí produkt IERS finals2000A s vlastním pravidlem Bulletin-B-jinak-A a pyerfa { "2.0.1.5" } (SOFA), úplné rotace od nebeské k pozemské soustavě (c2i06a, sp00, pom00, c2tcio; úhel rotace Země podle IERS { "2010" } rov. { "5.15" } v přesné aritmetice), spuštěné jako samostatné programy nad doslovnými řádky zmrazeného finals2000A.all ze dne 2026-09-30; předregistrováno (455b8fb5) s dodatky A1 a A2 upravujícími pouze

seg-020e5919c8fd = <b>VALIDATED</b> Výchozí hodnota za běhu <c1/> je vlastní vestavěná kopie doslovného výňatku z IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } po sobě jdoucích. Orákulum (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), čtoucí tytéž bajty vlastním čtecím modulem, a tabulka IERS Bulletin A Vol. XXXIX No. { "039" }, opsaná číslo po čísle; předregistrováno (6fdae01b) se šesti přesnými kritérii před spuštěním astropy. Všech šest platí: { "30" } konečných, { "54" } rychlých a { "90" } predikovaných řádků se shodnými seznamy MJD, každý predikovaný řádek s příznakem P, shodný census výchozího běhu a predikce shodné s Bullet

seg-530c87bbff78 = <b>MODELLED</b> Proložení zkreslení a rychlosti metodou nejmenších čtverců v koncovém okně plus hlavní periodické členy — roční, půlroční a dva hlavní zonální slapy pro UT1; Cha. Orákulum (ReferenceImpl): Tři nezávislé cesty, žádná z nich není publikovaným údajem o přesnosti predikce. ({ "1" }) Analytický signál se známými koeficienty — jediný způsob, jak procvičit periodický aparát, protože žádná potvrzená řada není dost dlouhá pro roční člen. ({ "2" }) Učebnicové řešení metodou nejmenších čtverců v uzavřeném tvaru, jiná algebra než testované maticové řešení, na reálných řádcích. ({ "3" }) Skutečné archivované predikční řádky Bulletin A, kte

seg-a233df86be95 = Rozpočet predikce lunární soustavy / orientace Země v reálném čase. VALIDATED uzavřený tvar: rameno páky L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ křížově zkontrolováno proti úhlu rotace Země CIO. VALIDATED reálná data: křivky chyby predikce UT1 a pohybu pólu L18 odečtené přímo z reálné řady IERS finals2000A (Bulletin A rychlý oproti Bulletin B konečný a vícedenní persistence nad reálnými denními řádky). ODVOZENO: soustava (výsledek <c1/>)

seg-60e7ee7e6e3e = VALIDATED uzavřený tvar (rameno páky L19, ω⊕ křížově zkontrolováno proti úhlu rotace Země CIO) a VALIDATED reálná data (křivka L18 z reálných řádků finals2000A); MODELLED jsou velikosti kovariance OD lunárního relé a podlaha realizace soustavy (reprezentativní přídělové hodnoty) a prediktor persistence (nikoli provozní algoritmus Bulletin A od IERS). (katalog druhů (<c1/>))

seg-ddf4702f78e5 = Poctivost: VALIDATED uzavřený tvar (rameno páky L19, omega_earth křížově zkontrolováno proti úhlu rotace Země CIO) a VALIDATED reálná data (křivky L18 pro UT1 a pohyb pólu z reálných řádků finals2000A). ODVOZENÁ podlaha realizace soustavy (reziduum po fitu Helmertovy transformace). MODELLED jsou velikosti kovariance OD lunárního relé ({ "0.27" } m po zpracování, ~{ "14.4" } m v reálném čase při hodinové latenci — zaokrouhlená, nikoli zpětně dopočtená, př (komentář v souboru scénáře, řádky { "27" } až { "32" })

seg-bc51b666d070 = Chyba predikce orientace Země v provozním stylu, měřená jako predikované oproti konečnému, je MODELLED, nikoli ověřená: zkontrolováno proti samostatné implementaci ve stejné kódové bázi — nezávislé na testované jednotce, ale ne externě autoritativní. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-653fad5e0afe = <s1>Předchozí</s1>quantum-trade

seg-5abe534d4ef1 = <s1>Další</s1>reentry
