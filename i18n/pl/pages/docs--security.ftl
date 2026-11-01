# docs--security: translations (pl)

seg-4609cf7fb790 = Polityka bezpieczeństwa

seg-ff991a587e4b = Źródło: <c1/>

seg-7315b27c34f8 = Zgłaszanie podatności

seg-2f06a8b277b7 = Zgłoś ją prywatnie, jedną z dwóch dróg:

seg-31999fe1b838 = <b>Prywatne zgłaszanie podatności na GitHubie</b>: przycisk <em>Report a vulnerability</em> na <a1>karcie Security</a1> repozytorium. Zgłoszenie jest widoczne tylko dla opiekunów, a poprawkę można przygotować w prywatnym forku i opublikować jako GitHub Security Advisory.

seg-7bdcc2ffe39e = <b>E-mail</b>: <b><a1>contact@ashforde.org</a1></b>, ze szczegółami i krokami odtworzenia.

seg-fbc3db22c061 = Prosimy nie otwierać publicznego zgłoszenia (issue) w sprawie dotyczącej bezpieczeństwa. Staramy się potwierdzić odbiór w ciągu kilku dni roboczych.

seg-4c11dabdd8f6 = Obsługiwane wersje

seg-19c99cf3a67e = Przed 1.0: obsługiwane jest tylko najnowsze otagowane wydanie.

seg-1379eab9a8e3 = Bezpieczeństwo pamięci

seg-cf966fa35408 = Crate biblioteki deklaruje <c1/> w swoim korzeniu (<c2/>), więc blok <c3/>, fn, impl lub extern gdziekolwiek w bibliotece jest błędem kompilacji, a nie czymś, co musi wychwycić recenzent. Atrybut nie jest za <c4/>, więc dotyczy każdej konfiguracji, w której biblioteka jest dostarczana, i wszystkie trzy kompilują się bez ostrzeżeń: domyślna kompilacja Rust, moduł rozszerzenia Pythona (<c5/>) i moduł WebAssembly (<c6/>).

seg-3f9e707e7d0b = Zakres, podany precyzyjnie, ponieważ <c1/> działa dla każdego crate z osobna:

seg-e7e22e711c53 = Obejmuje wyłącznie crate biblioteki. Plik binarny CLI (<c1/>), pomocnicze pliki binarne w <c2/>, osobno publikowany crate <c3/> oraz wyłączone z przestrzeni roboczej crate walidacji krzyżowej <c4/> to osobne korzenie crate i nie są nim objęte. Żaden z nich dziś nie zawiera <c5/>, ale to dyscyplina, a nie właściwość wymuszana przez kompilator.

seg-b8f1e374d873 = Nic nie mówi o zależnościach. Te są bramkowane osobno przez <c1/> w CI, dla głównego crate i, jako osobne zadanie, dla wyłączonego z przestrzeni roboczej crate serwera MCP, a ponadto obserwowane przez alerty Dependabot i aktualizacje bezpieczeństwa w repozytorium.

seg-df3008a05522 = Uwaga o kontroli eksportu i podwójnym zastosowaniu

seg-0782e60d11fa = Odporność PNT i czujniki kwantowe mogą podlegać kontroli eksportu towarów podwójnego zastosowania. To publiczne repozytorium ogranicza się do ogólnych, opublikowanych modeli i metod. Nie przekazuj tu szczegółów odporności ani ochrony przed spoofingiem wrażliwych eksportowo; należą do prywatnej nakładki. W razie wątpliwości najpierw napisz e-mail.

seg-f6bb0582f6f2 = <s1>Poprzednia</s1>Licencjonowanie

seg-834cbd4e96d3 = <s1>Następna</s1>Współtworzenie
