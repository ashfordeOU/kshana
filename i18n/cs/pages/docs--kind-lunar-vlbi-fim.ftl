# docs--kind-lunar-vlbi-fim: translations (cs)

seg-b054c73f22e5 = žádná hodnota

seg-2595bd629ffb = <b>MODELLED</b> Sedmiparametrový Helmertův datum propagovaný ze SIMULOVANÉ POZOROVACÍ KAMPANĚ místo obnovy z vložené transformace.

seg-7ecec8d27f50 = Zdroj: <c1/>

seg-d54e29b7bc80 = <c1/> (druh scénáře)

seg-1bc37634ba9f = Kovariance souřadnic stanic lunárního VLBI: parciální derivace zpoždění pozorovatelné lunar-vlbi akumulované přes explicitní PLÁN (základny x epochy) do Fisherovy informační matice, invertované a uváděné jako kovariance souřadnic stanic a sigma stanice pro každou souřadnici — vypočtený výstup enginu, nikoli skalární preciznost zpoždění protlačená předpokládaným izotropním faktorem ekvipartice g = { "3" }. Stav nese souřadnice stanic vázané na Zemi (ITRS), takže Jacobián je inerciální parciální derivace otočená maticí GCRS->ITRS každé epochy: rotace Země je to, co činí tyto souřadnice pozorovatelnými, a zpráva MĚŘÍ zametení přímé viditelnosti vázané na Zemi a deklinaci majáku, místo aby je předpokládala. Jedno pozorování je jedna dvojice (základna, epocha), kdy OBĚ stanice jsou nad elevační maskou, s váhou 1/delay_sigma_s^{ "2" }. Při každém běhu uvádí hodnost, defekt datumu, číslo podmíněnosti, celé informační spektrum, kovarianční matici, sigma stanic po osách i 3D a nulový prostor volné sítě; při nedostatečné hodnosti se hlavní sigma publikuje jako NULL se stavem, nikdy se nevyčte z téměř singulární inverze. Hodnota ekvipartice c<em>delay_sigma_s</em>sqrt(g/N) pro TENTÝŽ plán se vydává vedle vypočtené hodnoty s poměrem, spolu s izotropní stopovou mezí sqrt(p/trace(M)), kterou AM-HM činí pevnou podlahou — takže poměr je anizotropie, kterou předpoklad zahodil. Uzávěr zpoždění tau_ik = tau_ij + tau_jk činí geometricky nezávislými jen n-1 z n(n-1)/2 základen; zpráva uvádí oba počty. MODELLED: efemeridy středu Měsíce, hodiny stanic, troposféra a parametry orientace Země jsou drženy PEVNĚ a pozorování se pokládají za nezávislá, takže kovariance je Cramerova–Raova mez pro zredukovanou množinu parametrů, nikoli předpovězený výsledek relace; sigma zpoždění, souřadnice stanic a plán jsou vstupy. Parciální derivace, kterou Jacobián geometrického zpoždění vynechává (diferencovaný Shapirův člen), je měřena konečnou diferencí a vydávána. Nejde o geodetický produkt.

seg-4df72c1b921e = Jeden běh <c1/> se shrne takto: lunar-vlbi-fim | { "3" } stanice / { "3" } základny x { "49" } epoch = { "16" } obs (maska { "10.0" } deg) | datum anchor-first-station | hodnost 6/6 cond { "2.209e4" } | sigma stanice { "0.0926" } m oproti ekvipartici g={ "3" } { "0.0013" } m (poměr { "71.360" })

seg-f0dabe1b061b = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-fabf305ae1de = Příklad <c1/> mimo jiné nastavuje:

seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

seg-8b098bf1df6b = Popisek výsledku (od enginu): MODELLED kovariance souřadnic stanic lunárního VLBI. Kovariance je akumulována z vlastních analytických parciálních derivací zpoždění enginu přes explicitní plán základen a epoch a invertována; NENÍ převedena ze skalární preciznosti zpoždění předpokládaným geometrickým faktorem. Sigma zpoždění na pozorování

seg-19c383444296 = Graf, který engine zapisuje pro scenarios/lunar-vlbi-fim.toml, druh lunar-vlbi-fim

seg-d1a6a5086102 = <b>VALIDATED</b> Parciální derivace zpoždění akumulované přes plán základen × epoch do Fisherovy informační matice, invertované na kovarianci souřadnic stanic a sigma stanice pro každou souřadnici, čímž se nahrazuje předpokládaná izotropní vazba ekvipartice z

seg-55ce02ad5dd5 = <b>MODELLED</b> Třetí volba datumu, <c1/>, která drží každou pozemní stanici a odhaduje samotné souřadnice MAJÁKU vázané na těleso Měsíce — konfigurace, pro kterou se nejistota lunárního povrchového bodu skutečně uvádí, protože souřadnice pozemních stanic

seg-811a412b40b6 = <b>VALIDATED</b> Kovariance majáku ve scénáři lunar-vlbi-fim se všemi pevnými stanicemi (každá pozemní stanice držena, souřadnice majáku vázané na těleso Měsíce odhadovány samostatně) s majákem umístěným na Měsíci JPL DE440 čteném vlastním čtečem jader enginu

