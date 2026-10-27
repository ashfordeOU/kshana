# docs--hardware-safety: translations (pl)

seg-fdbb9db68f1d = brak

seg-2015f437e669 = Źródło: <c1/>

seg-10c7eaab58c5 = Bezpieczeństwo sprzętu: co { -brand } robi ze sprzętem, a czego nigdy nie robi

seg-fe4873962140 = <b>Status: oczekuje na przegląd prawny przez właściciela.</b> Poniższe uwagi prawne to odczyt publicznych źródeł dokonany przez opiekunów, spisany po to, by użytkownik wiedział, gdzie leżą granice. Nie są poradą prawną, nie były sprawdzane przez radcę prawnego, a prawo różni się w zależności od kraju. Należy je czytać jako powód, by zapytać prawnika, a nie jako zezwolenie.

seg-bd2fbb355834 = { -brand } to oprogramowanie wyłącznie doradcze do badań, symulacji i testów. Nie jest to sprzęt z zatwierdzeniem typu i nie ocenia ani nie zatwierdza odbiornika, zegara ani laboratorium. Zob. oświadczenie doradcze w README.

seg-f27c286787b1 = Zasada

seg-88638e41faab = Produktem jest odbiór. Nadawanie nigdy nie wchodzi w skład otwartego silnika.

seg-614d381dd0d0 = { -brand } nie zawiera żadnego kodu sterującego nadajnikiem. Nie ma ścieżki nadawczej SDR (żadnego wywołania nadawania UHD, HackRF, bladeRF ani Soapy) i żaden przebieg zagłuszający lub spoofingowy nie jest zapisywany do pliku przeznaczonego do odtwarzania.

seg-2e370a1c6c4c = Pliki zapisywane przez { -brand } (sceny IQ, nagrania SigMF i ION <c1/>, eksporty NMEA i bench) opisują <b>symulowane, legalne</b> sygnały lub ruch, a metadane zapisywane przez { -brand } dla sceny podają, że została zapisana przez <c2/> (komentarz ION <c3/> mówi, że jest to scena symulowana, a nie nagranie).

seg-8ce652bc1af6 = Gdy eksperyment wymaga RF na stanowisku bench, wytwarza go <b>własny sprzęt operatora</b>, we własnej obudowie operatora, na podstawie własnego upoważnienia operatora. { -brand } zapisuje to, co według operatora zostało zrobione, i niczego nie wnioskuje.

seg-c74fc5d82071 = Etapy

seg-01e7633921dc = Każdy etap podaje, co robi { -brand }, jaki sprzęt jest zaangażowany, kto emituje RF (jeśli ktokolwiek) oraz bramkę, która musi być spełniona, zanim { -brand } uzna wynik za dowód.

seg-324e16b11186 = Etap

seg-bb269645d988 = Rola { -brand }

seg-76c0861cbe83 = Sprzęt

seg-92ab27525ed1 = Emisja RF

seg-c822f981cfcf = Bramka

seg-00727bb577f9 = Stan w { "0.38" }

seg-1c566ec98a03 = Pliki: dzienniki odtwarzania, IQ, eksporty bench, NMEA lub UBX na żywo przez stdin, TCP lub UDP

seg-0435986aa760 = dostarczone

seg-56b9a4399108 = Odbiór pasywny: odbiorniki tylko do odczytu; dzienniki czasu (linuxptp, chrony, TICC); CSV z IMU; <c1/> na rosnącym pliku SigMF

seg-608fc0a99107 = odbiorniki użytkownika, grandmaster, SDR w trybie odbioru

seg-786d9e5ccf93 = każdy zapis konfiguracji do odbiornika wymaga jawnego <c1/>; domyślnie jest tylko do odczytu

seg-ab8874046283 = częściowo dostarczone: formaty dzienników czasu, <c1/>, <c2/>; szeregowe wejście odbiornika jest planowane

seg-6b0a194d3f64 = Orkiestracja laboratorium bez RF z { -brand }: specyfikacja warunków testu, kroki operatora (odłączenie anteny, uruchomienie symulatora) podpowiadane i opatrywane znacznikiem czasu, punktacja w obie strony i dowody

seg-8e2847bce9ac = symulatory należące do laboratorium, ekranowane skrzynki

seg-121fe22c92ec = wyłącznie przez symulator <b>laboratorium</b>, przewodowo

