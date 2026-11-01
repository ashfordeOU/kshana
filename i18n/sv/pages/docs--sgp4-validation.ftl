# docs--sgp4-validation: translations (sv)

seg-3c513ef2fd3b = Storhet

seg-09da3685124b = Källa: <c1/>

seg-dd68e234a5cd = Validering av SGP4/SDP4 mot gemenskapens referens

seg-d7567fa218fe = Kshanas banpropagator är validerad mot den <b>kanoniska referensen i gemenskapen</b> för SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): de verifieringsvektorer som publicerades med Vallado m.fl., <em>"Revisiting Spacetrack Report #3"</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753), distribuerade som <c1/> (test-TLE:erna (tvåradiga elementmängder)) och <c2/> (det förväntade TEME-tillståndet (true equator, mean equinox) vid varje tidpunkt). Det är samma referens som de publika implementeringarna i C++/Python/MATLAB valideras mot, så samstämmighet här är samstämmighet med den faktiska standarden.

seg-b99fb640886c = Jämförda referenstillstånd

seg-b16a220a41b7 = (alla rader i <c1/>, fastlåsta i testet)

seg-e7d45e243571 = Sämsta positionsfel

seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satellit { "23333" }; < tolerans <c1/> km)

seg-01da72026e56 = Sämsta hastighetsfel

seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satellit { "23333" }; < tolerans <c1/> km/s)

seg-041cbc679ed7 = Fall som täcks

seg-283f3c571a7c = SGP4 för nära jorden, SDP4 för djuprymd (måne-sol + resonans { "12" } h/24 h) och de avsiktliga felkodsfallen

seg-75c2bd004348 = Djuprymds- och resonansfallen spelar särskild roll för det här projektet: GNSS-satelliter (globalt navigationssatellitsystem) ligger i banor på ~{ "12" } h som är djuprymd och resonanta, vilket en tvåkroppsmodell + sekulär J2 inte kan återskapa — SGP4/SDP4 kan det.

seg-613697670501 = Metod

seg-d753e2f76b4a = Implementeringen (<c1/>) är en beroendefri Rust-portning av Vallados algoritm i det offentliga området; epokhanteringen är dagar sedan 1950, läget <c2/> (inte <c3/>) används, och gravitationskonstanterna för WGS-72 (WGS: World Geodetic System) tillämpas så som referensen anger.

seg-ebc18c4cb8ad = Testet (<c1/>) tolkar de medföljande fixturerna <c2/> och <c3/> (<c4/>), propagerar varje testsatellit till varje referenstidpunkt och kontrollerar att TEME-position och -hastighet stämmer inom toleranserna ovan. Antalet jämförda rader är fastlåst på exakt <c5/> så att en regression i fixturer eller i hoppbeteende inte i tysthet kan minska täckningen.

seg-d0566d4db829 = Återskapa det

seg-ba3ed7f0aba7 = Testet skriver ut antalet jämförda rader och de sämsta positions- och hastighetsfelen. Fixturerna är incheckade, så kontrollen är helt offline och deterministisk.

seg-4f539e17926e = Oberoende korskontroll mot cratet <c1/>

seg-0c2d2752179f = Att stämma med den publicerade referensen visar korrekthet mot en <em>tabell</em>. För att också visa korrekthet mot en <em>oberoende implementering</em> kör <c1/> ett allmänt använt oberoende Rust-bibliotek för SGP4, cratet <a1><c2/></a1> (neuromorphicsystems/sgp4, version { "2.4" }), över samma { "666" } AIAA-vektorer och jämför de två kodbaserna direkt mot varandra. Båda drivs med gravitationsmodellen <b>WGS72</b> (World Geodetic System { "1972" }) som vektorerna är definierade i (cratets standard <c3/> använder WGS84 (World Geodetic System { "1984" }), som skiljer sig från WGS72-referensen med ~km — ett modellval, ärligt redovisat, inte ett fel).

seg-da0e4e6c9e96 = Regim

seg-a6eefd68c27c = kshana ↔ referens

seg-e725899898a3 = crate ↔ referens

seg-427820fec0e7 = kshana ↔ crate

seg-6305527acfa4 = nära jorden (LEO/MEO (LEO: låg omloppsbana; MEO: medelhög omloppsbana))

seg-081e28a39101 = { "7.3e-9" } km

seg-e68c97a6528a = { "4.4e-10" } km

seg-4c34e8e2f4c4 = djuprymd (icke-resonant)

seg-12e758e04df0 = { "4.1e-6" } km

seg-db82b835dec9 = { "2.1e-7" } km

seg-d7d4f47417bc = djuprymdsresonans (½ dygn)

seg-17007f8aada3 = { "8.1e-9" } km

seg-895ba7518ab3 = { "7.7e-9" } km

seg-be5a634658e5 = { "2.2e-9" } km

seg-6cf60f32cbcd = djuprymdsresonans (1 dygn)

seg-7698aecab6b4 = { "8.2e-9" } km

seg-60520079d492 = { "7.8e-9" } km

seg-c22876d62c29 = Två oberoende implementeringar stämmer överens till <b>under en mikrometer</b> för banor nära jorden och resonanta banor och till <b>{ "4.12" } mm i värsta fall</b> över alla regimer — samma { "4.12" } mm som är Kshanas egen avvikelse från referensen, det vill säga att oenigheten <em>är</em> det enda djuprymdsfallet, med cratet liggande mellan Kshana och tabellen. Den fullständiga tabellen (med radantal per regim och de fyra patologiska fall som cratet avvisar vid konstruktion) är incheckad i <a1><c1/></a1> och genereras om via <c2/>.

seg-3aae516df868 = Status för att "publicera" det här resultatet

seg-2dd4b77c49d1 = Själva korsvalideringen är klar och finns i trädet. Att skicka in resultatet till externa forum (en gemenskapskatalog, en kort not, en DOI-arkiverad (DOI: digital object identifier) post) är en åtgärd för underhållarna som spåras separat i färdplanen; det här dokumentet är den post i repositoriet som dessa inskick skulle peka på.

seg-b36bbcc0a0c8 = <s1>Föregående</s1>EN { "16803" }

seg-4d5234d85d9f = <s1>Nästa</s1>Validering av kraftmodell

seg-6539dbb48bca = Oberoende korskontroll mot cratet sgp4
