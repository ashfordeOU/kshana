# docs--sgp4-validation: translations (cs)

seg-3c513ef2fd3b = Veličina

seg-09da3685124b = Zdroj: <c1/>

seg-dd68e234a5cd = Validace SGP4/SDP4 vůči referenci komunity

seg-d7567fa218fe = Orbitální propagátor Kshany je validován vůči <b>kanonické referenci komunity</b> pro SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): ověřovacím vektorům zveřejněným s článkem Vallado a kol., <em>„Revisiting Spacetrack Report #3“</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753), distribuovaným jako <c1/> (testovací TLE (dvouřádkové sady elementů)) a <c2/> (očekávaný stav TEME (true equator, mean equinox) v každém čase). Je to táž reference, proti níž se validují veřejné implementace v C++/Pythonu/MATLABu, takže shoda zde je shodou s de facto standardem.

seg-b99fb640886c = Porovnané referenční stavy

seg-b16a220a41b7 = (všechny řádky v <c1/>, zafixované v testu)

seg-e7d45e243571 = Nejhorší chyba polohy

seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, družice { "23333" }; < tolerance <c1/> km)

seg-01da72026e56 = Nejhorší chyba rychlosti

seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (družice { "23333" }; < tolerance <c1/> km/s)

seg-041cbc679ed7 = Pokryté případy

seg-283f3c571a7c = SGP4 pro blízkou Zemi, SDP4 pro hluboký vesmír (lunisolární + rezonance { "12" } h/24 h) a záměrné případy chybových kódů

seg-75c2bd004348 = Případy hlubokého vesmíru a rezonanční mají pro tento projekt zvláštní význam: družice GNSS (globálního družicového navigačního systému) obíhají po drahách s periodou ~{ "12" } h, které jsou hlubokovesmírné a rezonanční, což model dvou těles + sekulární J2 nedokáže reprodukovat — SGP4/SDP4 ano.

seg-613697670501 = Metoda

seg-d753e2f76b4a = Implementace (<c1/>) je port algoritmu Vallada z public domain do Rustu bez závislostí; zpracování epochy je ve dnech od roku 1950, používá se režim <c2/> (nikoli <c3/>) a gravitační konstanty WGS-72 (WGS: World Geodetic System) se aplikují tak, jak reference předepisuje.

seg-ebc18c4cb8ad = Test (<c1/>) zpracuje přibalené fixtury <c2/> a <c3/> (<c4/>), propaguje každou testovací družici ke každému referenčnímu času a ověřuje, že poloha a rychlost v TEME se shodují v rámci výše uvedených tolerancí. Počet porovnaných řádků je zafixován přesně na <c5/>, aby regrese fixtury nebo přeskakování případů nemohly tiše snížit pokrytí.

seg-d0566d4db829 = Reprodukujte to

seg-ba3ed7f0aba7 = Test vypíše počet porovnaných řádků a nejhorší chyby polohy a rychlosti. Fixtury jsou součástí repozitáře, takže kontrola je zcela offline a deterministická.

seg-4f539e17926e = Nezávislá křížová kontrola proti crate <c1/>

seg-0c2d2752179f = Shoda s publikovanou referencí dokazuje správnost vůči <em>tabulce</em>. Aby se prokázala správnost i vůči <em>nezávislé implementaci</em>, <c1/> spouští široce používanou nezávislou knihovnu SGP4 v Rustu, crate <a1><c2/></a1> (neuromorphicsystems/sgp4, verze { "2.4" }), nad týmiž { "666" } vektory AIAA a porovnává obě kódové základny přímo mezi sebou. Obě jsou provozovány s gravitačním modelem <b>WGS72</b> (World Geodetic System { "1972" }), v němž jsou vektory definovány (výchozí <c3/> tohoto crate používá WGS84 (World Geodetic System { "1984" }), který se od reference WGS72 liší o ~km — jde o modelovací volbu, uvedenou otevřeně, nikoli o chybu).

seg-da0e4e6c9e96 = Režim

seg-a6eefd68c27c = kshana ↔ reference

seg-e725899898a3 = crate ↔ reference

seg-427820fec0e7 = kshana ↔ crate

seg-6305527acfa4 = blízká Zemi (LEO/MEO (LEO: nízká oběžná dráha Země; MEO: střední oběžná dráha Země))

seg-081e28a39101 = { "7.3e-9" } km

seg-e68c97a6528a = { "4.4e-10" } km

seg-4c34e8e2f4c4 = hluboký vesmír (nerezonanční)

seg-12e758e04df0 = { "4.1e-6" } km

seg-db82b835dec9 = { "2.1e-7" } km

seg-d7d4f47417bc = rezonance v hlubokém vesmíru (½ dne)

seg-17007f8aada3 = { "8.1e-9" } km

seg-895ba7518ab3 = { "7.7e-9" } km

seg-be5a634658e5 = { "2.2e-9" } km

seg-6cf60f32cbcd = rezonance v hlubokém vesmíru (1 den)

seg-7698aecab6b4 = { "8.2e-9" } km

seg-60520079d492 = { "7.8e-9" } km

seg-c22876d62c29 = Dvě nezávislé implementace se shodují na úrovni <b>pod mikrometr</b> pro dráhy blízké Zemi a rezonanční a na <b>{ "4.12" } mm v nejhorším případě</b> napříč všemi režimy — týchž { "4.12" } mm, které jsou vlastní odchylkou Kshany od reference, tedy rozdíl <em>je</em> právě tento jeden případ hlubokého vesmíru, přičemž crate leží mezi Kshanou a tabulkou. Úplná tabulka (s počty řádků podle režimů a čtyřmi patologickými případy, které crate odmítá při konstrukci) je součástí repozitáře v <a1><c1/></a1> a regeneruje se pomocí <c2/>.

seg-3aae516df868 = Stav „publikování“ tohoto výsledku

seg-2dd4b77c49d1 = Samotná křížová validace je dokončena a je součástí repozitáře. Odeslání výsledku externím místům (komunitnímu katalogu, krátké poznámce, archivnímu záznamu s DOI (DOI: digitální identifikátor objektu)) je úkon správce sledovaný zvlášť v plánu rozvoje; tento dokument je záznam v repozitáři, na který by se tato odeslání odkazovala.

seg-b36bbcc0a0c8 = <s1>Předchozí</s1>EN { "16803" }

seg-4d5234d85d9f = <s1>Další</s1>Validace silových modelů

seg-6539dbb48bca = Nezávislá křížová kontrola proti crate sgp4
