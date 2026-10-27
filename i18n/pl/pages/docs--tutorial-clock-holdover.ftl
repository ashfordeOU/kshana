# docs--tutorial-clock-holdover: translations (pl)

seg-b59f529012a6 = Źródło: <c1/>

seg-e66a5042182e = Samouczek { "2" } — Holdover zegara: jak długo można dryfować

seg-889112bc4c09 = <c1/> · <b>Scenariusz:</b> <c2/> (kopia dydaktyczna: <a1><c3/></a1>) · <b>Poziom trudności:</b> początkujący · <b>~{ "20" } min</b>

seg-a4bdf55d96be = Na końcu uruchomisz holdover zegara przy odmowie sygnałów GNSS (globalnego systemu nawigacji satelitarnej), odczytasz wskaźnik jakości synchronizacji czasu i zrozumiesz prawo dryfu √(q_wf·T), które wyjaśnia, <em>dlaczego</em> zegar optyczny wytrzymuje dłużej niż zegar w skali układu scalonego; prawo pochodzi z NIST (amerykańskiego Narodowego Instytutu Standardów i Technologii), a nie zostało wymyślone.

seg-51ae9468b92a = Czym jest ten scenariusz

seg-87334505b228 = Gdy sygnały GNSS znikają, system utrzymuje czas na własnym zegarze pokładowym. Faza tego zegara powoli dryfuje, a gdy dryf przekroczy operacyjną specyfikację czasu, system wypada z użytku. <b>Holdover</b> to czas, przez jaki pozostajesz w specyfikacji po utracie GNSS — główny wskaźnik jakości autonomii.

seg-798ac031b5c6 = Scenariusz obejmuje oś czasu { "2" } h: { "10" } min synchronizacji z GNSS, następnie { "6600" } s ({ "1.83" } h) odmowy, przy specyfikacji czasu { "20" } ns, próbkowanej co { "10" } s. Porównuje dwa zegary na identycznym kodzie z ich <em>własnym</em> opublikowanym szumem:

seg-3d53622dbe12 = <b>Kwantowy</b>: strontowy optyczny zegar sieciowy, cel kosmiczny σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), cel demonstratora naziemnego, nielatający. σ_y(τ) to odchylenie Allana, standardowa miara stabilności częstotliwości zegara przy czasie uśredniania τ.

seg-e25af6d0752f = <b>Klasyczny</b>: atomowy zegar w skali układu scalonego (CSAC) Microchip SA.45s, σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (karta katalogowa) — wdrożony komercyjny element.

seg-08f3fdc9252a = Przeczytaj jednowierszowe podsumowanie

seg-baa0cc808987 = Przy seed = { "42" }, specyfikacji { "20" } ns i przerwie { "6600" } s:

seg-76f7739f8b17 = <b><c1/></b> — zegar optyczny wytrzymuje całą przerwę { "6600" } s bez przekroczenia { "20" } ns. Jego 95. percentyl błędu fazy wynosi { "1.20e-4" } ns, około jednej dziesięciotysięcznej nanosekundy: prawie się nie rusza.

seg-0ba48fccffae = <b><c1/></b> — CSAC przekracza specyfikację { "20" } ns po ~{ "2610" } s, czyli w mniej niż połowie przerwy. Jego p95 błędu fazy ({ "19.7" } ns) leży tuż przy linii specyfikacji.

seg-b745d05e2bf1 = <b><c1/></b> — ten scenariusz nie konfiguruje żadnego ataku, więc nie ma czego wykrywać, a podsumowanie nie drukuje liczby. JSON nadal niesie analityczną granicę wykrywalności spoofingu każdego zegara w <c2/> ({ "0.997" } dla zegara optycznego; { "0.000" } dla CSAC, którego własny szum dryfu w oknie już przekracza { "20" } ns), oznaczoną <c3/> w bloku <c4/>. Ocena detekcji względem prawdziwego ataku to historia z <a1>Samouczka { "3" }</a1>.

seg-510e1cd8ed40 = <b><c1/></b> — tu jest to <em>samospójność filtra</em> (ułamek próbek przerwy mieszczących się w własnej granicy k-sigma filtra Kalmana), <b>nie</b> lotniczy poziom ochrony poziomy lub pionowy (HPL/VPL). Zob. <a1><c2/></a1>.

seg-7cc0ba5e5d13 = Niecykliczna wyrocznia: dlaczego { "2610" } s dla CSAC?