seg-0a704c5443c5 = podpisane <c1/> (poniżej) zapisane w pakiecie dowodowym; { -brand } odmawia punktowania przebiegu laboratoryjnego bez niego

seg-9e94d44cd197 = zapis jest zaimplementowany w pakietach dowodowych; odmowa punktowania bez niego jeszcze nie (nie istnieje polecenie przebiegu laboratoryjnego)

seg-ee5333e346ad = Przewodowe odtwarzanie <b>legalnych</b> scen IQ GNSS: { -brand } zapisuje plik sceny, a użytkownik odtwarza go własnym narzędziem do kabla z tłumikami i badanego urządzenia w obudowie RF

seg-fa5b0f1b41f7 = SDR, tłumiki i obudowa użytkownika

seg-9049203a2a6e = wyłącznie przewodowo, odpowiedzialność użytkownika

seg-b4392e583cb8 = brak kodu nadawczego w otwartym silniku; przebiegi zakłóceń i spoofingu pozostają poza zakresem; przegląd pod kątem kontroli eksportu; radca prawny

seg-ced2afbf108f = nie w otwartym silniku; pozycja edycji komercyjnej do zrealizowania z radcą prawnym

seg-0f8a0fce4d20 = Sprzęt w pętli RF w czasie rzeczywistym, z zamkniętą pętlą

seg-d109f8e36ce8 = sprzęt partnera

seg-fb26b352f56e = partner

seg-38c768d5faa7 = zamiast tego integrować przez specyfikację etapu { "2" }

seg-458f37b807ba = nie jest planowane

seg-2e59d363e31b = „Dostarczone” oznacza, że kod jest w tym wydaniu. Nic w tej tabeli nie mówi, że jakikolwiek etap został użyty z jakimkolwiek partnerem, laboratorium lub organem; żaden nie został.

seg-1524fb5b0aba = Zasady

seg-82b8ed15bbe6 = Produktem jest odbiór, a nadawanie nigdy nie wchodzi w skład otwartego kodu.

seg-63c000eccfc2 = Każda sesja ze sprzętem daje pakiet dowodowy ze skrótami danych wejściowych, warunków i użytych progów.

seg-63cc5d9513ff = Poświadczenie przewodowe lub ekranowane jest zapisywane, nigdy wnioskowane.

seg-da1e4f5da956 = Liczby pochodzące ze sprzętu pozostają <b>MODELLED</b>, dopóki niezależna wyrocznia zewnętrzna się z nimi nie zgodzi (na przykład laboratoryjna trajektoria wzorcowa lub zegar odniesienia). Próg zarejestrowany z góry nie jest luzowany po przebiegu.

seg-d8e445427d02 = Anteny o kontrolowanej charakterystyce, jednostki inercjalne i atomowe zegary w skali układu scalonego traktuje się jako źródła danych (charakterystyki, dzienniki, opublikowane krzywe stabilności), a nie jako urządzenia, którymi { -brand } steruje.

seg-7a22a9591fa3 = Sformułowanie: wynik jest „zmierzony względem maski” albo „dostarcza dowodów na (supports evidence for)” wymaganie. { -brand } nie twierdzi, że urządzenie spełnia normę, i nikt go nie ocenił ani nie zatwierdził.

seg-913509e5d6b2 = Uwagi prawne (przegląd prawny przez właściciela oczekuje)

seg-c18b68936406 = Odbiór sygnałów GNSS jest legalny niemal wszędzie. Nadawanie w pasmach GNSS nie jest.

