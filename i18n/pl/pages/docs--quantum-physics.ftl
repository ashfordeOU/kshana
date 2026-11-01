# docs--quantum-physics: translations (pl)

seg-5ad814c7ef9e = Uwagi

seg-ad856ad710eb = Status

seg-f2f359447cd9 = Źródło: <c1/>

seg-5df810623ef1 = Fizyka kwantowych czujników inercjalnych (interferometr na zimnych atomach)

seg-b2915c3652a1 = Większość modeli { -brand } napędza swoje czujniki kwantowe <b>opublikowanymi współczynnikami Allana i szumu</b> — odczytami z kart katalogowych (zob. <a1><c1/></a1> i <a2><c2/></a2>). Ten dokument omawia jedyne miejsce, w którym silnik zamiast tego oblicza parametry czujnika <b>od pierwszych zasad</b>: model akcelerometru z interferometrem na zimnych atomach (CAI) w <a3><c3/></a3>.

seg-9ae4b2dc84ba = Jest to celowo <em>minimalna i rzetelna</em> warstwa fizyki — dolna granica szumu projekcji kwantowej i współczynnik skali interferometru — a nie pełny symulator przyrządu. Poniższe sekcje mówią dokładnie, co jest, a co nie jest modelowane.

seg-64509c048541 = Co jest modelowane

seg-9fa6211c962e = Trójimpulsowy (π/2–π–π/2) interferometr atomowy Macha–Zehndera (Kasevich i Chu { "1991" }; Peters, Chung i Chu { "2001" }), standardowa geometria akcelerometru na zimnych atomach:

seg-3c513ef2fd3b = Wielkość

seg-c0a13eeb346d = Wzór

seg-f838cd800e16 = Efektywny wektor falowy

seg-79e00267b79f = Dwufotonowe przejście Ramana; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

seg-5c0a84157352 = Faza interferometru

seg-31f4f718d896 = Jednorodna siła właściwa <c1/> wzdłuż <c2/>, odstęp impulsów <c3/>. Skalowanie <c4/> jest dominującą dźwignią czułości (mikrograwitacja pozwala uzyskać długie <c5/>).

seg-f5b8b6c35dce = Szum projekcji kwantowej

seg-8902ae6f313c = Na jeden strzał, kontrast prążków <c1/>, liczba atomów <c2/> — granica szumu śrutowego dla dwuportowego odczytu populacji.

seg-b95d4d1e45f0 = Czułość na przyspieszenie na jeden strzał

seg-c97f2fd35d48 = Szum fazy przeliczony na przyspieszenie.

seg-cda09ac79409 = ASD (amplitude spectral density) ograniczona szumem śrutowym

seg-4d84800a3adb = Próbkowanie co czas cyklu <c1/>; jednostki (m/s²)/√Hz.

seg-707ee648d1d5 = PSD (power spectral density) błądzenia losowego prędkości

seg-be0ac61054db = <b>Współczynnik, z którego korzysta klasyczny <c1/></b> — teraz <em>wyprowadzony</em>, a nie podany.

seg-939e12a62637 = Zanik kontrastu

seg-05b0e7130b78 = Dekoherencja w czasie interrogacji.

seg-e64f748b35ab = Funkcja przenoszenia drgań

seg-1754ac375452 = Odpowiedź fazy na przyspieszenie dla idealnej geometrii trójimpulsowej (Cheinet i in. { "2008" }); granica DC (zerowa częstotliwość) <c1/>.

seg-a710cfe4f533 = Faza ograniczona drganiami

seg-f5d2223218c8 = Płaskie PSD przyspieszenia <c1/> wzdłuż osi Ramana; <c2/>.

seg-13109dcfc52b = Przyspieszenie ograniczone drganiami

seg-812990a8f058 = Na jeden strzał; należy zauważyć, że <c1/> się skraca — wynik zależy wyłącznie od PSD platformy i czasu interrogacji.

seg-1c2764469718 = Niejednoznaczność prążków

seg-e9cf2dcc0274 = <c1/>, zakres w komórkach <c2/>

seg-817e06834263 = Faza prążków jest odczytywana modulo 2π, więc pojedynczy odczyt jest jednoznaczny tylko w granicach ±<c1/> i ulega aliasingowi co <c2/> poza nimi; liczba komórek nie zależy od <c3/> ani <c4/>.

