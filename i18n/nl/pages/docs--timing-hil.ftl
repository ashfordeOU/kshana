# docs--timing-hil: translations (nl)

seg-f8cf777c0caa = Onderdelen

seg-f2ce7fc60cdf = Formaat

seg-d00b65801e9b = Stap

seg-0d580ea8043d = Een holdovertest gescoord uit een tijdfoutregistratie, uit een echte run van engine v{ $version } op scenarios/holdover-test-example.toml ({ "601" } samples elke { "5" } s). GNSS wordt door de operator weggenomen bij { "600" } s en hersteld bij { "2400" } s; de tijdfout loopt op tot { "299" } ns aan het einde van de holdover, voorbij het budget van { "100" } ns na { "675" } s, en keert { "70" } s na herstel terug binnen de band van { "100" } ns. Oordelen: basislijnmaskers PASS, holdovermaskers FAIL, holdoverenvelop FAIL, herstel RECOVERED. Gemeten tegen het masker, geen goedkeuring. De tijden zijn de verklaring van de operator, niet geverifieerd door Kshana. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringtool, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens.

seg-7a1246297c82 = Bron: <c1/>

seg-6ea3dec83080 = Hardware-in-the-loop voor tijdsynchronisatie: trek de antenne los, score de holdover

seg-5901f0b26939 = Telecom- en energie-exploitanten testen een tijdsynchronisatiesysteem door er GNSS van weg te nemen en te kijken wat de klok doet. Kshana doet dat niet voor hen en raakt hun apparatuur niet aan. Het leest het tijdfoutrecord dat de eigen instrumenten van de exploitant produceerden, splitst het op de twee tijdstippen die de exploitant vermeldt, en <b>meet elke stap aan openbare ITU-T-maskers</b>. De scenariosoort is <a1><c1/></a1>; de voorbeeldscenario's zijn <c2/> en <c3/>.

seg-daf4b071bad0 = Dit is hardwareveiligheid <b>fase { "1" }</b>: passief, alleen ontvangen, geen RF van Kshana (<a1><c1/></a1>). Adviserende software, geen typegoedgekeurde apparatuur. Niemand heeft deze procedure gekeurd, goedgekeurd of beoordeeld, en ze zegt niets over de vraag of een systeem een Aanbeveling haalt.

seg-da0c48bbe011 = De procedure

seg-e753ca7a1c99 = De exploitant voert vier stappen uit. Kshana voert er geen enkele uit.

seg-0c338b956741 = Wat de exploitant doet

seg-ebd95b343349 = Wat het record laat zien

seg-03999de98059 = { "1" }. Basislijn

seg-730f2037d22a = Laat het systeem zo lang als de test nodig heeft aan GNSS vergrendeld draaien (en noteert hoeveel dagen het daarvoor vergrendeld was).

seg-f45aae4139bd = De tijdfout terwijl het gedisciplineerd is.

seg-0f050dcede80 = { "2" }. GNSS verwijderd

seg-50c0df832eda = Verwijdert GNSS van het te testen systeem, bijvoorbeeld de antennekabel bij de ontvanger, of de uitvoer van de eigen simulator van het lab, en <b>noteert het tijdstip</b>. Controleer eerst de handleiding van de ontvangerfabrikant: sommige ontvangers voeden de antenne, en sommige hebben een afsluitweerstand nodig op de open poort.

seg-e371e7e357e3 = Het moment waarop de tijdfout begint te wandelen.

seg-f05dc0acb396 = { "3" }. Holdover

seg-a98186503e0f = Laat het systeem de geplande tijd op zijn eigen oscillator draaien.

seg-1da66cdca856 = De holdover van het systeem.

seg-61197c9bad91 = { "4" }. Herstel

seg-75af1f4fec83 = Herstelt GNSS en <b>noteert het tijdstip</b>.

seg-1259d36fc78c = De tijdfout die terugkeert (of niet).

seg-c09b1ea8f1a4 = Twee dingen moet de exploitant doen, omdat Kshana dat niet kan:

seg-31f6c357864b = Vermeld de twee tijdstippen.

