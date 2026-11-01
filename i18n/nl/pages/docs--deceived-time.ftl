# docs--deceived-time: translations (nl)

seg-d46702617926 = Bron: <c1/>

seg-f44d01df7b1c = Een ondertekende opdracht die op een bedrogen tijdstip wordt uitgevoerd, leidt nog steeds verkeerd

seg-6497012e401e = Een technische notitie voor beheerders van netwerken met tijdindexen: constellaties die routeren, taken toewijzen of overdragen volgens een schema, waarbij elk knooppunt handelt wanneer zijn eigen klok een gepland tijdstip bereikt.

seg-714bce435435 = Afkortingen: GNSS, Global Navigation Satellite System; TPL, timing protection level; PNT, positiebepaling, navigatie en tijdsynchronisatie.

seg-a7208323de1c = De bewering

seg-246715a1c559 = Het authenticeren van besturingsberichten, ook met post-kwantumhandtekeningen, bewijst wie een bericht stuurde en dat het niet is gewijzigd. Het bewijst niet <b>wanneer de ontvanger ernaar handelt</b>. Een knooppunt voert een opdracht met tijdindex uit tegen zijn eigen klok. Als die klok met <c1/> is weggetrokken, wordt een opdracht die geldt voor tijdstip <c2/> uitgevoerd op de ware tijd <c3/>, met elke handtekening intact. Zodra <c4/> de slotmarge overschrijdt, belandt verkeer in het verkeerde slot, schakelt een verbinding om terwijl het andere uiteinde nog ergens anders op is gericht, of vindt een overdracht te vroeg plaats. Het netwerk leidt verkeerd en elke integriteitscontrole in het opdrachtpad meldt succes.

seg-8683f0749042 = Waarom de klok het zwakke punt is

seg-1af5aea2ef5b = <b>GNSS-tijd is de gebruikelijke referentie, en die is te spoofen.</b> Een knooppunt dat zijn klok op GNSS afstemt, erft elke tijd die de ontvanger levert. Een spoofer die de eigen kwaliteitsvlaggen van de ontvanger op groen houdt, kan die tijd langzaam wegtrekken.

seg-354a4c706264 = <b>Versheidscontroles gebruiken dezelfde klok.</b> Een geldigheidsvenster ("accepteer deze opdracht tot <c1/>") of een replay-teller die aan tijd is gekoppeld, wordt beoordeeld aan de lokale klok, dus een weggetrokken klok kan ook het venster verruimen waarin een onderschepte ondertekende opdracht wordt geaccepteerd.

seg-a4b8a5db0975 = <b>De aanval heeft geen sleutel nodig.</b> Er wordt niets in het ondertekende kanaal aangeraakt. Sterkere cryptografie verhoogt de kosten van het vervalsen van een opdracht en laat deze kosten ongewijzigd.

seg-e514b03fbae3 = Dit staat naast het werk aan post-kwantum, niet ertegenover: de twee dichten verschillende gaten. Handtekeningen stoppen een vervalste opdracht. Tijdintegriteit voorkomt dat een echte opdracht op het verkeerde moment wordt uitgevoerd.

seg-09f493386dbc = Wat het begrenst

seg-750bd90b0ee1 = Vier maatregelen, elk gekwantificeerd door de scenariosoort <c1/> (<a1><c2/></a1>):

seg-77cf39b434b5 = <b>Een kloksteunende monitor.</b> Vergelijk GNSS-tijd met de eigen klok van het knooppunt die over een venster coast, en geef alarm wanneer het verschil te groot is om klokruis te zijn. De voorwaardelijke TPL begrenst de fout die onopgemerkt kan blijven vóór het alarm.

seg-e58f7fb94ac5 = <b>Onafhankelijke controles, gepland.</b> Een tweeweg-tijdoverdracht met een grondstation of een crosslinkvergelijking met een buur buiten het bereik van de spoofer begrenst hoe lang een langzame wegtrekking kan doorgaan. Hun herhaalinterval is een beveiligingsparameter, niet alleen een operationele.

seg-69590f56817c = <b>Geometrie.</b> Een spoofer op de grond bereikt een satelliet in een lage baan om de aarde alleen zolang die boven de horizon van de spoofer staat, dus de wegtrekking wordt begrensd door de oploopsnelheid van de spoofer maal dat venster. Als rekensom: een oploop van { "10" } ns/s gedurende { "600" } s is { "6" } µs. Het meegeleverde voorbeeld (<c1/>: baan van { "550" } km, maximale oploop van { "10" } ns/s) meldt een blootstelling aan de spoofer van { "732" } s en een door de oploop begrensde wegtrekking van { "7 321" } ns.

seg-e8e52ce05943 = <b>Een marge afgeleid van de grens, en een veilige actie bij alarm.</b> De slotmarge moet de grootste onopgemerkte fout dekken die de monitor en de controles toestaan, niet alleen de vrije ruis van de klok. Bij alarm moet een knooppunt zijn laatste goede schema op zijn coastende klok aanhouden in plaats van GNSS te volgen.

seg-c11b66f214ac = Wat deze notitie niet beweert

seg-8b0ed39ead25 = Ze beweert niet dat een gespoofde satelliet is waargenomen die verkeerd leidt; ze schat de blootstelling van geen enkele beheerder; en de grenzen waarnaar ze verwijst zijn MODELLED, voorwaardelijk aan detectie en aan de vermelde bedreigingsaannames. Ze betoogt een samenstelling: een geldige handtekening en een correcte uitvoeringstijd zijn afzonderlijke eigenschappen, en een netwerk met tijdindexen heeft beide nodig.

seg-c1bf6467e3c9 = <s1>Vorige</s1>Telecomtimingsynchronisatie

seg-d4e9bfd42982 = <s1>Volgende</s1>Holdovertest en tijdsynchronisatiehardware in de lus