seg-14bbedf1cd0d = Rzutowanie na oś

seg-1ac2d4904b8a = Sprzężenie pierwszego rzędu ma rząd 1: do fazy wchodzi tylko składowa wzdłuż wiązki.

seg-7200f91fa19a = Faza Coriolisa / rotacji

seg-f8b407b3b2fb = Efekt systematyczny rotacji dla poruszającego się pojazdu (Lan i in. { "2012" }); równoważny bias <c1/> = klasyczny człon Coriolisa.

seg-9eaff8d90a83 = Faza AC-Stark (przesunięcie światłem) (AC: prąd zmienny)

seg-62630dc178e6 = Przesunięcie światłem jednofotonowe; <em>stałe</em> przesunięcie znosi się dzięki symetrii π/2–π–π/2 (Peters { "2001" }; Gauguet { "2008" }).

seg-bcb9cb9c6219 = Sedno tkwi w domknięciu pętli: <c1/> daje dokładnie takie białe PSD przyspieszenia, jakie reszta stosu inercjalnego już całkuje do błędu prędkości i położenia — dzięki temu szum czujnika kwantowego można wyśledzić do liczby atomów, czasu interrogacji i kontrastu, a nie do wiersza z karty katalogowej.

seg-e2363d639ccc = Przykład obliczeniowy (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) na jeden strzał oraz dolna granica szumu śrutowego <c8/>. Przy umiarkowanym PSD drgań platformy <c9/> dolna granica <b>ograniczona drganiami</b> na jeden strzał wynosi <c10/> (≈ { "5.9" } µg) — około { "46" }× dolnej granicy szumu śrutowego, co pokazuje, dlaczego rzeczywiste urządzenia są ograniczone drganiami, a nie projekcją. Ten sam interferometr odczytuje siłę właściwą jednoznacznie tylko w granicach <c11/> (≈ { "199" } µg), czyli około { "1 571" } komórek rozdzielczości: <c12/> to tysiące prążków, więc pojedynczy odczyt { "1" } g ulega aliasingowi.

seg-c209b86f41d8 = Czego NIE modelujemy (i dlaczego dolna granica jest optymistyczna)

seg-964c5f546c2a = Powyższa dolna granica szumu śrutowego jest <b>podstawową granicą dolną</b>. Rzeczywiste przyrządy CAI znajdują się nad nią: statyczny grawimetr laboratoryjny (Freier i in. { "2016" }, { "96" } nm/s²/√Hz) około { "60" }× nad granicą obliczoną dla jego parametrów, a terenowa trójka akcelerometrów znacznie dalej (urządzenie Exail cytowane w <c1/> podaje { "22" } µg/√Hz). Dominujący człon — <b>sprzężenie drgań</b> — oraz dwa główne deterministyczne efekty systematyczne — <b>Coriolisa/rotacji</b> i <b>przesunięcie światłem AC-Stark</b> — są modelowane (wiersze powyżej: funkcja przenoszenia, Coriolis i przesunięcie światłem), podobnie jak <b>zakres dynamiczny niejednoznaczności prążków</b> (<c2/>, <c3/>, <c4/>, <c5/>). Pozostała luka to to, czego ta warstwa nadal nie obejmuje:

seg-c56d85817bc6 = <b>Aberracja czoła fali</b> i efekty systematyczne wyższego rzędu związane z kierunkiem wiązki — <b>nie są modelowane</b>.

seg-525c382e813b = <b>Rozwiązywanie niejednoznaczności prążków</b> — model podaje zakres jednoznaczności i zwraca fazę zawiniętą; nie rozwija odczytu spoza ±<c1/> (na przykład za pomocą akcelerometru klasycznego lub kilku czasów interrogacji) i wyznacza zakres dla idealnego prążka trójimpulsowego, bez członów wynikających z czoła fali ani utraty kontrastu.

seg-7555132ef2c6 = Odniesienie do literatury: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (technologia kwantowa; GNSS: globalny system nawigacji satelitarnej); Cheinet i in., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) dla czułości interferometru i funkcji przenoszenia (IEEE: Institute of Electrical and Electronics Engineers); Freier i in., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) dla budżetu błędów mobilnego grawimetru; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) dla reżimu parametrów akcelerometru kosmicznego.

