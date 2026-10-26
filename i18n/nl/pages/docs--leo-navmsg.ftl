# docs--leo-navmsg: translations (nl)

seg-cc651d9cef3b = Code

seg-cbf0f9bcd2d8 = Onafhankelijke referentie

seg-6e0cb6acc073 = VALIDATED

seg-35f8f623ea28 = { "30" } s

seg-f63dd3d7aad4 = Bron

seg-e305279d5b11 = Inhoud

seg-4d208b6c0eb8 = dag

seg-02dc0d42fb21 = sfu

seg-a7d59ba6e225 = rad

seg-0f2d3faa9934 = Bron: <c1/>

seg-d8aaee95aa44 = De scenariosoort <c1/> bouwt het broadcast-efemeride- en klokbericht van een PNT-satelliet (positiebepaling, navigatie en tijdsynchronisatie) in een lage aardbaan (LEO) en beantwoordt de vragen die een berichtontwerper stelt: hoe lang kan één bericht dekken, wat levert elke extra parameter op, wat ziet een gebruiker wanneer het bericht halverwege een passage wijzigt, en hoeveel bits kost het om het tot op de centimeter te dragen.

seg-e61283b1e1a5 = Het is systeemonafhankelijk. Elke baan, elke draaggolf en elk van de vier efemeridemodellen draait zonder enige voorinstelling; de benoemde voorinstellingen zijn optionele gegevens (zie <a1>Voorinstellingen</a1>).

seg-1271cd4ad822 = Druk een meegeleverd voorbeeld af met <c1/> (één naam per aanroep) en voer het uit met <c2/>: <c3/>, <c4/>, <c5/> en <c6/>. De soort is ook de berichtfase van de soort <c7/> (<a1>LEO-PNT.md</a1>) en het lid van de campagne <c8/>, die vier berichtconfiguraties samenstelt en de framelengte van elk rapporteert ({ "146" }, { "154" }, { "159" } en { "171" } bytes).

seg-51da9ffaa0ec = Code: <c1/> — <c2/> (records en gebruikersalgoritme), <c3/> (referentiebaan en -klok), <c4/> (fitter), <c5/> (afstandsfout van het signaal in de ruimte), <c6/> (ionosfeer en Coordinated Universal Time (UTC)), <c7/> (binair formaat), <c8/> (exports in Receiver Independent Exchange Format (RINEX)-stijl en als door komma's gescheiden waarden (CSV)), <c9/> (één bestand per voorinstelling), <c10/> (de soort).

seg-0505113a62e3 = Wat een bericht bevat

seg-6752521002b2 = Onderdeel

seg-cf6ae60eea4f = Hulpgegevens

seg-00eae74cb1e6 = identificatie van het ruimtevoertuig (SVID), issue of data (IOD), bandidentificatie, gezondheidsstatus van het signaal (Galileo-conventie: { "0" } OK, { "1" } buiten dienst, { "2" } uitgebreide operaties, { "3" } in test)

seg-0bdbdd2c923b = Synchronisatie

seg-8120237b02ea = weeknummer, tijd van de week (TOW) van uitzending en een klokpolynoom van de tweede orde <c1/>

seg-b09dc4b322d3 = Efemeride

seg-bbb3225e1d19 = een van de vier onderstaande modellen

seg-3a835a49b43f = Overige diensten

seg-2a13461cb60c = een Klobuchar-broadcast-ionosfeerset, Galileo NeQuick-G-coëfficiënten <c1/> met vijf stormvlaggen, en parameters voor systeemtijd naar UTC <c2/>

seg-6b899ef63047 = Efemeridemodellen

seg-60cd077d82a7 = Model

seg-2afa300864a9 = Parameters

seg-3e8a1cf183cc = de Kepler-set uit het Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD): <c1/>

seg-b1416ba3472f = hetzelfde, plus correctiepolynomen langs de baan, dwars op de baan en radiaal (RAC) <c1/>, <c2/>, <c3/> in <c4/>, coëfficiënten in meters, <c5/> de macht van twee op of boven de helft van het fitinterval (uitgezonden), graden ingesteld door <c6/> (standaard { "7" }, { "5" }, { "6" })

seg-9c0643152bbf = standaard { "16" } + { "21" }, plus de tijdschaal

seg-e0afd541d64c = het model met 22 parameters van Liu, Su, Xie, Zhou en Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): de { "16" } plus <c1/>

seg-a6042071a03f = het ATOMIC-model (Autonomous Time and Orbit Determination for Microsatellite Constellations) met “nulklok”: een aardvast (ECEF) polynoom per as in <c1/> (standaardgraad { "6" }), zonder klokterm omdat de satellietklok op systeemtijd wordt gestuurd (<a1>InsideGNSS</a1>)

seg-5869d6f65796 = standaard { "22" }

