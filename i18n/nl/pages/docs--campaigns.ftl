# docs--campaigns: translations (nl)

seg-f917e7fcac09 = Wat het is

seg-cae10fb9bff8 = Scenario

seg-7603033b1c87 = Bron: <c1/>

seg-699c946d7d09 = Een enkel scenario beantwoordt één vraag over één situatie. Een missie is een reeks situaties en een ontwerpstudie is een familie ervan. De scenariosoort <c1/> voegt de bestaande soorten samen tot één run zonder er een opnieuw te implementeren: elk lid is een gewone scenariotabel met zijn eigen <c2/>, via <c3/> verwerkt precies zoals <c4/> het zou draaien, en de campagne leest alleen getallen terug uit de resultaatdocumenten.

seg-cb4f48673970 = Een campagne is <b>MODELLED</b>. De samenstellingsidentiteiten ervan worden getest (hieronder), maar het aaneenschakelen van fasen is een modelleerkeuze, en elke fase is slechts zo goed als de soort die haar draaide.

seg-80e367fbc391 = Draai er een zoals elk ander scenario:

seg-9f9995ebc904 = Een campagne mag elke combinatie van vier secties bevatten; een campagne zonder secties draait en haar samenvatting meldt dat er niets is samengesteld.

seg-002ddd72b3a2 = <c1/>: een aaneengeschakelde missie op één tijdlijn

seg-e99c4453b79d = Elke fase draait een of meer scenario's over een venster van een gedeelde missietijdlijn, bijvoorbeeld een klok in holdover en een traagheidsnavigatiesysteem (INS) dat tegelijkertijd uitloopt. De uitvoer van elke run wordt ingelezen in benoemde <b>kanalen</b>, op de starttijd van de fase geplaatst en door zero-order hold herbemonsterd op een gemeenschappelijk raster (<c1/>): een rastertijd neemt het laatste sample van de run van de bijbehorende fase op of vóór die tijd, en is null waar geen run van die fase het kanaal levert.

seg-842b77a21c5f = Kanaal

seg-b2eb598fab2a = Bron van de voorinstelling

seg-f42465f7d066 = ns

seg-fdb4600bf100 = tijdfout van de klok

seg-aef6b877191d = bewaking van de tijdfout

seg-cc989ca58f1d = de eigen <c1/> van de run

seg-5e9f7cd33017 = gemiddelde effectieve draaggolf-ruisdichtheidsverhouding (C/N0) over de zichtbare satellieten

seg-af6f07319f2d = <c1/>: gemiddelde van <c2/>

seg-f6b4ea158327 = ondergrens voor volgverlies

seg-126535297c32 = <c1/>: de <c2/> van het scenario, wanneer dat er een opgeeft

seg-f8f430695a88 = satellieten die nog worden gevolgd

seg-3f9a9f33010b = verticaal beschermingsniveau

seg-2cfc68fa1c15 = verticale alarmlimiet

seg-d165177a255c = positiefout

seg-29651ae6be6f = drempel voor de positiefout

seg-c893c5e3ace5 = { "1" } zolang een monitor van de fase alarm geeft

seg-ade1d7072512 = zie hieronder

seg-e8c7ac7d117f = <c1/> is <c2/> tenzij de run <c3/> instelt. Elke andere grootheid wordt gelezen met een expliciete invoer <c4/>: een tijdpad met één <c5/> die de rijen benoemt (<c6/>), een waardepad dat die rijen deelt of een scalaire waarde die naar elke rij wordt verspreid (voorvoegsel <c7/> leest het scenario van de run in plaats van het resultaat), een optionele reductie (<c8/>, <c9/>, <c10/>, <c11/>) voor meerdere waarden onder één rij, een schaal, en een eenheid voor een kanaal dat de campagne niet kent.

seg-7d7bc5d19a61 = <b>Alarmen</b> komen uit drie bronnen, binnen een fase gecombineerd met logische OR:

seg-74a10f5283ec = voorinstellingsvlaggen uit de run: <c1/> geeft alarm zolang minder dan vier satellieten worden gevolgd (zijn eigen definitie van beschikbaarheid); <c2/> geeft alarm op epochs die hij als niet beschikbaar markeert;

seg-f22be2880015 = voorinstellingsregels op de kanalen van de fase, geëvalueerd <b>na</b> <c1/>: <c2/> geeft alarm zolang de absolute tijdfout <c3/> overschrijdt; <c4/> zolang de positiefout <c5/> overschrijdt; expliciete regels staan in <c6/>;

