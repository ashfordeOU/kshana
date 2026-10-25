# docs--observatory-method: translations (sv)

seg-0857a94a948e = Begränsningar

seg-2247a2344710 = Betydelse

seg-b652b86e6b8e = Tillstånd

seg-ab75582c5032 = <b>Ingen orsaksangivelse.</b> Vokabulären för tillstånd och skäl saknar orsak; ett test kontrollerar det.

seg-0e7d76d7efd0 = <b>Källor.</b> Endast adsb.lol (ODbL { "1.0" }) eller en användardatamängd med egen licens. <b>Data från OpenSky Network avvisas</b> (licensen tillåter inte kommersiell användning eller vidaredistribution av härledda kartor). ADS-B och AIS kombineras aldrig.

seg-dc28848046ac = <b>Produktens licens.</b> En ADS-B-fil per cell som tagits fram ur adsb.lol är en härledd databas (Derived Database) och bär ODbL { "1.0" } och adsb.lol:s källhänvisning i filen. Kshanas kod förblir AGPL-3.0.

seg-9eeba6648fec = Det som observeras och grundmetoden

seg-7334dc45eb2f = Ett ADS-B-flygplan rapporterar hur noggrann det själv anser att dess GNSS-position är: <b>NACp</b> (Navigation Accuracy Category for Position, en horisontell gräns på { "95" } % från { "10" } NM ner till under { "3" } m) och <b>NIC</b> (Navigation Integrity Category, en inneslutningsradie). Grundmetoden (<c1/>, <c2/>) räknar, per cell och dag, andelen <b>distinkta flygplan</b> vars rapporter i cellen mestadels hade låg noggrannhet, med skyddsregler: endast höjd över { "5,000" } ft; ett flygplan räknas bara om det rapporterade god noggrannhet någon annanstans samma dag (en utrustningsbaslinje); cellens andel måste överstiga dagens mediancellandel med en marginal; en dag vars median i sig är hög markeras som förväxlad och ingen cell förklaras försämrad. Parametrarna fastställdes utifrån fältens definitioner och sekretessregeln innan några data granskades, och de skrivs in i varje utdatafil. Observatoriet lägger till vokabulären med tre tillstånd, frisläppningsreglerna och filerna ovan, och ändrar ingen parameter.

seg-96cf298985c6 = <b>Regionala körningar.</b> Med <c1/> läses bara rapporter inom rutan. Utrustningsbaslinjen och dagens bakgrund beräknas då enbart ur rutans rapporter, och filen anger det (<c2/>). En regional produkt är därför en produkt av den regionens data, inte ett utsnitt av en global.

seg-4892485e534b = Pleninger, Topkova och Steiner, "GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data", The Aeronautical Journal { "129" } ({ "1331" }), { "206" } till { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, jämför det positionsfel som ett flygplans NACp antyder med HDOP (horisontell geometrisk försämring av precisionen) för GPS-konstellationen utifrån almanackdata, och flaggar ett flygplan som påverkat när de två inte stämmer överens; artikeln utvärderar metoden på avsiktliga GPS-jamming-experiment.

seg-74ec1aca8a22 = <b>Vad vi använde.</b> Endast det publicerade sammandraget och den bibliografiska posten. Fulltexten fanns inte tillgänglig för oss (bakom betalvägg), så vi känner varken till dess avbildning från NACp till en felskattning, dess HDOP-beräkning eller dess trösklar, och vi hävdar inte att vi återskapar dem.

seg-4f8471649a07 = <b>Vad observatoriet gör i stället.</b> Frågan som almanackjämförelsen besvarar är: "kan konstellationens geometri ensam förklara den här låga noggrannheten?". Grundmetoden besvarar en närliggande fråga utan almanacka: en låg andel måste sticka ut mot samma dags bakgrund i regionen och mot flygplanets egna goda rapporter någon annanstans. Det är en annan och svagare ersättning: den kan inte säga att en timme med lugn geometri var försämrad där dagens bakgrund också är låg. En almanack-HDOP-bedömare är <b>inte implementerad</b>. Det är en öppen punkt, som ska byggas utifrån artikelns fulltext och den offentliga GPS-almanackan och förhandsregistreras innan den körs; tills dess citeras den, men hävdas inte.

seg-e9b9902633af = Återskapa en produkt

seg-95e48f0286d9 = Pipelinen är deterministisk i allt den publicerar (saltet för identifierare per körning ändrar bara interna hashvärden som aldrig skrivs ut). Manifestets SHA-256-värden gör att en andra körning kan jämföras byte för byte.

seg-65236a42e316 = Känslighetsstudie

seg-0c843e799b8f = <c1/> spelar upp en dags rapporter igen under ändringar av en förhandsregistrerad parameter i taget (två värden vardera, plus ett gitter på { "1.0" } grad) och redovisar, per variant, antalet försämrade, inte försämrade och inte observerade celler, Jaccard-index för den försämrade mängden jämfört med den registrerade, de celler vars tillstånd ändrades och den försämrade arean. Den ändrar ingenting i den registrerade regeln: en variant är inget validerat alternativ, och en stor förändring under en parameter säger hur mycket bedömningen beror på den parametern, inte vilket värde som är rätt. Resultaten för bakåtkatalogen finns i <c2/>.

seg-cc57d45c4b0a = <b>Täckning.</b> adsb.lol följer frivilliga mottagare; öppet hav och glest täckt luftrum är glesa, och <c1/> är vanligt där. En karta visar täckningen hos sin källa.

seg-e3921e1eb177 = <b>Vad låg noggrannhet betyder.</b> NACp och NIC sjunker av andra skäl än störning: bortfall av satelliter eller förstärkningssystem, rymdväder, fel i mottagare eller transpondrar, och geometri. Inget tillstånd antyder en orsak.

seg-e5ad0dc456c0 = <b>Flygplan som stannar i en påverkad region hela dagen</b> har ingen baslinje utanför den och räknas inte, så metoden underskattar en bestående regional effekt. Känslighetsstudien visar baslinjeskyddets effekt.

seg-a2d41becc19b = <b>Dygnsgränserna</b> är UTC; en händelse som korsar midnatt delas upp mellan två dagar.

seg-436af9f16feb = <b>Ingen referens.</b> Observatoriet har ingen extern oberoende referens: varje siffra är MODELLED, och ingen rad i verifieringsmatrisen vilar på den.

seg-5c4966f0166d = <b>Ämnets känslighet.</b> Kartor av det här slaget är politiska. Observatoriet anger en metod, en fördröjning och en vokabulär, och inget annat; det namnger inga stater eller aktörer och publicerar inte i realtid.

seg-874f46a80c8b = <s1>Föregående</s1>Mottagarprotokoll som läses

seg-3137b7595e59 = <s1>Nästa</s1>Störningsobservatoriet: resultat