seg-6663aa3eeebc = Het gebruikersalgoritme (<c1/>) is de reeks uit het Galileo-ICD (vergelijking van Kepler, correcties van de tweede harmonische, aardvaste knoop), gevolgd, voor <c2/>, door de drie polynomen in het eigen stelsel van de Kepler-baan: radiaal langs de geëvalueerde positie, dwars op de baan langs de baannormaal uit de gecorrigeerde inclinatie en knoop, langs de baan om de driehoek te voltooien. De klok voegt de relativistische ICD-term <c3/> toe; voor <c4/> is dat de algemene vorm <c5/> uit het polynoom en zijn afgeleide.

seg-b3935a85a7b2 = De termen van Liu et al. volgen het gebruikersalgoritme van het artikel (Section { "2.2" }, Eq. 1-7): <c1/>, <c2/> (releases vóór { "0.30" } gebruikten de conventie voor civiele navigatie van het Global Positioning System (GPS) <c3/>, zodat een <c4/> die zij schreven tweemaal die van het artikel is), en <c5/> opgeteld bij de straal, <c6/> het ongecorrigeerde argument van de breedte. De schaalconventie van <c7/> is overgenomen uit Eq. { "1" } van het artikel; de vergelijking met het artikel op echte banen hangt daar niet van af (een factor ½ op <c8/> laat elke gefitte waarde ongewijzigd), dus de betekenis van een uitgezonden waarde van <c9/> is daar niet getoetst aan een onafhankelijke externe referentie.

seg-9a83292bffcf = Twee interpretaties zijn die van Kshana zelf en worden als zodanig vermeld:

seg-0e42fd0d5cf9 = Het RAC-stelsel en de normalisatie <c1/>. Geen enkel openbaar document definieert een correctiestelsel voor LEO in een broadcast-bericht.

seg-1b8aaed09de8 = De klok van een bericht met nulklok is in totaal nul: de stuurlus wordt geacht de schijnbare klok, inclusief de relativistische term, op systeemtijd te houden.

seg-3472ce139588 = De fitter

seg-4404a677d185 = <c1/> integreert de baan met een Runge–Kutta van de vierde orde met vaste stap in een stelsel dat met één rotatie overgaat in aardvaste assen, <c2/>, dezelfde enkele rotatie die een broadcast-gebruikersalgoritme toepast. De zwaartekracht is tweelichamen (<c3/>), de zonale harmonischen J2 tot J6 ({ "2" } tot { "6" }), of het veld van het Earth Gravitational Model { "2008" } (EGM2008) tot graad en orde { "7" } tot { "70" }, waarvan de tesserale termen de kortperiodieke signatuur dragen die een LEO-fit moeilijk maakt. Luchtweerstand is optioneel (statische exponentiële dichtheid). De klok is vrijlopend (bias, drift, driftsnelheid en witte frequentieruis bij een opgegeven Allan-deviatie van één seconde, plus de periodieke relativistische term) of gestuurd (een Gauss–Markov-residu van de eerste orde).

seg-ae3052e66b2a = <c1/> fit de Kepler-set met Levenberg–Marquardt op niet-singuliere elementen (<c2/>, <c3/>, <c4/>): een LEO-baan is vrijwel cirkelvormig, dus <c5/> en <c6/> zijn alleen vrijwel niet van elkaar te onderscheiden. Hij start vanuit de osculerende toestand bij <c7/> met de J2-knoopsnelheid. Zwakke priors gecentreerd op nul begrenzen de snelheden en harmonischen die een korte boog niet kan oplossen; met een waarnemingsgewicht van { "1" } cm werken zij alleen in die nulrichtingen. De fit <c8/> neemt daarentegen de start en schatter uit Section { "2.3" } van het artikel over: hij start met elke correctieterm op nul, heeft geen priors (gewone kleinste kwadraten) en behoudt de limiet van 100 iteraties van het artikel. Hij stopt volgens de eigen parameterconvergentieregel van Kshana, wanneer elke parameterstap kleiner is dan { "1e-3" } van de formele standaarddeviatie; het artikel stopt in plaats daarvan wanneer de RMS met minder dan { "0.1" } mm verandert. De RAC-polynomen worden vervolgens met lineaire kleinste kwadraten gefit op de residuen langs/dwars/radiaal, en het klokpolynoom op de referentieklok min de relativistische term die de gebruiker weer optelt.

seg-020f45edcae1 = Een bevinding die de standaardwaarden vastleggen: na een Kepler-fit met kleinste kwadraten is het residu per constructie wat de { "16" } parameters niet kunnen overspannen, dus het oscilleert over het venster (meerdere nuldoorgangen in elke component) in plaats van te driften. Een correctiepolynoom verwijdert het alleen wanneer zijn graad groter is dan wat de Kepler-set al overspant: langs de baan { "7" }, dwars op de baan { "5" } en radiaal { "6" } brengen een residu van 15 minuten van centimeters terug tot ongeveer een millimeter, terwijl lagere graden dwars op de baan vrijwel niets verwijderen (het residu dwars op de baan is oneven om het midden van het venster). Een systeem dat zijn Kepler-deel op een andere manier afleidt, laat een residu van een andere vorm achter, en de benodigde graden volgen daaruit. De eigen correctiegraden van de Celeste-voorinstelling (lager dan deze; ze staan alleen in het voorinstellingsbestand, <c1/>) draaien hier op de kleinste-kwadratenbasis van Kshana, en daarom dragen de termen dwars op de baan in deze engine weinig bij: een uitspraak over de fitter van Kshana, niet over enig echt systeem. <c2/> en <c3/> zijn hele seconden, zoals het binaire formaat ze draagt.

