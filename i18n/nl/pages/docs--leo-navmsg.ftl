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
