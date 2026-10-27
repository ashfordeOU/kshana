# docs--maritime-trust: translations (pl)

seg-2247a2344710 = Znaczenie

seg-6940543aa3c0 = ciąg znaków

seg-abec93a4a488 = ciąg znaków lub null

seg-f5e7215e6835 = obiekt

seg-b993ef559bd0 = Z kodu

seg-c353e7bec219 = Klucz

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> lub <c4/>

seg-2896f449bffb = Źródło: <c1/>

seg-342f34403ac5 = Zaufanie morskie: czy mostek może zaufać tej pozycji?

seg-49b609a9655c = <c1/> może dla <b>poruszającego się statku</b> obliczać bieżący wskaźnik zaufania 0-100 dla każdej pozycji, na podstawie tego, co każdy odbiornik już umieszcza na magistrali (najpierw NMEA { "0183" }), i wskazywać, które kontrole go obniżyły. Jest to warstwa programowa działająca obok odbiornika. Nie jest odbiornikiem, nie zastępuje żadnego i nie czyni pozycji dokładniejszą.

seg-3c66739c9250 = <b>Oprogramowanie wyłącznie doradcze.</b> Kshana nie jest sprzętem nawigacyjnym z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }) i nie została oceniona względem żadnej normy działania. Jej wskaźnik i bramka są pomocą dla osądu nawigatora. Za bezpieczną nawigację statku oraz za każdą decyzję o poleganiu na pozycji lub o zaprzestaniu polegania na niej odpowiada nadal operator.

seg-a9899ca66661 = Ta strona mówi, na co patrzą kontrole, co każda z nich może, a czego nie może wychwycić, jak uruchomić ją na żywo i co robi bramka. Mapowanie wskaźnika i każda wartość domyślna znajdują się w <a1><c1/></a1>.

seg-05e79b6c5a58 = Co odczytuje

seg-e784fdbe26e6 = Statek jest deklarowany w pliku sesji, z limitami podanymi przed przebiegiem:

seg-e8e9ee2965cf = Zdanie

seg-e127f2f26824 = Odczytywane

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = położenie, jakość pozycji ({ "0" } = brak pozycji), wysokość nad średnim poziomem morza, separacja geoidy, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = status (<c1/> ważna, <c2/> nie), prędkość i kurs nad dnem, data, tryb

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = prędkość i kurs nad dnem, gdy RMC ich nie ma

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = kurs (THS tylko gdy jego tryb nie jest <c1/>)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = prędkość względem wody (VBW tylko gdy jej status to <c1/>)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = czas

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = moc sygnału każdego satelity (dB-Hz), elewacja i azymut (dla geometrii)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = współczynnik DOP i użyte satelity (dla geometrii, gdy GSV nie daje nieba; oraz podany HDOP, z którym porównuje strażnik)

seg-305f423d3ead = status OSNMA zgłoszony przez odbiornik, przetłumaczony na to zdanie przez adapter czytający odbiornik: <c1/> uwierzytelniony, <c2/> niepowodzenie, <c3/> brak wyniku

seg-7ce1d69e710e = Epoki, o których sam odbiornik mówi, że nie są pozycją satelitarną (jakość GGA { "0" } lub od { "6" } do { "8" }: estymowana, ręczna, symulator; status RMC <c1/> albo tryb <c2/>, <c3/>, <c4/>, <c5/>), nie są używane do kontroli położenia i nie niosą żadnego dowodu w żadną stronę: odbiornik już to powiedział.

seg-a0ae80781c6e = Pierwsze <c1/> sekund tworzy punkt odniesienia i nigdy nie jest oceniane. Każdy monitor patrzy tylko na bieżącą i wcześniejsze epoki, więc decyzja w danej epoce nie zmienia się po nadejściu późniejszych danych, a strumień na żywo daje ten sam wskaźnik co ten sam tekst odczytany jako plik.

seg-068593ad0a52 = Co każda kontrola wychwytuje, a czego nie może

seg-094b90f0c701 = Kierunki między pozycjami (azymut toru używany przez kontrolę prędkości zwrotu, kurs wynikający z dwóch położeń) są kierunkiem cięciwy między nimi, czyli <b>średnim azymutem</b> geodezyjnej między pozycjami, a nie azymutem wprzód w pierwszej pozycji; oba różnią się o około połowę zbieżności południków między pozycjami ({ "0.001" } stopnia dla bazy { "260" } m na szerokości { "59.5" } stopnia).

seg-ed3cdfcfbff5 = Sfałszowane położenie musi zgadzać się z fizyką statku i z jego innymi czujnikami. Każda kontrola porównuje pozycję z jednym z nich. Kontrola jest tak niezależna, jak jej drugie źródło: kurs z kompasu GNSS albo „prędkość względem wody” wyprowadzona z GNSS nie jest niezależna od badanego odbiornika i nic nie wnosi.

seg-5dd62cd853c6 = Może <b>wstrzymać prawidłowe rozwiązanie pozycji</b> (fałszywy alarm), a także przepuścić sfałszowane (niewykryte zdarzenie). Monitory sprawdzają rozwiązanie pozycji na tle fizyki statku i jego pozostałych czujników; podróbka spójna ze wszystkimi z nich nie zostanie zauważona (zob. ograniczenia poniżej).

seg-a284a3ec9dfe = Oczekuje <b>czystego strumienia tekstowego NMEA { "0183" }</b>. Ramki binarne wmieszane w strumień są przekazywane bez zmian, ale <c1/> może wtedy trafić między bajty ramki.

seg-0c919698fa92 = <b>Nie ma zatwierdzenia typu</b>, a nic w nim nie zostało ocenione względem IEC { "61108" } ani IEC { "61162" }. Za nawigację statku odpowiada nadal operator.

seg-9e3ea39c38cf = <s1>Poprzednia</s1>Zaufanie do odbiornika

seg-136da5c10b2d = <s1>Następna</s1>Strumienie szkoleniowe NMEA

seg-990a49527516 = $PKSHT: zdanie własnościowe