seg-f3538e6651fa = Elk bericht wordt gebruikt over een periode die in zijn fitvenster is gecentreerd (de eerste afwegingstabel gebruikt het hele venster). Wat de cijfers voor de afstandsfout van het signaal in de ruimte (SISRE) meten, is de <b>representatiefout</b> van het bericht ten opzichte van de referentie waarop het is gefit, als root mean square (RMS) en als maximum over de overspanning. De fout van baanbepaling en baanvoorspelling, die een echt grond- of boordsegment daar bovenop toevoegt, wordt niet gemodelleerd.

seg-c2b181269367 = Afstandsfout van het signaal in de ruimte

seg-63462a1abc95 = <c1/> gebruikt de wereldgemiddelde SISRE van Montenbruck, Steigenberger en Hauschild ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

seg-c4f654264c42 = De gewichten zijn de gemiddelden over gebruikers die gelijkmatig zijn verdeeld over de zichtbare aardkap van <c1/> en <c2/>, met <c3/> de nadirhoek van de zichtlijn bij de satelliet, berekend voor de eigen straal en elevatiemasker van de baan. Bij een masker van { "0" }° reproduceert de berekening de tabel van het artikel voor de gemiddelde aardbaan (GPS { "0.98" } en 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) en de geostationaire baan ({ "0.99" } en 1/126): dat is de <b>VALIDATED</b> controle. Bij LEO geeft hetzelfde gemiddelde

seg-66b488889b10 = Hoogte

seg-c07128592d7b = nadirhoek aan de horizon

seg-a4e04d9a23a5 = { "320" } km

seg-002adc24471f = { "510" } km

seg-fe2f70c29806 = { "550" } km

seg-4dee38ff0811 = { "786" } km

seg-cfc3c6939861 = { "1080" } km

seg-102de0413553 = { "1336" } km

seg-1b11819c8b2f = zodat een LEO-gebruiker, die de satelliet ver van nadir ziet, fouten langs en dwars op de baan veel sterker voelt dan een gebruiker in een gemiddelde baan.

seg-b7a844ab6135 = Analyses

seg-17111fe25e04 = <c1/> kiest een van de vier (standaard alle).

seg-d0c1b335af73 = Afweging van het fitinterval

seg-f65e99c0d8b2 = <c1/> stelt de overspanning, de fitintervallen, de updateperioden en de modellen in. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 tot graad { "20" } en luchtweerstand, { "30" } minuten aan berichten) geeft, met een gebruiksperiode gelijk aan het fitinterval:

seg-f1a94c795c18 = Fitinterval

seg-c6b034712788 = SISRE baan-RMS

seg-55c287c93940 = SISRE baan max

seg-ad604a608329 = SISRE met klok-RMS

seg-28723ab60ae0 = radiaal / langs / dwars RMS

seg-911a62245e80 = { "60" } s

seg-1a35a89c1a34 = { "0.041" } cm

seg-7cf9e6e3178f = { "0.179" } cm

seg-d8a7f4c080dd = { "0.069" } cm

seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

seg-64015edf42d8 = { "120" } s

seg-a1070c338686 = { "0.032" } cm

seg-cdacf90f8ce8 = { "0.160" } cm

seg-29aeee696ad2 = { "0.079" } cm

seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

seg-8fa4e4ccc5cc = { "180" } s

seg-13182ae6d536 = { "0.093" } cm

seg-fc692062aaa8 = { "0.540" } cm

seg-9ef760f0777c = { "0.134" } cm

seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

seg-bbd4f2685bee = { "300" } s

seg-93410318239b = { "0.310" } cm

seg-4af8f1c977eb = { "1.033" } cm

seg-0921a535896a = { "0.329" } cm

seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

seg-8de43db30454 = { "450" } s

seg-ec7f9ca7654b = { "1.690" } cm

seg-1ad55674fab9 = { "7.542" } cm

seg-a022913c956d = { "1.696" } cm

seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

seg-21b0c99fbda4 = { "600" } s

seg-6840aea9ff12 = { "2.875" } cm

seg-798c8c1d0190 = { "10.219" } cm

seg-6b3b442069d8 = { "2.866" } cm

seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

seg-4dabf1faddfc = { "900" } s

seg-d733d3fdac02 = { "9.345" } cm

seg-3334d120521b = { "34.032" } cm

seg-4d4a2cc180d0 = { "9.349" } cm

seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

seg-f1d733b03f45 = { "0.000" } cm

seg-81a60d921ce9 = { "0.057" } cm

seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

seg-c8a720a6f160 = { "0.074" } cm

