# docs--jammertest: translations (nl)

seg-f8cf777c0caa = Onderdelen

seg-45425f378b61 = betekenis

seg-9367b8736d36 = Bron: <c1/>

seg-c2a40cd73d0e = Jammertest-scoring: het gepubliceerde plan als geplande referentie

seg-a560942cbd27 = <c1/> leest de testcatalogus en het zendplan van Jammertest en zet de slots van één testgebied om in <c2/> voor ontvangervertrouwen. <c3/> voert een ontvangerlog door de vertrouwensmonitoren en scoort die test voor test tegen dat schema. Elk resultaat is <b>MODELLED</b>: het schema zegt wanneer een test <em>gepland</em> was, niet wanneer een zender aan stond.

seg-bc4e7285c38a = Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig. Niets hiervan wordt onderschreven door de Noorse Public Roads Administration, Nkom of de organisatoren van het evenement; er wordt geen overeenkomst met hen geclaimd.

seg-af0edceb1503 = Scoring van één synthetische ontvangerlog tegen een schema met drie tests, uit een echte run van engine v{ $version } (`kshana jammertest score`). De log is verzonnen: { "1800" } s NMEA met een daling van { "20" } dB C/N0 over twee intervallen. Het schema bevat drie slots; in het middelste slot staat in de log geen jammer. De score markeert { "2" } van { "3" } tests als gedetecteerd (mediane latentie { "0" } s) en { "1" } als gemist, met { "0" } runs met valse alarmen over { "0.25" } uur schone tijd. Niets hiervan zegt iets over een echte ontvanger. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig.

seg-ceaa46bdcb7e = Het plan en de catalogus