seg-c50f3befe165 = Jest to pozycja <b>P2, warstwa fizyki kwantowej</b> z <c1/>: faza Macha–Zehndera, szum projekcji, współczynnik skali, wyprowadzone <c2/>, zanik kontrastu <b>oraz funkcja przenoszenia sprzężenia drgań / wariancja przy białym PSD</b> są zaimplementowane i objęte testami jednostkowymi względem obliczeń ręcznych (w tym numerycznego sprawdzenia całki pasmowej funkcji przenoszenia względem jej analitycznego wyniku <c3/>).

seg-42e8dc204be9 = Model jest także <b>podłączony do uruchamialnych scenariuszy</b>: akcelerometr jest rozpoznawany jako <c1/>, gdy ma tabelę <c2/> — <c3/> lub <c4/> w scenariuszu <c5/>, <c6/> w scenariuszu <c7/> (<c8/> zawiera taki, a dołączony gotowy scenariusz <c9/> zestawia akcelerometr CAI zdefiniowany fizycznie z kwarcowym akcelerometrem klasy nawigacyjnej w trakcie przerwy w GNSS) — z polami <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) oraz opcjonalnym <c19/> platformy. Jego PSD błądzenia losowego prędkości <c20/> jest następnie <b>wyprowadzane</b> z fizyki interferometru — dolna granica szumu śrutowego plus, gdy podano PSD drgań, składnik ograniczony drganiami dodany kwadraturowo — zamiast podawane jako współczynnik z karty katalogowej. Scenariusze bez bloku <c21/> są klasyczne i niezmienione co do bajta.

seg-51da20726ade = Efekty systematyczne Coriolisa (<c1/> / <c2/>) i przesunięcia światłem AC-Stark (<c3/>) są zaimplementowane i objęte testami jednostkowymi (równoważny bias Coriolisa jest sprawdzany względem klasycznego <c4/>; faza AC-Stark względem jej symetrycznego znoszenia). Przegląd dryfu względem czasu cyklu (<c5/>) podaje dryf położenia nawigacji zliczeniowej CAI względem czasu cyklu — obliczeniowy rdzeń porównania kwantowy kontra klasyczny. Rodzaj <c6/> używa tego samego akcelerometru przez <c7/>, a <c8/> zawiera arkusz parametrów z przedziałami (najlepszy, nominalny, zachowawczy) z cytowaniem przy każdej wartości.

seg-e2acbef44395 = Co pokazują kontrole zewnętrzne.

seg-353a2b2e1434 = <c1/> sprawdza funkcję przenoszenia względem numerycznej całki w dziedzinie czasu z funkcji czułości Cheineta, <c2/> względem opublikowanych długości fal linii, a bias Coriolisa względem <c3/> — dokładne zgodności z opublikowanymi postaciami. Dolna granica szumu śrutowego jest ograniczeniem jednostronnym: dla opublikowanych parametrów grawimetru cezowego Petersa i in. { "2001" } oraz rubidowego grawimetru GAIN Freiera i in. { "2016" } (arXiv:{ "1512.05660" }) modelowana dolna granica leży na poziomie osiągniętego szumu każdego urządzenia lub poniżej niego i w granicach trzech rzędów wielkości od niego (dla GAIN dolna granica wynosi { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz wobec osiągniętych { "9.6" }×{ "10" }⁻⁸, czyli około { "63" } razy więcej). Jest to spójne z tym, że rzeczywiste urządzenia są ograniczone drganiami lub względami technicznymi, ale to jest ograniczenie, a nie walidacja modelu szumu przyrządu, więc wiersz macierzy pozostaje MODELLED.

seg-82dffa95c0e8 = Pozostałe dalsze prace to efekty systematyczne związane z czołem fali i kierunkiem wiązki, rozwiązywanie niejednoznaczności prążków, numerycznie dokładne odtworzenie budżetów Monte Carlo CARIOQA-PMP oraz budżetów lotnych testów Boeing/AOSense bez GPS (GPS: Global Positioning System) (które wymagają opublikowanych PSD platform i SNR na jeden strzał, czyli stosunku sygnału do szumu), a także gotowy scenariusz porównania kwantowy kontra klasyczny w przeglądarkowym placu zabaw, oparty na <c1/>.

seg-2452f58aedf0 = <s1>Poprzednia</s1>Modele czujników kwantowych

seg-206d5a9704f0 = <s1>Następna</s1>API Pythona
