# docs--osnma: translations (nl)

seg-fcd0ebea49bc = Opdrachtregel

seg-6816f4e1a0a0 = Versie

seg-94058315dfe4 = Invoer

seg-23746ba370c2 = Bron: <c1/>

seg-1e9c104231db = Galileo OSNMA-verificatie aan de kant van de ontvanger

seg-17fd702f5997 = Een verificatieprogramma aan de ontvangerkant voor Galileo Open Service Navigation Message Authentication (OSNMA), in zuiver Rust. Het leest I/NAV-pagina's en rapporteert, per satelliet en per epoch, of de navigatiedata cryptografisch is geauthenticeerd, en waarom een controle faalde.

seg-ae081f55c4f1 = <b>Adviserend.</b> Dit is analyse- en monitoringuitvoer en geen typegoedgekeurde navigatieapparatuur. De hier gemelde authenticatiestatus is geen navigatie-integriteitsdienst en mag niet de enige basis zijn voor enige navigatie- of veiligheidsbeslissing.

seg-84d7260098b1 = KENNISGEVING: intellectueel eigendom in de Galileo OSNMA-interface

seg-6d78ccef53d5 = Kshana verleent geen rechten onder het intellectueel eigendom van de Europese Unie in het Galileo OSNMA Signal-in-Space Interface Control Document (de "ICD IPR's"). De ICD bevat een eigen toestemming (haar Annex E), die niet-exclusief en royaltyvrij is en eigen voorwaarden, reikwijdte en grenzen heeft. Wie software gebruikt, bouwt of verspreidt die op deze module is gebaseerd, vertrouwt rechtstreeks op die toestemming en moet de voorwaarden ervan zelf lezen en aanvaarden. De licentie van Kshana (AGPL-3.0-only, of de commerciële licentie) dekt alleen de eigen code van Kshana.

seg-c13ad334bf9a = Deze module implementeert de algoritmen die de onderstaande documenten beschrijven. De ICD-tekst wordt niet overgenomen; numerieke waarden (veldindelingen, opsommingen, de MAC-opzoektabel) zijn herschreven in de eigen notatie van Kshana, met de bron aangehaald in de code. De ICD en de Receiver Guidelines zijn © Europese Unie; de bron wordt hier erkend. Kshana is niet ontwikkeld door, niet gebruikt door, niet goedgekeurd door en niet onderschreven door de Europese Unie, de Europese Commissie, EUSPA of enige andere instantie.

seg-860096b04999 = Referentiedocumenten

seg-04c1e1a6278d = Gepubliceerd door het European GNSS Service Centre.

seg-278dd0f9df58 = Document

seg-3427e40d7bee = Datum

seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD ("SIS ICD")

seg-f63fbc1175cf = Issue { "1.1" }

seg-fa85e4db2c93 = oktober { "2023" }

seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

seg-907e4e46056c = Issue { "1.3" }

seg-a9b75bc7f063 = januari { "2024" }

seg-530ae6421157 = Sectie- en tabelnummers die in de code en hier worden aangehaald, verwijzen naar die versies.

seg-143726cc3d5f = Wat wordt geverifieerd

seg-029a9bb7608f = De vertrouwensketen, van de wortel tot aan de data:

seg-886f1b6556ce = <b>Publieke sleutel (ICD { "3.2.2" }, { "6.2" }).</b> Een DSM-PKR wordt uit zijn blokken opnieuw samengesteld en zijn Merkle-pad wordt doorlopen tot een vertrouwde Merkle-wortel (SHA-256).

seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> Een DSM-KROOT wordt opnieuw samengesteld; zijn ECDSA-handtekening (P-256/SHA-256 of P-521/SHA-512) wordt gecontroleerd tegen de publieke sleutel die hij noemt, over de NMA-header en de ketenparameters.

seg-acc1f06cf63a = <b>TESLA-sleutels (ICD { "5.5" }, { "6.4" }).</b> Elke sleutel in een MACK-bericht wordt teruggelopen naar de KROOT of naar een eerder geverifieerde sleutel, met de hashfunctie van de keten.

seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> De flexibele Tag-Info-velden worden gecontroleerd tegen de MACSEQ met de sleutel die die MACK opent.

seg-41ba810d7c8d = <b>Tags (ICD { "4.2" }, { "6.7" }).</b> Elke tag wordt opnieuw berekend (HMAC-SHA-256 of CMAC-AES, afgekapt tot de taglengte van de keten) over de satelliet-identiteiten, de subframetijd, de tagpositie, de NMA-status en de navigatiegegevens die de tag dekt, en vergeleken. ADKD { "0" } (efemeride, klok en status), ADKD { "4" } (tijdsynchronisatieparameters) en ADKD { "12" } (slow MAC, sleutel tien subframes later gepubliceerd) worden verwerkt, met kruisauthenticatie van satellieten die zelf geen OSNMA dragen, en dummytags (COP { "0" }).

seg-1be16a4ca722 = Een tag die een gereserveerde waarde noemt, of waarvan de ADKD niet overeenkomt met de slot in de MAC-opzoektabel, wordt terzijde gelegd (de Receiver Guidelines schrijven voor haar te verwerpen) en gemeld als <c1/>, niet als een fout.

seg-eb993b3a0d17 = Pagina's worden vóór al het andere gecontroleerd op hun CRC (de Galileo-CRC-24Q); een pagina die faalt, wordt verworpen en gemeld (<c1/>).

seg-c414a30d0840 = Statuswaarden

