# docs--campaigns: translations (sv)

seg-f917e7fcac09 = Vad det är

seg-cae10fb9bff8 = Scenario

seg-7603033b1c87 = Källa: <c1/>

seg-699c946d7d09 = Ett enskilt scenario besvarar en fråga om en situation. Ett uppdrag är en följd av situationer, och en utformningsstudie är en familj av dem. Scenariotypen <c1/> sätter ihop de befintliga typerna till en enda körning utan att implementera om någon av dem: varje medlem är en vanlig scenariotabell med sin egen <c2/>, skickas via <c3/> precis som <c4/> skulle köra den, och kampanjen läser bara tal ur resultatdokumenten.

seg-cb4f48673970 = En kampanj är <b>MODELLED</b>. Dess sammansättningsidentiteter testas (nedan), men att kedja faser är ett modellval, och varje fas är bara så bra som den typ som körde den.

seg-80e367fbc391 = Kör en som vilket annat scenario som helst:

seg-9f9995ebc904 = En kampanj kan innehålla vilken kombination som helst av fyra sektioner. En utan någon körs, och dess sammanfattning säger att den inte satte ihop något.

seg-002ddd72b3a2 = <c1/>: ett kedjat uppdrag på en tidslinje

seg-e99c4453b79d = Varje fas kör ett eller flera scenarier över ett fönster av en gemensam uppdragstidslinje, till exempel en klocka i holdover och ett tröghetsnavigeringssystem (INS) som glider samtidigt. Utdata från varje körning läses in i namngivna <b>kanaler</b>, placeras vid fasens starttid och samplas om till ett gemensamt raster (<c1/>) med nollte ordningens hållning: en rastertid tar det senaste provet från den ägande fasens körning vid eller före den, och är null där ingen körning av den fasen ger kanalen.

seg-842b77a21c5f = Kanal

seg-b2eb598fab2a = Förinställningens källa

seg-f42465f7d066 = ns

seg-fdb4600bf100 = klockans tidsfel

seg-aef6b877191d = vakt för tidsfel

seg-cc989ca58f1d = körningens egen <c1/>

seg-5e9f7cd33017 = genomsnittligt effektivt förhållande mellan bärvåg och brustäthet (C/N0) över de synliga satelliterna

seg-af6f07319f2d = <c1/>: medelvärdet av <c2/>

seg-f6b4ea158327 = golv för spårningsförlust

seg-126535297c32 = <c1/>: scenariots <c2/>, när det anger ett

seg-f8f430695a88 = satelliter som fortfarande spåras

seg-3f9a9f33010b = vertikal skyddsnivå

seg-2cfc68fa1c15 = vertikal larmgräns

seg-d165177a255c = positionsfel

seg-29651ae6be6f = tröskel för positionsfel

seg-c893c5e3ace5 = { "1" } så länge någon övervakare i fasen larmar

seg-ade1d7072512 = se nedan

seg-e8c7ac7d117f = <c1/> är <c2/> om inte körningen anger <c3/>. Varje annan storhet läses med en uttrycklig post <c4/>: en tidsväg med en <c5/> som namnger raderna (<c6/>), en värdeväg som delar dessa rader eller ett skalärt värde som sänds ut till varje rad (prefixet <c7/> läser körningens scenario i stället för dess resultat), en valfri reduktion (<c8/>, <c9/>, <c10/>, <c11/>) för flera värden under en rad, en skala och en enhet för en kanal som kampanjen inte känner till.

seg-7d7bc5d19a61 = <b>Larm</b> kommer från tre håll, kombinerade med logiskt ELLER inom en fas:

seg-74a10f5283ec = förinställda flaggor som läses från körningen: <c1/> larmar så länge färre än fyra satelliter spåras (dess egen definition av tillgänglighet). <c2/> larmar vid epoker som den markerar som otillgängliga;

seg-f22be2880015 = förinställda regler för fasens kanaler, som utvärderas <b>efter</b> <c1/>: <c2/> larmar så länge det absoluta tidsfelet överstiger <c3/>. <c4/> så länge positionsfelet överstiger <c5/>. uttryckliga regler läggs i <c6/>;

