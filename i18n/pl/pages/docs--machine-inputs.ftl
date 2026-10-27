# docs--machine-inputs: translations (pl)

seg-e9650a618b38 = ID

seg-b9f561201fda = Źródło: <c1/>

seg-536f71da4541 = Dane wejściowe z maszyn i czujników ({ "0.38" })

seg-1a91f96f22ab = Czytniki, które wprowadzają do rodzaju <c1/> inne odbiorniki, solwery i czujniki. Każdy jest tylko do odczytu: to czyste funkcje na bajtach lub tekście, które zwracają ten sam przebieg czasowy co czytniki UBX, RINEX, Android i NMEA, pomijając i zliczając uszkodzone rekordy zamiast kończyć się błędem. Wszystko tu jest MODELLED: formaty odczytano z dokumentacji publicznej, a żaden wynik nie jest zwalidowany względem zewnętrznej wyroczni poza tym, co podano.

seg-3176ffff1e44 = <b>Oprogramowanie wyłącznie doradcze.</b> Nie jest to sprzęt nawigacyjny z zatwierdzeniem typu. Za bezpieczną nawigację statku odpowiada nadal operator.

seg-367ac9b4a8a6 = Co `kshana imu-fit` odczytuje ze stacjonarnego dziennika IMU, z prawdziwego przebiegu silnika v{ $version } na wymyślonym dzienniku ({ "20,000" } próbek przy { "100" } Hz, { "200" } s): błądzenie losowe prędkości akcelerometru q_va = { "4.02e-06" }, błądzenie losowe kąta żyroskopu q_arw = { "9e-08" }, niestabilność biasu { "0.00296" } oraz wczesne nachylenia Allana (-0.51 i -0.49; około -0.5 tam, gdzie dominuje szum biały). Tabela obok to TOML wypisywany przez polecenie. Estymator jest sprawdzony wyłącznie na dziennikach syntetycznych. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

seg-3ba911ed9541 = Plik rozwiązania zapisywany przez <c1/> RTKLIB i RTKPOST. Odczytywane: czas (kalendarz <c2/> albo tydzień GPS i sekundy tygodnia), położenie (szerokość i długość geograficzna w stopniach z wysokością lub ECEF X/Y/Z przeliczone na geodezyjne) oraz liczba satelitów. Skala czasu w nagłówku kolumny (<c3/>, <c4/>, <c5/>) jest przenoszona w etykiecie. Pliki ze stopniami-minutami-sekundami są odrzucane. Wiersze zaczynające się od <c6/> są wierszami nagłówka.

seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

seg-b73d1465ed67 = Dzienniki ASCII (<c1/>) i binarne (nagłówek <c2/>), mieszane dowolnie. Układy zgodne z publiczną dokumentacją OEM7 (docs.novatel.com): nagłówki komunikatów, 32-bitowa CRC i tabele pól trzech dzienników. Rekordy, których CRC się nie zgadza, są pomijane i zliczane.

seg-078e047b9f82 = Dziennik

seg-5b59f661e68b = Użyte

seg-286c3fb8ac5c = status rozwiązania (tylko <c1/> daje pozycję), szerokość, długość, wysokość nad średnim poziomem morza plus undulacja (wysokość pozycji jest elipsoidalna), liczba użytych satelitów

seg-3edaffed5d65 = C/No na sygnał (dB-Hz); system z bitów 16-18 statusu śledzenia, typ sygnału z bitów 21-25

seg-5663c6812797 = bit { "15" } statusu odbiornika (wykryto zagłuszacz) staje się <c1/> epoki (zagłuszanie { "2" } oznaczone, { "1" } nie; RXSTATUS nie ma flagi spoofingu), porównywanym z alarmami Kshana przez <c2/>; pomocnicze bity zagłuszaczy { "1" } (RF1-RF6) są zwracane w <c3/>

seg-61d8ec169a17 = Procedurę CRC sprawdzono względem CRC, które dokumentacja podaje dla własnego przykładu <c1/> (zacytowane, nie przytoczone); testy używają samodzielnie napisanych wierszy. Nieczytane: skrócony ASCII, inne dzienniki. Flaga zagłuszacza jest własnym raportem odbiornika, a nie ustaleniem Kshana; zgodność z monitorami Kshana nie jest walidacją.

seg-b6c3919c87ad = GNSS-SDR (<c1/>)

seg-0cc992f8d61b = Zob. <a1><c1/></a1>. Wyjścia NMEA i RINEX z GNSS-SDR są już odczytywane przez <c2/> i <c3/>; strumienie UDP Monitor i PVT-monitor (Protocol Buffers) są przekazywane jako wiersze JSON przez <c4/> i odczytywane przez <c5/>.

seg-cf1bf4944f6a = IMU (<c1/>)