seg-070d8a8d5494 = <b>Stany Zjednoczone.</b> Umyślne zakłócanie łączności radiowej jest zakazane na mocy { "47" } U.S.C. §{ "333" }, a FCC egzekwuje przepisy wobec zagłuszarek (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Transmisja ze stanowiska bench może sięgnąć poza to stanowisko.

seg-336b48c6f5f2 = <b>Gdzie indziej.</b> Opiekunowie nie przeglądali prawa innych krajów. Społeczność wokół gps-sdr-sim stwierdza, że nadawanie jego wyniku jest w większości krajów zabronione prawem; należy to przyjąć jako założenie robocze wszędzie tam, gdzie radca prawny nie powiedział inaczej.

seg-8d31cbd38718 = <b>Układ ekranowany lub przewodowy to zabezpieczenie, a nie licencja.</b> Poniższe poświadczenie zapisuje zabezpieczenie, które według operatora było zastosowane. Nie czyni ono żadnej emisji zgodną z prawem.

seg-7373bfd21035 = <b>Nagrywanie.</b> Nagrywanie sygnałów radiowych może w niektórych miejscach rodzić pytania o prywatność i legalność. <c1/> i każda recepta na przechwytywanie służą wyłącznie do odbioru, a operator odpowiada za to, gdzie i co nagrywa.

seg-2edf9b14e62c = <b>Kontrola eksportu.</b> Oprogramowanie sprzętu w pętli, które steruje generatorami sygnału, może podlegać przepisom o kontroli eksportu. Dlatego etap { "3" } leży poza otwartym silnikiem.

seg-bcd59f201022 = <b>Nic tutaj nie jest poparciem ani umową.</b> Żaden regulator, poligon testowy, laboratorium ani dostawca nie był konsultowany w sprawie tego dokumentu ani nie zgodził się na cokolwiek w nim zawartego.

seg-81091020e648 = Pole <c1/>

seg-64918fd6895d = Dla etapu { "2" } i wyższych przebieg z udziałem sprzętu laboratoryjnego zawiera obiekt <c1/>, zapisany w pakiecie dowodowym obok skrótów danych wejściowych. To oświadczenie wskazanego operatora, a nie pomiar, i { -brand } go nie weryfikuje.

seg-3bf153c63fa3 = Co jest zaimplementowane w { "0.38" }:

seg-bf212e141046 = <c1/> sprawdza plik i zapisuje poświadczenie w <c2/> pakietu. Manifest jest objęty podpisem Ed25519 pakietu, więc zapisu nie można edytować bez złamania weryfikacji. To samo jest dostępne jako argument <c3/> w Pythonowym <c4/> i argument <c5/> w narzędziu MCP <c6/> (kompilacja przeglądarkowa nie tworzy pakietów).

seg-431036f13a37 = Pakiet wykonany bez poświadczenia jest bajt po bajcie taki, jaki był wcześniej.

seg-4360b8fbdafb = <c1/> podaje poświadczenie i mówi, że jest ono „attested by the named operator; not verified by Kshana”.

seg-438bbe788314 = Poświadczenie niekompletne lub takie, w którym <c1/> nie ma wartości <c2/> ani <c3/> (układ drogą radiową nie jest akceptowany jako przebieg laboratoryjny), jest odrzucane i pakiet nie powstaje.

seg-c8c40ed88dde = Czego <b>jeszcze nie</b> zaimplementowano: reguły etapu { "2" }, że { -brand } odmawia <em>punktowania</em> przebiegu laboratoryjnego bez poświadczenia. W { "0.38" } żadne polecenie nie przyjmuje flagi przebiegu laboratoryjnego, więc nie ma czego odrzucać; reguła pojawi się wraz z poleceniami orkiestracji laboratorium. Poświadczenie zapisuje oświadczenie operatora o zabezpieczeniu. Nie czyni żadnej emisji zgodną z prawem i nie zmienia etykiety wyniku: punktowany przebieg laboratoryjny jest MODELLED, chyba że zgodzi się z nim wyrocznia zewnętrzna.

seg-b0db377bce58 = Co to oznacza dla współtwórcy

seg-c2e215edd86c = Nie dodawaj do otwartego silnika ścieżki nadawczej, zależności nadawczej ani przykładu nadawania.

seg-452b44a9ca8a = Nie dodawaj generatora przebiegów, którego wynikiem jest sygnał zagłuszający lub spoofingowy przeznaczony do odtwarzania.

seg-4df4d15a5f1c = Nowe wejścia sprzętowe są domyślnie tylko do odczytu; zapis wymaga jawnej flagi i wiersza w tym pliku.

seg-ee5f1fa9b822 = Nowe polecenie, które dotyka sprzętu, trafia na każdą powierzchnię albo jest oznaczone N/A z uzasadnieniem w <a1><c1/></a1>, i wskazuje tutaj swój etap.

seg-7d65c3565acd = <s1>Poprzednia</s1>Formaty dzienników zegara

seg-82eb53d4efbd = <s1>Następna</s1>Integralność i bezpieczeństwo

seg-8a78e520fc9e = Pole lab-attestation
