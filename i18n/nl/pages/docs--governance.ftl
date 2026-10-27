# docs--governance: translations (nl)

seg-26440a254ba8 = Bron: <c1/>

seg-5f8e9a4a15be = Bestuur van { -brand }

seg-b20b74b77755 = Dit document beschrijft hoe { -brand } wordt bestuurd: wie beslissingen neemt, hoe, en wat het project wel en niet opneemt. Het is bewust <b>licht</b>, in verhouding tot de huidige omvang van het project, en is eerlijk over de huidige situatie met één beheerder en over het pad naar breder bestuur naarmate de gemeenschap groeit.

seg-1e0c276811e2 = Missie en reikwijdte

seg-5dcc38148cf4 = { -brand } is een <b>neutrale, reproduceerbare, eerlijk getoetste referentie voor de prestaties en veerkracht van hybride kwantum/klassieke PNT</b>. De missie legt de lat voor elke beslissing: correctheid, bronvermeldingen en reproduceerbaarheid gaan voor breedte. De eerlijke reikwijdte is gedocumenteerd in <a1><c1/></a1> en de validatiestatus in <a2><c2/></a2>; voorstellen worden gewogen tegen die reikwijdte, niet tegen het aantal functies.

seg-d331a1cfc60b = Rollen

seg-88bb2a831125 = <b>Beheerder.</b> { -brand } wordt momenteel beheerd door de oprichter, Ashforde OÜ (contact: <c1/>). De beheerder neemt de eindbeslissing over reikwijdte, ontwerp, releases en wat wordt samengevoegd. Dit is een model met een welwillende beheerder, openlijk benoemd in plaats van verhuld als een commissie die niet bestaat.

seg-8e1da46f9b0b = <b>Bijdragers.</b> Iedereen die een issue of pull request opent. Bijdragen worden getoetst aan de drempel in <a1><c1/></a1>: herkomst voor elke numerieke parameter, validatie aan de hand van een gepubliceerde relatie en eerlijkheid over de rijpheid.

seg-d212e17ac218 = <b>Toekomstige committers.</b> Naarmate aanhoudende, hoogwaardige bijdragen daartoe aanleiding geven, worden commitrechten uitgebreid naar vertrouwde bijdragers en wordt dit document bijgewerkt naar een model met meerdere beheerders (beslissingen via lazy consensus, waarbij de groep beheerders meningsverschillen oplost). Tot die tijd is het pad: bijdragen, een staat van dienst opbouwen en worden uitgenodigd.

seg-91e3f1919016 = Hoe beslissingen worden genomen

seg-0d45899c92f4 = <b>Open discussie.</b> Inhoudelijke wijzigingen beginnen als een GitHub-issue, zodat de motivering, de alternatieven en de afwegingen vastliggen.

seg-88916dd2357b = <b>Lazy consensus.</b> Een voorstel waartegen na redelijke tijd geen aanhoudend bezwaar bestaat en dat de technische drempel hieronder haalt, gaat door.

seg-788566515dad = <b>De beheerder beslist bij onenigheid.</b> Waar geen consensus wordt bereikt, beslist de beheerder en legt die de reden vast. Onenigheid wordt beslecht door de missie en de technische drempel, niet door anciënniteit of volume.

seg-e45e1b565e62 = De technische drempel (niet onderhandelbaar)

seg-2c397872e2f5 = Dit zijn harde invarianten, afgedwongen door CI en review, die geen enkele beslissing opheft:

seg-70cb5a174c2f = <c1/> moet een run bit-voor-bit reproduceren. Een wijziging die dit niet-deterministisch maakt, is een bug, geen functie.

seg-b8733ea97546 = <b>Herkomst.</b> Geen anonieme numerieke constanten: elke parameter vermeldt een bron.

seg-55a09b775418 = <b>Eerlijkheid over validatie.</b> Elke mogelijkheid is gelabeld als <c1/> (tegen een onafhankelijke referentie) of als <c2/> / <c3/>. Niets wordt beweerd buiten wat het bewijs toelaat. Zie de machinaal gecontroleerde matrix in <c4/>.

seg-dd339a396698 = <b>Hygiëne.</b> Nergens in commits, inhoud of geschiedenis een vermelding van een geautomatiseerd hulpmiddel als auteur (afgedwongen door <c1/>).

seg-45733fea1709 = Een wijziging die de drempel niet kan halen, wordt afgewezen, hoe nuttig ze ook zou zijn.

