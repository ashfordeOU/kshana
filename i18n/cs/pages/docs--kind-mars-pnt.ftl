# docs--kind-mars-pnt: translations (cs)

seg-debc2f07db78 = true

seg-c68502b9d675 = Zdroj: <c1/>

seg-46072326d616 = <c1/> (druh scénáře)

seg-3f749aef8d89 = Marsovské PNT v hlubokém vesmíru: simulovaná konstelace relé MARCONI (areostacionární + nakloněná relé vysílající jednosměrně + předávající dvousměrně do stanice v hlubokém vesmíru) navigují referenčního uživatele (transfer | lmo | surface) přes společný fúzní odhadovač jednosměrného/dvousměrného radiometrického měření. Uvádí geometrii/viditelnost v každé epoše, dosažené RMS vůči pravdě a formální kovarianci (1σ / 3σ polohy) — čestné simulované měřítko kvality, NEJDE o ochrannou úroveň s certifikací.

seg-0254f9bd0ee6 = Jeden běh <c1/> se shrne takto: mars-pnt 5aad87fcc94a | uživatel lmo, hodiny uso | { "5" } relé (průměrně { "3.1" } ve výhledu) | konvergované RMS polohy { "0.25" } m, formální 1σ { "0.31" } m (3σ { "0.93" } m — měřítko kvality z kovariance, nikoli PL s certifikací) | σ frekvence hodin { "3.71e-13" } | cov-PD true

seg-8eb513e7aeea = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5a9640a3f9b4 = Příklad <c1/> mimo jiné nastavuje:

seg-8e0fecea19fc = uso

seg-a16f2332397c = lmo

seg-c564dca90854 = Graf, který engine zapisuje pro scenarios/mars-pnt-lmo.toml, druh mars-pnt

seg-83c3a84f6b98 = <b>VALIDATED</b> Obnova stavu v epoše [r,v] ze vzdáleností od pozemních stanic pomocí dávkového diferenciálního korektoru Gauss–Newton a sekvenčního filtru nad silovým modelem dvou těles+J2. Orákulum (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — nezávislá odhadovací knihovna třetí strany na shodném silovém modelu; obnovený stav v epoše a RMS reziduí po fitu se shodují na <{ "1e-3" } m bez šumu a <{ "3" } m při hladině šumu { "5" } m

seg-4be479b81f39 = <s1>Předchozí</s1>lunar-vlbi

seg-2854e6a75833 = <s1>Další</s1>moonlight-service-volume
