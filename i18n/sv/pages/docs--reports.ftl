# docs--reports: translations (sv)

seg-3ea93ae372ca = Vad det innehåller

seg-245adc6e6766 = <s1>Föregående</s1>Kampanjer

seg-aa5482ac34ff = Begränsningar, uttryckta rakt på sak

seg-b0dcf3142564 = Källa: <c1/>

seg-4c412bb0ce63 = Varje körning av kommandoradsgränssnittet (CLI) skriver en rapport bredvid sitt resultat: en utskrivbar HyperText Markup Language-sida (HTML), <c1/>, och ett maskinläsbart JavaScript Object Notation-dokument (JSON), <c2/>, med samma innehåll. Rapporten fungerar för alla scenariotyper och för kampanjer.

seg-e26b1a83a86d = Resultatdokumentet svarar på <em>vad motorn beräknade</em>. Rapporten lägger till det en läsare behöver innan hen agerar på det: vad som gick in, vad siffrorna vilar på, vad som utelämnades och hur man får samma bytes igen. Den hittar inte på något av det. Varje avsnitt läses ur en källa som motorn redan håller, och namnger källan bredvid det den citerar.

seg-bf0456f18e4f = Byggaren är <c1/> (<c2/>). Den är en ren funktion av körningens utdata, scenariofilens bytes och kommandoraden: den läser ingen klocka, ingen fil och inget nätverk, och den bygger för WebAssembly.

seg-bed0af192da5 = Avsnitt

seg-fca842769048 = Avsnitt

seg-2654051d8292 = Läses från

seg-5790851a4a5f = Sammanfattning för ledning

seg-3d34b2ef5988 = vad typen gör, körningens sammanfattning på en rad, huvudsiffror, etiketten för körningens ärlighet, antalet förmågor med VALIDATED / MODELLED / PARTNER som används

seg-923111083001 = typkatalogen (<c1/>), resultatets <c2/>, dess <c3/>-block eller kvalitetsmåttsblock, percentilerna för en Monte Carlo-kampanj

seg-e1ce0e8d5c61 = varje fält som scenariofilen anger, utplattat till sin sökväg, med sin enhet och varifrån enheten kom

seg-fbd2e96c92c7 = scenariofilen; enheter ur resultatets <c1/>-block (schemat för fältenheter, <c2/>), annars fältnamnets ändelse (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); en enhet som ingen av dem anger skrivs ut som <b>ej angiven</b>

seg-88ccaef6fc49 = körningens diagram, varje skalär i resultatdokumentet med sin enhet och en sammanfattning med antal / minimum / maximum / första / sista för varje numerisk kolumn

seg-42a82485f8c8 = resultatdokumentet och dess <c1/>-block

seg-f554fbcdd85c = Aggregering (kampanjer och svep)

seg-7c0466805f54 = ettveps nodtabell; en Monte Carlo-körnings medelvärde, standardavvikelse, 5:e / 50:e / 95:e percentiler och det { "95" }-procentiga konfidensintervallet för medelvärdet, med ett histogram per mått; en kedjas fastabell; en kompositions gemensamma villkor, medlemmar och sammanfattning

seg-7b5f5b635905 = kampanjresultatets avsnitt <c1/>, <c2/>, <c3/> eller <c4/>; rutnätet i ett <c5/>- eller <c6/>-resultat

seg-3bf44008fc65 = Animering och exporter

seg-64d1073dfadc = körningens animerade teckning (utdata från <c1/>) inbäddad som en overksam bild, eller skälet till att det inte finns någon; länkar till de animerings- och interoperabilitetsfiler som samma kommando skrev bredvid rapporten; varje exportformat med uppgift om huruvida det gäller för scenariot, varför inte, och dess specifikation

seg-ad7792e04197 = animeringsexportören (<c1/>), <c2/> och de filer som kommandoraden skrev (<c3/>, <c4/>)

seg-3d3781a3691b = Händelsetidslinje

seg-f29f1b90edbd = tidsatta fönster och punkthändelser, ritade och tabellerade på körningens tidsaxel

seg-4271c092fa45 = scenariotabeller med <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> eller en starttid; körningens spann <c7/>; varje <c8/>-array i resultatet; en kampanjs faser och överlämningar

seg-00bee96167aa = Verifieringsetiketter

seg-6dea392111a6 = varje rad i verifieringsmatrisen som körningens typer utnyttjar, med dess etikett, oberoende referens och testbelägg, samt de nivåer per värde som resultatet anger

seg-ca56309b9693 = verifieringsmatrisen (<c1/>, <c2/>), via korstabellen från typ till rad <c3/>

seg-c19ae28a2355 = Inte modellerat, och antaganden

seg-aff7a016c7e2 = varje begränsning, citerad

seg-9be853632d3a = resultatets block <c1/>, <c2/> och <c3/>; MODELLED-satser i typkatalogen; scenariokommentarer och indatatext som säger "not modelled"; matrisens skäl till att varje MODELLED-rad förblir modellerad (<c4/>)

