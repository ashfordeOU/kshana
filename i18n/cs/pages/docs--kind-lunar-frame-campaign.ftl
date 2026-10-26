# docs--kind-lunar-frame-campaign: translations (cs)

seg-dd57b833cb20 = Zdroj: <c1/>

seg-120769aba2cc = <c1/> (druh scénáře)

seg-55679aff66db = Sedmiparametrový Helmertův (podobnostní) datum rámce řízený SIMULOVANOU POZOROVACÍ KAMPANÍ, nikoli vloženou transformací. Síť pozemních stanic pozoruje katalog lunárních povrchových majáků podle explicitního plánu; parciální derivace zpoždění lunárního VLBI jsou za tento plán akumulovány do Fisherovy informační matice souřadnic majáků přesně tak, jako to dělá lunar-vlbi-fim; a tato informace je přes Helmertovu návrhovou matici A = [I3 | [p]_x | p] v bodech katalogu propagována do kovariance datumu H = A^T M_b A, diagnostikované pomocí crate::fim::crlb. ŽÁDNÁ transformace není vložena a nic se neobnovuje ze zasazené odpovědi, takže uváděná přesnost datumu vychází z pozorovacího programu: poloviční sigma zpoždění ji přesně zpolovičí a prodloužení oblouku ji zlepšuje, protože librace, kterou zpráva MĚŘÍ (sub_earth_direction_sweep_deg), odděluje souřadnici majáku ve směru přímé viditelnosti od souřadnic v rovině oblohy. Hodnost, defekt datumu, číslo podmíněnosti, celé spektrum, nepozorovatelné směry V SEDMIPARAMETROVÉ BÁZI, nejslabší směr i při plné hodnosti a podíl každého parametru na něm se vydávají při každém běhu; parametr, který kampaň neomezuje, se publikuje jako NULL se stavem, nikdy se nevyčte z téměř singulární inverze. Korelace chyb majáků je měřena, nepředpokládána: při pevných stanicích se žádné pozorování nedotýká dvou majáků, takže informační matice je přesně blokově diagonální (offblock_fraction { "0" }), a při odhadovaných stanicích je Schurem marginalizovaný blok svázán, přičemž se vypíše indukovaná korelace a celá propagace se znovu spustí s jejím vypuštěním, takže cena předpokladu nezávislosti je číslo. Stejná propagace při izotropní sigma na souřadnici a chyba obnovy, kterou uvádí scénář lunar-frame-realisation, se zde obě spouštějí a vypisují vedle hodnoty kampaně i s jejich poměry. MODELLED: katalog majáků je ze zdrojů, ale KAMPAŇ je simulovaná — síť stanic a sigma zpoždění jsou ilustrativní vstupy, jednotlivá pozorování zpoždění se pokládají za nezávislá a efemeridy středu Měsíce, hodiny stanic, troposféra a parametry orientace Země jsou drženy PEVNĚ, takže kovariance datumu je Cramerova–Raova mez pro zredukovanou množinu parametrů. Nejde o geodetický produkt.

seg-2e02c1ff8f48 = Jeden běh <c1/> se shrne takto: lunar-frame-campaign | { "4" } majáky x { "3" } základny x { "49" } epoch = { "64" } obs (sigma zpoždění { "1.000e-11" } s) | datum stanic pevné | Helmert hodnost 7/7 cond { "3.798e5" } | sigma translace datumu { "6.397500" } m oproti chybě obnovy vložené transformace { "0.3125" } m (poměr { "0.049" })

seg-9c5feacf15ce = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

seg-1d70a5b4a197 = Příklad <c1/> mimo jiné nastavuje:

seg-df90e5910fb4 = hod

seg-d9523213de9f = Popisek výsledku (od enginu): MODELLED datum lunárního rámce řízené kampaní. Sedmiparametrová Helmertova kovariance je propagována z informační matice souřadnic majáků akumulované z vlastních parciálních derivací zpoždění lunárního VLBI v enginu přes explicitní plán majáků, základen a epoch; ŽÁDNÁ podobnostní transformace není vložena a

seg-883d94b321b4 = Graf, který engine zapisuje pro scenarios/lunar-frame-campaign.toml, druh lunar-frame-campaign

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-2595bd629ffb = <b>MODELLED</b> Sedmiparametrový Helmertův datum propagovaný ze SIMULOVANÉ POZOROVACÍ KAMPANĚ místo obnovy z vložené transformace.

