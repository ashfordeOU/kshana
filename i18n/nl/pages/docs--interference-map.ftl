# docs--interference-map: translations (nl)

seg-6555ff9a6d8e = Uitvoer

seg-2247a2344710 = Betekenis

seg-c3c260b7063e = Tests

seg-d4a762001549 = Licentie

seg-e7b6d071246e = Bron: <c1/>

seg-143c73287d6c = <c1/> bouwt een beeld per dag van waar vliegtuigen en schepen verslechterde navigatiegegevens meldden, uit open gelicentieerde trackingbestanden die u aanlevert. <c2/> geeft vervolgens aan hoeveel van een geplande route op elke dag binnen de getroffen cellen lag.

seg-158f33f95ec3 = Wat dit is: een beschrijving van hoe gepubliceerde positiemeldingen op eerdere dagen eruitzagen. Wat het niet is: een meting van enige ontvanger, een voorspelling of bewijs van interferentie. Een gedegradeerde of afwijkende cel kan meerdere mogelijke oorzaken hebben (hieronder vermeld), en een cel zonder item is eenvoudig niet waargenomen.

seg-64d3ee269407 = Alles draait op lokale bestanden. De standaardopdrachten openen nooit een netwerkverbinding; het ene optionele downloadhulpprogramma vereist een expliciete vlag.

seg-e251b385ff46 = Twee synthetische dagen van de interferentiekaart, getekend uit de vastgelegde voorbeelden in examples/interference-map/output, elk met een eigen synthetische route en de aandelen van route-exposure die de engine rapporteert. Links een ADS-B-dag: { "1" } gedegradeerde cel, { "6" } niet gedegradeerd, { "4" } niet beoordeeld (gearceerd) en cellen zonder item, leeg getekend, die niet zijn waargenomen. De route is { "525" } km: { "11.5" }% van de lengte in gedegradeerde cellen, { "38.3" }% niet gedegradeerd, { "9.1" }% niet beoordeeld en { "41.1" }% niet waargenomen. Rechts een AIS-dag: cellen gemarkeerd door de cirkel- en op-land-detectoren, niet-afwijkende cellen en lege cellen; de route is { "454" } km met { "10.5" }% in afwijkende cellen, { "21.2" }% niet afwijkend, { "0.0" }% niet beoordeeld en { "68.3" }% niet waargenomen. ADS-B en AIS zijn afzonderlijke lagen, nooit gecombineerd. Een gemarkeerde cel is geen constatering van interferentie, en een cel zonder kleur is niet waargenomen, wat niet hetzelfde is als vrij. Alle gegevens zijn verzonnen, boven de open Atlantische Oceaan, en geen meting.

seg-765f43228dc6 = Beide dagen zijn de synthetische voorbeelden in <c1/>, elk met een synthetische route in <c2/>; de aandelen van route-exposure zijn wat <c3/> voor hen afdrukt. Niets daarin is een echte plaats, een echt vliegtuig of een echt vaartuig.

seg-228f39c0305b = Gegevens en licenties

seg-d3336cc18ff7 = Alleen de bronnen die in <a1><c1/></a1> zijn beoordeeld, zijn ingebouwd, te kiezen met <c2/>:

seg-b03d56f501c3 = Type

seg-2328672e782f = Licentieveld in de uitvoer

seg-2319c7a6f6e2 = ODbL { "1.0" }

seg-7464d3c830f3 = AIS

seg-c13f76567536 = Amerikaans publiek domein (CC0 { "1.0" } volgens de uitgever)

seg-636c2bb6f29d = publiek domein

seg-f6f4e431d36d = NLOD { "2.0" }

seg-5621e3a3908f = beide

seg-6b3a1f8ca649 = wat u opgeeft

seg-be349e2c455f = <c1/>, <c2/>, <c3/> vereist

seg-590344d1eae5 = Elk uitvoerbestand bevat de licentie, de licentie-URL, de vereiste bronvermelding en de dekkingsbeperkingen van de bron. Er is geen ingebouwd item voor bronnen waarvan de voorwaarden commercieel gebruik of herverspreiding van afgeleide kaarten verbieden.

seg-2d8eaefab0f8 = <b>ODbL en edities van Kshana.</b> Een ADS-B-bestand per cel dat uit gegevens van adsb.lol is gemaakt, is een Derived Database en wordt vrijgegeven onder ODbL { "1.0" }; het veld <c1/> zegt dat ook. De eigen code van Kshana blijft AGPL-3.0. Commerciële edities van Kshana die zulke bestanden schrijven, nemen dezelfde vermelding op, en wie het bestand opnieuw publiceert, moet haar behouden. Resultaten van ADS-B en AIS worden nooit in één bestand gecombineerd, zodat de ODbL niet aan de AIS-laag gaat kleven.

