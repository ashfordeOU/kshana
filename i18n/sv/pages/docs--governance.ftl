# docs--governance: translations (sv)

seg-26440a254ba8 = Källa: <c1/>

seg-5f8e9a4a15be = Styrning av Kshana

seg-b20b74b77755 = Det här dokumentet anger hur Kshana styrs: vem som fattar beslut, hur, och vad projektet kommer och inte kommer att ta emot. Det är medvetet <b>lätt</b>, i proportion till projektets nuvarande storlek, och är ärligt om att det i dag finns en enda underhållare och om vägen mot bredare styrning när gemenskapen växer.

seg-1e0c276811e2 = Uppdrag och omfattning

seg-5dcc38148cf4 = Kshana är en <b>neutral, reproducerbar och ärligt validerad referens för prestanda och resiliens hos hybrid kvant/klassisk PNT</b>. Uppdraget sätter ribban för varje beslut: korrekthet, källhänvisningar och reproducerbarhet går före bredd. Den ärliga omfattningen dokumenteras i <a1><c1/></a1> och valideringsstatusen i <a2><c2/></a2>; förslag vägs mot den omfattningen, inte mot antalet funktioner.

seg-d331a1cfc60b = Roller

seg-88bb2a831125 = <b>Underhållare.</b> Kshana underhålls för närvarande av sin grundare, Ashforde OÜ (kontakt: <c1/>). Underhållaren fattar slutgiltigt beslut om omfattning, utformning, utgåvor och vad som slås ihop. Det här är en modell med en välvillig underhållare, uttryckt rakt ut i stället för att klädas ut till en kommitté som inte finns.

seg-8e1da46f9b0b = <b>Bidragsgivare.</b> Alla som öppnar ett ärende eller en pull request. Bidrag mäts mot ribban i <a1><c1/></a1>: ursprung för varje numerisk parameter, validering mot ett publicerat samband och ärlighet om mognad.

seg-d212e17ac218 = <b>Framtida committers.</b> Allteftersom ihållande bidrag av hög kvalitet motiverar det utökas skrivrättigheterna till betrodda bidragsgivare, och det här dokumentet uppdateras till en modell med flera underhållare (beslut genom lazy consensus, där underhållargruppen löser oenigheter). Fram till dess är vägen: bidra, bygga upp en meritlista och bli inbjuden.

seg-91e3f1919016 = Hur beslut fattas

seg-0d45899c92f4 = <b>Diskussion i det öppna.</b> Betydande ändringar börjar som ett GitHub-ärende så att motiv, alternativ och avvägningar finns dokumenterade.

seg-88916dd2357b = <b>Lazy consensus.</b> Ett förslag utan ihållande invändningar efter rimlig tid, och som klarar den tekniska ribban nedan, går vidare.

seg-788566515dad = <b>Underhållaren avgör vid oenighet.</b> Där konsensus inte nås avgör underhållaren och antecknar skälet. Oenighet löses av uppdraget och den tekniska ribban, inte av ålder i tjänsten eller volym.

seg-e45e1b565e62 = Den tekniska ribban (icke förhandlingsbar)

seg-2c397872e2f5 = Det här är hårda invarianter, upprätthållna av CI och granskning, som inget beslut åsidosätter:

seg-70cb5a174c2f = <c1/> måste reproducera en körning bit för bit. En ändring som gör detta icke-deterministiskt är ett fel, inte en funktion.

seg-b8733ea97546 = <b>Ursprung.</b> Inga anonyma numeriska konstanter: varje parameter anger en källa.

seg-55a09b775418 = <b>Ärlighet i validering.</b> Varje förmåga märks <c1/> (mot en oberoende extern referens) eller <c2/> / <c3/>. Ingenting hävdas utöver sitt belägg. Se den maskinkontrollerade matrisen i <c4/>.

seg-dd339a396698 = <b>Hygien.</b> Ingen angivelse av automatiserade verktyg som upphovsman någonstans i commits, innehåll eller historik (upprätthålls av <c1/>).

seg-45733fea1709 = En ändring som inte kan klara ribban avvisas, hur användbar den än vore.