seg-ccd94a7cb652 = alarmerende gebeurtenissen: <c1/> genereert er een bij de <c2/> van zijn klokondersteunde monitor; <c3/> genereert er een bij het begin van de fase wanneer zijn gefuseerde beslissing alarm geeft.

seg-f88b8ad5672f = <b>De toestand wordt doorgegeven</b> tussen fasen op drie expliciete manieren:

seg-0e3a0ee8e172 = <c1/> telt de waarde van het kanaal aan het einde van de vorige fase op bij de waarden ervan in deze fase. De klokfase die een spoofer heeft weggetrokken, is het punt waar de holdover begint. Het optellen van de offset is exact voor klokfase, die frequentie integreert; voor een positiefout veronderstelt het dat de twee fouten collineair zijn, het pessimistische geval.

seg-4db8b11391a5 = <c1/> schrijft een getal uit de vorige fase (<c2/> voor de eindwaarde van een kanaal, of een willekeurig resultaatpad van een vorige run) naar een sleutel met punten in het scenario van deze fase voordat die draait, met een optionele schaal en offset.

seg-fdd5aa8b9627 = <c1/> beëindigt de fase op een tijdstip dat een run heeft berekend, begrensd door <c2/>. De meegeleverde missie beëindigt haar spoofingfase op <c3/>.

seg-cdd64676f509 = <c1/> laat de eerste seconden van de eigen tijdlijn van een run weg (een opwarmperiode) vóór fasetijd nul.

seg-d48bcd9890d3 = De meegeleverde missie

seg-52fc5abca41f = <c1/> draait { "18" } lidscenario's over zes fasen op een raster van { "10" } s:

seg-baea4e05ad26 = Fase

seg-9d3ee6a5613e = Runs

seg-87fbeeb9abb9 = Wat de tijdlijn laat zien

seg-82bebc2bb038 = nominaal, { "600" } s

seg-cf54dae64cb7 = <c1/>, <c2/> (geen jammer), <c3/>

seg-5cb80e4a7d4d = tijdfout { "0" } ns; C/N0 { "43.0" } dB-Hz tegenover een ondergrens van { "25" } dB-Hz; verticaal beschermingsniveau { "9.1" } tot { "21.6" } m tegenover een alarmlimiet van { "50" } m

seg-13c92a72544a = jamming, { "600" } s

seg-f9c01304734d = hetzelfde, jammer op -30 dBW, { "1" } km

seg-27d3b65152b0 = C/N0 daalt tot { "27.7" } dB-Hz, alle { "8" } satellieten worden nog gevolgd

seg-6a052db03815 = spoofing, beëindigd op { "370" } s door <c1/>

seg-89856c1f83f8 = <c1/> (tijdhelling van { "0.1" } ns/s), <c2/>, <c3/>

seg-cfcdd96b1132 = de tijdfout loopt op tot { "36" } ns; de radiofrequentiedetector geeft alarm bij het begin van de fase, de klokondersteunde monitor op { "370" } s

seg-92c8a76b84c2 = holdover, { "1800" } s

seg-8a6e0b2898d1 = <c1/> (geweigerd, draagt { "37.0" } ns mee), <c2/> (tactische eenheid die uitloopt), <c3/> bij { "10" } dBW

seg-1948491e25ec = elke satelliet verloren (C/N0 ongeveer -12 dB-Hz); tijdfout { "36.4" } tot { "62.7" } ns tegenover de bewaking van { "50" } ns; positiefout tot { "24" } km

seg-93e59087dd44 = integrity-alarm, { "600" } s

seg-f28f37baf8fe = <c1/> (draagt { "59.6" } ns mee), <c2/> en <c3/> met een masker van { "25" } graden

seg-83d890c819f8 = { "5" } satellieten worden gevolgd; beschermingsniveau { "19" } tot { "135" } m, ontbrekend op { "18" } van de { "60" } rastertijden; de meegedragen tijdfout, { "52.1" } tot { "61.7" } ns, blijft boven de bewaking van { "50" } ns, dus het alarm staat de hele fase aan

seg-1ab40b7893db = herstel, { "600" } s

seg-181d2a2f800b = tijdfout terug op { "0" } ns; alarm stil

