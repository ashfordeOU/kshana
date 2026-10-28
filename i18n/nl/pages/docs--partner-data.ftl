# docs--partner-data: translations (nl)

seg-2247a2344710 = Betekenis

seg-6e0cb6acc073 = VALIDATED

seg-a349aa76b0ed = PARTNER

seg-34bdcfd66ded = In de repositorytak waaruit deze documentatie komt; nog niet op GitHub

seg-f942b36a11c4 = Nog niet op GitHub

seg-7338b6210228 = Rij

seg-c5ce76c91ff7 = Label

seg-3a04afee76ec = Bron: <c1/>

seg-e6d8549f24b9 = Partnerdata: wat gemeten data een MODELLED rij zou kunnen bevorderen

seg-7b9ff34db2c4 = Kshana labelt elke mogelijkheid in een machinaal gecontroleerd register (<a1>verificatiematrix</a1>). De meeste rijen voor tijdsynchronisatie en sensoren zijn <b>MODELLED</b>: ze berusten op vermelde modellen, gepubliceerde datasheets en interne controles, en er is geen gemeten opname van de apparaatklasse mee vergeleken. Wie zo'n opname heeft, kan dat veranderen. Deze pagina zegt welke rijen, wat u moet sturen, hoe een inzending wordt gecontroleerd, hoe ze wordt gescoord en hoe ze wordt toegekend. Ze is geschreven voor een laboratorium, een fabrikant of een universitaire groep; ze is geen aanbod van werk en beweert geen onderschrijving door wie dan ook. Alleen adviserend: Kshana is een studie-instrument, geen typegoedgekeurde navigatie- of tijdsynchronisatieapparatuur.

seg-1cf5536037d4 = Wat de labels betekenen

seg-5f43f341fa27 = een onafhankelijke externe referentie komt met de mogelijkheid overeen onder een drempel die vóór de vergelijking is vastgelegd. Een gemeten opname van een partner kan die referentie zijn voor de deelbewering die ze dekt; de invarianten van de matrix verbieden het label zonder een referentie

seg-0d182b8c7430 = intern consistent en hardop gezegd; geen externe onafhankelijke referentie dekt de bewering. Een MODELLED rij die met gemeten data wordt vergeleken en mist blijft MODELLED, en de misser wordt gepubliceerd

seg-8a45367544a0 = een discipline waarop de run leunt en die een hardwarepartner bezit en Kshana niet levert, bijvoorbeeld de cijfers die de eigen klok of interferometer van een partner beschrijven. Kshana modelleert wat zo'n apparaat met een navigatie- of tijdsynchronisatieketen doet; het staat niet in voor het apparaat

seg-553a1db0e11d = Een inzending kan een rij alleen naar VALIDATED verplaatsen voor de bewering die de data werkelijk toetst, en alleen als de vergelijking haar drempel haalt. Ze kan de eigen cijfers van een apparaat niet tot iets maken waarvoor Kshana instaat: die blijven die van de partner (PARTNER). Of het label van een rij verandert is het besluit van de eigenaar, vastgelegd in de commit die het wijzigt, met de tekst van de onafhankelijke referentie die precies zegt wat met wat is vergeleken.

seg-bac61cc47097 = Rijen die de data van een partner zou kunnen bevorderen

seg-bd4f5d3f9399 = Elke rij hieronder is de exacte tekst van <c1/> van een MODELLED rij van de matrix (een test houdt deze pagina en de matrix gelijk). "Zou kunnen veranderen" zegt wat een vooraf vastgelegde vergelijking met gemeten data zou ondersteunen als de drempel wordt gehaald; het is nooit een belofte.

seg-fb5ceb1d62f0 = Data die het zou toetsen

seg-812eae6bbea9 = Zou kunnen veranderen

seg-f46d009d9380 = een opname van dagen van een klok van een benoemde klasse, vrij lopend na zijn laatste sturing, vergeleken met een betere referentie, met een steekproefinterval van een minuut of minder

seg-2a73fc59a03d = de rode-ruisbodems per klasse die de holdovercijfers begrenzen blijven vandaag MODELLED; een gemeten stabiliteit bij lange middelingstijden zou met de bodem van die klasse kunnen worden vergeleken, alleen voor die klasse

seg-abe6b657ce1b = de gemeten Allan-deviatie, als tabel of als faseopname, van de klok of atoominterferometer van een partner

seg-6ba2b7faa909 = de afwegingscijfers kwantificeren (valideren nooit) het apparaat van de partner, dus ze zouden als de cijfers van de partner worden gelabeld (PARTNER); het inlezen van gemeten Allan-data in een ruismodel komt al overeen met een onafhankelijke oplosser