seg-fd34d760edb1 = <b>VALIDATED</b> Kovariance sedmiparametrového Helmertova datumu, jejíž dva simulované vstupy jsou nahrazeny naměřenými: plán tvoří epochy pozemního vysílání { "337" } archivovaných normálních bodů lunárního laserového měření vzdálenosti ILRS (2015-04-08 až 2015-06-27, Grasse MeO { "7" } Testy: <a1>lunar_llr_real_data.rs</a1>.

seg-055864084843 = <b>MODELLED</b> Volitelné vstupy extra_reflectors a extra_beacons ve scénáři lunar-llr-datum přidávají blok station_geodesy: Helmertovu informaci z pětipolového archivovaného řezu lunárního laserového měření vzdálenosti plus informaci, kterou přidává přidaný retroreflektor (ran Testy: <a1>lunar_station_geodesy.rs</a1>.

seg-23bd763c32d8 = <b>VALIDATED</b> Kovariance sedmiparametrového Helmertova datumu scénáře lunar-frame-campaign s odhadovanými pozemními stanicemi (stanice { "1" } ukotvena), jak ji lunar_frame_campaign počítá v binary64: společná Fisherova informace stanic a majáků akum Testy: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

seg-49f323360dc3 = <b>VALIDATED</b> Fit 7parametrového Helmertova datumu + vazba orientace ICRF ze sítě bodů. Orákulum (ExternalDataset): Nezávislý řešič podobnostní transformace váženou metodou Umeyama (Horn) v uzavřeném tvaru (založený na SVD v numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — jiný algoritmus než iterativní Gaussův–Newtonův fit v kshana, který dosahuje téhož jednoznačně definovaného optima vážených nejmenších čtverců na bajtově shodných sítích bodů

seg-d024abcfd87c = <b>MODELLED</b> Sedmiparametrový Helmertův datum propagovaný ze SIMULOVANÉ POZOROVACÍ KAMPANĚ místo obnovy z vložené transformace. Pozemní stanice pozorují zdroj. Orákulum (ReferenceImpl): Identity v uzavřeném tvaru a nezávislá cesta v repozitáři, bez uplatňovaného vnějšího orákula. Helmertova návrhová matice — jediná nová derivace v modulu — je odvozena znovu centrální konečnou diferencí lunar_frame_realise::apply_helmert, cestou, která s analytickým tvarem nesdílí žádný výraz. Akumulace, kterou skládá, je z lunar-vlbi-fim, jejíž Jacobián je tam konečnou diferencí porovnán s lunar_vlbi::vlbi_delay_s, a kte

seg-0abd7b181f21 = MODELLED datum lunárního rámce řízené kampaní. Sedmiparametrová Helmertova kovariance je propagována z informační matice souřadnic majáků akumulované z vlastních parciálních derivací zpoždění lunárního VLBI v enginu přes explicitní plán majáků, základen a epoch; ŽÁDNÁ podobnostní transformace není vložena a nic se neobnovuje ze zasazené odpovědi. Katalog majáků je tabulka pojmenovaných míst s uvedeným zdrojem v balíku, ale KAMPA (výsledek <c1/>)

seg-f92d22c06cd5 = Korelace chyb majáků je měřena, nepředpokládána: při pevných stanicích se žádné pozorování nedotýká dvou majáků, takže informační matice je přesně blokově diagonální (offblock_fraction { "0" }), a při odhadovaných stanicích je Schurem marginalizovaný blok svázán, přičemž se vypíše indukovaná korelace a celá propagace se znovu spustí s jejím vypuštěním, takže cena předpokladu nezávislosti je číslo. (katalog druhů (<c1/>))

seg-534cea416496 = MODELLED: katalog majáků je ze zdrojů, ale KAMPAŇ je simulovaná — síť stanic a sigma zpoždění jsou ilustrativní vstupy, jednotlivá pozorování zpoždění se pokládají za nezávislá a efemeridy středu Měsíce, hodiny stanic, troposféra a parametry orientace Země jsou drženy PEVNĚ, takže kovariance datumu je Cramerova–Raova mez pro zredukovanou množinu parametrů. (katalog druhů (<c1/>))

seg-ec67b9d3adbb = Korelace chyb majáků je MĚŘENA, nepředpokládána. Při pevných stanicích se žádné pozorování nedotýká dvou majáků, takže informační matice je přesně blokově diagonální (offblock_fraction { "0" }); při odhadovaných stanicích je Schurem marginalizovaný blok svázán, indukovaná korelace se vypíše a celá propagace se znovu spustí s jejím vypuštěním, takže cena předpokladu nezávislosti je číslo, nikoli c (komentář v souboru scénáře, řádky { "17" } až { "21" })

seg-a2bb557da7ba = MODELLED: katalog majáků je ze zdrojů, ale KAMPAŇ je simulovaná — síť stanic a sigma zpoždění jsou ilustrativní vstupy, jednotlivá pozorování zpoždění se pokládají za nezávislá a efemeridy středu Měsíce, hodiny stanic, troposféra a parametry orientace Země jsou drženy PEVNĚ. Nejde o geodetický produkt. (komentář v souboru scénáře, řádky { "27" } až { "30" })

seg-57a371bca2c7 = Datum lunárního rámce z pozorovací kampaně je MODELLED, nikoli ověřené: je kontrolováno proti samostatné implementaci ve stejné kódové základně — nezávislé na testované jednotce, ale není externě autoritativní. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-7b56c979b2c9 = <s1>Předchozí</s1>lunar-differential-pnt

seg-70072dbfa305 = <s1>Další</s1>lunar-frame-realisation