seg-bb4932d5d15c = <b>Dekkingsbias.</b> Kaarten erven de dekking van hun bron. adsb.lol volgt ontvangers van vrijwilligers, dus open zee en dun gedekte regio's zijn schaars. De open data van Kystverket laat vissersvaartuigen onder { "15" } m en pleziervaartuigen onder { "45" } m weg, dus de kaart geeft grotere schepen weer. MarineCadastre dekt alleen Amerikaanse wateren.

seg-713babc3963b = <b>Identificatoren.</b> Invoerrijen bevatten een identificator van een vliegtuig of vaartuig. Die wordt in het geheugen gehasht met een willekeurige salt per run, alleen gebruikt om afzonderlijke vliegtuigen of vaartuigen te tellen, en nooit geschreven, gelogd of afgedrukt. De uitvoer is geaggregeerd: er komt nergens in een identificator voor.

seg-fa3c70a8997a = <b>Onderdrukking.</b> Een cel met minder dan <c1/> afzonderlijke vliegtuigen of vaartuigen die die dag zijn waargenomen, wordt helemaal niet gepubliceerd, en voor AIS wordt een gemarkeerd aantal van één of twee in een gepubliceerde cel gerapporteerd als <c2/>. Geen enkele gepubliceerde waarde kan een vliegtuig of vaartuig herleidbaar maken.

seg-02dbfcb9c808 = Invoerformaten

seg-2f291f986a87 = Gewone CSV met een koptekstrij, door komma's gescheiden, zonder aanhalingstekens, UTC-tijden. De volgorde van de kolommen is vrij; onbekende kolommen worden genegeerd. Een tijdstempel is Unix-seconden of <c1/>. Rijen die niet kunnen worden geparsed, worden geteld in de metadata van de uitvoer en niet stilzwijgend weggelaten.

seg-571365be20a5 = ADS-B (<c1/>):

seg-aaeff8f42699 = Kolom

seg-b10a51ed96c0 = Vereist

seg-357c2320b43a = ja

seg-14ac5d0f109b = tijd van de melding

seg-6dbe5595d0be = ondoorzichtige identificator (gehasht, nooit opgeslagen)

seg-c5fb6b91dc68 = graden

seg-e283838c85aa = hoogte in voet; <c1/> of leeg sluit de rij uit

seg-9ab90c35bd7d = ten minste één

seg-868e5b9c00ab = gehele getallen { "0" } tot en met { "11" }; leeg betekent niet gemeld

seg-db907db790b1 = nee

seg-5c2ce9f61700 = indien aanwezig worden alleen waarden gebruikt die beginnen met <c1/> (MLAT, TIS-B en dergelijke worden uitgesloten)

seg-412f40b8eeb1 = <b>Historie van adsb.lol readsb, rechtstreeks gelezen.</b> De dagelijkse archieven zijn een gesplitste tar van readsb-tracebestanden. Pak er een uit zoals de uitgever beschrijft (voeg de delen samen, <c1/>) en geef Kshana vervolgens de uitgepakte map, één bestand <c2/> of een CSV:

seg-6e7d378bd89b = Een map wordt recursief doorzocht op bestanden <c1/> (andere bestanden, zoals <c2/>, worden genegeerd en symbolische links worden niet gevolgd). Elk bestand is gzip-gecomprimeerd of gewone JSON, vastgesteld aan de eerste bytes, omdat readsb gzip schrijft onder een naam <c3/>; decompressie is begrensd op { "512" } MiB per bestand. Uit elk trace-item leest Kshana de tijdsverschuiving, breedtegraad, lengtegraad, hoogte (de markering <c4/> sluit het item uit), de velden <c5/> en <c6/> van het detailobject van het vliegtuig en de tekenreeks van de positiebron (items van iets anders dan ADS-B worden uitgesloten). Een item zonder detailobject heeft geen nauwkeurigheidsvelden en wordt als uitgesloten geteld. Een bestand dat niet kan worden gelezen, wordt geteld in <c7/> in de metadata van de uitvoer en overgeslagen.

seg-b1502f7f4c98 = AIS (<c1/>):

seg-91395984ddac = graden; de AIS-waarden "niet beschikbaar" en ({ "0" }, { "0" }) worden weggegooid

