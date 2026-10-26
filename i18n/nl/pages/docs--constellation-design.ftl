# docs--constellation-design: translations (nl)

seg-f63dd3d7aad4 = Bron

seg-8f0e4021404d = Bron: <c1/>

seg-44196ab9678c = De soort <c1/> bouwt een of meer satellietconstellaties rond de aarde, de maan, Mars of een ander lichaam uit de catalogus van het zonnestelsel (<c2/>: de acht planeten, Pluto, de maan, Phobos, Deimos, de vier Galileïsche manen en Titan, met dezelfde constanten als de soorten <c3/> en <c4/>; zie <a1>SOLAR-SYSTEM.md</a1>) en brengt hun dekking en dilution of precision (DOP) in kaart over een breedte-/lengtegraadraster. Bron: <c5/>.

seg-61385c509a3d = Het lichaam wordt gekozen met <c1/> (standaard <c2/>). De run beslaat <c3/> (standaard één siderische dag, { "86 164" } s) in stappen van <c4/> (standaard { "600" } s), boven <c5/> (standaard { "5" } graden), op een raster van <c6/> (standaard { "10" } graden) dat met <c7/>, <c8/>, <c9/> en <c10/> kan worden beperkt; <c11/> voegt de seculiere drift toe van J2, de tweede zonale harmonische van het zwaartekrachtveld van het lichaam.

seg-d02f6d747522 = Wat erin gaat

seg-743e68478333 = <b>Walker-schillen</b> in de notatie <c1/>: <c2/> satellieten in <c3/> gelijkmatig verdeelde vlakken met fasering <c4/>. Een <em>delta</em>-patroon spreidt de klimmende knopen over { "360" } graden, een <em>star</em>-patroon over { "180" } graden. Vlak <c5/> ligt bij knoop <c6/> en satelliet <c7/> daarvan bij gemiddelde anomalie <c8/>.

seg-d86b01d633a0 = <b>Expliciete elementensets</b>: halve lange as of hoogte, excentriciteit, inclinatie, rechte klimming van de klimmende knoop (RAAN), argument van de periapsis en gemiddelde anomalie.

seg-0737ef1ddb72 = <b>Voorinstellingen</b> uit gepubliceerde nominale elementen (alleen aarde; een voorinstelling rond een ander lichaam is een fout):

seg-587beeccaa11 = Voorinstelling

seg-1ff32b87e030 = Satellieten

seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5e editie, april { "2020" }, Tabellen 3.2-1 en 3.2-3

seg-fb6956d09acc = { "24" } tot { "30" }

seg-f679ee0f3a3f = SPS PS Tabel 3.2-2: elk van de zes uitbreidbare slots (B1, D2, F2, A2, C4, E3) dat in <c1/> wordt genoemd, wordt vervangen door zijn voorste en achterste paar; standaard alle zes

seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), uitgave { "1.1" }: Walker 24/3/1, halve lange as { "29 599.801" } km, { "56" } graden (Tabel { "1" }), slots uit Tabel { "23" }

seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), sectie { "4.1" }: Walker 24/3/1 in een middelhoge aardbaan (MEO) op { "21 528" } km en { "55" } graden, plus drie geostationaire (GEO) satellieten op { "80" }, { "110.5" } en { "140" } graden oost en drie satellieten in een hellende geosynchrone baan (IGSO) op { "55" } graden

seg-70a32cd2402d = GLONASS Interface Control Document (ICD), uitgave { "5.1" } ({ "2008" }), sectie { "5.2" }: slotformule, { "19 100" } km, { "64.8" } graden

seg-654d7aceff94 = De RAAN in de GPS-tabel is inertiaal op zijn epoch; de voorinstelling zet die om in een aardvaste knooplengte met de Greenwich-uurhoek die de tabel vermeldt ({ "100.765" } graden). GLONASS vermeldt absolute (Greenwich) knooplengtes rechtstreeks. Het Galileo-document vermeldt geen uurhoek, dus wordt zijn RAAN als knooplengte gebruikt. De BeiDou-standaard vermeldt de MEO-fase of de IGSO-knopen niet; de voorinstelling begint het MEO-patroon bij knoop { "0" } en gemiddelde anomalie { "0" } en legt de drie IGSO's op één grondspoor dat de evenaar kruist op { "118" } graden oost. Die twee keuzes zijn gemodelleerd.

