# docs--schema: translations (nl)

seg-2247a2344710 = Betekenis

seg-f42465f7d066 = ns

seg-f63dd3d7aad4 = Bron

seg-6940543aa3c0 = tekenreeks

seg-f5e7215e6835 = object

seg-9da5d92757bd = object, optioneel

seg-c353e7bec219 = Sleutel

seg-a129b9e613d0 = Type

seg-e28387d70be0 = Bron: <c1/>

seg-49d2afecf5f1 = Resultaatschema: een { -brand }-<c1/> lezen

seg-c128455c353c = Elke run schrijft naast het scenario een versiebeheerd, zelfbeschrijvend JSON-artefact (JavaScript Object Notation). Deze pagina is de met de hand geschreven leidraad voor de lezer over de uitwisselingsenvelop en over de resultaatvormen voor <b>klok en baan</b>: de <b>eenheid</b> van elk veld, waar het in de broncode wordt berekend en hoe het te lezen is. Het canonieke type is <c1/> in <a1><c2/></a1>; de kwaliteitsmaten staan in <c3/> in <a2><c4/></a2>.

seg-092ea1e33a05 = Het is <b>niet</b> de volledige veldreferentie. De engine verwerkt veel meer soorten dan deze twee, en elke soort levert een eigen pakket op. De volledige referentie, met eenheid, herkomstklasse en definitie voor elk numeriek veld van elke ingebouwde soort, wordt gegenereerd en niet met de hand geschreven: zie hieronder <a1>Eenheden en herkomst, per veld, voor elke soort</a1>.

seg-e4c4b66a2f46 = Uitwisselingsenvelop (KIF, het Kshana Interchange Format): een artefact herkennen en de versie controleren

seg-9b83bb817814 = { -brand }-artefacten kunnen worden verpakt in een neutrale, zelfbeschrijvende <b>uitwisselingsenvelop</b>, zodat een externe tool het bestand kan herkennen en kan beslissen of hij het kan lezen <em>voordat</em> hij zich aan een payloadschema bindt. Het canonieke type is <c1/> in <a1><c2/></a1>.

seg-e4fd08930644 = Altijd <c1/> (<c2/>): zo herkent een vreemde tool een { -brand }-artefact.

seg-abd853f2ce49 = De schemaversie <c1/> (<c2/>, de enige bron van waarheid voor de hele crate).

seg-ee9f238072f1 = Soort artefact, bijvoorbeeld <c1/>, <c2/>, <c3/>: hiermee kan een afnemer routeren zonder de inhoud te parseren.

seg-29ad4bedd64f = Crateversie (<c1/>) die de payload heeft geproduceerd.

seg-52f3e962c049 = Het verpakte artefact als canoniek JSON (een <c1/>, een <c2/>, …).

seg-6fe0d7cd4165 = <b>Compatibiliteitscontract.</b> Versies hebben de vorm <c1/>. Nieuwe velden worden toegevoegd met <c2/> (de <em>additieve discipline</em>), zodat een lezer elk artefact kan parsen met <b>dezelfde hoofdversie en een gelijke of oudere subversie</b> (<c3/>). Een strikt <b>nieuwere subversie</b> (<c4/>) kan velden bevatten die deze lezer niet kan honoreren, en een <b>andere hoofdversie</b> (<c5/>) is een structurele breuk. Beide worden geweigerd door <c6/>, dat het formaatlabel en de versie aan de grens valideert in plaats van vreemde invoer stilzwijgend verkeerd te parsen.

seg-f7ae91002e56 = <b>Determinisme.</b> De envelop bevat <b>geen tijdstempel</b>: de reproduceerbaarheidsbelofte van { -brand } (<c1/> reproduceert een run) vereist dat. De herkomst staat in <c2/> en in de eigen <c3/> van de payload.

seg-bb0b742d2df8 = Een getypeerde terugleesactie (<c1/>) werkt voor elke payload die <c2/> implementeert (bijvoorbeeld <c3/>). Resultaatartefacten zijn bewust alleen serialiseerbaar en worden gelezen als de ruwe JSON-waarde <c4/>.

seg-87be7aa00b17 = Hoogste niveau (pakketten voor klok en baan)

seg-cc22d9206eb4 = Type / eenheid

seg-3a821855c582 = Versie van het resultaatschema (onafhankelijk van de engineversie).

seg-cc6dded799f9 = Crateversie (<c1/>) die het bestand heeft geproduceerd.

seg-5a69a99b9a87 = hexadecimale string

seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) over de canonieke scenario-JSON: de run is reproduceerbaar uit <c1/>.

seg-ba73ba76873e = RNG-seed (random-number generator, willekeurigegetallengenerator) voor de kwantumrun (de klassieke run gebruikt <c1/>).