seg-34ae94eb1797 = snelheid over de grond in knopen; { "102.3" } (niet beschikbaar) wordt als ontbrekend behandeld

seg-a1e60af5adaa = De detector voor positie op land heeft een bestand met landpolygonen nodig (<c1/>): GeoJSON Polygon of MultiPolygon. De landlaag van Natural Earth van { "1" }:{ "10" } miljoen (publiek domein) is het beoogde bestand. Zonder <c2/> staat de detector uit en zegt de uitvoer dat. Om het te downloaden (de enige netwerktoegang in deze functie):

seg-cd55a09894c5 = Dit draait de systeemopdracht <c1/> (als argumentenlijst, niet via een shell) over HTTPS, eenmalig, voor één bestand op een vast adres dat één commit van de upstream-repository aanwijst. De download wordt alleen bewaard als zijn SHA-256 gelijk is aan de in de code vastgepinde waarde; bij een afwijking wordt hij verwijderd en mislukt de opdracht. Als <c2/> niet is geïnstalleerd, zegt de opdracht dat en geeft ze het adres en de controlesom, zodat het bestand met de hand kan worden opgehaald. Er wordt niets in de repository meegeleverd.

seg-95eeaa0033b3 = Eén GeoJSON-bestand per bron per UTC-dag, in de map <c1/>, genaamd <c2/>, waarbij <c3/> gelijk is aan <c4/> of <c5/>, <c6/> de sleutel <c7/> is (<c8/>, <c9/>, <c10/> of <c11/>) en de datum de UTC-dag van de meldingen is: <c12/>, <c13/>. De dataset staat in de naam, zodat twee datasets van één type geen bestand kunnen delen, en <b>Kshana overschrijft nooit een bestand</b>: als een doel bestaat, mislukt de opdracht voordat er iets wordt geschreven. De CLI drukt één regel af per bestand dat ze schrijft. Een lezer kan de drie delen terugvinden met <c14/>; dezelfde informatie staat in het bestand (<c15/>, <c16/>, <c17/>). Synthetische voorbeeldbestanden, één per bron, staan in <c18/>, met de opdracht die ze opnieuw genereert, om een viewer te bouwen en te testen. Een lid <c19/> op het hoogste niveau bevat de schemanaam, de datum, het raster, de methode-id en elke parameter, de cijfers op dagniveau, de gegevenslicentie en bronvermelding, en een mededeling. Elke feature is een celpolygoon met <c20/>, <c21/>, <c22/>, <c23/> en de geaggregeerde aantallen.

seg-1ee702004726 = Het raster ligt vast: vierkante cellen van <c1/> graden (standaard { "0.5" }) in breedte- en lengtegraad, geïndexeerd vanaf (-90, -180). De oost-westbreedte neemt af met de breedtegraad: ongeveer { "55" } km op de evenaar en ongeveer { "28" } km op { "60" } graden voor de standaardwaarde. Breedtegraad { "90" } hoort bij de laatste rij en lengtegraad { "180" } is dezelfde meridiaan als -180. <b>De vooraf vastgelegde methoden zijn gedefinieerd op het raster van { "0.5" } graad.</b> Een andere <c2/> werkt, maar is niet de vooraf vastgelegde methode: de CLI zegt dat, en het bestand legt <c3/> en <c4/> (false) vast zodat een viewer het ook kan zeggen.

seg-6e1e8f2a9082 = <b>Achtergehouden aantallen.</b> Elk aantal per cel onder het publicatieminimum ({ "5" }) is <c1/>, nul inbegrepen, dus <c2/> betekent nooit "geen" en geen enkel gepubliceerd getal kan een vliegtuig of vaartuig herleidbaar maken. De velden <c3/> en <c4/> worden nog wel gegeven. In ADS-B-bestanden is <c5/> voor een gepubliceerde cel altijd ten minste { "5" }; <c6/> en <c7/> zijn <c8/> onder { "5" }, en <c9/> is <c10/> tenzij beide ten minste { "5" } zijn (een aandeel zou een achtergehouden aantal onthullen). In AIS-bestanden is elk item van <c11/> gelijk aan <c12/> onder { "5" }.

seg-fd929d6ee90b = Formaatversie en velden

seg-ff443e9cbd20 = Het formaat ligt vast als <c1/>, <c2/>. Een wijziging die een veld verwijdert of hernoemt, of wijzigt wat een veld betekent, verhoogt de versie; een veld toevoegen doet dat niet, dus een lezer moet velden negeren die hij niet kent. Een aantal dat <c3/> is, is achtergehouden, niet nul.