seg-26ef3dc422ff = De integriteitsruns gebruiken het eigen gebruikerstraject van het voorbeeld <c1/> (een cirkelvormig traject op een hoogte van { "0.4" } km), niet de vaste locatie van de jamming-ontvanger, en het masker van { "25" } graden staat voor de gedeeltelijke hemel van een ontvanger die opnieuw verwerft. Dat zijn scenariokeuzes, vermeld in het bestand.

seg-03ae98f17988 = Een missie aangestuurd door het L-bandspectrum

seg-5daf8c8fdd83 = <c1/> draait { "8" } lidscenario's over drie fasen op een raster van { "1" } s, waarbij de C/N0 van GPS L1 C/A en Galileo E1 uit de soort <c2/> wordt gelezen (zie <a1>SPECTRUM.md</a1>) en niet uit de tabel per satelliet van de soort <c3/>. De jammers zijn die uit <c4/>.

seg-7f34a00af961 = begin, beëindigd op { "10" } s door <c1/>

seg-471ec0d86f76 = <c1/>, <c2/> (chirp vanaf { "10" } s), <c3/>

seg-00b032242ebc = L1 C/A { "43.48" } en E1 { "44.73" } dB-Hz; de fase eindigt bij het eerste verlies van L1 C/A in de eigen spectrumrun (<c1/>); beschermingsniveau { "21.6" } m tegenover { "50" } m

seg-50220d719d5d = holdover, { "600" } s

seg-50de7cd69ac0 = <c1/> (geweigerd, draagt de beginfout mee, hier { "0" } ns), <c2/> (chirp aan)

seg-1d59e94d94e5 = L1 C/A { "3.38" } en E1 { "4.44" } dB-Hz, beide onder de ondergrens van { "25" } dB-Hz; tijdfout -0.07 tot { "5.06" } ns tegenover de bewaking van { "50" } ns; alarm aan

seg-6c56497d74fb = galileo-fallback, { "300" } s

seg-62bcfd3e8732 = <c1/> (opnieuw gesynchroniseerd), <c2/> (CW-toon op de L1-draaggolf), <c3/> op een Galileo-achtige Walker 24/3/1

seg-d455f0c06ee6 = L1 C/A blijft op { "17.98" } dB-Hz, E1 terug op { "44.73" } dB-Hz; beschermingsniveau { "6.1" } tot { "17.7" } m; alarm stil

seg-2db37e292efe = Dat E1 herstelt onder de CW-toon berust op de behandeling van continue spectra door de spectrumsoort: de toon valt in het nulpunt van het MBOC-spectrum en koppelt niets in. Een echte toon zou wel koppelen via de spectraallijnen van de code; dat staat in het bestand en in SPECTRUM.md.

seg-fb8d8636c554 = <c1/>: een parameterraster over elke soort

seg-b14a11d60e9f = Een tot drie scenariosleutels met punten, elk over een lineair of logaritmisch bereik, op dezelfde aswaarden als de soort <c1/> gebruikt. Elke as heeft een naam en een eenheid; elke metriek heeft een naam en een resultaatpad, en haar eenheid wordt gelezen uit het eigen eenhedenblok van de doorgelopen soort, tenzij de campagne er een opgeeft. Met <c2/> is elk knooppunt een geseed Monte Carlo-ensemble (realisatie <c3/> op de seed van het knooppunt plus <c4/>), gerapporteerd met de statistieken hieronder. <c5/> doorloopt een jammer op { "1" } km van de ontvanger van -50 tot +{ "10" } dBW: de gemiddelde verhouding tussen jammer en signaal verschuift precies { "1" } dB per dB ({ "12.2" } tot { "72.2" } dB), en de beschikbaarheid daalt van { "1" } naar { "0" } tussen -30 en -25 dBW.

seg-c1931e311cca = Een sleutel met punten mag een array van tabellen op positie indexeren: <c1/> is de <c2/> van de derde tabel <c3/>, en <c4/> reikt drie niveaus diep.

seg-e774c578906d = <c1/>: een geseed ensemble

seg-bbacb9c66f92 = Realisatie <c1/> draait het scenario met zijn seedsleutel ingesteld op <c2/>, de conventie die het klokensemble al gebruikt, zodat het ensemble exact reproduceert. Elke metriek rapporteert het gemiddelde, de populatiestandaardafwijking, het 5e, 50e en 95e percentiel volgens nearest-rank, een percentiel-bootstrap-betrouwbaarheidsinterval van { "95" }% op het gemiddelde met vaste seed ({ "2000" } herbemonsteringen) en, standaard, elk sample in seedvolgorde. Resultaatpaden mogen arrays indexeren: <c3/> is het laatste sample.

