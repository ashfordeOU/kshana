# docs--compliance: translations (pl)

seg-f65b1f2b4182 = Tryb

seg-e19db3d5273b = Źródło: <c1/>

seg-045b24defdbb = Mapa compliance integralności DO-316 / DO-229E

seg-9100800daa1c = Ten dokument odwzorowuje wymagania RTCA (dawniej Radio Technical Commission for Aeronautics) <b>DO-229E</b> (SBAS (satellite-based augmentation system, satelitarny system wspomagania) MOPS (minimum operational performance standards, minimalne wymagania eksploatacyjne)) i <b>DO-316</b> (pokładowe urządzenia GPS/SBAS (GPS: Global Positioning System)) dotyczące poziomów ochrony i monitorowania integralności na funkcje { -brand }, które je realizują. Jest to <b>inżynieryjna pomoc w śledzeniu zależności</b>, a nie oświadczenie, że jakiekolwiek wymaganie jest spełnione — { -brand } implementuje opublikowane algorytmy; nie jest zatwierdzoną awioniką.

seg-0e6ec5617eb5 = Postać czytelna maszynowo to <a1><c1/></a1>; ten tekst jest jej uzupełnieniem (odzwierciedla <a2><c2/></a2>).

seg-d5d7a2ec9c73 = Poziomy ochrony metodą ważonych najmniejszych kwadratów (DO-229E Appendix J)

seg-0dc19f403f5e = Dla każdego satelity <em>i</em> o elewacji <c1/> i azymucie <c2/> względem użytkownika wiersz obserwacji w układzie lokalnym (ENU (east-north-up) + zegar) ma postać

seg-6415f7f28e7e = z wagą <c1/>, <c2/> (budżet UDRE (user differential range error) / GIVE (grid ionospheric vertical error) / pokładowy / troposferyczny). Kowariancja pozycji to <c3/>; jej blok ENU daje poziomy i pionowy poziom ochrony (HPL, VPL):

seg-ea574448bda4 = { -brand } oblicza <c1/> przez odwracanie macierzy normalnej { "4" }×{ "4" } tą samą procedurą, której używa stos RAIM (receiver autonomous integrity monitoring) (<c2/>), i sprawdza wynik na dwa sposoby (droga kowariancyjna <c3/> i droga rzutowania <c4/> muszą się zgadzać), a ponadto względem niezależnej geometrii odniesienia numpy <c5/>.

seg-f63dd3d7aad4 = Źródło

seg-268ae5b25684 = Lot po trasie → NPA (podejście nieprecyzyjne; tylko w poziomie)

seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

seg-dbae96c75a06 = Podejście precyzyjne

seg-1bfafdcf6ab0 = DO-229E MOPS

seg-1922c53b8340 = Uwaga o rzetelności: MOPS używa zaokrąglonej stałej poziomej <c1/>; dokładny dwustronny kwantyl normalny <c2/> wynosi <c3/>. { -brand } używa w kodzie opublikowanej wartości { "6.0" } i wyprowadza <c4/> z tej samej funkcji <c5/>, której używa stos RAIM, co jest niekołową kontrolą krzyżową (wartość zaokrągla się do { "5.33" } z MOPS).

seg-ef191c1d3db1 = Dwuczęstotliwościowa kombinacja L1/L5 wolna od wpływu jonosfery (IS-GPS-705)

seg-b69825ef05d3 = Dla <c1/>, <c2/>, <c3/>:

seg-ce81c6b71738 = Opóźnienie jonosferyczne pierwszego rzędu (<c1/>) znosi się dokładnie — sprawdzone względem niezależnej fizyki <c2/> silnika dla zakresu TEC (total electron content, całkowita zawartość elektronów). Wzmocnienie szumu dla danych wejściowych o równej wariancji wynosi <c3/>.

seg-e111fb05a7c6 = <b>W repozytorium, automatycznie</b> (przy każdym zatwierdzeniu): współczynniki K względem ich definicji rozkładowych, <c1/> oraz współczynniki kombinacji wolnej od jonosfery (IF) względem częstotliwości IS-GPS-705 (IS: Interface Specification), znoszenie jonosfery pierwszego rzędu względem niezależnej fizyki opóźnienia oraz poziomy ochrony metodą ważonych najmniejszych kwadratów (WLS) względem geometrii odniesienia numpy <c2/> (<c3/>).

seg-f30d84abe275 = <b>Zewnętrzna wyrocznia, automatycznie</b> (<c1/>): przy danej elewacji, azymucie i całkowitym 1-σ każdego satelity <c2/> odtwarza HPL niezależnej implementacji, <c3/> w forku RTKLIB (otwartoźródłowa biblioteka pozycjonowania kinematycznego w czasie rzeczywistym) dla poziomów ochrony SBAS <c4/> (Siki & Takács { "2017" }), dla sześciu epok, które to narzędzie obliczyło z <b>rzeczywistych komunikatów EGNOS (European Geostationary Navigation Overlay Service)</b> (geostacjonarny PRN (numer kodu pseudolosowego) { "120" }) i rzeczywistych obserwacji RINEX (Receiver Independent Exchange Format) ze stacji BUTE w Budapeszcie (2017-02-19), z dokładnością do <b>< { "2e-3" } m</b>. Wyrocznia zaokrągla K_V do { "5.33" }, więc składową pionową porównuje się bez współczynnika K, jako <c5/> względem jej VPL / { "5.33" }. ESA (European Space Agency) gLAB { "v6.0.0" } (<c6/>) używa tego samego wzoru.

seg-389e8a57e3e8 = <b>Nie zrobiono</b>: σ dla poszczególnych satelitów pochodzi od samej wyroczni; modelowanie σ z surowych komunikatów UDRE/GIVE wykracza poza zakres i żaden oficjalny opublikowany produkt poziomów ochrony WAAS (Wide Area Augmentation System) ani EGNOS nie został odtworzony od początku do końca. Same DO-229E/DO-316 są objęte płatnym dostępem RTCA; otwartym źródłem wyprowadzenia są strony ESA Navipedia o SBAS ICAO/EGNOS (ICAO: International Civil Aviation Organization).

seg-7686fb3d3e0c = <s1>Poprzednia</s1>Odniesienie ARAIM

seg-0457ef382fb0 = <s1>Następna</s1>Tabela przekładowa odporności