seg-a688dd98c588 = nanoseconden

seg-24e0f04033fa = De specificatie voor tijdsynchronisatie: een fout binnen ±<c1/> is "binnen spec".

seg-f52388753a1a = scenario

seg-15b4082a6455 = object (<c1/>)

seg-7d3b92769bf5 = De run van de kwantumsensor (zie hieronder).

seg-aa665b955931 = De run van de klassieke sensor, ter vergelijking.

seg-152ae43896b3 = Kaart van eenheid en herkomst per veld voor dit document, met het veldpad als sleutel. Zie §Eenheden en herkomst hieronder.

seg-119bac9b3e6f = Het verificatieniveau van elke gerapporteerde kwaliteitsmaat, en altijd de laatste sleutel van het document. <c1/> bevat één item per aanwezige maat: <c2/> (bijvoorbeeld <c3/>), <c4/> (<c5/> = getoetst aan een onafhankelijke externe referentie, <c6/> = berekend uit eerste principes, intern getest), <c7/> (de rij van de verificatiematrix waaruit het niveau wordt afgelezen) en <c8/>. <c9/> is <c10/>, met een <c11/>, voor <c12/> in elk scenario waarin geen aanval is geconfigureerd: de grens blijft in <c13/>, maar beantwoordt geen vraag die het scenario stelt. <c14/> vermeldt elke maat waar geen matrixrij eigenaar van is (de positiematen van <c15/> en <c16/>), in plaats van er een niveau aan te geven. Wordt uitgegeven door de soorten <c17/> (enkele run en Monte Carlo-ensemble), <c18/>, <c19/> en <c20/>, die het binnen hun run opbouwen, en ({ "0.36" }, RM-04) door elke andere soort voor zijn hoofdmaten, achteraf toegevoegd na de run uit de tabel per soort <c21/>; <c22/> haalt het er byte voor byte weer uit, zodat het ongelabelde document overblijft. Wordt niet uitgegeven door <c23/>, waarvan het resultaat een bevroren, vooraf vastgelegde voorspelling is (<c24/>): die soort heeft geen <c25/> totdat een nieuwe, gedateerde voorspelling haar vervangt. Ook niet uitgegeven door <c26/>, <c27/>, <c28/> ({ "0.37" }; arrays per locatie), <c29/> en <c30/>, die geen scalaire hoofdmaat hebben, noch door <c31/>, waarvan het document compacte JSON is (<c32/> geeft per soort de reden), noch door de ingesloten ledendocumenten van een campagne. Bevat geen getallen.

seg-1448f90f0086 = Samenvatting van de geometrie in het baanpakket: <c1/>, <c2/>, <c3/> (m, het gemodelleerde bereikfoutbudget per satelliet), <c4/> / <c5/> (dimensieloos) en <c6/> / <c7/> (m, PDOP (position dilution of precision) × <c8/>). <b>Alleen het baanpakket.</b>

seg-ae4f8eed06ac = array van <c1/> km, optioneel

seg-d13d827f54b0 = Gepropageerd Earth-centred-inertial-spoor van het gebruikersruimtevaartuig, één item per bemonsterd tijdstip. <b>Alleen het baanpakket</b>; anders weggelaten. Alleen uitvoer en niet gehasht.

seg-8f511d5de657 = object (<c1/>), optioneel

seg-ea152e097d6f = Aanvullende rapportmetadata (studietitel, generatiestempel, auteur, disclaimer). Weggelaten als ze ontbreekt, zodat een run zonder meta byte-identiek is aan de oudere uitvoer. Alleen uitvoer en niet gehasht.

seg-1041873fba1b = <c1/> (elk van <c2/> / <c3/>)

seg-3fa81140c10d = Sensoridentificatie (bijvoorbeeld <c1/>).

seg-80765d202558 = Modelsoort (bijvoorbeeld <c1/>).

seg-6bf458d964fe = Citaat of bron van de parameters van de sensor.

seg-9145f04a557f = De gebruikte ruwe modelparameters.

seg-697940342a28 = array van <c1/>

seg-b5f4216b55a2 = Tijdreeks per stap: <c1/> seconden, <c2/> de fout in tijdsynchronisatie in <b>nanoseconden</b>, <c3/> een van <c4/>/<c5/>/<c6/>.

seg-7fba0b91b75e = object (<c1/>)

seg-5c4b60012f0e = De berekende kwaliteitsmaten (hieronder).

seg-1308a29c6a5b = array van <c1/>