seg-ccd94a7cb652 = larmande händelser: <c1/> ger en vid sin klockstödda övervakares <c2/>. <c3/> ger en vid fasens start när dess fuserade beslut larmar.

seg-f88b8ad5672f = <b>Tillstånd förs vidare</b> mellan faser på tre uttryckliga sätt:

seg-0e3a0ee8e172 = <c1/> lägger kanalens värde vid slutet av föregående fas till den här fasens värden för den. Klockfasen som en spoofer drog iväg är där holdover startar. Att lägga till förskjutningen är exakt för klockfas, som integrerar frekvens. För ett positionsfel antar det att de två felen är kollinjära, vilket är det pessimistiska fallet.

seg-4db8b11391a5 = <c1/> skriver ett tal från föregående fas (<c2/> för en kanals slutvärde, eller vilken resultatväg som helst från en tidigare körning) i en punktseparerad nyckel i den här fasens scenario innan det körs, med valfri skala och förskjutning.

seg-fdd5aa8b9627 = <c1/> avslutar fasen vid en tid som en körning beräknat, begränsad av <c2/>. Det medföljande uppdraget avslutar sin spoofing-fas vid <c3/>.

seg-cdd64676f509 = <c1/> släpper de första sekunderna av en körnings egen tidslinje (en uppvärmning) före fastid noll.

seg-d48bcd9890d3 = Det medföljande uppdraget

seg-52fc5abca41f = <c1/> kör { "18" } medlemsscenarier över sex faser på ett { "10" } s-raster:

seg-baea4e05ad26 = Fas

seg-9d3ee6a5613e = Körningar

seg-87fbeeb9abb9 = Vad tidslinjen visar

seg-82bebc2bb038 = nominellt, { "600" } s

seg-cf54dae64cb7 = <c1/>, <c2/> (ingen störsändare), <c3/>

seg-5cb80e4a7d4d = tidsfel { "0" } ns; C/N0 { "43.0" } dB-Hz mot ett golv på { "25" } dB-Hz; vertikal skyddsnivå { "9.1" } till { "21.6" } m mot en larmgräns på { "50" } m

seg-13c92a72544a = jamming, { "600" } s

seg-f9c01304734d = samma sak, störsändare vid -30 dBW, { "1" } km

seg-27d3b65152b0 = C/N0 sjunker till { "27.7" } dB-Hz, alla { "8" } satelliter spåras fortfarande

seg-6a052db03815 = spoofing, avslutad vid { "370" } s av <c1/>

seg-89856c1f83f8 = <c1/> (tidsramp på { "0.1" } ns/s), <c2/>, <c3/>

seg-cfcdd96b1132 = tidsfelet ökar till { "36" } ns; radiofrekvensdetektorn larmar vid fasens start, den klockstödda övervakaren vid { "370" } s

seg-92c8a76b84c2 = holdover, { "1800" } s

seg-8a6e0b2898d1 = <c1/> (nekad, bär med sig { "37.0" } ns), <c2/> (taktisk enhet som glider), <c3/> vid { "10" } dBW

seg-1948491e25ec = varje satellit förlorad (C/N0 cirka -12 dB-Hz); tidsfel { "36.4" } till { "62.7" } ns mot vakten på { "50" } ns; positionsfel upp till { "24" } km

seg-93e59087dd44 = integrity-alarm, { "600" } s

seg-f28f37baf8fe = <c1/> (bär med sig { "59.6" } ns), <c2/> och <c3/> med en mask på { "25" } deg

seg-83d890c819f8 = { "5" } satelliter spåras; skyddsnivå { "19" } till { "135" } m, saknas vid { "18" } av { "60" } rastertider; det överförda tidsfelet, { "52.1" } till { "61.7" } ns, ligger kvar över vakten på { "50" } ns, så larmet är uppe under hela fasen

seg-1ab40b7893db = recovery, { "600" } s

seg-181d2a2f800b = tidsfelet tillbaka på { "0" } ns; larmet tyst

