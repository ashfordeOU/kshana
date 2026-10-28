# docs--animation: translations (sv)

seg-8428c41646b0 = Källa: <c1/>

seg-a61d094894fd = <c1/> omvandlar en körnings tidsserie till något som rör sig: en animerad SVG-fil (Scalable Vector Graphics), en enda fristående HTML-spelare (HyperText Markup Language) eller en numrerad sekvens av SVG-bildrutor för en videokodare. En kampanj spelas upp som sina faser (jamming, spoofing, holdover, integritetslarm) med larmen markerade; en spektrumkörning spelar upp sitt vattenfall rad för rad; en passage i låg omloppsbana (LEO) spelar upp sin länk per band och, med en spoofer, övervakningsstatistiken epok för epok.

seg-39d69331035d = Kod: <c1/>. Tester: <c2/>.

seg-0b708f65d8d3 = Vad det är, och vad det inte är

seg-ad8c12a3b510 = Exportören läser resultatdokumentet som körningen redan skrivit. Den kör inte om fysiken, den samplar inte om, jämnar inte ut och interpolerar inte mellan sampel (bortsett från det enda raka linjesegment som avslutar ett spår vid markören), och den lägger inte till något eget tal. En animering är därför exakt lika bra som körningen bakom den. Dess nivå är <b>MODELLED, intern konsistens</b>: den är en rendering, aldrig evidens, och den har ingen egen rad i verifieringsmatrisen.

seg-f37311ad7ef0 = Utdata

seg-0c21f772932e = Varje format skrivs bredvid scenariot, intill de vanliga <c1/>, <c2/> och <c3/>:

seg-f2ce7fc60cdf = Format

seg-51a8df15f356 = Skrivs som

seg-3ea93ae372ca = Vad det innehåller

seg-3603593b9799 = En SVG animerad med Cascading Style Sheets (CSS) keyframes och utan skript: spåren ritas in bakom en rörlig tidsmarkör, händelser visas vid sitt ögonblick, vattenfallets rader avtäcks i tidsordning. Den loopar, med { "1.5" } s uppehåll på den färdiga bilden.

seg-6c91078b434e = En fil med inbäddat skript och inbäddad stil och utan externa resurser: spela och pausa, en skjutreglage för tidsposition, hastighet (0,25x till 4x), varje panel på en synkroniserad markör, ett levande värde per spår, fasremsan och en händelselista som söker vid klick. Mellanslag spelar eller pausar, piltangenterna stegar, Home och End hoppar.

seg-df02d37cd729 = <c1/>, <c2/>, … och <c3/>.

seg-2e5ebd60cad0 = <c1/> kan upprepas och tar en kommaseparerad lista (<c2/>) eller <c3/>. <c4/> ({ "1" } till { "60" }, standard { "12" }) och <c5/> ({ "0.5" } s till { "600" } s, standard { "8" } s) styr uppspelningen; bildrutesekvensen är begränsad till { "7,200" } bildrutor.

seg-7e012ab53f45 = När <c1/> körs i samma kommando listar HTML-spelaren de exportfiler som skrivits bredvid den (CZML, KML, GeoJSON, STK, SigMF) som relativa länkar till de syskonfilerna; en länk skrivs bara för ett rent filnamn, så ingen kan lämna mappen eller nå nätverket. Den avancerade rapporten (<c2/>) bäddar in den animerade teckningen närhelst resultatet har en tidsserie, oavsett om <c3/> kördes eller inte.

seg-9c1d2204edab = När <c1/> körs får <c2/> ett <c3/>-block: formaten, bildrutor per sekund (fps), varaktighet, antal bildrutor, tidsspannet, panelrubrikerna, de JSON-sökvägar som varje spår lästes från (<c4/>) och alla serier som hittades men inte ritades (<c5/>). Utan <c6/> är resultatet byteidentiskt med en vanlig körning.

seg-fa8388ae976e = Bildrutesekvensen

seg-db4b53abe7d6 = Sekvensen har exakt <c1/> bildrutor. Bildruta <em>i</em> visar tidslinjen fram till <c2/>, så den första bildrutan är starten och den sista är den färdiga bilden. <c3/> registrerar <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), pixelstorleken, <c9/>, <c10/>, uppdragstiden för varje bildruta (<c11/>), faserna, händelserna och källorna. En ny export till samma katalog tar först bort varje <c12/> som redan finns där (och inget annat), så en kortare sekvens lämnar aldrig kvar bildrutor från en längre för kodaren att läsa.

seg-13b57b6d3c14 = Bildrutorna är SVG, inte Portable Network Graphics (PNG). En <c1/> byggd med biblioteket <c2/> läser dem direkt, med den takt som sekvensen skrevs med ({ "24" } i exemplet ovan; manifestets <c3/>):

seg-b20beeb45fac = En <c1/> utan <c2/> stoppar med "no decoder found for: svg". Rastrera bildrutorna först, till exempel med <c3/>, och koda PNG-filerna:

seg-fc61f546f605 = Tillgänglighet och tema

seg-7015f7ed77dc = <b>Färgschema.</b> Spelaren följer <c1/> och ritas om när det ändras; den animerade SVG:n har en ljus variant av sin palett under samma mediefråga. Bildrutorna använder den mörka paletten från de statiska diagrammen, eftersom en video inte har något schema.