seg-bbd42065492c = Overlappende Allan-deviatie: <c1/> de middelingstijd (s), <c2/> de dimensieloze fractionele frequentiestabiliteit σ_y(τ), <c3/> het aantal overlappingen achter dat punt, <c4/> het machtswettype dat is bepaald uit de helling van de MDEV (modified Allan deviation), (bijvoorbeeld <c5/>), <c6/> de voor het ruistype specifieke effectieve vrijheidsgraden, en <c7/>/<c8/> de op χ² gebaseerde { "95" }%-betrouwbaarheidsband op <c9/> bij die τ. Berekend in <c10/>.

seg-1e61fd18257f = Beoordeling van de consistentie van het Kalman-filter (NIS/NEES (NIS: normalised innovation squared; NEES: normalised estimation error squared) tegen hun χ²-banden), berekend in <c1/>; weggelaten voor runs die dit niet beoordelen.

seg-9333864652b0 = <c1/> (het object <c2/>)

seg-ce9caeaefd87 = Kanttekening

seg-b24de276d788 = RMS (root mean square) van de fout in klokfase (tijdsynchronisatie) over de uitval.

seg-53e5018ae276 = een maat voor <b>tijdsynchronisatie</b>, niet voor positie

seg-8cdec6da2072 = 95e-percentielfout in tijdsynchronisatie over de uitval.

seg-95f058adb809 = Ongunstigste (kortste) doorloop binnen spec over de uitvalsegmenten.

seg-48babfd3bd95 = <b>door het raster begrensd</b>: een ondergrens op de resolutie van de tijdstap

seg-41c08973baa1 = Groeisnelheid van |fout| tijdens de uitval volgens kleinste kwadraten.

seg-707ee74c5c06 = breuk [{ "0,1" }]

seg-32e5fe6415f8 = Aandeel van de hele run met een oplossing binnen spec.

seg-361b3b923a45 = breuk [{ "0,1" }] of null

seg-5d55682f9349 = <b>Zelfconsistentie van het filter</b>: aandeel van de uitvalsamples waarvan de ware fout binnen de k-σ-grens van het Kalman-filter blijft.

seg-636106cb4a40 = <b>GEEN</b> HPL/VPL/RAIM-integriteit (HPL: horizontal protection level; VPL: vertical protection level; RAIM: receiver autonomous integrity monitoring); zie <a1><c1/></a1>

seg-f686ade3da21 = <b>Analytische grens voor de detecteerbaarheid van spoofing</b> op basis van klokstabiliteit.

seg-f8783db25141 = alleen zinvol met een geconfigureerde aanval, dus de pakketten voor klok en baan (die er geen configureren) markeren haar als <c1/> in <c2/> en tonen haar als <c3/> in de samenvatting; <b>geen</b> RAIM-detector voor meerdere satellieten

seg-90e2980430b9 = Hoe "goed" eruitziet

seg-c1afc6f3c545 = Een <b>rustigere klok</b> (lagere <c1/>) geeft een langere <c2/> en een hogere grens voor de detecteerbaarheid van <c3/>: dat is het contrast tussen kwantum en klassiek.

seg-0fa38207813a = <c1/> dicht bij { "1.0" } betekent dat het systeem bijna de hele run binnen spec bleef; bij een lange uitval daalt het voor de ruisigere klok.

seg-4dcba241d5a6 = <c1/> dicht bij { "1.0" } betekent dat de eigen onzekerheidsgrens van het filter eerlijk was over zijn fout: een uitspraak over <em>zelfconsistentie</em>, geen garantie voor veiligheid van mensenlevens.

seg-3099d75a04a5 = Andere scenariosoorten

seg-43cd9f67f384 = Elke andere soort geeft een eigen resultaatvorm uit. Enkele veelvoorkomende:

seg-6b59ef9dfe85 = <b>inertial</b>: kwaliteitsmaten in het positiedomein in <b>meter</b> (<c1/>, <c2/>), met één as (1-DOF (DOF: degree of freedom)) en één seed (zie <a1><c3/></a1>).

seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> en <c2/> op het hoogste niveau, en per kant de maten voor tijdsynchronisatie en positie van één sensorsuite (<c3/>, <c4/> en <c5/>, de tijd tot een van beide specificaties wordt overschreden), met een blok <c6/> zoals dat van het klokpakket, waarin de positiematen als <c7/> staan vermeld.

seg-e38e8a8adec8 = <b>spoof</b>: spoofoffset per stap tegenover de detectiegrens van de klok, plus of de spoof de specificatie bereikte vóór detectie (<c1/>).