seg-3eb0831d99a2 = De grens tussen open en gesloten

seg-ca7730a3d518 = { -brand } is <b>open-core</b>. Deze repository is en blijft de volledige open AGPL-3.0-engine, de neutrale referentie, commercieel onder dubbele licentie gebracht door Ashforde OÜ (zie <a1><c1/></a1>). Het project neemt het volgende <b>niet</b> op in de open repository:

seg-8c2a89a3a4e2 = <b>Exportgecontroleerde of dual-use-diepgang</b>: echte dreigingsbibliotheken, golfvormen van tegenstanders of prestatieparameters tegen jamming/spoofing. De openbare repo houdt zich aan algemene, gepubliceerde modellen en methoden (zie <c1/> → Exportcontrole). Vraag het in geval van twijfel <em>voordat</em> u bijdraagt.

seg-6df31d37cfe4 = Vertrouwelijke gegevens of kalibratie van klanten of partners.

seg-b3b4a5384199 = <b>Copyleft-<em>afhankelijkheden</em> (GPL/AGPL/LGPL/MPL)</b>: niet omdat ze botsen met de eigen AGPL-licentie van de engine (dat doen ze niet), maar omdat ze niet kunnen worden herlicentieerd in de <b>commerciële</b> uitgave: we kunnen alleen een commerciële licentie verkopen op code die we bezitten of die permissief is. Een copyleft-afhankelijkheid zou de commerciële uitgave besmetten en de dubbele licentie breken. Afhankelijkheden blijven daarom permissief (Apache/MIT/BSD/ISC), afgedwongen door <a1><c1/></a1>.

seg-ce264f3e43fe = Omgekeerd zal het project de open core <b>niet</b> uithollen om propriëtaire waarde te stimuleren: de engine die aan een onafhankelijke externe referentie is getoetst, de openbare validatieankers, het eerlijkheidsregister, het uitwisselings-/standaardformaat en de distributiekanalen blijven open. De open core uithongeren is de ene fatale fout bij open-core en die komt niet in aanmerking.

seg-947b3e9b1b2d = Releases

seg-73e2bca0310d = <b>Semantic Versioning.</b> Vóór 1.0 kan het scenario-/resultaatschema veranderen; ingrijpende wijzigingen worden aangegeven, en de versie van het uitwisselingsschema (<c1/>) is de enige bron van waarheid voor de compatibiliteit van artefacten.

seg-71cace8b6144 = <b>Releasebevoegdheid.</b> Publiceren (bijvoorbeeld <c1/>) is een handmatige stap van de beheerder waarvoor een registertoken nodig is. CI en de door een tag gestarte Release-workflow publiceren <b>nooit</b> automatisch naar externe registers: ze voeren alleen alle controles opnieuw uit en voegen een buildartefact toe. Zie <c2/> → Commits en versiebeheer.

seg-59c37ffa54f0 = Gedragscode en beveiliging

seg-2dc8c12568bc = Gedrag wordt geregeld door <a1><c1/></a1>.

seg-8574b73edbbc = Beveiligingsproblemen volgen het vertrouwelijke meldproces in <a1><c1/></a1>; open geen openbaar issue voor een kwetsbaarheid.

seg-d86d4e609713 = Handelsmerk

seg-cb1314b67b2f = De naam en het logo van { -brand } zijn handelsmerken van Ashforde OÜ. De licentie (AGPL-3.0, of een commerciële licentie) geldt voor de <b>code</b>, niet voor de merken: een fork mag de code onder de licentie gebruiken, maar niet de naam { -brand } of de canonieke distributie-identiteit. Zo blijft Ashforde de geciteerde bron van waarheid en dat is een deel van hoe de open core een neutrale referentie blijft.

seg-a678f6ed1af8 = Dit document wijzigen

seg-db90122245fa = Wijzigingen in het bestuur worden zelf voorgesteld als pull request en beslist via het proces hierboven. Naarmate de schaal van het project verandert, mag u verwachten dat dit document een beslismodel met meerdere beheerders krijgt; de technische drempel wordt daarmee niet verlaagd.

seg-0a0712cca2e7 = Licht per ontwerp. Eerlijk over vandaag, met een benoemd pad voor morgen.

seg-4bfa7cf23a41 = <s1>Vorige</s1>Bijdragen

seg-f67113e34738 = <s1>Volgende</s1>Gedragscode
