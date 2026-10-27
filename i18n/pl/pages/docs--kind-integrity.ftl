# docs--kind-integrity: translations (pl)

seg-37d29d8303fe = km

seg-8e845ce908ee = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-f6b7ca020692 = Strona rodziny: <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>

seg-f4cf8b629797 = Strona tematu: <a1>INTEGRITY.md</a1>

seg-5b3dbe0aed82 = <b>MODELLED</b> Opcjonalna sekcja [integrity] rodzaju clock (clock_integrity::run): ze wskazanego miejsca i ustawień wstępnych konstelacji (geometry::sky_geometry), w każdej epoce integralności, dopóki GNSS nie jest w stanie odmowy dostępu na osi czasu, migawka RAIM (raim::snapshot_ Testy: <a1>clock_integrity.rs</a1>.

seg-ee7dd15019d0 = Strona tematu: <a1>CAMPAIGNS.md</a1>

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> Rozwiązanie ARAIM z separacją rozwiązań dla wielu hipotez wg ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels i add_v42_protecti. Wyrocznia (ExternalDataset): trzy niezależne narzędzia, zarejestrowane z góry (0123cee1) zanim powstał jakikolwiek wzorzec lub wynik wyroczni, tolerancje ustalone wtedy. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, uruchamiany jako osobny program w GNU Octave { "8.4" } z nakładką zgodności unique() po stronie sterownika (ujawnioną, bez zmiany algorytmu), przy ADD TOL_PL równym { "0.05" } m: kod w Rust odtwarza implementację odniesienia ADD na

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP z geometrii linii widzenia przez Q=(HᵀH)⁻¹ z lokalnym podziałem ENU. Wyrocznia (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — niezależna biblioteka, dopasowana do { "1e-6" } względnie

seg-78ff7db5ad3d = <b>VALIDATED</b> Rdzeń rozkładowy, na którym opiera się każdy poziom ochrony: próg detekcji usterek w migawce χ²₁₋ₚfₐ(dof), parametr niecentralności niewykrytego zdarzenia pbias=√λ oraz . Wyrocznia (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — niezależna biblioteka (Cephes/Boost), inny algorytm niż szereg niepełnej gamma w Kshana; dopasowana do ≤{ "1e-6" } względnie. Tylko jądro. <em>Alokacja</em> budżetu P_HMI w ARAIM MHSS nie jest już pozbawiona opublikowanej wyroczni liczbowej — własny przykład roboczy podgrupy technicznej ARAIM WG-C wspiera teraz osobne 'ARAIM MHSS protection levels against published referen

seg-4bec24cd43f6 = Źródło: <c1/>

seg-dd304550e695 = <c1/> (rodzaj scenariusza)

seg-eb7e0c2feb2b = RAIM migawkowy / z separacją rozwiązań / ARAIM z HPL/VPL i diagramem Stanforda.

seg-706887c285d8 = Jeden przebieg <c1/> podsumowuje się tak: integrity | { "24" } satellites | 344/361 epochs available ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } integrity events, { "0" } HMI

seg-c3f7debf260a = Wymagane pola: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-7b28ab6567df = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-581a5231b230 = Przykład <c1/> ustawia między innymi:

seg-ce7f6130ddee = Wykres zapisany przez silnik dla scenarios/integrity-raim.toml, rodzaj integrity

seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-dff469738ec3 = <b>VALIDATED</b> TPL z separacją rozwiązań dla czasu skalarnego na niejednorodnych źródłach; PL wyznaczany przez szum podzbioru najgorszego wykluczenia + bias UTC(k)

seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); dolnie półciągły PL({ "0" }+)≥PL({ "0" }−); K(IR/2) running-max; wykładniki fazowe τ/τ³/τ⁵

seg-4787b0b565df = <b>VALIDATED</b> Obwiednia running-max z naddatkiem pokrywa (bez przebić zera) rzeczywisty szereg metrologiczny przy każdym testowanym opóźnieniu tau>=90d na rozłącznym odcinku; krótkie tau (<=30d) jest jawnie podaną granicą opartą na modelu Testy: <a1>cti_holdover_coverage_reference.rs</a1>.

seg-090415eca3b7 = oraz { "6" } kolejnych w macierzy.

seg-b4bc9ccbcee2 = <s1>Poprzedni</s1>ins-trn-coast

seg-f1ba804baade = <s1>Następny</s1>jamming
