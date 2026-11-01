# docs--kind-ntn-positioning: translations (pl)

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-a3697ad561db = Hz

seg-a849735fcc6e = Strona tematu: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-c5478f572d21 = Strona rodziny: <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>

seg-8dcdfc5da900 = Źródło: <c1/>

seg-d865fd8ceef6 = <c1/> (rodzaj scenariusza)

seg-4f0edb786a35 = Pozycjonowanie na podstawie łącza w dół sieci nieziemskiej 5G (NTN) w paśmie S usługi satelitarnej ruchomej (MSS) (pasmo 3GPP n256, łącze w dół od { "2170" } do { "2200" } MHz; domyślna nośna { "2172.5" } MHz): ograniczenie Craméra-Rao (CRB) dla czasu przybycia, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), gdzie beta jest średniokwadratową (Gabora) szerokością pasma płaskiego widma OFDM (B/sqrt({ "12" })), oraz dla dopplerowskiego przesunięcia tonu zespolonego, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), dla każdego sygnału (domyślnie kanał New Radio { "5" } MHz z zajętymi { "4.5" } MHz oraz kanał wąskopasmowy { "200" } kHz z zajętymi { "180" } kHz); następnie, dla dowolnej konstelacji LEO, pomiary czasu przybycia na łączu w dół z nieznanym zegarem odbiornika (z ziarnem, z ograniczeniem plus błędem synchronizacji sieci jako sigma), ich PDOP i formalne sigma 3D oraz jednosatelitarne pozycjonowanie dopplerowskie podczas najdłuższego przelotu przy utrzymanej wysokości. MODELLED: przejście od szerokości pasma do ograniczenia jest podręcznikową formułą zamkniętą, sprawdzoną względem całkowania numerycznego płaskiego i ograniczonego pasmowo widma BPSK (wewnętrzna spójność, bez przypiętej opublikowanej wartości z przykładu), a dokładność pozycjonowania jest ograniczeniem dla kanału bez wielodrogowości, przy podanym błędzie synchronizacji, a nie osiągniętym wynikiem.

seg-fea5da29df00 = Jeden przebieg <c1/> podsumowuje się tak: pozycjonowanie 5G NTN przy { "2172.5" } MHz, C/N0 od { "38" } do { "50" } dB-Hz, { "324" } satelitów ({ "10.0" } w widoczności) NR { "5" } MHz: { "4500" } kHz, zakres CRB od { "0.26" } do { "1.03" } m; mediana formalnego 3D { "2.09" } m, błąd RMS { "2.01" } m NB { "200" } kHz: { "180" } kHz, zakres CRB od { "6.49" } do { "25.85" } m; mediana formalnego 3D { "25.94" } m, błąd RMS { "26.73" } m przelot jednosatelitarny z Dopplerem: { "53" } próbek w ciągu { "520" } s, błąd poziomy { "1.9" } m

seg-145582d62c8c = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-7ff965e77d23 = Przykład <c1/> ustawia między innymi:

seg-409755afa2dd = NR { "5" } MHz

seg-a99a71f7178a = NB { "200" } kHz

seg-d04c7f65307d = indeks

seg-3a0cde9988c3 = Etykieta wyniku (silnika): pozycjonowanie MODELLED na podstawie ograniczeń Craméra-Rao: przejście od szerokości pasma do ograniczenia jest podręcznikową formułą zamkniętą (sprawdzoną względem całkowania numerycznego, nie względem opublikowanej wartości z przykładu); dokładność jest ograniczeniem dla kanału bez wielodrogowości, przy podanym błędzie synchronizacji, a nie osiągniętym wynikiem

seg-c200240dd65e = Wykres zapisany przez silnik dla scenarios/ntn-5g-positioning.toml, rodzaj ntn-positioning

seg-056b5f3c8201 = <b>VALIDATED</b> Ograniczenie Craméra-Rao dla czasu przybycia na podstawie średniokwadratowej (Gabora) szerokości pasma, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), dla płaskiego widma OFDM (beta = B/sqrt({ "12" })), widma BPSK ograniczonego pasmowo (licznik w postaci zamkniętej) lub dowolnego widma przez kwadraturę Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-c188cecaf468 = <b>VALIDATED</b> Ograniczenie Craméra-Rao dla czasu przybycia na podstawie średniokwadratowej (Gabora) szerokości pasma, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), dla płaskiego widma OFDM (beta = B/sqrt({ "12" }). Wyrocznia (ExternalDataset): opublikowane wartości z przykładów (P1): Bachl, Lei i Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), ograniczenia dla pojedynczego SSB w NR NTN odtworzone z mapy SSB 3GPP TS { "38.211" } przez własne funkcje numeryczne Kshana (W_rms { "1.9616" } wobec { "1.96" } MHz, sigma_t { "38.755" } wobec { "39" } us, sigma_f 100.79/87.28 wobec 101/87 Hz, sigma_rho 0.5970/0.5831 wobec 0.60/0.58 m, każda w granicach połowy jednostki ostatniej drukowanej cyfry); szerokości średniokwadratowe BPSK-R z Betz { "2001" } Tabela { "1" } (1.128/3.477 wobec

seg-baa462153341 = Pozycjonowanie MODELLED na podstawie ograniczeń Craméra-Rao: przejście od szerokości pasma do ograniczenia jest podręcznikową formułą zamkniętą (sprawdzoną względem całkowania numerycznego, nie względem opublikowanej wartości z przykładu); dokładność jest ograniczeniem dla kanału bez wielodrogowości, przy podanym błędzie synchronizacji, a nie osiągniętym wynikiem (wynik <c1/>)

seg-c4a9693d1191 = MODELLED: przejście od szerokości pasma do ograniczenia jest podręcznikową formułą zamkniętą, sprawdzoną względem całkowania numerycznego płaskiego i ograniczonego pasmowo widma BPSK (wewnętrzna spójność, bez przypiętej opublikowanej wartości z przykładu), a dokładność pozycjonowania jest ograniczeniem dla kanału bez wielodrogowości, przy podanym błędzie synchronizacji, a nie osiągniętym wynikiem. (katalog rodzajów (<c1/>))

seg-e23e35aa1203 = Przejście od szerokości pasma do ograniczenia jest podręcznikową formułą zamkniętą; dokładność pozycjonowania jest MODELLED (ograniczenie dla kanału bez wielodrogowości, a nie osiągnięty wynik). (komentarz w pliku scenariusza, wiersze { "12" } do { "13" })

seg-ccb921bf73b5 = <s1>Poprzednia</s1>moonlight-service-volume

seg-467bd80c37f8 = <s1>Następna</s1>oem-interop