seg-c3b1f19f191b = <b>Reducerad rörelse.</b> Under <c1/> stänger den animerade SVG:n av varje animering och visar den färdiga bilden (dess basstilar är sluttillståndet, så ingenting är dolt), och spelaren öppnas pausad på den färdiga bilden i stället för att spela; användaren kan fortfarande dra i tidsreglaget eller trycka på Play.

seg-f8dd26194eec = SVG:n har en <c1/> och <c2/>; spelarens kontroller är märkta knappar, ett intervallfält med ett uppläst tidsvärde och en väljare.

seg-f5356cbf3675 = Vad som räknas som en tidsserie

seg-ba43cf36ac20 = Resultatdokumenten skiljer sig åt från typ till typ, så exportören känner igen de former som motorn avger i stället för en lista över typer:

seg-952d09156712 = <b>En array av poster med ett tidsfält</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, eller <c6/> på en <c7/>-array) som strikt ökar längs arrayen. Varje annat numeriskt fält blir ett spår; samma fält under två rötter (<c8/> och <c9/>) delar en panel.

seg-2c3abce3f70a = <b>Ett objekt med en strikt ökande tidsarray</b> (<c1/>, <c2/>, <c3/>, …) bredvid arrayer av samma längd: numeriska syskonarrayer, en <c4/>-karta med <c5/>-poster (tidslinjen <c6/>), en array av poster som håller sådana arrayer (banden i <c7/>, en konstellations satellitspår), och en tvådimensionell array vars rader motsvarar tidsaxeln med en frekvensaxel <c8/> som syskon (vattenfallet <c9/>).

seg-0edf8c38f9eb = Bredvid den tidsarrayen blir <c1/> (<c2/>, <c3/>, <c4/>) fasremsan och <c5/> (<c6/>, <c7/>, <c8/>) blir markörerna. Ett bands skalärer <c9/> (dess första förlust av låsning, dess lägsta förhållande mellan bärvåg och brusdensitet) markeras också.

seg-608c4fed9e98 = Spår med en enhet delar panel när deras storlek ligger inom en faktor { "100" }, så att en vakt på { "50" } ns inte plattar till ett fel på { "2" } ns. Högst { "6" } paneler med { "6" } spår ritas; resten listas under <c1/>. Spår över { "2,400" } sampel tunnas ut med ett jämnt steg som behåller det sista samplet, och ett vattenfall över { "96" } × { "120" } celler medelvärdesbildas nedåt (i effekt, för decibelceller, så att en smal jammer inte späds ut).

seg-c386389e4f1d = Bland LEO-typerna animeras varje medföljande scenario av typen <c1/>, <c2/> och <c3/>. <c4/> animeras i sina lägen Doppler, gemensam positionering och tidssynkronisering (en tidssynkroniseringskörning behöver <c5/>, vilket gör att varje rad rapporterar sitt tidsfel och sin predikterade sigma vid varje epok) och avvisas i sitt läge för polär täckning. <c6/> animeras för sin uppdatering mitt i passagen och avvisas för analyserna av kodning, anpassningsintervall och modelljämförelse. Resultaten <c7/> och <c8/> har ingen tidsaxel och avvisas.

seg-eb31ec7a07b7 = Determinism

seg-82bcf8a5b042 = Utdata är en ren funktion av resultatdokumentet och alternativen: ingen klocka, inget slumptal, ingen iteration över hashtabeller, ingen fil- eller nätverksåtkomst i biblioteket och ingen tidsstämpel någonstans, så samma scenario, frö och alternativ ger byteidentiska filer. Modulen byggs för WebAssembly oförändrad; endast kommandoradsgränssnittet skriver filer.

seg-77e1f459f3d3 = Användning som bibliotek

seg-b3fa41e48ea5 = <c1/> animerar ett resultatdokument du redan har, och <c2/> returnerar det som skulle ritas utan att rendera det.

seg-0857a94a948e = Begränsningar

seg-02f0f03af2fb = Python-wheelen och WebAssembly-modulen exponerar inte exportören ännu; den kan nås från kommandoraden, Rust-biblioteket och verktyget <c1/> i Model Context Protocol-servern (MCP) (som returnerar högst { "120" } bildrutor i ett svar).

seg-cd3ec7b403ba = Axlarna är linjära. En serie som sträcker sig över många dekader (en klockas felväxt från { "0.1" } ns till en mikrosekund) ser platt ut till sent i körningen.

seg-ed21d370a73c = Den animerade SVG:n förlitar sig på CSS-animering av en klipprektangel; aktuella motorer i Chromium, Firefox och Safari spelar upp den, medan en visare utan CSS-animering visar den färdiga bilden.

seg-9dfb9596ecf3 = Svep-, Monte Carlo- och compose-kampanjer har ingen tidsaxel och avvisas; sammanfattningsstatistiken för ett svep eller ett ensemble är inte en tidsserie. En kedjad kampanj animeras.

seg-be1f1afe7424 = <s1>Föregående</s1>Körningsrapporter

seg-6817433f69f6 = <s1>Nästa</s1>Interoperabilitetsexporter och -importer

seg-51cd8d5f527b = En typ vars resultat inte bär någon av dessa former (en länkbudget, en geometri för en enda epok, en sammanfattning av enbart statistik från Monte Carlo, eller telecom-holdovern, vars resultat publicerar postens hash men inte posten) avvisas med <c1/>, och ingenting skrivs. Med kshana { $version } kan { "94" } av de { "193" } körbara scenariofilerna (alla filer utom en studiesvit) animeras och { "99" } avvisas. <c2/> skriver ut sammanställningen.