seg-b2bbdd23c13b = Meerdere constellaties kunnen één run delen. Met <c1/> (de standaard) schat de ontvanger één klok per zichtbaar systeem, zoals een multi-GNSS-ontvanger (Global Navigation Satellite System) dat doet; <c2/> deelt één klok.

seg-27db52482bdd = Wat eruit komt

seg-2405196cfccb = Per rastercel: gemiddeld, minste en meeste satellieten boven het masker; het aandeel epochs met een positiebepaling en met positie-DOP (PDOP) op of onder <c1/>; gemiddelde geometrische, positie-, horizontale en verticale DOP (GDOP, PDOP, HDOP, VDOP); grootste PDOP. Wereldwijd, gewogen met de cosinus van de breedtegraad zodat elke cel naar zijn oppervlak meetelt: beschikbaarheid, beschikbaarheid op de slechtste locatie, en het gemiddelde, de mediaan, het 90e, 95e en 99e percentiel en het maximum van elke DOP. Per satelliet: een gedownsampled grondspoor (<c2/> samples, standaard { "24" }, voor ten hoogste <c3/> satellieten, standaard { "120" }). De grafiek bestaat uit twee kaarten: beschikbaarheid en gemiddelde PDOP.

seg-6cb532d0bca9 = Hoe het schaalt

seg-988ae3272c1f = Een satelliet op straal <c1/> staat precies boven een elevatiemasker <c2/> wanneer zijn middelpuntshoek ten opzichte van de gebruiker hoogstens <c3/> is, dus de zichtbaarheidstest is één inproduct met <c4/>. Elke epoch worden de satellieten ook gesorteerd op breedtegraad van het subsatellietpunt, en een rasterrij op breedtegraad <c5/> test alleen de satellieten binnen <c6/> van <c7/>. Beide zijn exact op een bolvormig lichaam, en een unittest toetst elke kaart aan een brute-force-scan met de directe elevatietest. Het blok <c8/> meldt de paartests die een brute-force-scan zou doen en de tests die zijn gedaan. Het ontwerp met { "5" } 000 satellieten uit de unittest op een raster van { "10" } graden ({ "648" } punten, { "6" } epochs) houdt { "9.9" } % over van de { "19 440 000" } paartests van brute force; het meegeleverde scenario <c9/> ({ "5 000" } satellieten, { "648" } punten, { "12" } epochs) draait in ongeveer { "0.14" } s met de release-opdrachtregelbinary op een laptop met Apple-silicon. Wandkloktijden variëren met de machine en de belasting ervan. De engine gebruikt geen threads, klok of bestandssysteem, dus hij draait ongewijzigd als WebAssembly.

seg-abba032ee1c7 = Wat wordt gecontroleerd, en waaraan

seg-2342ed239300 = VALIDATED, aan de hand van gepubliceerde documenten:

seg-dc7fe92fcf05 = de Walker-generator reproduceert alle { "24" } rijen van Galileo OS SDD Tabel { "23" }, en de slotformule van de GLONASS ICD is dezelfde set van { "24" } slots als een Walker 24/3/1;

seg-686f9543c7c9 = de GPS-voorinstelling reproduceert de kolom met de equatorkruising van het grondspoor in SPS PS Tabellen 3.2-1 en 3.2-2: { "35" } van de { "36" } locaties binnen { "0.0108" } graden tegen een afrondingsdrempel van { "0.015" } graden. E3F wordt aan een ruimere drempel van { "0.06" } graden gehouden, omdat de eigen E3F-rij van de tabel niet overeenstemt met zijn RAAN en breedteargument: zijn breedteargument ligt { "14.60" } graden vóór dat van E3, wat de kruising { "7.30" } graden verschuift, terwijl de tabel haar { "7.36" } graden verschuift;