seg-ad537759d084 = een faseopname van een oscillator van een van de vier voorinstellingsmodellen, over ten minste een dag

seg-44a55f6ebef6 = of het uit de datasheet afgeleide ruismodel van de voorinstelling de stabiliteit van een gemeten exemplaar reproduceert bij de eigen middelingstijden van de datasheet

seg-3da5a93abde6 = een faseopname van een klokklasse die nog geen kaart heeft (een OCXO, een rubidium, een cesium, een maser, een optische klok)

seg-72f248aa4438 = een kaart die op het eerste derde is gefit en de Allan-deviatie van de rest voorspelt binnen de vooraf vastgelegde factor, zoals al gedaan voor GNSS-satellietklokken en één ontvanger

seg-54971e473811 = een log van een echte installatie (elke daemonversie) met de eigen samenvattingsregels van de daemon

seg-bccf188b7636 = de lezers zijn gebouwd op openbare regelindelingen en fixtures; een echte log die met een onafhankelijke lezer wordt vergeleken zou de eerste externe controle zijn

seg-e83b73ab2d5d = een echte export van een teller of analysesoftware

seg-80b69f559ea5 = hetzelfde, voor die formaten

seg-0c279732d132 = een echte holdovertest: de opname, de tijden waarop de operator de referentie verwijderde en herstelde, en de eigen MTIE-, TDEV- en maskeroordelen van het laboratorium uit zijn analysesoftware

seg-cfad71161af0 = een onafhankelijke berekening van dezelfde grootheden om met die van de engine te vergelijken

seg-97c65b646eae = een stationaire log van een traagheidseenheid waarvan de ruisparameters door iemand anders zijn gepubliceerd of gemeten

seg-77f9d22ec624 = de fit herstelt de onafhankelijke parameters binnen een vermelde factor

seg-c9544eadc55d = een statische log of de ruisparameters van de koudeatoom-traagheidssensor van een partner

seg-062dd193ab20 = de apparaatcijfers zijn die van de partner (PARTNER); het positiefoutenbudget dat ze samenstelt blijft het model van Kshana

seg-078be7f5769f = Begin met de eerste twee: ze bepalen of de holdoverbodems per klasse en de afweging tussen kwantum en klassiek op enige eigen gemeten data berusten.

seg-c325655738e0 = Wat u moet sturen

seg-ca24fa511ffe = Een inzending bestaat uit twee bestanden in één map: de data en een kleine beschrijving ervan, een TOML-bestand (<c1/>; een uitgewerkt, verzonnen voorbeeld is <c2/>).

seg-a3e30cf27adb = <b>Klokdata.</b> Een van de formaten die Kshana leest (zie <a1>kloklogformaten</a1>): TAPR TICC-logs, fase of frequentie in ASCII in TimeLab-stijl, RINEX clock, linuxptp-logs van <c1/>, <c2/> en <c3/>, chrony-tracking- en statistiekenlogs. Fase heeft de voorkeur boven frequentie; vermeld de eenheden en het steekproefinterval. Geef de langste ononderbroken opname die u hebt: stabiliteit bij lange middelingstijden vraagt dagen, en een opname van minder dan een dag wordt geaccepteerd maar met een waarschuwing.

seg-a14b0c961637 = <b>Traagheidsdata.</b> Een CSV met benoemde kolommen (<c1/>, rad/s en m/s^{ "2" }) of de EuRoC-indeling, van een stilstaand apparaat, lang genoeg voor de fit (ten minste { "2000" } samples; uren is beter).

seg-a1f2cd79bcc0 = <b>De beschrijving</b> zegt, en de controle verifieert waar mogelijk:

seg-cfeee5da56d7 = het type organisatie (een type zoals "een nationaal tijdlaboratorium", geen naam; een naam is optioneel en alleen voor vermelding);

seg-4bd30d68101c = het apparaat (soort, klasse, en een model voor klasse <c1/>);

seg-e8222178a0ee = hoe de data is vastgelegd: waartegen ze is vergeleken, de starttijd (UTC), de omgeving, en of ze ruw of bewerkt is (en wat ermee is gedaan);

seg-7ac28bd566f2 = de SHA-256 van het databestand, zodat het gescoorde bestand het beschreven bestand is;

seg-0eba30c3a5b8 = de MODELLED rijen waartegen het wordt aangeboden, met de exacte eistekst hierboven;