seg-a3ee5ba71183 = Reproducerbarhetsuppgifter

seg-a9746c2f1881 = motorversion, källkodscommit, Secure Hash Algorithm 256-bit (SHA-256)-kontrollsummor för scenariofilen och för resultatdokumentet, frö, plattform, det exakta kommandot, regeln för arbetskatalogen, kontrollsumman för varje ytterligare indatafil

seg-ec1f62f6bbd1 = bygget, filerna, kommandoraden

seg-ea460048debd = Ett avsnitt utan något att lista anger skälet i en mening (till exempel "No timed event: the scenario scripts no window or onset time and the result reports no event"). Inget avsnitt är någonsin tomt och tyst.

seg-b99234469953 = Vad en etikett i rapporten betyder

seg-f9060b1e8077 = En verifieringsetikett graderar den <b>förmåga</b> som anges i en matrisrad, så som matrisen registrerar den. Den graderar inte scenariots konfiguration, och en VALIDATED-rad gör inte att en körnings indata blir uppmätta. En PARTNER-rad är en disciplin som körningen förlitar sig på och som Kshana inte tillhandahåller (antennhårdvara för radiofrekvenstyperna, kvantnyttolasten för kvanttyperna, satellitbussen för attitydbudgeten); rapporten visar den som <em>förlitar sig på, tillhandahålls inte</em>.

seg-da422ae044d2 = Korstabellen från typ till rader är en tabell med matrisens <c1/>-strängar. Etiketten, den oberoende referensen och beläggen läses tillbaka från matrisen när rapporten byggs, så när en rad flyttas mellan VALIDATED och MODELLED flyttas varje rapport med den. En kampanj bär raden för sitt läge (kedja, svep eller Monte Carlo, komposition) plus varje rad för varje medlemstyp den körde; <c2/> bär raderna för den typ den svepte över. Varje körning bär också raden "Reproducibility & software assurance", som reproducerbarhetsuppgifterna vilar på.

seg-f38434695c28 = En rad som bara graderar en indatasökväg för en typ listas endast när körningen tog den sökvägen (<c1/>): <c2/> och <c3/> bär raden "Orbit propagation & determination" bara med en <c4/> (sökvägen Simplified General Perturbations { "4" } (SGP4); en analytisk bana är en tvåkroppspropagering), och <c5/> bär raden för uppmätta register bara med en <c6/>. Samma tabell styr raden för flera band i <c7/> utifrån att körningen ritar <c8/>, och raderna för typerna för låg omloppsbana (LEO) utifrån vilken sökväg varje körning tog: en rad för regn, byggnadsinträde, låg energi eller spoofer för <c9/> eller <c10/> bara när scenariot sätter den termen, scintillationsraden om inte scenariot stänger av den, en rad för precise point positioning för <c11/>, <c12/> eller kedja bara för den analys eller det läge som resultatet bär, och raden för LEO-systemförinställning bara när en namngiven förinställning används. Raden för Shuttle Radar Topography Mission (SRTM)-läsaren bärs av ingen typ: <c13/> och <c14/> körs på en syntetisk digital höjdmodell (DEM), och inget scenariofält läser en SRTM-ruta. En VALIDATED-rad som körningen aldrig berörde skulle annars göra anspråk på belägg som körningen inte har.

seg-29efeadac5c7 = Reproducera en körning utifrån dess rapport

seg-e859939f0f42 = <c1/> → <c2/> innehåller allt som behövs:

seg-d65ad1b942e3 = Kontrollera scenariofilen mot <c1/>, och varje fil i <c2/> (en jordorienteringsfil av typen <c3/>) mot dess kontrollsumma.

seg-5b3c59266451 = Kör <c1/> från den katalog där den ursprungliga körningen startades. Scenariosökvägen, och varje relativ datasökväg i scenariot, löses upp mot den.

seg-9f38218af0f0 = Den nya <c1/> har SHA-256 från <c2/>, och den nya <c3/> och <c4/> är byte för byte identiska med de gamla.

seg-a04db3e1c7f5 = <c1/> gör exakt detta för ett klockscenario, en kedjad kampanj, en svepkampanj och en banekörning med en <c2/>-fil: den läser kommandot ur rapporten, kör det i en ny katalog som bara innehåller de registrerade indatafilerna och jämför byte.

seg-1e2e9158544d = <c1/> är kontrollsumman av filens exakta byte. Resultatets egen <c2/> är något annat, typens fingeravtryck av scenariot (ofta av en kanonisk form), och rapporten skriver ut båda, med etiketter.

seg-3d72d2059a6c = <b>Frö.</b> Fröet är scenariots <c1/>, annars det som resultatet anger. För en typ som inte tar något frö säger rapporten det, och att enbart scenariofilen och motorbygget bestämmer resultatet.

seg-50457327734e = <b>Källkodscommit.</b> Motorn registrerar commiten bara om den byggdes med miljövariabeln <c1/> satt, läst vid kompilering:

