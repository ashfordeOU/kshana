# docs--kind-orbit: translations (cs)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Druh scénáře enginu v{ $version }, rodina <a1>Konstelace, pokrytí a geometrie</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-a4f1e7d2041e = Stránka rodiny: <a1>Konstelace, pokrytí a geometrie</a1>

seg-be831b52a339 = a { "4" } další v matici.

seg-a8d92406e428 = Strontium optical lattice clock, space-oriented goal sigma_y

seg-f70076ea4a77 = <b>VALIDATED</b> Allanova / modifikovaná / Hadamardova odchylka + identifikace šumu s mocninným zákonem s intervaly spolehlivosti χ². Oracle (ExternalDataset): NIST SP { "1065" } (Riley) / referenční odchylky Stable32 na NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Růst chyby při dobíhání v uzavřeném tvaru + holdover do prahu; třídy kvantových hodin. Oracle (ReferenceImpl): Vícekroková rekurze kovariance clock_state (křížová kontrola ve stejné kódové základně); podkladové jádro rozptylu dobíhání a inverze holdoveru do prahu je externě ověřeno proti scipy (viz 'Clock-holdover coast-variance & threshold inversion'). Hodnoty holdoveru podle třídy při úrovni červeného šumu zůstávají MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3stavové (fáze / frekvence / drift) Kalmanovy hodiny van Loan, Joseph-stabilizované. Oracle (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), s F přes scipy.linalg.expm a Q přes blokovou matici Van Loan { "1978" } -- nezávislá referenční implementace reprodukující celou trajektorii filtru Kshany. Konzistence mezi implementacemi: fyzika hodin a kalibrace Allanovy odchylky nejsou ověřeny proti nezávislé vnější referenci, proto zůstává MODELLED. { "0.30" } vnější srovnání, zjištění (zůstává MODELLED): na hodinách IGS final { "30" } s z { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Hodinami podpořené χ², RAIM, AGC, SQM slučované do bezpečnostního FoM pro každou epochu. Oracle (ExternalDataset): parametry scénářů TEXBAT (Humphreys { "2012" }) -- charakterizace, nikoli připnuté vektory. { "0.30" } vnější srovnání, zjištění (zůstává MODELLED): na JammerTest { "2024" } (Bleik; data GPL-3.0) monitory na úrovni pozorování (chí-kvadrát podpořený hodinami, RAIM, selhání řešení) nevyvolaly žádný alarm do { "10" } s od žádného z { "8" } vyhodnotitelných zveřejněných nástupů spoofingu (kde bylo okno před nástupem čisté, první alarm přišel { "10.2" } až { "39" } s po pu

seg-e12f672ae71d = Holdover hodin při odepření GNSS je MODELLED, nikoli ověřen proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Odhad stavu palubních hodin je MODELLED, nikoli ověřen proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detekce spoofingu je MODELLED, nikoli ověřena proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-d291f20074f0 = <b>VALIDATED</b> Rotace Země ze dvoudílného juliánského data UT1 na dráhové větvi, takže poloha v zemské soustavě zachová mikrosekundu, kterou jednoduché datum f64 ztrácí (asi { "3e-9" } rad v okolí { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, konvence TEME, na dvou dílech), cio:

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP z geometrie přímé viditelnosti přes Q=(HᵀH)⁻¹ s lokálním rozkladem ENU. Orákulum (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — nezávislá knihovna, shoda na { "1e-6" } relativně

seg-53a78e98af12 = Tematická stránka: <a1>SKYLINE.md</a1>

seg-ae15d15bf151 = Tematická stránka: <a1>LEO-PASS.md</a1>

seg-99a3c57c7926 = { "7" } přibalených scénářů používá tento druh; ostatní jsou v <a1><c1/></a1>.