seg-59f9eb10035a = <c1/> en <c2/> zijn de verklaring van de exploitant. Kshana detecteert het verwijderen niet uit het record en verifieert de tijdstippen niet. Een verkeerd tijdstip verschuift de stapgrenzen en dus het resultaat.

seg-6d0d3186fbe3 = <b>Gebruik dezelfde klok voor het record en de tijdstippen.</b> Bij een klokcollectie begint de tijdas bij de eerste meting, dus de twee tijdstippen zijn seconden vanaf de eerste regel van de log.

seg-bd181a831803 = Wat u moet vastleggen

seg-52758c10be0a = Elk van deze, via de bestaande lezers <c1/> (<a1><c2/></a1>):

seg-fef0034cb88b = Instrument

seg-ad6f33d70f3f = Hoe het record wordt gemaakt

seg-ef7f547609ad = linuxptp <c1/> (de servo van de slave- of boundary-klok)

seg-f548a2ae96e5 = draai met <c1/> en bewaar de regels <c2/>

seg-9a3b58be1b0b = linuxptp <c1/>

seg-77255f8f5fef = de regels <c1/>

seg-2cf9256bd790 = linuxptp <c1/>

seg-c667a97b92a8 = de regels <c1/>

seg-ed305bcea4f8 = chrony <c1/>

seg-021b760aae59 = <c1/> in <c2/>

seg-a7f2d72a5cb7 = chrony <c1/>

seg-a70952a099d5 = <c1/> in <c2/>

seg-6ad29120ffe7 = een TAPR TICC-teller

seg-32f703bfcab7 = tijdstempelmodus tegen de referentie

seg-6862a9ac9a68 = een ASCII-export van TimeLab

seg-b5e7e3a272d6 = fase in een vermelde eenheid

seg-8af4aac4426f = een RINEX-klokbestand

seg-21d5c43719f2 = één klok

seg-3a82b5295ab1 = al het andere

seg-6bebda4a3c6c = <c1/> of <c2/>

seg-9a443cc0c444 = paren <c1/>, uniform bemonsterd

seg-b8d1d45df70b = <b>Wat het record meet, doet ertoe.</b> Een servolog (linuxptp, chrony) legt de offset vast die de daemon mat en corrigeert: het is de tijdfout die onder servoregeling overblijft, geen onafhankelijke meting van de klok tegen UTC. Tijdens de holdoverstap van een test die de referentie echt verwijdert, toont een servolog nog steeds wat de daemon geloofde, wat kan verschillen van de ware fout. Een TICC of een andere teller tegen een onafhankelijke referentie is het sterkere record; vermeld welke u hebt gebruikt wanneer u het resultaat rapporteert.

seg-6d4e25914d1c = Het scenario

seg-ca1244db2387 = Optionele sleutels: <c1/> (naam, <c2/>, bron; de standaardwaarden voor telecom-tijdsynchronisatie als ze ontbreken) en <c3/> binnen <c4/> om één bron te kiezen uit een log met meerdere bronnen.

seg-38eb634b7f8f = Wat het rapport bevat

seg-6a64755e11d6 = <b><c1/></b>: voor de basislijn, de holdover en het herstel: het begin en het einde, het aantal samples en de gemiddelde, rms-, grootste en eindwaarde van de tijdfout.

seg-cd11d0838c44 = <b><c1/></b>: elk masker dat u hebt genoemd, gemeten op de stap die in de voorwaarde van het masker wordt genoemd. Een masker dat is geschreven voor een vergrendelde klok wordt gemeten op de basislijn; een masker voor holdover of een autonome klok op de holdover. Elke controle heeft haar limiet, de gemeten waarde, de marge en de tabel waaruit ze is overgenomen. Een masker dat een langere meetreeks nodig heeft dan de stap opleverde, is <b>INCOMPLETE</b> en wordt nooit geëxtrapoleerd; een masker dat de engine niet kan evalueren voor het sampleinterval van de meetreeks is <b>NOT-EVALUATED</b>, met de reden.

seg-cb54e67ca4eb = <b><c1/></b>: de fractionele frequentieafwijking die het systeem aanhield (de helling van een kleinstekwadratenlijn door de tijdfout tijdens de holdover, in ns/s, oftewel parts per billion), de restwaarde rond die lijn, de grootste absolute tijdfout en wanneer die optrad, en de stap op het moment van verwijdering.

