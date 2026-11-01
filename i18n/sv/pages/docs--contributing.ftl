# docs--contributing: translations (sv)

seg-c3c260b7063e = Tester

seg-5dce5694e6ec = Källa: <c1/>

seg-3fa173b79e8f = Bidra till Kshana

seg-c3a47c614836 = Tack för ditt intresse. Kshana syftar till att vara en <b>neutral, reproducerbar och ärligt validerad</b> referens för hybrid kvant-/klassisk PNT. Bidrag mäts mot den ribban: korrekthet, källhänvisningar och reproducerbarhet går före bredd.

seg-5a82a55f7fb2 = Hur projektet styrs — vem som beslutar, den tekniska ribban och gränsen mellan öppet och slutet — finns dokumenterat i <a1><c1/></a1>.

seg-cc8491af7a6f = Utveckling

seg-0163ccdfaa2b = De valfria språkbindningarna är avgränsade med feature-flaggor och avstängda som standard (så att bygget ovan och kontrollen av beroenden aldrig berör dem). Så här arbetar du med dem:

seg-edc8bbab6e92 = Före varje commit — den snabba rundan

seg-6a7eda7d82b7 = Dessa tar några sekunder. De är en delmängd av jobbet <c2/> i <c1/>, i samma ordning, så ett fel här är ett fel där:

seg-d62c1fe22fc4 = <b>Reproducerbarhet är en hård invariant.</b> En ändring som gör <c1/> icke-deterministisk är en bugg. Slumpen måste gå via den seedade slumpgeneratorn; kvant- och klassiska körningar använder oberoende, deterministiskt härledda frön.

seg-66ea0748c10f = <b>Hygien i repositoryt.</b> Commits och innehåll får inte bära några attributionsrader eller sidfötter från automatiska verktyg, och får inte nämna en AI-assistent som upphovsperson någonstans i innehåll, filnamn eller historik. Vaktkontrollen upprätthåller detta.

seg-fbf423f6fb31 = Innan du pushar — hela kontrollen

seg-a9176352d3b4 = <c1/> är den kanoniska kontrollen: den kör <c2/> utan förkortning och därefter <c3/> för att köra biblioteksserien några gånger till, eftersom ett kapplöpningsfel mellan trådar är osynligt vid en enda körning. Först vid lyckat resultat skriver den <c4/> (ospårad — maskintillstånd om en körning, inte innehåll).

seg-29815bd89ce2 = Den är långsam med flit — 62–79 minuter i friskt, stabilt tillstånd, enligt huvudet i <c1/>, som bär den aktuella siffran — och det finns ingen tidsgräns, eftersom en tidsgräns som är tillräckligt kort för att vara användbar skulle avbryta en frisk körning. En delmängdskörning som blev grön är ingen kontroll: båda de defekter som den här mekanismen finns till för tog sig förbi på det sättet.

seg-408da9a8b8bb = Bidragsgivare som arbetar från en fork behöver inte kvittokroken — den är en lokal underhållarkontroll, och <b>det är CI som faktiskt styr en pull request</b>. Att köra <c1/> innan du öppnar en betyder helt enkelt att CI inte berättar något du inte redan visste.

seg-9394727b21c3 = Lägga till eller ändra en sensormodell

seg-d9c891ca6827 = <b>Varje numerisk parameter behöver ett ursprung.</b> Ange källhänvisningen i modellens <c1/>-sträng och i scenariofilen. Inga anonyma konstanter.

seg-d30cb836d4c4 = <b>Validera mot standardsambandet,</b> inte bara intern konsekvens — till exempel Allan-deviation för klockor, Groves feltillväxt vid dödräkning för tröghet, omvandlingen från tidssynkronisering till avståndsmätning för tidsöverföring. Lägg till ett test som visar att simulerade utdata återger det publicerade värdet eller sambandsvärdet inom en angiven tolerans.

seg-b52dd0dd550e = <b>Var ärlig om mognad.</b> Statusregistret är <c1/> — lägg till eller ändra raden där, ange dess externa oberoende referens (eller säg tydligt att det inte finns någon, vilket gör den <c2/>), och generera sedan om de publicerade artefakterna med <c3/>. <c4/>, <c5/> och <c6/> genereras alla från den funktionen och säger "redigera inte för hand" av ett skäl. Uppdatera även berättelsen i <c7/> när texten behöver det, och märk värden som är mål eller resultat från markdemonstratorer som sådana.

seg-34b9c8b6f70c = Testdriven: skriv det felande testet först, med det förväntade värdet <b>härlett för hand</b> ur fysiken eller sambandet innan du implementerar.

