# docs--observatory-method: translations (nl)

seg-0857a94a948e = Beperkingen

seg-2247a2344710 = Betekenis

seg-b652b86e6b8e = Toestand

seg-7ca62fa39e10 = Bron: <c1/>

seg-48e063b567d0 = Interferentieobservatorium: methodenotitie

seg-d0e1d6cadc10 = Versie <c1/>, gebouwd op <c2/>. Alleen adviserend: dit is een beschrijving van hoe gepubliceerde positiemeldingen er op eerdere dagen uitzagen, geen meting van enige ontvanger, geen voorspelling, geen bevestiging van interferentie en geen toewijzing van de oorzaak ervan.

seg-c5eab49b8d6f = Wat het observatorium publiceert

seg-165ae7646608 = Eén product per UTC-dag en regio, uit één open archief van vliegtuigposities. Elke cel van een vast breedte-lengteraster van 0.5 graad bevindt zich in één van <b>drie toestanden</b>:

seg-cc07647eb12e = Een groot aandeel van de in de cel bemonsterde vliegtuigen meldde die dag een lage navigatienauwkeurigheid, duidelijk boven de achtergrond van die dag.

seg-3e1dd7caaee6 = Er waren genoeg vliegtuigen bemonsterd en het aandeel voldeed niet aan de regel.

seg-8f0d9ad60d62 = De data lieten geen oordeel toe. Dit is <b>niet</b> "schoon". Elke zo gepubliceerde cel draagt een gegevensreden: <c1/>, <c2/> of <c3/>. Een cel zonder enige vermelding is door minder dan { "5" } verschillende vliegtuigen gezien en wordt achtergehouden.

seg-e49e05b47061 = Verder wordt niets gepubliceerd: geen oorzaak, geen actor, geen record per vliegtuig. De redenen beschrijven of de data van die dag voldoende was, nooit waarom de nauwkeurigheid laag was.

seg-7b251c7860e0 = Drie bestanden per dag (<c1/>):

seg-2008b0ba6ac7 = <c1/>: de cellen, met <c2/> <c3/>, de methode en haar vooraf vastgelegde parameters, de licentie en naamsvermelding, de vrijgaveregel en een kennisgeving.

seg-7d5b16eac4a3 = <c1/>: dezelfde cellen als afbeelding (verslechterd, niet verslechterd, niet waargenomen gearceerd; lege cellen zijn niet waargenomen). Tekstblokken in het bestand herhalen de kennisgeving en de licentie.

seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Aaneengrenzende verslechterde cellen (diagonalen inbegrepen) vormen één incident met een omsluitende rechthoek en zijn cellen. <c4/> is de vaste tekst <c5/>. Het bestand is een invoer voor een rapporteer-, bevestig- en meldcyclus (de luchtvaartmeldcyclus die eindigt in een NOTAM); het is geen bevestiging en geen NOTAM.

seg-49b7bdae0d6e = en een <c1/> met het aantal bytes en de SHA-256 van de drie bestanden, het methode-id, de invoertellers (gelezen en uitgesloten rijen) en het datasetblok, zodat een product kan worden gecontroleerd en gereproduceerd.

seg-d7bb390fb986 = Vrijgaveregels (afgedwongen door de opdracht)

seg-87147317f8da = <b>Minstens { "24" } uur vertraging.</b> Het product van een dag wordt niet eerder vrijgegeven dan het einde van die UTC-dag plus <c1/> ({ "24" } of meer; een kleinere waarde wordt geweigerd). De opdracht weigert een dag die nog niet publiceerbaar is en noemt het vroegste tijdstip. Er is geen schakelaar om dit te verkorten.

seg-43960c3f9b6c = Grove cellen.

seg-1a5ff10e5240 = <c1/> onder { "0.5" } wordt geweigerd.

seg-e70d8d7f9980 = <b>Onderdrukking.</b> Een cel die door minder dan { "5" } verschillende vliegtuigen is gezien, wordt niet gepubliceerd; een aantal onder { "5" } is <c1/> (nul inbegrepen), zoals in de basismethode.

seg-ab75582c5032 = <b>Geen toewijzing.</b> Het vocabulaire van toestanden en redenen kent geen oorzaak; een test dwingt dat af.

seg-0e7d76d7efd0 = <b>Bronnen.</b> Uitsluitend adsb.lol (ODbL { "1.0" }), of een eigen dataset van de gebruiker met een eigen licentie. <b>Data van het OpenSky Network wordt geweigerd</b> (de licentie staat commercieel gebruik of herdistributie van afgeleide kaarten niet toe). ADS-B en AIS worden nooit gecombineerd.

seg-dc28848046ac = <b>Licentie van het product.</b> Een ADS-B-bestand per cel, gemaakt uit adsb.lol, is een Derived Database en draagt ODbL { "1.0" } en de naamsvermelding van adsb.lol in het bestand. De code van Kshana blijft AGPL-3.0.

seg-9eeba6648fec = De waarneembare grootheid en de basismethode

seg-7334dc45eb2f = Een ADS-B-vliegtuig meldt hoe nauwkeurig het zijn eigen GNSS-positie acht: <b>NACp</b> (Navigation Accuracy Category for Position, een horizontale grens van { "95" } % van { "10" } NM tot onder { "3" } m) en <b>NIC</b> (Navigation Integrity Category, een insluitingsstraal). De basismethode (<c1/>, <c2/>) telt, per cel en dag, het aandeel <b>verschillende vliegtuigen</b> waarvan de meldingen in de cel meestal een lage nauwkeurigheid hadden, met waarborgen: alleen hoogte boven { "5,000" } ft; een vliegtuig telt alleen mee als het diezelfde dag elders een goede nauwkeurigheid meldde (een basislijn voor de apparatuur); het aandeel van de cel moet het mediane celaandeel van de dag met een marge overschrijden; een dag waarvan de mediaan zelf hoog is, wordt als verstoord gemarkeerd en geen cel wordt als verslechterd verklaard. De parameters zijn vastgelegd op grond van de definities van de velden en van de privacyregel voordat enige data is onderzocht, en zijn in elk uitvoerbestand opgenomen. Het observatorium voegt het vocabulaire met drie toestanden, de vrijgaveregels en de bovenstaande bestanden toe, en wijzigt geen parameter.