seg-268f61b565b9 = Per tag: <c1/>, <c2/> met een reden (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> met een reden (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>), of <c15/>. Een dummytag (COP { "0" }) verschijnt op tagniveau als <c16/>, omdat zij de sleutel bewijst, maar zij dekt geen navigatiegegevens en telt nooit mee voor een satelliet.

seg-331a6ab821f3 = Per satelliet, in de vorm die de monitor voor ontvangervertrouwen verwerkt:

seg-9912068c5b34 = <c1/> alleen zolang de nieuwste geverifieerde efemeride- en klokgegevens (ADKD { "0" } of

seg-38e7f56293e7 = van die satelliet recent zijn (standaard binnen { "600" } s van de tijd van de verificateur) en nog steeds de gegevens in gebruik zijn. De controle betreft de gegevens, niet de IODnav: de verificateur bewaart de SHA-256 van de geauthenticeerde bitreeks (Word Types { "1" } tot en met { "5" }, zoals ADKD { "0" } ze dekt) en van de nieuwste zulke reeks die de satelliet uitzendt, en deze moeten gelijk zijn. Een gekopieerde IODnav boven andere woorden, of gewijzigde bits van Word Type { "5" } (die geen IODnav dragen), geeft <c1/> totdat de nieuwe gegevens authenticeren. Een subframe dat efemeridewoorden draagt maar geen volledige set Word Types { "1" } tot en met { "5" } onder één IODnav, neemt de status op dezelfde wijze weg (elk echt E1-B-subframe draagt alle vijf); een subframe zonder enig efemeridewoord zegt niets. Tags van een andere satelliet (kruisauthenticatie) tellen mee voor de satelliet wiens gegevens zij dekken.

seg-233109ef4428 = <c1/> wanneer een controle op de gegevens van de satelliet is mislukt binnen het foutgeheugen (standaard { "600" } s van de tijd van de verificateur), ook als latere gegevens wel verifiëren. Een mismatch wordt toegerekend aan de satelliet wiens gegevens de tag dekt en aan de satelliet die de tag heeft uitgezonden, omdat elk van beide de oorzaak kan zijn; een MACSEQ-mismatch wordt toegerekend aan de uitzendende satelliet.

seg-8ba1d89bcf91 = <c1/> in alle andere gevallen, en voor elke satelliet na een geverifieerd alarmbericht, bij NMA-status "don't use" of een gereserveerde status, en totdat de eerste sleutel is geverifieerd.

seg-7fceea6e23f8 = De totaalwaarde is <c1/> als een satelliet is mislukt, <c2/> als minstens één satelliet is geauthenticeerd en geen enkele is mislukt, anders <c3/>. <c4/> is de bijbehorende zin; <c5/> bouwt hem.

seg-446a3218ccbb = Tijd

seg-18e91e6aa160 = De sleutelketen toont dat een sleutel bij een bepaald subframe hoort, niet dat het subframe het huidige is. De verificateur neemt daarom nooit "nu" uit een niet-geverifieerde pagina. Zijn tijd is de latere van de referentietijd die met <c1/> (<c2/>) is opgegeven en het subframe van de nieuwste TESLA-sleutel die is geverifieerd (een sleutel kan niet vóór zijn slot bekend zijn, dus hij bewijst dat de tijd niet eerder is). Foutgeheugen, het geldigheidsvenster van een authenticatie en het verwijderen van oude gegevens lopen op die tijd. Een subframe met een tijdstempel van meer dan drie subframes na de nieuwste geverifieerde sleutel wordt terzijde gelegd, tenzij zijn eigen sleutel zijn tijd bewijst; sleutel- en alarmberichten daarin worden nog steeds verwerkt, omdat zij hun eigen bewijs dragen (een handtekening of de Merkle-wortel).

seg-318323322a3a = De klok staat stil wanneer OSNMA stopt, want alleen sleutels verzetten haar. Een live aanroeper moet <c1/> elk subframe aanroepen met de hosttijd; de authenticatie verloopt dan vanzelf, en <c2/> (eveneens bij elk subframe uitgevoerd) geeft een <c3/>-gebeurtenis terug zodra langer dan het authenticatievenster geen sleutel meer is geverifieerd.

seg-5338d8f5de77 = Wat dit niet geeft, is actualiteit. Zonder een referentietijd uit een bron die een aanvaller niet kan verschuiven, authenticeert een herhaling van oude authentieke gegevens onder oude tijdstempels, en zijn de paginatijdstempels slechts zo goed als hun bron: de CLI zegt dat (<c1/>) telkens wanneer geen referentietijd is opgegeven. Met een referentietijd ligt de tolerantie onder één subframe (standaard { "29" } s; grotere waarden worden geweigerd). Een referentietijd is één enkel tijdstip: subframes die er verder van af liggen dan de tolerantie, worden terzijde gelegd en geteld, dus zij past bij live of zojuist opgenomen gegevens, niet bij een lange opname. Laat bij een opname de referentietijd weg en lees het resultaat als "authentiek, niet noodzakelijk actueel". De Receiver Guidelines geven de formele eis.

seg-aa37ce329914 = De paginatijdstempels van een u-blox-stroom komen uit de niet-geauthenticeerde gegevens zelf (zie Input), dus ook die bieden geen bescherming tegen verouderde gegevens.

seg-a33d72076025 = Ketens, sleutels en alarmen

seg-be2d9588df65 = Geverifieerde ketens worden bewaard per ketenidentiteit (CID); tags worden gecontroleerd met de keten die de NMA-header noemt, en een header die een niet-geverifieerde keten noemt, laat de tags van het subframe ongecontroleerd (<c1/>). Een tweede KROOT van een geldende keten voegt een anker toe; een KROOT van een andere keten wordt ernaast bewaard, zodat het opnieuw aankondigen van de oude keten na een vernieuwing de nieuwe niet ongedaan maakt.

seg-bbb6574fa258 = De NMA-header is niet geauthenticeerd, dus wat hij aankondigt telt alleen als het is bevestigd: wanneer meer dan één satelliet in een subframe dezelfde header uitzendt, of wanneer het ondertekende bericht van een geverifieerde KROOT hem bevat (de header maakt deel uit van dat bericht). De twee zijn niet gelijkwaardig. Overeenstemming van meer dan één satelliet beschermt tegen een afwijking bij één satelliet, niet tegen een spoofer: één spoofer kan twee satelliet-id's vervalsen. Wat hem dat oplevert, is denial of service en niets meer, aangezien een bevestigd "don't use" de geauthenticeerde gegevens van elke satelliet wist: het opheffen ervan, vervalst of echt, herstelt niets totdat nieuwe tags verifiëren onder echte operationele subframes. (Vóór dat wissen kon een vervalste opheffing, tot aan het authenticatievenster, gegevens terugbrengen die al waren geauthenticeerd.) De echte bevestiging is de met KROOT ondertekende header, die ook een "don't use" weer opheft wanneer hij een operationele status draagt. De header van één enkele satelliet verandert niets behalve de tagcontrole van het eigen subframe. Een KROOT waarvan het toepassingstijdstip niet later is dan dat van de keten die voor dezelfde id wordt gehouden (een herhaling van een oudere) wordt geweigerd (<c1/>); een KROOT van dezelfde keten voegt een anker toe.

seg-5c08dbaa8d43 = De status en de CPKS-waarde van de bevestigde header sturen de intrekking aan. Bij NMA-status "don't use" laat CPKS "chain revoked" de keten vallen die de header noemt en weigert vanaf dan haar KROOT; CPKS "public key revoked" laat de publieke sleutel vallen die die keten heeft ondertekend, en elke keten die ermee is ondertekend. Als de vervangende keten voor die id is overgenomen voordat de header werd bevestigd, hoe lang ervoor ook, is de ingetrokken sleutel die van de vorige keten, niet die van de nieuwe; dat geheugen blijft bewaard totdat de intrekking is uitgevoerd of de header van een andere procedure wordt bevestigd, en een intrekkingsheader die elk subframe wordt herhaald, wordt eenmaal uitgevoerd. Dezelfde CPKS-waarden met status operationeel markeren de overgang naar de vervanging en trekken niets in. De header is zelf niet geauthenticeerd, dus een vervalste intrekking kan alleen authenticatie wegnemen, en zij is definitief totdat de verificateur opnieuw is gestart. Die definitiviteit geldt ook voor de actieve sleutel: een vervalste intrekking van een publieke sleutel wist het geheugen van de vervangen sleutel en trekt de sleutel in gebruik in, en alleen een herstart maakt dat ongedaan.

seg-e7d43eb18c24 = Een DSM-PKR met NPKT { "4" } is het alarmbericht; het wordt net als een sleutel via de Merkle-boom geverifieerd, waarbij zijn willekeurige NPK-veld deel van het blad is. Een geverifieerd alarm wist alle ketens en publieke sleutels, weigert elke latere KROOT en publieke sleutel, en maakt elke satelliet <c1/>, zoals de Receiver Guidelines voorschrijven, totdat de verificateur opnieuw is gestart.

seg-4068e9bda7c1 = Het opvulveld van een DSM-KROOT is een hash van het ondertekende bericht en de handtekening. Het wordt vóór de handtekening gecontroleerd, en het zegt ook met welke NMA-header het ondertekende bericht is gebouwd wanneer de header veranderde terwijl het bericht werd samengesteld.

seg-8ea31bf25ef0 = Wat niet wordt geverifieerd, of niet wordt beproefd

seg-3d0808cab632 = <b>Actualiteit.</b> Zie Tijd hierboven: daarvoor is een referentietijd van buiten nodig.

seg-b3d63950baa4 = <b>Vernieuwing en intrekking.</b> Ketens en sleutels worden gevolgd zoals de stromen van de gepubliceerde vectoren ze beproeven (vernieuwing, einde van een keten, intrekking van keten en sleutel, nieuwe publieke sleutel, nieuwe Merkle-boom, alarm), niet elk geval dat de ICD toestaat. Een intrekking die door de niet-geauthenticeerde header wordt aangekondigd, wordt op haar woord genomen en is definitief voor de sessie. Een nieuwe Merkle-boom wordt alleen opgepikt via de Merkle-wortel die aan de verificateur wordt gegeven.

seg-f01d90a44585 = <b>Merkle-boomhash.</b> DSM-PKR-berichten worden gecontroleerd met een SHA-256-boom. Een SHA3-256-boom, die de ICD in de toekomst toestaat, wordt niet ondersteund. De hashfunctie van de keten kan SHA-256 of SHA3-256 zijn.

seg-d9ca4e69ffc9 = <b>Sleutelstatuslijsten.</b> Intrekking wordt gevolgd via de NMA-header en de berichten in de stroom; certificaatintrekkingslijsten worden niet gelezen.

seg-73e0b16d03c7 = <b>Dekking van geauthenticeerde gegevens.</b> ADKD { "4" } met COP { "1" } in een oneven subframe verzonden kan niet authenticeren (Word Type { "10" } kan een of twee subframes eerder worden verzonden); dit kost alleen beschikbaarheid, nooit juistheid.

seg-acc28dcced83 = <b>Bewerking in constante tijd.</b> Niet geboden en niet nodig: de verificateur bewaart geen geheimen (alleen publieke sleutels, gepubliceerde ketensleutels en ontvangen gegevens).

seg-b2f8ec90ae39 = <b>Signaal- en gegevenskwaliteit.</b> Pagina's worden op CRC gecontroleerd en alarmpagina's verworpen, maar over het signaal waarop zij binnenkwamen, is niets bekend. Reed-Solomon-herstel van I/NAV-woorden { "1" } tot en met { "4" } wordt niet gebruikt: gegevens moeten rechtstreeks worden ontvangen.

seg-97313ba2bf88 = <b>Geen integriteitsdienst voor positiebepaling.</b> Authenticatie zegt dat de gegevens van het systeem kwamen. Zij zegt niets over het signaal waarop zij binnenkwamen of over de kwaliteit van de positiebepaling.

seg-d696f298c4a2 = <b>Eenvoudig paginaformaat.</b> Eén paginapaar per regel: <c1/>, <c2/>-commentaar toegestaan. <c3/> is GST in seconden (<c4/>) aan het begin van de pagina; de hex-waarde zijn de { "240" } bits van de even en oneven helft (staarten inbegrepen), meest significante bit eerst.

seg-e436d96b12cf = <b>Testvector-CSV.</b> De opmaak van de gepubliceerde vectoren (<c1/>). De starttijd komt uit <c2/> of uit een gedateerde bestandsnaam.

seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Een ruwe UBX-bytestroom (<c1/>, automatisch herkend). Galileo E1-B I/NAV-berichten worden herbouwd tot paginapaar (<c2/>); andere systemen, E5b, alarmpagina's en frames met een foute checksum worden genegeerd. SFRBX draagt geen tijd, dus elke pagina krijgt een tijdstempel uit de tijd in haar eigen gegevens (woordtypen { "5" } en { "0" }) en wordt alleen geaccepteerd als opeenvolgende pagina's met tijd overeenkomen met het aantal pagina's dat ertussen is ontvangen; pagina's die niet kunnen worden geplaatst, worden verworpen, nooit geraden. Die tijd komt uit de gegevens zelf en geeft geen bescherming tegen verouderde gegevens (zie Tijd hierboven). Signaal-id { "0" } (E1-C) draagt geen gegevens, dus het accepteren ervan naast E1-B is onschadelijk. Een verdwaald synchronisatiepaar met een absurde lengte houdt de lezer niet op. De framingcode is een derde kopie van de UBX-framing in de boom (<c3/>, de invoer voor ontvangervertrouwen); hij wordt apart gehouden zodat het gedrag van ontvangervertrouwen ongewijzigd blijft, en de drie zouden later één lezer kunnen delen. De woordindeling van een SFRBX-bericht is overgenomen uit openbare beschrijvingen en alleen op synthetische frames gecontroleerd, niet op een live ontvanger.

seg-47118a577876 = De tekstuitvoer geeft de status per satelliet en, met <c1/>, per tag en epoch; <c2/> geeft hetzelfde met de taglijst. Exitstatus { "3" } betekent dat een controle op de gegevens van een satelliet is mislukt, { "2" } betekent een gebruiks- of invoerfout. Het adviserende bericht hierboven wordt op elk pad als eerste afgedrukt, ook bij fouten en gebruiksmeldingen.

seg-e2af23b756f5 = Vanuit Python en WebAssembly

seg-4edf83a818d1 = <c1/> (Python) en <c2/> (WebAssembly) voeren dezelfde verificateur uit op bytes in het geheugen en geven de JSON terug die <c3/> afdrukt, inclusief het adviserende bericht. De MCP-server draagt hem niet: de invoer is een lange ruwe ontvangerstroom die beter past bij de opdrachtregel en Python, en een agenttool zou een groot invoeroppervlak toevoegen zonder voordeel. Hetzelfde adviserende bericht en dezelfde beperkingen gelden; de status is geen dienst voor navigatie-integriteit.

seg-0987c3b00a14 = Tests en testgegevens

seg-2acc9fa7212b = De testgegevens zijn synthetisch en worden gegenereerd door Kshana's eigen code en tests. In deze repository worden geen ICD- of Guidelines-vectoren, uitgewerkte voorbeelden of sleutelmateriaal bewaard. De standaardtests (<c1/> en de unittests) bouwen een keten, pagina's en tags uit de vergelijkingen en controleren consistentie en dat opzettelijke corruptie wordt betrapt: een omgeklapte navigatiebit, een omgeklapte sleutelbit, herhaalde tags, verkeerde tijdstempels, een tijd buiten de referentie, ontbrekende gegevens, en de aanvallen die de review vond (een gespoofd subframe ver in de toekomst dat een fout niet mag wissen, authenticatie die moet verlopen en de IODnav moet volgen, een alarm, NMA-status "don't use", dummytags, MACSEQ-mismatch, tegenstrijdige sleutels, intrekking en vernieuwing van een keten, een foute opvulling of handtekening), met CMAC-AES, een SHA3-256-keten en een P-521-handtekening door de verificateur heen. Omdat die gegevens voortkomen uit onze eigen lezing van de ICD, tonen zij zelfconsistentie, geen conformiteit.

seg-4906b14a33a3 = De primitieven worden gecontroleerd met gepubliceerde known-answer-tests, geen enkele uit de ICD: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) en RFC { "6979" } (ECDSA P-256). P-521-handtekeningen worden op codering en hashkeuze gecontroleerd met een wegwerpsleutel die in de test is gemaakt; de rekenkunde van de kromme is die van de bibliotheek.

seg-82ee90adf7ed = Conformiteit wordt gecontroleerd door <c1/>, die opt-in is: hij leest een kopie van het officiële testvectorarchief die u zelf downloadt, uit de map die <c2/> noemt, en doet niets wanneer de variabele niet is ingesteld. Hij slaat niets op en verspreidt niets opnieuw, en standaardtestruns gebruiken geen netwerk. Hij geeft de verificateur alleen een Merkle-wortel en de publieke sleutels van één boom, zoals een ontvanger die zou hebben, zodat ketens worden opgebouwd uit de ondertekende DSM-KROOT in de stroom en het hele pad wordt doorlopen: Merkle, handtekening, sleutelketen, MACSEQ en tags. Per vectorset toetst hij een ondergrens voor de geauthenticeerde tags, dat er geen is mislukt, welke ketens en sleutels de stroom aankondigt, geauthenticeerde tags van ADKD { "0" }, { "4" } en { "12" }, dat authenticatie hervat na einde van een keten, intrekking van een keten, intrekking van een sleutel en een nieuwe publieke sleutel, dat het alarmbericht verifieert en niets geauthenticeerd laat, en dat elke vector uitsluitend HMAC-SHA-256, een SHA-256-keten, 128-bits sleutels, 40-bits tags en opzoekingangen { "33" } en { "34" } gebruikt. Andere algoritme- en parameterkeuzes van de ICD worden dus alleen gedekt door de known-answer-tests en de synthetische tests hierboven.

seg-70bb026ce655 = Afhankelijkheden

seg-00a3dd901039 = RustCrypto-crates, pure Rust, MIT OR Apache-2.0, gebouwd zonder standaardfeatures: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> en <c6/> (de feature <c7/>, alleen voor verificatie gebruikt), naast <c8/> dat al in de boom zit. Ze bouwen voor <c9/> en slagen voor <c10/>.

seg-7ab62b91d469 = <s1>Vorige</s1>Vertrouwen als beveiligingstelemetrie

seg-5dc48294fbb2 = <s1>Volgende</s1>LunaNet-aangevuld voorwaarts signaal
