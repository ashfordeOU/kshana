# docs--kind-gnss-sim: translations (pl)

seg-37d29d8303fe = km

seg-51362910dcb7 = Tego rodzaju używa { "2" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-8e845ce908ee = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-f6b7ca020692 = Strona rodziny: <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>

seg-d5f4762f8455 = Źródło: <c1/>

seg-b634bbba2197 = <c1/> (rodzaj scenariusza)

seg-2ffccc9c1eff = Symulacja pseudoodległości w dziedzinie pomiarów (jonosfera Klobuchara, troposfera Saastamoinena/Niella) + RAIM.

seg-db93cbad6c6d = Jeden przebieg <c1/> podsumowuje się tak: scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

seg-55ee4fdf9240 = Wymagane pola: <c1/>, <c2/>, <c3/>, <c4/>

seg-ee0d38971d08 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-c7b57e696bc3 = Przykład <c1/> ustawia między innymi:

seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

seg-47ee40d4eb73 = Wykres zapisany przez silnik dla scenarios/gnss-sim-raim.toml, rodzaj gnss-sim

seg-ccc44a4ac68e = <b>VALIDATED</b> Jednoczęstotliwościowe opóźnienie grupowe jonosferyczne L1 Klobuchara na ukośnej ścieżce z ośmiu rozgłaszanych współczynników α/β Testy: <a1>klobuchar_reference.rs</a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> Rozwiązanie ARAIM z separacją rozwiązań dla wielu hipotez wg ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels i add_v42_protecti. Wyrocznia (ExternalDataset): trzy niezależne narzędzia, zarejestrowane z góry (0123cee1) zanim powstał jakikolwiek wzorzec lub wynik wyroczni, tolerancje ustalone wtedy. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, uruchamiany jako osobny program w GNU Octave { "8.4" } z nakładką zgodności unique() po stronie sterownika (ujawnioną, bez zmiany algorytmu), przy ADD TOL_PL równym { "0.05" } m: kod w Rust odtwarza implementację odniesienia ADD na

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP z geometrii linii widzenia przez Q=(HᵀH)⁻¹ z lokalnym podziałem ENU. Wyrocznia (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — niezależna biblioteka, dopasowana do { "1e-6" } względnie

seg-752829346523 = <b>VALIDATED</b> Jednoczęstotliwościowe opóźnienie grupowe jonosferyczne L1 Klobuchara na ukośnej ścieżce z ośmiu rozgłaszanych współczynników α/β. Wyrocznia (ExternalDataset): RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — niezależna implementacja odniesienia skompilowana ze źródeł; dopasowana do < { "1e-4" } m

seg-78ff7db5ad3d = <b>VALIDATED</b> Rdzeń rozkładowy, na którym opiera się każdy poziom ochrony: próg detekcji usterek w migawce χ²₁₋ₚfₐ(dof), parametr niecentralności niewykrytego zdarzenia pbias=√λ oraz . Wyrocznia (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — niezależna biblioteka (Cephes/Boost), inny algorytm niż szereg niepełnej gamma w Kshana; dopasowana do ≤{ "1e-6" } względnie. Tylko jądro. <em>Alokacja</em> budżetu P_HMI w ARAIM MHSS nie jest już pozbawiona opublikowanej wyroczni liczbowej — własny przykład roboczy podgrupy technicznej ARAIM WG-C wspiera teraz osobne 'ARAIM MHSS protection levels against published referen

seg-cc7018560c2c = Strona tematu: <a1>REAL_TLE_GUIDE.md</a1>

seg-53a78e98af12 = Strona tematu: <a1>SKYLINE.md</a1>

seg-659e6288ad72 = <s1>Poprzedni</s1>gnss-ins

seg-7d677a362edd = <s1>Następny</s1>gnss-ssv