seg-b13f5539e4b1 = { "0.001" } cm

seg-1c9d3ee30ac7 = { "0.090" } cm

seg-7dd08c671dc7 = { "0.004" } cm

seg-740e69fcd85e = { "0.014" } cm

seg-c0db4312d8a0 = { "0.106" } cm

seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

seg-f3bda174cbef = { "0.037" } cm

seg-5a5bb868e8ff = { "0.176" } cm

seg-02b99fcb9fee = { "0.127" } cm

seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

seg-ec1e77bc5be9 = { "0.214" } cm

seg-d3c1ed834802 = { "0.643" } cm

seg-23482e7c028f = { "0.229" } cm

seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

seg-bfec9407ffae = { "1.015" } cm

seg-f295ad6efcf4 = { "3.695" } cm

seg-2cd92d16edfc = { "1.062" } cm

seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

seg-4e19f776d1b7 = En met een fit van { "300" } s, waarbij varieert hoe vaak een nieuw bericht het overneemt:

seg-89810ffbeff3 = Updateperiode

seg-d4d1fa05e1a8 = { "0.314" } cm

seg-828b7488993b = { "0.850" } cm

seg-edb934c1419f = { "0.288" } cm

seg-52c8f821a7d2 = { "0.859" } cm

seg-e135107af135 = { "150" } s

seg-e7ce46d74f3e = { "0.219" } cm

seg-3391df1cf909 = { "0.830" } cm

seg-d6eb4f554461 = { "0.009" } cm

seg-22c68874002b = { "0.010" } cm

seg-2172d9ea618e = De Kepler-set met 16 parameters verslechtert van { "0.04" } cm bij { "60" } s tot { "9.35" } cm bij { "900" } s: één Kepler-set met harmonischen van tweemaal per omloop kan de zwaartekrachttermen met hogere frequentie en de luchtweerstand van een LEO-boog niet langer dan een paar minuten volgen, en zijn kleinste-kwadratenresidu oscilleert over het venster. De polynomen langs/dwars/radiaal (graden { "7" }, { "5" }, { "6" }) absorberen wat overblijft: { "1.01" } cm bij { "900" } s, { "0.21" } cm bij { "600" } s. Bij de kortste intervallen zijn de Kepler-waarden submillimeter en niet langer strikt geordend (de fit wordt dan beperkt door de conditionering, niet door het model).

seg-aca262796570 = Modelvergelijking

seg-fdf2368d0210 = <c1/> draait de vier modellen op { "1" }, { "5" } en { "10" } minuten op dezelfde baan, met het aantal parameters en de bits voor efemeride en klok in de codering van Kshana:

seg-7d3c6c43390d = Efemeride- + klokbits

seg-f7f60c66d89e = { "0.022" } cm

seg-f7bcb8a44fde = { "0.049" } cm

seg-2972b631701e = { "0.230" } cm

seg-cc42e8dc7238 = { "0.260" } cm

seg-67e50069c6f7 = { "3.061" } cm

seg-780954ab9d7f = { "3.071" } cm

seg-de81d6550264 = { "0.044" } cm

seg-fb171bf75f27 = { "0.005" } cm

seg-c8c067631f7a = { "0.120" } cm

seg-2dc41855c245 = { "0.208" } cm

seg-6ef79938dd22 = { "0.046" } cm

seg-7e96d7e34e63 = { "0.142" } cm

seg-c43199891163 = { "0.258" } cm

seg-f9a9fdebc114 = { "0.290" } cm

seg-f157ff5b40b1 = <c1/> (nulklok)

seg-9474a775dc5e = { "28.784" } cm

seg-5098c8b6f813 = { "0.561" } cm

seg-5e7fdc441b03 = { "28.774" } cm

seg-82d3fa2e27ef = De rij met nulklok wordt gescoord tegen een klok die is gestuurd met een residu van { "0.24" } m (de ATOMIC-waarde), de andere tegen de vrijlopende klok die zij fitten.

seg-769db176020f = <b>Liu et al. { "2025" }, SISRE versus hoogte (MODELLED).</b> Hetzelfde scenario fit het model met 22 parameters van Kshana over bogen van 20 minuten op de vijf hoogten van het artikel, bij de inclinatie van elke satelliet:

seg-01e587427a7e = Satelliet

seg-f6bbd3d5d75c = Inclinatie

seg-c54d0bd7d498 = Liu et al. { "2025" }

seg-16c489b75f44 = Kshana (alleen baan-RMS)

seg-ee4816ca13c1 = verhouding

seg-510349500d23 = { "8.88" } cm

seg-a97bde451ec2 = { "4.25" } cm

seg-b6c1d48847d9 = { "475" } km

seg-f79249e9bd75 = { "6.21" } cm

seg-9b6757a674a5 = { "2.87" } cm

seg-62008169ca69 = { "2.20" } cm

seg-06a4bcde0ea3 = { "966" } km

seg-9e5e06ec23c3 = { "2.11" } cm

seg-41ce80bc0b62 = { "1.25" } cm