seg-96cf298985c6 = <b>Regionale runs.</b> Met <c1/> worden alleen meldingen binnen de rechthoek gelezen. De basislijn voor de apparatuur en de achtergrond van de dag worden dan uitsluitend uit de meldingen van de rechthoek berekend, en het bestand zegt dat (<c2/>). Een regionaal product is dus een product van de data van die regio, geen uitsnede van een wereldwijd product.

seg-2e7007b56a44 = Verband met de methode NACp tegenover almanak-HDOP

seg-4892485e534b = Pleninger, Topkova en Steiner, "GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data", The Aeronautical Journal { "129" } ({ "1331" }), { "206" } tot { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, vergelijken de positiefout die uit de NACp van een vliegtuig volgt met de HDOP (horizontal dilution of precision) van de GPS-constellatie uit almanakdata, en markeren een vliegtuig als getroffen wanneer beide verschillen; het artikel evalueert de methode op opzettelijke GPS-jammingexperimenten.

seg-74ec1aca8a22 = <b>Wat wij hebben gebruikt.</b> Alleen de gepubliceerde samenvatting en het bibliografische record. De volledige tekst was voor ons niet beschikbaar (achter een betaalmuur), dus wij kennen noch haar afbeelding van NACp naar een foutschatting, noch haar HDOP-berekening, noch haar drempels, en wij beweren niet ze te reproduceren.

seg-4f8471649a07 = <b>Wat het observatorium in plaats daarvan doet.</b> De vraag die de almanakvergelijking beantwoordt is "kan de constellatiegeometrie alleen deze lage nauwkeurigheid verklaren?". De basismethode beantwoordt een verwante vraag zonder almanak: een laag aandeel moet opvallen tegenover de achtergrond van dezelfde dag in de regio en tegenover de eigen goede meldingen van het vliegtuig elders. Dat is een ander en zwakker substituut: het kan niet zeggen dat een uur met rustige geometrie verslechterd was waar ook de achtergrond van de dag laag is. Een almanak-HDOP-scorer is <b>niet geïmplementeerd</b>. Het is een openstaand punt, te bouwen uit de volledige tekst van het artikel en de openbare GPS-almanak en vooraf vast te leggen voordat het wordt uitgevoerd; tot die tijd wordt het aangehaald, niet geclaimd.

seg-e9b9902633af = Een product reproduceren

seg-95e48f0286d9 = De pijplijn is deterministisch in alles wat ze publiceert (de salt van de identificator per run wijzigt alleen interne hashes die nooit worden geschreven). Met de SHA-256-waarden van het manifest kan een tweede run byte voor byte worden vergeleken.

seg-65236a42e316 = Gevoeligheidsstudie

seg-0c843e799b8f = <c1/> speelt de meldingen van één dag opnieuw af onder wijzigingen van elke vooraf vastgelegde parameter, één per keer (telkens twee waarden, plus een raster van { "1.0" } graad) en rapporteert, per variant, het aantal verslechterde, niet verslechterde en niet waargenomen cellen, de Jaccard-index van de verslechterde verzameling met de vastgelegde, de cellen waarvan de toestand veranderde, en de verslechterde oppervlakte. Het verandert niets aan de vastgelegde regel: een variant is geen getoetst alternatief, en een grote verandering onder een parameter zegt hoezeer het oordeel van die parameter afhangt, niet welke waarde juist is. De resultaten voor de back-catalogus staan in <c2/>.

seg-cc57d45c4b0a = <b>Dekking.</b> adsb.lol volgt vrijwilligersontvangers; open zee en dun bedekt luchtruim zijn schaars, en <c1/> komt daar vaak voor. Een kaart toont de dekking van zijn bron.

seg-e3921e1eb177 = <b>Wat lage nauwkeurigheid betekent.</b> NACp en NIC dalen om andere redenen dan interferentie: uitval van satellieten of augmentatie, ruimteweer, storingen van ontvanger of transponder, en geometrie. Geen enkele toestand impliceert een oorzaak.

seg-e5ad0dc456c0 = <b>Vliegtuigen die de hele dag in een getroffen regio blijven</b> hebben daarbuiten geen basislijn en worden niet meegeteld, dus de methode onderschat een aanhoudend regionaal effect. De gevoeligheidsstudie toont het effect van de basislijnwaarborg.

seg-a2d41becc19b = <b>Daggrenzen</b> zijn UTC; een gebeurtenis die over middernacht gaat, wordt over twee dagen verdeeld.

seg-436af9f16feb = <b>Geen grondwaarheid.</b> Het observatorium heeft geen externe onafhankelijke referentie: elk cijfer is MODELLED, en geen rij van de verificatiematrix berust erop.

seg-5c4966f0166d = <b>Gevoeligheid van het onderwerp.</b> Kaarten van dit soort zijn politiek. Het observatorium noemt een methode, een vertraging en een vocabulaire, en niets anders; het noemt geen staten of actoren, en het publiceert niet in realtime.

seg-874f46a80c8b = <s1>Vorige</s1>Gelezen ontvangerprotocollen

seg-3137b7595e59 = <s1>Volgende</s1>Interferentieobservatorium: resultaten