seg-60818bfc3f90 = Waarden van <c1/>: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> is alleen true voor <c10/> en <c11/>. Het rapport over route-exposure heeft een eigen schema <c12/>.

seg-ea526ebdd260 = Observatorium: het dagelijkse product

seg-e33f63fe5c0a = <c1/> zet één UTC-dag aan ADS-B-meldingen om in de drie bestanden van het observatorium (GeoJSON, PNG en een JSON met incidentrapport) en een hashmanifest, en <c2/> speelt die dag opnieuw af onder wijzigingen van de vooraf vastgelegde parameters, één voor één. De opdracht dwingt de vrijgaveregels af: ten minste { "24" } uur nadat de dag eindigt (<c3/> mag alleen worden verhoogd), cellen van { "0.5" } graad of grover, slechts drie toestanden (<c4/>, <c5/>, <c6/>), geen oorzaak toegeschreven en geen gegevens van OpenSky. De methodenotitie, de bestandsformaten en de beperkingen staan in <a1><c7/></a1>. Een regionale run (<c8/>) leest alleen de meldingen van het vak en zegt dat in het bestand.

seg-31ce42fc05dc = Specificatie van de kaartpagina van Studio

seg-a9aca2e2d390 = Voor de kaartpagina van Studio, die een GeoJSON-bestand laadt dat de gebruiker aanlevert (de pagina is gebouwd in de broncode van Studio, niet in deze repository). Er wordt niets geüpload: het bestand wordt in de browser gelezen en de pagina doet geen verzoek aan een gegevensbron.

seg-064ec5d4c91a = <b>Een bestand lezen.</b> Accepteer een bestand alleen als <c1/> begint met <c2/> en <c3/> een getal is dat de pagina ondersteunt; zeg anders dat het bestand geen ondersteunde interferentiekaart van Kshana is. Lees de hierboven genoemde velden; negeer onbekende. Een bestand bevat één bron en één dag. Er mogen meerdere bestanden worden geladen.

seg-5be32f8cff46 = <b>Cellen.</b> Teken de polygoon van elke feature. Kleur op <c1/> en zeg in een legenda altijd wat elke kleur betekent. Vier toestanden, waarvan er geen mag worden verborgen of samengevoegd:

seg-b652b86e6b8e = Toestand

seg-4a511b6a03e3 = Waar het vandaan komt

seg-f92da2236260 = Gedegradeerd (of afwijkend bij AIS)

seg-591ebe8007cb = een groot aandeel van de vliegtuigen meldde lage nauwkeurigheid, of vaartuigen vertoonden die dag afwijkingen

seg-bd993c64b6e8 = <c1/> is true

seg-88d43eb1c14a = Vrij

seg-af5f7989fd09 = waargenomen met genoeg vliegtuigen of vaartuigen en niet gemarkeerd

seg-2bc810e02210 = <c1/> is <c2/> of <c3/>

seg-d894eaa21369 = Niet beoordeeld

seg-38c88ed94111 = waargenomen, maar te weinig bemonsterde vliegtuigen, de dag was verstoord, of de achtergrond van de dag kon niet worden geschat

seg-e358a8c7903f = <c1/> is <c2/>, <c3/> of <c4/>

seg-013b7c903426 = Niet waargenomen

seg-81bcffa57ec2 = te weinig vliegtuigen of vaartuigen, dus de cel is niet gepubliceerd

seg-6828d71822bd = geen feature voor die cel

seg-753192a770ac = "Niet waargenomen" is de afwezigheid van een feature: teken het neutraal (geen vulling, of een arcering), nooit in de kleur van "vrij". Gebruik een kleurenschema dat niet alleen op rood tegenover groen steunt. Celdetails bij hover of selectie tonen de aantallen in <c1/> zoals gegeven, en elk aantal <c2/> als "achtergehouden (minder dan { "5" })", nooit als nul. Een viewer moet ook zeggen, wanneer <c3/> false is, dat het bestand een celgrootte gebruikt buiten de vooraf vastgelegde methode.

seg-e90fedf7ad89 = <b>Lagen.</b> ADS-B en AIS zijn afzonderlijke lagen met eigen schakelaars, legenda's en licentieregels. Voeg ze nooit samen tot één kleurveld of één aantal, teken ze nooit als één gecombineerde cel en tel hun cellen nooit op. Verschillende dagen zijn verschillende bestanden: toon één dag tegelijk, met een dagkiezer, in plaats van dagen over elkaar te leggen.