seg-dfd972d160e1 = <b>skyline</b> (<c1/> en <c2/> met <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; alleen aanwezig als het scenario een sectie <c8/> heeft, zodat een scenario zonder die sectie ongewijzigd blijft): een object <c9/> op het hoogste niveau met <c10/> (string: <c11/>, <c12/> of <c13/>), <c14/> (breuk [{ "0,1" }] van de ruimtehoek van het bovenste halfrond boven <c15/>) en <c16/> (string); per sample <c17/> (aantal satellieten boven het masker maar achter de skyline: <c18/> van <c19/> en <c20/>, <c21/> van <c22/>, <c23/> van <c24/>); en voor <c25/> <c26/> (aantal epochs). Hun eenheden en herkomstklassen staan in het blok <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

seg-d113122b7454 = Voor de precieze veldenset van elke soort leest u het item in <a1><c1/></a1> (hieronder), het hoofdstuk over die soort in <a2><c2/></a2>, of de bijbehorende struct <c3/> in <c4/>.

seg-e0c63207c019 = Andere bestanden die een run schrijft

seg-cc97989ca06b = Naast <c1/> schrijft de CLI (command-line interface) <c2/>, een afdrukbaar <c3/> en hetzelfde rapport als <c4/>, waarvan het blok <c5/> de engineversie, de SHA-256 van het scenariobestand, de seed, het platform en de exacte opdracht vastlegt (zie <a1><c6/></a1> en <a2><c7/></a2>). Soorten die een reproduceerbaarheidstabel publiceren schrijven ook <c8/> (CSV: comma-separated values). <c9/> schrijft uitwisselingsbestanden (zie <a3><c10/></a3>) en <c11/> een animatie (zie <a4><c12/></a4>).

seg-489953601f3b = Eenheden en herkomst, per veld, voor elke soort

seg-61b33dbb44dd = Deze pagina is met de hand geschreven en behandelt de pakketten voor klok en baan. De machineleesbare tegenhanger behandelt <b>elke</b> ingebouwde soort:

seg-1e20fcda7f0b = <b>In het resultaat zelf.</b> Het resultaatdocument van elk scenario bevat een object <c1/> op het hoogste niveau dat het pad van een uitgegeven veld koppelt aan <c2/>. De padgrammatica (een array levert één segment met het achtervoegsel <c3/> dat door zijn rijen wordt gedeeld; <c4/> is een jokerteken voor één segment bij objecten met gegevenssleutels) en de gesloten herkomstvocabulaire zijn gedefinieerd in <a1><c5/></a1>.

seg-b8256437c0b7 = Als één bestand.

seg-ae7136e34306 = <a1><c1/></a1> is de geoogste vereniging: voor elke soort elk numeriek veld dat hij uitgeeft met een vermelde bron, met eenheid, herkomstklasse, bewijsniveau en definitie, en, expliciet genoemd in plaats van weggelaten, elk veld dat er nog geen heeft. Het blok <c2/> bevat de aantallen.

seg-66af6dc065f7 = Beide worden afgedwongen door <c1/>, dat elke geregistreerde soort uitvoert en faalt als een uitgegeven numeriek veld een eenheid en een herkomstklasse mist. Soorten die nog niet gedekt zijn, worden afzonderlijk genoemd in <c2/> van dat bestand, met de reden waarom elk nog openstaat, en het aantal ligt vast, zodat de lijst alleen kleiner kan worden.

seg-ca49a577a07b = Genereer de JSON opnieuw na elke wijziging van de vorm van een rapport of van een blok <c1/>:

seg-ce4351cf7673 = <s1>Vorige</s1>Scenarioreferentie

seg-b988dcc329a4 = <s1>Volgende</s1>Echte TLE's gebruiken

seg-6585c8a3643d = ClockRun (elk van quantum / classical)

seg-299f8a9643f1 = FoMScores (het object fom)

seg-d17376a1ea92 = ({ "0.40" }) Het bewijslabel van de run: <c1/> (<c2/>, <c3/> of <c4/>: de <em>zwakste</em> status onder de rijen, dus het beweert nooit meer dan zijn zwakste rij), <c5/> (<c6/>), <c7/> en <c8/>, een per rij van de verificatiematrix die de run heeft gebruikt (de rijen die zijn geavanceerde rapport noemt, uit <c9/>): <c10/> (<c11/> en de eerste { "8" } hexadecimale cijfers van de SHA-256 van de eistekst van de rij), <c12/> en <c13/>, alle uit de matrix gelezen, niets getypt. Toegevoegd door <c14/> aan het resultaat van elke soort, vóór het afsluitende blok <c15/> wanneer er een is (dat blok blijft de laatste sleutel); <c16/> verwijdert het byte voor byte. De grafiek-SVG en de CSV-tabel van dezelfde run dragen hetzelfde label (<c17/> en een zichtbare regel onder de grafiek; <c18/>-commentaarregels vóór de CSV). Campagneleden die in het resultaat van een andere soort zijn ingebed dragen er geen: het buitenste document wel. Bevat geen getallen.