seg-daa40ac07396 = <b><c1/></b>: de ePRTC-A-holdoverenvelop van ITU-T G.8272.1 Table { "3" }, uit <c2/>, met het moment waarop die voor het eerst wordt overschreden.

seg-cd480a1bf901 = <b><c1/></b>: de tijd na verwijdering waarop elk tijdfoutbudget voor het eerst wordt overschreden.

seg-007a0393cb39 = <b><c1/></b>: of <c2/> binnen de band kwam en daar de verblijftijd lang bleef, hoelang nadat GNSS terugkeerde dat begon, de piek na herstel en de grootste stap tussen opeenvolgende samples tijdens het herstel.

seg-199497dfcc09 = <b><c1/></b>: MTIE en TDEV van de stappen basislijn en holdover.

seg-ce00a41a322f = <b><c1/></b>: een samenvatting van één woord per stap.

seg-c09fc305ead1 = Elk getal heeft zijn eenheid en vermeldt waar het vandaan komt, in het blok <c1/> van het rapport.

seg-5d87a772c132 = De woorden en de grenzen

seg-0810b24c6f3e = Het resultaat is <b>gemeten tegen het masker</b>. De maskers zijn overgenomen uit vrij downloadbare ITU-T-aanbevelingen (dezelfde tabellen als van het soort <c1/>, vermeld in <a1><c2/></a1>), en elke waarde die de aanbevelingen "voor nader onderzoek" laten, ontbreekt en is niet ingevuld. { -brand } stelt niet dat een klok of een systeem voldoet aan een aanbeveling of daartegen is goedgekeurd, en het rapport doet dat evenmin.

seg-527189cf37c6 = <b>MODELLED.</b> De stappenlogica, de lijnfit en de herstelregel zijn gecontroleerd op meetreeksen die zijn opgebouwd uit formules waarvan de uitkomsten vóór de run bekend zijn; er is geen laboratorium-holdover gescoord tegen een externe onafhankelijke referentie, en geen partner of laboratorium is met iets akkoord gegaan. Er zou een tijdsynchronisatielaboratorium nodig zijn voordat een cijfer per klokklasse kan worden bevorderd.

seg-ad8160fbed46 = <b>Wat niet wordt gedekt</b>, vermeld in elk rapport: of GNSS echt op de opgegeven tijdstippen is verwijderd en hersteld; elke stap die de operator niet heeft vastgelegd; maskers die zijn gedefinieerd via een { "0.1" } Hz-filter voor een meetreeks die langzamer is bemonsterd dan eenmaal per seconde; de eigen meetonzekerheid van het instrument; en elke procedure uit een aanbeveling die verder gaat dan een tijdfoutmeetreeks (temperatuurprofielen, belasting van het pakketnetwerk).

seg-cf681db42f05 = <b>De herstelband is de eigen keuze van de test.</b> De standaardwaarde van { "100" } ns is de maximale absolute tijdfout van een PRTC-A (ITU-T G.8272); het is een handige lijn, geen eis van enige aanbeveling voor herstel.

seg-4ce2f2052df4 = <b>Geen zendpad.</b> { -brand } leest bestanden. Het genereert geen signaal, en het verwijderen van GNSS in een laboratorium gebeurt met de eigen apparatuur van het laboratorium en onder zijn eigen autorisatie.

seg-0cff831a8444 = <c1/> is een scenariosoort en draait dus overal waar soorten draaien: <c2/>, de Rust-API (<c3/>), de Python-binding (<c4/>), de WebAssembly- en npm-build (inline <c5/> of <c6/>; de bestandssleutels zijn daar niet beschikbaar), de MCP-server (<c7/>, alleen inline inhoud) en de scenariouitvoerder van { -brand } Studio. De twee scenariobestanden worden meegeleverd (<c8/>).

seg-432c07a8e6f5 = <s1>Vorige</s1>Misleide tijd

seg-8499ae539222 = <s1>Volgende</s1>Klok-logformaten