seg-6d500d3c0baa = <b>Licentie en bronvermelding.</b> Toon voor elke zichtbare laag, op de kaart en in elke export of screenshot, de tekst van <c1/> letterlijk, de <c2/> met een link naar <c3/>, en de <c4/>. Als een ADS-B-laag wordt getoond, geldt haar ODbL-licentie alleen voor die laag. Bied geen gecombineerd bestand aan om te exporteren.

seg-6f786153ef8e = <b>Methode.</b> Bied de methode-id en parameters (<c1/>, <c2/>) en de cijfers van <c3/> aan in een detailpaneel, inclusief <c4/> (zeg ronduit dat geen enkele cel gedegradeerd is genoemd vanwege de achtergrond van de dag) en <c5/>.

seg-905348837439 = <b>Voorbehouden die moeten blijven</b> (toon de eigen <c1/> en <c2/> van het bestand en houd deze formulering of een gelijkwaardige zichtbaar bij de kaart):

seg-1f70e308010a = Een gedegradeerde of afwijkende cel is geen constatering van interferentie. Er bestaan andere oorzaken.

seg-7cde0ddadb73 = Een cel zonder kleur is niet waargenomen. Het is geen bewijs dat het gebied vrij was.

seg-1135dfeadb8f = Dit is een beschrijving van eerdere positiemeldingen, geen voorspelling en geen meting van enige ontvanger.

seg-3ad1216bf3ed = De dekking volgt de gegevensbron; lees de dekkingsnotities.

seg-046f6af48349 = De pagina mag geen individueel vliegtuig of vaartuig noemen of tonen, en de bestanden bevatten er geen.

seg-ae79b67c3b98 = <b>Route-exposure.</b> Als de pagina ook een rapport <c1/> laadt, toon dan zijn rijen per dag en bron met de vier aandelen (gedegradeerd, vrij, niet beoordeeld, niet waargenomen) samen, nooit het gedegradeerde aandeel alleen, plus de <c2/> van het rapport en de <c3/> en <c4/> van elke rij.

seg-98131acf49d8 = ADS-B-methode (<c1/>)

seg-83b660b0bfa6 = Elke ADS-B-melding in de lucht bevat twee zelfbeoordeelde navigatiekwaliteitsvelden: NIC (de insluitingsstraal van de positie) en NACp (de nauwkeurigheidsgrens van { "95" }%, EPU). Wanneer de ontvanger aan boord zijn satellietpositiebepaling verliest of wantrouwt, dalen beide, waardoor ze een kenmerk van interferentie dragen. Ze dalen ook om andere redenen.

seg-4b9020a68db6 = <b>Vooraf vastgelegde parameters</b> (constanten in de code, in elk bestand geschreven; een wijziging betekent een nieuwe methodeversie):

seg-e73ea9921fcf = Parameter

seg-8650fa804f14 = Hoogtedrempel

seg-25056ee5a36c = barometrische hoogte van ten minste { "5000" } ft

seg-17322eff480a = Melding met lage nauwkeurigheid

seg-48ab6ed5eedd = NACp ten hoogste { "6" } (de gemelde EPU-grens is { "556" } m, { "0.3" } NM, of groter, of onbekend) of NIC ten hoogste { "5" } (de gemelde grens van de insluitingsstraal is { "1852" } m, { "1" } NM, of groter, of onbekend)

seg-84beb488319d = Goede melding

seg-2595055d9593 = NACp ten minste { "8" } en NIC ten minste { "7" }; beoordeeld op de velden die de invoer heeft (beide wanneer beide aanwezig zijn, anders het aanwezige veld)

seg-b4bbce695b2d = Basislijn voor de apparatuur

seg-4986ed51f600 = een vliegtuig telt alleen mee in een cel met ten minste { "5" } goede meldingen buiten die cel op dezelfde dag

seg-42859d1d785b = Bemonsterde vliegtuigen in een cel

seg-1ae26d6d99a9 = ten minste { "3" } meldingen in de cel

seg-48bba15e2e0e = Getroffen vliegtuigen in een cel

seg-1fe9c3ab930c = ten minste { "50" }% van zijn meldingen in de cel heeft lage nauwkeurigheid

seg-b147473d133c = Minimale steekproef

seg-33060cda8536 = ten minste { "10" } bemonsterde vliegtuigen