seg-dc2756c75401 = de GPS-basislijn onder de voorwaarden van SPS PS Appendix B (één siderische dag, { "287" } stappen van vijf minuten, een raster van { "4" } graden, alles in zicht, masker van { "5" } graden) geeft een wereldwijde HDOP-mediaan van { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } en gemiddelde { "0.965" }, tegen de gepubliceerde { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } en { "0.96" } (drempel { "0.03" }, vastgelegd vóór de eerste run). De PDOP-mediaan { "1.795" } ligt onder de { "1.815" } van Tabel B.3-1, die een gedegradeerde mix van 20-24 satellieten beschrijft. PDOP van { "6" } of minder geldt gedurende { "100" } % van de tijd, tegen { "98" } % wereldwijd en { "88" } % op de slechtste locatie in Tabel 3.8-1.

seg-9aac9d8aa228 = Gecontroleerd aan de hand van een afleiding met de hand, niet aan een extern document: een DOP voor één epoch komt overeen met de gesloten vorm voor een satelliet in het zenit en drie op { "30" } graden elevatie (PDOP 8/3, GDOP { "3.0732" }).

seg-d946dad08e23 = MODELLED: tweelichamenbanen met een optionele seculiere J2-drift; een bolvormig lichaam; alleen geometrische zichtbaarheid (geen signaalvermogen, satellietstatus of terrein); geen verstoring door een derde lichaam, waarvan een echte maanbaan met bevroren excentriciteit wel afhangt. Het slechtste afzonderlijke punt in tijd en ruimte hangt af van het raster: HDOP { "2.40" } en VDOP { "5.22" } hier tegen { "2.49" } en { "5.43" } gepubliceerd; deze worden gemeld, niet vastgezet. De voorinstellingen van de vier systemen komen uit verschillende referentie-epochs, dus hun onderlinge fase in één run is geen momentopname van enige datum.

seg-a6c63abeb7e6 = Meegeleverde scenario's

seg-3e6a942c84d4 = Elke regel geeft weer wat de run afdrukt met kshana { $version }.

seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou en GLONASS ({ "102" } satellieten) over één dag boven een masker van { "10" } graden, één klok per systeem. Beschikbaarheid (PDOP { "6" } of minder) { "100" } % wereldwijd en op de slechtste locatie, mediaan-PDOP { "0.95" }, gemiddeld { "31.0" } satellieten in zicht.

seg-b65ade1eab04 = <c1/>: { "5 000" } satellieten in vier schillen in een lage baan om de aarde (LEO) voor positiebepaling, navigatie en tijdsynchronisatie (PNT), met J2, boven een masker van { "20" } graden. Beschikbaarheid (PDOP { "3" } of minder) { "99.22" } % wereldwijd en { "0" } % op de slechtste locatie, mediaan-PDOP { "1.11" }, gemiddeld { "39.4" } satellieten in zicht.

seg-7d860ca30360 = <c1/>: { "8" } satellieten in elliptische maanbanen met bevroren excentriciteit en een cirkelvormige schil van 6 satellieten rond de maan. Beschikbaarheid (PDOP { "6" } of minder) { "21.33" } % wereldwijd en { "0" } % op de slechtste locatie, mediaan-PDOP { "5.22" }, gemiddeld { "3.2" } satellieten in zicht.

seg-0c331bea1f52 = LEO-PNT-dekking voor gebruikers op de poolgebieden en in het noordpoolgebied, tegenover GNSS in een middelhoge aardbaan, is de poolmodus van de soort <c1/> (<c2/>; zie <a1>LEO-PNT.md</a1>).

seg-9aab3bf49146 = <s1>Vorige</s1>Gefuseerde MEO- en LEO-positiebepaling

seg-9f717b9015e1 = <s1>Volgende</s1>Modellen van kwantumsensoren
