# docs--kind-ephemeris: translations (cs)

seg-37d29d8303fe = km

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-c33e3cbba749 = arcsec

seg-11e8c29ecb45 = Druh scénáře enginu v{ $version }, rodina <a1>Konstelace, pokrytí a geometrie</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-a4f1e7d2041e = Stránka rodiny: <a1>Konstelace, pokrytí a geometrie</a1>

seg-670191cf797f = Tematická stránka: <a1>SOLAR-SYSTEM.md</a1>

seg-a3697ad561db = Hz

seg-e388fdc74ffa = Zdroj: <c1/>

seg-9860cb88c021 = <c1/> (druh scénáře)

seg-24266bc264df = Efemeridy a pozemní stopa: propagace jedné družice (TLE→SGP4 nebo analytická dráha) a výstup jejího stavu TEME/GCRS (poloha + rychlost), polohy ITRF/ECEF, podsatelitní zeměpisné šířky/délky/výšky WGS-84 a pro každý krok azimutu/elevace/vzdálenosti stanice + rychlosti změny vzdálenosti (Doppler). Družice pochází z <c1/> nebo z analytické <c2/> s jejím <c3/> (<c4/> má přednost, jsou-li zadány obě); s <c5/> přepíše <c6/> vlastní epochu TLE jako t = { "0" }.

seg-02f2745e0550 = Jeden běh <c1/> se shrnuje takto: scénář 0d4dd01b3160 | sgp4 (TLE) | { "559" } vzorků | výška { "419" }–{ "434" } km | |šířka| ≤ { "51.8" }° | rychlost { "7653" }–{ "7661" } m/s | max. elevace { "25.7" }° špičkový Doppler { "34.3" } kHz

seg-2ce1ab71e2cc = Povinná pole: <c1/>

seg-21dc45b3de59 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-cda81cdb3607 = Příklad <c1/> mimo jiné nastavuje:

seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

seg-4d208b6c0eb8 = den

seg-0fd3c58fde09 = Graf, který engine zapisuje pro scenarios/ephemeris.toml, druh ephemeris

seg-d291f20074f0 = <b>VALIDATED</b> Rotace Země ze dvoudílného juliánského data UT1 na dráhové větvi, takže poloha v zemské soustavě zachová mikrosekundu, kterou jednoduché datum f64 ztrácí (asi { "3e-9" } rad v okolí { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, konvence TEME, na dvou dílech), cio:

seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell 6-DOF + poruchy, dávkové/sekvenční OD. Oracle (ExternalDataset): verifikační vektory SGP4 podle AIAA 2006-6753

seg-7cf505668c3c = <b>VALIDATED</b> Precese-nutace IAU 2006/2000A, CIO GCRS↔ITRS, časové stupnice s přestupnými sekundami. Oracle (ExternalDataset): referenční vektory IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-f19ce44dc0c0 = Tematická stránka: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

seg-a8ea4ba6e244 = <s1>Předchozí</s1>eo-radiometry

seg-971864553611 = <s1>Další</s1>fusion
