# docs--kinds-inertial-fusion-and-quantum-sensors: translations (cs)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Druh

seg-ec26df467b88 = Společná Kalmanova fúze senzorů PNT nad týmiž hybridními vstupy.

seg-c8a1c797f4b1 = Graf, který engine zapisuje pro scenarios/fusion-pnt.toml, druh fusion

seg-38df285a3f25 = Volně a těsně vázaný EKF stavu chyb GNSS/INS.

seg-7d993b676006 = Graf, který engine zapisuje pro scenarios/gnss-ins.toml, druh gnss-ins

seg-c6edf89eb8d4 = 17stavový hybridní kvantově-klasický těsně vázaný UKF GNSS/INS (MODELLED): { "15" } chybových stavů INS + korekce biasu akcelerace odvozená z CAI + 2stavové hodiny (fáze + frekvence) z enginu hodin s parametry q, řízené ohraničeným chybovým modelem CAI. Ukazatelem kvality je vlastní konzistence filtru (NEES + bělost inovací proti mezím χ²) – tvrzení o vlastní konzistenci, NIKOLI záruka přesnosti v reálném světě. Pouze simulace; žádné TRL>{ "3" }, žádná letová historie, žádná externí validace.

seg-2968660fa880 = Graf, který engine zapisuje pro scenarios/hybrid-ukf.toml, druh hybrid-ukf

seg-22cd963c7042 = Hybridní vrcholový PNT: podpora hodinami + IMU + přenosem času.

seg-52378a7b074c = Graf, který engine zapisuje pro scenarios/hybrid-pnt.toml, druh hybrid

seg-bdedf28adc48 = Inerciální dead-reckoning s 1 stupněm volnosti během výpadku GNSS.

seg-873c402bb724 = Graf, který engine zapisuje pro scenarios/imu-deadreckoning.toml, druh inertial

seg-5b9a6efe6337 = Model chyby INS/TRN při setrvání bez korekce: chyba polohy v závislosti na době setrvání, sestavená z koeficientů IMU, nikoli procházená jako předpokládaná rychlost driftu. Pět příspěvků k růstu — bias akcelerometru, náklon z biasu gyroskopu přes tíži, náhodná procházka rychlosti, náhodná procházka úhlu a měřítkový faktor v závislosti na uražené vzdálenosti — každý šířený devítistavovým modelem inerciální chyby v lokální rovině se Schulerovou zpětnou vazbou při uvedené šířce a výšce (zákony vedoucího řádu pro krátké setrvání t², t³, t^{ "1.5" }, t^{ "2.5" } a t¹/t² se uvádějí vedle) a kombinované podle UVEDENÉHO pravidla (druhá odmocnina součtu čtverců ve výchozím stavu, nebo lineární součet, nebo deterministický součet se stochastickým rss; všechny tři se počítají při každém běhu, aby volba byla viditelná, a ne zakrytá). Doby setrvání, které dosáhnou prahů polohy zadaných volajícím ({ "10" } m a { "50" } m ve výchozím stavu), najde stávající půlení intervalu enginu, každá s rozpisem po příspěvcích jmenujícím dominantní zdroj, a překročení každého jednotlivého příspěvku se navíc obrátí algebraicky, aby se oba výsledky shodovaly. Režim navigace podle terénu (TRN) omezuje setrvání periodickými určeními polohy a hlásí největší interval určení, který každý práh udrží; určení pouze polohy ponechává chybu rychlosti a náklon živé i po určení, takže setrvání neomezí při každé frekvenci určení, a zpráva to říká, místo aby vracela nulu. MODELLED: koeficienty tříd IMU jsou reprezentativní údaje pásma, nikoli katalogový list, a zbytek určení polohy podle terénu je vstup. Nedosažený práh se hlásí jako null se stavem, nikdy jako nula. Nejde o certifikovaný produkt výkonu inerciální navigace.

seg-134a4c91da3a = Graf, který engine zapisuje pro scenarios/ins-trn-coast.toml, druh ins-trn-coast

seg-4e31c8daf798 = Registr

seg-9095869ec445 = { "9" } druhů scénářů enginu v{ $version }. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází od enginu nebo z verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se označení získává: část Evidence v README).

seg-efd15cff3d32 = MODELLED (označení výsledku)

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-e6f2ab1647e2 = Zdroj: <c1/>

seg-23762f3a250b = Inerciální senzory, fúze a kvantové senzory (rodina druhů scénářů)

seg-6ec3ad751007 = Tematické stránky: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Spusťte jednu: <c1/>. Všechny rodiny: <a4>KINDS.md</a4>.

seg-0e73a37b716b = Přehledový list grafů, které engine zapisuje pro druhy z rodiny Inerciální senzory, fúze a kvantové senzory

seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

seg-084cf4eeccb5 = 17stavový hybridní kvantově-klasický těsně vázaný UKF pro GNSS/INS (MODELLED): { "15" } chybových stavů INS + korekce biasu akcelerometru odvozená z CAI + 2stavové (fáze + frekvence) hodiny z enginu hodin s q-parametry

seg-a7d3c32b29b3 = Chybový model doběhu INS/TRN: chyba polohy v závislosti na délce doběhu, sestavená z koeficientů IMU a nikoli prohledávaná jako předpokládaná rychlost driftu.

seg-beb568dec44f = MODELLED kvantová navigace bez GNSS: při výpadku GNSS kvantový (studený atomový interferometr) inerciální rozpočet oproti klasickému INS navigační třídy — růst chyby polohy během doběhu, holdover t

seg-d948ea4d1f33 = MODELLED detekce poruch a anomálií pro kvantové systémy PNT: označený katalog poruch (skok frekvence/drift/ztráta zachycení hodin; skok biasu/výpadek senzoru), ROC AUC detekční statistiky (s bootstrap CI

seg-48e72d451a50 = Kompromis mezi kvantovým a klasickým PNT ({ "13503" }): přínos holdoveru času a inerciálního holdoveru kandidátních hodin (křivka naměřené ADEV — opora obhajitelnosti — nebo třída kvantových hodin) oproti klasickému základu

seg-5330b47bc0b6 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Volitelné: <c7/>.

seg-75867e8b4b4f = <b>Registr:</b> MODELLED { "6" } · VALIDATED { "2" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>inertial</a1>.

seg-fdf140d4ce68 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-44c6371da5f9 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>hybrid</a1>.

seg-3246c9e1e0cb = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Volitelné: <c11/>.

seg-e2bd8fd0d9e5 = <b>Registr:</b> MODELLED { "4" } · VALIDATED { "4" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>fusion</a1>.

seg-d0790a2643ae = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Volitelná: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

seg-85ab600e3050 = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>hybrid-ukf</a1>.

seg-3bbd5ce09bee = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Volitelná: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

seg-08ad3969f65b = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>gnss-ins</a1>.

seg-1703619ca20e = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-ab3453d1ee51 = <b>Registr:</b> VALIDATED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>ins-trn-coast</a1>.

seg-a77cdf6e8e31 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>.

seg-b05e96ce392d = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>quantum-gnss-free-nav</a1>.

seg-3f3e48045d31 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-cbefb1538dec = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>quantum-anomaly-detect</a1>.

seg-6eee03151521 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>. Volitelná: <c5/>, <c6/>, <c7/>, <c8/>.

seg-6cb57dc94549 = <b>Registr:</b> MODELLED { "1" } · VALIDATED { "2" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>quantum-trade</a1>.

seg-b6c31bdda166 = <s1>Předchozí</s1>Alternativní PNT při nedostupnosti GPS

seg-0585e4ae329e = <s1>Další</s1>Rušení, spoofing a spektrum
