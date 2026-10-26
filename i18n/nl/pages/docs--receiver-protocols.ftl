# docs--receiver-protocols: translations (nl)

seg-99427ab75a03 = veld

seg-75e6589cf544 = Bron: <c1/>

seg-4540630d4859 = Ontvangerprotocollen die receiver-trust leest ({ "0.38" })

seg-906a5f9e6cd9 = Overal alleen lezen: niets hier schrijft een byte naar een ontvanger en er bestaat geen enkel zendpad. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de exploitant blijft verantwoordelijk.

seg-a44353d98d6c = De eigen spoofing- en jammingvlaggen van de ontvanger (UBX)

seg-b58d3a8f292c = bericht

seg-24c57b65b8f7 = gelezen als

seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } bytes

seg-3fb608c6c3ea = byte <c1/> op offset { "7" }, bits { "4" }..3: <c2/>

seg-54d4cf306b49 = { "0" } onbekend of gedeactiveerd, { "1" } geen spoofing aangegeven, { "2" } spoofing aangegeven, { "3" } meerdere aanwijzingen voor spoofing (protocol { "18" } en later; interfacebeschrijving van u-blox F9 HPG { "1.32" }, sectie { "3.15.20" })

seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) versie { "1" }, { "12" } bytes

seg-e7e262087849 = <c1/> op { "4" } (bit { "0" } jamDetEnabled, bits { "2" }..1 jammingState); <c2/> op { "8" } (bit { "0" } spfDetEnabled, bits { "3" }..1 spoofingState)

seg-3e117e319518 = toestanden worden alleen gelezen waar de detector is ingeschakeld; { "0" } onbekend, { "1" } geen, { "2" } waarschuwing of aangegeven, { "3" } kritiek of bevestigd

seg-8a5a59761cd0 = UBX-SEC-SIG versie { "2" }

seg-9626adf4a5e7 = <c1/> op { "1" } (bit { "0" } jamDetEnabled, bits { "2" }..1 jammingState, bit { "3" } spfDetEnabled, bits { "6" }..4 spoofingState); <c2/> op { "3" } en zoveel groepen van 4 bytes (niet gebruikt)

seg-e0eb14018b2c = zoals hierboven

seg-b0c1eaeb4185 = <b>Bron van de SEC-SIG-indeling.</b> De interfacebeschrijvingen van u-blox F9 HPG { "1.32" } en M10 SPG { "5.10" } die konden worden gedownload toen dit werd geschreven, noemen UBX-SEC-SIG maar definiëren het niet. De indelingen hierboven zijn die van de latere interfacebeschrijvingen van u-blox zoals getranscribeerd in de bibliotheek pyubx2 (BSD-3-Clause, <c1/> en <c2/>); de fixturetests in <c3/> zijn uit die indeling opgebouwd, niet uit de uitvoer van een echte ontvanger. Indeling uit een open transcriptie, niet gecontroleerd aan de actuele gids van de fabrikant: controleer haar aan de actuele interfacebeschrijving van u-blox voordat u op SEC-SIG vertrouwt.

seg-6af7d45be34d = Een SEC-SIG heeft geen tijd van de week; het hoort bij de huidige navigatie-epoche. Een toestand die al in een epoche is gelezen blijft behouden, tenzij een latere slechter is.

seg-f1cf7ee27cb1 = De vergelijking <c1/>

seg-f30ddb83bf99 = Waar een logboek deze vlaggen bevat, heeft elke epoche van het resultaat <c1/> (de twee toestanden, of de ontvanger vlagt, of een monitor van Kshana alarm sloeg, en <c2/>: <c3/>, <c4/>, <c5/>, <c6/> of <c7/>), en heeft het resultaat <c8/> met de aantallen en de eerste epoche van elk. De ontvanger "vlagt" bij een toestand van { "2" } of hoger. Het <b>geeft geen alarm en wijzigt geen score</b>, en geen van beide kanten is de referentie: overeenstemming is geen validatie, en een verschil zegt dat de ene detector iets zag wat de andere niet zag, niets over welke gelijk had. De strook van Studio leest <c9/>.

seg-49ae6094c06a = Septentrio SBF (<c1/>)

seg-4d6365d9ffd1 = <c1/> decodeert met de crate <c2/> ({ "0.4" }, <b>MIT</b>; de enige afhankelijkheid is <c3/>; een permissieve licentie die <c4/> toestaat). Gelezen blokken: PVTGeodetic ({ "4007" }) voor de positiebepaling, MeasEpoch ({ "4027" }) voor C/N0 per satelliet en signaal (<c5/> is de naam van het signaal, zoals <c6/>), en RFStatus ({ "4092" }) voor het aantal RF-banden waarvan de byte <c7/> niet nul is (<c8/>, meegedragen en <b>niet geïnterpreteerd</b>: het telt nooit als vlag). Epochen worden gesleuteld op tijd van de week en weeknummer en gelabeld in GPS-tijd (<c9/>). Een blok dat zijn CRC of parse niet doorstaat telt als een overgeslagen record. Deze lezer leest geen AGC of jammingindicator, dus de monitors voor C/N0-daling en verlies van lock draaien en de monitors voor AGC en jammingindicator niet.

seg-f86f2c25f41a = <b>Bron van de indelingen.</b> De referentiegids van Septentrio kon niet worden gedownload toen dit werd geschreven (de server weigerde het verzoek), dus de indelingen zijn overgenomen uit de bron van <c1/>, die de gids aanhaalt, en de fixtures in <c2/> zijn synthetische blokken die volgens die indeling en haar CRC-16-CCITT zijn gebouwd. Er is geen echt SBF-logboek gebruikt. Indeling uit de opensource-crate, niet gecontroleerd aan de actuele gids van de fabrikant: controleer aan de referentiegids van Septentrio voordat u erop vertrouwt.

seg-680fa4eea3f4 = Directe seriële en USB-invoer (<c1/>)

seg-38fcf7d91b6e = Alleen Unix. Het opent het apparaat om te lezen, zet de <b>lokale</b> lijn in rawmodus op <c1/> (standaard { "4800" }, de NMEA-snelheid van { "0183" }) en leest NMEA-regels zoals elke andere bron. Het schrijft nooit naar de ontvanger. <c2/> wordt met een uitleg geweigerd: Kshana configureert geen ontvangers; stel de ontvanger in om NMEA uit te voeren met het eigen hulpmiddel van de fabrikant en lees het dan. De invoer is NMEA, zoals voor elke bron van <c3/> (UBX en SBF worden uit bestanden gelezen). Een apparaat dat verdwijnt beëindigt de opdracht als storing (exit { "1" }), zodat een supervisor die kan herstarten; de laag maakt niet opnieuw verbinding. Getest op een pseudo-terminal-loopback (<c4/>), inclusief dat de masterzijde geen byte van de opdracht ontvangt.

seg-97e1ea47c2be = <s1>Vorige</s1>Machine- en sensorinvoer

seg-55ad3fc908be = <s1>Volgende</s1>Interferentie-observatorium: methode

seg-17c3203ee615 = De vergelijking met de zelfrapportage van de ontvanger

seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

seg-8444127e7ee6 = Directe seriële en USB-invoer (receiver-trust live --serial)
