# docs--contributing: translations (nl)

seg-c3c260b7063e = Tests

seg-5dce5694e6ec = Bron: <c1/>

seg-3fa173b79e8f = Bijdragen aan { -brand }

seg-c3a47c614836 = Bedankt voor uw interesse. { -brand } wil een <b>neutrale, reproduceerbare, eerlijk getoetste</b> referentie zijn voor hybride kwantum-/klassieke PNT. Bijdragen worden aan die drempel gehouden: juistheid, bronvermelding en reproduceerbaarheid gaan boven omvang.

seg-5a82a55f7fb2 = Hoe het project wordt bestuurd — wie beslist, de technische drempel en de grens tussen open en gesloten — staat beschreven in <a1><c1/></a1>.

seg-cc8491af7a6f = Ontwikkeling

seg-0163ccdfaa2b = De optionele taalbindingen zijn feature-gated en staan standaard uit (zodat de build hierboven en de poort voor de audit van afhankelijkheden ze nooit aanraken). Om eraan te werken:

seg-edc8bbab6e92 = Vóór elke commit — de snelle lus

seg-6a7eda7d82b7 = Deze duren seconden. Ze vormen een deelverzameling van de job <c2/> van <c1/>, in dezelfde volgorde, dus een fout hier is een fout daar:

seg-d62c1fe22fc4 = <b>Reproduceerbaarheid is een harde invariant.</b> Een wijziging die <c1/> niet-deterministisch maakt, is een bug. Toeval moet via de geseede RNG lopen; kwantum- en klassieke runs gebruiken onafhankelijke, deterministisch afgeleide seeds.

seg-66ea0748c10f = <b>Hygiëne van de repository.</b> Commits en inhoud mogen geen toeschrijvingsregels of voetteksten van geautomatiseerde tools bevatten en mogen nergens in inhoud, bestandsnamen of geschiedenis een AI-assistent als auteur noemen. De guard dwingt dit af.

seg-fbf423f6fb31 = Voordat u pusht — de volledige poort

seg-a9176352d3b4 = <c1/> is de canonieke poort: hij draait <c2/> onverkort, en daarna <c3/> om de bibliotheeksuite nog een paar keer te herhalen, omdat een race door het verweven van threads bij één run onzichtbaar is. Alleen bij succes schrijft hij <c4/> (niet gevolgd — machinestatus over één run, geen inhoud).

seg-29815bd89ce2 = Hij is met opzet traag — 62-79 minuten in de gezonde stabiele toestand, volgens de kop van <c1/>, die het actuele cijfer bevat — en er is geen time-out, want een time-out die kort genoeg is om nuttig te zijn, zou een gezonde run afbreken. Een deelrun die groen terugkwam, is geen poort: beide defecten waarvoor dit mechanisme bestaat, kwamen er op die manier doorheen.

seg-408da9a8b8bb = Bijdragers die vanuit een fork werken, hebben de receipt-hook niet nodig — het is een lokale poort voor beheerders, en <b>CI is wat een pull request daadwerkelijk toelaat of tegenhoudt</b>. Als u <c1/> draait voordat u er een opent, vertelt CI u simpelweg niets wat u nog niet wist.

seg-9394727b21c3 = Een sensormodel toevoegen of wijzigen

seg-d9c891ca6827 = <b>Elke numerieke parameter heeft herkomst nodig.</b> Zet de bronvermelding in de tekenreeks <c1/> van het model en in het scenariobestand. Geen anonieme constanten.

seg-d30cb836d4c4 = <b>Toets aan de standaardrelatie,</b> niet alleen aan interne consistentie — bijvoorbeeld de Allan-deviatie voor klokken, de foutgroei van koppelnavigatie volgens Groves voor inertiële sensoren, de omzetting van timing naar afstandsmeting voor tijdoverdracht. Voeg een test toe dat de gesimuleerde uitvoer de gepubliceerde waarde of relatiewaarde binnen een vastgelegde tolerantie reproduceert.

seg-b52dd0dd550e = <b>Wees eerlijk over de maturiteit.</b> Het statusregister is <c1/> — voeg de rij daar toe of wijzig haar, noem haar externe onafhankelijke referentie (of zeg ronduit dat er geen is, waardoor het <c2/> wordt), en genereer daarna de gepubliceerde artefacten opnieuw met <c3/>. <c4/>, <c5/> en <c6/> worden allemaal uit die functie gegenereerd en zeggen niet voor niets "niet met de hand bewerken". Werk ook het verhaal in <c7/> bij wanneer de tekst dat nodig heeft, en label cijfers die doelen of resultaten van een demonstrator op de grond zijn als zodanig.

seg-34b9c8b6f70c = Testgedreven: schrijf eerst de falende test, met de verwachte waarde <b>met de hand afgeleid</b> uit de fysica of relatie voordat u implementeert.