seg-5322d5b2188c = Deterministiska tester kontrollerar exakta (handhärledda) värden; statistiska tester kontrollerar en angiven tolerans och, helst, medelvärdesbildar över frön för att hålla spridningen i schack.

seg-7f76a26c4d5f = Commits och versionshantering

seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

seg-1a13616ca0ac = <b>Semantisk versionshantering.</b> Före 1.0 kan schemat för scenario och resultat ändras; lyft fram brytande ändringar.

seg-0e3036c27aa8 = <b>Utgåvor skapas av en tagg <c1/>, och publiceringen är automatisk men ordnad.</b> Arbetsflödet Auto-tag pushar taggen när CI är grönt på <c2/> vid en versionshöjning. Arbetsflödet Release kör hela verifieringen på den taggade committen, och först när den lyckas publicerar det till crates.io, Python Package Index (PyPI), npm, ghcr.io, registret för Model Context Protocol (MCP) och JetBrains Marketplace; därefter kontrollerar det att varje kanal levererar versionen och bygger om kshana.dev från taggen. Ingen kör <c3/> för hand. Stegen, och hur man försöker igen efter en misslyckad publicering, finns i <a1><c4/></a1>.

seg-18ca89a2c573 = Underhåll av ändringsloggen (krävs)

seg-1f7e1d73c2ef = Varje ändring som syns för användaren uppdaterar <a1><c1/></a1>:

seg-1448e96afbbc = Lägg till en post under avsnittet <b><c1/></b>, i rätt grupp (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

seg-76ddc53c752e = Vid utgåva byter du namn på <c1/> till den nya <c2/>, påbörjar en ny <c3/>, höjer <c4/> i <c5/> (så att <c6/> i resultat-JSON stämmer), uppdaterar jämförelselänkarna längst ned och taggar <c7/>.

seg-ed680e59377c = Håll posterna korta och riktade till användaren; länka ärenden eller PR:er där det är till nytta.

seg-fe83216ebeed = En pull request som ändrar beteende utan en post i ändringsloggen är ofullständig.

seg-776cd2ef0b0c = Exportkontroll

seg-d0f1db9798a6 = PNT-resiliens och kvantavkänning kan beröra exportkontroller för produkter med dubbla användningsområden. Håll det publika repositoryt till generiska, publicerade modeller och metoder. Allt som liknar exportkänsligt djup i resiliens eller skydd mot spoofing hör hemma i det privata överlägget, inte här. Fråga innan du bidrar med det om du är osäker.

seg-506a29aafc12 = Licens

seg-c0409a1226ca = Kshana har dubbel licens (AGPL-3.0 <b>eller</b> en kommersiell licens från Ashforde OÜ — se <a1><c1/></a1>). För att det ska fortsätta fungera måste bidrag kunna användas under <b>båda</b> licenserna. Genom att bidra godkänner du därför att:

seg-da7b02ac890c = ditt bidrag licensieras inbound under <b>AGPL-3.0-only</b>; och

seg-8d6ed0d3a17f = du <b>också ger Ashforde OÜ</b> en evig, världsomspännande, royaltyfri och oåterkallelig licens att använda, ändra och <b>omlicensiera ditt bidrag som en del av Kshanas kommersiellt licensierade utgåva</b> (det vill säga att även distribuera det under kommersiella villkor som inte är AGPL). Du behåller upphovsrätten till ditt bidrag.

seg-3b1a0dd6b5aa = Den här lätta dubbla licensgivningen — inte en överlåtelse av upphovsrätt — är det som låter projektet förbli öppet <em>och</em> erbjuda en kommersiell utgåva. Om du inte kan ge ({ "2" }) (till exempel kod som ägs av arbetsgivaren), säg det i din pull request innan du bidrar.

seg-6630d0ac4ad5 = <b>Undantag: <c1/>.</b> Den katalogen är licensierad under <b>GPL-3.0-or-later</b> (se dess <c2/>) och ligger utanför den kommersiella licensen. Bidrag till den licensieras inbound under <b>endast</b> GPL-3.0-or-later; medgivande ({ "2" }) gäller inte för dem.

seg-0a78a12b1188 = Signera varje commit för att intyga <a1>Developer Certificate of Origin</a1>: <c1/> (lägger till en rad <c2/>).

seg-9f86d8f58b17 = <s1>Föregående</s1>Säkerhet

seg-fc760238e9a5 = <s1>Nästa</s1>Styrning