seg-ed182d15151d = <c1/>: meerdere scenario's onder gedeelde omstandigheden

seg-26fab14de534 = Benoemde gedeelde waarden (een getal of een array van getallen, met een eenheid) worden in elk lid weggeschreven op de sleutels waaraan het ze koppelt, zodat de leden het niet oneens kunnen zijn over de gedeelde omstandigheid. Elk lid draait, en voor elke metriek geeft de gecombineerde samenvatting de kleinste, de grootste en de gemiddelde waarde over de leden, met vermelding van de beste en de slechtste. <c1/> plaatst één jammer van { "8" } dBW tussen een schip in de Finse Golf (ongeveer { "30" } km weg) en een auto op een kustweg bij Helsinki (ongeveer { "50" } km): het schip verliest elke satelliet (gemiddelde verhouding tussen jammer en signaal { "39.0" } dB) terwijl de auto er minstens vier behoudt ({ "34.6" } dB).

seg-c888630c92d7 = <c1/>: de beste waarde van één metriek

seg-b54f0deedd0f = Een tot drie scenariosleutels met punten, elk begrensd tot <c1/> op een schaal <c2/> of <c3/>, worden doorzocht naar de beste waarde van één metriek (<c4/>, <c5/> of <c6/>, wat de afstand tot <c7/> minimaliseert).

seg-b57ec5e5168a = Er zijn twee methoden:

seg-8fba07ce0cde = <c1/> draait elk knooppunt van een raster met <c2/> per sleutel, op de aswaarden van de sweep.

seg-844a7c1e3578 = <c1/> (de standaard) draait een deterministische Nelder–Mead-simplex in coördinaten die per sleutel zijn genormaliseerd naar [{ "0" }, { "1" }]. Proefpunten worden op de doos geprojecteerd. De sectie neemt <c2/>, een initiële <c3/> en de stoptoleranties <c4/> en <c5/>.

seg-2b1159b467f8 = Een run waarvan de metriek ontbreekt of niet eindig is, scoort het slechtst en wordt in de trace bewaard. Met <c1/> is de metriek bij elke evaluatie het gemiddelde over dezelfde seeds. Het resultaat geeft <c2/>, <c3/>, <c4/>, <c5/>, <c6/> en elke evaluatie in <c7/>.

seg-778a40736e7b = <c1/> zoekt bereik en datasnelheid voor een linkmarge van { "3" } dB. Het optimum is lokaal voor de doos en het startpunt. Het is MODELLED, nooit een globale bewering.

seg-b94ab5e6dad4 = Het protocol en de vooraf vastgelegde drempels staan in <c1/>. De test is <c2/>. De resultaten:

seg-232c68472fa4 = een 1-D-doeloplossing komt tot op { "6e-15" } overeen met de gesloten vorm;

seg-22f7abf70fc4 = de rastermethode komt bit voor bit overeen met een onafhankelijke brute-force-lus;

seg-faea43f01e37 = de simplex doet het minstens zo goed als het raster van { "41" } × { "41" }, in ongeveer een tiende van de runs.

seg-df1533fe6b95 = De 1-D-drempel van ronde { "1" } is vastgelegd als NOT MET: de vooraf vastgelegde doos sloot de oplossing uit.

seg-0862a4e9aa61 = Elk campagneresultaat draagt <c1/>, de SHA-256 (Secure Hash Algorithm { "2" }, digest van 256 bit) van de canonieke JavaScript Object Notation-vorm (JSON) van het campagnedocument (sleutelvolgorde en opmaak veranderen hem niet), en een blok <c2/> met het aantal lid-runs en <c3/>, een SHA-256 over de digest van elk lidresultaat in dispatchvolgorde. Twee runs met dezelfde digest leverden byte-identieke lidresultaten op. Elke faserun legt ook haar soort vast, haar eigen <c4/> waar de soort er een heeft, en de SHA-256 van haar resultaatdocument. Elk getal in het document heeft een eenhedeninvoer.

