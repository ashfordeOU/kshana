# docs--kind-leo-pvt: translations (uk)

seg-7f5ad6ab8c23 = GPS

seg-cb91473bfdda = Тематична сторінка: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Тематична сторінка: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Вид сценарію рушія v{ $version }, родина <a1>Навігація на низькій навколоземній орбіті</a1>. Лише консультативно: результат аналізу від дослідницького та інженерного інструмента; це не навігаційне обладнання із затвердженням типу і не послуга забезпечення безпеки життя. Кожна позначка тут — від рушія або матриці верифікації; вид має рівень MODELLED, якщо матриця не каже іншого (як здобувається позначка: розділ «Докази» в README).

seg-c5478f572d21 = Сторінка родини: <a1>Навігація на низькій навколоземній орбіті</a1>

seg-be21370c2446 = joint

seg-dfe64e82e4e9 = Джерело: <c1/>

seg-fdba999dab11 = <c1/> (вид сценарію)

seg-f34d4bbcac4d = Один прогін <c1/> підсумовується так: LEO PVT (joint) at { "61.10" }, { "6.60" } over { "1800" } s GPS gnss { "24" } sats at { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sats at { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sats at { "1080" } km, { "1190.52" } MHz LEO ranging satellite in view on { "100.0" }% of epochs GNSS only availability { "1.000" }, median PDOP { "1.48" }, RMS 3D error { "1.29" } m LEO only availability { "1.000" }, median PDOP { "2.33" }, RMS 3D error { "0.69" } m fused availability { "1.000" }, median PDOP { "1.14" }, RMS 3D error { "0.63" } m

seg-e271a69236bf = Необов'язкові поля: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-f850cba7d96e = Приклад <c1/> задає, зокрема:

seg-bb3b3e8be839 = fjord

seg-99a3c57c7926 = Цей вид використовують { "7" } вбудованих сценаріїв; решта — у <a1><c1/></a1>.

seg-b43a7ee40372 = Позначка результату (від рушія): MODELLED спільне позиціонування за псевдодальностями методом зважених найменших квадратів з одним годинником на систему або відомим зміщенням; шум із моделі петлі захоплення затримки за огинною C/N0 плюс похибка дальності в сигналі в просторі

seg-90361a6f4e3c = Діаграма, яку рушій записує для scenarios/leo-pvt-fjord-skyline.toml, вид leo-pvt

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: рядки <a1>матриці верифікації</a1>, що згадують цей вид.

seg-68aa305e05a4 = <b>VALIDATED</b> Точна швидкість зміни дальності супутника, чиї положення та швидкість у системі, зв'язаній із Землею, походять із двотільної орбіти зі світським дрейфом J2 та обертанням Землі (leo_fusion::geom::EarthOrbit::state, швидкість — точна похідна положення за часом), Тести: <a1>leo_doppler_reference.rs</a1>.

seg-c3ef3e0163f2 = <b>MODELLED</b> Пакетне позиціонування за Гауссом–Ньютоном зі швидкості зміни дальності з аналітичними похідними (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), сталою швидкістю користувача як опцією, псевдовимірюванням висоти для наземного користувача, демпфований Тести: <a1>leo_fusion_scenarios.rs</a1>.

seg-a4e0166269ea = <b>MODELLED</b> Зважені фіксації за Гауссом–Ньютоном методом найменших квадратів за будь-якою сумішшю систем, один годинник приймача на систему (міжсистемне зміщення оцінюється разом із положенням) або відоме транслюване зміщення на опорній шкалі часу; сигми кожного вимірювання задаються Тести: <a1>leo_fusion_scenarios.rs</a1>.

seg-5c9f826efbc8 = <b>MODELLED</b> Вимірювання годинника з кожного супутника LEO в полі зору у відомому положенні, поєднані за зворотною дисперсією з моделі шуму псевдодальності, відфільтровані двостанним (фаза, частота) фільтром Калмана, шум процесу якого — це w класу генератора Тести: <a1>leo_fusion_scenarios.rs</a1>.

seg-3319b18ac61f = і ще { "1" } у матриці.

seg-f6bd93155e41 = <b>MODELLED</b> Зважені фіксації за Гауссом–Ньютоном методом найменших квадратів за будь-якою сумішшю систем, один годинник приймача на систему (міжсистемне зміщення оцінюється разом із положенням) або відоме. Оракул (InternalConsistency): Виведений вручну DOP для чотирьох супутників (один супутник у зеніті та три на горизонті з розносом { "120" } град, нормальна матриця яких інвертується вручну), структурна тотожність, що система з власним годинником і одним супутником не додає геометрії, безшумове відновлення положення, годинника та зміщення і зерновані (seeded) похибки відносно коваріації. Лише внутрішні перевірки; не порівнювалося з виходом приймача. { "0.30" } зовнішнє порівняння, знахідка

seg-4056b0470099 = <b>MODELLED</b> Система-агностичні входи: кожна система — це оболонки Walker, явні елементи або пресет GNSS, сигнал (несівна, швидкість чипів, смуга, прийнята потужність або діапазон C/N0. Оракул (InternalConsistency): Перенесення наведених відкритих значень, перевірене на структуру (кожне відкрите джерело має URL, шаблони Walker діляться рівно, C/N0 з прийнятої потужності над kT при { "290" } K), а не відносно зовнішнього оракула. Репрезентативні значення названо в кожному пресеті, і вони ілюстративні

seg-df745ccdaceb = MODELLED спільне позиціонування за псевдодальностями методом зважених найменших квадратів з одним годинником на систему або відомим зміщенням; шум із моделі петлі захоплення затримки за огинною C/N0 плюс похибка дальності в сигналі в просторі (результат <c1/>)

seg-c988291eb41d = MODELLED: усе інше; DOP перевірено на виведеному вручну випадку, фіксації — за їхньою коваріацією, а модель Доплера — за тотожністю прискорення дальності. (каталог видів (<c1/>))

seg-1d0ab26930e1 = Спільне позиціонування GNSS і LEO за псевдодальностями з міжсистемними зміщеннями та моделями похибок для кожного сигналу має рівень MODELLED, його не перевірено за незалежним еталоном: звірено з власною замкненою / аналітичною тотожністю — це виявляє помилки перенесення та коефіцієнтів, але не є зовнішнім оракулом. (матриця верифікації (docs/MODELLED-RATIONALE.md))

seg-35916a8ac93e = Іменовані системи LEO PNT як необов'язкові пресети даних, кожна з власним джерелом, мають рівень MODELLED, їх не перевірено за незалежним еталоном: звірено з власною замкненою / аналітичною тотожністю — це виявляє помилки перенесення та коефіцієнтів, але не є зовнішнім оракулом. (матриця верифікації (docs/MODELLED-RATIONALE.md))

seg-6ac7dcc57b2a = <s1>Назад</s1>leo-ppp

seg-458b3eda3250 = <s1>Далі</s1>leo-signal

seg-b054c73f22e5 = немає значення

# words to translate: REPRESENTATIVE
# EN: The skyline preset is REPRESENTATIVE (provenance in docs/SKYLINE.md and <c1/>): the order of the width and relief of the deep west-Norwegian fjords, not a survey of any fjord. Line of sight only: no diffraction, reflection or non-line-of-sight reception. Remove the [skyline] section to compare with open sky. MODELLED. (scenario file comment, lines { "15" } to { "18" })
seg-be908356ad19 = Пресет skyline має рівень РЕПРЕЗЕНТАТИВНИЙ (походження в docs/SKYLINE.md та <c1/>): порядок ширини й рельєфу глибоких західнонорвезьких фіордів, а не зйомка будь-якого фіорду. Лише пряма видимість: без дифракції, відбиття чи прийому поза прямою видимістю. Приберіть розділ [skyline], щоб порівняти з відкритим небом. MODELLED. (коментар у файлі сценарію, рядки { "15" }–{ "18" })

# words to translate: WORKSHOP, PUBLIC, DERIVED
# EN: Fused medium-Earth-orbit (MEO) and low-Earth-orbit (LEO) positioning, navigation and timing (PNT) over ANY constellations: each [[system]] is a GNSS preset of the constellation-design kind, a LEO preset (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, the atomic-zero-clock ephemeris model, or another preset file, each in its own file with its sources marked PUBLIC, WORKSHOP or DERIVED), Walker shells or explicit element sets, with a carrier, a chip rate, a carrier-to-noise density (C/N0) envelope from the elevation mask to the zenith, a signal-in-space range error (SISRE), a Doppler sigma and a clock model (its own receiver clock, so the inter-system bias is estimated, or a known broadcast offset). Four modes. DOPPLER: batch Gauss-Newton positioning from range rate with analytic partials, clock-drift and optional velocity states and an optional height constraint, single- or multi-satellite, the error against window length, the Doppler, Doppler-rate and jerk envelope of each LEO system, and the single-pass along-track and cross-track accuracy against the cross-track offset (the cross-track error grows without bound as the pass goes overhead; a single pass also has a mirror solution across the ground track). A Doppler-only signal of opportunity (starlink-sop) runs here. JOINT: per-epoch weighted least-squares pseudorange fixes from GNSS alone, LEO alone and both, per-measurement sigmas from a delay-lock-loop thermal-noise model at C/N0 plus the SISRE (or a fixed sigma, so a signal model can feed them), the estimated inter-system biases, and PDOP/HDOP/VDOP against the number of LEO satellites added. POLAR: satellites in view and DOP against latitude for GNSS, LEO and both. TIMING: time transfer to Coordinated Universal Time (UTC) from LEO satellites at a known position with a two-state clock filter whose process noise comes from the engine's oscillator classes, against C/N0 and the oscillator, and the IS-GPS-200 system-time-to-UTC expression; with [timing] trace = true every row also reports its time error and predicted sigma at every epoch. VALIDATED: the largest Doppler of an overhead-to-horizon pass against the published Iridium (up to { "36" } kHz) and Xona Pulsar X1 ({ "32" } to { "34" } kHz) figures. MODELLED: everything else; the DOP is checked against a hand-derived case, the fixes against their covariance, and the Doppler model against the range-acceleration identity.
seg-093aac4b5ff1 = Об'єднане позиціонування, навігація та час (PNT) на середніх (MEO) і низьких (LEO) навколоземних орбітах для БУДЬ-ЯКИХ угруповань: кожна [[system]] — це пресет GNSS виду constellation-design, пресет LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, модель ефемерид нульового годинника atomic або інший файл пресета, кожен у власному файлі з джерелами, позначеними ПУБЛІЧНИМИ, СЕМІНАРСЬКИМИ або ВИВЕДЕНИМИ), оболонки Walker або явні набори елементів, з несівною, швидкістю чипів, огинною відношення несівної до густини шуму (C/N0) від маски кута місця до зеніту, похибкою дальності в сигналі в просторі (SISRE), сигмою Доплера та моделлю годинника (власний годинник приймача, тож міжсистемне зміщення оцінюється, або відоме транслюване зміщення). Чотири режими. ДОПЛЕР: пакетне позиціонування за Гауссом–Ньютоном зі швидкості зміни дальності з аналітичними похідними, станами дрейфу годинника та необов'язковими станами швидкості й необов'язковим обмеженням висоти, за одним або кількома супутниками, похибка залежно від довжини вікна, огинна Доплера, швидкості зміни Доплера та ривка для кожної системи LEO, а також уздовж- та поперек-трекова точність одного проходу залежно від поперечного зсуву (поперек-трекова похибка необмежено зростає, коли прохід іде над головою; один прохід має також дзеркальний розв'язок через трасу на поверхні). Сигнал можливості лише з Доплером (starlink-sop) запускається тут. СПІЛЬНИЙ: пошагові зважені фіксації псевдодальності за найменшими квадратами лише з GNSS, лише з LEO та з обома, сигми кожного вимірювання з моделі теплового шуму петлі захоплення затримки за C/N0 плюс SISRE (або фіксована сигма, щоб сигнальна модель могла їх живити), оцінені міжсистемні зміщення та PDOP/HDOP/VDOP залежно від кількості доданих супутників LEO. ПОЛЯРНИЙ: супутники в полі зору та DOP залежно від широти для GNSS, LEO та обох. СИНХРОНІЗАЦІЯ: передавання часу до всесвітнього координованого часу (UTC) із супутників LEO у відомому положенні з двостанним фільтром годинника, шум процесу якого береться з класів генераторів рушія, залежно від C/N0 та генератора, і вираз системного часу в UTC з IS-GPS-200; за [timing] trace = true кожен рядок також повідомляє свою похибку часу та передбачену сигму на кожній епосі. VALIDATED: найбільший Доплер проходу від зеніту до горизонту проти опублікованих показників Iridium (до { "36" } кГц) та Xona Pulsar X1 ({ "32" }–{ "34" } кГц). MODELLED: усе інше; DOP перевірено на виведеному вручну випадку, фіксації — за їхньою коваріацією, а модель Доплера — за тотожністю прискорення дальності.