seg-26ef3dc422ff = Integritetskörningarna använder exemplet <c1/> med dess egen användarbana (en cirkulär bana på { "0.4" } km höjd), inte störningsmottagarens fasta plats, och masken på { "25" } deg står för den partiella himlen hos en mottagare som återupptar spårning. Det är scenariovärden som anges i filen.

seg-03ae98f17988 = Ett uppdrag styrt av L-bandets spektrum

seg-5daf8c8fdd83 = <c1/> kör { "8" } medlemsscenarier över tre faser på ett { "1" } s-raster, där C/N0 för GPS L1 C/A och Galileo E1 läses från typen <c2/> (se <a1>SPECTRUM.md</a1>) i stället för från typen <c3/>s tabell per satellit. Störsändarna är de i <c4/>.

seg-7f34a00af961 = onset, avslutad vid { "10" } s av <c1/>

seg-471ec0d86f76 = <c1/>, <c2/> (chirp från { "10" } s), <c3/>

seg-00b032242ebc = L1 C/A { "43.48" } och E1 { "44.73" } dB-Hz; fasen slutar vid spektrumkörningens egen första förlust av L1 C/A (<c1/>); skyddsnivå { "21.6" } m mot { "50" } m

seg-50220d719d5d = holdover, { "600" } s

seg-50de7cd69ac0 = <c1/> (nekad, bär med sig onset-felet, { "0" } ns här), <c2/> (chirp på)

seg-1d59e94d94e5 = L1 C/A { "3.38" } och E1 { "4.44" } dB-Hz, båda under golvet på { "25" } dB-Hz; tidsfel -0.07 till { "5.06" } ns mot vakten på { "50" } ns; larm uppe

seg-6c56497d74fb = galileo-fallback, { "300" } s

seg-62bcfd3e8732 = <c1/> (omsynkroniserad), <c2/> (CW-ton på L1-bärvågen), <c3/> på en Galileo-lik Walker 24/3/1

seg-d455f0c06ee6 = L1 C/A hålls vid { "17.98" } dB-Hz, E1 tillbaka på { "44.73" } dB-Hz; skyddsnivå { "6.1" } till { "17.7" } m; larmet tyst

seg-2db37e292efe = Att E1 återhämtar sig under CW-tonen vilar på hur typen spectrum behandlar kontinuerliga spektra: tonen hamnar i nollstället i MBOC-spektrumet och kopplar ingenting. En verklig ton skulle koppla via kodens spektrallinjer. Det anges i filen och i SPECTRUM.md.

seg-fb8d8636c554 = <c1/>: ett parameterrutnät över vilken typ som helst

seg-b14a11d60e9f = En till tre punktseparerade scenarionycklar, var och en över ett linjärt eller logaritmiskt intervall, på samma axelvärden som typen <c1/> använder. Varje axel har ett namn och en enhet. Varje mått har ett namn och en resultatväg, och dess enhet läses från den svepta typens eget enhetsblock om inte kampanjen deklarerar en. Med <c2/> är varje nod en seedad Monte Carlo-ensemble (realisering <c3/> vid nodens frö plus <c4/>), som redovisas med statistiken nedan. <c5/> sveper en störsändare { "1" } km från mottagaren från -50 till +{ "10" } dBW: det genomsnittliga förhållandet mellan störsändare och signal ändras exakt { "1" } dB per dB ({ "12.2" } till { "72.2" } dB), och tillgängligheten faller från { "1" } till { "0" } mellan -30 och -25 dBW.

seg-c1931e311cca = En punktseparerad nyckel kan indexera en array av tabeller efter position: <c1/> är <c2/> i den tredje tabellen <c3/>, och <c4/> når tre nivåer ned.

seg-e774c578906d = <c1/>: en seedad ensemble

seg-bbacb9c66f92 = Realisering <c1/> kör scenariot med sin frönyckel satt till <c2/>, den konvention som klockensemblen redan använder, så att ensemblen reproduceras exakt. Varje mått redovisar medelvärdet, populationens standardavvikelse, percentilerna 5, 50 och 95 enligt närmaste rang, ett percentil-bootstrap-konfidensintervall på { "95" } % för medelvärdet med fast frö ({ "2000" } omsamplingar) och, som standard, varje prov i frö-ordning. Resultatvägar kan indexera arrayer: <c3/> är det sista provet.

