# docs--standards: translations (uk)

seg-4a2ce9f33ab2 = запис

seg-9120d3e96e5e = читання

seg-5ad814c7ef9e = Примітки

seg-aab745a65e76 = Модуль

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = Кадр

seg-32b620b3574e = Використання

seg-8ba331635865 = Стандарти та сумісність

seg-014d1392018e = Чесні межі застосування

seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF і текст навігаційного повідомлення LEO <b>читаються і записуються</b>; OMM, CZML, KML та ефемериди STK лише <b>записуються</b> (читання OMM і серіалізація XML — подальші роботи); GeoJSON записується і зчитується назад як маршрут; RINEX NAV, RINEX OBS, IONEX, продукти IERS EOP і TLE лише <b>читаються</b>; експорт LunaNet/IOAG для Місяця лише записується, а його метадані часу проходять круговий обмін без втрат. <a1><c1/></a1> перелічує, який експорт застосовний до кожного вбудованого сценарію.

seg-68b4f5116419 = Зіставлення полів CCSDS/IGS вище є документацією, а не твердженням, що будь-який стандарт виконано; формальна оцінка за цими стандартами (і реєстрація у відкритому каталозі ESA (European Space Agency, Європейське космічне агентство) ESSR (European Space Software Repository) / NASA (National Aeronautics and Space Administration)) відстежується окремо й очікує розгляду.

seg-e461587ad2cf = Незалежна числова перехресна перевірка редукції систем відліку за допомогою SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — інструментарій планетарної геометрії на чистому Rust) міститься в окремому крейті <c1/>, виключеному з робочого простору: <c2/> порівнюється з обертанням ANISE від GCRF (Geocentric Celestial Reference Frame) до ITRF93 (International Terrestrial Reference Frame { "1993" }) на вісьмох епохах { "2020" }–{ "2023" } і збігається до ≤ { "0.86" } м на земній поверхні та до ≤ { "3.6" } м на орбіті GNSS (див. <a1><c3/></a1>). Вона потребує ядер SPICE, тому не є типовою перевіркою безперервної інтеграції (CI).

seg-f6d67027d669 = <s1>Назад</s1>Карта можливостей

seg-01b6270b6c6a = <s1>Далі</s1>Покриття рядків
