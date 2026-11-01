# docs--compliance-dhs-rpcf: translations (pl)

seg-d01db1c2710a = Źródła

seg-fdbb9db68f1d = brak

seg-dbec6a166e56 = Źródło: <c1/>

seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: co Kshana wspiera dowodami (supports evidence for)

seg-cef4181edf29 = Ramy opisują poziomy odporności od { "0" } do { "4" }, zbudowane z ośmiu ponumerowanych wymagań, oraz podejście oceny łączące analizę statyczną z dynamiczną, w której wektory testowe zastępują zagrożenia. Nie mają własnego schematu identyfikatorów wymagań, więc poniższe odniesienia to numery poziomów i wymagań oraz numery sekcji. Ramy są oparte na wynikach i nie katalogują zagrożeń.

seg-ff0e00610721 = Każdy wiersz mówi, które wyniki Kshana <b>wspierają dowodami (support evidence for)</b> dane wymaganie i co pozostaje poza nimi. Nic tu nie mówi, że ramy są spełnione ani że jakikolwiek produkt został przez kogokolwiek oceniony lub zatwierdzony. Uruchom <c1/> na własnych plikach wyników, aby zobaczyć, które wiersze Twoje przebiegi faktycznie dokumentują; zob. <a1>README.md</a1>.

seg-30c8cabb6e90 = Dokumenty źródłowe

seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: wersja { "2.0" }, { "26" } kwietnia { "2022" } (DHS Science and Technology Directorate, wraz z CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Odczytano 2026-10-09: dokument odczytano w całości; strony z publikacją nie pobierano.

seg-955191e0baab = Odwzorowanie

seg-6ba8f74126ee = Czego wymaga (parafraza)

seg-0438151025da = Wyniki Kshana, które to wspierają dowodami (support evidence for)

seg-3f265e18f56c = Luka

seg-4263435e702a = Sekcja { "5.2" } (Prevent, Respond, Recover)

seg-e7b721f6e216 = Odporność opisano jako trzy funkcje: zapobieganie szkodzie, reagowanie (wykrycie, zgłoszenie, łagodzenie, ograniczenie) i odzyskiwanie. Detekcja jest probabilistyczna, więc istotne są zarówno fałszywe alarmy, jak i niewykryte zdarzenia.

seg-3447d3b53fe8 = Ocena zaufania do dziennika odbiornika; Detekcja spoofingu i meaconingu; Holdover i bieg swobodny

seg-ab055a50e16e = Zapobieganie jest cechą projektu produktu, której nie pokazuje żaden wynik symulacji. Statystyki detekcji z przebiegu syntetycznego lub z pojedynczej sesji nie są zmierzoną częstością fałszywych alarmów ani niewykryć dla produktu w eksploatacji.

seg-501badd6a436 = Poziom { "1" }, wymaganie { "1" }

seg-e8cfbe121084 = Sprawdzić, czy zapisane dane przychodzące ze źródeł zewnętrznych odpowiadają formatom i zakresom wartości odpowiednich norm.

seg-7d7196aefa05 = Cecha zapewniania jakości oprogramowania i walidacji danych wejściowych badanego produktu. Kshana nie sprawdza obsługi danych wejściowych produktu.

seg-6085030de980 = Poziom { "1" }, wymaganie { "2" }

seg-e8cd6fb732ad = Umożliwić pełne ręczne odzyskanie przez wyczyszczenie lub zresetowanie pamięci, przywracając systemowi zdefiniowaną wydajność po ustąpieniu zagrożenia.

seg-8d216d42c776 = Ocena zaufania do dziennika odbiornika

seg-e3ca721d9d2e = Dziennik odbiornika pokazuje, kiedy pozycja przestała być zaufana i kiedy się odzyskała; nie pokazuje, że ręczny reset czyści każdy zapisany stan.

seg-2c78c15cea96 = Poziom { "1" }, wymaganie { "3" }

seg-ab9458f8b8fc = Bezpiecznie przeładować lub zaktualizować oprogramowanie sprzętowe.

seg-3a50eceb47f5 = Bezpieczeństwo aktualizacji oprogramowania sprzętowego leży poza tym, co obserwuje jakikolwiek wynik Kshana.

seg-752a194674f6 = Poziom { "2" }, wymaganie { "4" }

seg-a5f263a083c7 = Zidentyfikować skompromitowane źródła PNT i powstrzymać je przed zniekształcaniem rozwiązania.

seg-4e7034acccc0 = Detekcja spoofingu i meaconingu; Ocena zaufania do dziennika odbiornika; Monitorowanie integralności i poziomy ochrony

seg-d5fdef2a78f2 = Kshana ocenia detektory i monitory, które modeluje lub uruchamia na dzienniku; to, czy własne wykluczanie źródeł produktu działa, wymaga wewnętrznego stanu produktu, a nie tylko jego dziennika.

seg-e3ea1208fac9 = Poziom { "2" }, wymaganie { "5" }

seg-c0219254fe8e = Odzyskiwać źródła i system automatycznie bez przerywania wyjścia; rozwiązanie jest nadal dostarczane podczas zagrożenia, z możliwie nieograniczonym pogorszeniem.

seg-3dd48cb65cb4 = Holdover i bieg swobodny; Ocena zaufania do dziennika odbiornika

seg-0c36c4a3eb4e = Przebiegi holdover ograniczają modelowany dryf dla podanego modelu zegara lub inercjalnego, a nie własne zachowanie produktu przy odzyskiwaniu.

seg-befbf4b94876 = Poziom { "3" }, wymaganie { "6" }

seg-45410d1675be = Uszkodzone dane z jednego źródła nie mogą zanieczyścić innego źródła.

seg-ff808ce8ec48 = Alternatywne i zróżnicowane źródła PNT

seg-ccf628643110 = Kshana uruchamia źródła obok siebie; izolacja źródeł wewnątrz produktu wymaga przeglądu projektu lub wstrzykiwania uszkodzeń do produktu.

seg-a1d5a3125697 = Poziom { "3" }, wymaganie { "7" }

seg-db149ea618dd = Wzajemnie weryfikować rozwiązania wszystkich źródeł i utrzymywać pogorszenie podczas zagrożenia w granicach.

seg-4afa05ef42fa = Monitorowanie integralności i poziomy ochrony; Holdover i bieg swobodny; Alternatywne i zróżnicowane źródła PNT

seg-8b1f938c0175 = Ograniczone pogorszenie pokazano dla modelowanych czujników; własna kontrola krzyżowa produktu nie jest obserwowana.

seg-772244881e5b = Poziom { "4" }, wymaganie { "8" }

seg-aff5161e6363 = Używać źródeł o różnych technologiach przeciw zagrożeniom wspólnego trybu, bez pogorszenia podczas zagrożenia.

seg-587889f9881c = Alternatywne i zróżnicowane źródła PNT; Wpływ zagłuszania na bilans łącza

seg-65b96caf8d6b = Argument wspólnego trybu wymaga zestawu źródeł rzeczywistego produktu i zagrożenia obejmującego je wszystkie; scenariusz je stwierdza, ale nie dowodzi, że produkt nie ma wspólnej słabości.

seg-3c4cc0793454 = Sekcja { "5.5" } (wspólny tryb)

seg-a87c9808dd99 = Zróżnicowane mechanizmy nie mogą mieć wspólnej słabości: na przykład zagłuszacz pokrywający dwa pasma pokonuje zróżnicowanie pasm.

seg-c10ba3bb01be = Wpływ zagłuszania na bilans łącza; Ocena odporności na zespołach zagrożeń; Alternatywne i zróżnicowane źródła PNT

seg-843fe2fc9e33 = Ocena używa syntetycznego zespołu zagrożeń, podanego jako taki; nie są to dane terenowe.

seg-3158e7efd1a5 = Sekcje { "8.1" } do { "8.3" } (ocena)

seg-3942d9cdc64b = Ocena łączy analizę statyczną z dynamiczną, w której wektory testowe zastępują zagrożenia; klasy testów to awaria źródła, zakłócenia i uszkodzenia wewnętrzne. Symulatory są wymienione jako metoda testowa.

seg-9d5c297c1ab9 = Ocena zaufania do dziennika odbiornika; Wpływ zagłuszania na bilans łącza; Detekcja spoofingu i meaconingu

seg-bb02568e8f8f = Wyeksportowany ruch i zdarzenia mogą napędzać symulator laboratoryjny (docs/TEST-BENCH.md). Kshana nie zapisuje żadnego sygnału, więc zagrożenie zapewniają symulator i jego upoważniony operator.

seg-b81625e9e071 = Sekcja { "8.6" } (elementy planu testów)

seg-27d645a79672 = Plan testów podaje poziom, wymaganie, dane wejściowe, odniesienia, potrzebny dostęp do danych, procedurę z kryteriami zaliczenia lub niezaliczenia, wyniki i uwagi.

seg-1f2898855ccc = Odtwarzalne pochodzenie przebiegu; Ocena zaufania do dziennika odbiornika

seg-d8b08da48cb2 = Kryteria zaliczenia lub niezaliczenia wybiera oceniający; Kshana zapisuje dane wejściowe, progi i hasze, z którymi działała.

seg-ccfdf53a1e54 = <s1>Poprzednia</s1>Odwzorowanie compliance

seg-260ba950eb89 = <s1>Następna</s1>Wytyczne IMO dla statków