seg-c9f63cd8bd07 = { "0.75" } cm

seg-f11a960a1d52 = { "0.51" } cm

seg-0376cf5f98f0 = Dit is <b>geen</b> toetsing aan een onafhankelijke externe referentie. Het artikel fitte echte precieze wetenschappelijke banen van de genoemde satellieten (met hun volledige zwaartekracht-, luchtweerstands- en niet-zwaartekrachtgeschiedenis); Kshana fit zijn eigen geïntegreerde baan, evalueert de zes toegevoegde parameters zoals hierboven beschreven en gebruikt zijn eigen SISRE-gewichten. De vergelijking toont de trend en de orde van grootte. De vergelijking op dezelfde echte banen die het artikel fitte is <c1/> (sinds { "0.30" } komt de fit met 22 parameters daar overeen binnen de vooraf vastgelegde factor { "1.5" }, op de dagen van het artikel en op acht achtergehouden dagen).

seg-d82887c766e3 = Update halverwege de passage

seg-d1104b6ea7fa = <c1/> plaatst een gebruiker (standaard { "45" }° N, { "10" }° O), vindt de hoogste passage boven het masker binnen <c2/> en plant berichten elke <c3/>. Bij elke omschakeling binnen de passage rapporteert het de positiesprong, de kloksprong, de pseudorangesprong van de gebruiker (nieuw bericht min oud), de grootste sprong die een zichtbare gebruiker kan zien (gesloten vorm over de nadirkegel), de afstandsfout vóór en na, en PASS of FAIL tegen <c4/>. <c5/> (fits van { "300" } s, elke { "150" } s bijgewerkt):

seg-7d91304c87e3 = De hoogste passage van een dag bereikt { "43.7" }° en duurt { "455" } s. De omschakelingen:

seg-289e8da49cc8 = Omschakeling

seg-e80d12ee2259 = Elevatie

seg-b16789d14338 = Positiesprong

seg-b3c252609532 = Kloksprong

seg-8239a390ec71 = Gebruikersafstandssprong

seg-4153faf7969d = Sprong in de slechtste geometrie

seg-14402c7fb332 = IOD { "270" } → { "271" }

seg-7862a97ac55f = { "0.07" } mm

seg-4cfe934c881f = { "0.19" } mm

seg-9e9752920165 = -0.17 mm

seg-4267557786be = { "0.27" } mm

seg-46872e8925b2 = IOD { "271" } → { "272" }

seg-4c803fd2ccc9 = { "0.14" } mm

seg-cc9a8388f6bc = -0.24 mm

seg-0549f7fd0633 = IOD { "272" } → { "273" }

seg-ad1afcf9a466 = -0.22 mm

seg-c1b30171b4f0 = { "0.35" } mm

seg-f93647402fa9 = { "0.48" } mm

seg-69b35182807c = Grootste gebruikersafstandssprong { "0.35" } mm tegenover een drempel van { "5" } cm: <b>PASS</b>.

seg-96dcb456600d = Coderen en decoderen

seg-1b3674a0e041 = <c1/> codeert het eerste van drie berichten, decodeert het, controleert de CRC en weigert een beschadigde kopie, drukt het kwantisatiebudget af en schrijft en leest het RINEX-achtige blok en de CSV-tabel terug:

seg-480eb9ffc333 = frame: { "171" } bytes ({ "1310" } payloadbits, waarvan { "1045" } efemeride en klok), 24-bits cyclische redundantiecontrole (CRC-24Q) <c1/>;

seg-0e2a64a063fd = grootste halve-stapseffect van een enkel veld: <c1/>, { "0.545" } mm;

seg-a1875f7088b0 = heel bericht na kwantisatie: positie binnen { "1.126" } mm en klok binnen { "0.185" } mm van het exacte bericht; SISRE { "0.113" } cm exact, { "0.129" } cm gedecodeerd;

seg-6e818708b695 = een frame met één omgeslagen bit wordt geweigerd: true;

seg-31fe0f6b133d = RINEX-achtige rondgang binnen { "5.0e-06" } m, CSV-rondgang binnen { "0.0e+00" } m.

seg-405cf34090cc = Platformonafhankelijkheid

seg-7f2193f6ff06 = Een frame wordt als gehele getallen uitgezonden, dus het moet dezelfde gehele getallen opleveren waar en hoe het scenario ook draait: de native binary op elk besturingssysteem, een debug- of een releasebuild en de WebAssembly-build (WASM) in een browser. Drie dingen stonden hierbij in de weg. De sinus, cosinus, arctangens en exponentiële functie van de wiskundebibliotheek van een host zijn niet verplicht correct afgerond en verschillen tussen hosts in de laatste plaats. Een geoptimaliseerde build op macOS haalt een sinus en een cosinus van één argument uit de gecombineerde routine van het systeem, die niet altijd de waarde van de losse sinus teruggeeft, waardoor ook een debug- en een releasebuild van elkaar verschilden. En de gebruikelijke normale sampler roept in zijn zeldzame takken de exponentiële en logaritmische functie van de host aan. De fit zet een zo klein verschil om in andere gekwantiseerde velden. Het hele soort (referentiebaan en -klok, fit, gebruikersalgoritme, signal-in-space range error (SISRE), codec) berekent daarom elke dergelijke functie met de pure-Rust-crate <c1/> via <c2/>, gehele machten als expliciete producten en normale afwijkingen met de polaire methode op de ruwe uitvoer van de generator. <c3/> legt het frame van 171 bytes van het scenario voor coderen en decoderen hieronder vast, plus één controlewaarde per efemeridemodel; een debug-build, een releasebuild en de WASM-build geven byte-identieke resultaatdocumenten voor alle vijf meegeleverde <c4/>-scenario's.

