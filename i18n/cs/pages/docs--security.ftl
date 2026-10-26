# docs--security: translations (cs)

seg-4609cf7fb790 = Bezpečnostní politika

seg-ff991a587e4b = Zdroj: <c1/>

seg-7315b27c34f8 = Hlášení zranitelnosti

seg-2f06a8b277b7 = Nahlaste ji soukromě, jednou z těchto cest:

seg-31999fe1b838 = <b>Soukromé hlášení zranitelností na GitHubu</b> — tlačítko <em>Report a vulnerability</em> na <a1>kartě Security</a1> repozitáře. Hlášení vidí pouze správci a opravu lze připravit v soukromém forku a zveřejnit jako GitHub Security Advisory.

seg-7bdcc2ffe39e = <b>E-mail</b> — <b><a1>contact@ashforde.org</a1></b>, s podrobnostmi a postupem reprodukce.

seg-fbc3db22c061 = U hlášení citlivých z hlediska bezpečnosti prosím neotevírejte veřejný issue. Cílíme na potvrzení do několika pracovních dnů.

seg-4c11dabdd8f6 = Podporované verze

seg-19c99cf3a67e = Před verzí 1.0: podporováno je pouze nejnovější označené vydání.

seg-1379eab9a8e3 = Bezpečnost paměti

seg-cf966fa35408 = Knihovní crate deklaruje <c1/> v kořeni crate (<c2/>), takže blok <c3/>, fn, impl nebo extern kdekoli v knihovně je chyba překladu, a nikoli něco, co musí zachytit recenzent. Atribut není pod <c4/>, platí tedy pro každou konfiguraci, v níž se knihovna dodává, a všechny tři se pod ním přeloží bez chyb: výchozí sestavení v Rustu, rozšiřující modul pro Python (<c5/>) a modul WebAssembly (<c6/>).

seg-3f9e707e7d0b = Rozsah, vymezený přesně, protože <c1/> platí pro jednotlivý crate:

seg-e7e22e711c53 = Týká se pouze knihovního crate. CLI binárka (<c1/>), pomocné binárky v <c2/>, samostatně publikovaný crate <c3/> a křížově validační crate <c4/> vyňaté z workspace jsou samostatné kořeny crate a nevztahuje se na ně. Žádný z nich dnes <c5/> neobsahuje, ale to je disciplína, nikoli vlastnost vynucená překladačem.

seg-b8f1e374d873 = O závislostech nic neříká. Ty jsou hlídány zvlášť příkazem <c1/> v CI — pro kořenový crate a jako samostatná úloha pro crate serveru MCP vyňatý z workspace — a sledují je upozornění Dependabot a bezpečnostní aktualizace v repozitáři.

seg-df3008a05522 = Poznámka k exportní kontrole / dvojímu použití

seg-0782e60d11fa = Odolnost PNT a kvantové snímání mohou podléhat exportním kontrolám zboží dvojího použití. Tento veřejný repozitář je omezen na obecné, publikované modely a metody. Nepřispívejte sem detaily odolnosti nebo ochrany proti spoofingu citlivými z hlediska exportu; patří do soukromé nadstavby. Jste-li na pochybách, nejprve napište e-mail.

seg-f6bb0582f6f2 = <s1>Předchozí</s1>Licencování

seg-834cbd4e96d3 = <s1>Další</s1>Přispívání
