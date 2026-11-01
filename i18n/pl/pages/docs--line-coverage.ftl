# docs--line-coverage: translations (pl)

seg-31d58f23c0a2 = Uruchom

seg-08994a4765be = Zakres

seg-a6eaa5a5d095 = Źródło: <c1/>

seg-d4e29eac0ab3 = Pokrycie linii — pomiar wiążący

seg-931a2a7e9022 = „~{ "95" } % pokrycia linii” na plakietce README, w tabeli CI (ciągła integracja) w README, na stronach głównych crates.io i PyPI (Python Package Index), na stronie pokrycia linii kshana.dev oraz w raporcie technicznym to <b>ten</b> pomiar, zaokrąglony do najbliższego pełnego procenta. <c1/> kończy się niepowodzeniem, jeśli którakolwiek z tych sześciu powierzchni podaje inną wartość niż zapisana poniżej, więc następny ponowny pomiar przesuwa je wszystkie razem albo żadnej.

seg-f3526b0d95f8 = Zmierzono

seg-6f8d24ecb89f = — { "55,970" } z { "58,697" } linii

seg-03065c20d4d8 = Commit

seg-d734cdb77d70 = <c1/> (silnik { "0.29.0" }, tag <c2/>)

seg-a2af6144b6a0 = GitHub Actions, zadanie <c1/> <c2/>, przebieg { "36809850252" }, 2026-10-01

seg-b88a2a9497c2 = Narzędzie

seg-f2f07088027a = <c1/> (instrumentacja źródłowa LLVM)

seg-a3223ee99178 = <c1/>, z wyłączeniem generowanych tabel danych <c2/> i cienkiego punktu wejścia CLI (interfejsu wiersza poleceń) <c3/>; <c4/> i <c5/> nie są mierzone

seg-894b740fd381 = Artefakt

seg-1d6c540fd916 = <c1/> (<c2/>, { "290" } plików źródłowych) dołączony do tego przebiegu

seg-17f916216c92 = Próg minimalny

seg-32861ca47b0c = to samo zadanie kończy się niepowodzeniem poniżej <c1/> (<c2/>) — próg minimalny jest egzekwowany przy każdym pushu; powyższa wartość jest zapisem, nie bramką

seg-63b9b152cde7 = Polecenie, dosłownie z <c1/>:

seg-121c43cf260f = Każdy push do <c1/> ponownie uruchamia zadanie i dołącza nowy <c2/>. Aby zmienić opublikowaną wartość, pobierz artefakt z zielonego przebiegu i zsumuj go:

seg-b566e95a74ab = następnie zaktualizuj tabelę powyżej i sześć powierzchni w tym samym commicie; test synchronizacji dokumentacji wskaże każdą pominiętą.

seg-6935c9c381b3 = Historia

seg-daa9ae1913cd = Wartość została zmierzona ponownie, a nie przepisana: { "95.63" } % dla commitu <c1/> (silnik { "0.27.2" } + niewydane zmiany, przebieg { "35934579709" }, 2026-09-24, { "37,697" } z { "39,419" } linii, opublikowana jako ~{ "96" } %), skorygowana do { "95.35" } % dla { "0.29.0" } (powyżej), co po zaokrągleniu daje ~{ "95" } %: kod urósł o { "19,278" } mierzonych linii, a nowe linie są pokryte nieco słabiej niż stare; { "95.85" } % dla { "v0.17.0" } (commit <c2/>, 2026-06-14, opublikowana jako ~{ "96" } %) oraz ~{ "97" } % w dwóch wcześniejszych notach wydania (<c3/>, pozostawionych jako historia). <c4/> mówił „blisko { "97" } %”, dopóki nie został dostosowany do tego zapisu; jest to teraz szósta powierzchnia, którą test przypina.

seg-b2dbaf3a3b68 = <s1>Poprzednia</s1>Standardy i interoperacyjność

seg-508de3808e04 = <s1>Następna</s1>Pakiety dowodowe