seg-3eb0831d99a2 = Gränsen mellan öppet och slutet

seg-ca7730a3d518 = Kshana är <b>open-core</b>. Det här arkivet är, och förblir, den kompletta öppna AGPL-3.0-motorn, den neutrala referensen, dubbellicensierad kommersiellt av Ashforde OÜ (se <a1><c1/></a1>). Projektet kommer <b>inte</b> att ta emot följande i det öppna arkivet:

seg-8c2a89a3a4e2 = <b>Exportkontrollerat eller dual-use-djup</b>: verkliga hotbibliotek, motståndarvågformer eller prestandaparametrar för anti-jam/anti-spoof. Det publika arkivet håller sig till generella, publicerade modeller och metoder (se <c1/> → Export control). Om du är osäker, fråga <em>innan</em> du bidrar.

seg-6df31d37cfe4 = Kund- eller partnerkonfidentiella data eller kalibrering.

seg-b3b4a5384199 = <b>Copyleft-<em>beroenden</em> (GPL/AGPL/LGPL/MPL)</b>: inte för att de krockar med motorns egen AGPL-licens (det gör de inte), utan för att de inte kan omlicensieras till den <b>kommersiella</b> utgåvan: vi kan bara sälja en kommersiell licens för kod som vi äger eller som är permissiv. Ett copyleft-beroende skulle smitta den kommersiella utgåvan och bryta dubbellicensen. Beroenden förblir därför permissiva (Apache/MIT/BSD/ISC), vilket upprätthålls av <a1><c1/></a1>.

seg-ce264f3e43fe = Omvänt kommer projektet <b>inte</b> att urholka den öppna kärnan för att driva upp proprietärt värde: den validerade motorn, de publika valideringsankarna, ärlighetsregistret, utbytes-/standardformatet och distributionskanalerna förblir öppna. Att svälta den öppna kärnan är det enda ödesdigra misstaget i open-core, och det är uteslutet.

seg-947b3e9b1b2d = Utgåvor

seg-73e2bca0310d = <b>Semantisk versionshantering.</b> Före 1.0 kan scenario- och resultatschemat ändras; brytande ändringar lyfts fram, och schemaversionen för utbytet (<c1/>) är den enda sanningskällan för kompatibilitet mellan artefakter.

seg-71cace8b6144 = <b>Utgivningsmandat.</b> Publicering (till exempel <c1/>) är ett manuellt steg för underhållaren som kräver en registertoken. CI och det taggstyrda utgivningsarbetsflödet publicerar <b>aldrig</b> automatiskt till externa register: de kör bara om alla kontroller och bifogar en byggartefakt. Se <c2/> → Commits and versioning.

seg-59c37ffa54f0 = Uppförandekod och säkerhet

seg-2dc8c12568bc = Uppförande styrs av <a1><c1/></a1>.

seg-8574b73edbbc = Säkerhetsärenden följer den privata rapporteringsprocessen i <a1><c1/></a1>: öppna inte ett publikt ärende för en sårbarhet.

seg-d86d4e609713 = Varumärke

seg-cb1314b67b2f = Namnet och logotypen Kshana är varumärken som tillhör Ashforde OÜ. Licensen (AGPL-3.0, eller en kommersiell licens) gäller <b>koden</b>, inte märkena: en fork får använda koden under licensen, men inte namnet Kshana eller den kanoniska distributionsidentiteten. Det gör att Ashforde förblir den citerade sanningskällan och är en del av hur den öppna kärnan förblir en neutral referens.

seg-a678f6ed1af8 = Ändring av det här dokumentet

seg-db90122245fa = Ändringar av styrningen föreslås själva som en pull request och avgörs enligt processen ovan. När projektets skala ändras kan du räkna med att det här dokumentet får en beslutsmodell med flera underhållare; det kommer inte att sänka den tekniska ribban.

seg-0a0712cca2e7 = Lätt med avsikt. Ärligt om i dag, med en angiven väg för i morgon.

seg-4bfa7cf23a41 = <s1>Föregående</s1>Bidra

seg-f67113e34738 = <s1>Nästa</s1>Uppförandekod