seg-ab64a0754907 = <c1/>: wiersz nagłówka z nazwami kolumn, następnie jedna próbka na wiersz. Kolumny (w dowolnej kolejności, nazwy bez rozróżniania wielkości liter): <c2/> sekundy na zegarze dziennika odbiornika, <c3/>, <c4/>, <c5/> prędkość kątowa w rad/s, <c6/>, <c7/>, <c8/> siła właściwa w m/s². <c9/>: układ EuRoC MAV <c10/> <c11/> (<c12/>, <c13/>, <c14/>); pierwsza próbka to <c15/>. Wiersze, których nie da się przetworzyć, oraz wiersze, w których czas nie rośnie, są pomijane. Zob. <a1><c16/></a1>, jak używany jest kurs z żyroskopu.

seg-f7007cf35f53 = IMU w scenariuszach hybrid i fusion (<c1/>)

seg-3fc254763f67 = Scenariusze <c1/> i <c2/> (UKF o 17 stanach) są symulacjami: przyjmują parametry szumu czujnika (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), a nie zmierzony szereg. <c10/> odczytuje te parametry ze stacjonarnego dziennika IMU, więc scenariusz można uruchomić z faktycznie posiadanym czujnikiem:

seg-86efab73b2e6 = Metoda: nakładające się odchylenie Allana scałkowanego sygnału (<c1/>): <c2/>, to samo dla żyroskopu z (<c3/>), <c4/> i <c5/> jako średnie oraz <c6/> jako minimum krzywej, gdy krzywa po nim rośnie. <c7/> nie jest dopasowywane (wymaga dziennika znacznie dłuższego niż dolna granica). Raport zawiera częstość i rozpiętość dziennika oraz wczesne nachylenie Allana każdego kanału (około -0.5 tam, gdzie dominuje szum biały); dziennik, który nie jest nieruchomy, jest zbyt krótki (poniżej { "2000" } próbek) lub próbkowany nierównomiernie, jest odrzucany albo daje parametry oznaczone przez nachylenia. Pochodzenie tabeli podaje SHA-256 dziennika. MODELLED: estymator jest sprawdzony na syntetycznych dziennikach szumu białego ze znanymi współczynnikami (odtworzonymi z dokładnością do { "10" } %), a nie względem zewnętrznej wyroczni. Dostępne w CLI, Pythonie (<c8/>), WebAssembly (<c9/>), MCP (<c10/>) i we wtyczce (<c11/>).

seg-b3c592f63798 = RTCM { "3" } MSM4 i MSM7 (<c1/>)

seg-0f8b986cff40 = Strumień bajtów ramek RTCM { "3" } (wyjście obserwacji stacji bazowej lub odbiornika). Odczytywane: komunikaty MSM4 i MSM7 (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): epoka oraz stosunek nośnej do szumu każdej komórki sygnału (MSM4: { "6" } bitów, dB-Hz; MSM7: { "10" } bitów, 1/16 dB-Hz), czego potrzebują monitory C/N0. Pola pseudoodległości i fazy są przeskakiwane, a nie używane, więc RTCM dostarcza monitorom zaufania C/N0 i nic więcej; w MSM nie ma położenia. Ramki z błędnym CRC-24Q są pomijane i zliczane.

seg-d70038a737dc = <b>Skąd pochodzi układ.</b> Nie ze standardu RTCM (płatny dokument, niekonsultowany): z otwartoźródłowego dekodera pyrtcm { "1.2.0" }, BSD 3-Clause, którego licencja i nota znajdują się w <c1/> (decyzja właściciela z { "18" } paź { "2026" }: „używać otwartych dekoderów”). pyrtcm podaje, że jego tabele odpowiadają RTCM { "10403.3" }; Kshana opiera się na opublikowanych tabelach na licencji pyrtcm i nie składa żadnych deklaracji o standardzie. Czas: MSM nie zawiera tygodnia, więc etykiety odczytują <c2/>; epoki GLONASS (czas moskiewski) są przesuwane do czasu GPS z GPS-UTC = { "18" } s (wartość od 2017-01-01).

seg-ee04a86f8f00 = Sprawdzone względem: wartości kontrolnej katalogu CRC-24Q (<c1/> daje <c2/>) oraz, jednorazowo w trakcie rozwoju, własnego dekodera pyrtcm na tych samych samodzielnie napisanych ramkach (to samo C/N0). Dane testowe są samodzielnie napisane; nie wykonano żadnego zapisu z prawdziwego odbiornika, więc czytnik jest MODELLED, dopóki jednego nie odczyta.

seg-94f0e4db92df = <s1>Poprzednia</s1>Jammertest jako arbiter

seg-8d660b4049e4 = <s1>Następna</s1>Odczytywane protokoły odbiorników

seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

seg-b0b5f9a66eed = IMU ([log.imu])

seg-03a6e15dce0a = IMU w scenariuszach hybrid i fusion (kshana imu-fit)

seg-53ce2c4ba434 = RTCM { "3" } MSM4 i MSM7 (format = "rtcm3")