seg-009ca23b9cd6 = Gedegradeerd

seg-afef85ae2a25 = ten minste { "5" } getroffen vliegtuigen, een getroffen aandeel van de bemonsterde vliegtuigen van ten minste { "0.30" }, en ten minste { "0.15" } boven het mediane celaandeel van de dag

seg-890dcc56fa5c = Verstoorde dag

seg-b27768e64d62 = mediaan celaandeel (over ten minste { "5" } cellen met een volledige steekproef) van ten minste { "0.15" }: geen enkele cel wordt gedegradeerd verklaard

seg-18fbf3c348c9 = Geen achtergrond

seg-534111e0c6ad = minder dan { "5" } cellen met een volledige steekproef, dus de mediaan kan niet worden geschat: een cel die aan de drempels voldoet, is <c1/>, niet gedegradeerd

seg-b571f127c595 = Publicatieminimum

seg-60621ffc5bcf = ten minste { "5" } afzonderlijke vliegtuigen waargenomen

seg-f36389caf81b = Deze waarden zijn vastgesteld op basis van de definities van de codes NIC en NACp en van de privacyregel, voordat naar gegevens werd gekeken. Ze zijn niet afgesteld op echte gegevens, en de tests gebruiken uitsluitend synthetische gegevens. Celstatussen: <c1/>, <c2/>, <c3/> (gepubliceerd maar met minder dan { "10" } bemonsterde vliegtuigen), <c4/> en <c5/>.

seg-c89afc07989b = <b>Versie { "2" }.</b> Versie { "1" } verklaarde een cel gedegradeerd vanaf slechts { "3" } getroffen vliegtuigen, minder dan het publicatieminimum van 5 vliegtuigen, en sloeg de controle van de achtergrond van de dag stilzwijgend over wanneer minder dan { "5" } cellen volledig waren bemonsterd. Versie { "2" } vereist ten minste { "5" } getroffen vliegtuigen en houdt de uitspraak (<c1/>) achter wanneer de achtergrond niet kan worden geschat. Beide wijzigingen verscherpen de methode (niets wat in versie { "1" } niet gedegradeerd was, is gedegradeerd in versie { "2" }); de reden is dat een gepubliceerde uitspraak nooit mag steunen op minder vliegtuigen dan het aantal waaronder aantallen worden achtergehouden. Bestanden van versie { "1" } zijn niet vrijgegeven.

seg-ffd0e5175548 = Waarom nauwkeurigheidsvelden om andere redenen dan interferentie dalen, en de waarborg voor elk:

seg-12b613a77f64 = Oorzaak

seg-e30479c3e5d8 = Waarborg

seg-ecac3d226210 = Oudere transponders die NIC of NACp nooit melden, of ze melden met een vaste lage waarde

seg-8b504b60fcc0 = de basislijn voor de apparatuur: een vliegtuig zonder goede meldingen elders op die dag telt niet mee

seg-1df45f128708 = Lage hoogte en operaties aan de grond (terreinafscherming, andere positieformaten)

seg-cc5f23f0da05 = hoogtedrempel; rijen gemarkeerd met <c1/> worden uitgesloten

seg-ddf6aeb47dbe = MLAT of andere niet-GNSS-posities

seg-51162a1835d1 = filter <c1/> wanneer de kolom aanwezig is

seg-08196503a657 = Eén vliegtuig dat veel meldingen verstuurt

seg-bf13dfa85dbe = afzonderlijke vliegtuigen worden geteld, geen meldingen

seg-bbcb809624bc = Een uitval van een constellatie of augmentatie, of een gebeurtenis in het ruimteweer, die de nauwkeurigheid over een groot gebied verlaagt

seg-5f428bb7ad4a = de cel moet het mediane celaandeel van de dag met een marge overschrijden, en een dag waarvan de mediaan zelf hoog is, wordt als verstoord gemarkeerd en verklaart geen cel

seg-30290253a95d = Een storing in de apparatuur van één vliegtuig

seg-b673195405ff = vereist een aandeel van veel afzonderlijke vliegtuigen, met een minimale steekproef

seg-aeebeded71be = Weinig vliegtuigen in de cel

seg-c33c60b49b17 = minimale steekproef; onder { "5" } waargenomen wordt de cel niet gepubliceerd

