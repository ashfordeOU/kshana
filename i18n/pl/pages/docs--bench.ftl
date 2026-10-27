# docs--bench: translations (pl)

seg-5aa5efd6b7da = AUC

seg-5fcf52aba837 = Źródło: <c1/>

seg-d3c3517e3bb2 = Otwarty zestaw zadań, podziałów i metryk dla detekcji zakłóceń GNSS i holdover czasu. Specyfikacja to <a1><c1/></a1> (wersja { "2.0.0" }; licencja tekstu i manifestów: proponowane CC-BY-4.0 / CC0, decyzja właściciela w toku). Przegląd licencji zbiorów danych to <a2><c2/></a2>. Progi punktów odniesienia ustalono przed pierwszym ocenionym przebiegiem w <a3><c3/></a3> oraz, dla { "2.0.0" }, w <a4><c4/></a4>, a ich wyniki są w <a5><c5/></a5>.

seg-6c455061baac = Werdykty zapisane tam: progi oceniającego, C1 do C3 i D2 są spełnione; <b>A2 jest NOT MET</b> (<c1/> AUC { "0.766" } wobec co najmniej { "0.80" } na podziale testowym), <b>D1 jest NOT MET</b> (największa różnica { "0.0301" }) i <b>zadanie (b) R1 jest NOT MET</b> (przeniesione, nie uruchomione ponownie). Żaden próg nie został poluzowany.

seg-ebe1c987bc7c = Czym to jest: sposobem porównywania metod na tych samych danych tym samym kodem metryk. Czym to nie jest: rankingiem produktów, zatwierdzeniem ani dowodem, że metoda działa w terenie. Każdy wynik jest MODELLED, a wynik opisuje dziennik lub korpus, nigdy produkt. Wyniki Kshana są doradcze.

seg-874effe5ee80 = Wbudowane punkty odniesienia zadania D (luka optymizmu) w kshana-bench na podziale testowym, z rzeczywistego przebiegu silnika v{ $version } (`kshana bench baseline`). Każda para słupków to pole pod krzywą ROC dla przypadków z rozkładu oraz dla przypadków przesuniętych; różnica między nimi to luka optymizmu, wobec tolerancji { "0.05" }. fused-max-z: { "0.998" } i { "0.983" } (różnica { "0.015" }); sqm-imbalance: { "0.882" } i { "0.882" } (różnica { "0.001" }); agc-excess: { "0.848" } i { "0.819" } (różnica { "0.030" }); raim-parity: { "0.682" } i { "0.672" } (różnica { "0.010" }); energy-cn0-drop: { "0.595" } i { "0.565" } (różnica { "0.030" }). Etykiety są etykietami modelu generatywnego korpusu syntetycznego, nigdy danymi terenowymi: MODELLED. Wyłącznie doradczo: obliczone z modelu lub zmierzone względem podanych wzorców, nie jest to zatwierdzenie, certyfikacja ani oświadczenie o zgodności. Wynik opisuje dziennik lub korpus, nigdy produkt.

seg-6ce7bd4525d6 = Zadania

seg-09907c94f04d = Zadanie

seg-1c6199627b90 = Dane

seg-9cdfe78e3b22 = Główna metryka

seg-5093217f24a1 = (a) detekcja w dziennikach odbiornika

seg-809068c95ddf = jedna epoka dziennika JammerTest { "2024" }

seg-f87dda92fbd2 = pobierane przez <c1/> (GPL-3.0+, nigdy nie dołączane)

seg-9493bfc5bd64 = (b) detekcja na IQ

seg-8d012e25aa62 = jedno ocenione okno sceny

seg-69f020ed20da = syntetyczna receptura sceny Kshana; TEXBAT wyłącznie jako odniesienie

seg-499ae444224e = AUC dla każdego rodzaju alarmu

seg-73028caefeb0 = (c) predykcja holdover czasu

seg-0d0b071690cf = (satelita, źródło)

seg-6cf42152f523 = zegary IGS co { "300" } s (zatwierdzony wyciąg, przypięty skrót)

seg-74bd23dfebf5 = RMSE przy { "3600" } s

seg-3cc3545250e5 = (d) luka optymizmu poza rozkładem

seg-ab343a29b019 = jeden przypadek syntetyczny

seg-b25d781ff536 = korpus <c1/>, w rozkładzie i poza nim

seg-e32f49d34f7b = AUC na wyjściu i luka

seg-1ad563733f12 = Polecenia

seg-c9d00ff2e1d0 = Zgłoszenie to plik (<c1/>): <c2/> (jedna liczba na identyfikator przypadku; wyższa oznacza większe prawdopodobieństwo zakłócenia) dla zadań a, b i d albo <c3/> (zmiana fazy w ns przy każdym horyzoncie) dla zadania c. Plik wyniku (<c4/>) podaje wersję specyfikacji, podział, SHA-256 prawdy i predykcji oraz metryki. Wyniki różnych głównych wersji specyfikacji nigdy nie trafiają do jednej tabeli.

seg-bdc715c52ab5 = Uczciwe ograniczenia

seg-f26f0e79f2ed = Zbiory zapieczętowane z danymi rzeczywistymi (a i c) są publiczne, ponieważ każdy może pobrać dane. Chronią przed wyborem podziału po zobaczeniu wyników, a nie przed dostrajaniem na tych folderach. Zapieczętowany zbiór zadania (d) działa na zasadzie zobowiązania i ujawnienia: właściciel zobowiązuje się tylko skrótem w <c1/> i zachowuje ziarno (żadne nie jest jeszcze zapieczętowane).

seg-81c3f961230b = Prawdą dla zadania (a) są zaplanowane okna ataków z dzienników zdarzeń w rozdzielczości jednej minuty, więc prawdopodobieństwo detekcji jest dolną granicą; metryki na poziomie zdarzeń (opóźnienie, niewykryte alarmy, fałszywe alarmy) pojawią się wraz z oceniającym Jammertest z <c1/>.

seg-47df52b5c5e6 = Punkt odniesienia IQ zadania (b) jest przeniesiony z <c1/>, a nie uruchomiony ponownie dla v1.

seg-d54342791763 = Korpus zadania (d) jest kontrolą rozdzielności i potoku; AUC na nim jest AUC dla etykiet wyprowadzonych z modelu.

seg-3d8bfdeead6c = <s1>Poprzednia</s1>Obserwatorium zakłóceń: wyniki

seg-07f5b51844d1 = <s1>Następna</s1>Uruchamianie odbiornika względem scenariusza
