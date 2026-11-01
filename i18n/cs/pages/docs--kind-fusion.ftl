# docs--kind-fusion: translations (cs)

seg-03442e4be82d = Datasheet Microchip SA65 / SA.45s CSAC sigma_y(1s)={ "3e-10" }

seg-51362910dcb7 = Tento druh používají { "2" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-f4cf8b629797 = Tematická stránka: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-be831b52a339 = a { "4" } další v matici.

seg-f70076ea4a77 = <b>VALIDATED</b> Allanova / modifikovaná / Hadamardova odchylka + identifikace šumu s mocninným zákonem s intervaly spolehlivosti χ². Oracle (ExternalDataset): NIST SP { "1065" } (Riley) / referenční odchylky Stable32 na NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Růst chyby při dobíhání v uzavřeném tvaru + holdover do prahu; třídy kvantových hodin. Oracle (ReferenceImpl): Vícekroková rekurze kovariance clock_state (křížová kontrola ve stejné kódové základně); podkladové jádro rozptylu dobíhání a inverze holdoveru do prahu je externě ověřeno proti scipy (viz 'Clock-holdover coast-variance & threshold inversion'). Hodnoty holdoveru podle třídy při úrovni červeného šumu zůstávají MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3stavové (fáze / frekvence / drift) Kalmanovy hodiny van Loan, Joseph-stabilizované. Oracle (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), s F přes scipy.linalg.expm a Q přes blokovou matici Van Loan { "1978" } -- nezávislá referenční implementace reprodukující celou trajektorii filtru Kshany. Konzistence mezi implementacemi: fyzika hodin a kalibrace Allanovy odchylky nejsou ověřeny proti nezávislé vnější referenci, proto zůstává MODELLED. { "0.30" } vnější srovnání, zjištění (zůstává MODELLED): na hodinách IGS final { "30" } s z { "11" } GPS Blo

seg-e12f672ae71d = Holdover hodin při odepření GNSS je MODELLED, nikoli ověřen proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Odhad stavu palubních hodin je MODELLED, nikoli ověřen proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detekce spoofingu je MODELLED, nikoli ověřena proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-4de09fe367df = Zdroj: <c1/>

seg-53e498cffeba = <c1/> (druh scénáře)

seg-7b2721b7588d = Druh scénáře enginu v{ $version }, rodina <a1>Inerciální, fúzní a kvantové senzory</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-ec26df467b88 = Společná Kalmanova fúze senzorů PNT nad týmiž hybridními vstupy.

seg-25708bf88728 = Jeden běh <c1/> se shrnuje takto: scénář c8eac911bbe0 | sloučeno | kvantový PNT-holdover 6600s (t 6600s/p 6600s) integrita { "1.000" } zabezpečení n/a (žádný útok) | klasický PNT-holdover 1330s (t 1330s/p 6600s) integrita { "0.973" } zabezpečení n/a (žádný útok)

seg-dba20bb12cda = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3d5cae65f093 = Volitelná pole: <c1/>

seg-56bca36cabba = Příklad <c1/> mimo jiné nastavuje:

seg-195347c63a8a = m/s^{ "2" }

seg-5d3f15c0688a = Křemenný akcelerometr navigační třídy; ilustrativní šum-dr

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-6ddd8a067e26 = Akcelerometr se studenými atomy, nízká náhodná procházka rychlosti při dlouhém tau;

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e79eecc14bea = Křemenný akcelerometr navigační třídy; i

seg-c8a1c797f4b1 = Graf, který engine zapisuje pro scenarios/fusion-pnt.toml, druh fusion

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-46c0903ff7b5 = <b>VALIDATED</b> Obnova stavu epochy [r,v] z vzdáleností od pozemních stanic dávkovým diferenciálním korektorem Gauss–Newton a sekvenčním filtrem nad dvoutělesovým silovým modelem + J2 Testy: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

seg-44f77aaf9d7e = <b>MODELLED</b> EKF stavu chyb nad { "15" } stavy INS, dvoustavovými hodinami přijímače a jednou reálnou nejednoznačností nosné na sledovanou družici; pseudovzdálenost, fáze nosné a volitelně rychlost změny vzdálenosti z konstelace Walker SGP4 (světelný čas a Sagnac), Klobuchar an Testy: <a1>fusion_carrier_tc.rs</a1>.

seg-509f93c7e9ce = <b>MODELLED</b> Tři scénáře gnss-ins na knihovně trajektorií (plavidlo kličkující rychlostí { "8" } m/s s pětiminutovým výpadkem; vlak průjezdem zářezem se dvěma družicemi a tunelem; letadlo, jehož výpadek pokrývá zatáčku s náklonem 25 stupňů) a volitelný Testy: <a1>gnss_ins_packs.rs</a1>.

seg-e0633b308e4e = <b>MODELLED</b> Jeden složený Kalmanův filtr nad polohou, rychlostí, fází hodin a frekvencí, krmený pseudovzdálenostmi, které svazují polohu a hodiny (aktualizace ve tvaru Joseph nesoucí křížovou kovarianci); 1-DOF varianta rozšířená o konstantní bias akcelerometru s Testy: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr s atomovým interferometrem se studenými atomy z prvních principů (k_eff·T², QPN). Oracle (ExternalDataset): Číselné vektory z primárních prací o CAI (Cheinet { "2008" }, přenosová funkce; Peters/Freier, citlivost): k_eff·T² přesně shodné, ASD výstřelového šumu jednostranné dno do ~{ "2" }× od každého zveřejněného přístroje (skutečná zařízení nesou technický šum nad kvantovým dnem). Rozmezí, nikoli shoda. { "0.30" } kolo { "2" } (předregistrováno fcb9ac64), zjištění (zůstává MODELLED): rotační šum jen od QPN proti naměřenému Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Složený rozpočet polohy z biasu + faktoru měřítka + VRW + poklesu stability během holdoveru. Oracle (ReferenceImpl): Nezávislá integrace SDE metodou Monte Carlo v numpy dvojitě integrovaného šumu bílého zrychlení (ověřuje analytický rozptyl VRW skutečně nezávislým algoritmem) + zveřejněná hodnota z Groves { "2013" } jako kotva pro členy biasu a faktoru měřítka; čísla zařízení CAI vyčíslují hardware partnera a zůstávají MODELLED

seg-9955b1b1c018 = Výkon kvantových inerciálních senzorů je MODELLED, nikoli ověřen proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Odolnost kvantové inerciální dead-reckoning navigace je MODELLED, nikoli ověřena proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Stránka rodiny: <a1>Inerciální, fúzní a kvantové senzory</a1>

seg-a849735fcc6e = Tematická stránka: <a1>LEO-PNT-FUSION.md</a1>

seg-c894aa7d9585 = <s1>Předchozí</s1>ephemeris

seg-d14a7850df1c = <s1>Další</s1>gnss-ins