seg-ed182d15151d = <c1/>: flera scenarier under gemensamma villkor

seg-26fab14de534 = Namngivna delade värden (ett tal eller en array av tal, med en enhet) skrivs in i varje medlem vid de nycklar den binder dem till, så att medlemmarna inte kan vara oeniga om det delade villkoret. Varje medlem körs, och för varje mått ger den samlade sammanfattningen det minsta, största och genomsnittliga värdet över medlemmarna och anger det bästa och det sämsta. <c1/> placerar en störsändare på { "8" } dBW mellan ett fartyg i Finska viken (cirka { "30" } km bort) och en bil på en kustväg i Helsingfors (cirka { "50" } km): fartyget förlorar varje satellit (genomsnittligt förhållande mellan störsändare och signal { "39.0" } dB) medan bilen behåller minst fyra ({ "34.6" } dB).

seg-c888630c92d7 = <c1/>: det bästa värdet för ett mått

seg-b54f0deedd0f = En till tre punktseparerade scenarionycklar, var och en begränsad till <c1/> på en <c2/>- eller <c3/>-skala, genomsöks efter det bästa värdet för ett mått (<c4/>, <c5/> eller <c6/>, som minimerar avståndet från <c7/>).

seg-b57ec5e5168a = Det finns två metoder:

seg-8fba07ce0cde = <c1/> kör varje nod i ett rutnät med <c2/> per nyckel, på svepets axelvärden.

seg-844a7c1e3578 = <c1/> (standard) kör en deterministisk Nelder–Mead-simplex i koordinater normaliserade till [{ "0" }, { "1" }] per nyckel. Provpunkter projiceras på lådan. Sektionen tar <c2/>, ett initialt <c3/> och stopptoleranserna <c4/> och <c5/>.

seg-2b1159b467f8 = En körning vars mått saknas eller inte är ändligt får sämsta poäng och behålls i spåret. Med <c1/> är måttet medelvärdet över samma frön vid varje utvärdering. Resultatet ger <c2/>, <c3/>, <c4/>, <c5/>, <c6/> och varje utvärdering i <c7/>.

seg-778a40736e7b = <c1/> söker avstånd och datatakt för en länkmarginal på { "3" } dB. Optimum är lokalt för lådan och startpunkten. Det är MODELLED, aldrig ett globalt påstående.

seg-b94ab5e6dad4 = Protokollet och dess tröskelvärden som fastställdes i förväg finns i <c1/>. Testet är <c2/>. Resultaten:

seg-232c68472fa4 = en 1-D-lösning mot ett målvärde stämmer med den slutna formen till { "6e-15" };

seg-22f7abf70fc4 = rutnätsmetoden stämmer bit för bit med en oberoende brute force-loop;

seg-faea43f01e37 = simplexen klarar sig minst lika bra som rutnätet på { "41" } × { "41" }, på ungefär en tiondel av antalet körningar.

seg-df1533fe6b95 = Omgång { "1" }s 1-D-tröskel är registrerad som NOT MET: lådan som fastställdes i förväg uteslöt lösningen.

seg-0862a4e9aa61 = Varje kampanjresultat bär <c1/>, SHA-256 (Secure Hash Algorithm { "2" }, 256-bitars sammandrag) av den kanoniska JavaScript Object Notation-formen (JSON) av kampanjdokumentet (nyckelordning och formatering ändrar det inte), och ett block <c2/> med antalet medlemskörningar och <c3/>, en SHA-256 över varje medlemsresultats sammandrag i dispatch-ordning. Två körningar med samma sammandrag gav identiska medlemsresultat byte för byte. Varje körning av en fas registrerar också sin typ, sin egen <c4/> där typen har en, och SHA-256 för sitt resultatdokument. Varje tal i dokumentet har en post i enhetstabellen.