seg-2958401e00ca = Dla zegara z białą modulacją częstotliwości (white-FM) błąd fazy 1-σ rośnie jak <b>σ_x(T) ≈ √(q_wf · T)</b>, gdzie <c1/> ma jednostkę s². Ta zależność pochodzi z <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — zależności σ_y(τ)↔faza — jest to <em>ta sama</em> zależność SP-1065, względem której <c2/> sprawdza odchylenie Allana silnika z dokładnością ~{ "2" } %.

seg-d6c8f68b42b9 = Dla CSAC <c1/>. Rozwiąż dla czasu, w którym faza 1-σ osiąga { "20" } ns = { "2" }×{ "10" }⁻⁸ s:

seg-0f28d1a1163f = { "2610" } s silnika nie jest tym czasem 1-σ i nie powinno nim być. <c1/> to pierwszy punkt siatki { "10" } s (<c2/>), w którym bezwzględny błąd fazy <em>tej realizacji z ziarnem</em> przekracza { "20" } ns (<c3/>). Pierwsze przekroczenie poziomu przez błądzenie losowe często następuje znacznie wcześniej niż moment, w którym jego obwiednia 1-σ osiąga ten poziom, a realizacja niesie też resztkowy błąd częstotliwości, jaki filtr ma po synchronizacji { "600" } s. Prawo ustala więc skalę, kilka tysięcy sekund dla zegara { "3" }×{ "10" }⁻¹⁰ wobec { "20" } ns, a nie dokładną wartość. Test sprawdza <b>pasmo { "2000" }–{ "3200" } s</b> wokół niej, a nie samą liczbę.

seg-2e7cbdefa9b7 = Same kotwice z kart katalogowych są zewnętrzne, przywołane w ciągach <c1/> scenariusza: cel optycznego zegara sieciowego Sr { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (karta katalogowa). A wyeksportowana <c2/> zgadza się z σ_y(τ) z karty katalogowej z dokładnością ~{ "2" } % (<c3/>, NIST SP { "1065" }). Narysuj ją w playground jako wykres log-log „Stabilność zegara (ADEV, odchylenie Allana)”.

seg-def5271a207d = Co przypina test

seg-ebddc1f5ffe2 = <c1/> (zegar optyczny musi wytrzymać co najmniej tak długo),

seg-8e570268f107 = <c1/> (wytrzymuje całą przerwę),

seg-d60483c1af2e = <c1/> — pasmo tolerancji wokół skali white-FM z SP-1065, <em>a nie</em> magiczna liczba. Wyrocznią jest prawo, a nie wartość.

seg-e5f926d1055b = Pułapki i jednostki

seg-0f57e35ed833 = <b>Wartości synchronizacji czasu są w nanosekundach</b>, nigdy w metrach. (Holdover pozycji to <em>inny</em> pakiet — zob. sekcję inercyjną Samouczka { "3" }.)

seg-2e476b213141 = <b><c1/> ma jednostkę s² i jest równe σ_y({ "1" } s)².</b> To most od liczby odchylenia Allana z karty katalogowej do modelu.

seg-75951a150b44 = <b>Holdover to dolna granica skwantowana siatką</b> (<c1/>). Nie nadinterpretuj dokładnej wartości; czytaj <em>pasmo</em>.

seg-959eb86066f1 = <c1/> jest tu samospójnością filtra, a nie integralnością lotniczą.

seg-cb457294fc53 = Co dalej

seg-aa3e50f2c699 = <b>Poziom { "2" }:</b> zacieśnij <c1/> z { "20" } do { "10" } i zobacz, jak holdover CSAC <em>spada</em> ({ "2610" } s → { "1300" } s, zmierzone z <c2/>) albo użyj <c3/>, aby zestawić holdover z poziomem szumu CSAC <c4/> (<c5/>: { "25" } punktów od { "10" }⁻²⁴ do { "10" }⁻¹⁸ s², holdover klasyczny { "2610" } s → { "250" } s).

seg-cb31f104d104 = <b>Poziom { "3" }:</b> dodaj <c1/>, aby zamienić to w zespół Monte Carlo i odczytać pasmo holdover [p05–p95] (<c2/> drukuje <c3/>).

seg-9cb56e10f0fd = Potem zwieńczenie: <a1>Samouczek { "3" } — Odporność kwantowa a klasyczna</a1>.

seg-7dc19a98c7ee = <s1>Poprzednia</s1>{ "1" } · Twoja pierwsza orbita

seg-c274e92fdcb5 = <s1>Następna</s1>{ "3" } · Kwantowy kontra klasyczny
