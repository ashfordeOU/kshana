# docs--kind-hybrid: translations (cs)

seg-03442e4be82d = Datasheet Microchip SA65 / SA.45s CSAC sigma_y(1s)={ "3e-10" }

seg-f4cf8b629797 = Tematická stránka: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-f70076ea4a77 = <b>VALIDATED</b> Allanova / modifikovaná / Hadamardova odchylka + identifikace šumu s mocninným zákonem s intervaly spolehlivosti χ². Oracle (ExternalDataset): NIST SP { "1065" } (Riley) / referenční odchylky Stable32 na NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Růst chyby při dobíhání v uzavřeném tvaru + holdover do prahu; třídy kvantových hodin. Oracle (ReferenceImpl): Vícekroková rekurze kovariance clock_state (křížová kontrola ve stejné kódové základně); podkladové jádro rozptylu dobíhání a inverze holdoveru do prahu je externě ověřeno proti scipy (viz 'Clock-holdover coast-variance & threshold inversion'). Hodnoty holdoveru podle třídy při úrovni červeného šumu zůstávají MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3stavové (fáze / frekvence / drift) Kalmanovy hodiny van Loan, Joseph-stabilizované. Oracle (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), s F přes scipy.linalg.expm a Q přes blokovou matici Van Loan { "1978" } -- nezávislá referenční implementace reprodukující celou trajektorii filtru Kshany. Konzistence mezi implementacemi: fyzika hodin a kalibrace Allanovy odchylky nejsou ověřeny proti nezávislé vnější referenci, proto zůstává MODELLED. { "0.30" } vnější srovnání, zjištění (zůstává MODELLED): na hodinách IGS final { "30" } s z { "11" } GPS Blo

seg-e12f672ae71d = Holdover hodin při odepření GNSS je MODELLED, nikoli ověřen proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Odhad stavu palubních hodin je MODELLED, nikoli ověřen proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detekce spoofingu je MODELLED, nikoli ověřena proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-7b2721b7588d = Druh scénáře enginu v{ $version }, rodina <a1>Inerciální, fúzní a kvantové senzory</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-dba20bb12cda = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e0633b308e4e = <b>MODELLED</b> Jeden složený Kalmanův filtr nad polohou, rychlostí, fází hodin a frekvencí, krmený pseudovzdálenostmi, které svazují polohu a hodiny (aktualizace ve tvaru Joseph nesoucí křížovou kovarianci); 1-DOF varianta rozšířená o konstantní bias akcelerometru s Testy: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr s atomovým interferometrem se studenými atomy z prvních principů (k_eff·T², QPN). Oracle (ExternalDataset): Číselné vektory z primárních prací o CAI (Cheinet { "2008" }, přenosová funkce; Peters/Freier, citlivost): k_eff·T² přesně shodné, ASD výstřelového šumu jednostranné dno do ~{ "2" }× od každého zveřejněného přístroje (skutečná zařízení nesou technický šum nad kvantovým dnem). Rozmezí, nikoli shoda. { "0.30" } kolo { "2" } (předregistrováno fcb9ac64), zjištění (zůstává MODELLED): rotační šum jen od QPN proti naměřenému Gauguet et al.

seg-9955b1b1c018 = Výkon kvantových inerciálních senzorů je MODELLED, nikoli ověřen proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Odolnost kvantové inerciální dead-reckoning navigace je MODELLED, nikoli ověřena proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Stránka rodiny: <a1>Inerciální, fúzní a kvantové senzory</a1>

seg-d91dc5633e67 = Zdroj: <c1/>

seg-3b43d9c5624d = <c1/> (druh scénáře)

seg-22cd963c7042 = Hybridní vrcholový PNT: podpora hodinami + IMU + přenosem času.

seg-166be08d5276 = Jeden běh <c1/> se shrnuje takto: scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

seg-5a70fcb097dc = Volitelná pole: žádná

seg-f33278986879 = Příklad <c1/> mimo jiné nastavuje:

seg-7bebd09c614b = Křemenný akcelerometr navigační třídy (Honeywell QA-2000 / G

seg-4f5fd1bc8a4e = Hybridní kvantový akcelerometr Exail, trojice, stabilita biasu { "5.8" }

seg-49bff8dc860e = Křemenný akcelerometr navigační třídy (H

seg-52378a7b074c = Graf, který engine zapisuje pro scenarios/hybrid-pnt.toml, druh hybrid

seg-a1810bbca337 = <b>MODELLED</b> Obousměrný přenos/TWSTFT (Sagnac), společný pohled GNSS, PPP; jitter spoje→vzdálenost. Orákulum (ExternalDataset): Velikost Sagnacova jevu zkontrolována proti autoritativní PUBLIKOVANÉ HODNOTĚ — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), rov. { "1.29" }: obeplutí rovníku východním směrem nahromadí { "207.4" } ns (2ωA_E/c²); kshana reprodukuje { "207.386" } ns. Nezávisle potvrzeno RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), který nese stejnou geometrii 2Aω/c². Složený BIPM TWSTFT transponder/společný pohled/

seg-a8beb8dfc757 = Rozpočet chyb přenosu času je MODELLED, nikoli ověřen proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady modelované části, takže schopnost zůstává na úrovni vypočtené z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-a9c56fc9608a = Tematická stránka: <a1>MACHINE-INPUTS.md</a1>

seg-cc86939900fe = <s1>Předchozí</s1>hybrid-ukf

seg-53b95026bf54 = <s1>Další</s1>impairment-eval