seg-73a5899de383 = Bron: de repository <c1/> van de Noorse Public Roads Administration (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>MIT-licentie</b> (copyright { "2024" } Norwegian Public Roads Administration; de licentietekst wordt gecontroleerd in <c2/>). De bestanden worden opgehaald, nooit meegeleverd:

seg-2a4967d30c3a = Het downloadt de catalogi en de planbestanden van { "2025" } op de vastgepinde commit <c1/> en weigert elk bestand waarvan de SHA-256 afwijkt van <c2/>.

seg-7826929c89f6 = Een catalogustest heeft een id met punten, <c1/> (bijvoorbeeld <c2/>: type { "1" } jamming, groep { "2" }, test { "5" }). Het plan vermeldt, per testgebied en tijdslot, welk id is gepland. De typen { "1" } (jamming), { "2" } (spoofing) en { "3" } (meaconing) zenden uit; type { "0" } (briefings, respijtperiode, boekingen en ad-hocslots) niet, en wordt overgeslagen. Plantijden zijn lokale kloktijd; <c3/> (standaard { "2" }, CEST) zegt hoeveel ze van UTC verschillen. De planbestanden bevatten een veld voor een testcontact met de naam van een persoon: het wordt nooit gelezen, en niets wat ervan is afgeleid, wordt geschreven.

seg-3eab33a0c38f = Import

seg-91fddde78691 = <c1/> vervangt <c2/>/<c3/> wanneer de log zijn begin niet vermeldt. De uitvoer is TOML <c4/> om aan een scenario voor ontvangervertrouwen toe te voegen; elk label begint met <c5/> en bevat het editiejaar, de catalogus-id en het gebied, en de header legt de SHA-256 van elk bronbestand vast. <c6/> leest in plaats daarvan de gebeurtenisreferentie van één map van de dataset JammerTest { "2024" } (zijn <c7/>, tijdstempels verschoven met <c8/>, standaard -2: ze zeggen <c9/> maar zijn lokale tijd).

seg-6ed6415a6f52 = Score

seg-1e72a977f7ad = <c1/> is een scenario voor ontvangervertrouwen (<c2/>, optioneel <c3/>, <c4/>). Zijn eigen <c5/> worden vervangen door het geïmporteerde schema. Per geplande test:

seg-99427ab75a03 = veld

seg-d2681be37798 = <c1/> (een alarm binnen <c2/>, standaard { "10" } s, na de geplande start), <c3/> (later, binnen het slot), <c4/> (geen), <c5/>

seg-01a977f18700 = eerste alarm min geplande start

seg-b83d1f0a1fb7 = einde van het slot tot het begin van de eerste periode van ten minste <c1/> ({ "10" } s) zonder alarm, vóór de volgende test

seg-84a34f13e93b = Een test is alleen scoorbaar als hij ten minste <c1/> na het begin van de log start; een log met een eerdere test wordt gemarkeerd als <c2/> (de basislijn kan onder interferentie zijn gevormd). <b>Valse alarmen</b> zijn alarmerende epochs na de kalibratie buiten elk slot, verlengd met <c3/> ({ "60" } s) ervoor en erna (of na het herstelpunt), geteld als epochs en als runs, met runs per uur schone tijd. Met <c4/> en <c5/> wordt de run geschreven als een ondertekend bewijspakket (<c6/>): het scorekaartje en het geïmporteerde schema zitten in <c7/>, dus binnen de hashketen en de handtekening. Een pakket is een technisch verslag, geen juridisch oordeel.

seg-382613112d5d = Wat een resultaat niet zegt

seg-f1cb12a89001 = Een gepland slot is geen registratie van wat in de lucht was. Een zender kan te laat zijn begonnen, te vroeg zijn gestopt of nooit hebben gedraaid; een "gemiste" test kan een test zijn die niet heeft uitgezonden, en een latentie is gerekend vanaf de geplande start.

seg-32baa4a4b9f0 = Een "schone" epoch is "buiten de geplande slots", niet "bewezen vrij van interferentie".

seg-95cc22bbacc5 = Detectie door monitoren in het meetdomein zegt niets over het detecteren van een coherente spoofer met laag vermogen.

seg-2e91813cf9d7 = Geen externe onafhankelijke referentie noemt de werkelijke tijden in de lucht, dus niets hiervan is VALIDATED.

seg-cfdf09e38e6e = De run met de dataset van { "2024" } (vooraf vastgelegd)

seg-473ed6ca71e5 = <c1/> legde de populatie, de definities en de drempels vast vóór de eerste beoordeelde run; <c2/> legt die run vast. Resultaat: <b>de vastgelegde regel voor minimale gegevens faalde</b> ({ "4" } scoorbare jammingvensters uit { "4" } van de { "12" } mappen <c3/>: { "5" } mappen werden door de basislijnregel geschrapt en { "3" } UBX-logs vermelden hun begin alleen als GPS-week-tijd), dus <b>geen enkele drempel is te beoordelen</b>. Er is niets versoepeld of opnieuw uitgevoerd. <b>v2</b> (<c4/>, alleen vastgelegd vóór zijn run; alleen gegevensverwerking, dezelfde drempels en dezelfde regel voor minimale gegevens) plaatste de logs met alleen GPS-tijd vanaf de mapdatum, scoorde de { "12" } mappen met alleen CSV en gebruikte een sessie met bewegend platform voor de bewegende rovers. Resultaat (<c5/>): { "14" } van de { "24" } mappen behouden maar slechts <c6/> scoorbare jammingvensters, dus de regel voor minimale gegevens faalde opnieuw en <b>geen enkele drempel is te beoordelen</b>. Het resultaat van v1 is ongewijzigd. Alleen beschrijvend: { "3" } van de { "7" } jammingvensters sloegen alarm binnen { "10" } s, { "4" } later, geen gemist; mediane latentie { "18" } s; schone alarmfrequentie { "0.089" }. De bindende beperking is nu de basislijnregel, die { "10" } mappen verwijdert; een nieuwe vastlegging zou een andere regel voor vroege vensters vereisen. De dataset (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) wordt door <c7/> opgehaald en nooit meegeleverd; de test <c8/> pint de vastgelegde run wanneer <c9/> naar de uitgepakte dataset wijst.

seg-cd75b60bd0db = De NMEA-dataset van SimulaMet van { "2025" }

seg-87bc2544154b = De van NMEA afgeleide dataset van SimulaMet Jammertest { "2025" } (IEEE DataPort, DOI 10.21227/a7v4-xw11) is in { "0.38" } <b>niet</b> aangepast. De pagina vermeldt geen licentie en zegt "This dataset requires an IEEE DataPort Subscription to access": de voorwaarden staan herverspreiding of een geautomatiseerde download niet duidelijk toe, dus er is geen adapter of ophaalscript geschreven. Het gebruik ervan vereist de beslissing van de eigenaar en bij voorkeur de schriftelijke instemming van de auteurs.

seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (dezelfde namen), MCP-hulpmiddelen met dezelfde namen, en de opdracht <c4/> en de skill <c5/>. Het ondertekende pakket is alleen via de opdrachtregel beschikbaar (het vereist een ondertekeningssleutel). Zie <c6/>.

seg-82aab597103a = <s1>Vorige</s1>LunaNet augmented forward signal

seg-fb9e48a04566 = <s1>Volgende</s1>Machine- en sensorinvoer
