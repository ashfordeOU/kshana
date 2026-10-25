# docs--kind-orbit: translations (uk)

seg-0e3518dc3ddb = Джерело: <c1/>

seg-1428025a91e1 = <c1/> (тип сценарію)

seg-cb4262b66b8f = Доступність GNSS і DOP для орбітального угруповання (Walker / TLE / RINEX).

seg-97680b4587c8 = Один прогін <c1/> підсумовується так: сценарій bffc887db977 | 77/361 відліків GNSS у нормі | найкращий PDOP { "2.53" } поз. 2.53m | квантовий holdover 0s p95 6.49e-5ns цілісність { "1.000" } безпека н/д (без атаки) | класичний holdover 0s p95 25.0ns цілісність { "1.000" } безпека н/д (без атаки)

seg-b3a080b98bd9 = Обов'язкові поля: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c818cc4f87da = Необов'язкові поля: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-364139ff447d = Приклад <c1/> задає, серед іншого:

seg-d5063dda3971 = Мікросхемний атомний годинник Microchip SA.45s / SA65, sigma_y(1s)

seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

seg-3b652c0da6de = Діаграма, яку рушій записує для scenarios/orbit-rinex.toml, тип orbit

seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP із геометрії лінії візування через Q=(HᵀH)⁻¹ з локальним розкладанням ENU Тести: <a1>dop_reference.rs</a1>.

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry і check: Монте-Карло із фіксованим зерном (N = { "20,000" } епох на геометрію, sigma = { "1.5" } m, зерно ChaCha8 { "36" } + i) для власного ітеративного розв'язку методом найменших квадратів рушія (pvt::solve_spp, одиничні ваги, розв'язання від істинної позиції) на Тести: <a1>uere_dop_monte_carlo.rs</a1>.

seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: геодезичний (WGS-84) азимут і кут місця супутника з наземного пункту, таблиця маски азимут/кут місця з лінійною інтерполяцією за азимутом із замиканням на { "360" } deg, видима множина el Тести: <a1>skyline_orekit_oracle.rs</a1>.

seg-d86884be3f98 = <s1>Попередня</s1>optical-atmosphere

seg-da202333ae8d = <s1>Наступна</s1>passes