seg-dd694deec626 = de licentie (een SPDX-identifier of woorden) en hoe de data in de repository mag worden gebruikt: <c1/> (vastgelegd, met bronvermelding), <c2/> (alleen de hash en de scores worden gepubliceerd) of <c3/> (de score wordt alleen met de inzender gedeeld);

seg-7cea4b7c1df8 = drie verklaringen: het is een meting en geen simulatie, de inzender mag het voor dit gebruik in licentie geven, en de bestanden bevatten geen persoonsgegevens.

seg-caa6696f3f5f = <b>Niet te sturen.</b> Alles wat persoonlijk is of contactgegevens bevat (de controle weigert een e-mailadres of telefoonnummer in de beschrijving), alles wat onder exportcontrole valt of bij overeenkomst beperkt is, en alle gesimuleerde data die als gemeten wordt gepresenteerd.

seg-a2f0067b6da5 = Hoe een inzending wordt gecontroleerd

seg-f1d4c097691e = Formaat en metadata, door u of ons, voordat er iets wordt uitgevoerd.

seg-c3cd90222eaa = Het bevestigt het schema, de vereiste velden, de hash, de regels voor licentie en bronvermelding, dat de doelrijen bestaan en MODELLED zijn, dat de data met de eigen lezer van de engine te lezen is, en het meldt wat het las (samples, interval, spanne, gaten) en waarschuwt voor opnamen die kort zijn. Exitstatus { "0" } betekent compleet en leesbaar; { "1" } somt op wat moet worden hersteld. <b>Het scoort de data niet, valideert geen rij en belooft niet dat ze zal worden gebruikt.</b>

seg-7dd95552a6fb = <b>Een preregistratie, vóór elke gescoorde run.</b> Voor elke rij legt een document in <c1/> vast, en wordt vastgelegd voordat de data wordt uitgevoerd: de rij, de SHA-256 van het databestand, welk deel van de data is achtergehouden (niets wat wordt gefit mag het zien), de maat en de drempel. Voor klokkaarten is de bestaande sjabloon de achtergehouden voorspelling die voor de IGS- en ontvangeropnamen is gebruikt: fit op het eerste derde van de opname, voorspel de Allan-deviatie van de rest, en eis dat de verhouding voorspeld tot gemeten binnen een vermelde factor ligt bij elke gefitte middelingstijd. Een drempel wordt na een run nooit versoepeld.

seg-10dc9f8cf394 = <b>Eén gescoorde run.</b> Het resultaat, met elk getal en elke misser, wordt gepubliceerd met de opdracht en de commit, en een test legt het vast. Een misser is een bevinding, geen mislukking om te verbergen: de rij blijft MODELLED en de pagina zegt dat.

seg-e5704c43a6b8 = <b>Het besluit over het register is dat van de eigenaar</b>, schriftelijk, in de commit die de rij wijzigt. De tekst van de onafhankelijke referentie van een bevorderde rij noemt de dataset, haar licentie en vermelding, wat is vergeleken en wat niet.

seg-6d467ffb4199 = Vermelding en rechten

seg-e82f31e7d9cc = De data blijft van u onder de licentie die u vermeldt. <c1/> en <c2/> houden het bestand buiten de repository.

seg-156499ebc142 = Een inzending met <c1/> wordt vermeld met de bronvermelding die u opgeeft, in de tekst van de onafhankelijke referentie van de rij en in het resultaatbestand.

seg-a5c01115d23a = Er wordt niets onder uw naam gepubliceerd zonder uw schriftelijke toestemming; een organisatie die als bron wordt genoemd, wordt als bron geciteerd, nooit als onderschrijver. Door of over een partner wordt geen goedkeuring of onderschrijving beweerd.

seg-6c9ed423e51d = U kunt een inzending intrekken voordat het resultaat is gepubliceerd. Daarna blijft het resultaat zoals vastgelegd; als u de datalicentie intrekt, wordt het bestand uit de repository verwijderd en blijven de hash en de scores.

seg-2cc3c091ba0f = Kshana zendt niets uit en stuurt geen hardware aan. Een inzending is bestanden erin, een rapport eruit.

seg-01b0ee9973dc = Benadering

seg-b5cb4dc0493f = Een bericht van één pagina voor een laboratorium is voor de eigenaar opgesteld in <s1><c1/></s1>. Het is een concept: er wordt niets verzonden en niemand wordt benaderd, tot de eigenaar besluit.

seg-83b30e1ca261 = <s1>Vorige</s1>Bewijspakketten

seg-09c0b5fa6e52 = <s1>Volgende</s1>Optische verbindingen door de atmosfeer
