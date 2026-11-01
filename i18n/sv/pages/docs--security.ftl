# docs--security: translations (sv)

seg-4609cf7fb790 = Säkerhetspolicy

seg-ff991a587e4b = Källa: <c1/>

seg-7315b27c34f8 = Rapportera en sårbarhet

seg-2f06a8b277b7 = Rapportera den privat, på någon av de två vägarna:

seg-31999fe1b838 = <b>Privat sårbarhetsrapportering på GitHub</b> — knappen <em>Report a vulnerability</em> på repositoriets <a1>Security-flik</a1>. Rapporten är bara synlig för underhållarna, och en rättelse kan förberedas i en privat fork och publiceras som en GitHub Security Advisory.

seg-7bdcc2ffe39e = <b>E-post</b> — <b><a1>contact@ashforde.org</a1></b>, med detaljer och steg för att återskapa.

seg-fbc3db22c061 = Öppna inte ett publikt ärende för säkerhetskänsliga rapporter. Vi strävar efter att bekräfta inom några arbetsdagar.

seg-4c11dabdd8f6 = Versioner som stöds

seg-19c99cf3a67e = Före 1.0: bara den senaste taggade utgåvan stöds.

seg-1379eab9a8e3 = Minnessäkerhet

seg-cf966fa35408 = Biblioteks-cratet deklarerar <c1/> i sin crate-rot (<c2/>), så ett <c3/>-block, en fn, impl eller extern var som helst i biblioteket är ett kompileringsfel istället för något en granskare måste fånga. Attributet ligger inte bakom ett <c4/>, så det gäller varje konfiguration som biblioteket levereras i, och alla tre kompilerar rent under det: standardbygget i Rust, Python-tilläggsmodulen (<c5/>) och WebAssembly-modulen (<c6/>).

seg-3f9e707e7d0b = Omfattningen, angiven exakt, eftersom <c1/> gäller per crate:

seg-e7e22e711c53 = Det styr enbart biblioteks-cratet. CLI-binären (<c1/>), hjälpbinärerna under <c2/>, det separat publicerade cratet <c3/> och de från arbetsytan uteslutna korsvalideringscraten <c4/> är separata crate-rötter och omfattas inte av det. Inget av dem innehåller <c5/> i dag, men det är disciplin, inte en egenskap som kompilatorn upprätthåller.

seg-b8f1e374d873 = Det säger ingenting om beroenden. De kontrolleras separat av <c1/> i CI — för rotcratet och, som ett eget jobb, för det från arbetsytan uteslutna MCP-servercratet — och bevakas av Dependabot-varningar och säkerhetsuppdateringar i repositoriet.

seg-df3008a05522 = Exportkontroll / anmärkning om dubbla användningsområden

seg-0782e60d11fa = PNT-resiliens och kvantavkänning kan omfattas av exportkontroll för produkter med dubbla användningsområden. Det här publika repositoriet är begränsat till generiska, publicerade modeller och metoder. Bidra inte med exportkänslig detalj om resiliens eller anti-spoofing här; den hör hemma i ett privat överlägg. Om du är osäker, skicka e-post först.

seg-f6bb0582f6f2 = <s1>Föregående</s1>Licensiering

seg-834cbd4e96d3 = <s1>Nästa</s1>Bidra