seg-a731b913bdf0 = <b>VALIDATED</b> Parciální derivace zpoždění akumulované přes plán základen × epoch do Fisherovy informační matice, invertované na kovarianci souřadnic stanic a sigma stanice pro každou so. Orákulum (ExternalDataset): Nezávislá cesta v repozitáři. Každý řádek Jacobiánu je odvozen znovu centrální konečnou diferencí lunar_vlbi::vlbi_delay_s vyhodnocené z vlastních souřadnic stavu vázaných na Zemi a na těleso Měsíce otočených dopředu přes řetězec rámců — cestou, která nepočítá žádnou derivaci a nesdílí žádný výraz s analytickými parciálními derivacemi — a informační matice, které obě cesty sestaví, se shodují na < { "1e-6" } největšího diagonálního prvku. Ty

seg-2300ffd9fc4e = <b>MODELLED</b> Třetí volba datumu, <c1/>, která drží každou pozemní stanici a odhaduje samotné souřadnice MAJÁKU vázané na těleso Měsíce — konfigurace, pro kterou se lu. Orákulum (ReferenceImpl): Identity v uzavřeném tvaru, bez uplatňovaného či dostupného vnějšího orákula. Rameno páky je kontrolováno proti ρ/B a obě formy ekvipartice proti sobě na { "1e-15" } — algebraické identity, takže zachytí chybné zapojení a nic jiného, a jsou tak označeny. Podstatný výsledek je MĚŘEN, nikoli tvrzen: zpoždění z pevné základny omezuje SMĚR majáku, takže složka přímé viditelnosti rea

seg-2cbf700a234e = MODELLED kovariance souřadnic stanic lunárního VLBI. Kovariance je akumulována z vlastních analytických parciálních derivací zpoždění enginu přes explicitní plán základen a epoch a invertována; NENÍ převedena ze skalární preciznosti zpoždění předpokládaným geometrickým faktorem. Sigma zpoždění na pozorování, souřadnice stanic, místo majáku a plán jsou vstupy. Efemeridy středu Měsíce, hodiny stanic (výsledek <c1/>)

seg-8f63c3e774e2 = Kovariance souřadnic stanic lunárního VLBI: parciální derivace zpoždění pozorovatelné lunar-vlbi akumulované přes explicitní PLÁN (základny x epochy) do Fisherovy informační matice, invertované a uváděné jako kovariance souřadnic stanic a sigma stanice pro každou souřadnici — vypočtený výstup enginu, nikoli skalární preciznost zpoždění protlačená předpokládaným izotropním faktorem ekvipartice g = { "3" }. (katalog druhů (<c1/>))

seg-d09b166842d5 = Stav nese souřadnice stanic vázané na Zemi (ITRS), takže Jacobián je inerciální parciální derivace otočená maticí GCRS->ITRS každé epochy: rotace Země je to, co činí tyto souřadnice pozorovatelnými, a zpráva MĚŘÍ zametení přímé viditelnosti vázané na Zemi a deklinaci majáku, místo aby je předpokládala. (katalog druhů (<c1/>))

seg-bb7ff1e5d99f = Hodnota ekvipartice c<em>delay_sigma_s</em>sqrt(g/N) pro TENTÝŽ plán se vydává vedle vypočtené hodnoty s poměrem, spolu s izotropní stopovou mezí sqrt(p/trace(M)), kterou AM-HM činí pevnou podlahou — takže poměr je anizotropie, kterou předpoklad zahodil. (katalog druhů (<c1/>))

seg-0ed4495d4488 = MODELLED: efemeridy středu Měsíce, hodiny stanic, troposféra a parametry orientace Země jsou drženy PEVNĚ a pozorování se pokládají za nezávislá, takže kovariance je Cramerova–Raova mez pro zredukovanou množinu parametrů, nikoli předpovězený výsledek relace; sigma zpoždění, souřadnice stanic a plán jsou vstupy. (katalog druhů (<c1/>))

seg-4df6e3981cc4 = Publikovaný řetězec D3 jde od preciznosti zpoždění na pozorování k nejistotě souřadnic stanice přes předpokládaný IZOTROPNÍ faktor ekvipartice g = { "3" }. Tento krok je ten, který abstrakt samotného článku označuje za modelovaný, nikoli měřený. Tento scénář jej odstraňuje: parciální derivace zpoždění lunárního VLBI se akumulují přes skutečný plán dvojic (základna x epocha) do Fisherovy informační matice, invertují se a uvádějí jako (komentář v souboru scénáře, řádky { "3" } až { "8" })

seg-489b93ca0f7f = Stav nese souřadnice vázané na Zemi (ITRS), takže Jacobián je inerciální parciální derivace otočená maticí GCRS->ITRS každé epochy: rotace Země je to, co činí tyto souřadnice vůbec pozorovatelnými, a zpráva MĚŘÍ zametení přímé viditelnosti vázané na Zemi a deklinaci majáku, místo aby je předpokládala. Jedno pozorování je jedna dvojice (základna, epocha), kdy OBĚ stanice jsou nad elevační maskou, s váhou 1/delay (komentář v souboru scénáře, řádky { "10" } až { "14" })

seg-efb5719364af = Co číst ve zprávě * sigma stanic po osách i 3D — vypočtená odpověď; * hodnota ekvipartice c<em>delay_sigma_s</em>sqrt(g/N) pro TENTÝŽ plán, vytištěná vedle ní s poměrem. Ten poměr JE anizotropie, kterou předpoklad zahodil, a izotropní stopová mez sqrt(p/trace(M)) činí AM-HM pevnou podlahou, takže předpoklad může hodnotu jedině podhodnotit; * hodnost, defekt datumu, číslo podmíněnosti, celé sp (komentář v souboru scénáře, řádky { "16" } až { "26" })

seg-96c1a129aeae = <s1>Předchozí</s1>lunar-time-offset

seg-199d98630271 = <s1>Další</s1>lunar-vlbi
