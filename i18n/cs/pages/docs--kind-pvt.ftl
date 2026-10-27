# docs--kind-pvt: translations (cs)

seg-debc2f07db78 = true

seg-8e845ce908ee = Druh scénáře enginu v{ $version }, rodina <a1>Měření GNSS, určování polohy a integrita</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-f6b7ca020692 = Stránka rodiny: <a1>Měření GNSS, určování polohy a integrita</a1>

seg-f4cf8b629797 = Tematická stránka: <a1>INTEGRITY.md</a1>

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry a check: Monte Carlo se seedem (N = { "20,000" } epoch na geometrii, sigma = { "1.5" } m, seed ChaCha8 { "36" } + i) vlastního iterovaného řešení polohy enginu metodou nejmenších čtverců (pvt::solve_spp, jednotkové váhy, řešeno ze skutečné polohy) na Testy: <a1>uere_dop_monte_carlo.rs</a1>.

seg-aab2f85048b7 = Zdroj: <c1/>

seg-56f864d32367 = <c1/> (druh scénáře)

seg-b7b67e03f125 = Jednobodové určení polohy z reálných pozorování: řešení polohy přijímače ze souboru pozorování RINEX { "3" } a souboru broadcast navigace (kódové pseudovzdálenosti, broadcast efemeridy, Klobucharova ionosféra, troposféra Saastamoinen/Niell), volitelně ověřené proti zaměřené souřadnici.

seg-79d2a463393d = Jeden běh <c1/> se shrnuje takto: pvt 55bdd18628e1 | { "11" } sat nav | vyřešeno 2/3 epoch | průměr { "9.0" } sat, PDOP { "1.8" } | chyba 3D RMS { "5.74" } m (max. { "7.12" } m)

seg-fd22bc5c2b67 = Povinná pole: <c1/>, <c2/>

seg-4b39ee73d65d = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>

seg-4f02bdcbc7c7 = Příklad <c1/> mimo jiné nastavuje:

seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

seg-d76d59644d84 = Graf, který engine zapisuje pro scenarios/pvt-abmf.toml, druh pvt

seg-e6f678eeb384 = <b>MODELLED</b> Hatchův filtr bez divergence (kód bez vlivu ionosféry nesený nosnou bez vlivu ionosféry, okno N epoch, restart při ztrátě zámku, skoku geometricky volné kombinace nebo mezeře) v sestavě přesného jednobodového určování polohy

seg-5a42823318a8 = <b>VALIDATED</b> Broadcast efemeridy IS-GPS-200 / Galileo-OS / BeiDou-OS, keplerovské → poloha družice v ECEF z analyzovaného navigačního záznamu RINEX-3. Orákulum (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos() přeložený ze zdrojového kódu v C (T. Takasu, BSD-2-Clause) — nezávislá implementace IS-GPS-200/SIS-ICD, napájená totožnými navigačními záznamy RINEX-3; poloha družice v ECEF se shodovala na ~{ "62" } nm. (Interpolace přesných efemerid SP3 je ověřena samostatně — viz 'SP3 precise-ephemeris interpolation')

seg-51cac2f918e0 = Tematická stránka: <a1>POSITIONING.md</a1>

seg-8ea056f1d7e0 = <s1>Předchozí</s1>passes

seg-d1dc82bbfb73 = <s1>Další</s1>quantum-anomaly-detect