seg-1ef00467df17 = Binair formaat

seg-af2dae9e9e7c = <b>Dit is de eigen, gedocumenteerde codering van Kshana.</b> Ze bevat de onderdelen die de gepubliceerde beschrijvingen van LEO-navigatieberichten noemen, naar het voorbeeld van de veldenset van de Galileo ICD. Ze is <b>niet</b> de bitindeling van Celeste of van enig ander systeem: die is niet openbaar.

seg-6a730c01ad1c = Frame: preambule <c1/> ({ "8" } bits), versie { "1" } ({ "4" }), model ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), payloadlengte in bytes ({ "12" }), payload met nullen aangevuld tot een byte, CRC-24Q (een 24-bits cyclische redundantiecontrole, { "24" } bits) over alle voorafgaande bytes. CRC-24Q is de controle van de norm van de Radio Technical Commission for Maritime Services, RTCM { "10403" }, en van de Galileo ICD (polynoom <c6/>, beginwaarde { "0" }); de code reproduceert de cataloguscontrolewaarde <c7/> voor <c8/> en de controlebytes van het voorbeeldframe van berichttype { "1005" } uit RTCM { "10403" } (<b>VALIDATED</b>).

seg-a31d899eb435 = De stappen van de Galileo ICD zijn gekozen voor een middelhoge baan om de aarde en zijn te grof voor een LEO-bericht op centimeterniveau: <c1/> in stappen van { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm op LEO-straal), de hoeken { "2" }⁻³¹ halve cirkels ({ "1.0" } cm) en <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana behoudt de ICD-eenheden en de conventie van halve cirkels, verfijnt de stappen zodat de halve-stapsfout van elk veld onder { "1" } mm positie of afstand blijft over een venster van 15 minuten, en verbreedt de velden om de bereiken te dekken die een LEO-fit nodig heeft:

seg-caddc6f5b9a7 = Blok

seg-b548b723c201 = Bits

seg-d00b65801e9b = Stap

seg-2085d172bec3 = hulp en synchronisatie

seg-7e9018f82811 = week

seg-45cbfedb6f0e = klok (vlagbit { "0" })

seg-05d274f5ce99 = s/s^{ "2" }

seg-9d6d5136e12a = Kepler (modellen 1-3)

seg-3fb59c8238cb = halve cirkel

seg-d173e8d7026c = m^{ "0.5" }

seg-48c8bfb6e914 = langs-, dwars- en radiale correcties (model { "2" })

seg-131652f53721 = Extra's van Liu et al. { "2025" } (model { "3" })

seg-fccf37a24fc4 = halve cirkel/s^{ "2" }

seg-ebde561c17ab = ECEF-polynoom (model { "4" })

seg-822c7482547c = Klobuchar (vlagbit { "1" })

seg-7dd6e8bcaf43 = s/halve cirkel^{ "2" }

seg-09408b08c481 = s/halve cirkel^{ "3" }

seg-734162101b2d = NeQuick-G (vlagbit { "2" })

seg-ddbb363f4593 = sfu/deg^{ "2" }

seg-e2744b31e5d3 = UTC (vlagbit { "3" })

seg-545755e7b26f = Een waarde buiten het bereik van haar veld wordt geweigerd, niet omgeslagen. De bereiken zijn gecontroleerd door fits te coderen op { "300" } tot { "2000" } km, bij inclinaties van { "0" }° tot { "140" }° en fitintervallen tot { "20" } minuten: <c1/> en <c2/> zijn breed omdat de knoop op een bijna-equatoriale baan slecht gedefinieerd is en de fit de J2-drift van het argument van de breedte tussen beide verdeelt, en <c3/> en <c4/> omdat de fit met 22 parameters over { "20" } minuten een deel van de kortperiodieke oscillatie van de halve lange as opneemt. Sinds { "0.30" } is de fit met 22 parameters de gewone kleinste-kwadratenmethode van het artikel zonder priors, en een equatoriale fit op { "800" } km heeft dan <c5/> van ongeveer { "6.3e-10" } halve cirkel/s^{ "2" } nodig, waardoor de schaal van { "2" }^-60 naar { "2" }^-58 ging. De langsbaancorrecties van graad 7 van <c6/> passen in het coëfficiëntbereik van 22 bits tot { "15" } minuten; een langere fit kan dat overschrijden en wordt dan geweigerd. <c7/> rapporteert voor elk efemeride- en klokveld de grootste verandering in positie en afstand die een verandering van een halve stap over de gebruiksperiode veroorzaakt, en de verandering van het hele bericht na kwantisatie.