seg-5322d5b2188c = Deterministische tests toetsen exacte (met de hand afgeleide) waarden; statistische tests toetsen een vastgelegde tolerantie en middelen bij voorkeur over seeds om de spreiding te beheersen.

seg-7f76a26c4d5f = Commits en versiebeheer

seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

seg-1a13616ca0ac = <b>Semantic Versioning.</b> Vóór 1.0 kan het scenario-/resultaatschema veranderen; vermeld brekende wijzigingen expliciet.

seg-0e3036c27aa8 = <b>Releases worden gemaakt met een tag <c1/>, en publiceren is automatisch maar in vaste volgorde.</b> De workflow Auto-tag pusht de tag zodra CI groen is op <c2/> bij een versieverhoging. De workflow Release draait de volledige verificatie op de getagde commit, en pas wanneer die slaagt, publiceert hij naar crates.io, de Python Package Index (PyPI), npm, ghcr.io, het Model Context Protocol-register (MCP) en de JetBrains Marketplace; daarna controleert hij of elk kanaal de versie aanbiedt en bouwt hij kshana.dev opnieuw op vanaf de tag. Niemand draait <c3/> met de hand. De stappen, en hoe u een mislukte publicatie opnieuw probeert, staan in <a1><c4/></a1>.

seg-18ca89a2c573 = Onderhoud van het changelog (verplicht)

seg-1f7e1d73c2ef = Elke voor gebruikers zichtbare wijziging werkt <a1><c1/></a1> bij:

seg-1448e96afbbc = Voeg een item toe onder de sectie <b><c1/></b>, in de juiste groep (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

seg-76ddc53c752e = Hernoem bij een release <c1/> naar de nieuwe <c2/>, begin een nieuwe <c3/>, verhoog de <c4/> in <c5/> (zodat <c6/> in de resultaat-JSON overeenkomt), werk de vergelijkingslinks onderaan bij en tag <c7/>.

seg-ed680e59377c = Houd items beknopt en gericht op gebruikers; link issues/PR's waar nuttig.

seg-fe83216ebeed = Een pull request dat gedrag wijzigt zonder item in het changelog is onvolledig.

seg-776cd2ef0b0c = Exportcontrole

seg-d0f1db9798a6 = PNT-veerkracht en kwantumsensing kunnen raken aan exportcontroles voor producten voor tweeërlei gebruik. Houd de openbare repository bij generieke, gepubliceerde modellen en methoden. Alles wat lijkt op exportgevoelige diepgang in veerkracht of anti-spoofing hoort in de private overlay, niet hier. Vraag het bij twijfel voordat u het bijdraagt.

seg-506a29aafc12 = Licentie

seg-c0409a1226ca = { -brand } heeft een dubbele licentie (AGPL-3.0 <b>of</b> een commerciële licentie van Ashforde OÜ — zie <a1><c1/></a1>). Opdat dat blijft werken, moeten bijdragen onder <b>beide</b> licenties bruikbaar zijn. Door bij te dragen stemt u dus in met het volgende:

seg-da7b02ac890c = uw bijdrage wordt inbound gelicentieerd onder de <b>AGPL-3.0-only</b>; en

seg-8d6ed0d3a17f = u verleent <b>Ashforde OÜ ook</b> een eeuwigdurende, wereldwijde, royaltyvrije, onherroepelijke licentie om uw bijdrage te gebruiken, te wijzigen en <b>te herlicentiëren als onderdeel van de commercieel gelicentieerde editie van { -brand }</b> (dat wil zeggen om haar ook onder niet-AGPL commerciële voorwaarden te verspreiden). U behoudt het auteursrecht op uw bijdrage.

seg-3b1a0dd6b5aa = Deze lichte dubbele licentieverlening — geen overdracht van auteursrecht — maakt het mogelijk dat het project open blijft <em>en</em> een commerciële editie aanbiedt. Als u ({ "2" }) niet kunt verlenen (bijvoorbeeld bij code die eigendom van een werkgever is), meld dat dan in uw pull request voordat u bijdraagt.

seg-6630d0ac4ad5 = <b>Uitzondering: <c1/>.</b> Die map is gelicentieerd onder <b>GPL-3.0-or-later</b> (zie het bestand <c2/>) en valt buiten de commerciële licentie. Bijdragen eraan worden inbound gelicentieerd onder <b>uitsluitend</b> GPL-3.0-or-later; verlening ({ "2" }) is er niet op van toepassing.

seg-0a78a12b1188 = Onderteken elke commit om het <a1>Developer Certificate of Origin</a1> te bevestigen: <c1/> (voegt een regel <c2/> toe).

seg-9f86d8f58b17 = <s1>Vorige</s1>Beveiliging

seg-fc760238e9a5 = <s1>Volgende</s1>Bestuur
