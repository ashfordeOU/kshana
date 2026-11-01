# docs--observatory-results: translations (sv)

seg-69304b8b186b = Källa: <c1/>

seg-df5b53307f50 = Observatoriets resultat: 30-dagars bakåtkatalog för Östersjön och känslighetsstudie

seg-072bdea11014 = Version <c1/> över <c2/> (parametrarna förhandsregistrerade i grundmetoden, oförändrade). MODELLED: det finns ingen extern oberoende referens, ingen referens och ingen orsakstilldelning. En försämrad cell betyder att en hög andel av de flygplan som samplades där rapporterade låg navigeringsnoggrannhet den dagen; den säger inte varför. En cell som inte observeras, eller saknas, bedömdes inte, vilket inte är detsamma som fri från störning.

seg-0d1eeedcab3a = Vad som kördes

seg-df6ddf801a25 = <b>Källa:</b> adsb.lol readsb-historik (ODbL { "1.0" }), GitHub-release <c1/> av <c2/>, hämtad med <c3/> en del i taget (cirka { "3.4" } GB per dag, { "2" } delar). Utgivaren anger inga kontrollsummor, så SHA-256 för varje del registreras i <c4/>.

seg-9fa2d2319ed3 = <b>Region och dagar:</b> rutan { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (söder, väster, norr, öster: Östersjön och dess kuster), { "30" } UTC-dagar från 2026-09-15 till 2026-10-14, celler på { "0.5" } grad, med <c1/> (en dag i taget, råfilerna raderas efter varje dag).

seg-8b65d148bbd8 = <b>Frisläppningsregler:</b> den nyaste dagen (2026-10-14) låg mer än { "24" } h efter sitt slut när den togs fram; kommandot avvisar annars. Regionala körningar beräknar utrustningsbaslinjen och dagens bakgrund enbart ur rutans rapporter (<c1/>).

seg-64581554e84a = <b>Filer:</b> de { "120" } produktfilerna (GeoJSON, PNG, incidentt-JSON, manifest per dag) finns <b>inte i git</b>. Hashvärdet för varje fil finns i <c1/>, och en dag kan byggas om från sitt arkiv och jämföras.

seg-c89b88dc3d3b = Exempel på vad en dag innehåller: den 2026-09-15 innehöll arkivet { "110,619,797" } positionsrader i { "79,826" } spårfiler; { "103.0" } miljoner låg utanför rutan, { "5.6" } miljoner var inte ADS-B, { "1.2" } miljoner var på marken eller under { "5,000" } ft, { "0.6" } miljoner saknade noggrannhetsfält, och { "212,426" } aggregerades (indataräknare i <c1/>).

seg-cc590aa74075 = Tre dagar (2026-09-18, 2026-09-26, 2026-10-03) hämtades på nytt från arkivet och kördes en andra gång: GeoJSON, PNG och incidentfilen är <b>byte-identiska</b> med den första körningen (SHA-256 lika), så produkten är deterministisk även om hashsaltet för identifierare är slumpmässigt per körning.

seg-3532be519183 = Sammanfattning av bakåtkatalogen

seg-56aae646318e = UTC-dag

seg-42784010b115 = publicerade celler

seg-2672b7f55371 = försämrade

seg-378ee89e4bd3 = inte försämrade

seg-14783d89f2fe = inte observerade (publicerade)

seg-711d143678ae = incidenter

seg-0f1ffe21d381 = { "30" } dagar: { "96" } försämrade celler totalt, { "28" } av de { "30" } dagarna med minst en, { "70" } incidenter (kluster av angränsande försämrade celler), ingen dag med en effekt över hela dagen. Mediancellandelen påverkade flygplan (dagens bakgrund) är { "0" } under { "29" } dagar och { "0.006" } under en, så bakgrundsskyddet (en cell måste överstiga bakgrunden med { "0.15" }) ändrade aldrig ett avgörande i den här regionen. Antalet försämrade celler per dag varierar från { "0" } till { "8" } (medelvärde { "3.2" }). Ungefär en tredjedel av de publicerade cellerna varje dag är <c1/> (för få flygplan samplade): täckningen är den här produktens begränsning, inte himlen.

seg-606aed861c95 = Vad detta inte säger: dagarna med fler försämrade celler är inte "sämre" i någon fysikalisk mening, ett bestående påverkat område skulle underskattas (flygplan som bara flyger inom det hela dagen har ingen baslinje utanför det och räknas inte), och inget här säger vem eller vad som orsakade låg noggrannhet.

seg-ef37626a4c47 = Känslighetsstudie (tre dagar)

seg-aacbb761ee19 = <c1/> spelar upp en dags registrerade rapporter igen under ändringar av de registrerade parametrarna en i taget (två värden vardera, plus ett gitter på { "1.0" } grad). Dagar: 2026-09-18 (flest försämrade celler, { "8" }), 2026-09-26 ({ "1" } försämrad cell) och 2026-10-03 ({ "0" }). Fullständiga rapporter: <c2/> ({ "23" } varianter vardera; { "2.2" }, { "1.7" } och { "1.7" } miljoner rader återuppspelade). Försämrade celler under varje variant (registrerat värde inom parentes; det registrerade resultatet är { "8" }, { "1" } och { "0" } försämrade celler):

seg-dfced7e594d2 = parameter (registrerad)

seg-2ac3e771679d = värde

seg-0953dbfd76db = gitter { "0.5" } grader

seg-bf5746d1a110 = { "2" } (grövre celler)

seg-e4016df2fcd3 = Att läsa den, utan att utse en vinnare:

seg-81cfcbf0de89 = Avgörandena är känsliga för trösklarna för noggrannhetskoderna och för samplingsreglerna, och de små talen rör sig mycket.

seg-097ed1aa1504 = <c1/>, <c2/> och <c3/> ändrar vart och ett antalet försämrade celler med en faktor två eller mer varje dag; om <c4/> lättas till { "6" } blir { "1" } försämrad cell till { "12" } den 09-26 (Jaccard med den registrerade mängden { "0.08" }). Den 09-18 behåller en höjning av <c5/> till { "0.4" } { "1" } av de { "8" } (Jaccard { "0.125" }). Ett avgörande för en cell nära trösklarna säger lika mycket om trösklarna som om data.

seg-0d0c96099d30 = <b><c1/> flyttar mest celler mellan inte försämrade och inte observerade</b>: den 09-18 lämnar den antalet försämrade på { "8" } medan { "21" } till { "56" } celler byter tillstånd.

seg-04cc05318a5d = <b>Tre skydd är inaktiva här</b>: <c1/>, <c2/> och <c3/> ändrar ingenting någon av de tre dagarna (bakgrundsandelen är { "0" }), så den här regionen och perioden säger ingenting om hur bra de fungerar. De skulle spela roll där en regional effekt höjer bakgrunden.

seg-7ba403b84fbd = <b>Ett grövre gitter ({ "1.0" } grad) ändrar bilden</b> ({ "2" }, { "3" } och { "1" } försämrade celler; de publicerade cellerna sjunker till ungefär en tredjedel, { "226" } mot { "694" } den 09-18, eftersom varje cell är fyra gånger större): cellstorleken är ett metodval, och observatoriet fastställer den till { "0.5" } grader.

seg-4db2f5313410 = En dag utan registrerad försämrad cell (10-03) har försämrade celler under { "9" } av de { "22" } varianterna utan gitter (upp till { "8" } med <c1/> { "6" }): "ingen försämrad cell" är också ett tröskelberoende påstående.

seg-a818be844f3a = Ingen variant är ett validerat alternativ, och den registrerade regeln är oförändrad av den här studien. Studien säger inte vilka parametervärden som är rätta.

seg-98c799bfbc25 = <s1>Föregående</s1>Störningsobservatoriet: metod

seg-5d0c003e73dc = <s1>Nästa</s1>kshana-bench