seg-2eeddb87e889 = Kärnan är sekventiell och läser inga filer, så en kampanj körs oförändrad i WebAssembly-bygget. Kampanjer får inte innehålla kampanjer.

seg-f9b8b78dd64a = Exporter

seg-c4443bf160f7 = <c1/> på en kampanj skriver varje medlemsscenario som har geometri som en egen filuppsättning, med medlemmens etikett insatt före formatsuffixet: varje körning av en fas (<c2/>, eller <c3/> när fasen har flera körningar), svepets basscenario (<c4/>), Monte Carlo-scenariot (<c5/>) och varje sammansatt medlem (sin egen etikett, med de delade värden den binder inskrivna). En medlem som är identisk med en tidigare skrivs en gång. Överlämningar samt svep- eller frövärden som tillämpas vid körning finns inte i de exporterade scenarierna.

seg-0ba270495309 = Ett format som ingen av medlemmarna kan beskriva avvisas med den anledningen. Tabellen per scenario finns i <a1>INTEROP.md</a1>.

seg-c20904c9d3b5 = LEO-PNT-kampanjer

seg-a598e2c06f51 = Femton medföljande kampanjer ramar in frågor om positionering, navigering och tidssynkronisering (PNT) från låg jordbana (LEO). <a1>LEO-PNT.md</a1> beskriver vad var och en visar. Vad var och en kör, så som kommandoraden sammanfattar det:

seg-f65b1f2b4182 = Läge

seg-e7d7defa7e71 = Fråga

seg-08ab59acfe62 = compose, { "4" } medlemmar

seg-a21e4db0fda9 = navigeringsmeddelandets tjänstedata mot ramlängd

seg-6c29f4690d2c = svep av <c1/>, { "7" } noder

seg-97fba77aa2ec = fusionerad MEO- och LEO-positionering mot LEO:s signal-i-rymden-avståndsfel (SISRE)

seg-7b9fbe34d38c = compose, { "2" } medlemmar

seg-28352bd0c9e3 = LEO-PNT inomhus per band och byggnadsklass

seg-a447c56022ec = svep av <c1/>, { "9" } noder

seg-5b3cbfced221 = energi per positionsbestämning för sakernas internet (IoT) mot LEO:s UHF-sändningseffekt

seg-3ebd95e5933a = svep av <c1/>, { "9" } noder

seg-cfbac004ff64 = positionering i icke-terrestra nätverk (NTN) mot referenssignalens bandbredd

seg-07e8765975d1 = svep av <c1/>, { "3" } noder

seg-db872d35033e = konvergens för precis punktpositionering (PPP) mot höjden på ett LEO-lager med 192 satelliter

seg-a4ec677dc4e6 = chain, { "3" } faser över { "2100" } s

seg-2d91ecf8455d = Global Navigation Satellite System (GNSS) störs, LEO-lagret bär användaren, integriteten bibehålls

seg-c44991a2a24e = svep av <c1/>, { "13" } noder

seg-4b6e292d88f5 = LEO:s bandmångfald mot en L-bands barrage-störsändare

seg-30d86b528bee = spoofing-övervakarna mot fyra spoofers

seg-1690baf3a1b8 = chain, { "1" } fas över { "86 400" } s

seg-4d5b507c04de = tidssynkronisering för 5G-basstationer: holdover och LEO-tid

seg-d32a80c40470 = chain, { "3" } faser över { "1440" } s

seg-c38f9d3bd54e = containerspårning med LEO UHF: energi per positionsbestämning längs en resa

seg-9bf38e403696 = chain, { "2" } faser över { "1500" } s

seg-dea7117552f4 = ett autonomt fordon i en urban kanjon med ett LEO-lager

seg-dbbd9ffcbfb4 = chain, { "2" } faser över { "1800" } s

seg-37c0c3570023 = samma urbana kanjon som en platt avskärning på { "35" } deg och som en skyline av typen <c1/>

seg-ccaa34122145 = chain, { "2" } faser över { "87 000" } s

seg-d16d8b2e9089 = tidssynkronisering för kritisk infrastruktur: holdover med LEO-tid