seg-2eeddb87e889 = De kern is sequentieel en leest geen bestanden, dus een campagne draait ongewijzigd in de WebAssembly-build. Campagnes mogen geen campagnes bevatten.

seg-f9b8b78dd64a = Exports

seg-c4443bf160f7 = <c1/> op een campagne schrijft elk lidscenario dat geometrie heeft als eigen bestandsset, met het label van het lid ingevoegd vóór het formaatachtervoegsel: elke faserun (<c2/>, of <c3/> wanneer de fase meerdere runs heeft), het basisscenario van de sweep (<c4/>), het Monte Carlo-scenario (<c5/>) en elk samengesteld lid (met zijn eigen label en de gedeelde waarden die het koppelt erin geschreven). Een lid dat identiek is aan een eerder lid wordt één keer geschreven; hand-offs en sweep- of seedwaarden die tijdens de run worden toegepast, staan niet in de geëxporteerde scenario's.

seg-0ba270495309 = Een formaat dat geen van de leden kan beschrijven, wordt geweigerd met die reden. De tabel per scenario staat in <a1>INTEROP.md</a1>.

seg-c20904c9d3b5 = LEO-PNT-campagnes

seg-a598e2c06f51 = Vijftien meegeleverde campagnes stellen vragen over positiebepaling, navigatie en tijdsynchronisatie (PNT) met satellieten in een lage baan om de aarde (LEO) aan de orde; <a1>LEO-PNT.md</a1> beschrijft wat elk ervan laat zien. Wat elk draait, zoals de opdrachtregel het samenvat:

seg-f65b1f2b4182 = Modus

seg-e7d7defa7e71 = Vraag

seg-08ab59acfe62 = compose, { "4" } leden

seg-a21e4db0fda9 = servicegegevens van het navigatiebericht tegenover de framelengte

seg-6c29f4690d2c = sweep van <c1/>, { "7" } knooppunten

seg-97fba77aa2ec = gefuseerde MEO- en LEO-positiebepaling tegenover de LEO-signaal-in-de-ruimtebereikfout (SISRE)

seg-7b9fbe34d38c = compose, { "2" } leden

seg-28352bd0c9e3 = LEO-PNT binnenshuis per band en gebouwklasse

seg-a447c56022ec = sweep van <c1/>, { "9" } knooppunten

seg-5b3cbfced221 = energie per positiebepaling van Internet of Things (IoT) tegenover het LEO-UHF-zendvermogen

seg-3ebd95e5933a = sweep van <c1/>, { "9" } knooppunten

seg-cfbac004ff64 = positiebepaling in niet-terrestrische netwerken (NTN) tegenover de bandbreedte van het referentiesignaal

seg-07e8765975d1 = sweep van <c1/>, { "3" } knooppunten

seg-db872d35033e = convergentie van nauwkeurige puntpositiebepaling (PPP) tegenover de hoogte van een LEO-laag van 192 satellieten

seg-a4ec677dc4e6 = chain, { "3" } fasen over { "2100" } s

seg-2d91ecf8455d = Global Navigation Satellite System (GNSS) gejamd, de LEO-laag draagt de gebruiker, integriteit gehandhaafd

seg-c44991a2a24e = sweep van <c1/>, { "13" } knooppunten

seg-4b6e292d88f5 = LEO-banddiversiteit tegenover een L-band-breedbandjammer

seg-30d86b528bee = de spoofingmonitors tegenover vier spoofers

seg-1690baf3a1b8 = chain, { "1" } fase over { "86 400" } s

seg-4d5b507c04de = tijdsynchronisatie van 5G-basisstations: holdover en LEO-tijd

seg-d32a80c40470 = chain, { "3" } fasen over { "1440" } s

seg-c38f9d3bd54e = containertracking met LEO-UHF: energie per positiebepaling langs een reis

seg-9bf38e403696 = chain, { "2" } fasen over { "1500" } s

seg-dea7117552f4 = een autonoom voertuig in een stedelijke canyon met een LEO-laag

seg-dbbd9ffcbfb4 = chain, { "2" } fasen over { "1800" } s

seg-37c0c3570023 = dezelfde stedelijke canyon als vlakke afsnijhoek van { "35" } graden en als skyline <c1/>

seg-ccaa34122145 = chain, { "2" } fasen over { "87 000" } s

seg-d16d8b2e9089 = tijdsynchronisatie van kritieke infrastructuur: holdover met LEO-tijd

