# docs--kind-lunar-llr-datum: translations (cs)

seg-8f8871ac8a0f = Tematická stránka: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-fd34d760edb1 = <b>VALIDATED</b> Kovariance sedmiparametrového Helmertova datumu, jejíž dva simulované vstupy jsou nahrazeny naměřenými: plán tvoří epochy pozemního vysílání { "337" } archivovaných normálních bodů lunárního laserového měření vzdálenosti ILRS (2015-04-08 až 2015-06-27, Grasse MeO { "7" } Testy: <a1>lunar_llr_real_data.rs</a1>.

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-8db575fc6d82 = Zdroj: <c1/>

seg-5329c6c75887 = <c1/> (druh scénáře)

seg-25455a33523c = Sedmiparametrové Helmertovo datum lunárního rámce řízené SKUTEČNOU, ARCHIVOVANOU pozorovací kampaní místo simulované. Zatímco lunar-frame-campaign odstranil vloženou transformaci, ale síť stanic, plán a sigma na pozorování stále uváděl jako ILLUSTRATIVE vstupy, tento druh bere všechny tři z měření: epochy jsou časy pozemního vysílání archivovaných normálních bodů ILRS Consolidated Laser Ranging Data, pozorování jsou laserová měření vzdálenosti skutečně vystřelená na pět retroreflektorových polí na Měsíci a každá váha pozorování je vlastní archivovaná preciznost onoho normálního bodu bin_rms/sqrt(n_raw) vyčtená ze souboru. Souřadnice stanic pocházejí z řešení SLR IERS ITRF2020 (propagovaného na epochu jejich publikovanými rychlostmi) a souřadnice odražečů z JPL DE430 Table { "7" } v rámci střední Země / střední rotace, který realizuje model IAU { "2015" } WGCCRE. Parciální derivace vzdálenosti se akumulují do společné Fisherovy informační matice souřadnic odražečů a propagují se toutéž Helmertovou návrhovou maticí do kovariance datumu, diagnostikované pomocí crate::fim::crlb. Hodnost, defekt, podmíněnost, spektrum, nepozorovatelné směry v sedmiparametrové bázi, nejslabší směr při plné hodnosti a podíl každého parametru na něm se vydávají při každém běhu a neomezený parametr se publikuje jako NULL se stavem. Korelace mezi poli je MEASURED jako přesně nulová, nikoli předpokládána, protože laserové měření vzdálenosti se dotýká jednoho pole. Záznam, který katalogy neumějí umístit — stanice bez publikované polohy ITRF — je PŘESKOČEN A SPOČÍTÁN, nikdy se mu nedosadí náhradní souřadnice. KTERÉ SPOJE JSOU MEASURED A KTERÉ JSOU MODELLED, TO JE SAMOTNÁ ZPRÁVA, NE POZNÁMKA POD ČAROU: efemeridy středu Měsíce a orientace tělesa IAU zůstávají modelované a jejich společná velikost se vydává jako rozdíl pozorované minus vypočtené jednosměrné vzdálenosti přes každý použitý bod; troposféra, slapy pevného tělesa, excentricita stanice, pohyb pólu, UT1-UTC, relativistické zpoždění a hodiny stanic chybějí a jsou uvnitř tohoto rezidua. Protože chyba efemeridy se do kovariance dostává jen přes směr každé přímé viditelnosti, každý běh také znovu řeší celé datum se všemi parciálními derivacemi nakloněnými o sensitivity_tilt_deg (se střídavým znaménkem) a vydává poměr, takže necitlivost kovariance k modelované efemeridě je číslo, nikoli argument. Vlastní hodnoty simulované kampaně se SPOUŠTÍ a vypisují vedle změřených, nepřepisují se. MODELLED: sedmiparametrové hodnoty jsou Cramerova–Raova mez pro zredukovanou množinu parametrů na skutečném plánu — nikoli vyřešené datum, nikoli analýza LLR a nikoli geodetický produkt. Uložený řez reálnými daty se dodává s repozitářem, ale ne s publikovaným balíkem (crate); nasměrujte data_dir na jeho kopii.

seg-f4359803d67a = Jeden běh <c1/> se shrne takto: lunar-llr-datum: { "337" } archivovaných normálních bodů ({ "349" } zpracováno) z { "2" } stanic na { "5" } retroreflektorových polí za { "80.9" } d; medián změřené preciznosti normálního bodu { "5.13" } mm jednosměrně; hodnost informace odražečů 15/15; Helmert hodnost 7/7 cond { "2.399e4" }; sigma translace datumu { "1.851746e-2" } m; RMS rezidua pozorované minus vypočtené jednosměrné vzdálenosti { "156493.9" } m (modelované spoje, především analytická lunární efemerida)

seg-7eda56c1285a = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-c95b4d285cbd = Příklad <c1/> mimo jiné nastavuje:

seg-37a77f49f048 = ps

seg-b5c1e8681164 = Popisek výsledku (od enginu): Datum lunárního rámce ze SKUTEČNÉ pozorovací kampaně. Plán, počet pozorování a každá váha pozorování pocházejí z archivovaných normálních bodů lunárního laserového měření vzdálenosti ILRS (změřeno); souřadnice stanic pocházejí z IERS ITRF2020 a souřadnice retroreflektorů z JPL DE430 Table { "7" } (publikov

seg-e4da113cbe18 = Graf, který engine zapisuje pro scenarios/lunar-llr-datum.toml, druh lunar-llr-datum

seg-764e54be97a0 = <b>VALIDATED</b> Kovariance sedmiparametrového Helmertova datumu lunar-llr-datum z archivovaných normálních bodů ILRS a jejich změřených vah, na cestě přes jádro: geocentrický střed Měsíce se čte z JPL DE440 vlastním čtečem jader enginu (planetary_ker Testy: <a1>validate_llr_datum_kernel_moon.rs</a1>.

seg-cae262db0e46 = <b>VALIDATED</b> Kovariance sedmiparametrového Helmertova datumu, jejíž dva simulované vstupy jsou nahrazeny naměřenými: plán tvoří epochy pozemního vysílání { "337" } archiv. Orákulum (ExternalDataset): Identity v uzavřeném tvaru, nezávislá cesta v repozitáři a od { "0.36" } nezávislé orákulum knihoven SPICE a NumPy na nových naměřených datech (níže); neexistuje žádná publikovaná dvojice kovariancí datumu lunárního LLR, vůči které by se dalo kontrolovat, takže se netvrdí žádná přesnost. Jediná nová derivace — parciální derivace vzdálenosti podle polohy odražeče vázané na těleso — je odvozena znovu centrální konečnou diferencí oboustranné doby letu světla, kterou diferen

seg-61ac3609406a = Datum lunárního rámce ze SKUTEČNÉ pozorovací kampaně. Plán, počet pozorování a každá váha pozorování pocházejí z archivovaných normálních bodů lunárního laserového měření vzdálenosti ILRS (změřeno); souřadnice stanic pocházejí z IERS ITRF2020 a souřadnice retroreflektorů z JPL DE430 Table { "7" } (publikováno). Efemeridy středu Měsíce, orientace tělesa IAU { "2015" } WGCCRE a absence troposféry, slapů, excentricity stanice (výsledek <c1/>)

seg-97610a2cca73 = Korelace mezi poli je MEASURED jako přesně nulová, nikoli předpokládána, protože laserové měření vzdálenosti se dotýká jednoho pole. (katalog druhů (<c1/>))

seg-64b1c08eeb11 = KTERÉ SPOJE JSOU MEASURED A KTERÉ JSOU MODELLED, TO JE SAMOTNÁ ZPRÁVA, NE POZNÁMKA POD ČAROU: efemeridy středu Měsíce a orientace tělesa IAU zůstávají modelované a jejich společná velikost se vydává jako rozdíl pozorované minus vypočtené jednosměrné vzdálenosti přes každý použitý bod; troposféra, slapy pevného tělesa, excentricita stanice, pohyb pólu, UT1-UTC, relativistické zpoždění a hodiny stanic chybějí a jsou uvnitř tohoto rezidua. (katalog druhů (<c1/>))

seg-d38710f3ce4a = MODELLED: sedmiparametrové hodnoty jsou Cramerova–Raova mez pro zredukovanou množinu parametrů na skutečném plánu — nikoli vyřešené datum, nikoli analýza LLR a nikoli geodetický produkt. (katalog druhů (<c1/>))

seg-a19e2b1fcaf1 = epochy jsou časy pozemního vysílání archivovaných normálních bodů ILRS Consolidated Laser Ranging Data; * pozorování jsou laserová měření vzdálenosti skutečně vystřelená na pět retroreflektorových polí na Měsíci; * každá váha pozorování je VLASTNÍ archivovaná preciznost onoho normálního bodu, bin_rms/sqrt(n_raw), vyčtená ze souboru, nikoli předpokládaná. (komentář v souboru scénáře, řádky { "7" } až { "12" })

seg-5ed6b83c01da = KTERÉ SPOJE JSOU MEASURED A KTERÉ JSOU MODELLED, TO JE SAMOTNÁ ZPRÁVA, NE POZNÁMKA POD ČAROU. Efemeridy středu Měsíce a orientace tělesa IAU zůstávají modelované a jejich společná velikost se vydává jako rozdíl pozorované minus vypočtené jednosměrné vzdálenosti přes každý použitý bod; troposféra, slapy pevného tělesa, excentricita stanice, pohyb pólu, UT1-UTC, relativistické zpoždění a hodiny stanic chybějí a leží uvnitř tohoto rezidua. Protože (komentář v souboru scénáře, řádky { "18" } až { "26" })

seg-7e7ff3ce4971 = Korelace mezi poli je MEASURED jako přesně nulová, nikoli předpokládána, protože laserové měření vzdálenosti se dotýká jednoho pole. Záznam, který katalogy neumějí umístit — stanice bez publikované polohy ITRF — je PŘESKOČEN A SPOČÍTÁN, nikdy se mu nedosadí náhradní souřadnice. Vlastní hodnoty simulované kampaně se SPOUŠTÍ a vypisují vedle změřených. (komentář v souboru scénáře, řádky { "28" } až { "31" })

seg-8bfe258bedf5 = MODELLED: sedmiparametrové hodnoty jsou Cramerova–Raova mez pro zredukovanou množinu parametrů na skutečném plánu. Nikoli vyřešené datum, nikoli analýza LLR, nikoli geodetický produkt. (komentář v souboru scénáře, řádky { "33" } až { "34" })

seg-598a7d6ba1e7 = <s1>Předchozí</s1>lunar-joint-od-clock

seg-54b1c9200aae = <s1>Další</s1>lunar-station-coverage

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-3bc1761c76ab = Tento druh používají { "3" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-2053999af5ef = <s1>Další</s1>lunar-orbit-rendezvous