seg-3c7ed74729d3 = Ett bygge utan den rapporterar commiten som inte registrerad, och motorversionen identifierar utgåvan. Inget gissas.

seg-86ff67531a0e = <b>Plattform.</b> Operativsystem, arkitektur och familj för bygget. Resultaten är byte för byte identiska på en och samma plattform; mellan plattformar kan flyttalsresultat skilja sig i de sista siffrorna (se <a1>REPRODUCIBILITY.md</a1>).

seg-eeb07da80914 = Determinism och den enda tidsstämpeln

seg-995ad516f5ae = Samma scenariobyte, frö och motorbygge ger en byte för byte identisk <c1/> och <c2/>. Rapporten bär ingen tidsstämpel. Den enda klockavläsningen i hela cratet är den som <c3/> gör, och som stämplar <c4/> i resultatdokumentet; rapporten visar sedan den stämpeln och anger att den är det enda fält som en reproduktion inte kommer att matcha. Undvik den genom att köra utan <c5/>. <c6/> bygger rapporten för varje scenariofil under <c7/> (utom sviten med manifest) två gånger, och kör om sex scenarier (bland dem en kampanj för vart och ett av lägena kedja, svep och komposition) för att kontrollera detta från början till slut.

seg-8a3fc60a5b54 = Utskrift till PDF

seg-201bcec2caa3 = Motorn skriver inte Portable Document Format (PDF)-filer. En PDF-skrivare som ritar om diagrammen skulle innebära ett nytt, tungt beroende, så det finns inget alternativ <c1/>. Istället bär <c2/> en utskriftsstilmall: öppna den i en webbläsare, skriv ut och välj "Spara som PDF".

seg-13f1f294ede1 = Stilmallen är skriven för både A4 och US Letter. Den anger ingen pappersstorlek (utskriftsdialogens val gäller), behåller marginaler på { "15" } mm / { "14" } mm som passar båda arken, byter till svart på vitt, upprepar tabellrubriker på varje sida, hindrar tabellrader, figurer och kort från att delas över sidor, håller ihop rubriker med den text som följer och startar avsnitten för indata, resultat, verifieringsetiketter och reproducerbarhet på en ny sida. Navigeringsfältet är dolt vid utskrift.

seg-a25bb320665d = JSON-dokumentet

seg-9d9af39942a7 = <c1/> har <c2/> och <c3/>, därefter <c4/> och <c5/> samt en nyckel per avsnitt: <c6/>, <c7/>, <c8/>, <c9/> (endast kampanjer och svep), <c10/>, <c11/>, <c12/>, <c13/> (avsnitt 3b: <c14/>, <c15/> och <c16/>) och <c17/>. Ett listavsnitt har <c18/>, <c19/> (de rader som sidgränsen lämnade utanför; resultatdokumentet bär varje värde) och, när <c20/> är tom, ett <c21/> som anger varför. Ett värde behåller sin råa JSON-form i <c22/> och den text som sidan visar i <c23/>; ett saknat värde är <c24/> i <c25/> och "no value" i <c26/>.

seg-06cc70ca3601 = <b>Enheter.</b> Där varken schemat för fältenheter eller fältnamnet anger en enhet säger rapporten "not stated" istället för att gissa. Indata som ligger nästlade i en kampanjs medlemsscenarier löses upp enbart mot kampanjens eget enhetsblock och fältnamnets ändelse, så fler av dem står som "not stated" än i en fristående körning.

seg-023d5a1fbffc = <b>Bedömning av korstabellen.</b> Vilka matrisrader en typ utnyttjar är en kurerad tabell, som ett test kontrollerar anger exakt en befintlig rad per post och täcker varje inbyggd typ. Om varje koppling är den rätta är en mänsklig bedömning, liksom matrisens eget val av oberoende referens.

seg-0a7465f4c29a = <b>Gränser.</b> Sidan listar högst { "400" } indata, { "150" } skalära resultat, { "60" } numeriska kolumner och { "200" } händelser; <c1/> räknar resten. En tabell med fler än { "24" } rader i ett scenario (en inläst serie) sammanfattas per kolumn.

seg-1fa26ed86bb8 = <c1/> behåller sin egen <c2/> och <c3/>; den skriver inte den här rapporten.

seg-1ccdffd389fb = <b>Bindningar.</b> Python- och WebAssembly-bindningarna behåller <c1/>, resultatkortet på en sida; lekplatsens nedladdningsbara rapport är en egen sida (<c2/>). Den här rapporten skrivs av CLI:t, och Rust-anropare kan bygga den med <c3/>. Servern för Model Context Protocol (MCP) returnerar den från sitt verktyg <c4/>, som JSON eller som HTML-sida; scenariofilens namn i dess reproduktionskommando är det som anroparen anger (standard <c5/>), och den listar ingen följefil, eftersom servern inte skriver någon.

seg-c8ab7b4605cf = <s1>Nästa</s1>Animeringsexport