seg-1ad17f3d3643 = Tekstexports

seg-81fb376aa1e1 = <b>RINEX { "4.02" } definieert geen LEO-navigatierecords</b> (de systeemletters zijn G, R, E, J, C, I en S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Het blok dat <c1/> schrijft leent de RINEX-{ "4" }-vorm — een recordkop <c2/>, een satelliet- en epochregel met drie klokcoëfficiënten, broadcast-baanregels van vier <c3/>-velden — en is een <b>gedocumenteerde Kshana-extensie</b>: systeemletter <c4/>, recordtypen <c5/>, <c6/>, <c7/>, <c8/> en drie koptekstcommentaren die dat vermelden. Eerder werk over LEO-banen in navigatierecords in RINEX-4-stijl: <a2>arXiv { "2401.17767" }</a2>.

seg-9a3016441bce = De CSV-tabel bevat de berichten <c1/> en <c2/>, één per rij. De standaardkolommen gebruiken de namen van de Galileo ICD (<c3/>); <c4/> kiest in plaats daarvan de spelling van een voorinstelling. Beide formaten kunnen worden teruggelezen.

seg-4a26902d2771 = Ionosfeer en UTC

seg-c4d4dd2bac45 = <b>Klobuchar</b>: het L1-model van de engine (<c1/>, getoetst aan RTKLIB), met de eerste-ordewet <c2/> geschaald naar de draaggolf.

seg-0d3973f04ee5 = <b>NeQuick-G</b>: de coëfficiënten reizen mee in het bericht en <c1/> geeft <c2/> terug voor een gemodificeerde dip-breedte <c3/>, met de regels van het algoritme (coëfficiënten die allemaal nul zijn geven { "63.7" } solar flux units, sfu; het resultaat wordt begrensd tot [{ "0" }, { "400" }] sfu). Het NeQuick-elektronendichtheidsmodel en de integratie langs het schuine pad, die <c4/> omzetten in een vertraging, zijn <b>niet</b> geïmplementeerd.

seg-66dbd447dfeb = Een satelliet op enkele honderden kilometers vliegt binnen de ionosfeer. Geen van beide broadcastmodellen houdt rekening met de elektroneninhoud boven de satelliet, en er wordt daarvoor geen correctie toegepast.

seg-7befd59b2ac6 = <b>UTC</b>: <c1/> past de drie gevallen van de Galileo ICD §{ "5.1.7" } toe (vóór, binnen zes uur van en na een schrikkelseconde); een ingevoegde seconde leest { "86400" }.

seg-2b0d77219437 = Voorinstellingen

seg-d2908020db08 = Voorinstellingen zijn gegevens, elk één bestand onder <c1/>, met hun bronnen. De engine en elk meegeleverd scenario behalve dat van Celeste draaien zonder.

seg-c353e7bec219 = Sleutel

seg-5566e1d71a4f = Baan

seg-33f4c7af9c53 = Draaggolf

seg-f4510e898031 = Berichtmodel

seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

seg-890aa92157e4 = { "1080" } km, { "53" }°

seg-1eca13ba2309 = X1 { "1593.3225" } MHz

seg-ee9947222a30 = niet gepubliceerd

seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

seg-f016786d7755 = { "520" } km, { "97" }°

seg-780e931bf88d = PUBLIC, <a1>RNTF-rapport</a1>, beschrijving van de constellatie

seg-d5df094a5f89 = { "781" } km, { "86.4" }°

seg-94bc78cee128 = { "1621" } MHz (band van { "1616" }–{ "1626" } MHz)

seg-3f5de7f74502 = geen uitzending

seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, beschrijving van de constellatie

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-2ef501f97eff = Ku-band, waarde midden in de band (representatief)

seg-567fab40bd24 = geen (signals of opportunity)

seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

seg-f5dd5086eedd = { "700" } km, { "55" }°

seg-5fa6b60f66b4 = nabij B1 (in de bron afgeschermd; L1 als vervanging)

seg-5ebbf0042d7c = REPRESENTATIVE

seg-4f3e5a683682 = { "600" } km, { "97.8" }°

seg-c06f62ca5173 = { "5020" } MHz (midden van RNSS C-band)

seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

seg-3b1fd041f9ba = { "500" } km (representatief)

seg-522c85402d84 = L1 (representatief)

seg-064b03765e4d = <c1/>, graad { "6" }, { "60" } s, elke { "30" } s ververst, nulklok, { "0.24" } m restfout van de sturing

seg-5619bc61b958 = WORKSHOP en PUBLIC

seg-20572d7e348d = { "510" } km, { "97.4" }°

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-fad0950a2d67 = <c1/>, graden en recordafstand in het voorinstellingsbestand

seg-e881ffc4e14b = RNSS is de radionavigatiesatellietdienst; RNTF is de Resilient Navigation and Timing Foundation.

seg-e9524c71636d = <b>Celeste IOD.</b> De voorinstelling voor de in-orbit demonstration (IOD) Celeste van het Europees Ruimteagentschap (ESA) is de enige die materiaal gebruikt dat is gepresenteerd op de LEO-PNT-workshop van het ESA Navigation Innovation and Support Programme (NAVISP), { "2026" }: de berichtstructuur (Galileo-Keplerset plus langs-, dwars- en radiale correctiepolynomen, klokpolynoom, SVID, health, IOD, ionosferische en UTC-parameters), de recordafstand en de CSV-kolomnamen. De baan ({ "510" } km, bijna polair zonsynchroon) en de draaggolf komen uit openbare bronnen die in het bestand worden aangehaald. De bitindeling van Celeste is niet openbaar en wordt niet nagebouwd; latere Celeste-fasen en het LEO-PNT-systeem van de Europese Unie (EU) kunnen afwijken. Elke van de workshop afgeleide waarde staat in de module <c1/> van <c2/>, gebruikt door <c3/>. Hoe de voorinstelling wordt achtergehouden: elk van de workshop afgeleid getal van de engine staat in één bestand, <c4/>, dat <c5/> alleen meecompileert als het bestaat, en in de scenario's <c6/> die alleen in de repository staan. Door dat bestand en die scenario's te verwijderen wordt de voorinstelling achtergehouden zonder bronwijziging; elke andere test, onafhankelijke referentie en elk ander scenario draait zonder haar, en het aantal scenariobestanden in de README telt de achtergehouden bestanden nog steeds mee.

seg-906da2752f76 = Verificatie

seg-7338b6210228 = Rij

seg-c5ce76c91ff7 = Label

seg-cfe0d596296e = SISRE-gewichten

seg-3e0059048a0d = Tabel van Montenbruck et al. { "2018" } (GPS, GLONASS, Galileo, BeiDou, geostationair)

seg-0f5e73171fe0 = Gebruikersalgoritme van de Galileo ICD

seg-29ad977ef423 = RTKLIB <c1/> op vier echte Galileo-broadcastefemeriden, { "1" } mm per as (<c2/>)

seg-ecec254e8219 = cataloguscontrolewaarde <c1/>; RTCM { "10403" } voorbeeldframe { "1005" }

seg-388633e4e785 = Fitter en SISRE-afweging

seg-8b85c3277e66 = tweelichamenreferentie teruggevonden tot { "1" } mm; gecorrigeerde J2–J6-fit tot { "1" } mm; monotone groei met het interval

seg-4de7f2b173c5 = Continuïteit halverwege de pass

seg-bdbd2771c7f5 = sprongidentiteit; gesloten-vormgrens van de kegel tegenover bemonstering

seg-468a92a2caf7 = Binair formaat en budget

seg-ba26f5f63172 = rondgangen; de halve stap van elk veld onder { "1" } mm

seg-9be43cbef131 = RINEX-achtig en CSV

seg-a7748156fd6e = rondgangen

seg-88b5cda10923 = Model en fit met 22 parameters van Liu et al. { "2025" }

seg-7272ebdc1fec = nauwkeurige banen van TU Graz ITSG van vier satellieten tegenover de tabellen { "4" }, { "5" }, { "6" } en { "8" } van het artikel: verhoudingen langs, dwars, radiaal en SISRE van { "0.755" } tot { "1.138" } op de dagen van het artikel en { "0.683" } tot { "1.186" } op acht achtergehouden dagen, binnen 1.5x (<c1/>)

seg-94066142a642 = ATOMIC-nulklokpolynoom en de tabel met vijf hoogten

seg-205cdc6a3696 = ATOMIC-feiten uit InsideGNSS; de gepubliceerde tabel van Liu naast de fit van Kshana met geïntegreerde baan, niet vastgepind

seg-8c00ed11609c = gesloten vormen uit de ICD; het aan RTKLIB getoetste Klobuchar-model

seg-d5653e0958b5 = SISRE is alleen representatiefout: geen fout in baanbepaling of voorspelling.

seg-4968d9fcbc19 = De referentie is een integratie van Kshana (zonder derde lichamen, zonnestralingsdruk of getijden), niet de nauwkeurige baan van een echte satelliet.

seg-6a4a1bf21b50 = Het binaire formaat en het RINEX-achtige blok zijn van Kshana zelf.

seg-26c0a2693081 = NeQuick-G wordt meegedragen, niet geïntegreerd tot een vertraging; geen correctie voor een satelliet binnen de ionosfeer.

seg-2a0c8190c38e = De vergelijking met Liu et al. verschilt in banen, lezing van de parameters en gewichten.

seg-4abe216f987a = <s1>Vorige</s1>LEO-pass en linkbudget

seg-59d9bf4735d8 = <s1>Volgende</s1>Gecombineerde MEO- en LEO-positiebepaling