seg-dc8abb9b411f = Wat overblijft: de methode kan interferentie niet onderscheiden van een regionale oorzaak die lokaal is in plaats van wijdverbreid (een lokaal effect van de satellietgeometrie of een uitval van grondgebonden augmentatie zou er hetzelfde uitzien), en ze is in één richting conservatief: een vliegtuig dat de hele dag alleen binnen een getroffen regio vliegt, heeft geen basislijn en telt niet mee, dus aanhoudende grote gebieden worden te laag gerapporteerd.

seg-41d725eeaba9 = AIS-methode (<c1/>)

seg-7fd53079dccf = Per vaartuig per dag vijf detectoren. Een detector <b>kwalificeert</b> in een cel wanneer ze ten minste { "5" } afzonderlijke vaartuigen markeert die ten minste { "20" }% van de daar waargenomen vaartuigen vormen; de cel is <c1/> als een detector kwalificeert.

seg-6d599353e8e1 = Detector

seg-551f38a9061c = Regel (vooraf vastgelegd)

seg-295e8a28a5b9 = ten minste { "3" } meldingen in de cel op meer dan { "2000" } m landinwaarts van de opgegeven kustlijn

seg-fd21160e6685 = een venster van { "20" } opeenvolgende meldingen (stap { "10" }, hiaten van hoogstens { "30" } min) waarvan de gemiddelde straal tot het zwaartepunt { "500" } m tot { "20" } km is, met een variatiecoëfficiënt van de straal van hoogstens { "0.15" }, één bewegingsrichting met een totale draaiing van ten minste { "270" } graden (stappen van hoogstens { "90" } graden, netto ten minste { "80" }% van het totaal), en een gemiddelde snelheid van ten minste { "2" } kn

seg-1aa30db06794 = ten minste { "2" } sprongen die in de cel aankomen: opeenvolgende meldingen die ten minste { "1000" } m uit elkaar liggen, hoogstens { "1" } uur na elkaar, en die meer dan { "70" } kn impliceren (de geïmpliceerde snelheid gebruikt ten minste { "1" } s tussen de meldingen, dus twee meldingen met dezelfde tijdstempel en posities die { "1" } km of meer uit elkaar liggen, tellen als een sprong)

seg-7f9b22254009 = ten minste { "3" } gemelde snelheden boven { "70" } kn in de cel

seg-e0d0968e8751 = ten minste { "5" } afzonderlijke vaartuigen die dezelfde positie melden (afgerond op { "1e-4" } graad, ongeveer { "11" } m) in hetzelfde venster van 10 minuten

seg-1bf4c460672c = Cellen met minder dan { "5" } afzonderlijke vaartuigen worden niet gepubliceerd; elk gemarkeerd aantal onder { "5" }, nul inbegrepen, wordt gerapporteerd als <c1/>.

seg-b2ea2ec6bad1 = <b>Versie { "2" }.</b> Versie { "1" } liet een detector kwalificeren vanaf { "3" } gemarkeerde vaartuigen en publiceerde aantallen van { "3" } en { "4" }. Versie { "2" } verhoogt het minimum aan gemarkeerde vaartuigen tot { "5" }, het publicatieminimum, zodat een uitspraak <c1/> nooit steunt op minder vaartuigen dan het aantal waaronder aantallen worden achtergehouden. Dit verscherpt de methode en er is geen bestand van versie { "1" } vrijgegeven.

seg-25593339aeb0 = <b>Bekende oorzaken van valse positieven</b>, die de aandeelregel en de drempels verminderen maar niet wegnemen: vaartuigen in rivieren, kanalen en havens dicht bij een grove kustlijn (de landinwaartse buffer van { "2" } km bestaat hiervoor); twee vaartuigen die één identificator delen, wat op sprongen lijkt; transponders met een slechte positiebepaling of testapparatuur; en rondhangen van loodsboten en zoekvaartuigen, wat op cirkels kan lijken. Een kustlijnbestand van { "1" }:{ "10" } miljoen is nauwkeurig tot ongeveer een kilometer.

seg-ac661440a29a = De detectoren voor sprongen en snelheid vergelijken meldingen binnen één invoerbestand; een spoor dat over bestanden of dagen is gesplitst, wordt niet aan elkaar gezet.

seg-05f789b26904 = <b>Geheugen.</b> De invoer wordt regel voor regel gelezen en nooit in zijn geheel vastgehouden. ADS-B bewaart alleen tellers per vliegtuig per cel. AIS bewaart elke geaccepteerde melding in een compact record (ongeveer { "40" } bytes) totdat zijn dag is beoordeeld, dus het geheugen groeit met het aantal AIS-meldingen in de invoer; splits een zeer grote AIS-invoer per dag.

