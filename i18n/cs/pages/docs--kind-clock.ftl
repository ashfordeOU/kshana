# docs--kind-clock: translations (cs)

seg-debc2f07db78 = true

seg-33555d61ddc6 = Zdroj: <c1/>

seg-618393657d01 = <c1/> (druh scénáře)

seg-c61e88721556 = Druh scénáře enginu v{ $version }, rodina <a1>Hodiny, časování a holdover</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-78cba87823f7 = Holdover hodin oproti specifikaci; volitelný soubor Monte Carlo (runs > { "1" }).

seg-dd2ad570a6c9 = Jeden běh <c1/> se shrnuje takto: scénář 91d2b6d10d14 | { "200" } běhů | kvantový holdover 6600s [6600-6600] p95 8.78e-4ns zabezpečení n/a (žádný útok) | klasický holdover 844s [220-2130] p95 167.0ns zabezpečení n/a (žádný útok)

seg-51820163de28 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-80fe14eb5e79 = Volitelná pole: <c1/>, <c2/>

seg-807e7c5a2565 = Příklad <c1/> mimo jiné nastavuje:

seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC, datový list sigma_y(1s)={ "3e-10" }; q_

seg-a8d92406e428 = Strontium optical lattice clock, space-oriented goal sigma_y

seg-0cd8dc81045c = Tento druh používají { "4" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-cb0b7da83f5c = Graf, který engine zapisuje pro scenarios/clock-ensemble.toml, druh clock

seg-5b3dbe0aed82 = <b>MODELLED</b> Volitelný oddíl [integrity] druhu clock (clock_integrity::run): z uvedeného stanoviště a předvoleb konstelace (geometry::sky_geometry) v každé epoše integrity, dokud časová osa GNSS není odepřena, snapshot RAIM (raim::snapshot_ Testy: <a1>clock_integrity.rs</a1>.

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: jedna vrstva parseru, která převádí soubor hodin RINEX (záznamy AS/AR jedněch pojmenovaných hodin, verze { "2" } a { "3.00" } až { "3.04" }), ASCII záznam fáze nebo frekvence ve stylu TimeLab nebo záznam časových značek či intervalů TAPR TICC na jednotnou pha Testy: <a1>clock_log_allantools.rs</a1>.

seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input s formáty ptp4l, phc2sys, ts2phc, chrony-tracking a chrony-statistics: zaznamenaný offset řádku servo linuxptp (ns, vlastní závorková časová značka řádku, odečty před prvním hlášením s2 servem vynechány a

seg-f70076ea4a77 = <b>VALIDATED</b> Allanova / modifikovaná / Hadamardova odchylka + identifikace šumu s mocninným zákonem s intervaly spolehlivosti χ². Oracle (ExternalDataset): NIST SP { "1065" } (Riley) / referenční odchylky Stable32 na NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Růst chyby při dobíhání v uzavřeném tvaru + holdover do prahu; třídy kvantových hodin. Oracle (ReferenceImpl): Vícekroková rekurze kovariance clock_state (křížová kontrola ve stejné kódové základně); podkladové jádro rozptylu dobíhání a inverze holdoveru do prahu je externě ověřeno proti scipy (viz 'Clock-holdover coast-variance & threshold inversion'). Hodnoty holdoveru podle třídy při úrovni červeného šumu zůstávají MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3stavové (fáze / frekvence / drift) Kalmanovy hodiny van Loan, Joseph-stabilizované. Oracle (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), s F přes scipy.linalg.expm a Q přes blokovou matici Van Loan { "1978" } -- nezávislá referenční implementace reprodukující celou trajektorii filtru Kshany. Konzistence mezi implementacemi: fyzika hodin a kalibrace Allanovy odchylky nejsou ověřeny proti nezávislé vnější referenci, proto zůstává MODELLED. { "0.30" } vnější srovnání, zjištění (zůstává MODELLED): na hodinách IGS final { "30" } s z { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Hodinami podpořené χ², RAIM, AGC, SQM slučované do bezpečnostního FoM pro každou epochu. Oracle (ExternalDataset): parametry scénářů TEXBAT (Humphreys { "2012" }) -- charakterizace, nikoli připnuté vektory. { "0.30" } vnější srovnání, zjištění (zůstává MODELLED): na JammerTest { "2024" } (Bleik; data GPL-3.0) monitory na úrovni pozorování (chí-kvadrát podpořený hodinami, RAIM, selhání řešení) nevyvolaly žádný alarm do { "10" } s od žádného z { "8" } vyhodnotitelných zveřejněných nástupů spoofingu (kde bylo okno před nástupem čisté, první alarm přišel { "10.2" } až { "39" } s po pu

seg-e12f672ae71d = Holdover hodin při odepření GNSS je MODELLED, nikoli ověřen proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Odhad stavu palubních hodin je MODELLED, nikoli ověřen proti nezávislé vnější referenci: kontroluje se proti samostatné implementaci v téže kódové základně, nezávislé na testované jednotce, ale není vnějším autoritativním zdrojem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detekce spoofingu je MODELLED, nikoli ověřena proti nezávislé vnější referenci: dílčí tvrzení je zkontrolováno externě, ale celá schopnost skládá dohromady části vypočtené z modelu, takže schopnost zůstává vypočtena z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Stránka rodiny: <a1>Hodiny, časování a holdover</a1>

seg-ee7dd15019d0 = Tematická stránka: <a1>CAMPAIGNS.md</a1>

seg-46ed0b786244 = Tematická stránka: <a1>RECEIVER-TRUST.md</a1>

seg-e06f9a5a0291 = <s1>Předchozí</s1>cislunar-observability

seg-aba9395185fa = <s1>Další</s1>combined-altpnt