seg-4ee0b3036f4a = chain, { "3" } faser över { "10 800" } s

seg-157c5bec7f5f = polara användare och användare i Arktis med ett polärt LEO-lager

seg-64404160d0e7 = chain, { "3" } faser över { "2520" } s

seg-a35e1603ba32 = järnvägs- och sjöfartsanvändare med ett LEO-lager

seg-3d819fa3fd1c = MEO är medelhög jordbana, UHF ultrahög frekvens och 5G den femte generationen av mobilnät.

seg-490920844143 = Vad som kontrolleras

seg-483b1d4efb20 = <c1/> fastlåser sammansättningsidentiteterna:

seg-881d97a3fa2b = <b>En kampanj med en fas reproducerar den fristående körningen bit för bit.</b> För <c1/>, <c2/> och <c3/> är medlemmens resultatdokument identiskt byte för byte med <c4/> på scenariofilen, dess sammandrag är det som kampanjen redovisar, och med rastret på körningens eget steg är varje justerat värde lika med den fristående seriens värde (C/N0 för jamming är lika med medelvärdet som beräknats oberoende ur det fristående dokumentet).

seg-1a9e1ed5b18c = <b>Ett svep med en nod och en sammansättning med en medlem</b> läser exakt det fristående talet.

seg-883bb72e1239 = <b>En ensemble med fast frö är byte-stabil</b>, och realisering <c1/> är exakt den fristående körningen vid <c2/>. Kampanjens hash ignorerar nyckelordning.

seg-170bc86059fa = Ett analytiskt fall.

seg-0fd27291d6f4 = <c1/> kör { "200" } frön av en chipskalig atomklocka med enbart vitt frekvensbrus (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), synkroniserad till { "590" } s och glidande till { "3600" } s. Det slutliga tidsfelet är gaussiskt med medelvärde { "0" } och standardavvikelse sqrt(q_wf * { "3010" } s) = { "16.459" } ns (fasens slumpvandring under vitt frekvensbrus, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). Det redovisade intervallet, [-2.52, { "1.59" }] ns, innehåller det sanna medelvärdet { "0" }. Stickprovets standardavvikelse, { "14.93" } ns, ger en chi-två-statistika på { "164.5" } med { "199" } frihetsgrader, inom det tvåsidiga intervallet på { "99" } % [{ "151.37" }, { "254.14" }]. Vid { "3000" } frön ger samma scenario { "16.31" } ns.

seg-61b54a16243f = <b>Den spektrumdrivna kedjan</b> läser de fristående talen: onset-fasen varar exakt spektrumkörningens tid till första förlust, och varje L1 C/A- och E1-värde på tidslinjen är lika med, till { "1e-9" } dB, det fristående vattenfallsexemplets rad för samma störsändartillstånd (nominellt, enbart chirp, enbart CW-ton).

seg-5ebc02a24ce1 = <b>Kedjan</b> för tillstånd vidare som dokumenterat: spoofing-fasen varar exakt spoof-körningens detektionstid, holdover bär exakt spoof-körningens förskjutning vid detektionen, recovery bär ingenting, och larmet är uppe överallt där skyddsnivån saknas eller överstiger larmgränsen.

seg-153e28bcb38a = Dessa kontroller visar att sammansättning inte ändrar något som den inte ska ändra. De validerar inte ett kedjat uppdrag mot ett uppmätt, och därför är de tre kampanjraderna i <a1>VERIFICATION-MATRIX.md</a1> MODELLED.

seg-e82860f2d902 = <s1>Föregående</s1>Att använda verkliga TLE:er

seg-e40757a0b4cb = <s1>Nästa</s1>Körrapporter

seg-e65edbaca6bf = [[phases]]: ett kedjat uppdrag på en tidslinje

seg-a433ddf74e55 = [sweep]: ett parameterrutnät över vilken typ som helst

seg-7ca90ac531bf = [monte_carlo]: en seedad ensemble

seg-03d764a4cb56 = [compose]: flera scenarier under gemensamma villkor

seg-61a0db2550ba = [optimize]: det bästa värdet för ett mått