seg-206c78a69ded = Route-exposure

seg-0d8832796ab7 = <c1/> is een GeoJSON LineString (kaal, in een Feature of in een FeatureCollection) of een CSV met regels <c2/>. <c3/> accepteert kaartbestanden of mappen daarvan, en mag worden herhaald. Waypoints worden met rechte lijnen in breedte- en lengtegraad verbonden, dus verdicht lange etappes; een etappe neemt in lengtegraad de korte weg, dus een etappe die de antimeridiaan kruist ({ "179.5" } E naar { "179.5" } W) kruist die. De route wordt in stukken van ongeveer { "250" } m gesplitst. Elk stuk wordt gemeten tussen zijn eigen twee eindpunten op een bol met straal { "6371.0088" } km (hetzelfde pad dat bepaalt in welke cel het ligt) en toegewezen aan de cel die zijn middelpunt bevat.

seg-cc5e2553700b = Per dag en per bron geeft het rapport de lengte van de route en vier aandelen die samen { "1" } vormen: <c1/>, <c2/>, <c3/> (cel aanwezig maar zonder uitspraak) en <c4/> (cel ontbreekt op de kaart). Lees de laatste twee samen met de eerste: een route met een laag gedegradeerd aandeel en een hoog niet-waargenomen aandeel is niet als vrij aangetoond. ADS-B- en AIS-rijen worden afzonderlijk gerapporteerd en nooit gecombineerd. Elke rij draagt de licentie en bronvermelding van de kaart.

seg-3a087d90e317 = Bibliotheekfuncties

seg-67ea1ff00bb8 = Voor aanroepers die gegevens in het geheugen hebben (bindings, de MCP-server, de browserbuild) biedt de module <c1/> dezelfde methoden met tekst of bytes als invoer en JSON als uitvoer, zonder een bestand of het netwerk aan te raken:

seg-4dbf41c0ec3b = Functie

seg-95f87a38a522 = Invoer

seg-0fe8ff25f4a1 = Uitvoer

seg-9e99af2c1f84 = ADS-B-CSV-tekst

seg-e144f449c5b4 = één bytereeks per readsb-tracebestand (gzip of gewoon)

seg-7effd7110c4c = AIS-CSV-tekst, optioneel GeoJSON-tekst van het land

seg-10c5e0c0a9c8 = routetekst, GeoJSON-teksten van kaarten, optionele grenzen <c1/>

seg-be00d23d96e9 = JSON <c1/>

seg-20a842d675c2 = Een <c1/> heeft <c2/> (<c3/>), <c4/> en <c5/> (het document v1). <c6/> is <c7/> of <c8/>; <c9/> is { "0.5" }. Fouten zijn <c10/>. De datasetregels (toegestane voorinstellingen, licentietekst vereist, type moet overeenkomen) gelden precies zoals op de opdrachtregel.

seg-1195686de09b = Externe validatie

seg-0de37085f544 = <c1/> vergelijkt Kshana met onafhankelijke implementaties op synthetische invoer, met toleranties die vooraf zijn vastgelegd in <c2/>: de betekenis van de codes NIC en NACp tegen decodering met pyModeS van synthetische ADS-B-frames, AIS-waarden voor niet beschikbaar tegen decodering met pyais van synthetische AIVDM-zinnen, celtoewijzing in het raster tegen shapely, routelengte per celtoestand tegen shapely en GeographicLib, en landinwaartse maskering tegen shapely en pyproj. De fixtures worden gemaakt door <c3/>; CI heeft geen Python nodig. Dit valideert hoe de codes en veldwaarden worden gelezen en de geometrie. Het valideert niet dat een gemarkeerde cel interferentie is.

seg-56a3e955cbcc = Alle tests gebruiken synthetisch gegenereerde gegevens en geen netwerk: unittests in <c1/>, en <c2/> voor de opdrachten van begin tot eind, inclusief dat geen enkele identificator in een uitvoer terechtkomt en dat weigeringen geen bestanden achterlaten.

seg-212c43d1a41c = <s1>Vorige</s1>NMEA-trainingsstromen

seg-7f13ee5d254e = <s1>Volgende</s1>Interferentiekaart: gegevensbronnen en licenties

seg-1fc1794d9388 = ADS-B-methode (kshana-interference-map/adsb/v2)

seg-a3a97ab49ed1 = AIS-methode (kshana-interference-map/ais/v2)

seg-e3949a1e6082 = Zendergebied (<c1/>)