seg-4ee0b3036f4a = chain, { "3" } fasen over { "10 800" } s

seg-157c5bec7f5f = polaire en arctische gebruikers met een polaire LEO-laag

seg-64404160d0e7 = chain, { "3" } fasen over { "2520" } s

seg-a35e1603ba32 = spoorweg- en maritieme gebruikers met een LEO-laag

seg-3d819fa3fd1c = MEO is medium Earth orbit (middelhoge baan om de aarde), UHF ultra-high frequency en 5G de vijfde generatie mobiele netwerken.

seg-490920844143 = Wat wordt gecontroleerd

seg-483b1d4efb20 = <c1/> legt de samenstellingsidentiteiten vast:

seg-881d97a3fa2b = <b>Een campagne van één fase reproduceert de zelfstandige run bit voor bit.</b> Voor <c1/>, <c2/> en <c3/> is het resultaatdocument van het lid byte-identiek aan <c4/> op het scenariobestand, is zijn digest die welke de campagne rapporteert, en is bij een raster met de eigen stap van de run elke uitgelijnde waarde gelijk aan de waarde van de zelfstandige reeks (de jamming-C/N0 is gelijk aan het gemiddelde dat onafhankelijk is berekend uit het zelfstandige document).

seg-1a9e1ed5b18c = <b>Een sweep van één knooppunt en een samenstelling van één lid</b> lezen precies het getal van de zelfstandige run.

seg-883bb72e1239 = <b>Een ensemble met vaste seed is byte-stabiel</b>, en realisatie <c1/> is precies de zelfstandige run op <c2/>; de campagnehash negeert de sleutelvolgorde.

seg-170bc86059fa = Een analytisch geval.

seg-0fd27291d6f4 = <c1/> draait { "200" } seeds van een chipschaal-atoomklok met alleen witte frequentieruis (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), gesynchroniseerd tot { "590" } s en uitlopend tot { "3600" } s. De uiteindelijke tijdfout is Gaussisch met gemiddelde { "0" } en standaardafwijking sqrt(q_wf * { "3010" } s) = { "16.459" } ns (de random walk van de fase onder witte frequentieruis, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). Het gerapporteerde interval, [-2.52, { "1.59" }] ns, bevat het ware gemiddelde { "0" }; de steekproefstandaardafwijking, { "14.93" } ns, geeft een chikwadraatstatistiek van { "164.5" } bij { "199" } vrijheidsgraden, binnen het tweezijdige interval van { "99" }% [{ "151.37" }, { "254.14" }]. Bij { "3000" } seeds geeft hetzelfde scenario { "16.31" } ns.

seg-61b54a16243f = <b>De door het spectrum aangestuurde keten</b> leest de zelfstandige getallen: de beginfase duurt precies zo lang als de tijd tot het eerste verlies in de spectrumrun, en elke waarde voor L1 C/A en E1 op de tijdlijn is, tot op { "1e-9" } dB, gelijk aan de rij van het zelfstandige waterfallvoorbeeld voor dezelfde jammertoestand (nominaal, alleen chirp, alleen CW-toon).

seg-5ebc02a24ce1 = <b>De keten</b> geeft de toestand door zoals gedocumenteerd: de spoofingfase duurt precies zo lang als de detectietijd van de spoofrun, de holdover draagt precies de offset van de spoofrun bij detectie mee, herstel draagt niets mee, en het alarm staat aan overal waar het beschermingsniveau ontbreekt of de alarmlimiet overschrijdt.

seg-153e28bcb38a = Deze controleren dat samenstellen niets verandert wat niet zou mogen veranderen. Ze toetsen een aaneengeschakelde missie niet aan een gemeten missie, en daarom zijn de drie campagnerijen in <a1>VERIFICATION-MATRIX.md</a1> MODELLED.

seg-e82860f2d902 = <s1>Vorige</s1>Echte TLE's gebruiken

seg-e40757a0b4cb = <s1>Volgende</s1>Runrapporten

seg-e65edbaca6bf = [[phases]]: een aaneengeschakelde missie op één tijdlijn

seg-a433ddf74e55 = [sweep]: een parameterraster over elke soort

seg-7ca90ac531bf = [monte_carlo]: een geseed ensemble

seg-03d764a4cb56 = [compose]: meerdere scenario's onder gedeelde omstandigheden

seg-61a0db2550ba = [optimize]: de beste waarde van één metriek
